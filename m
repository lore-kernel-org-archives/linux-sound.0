Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2B1C68F
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 02:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781229690; cv=none; b=PIwRKAIVdz/b6LTt/qCQD9ruYWH8iFfa9LDe/OmoofAb+gtYgHtFpCFYHcONziT1lCDWR2gmlaZEN9WjgzQ7zs0YHaQ8gXFul0sS7VzJtEDadRQFMzqeLIJ4+JA/noyrV0g0rdiaIAs/Btg54jhd9AqoEGnX3r08pehsnwR21DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781229690; c=relaxed/simple;
	bh=BqAmnK5FPDxADJiEQJysbrn0IXrVpk5y65cq6vPoYQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0O42kWLtd6VAWShow2lfQtpIhNo1PYW/HKEwJlo7E1t10U64uBGNMP+D6YN2w+pRj79hKVpklXspupsbUzvTlhN+Wvs+EE8bbC1fIR8FFmQX7qEfIrwoL7PkMsy6lnfOf2jzTP5o/uVbtaduM9kf18vTI4+EQPxQKwDZ9jJ/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0WGyYYH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0WGyYYH"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf18c30bb2so3908595ad.0
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 19:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781229688; x=1781834488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDHiaw71z8q8M2ALF9QoURQ8Hng/rkqvvoaFnmcE27w=;
        b=a0WGyYYHnObNef8KLIM2GMOqPYmuJZOxGQeHoCiygSRir9jSJV4hadPAZ9dGjWFokt
         s2xb0dhz61RDRMWaJgxhzCQKtqZkubTfLREd3vdwFTgAJa29QVfGSbb/LBVt+vYci3Rr
         PP4mM2W/D4uvx7nZCpmjd22Qkxtdn1tjKTaAGjq1+LYBxiSR7y+fZyqJBNbMbkHbmteT
         ILFH6JDlyJORfpvLN6COY89E11y7hdo6PHc3J67M+eKyernq7itfh1Hzrs5L3PL6ZESd
         p7qoFtN9onE1AugK0bgI0VqB0A9docW3XNhqToDMJsPFfELEhWuRfSFIap3TntkpEVGc
         7m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781229688; x=1781834488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDHiaw71z8q8M2ALF9QoURQ8Hng/rkqvvoaFnmcE27w=;
        b=jig+GaIY7RMR2jxfz4c6YJvt/t1SAYKer2FC1Ud9CeW7wenFEO4kNk8H2Xu9JFq26R
         HIW8dqXPuZGH+cd15wQzgNkMoD1HHxVY1JXB7ooGedeG6m2iuq/k0h/uaDb4lmZdFx0x
         EQ9QzcGtHFLqMzCqdIh/JJyUYHCLqJyQToCwsdV9x0bE2DY2fa+wN5TVbwlyvmBi2TJA
         B+9q7xFlEj3HPnQ0lERIE3LdV/czL8A0QsCn32LEP/q1wr87+uPUHFGDauGCDN/YrVHD
         1zxo0qJwteBGVEG3hVojP4MH+5ufFYOQRzgdaaKn3Q9x0ohvFQSC6eV9i17u1zA4EzAC
         ft/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8pi6ObFiS5ATOkKCwxWZXYvL9mLAJvfPb9D07ynDr8qiyVwrahwj45mtHv74fT+OyX6D2m3b4VPEjljw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1sytbPleFIguXMUuYpP5y/dpr0rs09KQdXTzxd+DIb7WUYPwz
	pB/9zb13plsLZyj81za/cEz4a9ldSs156NIVlKMY2fizQH+oWGOfypwv
X-Gm-Gg: Acq92OF28z7nXwJuEjqMOBsEX/AAm+ApoulhNvtEv4cjfH5+bsup4VieBWdjRIgJFf5
	O03Q43Jz9nJrjRnsaPvf8xbC0bnC2WmzAdLcT0sFwmRw0tg/HUiKl6rkAZ1OS3I36gM8WABE53B
	/QbQN7P4ChMeliC2URAVyyeQwkwkGFctFPk+2eQ5WXNPR9xHZ1WZ8br+4DVHhrE9z6i4G7A+4RW
	T0LZ61skuUZUTlTi7Zw4kluoxmO99wtWCLiyaFIMFPc91b8uhjYI5x4s2/PIb/RrL6JO6EvzvFT
	tQ8V2MQKoRvx3wO24+t4ZQosfmDb2x0HBfB6scOqqKjsTR3H1RyT6gKGqrRPq1bNRJ6ZXL77mju
	PE3rLl4q0YfaNs1DgGiKLTcNaJJBvsTaSVXFdVNdwXdRY2M25gFzN2Wix/TIushTsFq6SwuCwYX
	pfAuo93sMix+RB0BPhO+axDBZltDaOOH1w5Y9mieNLXJXXVk8IrytyNi9qDxdc5GvU1vxE
X-Received: by 2002:a17:902:ebd2:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c410ae3ec1mr11770185ad.1.1781229688150;
        Thu, 11 Jun 2026 19:01:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm2657525ad.14.2026.06.11.19.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 19:01:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: meson: Use dev_err_probe() for device reset failures
Date: Fri, 12 Jun 2026 09:01:12 +0700
Message-ID: <20260612020113.9557-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

device_reset() may return -EPROBE_DEFER. Switch to dev_err_probe() so
probe failures are reported consistently and deferred probing is handled
properly.
This matches the existing pattern used in aiu_probe().
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/g12a-toacodec.c | 2 +-
 sound/soc/meson/g12a-tohdmitx.c | 2 +-
 sound/soc/meson/t9015.c         | 6 ++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index a95375b53f0a..21941ee552c5 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -312,7 +312,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index d541ca4acfaf..967109ca2b57 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -251,7 +251,7 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index da1a93946d67..f0b55aee5241 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -265,10 +265,8 @@ static int t9015_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
 
 	ret = device_reset(dev);
-	if (ret) {
-		dev_err(dev, "reset failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
-- 
2.43.0

