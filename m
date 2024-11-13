Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006BC230987
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482593; cv=none; b=DNLhI+avHDODS67AaTjsY6cetty9ekqRo7gFwFXC9WhAkxgkBeayk+dPsA71oMRh6cQZyesaaggpdhF8Oc3obfikY6BnTCxouyPXYVLOsezYLQnhw5ywcqEYzGtvBmdFb40uI3EOWYortcQwN4flo7xDPH2GaoyWNSsZkHu2gHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482593; c=relaxed/simple;
	bh=MP0zeJ9wG76ilEIwbe5QIhqJkTIzZJqN2qnxuqDEVY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ctJfdpcbHP0gaBrr282MZanDOC8+SQMk6iL/CtfLgI6Ws56Y0ImCZLN/lVBFycSGp/12HzrnNUkjrsnV8rizmCIwdg12hZl87VFHt4PmSX+7vDh2f8U/JDoEMyR2swBhmPojOoADTV9Z/w8/uk4KwUh4dxqRFOprLxQFMPtx+RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tskX2eKJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DCTc6Fpp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dv/LWS/z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9YtmG/Va; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tskX2eKJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DCTc6Fpp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dv/LWS/z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9YtmG/Va"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 352161F365;
	Wed, 13 Nov 2024 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731482590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9RvENJsgqAoBeqedA1dlkTvXRppidldJixwj7S0vobU=;
	b=tskX2eKJWOiLQalisfx1oEo7nxCK1HUGTnPJvWrgDqR5XwyM2aVZC4aKEZ+dT/2PjQVgOw
	45RFC3tBW17kLAw4kBGp63FH9o2GK4I4ww9fZOC4syjKYCl/Xs26YMpTkpGjZFimXN7WKo
	h349XpA0CCsPsko1LHMyZ/xBKAN52nE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731482590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9RvENJsgqAoBeqedA1dlkTvXRppidldJixwj7S0vobU=;
	b=DCTc6FppcFD4j1Pj6HOpdW6XgAmwTEKprun7stHwBMue6Bb9uZkX91waParORwu9ng1BKh
	jAttuevgmGJueUBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="dv/LWS/z";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="9YtmG/Va"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731482589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9RvENJsgqAoBeqedA1dlkTvXRppidldJixwj7S0vobU=;
	b=dv/LWS/zN8jkv6cGC5c6ku3dMFc7mAs160OwaetfNTg3vaYNY3d59KwOWZt2PrAWF/X8b/
	kQHm9cJC/UEoFwUITdgZHhcdWMa2YP174sFrM/kj3n7mofZ3RdkX4xnTHvRlnOKRSKvI1+
	3bs6rA1K/jULozJWncjmMXVZPTkMVVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731482589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9RvENJsgqAoBeqedA1dlkTvXRppidldJixwj7S0vobU=;
	b=9YtmG/VaOvNr47q3uHEwTW9lmXyIsxdfIZ/Rn7HgejBtn2J2BACszzyX99TEMvM69hcSRo
	NiJ8A61hSkrSRrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04E9113301;
	Wed, 13 Nov 2024 07:23:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /HIFAN1TNGepFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 07:23:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: compress_offload: Add missing descriptions in structs
Date: Wed, 13 Nov 2024 08:23:03 +0100
Message-ID: <20241113072304.4447-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 352161F365
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Add the missing descriptions for snd_compr_ops, snd_compr_task and
snd_compr_task_status fields, in order to shut up the build warnings.

Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/20241028193731.4b0c3788@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/compress_driver.h       | 4 ++++
 include/uapi/sound/compress_offload.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 5db4881b0681..b55c9eeb2b54 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -143,6 +143,10 @@ struct snd_compr_stream {
  * Not valid if copy is implemented
  * @get_caps: Retrieve DSP capabilities, mandatory
  * @get_codec_caps: Retrieve capabilities for a specific codec, mandatory
+ * @task_create: Create a set of input/output buffers for accel operations
+ * @task_start: Start (queue) a task for accel operations
+ * @task_stop: Stop (dequeue) a task for accel operations
+ * @task_free: Free a set of input/output buffers for accel operations
  */
 struct snd_compr_ops {
 	int (*open)(struct snd_compr_stream *stream);
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 98772b0cbcb7..d62eb93af0ed 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -139,6 +139,7 @@ struct snd_compr_metadata {
  * @output_fd: data output file descriptor (dma-buf)
  * @input_size: filled data in bytes (from caller, must not exceed fragment size)
  * @flags: see SND_COMPRESS_TFLG_* defines
+ * @reserved: reserved for future extension
  */
 struct snd_compr_task {
 	__u64 seqno;
@@ -169,6 +170,7 @@ enum snd_compr_state {
  * @output_size: filled data in bytes (from driver)
  * @output_flags: reserved for future (all zeros - from driver)
  * @state: actual task state (SND_COMPRESS_TASK_STATE_*)
+ * @reserved: reserved for future extension
  */
 struct snd_compr_task_status {
 	__u64 seqno;
-- 
2.43.0

