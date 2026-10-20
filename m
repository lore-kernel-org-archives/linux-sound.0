Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491529;
	b=WBLo1fs1VhbxKnMGnoSDco/GD6tAkqQPh3PffQz5kMmILYgR+9wvz+5ok0Mb6kzWjPd2
	 NcXx4+Ly/woUp009ZVJabFYdBYkgONIe51RpqKCVeFFIy98y7HVp/H42/bboAiFY7sOJX
	 RUPcHrgCGorkmgZk4MjZVIPwksPhr4rTNGuh9LtKckfaL/2vwMtlUESuXjuCXRKKcwzE5
	 ODIvGrtDmCAgN4TUgWlwHty8lNXaWJFxQ9PrNg996gRpNkbuIazDmYoDSp0M4NhjJV2tI
	 rvGEYKg0HEzHAvgrv6EwefN629ObPBYpD2jy5uWcn0CZGIfFz7vYADlCj90hySF9cJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
	b=We8xhOEGOLWLPjBAnc6QQ3r7cxBMhP3pFxE39Lb4PEJg78cP2QpC7gsNZh7tyCaJGGRQ
	 Mzcoji3tFzafvhtPozcS8Lr5o152mdMm1qMh8Ca6QPA1t3XzH0NJ7hwRmEhL1lLPoBfSF
	 Yt0QeEyvPrhJHxQNguK4SRY5dwLWYCRRZD8GAEwzSK82qJDZb+MRXAFWAQOXiaIw/92uC
	 P/iARZogZG2v7yAi/Z4dhdCVK9VYP12nT2s66uZFF4YCXeNoMGsFUJeVTicZ/ng660c/r
	 KgM2vM5bzUPS8iYQk/aJ2mkxcwMgKCIBweAX7mAJV+CcmrjZg2OKK6phzAdWEIJiWUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMS5SmBK;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA729606A31B
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 10:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA729606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMS5SmBK
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1411581a91.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491523; x=1793096323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
        b=FMS5SmBKqmR3FOeqRu9NPrVBF3sRL7+sasEaKIq+pZErHIsInCvmt7/abw7PBxiO0b
         /kcXmODuJJky7WdFK3b7Yleqp5ab6o3+YBrBw9biK+8blt5RC4K1m6cHxISUY8SMOsBD
         5OBWDi08NGprHsWOpf2kTZWHdna5ZnyFKqtT/qXO/Rrkz26GGfHzJpP+D1G8up5SgT5d
         n1Xhy+6XJXVAx9pNZBTAs46c9QiLYEh8wde20OfDxsfqySCjqN3btgHlluDOt3Uw91go
         O04Xy8U2pLdq/VKK4tEqGfyvR16zqHaUkZ1hQWNzImnIa/yn2DgFHT6j5siiYQeVhogK
         Fb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491523; x=1793096323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKKt7Twh+jS4oO61F237KY5RZI9g4b/zZpLEBznPE3s=;
        b=I1wpqJ9nf3NiHPcETtenMbNL8XCvmF+kcMo6PZDK7ub+ln7YJO0+3N1XnqHAAkM+Ey
         xNe70ta+jzFTJ//vkbjOxJyCTx2Xugvd2NNK5a3CjRz9V8uiG7t1dyA3BGhNtjm0pAn9
         1U54vAmNhlfE0zsQWYhTFElR1aDMgqtiCQlkoiBGExLds/ghzldGaa/F+mfdesAmuZsT
         hjRWhYSiYCqpjwFnYWJYf6i94MPyi/VkW/i7m4+BOHSpC7OyhVh0WzcAHELBhv4bW6Au
         v3Ym1jd+2ITOycALS5j3/OVuY9uNQvDevG9u0Zyl8TEQ2Nb5RWtLgqzgXNWxvWFdr12P
         xOlQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7iMFFZZunk0fSPKA3KZWd3GYz0VcX9175IW9t1cC5CaOMWBX+Rn/ESkyJiDAkD7zPlw2O59IyUv440g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIWttxYNyK7xr+8IOwb6s0I1LRacr4P3WkR0F8SIRHY72t2C2y5
	fFOpFMNnmIR5xCchDSRSxVugYuuSK4yfJ7EHskeKsEmK8Fdk5XoyK8ul
X-Gm-Gg: AYBFou3X4Lw6QaQMzKW7sK3RFK8PcgU26csJhWRSwt5lq8JM4yg0POu96/whH2Om9D/
	8SnTAJKwGBmDkOULzJ187wV+8R6FYe9HVFNRmpp7z2tMYEsk5qwDZl1cTaAMUGB2Dns65QdBD28
	IfJC2Q/1ENLrw8ws742dIQ8bLoSJMwC5bTjYTmtfDXXhQoJ7IAZFmsPye5WmpmNt+4Ac8SXe1SX
	W3wh0TK+IEVfqCBycNpIQZi20HBfIMtER9JJe/yAUMP9d3N29LWVmDVjzHkXHUwZTOzstxVnS2k
	ivpgYA9kSPUTrI/EKz46qOVt3MkFDvIMlfoKrHqGDYhu6FuhTYTJgX732oBm7BROf0sKgKX609S
	E27OZEfyjuCyHwd0pRTZa1H8uaF//Nu3Qo8cQ3jTFbwhwlPPtn6Q0+k4L6Kwqj4VjCXwc+aBFSZ
	ncbJJyOE2KY9gEfDc9BjkgDuY4GgawAN3jBuXp7XQRph4u0YVqh2+OnGfDXqqFcl7J8XLCWvNRK
	2UuTiY2eSZDGQNLGWFeopaBb55i7kjXYU2ZgOyEyx3wCbDz4P6gm9cNVR5dnFfOOcJmzodBJdjY
	SwC4F8GnYg==
X-Received: by 2002:a17:90b:580c:b0:3ac:c03a:38ad with SMTP id 98e67ed59e1d1-3acee276f1fmr9591757a91.5.1792491523233;
        Tue, 20 Oct 2026 03:18:43 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:42 -0700 (PDT)
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
Subject: [PATCH 0/2] selftests: ALSA: pcmtest: Fix two test bugs
Date: Tue, 20 Oct 2026 19:18:35 +0900
Message-ID: <cover.1792390197.git.sammiee5311@gmail.com>
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

Two fixes for the pcmtest selftest. The first makes the playback tests
fail when a transfer fails. The second sizes the pattern buffer to the
4096 bytes the driver allows.

Tested on x86_64 with snd-pcmtest. All five tests pass as before. With
inject_trigger_err=1 the playback and ni_playback tests passed before
and now fail. With a 2000-byte pattern on channel 0 four tests failed
before and now pass.

HyeongJun An (2):
  selftests: ALSA: pcmtest: Check the frame count of each transfer
  selftests: ALSA: pcmtest: Make room for the longest fill pattern

 .../selftests/alsa/test-pcmtest-driver.c      | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

-- 
2.43.0

