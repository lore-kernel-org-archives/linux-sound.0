Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3431EE003
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265420; cv=none; b=op5uoI5wCMMdnSwg65vAMMaKvjJ0Kqmicn45qERDH6sa6JS/luYNWHgTJZjZgAl01JFhNSxMrrxgHEhVOY7SHHDfyo0qI7etJof+OkDU84RDuAxFIZknlgHEf/1aZ1/9vlZbljk51UDVXKbOF22Dp0aW90HnClGiFIjyN0v7Jqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265420; c=relaxed/simple;
	bh=giHfslGP76I4GmcF6KHVIn+2pGyJ1KuJ6YXMXYBQs/c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcBneuEbnIqI8XrlSa9+QdIVEAJ6JZyrlpuU17MKtXXk3mby0ac4Qv9bWhiHZHOsLt9VltYyFWOFB+qYBy8AO+cnuzAv+FjzsjbsiKgS7jYzFt2+BvOWRUQB6pGDX30c96ACH+LObtM7AHF/syrLSkfJs90wkb7xIL0Ep7wYy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tE7W9dLl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iuj6CpRK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tE7W9dLl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iuj6CpRK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tE7W9dLl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iuj6CpRK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tE7W9dLl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iuj6CpRK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 30B8B21157;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ki4Q+uYxqD9SXoVT7Q9rr9o3mo2nCySSxnVCqy54rvc=;
	b=tE7W9dLlQKqjyT7aX/KYQPbCQnDplDFYLcesAlsdCKY7+GGYjm3NHgAyNQqW9A0PeUVQh0
	UxPCPVM2qhMBjwmJtvy6vuN1jedTdY8rSeUh/KXUZpsoo6DiSJiXi+EwFSbkaKhP+/AU2O
	dHtULNPhg0z92BDnxqxyD/hQhzQCBak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ki4Q+uYxqD9SXoVT7Q9rr9o3mo2nCySSxnVCqy54rvc=;
	b=Iuj6CpRKcPhlWL/LIwpdc9E4EwopNBF+pJLXRl0dt2hnqNael8sLH8LuqElusuK4sKIGky
	nqA7qsO9vlbWbZCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ki4Q+uYxqD9SXoVT7Q9rr9o3mo2nCySSxnVCqy54rvc=;
	b=tE7W9dLlQKqjyT7aX/KYQPbCQnDplDFYLcesAlsdCKY7+GGYjm3NHgAyNQqW9A0PeUVQh0
	UxPCPVM2qhMBjwmJtvy6vuN1jedTdY8rSeUh/KXUZpsoo6DiSJiXi+EwFSbkaKhP+/AU2O
	dHtULNPhg0z92BDnxqxyD/hQhzQCBak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ki4Q+uYxqD9SXoVT7Q9rr9o3mo2nCySSxnVCqy54rvc=;
	b=Iuj6CpRKcPhlWL/LIwpdc9E4EwopNBF+pJLXRl0dt2hnqNael8sLH8LuqElusuK4sKIGky
	nqA7qsO9vlbWbZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1778113A9E;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +F6GBMdOfWfNUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 15:56:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/7] ALSA: hdspm: Simplify with str_on_off()
Date: Tue,  7 Jan 2025 16:56:33 +0100
Message-ID: <20250107155641.4435-4-tiwai@suse.de>
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
 sound/pci/rme9652/hdspm.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index d7290463d654..f89718b19d23 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -4927,14 +4927,14 @@ snd_hdspm_proc_read_madi(struct snd_info_entry *entry,
 		x, (unsigned long) hdspm->period_bytes);
 
 	snd_iprintf(buffer, "Line out: %s\n",
-		(hdspm->control_register & HDSPM_LineOut) ? "on " : "off");
+		    str_on_off(hdspm->control_register & HDSPM_LineOut));
 
 	snd_iprintf(buffer,
 		"ClearTrackMarker = %s, Transmit in %s Channel Mode, "
 		"Auto Input %s\n",
-		(hdspm->control_register & HDSPM_clr_tms) ? "on" : "off",
+		str_on_off(hdspm->control_register & HDSPM_clr_tms),
 		(hdspm->control_register & HDSPM_TX_64ch) ? "64" : "56",
-		(hdspm->control_register & HDSPM_AutoInp) ? "on" : "off");
+		str_on_off(hdspm->control_register & HDSPM_AutoInp));
 
 
 	if (!(hdspm->control_register & HDSPM_ClockModeMaster))
@@ -5088,12 +5088,9 @@ snd_hdspm_proc_read_aes32(struct snd_info_entry * entry,
 
 	snd_iprintf(buffer,
 		    "ClearTrackMarker %s, Emphasis %s, Dolby %s\n",
-		    (hdspm->
-		     control_register & HDSPM_clr_tms) ? "on" : "off",
-		    (hdspm->
-		     control_register & HDSPM_Emphasis) ? "on" : "off",
-		    (hdspm->
-		     control_register & HDSPM_Dolby) ? "on" : "off");
+		    str_on_off(hdspm->control_register & HDSPM_clr_tms),
+		    str_on_off(hdspm->control_register & HDSPM_Emphasis),
+		    str_on_off(hdspm->control_register & HDSPM_Dolby));
 
 
 	pref_syncref = hdspm_pref_sync_ref(hdspm);
-- 
2.43.0

