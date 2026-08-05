Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D4B374E76
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941109; cv=none; b=YfCKy3epT6/lZajt99rxIj/9Fh+rIy9iGdGFDHLDXCPkHO8cdd3oNaNoaSaqXk+sm96Kqv64Np+s/BkAk+Kq1iVrHfdbz+NsKQchYGnCoNqMElFTK7CbtO8dux4xxd8kBpSaQZdBfLCBTbFzwp/Tp9MOz9Ck03emk4Rb9mwc9qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941109; c=relaxed/simple;
	bh=IWIxqWLChreh1REPz+wiPgkh4iJ/tVYEzkYS73BC5Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iaMN2toq3T0KmnCzZuK6MUm9e7S3gDSiAT1mqghO8pgZiFXnqiwqraoTLMCsVr/SNDse3DRj6An+smLlPbyQgORSdSiKpHRe1qGeMMEEpqDIRHKXY32PCoPIzgXtlNS7t9EDggaN9Ed5DBARQBPjltM6stttsPjolNkzBrAeocc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsSEs2zR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsSEs2zR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954dff6536so7734285e9.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941104; x=1786545904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6tKHCTLzGBd6z5Uglm3lhwjOU2WOgSW5sBwTzW4T9g=;
        b=QsSEs2zR4vsb4grTXGcXhrmRLkqRWYQJs+6Ck4osdAxHVrTGBZexmGHL8Egd+vicPd
         Fl5dPc2UNUjP/W9d4m/W/fkGz4gNDYOsw6TF+B6KwKYEaU2IQ947+9VvTq6SE0kqqzUg
         J+imTb/TDiUebd4MU9ke5Kq6T2KCd+9pGm/Ffntg5zdkngbg++DPdK/yGs/89sKFzTQR
         Cf0rPK5pFHzmIGKZTzhKWz0j9kh7fpnmRaLgbevOkP4DKvZIAN8Y+VlEgq/kXIa5u6Q1
         L7S+zWnUYE8jOXIp3DStFnt1cVXY1yuDPZtYnq1NRk64LtEenWik2klrQARTPdTJ56rk
         7qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941104; x=1786545904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J6tKHCTLzGBd6z5Uglm3lhwjOU2WOgSW5sBwTzW4T9g=;
        b=YI+7VmjTWANaOLM55n/mM5CRDJrhtO86/wnPvWTky1ViDlp4c1casjhM8+OSVW5EZO
         Vgfzmn9lRFOuS7FTOxZ0+ygXVlwWfNS/GAUjwnSHVXtoP08N8o3jTHHE0WqERWQs9YAZ
         jQPPmb082EjlazaLhyy6ZeW4roLYwqz+joMI3pAg6mT5ridtT6snaGT4ORl3Ny2wr6/8
         HlKyC4BqueT3vowHCp4MawZ/J8GKHzDyQSo9iCPTXTdsfqL5qcJgdSCXxbIn1PEi56Zr
         fkO5nemeaqL0I1pRkoY5z7xj8h13TgA3kcc0apXX4udidg8JzsRgE5x9d2lH4+oYiuom
         PXDg==
X-Gm-Message-State: AOJu0Yy07SaYjkg0AmqhjraCuxnSViDSRF7rAFJBbhVjbIceNxi5GQ8N
	leN/N4nIoUwOv7v3Ct18i4Q5Z0B2GTmjELK6+NmwpMaQBwd3nrd1pn+2
X-Gm-Gg: AR+sD11hkJhRPOrL66QIqoFy6J8zqETAxkOJqOM7sS7IxD16oXxgmq+mhwdgiJb8cNF
	XR/rld4i5NlCafqPqHM/QN3iPCNCYMTN+Esr+yib4SWsDjbTzO+D4j3otD6UqZ3e1Umh0hVbZLA
	s2AVdhepI7SPIZyXkg6x6kvHyklsAKrBZrY1aUq8afY+cc2aFO5szVzMDxQ5w3NauADzZA4sVRU
	igVWwnGsxhqiiCyFpq/qrrgxRT4Y1fR7+sG0kGgkLuyYtKptGyJ0iX7uH+qxXt2ZwhB66YpWgbk
	bInpC5piOCQAbevrJK3kQ1o1LOjEwBVwQLwcFv+1L1Rk8t2SgvRoMbmqL13aDbro9dqNqTJHazJ
	GPpqv+fzNF6ctUuKeQ8Mx7DrjlwcYozL8+bFi0lxnm3fTFKHE56N1I80qpChbrWNFD7xEyNtiFJ
	Eddm5x8ukt7frhmSZ1J3+80j5j+0xUhEFiqU9VSxTNjXgS7t9el0MJQSJAt7ezsl6od6MRTWQjc
	fO99H7ZHg==
X-Received: by 2002:a05:600c:4ec8:b0:496:cb48:5eb8 with SMTP id 5b1f17b1804b1-4994e7d9f1cmr85862815e9.15.1785941103604;
        Wed, 05 Aug 2026 07:45:03 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23e250sm10499376f8f.26.2026.08.05.07.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:45:03 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 2/2] soc: codecs: cpcap: set voice DAI format as specified in DT
Date: Wed,  5 Aug 2026 17:44:34 +0300
Message-Id: <20260805144434.1290261-3-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260805144434.1290261-1-ivo.g.dimitrov.75@gmail.com>
References: <20260805144434.1290261-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can have port endpoints with different DAI formats, make sure those are
actually set-up

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 sound/soc/codecs/cpcap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 987c63fc5fa4..fc41e1547bda 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1256,6 +1256,7 @@ static int cpcap_voice_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = dai->component;
 	struct device *dev = component->dev;
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
@@ -1289,7 +1290,7 @@ static int cpcap_voice_hw_params(struct snd_pcm_substream *substream,
 			return err;
 	}
 
-	return 0;
+	return snd_soc_runtime_set_dai_fmt(rtd, rtd->dai_link->dai_fmt);
 }
 
 static int cpcap_voice_set_dai_sysclk(struct snd_soc_dai *codec_dai, int clk_id,
-- 
2.39.5

