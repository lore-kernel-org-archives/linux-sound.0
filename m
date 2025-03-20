Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AF9224AF0
	for <linux-sound@vger.kernel.org>; Thu, 20 Mar 2025 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742468246; cv=none; b=Fe1y6SNQ5r3DxUUS248YSmOoQVYrqwrUW7urbcxOB0vcCEQVttk01s0dhbuA79az1NWt7kATBtY6wr40p9xlOsDUrhSAU4oS6mMG8GIwA20fkMnh7kt6lQJRo//PjDkVspC2ljnQspFLuht2oe6jNUTGdZccyRolLU5zj43QPks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742468246; c=relaxed/simple;
	bh=JSFkd0IQpFQXlMl8yNzVK/WEr4/oQqYSoGhxOgZIfDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OjoD3WHWkzTxrFGR5DV8ElMK1f2b9DQ5cZOzKTwr0ih6ughPEjvqrLtq4n8JNGBRm306TSjvtdr50/Z2WP50ZUbD1tGV76m+Ujn8GBxysAQS4KE6Mxr1g3gIz1MnaWDOprb+f4TJ9y07bgwdNBfo4G0F6hd9T+MU0wp9LNIzUzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dUI7rrZp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=grmvIPWS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dUI7rrZp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=grmvIPWS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dUI7rrZp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="grmvIPWS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dUI7rrZp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="grmvIPWS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1028121E3A;
	Thu, 20 Mar 2025 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742468243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xcNzfaGbptW22RlVagyFtnaG+nznBLU2dGGT5WjbQZ0=;
	b=dUI7rrZp0AXuUVJxS1Mb1SzVpzzHPpiqCwCVsr3P9JLWxINLdvk91k1oXDegv9EuHtxys2
	7MGtyePdBztNzHWFuN1RMEij8ve4CvU0sPw4gluNIwbftWZ65Hj+/jsbg7cX380yz0xxsG
	HVKR1QnF1M2pgPq/kdf9A9Sgt76WfZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742468243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xcNzfaGbptW22RlVagyFtnaG+nznBLU2dGGT5WjbQZ0=;
	b=grmvIPWSs/VYxZUKn4IrmBxmRD4IZofVpYiUTce1+hxZ+L1h8quZShmGVlG5MrbrBA29FX
	lIQ5EM2S/erLbJAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742468243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xcNzfaGbptW22RlVagyFtnaG+nznBLU2dGGT5WjbQZ0=;
	b=dUI7rrZp0AXuUVJxS1Mb1SzVpzzHPpiqCwCVsr3P9JLWxINLdvk91k1oXDegv9EuHtxys2
	7MGtyePdBztNzHWFuN1RMEij8ve4CvU0sPw4gluNIwbftWZ65Hj+/jsbg7cX380yz0xxsG
	HVKR1QnF1M2pgPq/kdf9A9Sgt76WfZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742468243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xcNzfaGbptW22RlVagyFtnaG+nznBLU2dGGT5WjbQZ0=;
	b=grmvIPWSs/VYxZUKn4IrmBxmRD4IZofVpYiUTce1+hxZ+L1h8quZShmGVlG5MrbrBA29FX
	lIQ5EM2S/erLbJAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5641139D2;
	Thu, 20 Mar 2025 10:57:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 13SvNpL022cDFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Mar 2025 10:57:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ALSA: oxygen: Fix dependency on CONFIG_PM_SLEEP
Date: Thu, 20 Mar 2025 11:57:20 +0100
Message-ID: <20250320105721.10789-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The conversion to EXPORT_SIMPLE_DEV_PM_OPS() also replaced the pm ops
assignment with pm_ptr() macro, but this made difference from the
original code; it  had conditional with ifdef CONFIG_PM_SLEEP, while
we have now with CONFIG_PM, instead.  This seems causing build errors
with randomconfig.

For fixing the inconsistency, replace pm_ptr() with pm_sleep_ptr().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503201853.7kB0BPRw-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/oxygen/oxygen.c   | 2 +-
 sound/pci/oxygen/se6x.c     | 2 +-
 sound/pci/oxygen/virtuoso.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/oxygen/oxygen.c b/sound/pci/oxygen/oxygen.c
index 6d0deea47ee6..ff7439634d76 100644
--- a/sound/pci/oxygen/oxygen.c
+++ b/sound/pci/oxygen/oxygen.c
@@ -855,7 +855,7 @@ static struct pci_driver oxygen_driver = {
 	.id_table = oxygen_ids,
 	.probe = generic_oxygen_probe,
 	.driver = {
-		.pm = pm_ptr(&oxygen_pci_pm),
+		.pm = pm_sleep_ptr(&oxygen_pci_pm),
 	},
 };
 
diff --git a/sound/pci/oxygen/se6x.c b/sound/pci/oxygen/se6x.c
index c1bb9dd1cd54..9d009015d97e 100644
--- a/sound/pci/oxygen/se6x.c
+++ b/sound/pci/oxygen/se6x.c
@@ -138,7 +138,7 @@ static struct pci_driver se6x_driver = {
 	.id_table = se6x_ids,
 	.probe = se6x_probe,
 	.driver = {
-		.pm = pm_ptr(&oxygen_pci_pm),
+		.pm = pm_sleep_ptr(&oxygen_pci_pm),
 	},
 	.shutdown = oxygen_pci_shutdown,
 };
diff --git a/sound/pci/oxygen/virtuoso.c b/sound/pci/oxygen/virtuoso.c
index 0bfe6d8dde3e..ded62199da7f 100644
--- a/sound/pci/oxygen/virtuoso.c
+++ b/sound/pci/oxygen/virtuoso.c
@@ -83,7 +83,7 @@ static struct pci_driver xonar_driver = {
 	.id_table = xonar_ids,
 	.probe = xonar_probe,
 	.driver = {
-		.pm = pm_ptr(&oxygen_pci_pm),
+		.pm = pm_sleep_ptr(&oxygen_pci_pm),
 	},
 	.shutdown = oxygen_pci_shutdown,
 };
-- 
2.49.0

