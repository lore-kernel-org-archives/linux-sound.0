From: Hrafnkell Eiriksson <he@kvintus.dk>
Date: Sat, 14 Aug 1999 11:55:43 +0000
Subject: SOUND_MIXER_OUTSRC
Message-Id: <marc-linux-sound-93463174226469@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi

I have a SoundBlaster 16 in my system. I'm using kernel 2.2.9
and the OSS/Free sounddriver.
I've written a program that needs to be able to disconnect the
line in input of the soundcard from the output mixer. The program
does real-time processing (or as close as you can get in the userspace
of a non realtime system :) of the line-in signal and the signal
on the soundcard output should only be the processed signal, not
the original signal too.
I use the following ioctl() to do this:
device = SOUND_MIXER_LINE;  
ioctl(mixer_fd, MIXER_WRITE(SOUND_MIXER_OUTSRC), &device);

This works fine. But when checking if other soundcards supported
this feature by doing grep OUTSRC *.c in /usr/src/linux/drivers/sound/
only the files sb_mixer.c and dmasound.c contained this string.
Do soundcards generally not support this or has it just not been
implemented?

-- 
//-----------------------//-------------------------------------------------
//  Hrafnkell Eiriksson  // 
//  he@kvintus.dk        // 
//                       //  "Blessed are they who go around in circles,
//                       //   for they shall be known as Wheels"        
