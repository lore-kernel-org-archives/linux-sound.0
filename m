Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B714218A1
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009225; cv=none; b=pY/795YKnGnuH+TAGU/DDGs4YzFlC2fYehRKEBYq+bl8YGNe//lIC6yrwKUZCPxYEkGeq1Cf8riNLctWyeUvxkZgdXPTNQFp43D8Bm/K2SIL5/iVvXbo5rBBjeK7GgnVPs3abHeBehoN6PiAByFACwxU94sljQ+3cYZ5+Fps/eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009225; c=relaxed/simple;
	bh=oddDzn30hz+MNqvf9DAzenvLYi1pG8FYsLnwMwtd5D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e2ltk2SefrnilObT15IkG2XwIuoEUIdAC+h8ZnPfIbWkydMyAFKRvJgKTNBhv57O43UW33CM9fTJTGgkWKTpxYYHGrNty6gJLpJfhfECitDOAh8Nw+GbPZCnAknYekiD+6MpxWK0JRGu61ME4ifidJqwnxxrCCBG4SyNe3WxOFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0WcYAWI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0WcYAWI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf1cda2b17so40073735ad.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 05:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009224; x=1781614024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keoU58MOi5VGqip4nmTurg5eYjRQQf5+ZFnAVokgfv4=;
        b=A0WcYAWIpYdee98KYm7mS1THocs35Ex/2t1qzdV7LTOgz+ieRj6+Lj2QSVqAj+gsN6
         wxNlDRBaUGZ2BDTvAv68A9jMVD+u05YTkzC0f4J5kmnNSDhU1f/3DqMAhn7bIruY3mt8
         ZWfKT4doT0wWCWyQbJRYGqEXHBWOrZzxVYFSfABmIxeVv2EG+xi/vUuLOqpTG30kkNGj
         65Xm3Si0wfGvmwhVAKL8cAlRfhskZ0Ih/SFtt2EFp+lRa2ln2oHI3/SWJFhv+FVsVOSt
         Ny2jKV4GvzZbh3kilg0rdErXOMHze0POw3z0muLKzHUvwcK7FPdUdrZiyE0Bn/n2UqOb
         Ja6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009224; x=1781614024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keoU58MOi5VGqip4nmTurg5eYjRQQf5+ZFnAVokgfv4=;
        b=AOztKp2U3eNnQGWVBxLyV9gRHznYN7gRIk9ZBbtuXmlUvCC71dvLF6/IAjxE5WZPw7
         TQrT4cdTJyeku+SWKNu/lqcRjZ87MEmXuSTYBVoRkZGldQuFaTh/v9dG+rFKg1blkIuo
         ytLGIMRcLdnaBZFTirnoDuyQjFAXXssiZFExK+1N9GgcuOqrJ9sZWFEhWo4s7aFnQCSJ
         mn3IWjtJtAZrHI4huc9TlpDSwLww+x2uVgZyGDhIgImn9SunsRBs1ntn4BkclwfQqPSk
         y+aFvSiOd5jtAGoVFGvubDU3XocWz+j5xp0/8exAPR1Udy3/ooRacPyI2F5/EVTdmXK2
         7CpQ==
X-Forwarded-Encrypted: i=1; AFNElJ80weW7g9XUlqAtgaF+55kZtgr3xyxKlrLpAV3sDWLwo3TokabinT/QsG1crIq5zq3cvnSAC21F2zQq8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTrVpUmYO8gh8EdVgzUZN8efCodS7K/0Yr7QYSSzPrZ/Ggh4Ej
	JQFTtNkowZ9JxqSSNfEsp21lPd8HNR7rxq31TaSVE6KS9GV0CuC1NFDN
X-Gm-Gg: Acq92OGzELvjQsmqO7or/7RKxoj+VkFjT4rHIkwL7aMUKqADyiexPseJjJGgNtJbR0/
	YrN9PCcaOBK3Lp/FqHAT3gqRHf14JFRMLJKn96l+sKOkIaSyhIL2gYNLMnA7qmlEhdcHOK4ZEQR
	+7RpD3HpxwD5tT2TlLWAbCw44hf/LhwDG0mFHNta5N45K4fDmhp7e6OgZqyRL7KbdTjj9FX7q5I
	vBc0MnL1W4fknuv7gf4SqZbimN1Byc2ELRi1GdjRoEPjuOkbO7zWtxqARy901nzJXsg7XtHIn1Q
	VCDI0kSCr1ftVsOpik1+I4oAr7D9GXLkqMtIjPqCZLG7J0J2KBv4fxOX0UsiaGjNbWmUqu5g3Wm
	SKP+ftK4urA51GzsFR47YlIF9ZviUTy3vfBUHabzxgkuszCblepOPNhEhdzK9L82GTUitNhN9tm
	OEMMIke7DxfTNcohvuKUm1wWLgKLVJ8bB+pI0BrdSDdixT1hvrb8wK479V+GQfu1/BBPpHA+Pnr
	eQUceT7Yhnjm6MUp9hlGogICa8=
X-Received: by 2002:a17:902:d2cd:b0:2c0:b74f:a58c with SMTP id d9443c01a7336-2c1ec7972e4mr167544185ad.16.1781009223982;
        Tue, 09 Jun 2026 05:47:03 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm204686345ad.64.2026.06.09.05.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:47:03 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] ASoC: fsl: fsl_audmix: Validate written enum values
Date: Tue,  9 Jun 2026 21:43:15 +0900
Message-ID: <20260609124317.38046-4-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609124317.38046-1-sammiee5311@gmail.com>
References: <20260609124317.38046-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_audmix_put_mix_clk_src() and fsl_audmix_put_out_src()
convert the user-provided enum item with snd_soc_enum_item_to_val()
before checking whether the item is within the enum's item count.

The generic snd_soc_put_enum_double() helper performs that
validation, but these callbacks use the converted value first: the
clock-source path tests it with BIT(), and the output-source path
indexes the prms transition table with it.

Reject out-of-range enum items before converting them.

Fixes: be1df61cf06e ("ASoC: fsl: Add Audio Mixer CPU DAI driver")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/fsl/fsl_audmix.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 40a3b7432174..f819f33ec46b 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -117,6 +117,9 @@ static int fsl_audmix_put_mix_clk_src(struct snd_kcontrol *kcontrol,
 	unsigned int *item = ucontrol->value.enumerated.item;
 	unsigned int reg_val, val, mix_clk;
 
+	if (item[0] >= e->items)
+		return -EINVAL;
+
 	/* Get current state */
 	reg_val = snd_soc_component_read(comp, FSL_AUDMIX_CTR);
 	mix_clk = ((reg_val & FSL_AUDMIX_CTR_MIXCLK_MASK)
@@ -157,6 +160,9 @@ static int fsl_audmix_put_out_src(struct snd_kcontrol *kcontrol,
 	unsigned int reg_val, val, mask = 0, ctr = 0;
 	int ret;
 
+	if (item[0] >= e->items)
+		return -EINVAL;
+
 	/* Get current state */
 	reg_val = snd_soc_component_read(comp, FSL_AUDMIX_CTR);
 
-- 
2.43.0

