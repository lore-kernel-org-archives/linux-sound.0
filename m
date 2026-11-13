Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546504;
	b=H2PEvcvRzVmtM8YRFvtNjxwbJDOUYIM1Iz8LKh0yg5Bwj4VQd1C70nhn+jKh03h7LTEW
	 n0oXVK6kt0QfJJfgLg3FqbFydNcbQTMVNj/7YwQm0fo5av85v1PTKWvZUmz2ObRK0UaPC
	 EkGUn1EJO4JPif8P7IYgqbZH1/Vir0bZ6BeF5cjUCvEMwKDz7qm0uzwpOAm/cgf7Xz6e0
	 plLXFzel9ipP890UNDI6SRt668u5pNiPn62OG+G9ARIa5yHGiBKn7qLVFMOwRBQZ2zuo5
	 dzRKsASmqqa0Qm+MDTrT260z297rMYPnJiRAek7WY289vyo189kSv2uDY9NazYhf+2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o09ualb3KCuGKClH06bXyCu2n7iDMp017ct6YIx2Da0=;
	b=JFseRXBgxomyyon+r+0xFAjqqRV58FVQKgDM6hR/JP4l43Jc9bBAwe01iFptY8bb/5h8
	 5+wS216/n5se+gRmM+EkwJGuvTqM6uDKBuGSkv7AaV/JZug/Kt/ieeVjeaJXcou7qEiMH
	 H8xFj7jW4ZVTlGo/481HpiT9MCkHKuWUJ/zE9/+YzTRcyi5DbHaGxyFeLb32h+cwQWbl7
	 kjHSsPvTmHIGXj7303YawR4MAN73n8lwtYulx7idourp/OoYmhT3U8mxsDtiGtgV7TNMj
	 RHTutzT+gcMY0PnojwBs2UTrl/sXMyQTyf5tYozb5+StXt3hPBBWTJL8/V6+Sg2e07Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T2oUnh0U;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68951606A32A
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 05:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68951606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T2oUnh0U
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed06b725fdso11906485ad.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 21:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546503; x=1795151303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o09ualb3KCuGKClH06bXyCu2n7iDMp017ct6YIx2Da0=;
        b=T2oUnh0Ua15UOdvW0arwD7YbBASYBCRIO25GpN6Kq/qpmWz/nrR8G0u7qa9AZlXnc5
         Q3BX8cWRjfkZ8Yn80x60CWinX0HSmk7MK/uXt2dxS8HuLkEwtv1XkwmJbF+nI54H/z+c
         ESjuRU+ytCajKSP1WrLy3eMD8sJt4HCDTyEq7NUZYT9zHf36ahJVokWn9b6H+/EvGNmv
         zgpOz49iXBy4AgS+/ratVOH5ZrDV2A7M7RHOzU8b+UkMfM3Ozq00WnrkNZccbtWAyjYl
         DOKavTWGRUs2RGpi1Q7g1qGIDs4l6yxmsTm/mZWVFnCFbKoSqR+eU3GeXhS+DzqkDh16
         NhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546503; x=1795151303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o09ualb3KCuGKClH06bXyCu2n7iDMp017ct6YIx2Da0=;
        b=p4dWMcxAs2d8x4cJkIu9DGvBsTQ6mYpFn60dBMxIldN3UTSjt/5L+zSUVW9/XJiz+Y
         0nwMgOXE1FBIYhEAgOI7/6HtdbnOm5gALqNNKKwjtI0uE7v3BETW8k1qHc7I25JZoLBf
         sF5o8oNJVvjJc9wLO7MXbCNSQ6x0vv9yQAzbMrDsm/c/Qwvqmtciilv4por7ee3I8VWR
         6YkbLJcHxWG+8aTZ9E3XTvqrv3w0ZfAHiGHvL41z5B0LNjwelBSPW0FpjKZSav23U1Kh
         YtPqvowo9aYIg/hHHl3FvygV+yrHO2AmPrlBn4NPS05xWRI3BJYSlojf+0JhlWnLvlwb
         8tHw==
X-Forwarded-Encrypted: i=1; AL+hErEvKVegmaZARKBMbE25sKGJ5QHx646q52GzlgXmgotEtugreZBPFrGHWi6Nwgc2/2+AzSwMy32VV2pWcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zJdWIP3+OmGvj0KvOXDvSlncswbavD/9yiczUQpp5JDEShQkE
	kCc9VYYiU99fvzaItjFcBejjjZwNe7cWqOyLwWAVs0cQUmIdD1gfMFwU
X-Gm-Gg: AYBFou0ez5kvtCseGEqFyAHJtz7lmmwFJKGVyB22UBOwBQPJBu08tJ5izc+A1rrCrcC
	5r/B5CwevOfABerdo0ga2/drNUIwYUWCvDwKvlAEhCLRxQn9REEJ4p2Ey3+XD4P7opNQNtYGXLD
	IZMDWwUzDRlVJ2NI+NUTKWajN0/LULB9msuc++uOO2SFA7KAWBSLAtC3/KaX5fBjtlLZBQeIT1y
	3Vtlt615iqZ2TjU3RcPKNCiZjEQj0NhEk/u2l7xNJHMamS+NlW0QzgBu9IzzVQW5WFLk2QgC9Zq
	I7GMHdwmHTrXdYhZI35dp1JCQ1jTkwrR5A8LnEEQEF2pCXINZCKcUoc3MiQiddpuCMNtVKbsUoY
	H0D5mZ/4Pt5t07yOYLvhypQdJtg3PNbzmOF24LG4hQXRUq022ba7sBFsLLFTcwN8Upswg/IVbYS
	YUZcZYuJGeJDsde6u7xTieJaT1YngiViyLBjYxAIPCcpI8LQIbIATqkEb4XO403psliF70KYnG/
	q+T6fzuZT4aJYfhCZMC3BrmRu6bMlPH3ZbJmWAEwl8aNLuHBmfKLUdNt6GoeEz+33+NR0J7jA2D
	ntVqpEB8m6DNoRfujFFrRKBrSpOOb2V0dvopdFOfRU104Lf1oW6E3h19DCYcEYP/Z5eLr3rxQXJ
	qYv/nqANkX/0YSOfImx3gMU82IDz3UQaFckug6DkGktQh
X-Received: by 2002:a17:90b:584b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b1b05b69damr839963a91.0.1794546503542;
        Thu, 12 Nov 2026 21:08:23 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:23 -0800 (PST)
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
Subject: [PATCH v2 6/6] ASoC: fsl_asrc: Use devm for m2m cleanup
Date: Fri, 13 Nov 2026 12:07:27 +0700
Message-ID: <20261113050727.14053-7-phucduc.bui@gmail.com>
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

Register fsl_asrc_m2m_exit() as a devm action and drop
fsl_asrc_remove(), which has nothing else left to do.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 317ce0a5c765..c8db02f16453 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1267,6 +1267,11 @@ static void fsl_asrc_runtime_suspend_action(void *data)
 		fsl_asrc_runtime_suspend(dev);
 }
 
+static void fsl_asrc_m2m_exit_action(void *data)
+{
+	fsl_asrc_m2m_exit(data);
+}
+
 static int fsl_asrc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1479,14 +1484,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return 0;
-}
-
-static void fsl_asrc_remove(struct platform_device *pdev)
-{
-	struct fsl_asrc *asrc = dev_get_drvdata(&pdev->dev);
-
-	fsl_asrc_m2m_exit(asrc);
+	return devm_add_action_or_reset(&pdev->dev, fsl_asrc_m2m_exit_action, asrc);
 }
 
 static int fsl_asrc_runtime_resume(struct device *dev)
@@ -1648,7 +1646,6 @@ MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
 
 static struct platform_driver fsl_asrc_driver = {
 	.probe = fsl_asrc_probe,
-	.remove = fsl_asrc_remove,
 	.driver = {
 		.name = "fsl-asrc",
 		.of_match_table = fsl_asrc_ids,
-- 
2.43.0

