Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7E2BD5B2
	for <linux-sound@vger.kernel.org>; Wed,  3 Sep 2025 05:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756878752; cv=none; b=phTQZzZHErBxn+Edv255jnUQHeEerAhzfcTDFYzrVAqZ0yp+Sk3AOBLb7uQpfPZhesnvAZ2L6P3WJmH/sTVlm0UORKJXnJTOe0izvrhVA6urMqeo5w1zVC/9MRwSas96p84LMWbuKVQOnKcT9m0em+t2cOLhZvm7KjDFK+lOCwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756878752; c=relaxed/simple;
	bh=pUTayYOusLzNmrYT5IbElVRwDbAaKIqMxWTMYYd647Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mhY0qpiqtc0Kt14uVcaCmfGaCwnJT9KqLPyuFK3NKMwCx6ovvLPR1JJdD7ow3ZJmo/5Q/yQutmYGU9ohYG7rj0WQTjhvoxOoTmGTL3YjSKhpqCKstHgULc03fQq4eMBrD/hoMUMG31+oWDOC1hIxSdPPFKupFnW56YLt5/ULGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcRYAlDw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcRYAlDw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3cf991e8c82so3376603f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 22:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756878748; x=1757483548; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2SHfXlAMbQlOhrChDAPutEQWuy8htWNPwTHbTwvBXo=;
        b=WcRYAlDwjCIYGQptIX3cWB80pmoGrDl5OUHWHQmjayWvBe21c7yPXtZgV6fB7DAgzs
         ySuGp/8HqUggs/nJNVLmg1MH4oEvDWABZc803qw+/sIAUNuOBMiVPxo/a9rNEI6tja9y
         XsVCVtNK0bzMFBR45TdlhOUUuFMVXKrlc5h5PrZfg29idx6MeeZVSuku3dByPWgHiOoP
         lbgFA+bfst1tZ3ArYbFom120c+mlDn420O4qjqJFckA22zu/GX1/M0SiEiXx1miQvCG8
         u924iYTrX0LQqPGRxLDe5z9wFP2CF36kD0skqjLMD0FEMDK5GLy1d3VbUs6+S4TZArnC
         nwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756878748; x=1757483548;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2SHfXlAMbQlOhrChDAPutEQWuy8htWNPwTHbTwvBXo=;
        b=L8QI7I1iIbZDoeADoesxPkhiRNDL8v83xtkSjfQbtM+24k6nxaKDnv89rYEgdopqCG
         JsZthHt4mut+GMzFvL6ohzfpE/f+8Q80BCySK4BN9we83kxYTxNo1zAKhXumAx6qQa94
         2DrA13uNCLFypg3PxyKz2negIUOAqGSG0lZRrRHJXnrUjQr2FeQ/QNKJwVO57wOkcJT9
         abblnebacszg+215DDQ2X6Tou4zXwEx7Mt7+kPiAwwf8BKgXraSV+kwsS3kdyszD9ql2
         cbbZ0NmvY4+jvT0h9MxpeMvh3HMc9LKN4ELxeal9+S4G9D0n65TLJOxlA7Aa+Kct/p1G
         eUHg==
X-Forwarded-Encrypted: i=1; AJvYcCXDDb9nrh8Q5/2LTPgg3f8lQSHu3AgFlhElGTzqRCLnXNiXLvJtORJXGYxgHyiWJQDSQMe6NFQ90XfIRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjzU8kIX3bsU7S0VBoO6UyUMtHq0vpuBoNDaDPFwF1O5iWHQcD
	p+1w3nS52LJE+9Mcqaiv99Er8v165OhGLJlTcexhFCI9NG3kPV3R91eRJJVtz0UzloPlIjf7Pbj
	Vx6vb
X-Gm-Gg: ASbGncsV6azBq6cKclmFqPxa6OCTzQEGcXeMKnkUbBTzzm/0wzAXSfFtUjCKvfl+eWJ
	rJ+reZhA/DU94i4N09ctkpXKXPSUDkXn40WeUDBesxJxdnmp6JOTJF4SS5ul+uRK/HNlCRMtBmp
	6Te3ihiAehBAvEF5gX18Xl0P9V7dHsaQclqHj2G7AnYezSJxDuesYspPCyEHYha2Uu6GPIE/nJW
	Zy3G3ABayi8Ot/S4aojee3kaGwJqt+WTbw4DwGk2u4rt7VPGfQdse9L4zeTSWeg1gyJEPpNkoxI
	JvnhU4oOAnasWeC9XSmf4+6HNE+3Ne2EwmCNA8hD6wEDvohJphVRX2osKvF5PnbcDS9A2jp5QYm
	5CYCzR7iSNy8QxuMk/xRDCe2rhQ65SJ+znAMGjw==
X-Google-Smtp-Source: AGHT+IHmTYpS8pExI03NdGUx6gu4VM382Zj6xNSSMkKqIjXWiMXf3gSWFiBd4pm21+i3C4X/vRakRg==
X-Received: by 2002:a05:6000:3110:b0:3cd:6cd:8c2 with SMTP id ffacd0b85a97d-3d1df72effemr10191588f8f.60.1756878747702;
        Tue, 02 Sep 2025 22:52:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d21a32dbc5sm18690066f8f.11.2025.09.02.22.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 22:52:27 -0700 (PDT)
Date: Wed, 3 Sep 2025 08:52:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Stanner <phasta@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ALSA: rme32: Fix serialization in
 snd_rme32_capture_adat_open()
Message-ID: <aLfXmIQRFTXr5h8O@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We accidentally deleted the wrong line of code when we did the
conversion to guard() locks.  If the rme32->capture_substream has
already been set we should return -EBUSY.

Fixes: 8bb75ae244c5 ("ALSA: rme32: Use guard() for spin locks")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/rme32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 123dddcb6972..ca9bbf554650 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -936,7 +936,7 @@ snd_rme32_capture_adat_open(struct snd_pcm_substream *substream)
         
 	scoped_guard(spinlock_irq, &rme32->lock) {
 		if (rme32->capture_substream != NULL)
-			spin_unlock_irq(&rme32->lock);
+			return -EBUSY;
 		rme32->capture_substream = substream;
 	}
 
-- 
2.47.2

