Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D843A59AD
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594656; cv=none; b=b7/bo1fXQ5J6LixS3uHTVQPEwoh+0XlJWv76dXPTiTpjgSpEr5sTqfLPrFc9D04TYmea/skxecX8znLa+EMU260UEQcgJqezIVE3slPsVsBreKIaFda1v+jUzgW/hY3prFI6/8lOXudJr9+BdQfxaqZQvwfgDOmwPmzxbr95YGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594656; c=relaxed/simple;
	bh=8I6fi74loWUHKZ3hiYLi1xwooOugxFYoYK70kIaZpOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m3TDEoU4ck/fVnsfmt1O9B57XuN/5lKD7VKWm8BhwH58Y6Em1NxguZoZoSvRrp942udnofmhtivddByUxKU82B0PpbfgTMjFvg1onQb/zgUi48exc2xfbCAy7UPx0xj+DKG+2Xu8+39v7Yo2x93jIvy6nifrQ2V8tIt9eNgXI7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcRJt5mF; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcRJt5mF"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b4520f6b32so9627084eec.0
        for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 07:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778594653; x=1779199453; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cIylp4OsOSrKcmib632OACEJsu5UwQnidt2a4e2Vgok=;
        b=jcRJt5mFp8TRmYRWrHZVs92SYPLGliVqgoNmVxGPvNRJd4a5ISXMcjIV9h1QPg1YDj
         4vxFO48D54J9FT4t4r7PXKPFR7H5Q34AtZTZXoVJ7K3DbRgwN8S9UvYYmfiNDNJkGzsf
         KrtUVKFoGnha/2EQ6t173eEZ9Uox60rUxVT3YC/YWb5tH8bDEO0sBfIVZX6EYMtAOGh3
         qoJ6nMyF4AhGpOV0HOIX80JsmDZmiM/LlQiq8SKmVYjIkZVNTS2UyUzno/19cVh4Pzp2
         s92Ffa0vfzhgVH7167S3NibzWlT0CwdVGhImCECi3mfBz6aTSB0KBwE313zuFHDvgbU1
         Oh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594653; x=1779199453;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIylp4OsOSrKcmib632OACEJsu5UwQnidt2a4e2Vgok=;
        b=n3OkKmrdtz/V6wKI6wbTqIr6A3xgWhKhYDaEjNn05V6SBXMrbqIFQbiU8fyGhmzKAP
         0LygwCWitBE5nvIrA016ZdblmW4GV5918gJ6fGRhpH+57yfcIp7rksEc21A03MAlnUmR
         3xxYLVzYyUtJgLTED9ywr7giJ7+t+Ok87DS4gZ0mdOTJlekZx2fCu8t4Vf8EC/41MDn4
         xH78a0bUusmqz3TNWXTksMZtOvkaSTqES2FEk1VfD5CTu/lxO8JViq2GSnBI5ZAiHZ2u
         TPZGfu0A70VKmZWXwiSJz746zfcXeC41KeiCSspdOytFQfTXee5WFl/t7L58lRt/xzwR
         /DtA==
X-Gm-Message-State: AOJu0YxpTwpNa6SwGU6pUBqUb1lIBd38JVT2DRz7bEPZoAVNgzHte0dQ
	cTS0izO1745pvMiyyNq7QDAIocHRfx/YJ/GXLhlMxXZ3ah4a4ujKGNoZGJrYffu3
X-Gm-Gg: Acq92OH9NdvNozBRQ/EEbfTjec7vDp7eLMxmkCaCQSKIe9qryMePsWXKmo8fuThmo8+
	RMK1M0iH3p+dPWb/YTV0gHdkGZZjreK1DV/eQzzirBLWxBBwRCf3edgrwbxJSBKRDYMm3xvfnWq
	pSWWH8CyE5Gu4M2LOb3c2qYvA1hK34LEBxQ+N+APLpxbmal6OS6VJVJ5/XxOSBlEX57Ub8LqLTU
	LvxMOYUoIe6QDSKNPyIHUWx9J18x347XbWLvJYVw5vUbI8uZPplcBJ8bXP84kvRiuHhjcDqbOwI
	PWzE58y5uOsiBPk+BRPNm05ol5MKc0u9CqB7XJQwzNjyC6RsMCw846KVIdzty90Ihj1UC+uM0wS
	3P+X4xT7O6ZImu7rEIITpy4Bmf6dRl4vX6QEnnj2ydWFhikVXEbkWZpsMQluiTvx4IxWm+qt07T
	Pn3N567Nf6fB+Hw2mhRJZbp+hRbCGgFItw6nfnX7FOljiFd/c0u3JiVf2lGvP24mdNYGZXnEnXW
	A==
X-Received: by 2002:a05:7300:a987:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-2f54dc8c2b0mr13570569eec.8.1778594652981;
        Tue, 12 May 2026 07:04:12 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm18203043eec.22.2026.05.12.07.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:04:12 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 12 May 2026 11:03:53 -0300
Subject: [PATCH] ASoC: sdw_utils: Check speaker component string allocation
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-asoc-sdw-utils-spk-components-alloc-v1-1-c9bbd6d2e123@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTuQRirGq4iLOJ3qaExCJlWh9
 O5GXX48+N8CykVY4dAtUPgpKik29JsO6OrjhVHGZrDG7sxgHHpNhDq+cK4SFDXfkdIjp8ixKvo
 Q2jxsHfduMntvCVopF57k/Xs5nv7W+Xxjqt80rOsH2hQNh4cAAAA=
X-Change-ID: 20260509-asoc-sdw-utils-spk-components-alloc-539e19f08a2c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Shuming Fan <shumingf@realtek.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=8I6fi74loWUHKZ3hiYLi1xwooOugxFYoYK70kIaZpOM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFnMxpFc2ye5n7NmKA5SLHQ8lzi9X+a76f9VM0v4jolJt
 mS0L/HoKGVhEONikBVTZFmdtMhyT9eDq/VxKzxg5rAygQxh4OIUgIl8YmP47/HvIcu1Y6/XxvwP
 XunrK7S77UTVDaM5EyYt1y+/rhzRuJvhr8z/Dvbj1rarrDfW86/L2b1dLlN5mk7UhskPJ+Ytvnd
 mCR8A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

devm_kasprintf() can fail while building the temporary speaker
component string. If that happens, spk_components is set to NULL, but
the current code can still pass it to strlen() on a later loop iteration
or after the loop when appending the speaker component list to
card->components.

Use NULL to represent the initial "no speaker components" state, and
return -ENOMEM immediately if building spk_components fails.

Fixes: 0f60ecffbfe3 ("ASoC: sdw_utils: generate combined spk components string")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index d8378d1b435e..5f4cfb2aa9d4 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1265,7 +1265,7 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	struct asoc_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
 	struct sdw_slave *sdw_peripheral;
-	const char *spk_components="";
+	const char *spk_components = NULL;
 	int dai_index;
 	int ret;
 	int i;
@@ -1348,7 +1348,7 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 			else
 				component = codec_info->dais[dai_index].component_name;
 
-			if (strlen (spk_components) == 0)
+			if (!spk_components)
 				spk_components =
 					devm_kasprintf(card->dev, GFP_KERNEL, "%s", component);
 			else
@@ -1356,13 +1356,15 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 				spk_components =
 					devm_kasprintf(card->dev, GFP_KERNEL,
 						       "%s+%s", spk_components, component);
+
+			if (!spk_components)
+				return -ENOMEM;
 		}
 
 		codec_info->dais[dai_index].rtd_init_done = true;
-
 	}
 
-	if (strlen (spk_components) > 0) {
+	if (spk_components) {
 		/* Update card components for speaker components */
 		card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s spk:%s",
 						  card->components, spk_components);

---
base-commit: b69796b4e3f78b1c41c0e6f558e882ec095469fc
change-id: 20260509-asoc-sdw-utils-spk-components-alloc-539e19f08a2c

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

