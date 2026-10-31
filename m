Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456158;
	b=HCbXlvfRgiyjEIY7K1dS2/7s3qomGXybsfFulb9mVZuFuUwcq+wt6gxrB/3esY/nStlw
	 1F1Gp2BC9nM4WWzy/Z3vToPvLFefE3ZAT3zhtRhYv7GcCUfjJoLPp6w0vua4s4FngaSct
	 ZPkNIY7wUKxZ7xtB1f7PkKSITdpbdmiLbfrlEI7Dyg1TvhK5exkYiJ+6PBoZI+mMgmzzE
	 XCfN57EsQlEpm25RMbUDGnqKNg4FX3Tz4C0fM7juAnsT16B9Jy9cv5XeEuxG+uxqAMUiW
	 BDzg2OV6Mv1P07frii5Fq4ySoQ3ClPtxhgjwfjQquyneH4EDCE/JXyOU9yeUgnVCahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
	b=NSIQeGjMedaDQNXU92r5MvwPsVq0iz6ZUTbbu5/RvkqluZsSPYO9htGX2B+8HdvJNNlC
	 7kNzt5tFSK5wTAbiFhcLQjGJEBCNZZBA29QRIFLOYlQqhmjfZH7550xfJeS2mZdwfAOrZ
	 wC8ZNG5ORDQZiLzd4t8DLhrcyffB4G48UvvhmE4z9SPJqL3PKxIEeRq26pIEnIIL5tQxo
	 E8vDGBGVC/e7u0eOEkAgujRe1egPyUgGtX70rlnsZz54wZ9eHX5Ke/nQWhuqizpeuNISQ
	 dQ7VwrwfYp7CnsMvmPY3vLQJA3oX0+w1HlWhVAwmoear/FlTHyq87I9HTtxK52LPCoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK25MfUb;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E35606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 14:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E35606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IK25MfUb
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8246b13cbso13951065ad.2
        for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456157; x=1794060957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
        b=IK25MfUbibJHZUCnSy2S2WtN6BBRl4Wc0Ck8mJ2goevSyMxcRwogr+b0tBucuBqDir
         viXNGP5/fkKG65t/UebwN5ESDx3o9MkaCjiN+I8661dR4ti74jf66KO69msGBzQzfVNh
         Lc+oueTWrXa+fTRTWK7tpTHHo4R+TOQfoIYojkroNPSBvrwchRzlwAGgEJoWrfWm9lkP
         9wna8rK3tDwdZDhgd1beGnrlMF7A4DTG3DubG4jSwjKtJ7DZ3ArGCKIngcvwgJhb2+kO
         AVZcVTl958lPkczzXxQCZpZzfY/+fYk/fwqcjTLKHtzwm/5o/BYPmOAV/slCIuEjvEoF
         sTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456157; x=1794060957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wnbq5enmeXXMtrxXOCknlMCahlJdLBMQr0NRDI8YZbI=;
        b=gxB25GAQaa1IYlbAIjcbgYDSHoD19aRTj8s3dhDBDQ9CvfOw0ug9umtGNk2RKQWWnA
         bJL7RwMVb6LDiw+ASPiBGofLnhfqcormeazH/mqS3IIWcZQy+35m3pGVF4n7DmJzRjNF
         hp+2hRfPlmJ+AjztCM2h7QE7OByA1ZUjuIuZfEdbnoCvyDRlFK4M185vKCoZsD95bd/I
         TukTy9RZAEM4/IrLXU4iKpqIjiVfr+3B1bmHvkJyfT00SbFdYXbMbSwtTJLWH+WHNmyb
         MD0a7fP0VO8QKn0ufs7ZrU7x/z0gqW+p00H0ratXzWvFLSR8mKTPr6+U2e0M7Ia/YUb+
         ZXXw==
X-Forwarded-Encrypted: i=1; AKwUvBxZpFezE6wXSYikCJiGpgOBWzpjbDqMv+5+L/WmVB0tMswh2abRg6CRgkg37k0UywqQz3iUQqslLj2kEw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJn7mOpNw39xQOKiwcmHDfh2idinguUcrl01BIi1IK4DxL2O/7U
	0JakD6YgoCEtkupVPCyYR2K0DaaMyTvtaTl0wfJgjSPiAUATe+KestDv
X-Gm-Gg: AYBFou1D5O5UX/NmSuJyFsgM3mWGEnuDY+NJzZFk9w1kyqOHwnfQlIDskLDCNYWvjYl
	3A9sypf0gD0Rwf+CLGsvwOehF8S1dkbDaABcBv8MA04GA4DtW/DhpeLK4NafBIA8UkEr3KJkgcs
	BbarRpcdhtTNSRntNINMRPdGV1dcwZTmbhcm8Lv0rumzJnU5EJWScA7F+ucKqSy97k005yiznCo
	nL0GOn6aiqL6JR+w99Ms9apwclkF4x9vXHHCyo6WydgSbRAWX7plGFjo67lvH85uXcCCzWKwYaZ
	zAtQWMKkO8zPwcWL8n/8ad/d3snBo1KvTDljB3sSFvztQYt2qNwC0Bu9rToNCb3mBdNzAKXnKHB
	qjivg2DZcbXf1x/9xV9s6MrAjpLdRiHid/UOsU5EkDUVYKrGp9jHB39bN/lkMxuIVB6MeFAnFjw
	COcMBNAd+IdQyB/aqpZar7JdDIiAFI2ds2dmDUYm0YnpPuxKZX6nG4OmSqMd5sLu/6SnV9LeJCy
	lA7i+f9FuK+BqC6gEM9gJ51E2VFXY++/HZHU/nGh/YRFL+2Smpqw3LVkkars2pgese1Ve6EvcL1
	Kss4DpONramN5z93HJEhU4/u3ctfVXKlXLToQ4FC
X-Received: by 2002:a17:902:f548:b0:2e9:572a:7da7 with SMTP id d9443c01a7336-2eb364f1979mr52661215ad.49.1793456156941;
        Sat, 31 Oct 2026 07:15:56 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb38e9633fsm15743805ad.0.2026.10.31.07.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:15:56 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: broonie@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add support for Everest ES7202 PDM ADC
Date: Sat, 31 Oct 2026 22:15:46 +0800
Message-ID: <20261031141546.153385-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179330018771.62540.301527067818961107.b4-review@b4>
References: <179330018771.62540.301527067818961107.b4-review@b4>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for your review.

> > Add support for the Everest ES7202, a 2-channel PDM analog-to-digital
> > converter controlled over I2C. The device outputs PDM data to the SoC
> > PDM controller and is configured through registers for supply voltage,
> > analog front-end and per-channel PGA gain.
> 
> This looks pretty good, a few relatively minor issues below but nothing
> major.
> 
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -1274,6 +1274,16 @@ config SND_SOC_HDMI_CODEC
> >  config SND_SOC_ES7134
> >  	tristate "Everest Semi ES7134 CODEC"
> >  
> > +config SND_SOC_ES7202
> > +	tristate "Everest Semi ES7202 CODEC"
> > +	depends on I2C
> > +	select REGMAP_I2C
> 
> You should also add this to SND_SOC_ALL_CODECS.

Added.

> 
> > --- /dev/null
> > +++ b/sound/soc/codecs/es7202.c
> > @@ -0,0 +1,367 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2020 Everest Semiconductor Co Ltd.,
> > + * Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> > + */
> 
> Please make the whole comment block C++ so things look more intentional.

Done.

> 
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <sound/pcm.h>
> > +#include <sound/pcm_params.h>
> 
> linux/of.h and sound/pcm_params.h aren't needed I think.
> 
Right, both removed.

> > +static bool es7202_volatile_reg(struct device *dev, unsigned int reg)
> > +{
> > +	/* status and device-id registers are read-only, never cached */
> > +	return reg == ES7202_CHIP_STA ||
> > +	       reg == ES7202_DEV_ID1 ||
> > +	       reg == ES7202_DEV_ID0;
> > +}
> 
> A switch statement would be neater and would probably generate
> equivalent code.  Are you sure that the ID registers are actually
> volatile, that's quite unusual?  If they've volatile the hardware is
> accessed on each read, if you just omit the default then they will be
> cached after the first read.
> 

Thanks for catching this. The ID registers are static and don't need
volatile marking. I'll drop them from es7202_volatile_reg() and use
.writeable_reg to make them read-only, so they are still cached after
the first read but skipped by regcache_sync().

> Also should the rest register be uncached so we don't try to write it
> back out as part of a cache sync by mistake?
> 

Agreed, I missed this. I'll mark ES7202_RESET volatile so it can't be
written back during a cache sync.

> > +static const struct regmap_config es7202_regmap = {
> > +	.reg_bits	= 8,
> > +	.val_bits	= 8,
> > +	.max_register	= ES7202_DEV_ID0,
> > +	.reg_defaults	= es7202_reg_defaults,
> > +	.num_reg_defaults = ARRAY_SIZE(es7202_reg_defaults),
> > +	.volatile_reg	= es7202_volatile_reg,
> > +	.cache_type	= REGCACHE_MAPLE,
> 
> I notice that other Everest devices set use_single_read and
> use_single_write - especially for write we can easily trigger
> multi-register write as part of a regcache sync so if the device lacks
> support it'll create bugs.
> 

Thanks. The other Everest codecs are the only precedent here - the
ES7202 datasheet does not document multi-register (auto-increment)
writes, so I cannot rely on them. I'll set use_single_read and
use_single_write so a regcache sync can never turn into a burst write.

> > +	es7202->supply = devm_regulator_get_optional(dev, "vdd");
> > +	if (IS_ERR(es7202->supply)) {
> 
> Unless the device can operate without power this should be a normal
> regulator_get(), the core will substitude a dummy regulator if it's not
> configurd by the firmware.
> 

Right, VDD supply is required. I'll use devm_regulator_get() instead.

I'll send a v3 with these changes.

> -- 
> Mark Brown <broonie@kernel.org>

