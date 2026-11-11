Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397786;
	b=1JHl4KUwC4zC8O/z1GWhvwUnzlZjBZz5yjB/nJOqSvYXf8XJP1si+s4SwQXkCJllY3sn
	 W3dRhPcsbeY2lusuc+DKTESuA2Y0OUnZzQekgUXTakz6ErVQZyzoALhZwbmSEKzCMulln
	 eebFeF6eza7+ImrQFvHqwHm0DevspnUt4Hhzl+lIJTMJfGzVS9s6D7HNtJdgguRHPDPh1
	 UG+LMZHrCnLPyNcX173bvHDCTbv/o7WD0qDyRKK4LCVD6uZ5oCTjAbiHjnXonsS96Y3SM
	 fHfkAqsMC6AOCJGbXxuigImRvLe9V+I/Q9qaHlBA+PzpT+Wgs71Rp/L/K5c5cb9R4gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jO0VjvUkoXke5VYihliU8dcf5tAfDK0cqhQxSUbr4I4=;
	b=K9f+gAAbFYDk8/ShOBEuSioOy56ln8Nk/zInvoRpafCR2EVZ6EIG24N4yHA38g1Ios4T
	 kHRyXaSETSMXwlLkVx147oFqMX7HMYrUbqhBUy8LzW3sKQ13wR9Ks+bx3uxgHuZaaEi5Y
	 yXOirjKs6nxiMiSUc+pUAN2ZrdC+74yo4fGEbefRbwNalaqczjN61X8pvjuW0ZY7OOKk7
	 ra3U6pZV7p9C2EB2nog5f/oSKxA0j19ht53IM6MGcFqeWQLcSXgw/9/+lJs6cfdsciIW2
	 GxENLfJeLyXUnC8IY7Hc5LFUXsFLDdihWz7h5P202rcemVV3uikZMpeoVLNTNPRUPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CI5THnCx;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A22B606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 11:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A22B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CI5THnCx
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490585eddfcso2402194f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 03:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794397784; x=1795002584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jO0VjvUkoXke5VYihliU8dcf5tAfDK0cqhQxSUbr4I4=;
        b=CI5THnCx9XHPclhLPwF+qhxFNve7iO55qXN6ZeydaXGA7rrp4RHQPgx0ZTCGaL22CU
         dTjyYelltz9wk6HtVEIsn0OA2ruDBC+XDnxoyg6vRxET9ZH8ILgBrGyWrguecPkxKzvD
         bL9JlXWROMq4CDaKThyGwLsg98zk2F4HwpNvFXyhpFp3tAWBX7mPogFw3ubbn2YP8qyI
         kaQaMrU9ztB55Zt01SyeeF0qi7IteQgWldgKVTV1l7aZ5+dKVGsWtDRxSNBMccgf6C6L
         LOcmjz//kyFCQtn/RrO9BJbeLVYTPofalS02+CFzdRgbwCPRsbKk4yBw7WfdOHG0E3Ps
         crkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397784; x=1795002584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO0VjvUkoXke5VYihliU8dcf5tAfDK0cqhQxSUbr4I4=;
        b=TxAVRmXz3tm2WWlqNR3wOa6QUVddJU4/jz0FAYIQUElJ3Gopp118vgnsgmeKfLasuq
         JVb5gHAaTBNIJFtwF83/bRofHObdR1wjFWmEy9sgKWIheaebzHnqbaI+ZMCv0Ot7TCTH
         MYKpYDBndCqMvIFIkX4wFiFaH47uEHWnOFO8XxkjTbhtXLHTikc8Map4bfQ4ZOdUCF0I
         MmsDosM91dDm5tRqu8O6WE8NhmKEYi90JzhJVlRUn53DplmXpSggnB8w40PxRB96YWGV
         qQf9Y+VyprvT9UVMXdc2QKg/ewRYQSqgvykJl9HrWT5NuESP187chCnR8trKIaPQEIy9
         wjew==
X-Forwarded-Encrypted: i=1; AL+hErH4MjdfL2y+5xV8ddstA58jFNdmtoa24KAKegc+ZKvKC6N0+0HYLDTVCgtlrpXiCsqPot9NtwY4x38XDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z97XEhW4pDE3shAUXydB1LFaTBq6hmzsuRX8DPob4Lxlif0wyTd
	T5iMo+rzzwU5kKnyw2zST2m+wjmghUDdfRp0BmaLIiREFHSFv+Mw+ns=
X-Gm-Gg: AYBFou1OIToJVyHzOQkZU/o5ClVsqrFs4dTBBZ/kT6SMYXjsbOz8feeI+1q2siHAKt1
	pffKfepFsR85ANTcuE16XXg8DOq1ooXv7+n+OucQY+O/Q19cOsHHgMCtV/90QHTSFiPkVW25fSZ
	03P3ztopnsgwEzEPPdG5RaxGFNSCtrWQspdo04qWY3MvHqeVh8qrIAeK2LfQJmWQm/6zJZ6BfAW
	bDNXFLo7O8Y/wUThR+69GJIgQLsUAIotV6up0sG/G5sHDEMekp3zFX8/a1hTb9k63CxD+fys/sq
	2QX6Ohwu9tB8MLT7VdNf8G1uHnrIhVMq4oMRfZ0fPtGA1Vps2eE88Oflo7LslfmLDlzz4OlyFhc
	bbvAdAc8hHzYfBI7HnQlFSKMkCHVPpGMY/v+s19pFjV0bmVRTdkL9kMqEPzInS0ceoDRZX7iU3b
	VlSvq1lx0a2Osz0JYfrtAGU/bAjP69ZcL/FvhibloVz7VZYdnbsaVeRVE3QrYij+ve5VWQORNl2
	fVdXeuja9Ah6I6jOS1sLLWcIyK0V6nmozQSH/RizBfiRrR73aZ3FaUQ3vBh7Ns+Q0fDgQSTFd3O
	vXLxij/2wl3IPKrSM4TA2CbKhCDlEm8OaXns
X-Received: by 2002:a05:6000:387:b0:490:6e0f:a02e with SMTP id ffacd0b85a97d-499c69cae59mr3687287f8f.17.1794397783745;
        Wed, 11 Nov 2026 03:49:43 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm10789106f8f.0.2026.11.11.03.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:49:43 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] ASoC: rt5668: initialize calibrate_mutex before first use
Date: Wed, 11 Nov 2026 11:49:19 +0000
Message-ID: <20261111114919.95639-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

rt5668_calibrate() is called during i2c_probe() and takes
calibrate_mutex. However, mutex_init() for that mutex is not called
until later in the probe sequence, after the INIT_DELAYED_WORK calls.
This means the first calibration locks an uninitialized mutex.

While this works by accident because devm_kzalloc zeroes the struct
memory, it is incorrect and triggers warnings with
CONFIG_DEBUG_MUTEXES=y.

Move the mutex_init() call to before rt5668_calibrate() so the mutex
is properly initialized before its first use.

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5668.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index cd6245d6b91af..6748bcc63ac39 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2490,6 +2490,8 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 
 	rt5668_reset(rt5668->regmap);
 
+	mutex_init(&rt5668->calibrate_mutex);
+
 	rt5668_calibrate(rt5668);
 
 	regmap_write(rt5668->regmap, RT5668_DEPOP_1, 0x0000);
@@ -2547,8 +2549,6 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 	INIT_DELAYED_WORK(&rt5668->jd_check_work,
 				rt5668_jd_check_handler);
 
-	mutex_init(&rt5668->calibrate_mutex);
-
 	if (i2c->irq) {
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
-- 
2.47.3

