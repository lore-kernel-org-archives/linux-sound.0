Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546487;
	b=L1s+h6LiqBsePYVK+NnI8kIwXZACb5D2WuQVCGgk2Z66ds8bJuGMA+dRpQbmVgSgxqnE
	 s17e5Wp67ZKt1HgyiPgGgkJ/BymuMDFzr5NKxYHgEJe0UBn1Yel4MrSQ0x64+rGm9iKfU
	 fC4tZeE7afHijpHBUfQ1Xb+aQXO7Hwe0q4qioUKDt5Y3C7SRYBSJnA37gsMrSRdAZ56tk
	 9ttNOcqJLl1Kv4b7N64J7VQJG7Y8uzWvWmxiZAR/IsjNcFicZotY6hQfysKu8vJXkZ6wK
	 TXw51dzBCkmQf33kpO/qYiSuSOo8ISOxI8o2eMJ57h8HfqyW4PiDKvzpgKLwta9HArA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
	b=u1yWHktAdaqYkdrvgWiSSAn0Mb5avHiYcPWc7wOHFdCFHLgtkOwzSChyJpV1lyu83LHL
	 ih9xpNSe162lMt7sc0vULDcV4yjbXcgucAd8znPMx2ejZK5ljixNfpcR2LNkJwNaskwxe
	 s8VaanmKWXT1qwSzyv+Pj3xOnbSfRS2SEP95oqLbmyM8hwsSOuqmvi7kizU2sRyMIBQia
	 e1XbnBhWDPDbaesBtN2HICW6nEu+9jo1u3U60K6IDnqoEQ/32UAwnYvOyyl4Y+9M75WPK
	 A0RkF47m/17xPpIxrsTmod34DFtpvYi1bFcqRFcHRHNagKerdYyT00pyqMwnq7jsC4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYZQnVgG;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AFD606A321
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 05:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57AFD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYZQnVgG
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso226952a91.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 21:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546486; x=1795151286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
        b=TYZQnVgGFdUGE/rEwphKnUZ1sBmxrbV9gvDMkPOyqq/iSsKuT1Gf8nH8qyScl5hXHQ
         M2oMx3lR8VPEPMXpOCeLOc0T3r0nsRWPJeyCTKdWMtV8WOMJIIrAI9H6h8Hnome6DPh5
         idNBFmj9tJCwDwlWQ3lOTDNsawtuY0Vl6UvXnTHY889ucUhtge59pfB4BJolwkH02zvM
         qqTnE2i1KR1mEqJckJCNLOJUkOMjGPAU72m0QSiwIoWZ+VtZS2Rnucz/I0fcDkYtnnJT
         mF4Ikr4yASc80/xEqhmwDcBuEVDWycFL5Nw6aJzmFpAD3/I8+DiP/qXEBSokZ5kjGHeq
         VcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546486; x=1795151286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLcphuAq8INaoOM32yO8l0pyjtB9IUjLkKU7NMxP4hU=;
        b=rhKsNq/ow5VLtYmgskA1XaoGdpamT1XLzgvx/g3xdfeCHDLDa1eB8rp23BPmhKpOKy
         SfKQbFMVtN+qe1fuUYl5FS/XRBQC9q/djTbWKTgw3HsX1gRVacDhy1NMyqV7JKCELjdJ
         etYcLJCPaTjkw59igHZ/5IUBD5GdvaNmIehcscPSll8/PZnhbb3lfYowQgfEi+cvyMkC
         WnTUN3Dr97suiAzBodwDPJPdvN5vc99mR4ZSMxbBUSslUwP1umvD85OmQF7uwgxefXKF
         ORMKrW11IHejkEcB/3Js0h33Chvo58izUgKBxSe0llecGz12VYPMSlw5ji7JWMZM8a/l
         oeng==
X-Forwarded-Encrypted: i=1; AL+hErHh2T1F8tUGI8jVvjbqt4rtYqVkfWhLzniHb7Jvk9BNKN9f8AalZefTwiCEHSLMjKjcPA1uhaaOg4VtUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+KDVN7lmoaU9Rg0ziL3ftHCKbEB2q4AMKm212zfNcvavAE2rJz
	5M5w/jApmARS2gFkZ+AC3CiI/CKOTX3hfuU40Ecmmqot6eNYeKNPH1we
X-Gm-Gg: AYBFou0uk3Cpi6T5aPImZSlaJt/p6VIYF7MuuujQZxqYl6qKZLPLEw40YsMWHEyHrxX
	SChGXx6ehywIIi7FJVm5bfXbNWpHbrASUSI+E/x+N98pWRRwrFqmzsg499Uxc4x3CZcQigDQRrK
	SoY2eWp/DLf/c53DCVHxyFE2LWYFMZcoXhe4JQBx4/JJRWisXHfQhdAtwXJxAmwzbdPuN66vg8c
	h5CplKWgyVG+rE09ryJzi088o8PyoWgRZpesgR+oUzUls9d7Qq46NwA661B5D6wVBro6HawtkbQ
	Dx9KlzWnVyFsAhfzlqGaNmaS65kZhd4sIMEuto/pkW2aKkU6Z4P0YffvTmjhvTOfQ9AIYsCj2Zz
	D7174MoGjoI+RyS0pNJMfuG5G+BsINiTu968fBcsMy92F39g0jl+OFjdd3gWYPlTRRiTjk/DG+4
	7h96xJkFqQvKvj/qd/6SczjC1DcqGvpqZ5LWzk/ZJxee6r7tZ+c+xjUPsn3wSwR7Bj5RkmDYB7S
	e6Od6LFHnzDk1rcfA/T1SXOWwc4Fx3G3IVw+EhdAUCsYMtq2+rpPvBuguMM7/AuwQWCuAQrY6rF
	MEwW6X4w2Bj4T/fBXdCIVnpDH/NckKlZh4yiy1yC9RlgKzsThlLuDCcJgyfoqOU04Wn807lcRBC
	hgvcdPVQKmpctD8mWbsRUN/3Iy7E1UFiWJPHpbodZIJfGSQ==
X-Received: by 2002:a17:90b:498f:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b1b07e8596mr968719a91.7.1794546486377;
        Thu, 12 Nov 2026 21:08:06 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:05 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/6] ASoC: fsl_asrc: Fix handling of deferred spba clock
Date: Fri, 13 Nov 2026 12:07:23 +0700
Message-ID: <20261113050727.14053-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
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

The current device tree binding does not describe the spba clock
as optional. However, the driver currently continues probing when
devm_clk_get() returns an error.

Return -EPROBE_DEFER when the clock provider is not ready, allowing
the driver to retry probing later. Preserve the existing behavior
for other errors.

Fixes: 13b8a97a760e ("ASoC: fsl_asrc: spba clock is needed by asrc device")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 055593d5d37b..c91ffb5e0c5e 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1315,8 +1315,11 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 				     "failed to get ipg clock\n");
 
 	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
-	if (IS_ERR(asrc->spba_clk))
+	if (IS_ERR(asrc->spba_clk)) {
+		if (PTR_ERR(asrc->spba_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		dev_warn(&pdev->dev, "failed to get spba clock\n");
+	}
 
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
-- 
2.43.0

