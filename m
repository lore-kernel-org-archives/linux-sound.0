Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D2348CD55
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647124; cv=none; b=mzmjMORJDqY6jQCiVdQt2hrWGt8vEUYs1naMZCIMn/gh+dJaI2+o5R3qsTymG3trOlx1fk3sOCcvb68lUeUlgavqbrOaw2OZs9vEqmU4XPgKu83Iz3eWY2TAO2DVCtxODsgMFvLM05gqhFh0n9N1abKWXJnS5xO6NTpBa20ZFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647124; c=relaxed/simple;
	bh=+ev2FUz3bPej3RBvElxc23c3IPg0tndhhC8AhoyMM6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRvvOsgE08YR50HcmwK41/bnoItLrmzCK2ZsTK0D1ia0oT5A0zP2CF5gQWMz0Rwi0jiGtSbEWxvEXZy87GcKlGXVLiZy8OsrTRrWM6IhRnIRfOBYCoDS8WyjOYTsX12GuERnwss4hgWqHV3c1y6TndRNsBAHtcp0kSiSVVn9Af8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHxvzA1Y; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHxvzA1Y"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so1277381fa.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 11:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647120; x=1787251920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKNdUQDCpZUYwaFP2MsaaOwNTGfv8WXCUT66IRNuzNA=;
        b=fHxvzA1YCd5oOYhbugyXOfcBqka+V5JOpfl4lMW16yxZ2ahmq0D+yE8s5MMEoGIsjH
         UP5BxV2jOOntJ4obYJ1YXQ/oMWodqv+S/fssory763RctiFJCB8LGuBox2YPFJLmxCZI
         9ud/gYG6R455fa+VqnnmoFGbidl8m1i11LCqUSUXBEu2ACdQ5VWowQq/4zrjd87bI6jq
         DmJLz523caXVwFpp3BGLgxyFQn6zRgoI8BtuH0D0SGv0RKBwRWTzOu+gNMv2H/00MoyJ
         06mf9imLPt72BT8cdVF/nb1jyEtWwLjwWQ5PIoOhtO6SvIRY/4ZOp/uLMAI3ff8CHqfN
         kYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647120; x=1787251920;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKNdUQDCpZUYwaFP2MsaaOwNTGfv8WXCUT66IRNuzNA=;
        b=SnEKvrgrKZ6mFFTRa7B25AyJLsluAXeN7wiXIOO+DYRdLh2j8SewhynF3ogkhJ8Fp4
         I0VZM4fEtKsJXCwdzMbMlLX5o3jVGLyVF5x/O5r2RwZ8oJhw/CsMtqgAbZRK74K0UIur
         UQDSy1cje81sgbsFMTFhb96wB0/ii11XWVoD9H+Zxuz5DpN15ANwDOz0FKkeKSpJaLPC
         GGPWnB5pI9egZoNEbIJS9MgDd/qJ/NZAe/NCZL6oi4KduGj7TqPCmy330aUqs2DZBapo
         fpebVzEx6dIizVqT1gnaUPHbugqEXnEjRm5hKpIlDcbuKHHAUHZ9/ObeGhFwUTIQ8Uqg
         rMcg==
X-Forwarded-Encrypted: i=1; AHgh+RqfS83/R5zcQIrx1DTyO1TjA/CWKSdD+C5UWmwWo4SI6brVbCL1uQx9Ank1oMUuD9iu439XvwoaOa/eMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQh6/pmlzVMgyiSOQy11Tl7trL5meZ5zwxkizkzHttcIckqc8R
	/sljmxsZVERsMqTp4uIGaGtF41NPRAMmKDf9gghTqc/jypA1BJawAWp1
X-Gm-Gg: AR+sD11VUf34lCbn+sqZFkkhOoszjstSXSZiVu3MQ80FTmcGwm3Ij7VElq7RO60XCvK
	50RhTrGrKzzYqsbpMubxBtuM4RdgfCMU0Ot/HoAns+hh9GHAX+hj/ks7G5SmmRjND8c4dxGBLUK
	SqpimGefpVQvrovHxYmrY4YYJt/IwXfDS6wlew9E4yjGBFHk+i2byefzgt2Moc5D4YTdWtcpmC9
	7HUMch0bBUKg6DkJf8auABSZcqhEbepoA3hsImKzzCFOLoj2G3hNimZHYqR2XvlQ1F9b8qceD+D
	AXWhR8X7CGrLoDqyJy6XLiCPiO9lxe3gnOttu4LqXLHWldAAVRRy1M6+WaaVhQ39+A9eFFD3wHo
	LMZIkIYNmXEQJ4/yH54f4597PQO/Q2dJu1aiUv8IwNM4baZ3vMby2n1pJ9rC3mmiWGPGfvSqluq
	tbZE8KgYCrPibEkaKcNh926vVV7iuK/wJT3cISQzWVjldxBu/Wpc1XjWrLv9wrvV3/mSZEshTuK
	norg9IxIO76sJ/3jDLDwpw=
X-Received: by 2002:a2e:a9ab:0:b0:399:767d:c118 with SMTP id 38308e7fff4ca-3a1327cb611mr534971fa.23.1786647120119;
        Thu, 13 Aug 2026 11:52:00 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d23dd5sm1137131fa.42.2026.08.13.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 11:51:59 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Ville Saarinen <wiza@saarinenkoti.fi>, Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: tas2783: drop firmware-owned registers from the regmap cache
Date: Thu, 13 Aug 2026 21:30:00 +0300
Message-ID: <20260813213000.13990-1-andrey.golovko@gmail.com>
In-Reply-To: <20260812211807.59906-1-wiza@saarinenkoti.fi>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
 <20260809101541.4969-4-wiza@saarinenkoti.fi>
 <0de8a9a0-1929-4210-92dd-2376550fd841@sirena.org.uk>
 <20260812211807.59906-1-wiza@saarinenkoti.fi>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ville withdrew this patch partly because its evidence was taken on
v7.1.6, before b627da430357.  I measured the same mechanism on current
broonie/sound for-next today, so the evidence now exists either way.
Four results, one of which is his.

Method: a small out-of-tree module takes the codec's regmap with
dev_get_regmap(), calls regcache_mark_dirty() and regcache_sync(), and
the writes are captured with the regmap:regmap_reg_write tracepoint.
The amplifiers are powered while this runs - a tone is playing on the
hw device - so nothing fails merely because the Function is in PS3.
Machine: ASUS ProArt PX13 HN7306EAC, two TAS2783 aggregated on SDW1,
kernel 6f6fb37f9f9a.

1. regcache_sync() writes firmware-owned registers back to their table
   defaults, exactly as this patch says.  Per amplifier:

     reg=80005c val=1d      reg=800428 val=40
     reg=80006b val=7b      reg=800429 val=0
     reg=800418 val=0       reg=80042a val=0
     reg=800419 val=0       reg=80042b val=0
     reg=80041a val=0
     reg=80041b val=0

   b627da430357 does not cover this: it drops the cache when the
   peripheral re-attaches uninitialized, which is the S0i3 path.  A sync
   with a live cache still restores these defaults over whatever the
   firmware put there.

2. The sync then aborts, on both amplifiers, at

     reg=40400108 val=0

   which is the FU23 Mute of channel 0, and the peripheral answers
   -ENODATA.  That Control is in tas2783_reg_default[] with 0x1 while
   the driver's own init sequence writes 0x00 to it, so the cache
   disagrees with the default and the sync tries to restore it.  Every
   regcache_sync() on this driver stops there.  So today the sync is
   both harmful, per (1), and incomplete: whatever sits above that
   address is never restored at all.

3. The read-only Controls are cached, so they answer from the cache and
   report state the device left long ago.  With the Function in PS0, a
   regmap read of the PDE23 actual power state returns the 0x3
   placeholder from the defaults table - PS3 - while a cache-bypassing
   read of the same Control over the bus answers 0x0.  I have posted a
   patch for that:

     ASoC: tas2783-sdw: do not cache read-only Controls
     Message-ID: <20260813212000.13744-1-andrey.golovko@gmail.com>

   It marks them volatile and drops them from the defaults table, which
   is the half of your suggestion, Mark, that fits this part cleanly.
   The caching half is still open, and Ville's point about the two RAM
   ranges stands: page 0 wants caching, PRAM and YRAM do not.

4. Two Controls the driver declares as multi-byte answer -ENODATA from
   the device even in PS0, on both amplifiers: XU22 Control 0x07, two
   bytes, and XU22 Control 0x12, four bytes.  This looks like the
   Cluster Index situation Ville hit - declared by the driver, not
   implemented by the part.

   Separately, those two are unreachable through the regmap in the first
   place: tas2783_sdca_mbq_size() declares registers of one, two and
   four bytes while the regmap is created with val_bits = 8, so
   regmap_sdw_mbq_size() rejects them with -EINVAL before anything
   reaches the bus.  That is measurable as the difference between two
   kernels: -EINVAL with val_bits = 8, -ENODATA from the device with
   val_bits widened.  I have a patch for it but it changes nothing that
   can be heard, and it does not fix the sync - the abort in (2) happens
   at a single-byte Control long before any multi-byte one is reached.

Questions for TI, which the above keeps running into:

  - What are XU22 Controls 0x09 (declared two bytes) and 0x0a (one
    byte)?  SDCA defines XU Control selectors 0x01, 0x06, 0x07, 0x08,
    0x10 and 0x12-0x16; 0x09 and 0x0a are not among them.

  - Should the read-only Controls be in tas2783_reg_default[] at all?
    31 of the entries are readings - latencies, clock valid, actual
    power state, protection status, algorithm ready, firmware download
    status - each with a placeholder that the device never agrees with.

  - The calibration values are written as four consecutive single-byte
    registers, most significant byte first, and mbq_size() declares that
    whole page one byte wide.  Is that the intended layout and width?

  - The BIOS on these machines describes no Smart Amp SDCA function, so
    the driver falls back to its static tables and never gets
    sdca_regmap_writeable() or sdca_regmap_deferrable().  Is that
    expected on shipping hardware?

I can run further probes on this machine; the driver performs no
register reads at all today, so anything read here has to come from
outside it.

Thanks,
Andrey
