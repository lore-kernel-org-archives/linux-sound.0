Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56C347BDB
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968743; cv=none; b=MZgg+fBmmQcvp+AmnCEPGVmY4IMvixMrxYdnKCIkDvxQIXqQ2+JIcFkJiOxXwEsBP6hDy1yU7ZJDjYyok2FeELTg/M9vkzDhI9k4OH/UiVETwnUDOLEWwoU+lE9PeGJavqI41fntFgoZH+kCUaA3JCkm0ENRGnVAy+Xto1LW3H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968743; c=relaxed/simple;
	bh=smVRpaCZIxDLyRWoZHXLUYpzGx3iLGVagavXEXO2aXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcHbQ6wr54xn4U/ouZilLHi7e13VPynYe0InGxLLUzwCTLQN92iHZJ04s2r+UIufHxqZ7H/FQxxdUj5/wVx1udxeQm/vH7rl2CiEIq4YDh6sDl4H5qZftI9f1UMFOD/pedT48jbuy7yAGwvhDUo9cmemGD9ex55G6pxRc+myF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h14k+c1M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h14k+c1M"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c168baac83so22859525ad.2
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968739; x=1781573539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLvmQCFNohOOsJ3JAW+RyfCTOssyDUr0gIAh//bmteA=;
        b=h14k+c1MXvAZ2WZRWrtBlPOCRWwIr7PO1nVu94qUAd2CTEwzRESG0Frh2RUnZNFxvL
         mCCv92hUsWypy1l9prDfunSdE4e7L59Rg6nIhMSaGbzgSwykOlQnYvrYh9u8m4dy06HE
         9Ovk0eTfhBXGwgO0ROtejUMfcJEwqdog8JDG60ZvvtyTyt0b/Qk8R6KJioMOmACLfSXu
         NdEAoFej5RREXiOzJpwepGouAoi3ibCpqFSYRGeXGymmuQJQ95XDcn+1u3CDkOoFlnQb
         Rgad/DQ6bndY/6rpA9xELsGAunkjd0zcCkflzdjgJJNGD64ualDh0+n7OO3DkbTSJ7xj
         V0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968739; x=1781573539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLvmQCFNohOOsJ3JAW+RyfCTOssyDUr0gIAh//bmteA=;
        b=rUEzTJ5ebANmPJnDBNNkC5h4uAZ1ZyASUr+HoDFGsWiKIsgEJyTLASutqw2t2bbORw
         YmY6XpqfLzlcV9tAfPkxqoJeemTa3gLMeMi85pLhZu7cblSMImv0D80KqREtuE2uz1RV
         gtHzxtRuvPBavC1FOqovHceRo23MAoDRsZmQ8jU+h5KoXnCid8TD2A02LJVL1Afq/DBY
         9zqatBk1I1+Hb2sc7nSHAAPxXthaRsUC+hXam1v5KNNaGpiITmTVpCrDI/g6xHzzNAXh
         Zv9/QMuqTHimvFCPDSdk5H8igivyYdlAHkgI9ErFpqvYJVBKfLfgtIPzrjhlXQ0nT3/z
         dxEA==
X-Forwarded-Encrypted: i=1; AFNElJ/vHPI6NFjX4+ztECMthEB1r2EQmgnHhxh1s3wDdV/ceS/W9Lpzd98++Vow/8uych0fcLI498lAwMXuoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbQ/hJqWgMdQRHuYq7eyaptE1NwTGLL4tF/WCRAwnn9+Q6KjJH
	NtdAt3AJ10uT1NT1rYPD2poCP/zEEZKgQf/yA7XUGkQ1Y/BQo9HRegVVt84/dQ==
X-Gm-Gg: Acq92OHGO6qypZK3XrjAfZc9TYhmqUZIaqzY9X2WIGaGpq5/bkm5sk4nGpw/d0qIKjT
	kyllfomTzN85ImxWuwk9iPshgMl4lqLJaaHXZROT88ydILHbfMmdMR38AJQB/NZrQ/Ch5dTQeYw
	MTgS1vHCvNiUPXuWZZBhIIq0MPQBFifj6BTAuofGbi3VamRYXwaktWDgCCQs4DPrmE1AOsT7M0s
	l9mGUEr5gOm3CUsQW+2IqiZ8Z+Fk/MNkkWEapV0uEDfNxNR8wmxAFrUkga+GMhP80A/qPEIDlfh
	WeFU2UQ6oV8WnGz0jB9/FPmj4SeeBwlQkbiSor++Xnlp2urRyfhBR7sUcVCT1GxyiXMHlojAPcJ
	CdJ9w9Kd9o5rs/p5n7dOnEXN+bp2bHgee1R3XzFy/ZpY07QJwIxmWGGuq16lTugkI+YOhLwg8fh
	sYay24ppe5IWN9PTnexT2Vb1zEaoJyoJSMFwKwjg3tf0veatJ9ux7XSDMkEft0XyWr8fUYHLIqO
	7uE600=
X-Received: by 2002:a17:902:ced1:b0:2c0:fa4e:91f6 with SMTP id d9443c01a7336-2c1e7d41eabmr194574365ad.13.1780968738667;
        Mon, 08 Jun 2026 18:32:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:32:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
Date: Tue,  9 Jun 2026 08:31:07 +0700
Message-ID: <20260609013107.5995-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable and disable the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the
driver accesses hardware registers.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v5:
 - Drop spu_count and rely on the clk core for clock reference
   counting.

 sound/soc/renesas/fsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 80e87b815c1b..a1c463d73756 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1560,6 +1560,11 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret;
+	/* enable spu bus bridge clock */
+	ret = clk_enable(fsi->master->clk_spu);
+	if (ret < 0)
+		return ret;
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1617,6 +1622,8 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	/* stop spu bus bridge clock */
+	clk_disable(fsi->master->clk_spu);
 
 	return 0;
 }
-- 
2.43.0

