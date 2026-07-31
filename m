Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA2340A46
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467607; cv=none; b=fAQh6B6XfPhPJS4nDPp6xMn0tqut5uNT8zZ/IM7EfmpH/mrK+Kgoni982QmngB0iU9j+u+jhmmJK8FxvyY8CBQwoSMQ94+HI1M5Vx+vt76OnYcGMl4YvDCNsfqhFHZ/gni2vi4NnA4hVhOVdyIW+yAoMdS54koNwXof4nIN52c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467607; c=relaxed/simple;
	bh=zbnnO5QqCp0aKW1u4NgpP6pgs62g6NaFKUTTPYSlujg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwz6IQ3P1oITjYGIRqsQw6nBI7brRmm7DdDT6jF/TY6OetvMmSEJrKJ9qb/41c+tOx7H+4mrVTFYns/YdlY49yELgEbNkYBJG08vS4pnODutCsS5v/0RE/x26fIXGHpNFPN/1/GiQZf48UUw5SGT5sHReV6W6UMnOt832z4L6Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNriZ2+l; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNriZ2+l"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d032846c95so5296545ad.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467605; x=1786072405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWKh2+oHygCqr6F5Ht9/yhyfhRUrXXYvySUt8Ac5ouA=;
        b=lNriZ2+l9/f3vFRCskbmVqkw0OzNAWE42BCJtJUkUEazseOQjkVHU3a8SJQZgJpCAe
         SYCfLEX8AbRpJQ6kjYzFaI5XEB8LcpB6HOAT5Z33dqruzMmE6nWSAq7o/SJfEPq9SAfd
         aWcvNHVBDVdDg7hM3IcUnK1/41Q19OER8xokEurEBTeI8DN4IK4dzulagFOR9d296zZl
         OEQrNMVkFnJmEkggg0nyieEWr9kVQIOQBEtjGYhGn6qnnh6hsXuVeuPIZJqdgTnSsf99
         5X20VmvJZY8eKVS5GHFFDeuMa5rRtsTFH5G8a1ddjTaQFYYyjXSU/V1Tb66xGw6W7lxa
         4AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467605; x=1786072405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWKh2+oHygCqr6F5Ht9/yhyfhRUrXXYvySUt8Ac5ouA=;
        b=eEU9HSAoaXv5eF/Vy/QAf+V1fnSjudRhtFlG2kAR6JTKAOhk/MrVG59JDzvwUqeJZp
         SVHkhPaC37+QyZXMXry/mRnsVkU5+M1/Du/ig8Hc3qVsUyWInLZAxixav1AzrS0VbuqP
         62RySofwX8tRrLlNOD/HycCQTOkiiLNwWOgT4BECoFpPAlmGj1lXF3QSHxGSSbUPC/1S
         ZmHsD+DGEn7ir62BQgNl7xm8l4luyuN+aHf8yoHvZLGuFqtcQ1FWTLFtBubHdtkAlKwg
         bIb7/B/+GzZseWD3dgo4BnYbbbIAHpoEZ945gtEnFuHiNEA4gI4cBDRerSjVZWz9QhzL
         +xGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcTZIGFJaeOkUl/e21M3zxjbvY0rt4odYQ9bNvS7ZmfbsXsz6BDQikglBzqKr26GLSIkX5yQwWJCxPdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlvggib2K0BPV3o2Jd9g/+JZbxA0a0Envfd2awZ6NWWXjJrge
	KZM+arRfA0vRntSRfMTibyhzcgBaiY+IvQWrJruYXoVAIOXau2oqfKmO
X-Gm-Gg: AR+sD10v2pow0M0nHih0brsSAezzF8uBB602ZNtq+aDJN8ER5z97BPNXXxr2iUhx0pL
	WiKTg634CbqH6RwKJ86JfN1YNhlGl4fcKLzMMFvcXFmuZt1JEw5ckF5uXiSZrSZOg6a3TQkV5o0
	+kPGpjVak2fiZunDUX51Ec8jD84WteD7hQRVfsQOS3xWdEeLEQTfML/xIrWBHFV+gKNH37lHe7L
	FavXCWOzNoABTBDLa2kzc4IyuF9gbDMFISYdDKGUyfdoXHAwWwz8oLxPxewEyB1ER7tW43XOSdt
	K/8qLzGgtsRWFVkuGXucSapsac7/fs+SYpUA3sVunht5Izqso9cPWMJKPj086EjpF/mntvEUCuW
	+eRBH66UYN5n6OWcSpSak+PCQPMkTCObbJ0EfJmOG3DZARPaxXV2ASH39L7fNMjlBmcsMG7CB1q
	SrlRZ7L2N2ObUp50CSY9+Bs8PUvEdKoHkW6Fg4D1Yfft4UGiui4d6Hkxt1Okow5JqVx3ywCkGEj
	8PXWnLm1+fvcFarC1orCN4zKdFRfvo/n9MMSUQ9bMqM6wNn/7CsUZqck0+XDclrs2PLXN0OoEFW
	r6hQ
X-Received: by 2002:a17:903:2443:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d046d5331cmr5207485ad.9.1785467605379;
        Thu, 30 Jul 2026 20:13:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:24 -0700 (PDT)
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
Subject: [PATCH v3 24/26] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:46 +0700
Message-ID: <20260731030648.8706-25-phucduc.bui@gmail.com>
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

Changes in v3:
 - Add Reviewed-by tag from Richard Fitzgerald.

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

