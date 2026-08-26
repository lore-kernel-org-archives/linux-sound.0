Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC0470458
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767580; cv=none; b=E7QjSdnQFXKp5Lg6tTM9S0Bw91L5pfE7Z4nW+xKsDufkT9ANQUtL1sj3A7zuebyQ0iwM0JCGr9oTkOvSovGzEc6GI+4wY4G6I44uj7n2aksd23BnejuPzYKV7bhn7F9CNS2GIBnv51tX8c0DY9Mz4c8/wmc0gxF13Lp+GKyHsDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767580; c=relaxed/simple;
	bh=LeEJFYRJyjBD+VOdgRYdyzn/yNEdxpehfMwq5EPBXQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iX4h5fZY0rGLyn+SBPlYfQGdg/tTQuNyL9dEnRNr7ERXv6wXktqOM8xtd5+872sps0AcSarxDHu4qwOqcyjsuNUOqGrSVLsdZarkjciqevPDYHIcJdj1pKzoYWSR5jU+CO/Ij02unRC7xp0oD3UakksODvjehZPjm+7inCcPn50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxgKhO1U; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxgKhO1U"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a3efa2b38aso2351551a12.2
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 11:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787767570; x=1788372370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cm/MI2m9y8Iv9NfgYHEezzJ1W5y+yuhXpteKHeoWjTU=;
        b=WxgKhO1URr+YV1uT59apW+giKeGAcbwNSToIBOv/2bHpXgfeUflPVZyHi4J1NUamG+
         yGH1fudawP3OdHFK/4CpiWlVvqgcOKOEtjRBvMa7u+pIlEun9gg8h37ycMMpVVuX41Vj
         O1FdOnOyCrGkwT5oH4ybPkg8cepI+RgmwUaNhv19HaNilKLBPy2EobbBShawrxMsLtI3
         MF6+cXvlhzMVpDr7TVEkZE1Q0n8/KMioRvLbhAHINydaII3A/nZ/XjfS7CLh1p+BYimy
         Qyb2RDraRr7jhBtoIDgInqM9IBXrwn9nZxKd6LUY4Qi5f+OHKMQfDPYnhcLtZYrqp7Uk
         VEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767570; x=1788372370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cm/MI2m9y8Iv9NfgYHEezzJ1W5y+yuhXpteKHeoWjTU=;
        b=D177W9ixJvzen4l6lhqxDPBiDYjroC5B7psmugK4rPHK3PF6ThR8V4vNXuf2bhDpJb
         xCseUWQAjtD8AZgPF8c1WPcx1jUR8NXhoDl7yiiNFsh5UIj9Hq6/KODsMourT82JbYjz
         eUIlztHCk/lEcUUnGNpA9adXhxQi8DeBcA68gwTZ3rI7YzeEzrDgP2W9rtxBpq3NpMCK
         EjopSysndiHZa62Jg/LYPcgTDNfPKejpf46t/zerIa5lId8sYAFj3khEDD85mTmM5gi8
         IzgQYugiMlxfYF86ZzMYfYzrU98iRDUy4bZxcy3iQe/Ij7cDkKB2SfW3sxl7GM+tQ0xr
         gm4A==
X-Forwarded-Encrypted: i=1; AHgh+Rr1su7ZFxKO8wkHqbR0Yx0MZKBODQbBoOG+jeo2hFqcdF+BQjq5zfAFIF/P+Vzj82KBiIa+yX47eabKlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kdEVmHCoe5ePCLlZZq07oECmkfmO6DwCKCBT0daZwPWw3q0ZKn
	Q/ngmNW9PA2SiFd6HPqbdIaiSNOgmgIxVyyA1YKDT6LWGc2DWVaTWoaq
X-Gm-Gg: AR+sD13EQ3wAnSQ3TwU80GMrIAJN57Q1oaqra8cz7pi6XKU77YupPDz+BeZ4+isT6p8
	zb0VkSFqDB938L6nj2x2rpDkFwY2auY5m32ZRJJlo40pPmj2hhfh+GngIobVDgTa8bPRjkEWwhU
	Xzt3GtQMKHsnPg9frB7HlmUoApI7dThfTgPIxRUF9DMMULpspAJF8YHzDAsku/bs+LVcMoKCoJb
	na4alpnIjVg8rpCGgu8dHL+7LPDWExKk/LlBiXrQPWDtIspow6gKGgT/gG+r/OjR2knQw4LrInz
	BIMPftFqcAUBahMfv6tqP7O0hVkN5h35Ca9RPWf++rcc+j1xd1nDmQWGZnCrMsw2LQcatD7xI//
	C/p40XJSfBhqUrwag477BXNP3KDv08zrpXfz12DKsfHGvH6BaUUgC3trdQzE5J6Z9XcCJCys7ja
	SHoBELSVJPfeufSMC35t9rFW7q8arJP7C+i+5BBzj/YH5aTgfbfZRDyyFzsYKE8Z4g3NcttEisS
	OOS4yQRtXJzo7gp+02YKYxWLLx9fwVseFe8JUVkqtlWVCiccfkxI98HjlTV
X-Received: by 2002:a17:907:b041:10b0:c25:2de6:f063 with SMTP id a640c23a62f3a-c252de6fd5dmr477114266b.5.1787767569865;
        Wed, 26 Aug 2026 11:06:09 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm700097766b.43.2026.08.26.11.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:06:09 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] ALSA: usb-audio: the Topping M62's vendor controls
Date: Wed, 26 Aug 2026 23:06:07 +0500
Message-ID: <20260826180607.324604-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825111239.24834-1-mikhail.v.gavrilov@gmail.com>
References: <20260825111239.24834-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found on my own bench while chasing something else, and I would rather
bring it than have it found for me.

The problem, as a user could see it: after unbinding the vendor
interface by hand, the driver keeps writing to the card. Reads stop --
the control freezes on its last announced value -- while writes go on
reaching the hardware, and the two-second keepalive presumably goes on
with them, into an interface the driver no longer owns.

  # echo 3-1.3:1.4 > /sys/bus/usb/drivers/snd-usb-audio/unbind
  # amixer -c M62 cget name='Mic-1 Analog Capture Volume'   # frozen
  # amixer -c M62 cset name='Mic-1 Analog Capture Volume' 50
  ... and the gain really moves on the card.

The sound card itself survives the unbind untouched, which is right and
is the good half of the result.

My reading of why, and I would be glad to be corrected on it. The quirk
claims that interface with usb_driver_claim_interface() and marks it
USB_AUDIO_IFACE_UNUSED, so usb_audio_disconnect() returns at its first
line and nothing ever tells the quirk to wind down. Meanwhile
usb_interrupt_msg() takes a struct usb_device and an endpoint address,
not an interface, so losing the claim costs the driver nothing on the
write path; the read path dies only because usbcore kills the URBs on
the interface being unbound.

So the claim is what keeps usbhid away, not what grants the right to
write, and the two are easy to conflate -- I had conflated them.

How reachable this is: only by hand from sysfs. A plain unplug takes
the whole device, and there disconnect runs on the audio interfaces and
the quirk is freed with the mixer. I have not found a path that reaches
it in ordinary use.

How I plan to solve it, and this is where I need your word, because the
change is in card.c rather than in my own file. An interface the quirk
claimed is marked exactly like one nobody wanted, and those two are
different things: the first has a driver behind it that should be told
when it goes away. The shapes I can see are

  (a) let the quirk register a small teardown callback at claim time
      and have usb_audio_disconnect() run it before the early return,

  (b) give the claimed-and-used case its own sentinel instead of
      USB_AUDIO_IFACE_UNUSED, so disconnect can tell them apart,

  (c) leave card.c alone and have the quirk take a usb_device
      reference plus its own notifier, which keeps the fix inside
      sound/usb/mixer_topping.c at the cost of a second path watching
      the same event.

I lean to (b) as the smallest honest change, but this is your file and
the sentinel is your convention.

Whichever you prefer, I would rather send it as a follow-up once the
current series lands than fold it into v9: it is a separate defect,
it touches a path shared by every quirk, and stirring it into a series
under review would make both harder to read.

Mikhail
