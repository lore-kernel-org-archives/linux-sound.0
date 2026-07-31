Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A43446A7
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467415; cv=none; b=npRxKjEbTQ8PsXT9JeFEOsKu7k/FbHC8CJuQ3uk6t87oGJFHHsfSMV+PzI+b8ue30NH7s1Ci5V2fyL8BF7JCyNot6yxCLQ5mf/PfB9AiFXAjkose7bRzg3PAl2SOJlVjAQzVaHKiA8r41PwepGsNX27+fPAm2USEpXZYqoe1SUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467415; c=relaxed/simple;
	bh=zFW9Mx0ZXn7hF454QrxJfQtGJ47S/hYdOGWLyBiXIRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqTCQaQ/hUegbSHhRHBJCPz/jVD38S+uOcSI31ts25UxgimNOQ9IUifbWxIKA/eC1NDhpDYtij+h8Z/CPoYrKhFMbDk7I1/9IKSjCmSyzHLCowGeT7KV1Ev+KkBe0tMfxudcuAea8bGc85FbYWSd9bXfTaJ1F4JpMlcPj5af5Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0mcTgVm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0mcTgVm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf52d15d88so4001835ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467413; x=1786072213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sk8Pesmwy74AH7VxeJg8H8U9dR5/4hjKm/qPKsN7J90=;
        b=k0mcTgVmart+zf2BqCt4W7qO6jtcRZhtiyAW8WfCS9gXKW75p7mntI3xuvHE4JlXnW
         goRuN+n9LEqBFtoqb440vonEbNO5pfO2GD9j//cFHH1u6rPB3eyHPkeVPJZTIm9NW7Rh
         EJVPMyH8ELjlscDQn0CeMhhVlKOg0fObUsZ4fXX4OKN8ZfMZ8hGuz0pvo8V1KNbTfGx5
         FisDMLdul/LV3obBIs3KxhEDzgQU8rLb7K87hGhUmeAyBMEqMK+wufCISiKfAPvrNOFq
         GaQj725DJ4YpL4wDJH6syR660oH2qBxwdD+yUcX7uzY4QCFZ44mwbnV/sEq0UgVj/L84
         F2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467413; x=1786072213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sk8Pesmwy74AH7VxeJg8H8U9dR5/4hjKm/qPKsN7J90=;
        b=InEN39idnKCrQgXqkVFTR/utNaTRdx2Zl3k1xvKCuDmNlK5BV+kwjSLeMkb9AYgMka
         tILI1O4O5hOsOPghAaYr5JTQniu7DOiVDwKC3EkbTadBpXO0ksPb43J4zqFSUM+kiWWn
         1O4OG2e4KEpOt29QKSXyOtdIjE+bMJX0gjp7MfocvLYt0fCax+uNhGA+AtWIhG8goixy
         Jdr7eBmKjP0LJsIw0YtOODJLPhgcHXKdzxdL6Vi6qkDvPFgOGns7/G9mPb76EcXG/gmq
         o3slJoWTGBrCCwDWNSsaZeumu2tovaTy5UysYufatUxzri49Ff4Ru7W7vetWlxCrYQWz
         U44g==
X-Forwarded-Encrypted: i=1; AHgh+RqX3fBWk9eZVpjEh2oy6VZBWtvAcd2/BcmhhIHEsO7NsFQO/2hhiJPnIcwHXgZvHOQp04wyNhlLikczdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQP6S3xjYw+DdEgj9vfWx2eF1CdZxKgyjlSmSDDTFumv+Uua0
	mYvZ/JKjnuVwRoHj2ovLV8v6hqt0VYw8qIespiBZy0P2v3KOei6jvn5U
X-Gm-Gg: AR+sD134/Syanx8GBMiPzMiPBH5LoP21seLr00ZBhHaA9HuGapuMH6Tycg6G0ShWLDt
	FoVisy9Iml5WlWfHj9ydWJRc+kjxlAHQn7V/IZqmQb8jMFxq+axzYEyDUt+WrOkbCLQGw/PP+SB
	Buhob2wfGx2btC6yF+Pe3y5d9OmyF89zGE/KKQ67w26wvnGFiO/zIiOy+Uymyqzw6F6T3kggWSn
	hsvj7OV0Ip/CQ0HW68IBBN7gfYbDv2ouitav8odGL38s0ep9MalaN+Zgns0izDfhVPM4eP0+pzt
	SZQjnj/DWB2n2XEUbJsm7KgMdVZgCu1yGdaJIHkaRuk4Ep5uKEev3X2rzS4aMzuzy2HHrtfM1hJ
	VniVDUH2EYhp5rUWLYEebLM2tu96YUR02oe6ouTwtuOqbzrc54w6c9b5ZwYBqiQkF5pg9oCJk+J
	fUG2sdLoUJR+ox0K6NYw8R8ZOzYJ+RkvrMB/MLd9TDJJDBk4qyEt807gnuRJUzcobSdSWv7/SSk
	krEX7HrLRXT1BBpvXMmFsgdS5O4ALDpa1tVR/ZvxoUhBDgtHV+Rw3+ysFhetwFD0psMfNE/r7sx
	5dO8
X-Received: by 2002:a17:902:dace:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2d046d6f43cmr5259425ad.4.1785467413330;
        Thu, 30 Jul 2026 20:10:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:13 -0700 (PDT)
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
Subject: [PATCH v3 03/26] ASoC: codecs: sta32x: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:25 +0700
Message-ID: <20260731030648.8706-4-phucduc.bui@gmail.com>
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

