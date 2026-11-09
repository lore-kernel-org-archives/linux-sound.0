Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211778;
	b=wfUEoDxmaF7dLCji3d1mqOHVHQPfIIoyd3MQssjY8Yi92e7qCO4qwN/kavrqT4Vq2UeP
	 3NQz2o/iAADau07FiGVi37z2Ib+WO/5DTZD1swl3cxngqQF3avCqvatkfsoIs87OYI0Ms
	 tJo7+uPAqQaWEGPVr/Z/QkrZbOp3b/10IpAFo1Byf/gkxdjCtYZ6d+b+HTsIQC3v4ISMT
	 iM91BelET4EZ1tPGGg7soAlQYeV/JsCXkfPTlC3qJT/EfCfAI9xuHRXhY+m7Yb/utkrPo
	 ZiSECrgemjUWXNYWVjjVtewOcbHi/yR0g1xuNS4Me2Kw0k1ZAKNsbzzeqZoWYcb1bSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=;
	b=G45CZzDuql9tuRLkyBiREI6bUs+awzwDEjFYcr7dJ6n+lhXHmWdwDAH/fdSYR3asS03p
	 +DV0GMWMb/BvF5Iu0xXGK8O3IY4hba6jGtU3ru4zZtnHVUcLwl+s41k+pF6z0zmCNufkX
	 EizP0CmIeA1qmv9Yh7qmNPEbx5AyEZzEHjc7JtTurbjoqKMr/PZdDzqyP/14ykuIiLbJj
	 8rZBFYlRIgS+wNSGHSyQSUFJrXietpM+ioH2kgtgxiXFeSLRf0xiCxHpSRAnqFcz0NuCO
	 QMF6GUshYsoVH0Wq0cCiKkIi7GX6Ep5nS5damPhkDjv9oHn4HOwPb3r7im2bSXcrC4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=S8Tk0nNo;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3BE606A332
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 08:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3BE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=S8Tk0nNo
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso333262f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 00:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794211775; x=1794816575; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=;
        b=S8Tk0nNoY0maepYWmlS7C2sFzi+1aC0IBEIvaWcskQHbTJpM7hyPwl1ZF7mkVp3veC
         OdVMuwzBQmRwg9N3Cu69n21v/xaAmbOwFyAl2wyht10VAOUa8XEGxDQty4gx1vvGGRB1
         bZPTJHgqRu53HnL6T6kAefTWdnHtWdMNK8CqDV1deR/SFghUzJE9rfhbGI+h1PxA/xaL
         Dizr1Zc6Ns1LhZstTyHRy5z/kHmnQJagcwu23jNbIBtWVtEH+guHHcfGApsHEgDz3Gen
         4PbzSLlnhrJaPjngxF3ucCCbvyreRU7DFXjlWuK6R+sBhihB1IjQF318nn0Gc022YwUo
         EyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211775; x=1794816575;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7WgP2xkUAyLjKpFzwzFZYmyYY1jkU6o9DJTWgp1SX/A=;
        b=OWuyknnth3s0nHI8HHUMFDquqS9bjccAZyyeNhXezSiTUj/UZtWHgldT4cD5xnSMX/
         OWyxUoQ7VEgka82oDYjX9Mb+7A1vNjLtMGH30M/mY9p4hnGaeJ4vkWW9z5Iquaq/RC+i
         iq2wHHPBKJvFxLHo+gpIyvdbMHPY50FO4MRTQDkWQBJFrQB2rgIgihpR4bQtzL0mGQuh
         mJfgg7Mr1wic1VEjLEGdjYQttHn1dk5ykBG1xKCLvDFlf4U+tKA3LhZBwVBGYSTa3rbj
         OFAcXjIoEArmxa8ah5FYY10A5E5lx2V86El9AbLy01gmKR2jGNh+Sw3Oh0KXPSWNL/em
         HAhQ==
X-Forwarded-Encrypted: i=1; AL+hErGU6UDtXxk3ewiSopN3xKOMjMT18/kskXLO8Pfcqm/T4PKhY1JFctb4UJGQ9vle+p/D9BMmB1LIypkNgA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/egVVlRxCwz9a0omUPGQcjXDbBryp4MY9UqIYHrpGEjd8JSeD3
	PjqK+p2WHzs6lO/KpBwHXVCrxFRikyMlH3JT9Z96IsTi316DN0CWSfcJTtc+vKe/ekw=
X-Gm-Gg: AYBFou0Z9lSMQF4+OfzKIw3RttHO4zDjEeQbzlWvgB+5s07pRYePW2+E9FmBNFkS7vL
	iCMeDsZY2n1foEVsfd31jz8PV92vzaDq4EQzn8VtEtVt6ObrwXgfhMBHKQbvTo3x4XxycbkI1yg
	IhSBmNicGAAAG4ybItq/gjYA7uxk44z33zB3VtCYlkP4BSQB5ZQJ/xg6QTs9Y3ShRrAbsZyXCR2
	UQ6AN0r0WgveHOz0R9JPX+rUbTsQ6QhI52yRf0wJioJR3U1I9GHdOAJSXsLVsUjNGMs3qvr9ejL
	X1gAMoaZarkH4y+omAtZiDhMZaxS3eGxvS8rl2k/OjZaS9LhxTOA6zlTGEXdo62fJDYNBgX0Fkh
	CcIx9a0TBtWPT4i5PD3y6SFh8H9Ggo1K79jclciYU8iCAJygrBGFUR1ihmRhLrV6OS5bqBBwedk
	UBqq19H9b1rRBLkAafgODxTxa6lEeHErvmdodg2asHr3SV2rbdJW8ozv4cBzNawJLs2eoxGDPB+
	ETSStJw1owqnZxCcc2sH0soAcLdN+0GR8NzEbge4cjekXzaqDI2Uggxj8OanJJsEP+riEVY5lQL
	ufDmXIkw17oSMg9Z3cg7iQGyF1aulGBlSDLArCoY+GK3dZH+
X-Received: by 2002:a05:6000:5c6:b0:490:5521:f24f with SMTP id ffacd0b85a97d-4941f667da5mr10718282f8f.3.1794211775492;
        Mon, 09 Nov 2026 00:09:35 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597187162sm8595813f8f.34.2026.11.09.00.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jude Gyimah <jude.gyimah87@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-sound@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jude Gyimah <jude.gyimah87@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
Date: Mon, 09 Nov 2026 09:09:33 +0100
Message-ID: <1jmrri1l4y.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On sam. 07 nov. 2026 at 17:55, Jude Gyimah <jude.gyimah87@gmail.com> wrote:

> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
>
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
>
> The fix is a select rather than a depends on: the providers have no
> prompt of their own and are only ever enabled by a select, so a
> depends on would leave these drivers unselectable.
>
> Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
> named symbol, and each links once the select is added.
>
> Found with kreach, a static check that compares what Kconfig allows
> against the symbols the compiled objects actually reference.
>
> The checker is at https://github.com/JGyimah/kreach, and the
> reproducer configuration for each finding is published with it
> under results/.
>
> Jude Gyimah (4):
>   ASoC: meson: aiu: select REGMAP_MMIO
>   ASoC: meson: axg-pdm: select REGMAP_MMIO
>   ASoC: meson: axg-spdifin: select REGMAP_MMIO
>   ASoC: meson: axg-spdifout: select REGMAP_MMIO

With the change sashiko requested

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

The re-spin is necessary because the description does not match the
change, even if the change is correct.

>
>  sound/soc/meson/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> -- 
> 2.43.0
>

-- 
Jerome
