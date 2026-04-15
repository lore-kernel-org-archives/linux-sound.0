Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818BC336885
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257264; cv=none; b=G3BmwQ3Hqe0fFjr8oHQaibn72ywJ3TN4O2F2kMWpDiTpoBq9bjRMkL9rDy50KBBo4Yp74TI24iYDm1iAX0Sq+5OBz9ks7xuY1MhSYMfq93efnNBsHPz50ciH9itcuJpC2q1FgZis764O0RxEWtQXx+28owdx0pUK3iSFu6e0m6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257264; c=relaxed/simple;
	bh=1i4vtlL/MuJz61IDw0/C+/bm5U9XK4wosBXKE8p2dsI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sBAw0EtK46Ca0LHMQa0jWKeRMNE6uSm8RUeTNzXRdpKAmP2gl8jCZguUwt+5SSaUDzKPoh6YO1f1fxxbc0PF2mo75Z9ErWZK1B45+CW+V6bsTm//8eYhrZlKCuZ138AqzDY6W2UQMAOIhLezEbIi7xH6oAGuCgIX3hYKCZhFfdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fg+QJ1jd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fg+QJ1jd"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d72875729so2427620f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257261; x=1776862061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnajQ8XOv4b8ZHbW7mJFy+SmDdF5Y0rpVZJX4dT/uKs=;
        b=fg+QJ1jdM1U+9JYftr9loCH3r5mAtsgqj0+5v+OOWqvHHH3rhGeOqAvteX++tUIBrL
         E21eC5OHDssiSOnOAvitUfnfP/+nexA26iYnanGNYrzibO0Yzx2flRqaYDiogsXh/4lJ
         fShN2ML2ge7ihW5VbCw04DhVuaCUNPxZ5rP6CFWmM9KIynB0TKMiPu85dJEzmIOTra6q
         xYaFuVjLO1FJT/Op927wqSfVWNHYffWlHj1L+53Z8UG7Ogi3vMpXIHeapTR81qHSSJ0h
         p09B6+z+zdgl7B9ZMf23WMwHesq32Xagb/CmBxi+6W4iopZdxbh/6u1STe0lhttTbKYE
         +JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257261; x=1776862061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnajQ8XOv4b8ZHbW7mJFy+SmDdF5Y0rpVZJX4dT/uKs=;
        b=Kouf+cnsgFx6Nc6NShpqly/cyaSKgafcs2v+2UALb/Wl0RalKSSqToigLlG4lCrRPf
         p8gJ1YelRAog2nlUoGu+KaqwKSOtPK/LfU8pOfm4tmvlnJpGhxCEdpmYaoMXqsq1tdLo
         nLFq8yRbpAdWJnLN4397qIzBtUjR/LPn1VSIvOclPV+JFiZPHkfpGx7z9qTpPC+F9y97
         gwv4aUq+/85yTb+Md7YxJ+g34jkTL/4uY5LqO4mkE3llNtf/10oTRq11OL8Otarl3kwy
         PZvI98RAC6BJCAMFEbR/QnL1nzyLBKFWpvvin/KlGNhO/jOPyAtBNeLxV/grWPmuTlGd
         JLqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OcNfmoNXheFLQL7QHkVrzkjOyLSHwDlUwgiOA2cTzMsaEL7bP7fXd9BgFqnHgfakNxGmr4fm7UQr4Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPA881xU4mYzP9AW7dnhLcuv2kqrKeU1+QeJSWsnKPtKz0ytuX
	7D7gQgd/H4MauPv/OlB+W3qaHCLUXi+zuChooWeih1yqUUCRdoXqHAzL9SRpNnGlywD6fQ==
X-Gm-Gg: AeBDies6P0EqSyIi2ZA963EW7Ue4oapb+2gqpF7HS/2rYsAN/Tc4OwPcvGfs+vmwdcq
	T/9p5lkJ3jiEDafSBBqMkoImDUd8N1EB7/wzykI6Rzq3RVvX3tTcAwPwrsJU1Tg/UEzYKE6+m2n
	+uvF5MB9iklJsJ3h2DwbRFqQ6RPUW2etvjQUMC4Z4/Vk96RasU6UN3wn23pecwVPPy2oPPiL2+Z
	nGhUNgcNObhCp0LeWV0ZOdB26TF90EQTLOnZN7AqA6YB2C5kUv9TAhL9+s01ylaP859atBqncnb
	ZVyBpOtFyawKE4hiHRDSDpLVn1Zu741/2t3DSOI1s+nmXkCXvAl/hLat+GiuS3LrqWAF0lOteNv
	Cp5M97kHwLYTDDBd0lEsn7xhp7KEuieDs1rCe2l8VTonQ/KYDJejljrLX48uZXh4x18pM8N4tj3
	LGH8s+8dLCmFisUHHr8Zxxd0CQaLSK+qNYwVE8sOdtVAuRkVeU
X-Received: by 2002:a05:6000:40cb:b0:43c:ef4f:79e4 with SMTP id ffacd0b85a97d-43d642b461cmr31372573f8f.37.1776257260716;
        Wed, 15 Apr 2026 05:47:40 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:40 -0700 (PDT)
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
Subject: [PATCH v5 05/14] ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:22 +0000
Message-Id: <20260415124731.3684773-6-john.madieu.xa@bp.renesas.com>
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

RZ/G3E requires additional audmapp clock and reset lines for
Audio DMA-PP operation.

Add global audmacpp clock/reset management in rsnd_dma_probe()
using optional APIs to remain transparent to other platforms.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - Add comment on audmapp clock/reset acquisition clarifying these are
   optional and transparent to platforms that don't have them in DT,
   per Kuninori's request
 - Drop spurious blank line added to struct rsnd_priv in rsnd.h

v4:
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv into
   struct rsnd_dma_ctrl

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/dma.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 68c859897e68..ab9694589052 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -47,6 +47,9 @@ struct rsnd_dma_ctrl {
 	phys_addr_t ppres;
 	int dmaen_num;
 	int dmapp_num;
+	/* RZ/G3E: Audio DMAC peri-peri clock and reset */
+	struct clk *audmapp_clk;
+	struct reset_control *audmapp_rstc;
 };
 
 #define rsnd_priv_to_dmac(p)	((struct rsnd_dma_ctrl *)(p)->dma)
@@ -864,6 +867,24 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	if (rsnd_is_gen4(priv))
 		goto audmapp_end;
 
+	/*
+	 * Audio DMAC peri-peri clock and reset for RZ/G3E.
+	 * These use optional APIs, so they gracefully return NULL
+	 * (no error) on platforms whose DT does not provide them.
+	 */
+	dmac->audmapp_rstc =
+		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_rstc)) {
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
+				     "failed to get audmapp reset\n");
+	}
+
+	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_clk)) {
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
+				     "failed to get audmapp clock\n");
+	}
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audmapp");
 	if (!res) {
 		dev_err(dev, "lack of audmapp in DT\n");
-- 
2.25.1

