Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042A8392C4B
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783770022; cv=none; b=LyqFLPupBZsTL0czbONSOC/YH44kEvooee/peya6dKDYVJovDntpRWXYpp18sX2nTh4dwrAm6VlGm1GMsqw6szSnnLuqqCOGJCbALjKVEyZYzcI1rE4bq/uN+gL8GKpj+lUISy2ctOa1lhvEDhMe7gFIcjBTPqmoX5I9qsxknqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783770022; c=relaxed/simple;
	bh=Fpes7pcL0dT5QgBd51qJa9xR8lBSeUN8H6ipD4qzk3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQtc9ktnm1xIw6zDlt+Bbqd698buldn7jq+9wunWuyepXbWMBN3dmydnzf5nHJVZJRtTFllVhlMAq3uJd3tQHpo2pAUigeTXxhBg/adrKu5HIKOuYkHEbGbTfDBUPxlsIteNRS4LPbPVWchkWh6x5gE7Ya6x/B+3Ftr/Kwpn978=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5p8X0q7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5p8X0q7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so10465955e9.0
        for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 04:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783770019; x=1784374819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvR4npbXyTtpSmH5FcrD0ZeaPU7ANDDEoSH1ljf/gl4=;
        b=k5p8X0q7GWSKpGJbEYM3gnGqpwSZVYnOciQw8WCKF8uDkGQ6YvyvoBj3/Mr3/AEUx/
         Xigq91MfGuXu1SLQXZSonNWiEPM8gVFgi0f0IGK29+eEnL20Iyf2qBwrEJ6p9447FqML
         F0R4ySxjb94Fi+0qv4StRuQO1mDjAIJ6rfcwx92TJEXS3oikces+B+wcx38bXXoq493s
         0/pMFtHRDPwKgJDIly/V5r897ilrUDDSoCrOyLoIpvTqV2GHoVN06XI7iqVGD0pl1vM3
         NnjtJvNOvZjFYsxKtBc2Np9MY5j+3kOj1hE19HeshXQ/58cbIB5TzxQa72vFgfBDKCuC
         RfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770019; x=1784374819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvR4npbXyTtpSmH5FcrD0ZeaPU7ANDDEoSH1ljf/gl4=;
        b=aokNfOwM1hSy0w/SOTZZJ3OE/b8ugWkhDbrsD3pbabFI8PeV3i1OBu6ZYGvhpv7j0t
         33ZLcIWXzzGH8bBT1tR8IN3i75OiWZoD2nh0p8eNz57ALl2HRVJaJG93tsxCNR5guSof
         rAaWHLCky77UGAHy8SMdPDFOG3LFYdZhmo3jX4vKEuHwspJD8mEPU/lKBqRl+iQyUwK2
         jD6zmzkwx5aP7iCIqzf1ceu1pxqq6vFmLyFiJJlDkchYVqNqqwRM/BO0e7shyQNikoj3
         jbQG5ViO+zswLcLaANFocHXiqap5dFz6aNtVP9KkSYZzAnpXI+ryUATjqQa7ry4qk2Dc
         32iA==
X-Forwarded-Encrypted: i=1; AHgh+Ro78TsV7G1XnyuuZdnhA6F+6s/vD9FUFqgDf5wERbUtma7jxHRV0ZrQPWPkQjIdnOerDUEI+emGfxuZcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YztJ008khfGgf7VFQlaKC+GJ8DmUc33NBuSTnf//uR7DjmeVhQW
	KCEhktQVrahxNV9K4J3uOrQeRUwgqOdUzIZYAYgOYWeTSh7K8x0Ft9eX
X-Gm-Gg: AfdE7cm/ug/mRyp9foiu3hsMenA3Ou0uGMYEoWT3Nj2/aV4vUzxzb8oBJR4xcNl6XHv
	cblQUavrhyPKiL11kXQW+LjXcEYA6/S8mMEJ5v77kGCOjry/DiBQV6+3Oo7GOdSFq25Deckpp+f
	ASNcZU+F2Nqb1Jlf4X+TsLnIAZ9NoPT1UI2naTDWPRVfcNLhK33geia0dlWo2rLuGycm6Kpdh47
	Se3wOSZCQko9PV8lTYdHTIaucktUCQgbjzHTWaCFU+T0GM05/Gqo9honbcoNOl2ijyd1lmzBYS1
	CmA3fkkukMd4ulg2j8El7T68HqescJZUu91hF8AM4eatyZmZNPGxX76cnhCAQsCCsTEHvBibFIk
	kvEmlaTuLJWvITE75xHPUwmVhYte57rZd9C5yVHWA0Q4pgYYB5wFf7clLNVkQbtTJV/8Wpl6C64
	g5fuO1q8RzjS74Xm6mlgUpRVbxaE/O
X-Received: by 2002:a05:600c:4e48:b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-493f881ddedmr24187235e9.21.1783770019401;
        Sat, 11 Jul 2026 04:40:19 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:11:e106:f973:a70:bd1e:4000])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493f49755f9sm120859915e9.8.2026.07.11.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:40:17 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add TAS2557 mono smart amplifier driver
Date: Sat, 11 Jul 2026 13:40:08 +0200
Message-ID: <20260711114009.73094-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e1471661-cf25-4db4-9a77-48d726811a51@sirena.org.uk>
References: <e1471661-cf25-4db4-9a77-48d726811a51@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +	TAS2557_GPIO6_PIN_REG,            0x01,	/* GPIO6 = ASI2 WCLK input */
> +	TAS2557_GPIO8_PIN_REG,            0x02,	/* GPIO8 = ASI2 DIN */
> +	TAS2557_GPIO5_PIN_REG,            0x01,	/* GPIO5 = ASI2 BCLK input */
>
> This looks suspicously board specific, it should probably come from
> device tree.

It's board specific, and it's not even a TI reference sequence -
checked their Android driver, it never touches ASI2/GPIO5-8 at all,
only ASI1/GPIO1-2. All four boards on this branch happen to share the
same wiring, which is how it ended up hardcoded. Will add DT
properties for the ASI2 pin assignment in a follow-up, defaulting to
today's values.

> +	TAS2557_ASI2_DAC_FORMAT_REG,      0x18,	/* ASI2: 32-bit I2S */
>
> This should be set_dai_fmt().

Fixed in v2: the format is cached in set_dai_fmt() and reapplied in
tas2557_enable() after the reset, so the startup_data write no longer
wins.

> +	TAS2557_ASI2_BDIV_CLK_SEL_REG,   0x01,
> +	TAS2557_ASI2_BDIV_CLK_RATIO_REG, 0x01,
> +	TAS2557_ASI2_BDIV_CLK_RATIO_REG, 0x81,	/* power up BDIV */
> +	TAS2557_ASI2_WDIV_CLK_RATIO_REG, 0x40,
> +	TAS2557_ASI2_WDIV_CLK_RATIO_REG, 0xc0,	/* power up WDIV */
>
> Can't these be worked out dynamically?

No, not from anything the driver has. TI's own driver never writes
these two registers on any board, and unlike every other multi-bit
register in their header, there's no bitfield documentation for them.
GPIO5/6 are wired as ASI2 BCLK/WCLK inputs here, so the chip is a
clock slave on this interface; BDIV/WDIV sit next to the CLKOUT mux
registers in the map, which points to them being master-mode
clock-generation taps, not something a slave needs. Leaving them as
fixed constants.

> +	TAS2557_POWER_CTRL2_REG, 0xA3,		/* Class-D, Boost, IV-sense power up */
>
> tas2557_isense_put() also writes to this register, there's a
> disconnect with blind writing.

Fixed in v2: enable() now reasserts ISENSE/VSENSE from the cached
switch state right after startup_data, so the mixer controls and the
hardcoded 0xA3 don't fight anymore.

> Is there any overlap with other TI firmware parsers?

Checked tas2781-fmwlib.c. Same magic (0x35353532) but the formats
diverge immediately after: tas2557's header has DDC-name/description
fields tas2781's doesn't, tas2557 needs a PLL block loaded before
power-up which none of tas2781's parser variants have, and tas2781's
parser is built around its multi-amplifier device-index model that
tas2557 doesn't use. Not sharing code between them.

> +	if (!tas2557->fw || !tas2557->powered) {
> +		mutex_unlock(&tas2557->lock);
> +		return IRQ_HANDLED;
> +	}
>
> We definitely didn't handle an IRQ in this case - this will break
> sharing and debug features in the interrupt core.

Fixed in v2, returns IRQ_NONE there.

> +	tas2557_dev_write(tas2557, TAS2557_GPIO4_PIN_REG, 0x00);
>
> Is GPIO4 the only line that can be an interrupt source?

No, any GPIO can be assigned INT via its own PIN_REG. Same situation
as the ASI2 pins above - hardcoded because all four current boards
use GPIO4, rolling it into the same DT-properties follow-up.

Gianluca
