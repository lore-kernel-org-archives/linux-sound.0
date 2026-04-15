Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94117336891
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257273; cv=none; b=Dqg/6pgsnGMMK/14ka9TvfIr9NYHRCODjsjRf/O7sch0xzb73mOoKk8TF3UtVw+MoNE50DLfeBK4D9oDAOdjn85O8KQhYkctWAW60JlOi9K2Fr0dkxWE8hrgmggMpUcvO7/5chIO6cOhly1xcZELV+hp6d4d306HoIR+/jZ5x18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257273; c=relaxed/simple;
	bh=o7cX6xYLyuos94ZpDZbf8yhOnasEgZX1AkNvoBGmzKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aRFSNtz5Cvq4Lg/GQwVwt7T5oNZWfgaUPiay8JASEcov8mLvmrH5u5tb+DrQpZOVMdHwBB9WrdZV1TuDGdLM4A+EfjN1nJ/IEidz3b60NVz4BtSChK5DmaoudnTAxOJfDH1M++UtnI9gCt/Rxh4Bl9WWEYqZ+UtZ4mrlkcfzAJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAFGxp2/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAFGxp2/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so44881125e9.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257269; x=1776862069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9HiyLdpQmGO7ARO5mYvJF04K3eGYiJQbh378YAjq5M=;
        b=mAFGxp2/a8iG/tmvifpQW35BASlyMVMoZpVFABz07/on262/GKHAbEw5ar1MJ0AFQ/
         toiOqFXWbzeRjgmLgTFC4DMuWC51Yk2kHdawEzbBnVKUBlNdYz+qG4FtlHASXK9N+V5f
         U35XR9WgLy8cPXYVOF+nbr5yQFn15fRreosHXnI4Ab8VhhCupKJfo+y5AgAHulf1WTPt
         FfHz+NBHAOfnTNm+u6xruMD7DWLWOC9wrzJeJp86XLtEZw/KcaA61iyvJ0XA4BoOx6BK
         CX0PeGt0BLWXCixeOZJQRmLcu3xOB0UwCa4hUoke7oRuGPI+Ye43eaMFOciOmmpAkJn6
         FOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257269; x=1776862069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9HiyLdpQmGO7ARO5mYvJF04K3eGYiJQbh378YAjq5M=;
        b=nTVJwCsnjPfJTLQ6PhX6Rwlpwn5FpcaMfNLNGy+RXCz9Ix0+XFMJ2pO5FS3Vh3FdI4
         DTLF14+IXvfsaBEU5w3P81AAIMuFHNa7ZrTCj+i0xT8Z17nnL66SAEdLUG+ZI3+EZXVk
         01G5ZnY/pizMUpOp0GWhegqZ645tHE0huJPwlIHcISk9UX0flFS88lN67rJJbd2GOTq5
         xTg00r/EvJCGXz+s8/0EJwDDHlSyx1kYtVORyMuXQH9F6PPYOds+S6o6i909C9aW7D+n
         VnSRpExYajZHP7mN6b7caGw+VX1zoLlF/1yGybaxTEllEr6ATXOMg2qicBRkjO0ffBBQ
         hkSA==
X-Forwarded-Encrypted: i=1; AFNElJ8vT+6iIicICOsRKFOj/X/MA766JpgAxNLDJneEM0BZPvgpU8e1DcojBhZAtc4G1B8futC6OYrm3SmXJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbpa3DxDP9zczczebY1S5/8Mhz3b2YnRUe73CWfzY/nVffZLDJ
	14dSKN/3CZK8H3GRiWnoxdNc68ft/JaTLmhkXBgppMisPmsY80zzrCyR
X-Gm-Gg: AeBDietdtbrJURzmay2UokwERMxzylAbKiZv1RtK6hdbG6s5R8yJqGTrofLx4AiOnp8
	ujeDVGocBb7nDe+JfTaSLSiViXmYAKXE5Ae5t1oeWscrR94bhvbYFPVrRZg+NiPC7Ka3tr5pmGD
	ZTRe6a9SRzz6X49XpthnrIGkeKAEvslHYRe7tki1NDS9V0QWcqFb+075IbLrtxp11EODFFPl5kL
	JNSHOQgyKpXi3hRMQZrXtf84Fja54ScnIkMG0Ts+NlsJLPNHx2ypvBbfAAuOx15FiZrjmCQZHEl
	JswkGbfnGvQ0xzdCA/6RMUy9KX+We6XKg6YzGmC3aTMQ1dBbE/vnarenkHOkXASIDoiKVD67y6k
	xAtgJ0WEfbLjwoNhMNcZoHuDwj/idoAwr6qv6ae/cIIKNmKZaWB/LPJFW/ao3u6ZX2gSEkMYAx8
	MT4C4b09tcJwAuI/dDseMS9YKWqYd0k7k3VsR0Tw==
X-Received: by 2002:a05:600c:c08b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488d6816f66mr207396055e9.2.1776257268742;
        Wed, 15 Apr 2026 05:47:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:48 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 12/14] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:29 +0000
Message-Id: <20260415124731.3684773-13-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
reset and clock management unlike previous R-Car generations:

- scu_clk: SCU module clock
- scu_clkx2: SCU double-rate clock
- scu_supply_clk: SCU supply clock

Without these clocks enabled, the SRC module cannot operate on RZ/G3E.
Add support for the shared SCU reset controller used by the SRC modules
on the Renesas RZ/G3E SoC. All SRC instances are gated by the same "scu"
reset line.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: No changes

v4:
 - Move shared SCU clocks (scu, scu_x2, scu_supply) from rsnd_priv
   variables into new struct rsnd_src_ctrl, following the rsnd_dma_ctrl
   pattern for shared non-per-instance module resources
 - Keep original declaration order for struct device_node *node

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/rsnd.h |  1 +
 sound/soc/renesas/rcar/src.c  | 59 ++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 953a2d998a03..70e395d3c6ef 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -679,6 +679,7 @@ struct rsnd_priv {
 	/*
 	 * below value will be filled on rsnd_src_probe()
 	 */
+	void *src_ctrl;
 	void *src;
 	int src_nr;
 
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 8b58cc20e7a8..651ed378c4f7 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -54,6 +54,14 @@ struct rsnd_src {
 	     ((pos) = (struct rsnd_src *)(priv)->src + i);	\
 	     i++)
 
+struct rsnd_src_ctrl {
+	struct clk *scu;
+	struct clk *scu_x2;
+	struct clk *scu_supply;
+};
+
+#define rsnd_priv_to_src_ctrl(priv) \
+	((struct rsnd_src_ctrl *)(priv)->src_ctrl)
 
 /*
  *		image of SRC (Sampling Rate Converter)
@@ -516,6 +524,7 @@ static int rsnd_src_init(struct rsnd_mod *mod,
 			 struct rsnd_priv *priv)
 {
 	struct rsnd_src *src = rsnd_mod_to_src(mod);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
 
 	/* reset sync convert_rate */
@@ -526,6 +535,12 @@ static int rsnd_src_init(struct rsnd_mod *mod,
 	if (ret < 0)
 		return ret;
 
+	ret = clk_prepare_enable(rsnd_priv_to_src_ctrl(priv)->scu_supply);
+	if (ret) {
+		dev_err(dev, "Cannot enable scu_supply_clk\n");
+		return ret;
+	}
+
 	rsnd_src_activation(mod);
 
 	rsnd_src_init_convert_rate(io, mod);
@@ -549,6 +564,8 @@ static int rsnd_src_quit(struct rsnd_mod *mod,
 	src->sync.val		=
 	src->current_sync_rate	= 0;
 
+	clk_disable_unprepare(rsnd_priv_to_src_ctrl(priv)->scu_supply);
+
 	return 0;
 }
 
@@ -713,6 +730,8 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
+	struct reset_control *rstc;
+	struct rsnd_src_ctrl *src_ctrl;
 	struct rsnd_src *src;
 	struct clk *clk;
 	char name[RSND_SRC_NAME_SIZE];
@@ -728,6 +747,12 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		goto rsnd_src_probe_done;
 	}
 
+	src_ctrl = devm_kzalloc(dev, sizeof(*src_ctrl), GFP_KERNEL);
+	if (!src_ctrl) {
+		ret = -ENOMEM;
+		goto rsnd_src_probe_done;
+	}
+
 	src	= devm_kcalloc(dev, nr, sizeof(*src), GFP_KERNEL);
 	if (!src) {
 		ret = -ENOMEM;
@@ -736,6 +761,28 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 
 	priv->src_nr	= nr;
 	priv->src	= src;
+	priv->src_ctrl	= src_ctrl;
+
+	src_ctrl->scu = devm_clk_get_optional_enabled(dev, "scu");
+	if (IS_ERR(src_ctrl->scu)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu),
+				    "failed to get scu clock\n");
+		goto rsnd_src_probe_done;
+	}
+
+	src_ctrl->scu_x2 = devm_clk_get_optional_enabled(dev, "scu_x2");
+	if (IS_ERR(src_ctrl->scu_x2)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu_x2),
+				    "failed to get scu_x2 clock\n");
+		goto rsnd_src_probe_done;
+	}
+
+	src_ctrl->scu_supply = devm_clk_get_optional(dev, "scu_supply");
+	if (IS_ERR(src_ctrl->scu_supply)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu_supply),
+				    "failed to get scu_supply clock\n");
+		goto rsnd_src_probe_done;
+	}
 
 	i = 0;
 	for_each_child_of_node_scoped(node, np) {
@@ -759,6 +806,16 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 			goto rsnd_src_probe_done;
 		}
 
+		/*
+		 * RZ/G3E uses a shared SCU reset controller for all SRC modules.
+		 * R-Car platforms typically don't have SRC reset controls.
+		 */
+		rstc = devm_reset_control_get_optional_shared(dev, "scu");
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto rsnd_src_probe_done;
+		}
+
 		clk = devm_clk_get(dev, name);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
@@ -766,7 +823,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(src),
-				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
+				    &rsnd_src_ops, clk, rstc, RSND_MOD_SRC, i);
 		if (ret)
 			goto rsnd_src_probe_done;
 
-- 
2.25.1

