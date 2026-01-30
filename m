Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA92DF125
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769788829; cv=none; b=iQ7bDamfPIv7F6XG2JPSjbJlAwkuVGYnkBOohZ5evN6bzOCIrUIt2gS30uZbA9qn2BnW12bkxuCZWezwWJFRtdWeVj/GRyYiWLLjE/Y5xQRUVldAP+uOTCz5lUIWwYtf03JeJrKt6iz9fs3dGLR5m3Suq4x2rFWbn9oG3kwVPZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769788829; c=relaxed/simple;
	bh=RBrgoSUNHrSP6r7oUveiU4YfllGLynInEfMpEFi7gvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MA9sulmktiqeZ7FFDNFgMGRPevPhl9L+b/58exKo87qlaUL35PMHKXf1M6MTKGBqPidLXhY6eTEsaRHXyGOnJiz7b1JLpKDZz0vif14LrXUSXMXdalzXKIn/h06Y9UTr8aj5OkCn5N7yTVyQUzSTCPKmzuc9K5lLowJSEzZrfo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbOLw11w; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbOLw11w"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a12ed4d205so13646265ad.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 08:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788828; x=1770393628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaOcPVbSUZcGwKzIHU38fCu15A3dQzbZ+/11od8SUeQ=;
        b=VbOLw11wl0+6LhvkWazzUJnbP1ARp9GF6qKB4oHr8hGUyTYiJyM1CIVAjUUmiGZ4aC
         dtgpxGADRM4xg4wexH08jpRqxVSZHn2FypDLVuIwpxU8cQkU1nX/eeoIX0wnSm8FILXZ
         l0gOHabcHMGEZ3PUL7VG49WRJu/IkBNrVjW92f4ULNladGzOnXPUwxLknji6VGgEKNPh
         1PAw3Eh2NsvuCeP9C3HAJqTuC80fPfk6dPbeLnmwmc4j6GoHNTeIGZETIy3NrV+FPsOf
         0D8ZoKh0WjzAse7n+rbC7NaXAXWEb3B3RZ7IN40G4aWfj5TpUfM5PMqDtxkRPsPe6DIY
         IOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788828; x=1770393628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aaOcPVbSUZcGwKzIHU38fCu15A3dQzbZ+/11od8SUeQ=;
        b=iRB8kta2tbuLuZ+O55qr2B+C7N/v7d7TpAn5CUUCjbBa68krGTUTLu87sqevtGiJc+
         mzkCLj7gjpy/D/auuWBGv/WIWkisuneXMDEzkKq9UuPygRmINEGe91JUbjnyFxt1/UTX
         ft7jKNU8eIkqsoZQokxFajQAsx81/jCqI2cXV4S4LDjyMPJ5W0ojtDyU7QL5Z87Pa9qn
         GV2DNzzRZVqgYAAezXQsDWl5knQU1LNzMqPDVqH3VHwGBvrmZpKaqAA0ua8HCgYYKDoN
         JtR2Y37rF+mFwYn1Fik7EOKN6pE/SZNDbew3PWwAyD/EK1H2VxEmhWiwv7+TpzfrQKSO
         q10A==
X-Forwarded-Encrypted: i=1; AJvYcCWNu7c6IrkENQfUQGwhrsNMq1ezgMI92C9nIVFrH1u33Kc3MmMt0vVZdRV/4uIKjSZiPieBzbBDHN+hVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfahyy/I30las/wMiLAB+0Z8EoPdZYU+yuZdB82TFiABo8cQV+
	whiffvNnIMB7151xCVKliSDVgWTwqj+BdgQ2ME8prVGIsintoHXxt/Zs
X-Gm-Gg: AZuq6aIHg0P3ElITJQTuKxitQOZJTIu1yAZAEXCv9u0D/JjTa1FZq1w/oIZmKvxPTv6
	gwRYzgRWdziFgTJxoSZPDeDkyVJUOEHz0MWTt5I2lUpxDNlWT3Y0oFXeUPSySQZ+jgYkts3S7J9
	zeh13BQ09rJHMVRw090CShbM7mWtLjgF3vDoSY52q6qzISkd7c3+ovFq1BiulS4gWaY7LZZBAMN
	jUhCS62ybLWnKkgdN2/lygkmI9U5fkKxDMQSeYeoSSfPz/qceGG4WM83H4WfYVaJCTTxqOeoVj9
	H8mijTpKxyFgcZDv326Q5JHuisBRvaV/b7oy1Z9gWpa6MNtFo8+8fyLi0+ThJNJVDcdMd+AbPvx
	FN5d5kh5Msy+zonuXDn6rcrNV6zRDg7o413vxHE5TFTIoyvZ3f3wRoGZd2KmuApIjfTitL4Nbyr
	2CQ64BjhLtbqBMJnl7k7CqB8Fh3XUbP1QHzArPGMH+w7Ttc0aRB349mgu0TtX4n2MWZDY0uAc=
X-Received: by 2002:a17:902:ef06:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-2a8d9939806mr30418165ad.47.1769788826832;
        Fri, 30 Jan 2026 08:00:26 -0800 (PST)
Received: from LAPTOP-LUFMQ4TC.localdomain (118-161-168-35.dynamic-ip.hinet.net. [118.161.168.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5df0desm82025645ad.82.2026.01.30.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 08:00:26 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 1/5] ASoC: es8328: Fix DAC deemphasis control handling
Date: Sat, 31 Jan 2026 00:00:13 +0800
Message-Id: <20260130160017.2630-2-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130160017.2630-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
 <20260130160017.2630-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAC deemphasis control updated the hardware before updating the cached
state, causing the previous setting to be applied.

Update the cached deemphasis state first and then apply the setting.

Also check and propagate errors from es8328_set_deemph() in hw_params().

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 sound/soc/codecs/es8328.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 38340f292282..46868b7924a0 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -163,12 +163,11 @@ static int es8328_put_deemph(struct snd_kcontrol *kcontrol,
 	if (es8328->deemph == deemph)
 		return 0;
 
+	es8328->deemph = deemph;
 	ret = es8328_set_deemph(component);
 	if (ret < 0)
 		return ret;
 
-	es8328->deemph = deemph;
-
 	return 1;
 }
 
@@ -530,7 +529,9 @@ static int es8328_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 
 		es8328->playback_fs = params_rate(params);
-		es8328_set_deemph(component);
+		ret = es8328_set_deemph(component);
+		if (ret < 0)
+			return ret;
 	} else {
 		ret = snd_soc_component_update_bits(component, ES8328_ADCCONTROL4,
 						    ES8328_ADCCONTROL4_ADCWL_MASK,
-- 
2.34.1

