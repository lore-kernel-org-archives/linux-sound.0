Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F738AC86
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305282; cv=none; b=s6OsiJQDpE8eer2Mo474nRzqQk+Es6g19zuwC97f7UaiWyVvuoQOW96vd5VGcXU8BV8FFz42+QQaxYTEaV8q/LWvVRYEZBx3mZ4z/A3FEbD72xr5N4isZwURXJMzRcMAdJm3/QdqYPQYUv2NjlZq/aXBf2cCjfal8UbGNLbnQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305282; c=relaxed/simple;
	bh=jshvpbbqyCJXJFnCiNXC8f1p7ofXuAPUjoLyT+Hay3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RosmgPxACfid2fiFb4N3Unry3EQQpVO4XCV8Vy8Rs4IcTDnE3n8sd+bgbm8txQDS81uw1OdAgy8pHjuqrKA4Z/JDc7CZ8UT+5NAMiyuFvRD1OYF6stHUW0+QWhqaHYqNRbPfCeT1+67TFuUKfFT94CGJxrQce/vDHDhvryzrRmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzNG5t3f; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzNG5t3f"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aea41d4fbcso3820765ad.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 01:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773305281; x=1773910081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L+iYefIZxKcaeucX4XcH147M85Qnaa9Ph+8tLAQwycQ=;
        b=XzNG5t3f34igxRlf/2lzTPx3qRXAuvGRjDTGnjzRUO/xZ41CV6cccJlB2csMSHF/tZ
         8+9qqkGzFoxeF+dnDpURB8Lu4uj8/hUpDZ11STBy4wSEvIuMMHvCODFdGfk6jTeKX751
         XOmOJeTbTP9UIiSRhTsaYvnJ9wyQoqHTA17LbOCMFTzW7CQrtZSNRwyq3Zjeua84YQAP
         jkLyb0qacYF83Jz1R4S4k0plxaNKDF6NNGwXDibqLB+7X1u6M3MXzciRaDzvGTQJaWHP
         nMB6xOa28TFZt/ki8J5EdhGA3Ttc55Aq4GsH5qi4M+R1XngMo5iVcoG4ud//Im9KWNC+
         jbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305281; x=1773910081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+iYefIZxKcaeucX4XcH147M85Qnaa9Ph+8tLAQwycQ=;
        b=KXIlTtVEvBOtGr+7xMbEJvX/rCdTsUPWr6z/PGJLuEGT8OLVOVcHIfYA9wL66nsiu7
         SI/IurDDiWRpuKMwBK0GJLhNk0LgrVjvSEbYvmEkQkoeNssh35UPrcSX59cbalVGFGHm
         OaEyGm9FVMcD0PUyxOydViPTwja2zHt/bknWUpzPhTC5ak6evLQa7yHaDCzU6qxHf6l7
         fpG3gWFmfe4cl0UxAwsx7ODzzsOKnGJtR+NPnHOnIk5JBVHEpMujqBjR6icRZQghUUVg
         dSN/H8PywpmL7q5XTVVSsScdxjaSLjfAYVERv0oa+ELLUxo5dW3963E5Im0b78XOYzCf
         bMEA==
X-Forwarded-Encrypted: i=1; AJvYcCXzBIDqrCMJquzZHkwCaoSBEyBRQQWypAwjykPuVJRndDriLyALAxgJGUong4mddGmimQlfjBP0elDIbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeXnEOFnEF2ui+3dFOLFNiOW+io/iHsycwSAIMGIZNfnHPBbXF
	8LKNRK80gHrNtAeIY9ObYuJKeCkymregxdW8vU6zy2RlAm+QVU/gzJ3kdXq3ykkGAN4=
X-Gm-Gg: ATEYQzwAY+xjJ9DRD1V+RQC1QaXu8FUjqmG4h0Oj90Sbz4I2S5SRbGK7URxapeKzbKN
	WJBuX1XM5x3h+m1bZLOXWcQd4mP1VizXgaYnvK3CFX9MOvNAS7CQW+Kshx7c1s3hQmuNdwbRye4
	CzjHaXHKmeoKLihOZAcodhv4OWGW4saez349m3mOY5YbclaFHv6Du5rNT4gJehB8AO4F5p5zsHp
	NipoRovKbjibCVYM+U+x+BzXfJ0dWV3yIJ3nio6Qpy9cPjEXS+I23+AMvStTzwTWbggrz+jh/+9
	sXa+KX9Kz11+k/eTtCBQoAxBubEkU51XFqJ1jGQGWp65IOfhBkszHSLlKb8yDc1/HJxCts6wfcw
	D8/CnZE1L9MD8AeAaThBnU57MHN2HjgdGHJSEIhJbwKATP+DgXGJRn23fJp+KZIBoFsu7wvd8c/
	S8P9NVVcXaeiOSSw==
X-Received: by 2002:a17:902:d506:b0:2ae:aa16:acfb with SMTP id d9443c01a7336-2aeae80cc3fmr54507325ad.22.1773305280599;
        Thu, 12 Mar 2026 01:48:00 -0700 (PDT)
Received: from lgs.. ([36.255.193.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae2228easm48508975ad.3.2026.03.12.01.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:48:00 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: sma1307: fix double free of devm_kzalloc() memory
Date: Thu, 12 Mar 2026 16:47:49 +0800
Message-ID: <20260312084749.365325-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A previous change added NULL checks and cleanup for allocation
failures in sma1307_setting_loaded().

However, the cleanup for mode_set entries is wrong. Those entries are
allocated with devm_kzalloc(), so they are device-managed resources and
must not be freed with kfree(). Manually freeing them in the error path
can lead to a double free when devres later releases the same memory.

Drop the manual kfree() loop and let devres handle the cleanup.

Fixes: 0ec6bd16705fe ("ASoC: sma1307: Add NULL check in sma1307_setting_loaded()")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/codecs/sma1307.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 4bb59e5c0891..3a01aca17e75 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1759,8 +1759,6 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 				   sma1307->set.mode_size * 2 * sizeof(int),
 				   GFP_KERNEL);
 		if (!sma1307->set.mode_set[i]) {
-			for (int j = 0; j < i; j++)
-				kfree(sma1307->set.mode_set[j]);
 			sma1307->set.status = false;
 			return;
 		}
-- 
2.43.0

