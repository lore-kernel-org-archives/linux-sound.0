Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5C73AFCEE
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314287; cv=none; b=UtCsgzx1WQSjfQpyeRr78iRWEVDMYEFoGmEcMWxYCm3sI/VpmCT+zPdiMU7FDSYoPcNYF2K9YJ1nrsRF6TuKp9Ng45d9OwWDatfkwrkHPMQ6eqZe1sC1Gy1lD4K6A+3SPL3d3k8bBR250HTL2HxVWfGm2ljk1IeB6SXNVTK//TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314287; c=relaxed/simple;
	bh=7CkJkzGsR0ORvvprLm15/qNo2tqIjZAOqnJP84xKtRQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7HExvlOptRY2OnPslcmZpgNob6RMtyRnOHUDzl95kj5rvTNyH3nR4uxIqU0r/SzINNnSWE52ENk/Sw/muHX4M5bWnEm2AUtUcGawHt5W88vtc4YoZMgQh4gkiQml3bV7AnWhp3iVknuKybtXM/P+WXVNY3gsfHAdJFl0KYrcYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R0B062i3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2PzT+oEu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hkS9u0A7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HUT373VV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R0B062i3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2PzT+oEu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hkS9u0A7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HUT373VV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E048C7C9AB;
	Wed, 29 Jul 2026 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=93WTzMu/17pn6PqP7ZQK3P7D9nYzltGlUnEkesH1t10=;
	b=R0B062i3I4DdgYB3ScDzj4sfC2mR+2v50oTsmF24EKOvybgJZ2vsN0OuXtaIIo71iWStuK
	NnOmHPDgUhXJ2IKpqEwiZaZY+chyWdrkTFR3N80HiAwaIs5PtBLatmQ2eMoMReSnaQoQ+1
	sqdEHPyWpBlY0ZMgcw6hhVt62xuw1sk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=93WTzMu/17pn6PqP7ZQK3P7D9nYzltGlUnEkesH1t10=;
	b=2PzT+oEuxLXVSS/A5EVRcEuGR8HicuiLjjG7XazoxuWxVgNl77b+kRN1N+PlLDHI9KyUGb
	VMTl8YcgwJ6AXpAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=93WTzMu/17pn6PqP7ZQK3P7D9nYzltGlUnEkesH1t10=;
	b=hkS9u0A7K/IhcdcUyKfFMKWwQupC2iiYqDZabSlqa7qFETPUkuqbcw1LtjfaUzOVRd70EP
	gMvDEKLyKJwGVrNRt9Sr3SgeXdhi+p5MFJAkgJxjJOp5mydsznndMrtLyJEHn93FI8ehKC
	CdvfZoQy7eY2nSD/8jk8XcCfVzb6foQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=93WTzMu/17pn6PqP7ZQK3P7D9nYzltGlUnEkesH1t10=;
	b=HUT373VVvDSMJKnK/q7OM5jeWlvfGrvtG1K4ACe7ZTkcAcgViq9vYVwX/F+Zhpk+Y0+sLc
	yBTATQRjJRAy/gCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BAE8779C1;
	Wed, 29 Jul 2026 08:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +Ar+HNi7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/14] ALSA: wavefront: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:26 +0200
Message-ID: <20260729083735.120219-9-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wavefront/wavefront_fx.c    | 23 +++++++----------------
 sound/isa/wavefront/wavefront_synth.c |  4 +---
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/sound/isa/wavefront/wavefront_fx.c b/sound/isa/wavefront/wavefront_fx.c
index beca35ce04f3..6d95ea338ea9 100644
--- a/sound/isa/wavefront/wavefront_fx.c
+++ b/sound/isa/wavefront/wavefront_fx.c
@@ -232,41 +232,32 @@ snd_wavefront_fx_start (snd_wavefront_t *dev)
 {
 	unsigned int i;
 	int err;
-	const struct firmware *firmware = NULL;
+	const struct firmware *firmware __free(firmware) = NULL;
 
 	if (dev->fx_initialized)
 		return 0;
 
 	err = request_firmware(&firmware, "yamaha/yss225_registers.bin",
 			       dev->card->dev);
-	if (err < 0) {
-		err = -1;
-		goto out;
-	}
+	if (err < 0)
+		return -1;
 
 	for (i = 0; i + 1 < firmware->size; i += 2) {
 		if (firmware->data[i] >= 8 && firmware->data[i] < 16) {
 			outb(firmware->data[i + 1],
 			     dev->base + firmware->data[i]);
 		} else if (firmware->data[i] == WAIT_IDLE) {
-			if (!wavefront_fx_idle(dev)) {
-				err = -1;
-				goto out;
-			}
+			if (!wavefront_fx_idle(dev))
+				return -1;
 		} else {
 			dev_err(dev->card->dev,
 				"invalid address in register data\n");
-			err = -1;
-			goto out;
+			return -1;
 		}
 	}
 
 	dev->fx_initialized = 1;
-	err = 0;
-
-out:
-	release_firmware(firmware);
-	return err;
+	return 0;
 }
 
 MODULE_FIRMWARE("yamaha/yss225_registers.bin");
diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
index 2f57a6795d22..0c8f5cf26455 100644
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -2053,7 +2053,7 @@ wavefront_download_firmware (snd_wavefront_t *dev, char *path)
 	const unsigned char *buf;
 	int len, err;
 	int section_cnt_downloaded = 0;
-	const struct firmware *firmware;
+	const struct firmware *firmware __free(firmware) = NULL;
 
 	err = request_firmware(&firmware, path, dev->card->dev);
 	if (err < 0) {
@@ -2108,11 +2108,9 @@ wavefront_download_firmware (snd_wavefront_t *dev, char *path)
 		section_cnt_downloaded++;
 	}
 
-	release_firmware(firmware);
 	return 0;
 
  failure:
-	release_firmware(firmware);
 	dev_err(dev->card->dev, "firmware download failed!!!\n");
 	return 1;
 }
-- 
2.55.0

