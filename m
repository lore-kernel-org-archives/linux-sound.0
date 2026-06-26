Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED383D6692
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454587; cv=none; b=hAa7U6mbsato4G1AuejeaurSDS6Z7q8jrZqqI4FIauhij73YMdpGTnoGjlxtmw/FPFLcAZbOsjwnRmdV2pkNBfGvm/JlDqlVvLuEC7+HO18lgN1Q96dMCwQsIF/iHJ/vcHFnOh0HMziupkAWcZZD93hM9uy3smWhhegw58SAOpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454587; c=relaxed/simple;
	bh=w3jvLBlvAQpe6p5TRiEK5F7wPOafekRIEHEin4rETy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdfKAad3g3r30uJAFXOPWkwUzHX/FXf/jA4vtfj26omhTjPFOdMd4vrB+T95iy/sJSix8yitUQy5TkoM4UtgPFXnMT6WI56ZoQ/9gojy3RnhWxkfr3LQxKhv72dBCWN0BdciSeZ7eL1z87cQI3ONKkIe6U+63FGGWwMaVSPhwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfWzmHD+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfWzmHD+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37d70036426so282619a91.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454586; x=1783059386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAwcKFKT59MgIybmzJBQCtn8rBNm1HXg0BYQomquJmc=;
        b=JfWzmHD+mSt4ZxkDIAw1QN8XonTneuTyOyP48VzU1DpnRhM4oehdLEJJ0RQ06/BplW
         jcUv6dXQ4KcO/Lh573kBZ1JF1b6dDHqhIG5DcMebflx059hS6XYZcnA+M4O5yTTioiGY
         aGvfG2KDOvSJ/+WD70SA95Oxv/nGjE1mhs4uAb7pUFNy+rEPvzkjIU+JbhJ+VqZi7htl
         ULKedrNF7nVwEh5XBusDQpcWpXaCHxavbTbO9WKIyRzV6bCJDogmW+VGwqMJkXzHNPOH
         P402cUgEu5tAmvxnvUXZz6HEkKfhWe1GqWAqc8kIvKVAstWf9gjQtnLEiOfPs0pAzt3U
         xC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454586; x=1783059386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAwcKFKT59MgIybmzJBQCtn8rBNm1HXg0BYQomquJmc=;
        b=PHdBA5RRmjAZHUnNGKQBZkpSgNDXNIzABVaFVyOmUydmae9eCEK0vvDMg0adVze6jb
         dt2VoG/N4GVj/g8ro8z1YSsT+ZlzamtvWvpARUr6ah+eld7pxgjFcB/pCWQM6Kk4xeR8
         yQr8KK9r7yv1gHhlbcxCX4RKQS22ffQ96Y0XSLd4hoAaCFVn2C+EuOA0BfeoAnZZhY01
         ohnXBSLRxh1oFxhTACS8isGD9iqlQfTL9/EGd9VJm8rfzJ70XDecpnWd5vrPEXkWxS+u
         40Zf+X5Sa8YLQAa8TdfSwmHG40APjaXNkh0GZX/GzC73MmdG7CgkaS/XkCo+OJNscf/q
         NDyA==
X-Forwarded-Encrypted: i=1; AHgh+RpXlM1ZHVwY8JeHk8uZDTQhyY4MIx/aPmUqMtO1dOlDBWGUMquFyt9uhKCK3LQoLefqhyGrMS46bDj+Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNRRIAzT7Fd3nwSy7/Znp9YZp177jMrW1aP2madyi+nKiiyzv
	LmbiTBGYHnnRqw0g3Dj3vXL0eUN3BrnW+8iAw0Elw+IfRY3G/QisAVyZ
X-Gm-Gg: AfdE7cm1cMeDwiImEag+WZaY2uJU4ZteuPuGiCuiRrbwCT4OaBrls8dVN5IlzA2oTem
	bxLxoBm9T7OXsT9SKNVLCFUbIjIHar+f2F66B7kflSEojhNDos/vJzcRZSx2yo3NZfPlu0bA3n/
	yZ9USz+cu1Q+dN7yPJVMc/3xR/vtWpR10i9YVGcR3GMCD+niNcrFI3cVV2ETzT6O929ddeVNXIl
	R9HqFqzyiVhdpW9zwOE56kgeASu9q/olnbysbLcOcz0F6BV3IdORH74O1W4FUkn3h7PYvpzoL8V
	IDVZExjQ3Ha2+VgXol95AzAMukY1lYWHk90q+OY2b9C1Fa4DrrjHLDCgBJMhfgrASvW1F/NeiFT
	476w1HVQO0n330+ad0hiSK7r5O0wDxrT2vS1i85yaSaVtlMwgUXI2l5FOF+1yW531gg6JwlIfCv
	k2mWJfBr/1Q3QbRBtqkvMmpYbSIUPktbo4qTroAX+xhkshl1w=
X-Received: by 2002:a17:90b:2703:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-37dfa1a521amr4929176a91.5.1782454585959;
        Thu, 25 Jun 2026 23:16:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:28 +0700
Message-ID: <20260626061329.23264-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs48l32.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..275528aa48f6 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/sound/cs48l32.h>
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -236,15 +237,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2241,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2282,18 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
+		} else {
+			snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
+						      CS48L32_ASP_RATE_MASK, target_asp_rate);
 		}
 	}
 
-- 
2.43.0

