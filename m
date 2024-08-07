Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B61CCB31
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022550; cv=none; b=EFX2+Erep/zUhUdUW5bxrc2iX2WieF0RPg+9kwiKMIypjye90pXSTivkkStgrcOGBnm4fa+coG3InNCVqKW2JbMluUXMVwkrK89Qd0XvP07rQ3uXFBZwMhmh3/U4gpS67oPTkKg/5z1BrIRLzs8/FI/WLGJNER9x3fmZtSkzSrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022550; c=relaxed/simple;
	bh=0fu3+t3Z+UCemfS/Xtr64uEB7P2DiECVVgMwxKsExQI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/mg67uGff2uGXwKshxtK3o2o5VonkT/zZokkxAeMZ346wz1pSCN63AQIykBS45TkfmPKxqxM95vdmT0sCX/dKbf7Vjvqz/Y+wFddWNVm7eKfZW8mL37W9HPiYQYvMedOuEoP85zV6fkgYRmjDj50i17MXI5D+pSzlKWi/oqch0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o18B+/8I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uJ7JY+NK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o18B+/8I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uJ7JY+NK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o18B+/8I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uJ7JY+NK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o18B+/8I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uJ7JY+NK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F95F21B58;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5quRQrJxiY30vgNHEsz2BUGUv8iAAQQ2JQT5k9EtjaE=;
	b=o18B+/8If+lqiNskNEqmD9SusOplzE1Q8dbUu/Y6gurSOyg3P3U06rhUSlwxpUSk2d6iWX
	Et4zjOzaa6z2scNw6Pml/lTGuYCZjOr68GW73BeVWBjSwNlVC9gh+ymyeqNHRsBii0/jvF
	LVaQFccz19Nf8UgvjzBYDbjNMCuiTUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5quRQrJxiY30vgNHEsz2BUGUv8iAAQQ2JQT5k9EtjaE=;
	b=uJ7JY+NKBcIlzSk70C1FAlavUPWEYWNn2NMtXPiCI0NX+w+qk1IL7+9Kw06s1qasm3B50y
	uPrKdt+ItVYs8gCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="o18B+/8I";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uJ7JY+NK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5quRQrJxiY30vgNHEsz2BUGUv8iAAQQ2JQT5k9EtjaE=;
	b=o18B+/8If+lqiNskNEqmD9SusOplzE1Q8dbUu/Y6gurSOyg3P3U06rhUSlwxpUSk2d6iWX
	Et4zjOzaa6z2scNw6Pml/lTGuYCZjOr68GW73BeVWBjSwNlVC9gh+ymyeqNHRsBii0/jvF
	LVaQFccz19Nf8UgvjzBYDbjNMCuiTUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5quRQrJxiY30vgNHEsz2BUGUv8iAAQQ2JQT5k9EtjaE=;
	b=uJ7JY+NKBcIlzSk70C1FAlavUPWEYWNn2NMtXPiCI0NX+w+qk1IL7+9Kw06s1qasm3B50y
	uPrKdt+ItVYs8gCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77AA513297;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UCUZHNM8s2ZxCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 09:22:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 6/6] ALSA: seq: Fix missing seq port info bit return for MIDI 1.0 block
Date: Wed,  7 Aug 2024 11:23:01 +0200
Message-ID: <20240807092303.1935-7-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807092303.1935-1-tiwai@suse.de>
References: <20240807092303.1935-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 8F95F21B58
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

The recent extension added a new ALSA sequencer port info flag bit
SNDRV_SEQ_PORT_FLG_IS_MIDI1, but it's not reported back when
inquired.  Fix it to report properly.

Fixes: 0079c9d1e58a ("ALSA: ump: Handle MIDI 1.0 Function Block in MIDI 2.0 protocol")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ports.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 535290f24eed..cc2f8e846584 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -401,6 +401,9 @@ int snd_seq_get_port_info(struct snd_seq_client_port * port,
 		info->time_queue = port->time_queue;
 	}
 
+	if (port->is_midi1)
+		info->flags |= SNDRV_SEQ_PORT_FLG_IS_MIDI1;
+
 	/* UMP direction and group */
 	info->direction = port->direction;
 	info->ump_group = port->ump_group;
-- 
2.43.0

