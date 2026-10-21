Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581962;
	b=ftaEEK6Hm4o3fe6vEUfWJRoFS2cf+Wv4OwlTxON7pXt0rAt81RCw2gAHSFilN19yN3jC
	 Q6IFDesC7Eqyj7S8CuEIH9kfKJiII/6lVqdW4rQAxkAGy6tLzuohNjsA7rzrh6N8uc4Iz
	 VWuYO75eeLyjexmZNwUeRBPnIfa4k56Kkw/zDfCuri/TxLWpn9Zj5hcm4fdGh/q0xdzql
	 1ulAba1m6rxUPz5n9NvIzdlElvxChdcNFhP3URB2F1jlgjFxVXGMzoIx9nPmVwCwNexIm
	 NdAbSARa4E97YSAv1TQXrnQIo0gPmxL92jJjdaxASp6iw/tgAQDPupffIUwgadn+efg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
	b=b9nut9KOaACcdOmm+9NvnFHZiggWrgWx+enbb9I2twcJbX27jYJrAca0Lu1gmQPH7HZ+
	 1V/pXv5j+Zkf2OI5UTD1LkQz1JpL6p3rQCygSCIR2qPgMz6tTN4UUwR85veqrINAZZZJJ
	 UEn33g8G5mH5eQriwjpGf9SOPzqAYJ53DBov4T8HxSmQscO+afgDWhnGSBkWMoAPNK4xN
	 FAXq9gc3Dgge+2CRbMhfb2n1o6a/cf7VGW6ndvuopTfSbLHTSH0QSs++gu+m4fOu+EBdi
	 MdRv7PGt5wL9NlrAsAKffx1YUElR0UZB0r1zbpETa43abuv0vbRg+TY/J0wx1snLw8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkLC7HeY;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A91606A324
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 11:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A91606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkLC7HeY
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-185fd3a4ca3so154150c88.0
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792581961; x=1793186761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
        b=KkLC7HeYFLkHWL6a/YJIjripfrp8Tlbapk9ls0aJmQSlRiHSs3GU0Xa2g9vkueejnn
         WGepQ0sG8Mu4CLV8tsdpkkx5sVuMVlnWNE3BU7BnRQNGMqEdP+T9wl40+sYZIT9BZjA8
         akn2KMFElAh6pXjn86N+wFie2wmntjE5RYBkBxqwaHx5kamu8DjWGrwqgPHrU1RMrSIb
         kUeX40BH0ZXQ9y92VNIusYxBx+5sp60OUrmIX3dojenW2z0AyyH+N4nd8CpixI/EQqK3
         ft3iATIbj+/QXBxEUpGMwDSOs9powJaopfl7VRpwByD1k6ZQZitxxiSW/J1EHUeC+TJc
         C57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581961; x=1793186761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSgU66UvvSwylDygU94JyWQL1mKuGXT9QBuCeFw9T5Y=;
        b=TPNvK9ed+KQ8et+bvm6CWCGrpcRKdBz/Mk7qK88D4pF0bfTVlmAWl++k9+ZBXQ1uPL
         13CZdmG9QpNASE2o6DvDJWLKkXwnlCEFDnaYBhBCghzHta/oxGtbFR2LJE3inyT17SLe
         syfKnVDFYnmu7Q+gRDUFHvJn1t2BI/rIHZfClIu481USJOwgd9oXjlJOXoyTSCb1s1lL
         j/luNnaEDf/Qf1A+gGM8fGFWuCTb/Vx1Bs9bSrW/mCrZ5DS2W80XW16mhc79zOhe5293
         Fl+rsGT4/VL6sUY8MTUwBtLCT7RHMHltmDKGptHsm2SYXf3wT90Iy5TJXGA63uXgYn7c
         kAqg==
X-Forwarded-Encrypted: i=1; AKwUvBzV1oumiarPo+XCb/Tk5buB4ZG4c9lv4gJwxWSYdrcPxF9oygABhBflogolWkHl8I+NUGk76yR1Q/XxyA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkzpacnC+VXY7dVAIwYF3B5R60RiL9bHG7P9vCw9NDJnRg/5iQ
	xslp26VRHyUhxE0g2KJmpToDtrc/9M1YTt1grw5HijgsRaYP4LIfSiXr
X-Gm-Gg: AYBFou3Jen8b5lEZ5mzCqWzbhJc83/0vvcTNqvFJFg5O+TsotJAg8cWBB5ZW2vQd9Bj
	e0QnqMg5lPO6I4wrShK5Hg7v5Ga+PXD4/h32vqTcXNbWeV1rFmue2lup3BD7EzN0qucTcA8IwoS
	1Jvzu2Zp4sQ29QH1kQfQYNpvO9UqeyTf1NI8YPtSD1ANG6Af8iyzEAg5pq1L2W9H9nflpnnvRJG
	LOgiEjWVcs5RUxlM6OYGyEiG/N3tRh/snxfElDptOob8BniU6CCuOesgkjBGofCMRmKaj4c1cbb
	7yvGK9LPcFcs5ODwWRKsqxbCtZHGeq/FArl185Cqpvf6OHJyDG53lCWs/bxqCqAFfvkknU/AhC/
	mMncFIm7J++RIYBzqJaTvMHDThmHkUfQaafQAeB1Aji3xZKXeCBp6tQgP16yW+HXnIU4UqRmIWQ
	vZpxjdFXZUrtJBZf0TQ084YV5K5ASeACak0ZObUtmEGd07bAs9p9Sa+6g8eAm3V8m921JPZvPUe
	Rd9eJFgqHLGnbwTyvS9E13iBxMg1/I9fPvGjynSAsC5WOAovP1T8DIsX+RlahUgGdbXXHeh3SjH
	dOkxmS1g6HJbrOJtsT3m8rAB1vjQcu2EBNFKWmDtF64AWkAF33KNEaTbC7KmMYX5Azw=
X-Received: by 2002:a05:701b:2051:20b0:18a:d0b5:fa42 with SMTP id a92af1059eb24-190a604f7f6mr2326894c88.19.1792581960622;
        Wed, 21 Oct 2026 04:26:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm5810344c88.17.2026.10.21.04.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:26:00 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] selftests: ALSA: pcmtest: Compare all captured bytes in ni_capture
Date: Wed, 21 Oct 2026 20:25:54 +0900
Message-ID: <20261021112554.4037107-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The ni_capture test reads rate * time frames into each channel buffer
and then compares rate * time bytes. A frame is sample_size bytes per
channel, so with S16_LE only the first half of each channel is checked.
If the second half is wrong the test still passes.

Compare rate * time * sample_size bytes per channel.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index e025a7bac26b..18ee72d5d4c9 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -265,7 +265,7 @@ TEST_F(pcmtest, ni_capture) {
 	snd_pcm_close(handle);
 
 	for (i = 0; i < CH_NUM; i++) {
-		for (j = 0; j < params.rate * params.time; j++)
+		for (j = 0; j < params.rate * params.time * params.sample_size; j++)
 			ASSERT_EQ(chan_samples[i][j], patterns[i].buf[j % patterns[i].len]);
 		free(chan_samples[i]);
 	}
-- 
2.43.0

