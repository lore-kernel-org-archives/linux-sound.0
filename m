Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771455;
	b=NCG4mKNd12K3PohljFo/TIX+1dHYeEMbkLiY99In/QUKJzPBFbbYzXWyY+c5Xjoy4F2P
	 rQWoVB1ogxng6d3UsGK5kPOk0Bvn5ipInkB5FuqVMZ0j8FkGvtemxpbMR2X8Ea/eJsk9w
	 VbnilpSs+PY1qY45VfLvCFefohiyOF5szirRRT5keryOaU5MLNptDeXli0+JJI/HtwjLh
	 LibYCWz29dj3h0C/sbPyymdvzrWPDgf8QF+ZxjNzTRmISIbUheSzQxiQBTSWi5VyBzZ95
	 brx5ZIS/CBiwz2FZEmvdHDA+K893tTS+i4+2ZfkSnbFJx3Kll8WMrJY7XwGDLlKUDcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=;
	b=UqIUVEDUM3oDVvPJypaKcQy2pk99Tqc+AD7pZ+yPkBI4jhUu7bSlccNkoLYZTF0dCCk0
	 uqoVXcXJsVWlIUEfSKKfVckU7Xndq8+vB/QHB26SQM/aG2JxAn5hyRycmP9MIMNdWnZKZ
	 ZG3F1OqHyrLrywXBgSmw8JFRvZQJyn+z0HVt74bwgICuMGdNIjv0x6QjdARLD7UEDf3KT
	 YAlj9HQCk2Q/+4DkJ9uI0iOjXLIzOehZ3la9+MB4Oorohb1mdodUA9Q5K+YNOFklKT78g
	 kVW90Q6vgSlhfTSIFAKUTFoRs+2sytZ2LUcZ4SmI97FK8c60dj/1GgCho/uOL5UF63w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VzaBXUD;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AFB606A336
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AFB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VzaBXUD
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso3748587a91.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 01:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771454; x=1796376254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=;
        b=0VzaBXUD8WB0iWlBy4v86adm/c6ahxfqJnsJ1AcqDkW+B0pBuBorrKGhCWVYa/6mFS
         9X2Rqzpx6BDaA398M0ntAYHDZtzMcxoRvm4pFwzaK+e92KmaUZrXLBZrl4yYep5/yUoH
         i5iVKxjzTb/2Dvl+hiUH4ATL9IJ0znnKzXeKoWylBs/GV2CCYP4Gdi58jbmVBfuOY42s
         yrRvGgPoKcV1Aq7N/Ci9pQwjhU2It/y91paqOgNLkNtXSjTg5D2IYfyeY64Qi6w98++T
         yj/qK8of2nBJL7RZVJ8ik4vYiIEqeVlUsSQ+rWtdBYJRTNHF+lGzWAKqFWobBeTA+Nnm
         I4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771454; x=1796376254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=;
        b=WCX+SIcIwAU5e0wGHSDhWyLsMovG81NiKUXo+LIGJrMU6IULsfSjlxPhj52cTWhrt9
         t2f/o1FcUfRjCuzcGNhSJ35ZlgsfG5ciSj5cI+B0dtwQkbJXn1ccms0mPBC1LHwLwPZG
         D7r6oucS+fAtTsgn6vIjWPJoqHdlycYhoYwRkgGULyVYCHy7Qp2sX2PZANpRhqiozZRd
         I6owHVwyY3c80f4+FhDNbts0pGx3CK1VlegXUPXHr3fo8prQuh42GQQ5UHsn9N5f0oK4
         nBkQURZQCTpQWjRPH1/3uPISp89b+cQEM+kp10uI/l2n5YwilNdupZn31w+iu57p0vZm
         pHsw==
X-Forwarded-Encrypted: i=1; AL+hErEPwIzXRPrKNbb46nzUKVQIweJsUld3hiXVw/hT1JbOsQkK+qNKG9m0dcl4IB7l4rLbEwbYKR4XN4grdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/IBw/Tq6ZTkwvE/L/hfYEbdd2p2+erB6zgjf7iHV8n2n+AGP+Z
	u+jET5Mv7nSwgS5SQWf+Ykj7EaJD1uMfAike2eP0aCXXP0nHxQrA57yy
X-Gm-Gg: AZFdTZer2sEw8+Uk9C6IkOW702h+wNtUC4Koe8QoPYSvP8wPI3i5zYx5X2QVOXlmDcv
	jfHdtdTo4SUPpj6sw6Jwh0SGPXPZVS4lHK/hHgwf+wmxl0AXqJWK61V6VTxOc8OBXYifSwr8Q63
	5PyeRh7QsrW7QJ2o9SIqLSOU0Q+Fm8qNMwxvV1NAO/oneISRf59iTIaJ+azNQCu04mFhVivK1k+
	YXfBtpLkWnQwCCgMM0qAwVVC4sNmm64r328OHoSEVeGxRCaSfA1RfMxRpuRNY8Pz3vUo4hcLbGj
	Of5XDU0KwCuxRFU1UnWyA1LUwueRQFEuM0RVXrA32lRxqu28fK+OTYikw8AuzoHXWriVIfs4Hio
	8hnbjdsv56q1jGWUbEox7yh4pn30m9tSWWCId1DyXSvmwm4qpU5NNiE6PeNaRx1i0V2IbO6z/oz
	Uo5Qb9+fJ29uDg6B7y0MT4VVPsMNpDl34n3wNpkw04kL/DWFFaGAnpyT2ugKedM7wvthlAP7qt0
	WbEAzNJMvC6dihLRfODJwOnQ0IUrZLF1l6StTbm7e50O7kCQnNMKj1GSr+VnQ+8rkfHtnt+R8+3
	rdOuu1fmkFKLT4od0n64dgh6inSUFi9YzyJmoYGo66xuFyxSTAad3IggQi9Vvo6h3PlcfXV3els
	71HKvDgkeSyTO1MIweDWtOq6bSsSrk0uhJxp5o86xlGPw
X-Received: by 2002:a17:90b:5407:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b41c961ed9mr15001842a91.39.1795771454306;
        Fri, 27 Nov 2026 01:24:14 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:14 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: stm32: spdifrx: Fix refcount on sync failure
Date: Fri, 27 Nov 2026 16:23:44 +0700
Message-ID: <20261127092345.12383-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092345.12383-1-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
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

Roll back the refcount when starting synchronization fails.
Disable interrupts if no users remain.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 467c3c583a00..ba6c715750aa 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -358,9 +358,15 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 		cr_mask |= SPDIFRX_CR_SPDIFEN_MASK;
 		ret = regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
 					 cr_mask, cr);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(&spdifrx->pdev->dev,
 				"Failed to start synchronization\n");
+			spdifrx->refcount--;
+			if (!spdifrx->refcount)
+				regmap_update_bits(spdifrx->regmap,
+						   STM32_SPDIFRX_IMR,
+						   SPDIFRX_XIMR_MASK, 0);
+		}
 	}
 
 	return ret;
-- 
2.43.0

