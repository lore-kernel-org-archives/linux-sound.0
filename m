Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA224734EF
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937987; cv=none; b=GZjYTJdKa2dPHFE3SpFqe8ReZYUXng26Y7IK+X29INxOaikdOWKPfFQfdID9L0ih2QaIixfP6o3B+B61A7O11Eaj4D35R+ZG0rl4EbVdpTnjO3xFyyoElgkhU3qVnM2QzGyI+ymCgOeqHwQXnDhOyMT1g1B71UahylEwmf5X3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937987; c=relaxed/simple;
	bh=SoAzrj5Mk3nQ6ihlnCUI6r1qS4X5LHLB3Bv+wh5n4Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Upum5z5NLTMRaWwbQi390b8c2xIvDAwgiLSoyl7mmyjmHFNpAvB58kGsCob8fYUDe9J7OaWU5bGqraImWKxEs308tZxR1iuTOt4zD/duKD1A1Wvi4Fr3WpmovIkCpsMkPsgfsXWeNcma+1fIpk1fUfw6d9xStfxdnJ68sZBB4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tyWiPYwi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W33EN9VH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=twuq2VgT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I9cQA0eq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tyWiPYwi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W33EN9VH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="twuq2VgT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I9cQA0eq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0D4437F03A;
	Wed,  5 Aug 2026 13:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE/TMiiNabV6W7mQZVmvW6RDffKMo1/Ce2q+C/exER8=;
	b=tyWiPYwiWs+/f6FRkyOS66Luc27GYDK8EKOuNjToKYInazGSSXUmVLGsMWa8CbZkp3l4at
	I8XjOjGUdxQYJ/oHEI2L+hI3t3A9jizBOJa6Lp0rpRyWBO4+E7FTeE6lYk8oDM/jbkwvGU
	/dHklPlpO9OYVUwmSneCkJM9QjcUjl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937980;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE/TMiiNabV6W7mQZVmvW6RDffKMo1/Ce2q+C/exER8=;
	b=W33EN9VH5TEZ0oOeC4xGBWIq9op91oFIjYRZxIkhNIhfnNGYEVwmg0Vl3fWEta8VrBpIJH
	bbHHqr2Ws33zjRCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=twuq2VgT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I9cQA0eq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE/TMiiNabV6W7mQZVmvW6RDffKMo1/Ce2q+C/exER8=;
	b=twuq2VgTRiNf+c15elLK6a62n2uJhlmxghwdhTu1obqgeEHy8nWVIAWTQNbOWz26O6SdOK
	vstc4vWele6pWbMRu2UDer7H8SYv4F+k9t+JdhoOUqNOQUMR6i1IkLeJjYJQXsbcabCqyJ
	67dleOfzJN1eYWujNP9TgvnKJZHcnmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE/TMiiNabV6W7mQZVmvW6RDffKMo1/Ce2q+C/exER8=;
	b=I9cQA0eqv+11iI69qBzV5I5Dojtma8Xtl2UQWptOOR3GfMbYdNVQiLTSKYHlwg5RrOjJW3
	YL/GUwTgez2AdiBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE614779ED;
	Wed,  5 Aug 2026 13:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eHAjNTdAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 04/31] ASoC: aw88261: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:05 +0200
Message-ID: <20260805135247.670693-5-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0D4437F03A
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/aw88261.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index acbd7de2e40e..b8d06534bc8f 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1149,7 +1149,7 @@ static int aw88261_dev_init(struct aw88261 *aw88261, struct aw_container *aw_cfg
 
 static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 {
-	const struct firmware *cont = NULL;
+	const struct firmware *cont __free(firmware) = NULL;
 	struct aw_container *aw_cfg;
 	const char *fw_name;
 	int ret;
@@ -1169,13 +1169,11 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 			fw_name, cont ? cont->size : 0);
 
 	aw_cfg = devm_kzalloc(aw88261->aw_pa->dev, struct_size(aw_cfg, data, cont->size), GFP_KERNEL);
-	if (!aw_cfg) {
-		release_firmware(cont);
+	if (!aw_cfg)
 		return -ENOMEM;
-	}
+
 	aw_cfg->len = (int)cont->size;
 	memcpy(aw_cfg->data, cont->data, cont->size);
-	release_firmware(cont);
 
 	aw88261->aw_cfg = aw_cfg;
 
-- 
2.55.0

