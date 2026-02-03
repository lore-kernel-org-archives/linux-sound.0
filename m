Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1D3D348B;
	Tue,  3 Feb 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137198; cv=none; b=MUXfEI5TLYvLI+cRxC2qvJuH0vQhlrb3ofdWzTu/E4mTyRXiFviabbV5zJoab3w87ZD2HuiHA085WkHssd82nUIcsMMK/F2ANtsPAdU74mWVvZviYjtUnBMRDrkxcWUYLK2g98jRdvam0cVYX5pyTtQJKx3k0RcZqArTxeyFGIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137198; c=relaxed/simple;
	bh=kL9kNvqSXpOVHTWoVnZEkOBC5bbK790jsX9GDjm0yZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kulbQYSYbGgizi298SiHrU0mvXLnm7CwCLNt5KrD/goyUnSUGVhzKF3cndUMWS7hTQOcAcn/a7P79Ge0GmArPwjKu6HQZfw9ZFAznhUzBERJLSfbIArnVhLQMLpaLvR7/IJTazbuTisnpAt7dCV8RBveiviCFuhH45ND2n1XeEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SmdDJkl6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SmdDJkl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137194;
	bh=kL9kNvqSXpOVHTWoVnZEkOBC5bbK790jsX9GDjm0yZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SmdDJkl6OaIB5sdX5xGivZrL2b4hCZ9JGmmngEIkpnKg0sT1PGapaWDC1pZAgCG6c
	 5oXyzbH9g8sKtaXNcVnQLe+OGebbd3kutsBSqJqWdyQv8BU1TwFgdhp1W4LYBpFvjK
	 EDQDsqU4RQdE1pUrMu0MvSiCq477ThoIztg92VlE0F3wPjhyliyt+1Bmd2O+cQpVbN
	 axkWI8g6mIv++wsx0raFfyZMRNR7fLFTiFo8YrcslvT2HR4/X7duvWGpjfIlIWt/O4
	 uvCbmBScZcvTeofb7pyJCzXrKih1mD8MA+18YVB/rYbigXLgEA2x5K1Jup57iPjbww
	 xfZykvdeKvPgg==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7692517E14D8;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 134CE480026; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:24 +0100
Subject: [PATCH v2 02/10] ASoC: rockchip: spdif: Move DT compatible table
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-2-4412016cf577@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kL9kNvqSXpOVHTWoVnZEkOBC5bbK790jsX9GDjm0yZg=;
 b=owJ4nAFsApP9kA0DAAoB2O7X88g7+poByyZiAGmCJmktJo4NHOcyG3Dl6iUdAhqQQtSzGBW7n
 0uoPRTCGokqjIkCMgQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaaVsP92jEScDntHiO/GZ0jdwzx3WlhlhIDAvOU0LpoW//NRlHvQmwIeL5tSIy0uFvqIwoUDv
 xKxBgBMI8GfSOL7PN/Q+s/6djx7WY1Qoz84Otb1N8XgdSxyLhKB9mH6Jlr65GXGPypgg1qisklX
 enFK0g1CxLD4XKre4PW6vsj4E8TwsH4vfT7eSDnVXhuCFua2FMiIK6Dm8HxYsNab89A46zOKUwG
 Fku82u2OOeT8989JzrJ3FM0MJdcO3JCqkEdFxBznU9sJR8M8l2XylwfTfGuBnGibPAuXCc0JjSu
 kWpXRgGwjNg3iHHgWMNu7IhG5KNy6YNOnEO56VuA++rvj6nRAxzRVz/XtDCeat7Qb0ICdzA/Gqp
 2BVsD1x/hJ8fDPeFEgJMqmP87H994XNmdxXgo27OyGxhEecXnTqn0c8IYZTJpdSrRpmRCJioopR
 nC78QzQiGqz8mbAYK1R9OrPB9f6XSTTAX+VuIb+EeVOHzAhlh6EN+nbx2GO5y6OpPgJ2ZO/LSZX
 czXyWK3H3P6Kt9v2PX5uS+BBMNjxhhUJ8lcjqq+36LD3qpWWZoy2r1rGQcfIo9ubKso8On9IFRa
 nr7RPhtKpXqxeQpTCOy0VsnQkcItLY0H5yq5RnMa5vvk/wh2fbmbtioiRMNqk9BOCK6/6dEpVeN
 XZkegABkDVBg70mW7oyJz
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Move rk_spdif_match DT compatible table to the usual place before the
platform-driver struct definition and drop the useless of_match_ptr(),
since it is fine to reference the DT id table even when OF support is
disabled (which makes the driver useless anyways).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 48 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 23f14274a6e0..331a23d5173f 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -40,29 +40,6 @@ struct rk_spdif_dev {
 	struct regmap *regmap;
 };
 
-static const struct of_device_id rk_spdif_match[] __maybe_unused = {
-	{ .compatible = "rockchip,rk3066-spdif",
-	  .data = (void *)RK_SPDIF_RK3066 },
-	{ .compatible = "rockchip,rk3188-spdif",
-	  .data = (void *)RK_SPDIF_RK3188 },
-	{ .compatible = "rockchip,rk3228-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3288-spdif",
-	  .data = (void *)RK_SPDIF_RK3288 },
-	{ .compatible = "rockchip,rk3328-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3366-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3368-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3399-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{ .compatible = "rockchip,rk3568-spdif",
-	  .data = (void *)RK_SPDIF_RK3366 },
-	{},
-};
-MODULE_DEVICE_TABLE(of, rk_spdif_match);
-
 static int rk_spdif_runtime_suspend(struct device *dev)
 {
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
@@ -377,12 +354,35 @@ static const struct dev_pm_ops rk_spdif_pm_ops = {
 	RUNTIME_PM_OPS(rk_spdif_runtime_suspend, rk_spdif_runtime_resume, NULL)
 };
 
+static const struct of_device_id rk_spdif_match[] = {
+	{ .compatible = "rockchip,rk3066-spdif",
+	  .data = (void *)RK_SPDIF_RK3066 },
+	{ .compatible = "rockchip,rk3188-spdif",
+	  .data = (void *)RK_SPDIF_RK3188 },
+	{ .compatible = "rockchip,rk3228-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3288-spdif",
+	  .data = (void *)RK_SPDIF_RK3288 },
+	{ .compatible = "rockchip,rk3328-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3366-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3368-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3399-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3568-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rk_spdif_match);
+
 static struct platform_driver rk_spdif_driver = {
 	.probe = rk_spdif_probe,
 	.remove = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
-		.of_match_table = of_match_ptr(rk_spdif_match),
+		.of_match_table = rk_spdif_match,
 		.pm = pm_ptr(&rk_spdif_pm_ops),
 	},
 };

-- 
2.51.0

