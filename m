Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43933F9A1E
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959579; cv=none; b=T+vic/9zlRaKnE1xg8bpz/HaK2XL2z0AVs6Ay+0Kji0wNbvAFD+pqUG0oADlWe3OwIy01/ky+jQTh3/+EQgWfm5nKYY6wS7qn9XDPoXe61DcfNYFrzu4ITd+NMqAbX3bVBHjE+rI05sBlHNM4Q5okzERgfhUgKCFs+bvCYedwA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959579; c=relaxed/simple;
	bh=aFGUuf3xDSnpQ+UaxlrYFrP0HME3XExUEDnMTAzXq54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GN2YcCxRawScMcQhlswL6H7ELAeKm0Cwemk2SJsUbOyMkoSeS2w34Uk4eNWVH+nVoD4ZpApVCfyUW0hjrxJhrcjGKdmt2stFwoH7lVNx45yfLkh28q+OXT4QvXmzzM9WGRQON0oitxtM/sWTmwfgGRpNgvGq9wWagzIfBXX+0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqnxIjBp; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqnxIjBp"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so21937a91.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959574; x=1792564374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTOKvTg/Ioxq0A4RaU7elh7j/jm8+rT2sWwuPZn/cJE=;
        b=gqnxIjBppVYAnrXl21ejR9P+farTvY8Lj38FR8ss6IJN66nej4KMEg2sggxzDImViD
         R81WU/EHhZe7Rf9egjm5qmgiCmjK/qrgYJ4utJd+9iJqZkd+pBknIV4fDuncUv7C/R8p
         R4aqGGhSS+rCLfLD7LNtgtrJA2jy9t/1O7/iogp2v/P/UVqeK9WFJTM8pa240kjSJi/V
         YZE8pbkImA59hjAUrv2LTXKJ74Xt5QuEoSk9kTi2Ngmucg2B2aSvcUJr2srtL2KO6WQi
         jzD0snjQBrG6yJDx/J2b+8IC40OGnv/RpUqfJcYEcRAAdGseoFPjbM+piLIESAK49lRc
         1CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959574; x=1792564374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dTOKvTg/Ioxq0A4RaU7elh7j/jm8+rT2sWwuPZn/cJE=;
        b=grWQG50JQkcfhWaTmxvdjRWHLYnevRojFqTISg82tvxbnVUGYp98mzQ79a7jqAgvSp
         N623TMAdJT9mmikJY7Wik40crmSPxUkixEbGLT1xwgnF6BLwwXqxEeJvOO1J7VB7a7iu
         Z/V3FfWhybUg1K/rt/JZ5hMqg1Pu1mnS6UhswGQGzSCAvHPtp4o/Lz8aWyvEyqudPDP8
         yw22qbet4ovBU1pk9qV3m6w5tRuScGu6tVZc1Jh1pAaJ4nSrCNvsZGNJ2L9K5Z6g4Zn4
         2922IMdSYZPmO5pISJFiWJ2kfi/6RURdA30V16Q1unLJwVCrHQhBbapAKueBQobwEQzd
         0aaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoKkXsaYLkIUVSnLdSyy2uF1uOuraTbT60jHkri3OVanh5q4hQ0gspOBrQwTdWapzq5dY7Vkdiu3dnSA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhRVQL3qdxT2hlb0AQzNwbwAJazkFUy790n+3yrywIjqLPQ7MN
	0MmZeDnzvs3hUQmhz6q3hMiUZY1pRrwFUDxiX9bBRdnK/pTrK1KcEWOq
X-Gm-Gg: AYBFou3vytaPv8WVoUWk2+yLcewczn7za/VVMwSCIukhSZ4xT1HciJheRfPJ7UtDfR9
	GFN4iAJ8Gc/GbG9yU1i6lN17DUMgpULWTDZYn9BfrFzzNwwHUhZbsgr+hRlTawF87GCfk1od3X7
	DBFqAbsdiFfNMiK8gZtXWcA8FXfWkN6fFZMnmhnMBNzlH+MMzjLyZQPU+G2Vek8Ae6hJZEwP2bA
	LMdExAB3A97Ir75dqVioA9yypwR7Z7q2PQlslgbYtysFx0u7uAPGAioe3NGsnVgmNNopTmqxwGX
	LNzfxBvEjx+WbXY3z3CFJlG5qO5lbEECLx4A82jEnLoXTDVjv9nPmh/BDhVlS8qNN9tHABQCScq
	biEyvma/Cd45I09CU71k5Gqu2Vsu7t2ILYn8Anre5w4pHp7+NO6vP8jpy6JgHLVbmNLiRYYJev5
	3Ma5zsza7wDqiLwVrhB1bYs4TqdcgIJ6C1Y8QKeqaNHe2Kl72RIVs2fltqjBKJlSWTIDZATS8T/
	ULLpfqTEBu6hQsOimomUvaaFtBeH4rIAG7k1z0vfI4+e/c/aHwF3stSRK46JRPkZVqz4kDmZJQ0
	ig==
X-Received: by 2002:a17:90a:d2c7:b0:3a8:211b:6c6f with SMTP id 98e67ed59e1d1-3ab3a9f0cc3mr12523108a91.67.1791959573997;
        Tue, 13 Oct 2026 23:32:53 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:53 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] ASoC: codecs: wm8991: Fix definition of right input PGA controls
Date: Wed, 14 Oct 2026 15:32:30 +0900
Message-ID: <5c0196e45dff1769682d885fc26e613648e05436.1791959026.git.sammiee5311@gmail.com>
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

The right input PGA boost (R12MNBST, R34MNBST) and routing (R12MNB,
R34MNB) bits are in Input Mixer4 (R42), not in Input Mixer3 (R41),
where these controls write the left channel bits.

Fixes: 203db220718c ("ASoC: WM8991: Add initial WM8991 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8991.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 225c235d3d89..157b48f02451 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -169,8 +169,8 @@ static const struct snd_kcontrol_new wm8991_snd_controls[] = {
 	SOC_SINGLE("LIN12 PGA Boost", WM8991_INPUT_MIXER3, WM8991_L12MNBST_BIT, 1, 0),
 	SOC_SINGLE("LIN34 PGA Boost", WM8991_INPUT_MIXER3, WM8991_L34MNBST_BIT, 1, 0),
 	/* INMIXR */
-	SOC_SINGLE("RIN12 PGA Boost", WM8991_INPUT_MIXER3, WM8991_R12MNBST_BIT, 1, 0),
-	SOC_SINGLE("RIN34 PGA Boost", WM8991_INPUT_MIXER3, WM8991_R34MNBST_BIT, 1, 0),
+	SOC_SINGLE("RIN12 PGA Boost", WM8991_INPUT_MIXER4, WM8991_R12MNBST_BIT, 1, 0),
+	SOC_SINGLE("RIN34 PGA Boost", WM8991_INPUT_MIXER4, WM8991_R34MNBST_BIT, 1, 0),
 
 	/* LOMIX */
 	SOC_SINGLE_TLV("LOMIX LIN3 Bypass Volume", WM8991_OUTPUT_MIXER3,
@@ -446,9 +446,9 @@ static const struct snd_kcontrol_new wm8991_dapm_inmixr_controls[] = {
 		WM8991_RDBVOL_SHIFT, WM8991_RDBVOL_MASK, 0, in_mix_tlv),
 	SOC_DAPM_SINGLE_TLV("RIN2 Volume", WM8991_INPUT_MIXER6, WM8991_RI2BVOL_SHIFT,
 		7, 0, in_mix_tlv),
-	SOC_DAPM_SINGLE("RINPGA12 Switch", WM8991_INPUT_MIXER3, WM8991_L12MNB_BIT,
+	SOC_DAPM_SINGLE("RINPGA12 Switch", WM8991_INPUT_MIXER4, WM8991_R12MNB_BIT,
 		1, 0),
-	SOC_DAPM_SINGLE("RINPGA34 Switch", WM8991_INPUT_MIXER3, WM8991_L34MNB_BIT,
+	SOC_DAPM_SINGLE("RINPGA34 Switch", WM8991_INPUT_MIXER4, WM8991_R34MNB_BIT,
 		1, 0),
 };
 
-- 
2.43.0

