Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075163;
	b=mpz0rtp8iNdkn67lInd2EWNsxi0qOaomsrHlkSv/B3JdjxJbFbbm5l5/Z5iEPuuhNuAV
	 1nzn+5YCQUJdw8Xe8q/FNl6HmZe2HjrsL8AiN2siTfNpmahMK0UWlyLs/sOXq+HKjkOXv
	 Ibe0BUVqESEnclND7fuFhJLYqhNUzdXZuYYL6qvh99iPboYsmUrBK+cy2Y0OxD8yQx8ud
	 +P+tfHcQeNthjdjqUcdHJmyscyvK/ag9LqOO1USCjfhWFqC06usWeoVI5QbALg1JxkhS5
	 kuFx+Ciz5aFrQqT7lm49H/sBrdJC2FLn2KUaQqcvkGCeYtKAQ7xPKyDOJ/EFXyWHxwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075163;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UdjPNcmatNIX+1KGlhz64cm24KVbVuKMospPTTHbxLU=;
	b=UgCtmEOJohkk5PgNJbmcySfjfnWSCKlS9QiWu/PblkUfeQTCmRQxlPeeMHpF7iJ0prsr
	 +/uT2SzZ6mD1Pok+xVcpAvaUcPkkrEikqq/fkU3XzR5F3nn+iSeAe8kCmwKMFr20RYExz
	 t5mfUZlL24Wq3VglpsKXjYP33jD3o68ZVBivO0vVngcGfNrN7n1s+EyLYDrEEms63hNDc
	 y0dgqoDfq3MLzR+dwqwIylQO2od2cy8BaixcGDnDkzqg0eArHUMtIjDcgtct4jlp/qOCq
	 qwYZBwp2ieIM7BsD+LZAhrZCGMjrJBrwwPdpV6qplLV+dmpqu6EDBEXxyRjJEq7qThw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oREPfXNb;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E699D606A325;
	Thu, 19 Nov 2026 07:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E699D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oREPfXNb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=oREPfXNbq9pUlOmdRIhWWrPWgkyv47/NeDgwJYlNg+HMQ+EUOsaHYr9I6qcidSMdFhj+ihUluVV4w
	 71l+uoqdEvdr15c2Dh7keE7qv9k63PSqCbL/2eECezh1LdnyR7F2VPeSgabN1s95mbbTC9chxpBtDZ
	 BQfSvlW+abQdynWk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afeac563f7-bb912;
	Thu, 19 Nov 2026 15:59:19 +0800 (CST)
X-RM-TRANSID:2ee46afeac563f7-bb912
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afeac55dda-f590c;
	Thu, 19 Nov 2026 15:59:19 +0800 (CST)
X-RM-TRANSID:2ee66afeac55dda-f590c
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
Subject: [PATCH] ASoC: mediatek: mt6797: Fix runtime PM handling in probe
Date: Thu, 19 Nov 2026 15:59:17 +0800
Message-ID: <20261119075917.50241-1-zhujun2@cmss.chinamobile.com>
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

Use pm_runtime_resume_and_get() and stop on a resume error. Drop the
reference and suspend the AFE on either registration failure before
disabling runtime PM. Return an error when runtime PM is unavailable.

Fixes: 3901b9fc0f0d ("ASoC: mt6797: add mt6797 platform driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 2069c340ca39..406a86035785 100644
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
@@ -846,11 +851,13 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 				     afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	return 0;
 
+err_pm_put:
+	pm_runtime_put_sync_suspend(dev);
 err_pm_disable:
 	pm_runtime_disable(dev);
 


