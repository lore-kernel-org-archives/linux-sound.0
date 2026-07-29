Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E5B3A5443
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314287; cv=none; b=EeQxQZkHV2/Rzj1Ttt8F3rlNzTGLLE1ETCg3dgB5Sh4faKtgwfCtHQvqaPauyXsHj5E9BeWluYN2pYTQWhy9b/F/B+Pdv9ifMClxfkYOwBvUleIuwyJWZFbSMUtIWuZFTIZKXth6L65s3lfxDd00HWxw646899sjORUp3ioTMqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314287; c=relaxed/simple;
	bh=JGG3rhnK4pbspnWdAU6zxfEAEERCkjvU+TeG/kpT4pA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hb999GCsCSIDvVOS9qfGeiNIUIUDhz5OH16pK6mYcx4fwsurWjag8DGKH6USewY9dSi9NeObA5pfVwC8yUYP+Zbwsb17PgN284UwwEqEnR89hdsqLPnpxt82tDju/NO0ge6Uu63g2K9JLnUmyM2LNUCzcV84bGytOoeyfTI9qQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ljkStX8W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7OEbzF8I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gFLcNrma; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2goUO8VH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ljkStX8W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7OEbzF8I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gFLcNrma";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2goUO8VH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B48FC3E0C;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQe2KDyEuBBl1AuxF0AXxmkC3AQrq668ZTVrNo0yjtY=;
	b=ljkStX8WZCDXO4XLt/DyD1jTXNoWnG3jB6U5wRd5tpzrVi7DquWHX3dRTwdHyDCgORle5Z
	oA7ZE3p7KTTtmuL8xbOGrAn76JAVQSpNb+J8ubKc66C5NPrcPr9Sjj+/EsUKd4He3kGO9+
	84XZ4B1vHBifpYrquTSjOH5avBvIbEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQe2KDyEuBBl1AuxF0AXxmkC3AQrq668ZTVrNo0yjtY=;
	b=7OEbzF8Id/68Sx8CM4S2nuRjy1RKdDmgnL36s3m5IczIxhVuqgG9R3rPGQDnoyHPB5x3Yf
	j25k9NAWfPtniSCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQe2KDyEuBBl1AuxF0AXxmkC3AQrq668ZTVrNo0yjtY=;
	b=gFLcNrmaw/yW5b+rR9tEGjDIvTIrEnY+b/ARkLTu7kCTylAUpQZuQASoBrLySDJkXX49wL
	MXTUzNbRx1DhANLwAaN+bq1hFXjmXyoR/VS8BmqAcVc4ggK7soc2MULQ5/GmbMLWn5hrv8
	O1YF8Nw5Cl+6ITZfDmKrL1TMdkqJR/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQe2KDyEuBBl1AuxF0AXxmkC3AQrq668ZTVrNo0yjtY=;
	b=2goUO8VHgOxtkfExl0F3Coms450ef8sTIZ1Z5smBbGxJvFitL/NmtK7uJB46mA6NjPALzZ
	BMS480038t5TGuDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96052779B3;
	Wed, 29 Jul 2026 08:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uMhHI9e7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 02/14] ALSA: hda: ca0132: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:20 +0200
Message-ID: <20260729083735.120219-3-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0132.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index 3fe11983d6ca..61c9fb42b1de 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -8530,10 +8530,9 @@ static void ca0132_set_dsp_msr(struct hda_codec *codec, bool is96k)
 
 static bool ca0132_download_dsp_images(struct hda_codec *codec)
 {
-	bool dsp_loaded = false;
 	struct ca0132_spec *spec = codec->spec;
 	const struct dsp_image_seg *dsp_os_image;
-	const struct firmware *fw_entry = NULL;
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	/*
 	 * Alternate firmwares for different variants. The Recon3Di apparently
 	 * can use the default firmware, but I'll leave the option in case
@@ -8573,15 +8572,10 @@ static bool ca0132_download_dsp_images(struct hda_codec *codec)
 	dsp_os_image = (struct dsp_image_seg *)(fw_entry->data);
 	if (dspload_image(codec, dsp_os_image, 0, 0, true, 0)) {
 		codec_err(codec, "ca0132 DSP load image failed\n");
-		goto exit_download;
+		return false;
 	}
 
-	dsp_loaded = dspload_wait_loaded(codec);
-
-exit_download:
-	release_firmware(fw_entry);
-
-	return dsp_loaded;
+	return dspload_wait_loaded(codec);
 }
 
 static void ca0132_download_dsp(struct hda_codec *codec)
-- 
2.55.0

