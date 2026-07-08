Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61144D021
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520409; cv=none; b=d2RyysIi3wmf7YoM5TFzbxJhorh3QzWGfSEkRhB+VqzNy8H0db8A4QpF7gO5mNpZhDvO3M3i2I+CqM4GVG39eYhMM/rNH5sm3dDVTxS214dRIuCx34fGnsx9oqewo/grWhMOLttFUb/QcR/ShXKsxIt8vYJeWwch9qDr+EUS98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520409; c=relaxed/simple;
	bh=+nT6I4Pca0g3yL9/0MMMJ9eU5lzYcdje8+rHxYbR5Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8eCTsDGgx4k5OxyiRC1lt/prZKUe28HZYNCb1PatR1eE1jnWVlkehshAn9w+jVoR+2rJI/3Cgp6vCwNM76/67gMD8UQGWZI0jsU6jhiIp+9q5252vZ7Xi5SLK/bPS+g3z0vx2h+XuLFHPVMo+7wrZOEZ66VczHYUWK91SUWMzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dh2SXtFf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dh2SXtFf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ca70925c25so10397225ad.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520408; x=1784125208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=Dh2SXtFfTzz/wBOBCb1kES4k8pWeeScR3nlVFi9pqJ4rp2Dycnnr+YgcklzW/qjI3U
         NZ91ELzl6XDDhV/8y2yj6Q6VkVeLe0X3Lt+rKLlH0lmv3nbZ9jED4euIGdRrPtUc/oQ9
         L9d+HOXV+n2tzSXeDUQ2UqSOBhpzpLfqS1Nm4XHk3pO1MP6mx36NgMWn4ssmKwmCNeoy
         SJ2Z6UI0/wNEURrhtF7wSyh3d+QS1+RuLcLohADskcr2bUcFEEfmuYwNQFtBsfFPkfee
         rmBBl92sFLfZJArj2ZG7ySVZVU4+q8p8sXc2k+YzRP8PsL2CmV2IrnKUVAD5vrk5im0e
         7WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520408; x=1784125208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=EHvwYpzr6A3szyccLzUKYoogpxYVyDKCysDNW+RkZu9zOzX5pqowkqxWIXFF3L+MlU
         rQM62BD9twGyWyghFGRD6+uZY9QIE8FVOFubRhtoNmGXy384oQjx+phPwFBoDRJivcyW
         Byd4MTg1IfaFsuSchuesk+hvhzV0HefwddxT2fxA0zB42smfa/yaRlamSvVruyxve/K2
         jF9EOPIeVX4fjb5oj1fBwupg/ofpEdmj2z0cFvmg7Zw7qn8DgLUCJRwz0vuylBidBTgW
         fN3hKTas8zZcQbu35tJhC45OoD1tZJ2W+ljEiierAMPk6gHGIL1Nie7SFs/vlGpXuqpP
         fnjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpf+Y9Rq7GYOWXesIJQoGrMYqbSTimPnQlw3lLdVTrfXrMYsOY41EFxoizAbiUU1sGbv4Tz7Z6IarlkHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzy0C7zgj/HwDrGowLEMP1tzcql/uHHcisBSYjOjDdOMYTNW9
	9UQa46TkYJT688yw918rzkyegFaRPahDjebvHzje4I71jVNvJvJYh9VQ
X-Gm-Gg: AfdE7ckIpQCFnPj36eS/U8H2vxO8daZpGIF/HimHNF0aFo3aur7gxW1Nd+kHk/Bl2PN
	HN2dGnF2elF4XEezAt+0XpdswHF1b0nr4ripn6rbBvvzZ/SwK9yg6RulYBbLR4kJUCK6WHOFdMU
	JmRblV7NKws2vcPxR+q8MzzuFV3Auzej2juryTOM0nSZ49xmQfw228Gax2SwZg+Lhnr86h7GjYb
	j9Mr8y7sbXQNismyG3BOXBbX+hfb3basblg4SzkzO/9jirxFIGumyN2gWYypW+qbSOqGn27ProL
	DbyFhkVlCc3AMD/byLTSMf/NRMFmoSV3ZPSrCNnngBaNAKdYXt6hOWpeQIQHkYzVXZY9b59NCqY
	y5yCQCkYo+iA0OCPvM4kTr5nznPbYp8e3tartKv53equBNDzRpB6ZqDMYsRh05GaDPjgfm3LTSs
	O5djZFdwSblhpE/n66GrgOYi+ceGpjW6bpT/GNzZFTk2KCXUgXK/HZ9ShtUA==
X-Received: by 2002:a17:902:ce82:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2ccea3a28e7mr30636245ad.43.1783520408022;
        Wed, 08 Jul 2026 07:20:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:15 +0700
Message-ID: <20260708141734.578926-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/hdmi-codec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..bc2c22436ba6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/core.h>
@@ -452,31 +453,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +484,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +501,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0

