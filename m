Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB7D43DA3C
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692883; cv=none; b=J0vy3Fcsoude7TnlFAHV188LB/bcC/bOE+hHO98RQikzBRnkJBaZH4430Go80GR7ZIADNAYUC5wO6VTLpf+Q17YobCOvM7ijT9KF2qt/IdYULSvL7sFNoO4TPy8/eAp720RjZArY5Q1iZh1NIAxWT6cRG07AzstEYca12ljys28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692883; c=relaxed/simple;
	bh=9xbV3n1tUxWEoIS+358Ym1B2iqW853YzQpFC5yt90Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNvpNuGEMeeBldSHstzRoAsBaMU8Yk78I30jXYTl0FaYjCsW4j+jfTPOq/ebKGtu3a+b9OX48wT3IOvlHX1PqYMHKDmzxMqELfRrfPBbggLvuPec30eXscnHnoRDJDlnnBvSylLXkPvhbqe/4R7AarDihvPneLzdI4vVQrgTT30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL26QLzS; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL26QLzS"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1200627eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692882; x=1782297682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=CL26QLzSCD2wiibPZu425P8rA1xWl4kbqZOrDxqmfEbIJGOMytNYm0E7jW3o7FpbYE
         zn1OjdFdmCct8NHTeTbCmvp7uYvuMDC9T483PNOtA28hJ6si1CujUraZrg91pOgmLX9k
         CB9DFQo4Q/9O4qF89U+GZ6E33pEdLzirEMnxEssWqe241vhcj1Bc8vrfeXz4iEK7HZDe
         K8duQ3cThNec7fRTqgHDmm315QEyfEAZBIYdIf1xI+f3gkisupLaxxlypAUqNpEe0U5P
         IyhROnFDLxiNMRMT5UIqtmhxtPHSjlWW8636kYX+wQvV5MElFVzJmlToo34aKqPr/W8R
         iTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692882; x=1782297682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=Sed63nzABRj2NE8AOAh4Q53BRgPx+3u/7hdZlasjgBf3zx0Xexhe0CyHYZNMpkGuc0
         Sg9Ct1FIP+P582YiyEECWwLfrxJXxr/7K9R7t8ydDUBQx8VnpY+XRVMwoi/5WOWKgytL
         Zc2KDoEti1m01wMnL6eKpJ+xmun9uednPtwefhn6RoE/PSimHTSn8eSKr7GxDcPxWmuz
         9K57w2OXvKVWbVQkvP1Sho+RYQC6VQzxmWDr9sIhOYw+ZSIS8IK7mj5obgIQlQf9CSYL
         YI96r3bWDtmHVwwuyTVssnokV0scDkqmoeocOIMpMoH5yE8uWvLMg5ES0xxrGVqE0S9k
         uITQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EwNSMGKZQ4qAO4+CUx6TOl+ds/W1v93lNYWB7GvC0SG7Fx+R4rIjcI9s6Z9zjFB3G/Z1rzNafTfDVfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhNfpKZOkBsW2ksW8ay+FttRWEUEb5w6uLubbnZic3ujeyGnmp
	v3hLvkVPZmlW7OQgW03aO7Do+1jyElsyzEDzQIYM5WaA2Y3aWrLtMXAn
X-Gm-Gg: AfdE7cnA9gYDgjKse2VuWICg5mikY/IQP/0h9fJ3KnH2ed85Vti7g9SZXJPdm9UMXyn
	Kw/WsA7AbRw+wZP3WeA9TGKLeHkOzfrFdabTiTU/hWMavIVXH8VdNTe5rns5FZmUzX5QKq5q5JD
	Avwjk15LPnQFha6oNYqHnZ0JN+xalIcQWLrNw2SM6ogrvK+YY9w/+rBj84GNsb+Lf/Ep4cXZhzB
	DeA7f+kPESheRLoGOJX5O6DX5yyLmMcO9vc4Qz21Xtau8DXeMpS0VCcXbsASWrZfRkq6+9yFkPb
	AZy0PQzrtk7uH/DPOMgR6kbZsSuourTLY0ekSd8bC5L5Ji6Ei7KAeTiA7ZMHvs+Dox+jSf1F+Wt
	gjsBBjYt3xcoTH2nLUqDCOJcdnpyFcZzHih/iwfq9QkhaJxissapvVH23gOe1CyCEsaAe8yBXiR
	WQcOQYuMiopF4kEZT+Od8wE8TH86g8d6qFIrHyxUOZ7NcN9bo=
X-Received: by 2002:a05:693c:2d88:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-30bc9f57d3amr1910340eec.16.1781692881708;
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
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
Subject: [PATCH 54/78] ASoC: codecs: sta32x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:11 +0700
Message-ID: <20260617103235.449609-55-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sta32x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 652c6e3a9e63..61703e6e0586 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -271,7 +271,7 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	unsigned int cfud, val;
 	int i, ret = 0;
 
-	mutex_lock(&sta32x->coeff_lock);
+	guard(mutex)(&sta32x->coeff_lock);
 
 	/* preserve reserved bits in STA32X_CFUD */
 	regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
@@ -287,19 +287,15 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x04);
 	} else if (numcoef == 5) {
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	} else
+		return -EINVAL;
+
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta32x->regmap, STA32X_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta32x->coeff_lock);
-
 	return ret;
 }
 
-- 
2.43.0

