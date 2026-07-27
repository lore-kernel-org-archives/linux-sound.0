Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E23F4104
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145383; cv=none; b=TsM4dwOWPreNkQituo8kUOSgfyr42PougGBUBzi9Aiaktp8NZUgzg4PjIBPh6CCBvNSh0PlEF4lo9nV2OOt1R7qCzOhHTg8tLhnDez0xv5lZjEJh6ZNZgOAA/qUNKx0MrFT33u110Ozk3MNjMXJ6lPq0kEry85KLFX9dMoFDdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145383; c=relaxed/simple;
	bh=CR/lpIz867Ge5SfVg0BgnctkBifwpEVSwmWaNcKvrvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/AVS4Z7gcPF+6FqLS0XpI7ki0X/ag8mjEG9O8gYNCz538OtgbPkPGVndgqqyc/CqZXML5cL88TBoEo2GIHml7ymX5jCTJQojFEVZDO73IAvSG4hIQcHdnPHBDuSMpyER2WLNbKNeKZZe+gNrfhNy6T7TmPm1aBSya4O2TUloo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSda0Q3q; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSda0Q3q"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2441969b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145373; x=1785750173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=bSda0Q3qT4RWQcMU1f2socxFPzSoCmRVoHMaQ8Icr2YvA0VWEe+BCd8XMvCJOMY+Xi
         WUfnwQ7qcqvzPGaZxaqDxUwvjjhRmYfDn1Yynvi1PZ8LcF/OMKM3dkNXdioGGcxtjtCU
         xh8oHs8vvSPy35xlc8gsqAXT3rQKDFaK5BYaB838zK3hwJXW7qC32SmMFLkSF64MUw4o
         sdZSjfK5IsTmS/IVoVaEffg29duvi7LdtZO66za+3f4E2yEjZs9Di9kS5ECxa279CCYq
         YNhoQmqyMAqpgLZmgJTiPaNZBg/9o4bz77i51qhjy02mv9aVwV7J7kUXP7dsqLqZ7poR
         xMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145373; x=1785750173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=K1wf733vWs/p3IWAw0RatR4Hv0WmpVeKOw4ON+K4Aa+EJPdHqvH2ugZptEGTcuKX1q
         2WbJcv2IQtUHqGUS6WDxPzR9/rVg219Qn2TOaNC8kbQ8P6EIQUvu+ICLsSMmTVhxXuEX
         KcqIOHhuSenvMUer1BV7Sg4eDov6TJ21KlpJVJlRMj+YAc7kuv9za/a92VmjINSClWjm
         29fiLifrGxTRBVRG+74E4cfI/vfW0LHeQ5MasmMb0Hcc2RrC9z9opBBBynWb2N/lUxur
         1vXKgj9x3KnAZEfaoVaS+0rI4DIn8GM25f/qrp44DWPjVhRx+UtKYbxFQ/B4M1PQkuiE
         IHZg==
X-Forwarded-Encrypted: i=1; AHgh+RpHtJWQ/F/ocClsLOIi6voRHkd2HIlVD92XfPkEsaNaH5muBTnqyv7mknNi2gLoJhDpLqCuJ7n3wk1PqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydByuIC91SoScVRclF0X5LflfdFbdL0mqLnK8pHtdeBWUYjvtQ
	dO91Osxu3SBybXYajtzOC704875FvCl5UYYjEDfGAnWTzjqQaehxIYWo
X-Gm-Gg: AR+sD12Fga0+yHJCtn18smSfZfvNTEQB62oBxia1y1DnzvQKI8uvfI06iKEJp5GAR26
	EkJ6PbBxQX3jCevcczl8MKQm+ipRe+p86AwF2tl8QgoiGhD9TGNKwZhbAN5igxuPr5kQGcrN0YQ
	GvW8g+Gl/I98GmSY7/UzeiDRS77nN/oFbDIjvCIREQ6QazG5YWaPuu0W3I2jXx3MS4keI+1ItTn
	rH5jb+MioYV91BmcIFl5muUcaMfr5oJBjtwjDYqCVr+TUaroYIK8M9kNun2gYdKP75qMb4hQd/5
	okx7zcRu1uMDHFllCKeJgQtXlxfSyZ7wMBd0P2FjR9mDxxHU0nQJ8cY5nusUo/jlaI+xOk8T+ee
	YCCHWRjqx6PwDxpdStPZ7CnJcpkyo5uXNOMEbfVdxTkoT68fIzWU2819T2yICqlIELyTobpt7ud
	GrKxhxtZzfd0TUmtWkMgdIaGfurDsT6flL7TFEf6Er1xML3c6+G1nPYYtX8DShghVphDTR9qVQM
	BX5NilTAKnG7Hl3NT19aA==
X-Received: by 2002:a05:6a21:2d8a:b0:3c3:a3f4:5485 with SMTP id adf61e73a8af0-3c67d9b1dc7mr7512589637.6.1785145373092;
        Mon, 27 Jul 2026 02:42:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:42:52 -0700 (PDT)
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
Subject: [PATCH v2 05/26] ASoC: codecs: tas2783: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:25 +0700
Message-ID: <20260727094046.23001-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas2783-sdw.c | 60 ++++++++++++++++------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index db58c50e8a83..8ebed797acb5 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -12,6 +12,7 @@
 // Author: Baojun Xu <baojun.xu@ti.com>
 // Author: Kevin Lu <kevin-lu@ti.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/crc32.h>
 #include <linux/efi.h>
@@ -693,12 +694,12 @@ static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 		return 0;
 	}
 
-	mutex_lock(&tas_dev->calib_lock);
-	ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
-					 tas_dev->cali_data.read_sz);
-	if (!ret)
-		tas2783_set_calib_params_to_device(tas_dev, tmp_val);
-	mutex_unlock(&tas_dev->calib_lock);
+	scoped_guard(mutex, &tas_dev->calib_lock) {
+		ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
+						 tas_dev->cali_data.read_sz);
+		if (!ret)
+			tas2783_set_calib_params_to_device(tas_dev, tmp_val);
+	}
 
 	return ret;
 }
@@ -927,22 +928,23 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 		dev_err(tas_dev->dev,
 			"clear latch failed, err=%d", ret);
 
-	mutex_lock(&tas_dev->pde_lock);
-	/*
-	 * Sometimes, there is error returned during power on.
-	 * So added retry logic to ensure power on so that
-	 * port prepare succeeds
-	 */
-	do {
-		ret = regmap_write(tas_dev->regmap,
-				   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-						TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-						TAS2783_SDCA_POW_STATE_ON);
-		if (!ret)
-			break;
-		usleep_range(2000, 2200);
-	} while (retry--);
-	mutex_unlock(&tas_dev->pde_lock);
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		/*
+		 * Sometimes, there is error returned during power on.
+		 * So added retry logic to ensure power on so that
+		 * port prepare succeeds
+		 */
+		do {
+			ret = regmap_write(tas_dev->regmap,
+					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+							TAS2783_SDCA_POW_STATE_ON);
+			if (!ret)
+				break;
+			usleep_range(2000, 2200);
+		} while (retry--);
+	}
+
 	if (ret)
 		return ret;
 
@@ -966,7 +968,6 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	s32 ret;
 	struct snd_soc_component *component = dai->component;
 	struct tas2783_prv *tas_dev =
 		snd_soc_component_get_drvdata(component);
@@ -975,14 +976,11 @@ static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 
 	sdw_stream_remove_slave(tas_dev->sdw_peripheral, sdw_stream);
 
-	mutex_lock(&tas_dev->pde_lock);
-	ret = regmap_write(tas_dev->regmap,
-			   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-					TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-			   TAS2783_SDCA_POW_STATE_OFF);
-	mutex_unlock(&tas_dev->pde_lock);
-
-	return ret;
+	guard(mutex)(&tas_dev->pde_lock);
+	return regmap_write(tas_dev->regmap,
+			    SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+					 TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+			    TAS2783_SDCA_POW_STATE_OFF);
 }
 
 static const struct snd_soc_dai_ops tas_dai_ops = {
-- 
2.43.0

