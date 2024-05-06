Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74E156226
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012033; cv=none; b=mVrmRor+5oV6p/iZIKhcDFD0s5QfV+Rsm8WQprd9CmRaHBhA1m9+ztv0S9ekAcofV6LLMWmMcE6dYdN6YXykutyjCp5zu5vC8nfEiwDU70wFzncYMAM6ubPfAFv1DQg5Fr3uOxcHNy53TokFWcLQRtW480ZCcmhUDFrPWugvcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012033; c=relaxed/simple;
	bh=z1sc06JGX2kEDKosWeRkn1GELltsYgXH1ZHkdIuQEGI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQbywKFz1wp9ghZNvLc4WYOWYfwnmz7ACLNb+LGjZ05CtgD6FyB8ilxz0gfeWQCR8+3ipfYODQW05ejx1Z7Sh2LKXPDtlAiuJdPYMFO1NOShdYNk9IrEKXiOAKR/IsGTEs5rWU2SsLytWSE84gMouMiRVQkAsGBn7NIl0WubPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rKnkqnYM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+HPfKfiX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rKnkqnYM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+HPfKfiX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rKnkqnYM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+HPfKfiX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rKnkqnYM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+HPfKfiX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F982385E2;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKj9obhT5XwUS1+mmibYsHdcnjG3RmCBQIaLB5nTkiY=;
	b=rKnkqnYMwUvBCNfHyI+KUD7yYW/l8VvoSYM6kbyKQFo0GL4I4yaDLUvE9N7HOyL3N4qloG
	d8e4G/m5nwnOb9y1g1ofNbaTb5vgUW0F/hTRmtu7iPLO/XqpuI3qwEueL9vcX4fpRNJWEs
	HVham+H+5yp1Oh0XcKYsZn+F23dmsvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKj9obhT5XwUS1+mmibYsHdcnjG3RmCBQIaLB5nTkiY=;
	b=+HPfKfiXf5LrtArsxVDBAYFV33etp+P73fRU5PoMcm1QqVYgwxNGT35zlGurX7zH928DuH
	jIVTichOIYDEFnDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKj9obhT5XwUS1+mmibYsHdcnjG3RmCBQIaLB5nTkiY=;
	b=rKnkqnYMwUvBCNfHyI+KUD7yYW/l8VvoSYM6kbyKQFo0GL4I4yaDLUvE9N7HOyL3N4qloG
	d8e4G/m5nwnOb9y1g1ofNbaTb5vgUW0F/hTRmtu7iPLO/XqpuI3qwEueL9vcX4fpRNJWEs
	HVham+H+5yp1Oh0XcKYsZn+F23dmsvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKj9obhT5XwUS1+mmibYsHdcnjG3RmCBQIaLB5nTkiY=;
	b=+HPfKfiXf5LrtArsxVDBAYFV33etp+P73fRU5PoMcm1QqVYgwxNGT35zlGurX7zH928DuH
	jIVTichOIYDEFnDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11D781386E;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +HH3Ar4BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/12] ALSA: hda: cirrus: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:49 +0200
Message-ID: <20240506161359.6960-7-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506161359.6960-1-tiwai@suse.de>
References: <20240506161359.6960-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.96 / 50.00];
	BAYES_HAM(-1.17)[88.87%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.981];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -0.96
X-Spam-Flag: NO

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio cirrus codec driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_cirrus.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 6807b4708a17..654724559355 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1128,7 +1128,6 @@ static int cs421x_parse_auto_config(struct hda_codec *codec)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 /*
  *	Manage PDREF, when transitioning to D3hot
  *	(DAC,ADC) -> D3, PDREF=1, AFG->D3
@@ -1153,7 +1152,6 @@ static int cs421x_suspend(struct hda_codec *codec)
 
 	return 0;
 }
-#endif
 
 static const struct hda_codec_ops cs421x_patch_ops = {
 	.build_controls = snd_hda_gen_build_controls,
@@ -1161,9 +1159,7 @@ static const struct hda_codec_ops cs421x_patch_ops = {
 	.init = cs421x_init,
 	.free = cs_free,
 	.unsol_event = snd_hda_jack_unsol_event,
-#ifdef CONFIG_PM
 	.suspend = cs421x_suspend,
-#endif
 };
 
 static int patch_cs4210(struct hda_codec *codec)
-- 
2.43.0

