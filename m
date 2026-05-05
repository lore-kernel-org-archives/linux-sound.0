Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE4223DEA
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 22:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778019605; cv=none; b=oMimqTMX5fwYY55RXyfGgIha2/sefPspEMNrnvql/8pHrh2+bfXucoqGGdmLDKi26SqDNPL1xcW7siPfC09pBXgfCLhsSnPqAhzr34CtU0t6s9LBvaFd72iWwU1iE7UQPJAXUV/8UhHteTfjtT8GTpuyxPLgXhRXlDPmVOU0uu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778019605; c=relaxed/simple;
	bh=abOJwPyE8mb5QCKIgxoEOdFYqAeXEPmKF3ypaGeb4l4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQ7q82FfeDbqKpoWqQBw8FjLATlfTGpnu4YJXtJAN91YZAzptsaS8tJTI3erX3D+sPYLbDOebc1P2mh5UJomkpauqHxLvh+Dyv2NH8t5UucRosOg6yg9sRRxxIkkYm5UOqhjZ3VKGaAO1iomWE+AqspCDVdI7FElI4fyt5bFsMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbgprXEL; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbgprXEL"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3939d2bd739so25660861fa.0
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778019602; x=1778624402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBxbWhfHd9YCzjRX/n5LK6AHrQ9o5QmfF+F5hs9R+y4=;
        b=BbgprXELQn+ElCWEo0+DN8mxze9OXJ152nfKg5zEdD6fXhzWMb1xzt/15ZTVlCmTr+
         L2BUBAWFHTgUWUpFbVqQqNDV4GbHsMlXCjb2k+BhFJTebCxZU8hs7aCI2lPOA94Wy1KT
         q/IJo2pPGCvi8xHe2mq/qOP02k+7ThHoez8u8mwpo5BBYs1JTcPiw9UuAyhmpgBTfVuq
         xK+BZ9kq2t1HfuGchsGjuV4AkIP9J+e0WouytWPuc9d3gsaUyr2NzRvxiDW2I7bXP5+n
         DDZn7MZ8wxs04+r9qGRx3JI3JXthVFuaSv1cthjHiyp5YAPFh5/uKpaTY6fjVoisYuF3
         rY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778019602; x=1778624402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBxbWhfHd9YCzjRX/n5LK6AHrQ9o5QmfF+F5hs9R+y4=;
        b=sdo2JFD+2SVUt7w4KngHnH3EWJcFWTkZVAXQAS6a/IzTwDbHjmDERRnwsNKLD0FADl
         ir5E/4i7J0COEOHGe1wI1SSy7BUbbTxMeAAlIdVv4kFNxis5khY3zdTS4XEbtnFuy1kR
         B9gDN1GqL6agS/EoZFrtBgKe8HAR9UsegzaGdYYDwHgTjdR/7fiJAxOmpdKQpYEGlw5e
         ppMpYhm0LfeMLBXl8SelJOKKbi6RpRDLCSWocrcJI4ahcZUh4cnv1HbABV+32RF2hfsP
         ndDqKh5QP0Ox5J/QjwehCJKr5nHXKKwtWNC7Q46oWUhlIqrn4O2TH/GSAOdiAitT+1QT
         Zweg==
X-Gm-Message-State: AOJu0Yz9UtKL3SU12EgYEyJ/Vvrk0BB6X8UkNhN9HyN5TdGrKC4A2rzZ
	mHN9tjz5SnuIvmM9WVPLRl7mmxEr+0WdqeRvgxh3A+tkQEVKI0glyjy7u1dDKFTG
X-Gm-Gg: AeBDiesHLniOZYdEw2s/bGqNgq3uEYHijbeB8MIypX7W+wSAGVWP2ZzUYT8vAbg1skE
	bdsNcHA7eNMrGYDhXdrVEqKKdloFn049CQjBrxVXqEdyIW/mlFcr/P1XL8gyz5nJhuDObGi4PDm
	+yKtL0CapFYd5Pbyi+fWu+027ZQPY8/L++Al/WZWWGEhCOVNE9L4u1TX2uAnHIjYbk/eViusm5P
	ggVmOiI0tk1ne4rkCyAzaoykix6NDaa1g8cEGXfNWcZWHxxQ6V3ASZfEVv/B96/oQ+P0RV9ogWP
	ErkXQAjNLhGUbplUSmFf1QFXKaB3jnRRFDYiMda654Z5IPQaqnJK100HF4ESNWsLukfYQXdfGDz
	40aOt+tGxWSPtPHsJNPVcsIoYvmHVBYjdtHKTMPq5ICUd4tpunnIbSlD+TM9o5q1ErMGYJMhd3u
	sQZjVhTiDrLvChUwSBn7buo9p69p7i6gX84iE0umNZNEan3YpDuL9C56UiOXudaekondM=
X-Received: by 2002:a05:651c:4015:b0:38d:e977:554b with SMTP id 38308e7fff4ca-393c41c9896mr2625361fa.16.1778019601687;
        Tue, 05 May 2026 15:20:01 -0700 (PDT)
Received: from Shofiq.home (87-92-218-151.rev.dnainternet.fi. [87.92.218.151])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361356c5csm44500921fa.36.2026.05.05.15.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 15:20:01 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH] ASoC: nau8825: Fix typos in comments
Date: Wed,  6 May 2026 01:19:58 +0300
Message-ID: <20260505221958.3751-1-shofiqtest@gmail.com>
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

