Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C23F0765
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145469; cv=none; b=l2BEQMeXz8f2sdfu2XLfOBVU+b27hsvbFZSLmodf04oPjZgRfYlB8DF4VgYzXTyr+E8iMH6IKDecG0ilzCmBeCa7WSi35PNhRqxCId/FhFyV+B6sBo+wfFXHdzsRYlZJLFRnAHPPyogAEXzDlt3NYMT08mdwvE7/85jexeGDTOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145469; c=relaxed/simple;
	bh=Ao/9uwAwCZ3n+ZuP9RpaHxQh/lAFXXxcAD7XbeFdYrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ge+kopH3C7gQ9y1D7h+ZYjEk/J7CuFFGNNh455V02h4S/788MAucEIlbop2JHe1VAe6/gz/O7X3LuechNUwinR9627lEyDr9RHrpCn2hF4p+Xtd37gOtRy4vIkm/SOtBFyUc6h4QwhQE/sjKsspPVBIvfTHVUZJ5E/pbN+55IV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJ3wxvLr; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJ3wxvLr"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f236418so1739125b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145466; x=1785750266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdOBdNsCZllnvmxLCxNmDnA7eIbVv8iYbzhQVFd/QPw=;
        b=eJ3wxvLr9Nr3g1zhrOPyt6jciNBFs/AxsakAWxNRb4yoLbjIQnQSU1LkCM3q0Qq3UJ
         b7zvfGQrp2N3kMzseMr1WO73RbQ79gaAp4SPG6242A8CS2GCZmccV/c6+Z4Ge2/2jGAX
         /BK7ewiYu+x355xQpFCWkYm5A/0E2jcyRWmOdnFgN2alNLRlZ1aNmjNfPQrBaU/7FUAl
         ZYA4For2QY6GD/lQJK4FSMgFV10LmSQvecP2OskHCYjmR3Bh5ZgoRDWqd3IU3KjiXl5q
         khz2RwyLGmqjR1LQd+4l2yjaQAW0iT8JvKFX3HgrrJzUk+QRCmDXtNheIX/BofR4YQVn
         2xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145467; x=1785750267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdOBdNsCZllnvmxLCxNmDnA7eIbVv8iYbzhQVFd/QPw=;
        b=FT6LDR36CZzNnGR6KDk558Co5PLXXpFSDKt19QpbGEhQQUksrq5KACwY0RZpcloU0Y
         Eg8Ff4jbXcTCtdrXos7EfAEVZCUYPAP19QJWftJwDrLl+3sISzNls+muh1yhys8PhINc
         DOOYzEJyatyFlsvHwVxFCfNvpChp+Qb7EIjazos/j+DIFNowIY8i/k3OvgJJG2T1Of2k
         2OLYm+DGoEycBFc8H8jiIzdnkj1S2E3FUF4rwOtoyXDkgstRxSDG2mBkSz9fOHmY1rKR
         sI4lV1nik3dy0R6OlM6Rjuqvt1ib87aQMh1UTtY5f8DU/TBTCykuNi3pCH1ORTcNXH77
         +wOg==
X-Forwarded-Encrypted: i=1; AHgh+RrXERrVloR4hcgUqWzAygrvwbuRwcsxuaBcuIO4ifCFQYwwZNqGNwAzjgD0eG9mt6aviJkJJc8AXy4tgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVfzmp5I3w2jABNyx9L1PjMGpPI37WxRQiPxAl9w9r8frxhW/
	vfOkJ/jdDZ5JwJYm37s2mqHUbI8G4L3seuZ5l4ic3arqD1lEzy4zrErf
X-Gm-Gg: AR+sD11lNvb/dk+mbXl7o5xml2TRjvZxO01BmUDbZXvzkYTSmdNEFUHlH1Uyt8czZDD
	Cw/DIy94CjUKxBuxMStc3E4gS91Yb+Fkcq+9qlo9AE4o5rnv2aYhX1kLFxeMLdruB/yt+yyEc4h
	SiI9HnvepTTcUNjhJJkG7CLOFOVOP5Tkx/S/pNgG2KztFiXLwRXwDmq5+stzxGH2PkeCwXpNSyv
	cU97O5UzbwFjvtPeXSMkK567fdmnzXTKn1oo2gEZMz24B9KsmZ48UHnheRhhhQ1013/FLxIRAnu
	7oaXIdJK/joP9INjb4a1Y6uozRkdCv2Fb3lEIFq3ffa/tcJnUxyVJWF7ntzqgPzueEk9dS/rCzZ
	rY8J/8QviDGpsxKgIBbDIKpdtM7beL31zbbXz/2LJD7/q2qXxfuUXeJcCuyW76nDZAgsYOoMJyN
	UUMPd42qC1iC8/qmdh+IimAcu3eIO/2k03ZAjaOu4wM0mIqIDTx1hPzdIcAxgfPrfWSYNIRXgyk
	laLH+6zowEm7NIDgK/yWw==
X-Received: by 2002:a05:6a00:b95:b0:848:30c3:45dd with SMTP id d2e1a72fcca58-84e5942da15mr6361773b3a.11.1785145466612;
        Mon, 27 Jul 2026 02:44:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:26 -0700 (PDT)
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
Subject: [PATCH v2 18/26] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:38 +0700
Message-ID: <20260727094046.23001-19-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Reviewed-by tag from Richard Fitzgerald.

 sound/soc/codecs/wm5102.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index b4d4137c05b4..74b775b95bfd 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -667,10 +668,9 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	put_unaligned_be16(arizona->dac_comp_coeff,
 			   ucontrol->value.bytes.data);
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -681,16 +681,14 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
-	int ret = 0;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_coeff != dac_comp_coeff) {
 		arizona->dac_comp_coeff = dac_comp_coeff;
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
-	return ret;
+	return 0;
 }
 
 static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
@@ -699,9 +697,8 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	ucontrol->value.integer.value[0] = arizona->dac_comp_enabled;
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -712,19 +709,17 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	int ret = 0;
 
 	if (ucontrol->value.integer.value[0] > mc->max)
 		return -EINVAL;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
 		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
-	return ret;
+	return 0;
 }
 
 static const char * const wm5102_osr_text[] = {
-- 
2.43.0

