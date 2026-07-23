Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB2F3A5452
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782637; cv=none; b=vAgMuvZjpWg4bKrVLGZbZXYdcgdQh1nDwuyEHNGsB7ezIFvWSEk9xvbypVIj3+SX5nGASiLDEau0AzyNEzwoQnhHS/2b3pIRlgmNo7ebY/xDbUsX+2NDMT0q49DnRVzlaawcP5WF8+wd2Xtp5lgOpsmXyuV4w/al3xAGzQuBnb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782637; c=relaxed/simple;
	bh=chor1/9GogowF9EJgZy2hFJZE1uubwSj8Yvkq6IYPwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kd9wKvP2m6eXbuO9XxrYtzxLqYRojoSOtNoAtQ+6Q1HpBWL28GgJlatQgQLePlrryG9XlXDd7HS2pAfFXS4XerfrdfFOptl3gOPcEw/kZnxSbgIZqShmwydLKCbOfh+2nEN9vMRL7BbUwuz03Kw7YjaU3pu99ZyP0j1DJXY0ync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIsyuLNs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIsyuLNs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so2513425ad.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782619; x=1785387419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lljKBSDJsjI6QypuaswVsYuIZiZ2Rt7j69Hl6k2jRSY=;
        b=pIsyuLNsvCOTet65M3VZbgTmVXubR7rtEyYeCqLamTNOLL3/tyJvlD/NpBHco3OysJ
         5R1gEeMdnHLcsdMxB1ETkKQ7VfXHo7m/xSiHoR2Ke+wT7VO0LCgsbySEJyaf+2AVIN9H
         Uj45sJhHnMEEC0uzBl5ejpLK7IMRO2Smd4//sb3tlp0+CMHCDjJnKOZ61CTRwK+2izGn
         hZhQBJoT3qi4A02OsYDUDioxkIUUatpRSUa4+Ig0TVkZjdHLhxWkSLBMBRkdouy8n0/t
         VB57hU5YWpUWGRFQCjbmyL6hRQWsp+NcnM/fKiWBAMzZrpCbm70gJVOFEaTORzuLefsj
         1pRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782619; x=1785387419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lljKBSDJsjI6QypuaswVsYuIZiZ2Rt7j69Hl6k2jRSY=;
        b=joXp13oS0m4PN3FLeZsIpHoVP2sOmNMKbSOn5Wp3RbplxST2QYytZ9SCn8H9bgpyPK
         1SXFnT9iv6szk4PKLCG8qgEfC7KfGmKnX2zwy6PhEhqEwm18AZfQXWXxBEjvBp/Rn/Jh
         FZN45BKuf9mqCcs6X5bhHdP2BoR9CXaBPrq+WMlRDMTckQ+HpQIUD1HMtSkYpYWc5SiD
         K6lDI8LiYqe1ZbLyCih30bKDnragJH35L/G1VyzW1euYlONBgC5hBY4D6DxjhguPnXyF
         SMpzCICwjXO2QFQMRfqPyGViRtd+dx45R4p7uk/eRLqJ6kxwZT1u2qRDvRRCqcmPse0k
         OZpw==
X-Forwarded-Encrypted: i=1; AHgh+RrNwFZFoTj7dsOaDy8asDhZ7AeHmX1VjMSslvPzmhvc00tRnPmdjo2Z4jKbjAJKfRh8ySXin0//6X5Yew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ4IRwa8IsULlwagAdvImMj3AEQxS7l4u2kxahANWNGQ1UFOEZ
	KLN/bpAhoY9TknNrl8FLow4MSFxoRwkGMLdpCMhvHfgM42qIX0oBei6d
X-Gm-Gg: AR+sD12/XJQC8uH8FebApphQWlpvYZ3yy80t16uJza5vJeqFYqaR5jPrms5ey8PF2eN
	fXC9QMlWWpdIgcnjwJiAvOt6oFx+h6Jkvn8mQM2IAXSSfSQFabUY9kOEuSEzZ7oSllpMJ2uulDa
	D04BDomt57qptXl2mfk7tAoWtfRkNsNCbgvr7M60TEgGeAG1QBB9tDRFM4N6+7jwD8MVcbBLH6D
	TOrPdCB8sXnXFxpmjI6GbVeEA1x2jmqEqm30LAE2N0abMy1NOiZqXYduVPHNi1xwMF7IQlfxO6o
	unYGzsRIMry/P9B79VFD7qaW/E4juBkTDfwWu6KUYSu2fagqE1clCcN1RXolr1whxeC72oqOl2A
	LIswiLPaTyTXpHtO4gL2b1lSdp5PU5EhUtW+aauqei/SYuA0j4DQwscd+ffPmMYZKfpyKPTqwZl
	fzIJ5FD0+snumAcwZsO6lk5zq92Z/WnCrEYp10
X-Received: by 2002:a17:902:d50b:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2cfa6b7e369mr21677055ad.17.1784782619301;
        Wed, 22 Jul 2026 21:56:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:59 -0700 (PDT)
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
Subject: [PATCH 26/26] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:27 +0700
Message-ID: <20260723045327.28260-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wsa883x.c | 11 +++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 24a5904d8e6c..442cf9f3eaac 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/hwmon.h>
@@ -1237,9 +1238,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1290,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 567861dd42ad..a367c94bfb4d 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0

