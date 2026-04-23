Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8433DDDBD
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928178; cv=none; b=A/oVyMrejYlizmnOzoAikY5qZL9EBiFyHpZgcfMJQUCvpFTe0I5tmBzsAIN+/aBL1gWO7i6OpDSqzgaH6sKdwpYLyPCPLZ3MKmsezJ28SHNIKivEllhMEZb4S4PZleOdnzWtaj5x0strCS05LmmfYE1dVyltpvtndrMtpVMlZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928178; c=relaxed/simple;
	bh=1lNCZRFETIhBr1Vkk6epqTXfzI/kKQkmv6oP4itdNbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UK9Nxby5n64XepuolIfgwb6sOZ7gfpMB7E/GA0kmjpSdlRqoQ3sRY4dfZlHL/92tihhGRM/H5zMqbB+Ol+iROTEEcJtU+tkmrLjdolKOkDq3yoqIfQGsNBI9lpPTS92YEJ4nTWGeTOcMmxu06mpRg64A4O0C9Hfs//aTyefmtFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqeBcHNV; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqeBcHNV"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-797ab169454so81129177b3.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928176; x=1777532976; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGKmSTNGemBMrvy+mTM+W1vFimf9R3yJOHV4XTerUnE=;
        b=GqeBcHNVirJ71j/7/RpNsZ5jQgTtus1ZcGTmOsBbqDvfw5g35Wc/rPxRGh3iHDKVRy
         V5bZDl4r4Lengb5ac3n3KAlbqCwsGk667clFAYBYPOIV0vESNlcpTMLt02qjCXEhenWP
         c8/DyAtSVEvUKOoMnmYCfJpMUB259jbkZXiWNDL8lZqtzD7C/l2XTfO7xnjZuQkB4mge
         l6ZAqaLVOO/DrNnoiP43WOyE2+v7qIqYD5G7atiIOyHibSI3yDSU48xi6Hc8OByo7Vw1
         evv/enJUrPiT8z5VwoDt9ASCUERRwTg4tVY6b497waBiSUHoDPekrPOGVYpS6dT5DqDv
         zPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928176; x=1777532976;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGKmSTNGemBMrvy+mTM+W1vFimf9R3yJOHV4XTerUnE=;
        b=CkDPayqv94DZ8XEM3I107K5ethMrJBdHzkZXPBJIJr6m+Jxz4G8nbjuLM1ZAdkD7n3
         yUpZF0BkCf8lzqiSUH5TmVIPCCFgbhARxv/hLGkYWfSpM8jHDDQv+sjaswOY4Zhev4tw
         36SqWoUDvZU46zhLNVOLU8UFny1Hnb+A+jni/KDGXrj6fIw5fBBftvHvX9byE6DEg3J6
         7zVTiOmS7tPv4JI05u2wHRyanKXM/FLm4McsH9pCGMZ7uG6kesWyLFfFKnwa9X9emZdX
         QE4XG+nVEiRrZFaXhHegdGY9h/As4aLjUERLMrhjiNqKtxxMxFywpHME4BjNblisNSjd
         vN3g==
X-Forwarded-Encrypted: i=1; AFNElJ8ZjFFxYhUQXJKBvosH44bhn70y6YewDbgFfu58xDZaEZ6vqkNbdeWOwhOpjdp5OPBltRiDxQ/XrGSRng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCtLMSPkzQDxnO9bs60FTS+qs4uyEA+IRCfj54ZhvJfIvQ38o
	fBbB2Bytie5Tsqigfoc0i/tzDuqk/F0abh/QpYDNKwMQV0nJ7h990Wsh
X-Gm-Gg: AeBDietjRIpyk09OQx3uTq3V81qMgTYmEVFEQaJe5UUvrhFcuqd7+96nuivzTM/pqFV
	RBkPHZv+cSe32zrxZAlavew5kOkNmYqzVq8iedXyzYfqKdbuO5rfgNOpwOHhxi4DY5zTM8P2nM3
	Lg0omlqWvwTSIL8wBggc24Ss3zwnbd16Iigw0SIcJ6sQNAajYwfr0iCjrHr2IHo8RO4VtqT7aVw
	oicuk6b1A6qk9TiG16W68WYaTbuXt9R9KWS2KIhM9+uUpW1125NksLp6qMEcNhgkHGbQ2Nv4GRn
	RMfgOswzpVvVvz/69xqMJhyIZn5ZXNNwior7cvuJDnx9Qx0pKq6T/+ZXQyBAcX81AiVaSiQX3Ee
	VHc/gPoM+KdLZKTCCxyBCbP5fuUIbkeKXQH496u4O1he3TWFAL3kdKxf8ypJ6tWQ08AMUu5EYOZ
	zywJuJuu2k5T9uHFzFht1qNi/oIYCD
X-Received: by 2002:a05:690c:7283:b0:7b3:edc7:9bb8 with SMTP id 00721157ae682-7b9eccb73a9mr270364097b3.0.1776928176434;
        Thu, 23 Apr 2026 00:09:36 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bafee18982sm32189457b3.46.2026.04.23.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:09:35 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:09:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: cs-amp-lib-test: Fix some NULL vs IS_ERR() bugs
Message-ID: <aenFqUC8X2CucQwb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The cs_amp_devm_get_vendor_specific_variant_id() function doesn't return
NULL, it returns error pointers.  Update the checking to match.

Fixes: d70fa6b569a9 ("ASoC: cs-amp-lib-test: Tests for reading SSIDExV2")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/codecs/cs-amp-lib-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 636d0f3198b8..bb0cfd9d5db2 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -2360,7 +2360,7 @@ static void cs_amp_lib_test_ssidexv2_fetch_invalid(struct kunit *test)
 				   cs_amp_lib_test_get_efi_vendor_sysid);
 
 	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
-	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
 	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
 }
 
@@ -2376,7 +2376,7 @@ static void cs_amp_lib_test_ssidexv2_not_dell(struct kunit *test)
 
 	/* Not returned if SSID vendor is not Dell */
 	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_CIRRUS, 0xabcd);
-	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
 	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
 }
 
@@ -2391,11 +2391,11 @@ static void cs_amp_lib_test_vendor_variant_id_not_found(struct kunit *test)
 				   cs_amp_lib_test_get_efi_variable_none);
 
 	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
-	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
 	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
 
 	got = cs_amp_devm_get_vendor_specific_variant_id(dev, -1, -1);
-	KUNIT_EXPECT_NOT_NULL(test, got);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
 	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
 }
 
-- 
2.53.0

