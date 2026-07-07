Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE4382295
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401233; cv=none; b=mx50KmluXzF9kabI+8TRJFjHYZZZhybKyZktLpesax3th+CghTwbdo94PkMoodDPKNBhItJ/cLDc8tAQTojn4vNTRMRW7TmS7fRATcmGtYVC+9cSs8KqNHG1AzNs+9N0MsjTnw+yW9Uulxsv0Jc3va+TMqRD/b72lxHAhZUwl0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401233; c=relaxed/simple;
	bh=myMc8cB5TZmyPAjZl2RU5Pqsd/fh0JTdU74J2r/32DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxHoHfgvaRD2sE2i7Xi0vCRCy21qdFwWC+PlHiygEz3imiG0uvwczFHAsp5eEMgNhylJ5/WQ1GKOSktNy0gG3PoJ1LNFzRJIUiKjrzvFStut8q4wn2JXVHD1Tt2iPsqOhc/wzi97uOi2c88Pi2WhF2iE4Y8g+ysojw5L/jzH+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qErt0Qkr; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qErt0Qkr"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-847968ca62fso3931083b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401231; x=1784006031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=qErt0QkrBdPWwM/61JcY1LxdSbdLdtNcdHZ5qckrq0M3Um4FAH24zCBYEB/vuL1Trh
         sbLiD6aqAelCKMts2jKWU3lAZgWaNo2BgdLGY62egGtfk2mEILxZQ2uaTqwaspVf+ZsU
         is91ykRDuQfeVv5I2REPlxtSAoJZcrOpWX47echeo/wYFAle57+MYB4YmqTXJRpEKL7s
         JfUxkjyumYBJaXyGbGCo/8Eu9bydl6xcdP5jslOzh8yoAEhqIoLr3Ouw/QqpKmeocSbs
         mLqg2arr2jEr5EjKcxF47Ry+daXTAudVu8txaGoLJgs9fNnmtNFRc6CZ95AEyxgCMDOR
         tLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401231; x=1784006031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=N1nfWgthy0AACWmaoyDfV78AeLIubRCpjU71dXULMnAtV0xkSub7oNDmekJTCbbBUG
         Ne+NhO9QLwsRd/ZZ+U3DCIaC11JQFsQGenInmr6jvOFdyacmo2E28WbfQnojReLDtzkJ
         Vuc12sqALxeoeXlfsPeB/Fj+oUIse+WltAhY9wBxG9vnWNF71/mtrxILdmUKF2H2c+Nk
         ++P4EjCO/Hy1+HsYJYI8xvAE+sc+1Mqo+Dl4wWWz9RRaYz3JyVxbkLFXttmHosDN0eNu
         RxRp0shlUqg2fRImG9ILIr9ZQQ72+gZRjvoVop3kfv6QHn78LAHC1TEpPVUMs8XrRnJI
         RYaw==
X-Forwarded-Encrypted: i=1; AHgh+RrCZVjKSvBydU4+8u6iSP2PFCUJGMq1FSfSJmidIadPNIOCDt+k3edEmKtD8RyIGZxuCREVjxqoawZZtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQcEDFhc+cQ4GtFhCaX6uuslx81KkfYwgNpZTgUexFxmIsGgcV
	dXNY9f/AsJ/thmt/B+wRxe/ow1HWdS+t1VAt5tmHaxDfFumGsCeZxe5B
X-Gm-Gg: AfdE7cndGDKly4alyxE5AVM6Til3zCDl/VMo/L0s2QgNy6zhE9GTHifN6jQiTxtcQUZ
	mCCT8M9pCje+VQ5kRxh+JGTlgB8SRCnHXNMRl6oglweSnLsM5XAReURSSDzItiDc/3Bcsl2rrEG
	/pUtRp+O+Wvx5hxj5IWCXFL+mwm8ZsPLf28bKPE23Mg3NWXZGc1Sb/SjweiCL1E5JIeQOfsjZm3
	81shrRoKcumif5zfAsqZtsag8+6fhf606ALTvbLsRKv9d8difaMAaCxkAD6hmphgKw/tLBjpEgg
	v1/buZdZ8SrBlGBEws70ym5s7CpxMSiQFpvCCBHLTP8i1Mam0tsO5WW/O/F9U87UAmhYcMPpNWL
	NKnYKJn3X24c0eBWrgi70hrFGQxdkhdVwxN/5JFr2reGLmrGS/3So9+nVy2Nlp4MQjrL1OpVVIO
	ViL6TaPLnSRl7c0GXSSqcnFP7bX7zpc1jTa1S3z3vCecplvb0=
X-Received: by 2002:a05:6a00:3d08:b0:841:58b0:82bb with SMTP id d2e1a72fcca58-84826b8d0f7mr3442321b3a.9.1783401231339;
        Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
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
Subject: [PATCH v3 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:02 +0700
Message-ID: <20260707051006.20058-21-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

