Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD2B189BA4
	for <linux-sound@vger.kernel.org>; Fri, 29 Nov 2024 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873558; cv=none; b=YmFLeHya+8PAesft8MBVPlQLsTo9OsUp9Y1ROspl3LMsEwQImGEeX9eOrp3ImJVNAUYr3lfTJWpIHO8X7a1w5eiQsuQa8IsoE5nVR/o100NxtGNCoVaSRdT4mnW+Jsej+jK1yOsC86lm7zsxr7xpcTpBJ9Za8vDJ5v9LYg30dN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873558; c=relaxed/simple;
	bh=3r80LAZzGH5Qs7WU3uelIKnsQ/nhyX95SQoQUQ4fpF0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m31UVurW+ZR2X8ehQ1HIkQq8SHllbC96C2EPq6HkLyT5B3H/rt89BpFhbnbyTs44gwTnb3wBU9ev+W9eQ1yvOtrMbZHZl7iPOzkMRX7wHRgr3mTyb7lxNW7yWReft2RUQJPU9oaaxomid1NgTdu+j5fAaqRCXblNwgCPpMj4Xu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fl1ZnAOC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G5vKc2v/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fl1ZnAOC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G5vKc2v/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fl1ZnAOC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G5vKc2v/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fl1ZnAOC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G5vKc2v/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C3691F391;
	Fri, 29 Nov 2024 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732873554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6m/F12N138IAXUiHLRaEmSud6jFiWso82Dw18wa8k4=;
	b=fl1ZnAOCxVLFa9WPsJUhE9O8oOqVtz55Qs/NLq8zDt12Fg2qIGoBFYmMT7Bc+xC6R46gIz
	G57GRPKfghgqentzFxOJNG+qS7pcByFUlBkTnjdmejkmDP61RPpNobEV+UB6aGctbvfaYi
	d7q7FztsHU/Uuzjyd0susZSQlxbYocA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732873554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6m/F12N138IAXUiHLRaEmSud6jFiWso82Dw18wa8k4=;
	b=G5vKc2v/rb5nGwMr2jDsJyHy6l75vqYzL/90xM0WF+DDlslF/rj6h+rlWjE1jk+zjEg1fn
	fPBTXf44y30RI8Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fl1ZnAOC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="G5vKc2v/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732873554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6m/F12N138IAXUiHLRaEmSud6jFiWso82Dw18wa8k4=;
	b=fl1ZnAOCxVLFa9WPsJUhE9O8oOqVtz55Qs/NLq8zDt12Fg2qIGoBFYmMT7Bc+xC6R46gIz
	G57GRPKfghgqentzFxOJNG+qS7pcByFUlBkTnjdmejkmDP61RPpNobEV+UB6aGctbvfaYi
	d7q7FztsHU/Uuzjyd0susZSQlxbYocA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732873554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6m/F12N138IAXUiHLRaEmSud6jFiWso82Dw18wa8k4=;
	b=G5vKc2v/rb5nGwMr2jDsJyHy6l75vqYzL/90xM0WF+DDlslF/rj6h+rlWjE1jk+zjEg1fn
	fPBTXf44y30RI8Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42E3413AA5;
	Fri, 29 Nov 2024 09:45:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ML0XD1KNSWd5VgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Nov 2024 09:45:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ALSA: ump: Indicate the inactive group in legacy substream names
Date: Fri, 29 Nov 2024 10:45:43 +0100
Message-ID: <20241129094546.32119-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241129094546.32119-1-tiwai@suse.de>
References: <20241129094546.32119-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5C3691F391
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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

Since the legacy rawmidi has no proper way to know the inactive group,
indicate it in the rawmidi substream names with "[Inactive]" suffix
when the corresponding UMP group is inactive.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 9f9ad106107f..7b00a957e548 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1256,8 +1256,9 @@ static void fill_substream_names(struct snd_ump_endpoint *ump,
 		name = ump->groups[idx].name;
 		if (!*name)
 			name = ump->info.name;
-		snprintf(s->name, sizeof(s->name), "Group %d (%.16s)",
-			 idx + 1, name);
+		snprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
+			 idx + 1, name,
+			 ump->groups[idx].active ? "" : " [Inactive]");
 	}
 }
 
-- 
2.43.0

