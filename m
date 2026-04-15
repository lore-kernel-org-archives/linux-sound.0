Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230AD86331
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776281508; cv=none; b=LmLj0k1MrMEppuv7XBDAUKWzrcTDWPbaKEuFHts6QBuPrT8Bvxr6SUUcbgt7pIoO8r4GYuLgC9Gs1bty83Pd3dbyjCJ+FKbPK5IzJJ/eA3q9C3aaePUJpuKhNxY8kXJReAOutKXeFxfS939D7MKVJ18xxi7v26Qi4Vsp1x3LgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776281508; c=relaxed/simple;
	bh=asgX9bZgN871VW8IBcMTNA0C06TYpe28e4YJgMp0wvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uY78FYP3DDGXI6eiTcOiDXQTqgADZ4MnTce7x5d87E+jdxYwsMhYuhjE87MHhx0N0+X8HfNNJ6+a0yoIOWqs7pbgKwr+kcArksb1doCZmhCqEj1lLvG+2cdfN3NEU1gjsXvNJNWnNfOxJu/nr9tIgrss+575nrUacv6MMeBYqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuK5ONyf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuK5ONyf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso4232852a91.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776281506; x=1776886306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNbHuV79KfOM82xdjXOagbN4R3U9h/0lIOtBKfl6MnA=;
        b=kuK5ONyfVKfdLvuCOS3jLGf9pz6359Tj4/VcxLeqfmupDRoce+dcYVuJkTINVQQI/R
         y4fDgrIJOgan/AN7nqTwC1MeOhVSeGH5gR1uGu+L2E6izF1tFuoSu5K4E+Y6gf37b9nR
         d4Hj+Okdqf6SzTpZZv72pM/52BRKuWGoivYmvqmiWiSC//WqG95oGHp+1j+T3IXwyeoD
         xQNZr5y/foGy09SnxQQ+I1/PQ6Q5Jg4uGfjTVI7D39Lpo6u3WhPEvzOlf7cv45t+CHGH
         BGhtEeqPuRIle8YKG9nYhUSQ+7QRBohy1GyV9X9Q5WBKd43NM5yb86Pa9g7WwK8WPABA
         eYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776281506; x=1776886306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNbHuV79KfOM82xdjXOagbN4R3U9h/0lIOtBKfl6MnA=;
        b=i0rPoAgoz+PBANY5d/ODrJJKCrFKmKEL7wOPKiUlsw71CrXhie8OycSemWOWyRQKRh
         CLZTwTwm52gfRszWZNRS81WTYoPvnBs6+9Ryzvt7ZtmU+ZU/nHNBluofx/uUiKC7V6Q9
         R77zQluDOWOmQa7KI7shPX6KcMEm973uE8TosAtdmyJvwMxje0hyDXaTE39BxEPde408
         XvDMjqXCH/oI434HlyQVJY+9obGv5US3zJYf0Qh43jxhKE3Uu+kyZldrAfXZbWSzuzO2
         KE09IbxxlAdAqoHcmw4fCuSCQ7j5JgFnk07q3CIgFLjVFJhi+9QEHpqA0lLfvRmIQXcq
         m3yw==
X-Forwarded-Encrypted: i=1; AFNElJ/sbZBWgGCaiUA2WhXW6HpHQImUbfki+EhIiT8/Y10egoAQJcYDbacKr6fpRFNFcRh+Lv8TrbDZAemCSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCSl9ZCDo2qhOmIK3Td8wC7i6T78md6liQJ7LWmeGsGvLPG9Hu
	uetTcVkAaxEogQ0NTPyXWg4wAQ5CBnMrSd05Y3+kz9lJqM2yde295CXw5mFHvG7l2FHJwQ==
X-Gm-Gg: AeBDietozJCWbDvYiTg5EBdy3drhS2Ogvsh/FxSlie1olZZb/k/M3plinZs0ifqRuf0
	MP52b2OicnevB76nh6CflLu2Zyj8s2IVnenUrXrldvbylJaEjex6pFi0e9qAlfepD+zqxAcMjdN
	Kr27BwmFeAnfTUDX9J7BV64NSZwGrYAcalXygA3lUlIg1FufJlhY9Zjgxzwh6KQRtW+ejXpCLK5
	EK0nXD+df/l96PTBalVEzz/3WsaMZO/jwy3kloVPBHeiKI37jOtkEpNUQrLmdOSQsKNBZ9bRpP2
	BzRbWpDhoZDES3gOu2bXHzaBYsAYVrZIkm+Sm3XBfLvlHqVzIZH0GUfpdM5bYrt+z+RHxCQnZB5
	SAggfwyesAgNaV/H77t8Zf0d9PO7n5Jrn8F5GVZbSJE/LY4xRGo+RLhhJfuWv2BUkhYMi/iQmJJ
	ot6jEQxoGWyP1hFR/Fv3GXRjheoowu91i75qe1NKVT46m+IA==
X-Received: by 2002:a17:90b:3950:b0:35c:1695:24a3 with SMTP id 98e67ed59e1d1-35e4281374emr22489139a91.23.1776281506503;
        Wed, 15 Apr 2026 12:31:46 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:93ee:194:b07d:a9b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fce7d792csm1711666a91.1.2026.04.15.12.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 12:31:46 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: pcmtest: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 03:31:38 +0800
Message-ID: <20260415193138.3861297-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When platform_device_register() fails in mod_init(), the embedded struct
device in pcmtst_pdev has already been initialized by
device_initialize(), but the failure path returns the error without
dropping the device reference for the current platform device:

  mod_init()
    -> platform_device_register(&pcmtst_pdev)
       -> device_initialize(&pcmtst_pdev.dev)
       -> setup_pdev_dma_masks(&pcmtst_pdev)
       -> platform_device_add(&pcmtst_pdev)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before returning the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 315a3d57c64c5 ("ALSA: Implement the new Virtual PCM Test Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/drivers/pcmtest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 768bb698adfb..20ceb9082fa9 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -756,8 +756,10 @@ static int __init mod_init(void)
 	if (err)
 		return err;
 	err = platform_device_register(&pcmtst_pdev);
-	if (err)
+	if (err) {
+		platform_device_put(&pcmtst_pdev);
 		return err;
+	}
 	err = platform_driver_register(&pcmtst_pdrv);
 	if (err)
 		platform_device_unregister(&pcmtst_pdev);
-- 
2.43.0

