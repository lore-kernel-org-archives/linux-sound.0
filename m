Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E729039E6F0
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984982; cv=none; b=HHjpB3ON2qsOscYg5KnKsJ7OP0pjbB6R6dozaHMwNFYj2T3SvBWEoSF4taUzexAfEKVhO6/Unp3ys3ExS9HgVeKazHrDnRb+c86qFZ+q4p71Nxyjzefyu7qCZl+dWC6Y5VaEXRu/RxJjW/B9+cBwNI08MSIBCZ17tN6kc5H2Ono=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984982; c=relaxed/simple;
	bh=DF8ybN2GMwLwU1qAu0KkHMz+BA0Hw6rZ+RglJjRcPVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orpou2wvY9GK74ga1qUA5e9HeLC0So5ax/YDWPx8CsvpA+fpo6nA54ko/KcrApxllxEd1Kf5fCYXSqnL7zx8nNaSIjkJ9I43Y9dxsbc4bPVCqpyviNKdAx8pxzHWwdJov1YebDJh6HT3a+7OPH3dMplEWbtyU1QNoUVeDphTL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=rt3GsJ1G; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="rt3GsJ1G"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3088D3EFEE;
	Wed, 14 Oct 2026 15:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3088D3EFEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1791984524; bh=89JXbv64hAo1dFKAJ+z8aXhwRzF3UeB/7QmGRPPwM/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rt3GsJ1Gnu/knFDYlYr8xPL4HD9mu83WQsgtn9OEcp7Nt4F8AtQPK4J4jm2OhFn1Y
	 NWrDmve1VFQ67jjxyi9E9wfoIMGixQ6PeKq9GVWQrv+uGL1MSYhtU3wVu4IXMBbVFh
	 It/KIlVaernO76NpweFbo/4AKOZJhq++H/iAjmu4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 14 Oct 2026 15:28:40 +0200 (CEST)
Message-ID: <30dcedc7-3b56-4396-af3d-6c2701ef1cb7@perex.cz>
Date: Wed, 14 Oct 2026 15:28:38 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] ALSA: 6fire: S/PDIF output as playback channels 7/8 or as,
 a second PCM device?
To: =?UTF-8?Q?Piotr_Gli=C5=BAniewicz?= <p.glizniewicz@gmail.com>,
 tiwai@suse.com
Cc: torsten.schenk@zoho.com, linux-sound@vger.kernel.org
References: <87e0832e-39ec-4298-80bc-1bc9de23caca@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <87e0832e-39ec-4298-80bc-1bc9de23caca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 15:08, Piotr Gliźniewicz wrote:
> Hello,
> 
> I have a patch that enables the S/PDIF output of the TerraTec DMX 6Fire
> USB (sound/usb/6fire). Before I send it, I would like to know which of
> two ways of exposing the output you would accept.
> 
> The hardware
> ------------
> 
> The card has six analog outputs and one S/PDIF transmitter. All
> playback data goes to the card in one isochronous OUT stream. At 44.1
> to 96 kHz the packets have space for 8 slots of 32 bits per frame: six
> for the analog outputs and two for the S/PDIF transmitter. The mainline
> driver sends only the six analog slots. At 176.4 and 192 kHz
> (altsetting 3) a packet carries only the six analog slots
> (604 = 4 + 25 * 6 * 4 bytes), so the S/PDIF output is available up to
> 96 kHz. The card has one sample rate for all outputs and the analog
> inputs.
> 
> The driver shares the isochronous streams between the playback and the
> capture substream: the first prepare sets the card rate, and while the
> stream runs, open offers only that rate.
> 
> In its multi-channel mode, the Windows driver of the vendor exposes the
> analog outputs and the S/PDIF output as two devices. The manual says:
> "This is a multi-channel driver that signals all six analogue output
> drivers to the operating system as one multi-channel driver. [...] The
> digital driver is available separately, with the designation "DMX 6Fire
> Digital Out"." In its multi-device mode the driver exposes four stereo
> devices, and the S/PDIF output is again a separate device.
> 
> Option A: one PCM device with 8 playback channels (patch available)
> -------------------------------------------------------------------
> 
> Playback channels 7 and 8 are the S/PDIF pair. The hw_params rules
> allow 7 or 8 channels only at rates up to 96 kHz; at 176.4 and 192 kHz
> they allow at most 6. A channel map gives channels 7 and 8 the position
> UNKNOWN. I tested the S/PDIF output on the hardware at 44.1, 48 and
> 96 kHz.
> 
> ICE1712, hdsp and the FireWire drivers put an S/PDIF pair that shares a
> stream with analog channels into the same PCM device. alsa-lib splits
> the ICE1712 device with a card file (ICE1712.conf), and UCM splits
> several USB-Audio devices with SplitPCMDevice. alsa-lib has no card
> file for the driver name 6FireUSB.
> 
> The drawback: a client that opens hw:X,0 with the largest channel count
> gets 8 channels and at most 96 kHz. Without the patch the same client
> gets 6 channels at up to 192 kHz. With the Pro Audio profile of
> PipeWire 1.6.9 and the rate set to 176.4 or 192 kHz, PipeWire ran the
> card at 96 kHz. A client that ignores the channel map and assumes a 7.1
> layout sends the side pair to the S/PDIF output.
> 
> Option B: S/PDIF as PCM device 1 (no patch)
> -------------------------------------------
> 
> Device 0 stays as in mainline: 6 playback channels, up to 192 kHz.
> Device 1 has one playback substream with 2 channels, up to 96 kHz. In
> the URB handler a third substream writes slots 7 and 8 of the same OUT
> packets. While device 1 is closed, these slots carry zeros. The rate is
> handled as between playback and capture in mainline: while the card
> runs, open offers only the rate of the card. In addition, while the card
> runs at 176.4 or 192 kHz, opening device 1 fails with -EBUSY. The
> IEC958 controls are attached to device 1. I plan the S/PDIF input as a
> later patch; it would be the capture substream of device 1, because the
> receiver outputs frames at the rate of the source, which can differ
> from the rate of the card.
> 
> The drawback: device 0 and device 1 start independently. Unless the
> driver supports a linked start (snd_pcm_link()) and starts both in the
> same packet, the analog and the digital channels are not aligned to the
> sample. I did not find an in-tree driver that splits one shared stream
> into two PCM devices. The drivers with a separate S/PDIF PCM device
> that I found (ice1724, oxygen) have a separate DMA channel for it.
> 
> The question
> ------------
> 
> Which option do you prefer? If option B, is a driver that sends the
> data of two PCM devices in one isochronous stream acceptable?

We prefer to not add complexity to the drivers, so option A with correct UCM 
channel description is best IMHO. Pipewire supports the split now. The apps 
should follow the channel maps for direct hw:X,Y access.

Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat
