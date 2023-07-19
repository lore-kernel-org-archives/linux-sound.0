From: Carl Klemm <carl@uvos.xyz>
Date: Wed, 19 Jul 2023 07:10:12 +0000
Subject: [BUG REPORT] sound: pci: ctxfi: htimestamp dose not work on EMU20k during recording
Message-Id: <dde0a305793ad7ddbd9e001e463207a84c2afcc9.camel@uvos.xyz>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org, alsa-devel@vger.kernel.org, linux-sound@vger.kernel.org

Hi,

see https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3352
htimestamp returns nonesensical values when recording is active on a
EMU20k device


lspci:
03:00.0 Audio device: Creative Labs EMU20k2 [Sound Blaster X-Fi
Titanium Series] (rev 03)
        Subsystem: Creative Labs EMU20k2 [Sound Blaster X-Fi Titanium
Series]
        Flags: bus master, fast devsel, latency 0, IRQ 17
        Memory at d1200000 (64-bit, non-prefetchable) [sizedK]
        Memory at d1000000 (64-bit, non-prefetchable) [size=2M]
        Memory at d0000000 (64-bit, non-prefetchable) [sizeM]
        Capabilities: <access denied>
        Kernel driver in use: snd_ctxfi
        Kernel modules: snd_ctxfi

With regards,
Carl Klemm
