From: Hrafnkell Eiriksson <hkelle@rhi.hi.is>
Date: Thu, 13 May 1999 03:25:51 +0000
Subject: Re: Playing a sine wave
Message-Id: <marc-linux-sound-92659607005393@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92649832906805@msgid-missing>
In-Reply-To: <marc-linux-sound-92649832906805@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On 12. May 1999, Hannu Savolainen wrote:
> A much easier way is using /dev/dsp. You only need to construct few cycles
> of sine wave at given frequency to a buffer. Then just keep writing this
> buffer to /dev/dsp as many times as you need. In fact it may even be
> possible that somebody has already written this kind of app (look at
> ftp://sunsite.unc.edu/pub/Linux/apps/sound).

What about creating a patch with the sine wave and use the
wavetable stuff to play it. Thay way the wavetable could
change the playback frequency etc.
(Please note that I hardly know what a wavetable is nor what
it can do :) 

-- 
//-----------------------//-------------------------------------------------
//  Hrafnkell Eiriksson  //  Student of Computer- and Electrical engineering
//  hkelle@rhi.hi.is     //  at the Univeristy of Iceland
//                       //  "Blessed are they who go around in circles,
//  Finger for PGP key   //   for they shall be known as Wheels"
