From: Venkat S <venks@surffast.com>
Date: Mon, 21 Oct 2002 12:32:03 +0000
Subject: /dev/dsp : no such device
Message-Id: <marc-linux-sound-103520382100528@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103520484301557@msgid-missing>
In-Reply-To: <marc-linux-sound-103520484301557@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi

I have a creative es1371 sound card on my linux box running RH7.1, kernel 2.4.8. I compiled the kernel for the es1371 driver, and the sound card has been configured fine(or that's what i think!).

I am trying to run a program which plays a tone based on some external trigger.
I am playing the tone on /dev/dsp1. This works fine.
Everytime i receive a trigger to play the tone, i start
a pthread. This thread first opens /dev/dsp1, reads from a wav file which has the tone pattern, and writes this buffer to
the /dev/dsp1. The reading from the wav and writing to the /dev 
goes on until another trigger is received on the main thread, at
which point i do a pthread_cancel on the tone thread, and close the fd in the main thread.

Now, the problem is that, sometimes, when i send a trigger to the main thread to start the ring tone, i start the pthread for playing ringtone, and when i try opening /dev/dsp1, it gives me
a perror with "No such Device". After some observation, I found that there seemed to some pattern. If I were to leave this program running for some time without any tone being played, and THEN provided an external trigger to start the tone, the open on the device always fails. On the other hand, if I were to continually toggle between playing and stopping the tone, it seems to work fine, without any issues.
What am I doing wrong? and would any of you have any idea about the root cause.

of course, i could have opened the device as the main task comes up itself, and used the fd within the thread, instead of having to open the device each time i create the thread. I am in the process of trying this yet.

I have provided a very brief portion of code(and pseudocode):

main()
{
  taskinit();
  while (1){
    trigger = wait_for_external_trigger();
  
    if ( trigger = PLAYTONE ){
       pthread_create(ringhandle, attr, PlayTone, NULL);
       /* Of course, check if this returns valid */
    }
    else if ( trigger = STOPTONE ){
       pthread_cancel(ringhandle);
       close(fd);
       /* Of course, I try capturing all errors */
    }
  }
}


void* PlayRingTone()
{
   /* fd is a global variable */
   fd = open("/dev/dsp1", O_WRONLY);
   /* check for error */

   /* Continually
       read from wav file
       write into fd
   */
}


Thanks in advance for trying to help.

BR,
Venkat

_____________________________________________________________
Surf the Web with SURF FAST.com ---> http://www.surffast.com

_____________________________________________________________
Select your own custom email address for FREE! Get you@yourchoice.com w/No Ads, 6MB, POP & more! http://www.everyone.net/selectmail?campaign=tag
