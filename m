Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503F3093AE
	for <linux-sound@vger.kernel.org>; Sat, 25 Oct 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410439; cv=none; b=Mwo5KLA+mLf+2LHaEJvJCjCEyOh4CrWBkNitFTQa6A1PFvCoQ67e50kj2I8eiMKWwraCYPcdS1dcLip1Kn9SjunDxrGGNXDZ0DhgFqfQSJq6vwityoBVKg103IQ925irF1twwSP8ZjGEF4Xmf3W+vaaS3FM7oLP9+V4TFPtiFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410439; c=relaxed/simple;
	bh=r1ZSvL7GYSBh/Cee0SXgYuJ/pWOJXGQu2D5xFAme0AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkeLXtmDtPhalLyrJLmpEofY+JEFXEzlSPuYQ6NHu1eWMDayhq5IFlxeibiCjlJutqyY/EAHcL6YAMUDuJKyRmIWbr5LYJPTgaSFhLPIPl0JYg/xTOOi/rXN6tnGS46jJI0u2udGsFharN7tlgYUl2jVMDRqImCK7iYs0AyrRJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfH+o0wb; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfH+o0wb"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-81efcad9c90so36999576d6.0
        for <linux-sound@vger.kernel.org>; Sat, 25 Oct 2025 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410437; x=1762015237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxeCOI9icR7/UFiwtRNvJHOt4NesbHGx93HWxIm5tv4=;
        b=lfH+o0wbFcKnBcLqetfiVUhdNCb9XnBsKZwY96o9jLcYUsu493Ya44FsdUrZJ1e4+l
         bxVxm7ju/wDa57wp8hlaUJwWjKKSqAGX0ku0X4bRBgvzPWQ1PEe7Q1PWXSNUFtMw5y90
         ITtndAEnv7SKqIvSwpYPBK7WjDmq+9uWz9YaIfLPLmRr8VmG0pvRGJTBR4ZqX/Ey4gyJ
         KSe2BZmWUqlJS6Fa8RfxdzWg2EbVs6ZvzaQZklU5eNdXSq4oXuW3Iw9imMJe8ydwgGqE
         mmoDcAP/2gx2O7e3Tvyjfr+mAFwqCNCC79zE3tDMYt9piFsZLCeNUVAPEPcCbK9Ky1iQ
         rzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410437; x=1762015237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxeCOI9icR7/UFiwtRNvJHOt4NesbHGx93HWxIm5tv4=;
        b=A72qeUI56E0hAGkPVcU5vdyGhsJjJMGNu9RhDNiFjNz7AQf7WeLiuXEKxrxhHyM1j0
         MyFdhg+xGhqhu9rSZ/AI3bmw5/ZTJfqT+8zJyezuyLBrtaiWGC5t1MfxwRYeD0PopCHp
         EbcDfyBDL1VTiPuZ9V6d8XL1e1QtiINsqVp5f1ZqnQGyevprG1gflCYS0sMkI23r21mw
         tMFDexEKVvYRrpEbgOyXvk5+RviGgxhBjMBPsLgxDBFb12ad9pkz7Ibo/ASmfudm+tpy
         DQ0Jgs9pxcFrF9YjvV186MZCSn6oaB0ZPW+t66kUmFCGrRKK2ZogcCxMQ1Kmr5llGEjF
         gO7w==
X-Forwarded-Encrypted: i=1; AJvYcCWzcyegTE7yh5I1ZkK1wP6h1cNIfghEh3xbHHdg2SlA232mScEvpBCJSQXsKTU9IL53KGflqaNsWp9K9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2iLwg5kag7t4z3nMFENdHIr13SNO0pzsj4/PLkWL6QQ42zwB
	siA1OY14U35oqTH6RYWST/SveFENdlKd4OgdnvzZDpQTtfLGWVhBaVV7
X-Gm-Gg: ASbGnctEP2zZW7XmdBeAzESVDeSafnwFStshvWoS3PonSRvBgfG7sEhW4SsccY5uSFF
	dGqambDonNnP2dWT8O384rufyTVx/9VXPdMICVWjwgGF7zF4XDPuu79ZqlULxM5ie6Zuar8qYiP
	1kl1hNBgb8t7B4v7ouXQaSJT3b3WCHsIyiAtce2UnZLiWWFI7hwDrgACzgFNbc1HSBeDREks8FF
	/8A4bG5Pai0UBnfWvqES8DdqaTbABGT4tfWQTQVFrCBzqoV1fXd5+l5vgZKbSd/x22CiPh0RRUJ
	Y7fhR1+vA7Kj8BMRkRn0zo8GwzIIiXAynnHcFcVtG0FRQLVaIgbczWSgwy/y2/5dG9DTyKUCfKw
	MYpEZWAQ6t2CewsDFfxcD76lpvmYEGrH2gupBwGNJ5G7WTsGQucDGLIStLkxNLdg0XGJmZpI/
X-Google-Smtp-Source: AGHT+IGA1DGszT7xZjIANsU8O6rvui0sqJn95mFqcuxChrfDbaomUSTYNAUrPgKr6w9KBJpYTpgUWA==
X-Received: by 2002:a05:6214:808f:b0:87c:2275:4bf5 with SMTP id 6a1803df08f44-87c22754bfdmr400398756d6.28.1761410437167;
        Sat, 25 Oct 2025 09:40:37 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc4944a84sm16377846d6.36.2025.10.25.09.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:40:36 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 04/21] ALSA: rename BITS to R_BITS
Date: Sat, 25 Oct 2025 12:40:03 -0400
Message-ID: <20251025164023.308884-5-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding generic BITS() macro, rename the local one.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 sound/core/oss/rate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/core/oss/rate.c b/sound/core/oss/rate.c
index b56eeda5e30e..90a40221e4ce 100644
--- a/sound/core/oss/rate.c
+++ b/sound/core/oss/rate.c
@@ -25,8 +25,8 @@
 #include "pcm_plugin.h"
 
 #define SHIFT	11
-#define BITS	(1<<SHIFT)
-#define R_MASK	(BITS-1)
+#define R_BITS	(1<<SHIFT)
+#define R_MASK	(R_BITS-1)
 
 /*
  *  Basic rate conversion plugin
@@ -104,7 +104,7 @@ static void resample_expand(struct snd_pcm_plugin *plugin,
 					src += src_step;
 				}
 			}
-			val = S1 + ((S2 - S1) * (signed int)pos) / BITS;
+			val = S1 + ((S2 - S1) * (signed int)pos) / R_BITS;
 			if (val < -32768)
 				val = -32768;
 			else if (val > 32767)
@@ -162,7 +162,7 @@ static void resample_shrink(struct snd_pcm_plugin *plugin,
 			}
 			if (pos & ~R_MASK) {
 				pos &= R_MASK;
-				val = S1 + ((S2 - S1) * (signed int)pos) / BITS;
+				val = S1 + ((S2 - S1) * (signed int)pos) / R_BITS;
 				if (val < -32768)
 					val = -32768;
 				else if (val > 32767)
@@ -191,7 +191,7 @@ static snd_pcm_sframes_t rate_src_frames(struct snd_pcm_plugin *plugin, snd_pcm_
 		return 0;
 	data = (struct rate_priv *)plugin->extra_data;
 	if (plugin->src_format.rate < plugin->dst_format.rate) {
-		res = (((frames * data->pitch) + (BITS/2)) >> SHIFT);
+		res = (((frames * data->pitch) + (R_BITS/2)) >> SHIFT);
 	} else {
 		res = DIV_ROUND_CLOSEST(frames << SHIFT, data->pitch);
 	}
@@ -226,7 +226,7 @@ static snd_pcm_sframes_t rate_dst_frames(struct snd_pcm_plugin *plugin, snd_pcm_
 	if (plugin->src_format.rate < plugin->dst_format.rate) {
 		res = DIV_ROUND_CLOSEST(frames << SHIFT, data->pitch);
 	} else {
-		res = (((frames * data->pitch) + (BITS/2)) >> SHIFT);
+		res = (((frames * data->pitch) + (R_BITS/2)) >> SHIFT);
 	}
 	if (data->old_dst_frames > 0) {
 		snd_pcm_sframes_t frames1 = frames, res1 = data->old_src_frames;
-- 
2.43.0

