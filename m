Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685C4216A1A
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051059; cv=none; b=o6Tkcl0BTg80cCGb2r+afJeQ+PB23ARCxNs3MvjXbjF2q+pbfty1POk09MCjhaDE9p7VHFYKWuzkLMHGXEfgvaqqXCOuUoZ6dX6TtredmqlJEcWVnvBoIQ6u8GyWEsVukAi9vL+4UP0tW3dHxwlpsA5P0Dzhc+ZyezI8AMVKbDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051059; c=relaxed/simple;
	bh=FTUE6CHWE75yswv5NHdLIb/r24O+NKCudvFgq8Fh62Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M3n6ofHc54VXskr7e0GJt9YKoBWuU0atVMbm2AxhF8jbbaYGbOHKUx1GEwlKYSnruv1ZWJgvkXZ5aC0hLlST+nDdLQxHjt4Ogc7RKMoAaEhpM1YziYcv7X1Ig/sJjpmtzUvqRU13dIZYIV1Xg8HaNxmF3mI1HjEdi386tSAhOIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ai9Cs9X2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ai9Cs9X2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b93887decso18261035ad.3
        for <linux-sound@vger.kernel.org>; Fri, 04 Oct 2024 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728051058; x=1728655858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+Gl2fQgPUCtMfHbBwf8K9TjCPojUwKqtER0U4Ha0P4=;
        b=Ai9Cs9X2p+AQIXW0pw6yZJrQhN6141cVKXm1F/A3Nx27mU0eCnjLYWdyNTL+1gpURN
         ld+L0SjRXKRO0PrKpf2qupOMDo86CbpvH5N5Zcezq/2aSn5gfHZG0KHPXab/uF1pxqjp
         vDlBd0iLvTR9Sdyj5VAUoE0vNre0hF1czduEq+SYxOPj0SiP0RPp8qDoZowgBLcExKa/
         dVar5Eixqfu44A6zKIm8KqQIpjCYWJqlAy96dMFzxuhu81sMQ9O+wGGgH6Fzw3uHKvdh
         uZZVN86z67NlrUFrLZAAmnOJgMdD/OiJ9KJ8t7LbxqLKGs0W+NMOc7X1ZaFY7fGiA7Eu
         rrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051058; x=1728655858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+Gl2fQgPUCtMfHbBwf8K9TjCPojUwKqtER0U4Ha0P4=;
        b=iBU7m4/c3TCrpIz4UjOrQpOOVXjbU7Bu/QDPwBvlMXjc3uCGrRiqeamn5m1VzjFGr9
         pXtU8JOPQ1fN4c38Wk5n/jYhKDYfEL46cexZRWIRptX35EHZJRbxR4XYuJDqpVW1ma3c
         rGLQN3CIOR4cV5/wFJYQKn8mPEg+Z9dArYNMhsHZs0oAZ1fQl1qcJVLozMkLIJo4b+Du
         DdOBX8KA1uXiLOzv1ixnPqVcL0R0rxYQWHT7RO/MQ3Jt9NypEuE/SCNfyz4nMkcCNFxh
         IpgLOSnG+uAfPywBAfHK8TB0htvNtpgBMW1gw9llX/IWkMMVitKg4Ca7rPbSNfcYj2A2
         m5mA==
X-Forwarded-Encrypted: i=1; AJvYcCXKpwifGxBRS/qeG9+ED8kPKR0Ssq+e6AFYy4JN8/D+LlnG3n7jkuhVPBwqSbhGi16elciPzkQRxaPOsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/PptZdVY1Srk/iCm4FO7e6irtR2fMlNiUbIRdR2PCVkR12Ht
	lYQbIq2Bqfzms9uqX9rH5tNaygUyzcxWrJwz1wJHz6N+L5pPlSUd
X-Google-Smtp-Source: AGHT+IFMvB08uHXQ8m86efriWvwk9rMcme3rK7IGLHYovJhvIAMePJxrcbbbdajwkNzKJclz8GZ9LA==
X-Received: by 2002:a17:903:1c6:b0:20b:5ea2:e06 with SMTP id d9443c01a7336-20bff1f6a16mr34519425ad.56.1728051057520;
        Fri, 04 Oct 2024 07:10:57 -0700 (PDT)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:cc2a:fef9:63f0:2e09])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20bef7074ddsm24480145ad.243.2024.10.04.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:10:56 -0700 (PDT)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.orgs,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com,
	Advait Dhamorikar <advaitdhamorikar@gmail.com>
Subject: [PATCH] Fix unsigned int compared against 0
Date: Fri,  4 Oct 2024 19:40:46 +0530
Message-Id: <20241004141046.61265-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An unsigned value held by offset can never be
negative, so this test will always evaluate
the same way and is therefore redundant.

Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 7073b9d1cda8..868e8a91e05b 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -961,7 +961,7 @@ static int adc3xxx_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= ADC3XXX_GPIOS_MAX)
 		return -EINVAL;
 
-	if (offset >= 0 && offset < ADC3XXX_GPIO_PINS) {
+	if (offset < ADC3XXX_GPIO_PINS) {
 		/* GPIO1 is offset 0, GPIO2 is offset 1 */
 		/* We check here that the GPIO pins are either not configured
 		 * in the DT, or that they purposely are set as outputs.
-- 
2.34.1

