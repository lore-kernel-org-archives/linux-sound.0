From: "Adam J. Richter" <adam@yggdrasil.com>
Date: Fri, 22 Dec 2006 03:09:03 +0000
Subject: snd_via82xx stutters under 2.6.20-rc1, works under 2.6.19.1
Message-Id: <200612220309.kBM393Do009487@freya.yggdrasil.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

	I have a computer using the snd_via82xx sound driver module.
Under 2.6.19.1, sound seems to work fine.  Under 2.6.20-rc1, there
are regular stutters in the sound every quarter second or so, at least
when I play a .wav file played xine, using either "--audio-driver alsa"
or "--audio-driver oss" (I have the snd_pcm_oss module loaded to do
OSS via alsa).

	I will post follow-ups if I am able to narrow, diagnose or
resolve this problem.  If anyone is already aware of this problem, I
would be interested in hearing about it.

Adam Richter
