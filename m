From: Andy Jefferson <Andrew.Jefferson@nomura.co.uk>
Date: Mon, 16 Nov 1998 12:17:43 +0000
Subject: Re: 2.1.128 : AWE64 problems
Message-Id: <marc-linux-sound-91122594000250@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91107867019319@msgid-missing>
In-Reply-To: <marc-linux-sound-91107867019319@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Bill Nottingham <notting@redhat.com> wrote:
>> and insmodding the awe_wave.o (whereas on 2.0.35, I didn't need to do this).
>> 
>> i.e there are no Installed drivers !

> Actually, that's the normal output for the sound drivers
> as modules - it looks like it's working fine.
> Does the sound device work OK?

The sound plays OK for audio CD's, and wav files etc (not tried midi's).
*BUT* it doesn't play correctly for quake2 - whitenoise. This seems to
have been the observation of someone else using 2.1.126 earlier in the
mailing list ("SB and 2.1.126 [NOT THE COMPILE PROBLEM]").

-- 
Andy Jefferson (andy@ajsoft.demon.co.uk)
