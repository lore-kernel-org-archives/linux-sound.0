Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3422BDC05
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101804; cv=none; b=h8ZZQrLL1L0pZK8oR11V8Zz63JYdhg0MHs/0b2kj+78w0CtZWoj1j4YCUfYIIDPUEjCdSvDDxgMkbXNht+dVZeukmfROylHpLpqKor+roIRdWudrweRRbcP/Q/Q2QOwrzMhomjGXbSq15/rT/sGYexF8Vyrt+MMLJ1Rj+MqKtyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101804; c=relaxed/simple;
	bh=ltfTZD1WjEgtk+cFAbm+SIyJxK8hPR8hHtaEt14MAj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQhPn1/hXny+HVlZ9avEwhySjFAQN/aFZrp3y9PuRzHDAa7hZHtp/RMgn/S3f2qOFRStQoC1oHhu0EqY4xEFcXOvESQ72K35IxphbWCSxq0IHC51tRfsVib51KREz7o9KmwGZzxid3hfd2cKb3fspPiJuBs3SQDnLunpDp/+LTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fZVAKgIm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fZVAKgIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=J9CDF1PF8W6GybR9yld+fxwZSNsmmzu58rx45VzXl/U=; b=fZVAKg
	Im5XJZUijHK8GzMZA1287OP8q6519ZCJ1em9jXw8xCB1Fq1GWqQWRtLcpl14fFhY
	RIBc9a2f6FNUMlr4Ale7km7BY/6QfQLEeFXWzkdA5QE5VcLnrPTQ6ugqYlp4DrlE
	hu1dwQOCvPwh6pckihaF80N78IXlDoL1WNdhPZM5Ecdx6wGSZtPvKrndFF2JdlbU
	nemFjUD9B5yn9xcZRounsyXAIxSxkJLBCOMbFngFacoEq/+eLovUE0qm7rkyGkfi
	BoP3V2RHzOI30yAjGRfo4t81Dnvm5hgbXLQPM3FQzGQ7ZNg52KGzJDqfM3P6u37R
	iz0bjWIOXKSztaUA==
Received: (qmail 695904 invoked from network); 13 Aug 2025 18:16:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:34 +0200
X-UD-Smtp-Session: l3s3148p1@ZT75ekE8Gr1tKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 21/21] ASoC: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:07 +0200
Message-ID: <20250813161517.4746-22-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 sound/soc/fsl/fsl_sai.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index c313b654236c..cf1915b93d78 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1244,7 +1244,6 @@ static struct regmap_config fsl_sai_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 
 	.max_register = FSL_SAI_RMR,
 	.reg_defaults = fsl_sai_reg_defaults_ofs0,
-- 
2.47.2

