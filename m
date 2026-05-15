Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC9E47F2D8
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844321; cv=none; b=P/Jt3whhkVqIAg5QmBheJWvFNDhIR7rkpDhSTYIvETfVKM/gw5hxgmOBrURZxpBP75peMUzy+63C8K0UMjHl5AVMxfqgK125Z3KlQAw9uI+XvrZsNHJsAmqj4qY1X6js9iv7/fWMoDT3q8jDiurw9+9Va3f4MMo41d1x5+nQ/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844321; c=relaxed/simple;
	bh=JWdgOSM2xcYoObfqy5JM0x9eGg0LNLYdg7YJowxbdIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2Lf1XOdhUTEA7vSWpIBFGgvevkKVUE5uyYsURybHR3zqxHgQtIA8ySEb+UQ7ttoqq6mvmzTdLgYhC0hGRdAWa0VbgxKKP3vZ+aOLtAyzFEHbVIfGkK28YUlkCpMoy3mDXQ+NJwghr4T7yi395zOzeCm4wtzHk96JBx07Cov2pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGyxxWK/; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGyxxWK/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-366375c4076so4387066a91.3
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778844320; x=1779449120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
        b=CGyxxWK/DaeFM288zw7z5InmRWFqy1+47hvYtwrFsmEZjZQ5G0/rNTE+HxAqDJMy+K
         7PYugeVWgdyU1wMFUA7wHHi1W43ASt6YHX0A1jEesqx7SZ8qrPjubZ8TQe0mVb618bUc
         gzfrHPSBwgsYNhqc4aWQ0T6SwW5NEYJ+kdqy3ZYCSL1AcrVXJz9vNCf17iZyllpNAICz
         uT9cEI07uEjE3QspDzygS7YuDckMooOJj0X0Dt64mWPBjlh3NeKcuSCBq75weKFnueb9
         vBEQXOc6OGPB30mb238CKZhDen0LSGq/D2F6T5MKLbrX5Qxx03v/yF7Oa6IYXX4HAW/s
         ZWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844320; x=1779449120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
        b=tDAnSgMSB45QUCX1rZkGdIP9umiF77RsBc36rWvCVkeG6wXXYbGgL+PHAJiEKvLHht
         5WPvnci+ZrIQd/6Zvybi9uogis/zbojSxSN34Zyh4DtrrD9OYEdrBmGA6M3J521xCc/6
         rECPJO138+T9plQePBMOqxg6SkIPlY0+6baq46qgsiotoRFzlPVPOJI62am+BQdvdr2/
         x1tWLp11VTupfBJBf3Bb/yY8yhmW9BDGONlfhDySW+O6p60vjkHepbDOskxqprYOkiZU
         rFV3Yajlyo2N6M0Gv3JW3ZHR3qd5KWltPwD7MC+P68a9vBcuF8zSgAiKLneXLA9uVDX8
         ewrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RdajEJJxutYXwb1hzRcsn0Z/Ro6pGRLbN+WBdstbmOS4yiv3kg+rI2xJOsIXt7Wqrs9QmAS+9ptYshA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKu19QVUjYROsCk5Cu9VAJwzPWUkc0WpJv7MdlsVlaTqy8hDFR
	6/FYaSJZhNtY9At8Hg/OxKBD5ScpNoXeAWX+fYorGEVdvCbF25XsFcaC
X-Gm-Gg: Acq92OHavSoHLuKpakS+z7BQelkP5qncYsI1AydP6fsFSaC6eLtaJM9Y9O4PP3N8OMF
	2CKqJvKBlG4bHCDv2zMPJ6tPNgRkciLH+Z0soiwVykLR1sRPStmHMxCrwbR5jP0x0y7M1SZLIFe
	b5OE3eYtotqbb9CXT56rEVjT8M1EkwoxPbafw5DnCBD7OLZ2ueKsX8x1VTcT9vTVYQOzoKZ1yo8
	pAEtE5RSsIVD2bUkX+MjJtHDnCTj2AyUut0Gk0ZE2qfYkE1/bfloZTCt4EV+Vnjvp5wUu/ljL1c
	10QrTpZubjOxw4hsFqTe8jrGLZ8FoWi6JGxoJBv9Fc5HYRB0gkm+C9re5q7tC3pvMy9mNiQr9jt
	RaiO30twZRuIILixDiN5St7gfQdBn8Nu0EiQp3OYbVOTJInesdE1jtBp09ZadEBJqVhFE+ACgKA
	j9cTwJ+3IIyUjma9btzlfMrpplGc/Fhxaj7HZYbPf7v7kjPiaTiTLvV5a0siPxmzP7+l38
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3533751a91.23.1778844319586;
        Fri, 15 May 2026 04:25:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd856sm54530385ad.66.2026.05.15.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:25:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/4] ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
Date: Fri, 15 May 2026 18:24:55 +0700
Message-ID: <20260515112458.34378-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515112458.34378-1-phucduc.bui@gmail.com>
References: <20260515112458.34378-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_adfsdm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 0f6d32814c22..a585cb9fc011 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -62,12 +62,11 @@ static void stm32_adfsdm_shutdown(struct snd_pcm_substream *substream,
 {
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
 	}
-	mutex_unlock(&priv->lock);
 }
 
 static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
@@ -76,7 +75,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int ret;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
@@ -88,7 +87,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	if (ret < 0) {
 		dev_err(dai->dev, "%s: Failed to set %d sampling rate\n",
 			__func__, substream->runtime->rate);
-		goto out;
+		return ret;
 	}
 
 	if (!priv->iio_active) {
@@ -100,9 +99,6 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 				__func__, ret);
 	}
 
-out:
-	mutex_unlock(&priv->lock);
-
 	return ret;
 }
 
-- 
2.43.0

