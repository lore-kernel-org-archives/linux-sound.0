Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7C92D5C90
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142248; cv=none; b=flxuw4jocJAexdGAx9OB+zbSIcyDVE0o9kt5PbT5MmsAzctKUGyNPBGZx92/poqpzy62S9YMzI5eG6Mv7O2XnzmOglWLXKHc0s5LVjcLerPd7hhSPQUC5XZGizSMhT+3EAbNm8ADOfvFh0kJwcwnDlBm3Adavy4n6DAUGXMVUWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142248; c=relaxed/simple;
	bh=hGvVCcp//sdeRL7LVflYbml5hk86tWC56jV+9MwnESA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3wrD/ZnYLqW/fnhGkC1heRRbE9UleAgyeAji3O38JDiYaGJWhaVhQJH1GMOIYV9hUzMFsQY3f6SgamGKjqFqfVlAmgsaM38BzjQRHuDdkB8kkmVzz5bnVuyhXReNcXxapF2uJxMB2M33OqjCByUGSL8pfqrJAHXzkurRSSi67M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hzE3ov5W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AlhOkt5o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hzE3ov5W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AlhOkt5o; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hzE3ov5W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AlhOkt5o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hzE3ov5W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AlhOkt5o"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6F2771F769;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edUPF2LULvDod83hB6fibgk+7eDc7ss/FcTkMaGpBhk=;
	b=hzE3ov5WD5IPU0mSgxTFP3/uVDFWMmmzx4hj7yRH2sQRp0TQfjxEbz9h9oxmHr7GPI5Hep
	8jaSAItpIqOppi1ap48CN3HbSUQ6+DdHMjEiTcHvywZEzJ6+21NG6qIgwX78x2UEOvD6vB
	a9+FK6gW+A1l04Si1XaSGuq5rkNsgx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edUPF2LULvDod83hB6fibgk+7eDc7ss/FcTkMaGpBhk=;
	b=AlhOkt5oAUu6zEKIV3EZfqwcwZaLcg2IBnLW6KgEo1XmhhQoCvxfBH17IPr+UVQUTI2+3O
	yGqHHJelSIHwRRCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hzE3ov5W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AlhOkt5o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edUPF2LULvDod83hB6fibgk+7eDc7ss/FcTkMaGpBhk=;
	b=hzE3ov5WD5IPU0mSgxTFP3/uVDFWMmmzx4hj7yRH2sQRp0TQfjxEbz9h9oxmHr7GPI5Hep
	8jaSAItpIqOppi1ap48CN3HbSUQ6+DdHMjEiTcHvywZEzJ6+21NG6qIgwX78x2UEOvD6vB
	a9+FK6gW+A1l04Si1XaSGuq5rkNsgx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142067;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edUPF2LULvDod83hB6fibgk+7eDc7ss/FcTkMaGpBhk=;
	b=AlhOkt5oAUu6zEKIV3EZfqwcwZaLcg2IBnLW6KgEo1XmhhQoCvxfBH17IPr+UVQUTI2+3O
	yGqHHJelSIHwRRCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5595113A70;
	Thu, 10 Jul 2025 10:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qNyyE/OQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 079/103] ALSA: rme96: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:01 +0200
Message-ID: <20250710100727.22653-80-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6F2771F769
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme96.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 01029843d7f3..5cdbbe9cf994 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -1607,7 +1607,7 @@ snd_rme96_create(struct rme96 *rme96)
 
 	rme96->spdif_pcm->private_data = rme96;
 	rme96->spdif_pcm->private_free = snd_rme96_free_spdif_pcm;
-	strcpy(rme96->spdif_pcm->name, "Digi96 IEC958");
+	strscpy(rme96->spdif_pcm->name, "Digi96 IEC958");
 	snd_pcm_set_ops(rme96->spdif_pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_rme96_playback_spdif_ops);
 	snd_pcm_set_ops(rme96->spdif_pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_rme96_capture_spdif_ops);
 
@@ -1624,7 +1624,7 @@ snd_rme96_create(struct rme96 *rme96)
 			return err;
 		rme96->adat_pcm->private_data = rme96;
 		rme96->adat_pcm->private_free = snd_rme96_free_adat_pcm;
-		strcpy(rme96->adat_pcm->name, "Digi96 ADAT");
+		strscpy(rme96->adat_pcm->name, "Digi96 ADAT");
 		snd_pcm_set_ops(rme96->adat_pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_rme96_playback_adat_ops);
 		snd_pcm_set_ops(rme96->adat_pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_rme96_capture_adat_ops);
 		
@@ -2434,23 +2434,23 @@ __snd_rme96_probe(struct pci_dev *pci,
 			return -ENOMEM;
 	}
 
-	strcpy(card->driver, "Digi96");
+	strscpy(card->driver, "Digi96");
 	switch (rme96->pci->device) {
 	case PCI_DEVICE_ID_RME_DIGI96:
-		strcpy(card->shortname, "RME Digi96");
+		strscpy(card->shortname, "RME Digi96");
 		break;
 	case PCI_DEVICE_ID_RME_DIGI96_8:
-		strcpy(card->shortname, "RME Digi96/8");
+		strscpy(card->shortname, "RME Digi96/8");
 		break;
 	case PCI_DEVICE_ID_RME_DIGI96_8_PRO:
-		strcpy(card->shortname, "RME Digi96/8 PRO");
+		strscpy(card->shortname, "RME Digi96/8 PRO");
 		break;
 	case PCI_DEVICE_ID_RME_DIGI96_8_PAD_OR_PST:
 		pci_read_config_byte(rme96->pci, 8, &val);
 		if (val < 5) {
-			strcpy(card->shortname, "RME Digi96/8 PAD");
+			strscpy(card->shortname, "RME Digi96/8 PAD");
 		} else {
-			strcpy(card->shortname, "RME Digi96/8 PST");
+			strscpy(card->shortname, "RME Digi96/8 PST");
 		}
 		break;
 	}
-- 
2.50.0

