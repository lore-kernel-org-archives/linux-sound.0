Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02AA16E86B
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097337; cv=none; b=acwQMd/b5kjOkNFYGsFKt+9Y3bhMD75n6nCUnYcThhmJaizKEd5xCFUE3CrmM58BGoTYl/mXidVf30Np676yY72f7bRAUboOxzFnp0GkaHQZcvvYZqB2wniuTO2D3pNacHz19XGbXdM43rs+NANmaRslLdG9U9lasYNvpXuga/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097337; c=relaxed/simple;
	bh=297cbP74YfxjpAvrjPhHVQNnx6sdK3wJA9MfZGwK6PU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rt7xvF8Z6Xmpktlrg/npwRpYiJD4+fYIGcPPkAemExaQFNa4RAA6s9tnZHwh3yJMksGYmHbr1vWVLjxRnmSKVDH9MoNSA6Hoh+YtUMEpUmH+5JKvSNmbaCzU7zKtj4aB5CuXq/orWjb9OFyNf65MiAwg6gSoSjJ256CcX14uoz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0DB820C95;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1F1D13A2D;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uKsNKvROOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 14/34] ASoC: kirkwood: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:18 +0200
Message-ID: <20240507155540.24815-15-tiwai@suse.de>
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
X-Rspamd-Queue-Id: D0DB820C95
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
 sound/soc/kirkwood/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/kirkwood/Makefile b/sound/soc/kirkwood/Makefile
index e2d279f16a46..9be1eb8203a1 100644
--- a/sound/soc/kirkwood/Makefile
+++ b/sound/soc/kirkwood/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-kirkwood-objs := kirkwood-dma.o kirkwood-i2s.o
+snd-soc-kirkwood-y := kirkwood-dma.o kirkwood-i2s.o
 
 obj-$(CONFIG_SND_KIRKWOOD_SOC) += snd-soc-kirkwood.o
 
-snd-soc-armada-370-db-objs := armada-370-db.o
+snd-soc-armada-370-db-y := armada-370-db.o
 
 obj-$(CONFIG_SND_KIRKWOOD_SOC_ARMADA370_DB) += snd-soc-armada-370-db.o
-- 
2.43.0

