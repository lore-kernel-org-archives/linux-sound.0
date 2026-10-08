Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DA34A4828
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465023; cv=none; b=dm9ljZ7x04oNfulWEVZbIGQML2/g/rBcLwbRuZgohSLKbpLahYP09azYu21brunpQpk0QVbvJ6+O0gsYaYmcfGQALMSl7Gyz9k6iIKkmS3AbGuzIsm8x8sDJYACmpR6nMxIJPc7IAKRlZQPx8v19tKLcI8luvzhAuCLirBUlo+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465023; c=relaxed/simple;
	bh=YUlGiS1jZeNHsFEGcCiYFDgEtUvaG1Q4m1i0PNWHCQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVKERVnnQdULRYKaO0sCdsPMAu2DidoaJMY2qplQm22SRFg8nc7JnE/s09NXmgbVhbmUWrrbJ3otc48foOve2KI5Ajie8xS2nlvi7/KkxtG9lUEuFKN8P9coBRSuAmecOa7LtE18XIrtylA9blJcUo7Jmf8PfTec7WhdkvgRrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iau03qP4; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iau03qP4"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ccc7a6070b4so1536213a12.0
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465021; x=1792069821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyWxBnAVI9qXIp/uzV/KvaCBjoQFy5tL1Gd9TbfdHlw=;
        b=Iau03qP4LgAKnEsfnbx5eLLpn1pHE8LY4hh21LPOpBQNvMtqFCz88W8YlhQb9Xwi6a
         OYUYomyiWZ3Vxk4Pvx/Lizs6keomAQ9a9t8B+cY1PzVZTtQPCR2zvZlSmEeOm5AqagGZ
         0GQYPIGGQz9PWaKz5hojOU60KrGbgUtyzTdh+EzpQNhWeIUsC7EnYbW9omqmLY14tt71
         ncRTY/wfJijSQdpOxZhdv7RxQAAsTUu64BeUXm4v2JBoxpLp4mRy4luEWaPKdDLrSA2F
         +NkIua310axyI7Y9PbeWN+r1zkLPrtp+dm19sqnT/CyoVl11D6Rn4aBbotwmT4nGUzwg
         OifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465021; x=1792069821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyWxBnAVI9qXIp/uzV/KvaCBjoQFy5tL1Gd9TbfdHlw=;
        b=JGHthSpQJw8LQx6MwmViFDj+HJRX4J2W8QSoLfjO+m7XQKwY+l4hi12Nrj9Dg2xu46
         my55tq02rXOsxVbfD3hM/X8TyZkwZW1KOEhvV8xIQwjquEDgc3cBQ7k5BiTbJ8ogrV2X
         +zRDSRhYoWhEu16viL/u0h+n3nhTh2dnCorFn0O/qaCEjUQOWsLY/PQVxBpP2ijkokfC
         IqeRcglizH8muJGKmoTCOcRaxVf+CwhdirvJ1oPi2VO2VZFIzIrZS6/Wrbv69XErY46e
         nmOeTh7VPXCtLGByoLrcnkPRABf5Y9Or2Xa7mcbYD8BUEAYU5//gvifbBr2+x0mhRK9e
         vqYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRao7SHVdk1KKePxgQMhpvcNib8px4lbQKhTm0h12/pg0j7Q+K/DPAfmRdRa2buV4qWsH9TdS1o98AYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kDYsNW6oPA8/OE+0e2oi3W33mCZgdFIsIfd2GaA2L5Io41v+nA
	SBl6iUC4fS91ZLOKNNSRtoAg5Gdj3gxOd4OMVXvT4qRgwhumHbyWehRh
X-Gm-Gg: AYBFou0xD1IZ/ZCm3MyrbjqYaPuhnH35PnGfQC2jfbyWHHcl8h+2MAjyzU9YwG25g2M
	wc+iLk4sD0MbEGGW0qbOWt6epbWrhhJDRknwyX9/Q9zPbomGS54O0B1Q3YJt8aw1Z4/fBHr7m9c
	QXXcxLlCe6gD00obnX/pjraV8KXLc0VKE2HNTieE1QZRdNPHRmtAPfuizPaz+zGmW3I+uJ/11hq
	G2R/zvQioiziW9XF0qAKokTz4MPOJ5cpmQz3l3fWOyYu3WWttDxPtQ4FQWkwzum07u5C7PC5OUI
	w4/fhTUqBSo+Ley8WP7K54hVqZnx5PtMBbIhlIlvQpG3IwbPdaKr08QrdEhbQ2bAEpxm+60/hWD
	fXV2CHkoCOFuWAi0zjxWfO+/DRatqqhK/Jhox5WrhJNNP6zTdMtUnGWN8Eb9Zv1FodmtmqIXob/
	Qt+ZW2jZglp7B9y08+4axA8Qhy5N1A+snq+NTMkUJEWSqQdHZ1MeQGYTFIYGKrebkGx1nNeIDh0
	8sNeNcH6nerSvs/tb0ZEUaidwJQynIbDRkdvHpqvN4hL5fEJPgd23DfmejGG3VJy4/gzCuVVow=
X-Received: by 2002:a05:6a21:608a:b0:3cd:9f0b:f7a2 with SMTP id adf61e73a8af0-3e133d9936amr4172038637.11.1791465021437;
        Thu, 08 Oct 2026 06:10:21 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:20 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/6] ASoC: max98371: Fix the Speaker DHT Min Volume bits
Date: Thu,  8 Oct 2026 22:09:50 +0900
Message-ID: <20261008130953.2446692-5-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register 0x31 holds two 4-bit fields. The datasheet puts SPK_GAIN_MIN
at bits 7:4 and DHT_VROT_PNT at bits 3:0. The Speaker DHT Min Volume
and Speaker DHT Rotation Volume controls both use bits 3:0.

So setting the minimum speaker gain changes the DHT rotation point, and
SPK_GAIN_MIN cannot be set.

Move Speaker DHT Min Volume to bits 7:4.

Fixes: ca2cd6bc6663 ("ASoC: Add max98371 codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/max98371.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index b62bd98f2252..72bcdb0d1289 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -166,7 +166,7 @@ static const struct snd_kcontrol_new max98371_snd_controls[] = {
 			0, (1<<MAX98371_DHT_MAX_WIDTH)-1, 0,
 			max98371_dht_max_gain),
 	SOC_SINGLE_TLV("Speaker DHT Min Volume", MAX98371_DHT_GAIN,
-			0, (1<<MAX98371_DHT_GAIN_WIDTH)-1, 0,
+			4, (1<<MAX98371_DHT_GAIN_WIDTH)-1, 0,
 			max98371_dht_min_gain),
 	SOC_SINGLE_TLV("Speaker DHT Rotation Volume", MAX98371_DHT_GAIN,
 			0, (1<<MAX98371_DHT_ROT_WIDTH)-1, 0,
-- 
2.43.0

