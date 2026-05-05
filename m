Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824FD33987E
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 23:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778025432; cv=none; b=fMPoWoNwX0eNLW5/yDOFfJaixWdVoUH8SoIv9ql2OAs1twBLQMYIzNEueAy3F8ZxUGiUGmViWTr0p1uAbxtsr27FF8T/p93EFz5ixSYYU9Neu1Mkxk9s9SX+/PaDdtI1UEhpKImcmbAKchPac1s4XSY7Mv6kuDOOGdxnsZgpbBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778025432; c=relaxed/simple;
	bh=7lssjXv+qONdupRILEXou+KAQEDW1eXIMxwFhabDxyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYVlGJwcmvlOQF/tfkUephl3ScDyUI2abyCd2tDqZGbLXgEiYBa0OA622Gynv8t7+cBYyg6vdjdBBIFobTwOWhgzlt+sQ6mJDHb4A6qfR1RnkZbNkztmw12RgQjXqk4JvK5h+/Tg274yAohZ8j/lGzDvc+gTHZbmm7sZHtsV8p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJPzkiZ0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJPzkiZ0"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8721851e2so2778219e87.0
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 16:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778025428; x=1778630228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAZlOXRCtNKYjp5V8q+GcJxtx/66J9K88/eFDv6rmHk=;
        b=LJPzkiZ00DPLHoM01NbU2LXYJqb2EFvZbq4nOcWg0UBZlqP+q5V9QNiethISti1Gg+
         OHbmyMPzTmuCnQNGcGZqHthikoBgbtlIzeYxKzn7c+OuwJ2Q2rlAnJpMLR4mtP4HCqtc
         QJPqlwgSkwV9zy1bO/m6Gck8+Yw4Yx6MfkBmDG2cV+erBvLzjpxf+gjUs0ocPeImRS0u
         tSFxxQxZ9cYbXljpWew+Z6K4R2AqA/h2H/0I/NuJHvl3ppbUwCvXFFUWhI3gWTQkIYMN
         ADxFtdxpLkjYhvGFYbRdIrIV7wl7KILLCtP2poE5blZ0Dsg0O2kTknV2BEcZDK4VWKUg
         Uv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778025428; x=1778630228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAZlOXRCtNKYjp5V8q+GcJxtx/66J9K88/eFDv6rmHk=;
        b=mHYln0vtseY0KJoU7lEe/sWdB3Feh373x4bFGcSFbniH//163zWxk68F9zW8P77xx8
         kDDsSlcgI8MpYGKPfBth4lDKCBOyOEIdr6xotv3y6qSbdfz95vSaOTKVGpo03kPi6eTM
         bos2fMwd7+3AnPM2EN2+AUijsiLAh7wrDrlQV7IalUuf6XDonyThKIr4x+HlAEks/s9M
         Hl/TpwC+JqfFHHYpZK4TtF0ORRPeYFZYYMe2Pqd6YOIiXKv/kBa/RybjzZPbSUJOiX5+
         amUb9aJiYZRb8Sf26B8yS/69U6VC+vndC4UN5G3OJXY8sVAITt/5NhlLd9h5HS2uuVlc
         yX3w==
X-Gm-Message-State: AOJu0YwvdsPlDlsXSg988smtQam60ym95Pkyo0V/zY9E0dTohgcz3pQZ
	kIrfpASpe7V19Ri+V3eFsocoCeJ3sgxNk0krN+mY+ifgBZlq8W3z2iWN4SbFfxFp
X-Gm-Gg: AeBDietPVK7H+lypIH+h/dfV8SmTwfAc0/73C5b3Ad9+F5VOS7ijVeymGHeAau3K32y
	b6yN8Bs7ykhUoZLbJw9KQGbA9pGk6RleJtYAO+989K6vlR8U/TtyykLkWmX7LnFNckb4ZWfMcIk
	eI7aCWNN8NqM7c6S+WaNNcUSXKS1xaCkgrxjAFPMK/RTpH+bFFhUzAQjFPiqgAEBuCcvHEB7PyB
	cAExoQYUUnyImqVDBzUdIxbaMrFLeCbZ9fBU7ZdaiJ1N7KLB8Wjsgwh4kP4nOP9Pyr3ElyqPiF9
	RsOG6fKiUCwu7oWFvqU26q2mx2y1Tp5MtsGpy0cRV6ZNWdIQqSpFGa3eGyeAQil70UtThtWJ2mq
	3zE1qu5KjTWcH+sZmHZvXT2K/eWtwilMX2RT0PcIxDJamzbZPpiKtw4GGQGZK+omRcVn6MttgY/
	heKTBK0sfk3vj9EWyqUlprb8Bv0zkiDiHNWQ6gzIMgPT1JDBQOuEZJnaX6+/3H+D1VwtI=
X-Received: by 2002:a05:6512:6cb:b0:5a8:8014:6b7d with SMTP id 2adb3069b0e04-5a887cee741mr287230e87.39.1778025428341;
        Tue, 05 May 2026 16:57:08 -0700 (PDT)
Received: from Shofiq.home (87-92-218-151.rev.dnainternet.fi. [87.92.218.151])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86d599974sm2896423e87.49.2026.05.05.16.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 16:57:07 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v2] ASoC: nau8825: Fix typos in comments
Date: Wed,  6 May 2026 02:57:05 +0300
Message-ID: <20260505235705.8601-1-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistakes in comments:
 - suppresstion -> suppression (twice)
 - funciton -> function (twice)
 - imedance -> impedance
 - tak -> talk

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 sound/soc/codecs/nau8825.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index dd3528537..80964d58b 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -712,8 +712,8 @@ static void nau8825_xtalk_measure(struct nau8825 *nau8825)
 		/* In left headphone IMM state, read out left headphone
 		 * impedance measure result, and delay some time to wait
 		 * detection sine wave output finish. Then, we can calculate
-		 * the cross talk suppresstion side tone according to the L/R
-		 * headphone imedance.
+		 * the cross talk suppression side tone according to the L/R
+		 * headphone impedance.
 		 */
 		regmap_read(nau8825->regmap, NAU8825_REG_IMM_RMS_L,
 			&nau8825->imp_rms[NAU8825_XTALK_HPL_R2L]);
@@ -2237,7 +2237,7 @@ static void nau8825_component_remove(struct snd_soc_component *component)
 {
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 
-	/* Cancel and reset cross tak suppresstion detection funciton */
+	/* Cancel and reset cross talk suppression detection function */
 	nau8825_xtalk_cancel(nau8825);
 }
 
@@ -2651,7 +2651,7 @@ static int nau8825_set_bias_level(struct snd_soc_component *component,
 		/* ground HPL/HPR, MICGRND1/2 */
 		regmap_update_bits(nau8825->regmap,
 			NAU8825_REG_HSD_CTRL, 0xf, 0xf);
-		/* Cancel and reset cross talk detection funciton */
+		/* Cancel and reset cross talk detection function */
 		nau8825_xtalk_cancel(nau8825);
 		/* Turn off all interruptions before system shutdown. Keep the
 		 * interruption quiet before resume setup completes.
-- 
2.51.1

