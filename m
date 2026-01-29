Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1A3542F9
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 17:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708892; cv=none; b=dk0ZcSqmQmuMNIkwwHliea62HTvIchQHlfVfnmCLX3yqI/oVN0sNNOGZ2JxVp66mu1zmCe3oCuFHlrVZo2FdgtKKd0ATAAQ5jaDgX8IjaBchR8ugLyjZaLO+kEXj6yZdwtz5DBFr+ZMVmR20KTU8GC8U6JoQvXS2H1KCXEjpXGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708892; c=relaxed/simple;
	bh=RBrgoSUNHrSP6r7oUveiU4YfllGLynInEfMpEFi7gvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gWOScGIhisJhC0YGT21//YMenowNwWgkpXSxkXtgZaerfc4F26LMfyFNQ225X7yXYqoiT9sZtKDBZjIUJsQrW/Y4KP0wAnpbARa9igzCj4sft7UxHBJ/q/MgQlDzhmQk4sdrMFRPEL7PKKJ65WScEDnwdvkX+/jEtK2Ae4Z/LxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLqQCuXl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLqQCuXl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a12ebe4b74so14488415ad.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 09:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769708890; x=1770313690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaOcPVbSUZcGwKzIHU38fCu15A3dQzbZ+/11od8SUeQ=;
        b=nLqQCuXlFGkO3Nm/c+X/7gNmksK/zZdXf4yeGBeiapSUskkU2DgCzCtuDKXBCD18hI
         5NSJCyhP85wseCptOD1rt86WJdmvI95UhID0vQ0ocsh33g4PEk6UFme/d83wcL4Ohn2m
         Deijp47Syu02fQ79ESWyHVMWa9UkyEIL04ibzy0B6U+dpPSIxDuKc6ieWD67NH/9O7AU
         NbIMDoHcJtEVAXyKeel9NMvB8fz3NHlNzkRSaSu55aTYNQWcUHKYVL3sZzA5Broc49+l
         Xpg954DdeZKPvlnRZmrcE8YdVBCwLiHdMBkzGSeUzMrUTlQVjhecw6zCCDTNANSmc82p
         3o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708890; x=1770313690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aaOcPVbSUZcGwKzIHU38fCu15A3dQzbZ+/11od8SUeQ=;
        b=bY+ABFL/3g3foMM3clXNXvH/zMAqUHKrJh1r36O7WenJQCdDRfzVOXax1u0BA/0Mtu
         v2jau411UXwdYisTKFfSOsdRebAy3qDNRMmHQOXqDajnSJd6ci/wK7fG3YLGHzIDo/YS
         AKPHJDD87WMS/BpAH3NDbMFqz+m6O2BPJcxE1d2+D6nf0tqK1va4+J5c3lSCb2VL/BVY
         xCgMRXYJztF2k8zuQMa8nrY/IFgEhuR0FcyTwQCQH/QNsKdsKjYleuWJVwMPllQpxkWG
         VaNyG3oP+jT+zSEvQuDQMfWNxHIKc2fKyw9prujxSA5xfGAcS2VpLpSI8pA+JLa+MIf6
         JdUg==
X-Forwarded-Encrypted: i=1; AJvYcCVKcXMwaH8c42emt5b7jOsvPyhWj6ad6hz+azoUlUmEmlKT899cVM7+FqatIxAxnQp9eyjKVt54fOi2MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQtclbL49zWbqNkVmPEI8875Rar/Op+yktvOiNH9PAAOc5t/Tk
	GLoRp8I+/gmILNiTpNJt7pze40rQH1UqLCcADl95uCaSpxzj5Uu2C81S
X-Gm-Gg: AZuq6aLeDJUx2kniiNrQ7qcYVlnsXD0Rctnr0hUy6PpJCDJq1Gwe1EucQYvba9edsaB
	pOfXXNsrb4axHisq7P3aAGtEKJVLXyN9kupSsMNmz+fWlp16A8mVjlXyWKYI/e6tfsKOCZ38unA
	FnVESko4ktTNFhCMhlZKuikK7uN72agNOsTZTBATzxkLUjTC4elOtqyWlj6rrJhR+t19krLpvmy
	vicwAYu+33pcVVuY18uxvQI40zPYpzimCFDzT5IsYBOX8vVyliFYExN3u2MlFxbbcnhbi1ih0zZ
	CmfJPR1nwZjaIG/g3cK/vdXsosjj4iN+1kR0wizslCTwgf4ZJM2GtS9PcVaqxzh5XcyiQutaU/i
	I7aTulRsq34Qd5I8A9cYIOziuVX6BcDEANIUuFvyxUdYFCWwUybswZOEuwKS8DhyBf3W3Ymc564
	SgSDZpXBc6J9V3VgWPDOjwf03R/7LphAr9ERK5Py/jzeY7MmHg59MEVInpoWHzKEgyKg==
X-Received: by 2002:a17:903:1a88:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a870db1695mr105100035ad.21.1769708890037;
        Thu, 29 Jan 2026 09:48:10 -0800 (PST)
Received: from localhost.localdomain (118-170-231-131.dynamic-ip.hinet.net. [118.170.231.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm53978655ad.63.2026.01.29.09.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:48:09 -0800 (PST)
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
Subject: [PATCH 1/3] ASoC: es8328: Fix DAC deemphasis control handling
Date: Fri, 30 Jan 2026 01:47:31 +0800
Message-Id: <20260129174733.6660-2-hungen3108@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129174733.6660-1-hungen3108@gmail.com>
References: <20260129174733.6660-1-hungen3108@gmail.com>
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

