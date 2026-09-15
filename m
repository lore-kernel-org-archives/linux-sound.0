Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D386493D32
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461889; cv=none; b=D7I3ep0Yk+7GXmqW0nD6G+Ssm0cgYjVOzOcoKJJSOisGDVs4A6DmaJ/On1XA7pSmmXyU9n5P8t3VrvMRgGoMe2wxCYNC9y023cDLdPqp+2S7C36ytVe/YLv9PkzURAbmFRc+KEfkaxN+YsWIbNqhvEEUIRLMXKsdB9D2TKcAGvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461889; c=relaxed/simple;
	bh=leZEl63TX4V3e89rTQIVfJwcmOeBEc/iPm6Jejpg450=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1KLykHKbQCCxcGijB7XqYYSWpeP1l+bChlbtaHjuyfVEZDmeFz+apGg6a3Fo18zB8P20ZNPQ/MiIHQIu7DTrsHoIKxFYNqY779czbTuuLrRe4yhkI79ia0pWNMZt6oumZ9VKAOS3AZNXmSMQzzPkOYhLNIFBJzVgd1v/EneV5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkdB57K8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkdB57K8"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so2121868a12.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461886; x=1790066686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9q5GLhEmb8pBQpgxh9LfIHNEQ3BulUKIglALGzPomE=;
        b=SkdB57K817vqh+qu8qQlwuuOlPEAYjFHPIXPNA2oq4gh2HGf8B9Rlz0Vn4KKN9YwNK
         svXqMuBYK+MkP3Gbhi1vs8NpixyOUWl9WIjHF+pCqT6SSnf4As8IJgbRs5TyRy82gDMV
         mUTDI4jHw3jl9Jy7/YWloXalbNx3Nr2cHIxrQohrU8Q5t/HDuge18/VjsWPSnNqhCDUI
         /S1JlW6r7wXvcAA0JEVeh16o63ctJke1FOE5a/uPg/RsAODzWnTi/ou+nfvRtuilbuj6
         g5YCn/CPPh7mjxKARR4vV4esbj0mc0DTPKqpwOz1B24lfzds3B6ByJfGakBJEWBWYceT
         oSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461886; x=1790066686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9q5GLhEmb8pBQpgxh9LfIHNEQ3BulUKIglALGzPomE=;
        b=HfGZFoUwi+YIB/NValTJ3dYehgoXSlI2rto7dqNNfgfcqbcPA/aJkxrqkfOB+XmCRs
         ZH3PwuONC7TMCoGvzbBLiClnkANS6gnQHcwEYV4hJqURV+wuOJCh9Z5Kd3efeeBe5K5X
         uPp5XIONNcnCJ7J28Elzgfr+ajsAWKRFeWq81nz48J5OEZsseUPEwpCbyMoIOIRPHH6N
         kXLRgxKBJKJctukpCFPRwX7rPUeB5JgJYMjMDGoAMXJEy1DK/VS5lhxKOAABhf0esEj9
         864NOgWpTdwvpvuuKyzRZhWY7KL0ywDIKmp0jsz2p/PHfmXbAQaCBQTQkhVclmi7rSwY
         Us8A==
X-Gm-Message-State: AFuF++k7FOnY/O7WTv8TvIFdXXVjodAApNAoqEWJICFA+xdfusm+lS9P
	0cYViqQD7lkmFngGDDA5EG5R6RU77G8vfTTPPW4XpWcL3Yd7hiJDrtUCfT+OU1s9
X-Gm-Gg: AYBFou22B2ySKX0xRXBg2IxkHQoB7HKm/2f0wWJqnC4WNSzu4fF1H8eIPQ3UHLA367b
	Yr4QxTXHkknKceVi6kI0hpTPmSNZl3AtIj1WdOKIdpSQFTW78y2YpF4w241GvRwPOeRPnGghLMX
	olXgQTSt4lX++Gcdh8cDRx4J5Xt8ZdNQAjXaz8unowHGBMaJ9T5oAwqpSXLfwAutsHhCxTU7zpk
	rurPmlxxLgVfI00qjmzDNbZ08Id9Pfl/gm0d/ZAdNg58RZBb7GKjiXoix/E9g3nCxxfZalCfAyD
	/Swp8jDRCyLs8wkxeCvd0nWF86U/le/tsebgsVD6zxbckuEGvmr+VkaysxVnzyXOJdVDQiq379V
	l04ZAjJ1L8AIu4tMsyPHmZXXNGRbqmmN6A2iNBvpqwY5chxhKgld9d4VFkmqk4uG1+RaB2lAGvY
	zZ6JpAnZ7IxWmjkKwqVmVhUMT+9jtzU5XzgLq7WLHTDnE6a5KcCYjaIrkVrYPsp3KSjL5LV/N/n
	oVoEj1uvc2T1yBR20pLIJEolw==
X-Received: by 2002:a05:6a20:2443:b0:3c3:8c91:5da0 with SMTP id adf61e73a8af0-3db4061e3ddmr13173703637.15.1789461886434;
        Tue, 15 Sep 2026 01:44:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 06/23] ALSA: emux: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:07 +0530
Message-ID: <20260915084424.1007757-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/sound/emux_legacy.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/emux_legacy.h b/include/sound/emux_legacy.h
index 1127e30d33bb..55a7fbfb9bfa 100644
--- a/include/sound/emux_legacy.h
+++ b/include/sound/emux_legacy.h
@@ -5,7 +5,7 @@
 /*
  *  Copyright (c) 1999-2000 Takashi Iwai <tiwai@suse.de>
  *
- *  Definitions of OSS compatible headers for Emu8000 device informations
+ *  Definitions of OSS compatible headers for Emu8000 device information
  */
 
 #include <sound/seq_oss_legacy.h>
-- 
2.48.1

