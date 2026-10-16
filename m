Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85EE4772AD
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146862; cv=none; b=dUZVnFMRjtEmqLSrceaO55AFSRv7hrPS4cCPTjWpJhffwLfp2fba4/d+C+t/CroYmwSiBJCU75Uk2lI3FvRoP9cp+qS6nBQNVpdzn9QePUxVbx22bha34IVXWHQt4ftnIVUqajAltGrb1esdzYmhT4przTBi1MW0CoULN+Nz2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146862; c=relaxed/simple;
	bh=CocjqBK1bf5KCvJSo6fMTgVPCgDyzqgdFwf2wui+jZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rqk//OB3jX9NYPyKQZ+bUeVR1gCugU4fpvQruX3q2vr9/P1Kgvv4ddlJYxNHSw2O3ipMYU28XrC/Vhj7BV3AdEKE3gLr1M2K6p8JxgH6beQHqQJ+6YYF1SLTicfv6t+E3YeWOgN+uv03tupICikUbJhhQTw7VwH6ItzS1CXAi2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qgUEQMWZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qgUEQMWZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-486e70f2457so1181130f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146859; x=1792751659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vL18oGUd8P1r7kwxwBhDb5d5aEOYYG8Ck5OmuOWVWk=;
        b=qgUEQMWZcRXgiJZH4SXd99S8hp5Ye+GT/9Js4TiCl2BCa8c2GHAiXcGhWGaJCOw3HY
         jkhWaDheviNG8e6ejY3D1t5EmC8VdkdBZCpGDmgH71r5DR1LfBdFJyfYXH8XtiygyU5X
         BMSYTOFFaqVYD2NUF+DmGN4lvxDEZqB43mJyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146859; x=1792751659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vL18oGUd8P1r7kwxwBhDb5d5aEOYYG8Ck5OmuOWVWk=;
        b=NWwW7V+WHTCSdpV7aQ7znAr4d23cGC8MCYudpOe98HnlSLqNMOtqpfI5/9tsq0w1O4
         QsAqJE7bhzXKN4EgshnPmPdXqFwVzYT8i+ZHPX8klikL1X0nBxDn7Vu2bzWa4PZedvvk
         1I43UIpMeE/0jpG8RMV292iEEy58qHeCCYBG4vAL+PyQI82sEemOBa+tcxrmrdCk3Wz8
         U/ElvR0YW9F7X2wMK2nOcDL6/kouoCfnoC044wHENgWRLFveGE6HGlbS7XMgtVqB75g+
         XnGEfEjbgcpI5k51KzI8zddg+GRq/GZV2uv01OSBX1ufOPqBptgSL+JCwmYdVbQF2PJ9
         wN5A==
X-Forwarded-Encrypted: i=1; AKwUvBwsaLWtjiwSA4yEPSDo+8Su7CjCy5eq6vYrLEQhDQYyrK3nVUIbI4ljNzUkLPBLPqT6hD9l7oC4vvuFCA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOMKgwB4wc4J/MKxEhcQGgrEZbw7ipr8dbHIt1kPXjgEKd0KSc
	HMVqbpPE99ZHU24ZYC8xbOlUU7Klm5V4QmhhzzLXv1jBbhoagR0hGAQtpV8JKGozK6A=
X-Gm-Gg: AYBFou2qkQWPO05gR+OO7UL8SloZvIAwYZoRTUlyOHEaLvNxbFeuiQqKb9IShiFh1QR
	rhFLWZyRXg+CqdfbNmCFWbI79K4kNdNBjpaMMeeXLNSRBuNmMiKOTx4T7kmehe+3L8KGr8j3iRt
	/Jfg6spod8uQwZDkQZVdERnQoKflYSxxJctFDa7Ve9qgvodfbcBV6gxKr/IHRtlYbuh2hZ4YaAG
	C26njZKejXLDFYvIOWwllbqOqViIdN7r3xusoAU+vHAgcUQm2tHKY8a4+/ESFBUtRpCWlQMDpT2
	uzBpm+mPKMVMHemNz0ReGaZiYTbhxf2tk26/PTwRbKyJsKhYZmxRx/p4sCEZqEj85fL2VJDkh+3
	cT2T+eu9lnS76e558SDlUpVSkAyfoCqNTqllhdCe+dWITPF0o48PKktAwIfF1l+hA79nml1Yxv4
	k6aSXtqAwgxSB7I10B1WMDunAI2pzENuImobIwfayBvnL2KF2Md0lDPR1dw63AkukoBaZHba/oH
	EFoYbt4Xc/3SZ2N2kRuRPBhROudt2S9v8aGL74CXqYnoRTZLLlixIo=
X-Received: by 2002:a05:6000:2583:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48dff815434mr2832521f8f.41.1792146859019;
        Fri, 16 Oct 2026 03:34:19 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm4163148f8f.2.2026.10.16.03.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:18 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:57 +0200
Subject: [PATCH v2 4/5] ASoC: pcm179x: Add compatible string for pcm1796
 and spi_ids entry
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-4-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

The PCM1796 is fully compatible with the PCM1792A.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>

---
Changes in v2:
- Added missing entry to spi_ids.
---
 sound/soc/codecs/pcm179x-i2c.c | 1 +
 sound/soc/codecs/pcm179x-spi.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index 5337bcc7c62c..e81e20fadadf 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 192fee90c971..4b873f2986c7 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,12 +31,14 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
 
 static const struct spi_device_id pcm179x_spi_ids[] = {
 	{ "pcm1792a", 0 },
+	{ "pcm1796", 0 },
 	{ "pcm179x", 0 },
 	{ },
 };

-- 
2.55.0

