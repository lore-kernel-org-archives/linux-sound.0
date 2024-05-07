Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FF16DEBC
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097335; cv=none; b=Hy/uetTFAm1zNlAiR1kDPLVDool/zjBq9HlH9Ojs3gSE3ZrSYK66xI9vTgCQhOqHY609GeZk3NTa7EFtl/pckjZA7feYDpSZixCO0Tkfvga4ZvjWS2LfAhZjNSfGDIk72/XSkJH0O492WZUS2QXF127JF/3qsF3L6naY07KwXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097335; c=relaxed/simple;
	bh=PNBMHEIjKHg2cCJGVYUkVQZmKut/fsXLYTXsJQb/xYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMECWxBpX9/ed6cZqlothNXhsLi4j+Yai9rX41U2eBR4665HqfSK/KjImkR1tXfweLhy/Y8i+CRMkhRgiJnVbozlrNMrRjzTOTyR4Y0fPJ7mws1fUUrbG0FvWW+IbUwBOleHWF3w0ZnMRA0uo9oVDCxE22CLHoE8XLioyCtvfXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 930F020C91;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 728A013A3A;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gERdGvNOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 07/34] ASoC: au1x: Use *-y instead of *-objs Makefile
Date: Tue,  7 May 2024 17:55:11 +0200
Message-ID: <20240507155540.24815-8-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 930F020C91

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/au1x/Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/au1x/Makefile b/sound/soc/au1x/Makefile
index 33183d7fe057..9c6f5c38f92d 100644
--- a/sound/soc/au1x/Makefile
+++ b/sound/soc/au1x/Makefile
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 # Au1200/Au1550 PSC audio
-snd-soc-au1xpsc-dbdma-objs := dbdma2.o
-snd-soc-au1xpsc-i2s-objs := psc-i2s.o
-snd-soc-au1xpsc-ac97-objs := psc-ac97.o
+snd-soc-au1xpsc-dbdma-y := dbdma2.o
+snd-soc-au1xpsc-i2s-y := psc-i2s.o
+snd-soc-au1xpsc-ac97-y := psc-ac97.o
 
 # Au1000/1500/1100 Audio units
-snd-soc-au1x-dma-objs := dma.o
-snd-soc-au1x-ac97c-objs := ac97c.o
-snd-soc-au1x-i2sc-objs := i2sc.o
+snd-soc-au1x-dma-y := dma.o
+snd-soc-au1x-ac97c-y := ac97c.o
+snd-soc-au1x-i2sc-y := i2sc.o
 
 obj-$(CONFIG_SND_SOC_AU1XPSC) += snd-soc-au1xpsc-dbdma.o
 obj-$(CONFIG_SND_SOC_AU1XPSC_I2S) += snd-soc-au1xpsc-i2s.o
@@ -17,8 +17,8 @@ obj-$(CONFIG_SND_SOC_AU1XAC97C) += snd-soc-au1x-ac97c.o
 obj-$(CONFIG_SND_SOC_AU1XI2SC) += snd-soc-au1x-i2sc.o
 
 # Boards
-snd-soc-db1000-objs := db1000.o
-snd-soc-db1200-objs := db1200.o
+snd-soc-db1000-y := db1000.o
+snd-soc-db1200-y := db1200.o
 
 obj-$(CONFIG_SND_SOC_DB1000) += snd-soc-db1000.o
 obj-$(CONFIG_SND_SOC_DB1200) += snd-soc-db1200.o
-- 
2.43.0

