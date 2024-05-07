Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3A16DEA5
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097338; cv=none; b=syjhqvH3uX9ap50dw84GMk7iORrfJsuos2nJgy5WFvZuAk2YM8Uqbu9dcVwUP7wDxAbkKcixmvAROQqLJC6HMqXAeS2TZlQFGPkRYpGCDf+lUF1GwuhKqm3htHSp1SCBTWYvav1DRYo0kPjsObjo9D04YyuucC7lsZKAVmtCQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097338; c=relaxed/simple;
	bh=780+lSQtxsmLEiXTsj2kWRkjUQSEhvzTXMWcHf2UhpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7pt/vNB/+OenjGswfLwqI2HfxEgkS9NqivyEiRmWddlZ2o2SvznqyOrgK0EACSd2EesgBR/SY3HKHydG4+fuOXDSLlxDuwdsVsvSCO0pvt1LO/1x+QDacxIEuIfisj9jYCd16QmiU4DPOlLskSbk3LS3hUtbOZSpgrmfgHjI+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF97C21D08;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C12B513A3A;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iA9ALfNOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 09/34] ASoC: cirrus: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:13 +0200
Message-ID: <20240507155540.24815-10-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: DF97C21D08
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/cirrus/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/cirrus/Makefile b/sound/soc/cirrus/Makefile
index 19a86daad660..ad606b293715 100644
--- a/sound/soc/cirrus/Makefile
+++ b/sound/soc/cirrus/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 # EP93xx Platform Support
-snd-soc-ep93xx-objs				:= ep93xx-pcm.o
-snd-soc-ep93xx-i2s-objs	 			:= ep93xx-i2s.o
+snd-soc-ep93xx-y				:= ep93xx-pcm.o
+snd-soc-ep93xx-i2s-y	 			:= ep93xx-i2s.o
 
 obj-$(CONFIG_SND_EP93XX_SOC)			+= snd-soc-ep93xx.o
 obj-$(CONFIG_SND_EP93XX_SOC_I2S)		+= snd-soc-ep93xx-i2s.o
 
 # EP93XX Machine Support
-snd-soc-edb93xx-objs				:= edb93xx.o
+snd-soc-edb93xx-y				:= edb93xx.o
 
 obj-$(CONFIG_SND_EP93XX_SOC_EDB93XX)		+= snd-soc-edb93xx.o
-- 
2.43.0

