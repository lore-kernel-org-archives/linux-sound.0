Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351699;
	b=fO1VSYtblm6GsjlnQfpS/wRZyPXHTFv8QgJpSGCc4OPSNrNdR5tU7FodjZxJpYJIWUVZ
	 rjeeWWHogNG5ulHj/fs3d2ORrXyJcpu0A+AwVd2mz6o95eqev4dDgTNsgxLcLOFkHznij
	 IvOrE61HtBsKM4wDMkSTwiqzmEf4mhWn0HmSnuaiwDSG/cfOsC+r1u2U9TSKtruOE72RW
	 ez2lr+Wm+aBKEl9TPzszvuvzC/4hDmQN44BKRV7c7czXzamKldI7NlQMcqwdHz4WBZH9W
	 kRidMh9wr5Pfw6D4EWBuXOKyDmGaM2M58xzIZW5I85yxrbyjVKJY53oYylEsVqDEhsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
	b=E1e2p2+khbxHsIkW8hOlX59ZkWCbFw5JEwSObXUG8NcC4XCDW6XQdaKuk4yjdSc3j4oo
	 wmUy66UABm1LDxDGuzIzjM3FoS8MiqsLj4Ddv9pJLk7V73tXxUwv9Hj3blv8ZHRzrKP1C
	 4BVI6dwX7PR7yrS2/jJvMWYERZIAray71k6Fih/jWBbDhfVIVyZvcMjHyHw3vhTRBe2TH
	 eVFUm+ZBXonRWUoDOHaecTiqB4oJwqnhZC2MGTKrGRZdH5jGz8hOxBDJed/1NvXDObfrN
	 O2nIisaeC601ZVvt/rHwGDveyGbv/E47xUwZISlAMS9+MaC8lgTXUovndASXBLrPxpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzM6CGYq;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED67606A31D
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED67606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzM6CGYq
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea7190aea1so2221965ad.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 02:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351699; x=1793956499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
        b=tzM6CGYq9mVXRZmXhwuJ5L+a5pDUyc35Hh/jAFHfWF808s0iH5b6jAuq0qg/FrzCS8
         Ct4/qYfGDL1mcLMWWlC3pPwRPIk3lkDyrfLMVzk0qHFv9qT0tiR439sYH9OZF9MA4b1D
         Gld9EpcE/XeBec0ihs1R0utDBJHN0BrhxdA/U6pev4hk7tUH3HFMkyhYdN5CtQeFEnoa
         gtZJsEWjPX4FyqZhJyz8iMX+C4PFJyfTLCQ//HH/mBfBeRv5F7OKVGm/KSZujcxyxRKD
         yHRjmZRo4VZ+TVFcyOhXF4EkvSuT0ppJ4n5rx6+hufDYYQyCpC2qCaNXzrpST0C9S0HY
         /0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351699; x=1793956499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
        b=iJVtxjf1aotl8XYJuJdfWW+a5Xy9vz5FHnUoQXF3SyoOAqMNrV+D/NJ4MiGTtQxkI5
         rajuHTUP4NfnpUohVkqojcMMUTbWaT5+aFcVYRiHEz5Zw68le6k3aVILr51zXc0vyg0D
         7mSh2TUYlo6Rzc9H0tL07ZBbIcm1T165Y2c3nJRDzZByKwgwrn/rx6TDhqzlpGMrdkZF
         7XWPE+/w15Qfj8Ta0EF32d4g6qlC2tEZqMgUdlj/Usyj1pJJAaNUuMl+SDnod+bnyIIF
         5wv8Qfgx7LwwT5P5TgSKYWaKz9TvSO/jwoxSpX1Y/YiSXIbWU8xR51v86wYQXwOnuiYn
         TRsw==
X-Forwarded-Encrypted: i=1; AKwUvBxZzi3CikfS7L6UuRLNRk7Mr0wBLX7sOVepY/qwKla32LlrAeQEDkYkFzM+piQaB5W5TQHsvU159UjPcw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKpvVKMcJMbj+2n07klVekFEmEr3mJx4z3Tgs9AZ2JUBzedlWvT
	zyDjCY1J5gXU34tHC9rRiDQUyMXk7Qf2L/cIt1YnNDqS0OTcgyrJGRQd
X-Gm-Gg: AYBFou3jiTliagECkDpL95cPOuqXMXiER2YnLBJgPxXoJnkk0OQOChMkmLYUMejMIdF
	LmYJgjbtkINv2vgvMRmB9zCmisJq4TO+BsQf5dnxaG1+zb1MmDScOsqB1wpVsyglib+3ZXkUs9w
	89l9kpxZA6Us0LxnRtMxAW4c6pW2BkRREufGLJiI7pjM3AE43FKuOAjBOcfNwfPriVvMibY1BqZ
	8XcdSBglkXYZM6yqQS01NyzonpFSUfHtov9RAU9dRBO0Ixqq6Z5dN5A/c5Rkw/eGpHUW31A2Gdy
	CvDST9FQspH0nG3ebPxvigSJdHt/3sf5FP639OFxTGVHEhXtkITI7Rus5cvLzdKogV4HNP/IueU
	R8pcVC492eHtAgfTKROJWUvl7bqGbU6Q3hKNbI90oYywpHPJkQvbvYOZqnbQDPG3hnMUVMKPi7i
	swWCT83JEKrQcYyTVRlSDIcOHGnSHcz3AaB26a1ACMzwLb1gTVRjAZS3HuP/F2WuBd0ym+Mowm6
	Wik6aDJMItlIfXAT20pv67dfQPskCjZgrT8X2/+N7xvRX4ECk5pwunDS/bIkrRX8mVyUa8WFwUz
	TMf+XpLoN2ippqHuKLT+6kYcE9aKFB6TGyOxplOMTauLWxzYdPhDI9pt4Y10Rg4LPDiOrP6ZfFc
	yuMM5pLKsCgkqkgaiCuXd5cqZrdPnww7B37ajEK4dWkkv
X-Received: by 2002:a17:902:f545:b0:2e9:58c5:8c68 with SMTP id d9443c01a7336-2eb3647be16mr17041095ad.54.1793351698836;
        Fri, 30 Oct 2026 02:14:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:14:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] ASoC: fsl_sai: Remove redundant error messages
Date: Fri, 30 Oct 2026 16:14:02 +0700
Message-ID: <20261030091404.18757-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

The errors are either reported directly by these functions
or already reported deeper in the call chain, so additional
dev_err() and dev_warn() calls are unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 44a34f48a0cf..5532fab80be0 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1615,10 +1615,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* read dataline mask for rx and tx*/
 	ret = fsl_sai_read_dlcfg(sai);
-	if (ret < 0) {
-		dev_err(dev, "failed to read dlcfg %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -1698,9 +1696,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret < 0)
 		dev_warn(dev, "Error reading SAI version: %d\n", ret);
 
-	ret = fsl_sai_reset_hw(dev);
-	if (ret < 0)
-		dev_warn(dev, "Failed to reset hardware: %d\n", ret);
+	fsl_sai_reset_hw(dev);
 
 	/* Select MCLK direction */
 	if (sai->mclk_direction_output &&
@@ -1715,10 +1711,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
 			       np->name, sai);
-	if (ret) {
-		dev_err(dev, "failed to claim irq %u\n", irq);
+	if (ret)
 		goto err_pm_get_sync;
-	}
 
 	if (of_device_is_compatible(np, "fsl,imx952-sai") &&
 	    !of_property_read_string(np, "fsl,sai-amix-mode", &str)) {
-- 
2.43.0

