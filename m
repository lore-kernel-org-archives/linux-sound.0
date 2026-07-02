Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7E3EA973
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989819; cv=none; b=gZ49ezRseh5fsCrtDt5VdXeX3Iy7z9sbliVAa6nfQxduLEmgi3J5bocHZcSNEX7Tdy7STyhQmtg278/WipMkMDdwmjr+Z9scpgry7m1/63R8UjUrDvT5THkXTCQgowig0lgS1xHjOi8/1qgH4ZV1uI5W/7bxxTrRcpboTT2MHWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989819; c=relaxed/simple;
	bh=4RUGcMFAUmz4WZn+oUeIShFgv+Faz7ysyRFbheUvpog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rKb1sOkXvkpKpY4ICcy5gv18QNAUhp1Nbn8RHze8QJt9lb/GixE9dD6x50ySWzclNqw3pOZuSVJx7nJgKFDzeOOE19HEGuslBUBVOQZ2FpVPdq1qW51c3Qb0xSJL3u0F39Luk2Dif4Ap9skJ7RDDC5z5ruXuamzsXdNEQPFJhvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Jpo+ZAJ8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Jpo+ZAJ8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c19bad03so13438055e9.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782989816; x=1783594616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgDVuxY1KD6XzliacX6/nWGKC8dFyYuIdBWxcG4BfyI=;
        b=Jpo+ZAJ8J0ohAOznIpjaJx9QapLTTz9WSbfw0aAK4pl3kRzertMCwyZCvKk3ioYfPN
         v/CYy060g9IHd+bRfZ97K1Qaa4WIjN7XS6rjV/9z0S6vK4meqWmYo1waSi/YW+CBEvlg
         fKhLm45vVJammtWtnLUMiPIbU/jIz6tYLxAbXWkYHC0UN3UOPrKPrAql/unAKcF6VmJp
         /kaGXi90anAFreopJFN1FSYbNVUfkctMtvRtejzFClUSy9lG7RQgQxG9Vh1Qwm4RibUC
         Ul57cqfRamBiTwfdaWJ1t2estSM+/yP9iioe+QjJID5I5Ih3W6k2N53X25GmcRyvGAvh
         BJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989816; x=1783594616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgDVuxY1KD6XzliacX6/nWGKC8dFyYuIdBWxcG4BfyI=;
        b=IYhDHsvMqJicqIZXaFoKgmbXUOA0Sm3UwLIU8ADKJf+AyKOkpOaCrz9EWu7tyyl4SQ
         ZRIS6WtqpQCS1tXwllHrP2r5m6EBfPyjYetkOY6HyzA6941R+EP83Sec1fh3+6iC1cV3
         D7CWNZlHfPe9OF68FTTEZuDUSRskwUWZpgpMra3ZgtfJVqg4Gq7yn6E1Ko/YnqkDd9yV
         O0rZOulaSX4M2Nc+GrEJLSG9ncam4Tf0gVshqbp69iKvQ120S/dS+3LouGpOCNPqGfK5
         7q4zLOIp0tzo9CJ1S/0A8sGHqGzPBQbCo3ECCoHw3jixUt3CoMgJWO9w7HHXidXCkgug
         N3ZQ==
X-Gm-Message-State: AOJu0Yzg//EkYTfNBTQQ7n6q8XfGttt2Czo76YCKLvCyOsFltXlpL2U9
	5xsD6hrAEJXV96dxd3WtbIy9G5+b8DcMC4ob/niexq3Y8IiW3pJyc3ezvvbEh06RgzI=
X-Gm-Gg: AfdE7cnqsWT5iymenNtG5cMMbysicI9EYT08yDmLztg84jzJmWJknvnu+0hsP8Cgra3
	ViVd9PYz5bPWP5YNcuSMYpGP0sRUfoAH2ZraOWkuGN2PgCOBxJIWO6q2ukuHo7JrWcBKp0oNum7
	uFu8OGv26rcbpzpoHooMWSE21OcNygZnrAEmXyBXJHOC3+iITWKlME8ycGmizr/4fFfn8BOmCZY
	bslNp2w2Y8s4Wf5y1a+EVec9rYbfRxtWozeMKbcA/QRLHOdn84PWYhV/yTstgWwJm28Xb2e2evf
	49Z0eDXJZhLTuILPVW2yEK66vgVFOTz3AewH+JOm4JVX+SY4kB4pi4uHk17pHBv4+vXvVXdN6Li
	Hh0sHym63zuM4HUYLiqd7L35XetoztMGo1PWVuyYo59Yyx7zTaELfncfCyS/wXvr2haaEVVUvEj
	a3UAK0Wpg0Ug==
X-Received: by 2002:a05:600c:c3cd:10b0:493:b7c8:6530 with SMTP id 5b1f17b1804b1-493c2b56d6dmr58237385e9.16.1782989816159;
        Thu, 02 Jul 2026 03:56:56 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372a31sm42649685e9.13.2026.07.02.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:56:55 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 02 Jul 2026 12:56:41 +0200
Subject: [PATCH 2/2] ASoC: meson: aiu-formatter: remove pipeline reset from
 prepare
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=4RUGcMFAUmz4WZn+oUeIShFgv+Faz7ysyRFbheUvpog=;
 b=kA0DAAoW3kuTbdE6AQAByyZiAGpGQ/Sgr43tFvQDLVWfktUEH2N4EZ4yRZb+Gfs4KRffN0R+h
 4h1BAAWCgAdFiEEBJfe+3B1JuEzYMlw3kuTbdE6AQAFAmpGQ/QACgkQ3kuTbdE6AQD5mAD/Qntp
 SFISL2mv7knxonSk71KphYdR6KENd59KnmN+luUBAP3VB++RaKUjr3VxQ0tqKnyc3ANTCrvX31+
 XLiMN8doF
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

'aiu-formatter-i2s' already performs the very same reset in
'aiu_fifo_i2s_trigger' for all relevant trigger scenarios. There is no
need to duplicate the operation in the formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-formatter-i2s.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
index b4604734fe88..cb554c2e7ce4 100644
--- a/sound/soc/meson/aiu-formatter-i2s.c
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -13,7 +13,6 @@
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
 #define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
 #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 
@@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
 {
 	/* Always operate in split (classic interleaved) mode */
 	unsigned int desc = 0;
-	unsigned int tmp;
 
-	/* Reset required to update the pipeline */
-	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
-	regmap_read(map, AIU_I2S_SYNC, &tmp);
+	/*
+	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
+	 * trigger time.
+	 */
 
 	switch (ts->physical_width) {
 	case 16: /* Nothing to do */

-- 
2.47.3

