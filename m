Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665343;
	b=HDntdEiCQnGlG1OtZx3KrzcTQzY51VGrQqS/qS4RreV04yOL3rWyiy7hNC3frw7ZHoOd
	 hc0e6Bwyk70CbyalZfLXMFzJfgMjfZo/brNlrGdW4TolvmvqlW/UAuh96oRfTpUQ1OORe
	 TcSAci9FFXW9/JXMVI3TLziJk06zqe/u3KJNw6MwOXZceD2SGzja9Qw5m2kBj9m1sEfSS
	 Ywv4GYQSAzPC8v/r/Xpf2sL/hbSjkLqEqB5GfC8ZiAd8n+yHS+k807Pt9iamOvMb3tgjq
	 8iS1NIpr26jj+XUj5qUboZTjdqEQarQjMQn5tviIvGAwzE6DydUoLaXGizIX0W2F2KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
	b=EdDDH7mHvRuVDe2XLCTRQ4o5cgVW9kuDL6vOQzkP8Bi2aROOAb2Qa3R5UPmc/lFdfafL
	 PRvylJQV5wfH+qNDeG9GbBqln09ojgcsC4lctakFKIg7r8ksoKsV73ViM9gIH4YU+8u6S
	 CD7zJGBxvgx7diu6lqJvKQmIGAVWt5aQN3r78IFbnNoRMetx0Nzi//d5X/fJfKk8pyhCO
	 cRNvuzGTi49UNeumQTeXITY6CFiwUCZCPhg5mUMpy/d3a1zYRBC05A0jphImQDd+i6s2d
	 wMqu6+jZ29lyBcuTh71VrB6aInmPsrqxmzgtArkLH5M3gZh5z8lgu9wz4X0LNmB8+SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="msI/o92b";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8889A606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 03:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8889A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=msI/o92b
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso3145828a12.1
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 19:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665343; x=1796270143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
        b=msI/o92bEHnsjco9Ke0fI073BxQiXbX3VM9rf/9oUFGDcNUWNjQxV6Vno4qbzpCJIj
         7I5HPAw3UUvneqRFGSgmiw3EsQIPhKQvKSdP0gwGr+f/8Wl/tSeny+5Ff8d3IEEOcPxq
         4Hw6VKA2j9ZQY7hfSVHWwwsfSrInQ3ewHihSo/3uBOtwAwJkIuL6U8ffgIj8t81XlmNM
         ap3flkleijeEP17wAQt/vU2Niu4jI4GbmAr5cN0jLuGYyhb1bTScXugaIW+/aNkfWksT
         3vh1sKZBFclsHKi8MgF8mcY3S081l6v+n0nf9q/TS/8RdNR0AU+76wSYKFdRFc1JZuy0
         aISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665343; x=1796270143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1Vy+i2y00G6JKJcUpZ6NHQp4R1yNapu8/gu+RsdgB8=;
        b=vIh3JXKWXgiHvIsQHTzgOUupBWtfdhjcrHFPcvlY1b0vipX2M25HouLzi0Jrw1BDPU
         Kh50EMeeEJrdIiYUXFNFsCzzVP27yrBmlD6Du92VYKZzQbM9tJAPOOBG41xxZkbfmY41
         5xDh1RpnwZv5+D76/Xva+ZiZb8YcHDbji8lsh7pE8QCR65aZ6FfFgCSTRziN4b7Sny1h
         NiNfok6INevMbiYci4oLCn/ng+qYfIFWzAx84AysVjr+pgIUePsFo01GrOrM+JPxTuI/
         Z1JNdh7gEVwx7wI33pAFpPLgzElGBMNIAPR9+82+N0E2D8tYdrFqdBTwbSqeCLJqo67D
         4CDA==
X-Forwarded-Encrypted: i=1; AL+hErHrzg4Wck6622dxaQ+w5ijymrMNuXrY3X6IRFlxl8//bQwwcq+Jh78OEbA3PBOAO0L6QzGCcBMV14p2CQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xtxadGClIPaSqVRjaEzEfw/BRdnZDUTD0OfVOPFyj1qwTiFVB
	R/VKMdgDVQsuS9PHQwdZ6OQGLsjF5uJExK/ztwnS5FJwDvbthIFrm7m8
X-Gm-Gg: AZFdTZeeOByVIp7HryfQYHfzMAlEqthCsWe3/rg4CzT/xWlusnPPjOL9hiATEjffLqe
	arwG9StpT5hFn6d9NKbAHfNEudeqGYbSIbc1Ki27L/3ATZsvi+B3TVGbBKNj34SPcOYTnDXUwUI
	RgHXHIOY3D0y4vfiMT1hpUOlstqILCC5zHSWOOas7RFgF4xNB7zMditBKguvvgEv9ZqtylrGuO3
	3Axo0MqNiHZzPGU/W9rJ99d68JUN42z2KGTPTpN/YZEt1598lXnUVo90b/fKP+mWKPe607vNHbV
	G1b7SKsXiXebrU2/QIO/z5zBfxC7KKKRR8mnYKbpaHj0z8YP4PBtx+u03O2gHOQF5QYX7ncJDhV
	f6au+9vjyta+SuJsE2CASqNIV3rRSuJFzM/+NUbeH8mJmDwfIqprn+MM2JzUnKBW1dM5IBezdwn
	JfKBRsu4RhTh6Yuc/ZDXyEh9Z9iqU70Vx0cUL0ui4KyUI+v/KdM2R0jwMJUjNDczBNfaBDl2yOg
	rgWJfDf+qlyZRS6241thXBsnFKLsl7iMeesFLfWJUqf+++ZFzG9+yibnh42CIoBApa5vWO7uK9n
	ylrWWnUHkIeK/8tEFeMr5+G+lEC/gUTc+yX07tbl5o35IkExcwf5DrocCYxMYCf+JJz8tirn2Vy
	0KX3nbV9qijnCn1JW92VyrYmqFZAQ7AHmp+CQ5+mhTaG9XOJoee7tibfxBxOcXA==
X-Received: by 2002:a17:90b:288e:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b41c907e21mr18204723a91.26.1795665343049;
        Wed, 25 Nov 2026 19:55:43 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm30295729a91.15.2026.11.25.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:55:42 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Ben Copeland <ben.copeland@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] selftests: ALSA: pcmtest: Load the module when it is missing
Date: Thu, 26 Nov 2026 12:55:25 +0900
Message-ID: <20261126035526.1779288-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

test-pcmtest-driver skips when the pcmtest debugfs files are missing.
The driver has no device to bind to, so nothing loads the module, and the
test skips even on a kernel that builds it.

Run modprobe once before skipping, as the net pktgen test does. The
module stays loaded. In the default order the test runs after mixer-test
and pcm-test, so the extra card does not change what they check.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index b796a5613c6f..ea6a9e0f7483 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -6,6 +6,7 @@
  * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
  */
 #include <errno.h>
+#include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
 #include <alsa/asoundlib.h>
@@ -171,6 +172,9 @@ FIXTURE_SETUP(pcmtest) {
 		SKIP(return, "This test needs root to run!");
 
 	err = read_patterns();
+	/* nothing loads the module on its own, so ask for it */
+	if (err && !system("modprobe -q snd-pcmtest"))
+		err = read_patterns();
 	if (err)
 		SKIP(return, "Can't read patterns. Probably, module isn't loaded");
 
-- 
2.43.0

