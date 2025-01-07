Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65301EE00F
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265421; cv=none; b=H683/dyKLjYEqVWEl49YfbOttnfFJ/98sc5BVUdipdHMQOMXL/l6wJ4v+eq0G2XFegEXYEfr1rJx6278nCmfvQ0Ho13VhoYmvSVU00L9ve48ISPyPkbnov5qtegnmEM8CWcrrl6wgxpzFtQFBlMF/9U+m8FkyCcmGTufoyC73h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265421; c=relaxed/simple;
	bh=lpVLGA+7YBow246+K30GFg/wQxbW7bWLK0ulMFaigCY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYHUpeit1CfX1REVS0kW02q7jxIEuD+lgsH8qosoF+NcMSsD8vXtKIpqVTyia1OI+oL/PA6HxsT/H1qOOeI/6w5uP/bl+ViLtOr9FJA+oYDes/4f3axB27FpSTI+4eqoDF1WDh5xA8qM7sgVcOYEKwlJqujZ1NbHfjx5VWymN9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FvvcYADP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y0cQe4Zw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mLJyekPf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pCaMQW1O; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FvvcYADP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y0cQe4Zw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mLJyekPf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pCaMQW1O"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD7B12110A;
	Tue,  7 Jan 2025 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2BTJaxm5hvUc1ED98T9BhZWoL3l2QqIzW+eo9y4JwQ=;
	b=FvvcYADPKdPK/exQ1eDV65HqK3La3ini+QeBopK95BXqklMGzyLIbpZEXt0ET+U+s5VHmQ
	QyfNaV9p6uzitjqA1c6QtW2MxO5I9fs6s4nnnH2B114pYEKv8vn1VEQjALEl2r6QrA/28M
	kujZZ3XCgy7Y/Okr7AEiUYQxWIcAShU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2BTJaxm5hvUc1ED98T9BhZWoL3l2QqIzW+eo9y4JwQ=;
	b=Y0cQe4ZwU4ZqYnXX/oyqZ3I+e579ToxTXYcWsZi3Hvqc/W6oytwXltvjnVKiFwT3GiU7I4
	EbplYNe3s7zZ+NDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2BTJaxm5hvUc1ED98T9BhZWoL3l2QqIzW+eo9y4JwQ=;
	b=mLJyekPfokRgvGf526DXbDbU5QkQdBGefwvHTygJ5ByG+7zJmNqBj4ijP9l9PjSSKc9PI1
	3R0bh14MgOnNvgHbDEEGIt/Z242JvQHIp+5XxXDSJfkpLazWgniBcy/KiFgRKCmmYmdZ33
	UUhc4HkuoNmCXo3OPURlatYl2PR78gU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2BTJaxm5hvUc1ED98T9BhZWoL3l2QqIzW+eo9y4JwQ=;
	b=pCaMQW1Oos3rS9WlfS5Uzj3tIRkNCpQTbgX5c8NGaZhfe+niqC7YkPlWaXgmeWBWCDCaYh
	3lHpyRPXrWd+HSAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF45B13AA7;
	Tue,  7 Jan 2025 15:56:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KM92LcZOfWfNUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 15:56:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/7] ALSA: trident: Simplify with str_on_off()
Date: Tue,  7 Jan 2025 16:56:31 +0100
Message-ID: <20250107155641.4435-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107155641.4435-1-tiwai@suse.de>
References: <20250107155641.4435-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard helper str_on_off() to simplify the code.
Only code refactoring, no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/trident/trident_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index e98eea1e6d81..8039f445bee2 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -3278,9 +3278,9 @@ static void snd_trident_proc_read(struct snd_info_entry *entry,
 	snd_iprintf(buffer, "Spurious IRQs    : %d\n", trident->spurious_irq_count);
 	snd_iprintf(buffer, "Spurious IRQ dlta: %d\n", trident->spurious_irq_max_delta);
 	if (trident->device == TRIDENT_DEVICE_ID_NX || trident->device == TRIDENT_DEVICE_ID_SI7018)
-		snd_iprintf(buffer, "IEC958 Mixer Out : %s\n", trident->spdif_ctrl == 0x28 ? "on" : "off");
+		snd_iprintf(buffer, "IEC958 Mixer Out : %s\n", str_on_off(trident->spdif_ctrl == 0x28));
 	if (trident->device == TRIDENT_DEVICE_ID_NX) {
-		snd_iprintf(buffer, "Rear Speakers    : %s\n", trident->ac97_ctrl & 0x00000010 ? "on" : "off");
+		snd_iprintf(buffer, "Rear Speakers    : %s\n", str_on_off(trident->ac97_ctrl & 0x00000010));
 		if (trident->tlb.entries) {
 			snd_iprintf(buffer,"\nVirtual Memory\n");
 			snd_iprintf(buffer, "Memory Maximum : %d\n", trident->tlb.memhdr->size);
-- 
2.43.0

