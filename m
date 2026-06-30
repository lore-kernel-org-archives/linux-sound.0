Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05662326928
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801389; cv=none; b=qQmXkaQ/ocAYCA8zHB+qJco/qZ0Phc50gJXaCtRPzviOTlfw2RZa7DDn5PjJebd1rqpVBvyh3r3iZa6zeS8ca1MYyCjeKbdDMV+x7nW+8pUyOkVw6RU8WNJ35mDKvEEX50GyN3/3kJB2ONrCi0QWmW3QEw2ZvObYTc98CJYxs04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801389; c=relaxed/simple;
	bh=+nT6I4Pca0g3yL9/0MMMJ9eU5lzYcdje8+rHxYbR5Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adHwINHCEGfI2gOTNJQZMxJDE82i6l9Cdb2kFXASAl0pYU9giVv+Yh3SVXZJdVx9bWGOPnkTfpCAcIaQ6H0jC7GXXNBNwKWP1lbAopS8OAzVkEbtaJnqF+A0zMSOUL2SSNG0uImKP4gP9iQItuOYGrfoYnHIb/FCTTqEALVQIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5mGfMgn; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5mGfMgn"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8478a25f268so1050589b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801387; x=1783406187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=P5mGfMgnYwYeSc3VEEWtIjtm29Zz/4VHRHeQJNDbW1Tbnzk0Jhi6QT4LgJJMngXM73
         levt4j+s2TYA/fxjKkZ0IFZexKccO7ZDh1Wty6VaTEXook9iLnOx9DmTbGUKbd1QtzWr
         VNQb6aq9reelOkXVna06oKTUcLfLAPcO1kruwFkpp4cfmy9oSu5lfGQ90gZaGNmE6CRP
         2+pA2V5h/EcplylHqhT/HgZXimwWxBDq/zefszG8yq/uDfF/34qTH6iNOelXuN7W7PAU
         Fy45EhtsTJYLPakwpCQws1xMQLa9JPrsMzXaoQk6mw1QDWb+Jw8AxWnfRoD2btNaCzIr
         u9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801387; x=1783406187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=fsgpev5lMRVUmhkebyZYV1PC1dwv6DoeD9VoY8/v4ReADegnbQwKCSDysNYmcAVC4m
         SpPvc/Ld/ZqDEYAN868hihZDCrNuiH4JZzSQ3ka6h3rdc6Qva6wxIs141z4zfI7e8lrX
         IZX8+/Jm8BLUeWo3BdDgidvFrtsdRm2urys3xs0HuKz+WqFAO4shvEuNrsIMlbVQimaq
         gTPlics7e8d0heyUUUlB93/9mZ5+vHa0Bt+zIsr4H1iRhQSxZ0CWC7LDNdZQ5GkcuOpi
         8TnHCU/waT4dozhUfqiJgBBZw0yCZYHLUI5u0RWXPmNANwPlwVLExVpCdhxSY/6iA6UU
         askA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+XzQHxRDsDB2eAGlybMq7QF+Nk1cil/BOG+bxdPm3lOiNEY+xOxjlvJO4ROvPKtj8iuFaE7hXBVNtZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0ukwCUVl8i51zJ1Q60X7j1aUwIcIL5XCen3A/+VclUNm5479
	O2aVlsk7GkT50d0ub0fgA0qkuqD8qPLuAWLZ7rY+65xng8G1SDZvSpE4
X-Gm-Gg: AfdE7cmud+d2tqydto1mqwvUUzw0tESkeFRpQTd53S6CrwnRNxrORPgtrox9SoymLVI
	Fx0pCoJ0afyexYZYkl8nzqqfldy3F3p4MVSbJmA5V34D1fvhgXEsnpFlviDJZrJjrHszD8wZzPH
	QmWIeEALWtNYxPrcMZYKVNi0ufgAbX7Q3tJvOfw5eBdmizglVGc6bthaDSbUaTHy95b48dkycO6
	KdIXBx5EIG97gbcoxnn00x5RG+aPwmistRUZCum+OmZaD+ZiXKI5GHVK1RAz8kZVtRZf4ZbYb55
	005VT3Di3qh3ELjSPrB1ED1j8kiaZutpEjjLXJ+P7VdesRaEXq0s4znYWnMq9h26qpy+GLnStk+
	KhWhJIsaWyiS0Oi9xht6Vq1d2J5PFVEvTK3Azj23djkxqEsjVtIkykMyN/zMIQxoVtN7Zog8nEI
	Q0iMc8NeiSbv9fSRprY12OWTE4xJepkc26R4Dl+5tPG78IH+0=
X-Received: by 2002:a05:6a00:995:b0:846:169c:d815 with SMTP id d2e1a72fcca58-8479f2d139dmr2002482b3a.60.1782801387427;
        Mon, 29 Jun 2026 23:36:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:27 -0700 (PDT)
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
Subject: [PATCH 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:30 +0700
Message-ID: <20260630063449.503996-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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

