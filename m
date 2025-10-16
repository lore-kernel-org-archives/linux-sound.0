Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A9328619
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 10:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611993; cv=none; b=E1WD56wW6gMnP0HcZvO5p4jpf7JUaYVMdUxfyUb6Oc/YR4FTQab3L7G6xmUf4/fieBQX2TWrCPSd18oVGBEz8I7OYlzcjJ4TJF/yPmEnQ+IiNZvipNHxRrzhA5f/VmgNnch+ChL/jKS0MfugTDHk6d8VZ/URS8P9fryzR3aQHNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611993; c=relaxed/simple;
	bh=L4IUjh7qvoEdFkzHuAvVgeqtOfEamA6IIYKcdRm7gAw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FicxlqaHrrYrL3KRmazMLAs5i3CNXvl4gD4ZgYXaAsyRL7N+TwTuV/aXq49rq5ZRWW62iv6bAKAmjdLd2BGhiHJLYiuX7F368P3+BZYxEkxna6wXoCEuCcNjeLRC3M/oZVvBEZBFyQLHYcbNSVp6bNkgVtrPBNp3WrjklRo5/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tSX7wToO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y9EHFkVQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tSX7wToO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y9EHFkVQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tSX7wToO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y9EHFkVQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tSX7wToO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y9EHFkVQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 44EBB21DB7;
	Thu, 16 Oct 2025 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760611985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ccNdWmfmDRImTgiOmSYnLQj4cEM0AwtCLQkoK0yeeo=;
	b=tSX7wToORyIiUAqFEmPaG5D8JDMkJS+WuiJH0gnydD8ppOW5V8s0forAr3K4hTXBmDbLu1
	1c3QRt+xvCIeuDIIcwiLYZPMMg7qR5uB6G17rM7cNwPwm8B5lguwbwuLjOjrJw2nJff2aJ
	cdepMsTPz7h9E4aTV8agLWJGIrOwiWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760611985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ccNdWmfmDRImTgiOmSYnLQj4cEM0AwtCLQkoK0yeeo=;
	b=y9EHFkVQXXZXTvPB9RRXnMi+YPbXX+KBmaQG16L1dOiY/c+5uBqAxevi79td5RZgKl3/Ho
	u7vkbjDGwng+VVCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760611985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ccNdWmfmDRImTgiOmSYnLQj4cEM0AwtCLQkoK0yeeo=;
	b=tSX7wToORyIiUAqFEmPaG5D8JDMkJS+WuiJH0gnydD8ppOW5V8s0forAr3K4hTXBmDbLu1
	1c3QRt+xvCIeuDIIcwiLYZPMMg7qR5uB6G17rM7cNwPwm8B5lguwbwuLjOjrJw2nJff2aJ
	cdepMsTPz7h9E4aTV8agLWJGIrOwiWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760611985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ccNdWmfmDRImTgiOmSYnLQj4cEM0AwtCLQkoK0yeeo=;
	b=y9EHFkVQXXZXTvPB9RRXnMi+YPbXX+KBmaQG16L1dOiY/c+5uBqAxevi79td5RZgKl3/Ho
	u7vkbjDGwng+VVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23A091376E;
	Thu, 16 Oct 2025 10:53:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jjBpB5HO8GjJKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Oct 2025 10:53:05 +0000
Date: Thu, 16 Oct 2025 12:53:04 +0200
Message-ID: <874irz86en.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pawel / Xj <xj@wp.pl>
Cc: linux-sound <linux-sound@vger.kernel.org>
Subject: Re: [BUG] Presonus Studio 1824c firmware 3.11 no longer exposes mixer interface ("Quirk or no altset; falling back to MIDI 1.0")
In-Reply-To: <515e134e2b0a4364b6d595c77ef84216@grupawp.pl>
References: <515e134e2b0a4364b6d595c77ef84216@grupawp.pl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FREEMAIL_TO(0.00)[wp.pl];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[wp.pl];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 16 Oct 2025 01:18:55 +0200,
Pawel / Xj wrote:
> 
> 
> Hi ALSA developers,
> 
> after upgrading the firmware on my PreSonus Studio 1824c audio interface to
> version 3.11, 
> the Linux USB-audio driver no longer attaches the mixer/routing interface.
> 
> On kernels 6.17.0 and 6.17.2 (linux-zen), the device is detected, 
> but dmesg shows:
> 
>     usb 3-2: Presonus Studio 1810c, device_setup: 1
>     usb 3-2: (8out/18in @ 48kHz)
>     usb 3-2: Quirk or no altset; falling back to MIDI 1.0

Have you tried 6.18-rc1?  There have been already a few commits to
support 1824c.


Takashi

> 
> The device works as a generic USB Audio interface, but:
> - There are no hardware mixer/volume controls in `alsamixer`
> - The driver cannot switch to 48 kHz mode (it defaults to 88.2/96 kHz)
> - The proprietary control interface seems missing
> 
> After investigating with `lsusb -v -d 194f:010d`, I found that firmware 3.11
> changes 
> the USB descriptor layout. The older firmware (probably 3.05) had a
> vendor-specific (Application Specific)
> interface used for the Presonus mixer quirk. The new firmware has **no
> vendor-specific interface**
> other than the DFU (firmware update) one.
> 
> Excerpt from the descriptor:
> 
>     bInterfaceNumber        3
>     bInterfaceClass         1 Audio
>     bInterfaceSubClass      1 Control Device
>     iInterface              0
>     ...
>     bInterfaceNumber        5
>     bInterfaceClass       254 Application Specific Interface
>     bInterfaceSubClass      1 Device Firmware Update
>     iInterface             12 PreSonus DFU
> 
> It seems the firmware replaced the previous vendor mixer interface with an
> additional
> Audio Control interface (class 1, subclass 1). As a result, `mixer_s1810c.c`
> does not
> detect it and falls back to plain USB Audio + MIDI 1.0.
> 
> **Device info:**
> - Vendor ID: 0x194f
> - Product ID: 0x010d (Studio 1824c)
> - Firmware version: 3.11
> - Kernel version tested: 6.17.2 (zen)
> - Distribution: Artix
> - ALSA version: from kernel 6.17 tree
> 
> **Expected behavior:**
> The driver should attach the PreSonus quirk code (`mixer_s1810c.c`) and expose
> the 
> hardware mixer and sample rate controls.
> 
> **Actual behavior:**
> Driver does not find the vendor interface, prints “Quirk or no altset; falling
> back to MIDI 1.0,”
> and no mixer controls appear.
> 
> **Steps to reproduce:**
> 1. Connect Studio 1824c with firmware 3.11
> 2. Check `dmesg` for the log above
> 3. Observe missing controls in `alsamixer`
> 
> **Attachments:**
> - Full output of `lsusb -v -d 194f:010d` (firmware 3.11)
> - `dmesg` excerpt from device plug-in
> 
> **Suggestion:**
> The driver might need to accept a second Audio Control interface as the mixer
> interface
> for new firmware revisions, since the vendor-specific interface seems to have
> been replaced.
> 
> I’m happy to provide full descriptors and test any experimental patch.
> 
> Thank you for maintaining ALSA and the USB audio stack!
> Best regards,
> Pawel Piatek
> xj@wp.pl
> 
> [  +2,427945] usb 3-2: new high-speed USB device number 3 using xhci_hcd
> [  +0,125645] usb 3-2: New USB device found, idVendor=194f, idProduct=010d, bcdDevice= 3.11
> [  +0,000006] usb 3-2: New USB device strings: Mfr=1, Product=3, SerialNumber=2
> [  +0,000001] usb 3-2: Product: Studio 1824c
> [  +0,000001] usb 3-2: Manufacturer: PreSonus
> [  +0,000000] usb 3-2: SerialNumber: SC4E25040072
> [  +0,380876] usb 3-2: Presonus Studio 1810c, device_setup: 0
> [  +0,000006] usb 3-2: (8out/14in @ 96kHz)
> [  +0,440551] usb 3-2: Quirk or no altset; falling back to MIDI 1.0
> 
> Bus 003 Device 002: ID 194f:010d PreSonus Audio Electronics, Inc. Studio 1824c
> Negotiated speed: High Speed (480Mbps)
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x194f PreSonus Audio Electronics, Inc.
>   idProduct          0x010d Studio 1824c
>   bcdDevice            3.11
>   iManufacturer           1 PreSonus
>   iProduct                3 Studio 1824c
>   iSerial                 2 SC4E25040072
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0281
>     bNumInterfaces          6
>     bConfigurationValue     1
>     iConfiguration          0 
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower                0mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         3
>       bFunctionClass          1 Audio
>       bFunctionSubClass       0 [unknown]
>       bFunctionProtocol      32 
>       iFunction               0 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      1 Control Device
>       bInterfaceProtocol     32 
>       iInterface              3 Studio 1824c
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdADC               2.00
>         bCategory               8
>         wTotalLength       0x00b7
>         bmControls           0x00
>       AudioControl Interface Descriptor:
>         bLength                 8
>         bDescriptorType        36
>         bDescriptorSubtype     10 (CLOCK_SOURCE)
>         bClockID               41
>         bmAttributes            3 Internal programmable clock 
>         bmControls           0x03
>           Clock Frequency Control (read/write)
>         bAssocTerminal          0
>         iClockSource            9 Internal
>       AudioControl Interface Descriptor:
>         bLength                 8
>         bDescriptorType        36
>         bDescriptorSubtype     10 (CLOCK_SOURCE)
>         bClockID               42
>         bmAttributes            3 Internal programmable clock 
>         bmControls           0x03
>           Clock Frequency Control (read/write)
>         bAssocTerminal          0
>         iClockSource           10 S/PDIF
>       AudioControl Interface Descriptor:
>         bLength                 8
>         bDescriptorType        36
>         bDescriptorSubtype     10 (CLOCK_SOURCE)
>         bClockID               43
>         bmAttributes            3 Internal programmable clock 
>         bmControls           0x03
>           Clock Frequency Control (read/write)
>         bAssocTerminal          0
>         iClockSource           11 ADAT
>       AudioControl Interface Descriptor:
>         bLength                10
>         bDescriptorType        36
>         bDescriptorSubtype     11 (CLOCK_SELECTOR)
>         bClockID               40
>         bNrInPins               3
>         baCSourceID(0)         41
>         baCSourceID(1)         42
>         baCSourceID(2)         43
>         bmControls           0x03
>           Clock Selector Control (read/write)
>         iClockSelector          8 PreSonus Clock Selector
>       AudioControl Interface Descriptor:
>         bLength                17
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             2
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bCSourceID             40
>         bNrChannels            18
>         bmChannelConfig    0x00000000
>         iChannelNames          15 Line Out 1 (L)
>         bmControls         0x0000
>         iTerminal               6 Studio 1824c 
>       AudioControl Interface Descriptor:
>         bLength                12
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID            20
>         wTerminalType      0x0301 Speaker
>         bAssocTerminal          0
>         bSourceID               2
>         bCSourceID             40
>         bmControls         0x0000
>         iTerminal               0 
>       AudioControl Interface Descriptor:
>         bLength                17
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             1
>         wTerminalType      0x0201 Microphone
>         bAssocTerminal          0
>         bCSourceID             40
>         bNrChannels            18
>         bmChannelConfig    0x00000000
>         iChannelNames          33 Mic/Inst/Line 1
>         bmControls         0x0000
>         iTerminal               0 
>       AudioControl Interface Descriptor:
>         bLength                82
>         bDescriptorType        36
>         bDescriptorSubtype      6 (FEATURE_UNIT)
>         bUnitID                11
>         bSourceID               1
>         bmaControls(0)    0x00000000
>         bmaControls(1)    0x00000000
>         bmaControls(2)    0x00000000
>         bmaControls(3)    0x00000000
>         bmaControls(4)    0x00000000
>         bmaControls(5)    0x00000000
>         bmaControls(6)    0x00000000
>         bmaControls(7)    0x00000000
>         bmaControls(8)    0x00000000
>         bmaControls(9)    0x00000000
>         bmaControls(10)    0x00000000
>         bmaControls(11)    0x00000000
>         bmaControls(12)    0x00000000
>         bmaControls(13)    0x00000000
>         bmaControls(14)    0x00000000
>         bmaControls(15)    0x00000000
>         bmaControls(16)    0x00000000
>         bmaControls(17)    0x00000000
>         bmaControls(18)    0x00000000
>         iFeature                0 
>       AudioControl Interface Descriptor:
>         bLength                12
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID            22
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID              11
>         bCSourceID             40
>         bmControls         0x0000
>         iTerminal               7 Studio 1824c 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0006  1x 6 bytes
>         bInterval               8
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol     32 
>       iInterface              4 Studio 1824c 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       1
>       bNumEndpoints           2
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol     32 
>       iInterface              4 Studio 1824c 
>       AudioStreaming Interface Descriptor:
>         bLength                16
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink           2
>         bmControls           0x05
>           Active Alternate Setting Control (read-only)
>           Valid Alternate Setting Control (read-only)
>         bFormatType             1
>         bmFormats          0x00000001
>           PCM
>         bNrChannels            18
>         bmChannelConfig    0x00000000
>         iChannelNames          15 Line Out 1 (L)
>       AudioStreaming Interface Descriptor:
>         bLength                 6
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bSubslotSize            4
>         bBitResolution         24
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x01f8  1x 504 bytes
>         bInterval               1
>         AudioStreaming Endpoint Descriptor:
>           bLength                 8
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x00
>           bmControls           0x00
>           bLockDelayUnits         2 Decoded PCM samples
>           wLockDelay         0x0008
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes           17
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Feedback
>         wMaxPacketSize     0x0004  1x 4 bytes
>         bInterval               4
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       2
>       bNumEndpoints           2
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol     32 
>       iInterface              4 Studio 1824c 
>       AudioStreaming Interface Descriptor:
>         bLength                16
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink           2
>         bmControls           0x05
>           Active Alternate Setting Control (read-only)
>           Valid Alternate Setting Control (read-only)
>         bFormatType             1
>         bmFormats          0x00000001
>           PCM
>         bNrChannels            14
>         bmChannelConfig    0x00000000
>         iChannelNames          15 Line Out 1 (L)
>       AudioStreaming Interface Descriptor:
>         bLength                 6
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bSubslotSize            4
>         bBitResolution         24
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x02d8  1x 728 bytes
>         bInterval               1
>         AudioStreaming Endpoint Descriptor:
>           bLength                 8
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x00
>           bmControls           0x00
>           bLockDelayUnits         2 Decoded PCM samples
>           wLockDelay         0x0008
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes           17
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Feedback
>         wMaxPacketSize     0x0004  1x 4 bytes
>         bInterval               4
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       3
>       bNumEndpoints           2
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol     32 
>       iInterface              4 Studio 1824c 
>       AudioStreaming Interface Descriptor:
>         bLength                16
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink           2
>         bmControls           0x05
>           Active Alternate Setting Control (read-only)
>           Valid Alternate Setting Control (read-only)
>         bFormatType             1
>         bmFormats          0x00000001
>           PCM
>         bNrChannels             8
>         bmChannelConfig    0x00000000
>         iChannelNames          15 Line Out 1 (L)
>       AudioStreaming Interface Descriptor:
>         bLength                 6
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bSubslotSize            4
>         bBitResolution         24
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0320  1x 800 bytes
>         bInterval               1
>         AudioStreaming Endpoint Descriptor:
>           bLength                 8
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x00
>           bmControls           0x00
>           bLockDelayUnits         2 Decoded PCM samples
>           wLockDelay         0x0008
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes           17
>           Transfer Type            Isochronous
>           Synch Type               None
>           Usage Type               Feedback
>         wMaxPacketSize     0x0004  1x 4 bytes
>         bInterval               4
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol     32 
>       iInterface              5 Studio 1824c 
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol     32 
>       iInterface              5 Studio 1824c 
>       AudioStreaming Interface Descriptor:
>         bLength                16
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink          22
>         bmControls           0x05
>           Active Alternate Setting Control (read-only)
>           Valid Alternate Setting Control (read-only)
>         bFormatType             1
>         bmFormats          0x00000001
>           PCM
>         bNrChannels            18
>         bmChannelConfig    0x00000000
>         iChannelNames          33 Mic/Inst/Line 1
>       AudioStreaming Interface Descriptor:
>         bLength                 6
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bSubslotSize            4
>         bBitResolution         24
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x01f8  1x 504 bytes
>         bInterval               1
>         AudioStreaming Endpoint Descriptor:
>           bLength                 8
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x00
>           bmControls           0x00
>           bLockDelayUnits         2 Decoded PCM samples
>           wLockDelay         0x0008
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       2
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol     32 
>       iInterface              5 Studio 1824c 
>       AudioStreaming Interface Descriptor:
>         bLength                16
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink          22
>         bmControls           0x05
>           Active Alternate Setting Control (read-only)
>           Valid Alternate Setting Control (read-only)
>         bFormatType             1
>         bmFormats          0x00000001
>           PCM
>         bNrChannels            14
>         bmChannelConfig    0x00000000
>         iChannelNames          33 Mic/Inst/Line 1
>       AudioStreaming Interface Descriptor:
>         bLength                 6
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bSubslotSize            4
>         bBitResolution         24
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x02d8  1x 728 bytes
>         bInterval               1
>         AudioStreaming Endpoint Descriptor:
>           bLength                 8
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x00
>           bmControls           0x00
>           bLockDelayUnits         2 Decoded PCM samples
>           wLockDelay         0x0008
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       3
>       bNumEndpoints           1
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      2 Streaming
>       bInterfaceProtocol     32 
>       iInterface              5 Studio 1824c 
>       AudioStreaming Interface Descriptor:
>         bLength                16
>         bDescriptorType        36
>         bDescriptorSubtype      1 (AS_GENERAL)
>         bTerminalLink          22
>         bmControls           0x05
>           Active Alternate Setting Control (read-only)
>           Valid Alternate Setting Control (read-only)
>         bFormatType             1
>         bmFormats          0x00000001
>           PCM
>         bNrChannels             8
>         bmChannelConfig    0x00000000
>         iChannelNames          33 Mic/Inst/Line 1
>       AudioStreaming Interface Descriptor:
>         bLength                 6
>         bDescriptorType        36
>         bDescriptorSubtype      2 (FORMAT_TYPE)
>         bFormatType             1 (FORMAT_TYPE_I)
>         bSubslotSize            4
>         bBitResolution         24
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0320  1x 800 bytes
>         bInterval               1
>         AudioStreaming Endpoint Descriptor:
>           bLength                 8
>           bDescriptorType        37
>           bDescriptorSubtype      1 (EP_GENERAL)
>           bmAttributes         0x00
>           bmControls           0x00
>           bLockDelayUnits         2 Decoded PCM samples
>           wLockDelay         0x0008
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      1 Control Device
>       bInterfaceProtocol      0 
>       iInterface              0 
>       AudioControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdADC               1.00
>         wTotalLength       0x0009
>         bInCollection           1
>         baInterfaceNr(0)        1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        4
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         1 Audio
>       bInterfaceSubClass      3 MIDI Streaming
>       bInterfaceProtocol      0 
>       iInterface              0 
>       MIDIStreaming Interface Descriptor:
>         bLength                 7
>         bDescriptorType        36
>         bDescriptorSubtype      1 (HEADER)
>         bcdADC               1.00
>         wTotalLength       0x0041
>       MIDIStreaming Interface Descriptor:
>         bLength                 6
>         bDescriptorType        36
>         bDescriptorSubtype      2 (MIDI_IN_JACK)
>         bJackType               1 Embedded
>         bJackID                 1
>         iJack                   0 
>       MIDIStreaming Interface Descriptor:
>         bLength                 6
>         bDescriptorType        36
>         bDescriptorSubtype      2 (MIDI_IN_JACK)
>         bJackType               2 External
>         bJackID                 2
>         iJack                  14 PreSonus MIDI In
>       MIDIStreaming Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (MIDI_OUT_JACK)
>         bJackType               1 Embedded
>         bJackID                 3
>         bNrInputPins            1
>         baSourceID( 0)          2
>         BaSourcePin( 0)         1
>         iJack                   0 
>       MIDIStreaming Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (MIDI_OUT_JACK)
>         bJackType               2 External
>         bJackID                 4
>         bNrInputPins            1
>         baSourceID( 0)          1
>         BaSourcePin( 0)         1
>         iJack                  13 PreSonus MIDI Out
>       Endpoint Descriptor:
>         bLength                 9
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>         bRefresh                0
>         bSynchAddress           0
>         MIDIStreaming Endpoint Descriptor:
>           bLength                 5
>           bDescriptorType        37
>           bDescriptorSubtype      1 (Invalid)
>           bNumEmbMIDIJack         1
>           baAssocJackID( 0)       1
>       Endpoint Descriptor:
>         bLength                 9
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>         bRefresh                0
>         bSynchAddress           0
>         MIDIStreaming Endpoint Descriptor:
>           bLength                 5
>           bDescriptorType        37
>           bDescriptorSubtype      1 (Invalid)
>           bNumEmbMIDIJack         1
>           baAssocJackID( 0)       3
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        5
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass       254 Application Specific Interface
>       bInterfaceSubClass      1 Device Firmware Update
>       bInterfaceProtocol      1 
>       iInterface             12 PreSonus DFU
>       Device Firmware Upgrade Interface Descriptor:
>         bLength                             9
>         bDescriptorType                    33
>         bmAttributes                        7
>           Will Not Detach
>           Manifestation Tolerant
>           Upload Supported
>           Download Supported
>         wDetachTimeout                    250 milliseconds
>         wTransferSize                      64 bytes
>         bcdDFUVersion                   1.10
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 [unknown]
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0001
>   Self Powered
