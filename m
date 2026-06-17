Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98E649552F
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692867; cv=none; b=CEdkEbwsIXMdH4aF7hzV/VfWz7/caIqVSnsUpu0Jz3FAJu7I7H0P/J9wGqFTsnaspLhcUZadA7iBP2/BFvzGOkEkYZQHzK0oKTT7sHKDikbKYOPXEl+f8dvlqr+jS/0BH3C62Se0vdMr4/kGHswmAJ9VhM1Cb/fv2XidjTF7BCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692867; c=relaxed/simple;
	bh=T5inPM0/ZembfY2Nrx+5l3rT9jXABsUVzUit1sml7qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdZ4jTUapwwRVP4Is2dia+fiIOch39bW6T+O7rEmTvbWaY3fjgNpvq+hH2PzCGliVHr0jtuZaU0BFXgtfTrEv2p0FJkEA905uvo9lI40yxiysLbVOjDPlw/xdmvVZHTPJgRXmcW7grJ7t4WSfvgUv97TSLrCp5+ptFgwjTvUjJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEWge9r3; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEWge9r3"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5794274eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692865; x=1782297665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=JEWge9r3t77IxDu8JtRTjBRotsTcjblX1D5wOKuVJGmPjnAHcxFw1/939jwvpWhSGy
         Q3IxDzSOmrRAMo+0tQOQMIv0EkM1Q4tkyR0xWORhvW1sHHrwCogSLI+7mY4w2VwFo6U5
         uvXGVFp8p0cqFfLHKtUP9NbZn4q2h6+TQ/aXGmRziEqhkxSF6KzWcj8z9Xo9fH3txtFs
         V6Ij71rYn8dYITJDH5ZJ9qOV0omkTl5pe05WapzLfwumzaA+8ohIznIQR7W22wB52y3w
         GVkTbnJd9VXQ2i9A2Ho4yQyB8EzZIiPBjB5QpIffseoA8EGSM7f+UeqcA65SFP3iKjJW
         b++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692865; x=1782297665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=R+KYn31BtQcPCG2THEKMjLOuzJ/CRFYQ6/QnmKvPTuxd3NtR9827qHyo4VfE94uHNg
         X33I0bB37PkKA8P4cRmgHDbe4Lxx6UAGl74zM1d1PejNS7CMVykJJf4YMJbd65bqaDSz
         1W2mHRanEDea76g90EUHnjc8lmK6xqNYi9EZuBXTi1n077bM7V451++QcTKs4YBdkAM3
         AQlB1ubEUljT19DVTjDLkhxRk2q706W3C1TA3ek72WVyUT/JnQMarTAR495h5N9j64bi
         CtCYDkCSdn0+e0xBYazuZBhJ4UjbhdSdACSQQxm62EGALmNVSKRDh6HybB8+cTd+fMf5
         YPow==
X-Forwarded-Encrypted: i=1; AFNElJ97zC01WywxQJn6EiOBdZdlaVzq2B3/yEjc86lRUqPwVMXzA6SggaHNTWQ5W2y1lyApigm+OfUE67WUmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGy4PA9mhkXWyjjH8qvRnrl5iLwNJOGcpIzofJc6lIjbc88qhM
	007mHFa3JaV8G9TGhxLGnlJt7M/CgkXWrOdq4S/fATb1i1Wi9D57Sqeu
X-Gm-Gg: AfdE7cnUs+88rhgChNmbg+AVGyM3opDAs4wJ8Rjm4vX8rpLaEFZkhfIGx5L4DKQ/Lej
	qtUgyTYORAjAKCIIuy5L8Ilm0tHMHrdKKL9jsxbRp5NxM4ZXFgdieMchCyY/9zAtpEltqrX9vMy
	QxV0SgofYAMA/R1lLO/vxnVJHVM6tQnTThdsfRNIkK4rtipnaOy+mPkdG8+mjHPFu/DhMCpJO4B
	P4ZaP0ctw2I+357HkaBiatUAMvn17hsKUJiX0JLdWx8iouaoGq8bwwIW02UO58C4cMhmp8/j9Er
	2IFTPhOgqTr3e0kLjmkb3+znarZc7ZbGs6gCVNf1tFclSbEGAxsMaTTBN+cg9wjJG0jXh8abzNO
	8PFLdrTUCmbSpZo7BdZ+SFC3F9oNqOlI+70mgsXBztdla4ojdjMI+HZjDa1UrUsxKbGhfeEyvGN
	JKM4gq0nILZLCcQeT7q7qzm0XDbSqfTp9mkilOhGuSKV/CtrMm8e1YDuV+5Q==
X-Received: by 2002:a05:7300:30c8:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30bc9df5a44mr2016767eec.11.1781692865129;
        Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:04 -0700 (PDT)
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
Subject: [PATCH 52/78] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:09 +0700
Message-ID: <20260617103235.449609-53-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sigmadsp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 2e08fde3989c..592aba25de11 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -135,7 +135,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 	uint8_t *data;
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	data = ucontrol->value.bytes.data;
 
@@ -148,8 +148,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 			ctrl->cached = true;
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -160,7 +158,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	if (!ctrl->cached) {
 		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
@@ -174,8 +172,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 			ctrl->num_bytes);
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -677,10 +673,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 		return;
 	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
 	if (active && changed > 0) {
-		mutex_lock(&sigmadsp->lock);
-		if (ctrl->cached)
-			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
-		mutex_unlock(&sigmadsp->lock);
+		scoped_guard(mutex, &sigmadsp->lock) {
+			if (ctrl->cached)
+				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
+		}
 	}
 }
 
-- 
2.43.0

