Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEEC1D0420
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727884746; cv=none; b=gUoCD9vPNTrIhxlfECARMwGQqwDI1Ma1d6rUktDjhTlJuPfLNRKUPOXxZ04HAfdojGYHuxq1pWip055D3GirMfQbP52y7jHYtUNZaxdBzIkkt0akZ5jh68+XcO//UrimOjvCvR09UkX+3C1bYHDcm8nEw2Yh0CWlWlHAN2B5QjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727884746; c=relaxed/simple;
	bh=614htAUmT+zfDuleaduyUj4LHiRrHhetedOz4iw9vys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLK1ruxFWQv4YLUO4si4r3vXU5OuKty8/gBuAfOo/K9HtNwz7/X5jbwosMf5cTGEIHNYgWhQHZbGtksQbbI74N8oausoAPVRf2P457fShbAzTBs0AM5OY/Q/25EWsxHe9sCM7Wx7LxOqHptP2v0i6WqUL1vh4JDsGzfTyZB+GZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=avgFfuNT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3eG1so/x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=avgFfuNT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3eG1so/x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="avgFfuNT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3eG1so/x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="avgFfuNT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3eG1so/x"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1FABF1FD65;
	Wed,  2 Oct 2024 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727884743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yz9WH+oIE3j29fUejfNnX099Z29eyasIpwlfuUtOQ+0=;
	b=avgFfuNTYEJAl0Exz/9rgYy4m00KhoMeYCecXS38+ZcigsoePacVxFgoGxHU9ad8UuHOnA
	YRmgrR3/4b/9VwdESlqW4NttE07XtIHSm3lhDiDnWPDtVCjFcrMa59L5p9NR5xLCFp+Blb
	KtnhQyN58Zl8Fj2wAYSTBf5/utG9NSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727884743;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yz9WH+oIE3j29fUejfNnX099Z29eyasIpwlfuUtOQ+0=;
	b=3eG1so/xJwBIbyAhQuUZ6xPja4tJ/Jxp173uji9GV6486mi4PrRCbV8czL47ChmVK/cOGL
	Xu5oYKta0yvkjCBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727884743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yz9WH+oIE3j29fUejfNnX099Z29eyasIpwlfuUtOQ+0=;
	b=avgFfuNTYEJAl0Exz/9rgYy4m00KhoMeYCecXS38+ZcigsoePacVxFgoGxHU9ad8UuHOnA
	YRmgrR3/4b/9VwdESlqW4NttE07XtIHSm3lhDiDnWPDtVCjFcrMa59L5p9NR5xLCFp+Blb
	KtnhQyN58Zl8Fj2wAYSTBf5/utG9NSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727884743;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yz9WH+oIE3j29fUejfNnX099Z29eyasIpwlfuUtOQ+0=;
	b=3eG1so/xJwBIbyAhQuUZ6xPja4tJ/Jxp173uji9GV6486mi4PrRCbV8czL47ChmVK/cOGL
	Xu5oYKta0yvkjCBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0139E13974;
	Wed,  2 Oct 2024 15:59:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4XGwOsZt/WatTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Oct 2024 15:59:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Salvatore Bonaccorso <carnil@debian.org>
Subject: [PATCH] Revert "ALSA: hda: Conditionally use snooping for AMD HDMI"
Date: Wed,  2 Oct 2024 17:59:39 +0200
Message-ID: <20241002155948.4859-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This reverts commit 478689b5990deb626a0b3f1ebf165979914d6be4.

The fix seems leading to regressions for other systems.
Also, the way to check the presence of IOMMU via get_dma_ops() isn't
reliable and it's no longer applicable for 6.12.  After all, it's no
right fix, so let's revert it at first.

To be noted, the PCM buffer allocation has been changed to try the
continuous pages at first since 6.12, so the problem could be already
addressed without this hackish workaround.

Reported-by: Salvatore Bonaccorso <carnil@debian.org>
Closes: https://lore.kernel.org/ZvgCdYfKgwHpJXGE@eldamar.lan
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_controller.h |  2 +-
 sound/pci/hda/hda_intel.c      | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index 68c883f202ca..c2d0109866e6 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -28,7 +28,7 @@
 #else
 #define AZX_DCAPS_I915_COMPONENT 0		/* NOP */
 #endif
-#define AZX_DCAPS_AMD_ALLOC_FIX	(1 << 14)	/* AMD allocation workaround */
+/* 14 unused */
 #define AZX_DCAPS_CTX_WORKAROUND (1 << 15)	/* X-Fi workaround */
 #define AZX_DCAPS_POSFIX_LPIB	(1 << 16)	/* Use LPIB as default */
 #define AZX_DCAPS_AMD_WORKAROUND (1 << 17)	/* AMD-specific workaround */
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index edeaf3ee273c..bf9c9bfd38e3 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -40,7 +40,6 @@
 
 #ifdef CONFIG_X86
 /* for snoop control */
-#include <linux/dma-map-ops.h>
 #include <asm/set_memory.h>
 #include <asm/cpufeature.h>
 #endif
@@ -307,7 +306,7 @@ enum {
 
 /* quirks for ATI HDMI with snoop off */
 #define AZX_DCAPS_PRESET_ATI_HDMI_NS \
-	(AZX_DCAPS_PRESET_ATI_HDMI | AZX_DCAPS_AMD_ALLOC_FIX)
+	(AZX_DCAPS_PRESET_ATI_HDMI | AZX_DCAPS_SNOOP_OFF)
 
 /* quirks for AMD SB */
 #define AZX_DCAPS_PRESET_AMD_SB \
@@ -1707,13 +1706,6 @@ static void azx_check_snoop_available(struct azx *chip)
 	if (chip->driver_caps & AZX_DCAPS_SNOOP_OFF)
 		snoop = false;
 
-#ifdef CONFIG_X86
-	/* check the presence of DMA ops (i.e. IOMMU), disable snoop conditionally */
-	if ((chip->driver_caps & AZX_DCAPS_AMD_ALLOC_FIX) &&
-	    !get_dma_ops(chip->card->dev))
-		snoop = false;
-#endif
-
 	chip->snoop = snoop;
 	if (!snoop) {
 		dev_info(chip->card->dev, "Force to non-snoop mode\n");
-- 
2.43.0

