Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCA83C2774
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787311418; cv=pass; b=S0sor+EF72Kn1U3lvICn6GYUxxGdS8Qdv2GAkSkxMTJ/WZd9AHM1VTfZp93PlDrSdIZL3agIEicOmbg2Ew2tJcB9ysJ8PVzhVWUPrw7iyGRBKa/+VmRiEySC3YDK7/zRMgB1f1pUbMFKE6mcDj/SSPZxcnLsq5QfKU4/3MmcnhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787311418; c=relaxed/simple;
	bh=LiExl+gOe3SeIzZXSuj4Zafu/2QOIkUK5hELicXazKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjreFeyy02eTOi5EaLaduIx4irWlMFjG33mytTgVLppnJzUJEKxBYfBR5YUVFt+albikyEkJ5rvXjm4Bo328xT3ojw4HFpG5UVI2fagFVU/A3v0fGt12qpz8B82IHNgF4xFybFathtNhMoqoWNgQpPurTt1h4kcbZz/CY8jb0G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QatBGwuz; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QatBGwuz"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f18c0e03e3so549060a34.2
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 04:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787311412; cv=none;
        d=google.com; s=arc-20260327;
        b=aZmcDPkeldq6tCr3vNPQGoIxJFIXqStQnwi91xk6xxLWCC8C/TmWPYLw5FUmRGrdfc
         QvxxKhyJ7DvZH+Uhx1ER92ZvRVI+wvQ424zpliKhGt0k/NBYkkH76NX79GW6kOPC5yPV
         tYlGPjR4Qym7dlAa7XjdxpURQNLOk4DFDZbjEyRGRi3HBOZyxL2IPOQsRkoFcMg32FX4
         G0Bd2f71J2eddZi2GYLkPppjs4p0Q46os7Wlqa4XbTK01YpC5QlN2oyZrhr/qv5a++VF
         +eLdDqAWBSgA+V+cp1siSfw0Mfd48M+0ZvnjhpKdZZzP2iOg61b8nMpm0r2AA06guGHt
         I9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XP0TXz3XgGZqxpegnUNB5sva+CKg8bV+74SS+MJugIo=;
        fh=QjBig1gfJBzUKK8oH8Pr21yAL4IbUYSxVachlafdwmA=;
        b=SfKOTA+DKVhBkaWUn4/5kOr+/zuDpIAexcCj/5trR3GJAUteA1iqFzXIVVTh/0rK4Q
         zghRVVwvuL8cLylSXXicyNctrjmxvmTLcYr0KYSjdBm1krjLKSdiXeIbYOTXKWAH/oTd
         1c/EVfhxGqOCQcERAI6PBmub/A2h5pJVGX6fhCWCQnOCO2RskhsLnySJn7WiBsqE8sVS
         h0Mc4iaCqb8gvPMCDJHMStS+/q4XnNtDp7ZdWKLAIvo0nim+1tRZg9rWRTt+1Vz8MXml
         DZqgF1rha18juNByhQZat6ExfcaPcXxZQlWWLTSTClbUMkVOhl8Pom10haK0A/OxYxHY
         4KKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787311412; x=1787916212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP0TXz3XgGZqxpegnUNB5sva+CKg8bV+74SS+MJugIo=;
        b=QatBGwuzib0/erTsEzv2jLI45++dS1cTy/BJrdOVJ+wSglKZiwxWPGx8FPVpJcdCau
         hLdc5+AHY+UUr0QFypFZM8YwMG/gGBz8MXYWpB814qn/4/OLtGauMWgwqc/D+UIrH7/m
         JPd9BemOiGMgYj75N+rD3EIYdmBcHoAfcUpi4SJV5Uv1bQ3K8W1hUlCvngvK7OrLscmB
         QpxCEw1medGVmy3IYvCL3zA2vv1pcssztHRWstsMY6rkLdRbQkdOw7CCMLCUKiAofujL
         W+T0Ff80FmGaunn7Rrk46LpD1VaMdtv+0gcHQwesULprp/5ZlKZG1B2t2ExDSywoxJzS
         BoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311412; x=1787916212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP0TXz3XgGZqxpegnUNB5sva+CKg8bV+74SS+MJugIo=;
        b=fIiFgmTCWLK4LHJNw9WY5ZGt0FDeonA25XXwwTCD9OHdvQnf26j6BD57FrbC0x80Jv
         nHNNCtX5ie7b1LGrxsJJQTlbpIqfN/nE8cr207z5k87+QwK767D9lgApXPWh8VQ734HG
         f4NsRTsBaPCzglA0XItvJNJHt+Zxo2mScwUxvujKyTiI7BZuYs822PF4YZYzHAhv4ENc
         e0XU4e5gDF7nHo/GyonfHUmCWT3ANfQxOuoXrAYKt6b03ZPGJR+tbi0c1dKLFh1WslCA
         Ngj2OxQPnYkKJxijdB639paVUx2hvaA12XTKGd9zWd+cU4CyTJ6tEqxZmcD2lPjSBhJO
         QLFw==
X-Forwarded-Encrypted: i=1; AHgh+RqEsK0kR18sU/xcCXCmYNsmb0ausO0hvdz/8APFuGDRufl0Am6Kdlh8wv+Bb+F8Nwu5ffhoBAxobbGO/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7lKtTmL7LLTfAIYsem3eUvScKBqwjfMVBHR5pUbL0oYjCrst0
	g+KTNy9gE1V/wey7S0I9UaR6bt3tfuhPa7B5/PCE4vJd8EfK2bxvTS31oeEeljg5siXrgBTQCeh
	B64w2XIswiVUDzWANyAztJ9ZxDQzLREA=
X-Gm-Gg: AR+sD10LLxaFE5fkAh0zRGR2hTCuAVSIXzkFJdXVLCm/o+SggQ8rvjJ1NRpHVuTFShD
	tc2StL3CMQ9y1V5wAqX/zNn94mSKumhPz2O5OAFylmSzGOWN25mHhW8BloShVXHGy0o74GIJjsE
	LGT5NU22bRbXPy3tK3yBcX/UEYPihJTsFLJxHBycqwlVtMsc0tZSPx921SjTLNZYvyZ+9niOuaY
	1NBlbicbUIMaQiuagCloEIJcrRoAhYwBUeuWiORL6tU93MORqAVNdc6fX92yRzc+h69Iu7z4Ycc
	cuIhlHNUNbW8MaPSABe/0z0IL8xcdVoIKRMRPC0Cz8fVqCgXy3p6L1CFo9yMT6AP5Dzc/0ChuQt
	RmsQQfDagjG2BQoCY0wv6gor/bO2OZoCa5kBfKikkJZPz
X-Received: by 2002:a05:6830:2b0f:b0:7e9:8867:cb23 with SMTP id
 46e09a7af769-7f46173cb90mr6196887a34.16.1787311411854; Fri, 21 Aug 2026
 04:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87y0eaxz39.wl-tiwai@suse.de> <20260820151329.18332-1-mikhail.v.gavrilov@gmail.com>
In-Reply-To: <20260820151329.18332-1-mikhail.v.gavrilov@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 21 Aug 2026 16:23:20 +0500
X-Gm-Features: AcwNN1WSC1RC40OlRsvrLRcT0ZtouTJ1WArekA-2DoyJ-r1DwXMS-VEfJgk_jP0
Message-ID: <CABXGCsMXRZaM9yKsyyffkfyXXDjHXhyixXZ-jz9BY=xJn0R7DA@mail.gmail.com>
Subject: Re: [RFC 0/2] Two ways to reach the Topping M62's analogue gains
To: tiwai@suse.com, jikos@kernel.org, bentiss@kernel.org
Cc: perex@perex.cz, linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 8:13=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> You asked for PoCs of both roads and a comparison of the actual code
> rather than of arguments. Here are both. They are alternatives, not a
> series: each is written against mainline 98f21c54f995 on its own, and
> either can be applied alone.
>
>   1/2  ALSA: usb-audio: a mixer quirk that claims the HID interface
>   2/2  HID: topping: a HID driver that registers a card of its own
>
> Both build clean (checkpatch --strict: 0 errors, 0 warnings; the two
> CamelCase CHECKs in 1/2 are bNumEndpoints and bInterval) and both have
> been exercised on the device -- 152a:875c, bcdDevice 3.27 -- for
> reading, for unsolicited notification from the front panel, and for
> writing.
>
> What the device is
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The M62 keeps its two microphone preamp gains, its AUX and Bluetooth
> input volumes and its headphone and OTG output volumes behind a vendor
> protocol on a HID-class interface, and exposes none of them through
> UAC. What UAC does expose on the capture side is a digital trim after
> the converter, which cannot buy signal-to-noise: a noise-floor ladder
> against the card shows the converter's own floor rising with the
> signal. So on Linux today the one knob worth setting is the one that
> cannot be reached, and a measurement application has to begin by asking
> a human to touch the front panel.
>
> The protocol is fifteen-byte frames -- start magic, a constant, a
> target, a property, a signed 32-bit big-endian value, CRC-16/MODBUS
> over the middle stored big-endian, end magic. Rebuilding all 2619
> captured frames from that description reproduces them byte for byte.
> The device says nothing until it is subscribed; one write starts the
> stream and a second makes it announce its whole state, after which
> every change arrives unasked, including a front panel press.
>
> The control pipe is not an option: GET_REPORT and SET_REPORT stall with
> EPIPE for every report type, so the interrupt endpoints on the HID
> interface are the only route.
>
> What is identical in both
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> The frame builder, the parser, the CRC (the kernel's crc16(0xffff, ...)
> is CRC-16/MODBUS, so no private table), and the control table. A knob
> is a row of
>
>         { name, target, paired target, property, min, max, TLV }
>
> so adding one is adding a row. Six rows today. The outputs come in
> pairs because the device answers on only one target of each pair and
> the other would drift away unheard.
>
> Where they differ
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 1/2 claims the HID interface for snd-usb-audio and puts the elements on
> the card the device already has. The cost is two-sided: an entry in
> hid_ignore_list to keep usbhid off the interface, and one new helper in
> sound/usb/card.c, because usb_audio_driver is static there and a quirk
> cannot claim an interface without it. That helper is the only change in
> 1/2 outside the new file and its dispatch. Nothing is lost by taking
> the interface: the report descriptor is a Generic Desktop application
> collection with eight unnamed usages, sixteen bytes in and out and no
> report ID, so hid-generic can only build an input device for a mouse
> that does not exist -- which is what it does today.
>
> 2/2 binds as a HID driver, and the protocol half is if anything smaller
> there: usbhid owns the endpoints, so hid_hw_output_report replaces a
> hand-built interrupt URB out, raw_event replaces the one in, and no
> interface has to be claimed. It needs nothing in sound/usb.
>
> But these are mixer controls for an audio device, and the audio
> device's card belongs to snd-usb-audio. A HID driver cannot put an
> element there. There is no interface for it, and inventing one means
> exporting from sound/usb both a lookup from struct usb_device to the
> card and an add-element call, and then answering, for a single device,
> what happens when the two drivers probe in either order and when either
> disconnects first, given that the element would live in one module and
> its private data in another.
>
> So 2/2 does what a HID driver can do alone: it registers a card of its
> own. That works, and the cost is visible from userspace rather than
> theoretical:
>
>         $ cat /proc/asound/cards
>          0 [ToppingCtl     ]: Topping - Topping M62 control
>          ...
>          4 [M62            ]: USB-Audio - M62
>
>         $ amixer -c M62 cset name=3D'Mic-1 Analog Capture Volume' 33
>         amixer: Cannot find the given element from control sysdefault:4
>
> One device, two cards; the gains on a card with no PCM beside them; and
> anything that looks for a device's mixer next to its streams --
> alsamixer -c, UCM profiles, PipeWire's device model -- does not find
> them there.
>
> Against my own preference, two honest notes. The phantom input device
> 2/2 leaves at boot (hid-generic binds first, the specific driver being
> a module outside the initramfs) is a packaging artefact, not a property
> of that road. And 1/2's claim helper is new API surface in sound/usb,
> small as it is.
>
> Field results
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> With 1/2: the interface belongs to snd-usb-audio while a neighbouring
> device's HID interface still belongs to usbhid, so the ignore entry is
> precise. Values arrive by themselves -- the headphone volume came up at
> 51 while the zero-initialised cache would have said 0. One front panel
> press produces exactly one control event. A write reaches the hardware:
> the device reports the written value back, and its meters answer.
>
> With 2/2: the same, on its own card.
>
> One device fact worth recording: a written gain takes effect at once,
> but when the device commits it to non-volatile memory is the firmware's
> business, and a value written and then torn off the bus can come back
> as the older one. Nothing in either driver depends on that -- neither
> treats itself as the source of truth, both ask the device -- but it is
> easy to mistake for a driver bug while testing.
>
> Where I come out
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The knobs belong on the card the device already has, and 2/2 cannot put
> them there without a new cross-subsystem interface built for one
> device. 1/2's cost is one static-variable problem solved by one helper
> in the file that owns it. So I would take 1/2, which is also your gut
> feeling -- but the comparison is what you asked for, and either patch
> stands alone if you read it the other way.
>
> Not covered by either: the OTG input's gain. It has no front panel
> control and therefore never announced itself in any capture, so its
> property is unknown. It is one row when it is known.
>
> Mikhail

Three things I should have said in the cover letter, one of which
argues against the conclusion I drew there.

The quirk's hid_ignore_list entry means no hidraw node is created for
this device at all. Topping ship a control application for Windows and
macOS and not for Linux; there is none today, and the driver should not
block one if it appears. The HID road leaves that channel open and the
quirk road closes it. I weighed the two roads by where the mixer
controls can live and did not weigh this, and it belongs on the scale.

The one gap the cover letter named is closed. The OTG input's gain is
target 0x27, property 0x04, on the same taper family as Bluetooth --
read out of a capture of the vendor application moving it, with the
indices it dwelt on matching the decibels it displayed. Both patches
carry the row here; I have not resent them for one line, and it will be
in whichever version goes forward.

And the protocol turns out to need more than a write path, which bears
on the complexity you asked me to compare. The vendor application
repeats its subscribe every two seconds, so a driver has to keep that
up or the device stops reporting; the device has two memories, and a
separate command commits the live state to the one that survives a
power cycle; and the source selectors -- which mix or bus each output
listens to -- can be written but never read: the device does not
announce them, and the vendor application does not ask, because on
connect it pushes its whole workspace rather than reading anything.
None of that favours either road, since both pay it identically, but it
is a fair bit more than a table of gains, and I would rather you saw it
before deciding.

I have not resent the patches. Both roads work on the hardware; the
question is still which one you would rather carry.

--=20
Thanks,
Mikhail Gavrilov.
