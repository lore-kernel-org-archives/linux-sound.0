Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353BA3D348C;
	Tue,  3 Feb 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137198; cv=none; b=I+EcN51Cd1Jypu3iZwLGzf7hlLVSMWbWXQYY8jelVqHhP1wK9p34V6VQMUafY2rHOSb+1puiSPN+AQ+PVZzR78JdvbaCM84AShtOoNv1x7GHDTmtcSEKlgBetU68Ncti0R/enS43tnkl2EENN9HZspwsOWpjJ4/lu1Cdokg2Scc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137198; c=relaxed/simple;
	bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLP4+bDTiG6pE3cYKCrwIBQDPkdWjA13IIlhXywzSOm7bFGbF6lr9vuHpql2yX5eaXyzhS0CQ8BQ/+/LX62RsJvi1HoniAow7Z7qiURPADOkedE+BCflG36CQ9Y6o88+3wfUq90bDhvnqD+t7nUz/UiFZXFpNrIblrKuMH90CYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pmprN5w7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pmprN5w7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137194;
	bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pmprN5w75oipFVj1vkHikL5kpHDlp/8IozSFgEQJeYT2887bxNE+ILnV1iZruTVc4
	 1j+UlKFM+zQBh511Kquv3iUui5aagoaQMmiHm8Yeu6pBoqwdPA7NF8Pt+XwkSm1xPI
	 B43F4jhZ3mNUeDKm0fEBhBKtNahzvv05N0CZnSAZaiuNzjznFi+FL+MKpO/zwcxypA
	 koOOf3YWGu3M24c6Kp6qqgN+e2mDz2+D7VFhC4p8SCmeeklRMBHlhs0qK062YvTsdk
	 YNkHvCZ87v144IYJEotFAgE2gwUrxb2CPPCrPkq6FVQpnaU3stZRPEIkFvrtUxePVD
	 G8FfJOub4PSew==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B32F17E14F5;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 14224480028; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:25 +0100
Subject: [PATCH v2 03/10] ASoC: rockchip: spdif: Fully convert to device
 managed resources
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-3-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2785;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rwMMsbUCdGGDTM0SilCBE6mODEWndNITn0aSniMBH7Q=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmmX8PJRFPV3YzuO97jWFDcsxO+D17Qqh
 UJ8i6FhXBD0bYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaS/QP/RtK2mrjYHXnWUAAJnBza2Oji43ti8QpEtuUhtxnoQSukxvugAj/1lgXgzvGmUeAdwo
 7/5WKSKaM/uTyF8DdR5MFl7BYezLUuLcUdMZrjBGdXyxleL3lsFi4msT6rrpdDgeeA4rHtx1iYY
 kcNSu3kXt0CDkne8+30hDKUuQP/y245XgW03b4imjn9H+/eGAlcxf3mSZgDbtAgFYCPTybIx+ML
 uUbcGyAZARHZWnMokHGzzxB7r9sha7pMRpT62PSQH5GLea+Yi2/dD9zybFCMuVRN1Fu1SOq7tl9
 XV9yTo9mtVVu5OkijkdRetKSZniWJyp46nXmVMtQnLrxNYQ+KnrCXxDpRP3K9/3McuhnbaHjleD
 iejOWvYemVb6jegTwKLab8baS1hIAHYM1Q8p6LbtGYCjTcGrmshmAsIO6DmdQA+umZofsuQsGuG
 3DfUSNMVzSuRsLZ+X4wUJ0lKLaq2PNquivFTv9pf1EUjLDor3dxDu8N2h/616ypfESc7Dq8GeXL
 efxC0vDaxcGf9Ln3K59SWkvSgyEaLn3fc+3/zGrgmVhKAsCNU0nf1mPbVz9FQYHe76zycfQTS3f
 T69/49/hXxOXmT+Gk8Ab33s0UJtBhrZFGsnT6VdX9pXNtaY0ggC4KysH3ZULJQm9KKYg3Yqagbx
 RELGYMtwpqEAwQ42CnCUv0w==
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

