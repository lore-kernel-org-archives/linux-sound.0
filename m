Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15CC25B09C
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682147; cv=none; b=Q4znz68KAEgeO8y7MqB92ID/BTmOSsOFI9mzwgrvfYLiofJDsMYNn81hEiULnm/prH6qHrXozAVgwF8ma5dcrhtw60oIJ2P+rvD2Kp6zAN0aODQPkm9i/8WJdQuy1D5v9AsHX8zb3YEpYYYzFABvMnGKo3MEd/RwLRHfn/KsLmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682147; c=relaxed/simple;
	bh=ngj4b8n2tyTE5tYCn196ZFhAf6O+AMCj14WGjH2lwX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUyyFGlKK38IAYQzkA2nNPZB5FVg/Mk3Z44CTjb5P5eS3nF2mrD2OINGkcegyZXs5z2OOoTVnPk28P66CKn0p5M6Y8kuR6OIcKUqicNXgDyhb9bW724WdnQaQqFAfkmGr2HhFvs4gTq/0PqVOGF/v8vXKdcras9fmTKQp+iH2Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inIUcUWd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inIUcUWd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954dff6536so8634895e9.0
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682144; x=1786286944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G89zE9K0cJl3MiaghXF7pZIuJbVf+x+jpLd1Z0Q4ABc=;
        b=inIUcUWdCzTdSXlms0aOUmt7c7M6TqKTwa4m2d3enjbMQ8Geul6fBVFuIHvXr2lpCl
         V+TPu/81Mvebrlork2UeVOl6H29gtagtbOdvQpSDoSbgF6mwAXNMTFABzefuPC01X7SN
         aJ3btiP+gojEec11/DZkkZXUzq+dGcan17d773xvk05ggebmew3p4sa52bMfN4Xvwjtx
         66ooc6Isf4LG66dniHqKAF7Tkt9lfXS7hdqVjXLyZVt+WjJJtZOg3Zfv4EDlQN7OuWeE
         MBnO7MlZLSlCc2ZiYlV5XWb6YuNieEy4HBRyOCesWHLuoydoh4veZ4inAOhXA7chSu8z
         2VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682144; x=1786286944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G89zE9K0cJl3MiaghXF7pZIuJbVf+x+jpLd1Z0Q4ABc=;
        b=bzT9rAsjbEB5p9y8S/zJ4p+yJ7RmJ1covrZ9bjl98kcEYDLa6tKUH2xA37GEA/pm8I
         H+vaATR5/qf5CdR0mtjuTC3EAWma7jT8aBi9Yj8MpkC5v+etp9U6wIouNZFygNvDbAu6
         UF4MY6c2BxGcgq7UUzg+JaH2c0a2pIxdU14+ay7paz4tHYdjrfHZtMcTcWDPIKr2/psk
         Fi4S/Wni4wOnpFpDslelZbvyY1ZHbcuSzUrBI2yU7azOOIWw6014SjqKjXtNdKTLQA+3
         TvD1uw/sV5d+TpFRezZeTMgDBUIZZFXbUZCNeDOX3RXPrCcZvDQ/07FPfOiCCZF2lpvL
         G/tA==
X-Forwarded-Encrypted: i=1; AHgh+RrOKDZmmjw8QeuH25ywIBlOi9TT+R6SLPJcOu+14BoB0jJxleIvIyT3UREZG2g4PBkimsJfK/jE5dmB8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWKCAdcigSAWarTuTwKTNU5D6qLMfH8ck+Ml+qFXno/yTp0lGg
	v0y3fMff+c2aZa5qATRaSWUPgKHB+4fydRGHpVcoe/PWEQ7nNlABOaFb
X-Gm-Gg: AR+sD11P8kJLJtgy3ErdYonnJAvnH1gn3snt1ZfxkZNUycUrqPrAvhBG+5V8/+EgUD0
	wH2FlG1Y6VC61JP781zJn1MDUnSJDtwF0wo98a418f9FkH8B1YDeTGgrJmHGNlf+Y8CNSrY8vH8
	ZT5jlgvNhK5HHl6+GQCorFIeRZpQjsjtWbkoxzRrUzumxKLQTzaSJbrRyupyWjtKJ9PrUBzDCdh
	YtDv0OHfQ9+HROe5YWtxFEjPqh/J9v8RvXlMaZnXqBoCr59miU70UlRIGxSimakfIj/kZ3fe4vT
	jLZioz0wgxo635BfX/2YaG1+Tz8gEK67u8w8CNJmuL3dv5FFWRL1CMCLpIRbYjaaGoOSlCx3F5i
	3y+yoltITqoPWAa/HItea3GhqdX2aUpaIoLNlwRDSrMnE2SShMnqvxWEN7XgwEn6uHqBFKNZc+e
	O8HtqMd8E/aQI+wBoIHibbUSXuixShiL4l96UaZQ95qdGfteKw4xZX9WTt6vXLmDfxlRltJU/oO
	2HiQaVGftYUvdYCoSqNFm6pylPVllxjMg3BVMJ0szCYwkovx3us
X-Received: by 2002:a05:600c:19cf:b0:493:bb29:af40 with SMTP id 5b1f17b1804b1-4980c674808mr124471625e9.14.1785682143958;
        Sun, 02 Aug 2026 07:49:03 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm23844189f8f.37.2026.08.02.07.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:49:03 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: arnd@arndb.de,
	rosenp@gmail.com,
	chancel.liu@nxp.com,
	jonsmirl@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS
Date: Sun,  2 Aug 2026 15:48:55 +0100
Message-ID: <20260802144855.3596995-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA both select
SND_SOC_MPC5200_AC97 without ensuring that its dependency on PPC_BESTCOMM is
met. This causes unmet dependencies such as:

WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
  Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_BESTCOMM [=n]
  Selected by [m]:
  - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]

SND_MPC52xx_SOC_EFIKA also selects SND_SOC_STAC9766 without ensuring its
dependency on SND_SOC_AC97_BUS is met.

Let's resolve all 3 unmet dependencies by adding the dependencies on
PPC_BESTCOMM where needed, and selecting SND_SOC_AC97_BUS as other, similar
options in this subsystem do.

These unmet dependency bugs were detected by kconfirm, a static analysis tool
for Kconfig.

Fixes: a9262c4fd404 ("ASoC: Support for AC97 on Phytec pmc030 base board.")
Fixes: 6ffee43ecf8b ("ASoC: Fabric bindings for STAC9766 on the Efika")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 sound/soc/fsl/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8ae59c094878..a5d7cf534391 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
 
 config SND_MPC52xx_SOC_PCM030
 	tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
-	depends on PPC_MPC5200_SIMPLE
+	depends on PPC_BESTCOMM
 	select SND_SOC_MPC5200_AC97
 	select SND_SOC_WM9712
 	help
@@ -253,6 +253,8 @@ config SND_MPC52xx_SOC_PCM030
 config SND_MPC52xx_SOC_EFIKA
 	tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
 	depends on PPC_EFIKA
+	depends on PPC_BESTCOMM
+	select SND_SOC_AC97_BUS
 	select SND_SOC_MPC5200_AC97
 	select SND_SOC_STAC9766
 	help
-- 
2.55.0

