From: Muni Sekhar <munisekharrms@gmail.com>
Date: Thu, 10 Jun 2021 12:37:26 +0000
Subject: SNDRV_PCM_IOCTL_READI_FRAMES returns EIO
Message-Id: <CAHhAz+hjt57HjF=ap8+Y7X=Q8Dcsz9NYAJWj1Z8Sq_JEWuoGcw@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi all,

 I noticed recording(arecord) audio data on a USB sound card fails at
SNDRV_PCM_IOCTL_READI_FRAMES is giving EIO.

Can someone please clarify when the kernel returns EIO for Ioctl
SNDRV_PCM_IOCTL_READI_FRAMES?


-- 
Thanks,
Sekhar
