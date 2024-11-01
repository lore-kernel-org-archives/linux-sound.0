Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2C322B
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 04:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730436244; cv=none; b=FxdMNnyMPkZuWEsCGTBZ6YSNMTUQEfkbdg339bszPJhSWvdRNfcR8jnJZY1O79tt2ZjTY2eV5BlqFNKlvjl4sWIMww1JmtR/KYrdskAPmG5+qjozWEQf7ld66RTYQ/esG+z6G5oPzzPKv6y1A9Wi+NJk2eTLOGZaYDffx+Tgm6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730436244; c=relaxed/simple;
	bh=lds4D1YqbDt6dvw0YVK0ecsm+5xw0Dh21ZXrEpbZBU0=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=KHCoGMiu9DRBJgk+5Pnc3HNXmHfrziViqjh6d3vad1WX3UwZzqN5CkDwBq7mGEFzatlYC4HCoIkbK+ipJggDn2h2igsdQ+7MojGDoiX8TOexJyX5ajqF0yB9SE2o3loM/v6mZ/whM+Nv6pnFIVHNQX2LOYvgxPcm/m6rCWwOrOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=Ly5bpRhJ; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="Ly5bpRhJ"
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id D174520A02
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 04:35:57 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.119.155])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id A35E726760
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 04:35:48 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id F3DF83E8D7;
	Fri,  1 Nov 2024 05:35:40 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 97EF440078;
	Fri,  1 Nov 2024 04:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1730435740; bh=lds4D1YqbDt6dvw0YVK0ecsm+5xw0Dh21ZXrEpbZBU0=;
	h=Date:From:To:Cc:Subject:From;
	b=Ly5bpRhJ+wLnQxkFhcNGM2nXuaCqkCAM86YFI3zj9U7mRg7PG1CkbGQejcecZ8pVB
	 vDxR5MLeSuDYUfj2BM/4ab4kB95AB2HgLNmZyhjLPfIbTx9f1RjEVG4sTF944vxsvR
	 RFO2bk65zSj0f9eYS5e+K7CPIrStnpsElK+ELM3g=
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0082440E46;
	Fri,  1 Nov 2024 04:35:35 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 12:35:35 +0800
From: Mingcong Bai <jeffbai@aosc.io>
To: broonie@kernel.org
Cc: mario.limonciello@amd.com, linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14 2022
Message-ID: <8bad41b7ddbc8e061f682ecdf00a50e1@aosc.io>
X-Sender: jeffbai@aosc.io
Organization: Anthon Open Source Community
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 97EF440078
X-Rspamd-Server: nf1.mymailcheap.com
X-Spamd-Result: default: False [-0.40 / 10.00];
	BAYES_HAM(-0.30)[75.02%];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_THREE(0.00)[3]
X-Rspamd-Action: no action

Xiaomi Book Pro 14 2022 (MIA2210-AD) requires a quirk entry for its
internal microphone to be enabled.

This is likely due to similar reasons as seen previously on Redmi Book
14/15 Pro 2022 models (since they likely came with similar firmware):

- dcff8b7ca92d724bdaf474a3fa37a7748377813a (ASoC: amd: yc: Add Xiaomi
   Redmi Book Pro 15 2022 into DMI table)
- c1dd6bf6199752890d8c59d895dd45094da51d1f (ASoC: amd: yc: Add Xiaomi
   Redmi Book Pro 14 2022 into DMI table)

A quirk would likely be needed for Xiaomi Book Pro 15 2022 models, too.
However, I do not have such device on hand so I will leave it for now.

Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
---
  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
  1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c 
b/sound/soc/amd/yc/acp6x-mach.c
index 438865d5e376..dc476bfb6da4 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -395,6 +395,13 @@ static const struct dmi_system_id 
yc_acp_quirk_table[] = {
  			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 15 2022"),
  		}
  	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TIMI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Xiaomi Book Pro 14 2022"),
+		}
+	},
  	{
  		.driver_data = &acp6x_card,
  		.matches = {
-- 
2.47.0

