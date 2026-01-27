Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F0307AE3;
	Tue, 27 Jan 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530134; cv=none; b=Ut3pPWsjikPlrneIAmfeprPN5z/7Z91/Lo5MTw985R7yGHrSVoa0tOspyAadMgtTvBPlVX4txz2OHZ347cOIVrz3FaGOueSr+c+T2i+/aKzfq+1C9VAEQAyjb+X9PGvxVm/uRhXGAZBoa13UbPufo3gkcD5RqcntqLr4itfn2tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530134; c=relaxed/simple;
	bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8G7wClGDXefrWCkOYUErQSMDpapnLsXE46fboLsWJzsTMHn2OvAneHSPruocMS85Of6ls7ajpghaTJ0Is2Hx2Fh0v8cUmhin31a9DzWjAKNFqFlm4kR9XhAxJfFFwEyRjjzkm+oO2QUGQIhJyNFW0aM1vuU7LFaoIww08VfqJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h3al06Ut; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h3al06Ut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769530129;
	bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h3al06UtLjaUn79ImAhJtV0zYUAoMwzayJfWsmPJgSagFWxCHXLdLz3efdH4/XWLk
	 7uZuw991fFkXex1f0RisZD1TRHQa+dV0qHeYcclB+kChVIGGJlDerhks4SJI6nHDeS
	 85wBRnqVnCh1vibpLdLfhwGvEotGCuoT6uv0BQw1CurjDgM6j78F+c1e2XX0HTFMjH
	 wiDoTsnE26vPBn77fsgEdYcW1g4TUwKp4vS5wwsS6qCeyCBYpXinpQ6uLxyJH+uZTt
	 bytwbU9ByB9GRMvhGmww16UFd0dRKkE328meuPswTWlKuUsX35GAjNMIzURB/ZkjDY
	 RtGlUFP2o+2Zg==
Received: from jupiter.universe (dyndsl-091-248-210-071.ewe-ip-backbone.de [91.248.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A07C17E1352;
	Tue, 27 Jan 2026 17:08:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3606048004E; Tue, 27 Jan 2026 17:08:49 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 27 Jan 2026 17:08:23 +0100
Subject: [PATCH 03/10] ASoC: rockchip: spdif: Fully convert to device
 managed resources
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-3-a7c547072bbb@collabora.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2785;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGl44xCDP4Q1D/C1Aex7BXRN+YdP808viyEEO
 8NwXFzj/wBiJ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpeOMQAAoJENju1/PI
 O/qaRAgQAKj7uIAtpap/z7biJwIV0Ge4fdSYeGpOdj/U2CEHt0cVvGZN4/EMj/DKAOdJdAoJoBn
 FQ/OKZ2IBmXHwpRaXbNqMCtATg1N2zvPYCLeLdQGK8gxXujQEdA8O0NvQUyG0EGtPwSeD4WrtvR
 wwJfD2LU0B2ZPTpT2BVhw17Wsti5nP4NZS3J6M6wJLyi4qRJMNwnvoHbgHFA2Z6gZbInTze49mt
 hfdq7YuHdsfGSi/W1qo8CCGdqPXbWqRp4V44NeQdGyP5rzXV9duvMSjTcxCutES/rzYttyPePyb
 GK0LDvRMOsLt3VMhM844e81JqZA+OJHLk8AuG+xueq4uFNyaTwHlC1N3A9ieP3lVcd11xWrc+kR
 psACCEFPhFfw/AewcSCkhVvHMdjngfsk4IXkAEfcD2CxPhXSShIhvjWICRq6DHLkPSbmhUjML8Q
 db9hTo1tDMeAiGj8GYhw2+IZLNF/ShGjLaMWuWXXMOCx0gGxlf1MnfqWtp4oOy7ceimSW18/S5K
 ASyOrRenNcTaPUcWZnD5Q3FyKv+i3Tx7IP+wUA9nYWUndghwGmkhbF3NPYjueY+6FQmOmXovCMU
 kYwoPAS7NeiGKH69NOa/bLvmyY4FDOvM9zDh0gB6qY2SBbEclJvUaNdmyr3Y0aYIdEYm/myGu/j
 D9FRN58h/H3hnHWbq7TYsWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This driver mixes device managed resources with unmanaged ones
and (as a lot of them do) gets the order wrong resulting in
potential race condition problems at module removal time. Let's
go to full device managed resources to cleanup the code and get
rid of the potential race condition.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 331a23d5173f..841ef499ed7f 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -257,6 +257,14 @@ static const struct regmap_config rk_spdif_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static void rk_spdif_suspend(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		rk_spdif_runtime_suspend(dev);
+}
+
 static int rk_spdif_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -311,11 +319,16 @@ static int rk_spdif_probe(struct platform_device *pdev)
 	spdif->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, spdif);
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, rk_spdif_suspend, &pdev->dev);
+	if (ret)
+		return ret;
+
+	devm_pm_runtime_enable(&pdev->dev);
+
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = rk_spdif_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_runtime;
+			return ret;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -323,31 +336,16 @@ static int rk_spdif_probe(struct platform_device *pdev)
 					      &rk_spdif_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
-		goto err_pm_suspend;
+		return ret;
 	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM\n");
-		goto err_pm_suspend;
+		return ret;
 	}
 
 	return 0;
-
-err_pm_suspend:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		rk_spdif_runtime_suspend(&pdev->dev);
-err_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
-}
-
-static void rk_spdif_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		rk_spdif_runtime_suspend(&pdev->dev);
 }
 
 static const struct dev_pm_ops rk_spdif_pm_ops = {
@@ -379,7 +377,6 @@ MODULE_DEVICE_TABLE(of, rk_spdif_match);
 
 static struct platform_driver rk_spdif_driver = {
 	.probe = rk_spdif_probe,
-	.remove = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
 		.of_match_table = rk_spdif_match,

-- 
2.51.0

