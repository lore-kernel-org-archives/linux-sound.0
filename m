Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86504078ED
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568229; cv=none; b=Xc7fCl6eDlpxohlr1G1k6JgZb+eOp416gCvTIgx0yCvWiKRPhmiZx1E+VaGFm88M46jO+e4M8N95HFvS2lduHrDnoGQCAV5NUWSa7+B3RXxFVTS4WxWT/UkWbUoynjIsRF87Vb2sF5Il/wekQKZa+r5eiZPZJic2KhMo++5a3nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568229; c=relaxed/simple;
	bh=4hCUPygQvRVQc7H6VMaOqe0Pgu41CmYSKLKoTPCBLGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X7FRwWUjHmYFWiL3I4X3ou+RSj82FLS/wLGTzsUMufViOjR8PoJlJ4r4ZF9bg/WT0Z4Flwcm0mqfpJ3Zj2c3FfG186ISC8RuC8xaYcZ2Lqa8UIX00z0ghqn3VVcrU4QbqeExWgKDQ9WvCWk86GOWKAU3NQf9XnVa2gaSK5HWIDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8qfTHmy; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8qfTHmy"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aebd52488cso3104789e87.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787568226; x=1788173026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mp0af4PAysHBhjI3rbRC8vY2ipCSLq82vRcjSVEddA0=;
        b=l8qfTHmysYwj+787XRTLVhbEa5x1a70u96WSDiiJRPDac4TcAKMevZbDl/Jn/9Q6Yt
         wrBrtX8m9CPf/m3gRiG62J21YH4SRVP/GyjuXu2WBTSnJ99KEHfT6j4PAmsGW3qGOZct
         gFCQiVkieu2RRn9wgFmebDxvhpuuroEjdwdorNZCBelUffa+QgrpxVCvDkZv8vVUCJQx
         HTIl+oJ7FMK3UCe9svtUzmxUYhYN3vHSiLj25yyBs/bWQb+QzrqJ+t//JI2u2n5oAr/G
         UPxtjYT46oG0BVI8yRqraf7SscPp6rNAZBtbAVmtEKhtyBlf4JD4gRUXfx1eC4sZel/B
         fCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568226; x=1788173026;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mp0af4PAysHBhjI3rbRC8vY2ipCSLq82vRcjSVEddA0=;
        b=njD/R8Z9QGtGcvqbzIZrREyOkfo0NejzkIFmxSveDWOPwY9mmELlrVRIh1XjDg5cNj
         ToWf/bffiq6JTJ0BlcD1QOrKcSTd2JxO1Rub9ql2eEMCYjY0FNaKf52MA4F8XS7VD15s
         yAp7XEOYNgV6dhwuowcw0E8oLBt2Cw6LaUHZ/Rytr6fWKtUpt+V56igd/ROGK02Ztaz9
         HURacJDXjP+M/3pZbO7v4s2VICH0a7v2Me0EzDTHCWcSKh/h5BGvLTl8oPwPl3Jhtksd
         ec+fp6Pzh2ZMBh2BVeCusFIpqohI2RmSz4KMNWyfUqFE7OF+2VhUU6iFvM7HKRVug0Y9
         Dgkw==
X-Forwarded-Encrypted: i=1; AHgh+RoDFn6D4dX2HFAuxHDePhimK31Ga8rTgjBrCdvTuJRkN+2JcisWf6krT+ak90IbpntnvzsQ18RYKOgq1Q==@vger.kernel.org
X-Gm-Message-State: AFuF++m5iPS5PoUAaU1GGowxOZCm76x6j8cSLPj4fXQY9LSocfNFuSUS
	uRL7eQEobx5rnRonn2jPXdU/m76hj+38JK4rzYrok4nVE7J/DJ7fTFPh
X-Gm-Gg: AR+sD11zkRrWbjfwkK8zpd4jRWFsUcg5+ChOTeTF7BHkJAcH3jiql7b1sL2yZDsUCZo
	g8vGl8j1aadD4nF+tMnuu14p3b1hNQougvbrIMao/inQQg6i7FRhP8q978KjRpWTB9wN+hVzshV
	AVGnS317E8R5JpeNWHkS/Tqw87sSGA2v1oe9ee5Ilbk+yiFgkfme2MJd/MiezGSQwhvTAYGuFRu
	3UG4BMpMDD3xc+Iu0JBdS/AIMbYUVvT9PwvJTjDoAL6A9qWJk3B68HRqMso0tacqRmlPoTEq3XL
	GiUD3mQYQCmP9fa+9WpaZdjUkkwsZ9KI+C/hap5Rn5Sbf2Nc4Cq1zlGW4t0oQgpbDuK5ST4EyiI
	NYmCVjbfhxJLfWNwos3V0MXdQVMuFvLdXhasgOOpxmmaufKXtslDtLcXHW++0Y4V9y/o9lZEmLe
	8AMoj1LQ8If/gNaSBHcqD/QGZ6pgQgt0ER0xUYpBpDpodTwu0q0A/iEicXKfU8zsWepRhetIqg2
	fS2BQ5PK+cxS+K7Ode5xMg=
X-Received: by 2002:a05:6512:acb:b0:5ae:c542:33ef with SMTP id 2adb3069b0e04-5b48b67ee00mr4624469e87.8.1787568225387;
        Mon, 24 Aug 2026 03:43:45 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce06960sm1650586e87.55.2026.08.24.03.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:43:45 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: tas2783-sdw: questions about the register tables
Date: Mon, 24 Aug 2026 13:45:00 +0300
Message-ID: <20260824104500.7588-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Working on the read-only Control series [1] left me with a set of
questions about tas2783_reg_default[] and tas2783_sdca_mbq_size() that
only you can answer.  They are collected here rather than spread over
patch threads.  Nothing here breaks anything in tree today - the driver
reads almost none of these registers - but the tables, the DisCo
description and the part disagree with each other in ways that will
matter as soon as anything does read them.

Measurements are from an ASUS ProArt PX13 (HN7306EAC, BIOS 307), two
TAS2783 aggregated on one AMD ACP link, reads issued with
sdw_read_no_pm() or through the regmap with the cache bypassed.  Both
amplifiers answer identically unless stated, and their ACPI Function
nodes are byte-identical.

1. The tables and DisCo describe different parts.

   The platform describes the Smart Amp Function in some detail: 27
   Entities with their Controls.  The driver ignores that and uses its
   own tables, so the two can be compared.

   Entities the driver knows that DisCo does not describe: CS24 (0x05),
   OT24 (0x17), OT127 (0x1E), CS127 (0x20), MFPU21 (0x22), MFPU26
   (0x23).  Entities DisCo describes that the driver does not know:
   0x0B, 0x0D, 0x1D and 0x37 - 0x0B and 0x0D look like two more Power
   Domain Entities, each with Controls 0x01 and 0x10 like PDE23.

   Is the driver's table a superset written against a different
   configuration of the part, or is the platform description short?

2. Latency Controls.

   The driver's read-only list holds 21 Latency Controls.  DisCo
   describes exactly one of them: FU21 0x10.  For eighteen the Entity is
   described and the Latency is not; two more belong to Entities DisCo
   does not have at all.

   And FU21 0x10 - the single one the platform describes - is one of the
   two the driver cannot reach: it appears in no case of
   tas2783_sdca_mbq_size(), so the callback returns 0, and both
   tas2783_readable_register() and the cache refuse it.  The same holds
   for UDMPU23 0x06.  The other nineteen are declared four bytes wide
   and carry a 0x0 placeholder in tas2783_reg_default[].

   The DSDT settles what FU21 0x10 is: access mode 0x05, i.e. DC, with
   mipi-sdca-control-dc-value 0x0.  A DisCo constant, as Charles Keepax
   described - hard coded in ACPI, not implemented in the hardware, and
   normally given a default-array entry with no readable/writeable case
   so the constant can still be read.  Which is the one shape the driver
   does not give it.

   But that only covers the one.  What are the other twenty Latencies,
   which no DisCo entry describes and which the tables answer with a 0x0
   placeholder?  Are they implemented in this part?

3. XU22.

   The driver's read-only list has XU22 0x06 (Latency), 0x07 (XU_ID) and
   0x08 (XU_Version).  DisCo describes none of the three, and XU22 0x07
   answers COMMAND_IGNORED here, powered and unpowered, on both
   amplifiers.  Not implemented?

   Conversely, XU22 0x09 and 0x0a are in tas2783_reg_default[] and in
   the size callback - 0x09 as two bytes, 0x0a as four - and DisCo does
   describe them, as constants rather than registers (see 4), even
   though SDCA 1.0 section 6.3.10.3 defines no Control Selectors 0x09
   and 0x0a for an Extension Unit.  What are they?

   XU22 0x12 (FDL_MessageOffset) is described by DisCo and still answers
   COMMAND_IGNORED in both power states.  (Before the regmap val_bits
   widening in 1/2 of [1] it returned -EINVAL without reaching the bus,
   since it is declared four bytes wide.)

4. DisCo access modes disagree with the tables in both directions.

   Reading the access mode of every Control in the Function turned up
   Controls the driver treats as ordinary writable registers that the
   platform declares constant or read-only:

     XU22 0x09, XU22 0x0a   DC, dc-value 0x0
     UDMPU23 0x10           DC, dc-value 0x1 - the driver's default is 0x0
     SAPU29 0x10            RO (Protection Mode)
     XU22 0x15              RO
     IT21 and IT26 0x10 and 0x11, IT28 0x11, OT25 and OT28 0x11,
     FU127 0x01, 0x04 and 0x05, MU26 0x01     all DC

   Nothing in the driver writes most of these today, so this is latent
   like the rest, but tas2783_writeable_register() would let a write
   through to a Control the part does not implement, and for UDMPU23
   0x10 the cached value differs from the constant the platform states.

   One more of that kind, outside the read-only question: FU21 Channel
   Volume 0x02 has a DisCo default of 0xFA00 with a range of 0x9C00 to
   0x0000 in steps of 0x19, while tas2783_reg_default[] gives it 0x9C00,
   the bottom of that range.  Is the table value deliberate?

   More generally: the kernel can parse this description now.  Is moving
   the driver onto the SDCA parser, rather than maintaining tables that
   have drifted from it, something you are considering?

5. Placeholders for state readings.

   PDE23 Actual Power State has a default of 0x3 while the peripheral
   answers 0x0; SAPU29 Protection Status has 0x0 while the peripheral
   answers 0x3.  Both are cached, so a read returns the opposite of the
   device state in both cases.  Patch 2/2 of [1] addresses this by
   marking them volatile - is there a reason the entries are there?

6. FU23 Mute, channel 0.

   regcache_sync() aborts there, at 0x40400108, every time: the default
   is 0x1, the cache holds 0x00 after bring-up, so the sync tries to
   restore 0x1 and the peripheral answers COMMAND_IGNORED.  Being the
   first mismatch in address order, nothing after it is restored either,
   so a sync effectively does nothing on this part.  What is the reset
   value of the FU23 Mutes, and should they be in the defaults at all?

7. Calibration register width.

   tas2783_set_calib_params_to_device() wrote each of the five
   calibration values with regmap_bulk_write(..., buf, sizeof(u32)),
   relying on val_bits = 8 to spread one 32-bit value over four
   consecutive single-byte registers, most significant byte first.  With
   val_bits widened that call would mean something else, so 1/2 of [1]
   writes the four registers explicitly in the same order; read back
   over the bus, the five values of both amplifiers are byte for byte
   what they were before.  Please confirm the layout is what the part
   expects - the tables declare these registers one byte wide and
   nothing else documents the order.

8. simple_ch_prep_sm.

   The platform sets it for DP1, the only data port these amplifiers
   have, so the core skips the DPn_PrepareStatus poll.  That is what
   made the resume failure fixed by 119046319e77 silent: the port never
   finished preparing and nothing in the kernel noticed.  Does the part
   implement the full channel prepare state machine, i.e. is the
   property right?

9. Power symmetry.

   With 119046319e77 the Function is powered up in the port PRE_PREP
   callback while the power down stayed in tas_sdw_pcm_hw_free().  If
   you would prefer the two symmetric, moving the power down to
   POST_DEPREP is a small patch and I am happy to send it.

[1] https://lore.kernel.org/linux-sound/20260815112000.4180-1-andrey.golovko@gmail.com/

Thanks,
Andrey
