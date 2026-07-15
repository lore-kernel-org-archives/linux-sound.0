Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4DC3C945A
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109374; cv=none; b=PP6/xqouO9tEfPgtj6IJMyFjxH/eFbxF9Iu/HkKLe7mHkzA8FB2K30H3k4Hx/IimZ0WVj7tgcfDAq9v5Bmx06h8q5XZPijXyZ2gwlQqWOqHNjvf01mBr7YoWmMySF0Q6A6HZzUDx/1qX2kXZgzKBF5y+LMWLyOXMajaf4eREDdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109374; c=relaxed/simple;
	bh=jXeHXz0sgTqbPCpgE0Ek4FYcDSoYTpRTfMU644+qSc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptIOY+TsSOOAi4t6Y64WkmFET+qJ7CsnsEPIV/5L2oZorYnZEvVPlGC2/lnuucTX0xMUCfwfc+sh/GmnSUPqCZUC/8xn3GKcjqLqhVBSoO6j3ZV/7f36v6alDJdra+vtHDb5tJrn79ml8v1HNk0pSnohE4FJOG3dUCB9nLVoCf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIIXDXcf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIIXDXcf"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a652535dcso402211b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109372; x=1784714172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IG9ROgmPkgpOSWt5kVvQ2eBpCUOMrMqYLeguMnD/GAI=;
        b=hIIXDXcfmIJ8SBFTkbDtD4nLKnGKXBL3wqm1J+sw2y7vxfcJowhFNSMSAB7UtS7tpl
         u6457Drhaao0nc7y3d2GSERpDRctIzv4AEHF2WrV/eGEJfCXI1//uUm2SLkr2ax7d3uM
         pRVvDeLZ4lZi5H8p9Y6xbdKI1Pt2YUJcaxa9WdtbxpU4MFxiWgResEuoeOcNh2DVkB/m
         oungIojwcHZUkn/QGDCBBgf+a9rsUAxx0Eby+AyiN4PwUfbnopS2qhYnta2ACajRyInr
         00AfnSHmgL7j9noa2gg2V9DFwyiMwSRfnrjko4x0uhNwHSfWijdA1V5B+zU4D26wkcM/
         tddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109372; x=1784714172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IG9ROgmPkgpOSWt5kVvQ2eBpCUOMrMqYLeguMnD/GAI=;
        b=WYACrw1ZBqhkMHnbLniiuR6VBryN3OjIH8K5Bk8aQ+TWxi/47tnri1Ge5LP+yu1Jzb
         UtPESQVT1PD1JRk51URUImiPFisDk/usABAMEdrhFj0pFYN95RsNTTazqA03fE4r5mQo
         zjiInbgaGxMqjRXVCP+iNHPFtk0tzHzfH6W+H1K2/Absumcw3gIXhEBl4EwFsx/TzB1U
         bOQ1ZL7hl0D3d3yfBtE+bx6i/FpOb/ExX7vzkWylybNNsranof3j54nQvmmu4iAc3zkX
         8ye0pzcdBnBc3uWCyuJN8LLcOg9ZsC/8WyIBm7cAQh9W7/A0cw1O4z+In9fHer1lNCx6
         C3mw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5A6BAnQLUF2I3oGIFIyaayaFal9FabPxvlGEXRGdRLQp8yNIhUpc8ZlINzJUkaMffxSWsFdVj3cH8lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4bE/DROa1rC87MlyPEn4sMsRn5eawBNSD71VAqSLDW9IvWYRm
	ePL2AUcWBmiYOogIfOAVLnipBJhDar2PYw9953saAHJSm9MOANVNVPvC
X-Gm-Gg: AfdE7cnSQECZQbe4Syf5hGFFQS9GE6Amtw/p97u+TDp+8JjcNkDN1VSFOvf0deiXGzu
	tIQFv4XBTXlopYeWd+arRzyBUlkvLjJDZ7viWjXo6693fqlGQ/gITGiuy1V5k/6uD3E1Z9XOTNh
	fzUFmmXUjUQDbsPk0wa5WnLliMG649I8/M+z16hHsDagwa2+OggIQe3JzDavPf9P4tCRI8qF/g1
	jUdhse/Xxjam8uc75MnUe3cZmsESkVEDFTfWlQ9iyepW7xFwJuHLZBSt+FNAINuETffnmGUbOWF
	AM4Z0XYom3X+2ydynD/TcPmOCCBayxiIhlBn7Uxvwuv/TSd/7GwOPEUjhJ4j9ZMQ1Rv9umuwQpj
	8dIv0yUBdrXJFNynKGWHuTod/Fvn8fo2MfNQ52a7a6z7UXlmlSpL2Hx5brhRxzDxsCzZCEdrSZk
	Sc4m+3iCYkXSE/mAlWWry/RiWV8cbSE1o7VBoxbPGEtd/9Wts=
X-Received: by 2002:a05:6a00:10c9:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84a6733bf25mr1897232b3a.48.1784109372039;
        Wed, 15 Jul 2026 02:56:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:11 -0700 (PDT)
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
Subject: [PATCH 4/6] ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for probe error handling
Date: Wed, 15 Jul 2026 16:55:23 +0700
Message-ID: <20260715095525.40668-5-phucduc.bui@gmail.com>
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
 sound/soc/sunxi/sun4i-spdif.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index c2ec19437cd7..d979bb00312f 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -684,26 +684,23 @@ static int sun4i_spdif_probe(struct platform_device *pdev)
 
 	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 						&sun4i_spdif_regmap_config);
-	if (IS_ERR(host->regmap)) {
-		dev_err(&pdev->dev, "failed to initialise regmap.\n");
-		return PTR_ERR(host->regmap);
-	}
+	if (IS_ERR(host->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->regmap),
+				     "failed to initialise regmap.\n");
 
 	/* Clocks */
 	host->apb_clk = devm_clk_get(&pdev->dev, "apb");
-	if (IS_ERR(host->apb_clk)) {
-		dev_err(&pdev->dev, "failed to get a apb clock.\n");
-		return PTR_ERR(host->apb_clk);
-	}
+	if (IS_ERR(host->apb_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->apb_clk),
+				     "failed to get a apb clock.\n");
 
 	if (quirks->tx_clk_name)
 		tx_clk_name = quirks->tx_clk_name;
 	host->spdif_clk = devm_clk_get(&pdev->dev, tx_clk_name);
-	if (IS_ERR(host->spdif_clk)) {
-		dev_err(&pdev->dev, "failed to get the \"%s\" clock.\n",
-			tx_clk_name);
-		return PTR_ERR(host->spdif_clk);
-	}
+	if (IS_ERR(host->spdif_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->spdif_clk),
+				     "failed to get the \"%s\" clock.\n",
+				     tx_clk_name);
 
 	host->dma_params_tx.addr = res->start + quirks->reg_dac_txdata;
 	host->dma_params_tx.maxburst = 8;
-- 
2.43.0

