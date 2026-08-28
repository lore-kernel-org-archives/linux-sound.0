Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA113911C1
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908594; cv=none; b=jJ69fNbyyA/6deveyLqnvOoY7YvIOF60UxdplNgNi+46FrQ5HjUOiiWDwdmFkXpbkHuOVeKFJXPVRyrhKc5+1seYg+b0NKHGW4a2nC9GFreXl9LOxrHimzOCUcIP6v4k0MAFoFI6fE2zZP3wLiEhm8NJE6OTfkrmG+nSueWOzjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908594; c=relaxed/simple;
	bh=flUUxagMMbbwFuTrQc7nygferYAal45fxbtXaeUEeAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dps7MTBk5Whnrg1IDUFBCVjJ0gqur6/PdaSkrV8BC+0fIzTphn2ekRFvMQHZawnbn4Rg8cL5rSdMG8ChPmDr3dtXJUHWUHdtb45pSJqKTHiD2k6JVOREjA7MMEcKnxy4pYlq+RmYJipUlXrpFnNUBMys/x9ovbJyIKr7Mqk9vu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQyt4Z5B; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQyt4Z5B"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so1159362b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 02:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908592; x=1788513392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=IQyt4Z5BZfGgIsKPakgqk4m4GTNyHtnNwEmg82REhTgn5vHycNbGqCV3dq5ASYcfIa
         XZ7pjZ1IR7FawuiTGRoSJFeEUohzvsk+oMOAS52yKEzDA8PJ92lkDIdg/ToqMnDI+MCo
         IWvo2Cmxeq0lTHgdyyUaQc1Hve89c0G3J3KH1KPRGhK0vCDHlnYvBI3Gxdxv0n76VYOH
         cxLwGX5FyIq2LcKfmVRKbkwhevBPTJBamUMezJVM+ALPqkQgVA0wInIDxSLABlLv9OAj
         WRb75zRicoP1iINAGbLdzXEKsRiissbJXcVJ4HohjAgEAbgupxjpYHXxJTNeR9+/Mzt/
         Qrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908592; x=1788513392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=aIYQeLnlaRPIKHdoRNO3SlA/KqmccW8fegFH/4T+i9le+Cc6m8bYrpoUVqrMLMCqVA
         IfZr5cBO8RZcNHCsJ+wwMUX6CkVrYDaq6JGZWVklsP0DuzNvePXD9NikKof8wJIVv9YQ
         r7hU9ymuJaT69y02AkP6vvYV/CbemsQSJT6IWor7I0Sz49VrrGBZfHyHMKEjeW5L+auy
         cByHtMUpik5uNm0if++YFsGje6106WYkvK5OtUPtp+nNK4/YqmzzAGqpmIZRhhYGbzMk
         H81i2vxTwLsnWeYJ06mc6irpVLkJ+64Sw/wOsMW4a8t32lzAij6WL19583oOvIRJKDcU
         zJOg==
X-Forwarded-Encrypted: i=1; AHgh+RoQM+X4T4F1yS1Be6gMSFRBjUr0Y01MyPeIQq6c5qXytIK/T4tWZ+3oOsojK7wTQ4WFC6uJoCXvLgzDkA==@vger.kernel.org
X-Gm-Message-State: AFuF++mivbL57nbI+aJZa4z1fvg82k/gsB61FR/EHSvkmHl6Vavrt5/i
	ZbpsQWCd6s+QbSTzOHbMOrfpypNUlYY0h/tvHtfKhaVlz339LqF1pYiM
X-Gm-Gg: AR+sD10AoemQhLZJCNZJiswLdoISrX3972BQrkB/lQKjdXaNXRBiFyfhNouvt2TQcEU
	yosArT9h0YUObzWm9/9RgGZfdoXos+cWYdiBaA3Au2ph2/7qnkD/mlKvJgh1U7DWGU9yECoo0Kq
	aIrXO81Dix9g7ViWzw6E+kiXAk2Az9HHv/OqXS2h0uAAeng8g6q5PJuQfjPMzlxKT5k8T6H50cp
	Iv50lnEyppjactyCsEMb8TUxEJ4ZSYEGJYDGbpl0rsuLsURcwRv2sT9jr3PJepF/F2zxEDQYLSm
	AwDThuKmcIg8PbsCa9PahmKJXzCB53ZpLeB/XryBhZr6YbtWyxEJTXDSdQZzlHZp1qnOVDlEGRF
	ErddaKqB+LxdPbwkyDHf1cK1TSCeZN1sPPRX0p+GooKL5SkAr9R/ANJkQ8syaKYGD6rQ6ZdlvkG
	5yZKQH4Msi0f0cP9o6MXP7FsP0g78X6B/i/yCafvE0L+aH28q83RmgGfr+o3zhnhApGPSzQk/GW
	hxjKa+UxmALMUpT+rxxpfAr6Ruo5v6ucCLH+eeDcPBT8fzhJ1AYLwsbzaZ3+Q3a7FeurTZgFGjz
	CNK3hmaUgwfUXxk=
X-Received: by 2002:a05:6a00:8019:b0:851:d12e:389b with SMTP id d2e1a72fcca58-8562a8d4291mr12413048b3a.14.1787908591962;
        Fri, 28 Aug 2026 02:16:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 8/8] ASoC: mediatek: mt8186: Drop redundant probe error messages
Date: Fri, 28 Aug 2026 16:15:32 +0700
Message-ID: <20260828091532.600047-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

platform_get_irq() returns a negative value on error and does not
return zero. Therefore, only check for a negative error code and
return it directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 143386c54dd7..4bf098657fb4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2852,10 +2852,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8186_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error, ret %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* init memif */
 	afe->memif_32bit_supported = 0;
@@ -2885,15 +2883,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+	if (irq_id < 0)
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	ret = enable_irq_wake(irq_id);
 	if (ret < 0)
@@ -2957,10 +2954,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8186_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "err_dai_component\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
-- 
2.43.0

