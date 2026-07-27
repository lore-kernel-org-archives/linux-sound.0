Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C653EEADE
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145326; cv=none; b=u7+RBJL++3YNtQ6UY7Px1sYcF2on8tb1QMl6EJqJJADbiD9YpgD0QzB+j2si2C4eHb6obXBkGsvV9UtBBMwN/x7UioUuNaJ5R/g3XQgCpa1Wn0NixfrbnzL4ZXKSAM2cDHjGzVE8N1mwLS78udAQwC8zBHeUzyK5uW2U3oi+ha8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145326; c=relaxed/simple;
	bh=GEVBslxyQTjWkaD769j6sBltZvw/8KgoyK2Jx23lHrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUTR9OWcgobVlJB1v4pA2+YOYJtESMRB7KvTuVhiwb0jjfM6++cBvmnAQN1uXz8/rcQWfaDpUxYRgaqW6KmB5dr3aYzAq71G5XiB9vVcY1ORRBsEJDsf9OuqLAPjp6DU1s+VGxNc7vsV4kqt4NWjk67zeotHHDRcYNt7GgukHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8aG863L; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8aG863L"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so1661054a12.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145324; x=1785750124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJuHQA4AENaPcuIoY4pYQA3muOxiEnEKnbdN4NwUjpY=;
        b=m8aG863LQXZSG1enA87VzBUgIZeBXkkBNicGBRRR4hk03R1ds7h6BetlvkwVfuRUIE
         LWztvQLMACTcr1soO11BeeSsANXJamRvkbKEP+2Td2dDtt42cNV1yfPEkHhPId6ClgH9
         UqcIbZDgKpr2TDPcr5lfNhG0BnOEPrvLrf2GBcq9JVHLJ1ma1nrWoIQqrcM2U7RJti3G
         nMv4zVr7UvXV1rTkDsM7mOHEq5YUPHOtZSi0qzHtTIfCEmemlq7Qj+PhDi1v9HvveunT
         cTNHM3IzHzwzEtoYRwLZTLmN5US3KScnAQv6+rhlmMBmSORq8O+pcKMKi6UdbJShCopi
         +CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145324; x=1785750124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJuHQA4AENaPcuIoY4pYQA3muOxiEnEKnbdN4NwUjpY=;
        b=kxmA2KCExKCpSGM5Reyt3el0BjIxw4PudUhUnmoH7s/9SDY0tjiePQVj/TZrvCVJVS
         U68Pf5NXh6/SaprjF/U5cpllETCKqW3ekzIqu1cSMDlpdxgV5X1gL4xN/d+/zn097hd0
         IQ4pYbnGou1fGaC5ozj88csyq8cbMaP1n2xZzq5jnCjj4NZrg5yZhzKUxDtEWqpeX75i
         hJz51kAdKbOElPSMnTyyoKQaclbtVVI37mzvCwDP15Z3OSR2ZflvBSjC+ac0yJVNkqy+
         zpEujC8fqP3tCd4kAZDpCi2P/xz1ISkAHQhfbJoEUlNJ3QhqZ5Wl1We+FPoWyDe6P21q
         cwcg==
X-Forwarded-Encrypted: i=1; AHgh+RpvIgQ45q+fEMBjyofoC1y872/dkqvh0o7BybJ9myPKlUKhZTM8F9itPf3SSDUpf6tea3DJOLuIUvm7+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcN3qk+GWqGmqhiivw8oYJGIaOd1oP7ollsVIQH/S92QDBOkRV
	62lOgoS9Q3+y5ONaoj54c7EZkHBUU0gXN68xXc3XyNeu8qKIMV8QRXYA
X-Gm-Gg: AR+sD10KFd2nLHGssCnsIVUB0LB8CxE+LIRyBdcqTofBX/LV7OuoukZOsQY28YFrghk
	4dT2y1l8pm4V6Cv6lpbXgWuC+BPzu4rXS3wFWb/5gfbsz2UbWw9z+k+qWiznvyWyZH6YzPODYRP
	fUlCkWnAWdKYm2qg4Rj2GN73koFKK3F0lXLVyZNVA5iQMb8TM3r60Og/FZ5Cf2gxzjJ4F8dmrNB
	GAqLgz/GtjLaeMxTjvrynfygDeiYNEZBu2JwmC2KT8nnqR7L0uPlBjoYCJoDkSZFDou+Rr3f/oz
	ORp+4WG3gwNJSsnwTwXk5HkfH2552bmOBJel+4HCBvgMyY3THi+lkIR9kCrO/fIExsTtMJaE8RF
	cZ2N8ZOcaTeSW9rJhjAGqrRArOhRiPX31qoxXlpn1raDP8iZ/IjNzfu7w/d6piF0vUfRR6FJvqX
	utIjirwyXXZm9xRlQkHIl3Mq31iYRLCGZFyyktlxEu14dg/iElHg7joqB0NygdnR6A5UOgBPEHJ
	NXzs+49kAnEj0MiGU//IohbkQL4el/8
X-Received: by 2002:a05:6a20:7491:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c67df2ab08mr6797503637.36.1785145324251;
        Mon, 27 Jul 2026 02:42:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:42:03 -0700 (PDT)
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
Subject: [PATCH v2 02/26] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:22 +0700
Message-ID: <20260727094046.23001-3-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sta350.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b..2ba35076732b 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s:%d: " fmt, __func__, __LINE__
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -306,9 +307,9 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta350->coeff_lock);
+	guard(mutex)(&sta350->coeff_lock);
 
 	/* preserve reserved bits in STA350_CFUD */
 	regmap_read(sta350->regmap, STA350_CFUD, &cfud);
@@ -320,24 +321,19 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	regmap_write(sta350->regmap, STA350_CFUD, cfud);
 
 	regmap_write(sta350->regmap, STA350_CFADDR2, index);
-	if (numcoef == 1) {
+	if (numcoef == 1)
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x04);
-	} else if (numcoef == 5) {
+	else if (numcoef == 5)
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	else
+		return -EINVAL;
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta350->regmap, STA350_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta350->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0

