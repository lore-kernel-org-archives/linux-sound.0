Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260888;
	b=DxY3D0OnQBLZbVczteQ+OfGbZqOc32dArs4oVGcygWS3ZbZRIaIKbxVUG4egYLRoCD5q
	 yZMF6KHDnWhbbZ/46/Ae6G2rbZPFwPb5VAQ9U2+sU6segaokXssPJFSteBi0ZW6vfYgoq
	 zDAlIRGhEaBmeSqG17ZKw6zSgIi7aSWOGkmc4uXQ5+t7dsJR/MIZBBjbL0St8O6/JKNhl
	 f+8Loc4nI3HmyFQixoN/npiJDn77Gu53O35xxbf56EvOKHxZ+rVIi317QA6kIKpGbcyiW
	 5SpUETouIYHg07ocDGXI7m1P7MolNnJDiEQWB9fJOwpK6IHsxJ3vJOcX6/UKaObbA0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/d8IwCIqZ8PUSmXsThzeGHGWl9DDG0TcmLpto88ahAQ=;
	b=u/ewQ6TrCy+r+kQbZXTk+smEaQYV3Md7PThaSeMNKPS+P2fXzDeuhCz5LQWo+A9gh+Mh
	 juJXuBfZarwhDwYZsbJOG7KrU0WHnGY7XPQnr9AHe86NXDRlpZ7n2eZH6lIbNk2V8A6Mr
	 kiz5jLsQARTJFfylO03JxGr3Q8KJaoHu0OIrFN2trLNVXKPTgiAFV0j6E/UtAtu5CVBMt
	 917WStozvLRN4ke7xO2qYoE4Ht2tnuHoBeSVovPvwfM+lePb/1G2bjeMRM1znRPzOtmTS
	 0y1ewJtaXqRN29rlzlcmOP3iUSZ+jrnMLI0/jzsDFy4M0J1pKU40sfur31N9AqJKNAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+9V9DCT;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23AE606A31F
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23AE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+9V9DCT
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so1336187a12.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260887; x=1793865687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/d8IwCIqZ8PUSmXsThzeGHGWl9DDG0TcmLpto88ahAQ=;
        b=v+9V9DCT4syKNnx+u2GjMoRpclOhWVrVc08k8qJEyOoMfxaF6aA+13Y9MsvgfLy9zp
         kdKi53kaQOgdaJd6buuBoUbv7MIelxy68et27pkshiAEHrYUKor2he/auzLuDWe5zxdn
         sky895t3Lkr9qKp6Glv0ifup/whpBuA6cYuTlF4TLgwdVwjSn6/Q2e7yR4monjS+QDx3
         qQ+dKgIu1CfCjEKresyIX7VFVScvEqLPJDvN+cUTS9tA30sOCU6weD80XA0q3slMqpkg
         JIkVl6j1D9G7FXbLop1U10j2MeYEuujJOf7/xEAbUDUmDo4COpy+iWwA1nE0S2MciJBS
         8Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260887; x=1793865687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/d8IwCIqZ8PUSmXsThzeGHGWl9DDG0TcmLpto88ahAQ=;
        b=b/6MG/jzIxw9I5Eu7SYaefwez8sidflzU/fCHfa4mG/qFYODSTSdmmVnw0WWMx2z9q
         uPwxg5/FrxkBJGnBf/uaxRbcoy/8yg0/s8gYa/EdUtDXsxPS51vCC72RqupJ/KLVSwDe
         Q1oGoMPVGhw1Gc9R9tr4rp0tCGqONb3c/ShVB0aqhgUZhSZwhYJPJ5pqQiO8ZJgQ9ZtR
         JyG4te/JMV2SWYmmhiLbv5Qv2tT4I/469UIRVE+5ZpKMGxoNrLorpDOXxlk9DrCYyIyz
         6MyDQfhuuunxn9Me8TlhvkzPUosZHgbaXOBTquxWAPqhq5KJ6NfijBjPU0ZZIWSpkD+N
         criw==
X-Forwarded-Encrypted: i=1; AKwUvBzAKmfd9wNFComrUv3z5vu7vkm441GqVGTVrhsNKC0g7E1Z+2ChUTAB5SH0xdQSUTYlPloBAvkFV8y/Kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJnPK672UX4IULgVqC6O9UUm+OWGN7gCPAqwyr0E39yOUTFM0c
	7Nspb/7zUhX4Xf6ei7fz41MS+jb8f99XCVvPsCsEi1NhsPwyFDCOYnC+
X-Gm-Gg: AYBFou2STFAoY7YOWT9zvngMKVMnB3rYi3HY9em5hr6HLYrhC3X9p9nDX8xrMbg6N/L
	/r0/jI6d3YcMpNW2i/7Q7GlasP5aRUP0+DsPGAxms0bqgWNDNB9F6QMx9+XQZW7QjvTvOaDn7yR
	QG3Qzt8W1H4Bk/O5zewVHRic+hUYKMUj3il3r+p8mFHYcpMqJ4hT1+WuvimFFPLXYArkyBuPpQf
	SskEM8cKTobk77jwFDyak7LdzsVkqhWv4UN5Wikh5pckR2fupiSYB0QnA33Pj1vFF7F9U6IopIZ
	XhhAqko3zStViI5ri0Xjyo2LqXSpHa2Y8Oib7wKjV2sqxBOno6rr764ehckKS2z/1GOEi+BPqlN
	y0d+Wn5MGMmmsep+mr40hVT2EWdVLdwdLTciwt2RoU6YRcJG7Y//bb7LBhsDGKXxQGV7TNf8lyq
	V+BDu6DzCtSlbEmVNEKd6RA5ay9gYiJLpjQweu5D9A6TTeciXNCGJdwGobmIuULSbacazajlC2Z
	BWDXbikNOIEKht1ahXYNLreZrZnNCEg38kONQ38A3Wqm1tMnGMEbVDBoI3AR47Vo7LJkLH6wkPe
	aA2BJikcGYNJ3hcRMUB9H1fIG5LEzwyMZb/Jqom1YJXJ4wK7tIDOEUUX0yU24XCDNwko9cNK7bG
	3GeYQ+Gz/9HnLZR2HMmdxd+fjgjXOKRMmzXy7oJepGH9QEpdB5stGAySs/TpD0AtftA==
X-Received: by 2002:a17:90b:390a:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3ae57bf9742mr3793713a91.0.1793260886902;
        Thu, 29 Oct 2026 01:01:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe923sm3380289a91.8.2026.10.29.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:01:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: hisilicon: Remove redundant bit clearing
Date: Thu, 29 Oct 2026 15:01:08 +0700
Message-ID: <20261029080109.12240-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080109.12240-1-phucduc.bui@gmail.com>
References: <20261029080109.12240-1-phucduc.bui@gmail.com>
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

The S2_DOUT_RIGHT_SEL and S2_DOUT_TEST_SEL bits are cleared before
being set again immediately afterward.

Remove the redundant bit-clearing operations.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 554356f060b0..1c9e235c3a81 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -147,10 +147,6 @@ static int hi6210_i2s_startup(struct snd_pcm_substream *substream,
 	val = hi6210_read_reg(i2s, HII2S_MISC_CFG);
 	/* mux 11/12 = APB not i2s */
 	val &= ~HII2S_MISC_CFG__ST_DL_TEST_SEL;
-	/* BT R ch  0 = mixer op of DACR ch */
-	val &= ~HII2S_MISC_CFG__S2_DOUT_RIGHT_SEL;
-	val &= ~HII2S_MISC_CFG__S2_DOUT_TEST_SEL;
-
 	val |= HII2S_MISC_CFG__S2_DOUT_RIGHT_SEL;
 	/* BT L ch = 1 = mux 7 = "mixer output of DACL */
 	val |= HII2S_MISC_CFG__S2_DOUT_TEST_SEL;
-- 
2.43.0

