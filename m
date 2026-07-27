Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598893F44CE
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145447; cv=none; b=raTSaVNC1k1coTzYZ8rXMLLOx7A14s3r11ZLg46D3wEYp8yHqnLNTx2POsV32cy0M1xp8plRCgJ248W6nih0djMNqP0wna9AKNK9KrC/8eZ8zDey1iGv1RWrQBPfeZd1vI1cshTyCo4cINI++ptcdebYiPbvhCzYyO9nK2qZScM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145447; c=relaxed/simple;
	bh=qfYAbMupB0dauUp98L0JPr8A4YLqYtXX8lr09zfUid4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyKYlQuaxHBFGx3C5R6bybFD4otaK3LTC9d73WCo/BEYRRppfJcLnslm6cUuVyfo1p9edBm+wgL4aB5OPYBUYqeIs71LZQhd6TOLS553s8xYG01S5My4HtqXs2QLb+gyNU9zzZ0tC5LgbCEYeBTbWPmBWXPxKw1jyH/o6O5sFa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llinjbYk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llinjbYk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8486672f03cso2384502b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145446; x=1785750246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOLFIqbE35iIA1xT77FTcDNQ9ZNie7IeZCAAkiIj56o=;
        b=llinjbYkthhZKpM0UR8viWwJ7z7CAz42wSoCVqbrdDNET3ZGUtxx1xF8ZHLyyNkCwl
         f6dDw9RxqiIc3MZOw1GfsL6Ruc3M+eUo30Xo0uM0BdbUyXo6hYy0QuXFx0etgjL52Vgn
         QevaLGFUw6XwnD12/AMgpJ16fhl9Qal2ZW+d+met3vBCNImD/IDZZonXqKRaAAannzSV
         zMPrkukatvuCMyoCWsenMSArPCfL+vR7wWAu4c1sHLKTYuObkcUjJaCmEmpq4rS8Qd5o
         Wna0sox+sqUYuZzqnsapgM0/fdExpf/RoJ1aFvX6kx6cAzubLcoGU0xHEVtwTjAyrYnj
         mM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145446; x=1785750246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lOLFIqbE35iIA1xT77FTcDNQ9ZNie7IeZCAAkiIj56o=;
        b=dgC5Rzs3RsFIrR9ZsmGPXw/1yAPYriJ8QrXU4jToTt8Q/b7lWxNUPmvstKEW8Vj/g0
         1ma8j15a7RjWxyPzxXApOTNlqo4fCTSfLsxmK6++zEe60ZUPqwzab0hry1x09pK6qc2k
         uuE3ZDorDpTE286CqjhT42YGh78IfNSWVKX2UVGpFBn1/nYRhLyvo9Qe9X86B5vWmE1a
         JSQBguE/AJOLA/OBEmSVoREndR/I9nWM6/erXzI4mAhg2tlL0JfiRe63aYif0wxBV/jn
         oAaw8IqTtE/u3kKdeyjw/BHFiw9+TgSTyhW49/laGdlXbLRhHhwPMKKr9bw6582NAGDM
         GnCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrO6uFUQ3HBW12IjPea1ObHiz9ATHQ8Kae8QB20ADO85X7CyocYuHNQadf6TBZklWurtuB6sA2zjQPX+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR7wP0DMJkjxdZoxp6mnXHl1nhAmVvdQyAvrUQG/Usy/0Fdz8K
	J4tO8BSXNP+P1JavT/Clui8rNnh/Kavwx1zHzLBuu3rpizSz+AlMARx+
X-Gm-Gg: AR+sD11D9hKWLKTvy7u3bFGQ4ST1UDlRwAlmALNgSEVYcdzIbFOXEc/9s0m+JiNvki5
	BBlUrPaFwEoSp3+FGnTpYVdlIHS/CmtReYeLypfL/JJ/afKw80qwbBWfbecnWQ48OdRPdQedqn6
	GKgOd7fm2docydJ6AZKlYGXZo3xKU62l8y4wnywdbj+R/L+XVy0cUeA9KYn5j/TaCWDP2DQ+FX3
	fStOT+OBQuBlG1jDchnBr0GyjODjSAIoE0yyOB2bwqJEgbiVA2LP5H5v9v3QtUvqW8wXr14ZNtH
	72ujoHYP+63oBERP6hariv3u300e034kFORIGeKdUX5GZ/SgZEmN4JP9dkO7LGVqrg0EzjS/ftT
	WDVbYo43B5073+CFDQR1e9Ydkm1RuZeW/09wcjj8ur8fqXh5148+vMiv137JLchXPz1Lr21gg96
	V7l4AIARtOhPLw8int6J03dGZ6p/96AHVJV2EvA5zr+ZCgGUwKwVPZo1LxET8to7b9CXBtySvFu
	BbWdI/PeVKeIXqEETY0cg==
X-Received: by 2002:a05:6a00:aa0b:b0:848:2f7a:2e54 with SMTP id d2e1a72fcca58-84e595a0cfcmr5953512b3a.67.1785145445540;
        Mon, 27 Jul 2026 02:44:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 15/26] ASoC: codecs: wcd939x: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:35 +0700
Message-ID: <20260727094046.23001-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd939x.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 010d12466722..26fe0b6313cd 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1923,7 +1924,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1941,7 +1941,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1957,15 +1957,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = req_vout_ctl;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return req_vout_ctl;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
 		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
@@ -1990,9 +1986,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		usleep_range(2000, 2100);
 	}
 
-exit:
-	mutex_unlock(&wcd939x->micb_lock);
-	return ret;
+	return 0;
 }
 
 static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

