Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E936A3F1AD7
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781048; cv=none; b=YVsAdX0gonLodunREMl8d54TpNXsiFYvJi2Bk4hfNpFhnLWT/R1ClLzLw5peripZR6FxPV78M+AYZInvp2L1fuDJAgLZ+pnFhqtObkuxJVti72K33kmlBKZHBlG8QUJsx0o455j0ySkd23MPyt4joR/2AVijDh1X1TYFMJvgLJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781048; c=relaxed/simple;
	bh=um4XzRK/FYmWBzEASpvNytlSiXtvP8Pb9Nu/RJVt2Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwYRSuEMIWyXMG8Czk+akCpCkmR15kL+R3hXpLAdAfEhSkMmDn9i2S/Z5i3hgIpU6zqVpJeJudy1DUYMWGJAY3KYmd4XDcCCw/AK65Zh5YDkwHvO72jpSb1JVe6XdVgQ/kN5o0wNihgqzAJmRhVPj40wkwWFIZJcWMElR+n+02c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvUpjONt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvUpjONt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6d4851142so9089785ad.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781046; x=1782385846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=;
        b=LvUpjONtNaCp2YPJvEMCV2DuuZc/R8xSobV4T3+6JrURu9U3iKotkjMv0k34eD5vRa
         i+ortNss+csfFspCdvjXaZnvewUDiC6z8bQizlGgSKa6XVNtFhnE+NG3/B/hQ3UOpIJ7
         bDSh+/D4324+LZ0lBKIq8wPyaHCxihPTzq/p6N1S7Ig4cAyNZX5USCnO95HUCpKr+SZ8
         +D2dBCf+iWJRrZ+UrBnrSd6yfNEVpS/CPvgYcR0OobjmqHrXNXbKHbLfhDEvpW5rId5j
         W7cxLEuoZ+tEzGQ1dJJuC6uvuGXsg361nuBQL3tDuyH892DBTM7Mvgq740yQ9T/4bz4Q
         kdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781046; x=1782385846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=;
        b=jeNyLRLtUORNNEFP8rnofOm1CHEff8sN9fuDTt7UzedyGGOrHoCbjkB7GJGinTPwGP
         bjDQmC4FCG1cPbWayRxEfLE7dFXQ3DHKnNhj7B02UMuhjN4WP7SpPqY/0L882njIWnjU
         O3LmlbNWLEzgC0uYm4VHPF4hwL+Gh6cA7I5IO1Ld9JehmvwaLLA43tziLyRvtfFWLOXf
         CvRSYsvhtfi+K4qq6YlS1x6QT+xG9jAfCY8+z9+PHoNK6ab2hzhFAt2GEvM5WZY4YiKK
         xXMIfprssoAzxzy+jrjKewdN07h6vU3srqsHj12aRz/HCTC0gKMFf+td+4ifAYqcSOs8
         gQ/A==
X-Forwarded-Encrypted: i=1; AFNElJ+OLZHEuOIUr1t2V8LGnAnNxJjtXFF+BVIuLXT7UsJ/zBlRg3ugNTecqnWQQdAcn3Ndea4w3J/G4c2GwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI78jTe//Yp9WuVIyu5qdkDwfk7Wxr5C7ePuzY6FTKMNg/J1LA
	yOmaXaU2DnjMt89RSKz2vUFLUoWAF71DPkKr1KGu7dr1f1GVD7L6O9NW
X-Gm-Gg: AfdE7cmaqdn4uyhQ+iZUrF7GQxxbGfSCqnG7oeSvme2KAmIxBX3QZ1vBtwfxImNr5QS
	FO3/a2wz7cGLofT6MSS3ztCJVwGSI753cyniujqkE0OUIJJ9DxZVB/ZFYeIMKuZ9LMrDzncbN0e
	dUT488wJdsu09MCtzVTfoUtTcN+tOAAOTFxy7AMfyEoMbhLX5yRChkl8e3lzhBtn/b3Yy2pdyHM
	jgjrzcg3iXJZhmcFRm4GpFKLjZm6PtrdtwLtYDGT0SFjfqq4ozSWqVutg4e321YTtBR47RuN2Of
	wpe8dZXZA8LgfQJqGcdpRthOKJmF3znkQ8YzQU1oPIJm2xhvbRKt7V5fY8SIseX6K61WBakMdiL
	iaaXcg+Xw+jwtpKiON7F7HJuEVGrcI1P+nK8iYwovXstCVANpY9lN5Yv7qHO8JEXmcYkcJIOd8g
	fvm75Uy4V5GzH6y/Re8M036uqtNWyfixwWVPmfwA6WJCjQvfU=
X-Received: by 2002:a17:903:22cb:b0:2c2:343:88b0 with SMTP id d9443c01a7336-2c6de666d41mr28427805ad.19.1781781046290;
        Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 70/78] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:19 +0700
Message-ID: <20260618110827.232983-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm5102.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index b4d4137c05b4..d0b6707ce62e 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -667,10 +667,9 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	put_unaligned_be16(arizona->dac_comp_coeff,
 			   ucontrol->value.bytes.data);
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -683,12 +682,11 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
 	int ret = 0;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_coeff != dac_comp_coeff) {
 		arizona->dac_comp_coeff = dac_comp_coeff;
 		ret = 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return ret;
 }
@@ -699,9 +697,8 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	ucontrol->value.integer.value[0] = arizona->dac_comp_enabled;
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -717,12 +714,11 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] > mc->max)
 		return -EINVAL;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
 		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
 		ret = 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return ret;
 }
-- 
2.43.0

