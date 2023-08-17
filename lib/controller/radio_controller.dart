import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class RadioController extends GetxController{
  var playing=false.obs;
  var selectedRadioLink='https://s3.voscast.com:9893/live'.obs;
  var selectedChannel=0.obs;
  final AudioPlayer _audioPlayer = AudioPlayer();

  String getSelectedChImg() {
    String img='';
    if(selectedChannel.value==0)
      {
        img='images/Relaks Radio.png';
      }
    else if(selectedChannel.value==1)
    {
      img='images/Relaks Radio Bangla.png';
    }
    else if(selectedChannel.value==2)
    {
      img='images/Relaks Radio Lanka.png';
    }
    else if(selectedChannel.value==3)
    {
      img='images/Relaks Radio EU.png';
    }
    else if(selectedChannel.value==4)
    {
      img='images/Relaks Radio Tamil.png';
    }
    else if(selectedChannel.value==5)
    {
      img='images/Relaks Radio India.png';
    }
    else if(selectedChannel.value==6)
    {
      img='images/Relaks Radio Pakistan.png';
    }
    else if(selectedChannel.value==7)
    {
      img='images/Relaks Tv.png';
    }
    else if(selectedChannel.value==8)
    {
      img='images/Relaks Radio Music.png';
    }
    else if(selectedChannel.value==9)
    {
      img='images/Relaks News 24.png';
    }
    else if(selectedChannel.value==10)
    {
      img='images/Relaks Star.png';
    }
    else{
      img='images/Relaks Star.png';
    }
    return img;
  }

  String getSelectedChName() {
    String name='';
    if(selectedChannel.value==0)
    {
      name='Relaks Radio';
    }
    else if(selectedChannel.value==1)
    {
      name='Relaks Radio Bangla';
    }
    else if(selectedChannel.value==2)
    {
      name='Relaks Radio Lanka';
    }
    else if(selectedChannel.value==3)
    {
      name='Relaks Radio Europe';
    }
    else if(selectedChannel.value==4)
    {
      name='Relaks Radio Tamil';
    }
    else if(selectedChannel.value==5)
    {
      name='Relaks Radio India';
    }
    else if(selectedChannel.value==6)
    {
      name='Relaks Radio Pakistan';
    }
    else if(selectedChannel.value==7)
    {
      name='Relaks Tv';
    }
    else if(selectedChannel.value==8)
    {
      name='Relaks Radio Music';
    }
    else if(selectedChannel.value==9)
    {
      name='Relaks News 24';
    }
    else if(selectedChannel.value==10)
    {
      name='Relaks Star';
    }
    else{
      name='Relaks Star';
    }
    return name;
  }

  Future<void> playRadio() async{
    playing.value=playing.value?false:true;
    await _audioPlayer.setUrl('$selectedRadioLink');
    if(playing.value==false)
      {
        print("play123:"+playing.value.toString());
        await _audioPlayer.stop();
        //playing.value=false;
        print("play123:"+playing.value.toString());
      }
     if(playing.value==true){
      print("play123:"+playing.value.toString());
      await _audioPlayer.play();
     // playing.value=true;
      print("play123:"+playing.value.toString());
    }
  }
}