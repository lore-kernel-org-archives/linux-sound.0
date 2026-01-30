Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAE130BF68
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788842; cv=none; b=JWzPMtEBskubhPJZm+pjZW/tYpfSdN3GP0JRzubpBWw+GLseBNQBdfJxFq+b0bbmlRCW29v+ZlxofEG90pns1y65fxsYc5J3o1wNbDQ74Y2XJT8MmdOp7oyyNe+QZUd4SFvZV2HUcWrGcTQtBySbhL4wHklYjYHDE1F+Fc1xXx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788842; c=relaxed/simple;
	bh=nmVzJZUTaOkQHp/Hy51/1k0NuGLi1SA9x/t4euO+Rx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ahb/30W9bHm8E+fwlCbt/oINnWwGsf+xW/pIIpR4ESHZ4pYvDZr7FKrFwF4AuJnTtzzP71YrQlgvI8dqG59n0Tp+I6146W1VPupXbz4i94fRb34Mup9p/buCkGgAqXcqBv10LrHq6Y+OdI55ptIkPGlYlthfWyDYieJwWp8bwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr4ZHr2i; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr4ZHr2i"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d67f1877so14949695ad.2
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788841; x=1770393641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi/3D7TGPNkX4g7yOB2yJZ8s1/d37se8AhWeIxAkSK8=;
        b=Qr4ZHr2i0Vbj2UfGUc6LCKGD2pugU7NoP+jPjX3tMdbPwJlWAHIjZf+QMO69fNM3In
         9BkJypJJu5B2KXrL0DQrR8O43S0Qrd1wODgeyQ71e40QON2g4yi/xzv6PwAcv4fZy3ue
         cQAD0dHG3SqnQKUJDapdVN4PCHKMEoRxBMoceB68sD1S82pi5dpDQW84edsTfc06p4Ve
         7ajBwg8D/mR6YJ4a84OzDDeInMYl7Jls23kNGE+5Zuy+Y8AlsCrt2klw38plN4q8ry+9
         3Sm4rFywOND6O66OIK7xnOdLBs+cDiuIVyIG9wpE8bd1F4caKISsvkPiYOMEU88xiYw0
         m7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788841; x=1770393641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zi/3D7TGPNkX4g7yOB2yJZ8s1/d37se8AhWeIxAkSK8=;
        b=ZnHT7tl4sRMmRHmvP2yVrdX/PwlsDX0G+O8Pjb6OWDf2N2SuA9/Iy/nrxCPgvWAmEK
         TW/YwOMNVHMrB6ysLC7siknNyYMMYkAfpijA/dLusWvlt8jx/WSHGZ3o4wy8M6xb5xXO
         X/dIR9p2asgedT7RQynQdnmFxT3FsloKQIGbczA7K+oh7qTFKFxPjy6jKMKh+8bHj4TZ
         z5sGy8jPVTAtO4LNMJzqICuF18U5USPAvv56XSX40/bT5bOQaafplcpQiwTe7hyLeLOo
         LNSkv9k+3arhsFm9DdAxjDlNRHWz4FLJHe7r+3MHU2iUJrUeEsDKlBm6vqYIU3WBtVjA
         YZkA==
X-Forwarded-Encrypted: i=1; AJvYcCXb46NdG9m7NFKwihVYSgVckyEstL3ybLndwE2mk9tzGRs+poOmTeEGqEu8+COVdJuJoPMJElG0Ro2dbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAzF94xn7+FMACOke+f7hIASIaDR8/9z0koYiTKbXdLd3vB+Vi
	3dFog5EwBXoT4VWi+VEGBLFmJ2PGBj/lrd6Yfn8/PgZzPWZnoNN/kmou
X-Gm-Gg: AZuq6aI+HsnGL3hz7v09MY/RkbQ9pCFZu6S8DmqbY8m7oETOJ1+4WJqK1DjufFd15Ep
	p6N5tto3CgZsXApu/Ab0G3ppZBrd7aUl5VR97gG33kG1nhZ3os0MgH8MV4pmfVw46R7dUVOLaKp
	1orrAlI78a2nzwMGxNkS/8AO+ni9yQPZUlF0ti8qxAAbfM63XWBOi93ugFIVSXgGpanrquAMNq5
	3iT2l4NSNmBuD6fAsyzOrmJvDIGrfIWXTkZtINrxyoEOO7yMqMqyvoFVbOjD1Sec7CdAe/lgCLu
	Zv28t/kzltZashqAC2D0CoL14BnG9d7P7SRl8k5OSrDcw87pU7l+6ev0kofDLEdVS46GH1eotlZ
	u6HlfsE75ygD2HMlmZlBsPw3zsj38CDvajtw7/OmYlCdR2K8MAkdbTLo7Mdt5RyNul5uJQGa34t
	h15iknxxP3yofn8BAHq+2zTKyDre7iSn1e8rdkCmEMiy2RBs5f+4S1CZNxBWpCg9QBZwgQ6Lg=
X-Received: by 2002:a17:902:d4d2:b0:2a7:bd4e:db92 with SMTP id d9443c01a7336-2a8d819e205mr38897665ad.53.1769788840476;
        Fri, 30 Jan 2026 08:00:40 -0800 (PST)
Received: from LAPTOP-LUFMQ4TC.localdomain (118-161-168-35.dynamic-ip.hinet.net. [118.161.168.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5df0desm82025645ad.82.2026.01.30.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:00:40 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 5/5] ASoC: es8328: Add error unwind in resume
Date: Sat, 31 Jan 2026 00:00:17 +0800
Message-Id: <20260130160017.2630-6-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130160017.2630-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
 <20260130160017.2630-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle failures in the resume path by unwinding previously enabled
resources.

If enabling regulators or syncing the regcache fails, disable regulators
and unprepare the clock to avoid leaking resources and leaving the device
in a partially resumed state.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8328.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 7afc97c62587..9838fe42cb6f 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -784,17 +784,23 @@ static int es8328_resume(struct snd_soc_component *component)
 					es8328->supplies);
 	if (ret) {
 		dev_err(component->dev, "unable to enable regulators\n");
-		return ret;
+		goto err_clk;
 	}
 
 	regcache_mark_dirty(es8328->regmap);
 	ret = regcache_sync(es8328->regmap);
 	if (ret) {
 		dev_err(component->dev, "unable to sync regcache\n");
-		return ret;
+		goto err_regulators;
 	}
 
 	return 0;
+
+err_regulators:
+	regulator_bulk_disable(ARRAY_SIZE(es8328->supplies), es8328->supplies);
+err_clk:
+	clk_disable_unprepare(es8328->clk);
+	return ret;
 }
 
 static int es8328_component_probe(struct snd_soc_component *component)
-- 
2.34.1

