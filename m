Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084491;
	b=t++FHjmFw2bbJTYGTNkhOUrpuO97uODaeYBxKG0LsT8mNTnB6HCaH5moeLrxO3nIgCIJ
	 e8BsJrkgAIa4GqbTV5Lw+dcl6EbDliTlReIKfjEX2xnvoo6zBN/VTd8F6iQExiHqulC9/
	 cj7XgElcEjYfHwtkEgNXEWMv3ldqmGFkuUpC/49MqA3j+TiZIC81YSb738nyEnEEPx5M4
	 XexbPzcF+BlvOvPOS84MoxRWnuenuG53kfAKZXLaRtvgQH2XOsyVoVHFDbA5PQNGGV+1V
	 +vOcVlp+eQV6GvqzxTe8eiG+jU3heHtQWsEzVEyrfzJI5Xfo/vPH964kfl776XQu9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=;
	b=LhP4bShz+EQ2QzCBmtAYGLSxqlb+++NtB4cL4LSm/mYnuIWtV0sO5+ax08buyM7a8iZa
	 JV58sFPbjBC68pQN2vz+wzmtGLRpBuddDA7YS3VNAX5cD8wcKBBKbxCkWwbOpUWI3TZNx
	 AjXE3XfaMQI/Hhdv5L0+U38CP/Ik1QwlneuQcLo5CQ4cN77BLMeNx35A33fOUuw3ICpVg
	 6GgD76nRe3SyGUDJxhUkuWDZRPswOhExMH+udSmj2ZgaiveI0+T2YX3419ZM5BMSrQZ1M
	 82tImpongFvO82NE5HLBym5LhGjAAFZTKmk8kYVPftVXdwIHsd+Dp6DfdFbbKgluWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezDGbPt3;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C760A2612
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7C760A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezDGbPt3
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9d7791b00so21382985ad.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084491; x=1795689291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=;
        b=ezDGbPt3F48Jsq88Y15FalGyVLHURywDMhaWjvm5dL/FmLMEYEugoJ14q79//3U8nF
         2iMCvZRuGDQXzGVdwUHsJ6AcA8ZSxFBqvBgRh2r4UmcQOek/sKEA8elnxjfLRASETnA4
         u+cu3sR0URwi2jKqXk6nPACRyhgHQ772TEwIatOe4N9tpWZkaLAiT8T43gvGn3z518WP
         pfYO8E2hnsZprvumR6I3D242vtmYQu67bhtCTXU+0wqBF2CkbGhiO6Ri3qTkAx4mbHih
         aADZnWqRfAqlJHEFSs4bs4I3QhHDoz5ClXWIIQHOu8CB6M/7ZuBjM3BN0Wee8jkpBMl4
         Oe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084491; x=1795689291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/a4yTiu8jgj78aGQImmGD3g9KOfP61dhUZVTXL8q2gw=;
        b=Vq3nHltaHwZKrYYJHPr3/AcKBW3wF+TpHtdoRGkU0kagnAtUKBqF7gTzrOZ0HxwOte
         nBF/EleF5LpeXHhlPh17Ib1tS4jjWibRps32cqK3c+eIK9iCXEyxCyMifsu/3vmvFh5O
         czIM9E2wjSIW1LpP4PH96TU/dTVjRJaPM0GjvPw4SOa639FPF8HZDp59eTy4BAw43hPx
         1LtsadINYfzvnnb4vrYLalEV6hzk1kIL46jYpBlSWWSXEvjqk+mkOij50IWhCGJjDLqb
         IJIxJqr/KMzhleGcrN1t4ZK934NxdUBzUrAzVVF0PZAtKGczjYG22hoizcZhhuiXixrn
         lzcw==
X-Forwarded-Encrypted: i=1; AL+hErHsazyxtbIB6mVHy44iLoGMKGaJf9KvzqqzwqXNNKgMthodnPY13X5dAA3Z9fTcBDtXa/IRKJt+nWIbgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4B8UiLk+0bifDODXM3R/IcLJxcj8itV6gnW/hIJMJAAV80Net
	OfhA+rhyhDXiLf8WO/fVhK2RtPG19/rhCb/6uAuLfaYdPkQrvW4KnlVi
X-Gm-Gg: AZFdTZfdvpC0zCGkxNc0XMWjB91IimmHOeHH+qesgrmnUKM2PUlvrp65GfUetTGmjAh
	g1jv4RJoYdUch5WO6SjyASfqOMUbmA/CesqRAdz6fTfbWmSgLsUo5KWTGIZnfbZD4M8hWkjVkk0
	udAmG5YHo8Fa05ccsdxhQcdWj5etdXlSG4kTScA0JYDEUXRQtBkLIiQQ+PLbEDjZqMSawCA23+w
	HyR3EiqH1fGlH1OUJGVfSktiXzTAx7Nvv8FyA08qadLUe8Q8gky0W8Wp7racUJnGhXitixJboch
	o683aXvqw258F0avFtuKYTzljNWJpM00742Uhijfrl5wwb8Xro9pIl35WUObNSPTMKdEcVj1SJJ
	flv61xMP3ty07b9KlC3Z31vAuC5Jyzzz0Rm6FspJZWE0hlg+stZL0yWw8SgqGbV7vLGq5GV8Vo4
	StrxEZH4N6456TOIfnwDuz8sJD08RJW/Tp/meGjyRt6/uvmLwrCQkqW2kzK74LQvjjBswYHJJOj
	43X5FfYfaikRn9Qt6Znl8SoGkMeCo4CptO+VqO1Hdr1oB4JgIFIkyN3+kJKSkSoU1S5K1XV7TJJ
	US/fRMAAnDdBx1ggORA2y4OkXFJn4CtslJwz8x2yCa6avcm6rC1E1I0WaQhoaw7EuFpWcj/KORg
	1S+n3nf0o3+4eKn9r6mIPsIig0qP6W1zW/yckz69afK67
X-Received: by 2002:a17:903:3d0f:b0:2ed:379:1592 with SMTP id d9443c01a7336-2eff740b594mr54610445ad.26.1795084490872;
        Thu, 19 Nov 2026 02:34:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6116323sm28617325ad.23.2026.11.19.02.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:34:50 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: atmel: mchp-spdifrx: Propagate runtime PM errors in ulock get
Date: Thu, 19 Nov 2026 17:34:13 +0700
Message-ID: <20261119103413.31729-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119103413.31729-1-phucduc.bui@gmail.com>
References: <20261119103413.31729-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Return the result of pm_runtime_resume_and_get() instead of
comparing the old and current ulock values.

This ensures runtime PM errors are propagated to the caller.

Fixes: c7db2a594389 ("ASoC: mchp-spdifrx: add runtime pm support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 41c65e835765..632da8d7bc81 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -709,7 +709,6 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
 	u32 val;
 	int ret;
-	bool ulock_old = ctrl->ulock;
 
 	mutex_lock(&dev->mlock);
 
@@ -735,7 +734,7 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 unlock:
 	mutex_unlock(&dev->mlock);
 
-	return ulock_old != ctrl->ulock;
+	return ret;
 }
 
 static int mchp_spdifrx_badf_get(struct snd_kcontrol *kcontrol,
-- 
2.43.0

