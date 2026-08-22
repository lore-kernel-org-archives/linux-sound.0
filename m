Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AFC24DCF6
	for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 04:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787373052; cv=none; b=rCbveLDUCAlTRuAZEtV/wmdbSJDhsHzSRIS2e+h9xV22DzHzV2t7CMvn3r9Dq4ffEpB6WvqnAPYtRtoth2DWKwWoxUJcLFvqk+DIjjPYrQKljxC8+5+NmeSqA8tR1ay3s1cjAmPWtmczop8v+Yc5XDubYSMUmUhzn4vr58obn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787373052; c=relaxed/simple;
	bh=QRUiRNts3KSvKKC9mJn4TLJYDAGJ9dQ9ny6Rm3QMlzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Twek3H3MQtejlFpjA6+TTR27XrZ3Qh6uZAIEWSRVrWthGpZmUbLIms835YZMuIT7B+3WMueDiOenP4JVO9H2ZawvzugA0cn46NM1/tjzJ+cXA5gPqthmJVegilsN/peevKWS3hiMRFeEZs4sJUAC0S5qcf6IAR/66tAnZtqh1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=FjEVr1uo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="FjEVr1uo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf452def93so20594765ad.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 21:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787373047; x=1787977847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UlMhaIRIoQrAQyQSsHsVy93c/ntv7OUmK0SICPMMPQE=;
        b=FjEVr1uo6Hcs7K54Q0qVn1379EjFZDRN5QfZiY9fIuiB9MA8+rK7PVdmTAdMDjJZ7N
         lXxWXpSRKpy0sU2vy1QtOITOH2FSOZ41jOVY9rDdt41e31bOsBQR0cC3/w38SuSezeFC
         AdEe7FWikn4rD51xvTf79kaDTN/6U6UF/ZFStSISDYv578/2fkxcAPwAtqnBd2x9F89x
         vs5Vw55//vkaZjpBmKUmL/1Gyc1Eve9rk0Ntty+uM8Nbj7a6Iw81Sp5lqRoQWgxmwNUW
         yWqi9zwOoKr3A/vuD293C2/21YU9Wk3dFQQ8qJClcKKtQg/hbaBgX0+2kDjJEbc72t8d
         shAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787373047; x=1787977847;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UlMhaIRIoQrAQyQSsHsVy93c/ntv7OUmK0SICPMMPQE=;
        b=BBUYkUF9tCY/ChcdGB7H2qFn/2WT8anAtjJzx2FsCtiKmiVOYVGTHC3YCIZl7kW3jl
         tD2H2cx5KjWAdyaNrNwpmmSQEjRtCKSwGH4vmnvIlcWFO4u8SGnRq7n7PRNYnTdpX5bq
         f/VJFNrUMAcgoRrrlXPLHDv2TYd3rhbRfUQbdwdh811VKFadYF/pNpwz/34YJitRw+Ay
         k2M08puhFNZZXnk7WGODCXhXDq6iw32rmcTfaVuwBhwrmU8DAiP65JhjE4Z1a4ChXqc1
         GoQ964kxuktyBY0VyD/FaX3Xn6Jp/o16IJ8nVIWu2rFK0oxjFKlGjD/jYxpihKUkga97
         fIog==
X-Gm-Message-State: AFuF++mRJdb9O5Q3tBLSaCatLaR1JXp2uHEvx5OTm7sBiv/0eMPPWW5e
	5Z6qB+Q7zSNcE63inhRYFx8T+ukpjSVuhSW214QTkanMzp1gUJlvkeCrCOL2kkbd6WwisFgllw3
	1cmdpjfD8pg==
X-Gm-Gg: AR+sD117ucDAZg1kWB5P/qYHc5Yu2mbYN05fBvU17Ezer+u91I7njKrbM8HD3iDufvz
	2orMqwWcCHyTMJ2vAAP/i8jHIhsC/7KR6nyiu1D990v212cUGe1UwhbaGSS1F7povtF7k6uG0TU
	VYxMXcSZr9bzSWOnqblCTxuuZ3FYaZQRdriQM66or3IDb48Yc9oBkmoFWwt9MmME314MHifqvVN
	8kkNR4htuwosRvpsVa6URpVgduN2a16jj/QoHMrAaQajehvjn8qm+S3ET4r+gJ1VdEcDf/p8L0N
	/TmtfSwgv3RyRcwDd0Rvif6j0v8sYaYIwqcA0L8fJ2z1/a8Ciz5/gc17WziQk23dn8IyCfnR6g4
	AqdYwiZercUV7aL7oyd1TE+UtimRCL+2jqAffmyvtYudPtrxSaGQJxAlsCpA44rH9eq+c9vIidT
	Na3zKVrn7v3uLtqQq5VUmnXnFiSmrTp+bHaDj6P2vFCiXqfJcHc2P76fHYxo/9y3bP82O8IgXcE
	WMfMe4KlP1a9v/8T+hyvzdONQ==
X-Received: by 2002:a17:903:468f:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d61a1d22d4mr221043985ad.15.1787373047519;
        Fri, 21 Aug 2026 21:30:47 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9236166sm1997575eec.28.2026.08.21.21.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 21:30:47 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
Subject: [PATCH 0/2] Quirks for the M-Audio Venom synth
Date: Sat, 22 Aug 2026 01:30:31 -0300
Message-ID: <20260822043033.529424-1-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, this is my first ever patch to Linux, hope this helps.

Since it's release, the M-Audio Venom never worked through USB
in Linux, drivers for Windows and Mac OS have been available
for ever, but due to it's short maintenance time, it never got
a Linux driver or any support for Linux users.

Some users across the years have posted about its MIDI usage
but all have pointed out that the USB port was useless for Linux.

So I found a fix for it, but the process went as follows:

The device upon connection without any fix showed the following
through dmesg:

[23824.463792] usb 2-3: New USB device found, idVendor=0763, 
	idProduct=2084, bcdDevice=11.44
[23824.463796] usb 2-3: New USB device strings: Mfr=2, 
	Product=3, SerialNumber=0
[23824.463797] usb 2-3: Product: Venom
[23824.463798] usb 2-3: Manufacturer: M-Audio
[23829.670004] usb 2-3: 1:1: cannot get freq at ep 0x2
[23850.150093] usb 2-3: 2:1: cannot set freq 44100 to ep 0x84
[23855.270162] usb 2-3: Quirk or no altset; falling back to 
	MIDI 1.0
[23901.350369] usb 2-3: 6:0: failed to get current value for 
	ch 0 (-110)
[23911.590383] usb 2-3: 6:0: cannot get min/max values for 
	control 2 (id 6)
[23911.590401] usb 2-3: Warning! Unlikely small volume range (=1), 
		linear volume or custom curve?
[23911.590407] usb 2-3: [6] FU [PCM Playback Volume] ch = 2, 
	val = 0/1/1
[23916.710413] usb 2-3: 5:0: failed to get current value for 
	ch 0 (-110)
[23947.430547] usb 2-3: 6:0: cannot get min/max values for 
	control 2 (id 6) 
	// This happened around 15 times until the next loop.
[24019.111127] usb 2-3: 2:1: usb_set_interface failed (-110) 
	// This started happenning every 5 seconds non stop until 
	// the connection was cut.

As the "get freq" and "set freq" pointed to a problem with the sample
rate, I applied a quirk fix with the following:

options snd-usb-audio quirk_flags=0763:2084:get_sample_rate|
	disable_autosuspend;

And that seemed to work for the sample problems and the
usb_set_interface:

[33121.858400] usb 2-3: new full-speed USB device number 15 
	using xhci_hcd
[33121.983604] usb 2-3: New USB device found, idVendor=0763, 
	idProduct=2084, bcdDevice=11.44
[33121.983608] usb 2-3: New USB device strings: Mfr=2, Product=3, 
	SerialNumber=0
[33121.983610] usb 2-3: Product: Venom
[33121.983611] usb 2-3: Manufacturer: M-Audio
[33121.987805] usb 2-3: Quirk or no altset; falling back to MIDI 1.0

But the device still didn't work in any test. It did show, though, in
various ALSA commands: 

aplay -l; arecord -l; amidi -l; aconnect -l
**** List of PLAYBACK Hardware Devices ****
card 2: Venom [Venom], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
**** List of CAPTURE Hardware Devices ****
card 2: Venom [Venom], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
Dir Device    Name
IO  hw:2,0,0  Venom Synth In
IO  hw:2,0,1  Venom MIDI In
client 24: 'Venom' [type=kernel,card=2]
    0 'Venom Synth Out '
    1 'Venom MIDI Out  '

So I decided to check if Windows was using any weird or propietary
functions in the handshake but it did not (I checked through USBPcap),
so then I made a quick script using pyusb to try and recreate it with no
driver in between, previously disabling the auto-probing, and it worked!

Sending the commands:

dev = usb.core.find(idVendor=0x0763, idProduct=0x2084)

dev.ctrl_transfer(0x80, 0x00, 0, 0, 2, timeout=3000)
dev.ctrl_transfer(0xA1, 0x81, 0x0100, 0x0500, 1, timeout=3000)
dev.ctrl_transfer(0x01, 0x0b, 1, 1, None, timeout=3000)
dev.write(0x0d, b'\x0c\xc0\x05\x00', timeout=3000)
dev.write(0x0d, b'\x09\x90\x3c\x64', timeout=3000)
dev.read(0x8e, 64, timeout=3000)

Not only could I hear the device, which up to this point it didn't emit
any sound when connected to Linux, I was also able to control it through
messages, changing presets and configs.

So the only remaining thing seemed to be the initializer, I programmed a
quick composite quirk to disable the mixer (or at least ignore it) so
that the device configured itself, and it worked outright, so I'm
sending this patch to make it work for anyone's computer.

Thanks for the attention.

Federico Valentín Andrade (2):
  ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
  ALSA: usb-audio: Skip mixer creation on M-Audio Venom

 sound/usb/quirks-table.h | 22 ++++++++++++++++++++++
 sound/usb/quirks.c       |  2 ++
 2 files changed, 24 insertions(+)

-- 
2.55.0

