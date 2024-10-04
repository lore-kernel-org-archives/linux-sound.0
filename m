Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD6213D2BB
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728030314; cv=none; b=pYSHt2/d8IZpSV0AeUb0XkcDsagfISaEyjrcgKkhcI1Dktvn8ZXaKb5pvPcG4lJ2BSL8nRbEiqHCvKtQkrQMUJBinhoM5JIWr9vjpyanA6W9yFw0Y2J1ByNrBoAkYM6PB4dLjW9SRFaOW79Sq0FBg0RSCMSXQRkJKD+pRCQPNEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728030314; c=relaxed/simple;
	bh=bSOnlgwYKDZf5tBLkmi+rBF9sSGuuZbSh4fal/BvaNQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=XkSDPtmgjtSVhj5FMwinbmOzf/jCnt05oiAThSaB5CKJXb+qElUwtM4R6IwzDV7HgwkTEqNORvqyMgM6RyX+y5EJIlknMmIfuVwbUyAn8EQLDMC3eahdGn/cLSg03NnjNOcqgzzH9uz5P5eo373r/qLlGwXBEixzowJZRzlFSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ob+P9io6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iUPW4hCF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ob+P9io6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iUPW4hCF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ob+P9io6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iUPW4hCF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ob+P9io6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iUPW4hCF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FC8021E55;
	Fri,  4 Oct 2024 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728030311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M8BtpWcG9dWDmiBP7wTT9pLyKe8HlFfys4d5+yTX2e0=;
	b=ob+P9io6uRVTj02gh/iuk+VFDoG1/OLuvqC3UVN7RDnv4g04N0oAVwBRhQmbQ9U9HKEAJS
	TXKD3qYAPgEe6KFaOBdwUasSbHz2hZeQxrCTAX/jtDHVHIi+5IvYikgL0dlwDpPDmW8Apm
	8jYDBOzlVfHnE0kgZbZcgkWUiqv7WEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728030311;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M8BtpWcG9dWDmiBP7wTT9pLyKe8HlFfys4d5+yTX2e0=;
	b=iUPW4hCFfYHejN6YkzpgByBSCVovFV9XU1s0LDKxEmiY74ued/f0vhHjBJZMcqTgqLb7AX
	IxjElMPQEzTZ2ICA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ob+P9io6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iUPW4hCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728030311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M8BtpWcG9dWDmiBP7wTT9pLyKe8HlFfys4d5+yTX2e0=;
	b=ob+P9io6uRVTj02gh/iuk+VFDoG1/OLuvqC3UVN7RDnv4g04N0oAVwBRhQmbQ9U9HKEAJS
	TXKD3qYAPgEe6KFaOBdwUasSbHz2hZeQxrCTAX/jtDHVHIi+5IvYikgL0dlwDpPDmW8Apm
	8jYDBOzlVfHnE0kgZbZcgkWUiqv7WEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728030311;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=M8BtpWcG9dWDmiBP7wTT9pLyKe8HlFfys4d5+yTX2e0=;
	b=iUPW4hCFfYHejN6YkzpgByBSCVovFV9XU1s0LDKxEmiY74ued/f0vhHjBJZMcqTgqLb7AX
	IxjElMPQEzTZ2ICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0632113A6E;
	Fri,  4 Oct 2024 08:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uXQkAGem/2ahdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Oct 2024 08:25:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/conexant: Fix conflicting quirk for System76 Pangolin
Date: Fri,  4 Oct 2024 10:25:58 +0200
Message-ID: <20241004082602.29016-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1FC8021E55
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

We received a regression report for System76 Pangolin (pang14) due to
the recent fix for Tuxedo Sirius devices to support the top speaker.
The reason was the conflicting PCI SSID, as often seen.

As a workaround, now the codec SSID is checked and the quirk is
applied conditionally only to Sirius devices.

Fixes: 4178d78cd7a8 ("ALSA: hda/conexant: Add pincfg quirk to enable top speakers on Sirius devices")
Reported-by: Christian Heusel <christian@heusel.eu>
Reported-by: Jerry <jerryluo225@gmail.com>
Closes: https://lore.kernel.org/c930b6a6-64e5-498f-b65a-1cd5e0a1d733@heusel.eu
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index ade42a8209c2..b61ce5e6f5ec 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -816,6 +816,23 @@ static const struct hda_pintbl cxt_pincfg_sws_js201d[] = {
 	{}
 };
 
+/* pincfg quirk for Tuxedo Sirius;
+ * unfortunately the (PCI) SSID conflicts with System76 Pangolin pang14,
+ * which has incompatible pin setup, so we check the codec SSID (luckily
+ * different one!) and conditionally apply the quirk here
+ */
+static void cxt_fixup_sirius_top_speaker(struct hda_codec *codec,
+					 const struct hda_fixup *fix,
+					 int action)
+{
+	/* ignore for incorrectly picked-up pang14 */
+	if (codec->core.subsystem_id == 0x278212b3)
+		return;
+	/* set up the top speaker pin */
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		snd_hda_codec_set_pincfg(codec, 0x1d, 0x82170111);
+}
+
 static const struct hda_fixup cxt_fixups[] = {
 	[CXT_PINCFG_LENOVO_X200] = {
 		.type = HDA_FIXUP_PINS,
@@ -976,11 +993,8 @@ static const struct hda_fixup cxt_fixups[] = {
 		.v.pins = cxt_pincfg_sws_js201d,
 	},
 	[CXT_PINCFG_TOP_SPEAKER] = {
-		.type = HDA_FIXUP_PINS,
-		.v.pins = (const struct hda_pintbl[]) {
-			{ 0x1d, 0x82170111 },
-			{ }
-		},
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cxt_fixup_sirius_top_speaker,
 	},
 };
 
-- 
2.43.0

