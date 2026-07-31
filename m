Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AF4348898
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467567; cv=none; b=bab/qI0OLW2kEwEedqv3PeJlhSbg6iz+mFTFRA/5jg3Zq75UmOJzPjZA+dZ6rY1qCAz0GJNnDGhojPh+gGcVkY0jvcDr5c7l2tjFlFkRVw+EOM2Lxw816fTQIahMSOK3q6Q7ZAgrKGDLdQTYRjc7OP/7BGCOoM9wRDeXbJKmVeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467567; c=relaxed/simple;
	bh=kHWNCYdS4K4RRPRvqdCj6TkLIUnIWTevDf0/Di4lMRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9NcklFyYWbqZXPkBiVgpHSMDbcWGTQigggNdOSGMP6o4QefAKV8RUdL9tgmDaUzpEqxWtjKJwMoJyMfW5g23GFnkOjudFNwY+/89wuasy1PzoTdH6qOyLBgCyzzXFLQdcOr2I5pJQZf+9ZWQRzuk6/DrseYHWkSemY5dQV/T8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzFNSZCh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzFNSZCh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caced6038eso3870875ad.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467565; x=1786072365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9vdPVii+bD66knLG1U0cHceoDlrXgrDY33ayST1M3U=;
        b=DzFNSZChbddzDmfSsRsKxn4HKQs5pX/RqNn7B5KDkENdbskLEgFkF85JgmXzh5Xqli
         RDGn0BoXiSsAewdxVG/Bca8qkO25ZUSV1ncvE5xms1dIfPyETsm5ROb2BXNROcuQeDtP
         4joPCBBu5qmNqHiJxT7NOqeUMPa9+J27aHquvHfIok+/ZamlGoS70UcHedTBWgawTgj/
         742ZXsCnRLNuFY9Iq6+3wM2B7yfpby2cCMeFYuhUEZ4KGiCp6DogqSKTnQWJujP+ESjI
         wppMN1iF8O+iSyrf2LuB8zIxbCrNji03ZVal4dolnPVTAjH/hxV6XLev448pu4FGC8dM
         cRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467565; x=1786072365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9vdPVii+bD66knLG1U0cHceoDlrXgrDY33ayST1M3U=;
        b=aaeZqAlIAg6lL/LObntXtIzusrE2fIpNlN5dBxfNNa9ZJ+I1XpeNA9q9VAHBzJ8GHs
         5wEwttBRuMC1blorIhRT2pRiKv+d2gl0Vrkh3QWwwEFcWG+750GQw/eCq+VRatG6zB0G
         eGUwwBPGvA88+gRk0HcWjPmxAeWbOC5ARxPHEsdAVcvfigiGfFMVVaRtJW/qlN+Fic8Y
         BboPzCJ35E8LTKMaZcLOKm7Aa7F7UvlYDANMGV9ecO6mJfUwBMqT8uJcQcJQw+FxYtwg
         iVpaArQwDLpduo9nqSwmSBUsnCbXgUL5clct8oST1tPWTafWcgodUZ3/6cLKq2M6oZlo
         vlmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBQwuQkd8lpGAR8NLPxkPwfKj89KiJoz4rvF3bizwiCrF+H1IM1N6VbxsXwiwz2zvu9Ls7NkUhuGViRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXeM9ddQyVvcjYlElxUbTwDPk8hrSnFQPYrb9eGA9NhXevRnX
	NVPGWkw3eiPlCK97UdZXHJjFwpQ7Tc8SvGdujv3B/ICZJaRFC2gptVWR
X-Gm-Gg: AR+sD126eC58dlg7dyJmAeWByhtbMYWV99UFnM3iOM+VXjVJpE0uDlwjKnKCM8iRIy9
	qF/oBcxcXNJkCsGau76+y053CDPkStsm1Nfq1dQP/8IU0435Fp0Ft6qlA4uKO2fgfY+lN0E1Zxr
	/SiBkez97R6Ypx3WOnHLxCBL0cs2urReH1vNEtnGSGXd9CKyVDla8qfm2GojpRdN3dMiQL3JjQJ
	8sbTMFrJj3OU33ksKG87gByQ8ku+hcT6AnLemCxUNX4nEAKESlr50Rb6DoTILtTUrQFDofNPiAt
	ZAcGGx0mlyZYqOtvnE31YujANlxe2Fr0Ghn+3gTQgKWbnNd0aIGK+JPjniMUdWJlRtiFUG4YKMo
	u5n7LZ4GGhFK/zmkUj0y0OgnKoT23/n96iky+W1q3bVo/ghDlUcpGxEahz1mwxr8PLwAZ8hJYoa
	FiVSRZf2QZ6XQ8Y92cjt00Cec8SHohVv1qmH2TBV6IS+ej11a9SgmMO3f6x4ayNiiomSCcP+s7P
	d8E6vqo/8YYnEwt+vgvb3DA75n8ozvdSg0s8O0Le+a2gHcPUAFWJgBl3r06ib7lokTwskVI774z
	veJgJ1t4R0QPKUs=
X-Received: by 2002:a17:903:2c06:b0:2cf:b23a:3e68 with SMTP id d9443c01a7336-2d047e9cee5mr1927185ad.25.1785467565326;
        Thu, 30 Jul 2026 20:12:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:44 -0700 (PDT)
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
Subject: [PATCH v3 20/26] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:42 +0700
Message-ID: <20260731030648.8706-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8903.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..156e1e24a388 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/gpio/driver.h>
@@ -458,22 +459,20 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
-	int ret = 0;
 
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
 		wm8903_set_deemph(component);
 
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
-	return ret;
+	return 0;
 }
 
 /* ALSA can only do steps of .01dB */
-- 
2.43.0

