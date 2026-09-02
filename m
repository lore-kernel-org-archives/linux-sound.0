Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA804A99C9
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364422; cv=none; b=YWdXBk+5DiferMJCb9iJjO7tWIkPsRf4mPbZNF62XVyDOXdChRScTNoXzo7BNnDpmkOQGmRKzXg77KV1dWj2R964vdsik+dG/Ettp5x7CooDe+AuHuT9PTXS2uOFrZnb/88g8KiZZawqHirnjHUGtAWW3ihRvHtukH0jQZw45QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364422; c=relaxed/simple;
	bh=1pAy6kKMkATvkj+AU3EcJaBus59hBYFwa7SSmE3+JAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XjtmesCvng0fO1+Fwp/ssEivVTgGuxpAusYtOQXK7hGTgrH8dXBPS+zW0ggbcX9WoQatxtnUo9xkGn4r3h9mfsML9Ys8PKIPrkvsoSCI0J/jgcyggfrV5GQxa9u5KbroJrpgOKSxAyAuTpLq8ykhrVSj2cA1dhxsYbl4esu+MWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGsiW6le; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGsiW6le"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so1281425f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788364418; x=1788969218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFmVCM/E9QWkXdxb1N7Xv4jQDK8JhocN0d9+kOjKq0g=;
        b=pGsiW6leXoumEbeTiVMI2U26IhMelmxjJ8eDxm87KTxTEzk/1RgeeXNKIrBHG6xEyr
         SC4snEJORBPoPoyMomoLxpDHw/uOPXkOGdkr4ZjXcE0KRIpjqgT3P2CtJl3/Tn93DrhA
         t2kRg44ow/Fa44eZWjrEGCBhS5GgrItyPt5Ig8xE9shBTCaytczQw4E0LeEby+oYnsDD
         OBf98z5j5zONHgwPNqY6SW2s6cl7Ir22jjBhSrXVobZSu88d9ZHPmAc0kmscAAKpwuqx
         TFBjVVp0na+ot/JSkPTIgwQc0t+u6smwfDebUI3DrQZ4Y/I+KZs75UpCeIgky3uiI6/X
         jJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364418; x=1788969218;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFmVCM/E9QWkXdxb1N7Xv4jQDK8JhocN0d9+kOjKq0g=;
        b=c7Afg/s6f0qj00rCFoMyzKHNtzC9UY746lYGnpnR69zjuwINsYPjxi8muk486f44uz
         O+64K4yMSjX+ahYxgI3hGyK3PXzKbaD7GiekwpK465+/bROesfDxlBA/aAxPSsL8Rded
         F7Kb7LOIZ/xBYCEKa5lHumqE0flLuv+oFnWdaYRtuwnMrV1vsg81hAQEwcjxdwFqCJOU
         tSzTT49fIlr6os7w7T2we7F/ar2dlGXukQnjg7VBTsia6aGTM/qtj0j6yzpiMmioRqgP
         kgY6Dw7SfkaMA944P5gdkp/xDzxMiOz6gkX1dicYuThjuOc5rDtezcpyjA0yEXdkXPEL
         cj9A==
X-Forwarded-Encrypted: i=1; AKwUvBz52MXk1K4jBUjIdQiOKVFqlQBTRu0J9+70i9B6cWNyzZgX7Uu535ryle2tvKY+4kn+wlaGxLFwKPjdgQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kI6/sRM8ZtgRif+cEbEcyR7YfoS29tBFjer/mPoD8lfuUn0fsB
	SmZ70NRqMRxudIxCQ1GKdpMHhqfWwZW56oWewIFw3fg9rgS5m4pr/4XU
X-Gm-Gg: AYBFou2hLcG8YIdfGD674I135uLcxPYj6V7x5lkpTXYOuUFozeB/yd1lSm3xe+TqQyr
	vazwvf5kdxa1On3mK7MWsqmPYLdlwIJ9UhNowAE9Q6jEcd6+qdKgg9QzLqYnvYU36LUDjy3Tmvh
	LMxoFsTR5KMafiqHoO/7gSe+QasX/0as/q5ILgSsaPeZjCe74OKbwu0O/jKEH5/nyKvk9pfHpXb
	MItywBV8JItNxehxbqc3UewXl1ac2QAY7gUCG4aRQ2FPlfr8V3NnR5DJRUeM7+DkyBs6+0J13d2
	JS+04kdvt/2TTYkgYddhReaQKL2snL3T/K+Hh4DJWpEIvHEcrOQnbJkjjDiKmMnV0w68SZ5AfHt
	bsit7tx5TXUEf8mm56DtITYA5l0y7H48oiFzInJs0v9/0xqvPLCArvE9lmBigwTAk2Sr0wPJv/2
	pbH/m7DtKYkSs3x2+Lei/cxwm2iXufADt42lm45/b2ChamV4PEYX8va2RQ3s4bokkcEAcCfE7+M
	H3pjx8RnwEwxLCXa3gpMIA9lWp3TRb5pCeFrkIXn/DhMms9UCIlJhaUx04B1HsZO3d9q5WtIvvT
	WoV7Suw4U4F6EBmCLZ/u1SMYRt6t3Ct1xOOPGkjyM+DfRY5d1IJzvucYNcDUavQja0pmeG74BS7
	MaSl5qQ==
X-Received: by 2002:a05:6000:610:b0:47f:34ba:2d0d with SMTP id ffacd0b85a97d-48488dfaf77mr9549502f8f.8.1788364418023;
        Wed, 02 Sep 2026 08:53:38 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm6884364f8f.31.2026.09.02.08.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:53:37 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org
Cc: kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	Vijendar.Mukunda@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx8: remove unused regmap field from imx8m_chip_data
Date: Wed,  2 Sep 2026 18:53:31 +0300
Message-ID: <20260902155332.171140-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The regmap member of struct imx8m_chip_data became unused in
commit a71b261c19a4 ("ASoC: SOF: imx8m: Use reset controller API to control the DSP"),
which converted the runstall handling to the reset controller API and
removed all accesses to it. The struct member was left behind.

imx8m_probe() only assigns dap and run_stall, and the imx8ulp path
stores its regmap directly in common->chip_pdata rather than in this
struct.

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx8.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 7e9eab2e30347..c2b4d379a3a3a 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -36,7 +36,6 @@
 
 struct imx8m_chip_data {
 	void __iomem *dap;
-	struct regmap *regmap;
 	struct reset_control *run_stall;
 };
 
-- 
2.53.0

