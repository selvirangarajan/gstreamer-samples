#include <gst/gst.h>

int main(int argc, char* argv[]){
    gst_init(&argc, &argv);

    GstElement *pipeline = gst_parse_launch("nvarguscamerasrc ! autovideosink", nullptr);
    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    g_print("Running ... \n");
    g_usleep(50*G_USEC_PER_SEC);


    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);

    return 0;

}
