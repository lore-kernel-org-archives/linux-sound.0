Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14F93659FD
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058230; cv=none; b=oXktY2QhV43PyN08Putpayb+rrKVZLmHUavLaB6sy3ux3aWguyqzg5J/EAYCT5Isi5bS+LCfTGGz57uuLaZKfJztQGxeHex5ibvXB/xFrXpvEdmPIG3dBvLTQILSf8DOprvZoVfooVLrUFxH+s2wY9WlJyStYbt0mNWi19jwxnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058230; c=relaxed/simple;
	bh=AZ+/sprSGNWOJL5QjLJaSpFH0m8wxH+sukCBtJYoNfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcMD2Valq0LEUXBfU+PzMaYYG7Todsd2wFo2o1Fg0ihhc4gIwdncSp25JSt9JPsfU9glUzBIg5ftrNyHYRdVstW1IrM1iAVtmdeQNWK8yyx+KnEvuWlE5uxKSDC1k8xATjD/PDLXfuJh+WRU4+QOOlahwnHUaID0pGhBYTL6uDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r35p3ARY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r35p3ARY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so179212b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058228; x=1783663028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZrDdEV0nAN9w+kfhy3H3xNzSuMWcMiDn5csKMrOHzc=;
        b=r35p3ARY26dGZuRXtksQv5IIXKkVgSqVFowdBjv9/zWGA9lToj1x1c7+619u4xCPT3
         4SY8IsGDIQK+2GkUOuEg1fDRlO5K7PKDq1J38EoY4NE+XBEyGdwqsrFE80KyYN04JbV2
         Lim+fhfc9/GnzQsfHqdiA5/hmZ1P1C+FMlj2cUgy8RnmcztzW666GUX29j09M2/mNyyc
         jkVvyAt2exLl308C/UOUDB89PXG3IrDYZhEdMVddPRevf2s+DEvMxHZ6w+9c69jjy6bu
         5rYH89NN0xU1XEyn1WUeTMgk94Qq5Yj+fzpVs9khtVreVMjYFPBg7p9yyCDs2wo2JA4P
         9Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058228; x=1783663028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZrDdEV0nAN9w+kfhy3H3xNzSuMWcMiDn5csKMrOHzc=;
        b=IPWGyXLVncH3R/3TfpnlZ8lubLR3Q4Mg72SBQebTslFZCdl6JMN3bKjhqyvC+83NIb
         tK1cpMG4QX/mtGuoEah7OqZ1k4zW11VLh2lhlIV4f8bo6srBh1jSwPFPxGhzO6gHcqDx
         7MRgKeuUKn3H26e8/oTvlMZWoor8ntMjOrMp6sHYwc4y0/cgMnQIFEoQee+rMAx2bK8P
         Nx5zmZfKrOKwSxg+YeMuS4wsFC/zj5OpPiuhz79YyvPqSdcs+O4gQ/UhfMD99M27ospA
         H/DWy8NCYSz01sxk0mb/mLWyMpt2vrJhx/1b25OQoXmd2kcu8k0sOfMtdtzphMk3wMII
         2oPg==
X-Forwarded-Encrypted: i=1; AHgh+Rod7+1BPYO8KFTKQgqd4FIu+w0u8IysKKGvVupomNPDL0AbPWWmdjpp8ELb7VnlLUVwgJEBPMpTsPec0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeOydybIizCai2H0OM4f6Sw0GWW9I/pGHNY221bKJZf49E765v
	8uRgyRZ90VAGs2//QpSIKa9aNXSW3BCFDt95MniqHHhHdF3RwxdIqp3E
X-Gm-Gg: AfdE7ckIDxh2k0fjLNj8jmbsTkSicAXdaeqXk2RyV6mVp7OBVmKzt52R0g8lZcqWXow
	9fGKXig4PneSxllwi3hR2QLm1p+ry+w9RzcTbLWVZ7lI6pZhAIkcHZyH+mrkmqS77H+o350kVZQ
	LUryYHHI1crbHf3oFJNDarZdYv/9jwCfb76RB3jmSXioazXmq4M+CIVLzpaKbBhKDXV8lUWFj0+
	UT0sHV/mIh4/lANpWhpW/NS4MaxhYy/QdXTXrldhhVwdks3331bEiME46GRvcsdTj4yBBg+MMa3
	3QLrSaII4uXg0cNRqQIscHH7lWZSWAeZMZsMFZHBTL0ELmadzHuhFt41KL5arq4kMnwsZxyWLSo
	MQtaoaqNqW89zcIWgluCP6dy3/gaAURuMxFvNPYuKgfuO2QD2Qwuksxqc+VWI08sEHoPEY9eD4k
	WDQ+ITOCQdcGUinjJdXvtlfLN+2hX+EDZc6iQ4/jiuwPnkmfs=
X-Received: by 2002:a05:6a00:1708:b0:845:cf86:947e with SMTP id d2e1a72fcca58-847e18f5069mr2725220b3a.27.1783058227975;
        Thu, 02 Jul 2026 22:57:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:07 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:49 +0700
Message-ID: <20260703055355.244898-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

