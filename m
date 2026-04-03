Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A122E3F0;
	Fri,  3 Apr 2026 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775178222; cv=none; b=IvymdSdWCYkAn0zXMEm2ZOZqWFwaK/8NXCTJuDlzUuXOvYWvTP4O2dCwHYAcCzCNDPkqLceytX1br5lpZhC1PpwPIN0Uv77Nmg/O8dG2BmhpbMJTFGhcZIrnfyCna7gp6bFMWU6cYfXeW8DHrh9jyZU0tR6MXL2G1j4UgC2rI7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775178222; c=relaxed/simple;
	bh=QceUNaQescYqlB+08FxgCj9tlELvq3E4VSk8IG3F+NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eC+6sUZ5iPvqFN2/6yhi5jxsfwXN3cBuJl8PSgvwY5d3g0lgp6HhbU7+2NixPyQDPEDQqGIVf9cL5vI0X+ffDmvgYvN0JrrjrC/3DTBxemdjtZvA4Y1myPEfAuaNcNqNw1EJ4SPwjlqENUICM1mrknBN+LpnxbKQSJpI1ff8l2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=J3DE4JZB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rfn3AbUI; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="J3DE4JZB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rfn3AbUI"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2FA4EEC03F1;
	Thu,  2 Apr 2026 21:03:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 02 Apr 2026 21:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1775178219; x=
	1775264619; bh=x9kS2SlYjcQeS1xLmaYp/yXJ9yeAx/Zi7S0G4o85ivI=; b=J
	3DE4JZB90OxCk4BSKd1cYymV+27pBtRcatHbVlx3SM10P7KwdZKeFFY6TbFOZvU1
	hIafai86CDPSqCY14L7DrtmgqJ+OCjjSPlr7PRwpln8HuqW0rkQzFdpucZmoLkVi
	A0pY3bD77qQFC9u854e5tBABwNlqGtQyeMUkKjKWv604FTTTnVX94iNCaXZqgSw1
	SP1dSjwcueMULcTN8HGiS/1P2ntxh5LIGrzLE7dN3gBZOroCvDW/fwd4wLebrK+u
	kSpL3LXsPf+TAe/oZNAcAotrXVxSXpVlf5zvTpgVfiTLo0jDr8gPlqNS9U2htQXH
	hs0yXFD76XYKWKy4aebHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1775178219; x=1775264619; bh=x
	9kS2SlYjcQeS1xLmaYp/yXJ9yeAx/Zi7S0G4o85ivI=; b=rfn3AbUIuo7GcPOiV
	mp2dgVJW1FDSr5TPtDOyKBnlNsGHEr+ZWGRIABnEJJOP6oXxcWnIWLtZKyO7ildU
	D0EkHX/MAHGVxiG8lCj+VwD0aL9nyxpxD1WbtaujUGZCC9uvEc4wE5BU+vEZ6Xe3
	ysbXIzSkTzBkDt2SdiTb/ye79U82y9D9nRyDyWb6377IHTlz72iheGsfyDT8I2gU
	hZwL3rCN/wuk6pq9gHuDpreba7jG4yAH1c56oll5aC2E2eZnm+/6Blknr8FYVZb0
	H8VJx1epR8drYZcvmsZOragv73U8PYaKgsSX3KUjxs/DjdNmPUp/Z6PY2lmVVV0z
	6xBVg==
X-ME-Sender: <xms:6hHPacOtOsMEpipD8kEE5Tp3Am_sLRCGj0ZnhGCprr1s12Z2ahZYKg>
    <xme:6hHPaX7jaS_n9tjTuL2togXRNdPpkL5wGUqd9q3eoWAGo6hYf09d06l20Q-ULQXUK
    XYNRqAH2KZ1OvKYwf3iGIQarta-MhRQZjFRepVuwTvuLBnemLEqZ7s>
X-ME-Received: <xmr:6hHPaXhAIdDpUkXNyT0AHb8cs_EtxzOvbpgB4JQ5Q4fhr0CccEdI8SlDnCXsd-UUPobufYyyRMXLI7llHGznSiVuZD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephffvvefuff
    fkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhsohhnuceo
    mhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvg
    hrnhepfedtvdejfeelffevhffgjeejheduteetieeguefgkefhhfegjeduueethefgvdff
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvg
    grrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnohhvoh
    esshhquhgvsggsrdgtrgdprhgtphhtthhopehvihhjvghnuggrrhdrmhhukhhunhgurges
    rghmugdrtghomhdprhgtphhtthhopehvvghnkhgrthgrphhrrghsrggurdhpohhtthhurh
    husegrmhgurdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtgho
    mhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrghisehsuhhsvgdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:6hHPaUf5VQ61I9Ig4zeESkjzvJHw7FmFh0ujcWMyCzQCEpf72cozcg>
    <xmx:6hHPaXzpC4HWV86-UQ2kVO7_jKgqEj30Sfm3qiM-CjrbAQNrbUzV8Q>
    <xmx:6hHPab248-OJl6A_d1tbTOsZLYhLie2BYiPGozD0L60xUkSfLKn3RA>
    <xmx:6hHPaVyvoa596pavDtCRUp1-Adtm6oIMAzwTwm0D-0XkuSRTcVV4Pw>
    <xmx:6xHPaSDODAz1nD4hi2SdABMrNRZxB6P9CRXNvVMJ_FkWpECBWg_5FQwZ>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 21:03:38 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp: add Lenovo P16s G5 AMD quirk for legacy SDW machine
Date: Thu,  2 Apr 2026 21:03:25 -0400
Message-ID: <20260403010336.1223078-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk entry for Lenovo P16s G5 AMD to use ASOC_SDW_ACP_DMIC.
Needed to allow the microphone to work on this platform

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 05484c72f9a8..f2c80f1424f0 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -111,6 +111,22 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = { /* Lenovo P16s G5 AMD */
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "21XG"),
+		},
+		.driver_data = (void *)(ASOC_SDW_ACP_DMIC),
+	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = { /* Lenovo P16s G5 AMD */
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "21XH"),
+		},
+		.driver_data = (void *)(ASOC_SDW_ACP_DMIC),
+	},
 	{
 		.callback = soc_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

