From: o@goosey.org
Date: Sat, 23 Jun 2018 11:11:33 +0000
Subject: Re: audio samples data flow from user mode to kernel mode
Message-Id: <2927881529752293@web10g.yandex.ru>
List-Id: <linux-sound.vger.kernel.org>
References: <CAPY=qRRw0oyJTs0qKHbWdn2wj_iHUzqmBQFPRip08yLU1pdXQw@mail.gmail.com>
In-Reply-To: <CAPY=qRRw0oyJTs0qKHbWdn2wj_iHUzqmBQFPRip08yLU1pdXQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>



23.06.2018, 14:52, "Subhashini Rao Beerisetty" <subhashbeerisetty@gmail.com>:
> Hello All,

Hello,


> I’m trying to understand how audio samples transferred between user mode to kernel mode during playback and capture. I’m using aplay & arecord alsa utilities for playback and capture.
>
> Let us take a PCM wav file of sample rate 48000 and it has a total number of samples 480000 (Approx.Duration in seconds). Size of each sample is 8 bytes(two channels). After invocation of aplay from user mode, how does these audio samples gets copied to kernel mode? Can someone explain me on this?
>
> Is it possible to capture the timestamps for the first and last audio samples that arrive at the driver level?
>
> Can I consider the .trigger(for playback & capture) callback in SNDRV_PCM_TRIGGER_START  case is timestamp for the first audio sample?
>
> Similarly does .trigger callbacks SNDRV_PCM_TRIGGER_STOP gives the last audio sample timestamp?

I think no, because the SNDRV_PCM_TRIGGER_START and SNDRV_PCM_TRIGGER_STOP functions only system call to the PCM transmitted.
So, will want two different functions as playback / capture and the method depends on you use alsa or pulse.

I think you want to:

snd_mychip_playback_open
snd_mychip_playback_close

snd_mychip_capture_open
snd_mychip_capture_close

Trigger funcs times are not real playback or capture time-stamps.

Regards

Ozgur

> Thanks,
