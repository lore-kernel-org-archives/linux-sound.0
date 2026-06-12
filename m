Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132F1E515;
	Fri, 12 Jun 2026 21:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300950; cv=none; b=ecvCeGy0hCMFrXyoqiBmn7mEXr1KKvYmj/svqM8lVBZ5BXbPFku0VrJRQ7w5RxvUL+8DYJrMTk5GNyW3M7vRi6/syfJ91YBo8k5aRPsk1fS4ycUj6KzPlxOQzCItl30LJUmOc6YurECheJj5bagU0p5xTn0HMIvkAKBanRUVBFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300950; c=relaxed/simple;
	bh=otIg3YKplZUNBJtJKc2PD4NMu0SS8WCANxcv3emAAao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9p5zYq7Dhn08xHSgTvB0lGgyUfDr0tkSGVv+ezRtAzC0lMB8O+j393Bb7dA4xg9pYg2LEwNnUkwvKaTgTqdqmlAqq5WOiK/gzStxl2aHZR41yMAr9S3z/L2sws8KOUbdZssI7050Ae52S0pNA8T/7Z/WG2mFCz3HOHK9iP7qD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgvZfUYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgvZfUYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D061F000E9;
	Fri, 12 Jun 2026 21:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781300949;
	bh=+cf6F8jctolB5ST6PmkJlXK4IfpFbZ885OFDt8xDlHY=;
	h=From:To:Cc:Subject:Date;
	b=NgvZfUYslzX69igJ98J3aKT5QpU/LvB+bcvR6IfHjp5Ak8lNc1d5l+rmPB39l6sFi
	 0aySnOnRT55a8pLRaXgSjbf69pomTKepuO3nuJOPtdUy2LlCye86QbEU+JGm4Q8Y6B
	 6dZHAmAdJ9ox92iyGvy2DnX0dz5g4FsW05nlfiBs42khlKDv6oiRsoRy1+hukQe2W6
	 cNuJVYoovR9QSSCcGWOuDiHylkFsw9cy+OUYo0m6BLWPeZ8bpiBMWQ28Rv0WhY86eN
	 8IgEcw/yT3MnT0CgeYKfU/IIInbT+g7N+YyrKzuReRINdkI49LLDyBe3d2CSafiXH8
	 1LirCTdSBWmvQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] ASoC: Match DT helper types
Date: Fri, 12 Jun 2026 16:49:02 -0500
Message-ID: <20260612214904.1882991-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The affected ASoC drivers read properties whose bindings use boolean
flags, normal uint32 cells, or phandle-style arrays. Using helpers for
a different encoding makes those accesses disagree with the binding.

Use helpers that match the documented encoding and keep the existing
driver storage by copying through temporary values where needed.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 sound/soc/codecs/ak4642.c         | 2 +-
 sound/soc/codecs/sta32x.c         | 6 +++---
 sound/soc/codecs/sta350.c         | 6 +++---
 sound/soc/codecs/twl4030.c        | 6 ++----
 sound/soc/rockchip/rockchip_pdm.c | 3 +--
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index fe035d2fc913..b68555c8fbaf 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -613,7 +613,7 @@ static struct clk *ak4642_of_parse_mcko(struct device *dev)
 	if (of_property_read_u32(np, "clock-frequency", &rate))
 		return NULL;
 
-	if (of_property_read_bool(np, "clocks"))
+	if (of_property_present(np, "clocks"))
 		parent_clk_name = of_clk_get_parent_name(np, 0);
 
 	of_property_read_string(np, "clock-output-names", &clk_name);
diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index b9f9784f5164..857b729e6978 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -1038,7 +1038,7 @@ static int sta32x_probe_dt(struct device *dev, struct sta32x_priv *sta32x)
 {
 	struct device_node *np = dev->of_node;
 	struct sta32x_platform_data *pdata;
-	u16 tmp;
+	u32 tmp;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -1063,8 +1063,8 @@ static int sta32x_probe_dt(struct device *dev, struct sta32x_priv *sta32x)
 		of_property_read_bool(np, "st,needs_esd_watchdog");
 
 	tmp = 140;
-	of_property_read_u16(np, "st,drop-compensation-ns", &tmp);
-	pdata->drop_compensation_ns = clamp_t(u16, tmp, 0, 300) / 20;
+	of_property_read_u32(np, "st,drop-compensation-ns", &tmp);
+	pdata->drop_compensation_ns = clamp_t(u32, tmp, 0, 300) / 20;
 
 	/* CONFE */
 	pdata->max_power_use_mpcc =
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 71af82b099c0..367d60577906 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -1091,7 +1091,7 @@ static int sta350_probe_dt(struct device *dev, struct sta350_priv *sta350)
 	struct device_node *np = dev->of_node;
 	struct sta350_platform_data *pdata;
 	const char *ffx_power_mode;
-	u16 tmp;
+	u32 tmp;
 	u8 tmp8;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
@@ -1131,8 +1131,8 @@ static int sta350_probe_dt(struct device *dev, struct sta350_priv *sta350)
 	}
 
 	tmp = 140;
-	of_property_read_u16(np, "st,drop-compensation-ns", &tmp);
-	pdata->drop_compensation_ns = clamp_t(u16, tmp, 0, 300) / 20;
+	of_property_read_u32(np, "st,drop-compensation-ns", &tmp);
+	pdata->drop_compensation_ns = clamp_t(u32, tmp, 0, 300) / 20;
 
 	pdata->oc_warning_adjustment =
 		of_property_read_bool(np, "st,overcurrent-warning-adjustment");
diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 9476cdfd4dde..91f5f907951a 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -202,13 +202,11 @@ static void
 twl4030_get_board_param_values(struct twl4030_board_params *board_params,
 			       struct device_node *node)
 {
-	int value;
-
 	of_property_read_u32(node, "ti,digimic_delay", &board_params->digimic_delay);
 	of_property_read_u32(node, "ti,ramp_delay_value", &board_params->ramp_delay_value);
 	of_property_read_u32(node, "ti,offset_cncl_path", &board_params->offset_cncl_path);
-	if (!of_property_read_u32(node, "ti,hs_extmute", &value))
-		board_params->hs_extmute = value;
+	if (of_property_read_bool(node, "ti,hs_extmute"))
+		board_params->hs_extmute = 1;
 
 	if (of_property_present(node, "ti,hs_extmute_gpio"))
 		board_params->hs_extmute = 1;
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index c69cdd6f2499..966105a544f5 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -546,8 +546,7 @@ static int rockchip_pdm_path_parse(struct rk_pdm_dev *pdm, struct device_node *n
 	unsigned int path[PDM_PATH_MAX];
 	int cnt = 0, ret = 0, i = 0, val = 0, msk = 0;
 
-	cnt = of_count_phandle_with_args(node, "rockchip,path-map",
-					 NULL);
+	cnt = of_property_count_u32_elems(node, "rockchip,path-map");
 	if (cnt != PDM_PATH_MAX)
 		return cnt;
 
-- 
2.53.0

