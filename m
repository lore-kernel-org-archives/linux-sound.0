From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 23 May 2018 13:12:51 +0000
Subject: sound: ALSA PCM Timestamps
Message-Id: <CAHhAz+g0tZ57xzS=FE71haZkrM4iXRS_HLe2pL0xic2y9t4CwA@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-sound@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>

[ Please keep me in CC as I'm not subscribed to the list]

Hi All,

There are several time stamping functions in ALSA:


snd_pcm_status_get_trigger_tstamp

snd_pcm_status_get_trigger_htstamp

snd_pcm_status_get_tstamp

snd_pcm_status_get_htstamp

snd_pcm_status_get_audio_htstamp

snd_pcm_status_get_driver_htstamp



I would like to understand what points in time the resulting functions
represent and what is the corresponding kernel mode callback for those
API=E2=80=99s.


I'd be really grateful if someone took the time to help me clearing my doub=
t.



--=20
Thanks,
Sekhar
