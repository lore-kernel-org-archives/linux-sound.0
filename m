Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45763449ECA
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692875; cv=none; b=MTVET1XZ+HFoULuczWkDX08T1A5KnBqdSpvGfhUJ0MGDGSWq53vSElp+3cQdaefKEjEGIm1/1H72AnQXNSeEa/ozNotyh6Qa5lrfR+3TIVQj1alLblu7BXuIUw9DeGGhwz9C4cQqKPY0a/6w5q2S8sGxveiNW7hO7wZKSa0IszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692875; c=relaxed/simple;
	bh=dLcsmhfPTMCw3dE9DumePoMRCtlHGUVY/pwVPWnU2Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMEC5T2RgN++zZ0SZXeTA1N+aFg4H05W+KdJz4OPZ5P/q55Gxrgy3EKHpHvDuAlR6bCja5YsQcxFQHNqZCuOSLgwcCzzbiVzmtg/ADFokJ2tortUjsHan5m3ko0/s4RJPJBE7xFj6Wd813hH5hNVIUl3KFyEagPALNfh9DMABbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d05YM2Pp; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d05YM2Pp"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3042a388168so432213eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692873; x=1782297673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=d05YM2PpKa7q0wU9lGIO+Uy25CTmS14NTUA5XMm30/g6pyFLiLRIf2xggZSrXn+FGT
         1IeG9PPj9qkM4zvtiJ2pDGcfY8PBki8SnRS/ft3Dxefmv8qIG8Poi1ic9osCFRWqAFC7
         z80SnjqiZ+k2PArYtZZeehvOg7uk8xTCbhuNW6AayGj111dOkefwyOnlRWuwo7u0Ytrz
         4wPBmow86HTEeDFNnR47txEuE8jK0LdOUoCK5CHm53iTYX63ygSdnTU8YD0fnloCv9Ns
         lRbz+FwpFJxWjtxacAWNKYVIYHMHanWCZpnA3QTJ1Vws7EjsdyfoQUB8v+U5jpq/qtpd
         BgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692873; x=1782297673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=aBbsS3ycrSwUFfZa+rpf9GfloevmVFQKLQbgKh1kif5C5TXCLCceRkogQi86eC9WF1
         D5XoCeOaALy57M5Xj9TWc/05SWCaonlRNrH3qNqPL8XylL0kXsZpxEK6SXoaM/S0J0hR
         Ymj8LNwau2Ymn3PqVUhI2wcOzCQ02M1cvF/AIENZSCIZ/js7Eq3vXd/YkPmD2UmIy/G/
         vBvy6yDWskwfcdaTd41bgnaNE2/CZuTMyAO/ezLfZ531immaho/or8jOBYWQqpyw6GoK
         LFJLdXACeqGPCgaMq9ekAxvFJMsEqEQkJYEjcoUOvOyBHW9zPcyGh+kiXavBjBJsHKi8
         j6mQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/P94naVOdfFa3PpiDXKeSVx8PqGyoBaGTR8s6LAZHPrJ/rns4b0VTxn6MaPWA45E6Hge6/Hxi4ZPazQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnw6MMkTxq63snY9GCS684UpOt2/sKJFHCx2UM8oEweoNpCCUf
	ELmqfckEYDX4YhRtVsYrqJ1F56VQBZ/BxhNc/JperhAG1CtKY77BQNnQ
X-Gm-Gg: AfdE7cnH4gzTmWHWDb0gTexhPTm7k17ShONl5nt4kbnxPDkdQWJlpigBJ2nOjPElalE
	pXvTeVV6LyoEWIsafPFudN0p/QslEM0Zq0g3kIVimP0Ofqqm0HKF+g9LLYcPeIX46u8H8s7IhCP
	jGidWcoIb+rnfuFpobBjdxeq+7akcUPrwMoRK+O+acpOHtMAoHSct/dTA4Hjl3dqbDHAvg+m26M
	Zlx3+mLT/9feAqkq2BnJJjaVaY5bxRe/Yunuu5T/AILBqUwnkIazgxGd4ihXVuIrjaVJ95HasfR
	VNUbqBqRmcMOfHSbUkzUpjrrxHIBOnaoGZ/8LjklLDn2LVeR2H0JcvwbxORqZKA7hJ6YEmQLStU
	3Wfbmch630BVnfUkcYiNajxRZwMO0Qc3BdWOP1vWVOmrWL0uvOx48afqZm9wBZ3/hCgAjVGDwqH
	lW6I7cKC0smHOYMnfPTRKp6kLfQXoQHBKiOhgq4ni+3zJnjIg=
X-Received: by 2002:a05:7301:60d:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-30bcf6002c1mr1306991eec.10.1781692873410;
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
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
Subject: [PATCH 53/78] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:10 +0700
Message-ID: <20260617103235.449609-54-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sta350.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b..b1e2f346c647 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -306,9 +306,9 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta350->coeff_lock);
+	guard(mutex)(&sta350->coeff_lock);
 
 	/* preserve reserved bits in STA350_CFUD */
 	regmap_read(sta350->regmap, STA350_CFUD, &cfud);
@@ -325,8 +325,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	} else if (numcoef == 5) {
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x08);
 	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < 3 * numcoef; i++) {
@@ -334,10 +333,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta350->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0

