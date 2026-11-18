Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996471;
	b=mLbu8/UnDuNAM87zLfNqEPtIpZq+1c/rtZi0VCSG3HqWVIyqf8xZPFcNH9npcmlEnD7i
	 v7GAOpvNOnn8szNVKVdWvH1O7WDEGBdiYas2MncamStD63WRHyIsH8T1FNkM5Q+N5W/hW
	 0hyisaaVwURn6KIl3Y72l0DgsG9g/Jih52COomlZpVEwye1ztkc4nk1w642xANS4LNUmK
	 t/fFEL3o1XTTP/k4frTKko4JZ0yUpDQ8aRH+BAMqwGxwknLBfxmfSwDklugI6kxGZxVuP
	 rASRLyadkdFtX1W1NjAGZKYfrXJqp//DPluyx5GTk/2oshhUVD/qfH9QU1gLvS7doKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T5MWPlFjQcs/AXGmMiLfNtV+jA2eKvI6Y07n7HW2V7A=;
	b=SF9AXJCEludzKHp9gxecOsFegqaO9mpkC0Dlvf4Zw0TBDj++aWnITpDE1ycobwafAaIz
	 Et1lz6YTH6yKDNKnEhFALiz49mfTse5EBD+fPnnrCp5TW6UPQHlZTSgVQCZkuyeoalKwR
	 7NdKnHanEdZl2lGq0oTYorVJL06TAvLNiGPJNvfrcB7wmPeXZ6KdDdsEWIOWuZWq2/XNP
	 c/q+qn1+wWrPRz1HXAzcFc0jCWdv8ENL8W3GEca+sMT3Zhw0ZFm7uUZAIs1F+wwrmiUHV
	 zXbTm474VK60bnJjiPfWKETtk4huml7hbg9MzGZSbb0GJy5TZyTqfOvWJMry/5fnPhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xNjoaYdZ;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026A606A32C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 10:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2026A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xNjoaYdZ
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eff722a480so4044375ad.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 02:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996470; x=1795601270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5MWPlFjQcs/AXGmMiLfNtV+jA2eKvI6Y07n7HW2V7A=;
        b=xNjoaYdZ3fp+JBZdfRLf/gsEcdz8cUOZq99paV2bM6rn9OAHbrpCaR9CQTojsBwA9U
         HTP+rZ1Q5RHwF9wuhl4Spf611fvNSIybZGOFL3Olx2RjUhoUV5Bzrh0ZQMz+CqlNvoAw
         ZWqsBXjmlSHKWmLfzrvd3lfIaftaZ52T6S9J/ZWf91aA53lL0nYrMm0TOcCHW2wv+7TT
         Euc7pgpO50u+K1I6+u676NL8b6gbwlv3DdMDqZsVfaGf8wDwJux5Z8UngbPP3FQj8eAE
         D792mTM9FAOJvTrfgsxN4v2m61YB82ghg0W/w4SwyHisZY2EfZpo6GK3s0m3DZ8XCj/z
         Ub4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996470; x=1795601270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5MWPlFjQcs/AXGmMiLfNtV+jA2eKvI6Y07n7HW2V7A=;
        b=YFafpZdeOyUsRO61l46yT4cvWB1mbM9M+fYFBG6SBHozLESvcJUAHxCtaZWSsqRhVU
         se7uqQ+bnjgJNr5TWWbVLx7nUjEzX2eMechuanM7DgBbyTUIc2TNQHKYnuOV6ua6XHql
         8Ez9SB2YimdbJ61fW3vaAthQtvhTvncuOEwiWGi5NyM09mF5d5horgNgagBueGuVXsv0
         fmGyUljAOFQBC9zIB4Zbi+aZfKIjrWucAgldP40Ju1XYGrZFmbR5UjpcTnwkeqeQlO3A
         J7fR4FHERuezJeyl0/cNZBaazVKoy6ZCiL/JYrqvlPkHfyVPi4GSs2z35PsunwBEEGVN
         voyQ==
X-Forwarded-Encrypted: i=1; AL+hErGJtturTJESCjCncPuKq76eFaT4yMZcrS24N98Vumwihk1WjX+l5ewn4jJdKfsywKtHPtMVCmknyRYQgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z88Dwfe6KswtqJOv5gRtrhoQtT3OPQiRF5crwotdIUVaJSryGxI
	t7NtcWEy8gffyUbrj+hFXCT2TLB6/TLGBhRt8urmtbr9/UDxYFcEWddE
X-Gm-Gg: AZFdTZeZmX4lU19S1OtaXht/vjejaahpqN5hxAk2jZdPDb+9dsM2vynw63QBf2hN3ab
	jV9B0mvxYhCZnl28FEk5dhO591ylwALMPn70MkAq4Sbt27ETbq/1RNTlCV5Jk3JpDdEy+zP9BjD
	zq8d+m9fIL+wPW5OA9oZd7lBcHRdhAUD05JTrnrfsErf7clQj/4zZcIMSXfHPXDY89OqLtKw6nq
	Erj1SVYFIDpTMig8ViCJpKUnOOy77pyAzSC7tUXIJh4+X6wKhqzj6iVrdNt3tQbPM3aSOa8Gz1H
	sD0oSQNPvtXqcRqUUdSP5jQt6yHkM1Po+dWJZR5PKLSI9Nw+EYtglCQq7n4hudIiXMPrtzeti9i
	9mcIrQMu5xuf83mrG1V2Dg6JQtlhWNPKVxldFhOODzZSA3XoSSntkAXoNBPeMGLRJUOcAueotGj
	fGSxkdDDf3i2/akweZeFYOVGynrZta7kzRkEhLgDviv9RsEoxD+BJB+tPDRFaS+Kna5hN/+tShd
	wv4Hb6yqZVTat1IExbx3z0ExWR5cxWE1S3NrBeyUgGH5eqUSBdHBHfmmR+klTp17CEdNC7V2QuC
	18skPS9GrUo8Xa1QJhK5cE7FWUqMJAAlDoATzQpiVpfisaroP2tUpFTWt+OzQBXXLIa5FXaBcgI
	1/8zifuIZy3qM5umLannyJkMWOn3flN7CBPhHqSfi2lMm
X-Received: by 2002:a17:903:1a8d:b0:2dd:c053:b9cb with SMTP id d9443c01a7336-2eff753ebc6mr15920055ad.28.1794996470442;
        Wed, 18 Nov 2026 02:07:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215025sm10634145ad.46.2026.11.18.02.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:07:50 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	jonathan.downing@nautel.com,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: fsl: lpc3xxx-i2s: Simplify error handling
Date: Wed, 18 Nov 2026 17:06:30 +0700
Message-ID: <20261118100631.26658-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118100631.26658-1-phucduc.bui@gmail.com>
References: <20261118100631.26658-1-phucduc.bui@gmail.com>
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

Return -EBUSY directly when the I2S channel is already in use.

Also remove the redundant error pointer from the regmap initialization
error message, as dev_err_probe() already reports the error.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index 757e0619d368..75bd148c1432 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -82,8 +82,7 @@ static int lpc3xxx_i2s_startup(struct snd_pcm_substream *substream, struct snd_s
 
 	if (flag & i2s_info_p->streams_in_use) {
 		dev_warn(dev, "I2S channel is busy\n");
-		ret = -EBUSY;
-		return ret;
+		return -EBUSY;
 	}
 
 	if (i2s_info_p->streams_in_use == 0) {
@@ -320,7 +319,7 @@ static int lpc32xx_i2s_probe(struct platform_device *pdev)
 	i2s_info_p->regs = devm_regmap_init_mmio(dev, iomem, &lpc32xx_i2s_regconfig);
 	if (IS_ERR(i2s_info_p->regs))
 		return dev_err_probe(dev, PTR_ERR(i2s_info_p->regs),
-				     "failed to init register map: %pe\n", i2s_info_p->regs);
+				     "failed to init register map\n");
 
 	i2s_info_p->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(i2s_info_p->clk))
-- 
2.43.0

