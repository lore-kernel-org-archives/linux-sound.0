From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 23 May 2018 13:54:15 +0000
Subject: Re: [alsa-devel] sound: ALSA PCM Timestamps
Message-Id: <e4baa571-35db-666c-0217-5d5a90b2249f@linux.intel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAHhAz+g0tZ57xzS=FE71haZkrM4iXRS_HLe2pL0xic2y9t4CwA@mail.gmail.com>
In-Reply-To: <CAHhAz+g0tZ57xzS=FE71haZkrM4iXRS_HLe2pL0xic2y9t4CwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Muni Sekhar <munisekharrms@gmail.com>, kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-sound@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>

On 5/23/18 8:00 AM, Muni Sekhar wrote:
> [ Please keep me in CC as I'm not subscribed to the list]
>=20
> Hi All,
>=20
> There are several time stamping functions in ALSA:
>=20
>=20
> snd_pcm_status_get_trigger_tstamp
>=20
> snd_pcm_status_get_trigger_htstamp
>=20
> snd_pcm_status_get_tstamp
>=20
> snd_pcm_status_get_htstamp
>=20
> snd_pcm_status_get_audio_htstamp
>=20
> snd_pcm_status_get_driver_htstamp

the *_tstamp functions work with a 'struct timeval' which provides=20
microsecond resolution.
The *_stamp functions work with a 'struct timespec' which provides=20
nanosecond resolution.

The trigger_*tstamp returns the time when the stream started (typically=20
when the DMA starts).
The get_tstamp returns the current timestamp measured with the regular=20
timekeeping functions, which by subtracting the trigger timestamp=20
provides the elapsed time since the start. You can specify if you want=20
the REALTIME/MONOTONIC/MONOTONIC_RAW timestamp type, depending on your=20
application.
The audio timestamp returns the current timestamp but measured using=20
audio-specific counters. If the audio clocks are not aligned with the=20
system time (e.g. if they use different oscillators or the audio clock=20
source is external), there will be a drift between audio timestamps and=20
system timestamp.


>=20
>=20
>=20
> I would like to understand what points in time the resulting functions
> represent and what is the corresponding kernel mode callback for those
> API=E2=80=99s.
>=20
>=20
> I'd be really grateful if someone took the time to help me clearing my do=
ubt.
>=20
>=20
>=20

