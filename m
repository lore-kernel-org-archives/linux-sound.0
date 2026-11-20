Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169079;
	b=tuSyQ7cMx9UI1tIdx3usUUcFIMykyADyRwk8yNWdZZ86UvuEo6nCXbmfT7NViBVZ/98L
	 pVitz1ZbtUm+7S0gkIujnZ3xUyv3U0RKYdyby2/qvmj+k0EUAMcArceFbghFcYov0L2o9
	 CsdiMeeRyjlzVnKxVDA+kPE2rMFiJzhmoCUY1TzNOs5jqyZcbKn5Uui1GW8tswIFuY6Ue
	 tJInK080Sur8fCZm8iKlo8Ml7XERjtHM9iXvkrQx+MQtKcjiNs2gNcFCmZfa4ZUoENT2l
	 O0wtZh7ZGJzQJ0zcfzqtV/zZro2wSxqBCZ95S6jpVTRl0baalM3PkZalxz1cAJmfbtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=;
	b=AMF+zh4/sv7YA4v1HP6mGh7/cewXEJDrfoWoBFnhbEzDZVSG2UYTF0pVOCrtWoJss3am
	 RMQIxHTtle+vJDuZyT4w9rms4aW0tG+9dwiYjK8ulLOHzMjYOcZvEe5dETXYQl+ZDrh/T
	 mz7Yr3drwuFoYBzrZPWZnqWSVhWOBaKuZfPG8UWVOmiORA+ady74yHJFpPHAh2Ea+ajE/
	 b8xY/fTVWTvVqmV6SFFdcBVorNRf5qWnoEaQhRr1rYydfbbsuBTlReIRgTt6Z9t7wysfI
	 IgaSoyku0+/CHlH9Adc8fY0r/odbkVNHtlMI6+t4XtqHEd5e7bWO8zf1pdJjWxqEAJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4f6e3Dg;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8BD606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF8BD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4f6e3Dg
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04f61282dso676145ad.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169077; x=1795773877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=;
        b=r4f6e3DguwOnbIFmjG3DRQgbSCBe6oJG3OpULr5o82khUo58FPCFwFfVU02SNHKJsA
         Qu4TxiCiwXWZKY74TXe1RKEdW2DjofUYYNRsZH1GAyJ0TKQId+Dzk7igkZTkC/H0mJVZ
         mPj7cwJJfIMJeCqHcziPO88OGHiS00gJmSvCZMAbt5xuzNharTd9kaqywEP6fAlTLVHO
         /cs6tCg5pdNUCIVX47pfjwcBRfScFjwYTVb/c9l0ghcmiVEESV/TeWW1wZRIahVBmeKf
         GjN/tZyOsM8gA2bDuI5HIrhQZdNIFs6l1cvLLrX6kHjQzIyxXBCNnOHSs9B+ZK0Q/Wny
         2UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169077; x=1795773877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QC4bnZ1tQZl6KGsRAWiVXm/uq/sAiQWncP6h7OdUnSU=;
        b=OtJK8a/fLDJoYT0ltCy2k0sC46J45z9HxhO3wYLXiLPfEStiMon0HMh6JjLVvxxx82
         GDwPSNN4bKFLQ499eAzB0QCAF6rBjISONj2q4mHWk433aLeGOy0B0jiGIBJ3bHiTDUvX
         M2KwfkBH+ZFk3YvR4KDH14jflL7gVtTJZmhEkYHKIIMxF8DFRY6p5iISRlOKQLeIDbLy
         2ceKP9CsYSN/sSzP3N4odYCGc0fPjXey5jtE/GrDsM1njbuD27i1VtO1NrxlcxPB5N7J
         EuLZPIdSS0KX9GFx9WDFhEFIULMtmgaqGvC2q2ppchHFcUunu0gl2UHsBuze3iWv7Q3F
         aOkg==
X-Forwarded-Encrypted: i=1; AL+hErGm1ooecnygAJCyITMk0oX64LyWQb8ere3o3xVKkKnpIHxUmVZ690RHJQ+MRfSsEnykXza5fCJA5MhGxw==@vger.kernel.org
X-Gm-Message-State: APuU4Z//BrC5x5W9Dp3MqvyZGTPGAf0qsoxLapg9tN/s5u0TAsp3ARxd
	jG5ZUj8dn5N27kbfYo31+ZXJ65fHhcsCOUjpkm4a3muHESG8XKd0l8hf
X-Gm-Gg: AZFdTZf+60XF4yHtLq4w108T0UBCYWv1V30BeWAu6yowO0uDUQ53YsZNKrFXgDascQb
	6d4Tp2G6LhcNF3Z99fd3eZBLMnIpCcRroiae0HYmdla1BbwPh3PbIvbWwrc/K4v5Gu868E0vmf8
	wkZzu/2+Bn1Blwh1/FuFS75UIh7oyBCGd+T3474wYTjTFxd+fYXWTEsF5qoXNnkKuZ7nGEU7JvY
	KIGLTH5Xzh+6XJR1mhY5zK3RUKT5fVeI+8fcUs3/iM+4uTektrDemp6uB/G00Y4YuSwubr+rnR0
	9IIjXdAlU7/xuZKE7BphmVu9H6xZy8ZsurJzUqv8XDN8Rd+HqXVS3fl4t//P7PB4Sj0jwY1gv1p
	IvEnP6029pGC689c0/udbeAwxpS0v+FxBVV+z5mddiVRdPvIrGfn5svTsBl0jrD1DjIZXRA5L8E
	4wyEyH+au7awYcpZJqL0kWNg78LoSbM/dG29vU+c/tEJgHrRiY9/jdV+gg1bYeS0/pEAith4QyA
	IVqsmpfsgeD8W+XZzwPilCBsISVP9KxtMTVRgJmoPBtGCuonWJU9UDAvzpSmV8/Nbgm39r5dYB5
	K1U0eEU6reoWcXHgmuLxd5AzAkhksXj+ks87S+7EsPaQHKLhwnJ3sTxLuuuO1V4Ca/P2ATpCx+T
	0TLWhrkxL7DC2/+L7+thD1PWpfcrmpMAbn3hqP6EXphATySlJ1Ff4kVlki5au/BarnFA=
X-Received: by 2002:a17:903:2c50:b0:2ef:e20f:3edf with SMTP id d9443c01a7336-2f03f17d2b4mr25759775ad.13.1795169077039;
        Fri, 20 Nov 2026 02:04:37 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:36 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:04:08 +0700
Message-ID: <20261120100408.8053-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120100408.8053-1-phucduc.bui@gmail.com>
References: <20261120100408.8053-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. Neither register is marked as volatile, causing regmap
to return cached values instead of reading the hardware.

Add a volatile_reg callback marking IMR and ISR as volatile.

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 658ff667439c..0406a11caf7d 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -165,6 +165,17 @@ static bool mchp_spdiftx_precious_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool mchp_spdiftx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFTX_IMR:
+	case SPDIFTX_ISR:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -173,6 +184,7 @@ static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.readable_reg = mchp_spdiftx_readable_reg,
 	.writeable_reg = mchp_spdiftx_writeable_reg,
 	.precious_reg = mchp_spdiftx_precious_reg,
+	.volatile_reg = mchp_spdiftx_volatile_reg,
 	.cache_type = REGCACHE_FLAT,
 };
 
-- 
2.43.0

