From: =?iso-8859-1?Q?J=E9r=F4me=20Aug=E9?= <jauge@club-internet.fr>
Date: Sun, 16 Jul 2000 16:37:46 +0000
Subject: "noise" while recording with an OPL3SAx
Message-Id: <marc-linux-sound-96376558726822@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I have a Toshiba Satellite 2540CDT with an OPL3SAx soundcard and I
noticed that there is noise in the sample when I record even when there
is nothing connected to the inputs (mic/line/..).
I tried Alsa and I noticed that with Alsa there is no more noise but If
I boot again with OSS the noise is back when recording. I also noticed
that the noise disappear when using OSS after unloading Alsa modules.
So I've made a patch for OSS (by looking at Alsa driver source) that fix
this noise but before posting the patch I'd like to know if someone else
noticed this noise with OSS or if it occurs only with me ?

Thanks

P.S. I'm using RH6.2 kernel 2.2.14-5.0 and 2.4.0-test4
