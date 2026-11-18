Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996477;
	b=Z+p1uJCHmze3x054Ah58TJDwJIhU00taePHUN9yJmmKqqTgtSxqQfwsSc14jI+Fb1u0H
	 f5/nQfaPzj0zZXX5530mrMuAkKVq1jQ6Q3QNmzCslOO/ecbBwg1VKZ8VxEqpKi7RGnioy
	 25vXusTZepYBYVOTYEtwq/wUpA1UzrhqxQBCZfI7KMH3Dp/P89EgB/OWneU4dw5WImq2k
	 homG5fgXOKPyhOK7yP4VP46zBjIqDVFBtEXwh3dfELaSBSz9tzvCHhINone2xgejpWxke
	 YQwuZSvAY09XGlFvqLUD5sLnF3LhwxOLe1D3Mm+YNy6KKuF16jFEkDEZVcIFQCKvwCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4K6+J+FWfITr/tXSH3N65sGYtsLB/T4KBT20GPIXyQM=;
	b=E2XFmOIfo1iXrIe9ErkivqTsR2B4MFudcYNGS399YP5xba/H+TR8GTJocWF1myGN2CYN
	 l9KC0NcN/HsTbszRtmKC+DHKO14F3BbLKRSO/2MbAQEhti4BEIEn3dRmj7DMzIhkBxgv9
	 4B7Y/LlH4YW9qo+EH9BCUqUPAmeXFWvtIoPZ+1C04xI0gE8lljwM0DOpKrPzopHE30REG
	 KlPmDqD8dFR1Ef5yMC836azQYLtRNDq8XXW46UxQ7gz4VDgE/OJeXhxH+O4iw2Y9LSZKv
	 MLfkZycrh0fd/LrRhEbVcGAoQ80Qfxlnan5BmNaTiXBgBVOVTzr7tmUtCCTQsW351KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L41oRpCm;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B5606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 10:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L41oRpCm
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efe0e3bdceso3576355ad.2
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996476; x=1795601276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4K6+J+FWfITr/tXSH3N65sGYtsLB/T4KBT20GPIXyQM=;
        b=L41oRpCmZZauvMi/GJY4qNMiQdcAwddGvTG0iJoCxkWBwGfSDCHcUGBC2kRdsNxrdY
         6xQZ2PsiS6yQMVMPSj0Jv+vQz5eP2aGOeXv3TzuThyR9tLQY+vWecNgyT9QGel7dz7sG
         2KUYgphMTMZCecGkpVpgd2rOWHvudnV+Kdc+PI2d0zCVAVlC+wzgLCRQrfhgZ39pIDEp
         0RnsaMGGFbnn9bca3VCXrWWbr4etFY6RJuzDiVkCqrgC1lP5s3VBeSxjicJxUOc/uiHt
         ML7Rj+ZpC1IT7pXmE60iJc/By4sdrtF8/xb0JVsddwr/p1DUR4Fz8YECXBC9BlsoFDIW
         sGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996476; x=1795601276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4K6+J+FWfITr/tXSH3N65sGYtsLB/T4KBT20GPIXyQM=;
        b=spf6rtKktFNY9zcl86Bf7n2eMdg2v3zLAOwd+5R+7lbHSN3cottUsyt7fuSR5beuNh
         CBMutkWeaUw3Uhm+FjMJjhPUbsAuF5k+8Wqxi5//HCFbo6OfMaS7fBkzMWGy3ec6CeSf
         MRjS4ZVxctLQERNwVaJM/9oB45AFJSjB+/j2FPSDiJ0YpuCdGyAJzwNz1lglRA1rB3rO
         abzr4twZHHGyL1cy0dvn4VQ3cKzXeBmqvEI8V2XZ/3Nr7gAPEy3Nv09c/aVOvkJtiTUb
         NuFvllUavdZvvzIf1R6Jh6+DHjEXBNMCSLG8AlnxghgPBxVBsQd65LLfqnn1qOIoif/A
         hGMQ==
X-Forwarded-Encrypted: i=1; AL+hErH9che1QAiAJCC0jkknimPREauOT2zA0qV8Q55bRFs/VI/8d6airXf8h/2ivpv6vDFVfSDrH/+vuBIYAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/v6ttnJRna8Oh2sR4hL2CxkBNquiPcq+fzVl4PRnu2JJq11uzX
	ikAyEeIMmRjE9tX8IRBAnR/vQvCrChy/Dn+ZUSmQ4Z2RrPtuhykYWl72
X-Gm-Gg: AZFdTZdifkCvME09RvWA3cdg8PxSybOXmaQhNojulFUbzXw4GqG/K6ixN21fhfVs2nd
	46KYZU2ryWjGF+wJdASo9LC/Gpjq7ZvBOFYL98HCCDDo5plNTKPkeV+4/KJlF8UZ0PatNicuK1l
	df1V72En+pWI7kvBdevCXWK8C0ilgnQ5RMyiMkb2oiGsgmyDJhNUdOlTB4FKXjy09nEMuaOKBZE
	blvnpdHSJ4IkvFdH8P7YWpU/1g0qIHXbogZvevsubtSK377WtyYZS56ob+KWT75iB5qMP6rojTt
	dtUr0qp6Ks6QLfvqropUfEGN3YQcuNqWgGeJpFBdehfR/b/AiMnPNT+s+P78UQhTP0aicE2AZ62
	K4iNWkFqXRjgdsCyqZFp9nhTNZ1Ue7I2szDxV38FdII17xY3POhqjXdoaP7SkRhl2FU8WDBFXth
	hTkSqDRRKK6tpMP4B50YvJEifs2VHnRVdU7JJZV07BINSll1uc3ElRapG69pcrge+x+93BGfaNh
	mAPgWTdQ9WsSVyFJ/iKxeRmPs97jkpsJ/5BIm0yuucRi58ZvXbNbns9kzu2p+Ndz+UqgPYYhFMF
	8yXyFMuZs+ecRHFSnbdoZplic38E9o9zyLrv6n7gFUPAdDRZnYbl9H570hacezPhe1VG7QpEUKZ
	1lvmsxKGBxzj1HdoBB9wosrW28Vz+iY9uduMIKZt52GcL
X-Received: by 2002:a17:903:1ae4:b0:2e9:d0fd:639c with SMTP id d9443c01a7336-2eff7569fd1mr19749265ad.55.1794996476359;
        Wed, 18 Nov 2026 02:07:56 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215025sm10634145ad.46.2026.11.18.02.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:07:56 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	jonathan.downing@nautel.com,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: fsl: lpc3xxx-i2s: Fix DMA depth configuration
Date: Wed, 18 Nov 2026 17:06:31 +0700
Message-ID: <20261118100631.26658-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118100631.26658-1-phucduc.bui@gmail.com>
References: <20261118100631.26658-1-phucduc.bui@gmail.com>
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

The transmit and receive paths use the wrong DMA depth macros.
Use the macros corresponding to the DMA registers being configured.

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index 75bd148c1432..67bbc69dc2d2 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -198,12 +198,12 @@ static int lpc3xxx_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		regmap_write(regs, LPC3XXX_REG_I2S_DMA1,
-			     LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA0_TX_DEPTH(4));
+			     LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA1_TX_DEPTH(4));
 		regmap_write(regs, LPC3XXX_REG_I2S_TX_RATE, (clkx << 8) | clky);
 		regmap_write(regs, LPC3XXX_REG_I2S_DAO, tmp);
 	} else {
 		regmap_write(regs, LPC3XXX_REG_I2S_DMA0,
-			     LPC3XXX_I2S_DMA0_RX_EN | LPC3XXX_I2S_DMA1_RX_DEPTH(4));
+			     LPC3XXX_I2S_DMA0_RX_EN | LPC3XXX_I2S_DMA0_RX_DEPTH(4));
 		regmap_write(regs, LPC3XXX_REG_I2S_RX_RATE, (clkx << 8) | clky);
 		regmap_write(regs, LPC3XXX_REG_I2S_DAI, tmp);
 	}
-- 
2.43.0

