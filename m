Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101D37F001
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782459; cv=none; b=PuIlKDPQK6JE98eEo2vq+n66S1APSIeD8m7W/AIieRI15KEJ2HysLiS3kS14fcScRcr9wyzMtXYKPPG+HKizEkMZ7TzNmbIpmk3JTCzRsDMPUScf3RWCZtkbfbvn+y7F26epHBjkF/qS0QeddvJOKiXThujlgSpxZI+90iGmK5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782459; c=relaxed/simple;
	bh=zFW9Mx0ZXn7hF454QrxJfQtGJ47S/hYdOGWLyBiXIRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouB10q7LwW1DjdgfWqnHA9HqfNTSnPix7AVcl618sWukHyKpkewx3hyuOn4sXfXnJjsNrHKiRykDCrunlH9oK9AkJVxO6Fsu7FRMdEacy7WE9Ii8hv2W+mp0QaKuGAyhRP+qh3h+WVusd5f7UW8CVuqMi4672XGJryGptr3wsb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPt8o4oq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPt8o4oq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cad8076b01so3352735ad.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782449; x=1785387249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sk8Pesmwy74AH7VxeJg8H8U9dR5/4hjKm/qPKsN7J90=;
        b=QPt8o4oqzuuKSoa5efoF5HOod045RJLqfKL8Tb3FPQl8W32S6xes/jwnAP1waARGxd
         5oXYXOLzia4POVtfUOPy1rhRArgp32Ke+tL+05Ux23O36f75z9RaZM9CtPtNZQZKRY+m
         krdT7BFtE8SgEztcU6PYAyQcCIChv91fjpRil0FBGOT//HjXlFhwZQeJnf6+MujvZgd8
         5VkJgRAUoy918scmJi4vl1wRCFw05/cZL/DbROHW+Hi+PYlr2BIkkn9wHzZ8/CoDcX5p
         pCJuBM3/5nBb4GRhgfj1Zx7/PobqN7xEd283BjE8O9imwTerbF78/ru+yghkjJUMehbC
         TplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782449; x=1785387249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sk8Pesmwy74AH7VxeJg8H8U9dR5/4hjKm/qPKsN7J90=;
        b=NblWEEZpf5Mu69vbeyN8dNsoJ+PWz8dxl8roc7vnqzWHBvaXY+2sMVMZUQFCKTHeYs
         IbEttbrwzcip8jiyMxXCamGP27u+35Etg/7HJFMhaTup/ZtAejTMEmAeubI63gtNcKF3
         elJmqU5OHGM+p19OJcjUTwM5/BnkMUkscfbjqg8PkTrnmsfLJHP4yQ2p3Nf1Zaebe4/P
         u6VPXN6nYUZhSQwJXyCqqp8W8MCaxyvrd4/rqo0Ihu7Ih8J/IBNOqpHLBUaBronqXOQU
         Jk9JhpClrleBmUKrpy6vO38edBNt8jDUNAr3+x2rd0njvuMX0abPVI+7Sp1gORW6Lsb+
         RNFg==
X-Forwarded-Encrypted: i=1; AHgh+RrE6DUU4wvDtPNe8HeAwlGOU7morhv0MdRLlSDhweOKEOt88eaQY6W8iXdTeH3zRlNeiBqgOMQ2A6HV6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZzWwh9sCOrOqlvqySt1PzP9UioJffsfrg+PP0ca1T53JnC6q
	29x654buPpeDQ7Xpu9znvdWYrbFnkASWwuq8nQDR0TlCn1IbPiIV+OsZ
X-Gm-Gg: AR+sD13Dr1p9tr30YHsoCBr+p8rwc0j0mh9aTvZppZKGQrjx0x/LvD6gUHJHq2OE/yd
	nlNzFrL7X1hInBQIdDwM+IxjvauDeySKsDBy/Qbr456WORxBbapiEc/daBhDv2pklr6//6uanVK
	HquVokoH0nCROdOmk/Yl4BsLXQ7bDrg/MMZKV3hZbL2e/EgPFLp4jWh05TGCwAxtuLobE6BffSS
	muVTstcLX5r2GFUiRuIQ3C9xV+h/KKZ5B/NxBzKPi4uhCVNl+bskV7jwW2Es1i66ALKVAbnx8IQ
	Ux3zGOmn/jJ2wfMwSL42HTCISjWWe/R3iACv25MLweBcPWKTGe5qq74ODvxSuU7WC99klgJ4MKx
	WljrXPFlK3Sc1q1A4x2gnABDuPNIDTOc7nNNE/lOKOXzCAHdESNBogULjEvZDJRhIong4KYI9wk
	ogI32+WKu0cZfHXHQIBdJ/bFL3L9UE17wRnNH8
X-Received: by 2002:a17:902:fd8d:b0:2c9:97a7:3289 with SMTP id d9443c01a7336-2cfa752eae6mr19408995ad.43.1784782448675;
        Wed, 22 Jul 2026 21:54:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:08 -0700 (PDT)
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
Subject: [PATCH 03/26] ASoC: codecs: sta32x: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:04 +0700
Message-ID: <20260723045327.28260-4-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sta32x.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 652c6e3a9e63..d6de739212f9 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -269,9 +270,9 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta32x->coeff_lock);
+	guard(mutex)(&sta32x->coeff_lock);
 
 	/* preserve reserved bits in STA32X_CFUD */
 	regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
@@ -283,24 +284,20 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	regmap_write(sta32x->regmap, STA32X_CFUD, cfud);
 
 	regmap_write(sta32x->regmap, STA32X_CFADDR2, index);
-	if (numcoef == 1) {
+	if (numcoef == 1)
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x04);
-	} else if (numcoef == 5) {
+	else if (numcoef == 5)
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	else
+		return -EINVAL;
+
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta32x->regmap, STA32X_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta32x->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta32x_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0

