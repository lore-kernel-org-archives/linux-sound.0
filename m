Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491534;
	b=4ZBCf6o5q2ZxvwnRrJBf3md0S9cjuZ6+R9HX1VGxGe8SHQewiQMO2Z3bS/ceyW2P2M1h
	 E9y34isl2g4KVNR6o1W4SCJVq+M/AAugMRmMRXgKkXHwpjJfUI1QqaLQJYYi1qqrNEJJ2
	 o2E74jduplkYKwJh3950bfiwdO0PL6RKLVfSUSx6/5iPxE3vmfJj0n/RGlNZN8ZEzcc9V
	 R/8/8E9abyoRTHmmDNBnWulHmTLbTGHWTloNfXUKPt8wdkCiuVH+uJY0yiyjwPTpg9d4c
	 1Gl7EeWyziCXnusWYWUsGruUz8y6Kwf0WhKfgRtVbsPf+NYZdW8Ogwea+/JkkVtFbtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
	b=VPRxptQkraQO2VZ9gB1dXoqUp/dSpxZPnEyiYo04SLuruRUd09so8svXgY8RtON5pBs6
	 jtbTuL+pcOrwhyl98YqT+cnMTCCob0yOpfibBFNK1aQVQiapCe8RIuWT3vxSFdIAXN6Y7
	 KhVK+j5G/IYMAFELVdm7S8pya/G90l8e4Xy5UZH2gxTmnEBMmLLMkuPjlvZfgthrBQcnf
	 tMbdOISy1ab2OuwSwLdkIz6t/j8VuPNCwKIYtiWP5bgHPMRM8T1i4wAP6mhB6xDII4VdH
	 N2GNHpdg+aBMi+sH2cxYh23xIYvJGJMvRmMZbiyeY3HjMUokNOWkHtWY46HgRSyiKgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JFBN4KRF;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD472606A333
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 10:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD472606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JFBN4KRF
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2711314a91.3
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491533; x=1793096333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
        b=JFBN4KRFAZ43sCeTjeCE1szadaKAUH8DaeSNJoSbW350D3FK6xZe0sGxcfgSBPZl+s
         8ZnKpscdxT5pg7lvsIl3t8JOgV0lzwX4IhdgYSSuYYKRjNgn+mtFG8SOvIs96W9pYXFC
         xp5/OVn+QhS9Y4RJkRwE2rt/K2WhZ0HCX+zqBL9VjRmUuvCsxIIsG2daC5mogziqzbH6
         ikP9Iig7ySjDmD79GiglVWN9sOHXKVf8QOb/MwkX7/2Tha+8xpWwhWtjyhI06HK5TsHn
         qE238JBOFQPecUsoZDLo+E7cGUp1qxmEkOlYAFZkk7Z3t1m1cKenlpLLY3yZG4deec4l
         6pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491533; x=1793096333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
        b=oLr8SC+zTs9smnvIY+MkzGtl9caxGv5M3pJZaXlGjLm8AIazWHK3Abrb7L4o05LDva
         Y3LJKs7IpQ+/Uvnnd0EOBwKA0uMv+JiMAbajW8y5qiLQuBxHU8y8k98zGNi7WHnwyPmY
         xNNS8o6eu1BitSJKJeStoAmAv09RyJPF9fo9pzL+jFW23VRHwu+Pz0i/5TchLMnpL4zn
         uo7J/OqDP6WZEmBsiZoMGHeQRukaSitxvyZ+8KapWMv/umBJPRbiJ4Ik97MFyH4AjI9h
         MK23UKZ8Lzdp8vYDsnb7349EMl5TJ8x6JclELcprJ/Aasg98D69y9f/2ZstIGprOI+WQ
         oqBA==
X-Forwarded-Encrypted: i=1; AKwUvBz/I028xxvjmflwFaFCsK2PXW7TOOKKktICDXZY1Aou6iFyeb7XqWKtowfdK3aAiBJPCz2Po6i2INv7JA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLKu5lRv/6ci9u6WY5PuWpXflGEF5nScvyC85eCQbi4hKlo1vw
	UYLaJA+tnffnBCtd8IpvwXzfs8fdhQmLVEXphKfCpqk9+OZKE41ixpCr
X-Gm-Gg: AYBFou1UJ7+4BbDyIpodByyF8mq70eAIBvCZaxVzVxyVYqFo5CfikmrNRLncvQZQfWn
	D3tCk9a2VEjPti1Fd62V2DvW1kG123Jx1DWXYA8nkqQR1R/rm8UCdzpfszaHLqpeoEkdUyfYHe/
	n6nJYa+yk6XTUg34JPvjq5nvnYsEyjE4K2C/UXQtGKjEQ/bea33U9lSLvmmV+feNnFCRzmnDFSR
	XChkecRH1N6npPwnLhhAiGbagABN7D4zhORy/MrLHIF6oems5vPScJMBetvXR6oOit8Z+FJMSjf
	CKUJDokrKx/aJuTRIujn51monFd2nVc2VRCEq/ID0R/g63B71tAXFL4KEWGGEkFjz89W0I1NsJk
	6x4VC6hirHdPJt4URbhLzw6O4EV8RiJlD5B/ZrmWz7kA9rY5RIZdzW6p0wwOnQKSkifY9ydSRnD
	335iLkYGJpqZViPlp716YjHqqDkd+hsH9adbm8MptCk3XN1Whj5BasNTwvZ51L1EwbEFF8NqTQE
	uOq4ZdmFAYlqu655q1yPVMy3t6Bfg2P1YVVpRePBd/tXiLtA/BkT6wmAvfXDhuHQYOgX1ltDCod
	nPKoTQ4X43fslw1/R+17QP49d/Y/WJeH89f0MTkdt02qjNL5WJ4ZTGA3VKCe4bLj4Cg=
X-Received: by 2002:a17:90b:28c7:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3acef15c97cmr8904570a91.66.1792491533262;
        Tue, 20 Oct 2026 03:18:53 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:52 -0700 (PDT)
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
Subject: [PATCH 2/2] selftests: ALSA: pcmtest: Make room for the longest fill pattern
Date: Tue, 20 Oct 2026 19:18:37 +0900
Message-ID: <7cbbcef84d2c14a2f0ec0ad2ba55c6ba0a15a8d8.1792390197.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792390197.git.sammiee5311@gmail.com>
References: <cover.1792390197.git.sammiee5311@gmail.com>
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

The driver accepts fill patterns of up to 4096 bytes, as pcmtest.rst
documents. The test reads each pattern into a 1024-byte buffer, using
the length the driver reports. So a pattern longer than 1024 bytes
overflows the buffer into the next pattern and past the array.

Size the buffer to the driver's maximum.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 5bba17434a6b..e025a7bac26b 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -10,9 +10,11 @@
 #include "kselftest_harness.h"
 
 #define CH_NUM 4
+/* The driver accepts patterns of up to 4096 bytes */
+#define MAX_PATTERN_LEN 4096
 
 struct pattern_buf {
-	char buf[1024];
+	char buf[MAX_PATTERN_LEN];
 	int len;
 };
 
-- 
2.43.0

