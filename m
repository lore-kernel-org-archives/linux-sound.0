Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC56380FD2
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401102; cv=none; b=NCE7HbxdtDzTPL9y3v2Fix3zw/WLWbXwxIE48ADxZ8s2uk2NsA7jjdr6JgYU5em2vFii9SeiKhHVapJWbKLvbAxvK1atKpbY9ktcs9DMGJfzqV0fKVOEhlMELWBI8FkecMT6sxB02MYrfcX/BChdP1iT2YMVnT8JzhLUv/9mOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401102; c=relaxed/simple;
	bh=6tATyni+4XjZvBeBIaoW6a1jvZmc4iKytcAls52Jz7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXrz/M9KP8M4Aohi4lXYZ6SRBc74FKRjS5GRkHZyfb+tqMEWRkzFd4ddzF33cdnmmZCF8mk3qDAQRFoUPB2HoMh2sBVsWbuwY4osEJsrfRZB62onRXAzXsOHekK1gtJu6mA1viLBeinGBGCWKDSheFsrNFvKdhwQjLEpJ1VLMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1A5m1gO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1A5m1gO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84780c95e2eso2961596b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401100; x=1784005900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tT+JnYbqvqAEcwKG451SaW3hW/30F9TBA4BNUGiC6ps=;
        b=m1A5m1gO4WbdhC7uCg6SGzdBddq9nee0JM3Y2wJlLQDtZW1kwiVhPgogR2sTlpdUBq
         8SDOu5fIAju/jqBnC/FKX472U7ddRN5vRM8V8T4tJsAPI1tQuJZ8/bKtEO4SDhtbZJvq
         /mw+T76CEkAv7o89gzaIVhQ+TSpu8DmPu/YpfmsunMdepGbgwv5mK3xmPpfmaYP0anit
         u9Nv/FV+Ssl892hKh6nMPM3cILwHM9roZbk+24HI2rSryltLuiRNpdvGkr5xOlPPlwFO
         toIes0CKPXUiLMeDLu0JPLncVQnzbJy8GlOzX2ctrO/qfJKlk8QUnu3uQnNM0GBj8g2Y
         Em7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401100; x=1784005900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tT+JnYbqvqAEcwKG451SaW3hW/30F9TBA4BNUGiC6ps=;
        b=gV4F8m8IrddLlGWx1/UUMU4jRo3w1BJEB5NGs5tchXaqo75NLbVLv1P9tziVKRI845
         rdBbWlV/BAzsUJTasDnkFatYGogeVlHrnNbscQt/UT4zxPKuDI1hI2Ygu2DBxEBj35iv
         KN2/imaHC42e/rBy1jf/NuR4ETPv/ICAplPSODEqRpr7DlJtHsiNNU8I4E/msYiZAH8i
         83bqaHUBG+RBfRUPq6gUjgts2Wc7LAqKMkH1faOBxpWlwpSyYIO37/6jl/lQHI+l3fdW
         uWnsl+FKecRbifhBI5NXicElNwffG8A8/T+9WmS7vEztgcmIqgwrtCpZMnqc2XxK2TG8
         fadw==
X-Forwarded-Encrypted: i=1; AHgh+RqSSc7fG+F166fnl971Rtdl1gZLjRMu/V/RFRaN2NnOSExErQYO6lYPETAkR9K29rZ1a11ONf54OHLGGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mqeUfSvAE+T6m9Q7a2me2/m+tuiv98Hd1CbLtLBl16TiInsJ
	4ngzRstYPE0f8LwyD8ByB7lkYZs8JfFR4RihMuRpcG87j7sba1u6Ai/2
X-Gm-Gg: AfdE7cmL0rKrlXf2KbmlX86BNRd/7NEmcNu5nxBK4SFHkvYnIskTOIn1jc6VPR0JM5N
	IHn5A77oTNL5P5Pat+2pz+MEZLKTO2awDWai0IMrpl1JnZA8FtGhxfhj7Zh03WCtg7l00ughiV5
	1Sw7eClymsnyaCSLu5TyYDeindMLyaFw+5UlGu1SmqMDb9sQOhmC2q2ykrRBg+15TQXE6SD4wUt
	fSE/EgxFsbEa1+25QzrzsmrN5Jp/AMGBmOspA0HYpCWXGlSxsBytLheIUejZiVFFpkoQMYWlQCg
	FmUNncgrZ4MzQwhjpTe0sETTbqsXozVYrm+MRKw7+DsPj5rC+aOeeVm2u4w8XBqfx8xxkDZiBZd
	jPsXTEKH/cjNyS/nPdfTopcfApCbI9FfRZ/1QNxmHsiIQskbdWjSEfyvccfi9otY4QL1Y3z835F
	glhL672c6YsxFA+ph1NnXWc4zdcuU0CSKVYFcrkZg9FnHzl+Y=
X-Received: by 2002:a05:6a00:1819:b0:847:9b9b:8981 with SMTP id d2e1a72fcca58-84826d3f6b2mr3361766b3a.33.1783401100158;
        Mon, 06 Jul 2026 22:11:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:49 +0700
Message-ID: <20260707051006.20058-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88166.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 3f15f4ac51f7..b72f87f677dd 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -1173,9 +1174,8 @@ static void aw88166_startup_work(struct work_struct *work)
 	struct aw88166 *aw88166 =
 		container_of(work, struct aw88166, start_work.work);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	aw88166_start_pa(aw88166);
-	mutex_unlock(&aw88166->lock);
 }
 
 static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
@@ -1413,11 +1413,10 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	ret = aw88166_dev_set_profile_index(aw88166->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88166->lock);
 		return 0;
 	}
 
@@ -1426,8 +1425,6 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		aw88166_start(aw88166, AW88166_SYNC_START);
 	}
 
-	mutex_unlock(&aw88166->lock);
-
 	return 1;
 }
 
@@ -1607,12 +1604,12 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 		return ret;
 	}
 
-	mutex_lock(&aw88166->lock);
-	/* aw device init */
-	ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
-	if (ret)
-		dev_err(aw88166->aw_pa->dev, "dev init failed\n");
-	mutex_unlock(&aw88166->lock);
+	scoped_guard(mutex, &aw88166->lock) {
+		/* aw device init */
+		ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
+		if (ret)
+			dev_err(aw88166->aw_pa->dev, "dev init failed\n");
+	}
 
 	return ret;
 }
@@ -1639,7 +1636,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88166_start(aw88166, AW88166_ASYNC_START);
@@ -1650,7 +1647,6 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88166->lock);
 
 	return 0;
 }
-- 
2.43.0

