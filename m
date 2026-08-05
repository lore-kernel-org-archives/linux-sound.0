Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAB2474268
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937995; cv=none; b=jEyfTeK+H9K0NZlUuzBBvnmfc8wPTLiOYiWqN4DllpcAx2et8o7GVPx5Kd/di/l9F7Rm46y+shW9p/VMGDgEV7wWIkg9x0pDp4KNqCZZms7lG14NnRgMON9lG7l42gckU4DNECt3Pu3jyBxlfpL/RoiQ6FlvFkJ2VSy0/JAPFpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937995; c=relaxed/simple;
	bh=8N7vHU8nVYJItJY/v4NNWV0ZtyVr25Dr9+axaEB2IlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhcFCdTZqmRqDtZaJHrHHls+YOAeyQDDp7EsjMZGqDT5XO5Lg7hpOVpS+vUC3GIuP7ngPrNTwN9au4nh+77uAQJBD2BSQTsNVA4Hd0c8JePLR4n7PacI1V3X81ihWkmYI3F1VYN5JhCFt3r26yA5f7+RrE76HMtvgeBnklj6+hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NBO6WK2v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U2FvbJLv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iTVdgEQ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kqU87n69; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NBO6WK2v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U2FvbJLv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iTVdgEQ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kqU87n69"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3FE9F3DFD;
	Wed,  5 Aug 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKmWSDfG788z6iGg+oSqoZ2PkWEip87wugT9IogFhrQ=;
	b=NBO6WK2v6zlW0da1gxE5F+OvvGOiwlXMkY6kpuiBI1H4HDJXauL/2+U9+rHfkBe9MBc7/x
	/oQ85eNjb9uo7JMBcJcGdiqwD/5fozpuSjCLO0t+JlpOgX+ZsRvi1QC072ur+WAZJXsZ71
	U6falGPa7aNRPUjdpc4cN4e+txVRP3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKmWSDfG788z6iGg+oSqoZ2PkWEip87wugT9IogFhrQ=;
	b=U2FvbJLvO74+GTtHgwj+BLUEMUigYGJMkHVj7FSpStCJ1TIclm/hDWMss4idmMuDhGEI1Q
	6qQat3lWysySO6CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iTVdgEQ+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kqU87n69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKmWSDfG788z6iGg+oSqoZ2PkWEip87wugT9IogFhrQ=;
	b=iTVdgEQ+YcCm/HVD54EsB3FEiE+5v814H7EZO9LqZIdNrjuo9g+sH8LdjSXQrJ+Nqu3GnE
	HGzhX/lPJRf+75C0u6p8VR6J/8UJT7Kde/s51XWyD4ClPsuyha0EObjoj7rprtpA3MfcwW
	+ec/9aLMOPViL3B03mThI/6p1hbfkMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rKmWSDfG788z6iGg+oSqoZ2PkWEip87wugT9IogFhrQ=;
	b=kqU87n69iaWlGBJBB4vMGgd849Yd5PgPzW5nWyTWwAOhwNyr0pi8n6upJTA+uCIsVpwdVF
	TLpC/Brciz6KhECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23DE0779F5;
	Wed,  5 Aug 2026 13:52:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yF6fBzlAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 12/31] ASoC: peb2466: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:13 +0200
Message-ID: <20260805135247.670693-13-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3FE9F3DFD
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/peb2466.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 5a1ed02abb84..f1ded68c2d75 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1538,17 +1538,14 @@ static int peb2466_fw_parse(struct snd_soc_component *component,
 
 static int peb2466_load_coeffs(struct snd_soc_component *component, const char *fw_name)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret;
 
 	ret = request_firmware(&fw, fw_name, component->dev);
 	if (ret)
 		return ret;
 
-	ret = peb2466_fw_parse(component, fw->data, fw->size);
-	release_firmware(fw);
-
-	return ret;
+	return peb2466_fw_parse(component, fw->data, fw->size);
 }
 
 static int peb2466_component_probe(struct snd_soc_component *component)
-- 
2.55.0

