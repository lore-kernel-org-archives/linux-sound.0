Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012348;
	b=zSir0HEeJyymB8YR362lXMK238Ui5x9IINQROml5pP/BJWiWg2xuwa7KRhTIhEjb/O9c
	 /PXktK/3Jx3yC1LCGSzraiJCPzoheOTF0ry7NZwAAVLtRHvuDYIlho2m9NPJFdZHYyzqN
	 A3QgZQUNXwpwCOPf4xRBSp4RUfR+mXWNTd5Cc4h8FH+8DTxc/ircr5qeowN04Rx5lDn4q
	 xFG1iqd9ILqR5TqncCzV4yjhpQakd8tCpFF2qhzxMlGBNXyfPqNyC9ExJ6lgEMk0d43L5
	 53lEEFh+tlMj6WfDeE2QnG+hUUfFqXtFoKfpgBzde3dyhf5JeK2oJHe5p4sa+CZJUVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HUmBumVayD42JJx8Pn2z4JOh+RWoCbU1b4kR9Va06PU=;
	b=GW0wmszaLLQchAMffANXQs35mo840c+1zvPVse0tSVjdqY3VZqh8+oEUDJMIJ8s1o5oB
	 nz2D+BXGd6DqoqtVP0XTFasaRJ+e9JCJjN0cFK3FDMuV6JrHr4rE2J1jCcmGdab7OUi4w
	 rjuOjHuSamsXjmtp0SUz3aIDE7pRYGU9dZ5RED8kusPIyfFCcoLs9KZCiBZWmeY2RQ3Xy
	 k1WjpFrzYtoj5iBHrYgOT1Q85DvQYv99m6MGc11IkyRo2aspGwyO3NFCvYY7jWWR1eAc9
	 V0PVPefZkX9/9cr1QVXNT78jCFXMGervsgelI6ZNS1jaMYBgws9HTy5MhNEZflDfiaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y38zimN9;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A756606A32F
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 10:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A756606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y38zimN9
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so754277a91.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 03:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012347; x=1793617147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUmBumVayD42JJx8Pn2z4JOh+RWoCbU1b4kR9Va06PU=;
        b=Y38zimN9UflXNqYOwyPcd7bnennWRg93b7BIrzVxUn4RdJsv9nqMJAvt60047Pz7Xb
         FEvkWtOWmKOR7jUkxCxOkC8Fqg3YxsK8LVP1ghFosAIDgWsL5Db9FjBfAV7mgklRyGrE
         R7inyL5Rz5YeNwCJpCvDmLgxBYTRcRry9nQrQOeyu62xeipMhLDW0hKmPTxuQSSziKC3
         CQEQ1Swc5FggzATN+o5o0pLPolPMj8SowxxNsqMdjHIxpV6pSibMXSaPm2xdb4hSV6A/
         bvQy8pjqylj5b+9wZBpu9V9N8PqoMroolq7cOKxgWGBw38vLSucEPeQ7xuxvT3tFIKTY
         6rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012347; x=1793617147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HUmBumVayD42JJx8Pn2z4JOh+RWoCbU1b4kR9Va06PU=;
        b=MV+pwTfT7Psa7pOW6XygNfGhTp5mK2ERqcoSDNALDe688EnfHjZ+isnjckRF9vYpHM
         TYywGqj4+l+djdzFDZlWUDMIWRoeCVIW5rtLI1M7VT13jzDq4d3W0BRTCnI2gMDmE3sd
         Z18nc68gbyB4FbwwK+qRXePjoVIowAGP4Q674ZuTOnkjJQ/02IkrrQzVuebA+trKUZy6
         wgN43Vj/Q55+sCa9QEJ5pcj48BC1Kuebs2RnbhTVBseyxcewg0xeKblRosxVerADBlq/
         5gBnF9X6zATufhMFHkMuaaoHoQYhWLMNowmPv2Fk5WI6q/BR2qcbqyz/ebU2LQTELhKN
         KDGA==
X-Forwarded-Encrypted: i=1; AKwUvBzQvK73XTxJR5an2omuEeW10eCGBKVCOfi2+t5Ob7TWUGNxQSv3Kn/q2DQtQnhQpKIv3lxFvMTnBOjWFg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL+VX+5aUkxYDMxAVeVfbkemydnnjRlu/vEjOuyPouZtMsa5nFd
	dQ7rDrObNqCuNhC/8tgR6P22Qr7pzEFH07OLfNPqCDn2/M1Mat+QnJQo
X-Gm-Gg: AYBFou2Hc4PcutXCybwqRPvFrBO11A1vEXOlmTNlp3KCfXI+dlQWuKSKJCe57iXWB7T
	pAad8w2UYc9OyPOnJEb9gNF8icwKdn0zO+23GxFdLh2i4COqBT6R9JdhCURB9e80vrqKOyaLbv6
	1IAZv1HcQsxlSa4kz3/b1NEau2L8bw2w319OUvZYkgN6C6TrZae4r5Au3w1+GKpthniUynFuUwn
	TClCEcnTyU2hE/zjzwFaGjo4ZBQ0dFItCF0tc7nCRWJZSPMLDy/kz22ShVcV8R2hQOXkmEjC7oX
	LI68UEaHT3PBMaXUrChU8aDFqZ4js+uxUMEEqLVW2C7gYje77bcw6p0rwcuvQYlrMGIF/WEeDKK
	BqdaPQ0heZnRpN89sj7z951D2CaEP4LuQ5GEWBsz/0PdE/eZwTq17kH3G1T85oYe89IbxMifCJZ
	biuhVduswrNiutr4w22KBr5zZCEPa1ZYesWJSuhSaWmm7V1vpcgRhBtA6yDe6t8if5Wp/Vqe1tc
	W1ILXBNOtH2cA09+gWfT71JEqR04/nnx6Jz/U7JOPL3FAeyIbUHIhFX6VBM3px5PuVpv1NXDnfZ
	TRlln/XGsGw1s6BTlI2d12ZuTEwAOEKvJ/jM26RGCeE6lY/RdRZwmadgfD8MtWBr7ZrcTac=
X-Received: by 2002:a17:90b:17c1:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3adeb130496mr5026383a91.49.1793012347522;
        Mon, 26 Oct 2026 03:59:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:59:07 -0700 (PDT)
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
Subject: [PATCH 4/5] ASoC: kirkwood: kirkwood-i2s: Disable extclk on internal clk error
Date: Mon, 26 Oct 2026 17:58:34 +0700
Message-ID: <20261026105835.19052-5-phucduc.bui@gmail.com>
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

kirkwood_i2s_dev_probe() enables the external clock before the
internal clock. If enabling the internal clock fails, the probe
returns directly, leaving the external clock enabled.

Jump to err_clk to disable the external clock on failure. Also reorder
the error path to disable the clocks in reverse order of enabling,
allowing the error labels to fall through.

Fixes: 4523817d51bc ("ASoC: kirkwood: fix external clock probe defer")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 395790682355..cf6b96054b82 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -710,7 +710,7 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 
 	err = clk_prepare_enable(priv->clk);
 	if (err < 0)
-		return err;
+		goto err_clk;
 
 	/* Some sensible defaults - this reflects the powerup values */
 	priv->ctl_play = KIRKWOOD_PLAYCTL_SIZE_24;
@@ -734,10 +734,11 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 
 	return 0;
 
- err_component:
+err_component:
+	clk_disable_unprepare(priv->clk);
+err_clk:
 	if (!IS_ERR(priv->extclk))
 		clk_disable_unprepare(priv->extclk);
-	clk_disable_unprepare(priv->clk);
 
 	return err;
 }
-- 
2.43.0

