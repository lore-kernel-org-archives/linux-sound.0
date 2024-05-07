Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF44216E886
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097338; cv=none; b=hCcqpToPLti4dt4gS7vdfrX8J07rBRn9FtX9Bhjo/mFPPbM3n20L8v/XnmyMfZVhjQGyb2wIjqz40/IMua8N0+JyF2RGfgFdXrpaKWpJRbbPQCT7BSrFITapLPiX+4SdC3PCinTaNIqZlkaVhMVbM8yd9LnKAf8jnGjvExNhf54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097338; c=relaxed/simple;
	bh=SGQM2GZfH6v4QAzbQSHrHLNOGuCiidMMxB4Tr800Z+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T11kP2TGOAvHQuF/K0Fn59TIXQB0d9RxrxaLOLveMm31y71e1U6EuMhVo9w0GE2VN+QmGrMPDybuPvcSslJyrCb2LBN7FomktXVPmyVgnsMvgub/Wawsm0ExX1jkvaEiWNJyeSF1Y4TC9TsQa2vVSjF8UsFFaXO0RH66sULp08g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 02A3221ED3;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7A0613A3A;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SKxQM/ROOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 15/34] ASoC: loongson: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:19 +0200
Message-ID: <20240507155540.24815-16-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 02A3221ED3

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/loongson/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/loongson/Makefile b/sound/soc/loongson/Makefile
index 601a905a4860..578030ad6563 100644
--- a/sound/soc/loongson/Makefile
+++ b/sound/soc/loongson/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 #Platform Support
-snd-soc-loongson-i2s-pci-objs := loongson_i2s_pci.o loongson_i2s.o loongson_dma.o
+snd-soc-loongson-i2s-pci-y := loongson_i2s_pci.o loongson_i2s.o loongson_dma.o
 obj-$(CONFIG_SND_SOC_LOONGSON_I2S_PCI) += snd-soc-loongson-i2s-pci.o
 
 #Machine Support
-snd-soc-loongson-card-objs := loongson_card.o
+snd-soc-loongson-card-y := loongson_card.o
 obj-$(CONFIG_SND_SOC_LOONGSON_CARD) += snd-soc-loongson-card.o
-- 
2.43.0

