From: Kai Vehmanen <kaiv@wakkanet.fi>
Date: Wed, 01 Sep 1999 12:00:33 +0000
Subject: Re: [linux-audio-dev] Re: loopback in action!
Message-Id: <marc-linux-sound-93618901309007@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

On Tue, 31 Aug 1999, Bill wrote:

> 	I recently had a customer who has a hearing disability and uses
> voice emulation and we were in need of driver that would eliminate
> the POP that he was experiencing during .wav, .au, and .voc files,
> not .midi though.
[...]
> 	He has an on-board Crystal Sound chip set. I can't recall the exact
> chip but it was mentioned on the ALSA page, in the howto's. We ended
> up using OSS. Any input on this would be appreciated for you seem to
> be doing some good work from what I read. Thanks.

If problems appeared when starting to play audio and not during 
actual playback, if might be caused by ALSA buffering 
parameters. Raising the minimum fragments value for ALSA playback
should help in this case.

-- 
Kai Vehmanen ----------------------------- CS, University of Turku, Finland
 : email                                 mailto:kaiv@wakkanet.fi
 : audio processing for linux            http://www.wakkanet.fi/ecasound/
 : my music (ambient-idm-rock-...mp3/ra) http://www.wakkanet.fi/sculpscape/
