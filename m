Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33862D1F44
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809584; cv=none; b=UHIDtjZQb4Cm87xlk7hCMWv+F5YlejPSczcNgY0j+LaPSBZn8wNOQAs9EMbP7hQihcXhT/ehMjYKcckObuZidlnAExSXtOlaABY8KQcML7VOMaePiUOzetOuGbsccwQeWvwA1SwoiSHf0ZXVU/9uPp0I/1Hudk6agSx3j8x8pd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809584; c=relaxed/simple;
	bh=xrIPpKiDDpQQwbNaN05fwS51k4fWKHBliMGLuqYgnY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+3RkM3OuPjz3PsWFl94kvCuIWRVHHoGIaQeeZGn8JCmbGehtXem0oPUrMXHA6aKVQG0KDGCTtljkZi4nuLRMN7eD/oBH0FlZGf10vwrTXyRy/uhSGPlOG87sjCELeHiZESSOi/+1R99fRkz/EZTtnPW2oqG8kPMxNlMwMKpa6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNbnX3eW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNbnX3eW"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4745492ed3aso1110141f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 01:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782809581; x=1783414381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gMJS6abn8VqxrL8L/aeXWcSWZLBVm3cJXzMB2VPCBuo=;
        b=GNbnX3eW/uil6q6xAQFWBYOTIyaxinhUQ+GzU4xIX3f0flGnvzrLlVUDGZlVseXgwn
         pHDD3EKhghn5XwJx8Enz+jyQj31h2LEQUl1pylizwkUY9YtolFD2m2ERZSKWE/jVauY9
         0e/Ur26bY0WTBIQ+FwsUi8SrWGjC6y+xEJFDgiv1b5kArHZukaY7s6EqDA2OeaQc7oMq
         siNINvF41amUG6PfZggRYDP3ZtMl+74Vptq1pFIc/ocyZ6t2ZosRW/2xx4S7UVPlAAOt
         xpStVaL4vdQ7KxTG0X/KeHId62295hEkjzHcZxt2RQQjqke3/79FSblR+6XXpgSz+dEE
         9kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782809581; x=1783414381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMJS6abn8VqxrL8L/aeXWcSWZLBVm3cJXzMB2VPCBuo=;
        b=pqGempEWGiOHJFKE3fUfZxUMh+s4tg6Edl2SKx80Ikfxc691aRM2otqOqplJ6X3xiY
         OkA+O2E+5qj8CwB4wtabN2RUvMduMnGXsOC82V7mmm4p3f44xjI+7lp0GvqFImrjYDal
         MnIecEi9V19ELgoYqHaDilpfkj+tWbSqcpjfWSxLDawaK9Wa09ifxoB5NfUcQatw2G8S
         Om+XcgfbKKlFb+ZS6UYb/h/O/1HFux8ScQ9+gV+ExJrCdS4ZVAWTQbxOSezU5AtLj+BR
         muDbKtxz6EUq1781SYGfKAwjJplzzPF+W6V0AXWNTYs7jyc2lvLYGzYgJVKnwOuUPZ8o
         3GEA==
X-Forwarded-Encrypted: i=1; AFNElJ8jX5XA1Q5OPeSOn4b1pn7rvvEkkAGdsgrBh8BUigQA4tG1Nwb3SKQ8Wf62XSSAxLkZk1rFoOrHcbOy9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZ1W5aKHv5izPJhre2P+WK6PWlnXgtGlnIAi/4Uf6ZKefpo1c
	JFrWMpvLUlT+jwYlV2BKhglwRE7aWjy+3Jc2zwM7/7fuAdZ5DzxsXRbY
X-Gm-Gg: AfdE7cnwwGz5jnjrMr4dl1t0xwFr+go2Q5M72/+OPZR+H/1/vBWdFpGBHNpC1ztwUu7
	sZfKoOHJz3NpOD1xvbgOAmX3oLacPLThqtAPtxAa7JRog+oayunZIUqQ+xNZV9SeEwuisgWwgDU
	Wh/dRY1cS9nFX0EzEK2cxZ2Tq3zHi4FwFkCAqQTAkQi8Mau4LJjaqkQ7OTKNT7wiiK5gFQWXngi
	zJI470nL6fDdEiXaPbbxwU2+TJhQT0koy2mXZN9tvSECtYW5ND/y9H2ZmixMP2UgBkYU4YGtoqd
	FxuzvErlwN01OZVBNNSDLCZ9p/G7y7OaAf4N7csq9kY8+Afc7EV42GFjBRjghmYuzSKo4RN9Lm1
	ue5ANVVCGHCDxyIZBAeb0u6wd5NGs5UUe3AyGyJvj9STxSrfjPUm68/eIpBbOjHy7qK1iuD6TJP
	UsBSTuGYfYqItnexJCo4QYcczARsv/Sy/LgJbMHZ6qmku7ANTA
X-Received: by 2002:a05:600c:8b8b:b0:493:b572:dccf with SMTP id 5b1f17b1804b1-493b82ae3a9mr37086445e9.24.1782809581072;
        Tue, 30 Jun 2026 01:53:01 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:21f:e933:fb78:db9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567884770sm5935546f8f.33.2026.06.30.01.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 01:53:00 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: rf@opensource.cirrus.com,
	arnd@arndb.de,
	srinivas.kandagatla@oss.qualcomm.com,
	niranjan.hy@ti.com,
	nathan@kernel.org,
	alexey.klimov@linaro.org,
	nick.li@foursemi.com,
	peng.fan@nxp.com,
	linux@treblig.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] ASoC: codecs: cleanup kconfig indentations
Date: Tue, 30 Jun 2026 09:52:49 +0100
Message-ID: <20260630085249.380365-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup various bad indentations in the kconfig:
1. spaces instead of tabs (this file mostly uses tabs)
2. too much indentation
3. not enough indentation

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/codecs/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 252f683be3c1..48a6732031fe 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -615,8 +615,8 @@ config SND_SOC_AK4613
 	depends on I2C
 
 config SND_SOC_AK4619
-        tristate "AKM AK4619 CODEC"
-        depends on I2C
+	tristate "AKM AK4619 CODEC"
+	depends on I2C
 
 config SND_SOC_AK4642
 	tristate "AKM AK4642 CODEC"
@@ -1201,16 +1201,16 @@ config SND_SOC_JZ4725B_CODEC
 	  will be called snd-soc-jz4725b-codec.
 
 config SND_SOC_JZ4760_CODEC
-        depends on MACH_INGENIC || COMPILE_TEST
-        depends on OF
-        select REGMAP
-        tristate "Ingenic JZ4760 internal CODEC"
-        help
-          Enable support for the internal CODEC found in the JZ4760 SoC
-          from Ingenic.
+	depends on MACH_INGENIC || COMPILE_TEST
+	depends on OF
+	select REGMAP
+	tristate "Ingenic JZ4760 internal CODEC"
+	help
+	  Enable support for the internal CODEC found in the JZ4760 SoC
+	  from Ingenic.
 
-          This driver can also be built as a module. If so, the module
-          will be called snd-soc-jz4760-codec.
+	  This driver can also be built as a module. If so, the module
+	  will be called snd-soc-jz4760-codec.
 
 config SND_SOC_JZ4770_CODEC
 	depends on MACH_INGENIC || COMPILE_TEST
@@ -2296,8 +2296,8 @@ config SND_SOC_TLV320ADC3XXX
 	depends on I2C
 	depends on GPIOLIB
 	help
-	 Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
-	 ADCs.
+	  Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
+	  ADCs.
 
 config SND_SOC_TLV320AIC23
 	tristate
@@ -2893,7 +2893,7 @@ config SND_SOC_TPA6130A2
 	depends on I2C
 
 config SND_SOC_LPASS_MACRO_COMMON
-        tristate
+	tristate
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
-- 
2.54.0

