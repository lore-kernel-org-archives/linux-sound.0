Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E937E5CB
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238815; cv=none; b=FvyIiFVT74vwa+mW4SDxUsBgsHBwV/L/pN6g1KQ+/vb5NFUXkCX8uucvWqTdJu3iy7HIYglsyDVR3J665R0km6CrayPhG6A4b5w8DAjGyMNST40riZizNn5dgPRW4mX73J096IHnbYUqI0YEYKKHiyYahQblIV/20mlsLI5QzCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238815; c=relaxed/simple;
	bh=6Ald7vZ6kBCoO8E+et7GzfHLmpauYeQ1CHl+O3YPb24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N20TxyudQly4j2vgR+zn7AG568GXmzziBe7OcalHEY440TvuzA78n7IY0Sf2Yt8gok4JonXvJlraMTVXV6nJ33y+8vI7zt77b/lTNfTCNeBBf3KtAOyE1UH0Q6wi9IlYnfMaj7r/6ho/yxLjpyzqeyr1jNdyziwbdOHZtoxgDhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqUM6lBs; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqUM6lBs"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso2471318e87.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 08:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787238812; x=1787843612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WoAaczqx9vz90sCyu2Uto6aX0IpeQLuBL6PDZDK9ORg=;
        b=SqUM6lBsVARRhIMl9HvKLC+pWkotnDq1TB37tcsKHU59kSxZpwr14pBqgHhnY5RNW+
         +WDbAG1F2v6jw8cBauxgdXLWqbWROKQe0nkWQbfsdcR8kwXCT9FdLzE0KkVN098dyo9M
         tqWkFbii4MvvSdwhqR3fcmSxPbd8QXv1leeTLez/2WMgr73aK/1ZS8BToMisl71L8T64
         jLgO3w29W/JQ981n8WspPVrqfDalD12lIGQxgTUG6nV3hdQWdJx3BduIoLS3uB4aBLFt
         P5FVTx8lY/r5KzfY624g41Qvf4fmFPUvSQJtsAdbx+3MYLuXtxQ7nudYc1tTPE371dTR
         B/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238812; x=1787843612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WoAaczqx9vz90sCyu2Uto6aX0IpeQLuBL6PDZDK9ORg=;
        b=ogRafPQZLHspecEPebR04OwNEJnM1RDi0MM3PW2MgazYBHb+0TU2CqZDiKERZmcgdp
         HjReP4jJtJrHiHYhYnixlDl+UgEDPD3hyoIMmmy9Vo5O/gRcZhujQtev99M6LHHg22Dm
         FjTdb/jj6gxDagtQwJZ2uc46XL2JXArWKPR9vy6gef8D2Bjj4kt6ragrYrIc0YahSwWq
         rf9llIgGAJtcgrGNZ1VwnmGxhyG24+bsDMdIPw7ANLfj3tuDbJpZtBAxiFjxDAcunox+
         zskmRXLD6EnKE921NiSUOwNYUTigLrGSW7vEhUhBtO4OVQpl1wVDTr6ZvdyduOXDS2/n
         /sZw==
X-Forwarded-Encrypted: i=1; AHgh+RqhmOnhT6yMylwTPfV6jpRl9MYRtlTSHCFHeD57Ch43LwM0Ryu8OzHdmKiaNLiwTntgsRBa3bkIQzrA0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoM5JI18B8DVatI5qSTZ78pwTOcs/z/R8ivcej6bLbQJ4O/gAA
	gM3f+U5YXM6pPvxXQMKYteNqq27aBk3P3vkeLUCjnKvmrugPGPB7itVy
X-Gm-Gg: AR+sD10rYPSXCA0K2vZXrcguVlIa7s8lMAoLPryZSgh6Z7a2r/4FlA9BtRduwDFcMCm
	aD/Hy2GzPAqa+GUcuh2HEPmoWb5x4g6I7RNo/YpzQyo/ty6Jg/0ed+/FA5k6WzvrtZL6lEGpW4W
	Cnl+uxMhGhPn7bgzNHpUAMwlKX7qIvIc2qPBAEfmKFacRd2CRUP2t2WB3kekBGTUQTcz30Uv6NU
	2pF6jm8nL1XgXNqHPOjdf5HszuUlZulq7Om2P5Xql8PEF0hz8DgEv3WYTeDHvWIYlmspQ2mVhji
	1nToKLDU2kqjzJ1FjKa/rHrUIUelclCH1I+ENyT3FWowDt20bMZhFOCCJwnC1lk1U5ZGYaswR4m
	zIqI05vccamydpaCaouKgc3jWyHHqd+311jI2VXjo8pa8OvvOW7hUn0UFuK3KvolZvKC4P/rD0T
	7LoozTsuZ1ecm10jLG9V6Uh/Ao8i7SUdTXHuu9aZS/M2zE0c9dJi72EnndlL9Fkf6UWGL1cOViF
	SQMzhaxhul5j8Amdc6BKDngEl4KrIZ3v6OxYzGd3iVstbjFQX3AS/tM+8z1
X-Received: by 2002:a05:6512:131f:b0:5b1:5a90:25b4 with SMTP id 2adb3069b0e04-5b478bcb7c5mr3792837e87.19.1787238811565;
        Thu, 20 Aug 2026 08:13:31 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788f5a60sm1333617e87.77.2026.08.20.08.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:13:30 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 0/2] Two ways to reach the Topping M62's analogue gains
Date: Thu, 20 Aug 2026 20:13:27 +0500
Message-ID: <20260820151329.18332-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87y0eaxz39.wl-tiwai@suse.de>
References: <87y0eaxz39.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You asked for PoCs of both roads and a comparison of the actual code
rather than of arguments. Here are both. They are alternatives, not a
series: each is written against mainline 98f21c54f995 on its own, and
either can be applied alone.

  1/2  ALSA: usb-audio: a mixer quirk that claims the HID interface
  2/2  HID: topping: a HID driver that registers a card of its own

Both build clean (checkpatch --strict: 0 errors, 0 warnings; the two
CamelCase CHECKs in 1/2 are bNumEndpoints and bInterval) and both have
been exercised on the device -- 152a:875c, bcdDevice 3.27 -- for
reading, for unsolicited notification from the front panel, and for
writing.

What the device is
==================

The M62 keeps its two microphone preamp gains, its AUX and Bluetooth
input volumes and its headphone and OTG output volumes behind a vendor
protocol on a HID-class interface, and exposes none of them through
UAC. What UAC does expose on the capture side is a digital trim after
the converter, which cannot buy signal-to-noise: a noise-floor ladder
against the card shows the converter's own floor rising with the
signal. So on Linux today the one knob worth setting is the one that
cannot be reached, and a measurement application has to begin by asking
a human to touch the front panel.

The protocol is fifteen-byte frames -- start magic, a constant, a
target, a property, a signed 32-bit big-endian value, CRC-16/MODBUS
over the middle stored big-endian, end magic. Rebuilding all 2619
captured frames from that description reproduces them byte for byte.
The device says nothing until it is subscribed; one write starts the
stream and a second makes it announce its whole state, after which
every change arrives unasked, including a front panel press.

The control pipe is not an option: GET_REPORT and SET_REPORT stall with
EPIPE for every report type, so the interrupt endpoints on the HID
interface are the only route.

What is identical in both
=========================

The frame builder, the parser, the CRC (the kernel's crc16(0xffff, ...)
is CRC-16/MODBUS, so no private table), and the control table. A knob
is a row of

	{ name, target, paired target, property, min, max, TLV }

so adding one is adding a row. Six rows today. The outputs come in
pairs because the device answers on only one target of each pair and
the other would drift away unheard.

Where they differ
=================

1/2 claims the HID interface for snd-usb-audio and puts the elements on
the card the device already has. The cost is two-sided: an entry in
hid_ignore_list to keep usbhid off the interface, and one new helper in
sound/usb/card.c, because usb_audio_driver is static there and a quirk
cannot claim an interface without it. That helper is the only change in
1/2 outside the new file and its dispatch. Nothing is lost by taking
the interface: the report descriptor is a Generic Desktop application
collection with eight unnamed usages, sixteen bytes in and out and no
report ID, so hid-generic can only build an input device for a mouse
that does not exist -- which is what it does today.

2/2 binds as a HID driver, and the protocol half is if anything smaller
there: usbhid owns the endpoints, so hid_hw_output_report replaces a
hand-built interrupt URB out, raw_event replaces the one in, and no
interface has to be claimed. It needs nothing in sound/usb.

But these are mixer controls for an audio device, and the audio
device's card belongs to snd-usb-audio. A HID driver cannot put an
element there. There is no interface for it, and inventing one means
exporting from sound/usb both a lookup from struct usb_device to the
card and an add-element call, and then answering, for a single device,
what happens when the two drivers probe in either order and when either
disconnects first, given that the element would live in one module and
its private data in another.

So 2/2 does what a HID driver can do alone: it registers a card of its
own. That works, and the cost is visible from userspace rather than
theoretical:

	$ cat /proc/asound/cards
	 0 [ToppingCtl     ]: Topping - Topping M62 control
	 ...
	 4 [M62            ]: USB-Audio - M62

	$ amixer -c M62 cset name='Mic-1 Analog Capture Volume' 33
	amixer: Cannot find the given element from control sysdefault:4

One device, two cards; the gains on a card with no PCM beside them; and
anything that looks for a device's mixer next to its streams --
alsamixer -c, UCM profiles, PipeWire's device model -- does not find
them there.

Against my own preference, two honest notes. The phantom input device
2/2 leaves at boot (hid-generic binds first, the specific driver being
a module outside the initramfs) is a packaging artefact, not a property
of that road. And 1/2's claim helper is new API surface in sound/usb,
small as it is.

Field results
=============

With 1/2: the interface belongs to snd-usb-audio while a neighbouring
device's HID interface still belongs to usbhid, so the ignore entry is
precise. Values arrive by themselves -- the headphone volume came up at
51 while the zero-initialised cache would have said 0. One front panel
press produces exactly one control event. A write reaches the hardware:
the device reports the written value back, and its meters answer.

With 2/2: the same, on its own card.

One device fact worth recording: a written gain takes effect at once,
but when the device commits it to non-volatile memory is the firmware's
business, and a value written and then torn off the bus can come back
as the older one. Nothing in either driver depends on that -- neither
treats itself as the source of truth, both ask the device -- but it is
easy to mistake for a driver bug while testing.

Where I come out
================

The knobs belong on the card the device already has, and 2/2 cannot put
them there without a new cross-subsystem interface built for one
device. 1/2's cost is one static-variable problem solved by one helper
in the file that owns it. So I would take 1/2, which is also your gut
feeling -- but the comparison is what you asked for, and either patch
stands alone if you read it the other way.

Not covered by either: the OTG input's gain. It has no front panel
control and therefore never announced itself in any capture, so its
property is unknown. It is one row when it is known.

Mikhail
