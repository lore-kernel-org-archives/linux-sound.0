Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497AF16EC0F
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097341; cv=none; b=fJEfMc0VgV4HpZuM5iCzjm1FxfLVmlMyU3++vZREHgp/Qut559QnvM0ysZU+yMuMYnfGUj5x07UkiY7VXWmpI7Cn145wOhSITLhNpS57bfaGqH10n5Dr9VgGrH4uhehz8XAGQqyMin5KMuwgHSle64nh6n7cLy9hYJ4J1rH8Fzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097341; c=relaxed/simple;
	bh=/EYzuGpTTbsewLhau1cduQirkpEXrpGLe9g78m+z2Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNf89uFnEtSXR31LY2CcTmygTAkXv4W68MWnS1NkyXHtSozvqqDv9ndRAExxgGlNh42BQxKbQnt6KCG8ALpbQhohp31pocZy1AqlgUrjsPfgyec7hjlQ//HsMrwRdcfKbBrgxbQ/EhuARL3O1aBrwJMagI3FU8sWskIzchtVlqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8CB64221E6;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C8A513A3A;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4KBRGfdOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 31/34] ASoC: uniphier: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:35 +0200
Message-ID: <20240507155540.24815-32-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 8CB64221E6
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
 sound/soc/uniphier/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/uniphier/Makefile b/sound/soc/uniphier/Makefile
index 88169395f68a..5fee21b6074c 100644
--- a/sound/soc/uniphier/Makefile
+++ b/sound/soc/uniphier/Makefile
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-soc-uniphier-aio-cpu-objs := aio-core.o aio-dma.o aio-cpu.o aio-compress.o
-snd-soc-uniphier-aio-ld11-objs := aio-ld11.o
-snd-soc-uniphier-aio-pxs2-objs := aio-pxs2.o
+snd-soc-uniphier-aio-cpu-y := aio-core.o aio-dma.o aio-cpu.o aio-compress.o
+snd-soc-uniphier-aio-ld11-y := aio-ld11.o
+snd-soc-uniphier-aio-pxs2-y := aio-pxs2.o
 
 obj-$(CONFIG_SND_SOC_UNIPHIER_AIO) += snd-soc-uniphier-aio-cpu.o
 obj-$(CONFIG_SND_SOC_UNIPHIER_LD11) += snd-soc-uniphier-aio-ld11.o
 obj-$(CONFIG_SND_SOC_UNIPHIER_PXS2) += snd-soc-uniphier-aio-pxs2.o
 
-snd-soc-uniphier-evea-objs := evea.o
+snd-soc-uniphier-evea-y := evea.o
 obj-$(CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC) += snd-soc-uniphier-evea.o
-- 
2.43.0

