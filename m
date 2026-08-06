Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C43B27C1
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024839; cv=none; b=rdC081XweutnY60rL4yZnDgKpd0eIH3Am6afOuWzS2tGUHSgvFYCQE+LqlYGzhO2jO1Eg/Gxhg+vVMDMJmbSNMiJzPsdiD/4CxVORRcoE+F5woO687VEl6NDo1JdRpFB7g53Zq0rgg8KpKcBG9EpKJXMvJiwc0HYriG5J+j+XTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024839; c=relaxed/simple;
	bh=uGYjzmG+V8yA7s8dR8XxVfaYThmf/80RDDLfzRJKFeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUIr5p1w8NQDlPeT+2T39fQVXOiGCaveXMY0Sg0c0n60Qms4pqtRrLMovqO0ML8kwT4C+y5dgnqRph3KwbDx1OqrzsRKzBAk7FBVyxtCf20TLk++rKOz8L9LhLWUX6zwKetaAnceWG8+uJrSkjtLEhHKD0FuTsI3EjJBQY79+yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HfwrXetu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F2mVkNmD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ljlogezu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r+uV3k3G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HfwrXetu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F2mVkNmD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ljlogezu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r+uV3k3G"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0503A800D5;
	Thu,  6 Aug 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zgdxdx+aiOui4KOYlt/Fsb4xpkL9XOAL7nc/ysLhI6g=;
	b=HfwrXetuQAtRbeA2o3vtvhV7N7b/iZnUx56/sHE75GdJojmWp4dLIgDQlV90qTFus9Ugcv
	N+hF4zzibT6EoTPgqHtFcXHZNfKR4ELHLiZ/UPr4L3DumB57Rq15Hoqe8+IQalL0AuSntd
	9/+4kts0k+nYtZXycx/8RVYKJWl6CBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zgdxdx+aiOui4KOYlt/Fsb4xpkL9XOAL7nc/ysLhI6g=;
	b=F2mVkNmDxoMj/k94Vg7BfEuqlrioEq7W0HY2H7TYYxvNLNjPA9uBq4/0GmwtmPJYg0q1Cq
	900nmAkgJ8L/gHAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ljlogezu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=r+uV3k3G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zgdxdx+aiOui4KOYlt/Fsb4xpkL9XOAL7nc/ysLhI6g=;
	b=LjlogezuhdwbOp0nrAZfEFvilkuVWCleEpoTRHK9pxHVQUY/wZx/dNsvoBGBbSUcmAC9Uj
	vpSRtkXnqe4dfxZznR6GZnD28OmMGgKcFGjlYDTYyP8TQMJxBlLRByQbmyaRGIODNKT3Rk
	+OJUGiy3ZBRPzvHKfGPDGh6CgPiHaO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zgdxdx+aiOui4KOYlt/Fsb4xpkL9XOAL7nc/ysLhI6g=;
	b=r+uV3k3GFQQ4pXXNtOi6CES7m4S4mGakdXhhQAVRJ8DJpbphtrujQ5KjM1gwf78wJyQNLS
	lUZ7pwsvV31HzvCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFA8977A25;
	Thu,  6 Aug 2026 14:00:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IIchLW+TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 26/31] ASoC: Intel: avs: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:58 +0200
Message-ID: <20260806140006.1412298-27-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0503A800D5
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/avs/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 9033f683393c..673ac31f2fea 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -2222,7 +2222,7 @@ struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp)
 
 int avs_load_topology(struct snd_soc_component *comp, const char *filename)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret;
 
 	ret = request_firmware(&fw, filename, comp->dev);
@@ -2235,7 +2235,6 @@ int avs_load_topology(struct snd_soc_component *comp, const char *filename)
 	if (ret < 0)
 		dev_err(comp->dev, "load topology \"%s\" failed: %d\n", filename, ret);
 
-	release_firmware(fw);
 	return ret;
 }
 
-- 
2.55.0

