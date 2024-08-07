Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D00F20012C
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037667; cv=none; b=bnbWeW0D0ND9Ly0jQlkHYNKuG9OJU9zWTiotSVHhSSBsBJQRwaqGFHuN3iQX/KwWX8llhYUp8NIfDmdo4V4XxVwNDpAY4Zo+uqUJ68fcvnFqo+edrrnPnvDOP6oUFx/T6UmzGjaUHj7l7G1Ghov6fHHuGBoslpx+E+Rbj4gE39c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037667; c=relaxed/simple;
	bh=tyXqtzkiVuiBM6btl7Ovvt8WSUoReJ7hAjqqX2MUUnI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3T8nTuMl+z0nHrCnsz/frm+zaR8SaJxycOEAIIqBgvEPGCnSfQ0cnh9PUtK7VgUILhBjWQ4aDVTbpZ/33Zi4AmUnM2j11YHSf6o2pYx3hKxVY9g4uRvjEfcV+MmyWWbW9Zq3R5E/ouadn9kSYoty5TF/4oftpQ1+VZ6kMKEhKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AuthbxnV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3aRtV7vI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AuthbxnV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3aRtV7vI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AuthbxnV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3aRtV7vI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AuthbxnV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3aRtV7vI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 17D6B21D14;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=em/49ADRanWJyDJA7iL+7vDMQbUlBYa9fI4pjoLtSac=;
	b=AuthbxnVtXlSQmobOZQGSR8T2St09lTjhp5vFoAS/4/HYkuDBzOuZYNWo7FhTSM+IK3zLL
	FWZ+FfmPyVKlkCVl7S4aViyHRB548ciKz16+MXoy6VbQEIulxDLKgQ/EKeETzMg93/Zhrg
	SWanM67rG1PfUYpFQxjmrx6C5/G1lWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=em/49ADRanWJyDJA7iL+7vDMQbUlBYa9fI4pjoLtSac=;
	b=3aRtV7vIv565BoWzhXe112N5Qy7qiidUhmJzpIGJo+cu7cwGpQcxRNcp51Aqt/oVc7PvrG
	yYMJCOZlvKKec+DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AuthbxnV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3aRtV7vI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=em/49ADRanWJyDJA7iL+7vDMQbUlBYa9fI4pjoLtSac=;
	b=AuthbxnVtXlSQmobOZQGSR8T2St09lTjhp5vFoAS/4/HYkuDBzOuZYNWo7FhTSM+IK3zLL
	FWZ+FfmPyVKlkCVl7S4aViyHRB548ciKz16+MXoy6VbQEIulxDLKgQ/EKeETzMg93/Zhrg
	SWanM67rG1PfUYpFQxjmrx6C5/G1lWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=em/49ADRanWJyDJA7iL+7vDMQbUlBYa9fI4pjoLtSac=;
	b=3aRtV7vIv565BoWzhXe112N5Qy7qiidUhmJzpIGJo+cu7cwGpQcxRNcp51Aqt/oVc7PvrG
	yYMJCOZlvKKec+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB16613B05;
	Wed,  7 Aug 2024 13:34:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8FNRONx3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 32/54] ALSA: pcm: oss: Use pr_debug()
Date: Wed,  7 Aug 2024 15:34:22 +0200
Message-ID: <20240807133452.9424-33-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
X-Rspamd-Queue-Id: 17D6B21D14
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API instead of open-coded printk().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_plugin.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_plugin.h b/sound/core/oss/pcm_plugin.h
index 50a6b50f5db4..55035dbf23f0 100644
--- a/sound/core/oss/pcm_plugin.h
+++ b/sound/core/oss/pcm_plugin.h
@@ -160,7 +160,7 @@ snd_pcm_sframes_t snd_pcm_oss_readv3(struct snd_pcm_substream *substream,
 				     void **bufs, snd_pcm_uframes_t frames);
 
 #ifdef PLUGIN_DEBUG
-#define pdprintf(fmt, args...) printk(KERN_DEBUG "plugin: " fmt, ##args)
+#define pdprintf(fmt, args...) pr_debug("plugin: " fmt, ##args)
 #else
 #define pdprintf(fmt, args...)
 #endif
-- 
2.43.0

