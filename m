Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419813;
	b=WEXyqOQSaidgi5+RyFL9vvELglUCmWkNS0RITuUDA6B8jOAqx95FolZoeEIWybYJEMMo
	 jeyFRTFJOuTHn//mLVgU5YW2WLbfE3Xr2ZbJDgYsKHc02TwMVE+EeqhPzCRnTPfEHL9wW
	 c4+ghaviOj7MAxGD0SlOYIiiJqmgARRQ0VOZJpf7DqvJuquP8ESm/tBSpRuvXVOSZEbNz
	 BDVOaCEI5pN4aVkY5g6v4WwOscdstO4EkqwkrC0HlxUHtay+3wxuxSskEsYW8A6iSoH/A
	 q/IOzhuW37hTIsMel1xG8FI1sS7NSMdEU4ynSh8LM78jGyUof6Upvfo5+Mx9NH3mn+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419813;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3s3oA+u0H6a4lKx+c9GboAwYFSdRKDU2CgYddA0tZCg=;
	b=uoe3GuABDxR939ruR43rQiwcm/duZ4/TXM3PFLMxq9vpgIfDNVdfBrBgkaOI5E9Lj80D
	 m9KNKFC6GWIE4jtIrGfx2Z/C5KFxYBvaHzpYPzFZFcLa/mlwiKR/XDSBhgQUYHYyOKlit
	 jFaTZlS8q4DCM85uobmK9Kvhh8wWSwa12v73a6rPCRyBPAfVTHeAwi5YKxtZwHUsbNBCI
	 1+JNz9YJCCmmFZ5RC6G6RAtmHUKTiS8nwEI7KHTAeYapsZtQCWiVz9MhMCllCeqzhXGve
	 qhchcUNAhfNXplE/yNR14pJoMQdxofrRuEj6Wiux9FqsPwd5VYE3zVIGzbmINO1TycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vuq3J68w;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F19606A31A;
	Mon, 23 Nov 2026 07:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F19606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vuq3J68w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vuq3J68woXJgi7jG8hvgDNB5il+19wwqo0VgZtvjuSYTJZ5EDenuKLbRDYiOhzY7hH260UQT9l83s
	 Ry07KWuJELHvSywmc7Vza7naoBg7x/HhS5b6tped1bJi8pcBazzjk3YGfHwyWjFMju6n/iNRxw1DHW
	 5K2BsvFmbXY9By3k=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16b03ee9a65d-173a1;
	Mon, 23 Nov 2026 15:43:27 +0800 (CST)
X-RM-TRANSID:2ee16b03ee9a65d-173a1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b03ee9d78c-f4bec;
	Mon, 23 Nov 2026 15:43:27 +0800 (CST)
X-RM-TRANSID:2ee86b03ee9d78c-f4bec
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH v2] ASoC: mediatek: mt6797: Fix runtime PM handling in probe
Date: Mon, 23 Nov 2026 15:43:25 +0800
Message-ID: <20261123074326.11494-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

The MT6797 AFE probe registers its components even when the runtime
resume fails to enable the clocks. If component registration fails
after a successful resume, the probe disables runtime PM while still
holding its usage reference. The runtime PM disabled path also
returns the previous successful result without registering components.

Use pm_runtime_resume_and_get() and stop on a resume error. On a
component registration failure, drop the probe's reference without
idling, disable runtime PM and directly suspend the AFE if it is still
active. This ensures the clocks are disabled even if userspace forces
power/control to on or a resume races with probe cleanup.

Keep failures before a successful resume on a disable-only path so
cleanup does not disable clocks that were never enabled. Return an
error when runtime PM is unavailable.

Fixes: 3901b9fc0f0d ("ASoC: mt6797: add mt6797 platform driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 2069c340ca39..cbe7c3a2eedb 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -828,16 +828,21 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, afe);
 
 	pm_runtime_enable(dev);
-	if (!pm_runtime_enabled(dev))
+	if (!pm_runtime_enabled(dev)) {
+		ret = -EOPNOTSUPP;
+		goto err_pm_disable;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
 		goto err_pm_disable;
-	pm_runtime_get_sync(&pdev->dev);
 
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	ret = devm_snd_soc_register_component(afe->dev,
@@ -846,11 +851,19 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 				     afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	return 0;
 
+err_pm_put:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt6797_afe_runtime_suspend(dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(dev);
 
-- 
2.51.0



