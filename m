Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A768C1FAC45
	for <linux-sound@vger.kernel.org>; Sat, 15 Mar 2025 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742049026; cv=none; b=JNDZWeYpt+nkFyqq+8UFS5EiNEVtakkE7P0V2dQuXiQa1s+LIQXpGbfLm+9ZoTnMesscZBvyV1qMwZqdUF55/KN7O5fwIxERSCaHwpGy9hl5piHtoBohLGUX65Oxy35kXSWj+2HCqvpM6vqotfTb1rLFcvlDTm7pc206IaWT21s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742049026; c=relaxed/simple;
	bh=PlwqsvDUUyH0zQqmbF6A4CKYF4Jr4HjturQ/lf7I0PY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3WbJDuVwqBGsWwumiOqGyXbkvRKGyYH/mOq9/fnQ+6OCQHz4WbyWlNR9hDwPx/9ytjbsDiAZk8vQr33KZGafki2+jEMwQ1o6egSEZIQXtg6BB34yowEOKQTt8UI79tcGh8oIL9avbpmAD/LslxATDT4UayFXawLSlQ6A/PxCn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=InqcK8PT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DvB2kNjc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=InqcK8PT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DvB2kNjc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="InqcK8PT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DvB2kNjc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="InqcK8PT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DvB2kNjc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E0491F38D;
	Sat, 15 Mar 2025 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742049022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/4XVWo0wt3ptmVfYzYWiDbArBBiJfHDLCNPQU1ZCwyY=;
	b=InqcK8PTUzwQzvr1esxm/u/J9p8XY1HbD+wMkFTIstWLOlW7uC58DI6GrNv0O6XaTTGu6C
	21fhzR2yWdrofteZibBRxRL8PuMdMF6g0nwqwdtT5NPKpzEj8lbu+tj84KbnEXxW4CWA2R
	0jus9aQFUMZPH1dN2nrRQoLn8QMjnuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742049022;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/4XVWo0wt3ptmVfYzYWiDbArBBiJfHDLCNPQU1ZCwyY=;
	b=DvB2kNjcMeZagqz4mZTd9nfh4oepjokxRl03qwR4WzhN8Igis+SEoPi/eP+IV8YHd9xDOL
	lV4Kyn0NzxWQ/IAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742049022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/4XVWo0wt3ptmVfYzYWiDbArBBiJfHDLCNPQU1ZCwyY=;
	b=InqcK8PTUzwQzvr1esxm/u/J9p8XY1HbD+wMkFTIstWLOlW7uC58DI6GrNv0O6XaTTGu6C
	21fhzR2yWdrofteZibBRxRL8PuMdMF6g0nwqwdtT5NPKpzEj8lbu+tj84KbnEXxW4CWA2R
	0jus9aQFUMZPH1dN2nrRQoLn8QMjnuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742049022;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/4XVWo0wt3ptmVfYzYWiDbArBBiJfHDLCNPQU1ZCwyY=;
	b=DvB2kNjcMeZagqz4mZTd9nfh4oepjokxRl03qwR4WzhN8Igis+SEoPi/eP+IV8YHd9xDOL
	lV4Kyn0NzxWQ/IAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B95813797;
	Sat, 15 Mar 2025 14:30:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hb3eCP6O1WdKGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 15 Mar 2025 14:30:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Oleg Gorobets <oleg.goro@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Always honor no_shutup_pins
Date: Sat, 15 Mar 2025 15:30:19 +0100
Message-ID: <20250315143020.27184-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The workaround for Dell machines to skip the pin-shutup for mic pins
introduced alc_headset_mic_no_shutup() that is replaced from the
generic snd_hda_shutup_pins() for certain codecs.  The problem is that
the call is done unconditionally even if spec->no_shutup_pins is set.
This seems causing problems on other platforms like Lenovo.

This patch corrects the behavior and the driver honors always
spec->no_shutup_pins flag and skips alc_headset_mic_no_shutup() if
it's set.

Fixes: dad3197da7a3 ("ALSA: hda/realtek - Fixup headphone noise via runtime suspend")
Reported-and-tested-by: Oleg Gorobets <oleg.goro@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3afd86c293ef..db0398189dc6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -587,6 +587,9 @@ static void alc_shutup_pins(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
 
+	if (spec->no_shutup_pins)
+		return;
+
 	switch (codec->core.vendor_id) {
 	case 0x10ec0236:
 	case 0x10ec0256:
@@ -602,8 +605,7 @@ static void alc_shutup_pins(struct hda_codec *codec)
 		alc_headset_mic_no_shutup(codec);
 		break;
 	default:
-		if (!spec->no_shutup_pins)
-			snd_hda_shutup_pins(codec);
+		snd_hda_shutup_pins(codec);
 		break;
 	}
 }
-- 
2.43.0

