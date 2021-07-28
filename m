From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 28 Jul 2021 15:31:40 +0000
Subject: PCM prepare callback
Message-Id: <CAHhAz+hotPKARumDGZex1MByC01KCsUvYPTUwpsHK+ozSnHXpA@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi all,

Is there any document which explains the sequence of snd_pcm_ops
callbacks called during playback and capture?

What driver is supposed to return from the PCM prepare callback if the
sound card is not ready for playback\capture?

-- 
Thanks,
Sekhar
