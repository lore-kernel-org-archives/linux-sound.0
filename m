From: Eric Curtin <ericcurtin17@gmail.com>
Date: Fri, 19 Apr 2019 13:18:07 +0000
Subject: Re: Microphone volume low on linux driver
Message-Id: <CANpvso6ZB-nQm2ABWdbtoSuMU-pMnr_y-JradtS0UHPkOGMnGQ@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CANpvso7JHdKUSyt0c5L_hXR6us39Or112t0NPvhJ6w5m07JYkA@mail.gmail.com>
In-Reply-To: <CANpvso7JHdKUSyt0c5L_hXR6us39Or112t0NPvhJ6w5m07JYkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: USB list <linux-usb@vger.kernel.org>, linux-sound@vger.kernel.org

*the Windows driver

On Fri, 19 Apr 2019 at 14:17, Eric Curtin <ericcurtin17@gmail.com> wrote:
>
> Hi Guys,
>
> I have a headset, Linux recognizes it as "HyperX Virtual Surround Sound
> Digital Stereo", I have it set to 150% recording volume. It's a "HyperX
> Cloud II" headset, the Windows seems to work fine. I also tried
> "Digital Stereo (IEC958) Input" mode.
>
> Is there a quirk or similar in the kernel I can set in order to
> increase the recording volume of this device specifically?
>
> Some details about my system (it's xubuntu):
>
> username@hp-zbook-15-g5 14:13:12
> ~/>dpkg -l | grep -i pulseaud
> ii  gstreamer1.0-pulseaudio:amd64
> 1.14.1-1ubuntu1~ubuntu18.04.1
>      amd64        GStreamer plugin for PulseAudio
> ii  libcanberra-pulse:amd64                       0.30-5ubuntu1
>                                                        amd64
> PulseAudio backend for libcanberra
> ii  libpulse-mainloop-glib0:amd64                 1:11.1-1ubuntu7.2
>                                                        amd64
> PulseAudio client libraries (glib support)
> ii  libpulse0:amd64                               1:11.1-1ubuntu7.2
>                                                        amd64
> PulseAudio client libraries
> rc  libpulse0:i386                                1:11.1-1ubuntu7.2
>                                                        i386
> PulseAudio client libraries
> ii  libpulsedsp:amd64                             1:11.1-1ubuntu7.2
>                                                        amd64
> PulseAudio OSS pre-load library
> ii  pavucontrol                                   3.0-4
>                                                        amd64
> PulseAudio Volume Control
> ii  pulseaudio                                    1:11.1-1ubuntu7.2
>                                                        amd64
> PulseAudio sound server
> ii  pulseaudio-module-bluetooth                   1:11.1-1ubuntu7.2
>                                                        amd64
> Bluetooth module for PulseAudio sound server
> ii  pulseaudio-utils                              1:11.1-1ubuntu7.2
>                                                        amd64
> Command line tools for the PulseAudio sound server
> ii  xfce4-pulseaudio-plugin:amd64                 0.4.1-0ubuntu1
>                                                        amd64
> Xfce4 panel plugin to control pulseaudio
> username@hp-zbook-15-g5 14:13:15
> ~/git/Domino>lsb_release -a
> No LSB modules are available.
> Distributor ID: Ubuntu
> Description: Ubuntu 18.04.2 LTS
> Release: 18.04
> Codename: bionic
> username@hp-zbook-15-g5 14:13:20
> ~/git/Domino>uname -a
> Linux hp-zbook-15-g5 4.18.0-17-generic #18~18.04.1-Ubuntu SMP Fri Mar
> 15 15:27:12 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
>
> Regards,
>
> Eric
