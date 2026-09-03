Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C26202F71
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 04:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411189; cv=none; b=np1Fd6by02z9W5EwOEHZOwxLLG2OQKZlwrqnINLgM2lXZR/L/XZqCa2JWWq2bBqdCYNIvDiJe5VT3KKVLkJBlpfoPsqgpjAoefLN0EsnPSK1cZyUdemLx6k50WrtamAy8slPEDVep7so5pCXH1SsKqtTggGnFeaFCJ6DlPZWnrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411189; c=relaxed/simple;
	bh=3GhUN1YWxQu4bJXtiFoeLFL4w/RSX1buQvfT36CMNsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNrHMcUuIOir6A76SOFPKBha2ppOn+XI89JrlRlHkfIlShhcjNPNoGsimgC2YoifeJdi8GdMc7njAg2WzkoW1dxbKTxsd/IQY5EfLzOlSiHRqAM0SxuxPHQcFWZWJWOFFWSEJgjVeRn5eo2SYJYC1eFxSH9uAOgwyqNM8N7r7d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=medGUtK+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="medGUtK+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39927410578so3427138a91.1
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411187; x=1789015987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=medGUtK+zwgPcPqNiqnsb24JTkDaQqeihSAJbSe5lZ296VUmAt2ttAR8AcW6cvu1XA
         VCOEDaYkBRto834W/C8O2IfbRKy+2xzTZI6JZr2TfxDKJuLGd7/I964VMBiaKlYe3n3N
         yV5vU5c4Y+wCmQlILojZocSXL0DHDq+YEvo/2ezQyjekPOl7iVizrmwaGtcqX+Y2KtW/
         xZ2X+fwIujT+YZVIQExNhMyjO6LaiuJE6b/cbQRqipyNT4YYImIzUerF7359ruTQtPJ9
         Ba7/ejneD+g2RFBPaGKOhp2oL4jQ07u1mMj7JYovztd5pZxjtiSL72KQBwiWSTq3UPWf
         WGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411187; x=1789015987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=GKq+RxdKQy5SZH4tjAdUZ99LrWvJZQzJjzrhk96lY+o3RqfThTtK86m/wooDOLc2b4
         vkmrpII2AO8CNtR7aw6YIrAGbxb9DgLOzyHghwDrf+41uyQZiKSq79aKsNyKHLLJQDRl
         udWE453NbXib/KoKuSaw2sPyzlKXfjTmCfmp8TaId3G2SKPqxXDOf0WY81z+CGUaS0Eh
         lT2KWmVQcgDdKm/k8+5FMe5ViOeHddabcqNWX5Bqbjb7Za/nSNy202U/Gh3QbSvrkOLB
         XoIPZSkKSRYoo6d/toQChDPLuMTZmiaLatTf9lZ2ApdHVmUgphxalk0g45eBFfFrfI1w
         WoUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmkp/rp/mAf5jdKlA923+GtIWqiVXlMpe5fASwodMtc8feLDJcHiHviVOmigraCctsd1X4AOS7KU1AxQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nTzjTvjYXYKWhZwGL/znACrgjyOvnq0ntKDjaZSFYNl1aiy6+W
	xAO4t+FIqmCycXjiUj2qd90G67N9yX6mpquB0arLLZn4v01W4ZXigYkX
X-Gm-Gg: AYBFou0xwr5CBGtA4wf5yhdccszEq1bWUj4jDvauOgoxXzGFUG2QVl9kQphwF7RiYMC
	lLbxK9fyuqs4L0dPuKX16NMHHhjFGqzVkPY++ZDVLEOxg1bzMPHIZZlVnX6h1XLDYHJJ/kkuTxs
	Tc7L92ma2re1HnrOxjgyhp+4GCiici2xnwMOZRI8yHAaQaolyWV17tFNG7DNZsPjr6jxlm8cxwn
	WlOlVcnwtwaGLDS8POiDuWDMmhsNkIQDUKwH7QACTjRn2zeQJ437fWrW06Y98yA8OTDeUyHkYxs
	QHRuHg//Wlvt1sRw8ZmDfrx27CSdl1m2P8L72TIr9k+QzaQyjoMFoptQSoay37tza2XI7wv7Jhn
	dHKwzQ1UX3NPewmu1YhW+dbYX2WFN+gKrYJsxlhBUrw+hgqxybu2JX+qAWyzs5c2Ln0MpYfUJ5T
	1QXez4euncH1aOKV4BvaunSKrZ+aQP7CAFaFLY61zkx96n9sHP5TNzU5netTdYEXXUtAk2h/ntb
	/gJv9CIHIu58JeE0K4ulULgXZjWKZmiEN/0dEoiAYKGH5pTU/6QE+7BFoD/h2cpwJ/13KXjq5Tj
	uD3/FoEoJ11QjoFA
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr14283857a91.18.1788411187416;
        Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:53:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 5/5] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Thu,  3 Sep 2026 11:52:03 +0700
Message-ID: <20260903045203.175337-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

