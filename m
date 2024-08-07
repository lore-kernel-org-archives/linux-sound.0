Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A63200128
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037667; cv=none; b=ici9i5MQlp6rd3QrCh8Jfqw6yY7S7snsA73DbDVIl6FUTrVZVKm8YNIlWUlcAenC8XOKuWun0nakavAp6+tWEZF6l3hpjqEDghIfcL/u9t7sIglw6m1KVC/VUVnmYaQft5qE6SS9vHGBwX2OwIXnPSMaufm1P+Qx3bu212hHJkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037667; c=relaxed/simple;
	bh=0CL7iwIpdf2SMHvrAa5BvRnplIC2PjJUDzt0A/VLIw0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaRFsKXbu9+EzfEVwagXD/buMAGw10e+sybSE7akq9WlpfRscDA2M3oEV1lqh1PVvGYPzzmjAkw3LUbTfKmv9Dfez+G05GCJqHSwqu2KHFDjPQY7kdIlqMni4qFGWOoobL6ISu6YAp6JV/eMncVB4EB/+y35ndx25VKFtL/RfM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A45UOhC0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KJ5lH25F; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A45UOhC0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KJ5lH25F; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A45UOhC0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KJ5lH25F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A45UOhC0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KJ5lH25F"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E772121D2C;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/9KLDdwn9mo40qXOP1icToRT/QYM5WlL8wahAn+T8Q=;
	b=A45UOhC0dAgF8jHHirbaNPl/Zsd1QZZuZE9+EH5W4Mc10S49JAwGMSY6N8XY8wKFTdRNjm
	chVNBilDXnE22SDTR2mlYvsp7XNV3ZGPTT8bKOI61VhQUx8/VSngtGdpbzNXicjKiRMW+C
	r3f6cu5P/yUl/1+pqw0jc2CdO7RuphM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/9KLDdwn9mo40qXOP1icToRT/QYM5WlL8wahAn+T8Q=;
	b=KJ5lH25F55sP4hFrBXaHC5kexpbtkMzuVfUrzsijEmEoSPwbMjAV7rC6FL0kbdhDmRJmVq
	tCmZvNKZRMVX+6DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=A45UOhC0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KJ5lH25F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/9KLDdwn9mo40qXOP1icToRT/QYM5WlL8wahAn+T8Q=;
	b=A45UOhC0dAgF8jHHirbaNPl/Zsd1QZZuZE9+EH5W4Mc10S49JAwGMSY6N8XY8wKFTdRNjm
	chVNBilDXnE22SDTR2mlYvsp7XNV3ZGPTT8bKOI61VhQUx8/VSngtGdpbzNXicjKiRMW+C
	r3f6cu5P/yUl/1+pqw0jc2CdO7RuphM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/9KLDdwn9mo40qXOP1icToRT/QYM5WlL8wahAn+T8Q=;
	b=KJ5lH25F55sP4hFrBXaHC5kexpbtkMzuVfUrzsijEmEoSPwbMjAV7rC6FL0kbdhDmRJmVq
	tCmZvNKZRMVX+6DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D036113A7D;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +P2WMd13s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 39/54] ALSA: lx6464es: Cleanup the print API usages
Date: Wed,  7 Aug 2024 15:34:29 +0200
Message-ID: <20240807133452.9424-40-tiwai@suse.de>
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
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E772121D2C
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Use pr_debug() instead of open-coded printk().
Also drop a few snd_printdd() calls that can be better done via
ftrace.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lx6464es/lx_core.c | 8 ++++----
 sound/pci/lx6464es/lx_core.h | 3 ---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index b5b0d43bb8dc..9d95ecb299ae 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -231,14 +231,14 @@ static void lx_message_dump(struct lx_rmh *rmh)
 	u8 idx = rmh->cmd_idx;
 	int i;
 
-	snd_printk(LXRMH "command %s\n", dsp_commands[idx].dcOpName);
+	pr_debug(LXRMH "command %s\n", dsp_commands[idx].dcOpName);
 
 	for (i = 0; i != rmh->cmd_len; ++i)
-		snd_printk(LXRMH "\tcmd[%d] %08x\n", i, rmh->cmd[i]);
+		pr_debug(LXRMH "\tcmd[%d] %08x\n", i, rmh->cmd[i]);
 
 	for (i = 0; i != rmh->stat_len; ++i)
-		snd_printk(LXRMH "\tstat[%d]: %08x\n", i, rmh->stat[i]);
-	snd_printk("\n");
+		pr_debug(LXRMH "\tstat[%d]: %08x\n", i, rmh->stat[i]);
+	pr_debug("\n");
 }
 #else
 static inline void lx_message_dump(struct lx_rmh *rmh)
diff --git a/sound/pci/lx6464es/lx_core.h b/sound/pci/lx6464es/lx_core.h
index 296013c910b7..c1113439f7c9 100644
--- a/sound/pci/lx6464es/lx_core.h
+++ b/sound/pci/lx6464es/lx_core.h
@@ -129,21 +129,18 @@ int lx_stream_set_state(struct lx6464es *chip, u32 pipe,
 static inline int lx_stream_start(struct lx6464es *chip, u32 pipe,
 				  int is_capture)
 {
-	snd_printdd("->lx_stream_start\n");
 	return lx_stream_set_state(chip, pipe, is_capture, SSTATE_RUN);
 }
 
 static inline int lx_stream_pause(struct lx6464es *chip, u32 pipe,
 				  int is_capture)
 {
-	snd_printdd("->lx_stream_pause\n");
 	return lx_stream_set_state(chip, pipe, is_capture, SSTATE_PAUSE);
 }
 
 static inline int lx_stream_stop(struct lx6464es *chip, u32 pipe,
 				 int is_capture)
 {
-	snd_printdd("->lx_stream_stop\n");
 	return lx_stream_set_state(chip, pipe, is_capture, SSTATE_STOP);
 }
 
-- 
2.43.0

