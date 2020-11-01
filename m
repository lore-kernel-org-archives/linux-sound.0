From: Muni Sekhar <munisekharrms@gmail.com>
Date: Sun, 01 Nov 2020 15:31:29 +0000
Subject: sound: PCM/I2S Digital Mic & SPDIF
Message-Id: <CAHhAz+jd3h6YdBvv5+4zEr0546qRUuCgHfKJtoF=EQ=+4tQoGg@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernelnewbies <kernelnewbies@kernelnewbies.org>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org

Hello all,

I’m having a Linux X86 machine and interfacing with Xilinx FPGA
endpoint over PCIe. FPGA endpoint supports various audio engines like
PCM/I2S ,Digital Mic & SPDIF.

I’m looking for any existing linux device driver to port it for my hardware.

Does the Linux kernel tree have any reference examples for these audio
engines which I can use for porting it to my hardware? If so can
someone please share your inputs on this.

-- 
Thanks,
Sekhar
