Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B01DA4E
	for <linux-sound@vger.kernel.org>; Sat,  6 Sep 2025 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175749; cv=none; b=Q+AjnQ71triwaE65G74rfR6W9veJSAdy/GSgfgf21de431zt/VnQOimDtubepo2haHE/q/yhwXkwHlBH2d4z9sUa/GAjQdn7uEYGwFhvEwS1tVGtGA5iqfyTOdyS2mlIjjZxY3pi1PCiJ0kZBfdZazudaGDaaBfc1bf5XyZmnzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175749; c=relaxed/simple;
	bh=voqz/lldR3MtvnYRpvt2t1gVNeBXyIkE5wcOtOujWOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7hK0lQxq/C+wZVe1JVY2cOiYkQPkJhZ73Kgala7q8o4zKslrbambLSsjQQ7jjAPc4rK4VLgj9x7c1u3tA1lku1Z/CfMTjlxZtF1UPG+Tuo4Xq0DjFJBuOESdc7gTyNJ0dsMwm371U18ltu4sFuTCDK9o1H2NI81t6O0WN4yums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGRkCPds; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGRkCPds"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77238a3101fso2213383b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 06 Sep 2025 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175747; x=1757780547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQo+kYxh5d7uaeK3dTcGAsSe4ub2bXjjCadCyIZbnuY=;
        b=YGRkCPdsBmkuxkrwI8NZ/I+/eK1VZ9TbESy0XYhHQxzfL2zsQSXG80RxzT+xckltR8
         VHXZjiVYnFNIGt0S+mAEJR1/WJ7QsnJcEb3C3aAViDBnTgrshsuqsqLFXKZMr/yqhkCQ
         GeG6/LU8j76mEr+HV7dXCOEjIAzt7y01gzUz0qaKrLHwFxfXGIW1+wW//sO61FKDVZwO
         K+O+EtZqQHbAiNNBfEvuaqaDOQ2+m9UnBUUjcnhdfcL9UiOJYvvxfqQvZzQ4f6sSPWCT
         b9tyHSH/94iKOXDqEn5FNl0Y4pupjDj6abp+se41tmF+7QowP9PDR7SiIRd6AVCF7rEK
         S+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175747; x=1757780547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQo+kYxh5d7uaeK3dTcGAsSe4ub2bXjjCadCyIZbnuY=;
        b=JI9qSlKDoiwZVCAW0S2diFVeq3V9UgUEZUFT5Sq9rOtZjh0ounYiRUeMZEPjtUv9rY
         ojPzjnOQl+zPOZQXOt5RfQY4VaWmsvFQVTddv4GklMWLJ9QyGB6ds5Vt9eTEQjfUvD5m
         JtUzTxu6zdFpPuuAMiskUqZNYhLF8rVeXt4lzlBDUYwvJhpc70zlYs4UaHVaOQDW6i7B
         DljFH49HzVlDWJsRAvOLFaA7SdfRWaE+acG+HbbwLXiiianMvzQm2VSYiivyCUpx2TRg
         uZXA8D2u9oFqn+4uhIUFY61xn8XG74vBwe7DMGqOKVk/I6jY8LF3qsVkHcME/KMKhagd
         /TIw==
X-Forwarded-Encrypted: i=1; AJvYcCWVHigYxKnxUpCQndoixBvecMPhoBcj5yP7ON5T1g0n6nP1GrkUmYFZU/drDVRj4LUr+68HYAk7zgL+Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLBZv2TcVUVtV5PeAGn+DZlESso662WCCE+Gmoa4Jd2J0bHSh4
	O64kYCKISThHa2SajQRBsjeP7Zb+60etkLPgv6p2QffPmpkERCWPQSTf
X-Gm-Gg: ASbGnct18o/0+GU5S0k8JZCJElEg+qJUSnozVvnIPXPFVKENX0ZNqqsbol/5d5jOk35
	7K4MpyCc4lHmxuBsM64Td9pMrm6U2u0IioLNDvMFN1IFyhzXqYxF4Ow+pvnaiKZ0ZoorFJ3PPu1
	eSNCnUNakvuSzKVVXSWqwi+v2VUNHOPq0jHI5wecgvnlChluDEpPYhWw0phTAFqg4wsGZsZPwdR
	brZ47t/U/r4n4ndqbNh7vfzh1HvYU9vF/F063hKxgqjffHFLnDSso0p91O6PqqFKsg7oqcMDqC5
	jI3OBcl2LLx2Lw2blo0CUkH/RSsI3IaX+whwzdfuWP5n1nf/BAADXjdvITrHmv1rbusOrpXTkop
	etfBGAU+ezZhZoOnRQ34nudg1dAOA+uYONeCC3kL8/o0c0p9XzlTmR1U5foylaXHw/Q==
X-Google-Smtp-Source: AGHT+IFWoRPvvlOwfAtgp1V1eszZ5qd0gF0gJ/wMnrLO7QEtTJFa/jslg9wulGzvHPRzNw7LtCBnXw==
X-Received: by 2002:a05:6a00:1a8f:b0:771:fab2:83ca with SMTP id d2e1a72fcca58-7742dc9e36fmr3285197b3a.4.1757175747387;
        Sat, 06 Sep 2025 09:22:27 -0700 (PDT)
Received: from chandra-mohan-sundar.. ([2401:4900:632b:25cb:f51e:8e8e:983c:5bd4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b362dsm25103474b3a.32.2025.09.06.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:22:27 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	phasta@kernel.org,
	linux-sound@vger.kernel.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] ALSA: cs4281: Send the PCM period elapsed notification properly
Date: Sat,  6 Sep 2025 21:51:54 +0530
Message-ID: <20250906162158.564899-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of spin lock code cleanup using guard(), a new
variable (period_elapsed) was introduced. However this variable
is never set, causing period elapsed notification to be not sent.

Set the value of period_elapsed appropiately.

This issue was reported by static coverity analyzer.

Fixes: 7a5127c2c8a5a ("ALSA: cs4281: Use guard() for spin locks")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 sound/pci/cs4281.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index c519fb9cdd1e..d00b2c9fb1e3 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -1752,6 +1752,7 @@ static irqreturn_t snd_cs4281_interrupt(int irq, void *dev_id)
 					chip->spurious_dtc_irq++;
 					continue;
 				}
+				period_elapsed = true;
 			}
 			if (period_elapsed)
 				snd_pcm_period_elapsed(cdma->substream);
-- 
2.43.0

