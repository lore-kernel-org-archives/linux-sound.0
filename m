Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30EE16C873
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722445497; cv=none; b=nYNsjaZRF709aRSE/yrVB3WLnlf/jbA7ZmaMZsXHovhJCEXauf10H0oz7Z4cZZjGTUtUqrdgEeryDC5FDVhrjYUm4J2XB+ricIU850CT7+JAek1pF8Qs4pKnhhV53pc/l9vY/kiBO6EYbns05W2Xnfq7t8L0BN7xTFhjVjq2gkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722445497; c=relaxed/simple;
	bh=76+kthzTICUiU/fMirw4fX59WRLmP4OAKB2ITNBDErM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZJesle5r9O+DBjqcjwQRVkHpUWPxNuk1PshjiLLrMpPWtTJGSmyhJyuymYxnmt0gWDNTqOKEEqqjC6JOk3WO//NdfGMGo8LksjMmRQ3yGeqe5bOuTcI5O+P5/DIQDqCuiOQSqrjMe8Fv06KGlfZBPfbWRuAsT+/PGcspqmMgNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O2/4aJ4p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4KpEaCur; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O2/4aJ4p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4KpEaCur; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O2/4aJ4p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4KpEaCur";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O2/4aJ4p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4KpEaCur"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1848321A1C;
	Wed, 31 Jul 2024 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722445488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2QLiNty5Y7cbfAIgftspOtv6f/hyrMtQogiq5m3Jc0A=;
	b=O2/4aJ4pnAIXS2BcuMLXntkOeDv2xI1BWjtXlJJWG60skucfTGODxreBKzZHyLrUj+qTyw
	6vnnxtG/MBB2arhyZDqmp2bHO9PbnG1XqZbQZ27k9iXdNLBPSNy2Xc6jAD+y4InTl6K/OE
	oW0aLbzlNeMw6YuC7jO8WOmj2VZcchM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722445488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2QLiNty5Y7cbfAIgftspOtv6f/hyrMtQogiq5m3Jc0A=;
	b=4KpEaCurHgAhGn+sFOAybEYnY7UQdykuP1jjIyFUb7zOw/5GV46RaVcjeP7ZpFlnvk/4Ok
	5O1/R1H8/WJUYFBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="O2/4aJ4p";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4KpEaCur
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722445488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2QLiNty5Y7cbfAIgftspOtv6f/hyrMtQogiq5m3Jc0A=;
	b=O2/4aJ4pnAIXS2BcuMLXntkOeDv2xI1BWjtXlJJWG60skucfTGODxreBKzZHyLrUj+qTyw
	6vnnxtG/MBB2arhyZDqmp2bHO9PbnG1XqZbQZ27k9iXdNLBPSNy2Xc6jAD+y4InTl6K/OE
	oW0aLbzlNeMw6YuC7jO8WOmj2VZcchM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722445488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2QLiNty5Y7cbfAIgftspOtv6f/hyrMtQogiq5m3Jc0A=;
	b=4KpEaCurHgAhGn+sFOAybEYnY7UQdykuP1jjIyFUb7zOw/5GV46RaVcjeP7ZpFlnvk/4Ok
	5O1/R1H8/WJUYFBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F125113297;
	Wed, 31 Jul 2024 17:04:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ui2VOa9uqmYJJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 17:04:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Conditionally use snooping for AMD HDMI
Date: Wed, 31 Jul 2024 19:05:15 +0200
Message-ID: <20240731170521.31714-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 1848321A1C
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.19

The recent regression report revealed that the use of WC pages for AMD
HDMI device together with AMD IOMMU leads to unexpected truncation or
noises.  The issue seems triggered by the change in the kernel core
memory allocation that enables IOMMU driver to use always S/G
buffers.  Meanwhile, the use of WC pages has been a workaround for the
similar issue with standard pages in the past.  So, now we need to
apply the workaround conditionally, namely, only when IOMMU isn't in
place.

This patch modifies the workaround code to check the DMA ops at first
and apply the snoop-off only when needed.

Fixes: f5ff79fddf0e ("dma-mapping: remove CONFIG_DMA_REMAP")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219087
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_controller.h |  2 +-
 sound/pci/hda/hda_intel.c      | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index c2d0109866e6..68c883f202ca 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -28,7 +28,7 @@
 #else
 #define AZX_DCAPS_I915_COMPONENT 0		/* NOP */
 #endif
-/* 14 unused */
+#define AZX_DCAPS_AMD_ALLOC_FIX	(1 << 14)	/* AMD allocation workaround */
 #define AZX_DCAPS_CTX_WORKAROUND (1 << 15)	/* X-Fi workaround */
 #define AZX_DCAPS_POSFIX_LPIB	(1 << 16)	/* Use LPIB as default */
 #define AZX_DCAPS_AMD_WORKAROUND (1 << 17)	/* AMD-specific workaround */
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index ca5953445636..b79020adce63 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -40,6 +40,7 @@
 
 #ifdef CONFIG_X86
 /* for snoop control */
+#include <linux/dma-map-ops.h>
 #include <asm/set_memory.h>
 #include <asm/cpufeature.h>
 #endif
@@ -306,7 +307,7 @@ enum {
 
 /* quirks for ATI HDMI with snoop off */
 #define AZX_DCAPS_PRESET_ATI_HDMI_NS \
-	(AZX_DCAPS_PRESET_ATI_HDMI | AZX_DCAPS_SNOOP_OFF)
+	(AZX_DCAPS_PRESET_ATI_HDMI | AZX_DCAPS_AMD_ALLOC_FIX)
 
 /* quirks for AMD SB */
 #define AZX_DCAPS_PRESET_AMD_SB \
@@ -1706,6 +1707,13 @@ static void azx_check_snoop_available(struct azx *chip)
 	if (chip->driver_caps & AZX_DCAPS_SNOOP_OFF)
 		snoop = false;
 
+#ifdef CONFIG_X86
+	/* check the presence of DMA ops (i.e. IOMMU), disable snoop conditionally */
+	if ((chip->driver_caps & AZX_DCAPS_AMD_ALLOC_FIX) &&
+	    !get_dma_ops(chip->card->dev))
+		snoop = false;
+#endif
+
 	chip->snoop = snoop;
 	if (!snoop) {
 		dev_info(chip->card->dev, "Force to non-snoop mode\n");
-- 
2.43.0

