Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548B42188B
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692533; cv=none; b=JzA/9RmAkM5CWqy45XQ96ubM2/p+exKJvaw2mAYtzj++FaexvC6uZlfW72jS/v2mevI4aeH57zIZ2E/XeXVlEYTD8NVoBiNfXsmWjn35I1OUmmJzHRvjK/PE8tV8UYfn+icvP71Zk+6Gs3QbHQoXg6zr4iIG/PbWGSRa8h+JbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692533; c=relaxed/simple;
	bh=ywyecjY5IPnCpFu8t60JAxjAocTPdOv2KzNz4XTlQY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwT7y98Fcx8/7++drPwcqBP0QmI3fM8ZFjz9t4ySM0BRtjL+kQOu9JY2sfvR2dNRpyFblmJK1U3NgEuoMJ/lfpg0QKM/jJT7Ekm6HTdQ8q+68QfHJe/Ip+e1vH8ZIUUESKSSo8XbLKofslecrD/gHu5TWF+/akPn3nRmpOzN3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrtZfzhP; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrtZfzhP"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so6291164eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692529; x=1782297329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=VrtZfzhPS525+dBmjAIAnd2vduK0otJgA5Mz+6+zrksjLNfXIMsBff363tAZaMfrCj
         LmDrVZsCxmhvU/M/Zb9fLAcl8HLrKW9cLiKtjCP6V3vTds2eLiIyj33r7JtAdOQ+pwnn
         pxuDGclgR1d4Rh67+dKWRUbyLiFsJCkOjb/mGo/PIcYojg3aX9ErEKjtH6gXs15kvyF1
         fSjSoLUfIjaOzKuyDbmBUl7/kk4fuq/Y9s0A+XFw1/QvOmUdb1i4+4u9HhwBhbZxq66P
         HZaX11HNZEdcjjlUhOHqXdLIEogc7xD74lYmK6FcEsmlLlp38HJFPiyW3eB9kk/0kRJh
         eVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692529; x=1782297329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=euCyXZUr//3svyxBWpP0zO/URh7QtkEjFjRtFzNO+nrfs+LoQW5vzPz1ekNr/Bw7r4
         T6CaFMgArw0yjAyTY1mu4O2bWhxam0zS77e41wQ5bdJI6iRSonQ3g5U97BC3Zaismng9
         KqxNE/UMjbDRM7fRaFXrr9++cWUMItwqTLiTf9D9As3G4nY5g5ePxejBNoRTrvPl6VF8
         384V1GNOWyiyxKWwrU2vRvICRLoai9eSRLwR76c/fv0Zu/C2K0LL6lPUOgyQs/lRihpo
         hlKDAKTh+kSf5eoJdFSmYFYFte+aCE7QOswPWZ31hs9iTdN7smZ8V2mGpJjmMMgJlErP
         gTOw==
X-Forwarded-Encrypted: i=1; AFNElJ+IlOEw7Xp30HJ/g5r4szk/ag07ti0O7eol7/e+KemNUrltJC3EooD3CiSQRcJ+p5L+NScW/Z2eCtHgfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvlOKcXZJQ749taYfzwV0RJhIvw3Bk0sMsQ9Sc9xx+sKVVtkMG
	35bO4NUx01MELhtZvJ8FqkY2/RBB6eOPADOopY1ASvxrAy3wnPsYsqju
X-Gm-Gg: AfdE7ck7fqeSJEVhOhUaQ+joUkCnGGSY5ouWhts6C92CCAT+9bPKCIbkVAHLSAgJN3M
	vijmtxuvBQiZn+/510imrcN1CO0rmuDOkECUKxFa+waaULCtpnEQzslzmfx6NCwr4erQv73/Qiu
	7jFuXOQ+ekxjSJQDkU4um+LKaG+TKkIvezh3f3cvCvZ3Q1B5kwNH8b+idIwDM4dTC+qZAuwNvmS
	K0xT6GSBTAvXDDWPkJVSGui2LGZHNc6We/An96r3UEx2dvfVpVlKEL4TUKUxMRzR73FCNphSM8q
	nXB5aEcRbfsUkAw019n798cDLlBQ8LPZJCd8SEZCRxoW51cFkc3AZ7YnpmX319Z5wnqIE1QWAeq
	8KaAxLe8UHtufqgHzC4cTnVL4PKIJx1oLx974W4Y97nvvb5ZY2RHI38i/QZ2IFCBvlleD/e24xu
	Qcz+BxEkUGOO6okcbqHQa01ghixxcl+tUwyx4+KJcGQqTDEo0=
X-Received: by 2002:a05:7300:6dac:b0:307:91f5:92e2 with SMTP id 5a478bee46e88-30bca90bafbmr1658562eec.4.1781692528915;
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
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
Subject: [PATCH 16/78] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:33 +0700
Message-ID: <20260617103235.449609-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l84.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..a212f6891b40 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -281,10 +281,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +830,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +901,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +916,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

