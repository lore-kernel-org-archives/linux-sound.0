Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4BB3D331A
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306081; cv=none; b=L32uT2sMILtdhq6IitKi+oI77I5AuB0TRW2OOmnkWtWU5Yqg6fdmEAOEM1dTky++Xe3C3DmDqpan4d4W7IIClzh3VKyyVv8drS6ay9VrRdviPs92BE+HYBVstUlNbfIzKwRYkw2l/HezbCuDjvJYZ2AqwBNyprkWtcj0ERKwp6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306081; c=relaxed/simple;
	bh=277ziCn1Jz1MkVcVlHmZTkndu4stgsoTeDpH1SQFyhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixIb6mk80k2qsNRqZbFdQVYQUQMp5Wx7c4pkWBQn7FFhu++CiGCcPjl8boH+9eo75bZFZRmAQHbNieJVq0/OmYm9bm5kWjHEWoJQOPVYGhWNeYOrJ/pHQsDTN5sCP+gTiSJlnWahA47ztrCebZPdY2ez/xP1q9nM9Ofk+z9Uj94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqR4QxUg; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqR4QxUg"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so5439055ad.3
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 23:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306079; x=1792910879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JSEDJegNm1H+PkgrZHxMvnZyNx9okv9yBMulmHZnYuk=;
        b=VqR4QxUg9kPPw+geR8pkX2DCJgl0w4ZOYEPvUzeJpivt4z5cGJYsp0qJTCo4baUmzB
         5hnpEXd9BUcNyfX1Q3kyes8u/tWxnM6JY1S0WpRBBihtk+5Y+jJRuB/C3YWdpnQmJMUU
         osoA6bRprBjY6bOC6KwVR9AqJ4uJTfGDkv4OrgkEGlXrlF8PkIe1p+UI9KHcrBiEmMOT
         6LNOVWIOylrSLWfaDd6K0NEX/OBpgC7/gKxcIq/aB6FvoPGuYdg4L6LpatBvL1uzoESA
         ViSU7GM36jlxU5NYsSAQZhpduOrLDVmsU3Wm40UNViAEO0YSHO5f4W8MyxWqpYKBCFNN
         xPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306079; x=1792910879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JSEDJegNm1H+PkgrZHxMvnZyNx9okv9yBMulmHZnYuk=;
        b=s48Ki2y6TF6/MAEIwl6Nsfx+4sVYsY7VMzWuXw8jBFxAVMVF2oMhkaMkzl+9VkBW9e
         jo7yiFALlAJvBJlL3ggFR3HDLh4x4JpWdZX9PoWMjMbk8ooFLwQlf6uS+ANjPBTAzFmk
         pQjwGaYpM3WKOIAXEFhWyXM7avlN4eqcNxGlnF9UuLSEeruYgWbyZH0rPX0/XbD8BuJC
         VWXyFDVlBFVlOiYAq8S5b9eDx2afMWpQ13i0Yi2YiGVE/O1OvG8Xbfi9lFani5oyCSVF
         ZrU3Ys71CW5jw58FgEPyiwUM47EmpZxeKimNCnk7j28Hx/6+j4CtElPdzB77AlJGOhB/
         8nzA==
X-Forwarded-Encrypted: i=1; AKwUvBx80hW6JDVC8j7ZnIvajxhroTSzPhH982LGqbS7bduLgx9qo5b/rce95JMU4agWolAo4f0gIoF5UL74jA==@vger.kernel.org
X-Gm-Message-State: AFq9FYILmas+u/OKOvcc+XHU/bbhhwbNK5JNIJZypZhMwhxrVdVqCSVo
	ehfWrRBXWmsKi2WBELSDOLzdgDsZs3wttz18yLgSY1UMPFtcUH1p0BvA
X-Gm-Gg: AYBFou3+62zYW5uj3TwrVG38yWkE0uIpfPX1xB94FmzMbgmdgur5FtI3KmOuGXNSWQN
	RhdzTIvriTHzPstx3YFeVeXqYYzhIv3Yi9akTuG+/Cjot5bSSf5Zs4zKhLGn7gY4qOi7Ey1gO7G
	mSoFCGGjlhtfcmGVdH0Aoqz0kj+DkBQqZx/S9mFy0WOh2YPgY9B/rY6WYROC10YyTbxH2djtpnz
	1XzJAlz+FcvE0r80bGYeSYbMxZixzNkAixuSZRZz3qvbx+d+qeUMEwlo24Lyc0neoMN+C3jz/HX
	0saaxvFaj/WWMxgYEZ4i7IuoKom4tzl4pl462+o41edaRfjMtWWtZxcl9tx3+hoz+L2v+q6GB/X
	3fwxlRgCQ8GVL4z9a33mu9kWrz71X8h0khxb0L1RjxH5HNqgdWsUQzDMIlRwTFfesGoeJNbbGkV
	AydUFC451FkVUDcdM25vR8BlDNW7IUk8Jm0GwFzTVyUFoMMSpaaMOOp+Qx390d4q90LDjuFg1vl
	gOtiEwtLLgLqDtYtHfTFc5033ib3xq7lKSyVH4xXuwM8RguktWiQTtpG0k2aT7Popx8+qsIOlc=
X-Received: by 2002:a17:902:fc84:b0:2dd:76b1:34f0 with SMTP id d9443c01a7336-2e9a69eaa42mr43928235ad.11.1792306079624;
        Sat, 17 Oct 2026 23:47:59 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm27280335ad.74.2026.10.17.23.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:47:59 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	marex@denx.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: codecs: sta350: Fix definition of limiter threshold controls
Date: Sun, 18 Oct 2026 15:47:45 +0900
Message-ID: <d65a21665a1e0d63dec174dd3691bd97764b8ae0.1792135145.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135145.git.sammiee5311@gmail.com>
References: <cover.1792135145.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The limiter attack and release thresholds are the two 4-bit halves of
one register, so their maximum is 15, not 16. With 16 the controls on
bits 3:0 also write bit 4, which belongs to the other threshold.

Fixes: 2439ea1f0f8f ("ASoC: sta350: Add codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/sta350.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 95aee5aa2bff..acf5dc618398 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -502,28 +502,28 @@ SOC_ENUM("Limiter2 Release Rate (dB/ms)", sta350_limiter2_release_rate_enum),
  */
 SOC_SINGLE_TLV("Limiter1 Attack Threshold (AC Mode)",
 	       STA350_L1ATRT, STA350_LxA_SHIFT,
-	       16, 0, sta350_limiter_ac_attack_tlv),
+	       15, 0, sta350_limiter_ac_attack_tlv),
 SOC_SINGLE_TLV("Limiter2 Attack Threshold (AC Mode)",
 	       STA350_L2ATRT, STA350_LxA_SHIFT,
-	       16, 0, sta350_limiter_ac_attack_tlv),
+	       15, 0, sta350_limiter_ac_attack_tlv),
 SOC_SINGLE_TLV("Limiter1 Release Threshold (AC Mode)",
 	       STA350_L1ATRT, STA350_LxR_SHIFT,
-	       16, 0, sta350_limiter_ac_release_tlv),
+	       15, 0, sta350_limiter_ac_release_tlv),
 SOC_SINGLE_TLV("Limiter2 Release Threshold (AC Mode)",
 	       STA350_L2ATRT, STA350_LxR_SHIFT,
-	       16, 0, sta350_limiter_ac_release_tlv),
+	       15, 0, sta350_limiter_ac_release_tlv),
 SOC_SINGLE_TLV("Limiter1 Attack Threshold (DRC Mode)",
 	       STA350_L1ATRT, STA350_LxA_SHIFT,
-	       16, 0, sta350_limiter_drc_attack_tlv),
+	       15, 0, sta350_limiter_drc_attack_tlv),
 SOC_SINGLE_TLV("Limiter2 Attack Threshold (DRC Mode)",
 	       STA350_L2ATRT, STA350_LxA_SHIFT,
-	       16, 0, sta350_limiter_drc_attack_tlv),
+	       15, 0, sta350_limiter_drc_attack_tlv),
 SOC_SINGLE_TLV("Limiter1 Release Threshold (DRC Mode)",
 	       STA350_L1ATRT, STA350_LxR_SHIFT,
-	       16, 0, sta350_limiter_drc_release_tlv),
+	       15, 0, sta350_limiter_drc_release_tlv),
 SOC_SINGLE_TLV("Limiter2 Release Threshold (DRC Mode)",
 	       STA350_L2ATRT, STA350_LxR_SHIFT,
-	       16, 0, sta350_limiter_drc_release_tlv),
+	       15, 0, sta350_limiter_drc_release_tlv),
 
 BIQUAD_COEFS("Ch1 - Biquad 1", 0),
 BIQUAD_COEFS("Ch1 - Biquad 2", 5),
-- 
2.43.0

