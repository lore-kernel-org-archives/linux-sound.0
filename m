From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 18 May 2018 12:49:29 +0000
Subject: sound: latency and synchronization measurements
Message-Id: <CAHhAz+hFFYqz2gtVnEZVyMjAO3fe4f5EtZeFO4tvO-2W-6sv7g@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

[ Please keep me in CC as I'm not subscribed to the list]

Hi All,

I am trying to characterize the audio synchronization between two
systems. There is a mechanism to route audio between two systems, we
run ‘aplay’ at one system and ‘arecord’ in other system.

We need to measure the time difference when audio sample is out at one
port and arriving at another port in different system.

I plan to add printk’s in “struct snd_pcm_ops” call backs, but does
these call backs tells when it received first and last audio
frames\samples?

Or else please suggest any other best method.


-- 
Thanks,
Sekhar
