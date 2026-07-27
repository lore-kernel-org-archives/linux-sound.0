Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0463F44C8
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145511; cv=none; b=XrjZ2jDU6lY86nIe3nvFGSVAud5uHT136wNi1J+2tLOtiRFq7R/RY9FtuJbwwXNlj8MjY0YHuWZMxaueJhfjEiV6C2yZ275wCl/U+7XVE0kRuU1pjQVOqaGbYzOHDM78yspctSMB1hwglgTa9epA1jCZg8PE3/SvzsX4Yg0IDJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145511; c=relaxed/simple;
	bh=Drn8APp5Uw6rYTgsK/ubGCbMdZovD7uDbrhOiuvrAPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRz5Byu7GGN/AB8mY5KjAWSMbN67PEPmg2QYKi4BLWVtqbT2q7cRdiUAtoAGM42tPziToK/h4D1jNSGU1ym9DfCPDBL7ar8oLw5IMP6KApKedJHa3yc3ofbIabz4KoKKkv15LNAsyHNLup0deDdPieTYYb48e0dOMy+Fa6n+20A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcVEGCUx; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcVEGCUx"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so1662572a12.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145508; x=1785750308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OeWw6h5jytB2MGM9QIlVlvrzPpa8kERJj1qhZ9lmXsU=;
        b=hcVEGCUxQwI28nbi1G3ouB3HtPI8NEacC4Tv3743+bfNFtQK8VL2+fnak6bMH3mE/N
         solnYVPVvZWhc/bwUgEqJGrZqsrNpxElih/+JImvVvjHYfu4C3Hbc2sPoh4kHEb60MOZ
         mtImNql9U/SExkYWtijAamd+R0qixAubfCJyOJmY876tzf2Tmw030EgtK85stWQ1Asqg
         QPC8yrG0LY4ZiA+XnOcVz1zb8+0MTTrOG6F1g0dtKjwZbU9hQmHhYgQcIAZegnD/eNtl
         3thoGQmS0qnuyh1cTXxQmi1WAP4qjzddkhgKQlfykKfip2zs7UvY0TmCbqSUxKhij4Np
         +YLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145508; x=1785750308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OeWw6h5jytB2MGM9QIlVlvrzPpa8kERJj1qhZ9lmXsU=;
        b=jJFQOYPVkHJnwO0dlcXbEHTlJZOuuINxUBTBHDh7szalBb0kIV2dM5Zg+sHUMnWi/7
         tumSmrIK9VyCvu4AtqAbz1jakWrS/e5Qh9NXC8subVBBFXr0qM1z3mPNkc8co1U8ZpY1
         MjN6iIWcP8Aj7NlazhlR2ZCwYBKRQBQnfyNfNkR4NwlNry+SSzK2qxHADa3Z3Is4mD5h
         hI0wG0yh35W2Nj0nFvor0TcBCISN26mLVsSziskIKrQQ2dCIN41x+Ji7JJ5MyiaYrxPA
         IrvgS6Zp5iEgEvr1a5OT7nJ1sXCb6x1wuxDFxjiCc7nkBxhOvD3AFLeDqlYUNgVLkRu+
         DwTA==
X-Forwarded-Encrypted: i=1; AHgh+RpAplozQHNMTSinWYOarl6t6A21bQy0LzuJNoN4tHWB6ui+GN97MfzHrWmCe6mFbwcHzJySnIKtzul05w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXH5mfhalT2NUxN+aDyZIGOgy423W8jtx+/UzxrfEYb3xXb2R
	vJPZTmjlcVSjDiyfVT3LxTAygO7gZO0PQ43UnqcVqXea2fe5aAWF3bTY
X-Gm-Gg: AR+sD12pPZl41HwzeCpoNYU5n7d2sPhgW48MSbE8LAqdkCUCKgU86XRwNARcce6b/x9
	7zFNp1xJ4kAjMWkFb3K2soKaD1KqeedbgH6rSfU6LObu2iTsVZ5pmH7uhdATY5edEsgoklAM3MG
	1YSL7aO9XR1MyyB0uTR/v8SdH9hm7b7xA0XciJYhKqlU1bhM/n4Xk1zoewO80V6rGzHq8SbamfL
	PbpivUrBNCWXyAWSbi1a+qNghpVE88OkAZEDSrzL342b6Bve5l80Ezks1PDoANwX2LQjLQesqVy
	3GJ296maWodcGzwrEBgGVsdZDoB9Mtk3ZKniYWxYMRDmniUiG9Riv4ssu12qv/DjuWbKMhw4QJv
	yE28HlkUpsph4l17PvDvwPd0p1LYom6YScxuTmXQhrZDpHCTK3FhQYKLn1xlehPQrdZFit+9fH1
	spfl0RQlz7YR7mRsflEp+4/Ab+aX1r6wYZgLX0xgy73ynREfCPp72ZNLZ0BGq6XEWsosvhWnqZ7
	a+oexEyCjFUzHi41iLG5A==
X-Received: by 2002:a05:6a21:b89:b0:3c3:6544:6083 with SMTP id adf61e73a8af0-3c67d55e260mr7269403637.0.1785145508419;
        Mon, 27 Jul 2026 02:45:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:45:08 -0700 (PDT)
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
Subject: [PATCH v2 24/26] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:44 +0700
Message-ID: <20260727094046.23001-25-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm9712.c | 5 ++---
 sound/soc/codecs/wm9713.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..3105b2e0556f 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -6,6 +6,7 @@
  * Author: Liam Girdwood <lrg@slimlogic.co.uk>
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mfd/wm97xx.h>
@@ -229,7 +230,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +252,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..3ba7ca3c1770 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -11,6 +11,7 @@
  *   o Support for DAPM
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mfd/wm97xx.h>
@@ -238,7 +239,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +261,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0

