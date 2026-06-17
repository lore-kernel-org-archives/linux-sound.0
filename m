Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38803FD943
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692429; cv=none; b=p9zK7QlPobO8OvGj3yE2Cy7k0G1WE81BfT4jO6Ybwzv9GgTnwyhXNgrTnl69TAon0dM2sE7BxKJZIfNqaTxTKHKyh8cva6GxwEkSA/LvO6p9J0mTrnN2LTx8ttUbgKQ7iZGI0CUTKbtAbSHraSLCyDrgG9wdaS2Ko+unKI3i9E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692429; c=relaxed/simple;
	bh=p7I8p1HqI0DOJoeO7F0emrTBqowdFspnMU9wBZaq0/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqpTWVWQfOsbDlKAmwgl81PBVaGzWziJofMbPWFgzQGw/m+aOfA0MgSyJSq6UONKej88zPlQt/RXRDD8SIrA/syr84qWzxLrjLAQtZGceJmQF7MNhvYijE51sXttxCzy+XDqbvb8wYa1w8ueZnHJWhEqEHW9eREcCKdDMMmB1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNXSnyAJ; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNXSnyAJ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304f590dd91so6357448eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692427; x=1782297227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS4w4WHNmkcPtY5yr5niis0PAYXe1Ae3qWORsuW86iM=;
        b=qNXSnyAJ/CT0wxTAaSHGCWLHZQPuiAMHJyXWSqbbS6yadAP8IxAXCb4LH3eQOADM8F
         vz8ydTCLIM8QPZCQ7m6Po6gIiMsKiVrDyMJ6TLUD2jUSqtX9esji2owMJxT/zwT38xDE
         ZSCBLWW9f35FGYGatkFxXcfXxAsOOGEN81KnWsxaQQ0vNGqxVjkA8rJFQI7RcKjF4gVM
         pj3iP3F6u0IZJQiASwWKFTOQcZuR10nKf2vQ4CNKuFOP9zo0hIv3WodW7Ow1zctTq1gQ
         e2vODKwc09t4cnHifAsKCyn1ChbjlpfkhjZi/4PWBkGGzRKF1DxGpbOx1xX2Xn1bzSyW
         VbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692427; x=1782297227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS4w4WHNmkcPtY5yr5niis0PAYXe1Ae3qWORsuW86iM=;
        b=DkLC6ZD2z9+dIsVu/VZoDemHgx3wIxDRFwjLG+yn1oJ5EqHpzrpI1F18ml+jBtty99
         Cp4/T3tsmuiW8DHh23UjATZ5u8LXvEypjQ/fgIVJXD+8R2To9/GbTjf3XtZ9JISzWhv+
         wulUiAKUf6r4+rXjjQDtsArgCKeMorHMWeHzfVTFfnl9HWueemgZMWMa9FHgWO6J+BOu
         u/GQaLSzKy2SXOjgUNVDrc2452URGzcoppSz6VqTnlu24Ii1nUk4O6oGKMG1kWRPkBWC
         +5PyWDSxKp2k4DyLKa+tuwFgOlLOuSwOqcwI45nPD8uzy1QmfpK82Esox/sEbnX0Rcfu
         0I+A==
X-Forwarded-Encrypted: i=1; AFNElJ/qtCtrcpfNmJAVFgWshBTGAXrnx4H7L1wsawpYcz1BN0c1qNe9TRTHFwsuaSj8/hDTe7c2oGpK51nTRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxePkNrQTNU9c3g2/guSO+OSzMNUX+k/gVmFLdI7sJVDcYn8ukn
	6kBDeECq4zTIxypn8tiYlM395WP6O6ZWqvqVQHQQJxNFLm7/aY5nC4yb
X-Gm-Gg: AfdE7cnn1atMJV2COFOAI/uHIqF7N5ETfw9Qy2eA/hkXm8wgpwEm45oHw6xZIkNd0kA
	dEZpg3pE8UeDq5yJda1/vCrdCDjvnB+6E1H2I01GIGl96mSlh++YJJ0tgcBrH0HD4lMqU4TIU7E
	dkr2sBLd7KB8q8rznxSOC1qZ37LzppvpGFoIRaJFYU+JZ88zzamClRw6+QddLI6toGKFqrh1bRy
	NXI66+UXFLWuMTwVOZxz/GT2eixwwJIHyWhVVFxIASb2K0PbgvwQWJnZCzRXfpC/W3meEu2RWBX
	QtUCQsn+Q03dnggIgdT+bZiU/JZq4KTq+aPIyw7BxLX4glix4gCBGw6dMUU/OlanGMOCEzWz4Kr
	oSZILKxD0HPyzQqY6NrrAA+Fn/McE/Rt+haX2meKKNgtmRAVJXesrsIzjA3D0MiA0usqDy3ra5a
	1Uh1NG3FLaMWmatSQTfTmApu9Q/rU+iXyCxTtd2SNMBKElSKk=
X-Received: by 2002:a05:7301:10c1:b0:304:de94:1c2c with SMTP id 5a478bee46e88-30bca0cfa9fmr1655914eec.34.1781692426567;
        Wed, 17 Jun 2026 03:33:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:46 -0700 (PDT)
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
Subject: [PATCH 05/78] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:22 +0700
Message-ID: <20260617103235.449609-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw87390.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..88110e720f85 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -225,11 +225,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +237,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +277,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

