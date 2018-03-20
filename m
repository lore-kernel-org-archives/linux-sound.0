From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 20 Mar 2018 13:24:04 +0000
Subject: pulseaudio\aplay\arecord
Message-Id: <CAHhAz+j+pZtaYrHGqJXxqS4DgEzNCsAgORvd4+1Kj55D2Oh03g@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-sound@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>

[ Please keep me in CC as I'm not subscribed to the list]

Hi All,



We are using the Ubuntu 16.04.3 LTS (4.4.0-28-generic) kernel. I’ve a
sound card hardware which supports analog loopback. During analog
loopback test, aplay fails with
“aplay: pcm_write:1940: write error: Input/output error”.

In our system, I noticed that once the sound driver is loaded,
PulseAudio daemon autospawns and taking over control of the sound
device. Does the ‘pulseaudio’ causes ‘aplay’ failure?

Can we use aplay\arecord if already pulseaudio daemon is running?



-- 
Thanks,
Sekhar
