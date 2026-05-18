Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5829370D44
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 02:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779072078; cv=none; b=mzdfiffss4SH7QJMh9W+5I3bD5MEeIQC0fWG36Trl1DQcRofPpH2xvvlEbhGF40aBBDcNISw5DsjOne+Up68pxwJAnUQHPXOfRN0imZDSwXGRWCoy7sdeCop7NeuUo1jZEEbdVg+zpthcTGiL77dPnhJtF8IPaWn0R1levfHOkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779072078; c=relaxed/simple;
	bh=NQY0kyeCTdDm7O2l5wtg6rcyOWbfpOIoGV+6BXsEjug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c5HWqxfbTBQ68dE5fvchu+A05+nyY/t3shIQ7TVkFnlgiNpVmK1TJdOMA5sW03FDI8YusFlEWI6J9ncUx1PlFIHtL9YwssRzK4DNiNFHvPOoTgD9MdrqWMNSBNDerkvucpqr7HdHRFNk3zRhp5svG+5k+V2hMFDzkXbNkXkn0nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b76y2o3g; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b76y2o3g"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f33ae12f97so6942307eec.1
        for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 19:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779072075; x=1779676875; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uYfojg12w5muo1Y1nJcT6Yfje9fAPhcae6+0t2EB+gE=;
        b=b76y2o3gj0w1Yq6RbmbbTkcS289oGpv0J5bGulpkcwm7TNp5SlyfNs20kSXqSLDxaY
         qPSaBnsKGa4JspSo2I39GbdTC7XNBImn6CYHnD5lXkjxD06retrUmhgDt0k7qs8ZRMmW
         NVCzShCOcz9HLOHted4gUpnoKjwLk5qc8illR/hV0P9AiPTHj5t1POOqmqmF6263Ig5C
         ooddKypXXjvPJ60uEcrZnk08St79c6miKkhhRffxY7OsJt9MqPs1VHffZAM5CxgPKSe8
         Lvw58I5UmQbZ221cKrwgNoRw+jr9aKioRQfIf4ivaKsdUVrPMyPDyTT9NwliJyEG5bcm
         qN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779072075; x=1779676875;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYfojg12w5muo1Y1nJcT6Yfje9fAPhcae6+0t2EB+gE=;
        b=fzpW6ekoOhB3G/RwXicYTOyVk7k3RS3dmfbFdTwdIAenYecnMdjXyftGxujkapp/Im
         QLnjKt07dBYtRb8YDU5uBOYdkUlyaDUIhk6VhkUf+iM6ka5XaZFLFvKt5ou/BwbQvjf5
         Xv+2UcWVicyHdRQIIJd0H3NELMMfw3fdHjrj5Z/+9nNkHDjA5p05pH94BNvmofJiphxX
         ug7bF4s0RyRET64maVq+UXe4lWXDUlNLY1Wl8UFVTqrKribq4tqKiPyFq7eScvmg9SZw
         iHKrI6ZQRns3RrEH/aJfcSgmwg1UaQWPi7+snbOHnk1sc84ltH8wFL9rlGWQ1FMIV/Ow
         uIwQ==
X-Gm-Message-State: AOJu0Yz+nnnuoJh4FvOEKVqgAzw/MFl9mnqJbGYua/DJ58xdC6NvYWTo
	Lo5/f8HkgcybquNR447xDafNM0/UR8ghsueEyqkoYPkLZZgPg1Ttou7au2/n4D7X
X-Gm-Gg: Acq92OFtDhNIGCBZefgNrCbUvwNs3ozOhObRDBfcKV+dfwsvHFJUYu1o3GwaKG8Yqhe
	aMj0DI82cLbb/BInC1Or6MN9S5dAv4hyn4vzF+ZRhcx2B6XSsWKXqIRRz84R6joeS/6njrCAqSA
	PEyoYSVa2mFfQVf37xhUGJpAWGn9LEvdtsJsbVGs8gSlb4DO0PaKxHkfq25e7Mx6vatgQgBieAo
	Pi2s9am1qkRG72ZDH99IzdLdUdo03+qpT40KOjRRe+QrEyyukAilZLOUzyavM8ZY+876u1FjmSo
	m+by2bpSAcpZ3faG7uge4G+F53l8O+o7/NZchquZJUf5vvZR2v+cF74RJyiqTH5NrnAU3v2s+1A
	jCJp7hLZgTD8mJh8Sj15bvCBcboCXe9infFONLJhwzrS7kk4ekdNHTFwhhUq+Jg39947S2hTxxo
	iSsCoNj1610L7C7jR28Rp9cO3sgLZpUt6YUUsK2hA+3Nh4BnRKjaH0U5lXgob9fC1uF0471n6Lb
	g==
X-Received: by 2002:a05:7301:6447:b0:2ed:6f94:9d9d with SMTP id 5a478bee46e88-3039816bacemr6250335eec.8.1779072075393;
        Sun, 17 May 2026 19:41:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm13394794eec.8.2026.05.17.19.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 19:41:15 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 17 May 2026 23:41:07 -0300
Subject: [PATCH] ASoC: mediatek: mt8196: Fix probe resource cleanup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260517-asoc-mt8196-probe-cleanup-v1-1-a5d26949d7fe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw7CMAwA0atUXmPJsaB8roK6SF0DQZBEcYuQq
 t69KSzfYmYG0xLU4NLMUPQTLKRY4XYNyMPHu2IYqoGJWzrQEb0lwfd4cucWc0m9orzUxykjM7s
 9D46IBGqfi97C9/e+dn/b1D9Vxm0Iy7ICxn/9m30AAAA=
X-Change-ID: 20260507-asoc-mt8196-probe-cleanup-222142d1000c
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Darren Ye <darren.ye@mediatek.com>, Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4462;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NQY0kyeCTdDm7O2l5wtg6rcyOWbfpOIoGV+6BXsEjug=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlcNe6JtUFtfgbVXazaLt8rss0LjIzi50y7e38R660Ds
 6zfftPoKGVhEONikBVTZFmdtMhyT9eDq/VxKzxg5rAygQxh4OIUgImUH2JkuHxgTuuh4hOduRML
 b2ex+S46dcbM8f7Mmh3TmJccS/pRaMjwV3xax8suw2mTDQ/z2dZN8OC8M8+I/7dhosam3E97g/c
 mMwEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The MT8196 AFE probe assigns reserved memory with
of_reserved_mem_device_init(), but never releases it.
This leaks the reserved memory assignment on driver
removal and on later probe failures.

The same probe path also uses unchecked pm_runtime_get_sync() calls.
A failure while resuming the device can leave the runtime PM usage
count in an unexpected state.

The regmap error path returns directly while the device is still
runtime active, and the remove path drops a runtime PM reference even
though successful probe has already released its temporary reference.

Register a devm cleanup action for the reserved memory assignment,
use pm_runtime_resume_and_get(), and only drop runtime PM references
on paths where they are actually held.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 44 ++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 511e888567be..a1ae8322d8b6 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2242,13 +2242,16 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 static int mt8196_afe_component_probe(struct snd_soc_component *component)
 {
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* enable clock for regcache get default value from hw */
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return dev_err_probe(afe->dev, ret, "failed to resume device\n");
+
+	mtk_afe_add_sub_dai_control(component);
+	pm_runtime_put_sync(afe->dev);
 
-	if (component) {
-		/* enable clock for regcache get default value from hw */
-		pm_runtime_get_sync(afe->dev);
-		mtk_afe_add_sub_dai_control(component);
-		pm_runtime_put_sync(afe->dev);
-	}
 	return 0;
 }
 
@@ -2306,6 +2309,11 @@ static const struct reg_sequence mt8196_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
+static void mt8196_afe_release_reserved_mem(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2320,8 +2328,13 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = of_reserved_mem_device_init(dev);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "failed to assign memory region: %d\n", ret);
+	} else {
+		ret = devm_add_action_or_reset(dev, mt8196_afe_release_reserved_mem, dev);
+		if (ret)
+			return ret;
+	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
@@ -2422,18 +2435,22 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	dev_pm_syscore_device(dev, true);
 
 	/* enable clock for regcache get default value from hw */
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to resume device\n");
 
 	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
 					    &mt8196_afe_regmap_config);
-	if (IS_ERR(afe->regmap))
-		return PTR_ERR(afe->regmap);
+	if (IS_ERR(afe->regmap)) {
+		ret = PTR_ERR(afe->regmap);
+		goto err_pm_put;
+	}
 
 	ret = regmap_register_patch(afe->regmap, mt8196_cg_patch,
 				    ARRAY_SIZE(mt8196_cg_patch));
 	if (ret < 0) {
 		dev_err(dev, "Failed to apply cg patch\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2452,12 +2469,12 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->num_dai_drivers);
 	if (ret) {
 		dev_err(dev, "afe component err\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	return 0;
 
-err_pm_disable:
+err_pm_put:
 	pm_runtime_put_sync(dev);
 	return ret;
 }
@@ -2467,7 +2484,6 @@ static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
-	pm_runtime_put_sync(dev);
 	if (!pm_runtime_status_suspended(dev))
 		mt8196_afe_runtime_suspend(dev);
 

---
base-commit: 2be19ed9535043fe6abd7ccfc9aac6b7ecaac842
change-id: 20260507-asoc-mt8196-probe-cleanup-222142d1000c

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

