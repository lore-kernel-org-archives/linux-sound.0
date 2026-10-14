Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E089545D5DE
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959605; cv=none; b=KEVwZ/s2ky4dhDnpLwEo1OBrbnxTyiOJ92EsiUS2obZ4S/NH75Zm7wZbToxTud2ppMbCY8g1zrIkbsxJJ0xwk1P70N70JNjpnoO9PUnm4sgYPVplPqaxSSm5Btkn9OpMtgkDAl4GSi/RhThVomtGsGJgRW1Nf/N+x91Jqnvw6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959605; c=relaxed/simple;
	bh=4KzXMbMWURGtw+7GAoFr9pFiQiDykrKQjsNJreTuQ4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+jFJ5RRm2VVjtiLSJIoNyAwVFyFZ/kJBQpXVxeoiG995KKJjU+z1EXzx0lDHtPYbael0SHWbYHrx1D+kb0/Ogief3ePqxvqW9Vca8xk5BTn2GEy6M/ohJ/FBIDzMvyoDPtZ56T9phhh/jAFscJyHwx96W1XTCI6IfjhZl/Lpoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGUURQUP; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGUURQUP"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a5aad413so27130a91.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959597; x=1792564397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfWddcTl3OkOwHb9noMgEvLppkYLYn/mcDtOcVMzdBQ=;
        b=BGUURQUPWeh6+U5BljyIFcWliwJHB2bVVJISbmOkEfR6aCgr2NkRJSDuQRWJT92YMu
         ZsEWhNbMhsMsznvl0Xp/HTIcJYLP5Nfbk5osSdC0SiReJy/nBv0khgmrELWSpzqf5AD9
         LriVd6Osr2idTnnUXes67o9slTrOJuCBPWd+FPBX0PEQKSWJYvHc9Ujv8ts55/rk88Ep
         tVDKc9XR2jdvlbNJflX55NltEYED3FUfMXq4EVyTLlfjgJDRd/IdQyAIBwuOOzcvTjjA
         1PUc0NvVBYad68v/0pi8Tj1XyrTvpvcEVTlLWy2NsgAQQ83lBK8gGTJvb+yvdQA9k4K0
         SEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959597; x=1792564397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfWddcTl3OkOwHb9noMgEvLppkYLYn/mcDtOcVMzdBQ=;
        b=hRNpT9n/Dc/cGw/EvakSRZ45/PezTuIkteXXliV7q+JFTMgGheGrX+o0u/yIbzRrSY
         20y0T6tr25XLPSapspddiJUEOwWJMJF0Hlec93o2BZFSBkNW0E+awIsjEnQps7fYB0+q
         M0nO49zBOS+ajCq3CH4iGOzd79eWsJa+kjjjf5XkCsCqWD/wQ8kLn3amx7+ZJBvCFYEb
         iZTRkm8UARs6i24TEuPBo10cqnWANh6IftLBkmb1ZEFss6r8lgB6f+Bscs5N5h35fp75
         qADbg5gF3PB8mn13+NlhF5qGRNCh8LvuYHYhlv7y9rFayBIcOn8DivGkzZUXU3yMPDEq
         zAhg==
X-Forwarded-Encrypted: i=1; AKwUvBx7+/uJXpaIQrad3NaPhKdKDW/jW8gZuqsfXKoE1gGjIVMDufxJ/XUGbH3nZz1b5UXL0enK87zURGrMGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5iDpzI7YxGoYxKF85iNDHZvrLOBh/Uto6xSicOTZUc/LQENPF
	fmg8MHQGP9kk0HAzgwAkVb/dFzSZLh1sb94z3MaITpF4IDQa98Ls3xLg
X-Gm-Gg: AYBFou3H9mLdhvM/00haIrzsDkK6EQdAOFoC+eAbBI1y9A3t8lQldlcv2Idtjq/vOBj
	zKC0KLGE5i4D15xV1GRoMTgcnyHG7aDunW3rN+MZ7z/st/8y+Em7mBscZGy2ZCzkn+GGDdqehMt
	jza94PO8GaF71mLyQm3zEaxtRMS1jIyOYxURE14XT6rHUNrjFnx2zwNZod7jXcMqsCKecqd7nLD
	BD/E62mB1x5JzqZAaSE9PktBYuW/maFd3Z12ntBKTSeyxyS08MdSKV+e9C5i8Y1BZYuqiK0SY85
	55huE/hKU5mVSY2aNIckfDrExdKDqGEdwf9AuHf6NwTVWU4VBNg3ijnJldNYppwM2HckQJBIoNd
	odHMflrZ6FEHmTMqtziPlr3LTyiRqKRz5v4XV+q1ucuBToDL9mKpb2oUH/787Qj9DLx4PwM37CB
	rZyaqTDgrlhtiEcGWtvMeGhHCHYC2hMhsSqfXfCrYS/A8iRQNYgfBOM+uduMSkpje8ihpV14rdG
	PcMW4Ih8nRBVqR1/7nQb3HywECR4MGSfFB4jmnwLTvO6oXYfLWt5bYQFEUUu3AmfCguY/Zjul8=
X-Received: by 2002:a17:90b:384a:b0:3a8:1320:38ae with SMTP id 98e67ed59e1d1-3ab3a291871mr12456695a91.9.1791959596805;
        Tue, 13 Oct 2026 23:33:16 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:16 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] ASoC: codecs: wm8750: Fix definition of ALC Capture NG Type control
Date: Wed, 14 Oct 2026 15:32:39 +0900
Message-ID: <ce530dfb932d9e8def75059ab9d669360adc76e8.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The noise gate type is wm8750_enum[7], bit 1 of WM8750_NGATE, not
wm8750_enum[4], which is the 3D upper cut-off.

Fixes: abadfc928a27 ("[ALSA] ASoC codecs: WM8750 support")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index d3f1178c2d34..df49d813aa4c 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -171,7 +171,7 @@ SOC_SINGLE("ALC Capture Hold Time", WM8750_ALC2, 0, 15, 0),
 SOC_SINGLE("ALC Capture Decay Time", WM8750_ALC3, 4, 15, 0),
 SOC_SINGLE("ALC Capture Attack Time", WM8750_ALC3, 0, 15, 0),
 SOC_SINGLE("ALC Capture NG Threshold", WM8750_NGATE, 3, 31, 0),
-SOC_ENUM("ALC Capture NG Type", wm8750_enum[4]),
+SOC_ENUM("ALC Capture NG Type", wm8750_enum[7]),
 SOC_SINGLE("ALC Capture NG Switch", WM8750_NGATE, 0, 1, 0),
 
 SOC_SINGLE("Left ADC Capture Volume", WM8750_LADC, 0, 255, 0),
-- 
2.43.0

