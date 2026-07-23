Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD13A4F3B
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782582; cv=none; b=W8o9yMTulAvhBEPlCJ/41rkqaAd8ERN/c+vg5t6gbl73VMXcRAmQpegkUgLYxXjXpGU7i617tLhtpw+Wx0eDDrSXG0mEETMAAyR1lN5lFtzb/B/TV1oNBPsdE5etr23FB8xrObu/OALZRAx8pgvCnzctZnp3/H4TcqiQ+ul6gQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782582; c=relaxed/simple;
	bh=vhQNcZw7Vwuw+2mEaZrrAwX4ICzGoAV2kKF+a5LkSM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0s9Owy8jYkx6E9yahBheyweITzU6i9nBlQjFZ3twTrFhu30TOI2PiQnYdRwSm4U3AKIRXikgG/W9w+8F+iadfFnJJ/Rx8EnFtPLjC7/mjGeyZtbbcmVjN8AQujqvS2MJnF+YQzuHo6+ouK9Lv0K5vwPd2W4e0VxoryZtb/cfVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrKRhYrq; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrKRhYrq"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc73e322dbso2568105ad.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782565; x=1785387365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok4tGf8ERF2To39hRUrBqxTeX6IvjzaUkkiuJi5gDOQ=;
        b=rrKRhYrq4Y92gQuENolZWWlDgGdIE/xWt5iSHO2IeK3CteRdWKSKOMZwqgjmYlJ2KP
         rndhdFuwhUt4kKKOes9qaZ/mikuG6+gegjqx60cwEHPniNokWI2TUeJUSDjlGWohHhvb
         UJu1ioXurTZxtLfdzxPkyniomFSwNj1KmnnQ8W+Z3iE8jbeCwtBnCn2urWnV5IuqZY8C
         k+vgT2fqjDkIHGo7GTVtNY5KFRxD0eErLmTS81jvLYnV+hIqX9prujEJknxwHFYw/oFU
         wgNxgfI+XpoY4BdbDxPXJITqrS9Gw/c258Pq7wuHyCuNFTjyqWhuAA1MYTzCSsaLeTEI
         VNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782565; x=1785387365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ok4tGf8ERF2To39hRUrBqxTeX6IvjzaUkkiuJi5gDOQ=;
        b=lvTene5a3BfZYQyJVBZtwPNe8SWJAzcy6n3jOEelzn+P2MxHxW4TQABX2AIaaK0JeO
         cA883kK5xBJgneiRTZRRK1D9ANitYuBj8DIGenV7tYsoPbjlwwQEdOyU/A36LJDzxCCu
         S7YAh4OplJD16td4Q/z6kB7vWeknBtIn9mmwFNwSmLHHA9UK1HShuPdx20Q4ME0/phq1
         koWPsNf5iVh3zrzk6aEkFBPREjZH0dC22LEPcTFws5hijR68EDLFYNVKxv4yQtQXthPG
         lKXC0bt2gTC7lyUkvsurBzP8B0jz+oMRc/PE5nuPWEfKuMveMIymZv5VrhJx9IOG1dMm
         QyoA==
X-Forwarded-Encrypted: i=1; AHgh+RrG+2rO80g7JIhai7LD6Qwk/83lIU+pxQifzYRZI7VqB/PScPgsDK6tdV5bOGcizUnDqsFOAlqhNjQ5RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiEwb0WpL2ad1ZJEA3hZ5qaQ/Rc7OGoIabWdUgtjoDEoBzAbF4
	n9yJDZKnSc5mozbvGV1pNj1rW7XGKx43wT06DD3UstO1Gt8aCCZ3pQPW
X-Gm-Gg: AR+sD10ox4i8jDgEmVmt1n4KATogc651TfGnLvS1e8mfKkQ8VBDPPN09LFQtNEMDcTh
	niO6tVHB6ofs92E1fL69313O0z86JTA9xbArZ9jVYFKe7SyVETUpsTn0Yk3wBAU3gyWDA9tB9lE
	7pce4adptihVHcZ/CXF7ifDeEkkmBUd2tBnreI1DzZ0NC6U2LF7HydWKE4ANln/Lt842HTPwkQ4
	a+dE5u3fFBr0gbvZPf91sSy8izM9NNOPKxhygWOhKpirr7U77dDjLqyqdNS+nt5SbI6P1TT4P8Q
	X7f5PDmUrj+lisppRgZPFokiT8zVfjIOqaoDlZEWsQb+9bpxHTVcONGZlxB1Ke5UWT6Rq0SEqr0
	1meccAD38gpE3XrLrzU8PRm0q8R+fxO0f3sk0D9SFOuEw3+wWVU9BIvOVxhPa//Qe2hEqWKmZyJ
	dmglCdhD635YVp1zUJjA9zpQirJF3BCILGV7Nu
X-Received: by 2002:a17:902:ecd0:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2cfa6c66734mr19973065ad.28.1784782564905;
        Wed, 22 Jul 2026 21:56:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:04 -0700 (PDT)
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
Subject: [PATCH 18/26] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:19 +0700
Message-ID: <20260723045327.28260-19-phucduc.bui@gmail.com>
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

