Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FE84AF16C
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983289; cv=none; b=iRsKzaBGrKmXOtl2cUW0DisRr06R4DDmJjXPxo7LMhc+kpsuDa+kOgtXKs/FMPzOS32LZUX4UEerRqr4c/EyOMv3PF4PfH+otKkuZrMs2twAUFl9GSMAoihvnt852fgkcqsP3hpXUoBbNtO/kx/NucarJQb6GFQoQbEanDOUrrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983289; c=relaxed/simple;
	bh=mRNF0zMYS5W1G0xyUnmUvpKeW4FwPKmS9S1BHqbj1JY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=mhPKqmdtoqeqAaCDlHw8nJKKkKSgPg8UFT4BXyChYtv5CZt0jp9GWbt2nYD3SbFwdVsIcmt6jaJrj2YoBQWUqOc7STw0+CAR7+AGmn4x/EFDZ+ats2dqBuMN6mTZSIoR1tf2oLqx8Z54WSkIjIJj1Ufbab9hAScQMmW/Jpkdp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOlhO3WI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOlhO3WI"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso4709068e87.3
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983285; x=1792588085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mRNF0zMYS5W1G0xyUnmUvpKeW4FwPKmS9S1BHqbj1JY=;
        b=fOlhO3WIhSFFj8WliX/ConNu5svvkwUZA1VZksFXsyBZ+6KiEKTud1qnzUIHIBuSxA
         i4oAv3FICM1G6vG6a7va6iFGIdVZsCk7MYtXAi692ZjqxdDQ6nFKDLjcLJiYX6B988uB
         D0SDHa/Jvyx0o0ZefCUBu6qlKCbwWmAEV0oL1hZuF3oixe08G3WIiNSF/22uAzrwLo9C
         dj35pJf+cQyl6G2wjDTbOyraa2t32vR5loO77DpNlsGtSAcf98BrR+xLctKZ7oWx2J5j
         +7Ujo7kx0ZgiMoZ7oTtl9yrM6z4Xsu8DY78Byf0HkCEIjiVt/MHEj2+SEj04ihcp0aLY
         G4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983285; x=1792588085;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRNF0zMYS5W1G0xyUnmUvpKeW4FwPKmS9S1BHqbj1JY=;
        b=wN3bX99pRJiiAgxkSGAhhMB41euUemLawg+3O2iEH7jQW48Se49v6C/iBMI1jZ6biA
         UQpqV0DKcyyIcyxfWP3AyaQR0N+8S+Ady27JcLsdOX/tCzZO3h7ZwCqgR4E0DmYahCOn
         TBYcAVzAYEIwT6Pe2j8LnsYeuAoCPPEfWqCdb14M4b/i8+Yz32dBFG0TpkalfpuMT9Yt
         Zk6Nj6/ybwM3oh35DTXf6yo5cLAAZbv339o0TiW7c2P5DFqdcK8pjGGH6zW5qlTdXHCV
         eqmO6oD2pd6jUiaDw2goHDGevWXUHgtpOX/8wtV0h/RSNg/Al08wMfx5ImA87IEwNNUT
         Bp0g==
X-Forwarded-Encrypted: i=1; AKwUvBzpY/LQEmhstZydzTq59gi2CG/bghgX3P6Ivyk6EIIeAuWNoIYs//LKTIAqgVTLd0jsVr4P7aoBeZjlRg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXq4GTjTgbWd5Wvl5dBikdO9LEmelBAgsiXEAu6NCDK9PnQWMR
	irkXix+bk7NWy337wLpDk7FTrRs61xRDE5+WOdi0uGykdDG16DatnKi4
X-Gm-Gg: AYBFou0WOWGFlB/uEkba8k7iRFmg/L++zXFoBWmBhUkALirkKLPKz/ClkxrcC8j8quA
	nM9qAhbEp6Mkm8TbhX3/nFjQYpdDyrieEzLGay0rzDCj5Yypf2JRalqnOvGe3quTWsfSDR+qL/5
	TIW4PPNQBDWXwAJZP/aaA0Z5KIqx/dlbzU0lmaJibWeoUqiaxH1w7QeqFIpOk2zmW3+dNrGdYjM
	SYHGk+KwznMfvR+FdBtFQf79VdTYRZp9duHW3Tybaav98LncZKLG9sGbvqHBcgl3NhW0JtcanMx
	vVEtZZSn/MtxFeyza62EUKsVSsgXVW2FGK7IGXuxcr5B7cZsoCiTBVSClDQYTbLOwHKnocmfv8s
	zvnU9WqAYt+0B1Tmhpa99wfvGvSEzCrr4+CoTYxCPnHEbp5hVOnM0Vpvp02uEdtMBi/XGmyRsRz
	SjHA6P+y7mTcsMkV7cpkF2WntY6SjCkTVcB7PpJzKBMTIjtnkfdWJ5BdQc3E+aoSlimSMLQmx+t
	sM5sg==
X-Received: by 2002:a05:6512:33d3:b0:5bc:b54a:97e8 with SMTP id 2adb3069b0e04-5bcde6bdfe4mr5579324e87.17.1791983285077;
        Wed, 14 Oct 2026 06:08:05 -0700 (PDT)
Received: from [192.168.0.106] ([212.75.99.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33c12bc9sm630877e87.7.2026.10.14.06.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:08:04 -0700 (PDT)
Message-ID: <87e0832e-39ec-4298-80bc-1bc9de23caca@gmail.com>
Date: Wed, 14 Oct 2026 15:08:03 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, pl
To: tiwai@suse.com, perex@perex.cz
Cc: torsten.schenk@zoho.com, linux-sound@vger.kernel.org
From: =?UTF-8?Q?Piotr_Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>
Subject: [RFC] ALSA: 6fire: S/PDIF output as playback channels 7/8 or as, a
 second PCM device?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have a patch that enables the S/PDIF output of the TerraTec DMX 6Fire
USB (sound/usb/6fire). Before I send it, I would like to know which of
two ways of exposing the output you would accept.

The hardware
------------

The card has six analog outputs and one S/PDIF transmitter. All
playback data goes to the card in one isochronous OUT stream. At 44.1
to 96 kHz the packets have space for 8 slots of 32 bits per frame: six
for the analog outputs and two for the S/PDIF transmitter. The mainline
driver sends only the six analog slots. At 176.4 and 192 kHz
(altsetting 3) a packet carries only the six analog slots
(604 = 4 + 25 * 6 * 4 bytes), so the S/PDIF output is available up to
96 kHz. The card has one sample rate for all outputs and the analog
inputs.

The driver shares the isochronous streams between the playback and the
capture substream: the first prepare sets the card rate, and while the
stream runs, open offers only that rate.

In its multi-channel mode, the Windows driver of the vendor exposes the
analog outputs and the S/PDIF output as two devices. The manual says:
"This is a multi-channel driver that signals all six analogue output
drivers to the operating system as one multi-channel driver. [...] The
digital driver is available separately, with the designation "DMX 6Fire
Digital Out"." In its multi-device mode the driver exposes four stereo
devices, and the S/PDIF output is again a separate device.

Option A: one PCM device with 8 playback channels (patch available)
-------------------------------------------------------------------

Playback channels 7 and 8 are the S/PDIF pair. The hw_params rules
allow 7 or 8 channels only at rates up to 96 kHz; at 176.4 and 192 kHz
they allow at most 6. A channel map gives channels 7 and 8 the position
UNKNOWN. I tested the S/PDIF output on the hardware at 44.1, 48 and
96 kHz.

ICE1712, hdsp and the FireWire drivers put an S/PDIF pair that shares a
stream with analog channels into the same PCM device. alsa-lib splits
the ICE1712 device with a card file (ICE1712.conf), and UCM splits
several USB-Audio devices with SplitPCMDevice. alsa-lib has no card
file for the driver name 6FireUSB.

The drawback: a client that opens hw:X,0 with the largest channel count
gets 8 channels and at most 96 kHz. Without the patch the same client
gets 6 channels at up to 192 kHz. With the Pro Audio profile of
PipeWire 1.6.9 and the rate set to 176.4 or 192 kHz, PipeWire ran the
card at 96 kHz. A client that ignores the channel map and assumes a 7.1
layout sends the side pair to the S/PDIF output.

Option B: S/PDIF as PCM device 1 (no patch)
-------------------------------------------

Device 0 stays as in mainline: 6 playback channels, up to 192 kHz.
Device 1 has one playback substream with 2 channels, up to 96 kHz. In
the URB handler a third substream writes slots 7 and 8 of the same OUT
packets. While device 1 is closed, these slots carry zeros. The rate is
handled as between playback and capture in mainline: while the card
runs, open offers only the rate of the card. In addition, while the card
runs at 176.4 or 192 kHz, opening device 1 fails with -EBUSY. The
IEC958 controls are attached to device 1. I plan the S/PDIF input as a
later patch; it would be the capture substream of device 1, because the
receiver outputs frames at the rate of the source, which can differ
from the rate of the card.

The drawback: device 0 and device 1 start independently. Unless the
driver supports a linked start (snd_pcm_link()) and starts both in the
same packet, the analog and the digital channels are not aligned to the
sample. I did not find an in-tree driver that splits one shared stream
into two PCM devices. The drivers with a separate S/PDIF PCM device
that I found (ice1724, oxygen) have a separate DMA channel for it.

The question
------------

Which option do you prefer? If option B, is a driver that sends the
data of two PCM devices in one isochronous stream acceptable?

Thanks,
Piotr
