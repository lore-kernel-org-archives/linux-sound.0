Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4A8340A46
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467586; cv=none; b=k5O+XcZOvbNccUTWFuQLalK3o/KH6/k95i3xt/hDuz/P5U9E488K2szaN8E0VQgtQZLc14syAaZR+9EGuAaZEJFn9pkSJi+Gz0D/2ztMURgCKW7age7GNmGARSjFRKq5/tkSBf7Fww3bF1x9D3WSUAxasmrPmW26uizzgdmGZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467586; c=relaxed/simple;
	bh=PXhmUCCYjJMaODYQGzGhwVsJ5oviMRkUF+OhLfYe4jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3IY/5RUrS4BBC2IkfIL13X4ZsNJhrldAGFkGjL/qrcmer4dE/ODIR6C3gD8NU/PiPeoATpp/hMn+uTP1XXuBqBkbdeYFUt9KfD9KqQQfE5FCL8H8sjRiy5G9+OyUWrnvOGRv7ymxB3Pg9cLF3Xeu5+4+d9Hs2QUpi9TFDDELTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqfX8AST; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqfX8AST"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d049069377so81095ad.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467584; x=1786072384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuKoDTJV7/eo9mQkxdlTMYT+n6rjtan9u9S68v0m15Q=;
        b=AqfX8ASTZ4sU819EeRYjeFjwbARzRcVTYvBx0QSVNu4l8OzPhtbejzLw+m9c2LVgRP
         0NvJi4YPDKJRte4iictJYEhShGzdtgRpqA4OHsdRyju7PD2ZtA7GEb0tzC7biyKSnpFc
         5+TcG1boBsf7wi9vviMvIHQsrvOlGpUzBgJ5knFPvDjSPBKsu/AYYxC2mkeCecHA9fep
         J3iKONrVGnfPjWNYKH8ZIw21nvKWJvTuNIEWHd6yeKGhpJLNr156feysczncnMfW8y99
         ay45vV1T0QjLhos/F+MekpH9xZzH21vn9thZRT+2p2PVeoww7F/ev9epADqw+tVm842h
         ltiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467584; x=1786072384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tuKoDTJV7/eo9mQkxdlTMYT+n6rjtan9u9S68v0m15Q=;
        b=IVKA9d83QuzqRwUUDWITdI1IquC06BRYZcBy6nPTIfmvC9ikgIboQivUM2167fgCwf
         Sj/Ggrrf65fzj+L2HGXKQlycUtINA5lSgYYhTvBqGloILRKiF3fqalxbtbX1dLoUbYTJ
         WgvA8D3kyGH04VIEaE01Ricbk/+/r2AQdxdR/5IjeF4PDNLLfynknEnJFV+i5Isi7+QB
         Q91H03qAHMsS8SQFXvaQxG0I6DTwJUWHWBAVjUzY6UOmiCgMl0EYe50ga4+B2aeYt6AY
         n5tdtTFGEmvI9oLwIk/Q45EqVI3ao4qmpdOMB/9mejFNN01eiaMZswtqrsLu07FUpYk9
         m7Lw==
X-Forwarded-Encrypted: i=1; AHgh+Rpn765JPVk5PXkd9N/52i74rQye6JYDjMrHUqCH6rnsH+3QmAO4oouppLKb64bZgZpzr1Bf8W7oz7YR/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEC3KEnNCyk/ORn0Cf40qK7dk6yW+f25EdUBplgd1O4dbDm3NM
	Z2d0wWX+7VIBTo6IoeGooNV0tB+w7EtYjakvUkGShapx8tnl9AU5uguX
X-Gm-Gg: AR+sD13ZMQ0y9q5E5UkR3w6JHoIn+2ZDN+uM2JUJfOvaRTLjIR00sJbkg3fV2jQzWUA
	fq98NiqPjuHfYnsyUC2Pt4Sc/nbQ+GBr/IeH0vcrbKAkIPzPZzO3ytHhKVrRfVmTzbtiIRg373M
	fBuKN4tipy1OLSCotzQ+ZzfvUG00O5SsXuv7+2hoJ4TQnLhvS2JyXFwfwCJSXeANGZE9Ec3j8Hz
	L7si+IPyfbDsFJe6IRIZDnTKfmzWkr+5yQsdJqAloqp8gVkhUXa9e/pbWDR9EjmIlG2sEZgCC85
	Qdp1m+WD7pBG+5/FbiWWKDMZcqbp73TOua5k2QpCb9xjERQGd1MAdU0y/1KwO1MVp+9VpzIjv48
	++mgH1gTexhIU6Y0hGTynqcZehSnR7LKaKnnQaE87QrN/zcguoNXD5TUchq5v7+sY4dFmAq32Xf
	6QFJKY+Ixx4CFkb+FPZh55TR7QL3onY17ahQqTm8B7Rdtq/wRPc/4uos1vdmEgYJfxemL8pyeIq
	39RYSZvhPTeznkt6m5Xh9olbze3Yh1c29KU3v88D/j+/foIW+Lr+582IYhbVf9pwa9I863oC1z6
	OyET
X-Received: by 2002:a17:903:2f84:b0:2c9:bd64:8c8b with SMTP id d9443c01a7336-2d046e889e2mr5033125ad.31.1785467584310;
        Thu, 30 Jul 2026 20:13:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 22/26] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:44 +0700
Message-ID: <20260731030648.8706-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8962.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 2db822fc1de7..8a9598161b35 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -1564,11 +1565,10 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int old = wm8962->dsp2_ena;
-	int ret = 0;
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,9 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
-
-	ret = 1;
+		return 0;
 
 	if (dsp2_running) {
 		if (wm8962->dsp2_ena)
@@ -1587,10 +1585,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
-	return ret;
+	return 1;
 }
 
 /* The VU bits for the headphones are in a different register to the mute
-- 
2.43.0

