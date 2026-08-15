Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E833F8BE
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793835; cv=none; b=NG8JdrorkGIV8Ot2fuYbEX2zIx2aLoPMKPOI9dFcFnsBdY+xYQwM9jB2uDC4mxjkk9GloiwjzmBF89Mdq52OdYpza7UFCK+7DtCTuRiBa2orlBhdd99vlKaDY6E1/RkBIbdNHWGM4LeTxNI7LL/g2GHC+Qi6fvBxXf/M8zWPBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793835; c=relaxed/simple;
	bh=XEgQqbiRXVxJ/FPzW15TI9nxEJBrjTusfFat44XoyWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gWkR3MYI2/fSfeGpzrIJ/qaBteoWtyYi9N/oeNye3x9gc8lrzgwb8gfFF+oSYs8nbAVDgIsn0+tuSqdgHEnFHsREPtNEi348wQ63RjR6HdV7eWVt3RZ5siMQcVp/ozWIst94hVsDPYwBYNNmgv9iKXyXXCrMszLhHvkptrSWCss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db5qj6aP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db5qj6aP"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aec6360133so1391284e87.1
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786793832; x=1787398632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38svDrdDTH5LRcULGR4lU3k6r3z68I+cAJsCHwGxwYc=;
        b=db5qj6aPbqGKD2B0UQRnMKZ4gMa4BLXXMYTZDlEuR8J3rWrzv+tXCulEkpoa6LQeoq
         fKf8GFBbyAuYJH/nJtjvc2l/c10XbFjPmldYwYBmfLYwzWjgZbTfhJ/Lzeiz11kby+4/
         2sLommGsOwkHdKdy21ee4YqISHouR+8xdYj/yzKey2wg3r12OpfiBDwNk5w/AZk6yTz+
         xaGkOVYNwncIbeFRJi4VmVtYLq0OAXjSQd8noqoHm3pgwB1SSVz0QLRP0jMhtF4/DLwW
         sHtWYyR/QU6+O5I8hbsxZ0YymtRodn7DVXLB0AhxHk/ojglmdHF3NVmcG1nOTB9bb5CN
         ErTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786793832; x=1787398632;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38svDrdDTH5LRcULGR4lU3k6r3z68I+cAJsCHwGxwYc=;
        b=YgY+06eAgsAf1LCr1FuyBKfxo5mmEUyhg8dG7hXZnMT5TvbgnemuCyU1MfVI2DFtCt
         IBFjgcPjKcune0zzeex36xVs/HIQ5abi7V6HzzeDN0XR80RLDzkt9OyuDrvc+NFD8YDb
         wyOBstbH7crW1k4Gd9K7+Nhap1nogG3vrxlmw4chIsRMigV74Zl4IYzTalDgZ8BR+nJk
         QXOdijG6BJp8FHm8X2J9jn0WO8LOXKV1R4MNywkBzbhmX4A61vFZbOt1mP52kvSspcL0
         GMLHN/adwMfpIV5OTutCgNXtJMvEd5K0YWndkx6loQkjoSg9j+nK91Ty2FyKQUoDOvsk
         Y7Sw==
X-Forwarded-Encrypted: i=1; AHgh+RptQ9/D9AGO/WU6F33Au0/dHYQ5g1Bmvz3CJ3Uic9GVqIUnH/2b6dg8aOdWcdZlM5ejXMljsAT0dva2BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOfCb+IHvvRf6BnSr6tMkM6odRKEUptFEuB82YR8oadLWI7jKx
	iQHDxJ1aBsswx8bfRyGpQhz5o2TL6VWO/6y9nOXzT5lZdCNSSvrgnZ8q
X-Gm-Gg: AR+sD13TXYgmYAq37bti7SdTo8Rd+x2jzmIez6WQ9NO+/OXC5wz3IROGBb1Cmhx2zhO
	EnXD7cZdYY+mp/dGFGRIflEfNdVmlbNCHMJZUnHy5j8oPFuna6pinyExWeoS0T0rrKBxNw0epd7
	FUfsmOzHGH7SXXhxv7arvL9tDgBLbtbWa0752xddxqeScqYZfi19HonaUTwRV7KROlIa7ytokuM
	lrmcAI1G6Qv5yc+08mOt8wsbWjNl02kYdwEDautDYchRfB/3gfzJrswBc4hBiiyhM5OJ+IhKzY0
	co8RZUhPbOJE4VluwacP9iqaRiPGFIvIjmPt/8U+qhdHW3nkMRKKAin9htXDuS1HK+UK+TtQOgv
	nY/bUV3LDSg+7Vci1/2ruqbc8D1rWT5lLtLmQN00me+/faH1Y8Xk6CtINDQeo8JWTk9ugXLVk3d
	FqMUcq5bayYBCFfi4MtjfFKTq9f3UWC4bsIfh2cq56UKzo5lpP4HLgSpz4k60Tdd+Yhw5irM8tT
	C+P45PzuTO2vQ+1c/mJKaht3KpOSqgYGA==
X-Received: by 2002:a05:6512:6683:20b0:5b4:5880:b50b with SMTP id 2adb3069b0e04-5b45910adf1mr1241869e87.4.1786793831594;
        Sat, 15 Aug 2026 04:37:11 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458c0a7fbsm1129279e87.71.2026.08.15.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:37:11 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: tas2783-sdw: do not cache read-only
 Controls
Date: Sat, 15 Aug 2026 14:45:00 +0300
Message-ID: <20260815112500.4362-1-andrey.golovko@gmail.com>
In-Reply-To: <e3103067-f8ea-44a8-b430-4abb61e45d6e@sirena.org.uk>
References: <20260814094000.22118-1-andrey.golovko@gmail.com>
 <20260814094000.22118-3-andrey.golovko@gmail.com>
 <e3103067-f8ea-44a8-b430-4abb61e45d6e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Aug 14, 2026 at 04:13:42PM +0100, Mark Brown wrote:

> Does this work for multibyte reads?  The regmap has val_size set to 8
> but some of the read only registers are multibyte.  For SoundWire
> val_bits doesn't really matter so you should just be able to set that to
> 32.

It does not, thank you.  Twenty of the Controls in the list are wider
than one byte, and with val_bits = 8 the MBQ layer refuses each of them
before anything reaches the bus, so the patch on its own would replace
an answer from the cache with -EINVAL.

The widening is a patch of its own because the calibration write relied
on the old width, so I have sent both as v3 with it in front, against
for-7.3:

  https://lore.kernel.org/linux-sound/20260815112000.4180-1-andrey.golovko@gmail.com/

The cover letter has the list of the multi-byte Controls and what the
two patches were measured to do on the machine here.

One thing I noticed while checking the sizes, unrelated to this series:
FU21 0x10 and UDMPU23 0x06 are in the read-only list but appear nowhere
in tas2783_sdca_mbq_size(), which returns 0 for them, so
tas2783_readable_register() refuses them and they are unreachable
through the regmap in either direction.  Harmless as it stands, nothing
touches them, but the size callback looks incomplete rather than
deliberate.  I can add them, or leave that to TI along with the rest of
the reg_defaults questions I owe them a mail about.

Andrey
