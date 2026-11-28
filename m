Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837338;
	b=d9RjEI0dw+O0sVtazZhQNFO6LkaNKMVnK8Ut4Dru3NU3O5NT+cmcRb8ROIzXTrTshO5n
	 IgJEcwZEFKxzAGq93F3zzPBGcFwtWfMVQhVd2a5aGHKMXCcCSK89gQ5luUxGyt4YKgfSs
	 tDRjIA2RLjWZmQmF7OM3YCS0TWXvxDzizYKhJicZ0fyjImA/T90pBGMGl7+hAaK2ZPTPc
	 Qo+ADLyRzGVe9AxFSyLYrpU1/KVKPeBfXD5LjNPoLz/k5vGJgQVGEGbEHsuU4hhkSbb/i
	 RR1465xy9GnJcVSv3DbfuYCnoz1aOAREnPSAOqIKP786nVJI09wB1bWCr+JPlhMhNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kWwklMq2u8/SctGcEuICjrB5XV5JOccfY4onwd9F9NQ=;
	b=P0pvwiwluvGGnEG3t+vJ4sd6Ua1pLG4FRfgAOJNAkRqZifbMkpwDlnk7b3j+G3ckv/Fh
	 dHJT3FuxQQSt1Ebz3OaDEM/jh7op8+Kt5KpUNihaLSUG4NeFNle253z8GkbILtSzLEjJM
	 sxRjbKMgaWzFq+W1gFgl/CEOFzxZ08b73qwkd0JfpAl3RGr6/67a/ZVqHGEqNLbK+pFrX
	 9q8QZrsd+eE+IGkAPDhW5lZLqJBeAdIoDwkRj8ve/fW96xIvBLR+7mPj07DvSoqYjpBWq
	 5ALFgvVHflqclAIHNZ2SUxxGBYFo5/zhIP1WumoPPypb4rLC3JVWgzzKqPIq0bJ//yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhFG9Eha;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F0606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 03:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhFG9Eha
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f066274caeso41763155ad.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 19:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795837337; x=1796442137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kWwklMq2u8/SctGcEuICjrB5XV5JOccfY4onwd9F9NQ=;
        b=bhFG9Ehao97BTtnkSupaQXbbI53kjo9550B81Yid0Oqtm8slxQfNUkvX6KdfP0vZ3T
         d+4twaWhyE2RWOQp4EbMimO6CVnt+bAukd3hseSrqy+nfrJrxgIBFAwTD/L52HEt+hJk
         TNL72OJ8AUb+v9oNVWECaICj0xeiHT7wCPuluJrIiWbpkpJdZUBsx5x3xl+oPlbQkC/i
         ALheGPnVRniIDmaZAEP2udiJ9LWSAbCnlO3Fcfq0vKJTmK3avKHFiVOnGNL+U5Qbi8jb
         UcaXIImpTwekOHzThz1rvnn7VDFX7w5T6x0l7M7hrRIe0n5fyhjABmLQ6/YHiEkE3J8m
         2fHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837337; x=1796442137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWwklMq2u8/SctGcEuICjrB5XV5JOccfY4onwd9F9NQ=;
        b=cnqoDXhiTEodcDeN+Jx/UW7RRfnnzw67HXPJK/llAAzBpEHcuGgLwaTD88QLkL7TkF
         M1ur+BSaZBymzvAgmK4UqxCOwMpzMdjm87uAONg+Eoq7Hth7lYzdbdK8cSVtpXfiIlpu
         4Kxbxuw3qNZDQ83w8y0KyYF5N5OxdBT8EI4W9ZyZeFGLA+DstUF9r+gTY2cLO+QhCX1j
         I4wV/4A+U4gUh9PRIBTPHHVOyaZdtQB28Di5DOmMLShtbHc9a5zAAuhiCIw3Zh1KneUf
         4HpECg81yT0x2YCfFsHH1GGF+1hJpelffeH+SqkLAiDTRb4xYAWhf3vE9T+zA9pwdxDT
         5nwg==
X-Forwarded-Encrypted: i=1; AL+hErG7MyLtyb9Ip680aOEbH2gRx8hCjo5oiiQCcKSOUEGXFmxfzGiFTqNPeFxGasX/yKsTD1hJKHYmrxzFqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mcLPClUHXUnP0DwGmDJO7/1N70qSKnXp+WTgjj2LuGmm+kN9Q
	9y4KW4vDL2ZKwE6kkMbcJmo79bkN1CBU6ekJuVFOWpxBPK/ybp/UR/oE
X-Gm-Gg: AZFdTZda/BnI4MWNyvdqEcNHeBRrMnPy3wRCrj/kwUjW9bMvrC6JEWMxfjYKNkxBgn/
	1HH+UJnV9r4ZCX6UiGLrjgh15cd+mJR91o16vfo4h7TM5Yh8er1Tjms2hu4QOy1Lb74opx+xiCr
	/LKn6TBmSUJiMlDnLF7IS8Zw7Mqz6YdVZrX6Oc5hgl+N6kcK4gMv6ISoSUZ7MFJjDpavBkQVL4H
	/VlMEpHl6hNmERLO5d3O7GnJjgbZFTdJ+L5O+vrJ5mctifo1kbcmkzeeAj0R/28romq+NrdyB24
	0ID183uUIqyBuxx5GGbp4EQZmIqHENcqpyODlaET8S084RMYorCKJtY1oqqTCLbtCGEu7LQt6Oi
	zwjNToIHetLiepQlBxvgW6aDNCitSe5EDv/+VbUaZEeSgqVO+q4cmSUbpe8R3z7LjA0EdQUEiCv
	2ftGg1OO8lxlO1q29hzLLQZYKWcgzHb/W+gIzBZ3wTX+FG+jL5JcfoaMR/BkrK2PL8tUdKB6SKw
	HxFe9NGnFBjqz+ZTFo6xnxsFVVp9JG3FZR7Zf3fvz/Tunj2h33YaaBKOOynBNqDFVCf8TRyQu10
	/g0NJRUgPC0bglN3+kCAabuTpq4=
X-Received: by 2002:a17:90b:3810:b0:3b3:cb3b:1965 with SMTP id 98e67ed59e1d1-3b41c8fe1f8mr26427976a91.16.1795837337195;
        Fri, 27 Nov 2026 19:42:17 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm19491352a91.3.2026.11.27.19.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:42:16 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH] ASoC: es8316: fix MCLK_DIV clearing and 20dB mic boost routing
Date: Sat, 28 Nov 2026 11:42:10 +0800
Message-ID: <20261128034210.746029-1-idleassetsd@gmail.com>
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

Clear ES8316_CLKMGR_CLKSW_MCLK_DIV when switching from a halved MCLK
back to an unhalved MCLK rate, and wire the missing 20 dB microphone
boost Differential Mux DAPM routes for MIC1 and MIC2.

Fixes: b8b88b70875a ("ASoC: add es8316 codec driver")
Fixes: 869f30782cda ("ASoC: es8316: Enable support for MCLK div by 2")
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 sound/soc/codecs/es8316.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 334ac9119c..f329771bf9 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -305,6 +305,8 @@ static const struct snd_soc_dapm_route es8316_dapm_routes[] = {
 
 	{"Differential Mux", "lin1-rin1", "MIC1"},
 	{"Differential Mux", "lin2-rin2", "MIC2"},
+	{"Differential Mux", "lin1-rin1 with 20db Boost", "MIC1"},
+	{"Differential Mux", "lin2-rin2 with 20db Boost", "MIC2"},
 	{"Line input PGA", NULL, "Differential Mux"},
 
 	{"Mono ADC", NULL, "ADC Clock"},
@@ -514,11 +516,10 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 		}
 	} while (!clk_valid);
 
-	if (clk != es8316->sysclk) {
-		snd_soc_component_update_bits(component, ES8316_CLKMGR_CLKSW,
-					      ES8316_CLKMGR_CLKSW_MCLK_DIV,
-					      ES8316_CLKMGR_CLKSW_MCLK_DIV);
-	}
+	snd_soc_component_update_bits(component, ES8316_CLKMGR_CLKSW,
+				      ES8316_CLKMGR_CLKSW_MCLK_DIV,
+				      clk != es8316->sysclk ?
+				      ES8316_CLKMGR_CLKSW_MCLK_DIV : 0);
 
 	lrck_divider = clk / params_rate(params);
 	bclk_divider = lrck_divider / 4;
-- 
2.47.3

