Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEAF18DB26
	for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 20:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773606089; cv=none; b=etVhQDjU2b7N33tyMQZGhGefgUG7DrQWTt8HV7gtCj8MP50PciQn5m2P5GJpzm9YZfouUGxMCJik5gBRYV8HOxV0xJubiq2eYfoAoLKLbFEI9OWjPWAzWRJrdzSBtLZ07ZfiSlY6qexL3YJ3TWXbm8EdpejGfcHvYWILGIX6cpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773606089; c=relaxed/simple;
	bh=fGUqqEPlPRkHyfhJc4wI4aDGbLOl/Z45C+DwOJyvO9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IXkdg7N5EV+vdPCkaVBhYKFGXpdSQ17xnm3u1g+oZe3GQFNL7Hx88C5zmR7rl4qfMLbMfJ1pwli5/3BznltEXwX7Cvs9ITChrZ0Hj71iMNxrVzpYxpEOWr7uufwzSym7z0o9olqML7t+MNTGqHN440RlFnDuAmrnw/RirQ02FYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/j9VrpD; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/j9VrpD"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c73c990a96dso1395155a12.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 13:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773606088; x=1774210888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcMtyOuNxiQeDRBaoHbV4sOpSs/qWZfLEvrgpznC6B8=;
        b=k/j9VrpDqtQmR3unPPX4P59zAc2Fi+1XV8bSVGH2Fppe+f3R48W8G8IX6UwK6GAfPS
         P4j4OI8QDcGfmcwNafKrauydbHPEOH1eZaB2JK+yDanV2PxLkPj5l1AKW01WSo9M8UZ+
         xp6Y7xadHfTuMhsPHCu25a/xvHikSgaBL0v4Wy+ZS/pyogHxH8/wqaH5QKOZdfxP2xR/
         aou06fK27ek5MIWEtlVziV7qa1TXW1CxWuqo0nfNgRQQJYMjZ9LDjKP63cd9D42j3hiq
         OSm6osxSF+odqr3ajEU14aN9taGVJTei5QksTDIWqwXPOeueSdyAdPyOMZ845JkN7iTr
         KXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773606088; x=1774210888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcMtyOuNxiQeDRBaoHbV4sOpSs/qWZfLEvrgpznC6B8=;
        b=I0QxodSMKXOmmK9d/nG9d+lnTJCTRWc6+S3/nhtdsweiCJG7wzasqqqS157AdSVpRP
         ecPvdPrwEj3c9zVLERByJIyKMYoWEsdovFpmZ6PjWNFlv0Mnc7v3CVreTO5M8WuRkmDR
         LKTjWO5BDjO/afOZbB5eV5nMsuEjiGRT4CbTPqKQlWljm4KqLCzB36nRP3v2CwndGOrP
         1tc42bxK0Cn3ohsRfVDsnYjhOuIuv4dt+kBsKQ4sNMhNdpJM6F28QIwNKkFC4svGvGMo
         VJhRVaPGlXoYnQtz0B9aUFESBCzi9RdRtiPJTwomcx+fQXPYijtb1lZIlfbE7e7dk/Qe
         yctA==
X-Forwarded-Encrypted: i=1; AJvYcCUrirKB6VDEpMESvu2UU6ilxyhf5c5GJissrs0qJHbCPgd0nFNMnilaqv/2QfFOT5L5Lx8kphOxlUo4pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuaRVQvW6prPr45zliRakmUUy/TRIrTYE/Y5BH7//oRGAUsPQ5
	+DpjN68x7gwdRmu/7tGdVEOmB2P6ejua1QM2b9nodmtLio3hepKpYaxy
X-Gm-Gg: ATEYQzzQbPpzWyVM9EpMiVTqFk9NSWX/D9BZCi1G+Xqq5krHBQxeMw8GjjDzmsT2J58
	WPe76GfpfFeqeksKREzqeiQtRbQk6TIFt7i0/FjWrJaJPGEE8E20luxBVPtP2+cxEGCgO38BBVx
	kh5R+b/kLP5Al+fLRO5G8dak7+c3F4iPn/FbAfHsKkB8b2/HkYYexrQfVDji9H3UnZLtm2mU6VA
	v2jOOKlcejSOh4kxA49jugPiN8Zj02AtLDnOsRq+Zo3v4OyW4BgYmSBBxQ9J/PMfHABy2Y19kCU
	YAbCUdwyWck1wsIrijBryfaC3yW7SPoUpu0M7D1foxFWEu8c7WErPDB1xpFPp3CFSS3Ms45sZ+w
	hjFsaf8nRRT708PU/NO6D4N5tLMaMoPQeeNPwLxjlY9JO66CSo23B4WkwnFqWaShOFi/EjUrRa1
	WymO2x1Mn4CHD+02rfix0/AMxFhl1ggKyBGJwvxyjN6Vz30DNjnVUKnOx7jnVyzXjFPg6h0TQJJ
	128z8aaJISZXx7EEfUt6B4dwJdMGLiHTpHedko4aRKsc/E=
X-Received: by 2002:a17:902:ea0f:b0:2ae:6887:5c2c with SMTP id d9443c01a7336-2aecac9c940mr108432515ad.50.1773606087263;
        Sun, 15 Mar 2026 13:21:27 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece5f8dafsm85600225ad.26.2026.03.15.13.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:21:26 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: lee@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-mfd@vger.kernel.org
Subject: [PATCH] mfd/ASoC: WM8400: select SND_SOC_WM8400 from MFD_WM8400
Date: Mon, 16 Mar 2026 01:51:17 +0530
Message-Id: <20260315202117.200641-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFD driver wm8400-core.c unconditionally registers a platform
device named 'wm8400-codec' via wm8400_register_codec(). The codec
driver in sound/soc/codecs/wm8400.c binds to this device by name,
but SND_SOC_WM8400 is a hidden symbol with no prompt and nothing
was selecting it in normal configurations, so the driver never built.

Fix this by adding 'select SND_SOC_WM8400' to MFD_WM8400, which
encodes the implicit dependency that already existed at runtime.
Also remove the FIXME comment that noted this gap.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 drivers/mfd/Kconfig      | 1 +
 sound/soc/codecs/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..d931612e0468 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2127,6 +2127,7 @@ config MFD_WM8400
 	select MFD_CORE
 	depends on I2C=y
 	select REGMAP_I2C
+	select SND_SOC_WM8400
 	help
 	  Support for the Wolfson Microelecronics WM8400 PMIC and audio
 	  CODEC.  This driver provides common support for accessing
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index adb3fb923be3..0e912f6ec89c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2496,7 +2496,6 @@ config SND_SOC_WM8350
 
 config SND_SOC_WM8400
 	tristate
-	# FIXME nothing selects SND_SOC_WM8400??
 	depends on MFD_WM8400
 
 config SND_SOC_WM8510
-- 
2.34.1

