Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6716E881
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097340; cv=none; b=CVRfRhygzIEaekz8JJ65MnS859sCoh6+km6JJOmvZqcOYhSK/Fn0FSIl1Z0yEMLHRLbzh+K9WTxrK9u8EnXCZhtlw6j1AscrBFkH16NGCkeSS5Km7pRowdPmt57qtdXlkXfr2Oent+Vi1iF4x+XjXO6k623r0aHHKnPnMdBecMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097340; c=relaxed/simple;
	bh=DTkINNwNPLJih8b1HR1LmcoXXow/jr0I36cUlY57w58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEM048wpT2nvP9oWxNtwvRS4M+zXt1Pcdyw5qSZiykHRvecciLTpaPoc1Naw4roFoXIcXtSsKu+9zxW5xPXtvB9UBbOzBiWugphCRvvd9PL905VKjXwLWOZqL5fPeo8WIWwSlR4t/5l54IkvQr2REHPt1+Cdu1P19wzM7WPj748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 91B1920C98;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 723BC13A2D;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oPZ2GvZOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 25/34] ASoC: spear: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:29 +0200
Message-ID: <20240507155540.24815-26-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 91B1920C98
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
 sound/soc/spear/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/spear/Makefile b/sound/soc/spear/Makefile
index 31d9dae280e7..61569d2e7606 100644
--- a/sound/soc/spear/Makefile
+++ b/sound/soc/spear/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # SPEAR Platform Support
-snd-soc-spear-pcm-objs := spear_pcm.o
-snd-soc-spear-spdif-in-objs := spdif_in.o
-snd-soc-spear-spdif-out-objs := spdif_out.o
+snd-soc-spear-pcm-y := spear_pcm.o
+snd-soc-spear-spdif-in-y := spdif_in.o
+snd-soc-spear-spdif-out-y := spdif_out.o
 
 obj-$(CONFIG_SND_SPEAR_SOC) += snd-soc-spear-pcm.o
 obj-$(CONFIG_SND_SPEAR_SPDIF_IN) += snd-soc-spear-spdif-in.o
-- 
2.43.0

