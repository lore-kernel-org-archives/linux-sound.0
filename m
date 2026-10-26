Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012341;
	b=vMvUiUeHz2jd1rCniaiUzP9qYHbUZktwW7Jck9ATTTtFyDJViHEXxsnz0KV3vDDaGfi1
	 tAqifEesgXebOFiNnWX9VKDZnegGUQE00fI4gqju7oeAF6jhAY/D05WQDqcRGrGBOdUB+
	 hXQpxGG7im/0eIHlv1+mtzWGcoJGk7cFzHyCo0VgS6xzCD54LLZSttT5GqeIy/536Ntur
	 aaAlYEW5Sj1pC2WMTv6VTT1y/a2aK9hRETr/cUpPPldhE4xOGjThAf8XMFx+uDDFMyO8s
	 NXIUtnHN3ZGrNTmiQ+KMOpRJ4JnFSY6YWw47WdFGzt32ih06TBAsv7Ps+Sc1QsEx+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RRSR6UZrJp4tph+fHDjWo4hO/H1Uq5cP28g57V4V9yw=;
	b=VAU/1SAZ0yKgyvJIWZh3Ig7yWrtTVyNCOIxmmMzWnwhgIIvcrdr4F0r6zwOKHLJL21Bp
	 /lR1H6epU97K9F1f5blsCUXZY1eyC2UdgihhQIxHFOGDUWHFEuktqO41652+X/n0Pj2hj
	 +/CW7/F6TH0dr32moLtUgdNDdMn4d+/1/C8xOTtO1t+kxTJSgPsdNTd/ORehAunuz924y
	 jO9eSOxHLWQP187H2afFg9iytHhga89tznlzi/5WKbxwHwkOR+ZKCr7UcOoTuPV4egQkj
	 k29JewX7dF9xKhd6NTPxVRqqAHgBTV6x0vQC0A/nbFtTh+6wid0KzvevEc3E25zyvzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E4AMdxsa;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D279606A31E
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D279606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E4AMdxsa
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2045975a91.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012340; x=1793617140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRSR6UZrJp4tph+fHDjWo4hO/H1Uq5cP28g57V4V9yw=;
        b=E4AMdxsa3wzyzbX705calueicxP4utUf2k4Jx4lntZl0oYXfaSAYVmoKKOo4RhYAz6
         nMTBrYDvmQTmRtrPkt6RA9Mi88xlq4olfDNuIDXH9fMO0VkpauLMdceQ9WNK5aRO0TkK
         +aVTk+uyCgo1WG9pHItVGB32xvbo2eetEyRZmaHlB9dSPVLW3TycFbd9n83fz6ctFlNZ
         cHAymeKsY1GW0nHcq3xCrBOT6j0HLjsKSuntrPXmN0hX4RU9FpwEg4cemgMc3Pb97wDl
         flbWwSLDDL/ijEZFVYR7C/KjGT7+TFFMY9R1mUyEXTcy8ub/FRId8UgcYZgpXfVvTwzU
         a+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012340; x=1793617140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRSR6UZrJp4tph+fHDjWo4hO/H1Uq5cP28g57V4V9yw=;
        b=NM8b7UWiBwuVQKtdpWZvmOOKDT3UsRsYvyA2v3QPzc+swuloausiltdiTnRnug+Dcv
         PAc552Ui8clyZi3+lAIx+lFpzV6KjDmiQnhLkKWNp6ceb2yG1C/kZrRNxzgxoE45ydsO
         X3saEvrPVnKOmWL561kar+JcFCDdRfa2asGx7aSz5JCbeumuFlkzf6+2cDutgVL05Heu
         TSw1nADLjpIpK1uJleYeOy9iXdBv3ko/M4XOIlY6uSr3fC1wxhSwN4EgBhUzYRyq1XLW
         VN6e8A0iq5G83K/nyFiJPIKRARocJ+wQKOMVxVgRX6Vqp9/D4VSRC1anaWUoPCfsX4RB
         dOlw==
X-Forwarded-Encrypted: i=1; AKwUvBxT0Lkx/o8l5ie2HDTxGHQ6LsQjPdqjLx3E9Z1dRNbUB6GB09PiYnqvMbWAofeAhlvIbOBFQ2FXstMNYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKRCqR5fRhR/VXHlZQgbOsM0FcRUZAlOsiOX10otD1zpmWLSucV
	L+7+63P2rhqVKE1KZSG/QBfOxRFz/LFE3ZEc55gYIrc1wDDdBxyboaws
X-Gm-Gg: AYBFou1HoOfFYLJfn/+XlnvFizX5HVR5G76FueoKlHB6LRrfs+rrqQgWs3gqgKWytiG
	VYFzt9GXQANyHdml81ktp32Sr+7TIukv7x85bdgdDdE8hFOyekedU9ogi1vGgXtBe3G0MG2uoPq
	5aML0AVMN7n08f74GOyMidhUskA4ooRtr57x1qbL37E2mu6zkDYJ9DeXOqYzvb+8yjcOh1ezQMR
	s2nxRd7J6iOgbyV8Sb5KnPhap7KwfdaWLbXamToL/uW5V1iKBe6QJmdzVtAnvR9bfhhBhx5PoKb
	39yHagQZiTzMy6C0FT7vpPYTS2BoPDS9IL6MXou4XoKficWEAQ1OFcNfrb7tlMe2bzECvYIxHpm
	gv/AoOxl6w38F94FmrTLVR9xyuswiN2RXVE25Iq/CegHjfTV/Go/45iKEFDyDvTYd+LF8deqNaC
	E9CBjP5dHyPn/3bTjlSh11CE+7kyIwr6xcTv9a55o9VvXyaHnRGZ2JHT4LUaRaSoNH+DEAYB3Ph
	+yk9YjhDrtSKbKwhDTZF6DhzcfmRSdL4wk8FO5Od3pJBfZt9herblFQ4/UGqPNhOWcNHt4lv+HS
	HcbYJOz23dlBfdLXEy9WXQmHoNbB0e5ppD/nOvm/mjDW0oyDyaJrFkdHlNQKa0Gox+3ZI8Q=
X-Received: by 2002:a17:90a:dfcc:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3adeb0fb5d3mr5038011a91.43.1793012339349;
        Mon, 26 Oct 2026 03:58:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:58:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: kirkwood: kirkwood-i2s: Improve error handling in probe
Date: Mon, 26 Oct 2026 17:58:32 +0700
Message-ID: <20261026105835.19052-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() to report clock acquisition errors.

Remove the redundant error message when snd_soc_register_component()
fails. The errors handled here are already reported deeper in the
call chain, so the additional dev_err() call is unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index cf4327101b96..29641bd4cc60 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -687,10 +687,9 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 	}
 
 	priv->clk = devm_clk_get(&pdev->dev, np ? "internal" : NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "no clock\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
+				     "no clock\n");
 
 	priv->extclk = devm_clk_get(&pdev->dev, "extclk");
 	if (IS_ERR(priv->extclk)) {
@@ -726,10 +725,8 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 
 	err = snd_soc_register_component(&pdev->dev, &kirkwood_soc_component,
 					 soc_dai, 2);
-	if (err) {
-		dev_err(&pdev->dev, "snd_soc_register_component failed\n");
+	if (err)
 		goto err_component;
-	}
 
 	kirkwood_i2s_init(priv);
 
-- 
2.43.0

