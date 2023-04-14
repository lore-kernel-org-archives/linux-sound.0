From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 14 Apr 2023 16:56:20 +0000
Subject: ALSA: struct snd_pcm_hardware.formats
Message-Id: <CAHhAz+gCGi3i9c4KLt9V+RhQypn7RXrfMnH9LJCTty3K_QTGFQ@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi all,

struct snd_pcm_hardware.formats (SNDRV_PCM_FMTBIT_S8,
SNDRV_PCM_FMTBIT_S16_LE, SNDRV_PCM_FMTBIT_U16_LE,
SNDRV_PCM_FMTBIT_S16_BE, etc.), are these sound card hardware
capabilities or something that needs to be taken care of on the
software (driver or userspace) side?

-- 
Thanks,
Sekhar
