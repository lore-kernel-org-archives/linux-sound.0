Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FAD2262B
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709105976; cv=none; b=dFWwLVDLRUcgsNpJSTktbxKDVqpq1pWJn99xO8rp5Y0MPb2jak10Bx3A2ft6A/+lU0xc8ALeYrbmNzqp2xXiJ6VzI9c8rNGzs07ESI4ydQFIz94A0KwBfQ9wx5KIDvVkrx6RSt9hCtjkhTQCaOxGr9n/twt+4O9BDQzEZsubDQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709105976; c=relaxed/simple;
	bh=30+IE/wX+J+GmGYD58bOq80Psm6oAk56MlPcFLN+60c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D51wHsvTqghPhyj6NutDNdocPY61GT5RZA1fy2r5enh9fOT01YVlZ8Kai8S7NW2OdWzYuM5asWUQVM9nzVaSmjdn0SAF1iXJ3JLgWdPCJ0tkLCQ788jks6wor7So5ucsw8vQRSaHXgnaoFgxgFrmVpsVsUuFag4w7sMOXmqWVLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=TEw+YIVd; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="TEw+YIVd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1709105972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ndKq2eVWKXYErGnWKFXFB9z2FnzOLNeieDO4qh9C7k4=;
	b=TEw+YIVd2tdlyZKBfc7ph4Na1+6jK5DlxpuozWuWwk/DtVkfWqailE8/prapPkY9tmU6F9
	XHT4xp7++EBj3sriAbWWikyx4AGqvR53b30vV/ByoGuVpLT959sdWX310ImUCPloABbnb3
	GxVdcUOS+cPh75rTskua+qYLAx/dBbHvMHT7RBPTD9zB8x+wFiftsbaZjaG3wFwrR8vjW1
	2xebQqdG8XmSwvj7CiOHxT3BHRRHCJFpqWzeHjP41J7dqQi3YAYquHQnLNF+herQQSFA6B
	cK4vY2hQ9CQqXrjG8qeG404uTLsHaHFLDC5MbUKagVJhts/0UJwgp1OZ+akdpA==
From: Jiawei Wang <me@jwang.link>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Jiawei Wang <me@jwang.link>
Subject: [PATCH 2/2] ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2
Date: Wed, 28 Feb 2024 15:39:14 +0800
Message-Id: <20240228073914.232204-2-me@jwang.link>
In-Reply-To: <20240228073914.232204-1-me@jwang.link>
References: <20240228073914.232204-1-me@jwang.link>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Like many other models, the Lenovo 21J2 (ThinkBook 16 G5+ APO)
needs a quirk entry for the internal microphone to function.

Signed-off-by: Jiawei Wang <me@jwang.link>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index cc231185d72c..895e73243921 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -199,6 +199,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21J2"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.39.2

