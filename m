Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB48537E5F5
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109368; cv=none; b=u7khdJZgPEJ/rCOKozXq0zDCG/P6Un7sV36nzctsp29fNvyTDl9LH5Ww0SEwveDUiIooiXz2CL18i/Cub05ITc+zatCdW00JrfF0/mGH0Sm7E/SmanzNpRtTLuqlKnDftwSfWBPMtFS/IqWb7kLWy5/6PlwkzpIFYqvVaBqdicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109368; c=relaxed/simple;
	bh=vXMUV2NHdzO2bVhOLxgO//r4EwHkTLLI06VBSO1JtTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBtgufhVM75t8qKEkkjrI+Kx/mQagjW7z7NJAkl/FcGR0Hek8SUBCAKy5D6Hwb8IsHHHXcfxmb9nQhya956ppEJJtsdUOSn/nXLc0Wh5VBecN2mSTL2sa7fY5O4CPYmphMO+y64ruPqjC+whyNNlBPQsg5UOMUNECYEinFMI1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7bo524r; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7bo524r"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso3108141a12.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109366; x=1784714166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbwPz53OQjxnJig2YQsbZ1pk7oPIkLRBw9/Vd+k0PqQ=;
        b=p7bo524rGWCDC1UT+Kpby5hQoViBYM2yeEEC5cJjlw1EOJVyyb3hrMh7zFqflsqkb6
         mSzCEZVqjSIMKBvEwmO0Ysz/hPXJqEC5TejQnDzSYnY2dQjhjZ1lVI+mf2VLgJcnRF8q
         oubnKZorXkeJE6GHbbNl26sh2VCmv8BAqKtXhs61GAROy0Lvzf+J6hBbVJi4snS6dwHO
         4rNMhjkXHKUjtne5OFT77+3uTLbqmgvB2N1//rgPIVnE4qXGRnhv8DQCGjtc5vV7FB8Z
         iswytiVIdsH9FCJb1cYWK66PdXJzk0NJoctYguQLjA3ysd4IpGSvG07oEHackqVp87l2
         L/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109366; x=1784714166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbwPz53OQjxnJig2YQsbZ1pk7oPIkLRBw9/Vd+k0PqQ=;
        b=l62Y1pOabGWB00j/LYeUp36ymMyvrIDO+cxLHBwplwbVXmzwttW9FlnJY/a/dq7fyA
         Q/4wNh0wqUG11NchUND/m989G9ON15JjAaXjuzEbYA6Qgthut+hJdJNVLdhf0zASMV6V
         BZP/C7VRLyuFNtV5uWDjFlnIvzfKc+2HtFsStk6tS4aII58QNlXAadpuJHHZw37bbVb5
         WkEJ5+t+3mVdgcIzM69YfwuJE1B4p3QlsL37fM18wMK84dN+MxLPnLBlzawy1S+W9jMQ
         IjsZ5kr11B3r+xXw3LWLHgNuhTJCgmeDswANcRnzT9tsXyZN7g8v7sZ3FVJhN7mTDSQb
         /LBA==
X-Forwarded-Encrypted: i=1; AHgh+RoPYk+eH4V4DVCA+1e+WiErE5VgYf1pMLHsH+gV5MugXbIQOdfWbhCeeJbxWcEmQ2OJBm1J4/zRS9XPhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkIjOyH4aBVMG9b7VanslQcR2mCxJnNygdJRwUUS6vs/stja+
	DPDYsEeW5oqXcX6iUD5+VkADRdg32lnA4xVAceFhWy4xqo5Dtr721paq
X-Gm-Gg: AfdE7cmhlmgJ5G6PYa/2Bz5sOAK5kh/eOSWDnAKOWw5qf6xJ85iDLD6embQD5yXMIBV
	BDAkdqNa6aEK9sYWtwdrV4U6cTbWkJUONNBlq7HDGH6DaqfsvVHcrT8f9GofNI+uKnTilWGjJal
	wpyg2D3iufrIpZYTg95sxJvFSmfgj5XlS4rvqmcKHokz5E4xZJUkPoOP0TG9pN3K0tBEQf7FhMk
	b+ZP3xo0dao3cvjOOSoYoxMuXtn7KBlRd1MzsrtBr8qmhHX3ujsjHTUBarCKWQYjdzs0ddfYUos
	R3QtXCptAWeMs+6Ne45V4frY1FJMkCwMxhH2FOqvMKnzzXbjck3TdqagqoPI7vSL38sR5ESXV/3
	TBWL7v1caP5JtODCuVMkx/q4GorZpeubz34nzFewjTmtm0t+8piLKZkcrr/SU7DBILlINy1YIRq
	Xcl5p+DIl4LNhck/OyQ44cs1+CPDXjvCDwYPHRyPk228AyjOM=
X-Received: by 2002:a05:6300:2787:20b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c370196776mr1215140637.66.1784109366301;
        Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/6] ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe error handling
Date: Wed, 15 Jul 2026 16:55:22 +0700
Message-ID: <20260715095525.40668-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling to simplify the error paths
and handle -EPROBE_DEFER correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 40de99a34bc3..716fa4d872ff 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1550,30 +1550,26 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 	}
 
 	i2s->bus_clk = devm_clk_get(&pdev->dev, "apb");
-	if (IS_ERR(i2s->bus_clk)) {
-		dev_err(&pdev->dev, "Can't get our bus clock\n");
-		return PTR_ERR(i2s->bus_clk);
-	}
+	if (IS_ERR(i2s->bus_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->bus_clk),
+				     "Can't get our bus clock\n");
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    i2s->variant->sun4i_i2s_regmap);
-	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "Regmap initialisation failed\n");
-		return PTR_ERR(i2s->regmap);
-	}
+	if (IS_ERR(i2s->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap),
+				     "Regmap initialisation failed\n");
 
 	i2s->mod_clk = devm_clk_get(&pdev->dev, "mod");
-	if (IS_ERR(i2s->mod_clk)) {
-		dev_err(&pdev->dev, "Can't get our mod clock\n");
-		return PTR_ERR(i2s->mod_clk);
-	}
+	if (IS_ERR(i2s->mod_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->mod_clk),
+				     "Can't get our mod clock\n");
 
 	if (i2s->variant->has_reset) {
 		i2s->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-		if (IS_ERR(i2s->rst)) {
-			dev_err(&pdev->dev, "Failed to get reset control\n");
-			return PTR_ERR(i2s->rst);
-		}
+		if (IS_ERR(i2s->rst))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2s->rst),
+					     "Failed to get reset control\n");
 	}
 
 	if (!IS_ERR(i2s->rst)) {
-- 
2.43.0

