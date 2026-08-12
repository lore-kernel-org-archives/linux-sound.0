Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469547A882
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786554642; cv=none; b=PMezyEe2wRGmuhMOOCGrV2uNjrL0cD/L1JJm9GfpWfy1TVV/wexFzL7m1JipLbgo5qCBRfteGtyaOVaXrXzU9m1peAD72hFURHZ5LTC3Q7bMhC1OHP0idqj0O/2iu10LuxOwfoyt25OVKXW4E2boeU06fuPPAJmOxsd/9JdNxL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786554642; c=relaxed/simple;
	bh=N3UNOkaWDzLseGsKLlptMg2v3dOuIj+dfBpf2Uw4GvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ilVYhxlcZ6UuxgUvQCDL2oVexv629CXmjcUuP51oN90oLSDuVb4n1Pw6bYPLJrfn3IMr4bA80TB5Ii40Dbyc+w0kWJH00tfjOXs89d7tnveUmWu5l0Wy2gtXe3LIB2Mg6XCtdaWkTHOBeyhq3ERo9z17ixLx9yie8QKQwk/PAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABmdGKSr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABmdGKSr"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b00d083818so90908e87.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786554639; x=1787159439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtWAgvv8F8JkCWm/TC+EII2anFBS018iHMiIfSraGpA=;
        b=ABmdGKSraGTFIsJJthCIiObJnRvFHY76ZXnkuzZvIpT2GficEJV6pzE/zkPPjX0dgl
         jCN+gNDWsP4VD7f7L/Tu8Zr88jTZKcOsz3xLY7KU+Ze9qeemqjI6eGp57awRtqlTcDx0
         bKliwS02L+wJwsK8oZySrt/hPKaPRA5CDtB7UKc2pLNbSylVs9W9CjGfeWkTYYwp+XGF
         BrXyW6DVa9DQo7f1RYhibbTbxfSFxC+wPTl9ImY5Q3T1FBvcuP3Nv4VhktlB98yA3AMG
         8bx72yPg7fOdmNcAUKbTPN5s224QIZTUpeeQ2TDCAtZvf7LJEpt1BakcwykotoH9xZer
         OEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786554639; x=1787159439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtWAgvv8F8JkCWm/TC+EII2anFBS018iHMiIfSraGpA=;
        b=EqL+mTkymzPHmKIjEPj9zlJvVR9g39PXB0kzdwtSQshIYeWM3GfzxDQHffmALasUlL
         NQTWIToTe921JYExsoD0rxuBDnO0JF7ialXF3VquBXGXCXFnv+DumgKXXF9fAft71flG
         dUi9MNgSqGtIAROjo9gRPUenBopUWwv4KsFAqNscL+Tnt11d/QwiquKa4nugLEjyxtwF
         6BxhDXAHv3psbyuK3Qds+NEWRgOW38bLCdE9221kRZ4h/AbRBpuXuqECaXFn1Z5q+iRX
         WInEdZReobq42KkePVmGblJEutwLurG8Qlo2hjhhjGjXFL8EiQ+p1eqPiqvvvksoF47V
         r2GQ==
X-Gm-Message-State: AOJu0Yw4kMroaR7PFKGNLGjOQyorDhCVzjSF0S5+gk5lbb7SYp1rYs6H
	buaFM0FKDtkt2WXv91xkp83BrHzANhAGrnvGicPLrbc1fNqat5hBOK97m4GfVCxFdcdqwa/H
X-Gm-Gg: AR+sD10qkZQcYw51q751iBLHCpcu1lZ/sXv3JucFf51SaSKhrxtPgP696F3pyzJ5l77
	F3DOYyCAqgUR/ZScL58Xk5OgdTKfjlVv4PXpb5loUv+kb4HDv1ufze1kUsrVsNgy/iq+GiMCq6n
	YVJ6IYZgfAbDbhIk0zs8HRIqGw+BPeR4dkHGmoIfxBoifCLdm9zaU46+7AY5apCzQG0QyN3nalU
	r6OdbzIny+rgr0KEY+BzAqxNZcXEpMJcfxoaf0KtPjnmOMqq9A5KLYLfU4yhdMBI2s1HFcq7dEt
	7lvPrLiwyJrlEDL0sUlNa3w98JPw43YvEs2iu7otilpqZjUS4yKPct//ymCgadUmj5O/tYMhYjd
	mBsla0BoDmfB9JWLU0bCAJq2zCwDFUUixh3WoMEFZ8APkEzI48ghtTqkhZn079Z5QGoh1GvBQZa
	RQbaD1scLo7GeCiO7IfAQYzC+v17Ygfm7WCyqHa406B9ZSHjyUSyst3oGnc0dkBUvvz+sxp9zTD
	D7FvQY0lXnLsU/PRHPtJqOBvW88XnTTRtXkN0ZbIiluglqxQrR1Q/Ft9ljj
X-Received: by 2002:ac2:563c:0:b0:5aa:62df:cd0f with SMTP id 2adb3069b0e04-5b45317e5acmr88955e87.2.1786554638754;
        Wed, 12 Aug 2026 10:10:38 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfcf59fsm608628e87.36.2026.08.12.10.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:10:38 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	g@b4.vu,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: snd-usb-audio: exposing a vendor HID control channel as mixer controls (Topping M62, 152a:875c)
Date: Wed, 12 Aug 2026 22:10:34 +0500
Message-ID: <20260812171036.144085-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I would like to add ALSA mixer controls for the analogue input gain of a
USB audio interface whose control channel is a vendor-specific HID
interface, and I would like to agree on the shape before writing code,
because it crosses into drivers/hid.

The device is a Topping Professional M62, USB 152a:875c. In its
multichannel modes it presents 10 playback and 16 capture channels on
interfaces 1 and 2, a DFU interface, and interface 4 of class 3 (HID)
with a vendor-defined usage page, one 16-byte Input report and one
16-byte Output report, and no report IDs.

The problem: the microphone preamplifier gain, 0..88 dB per the
specification, is not reachable through ALSA. The card does expose a
'Mic Capture Volume', but a gain ladder measured in silence shows that
control to be a digital trim after the converter. The recorded noise
floor is flat at about -172 dBFS at the bottom of its range, far below
any converter's own noise floor, so what is being measured there is the
sample word running out of bits; above that the floor rises with unity
slope, i.e. one fixed analogue noise being divided down. The analogue
stage is reachable only over the HID interface, which is what the
vendor's own application uses.

I have the protocol. It was reverse engineered from captures of the
vendor application's traffic, the same way sound/usb/mixer_scarlett2.c
describes in its header. Frames are 15 bytes:

  22 33 | 20 01 01 | target | property | s32 big endian | CRC | 66 77

with CRC-16/MODBUS over bytes 2..10, stored big endian. Rebuilding
every frame of a capture from the decoded fields reproduces all 2619 of
them byte for byte. Inbound reports are that frame plus one pad byte.
The device stays silent until the host sends a subscription frame,
after which it reports every state change including front-panel button
presses, and it answers a "report your state" frame with a full dump.
The analogue gain of each microphone input is a single property carrying
whole decibels, 0..88, so a plain TLV_DB_SCALE fits it.

The constraint, and my question. This device accepts nothing on the
control pipe: SET_REPORT and GET_REPORT both stall with EPIPE, for
report types Output, Input and Feature alike. So the pattern used by
snd_soundblaster_e1_switch_update() in sound/usb/mixer_quirks.c, which
sends HID_REQ_SET_REPORT through snd_usb_ctl_msg(), is not available
here. The only usable transport is the interrupt endpoints of interface
4, which usbhid binds.

Would it be acceptable for a mixer quirk in sound/usb to own that
interface? Concretely: an entry in hid_ignore_list so that usbhid stays
away, the quirk claiming interface 4, an interrupt IN URB whose
completion handler parses the vendor frame, updates cached values and
calls snd_ctl_notify(), and usb_interrupt_msg() in the put callbacks.
The notification half looks like what snd_usb_mixer_status_create()
already does for the audio control interface's status endpoint. Or would
you prefer a different layout for this?

A first patch would be deliberately minimal: two controls for the
analogue gain of the two microphone inputs, with a dB TLV, and nothing
else. The line-level inputs and the outputs use index scales with a
piecewise taper, which I have measured but would rather submit
separately.

For context, an ALSA UCM configuration for the same card is already
proposed as alsa-project/alsa-ucm-conf#826. That is what would designate
the new control as the capture volume, so that userspace moves the
hardware gain instead of the digital trim.

I can post the full protocol notes and the captures if that would be
useful.

-- 
Thanks,
Mikhail Gavrilov
