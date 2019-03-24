package com.iho.iho_ar.ar_module;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.Toast;

import com.google.ar.core.Anchor;
import com.google.ar.core.HitResult;
import com.google.ar.core.Plane;
import com.google.ar.sceneform.AnchorNode;
import com.google.ar.sceneform.HitTestResult;
import com.google.ar.sceneform.Node;
import com.google.ar.sceneform.math.Vector3;
import com.google.ar.sceneform.rendering.ModelRenderable;
import com.google.ar.sceneform.ux.ArFragment;
import com.iho.iho_ar.R;
import com.iho.iho_ar.Util;
import com.iho.iho_ar.models.BoneModel;
import com.iho.iho_ar.models.BoneModelList;

import java.util.List;

public class ArActivity extends AppCompatActivity implements ArView {
    private static final String TAG = ArActivity.class.getSimpleName();
    private static final double MIN_OPENGL_VERSION = 3.0;
    private ArFragment arFragment;
    private ArPresenter presenter;
    AnchorNode anchorNode;

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if(!checkIsSupportedDeviceOrFinish(this)){
            return;
        }

        setContentView(R.layout.activity_main);

        presenter = new ArPresenterImpl(this);

        presenter.createRenderables();

        arFragment = (ArFragment) getSupportFragmentManager().findFragmentById(R.id.ar_fragment);

        arFragment.setOnTapArPlaneListener(
                (HitResult hitResult, Plane plane, MotionEvent motionEvent) -> {
                    if (!presenter.renderablesReady()) {
                        Toast.makeText(this,"Waiting for renderables to be available", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    // Create the Anchor.
                    Anchor anchor = hitResult.createAnchor();
                    anchorNode = new AnchorNode(anchor);
                    anchorNode.setParent(arFragment.getArSceneView().getScene());

                    presenter.createNodes();
                });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        presenter.onDestroy();
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void createRenderables(List<BoneModel> boneModelList) {
        List<BoneModel> models = boneModelList;
        for(int i =0; i<models.size(); i++) {
            BoneModel model = models.get(i);
            ModelRenderable.builder()
                    .setSource(this, model.getResId())
                    .build()
                    .thenAccept(renderable -> model.setRenderable(renderable))
                    .exceptionally(
                            throwable -> {
                                Toast.makeText(this, "Unable to load renderable", Toast.LENGTH_LONG).show();
                                return null;
                            });
        }
    }

    @Override
    public void createNodes(List<BoneModel> boneModelList) {
        for(BoneModel model: boneModelList){
            createNode(model);
        }
    }

    private void createNode(BoneModel boneModel){

        Node bone= new Node();
        bone.setParent(anchorNode);
        bone.setLocalPosition(boneModel.getPosition());

        bone.setRenderable(boneModel.getRenderable());

        if(boneModel.isClickable()) {
            bone.setOnTapListener(new Node.OnTapListener() {
                @Override
                public void onTap(HitTestResult hitTestResult, MotionEvent motionEvent) {
                    presenter.createPopup(boneModel.getName(), boneModel.getDescription());
                }
            });
        }
    }

    public static boolean checkIsSupportedDeviceOrFinish(final Activity activity) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) {
            Log.e(TAG, "Sceneform requires Android N or later");
            Toast.makeText(activity, "Sceneform requires Android N or later", Toast.LENGTH_LONG).show();
            activity.finish();
            return false;
        }
        String openGlVersionString =
                ((ActivityManager) activity.getSystemService(Context.ACTIVITY_SERVICE))
                        .getDeviceConfigurationInfo()
                        .getGlEsVersion();
        if (Double.parseDouble(openGlVersionString) < MIN_OPENGL_VERSION) {
            Log.e(TAG, "Sceneform requires OpenGL ES 3.0 later");
            Toast.makeText(activity, "Sceneform requires OpenGL ES 3.0 or later", Toast.LENGTH_LONG)
                    .show();
            activity.finish();
            return false;
        }
        return true;
    }

    @Override
    public void showPopup(String name, String description) {
        Util.createPopup(this, name, description);
    }
}