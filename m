Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD75079CD
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454451; cv=none; b=hTqOcATlCRyeaiDSbWkrkD3U+K8JpiF+3e5pw30IiHS+cgOM5cBQP0jyBtFO4t9u19xVYgFVnwsu6mr7EhaRkydpNoqJ2J0sEnkBkbdDWclO2SY0LNZHG6MPyMBLbBfS+QFade0OjR7/T5UaQy0U2QbxOxzIqOumkci4AQPCLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454451; c=relaxed/simple;
	bh=AqSKMzJhrln5rJJaKew1kNIMMHkqQq35uyMPzg1QGgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+Abj0w4a5XO6LuD9oM2YWt5f8L6wLFpZwHEYzuOsy3Pn17vt+Ck8M3Bm/Rbvq+jRuT1jq4KjJC48kmJl8UIEye34unkjPJ6k24LWvI3er+1viJ2AnPFyJjAbdsuICATL5g8tVGBwuA8eCcOoYv5tve8VnnMWBTpaXd6v1a1omc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qt0u2SwK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qt0u2SwK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37df416c44bso341432a91.2
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454450; x=1783059250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7lXoP7p9Ir4aIi8W6zZOzzy0XA5jw3NqQUJ3RaYm84=;
        b=qt0u2SwKJvf5H/VxgTbFddB55DZ+1IcX2V2lWYQjSRIi7wlYpbcR3krDxnMBk+3uaf
         rRfitPGo7RhNyM2bFc56QL0EVDs74y4Fwc/1khy043QVgTlIrzpV7OCgOWoFCSBzGUud
         aV1AaH2vGWGXGWQu69J5OueS6IG2Y6+RCQ3tCC1KQgoORilcNXk/+L4s6J3aL7PVzuFp
         4EknR9EpCdBMzjVjYfVMtztVpDFkOkPD3/cdWF/1COYaGhA2r0DqlNO+KNDj7yX1QVVB
         IdYpSSHL5hE5vb0BVgW1lWFIpHXPQuoM6UV+j2BQl+Bo4M1M5TksnuIpfTjJhpDBJlF3
         qhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454450; x=1783059250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7lXoP7p9Ir4aIi8W6zZOzzy0XA5jw3NqQUJ3RaYm84=;
        b=UT70WpbbrjF9NpaJAsCN+9RDOX48yCO94RoZ/ckXaf3Yl9miVyhjYUi0RsvAuppHun
         o/6DYVM2OVgqkSkywqpZPTMA9dkuivGSvcL1nxqYYrPQAukGNNN02Llh6bHeGmgDHmt5
         asT8lm5vQoaZR+SYa3phLqrnp2W12u8S15zvH+zvyZjFQYr8CRdQsKKFzVi74Dm+9ER7
         bNFsFwcrBfnAgbf6lWyFPrA0OIUIUpx5MMl9dVNgVh4bQgjt9A3utrgGyE9JmOw0xzwi
         bnxzRceFSuNbbgOyJ91de6MXiiaw+M9PC1Esm5qSCQBfQpOsy5f5+Y3wUWMFB/3Tw+e8
         D3Iw==
X-Forwarded-Encrypted: i=1; AHgh+RpDt1G6cIcm6ZsML9CNc+QFnby1kNwGzHaXxzAn1zAJspiMlB5oGA61jjqKF1kFgLfBaebQy3M+xo/Y5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMpZMpfjscoUFuQZS84xVf14OTa5HkhGqDaTxoXMHd0SOfuHaG
	ILFhOXRtaQb7Aq8Er217fhUmiePdivIL1Wf9keDRjT14fTxv3ikfBU2r
X-Gm-Gg: AfdE7cmu6BE2HEzMA5TLxVnEHQBpvHMv65zD686MqnYFvbUuVChL8mxD1DtHZY8jHvx
	so+YXeFXC3wTY3uU44vamGFlsEUJ7Y8daH7m3w9MwG0cbEC5Iej2PF9cexGUMe5KwgszBlRZysw
	H1gBB6HyOW1qUwPlSlyrghhe/pNMnpeT5T0EBOZyGF9W39jDsP40sI5x8OJvATVmVmtQE/sTUhm
	66INaw87nfRU14e8psFvTeHLeVR++ukxiEgk4zTi2222OvkHU9DBUpLSMu4UlfQqJ+Mkg6rHgyB
	T8WWoMVEC/dWDoihg9G02SpiLk4Vj3SJYEhEqJWpOk431njhlORWNjSPRsUfchqJaVUEJQCkYVz
	w1eU+cUVtdPUsaLOhESLn1ZgMIV+lWj6+Zs5TaF4gLFBNkx2u3lR2c6Cw1uihFpCowxuJBS+7OR
	ag3wIcjXxAGRYFJu1f/42JYtPvvbCp1H+J4z8rVMFhHHoT21M=
X-Received: by 2002:a17:90b:2789:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-37df9e976b2mr5533977a91.0.1782454449972;
        Thu, 25 Jun 2026 23:14:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:09 -0700 (PDT)
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
Subject: [PATCH 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:09 +0700
Message-ID: <20260626061329.23264-5-phucduc.bui@gmail.com>
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
 sound/soc/codecs/arizona.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..4411165c3734 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -1158,17 +1159,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	if (!priv->dvfs_cached && !priv->dvfs_reqs) {
 		ret = arizona_dvfs_enable(component);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	priv->dvfs_reqs |= flags;
-err:
-	mutex_unlock(&priv->dvfs_lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_up);
@@ -1179,7 +1179,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1187,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1198,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1221,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1655,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
 		{ 0x80, 0x0 },
 	};
 
-	mutex_lock(&arizona->dac_comp_lock);
-
-	dac_comp[1].def = arizona->dac_comp_coeff;
-	if (rate >= 176400)
-		dac_comp[2].def = arizona->dac_comp_enabled;
-
-	mutex_unlock(&arizona->dac_comp_lock);
+	scoped_guard(mutex, &arizona->dac_comp_lock) {
+		dac_comp[1].def = arizona->dac_comp_coeff;
+		if (rate >= 176400)
+			dac_comp[2].def = arizona->dac_comp_enabled;
+	}
 
 	regmap_multi_reg_write(arizona->regmap,
 			       dac_comp,
-- 
2.43.0

