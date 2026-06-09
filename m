Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AAC34389D
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968718; cv=none; b=Yc6lJ4/cdV0Mgmm099lOgO93xLggDUfdLruhCMR5WB6HY80G3I9M/wNybL9Xr4zSt6/sIjF9kP6iOXVpsDlCddUYS3m5lsF1Yq1F8iY/iYpFx/O6vlczkaPYAjxz6WTblIin+lu6/i5uoQguqfC88DIYAGOPESRaAD3HnzU/9Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968718; c=relaxed/simple;
	bh=MuXPX50lKPAzNlwpboundlyXapF7ai/VmXPDdxRmtqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEylK+JCqGGo8bwUMpu5XWgqNOMDjp/lV49sS369y5bCHj7VmCrr9ajr/TqC0vXIQAKAlzXoYcx/Vav5jYeIK5dg+A28ib0agEPNu7HYHVhJfYYvilT4oq2UMObbUEeY4KrDBHA0gsd5KIGDrlhedRvXBeu4/KxXGTA7OU1TkU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWhCArQX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWhCArQX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so2872215a91.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968715; x=1781573515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTbxMBmmKBq0qJ9h4eige5HKc/AYPyWT46wIah6eu3I=;
        b=eWhCArQXp0QuRtxyFCX4CW8s/0DUWrpla07mPa3mvpDa+oVpNjh6XWsHPEKdhz5t5V
         B6pk+HB8cFTquj1SSYJ17l6DX+sT4pwJTboGz5XSxVTiLoFuESe44veVB8zqwGQeBTZ5
         dJuqTEM9zVwGkrLdxvc6XvInkEEGu0FKy6vXl/uE1yJP0NsNEYRDdtdZ9mez+WJLD6nD
         6+IDnVgMn4H8ez3Y9C4Hinjyl6SiWwfaNbB5ZGKK+RnajH8GLj0MoakTUSGnzJFmc3u2
         0H9m1fZ4WkAecym63WMJziGChPQILrE6InoyhBPDKCFz7VTtEl8wjJdmfjuo4+2WG8G5
         mPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968715; x=1781573515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTbxMBmmKBq0qJ9h4eige5HKc/AYPyWT46wIah6eu3I=;
        b=mOwrBZUfoHKsA7fFm6gV1kuIFYfQ4LAQGLTAHYI7UaBrq6/QfCVSToMZj8SF2akhIR
         0AWqb/CB6uIztdorhB54is9F0jgf/V0gIgQPaH4i3Sy+Cb/y6GDcZXpeN+tZBNefg7tC
         398hC1SEB+zQ+W/DyYPq3BbJ+DTP7DKn2icWIlWl1rB0OOm0eaCRCNSGCLhKzt5vB3Da
         qcpBQzVoqjI+Hp0d3fpNZ6y06zqNxStNEOKQd3FUDsDcNuqJYGQYYA0iPyhE2Xw4wpBt
         H6TeFnmRRPZUh+WBh43jv/SqjQLjAHlqyqrvYg4wpFvsicryzDDc9ru4ts7n68wCXpZj
         S1Ng==
X-Forwarded-Encrypted: i=1; AFNElJ9ZWPRCMT6NvoFenkygM8F/fi7GTf1u4BNQl8dzJF78Pi5DyZ5I9rOlft1JF0U2f7xfaOiF1yEoA36/lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZfnMNYtsuZWnX2mpRO5cuu4b7Ks6U9Vk/xXXQ5qhxan03Kf7H
	iAEEo/K8eEa7+Qr8U8AaH0GSRZ+z/RQz2Y0siRi8i4C/tioAJunDLY5W
X-Gm-Gg: Acq92OGSnIlvVNHTD5QymjWd0BaEnNMneuynpGXG48T4QeAT1pC6PxudUTBzx+1tRml
	Ajl6Kqxj/JbHcEHIq6S4STHPuWR4VRpYfPTv03vvzkeDX4N2L1ZZOxPdB7ZgQY4WaWdRMESTMYC
	diNgoTSfVB4VY21YsS9p6Subjnj210FC2/4WBBlaRpjFb4hic0PgrfJsiQ15/I4TqnQEanhJjUB
	CaH6ookENoRb79i5BtFJyZZSE264q0b4CezSYfcz58aePz9cno3epTrCKcp0bvTTUTXm8hCYAk0
	n1v35O6blEKKCq/p9QFHotOP3KGcgDMQJjN3+2vNxpxymXlxaYf42PkQVVCJxNzGIVHZpGnzbiu
	33JrNZqKxFVmtvirJwgrLiJRTFEajSfYnRparkI9vALqY7rb4qL5MkN6sii8klMXQDiayh79yQF
	vpnP8rG8jIXrxwSxF6BwKpccpTGlQV3r7AGJBlsRbWRT22xguMx/IhwXPsThzALjgFt6Hm
X-Received: by 2002:a17:90b:5583:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-370ef0eae62mr20642239a91.8.1780968714539;
        Mon, 08 Jun 2026 18:31:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 06/11] ASoC: renesas: fsi: Move fsi_clk_init()
Date: Tue,  9 Jun 2026 08:31:02 +0700
Message-ID: <20260609013107.5995-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 128 ++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 3e3c6fd7c56b..1df7dc014363 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -717,70 +717,6 @@ static void fsi_spdif_clk_ctrl(struct fsi_priv *fsi, int enable)
 /*
  *		clock function
  */
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
-{
-	struct fsi_clk *clock = &fsi->clock;
-	int is_porta = fsi_is_port_a(fsi);
-
-	clock->xck	= NULL;
-	clock->ick	= NULL;
-	clock->div	= NULL;
-	clock->rate	= 0;
-	clock->count	= 0;
-	clock->set_rate	= set_rate;
-
-	clock->own = devm_clk_get(dev, NULL);
-	if (IS_ERR(clock->own))
-		return -EINVAL;
-
-	/* external clock */
-	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
-		if (clock->xck == clock->own) {
-			dev_err(dev, "cpu doesn't support xck clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSIACLK/FSIBCLK */
-	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
-		if (clock->ick == clock->own) {
-			dev_err(dev, "cpu doesn't support ick clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSI-DIV */
-	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
-		if (clock->div == clock->own) {
-			dev_err(dev, "cpu doesn't support div clock\n");
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
 #define fsi_clk_invalid(fsi) fsi_clk_valid(fsi, 0)
 static void fsi_clk_valid(struct fsi_priv *fsi, unsigned long rate)
 {
@@ -1034,6 +970,70 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
+static int fsi_clk_init(struct device *dev,
+			struct fsi_priv *fsi,
+			int xck,
+			int ick,
+			int div,
+			int (*set_rate)(struct device *dev,
+					struct fsi_priv *fsi))
+{
+	struct fsi_clk *clock = &fsi->clock;
+	int is_porta = fsi_is_port_a(fsi);
+
+	clock->xck	= NULL;
+	clock->ick	= NULL;
+	clock->div	= NULL;
+	clock->rate	= 0;
+	clock->count	= 0;
+	clock->set_rate	= set_rate;
+
+	clock->own = devm_clk_get(dev, NULL);
+	if (IS_ERR(clock->own))
+		return -EINVAL;
+
+	/* external clock */
+	if (xck) {
+		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck)) {
+			dev_err(dev, "can't get xck clock\n");
+			return -EINVAL;
+		}
+		if (clock->xck == clock->own) {
+			dev_err(dev, "cpu doesn't support xck clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSIACLK/FSIBCLK */
+	if (ick) {
+		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick)) {
+			dev_err(dev, "can't get ick clock\n");
+			return -EINVAL;
+		}
+		if (clock->ick == clock->own) {
+			dev_err(dev, "cpu doesn't support ick clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSI-DIV */
+	if (div) {
+		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div)) {
+			dev_err(dev, "can't get div clock\n");
+			return -EINVAL;
+		}
+		if (clock->div == clock->own) {
+			dev_err(dev, "cpu doesn't support div clock\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static void fsi_pointer_update(struct fsi_stream *io, int size)
 {
 	io->buff_sample_pos += size;
-- 
2.43.0

