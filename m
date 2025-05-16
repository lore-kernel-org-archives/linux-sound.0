Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514B61F866B
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382905; cv=none; b=NR36NU7M/nUNXDdPI1TLvVVs+2SLKH8Hr0dXCguvf2cLTv18rd+ahguzSaCGXaxeY/aonIq9911Hep88DO8EGJTPHuPR3gRQYpcxuI1+4fk8bYFYdu8Zr5OXeTDwNFg4Ht6h+dEcTRh4rvwQvtxjBybjcexmNf1FPRCHfUfKdb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382905; c=relaxed/simple;
	bh=b6jvNHkR6RsTKzQNiFo6aMa8rQPPeFzymzpIDo69JmM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sJa82KrLHaHnIhPatLUh7N7fQpdp8BjOG+coFakb6UXSpLWXGldbYIiL3ma6w/tLOv50Vyoc/nN6ao1nITqRabnnB0a3aQ19CCPJJw/wJrPGgJmfj4X2IbkVs0yp5FmuukcTHK5OQ7FQAbbIjvE1KaKeL7bhM6VNTvWvaE/fbaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jq4YvctG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q7s/rEFk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jq4YvctG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q7s/rEFk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jq4YvctG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q7s/rEFk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jq4YvctG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q7s/rEFk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D2ED21755;
	Fri, 16 May 2025 08:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XkTF/acWmOTydSBKp/epXl8XdbvRo5rIMeow5tWaFVU=;
	b=jq4YvctGHIHk5GrV49OsEhtfz5e1nD0lIRS5YMQy6TLvLy6mNzkYVCjsnLzSbztFa92Zxc
	sresxnzdIfl/u2uLAAog5/fRaNl9K6v/ZEw0ByRpmpV4nuU4aaTIw0A9Qm30iNToMNsYFN
	n1iLK2yFkS0tjSaReLeP8AVqPqGNtK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XkTF/acWmOTydSBKp/epXl8XdbvRo5rIMeow5tWaFVU=;
	b=q7s/rEFkI2bXhNG2kTHpI09EZH6U4h7Dhgzz+eUZyoB92aRqenq4i50NXG3RRkOQE9ysxN
	IiHJQ5lBBfg1F1Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XkTF/acWmOTydSBKp/epXl8XdbvRo5rIMeow5tWaFVU=;
	b=jq4YvctGHIHk5GrV49OsEhtfz5e1nD0lIRS5YMQy6TLvLy6mNzkYVCjsnLzSbztFa92Zxc
	sresxnzdIfl/u2uLAAog5/fRaNl9K6v/ZEw0ByRpmpV4nuU4aaTIw0A9Qm30iNToMNsYFN
	n1iLK2yFkS0tjSaReLeP8AVqPqGNtK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XkTF/acWmOTydSBKp/epXl8XdbvRo5rIMeow5tWaFVU=;
	b=q7s/rEFkI2bXhNG2kTHpI09EZH6U4h7Dhgzz+eUZyoB92aRqenq4i50NXG3RRkOQE9ysxN
	IiHJQ5lBBfg1F1Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4190013977;
	Fri, 16 May 2025 08:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 59KVDnXyJmj+UQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 08:08:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Fix race of buffer access at PCM OSS layer
Date: Fri, 16 May 2025 10:08:16 +0200
Message-ID: <20250516080817.20068-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

The PCM OSS layer tries to clear the buffer with the silence data at
initialization (or reconfiguration) of a stream with the explicit call
of snd_pcm_format_set_silence() with runtime->dma_area.  But this may
lead to a UAF because the accessed runtime->dma_area might be freed
concurrently, as it's performed outside the PCM ops.

For avoiding it, move the code into the PCM core and perform it inside
the buffer access lock, so that it won't be changed during the
operation.

Reported-by: syzbot+32d4647f551007595173@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/68164d8e.050a0220.11da1b.0019.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h      |  2 ++
 sound/core/oss/pcm_oss.c |  3 +--
 sound/core/pcm_native.c  | 11 +++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8becb4504887..8582d22f3818 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1404,6 +1404,8 @@ int snd_pcm_lib_mmap_iomem(struct snd_pcm_substream *substream, struct vm_area_s
 #define snd_pcm_lib_mmap_iomem	NULL
 #endif
 
+void snd_pcm_runtime_buffer_set_silence(struct snd_pcm_runtime *runtime);
+
 /**
  * snd_pcm_limit_isa_dma_size - Get the max size fitting with ISA DMA transfer
  * @dma: DMA number
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 4683b9139c56..4ecb17bd5436 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1074,8 +1074,7 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 	runtime->oss.params = 0;
 	runtime->oss.prepare = 1;
 	runtime->oss.buffer_used = 0;
-	if (runtime->dma_area)
-		snd_pcm_format_set_silence(runtime->format, runtime->dma_area, bytes_to_samples(runtime, runtime->dma_bytes));
+	snd_pcm_runtime_buffer_set_silence(runtime);
 
 	runtime->oss.period_frames = snd_pcm_alsa_frames(substream, oss_period_size);
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6c2b6a62d9d2..853ac5bb33ff 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -723,6 +723,17 @@ static void snd_pcm_buffer_access_unlock(struct snd_pcm_runtime *runtime)
 	atomic_inc(&runtime->buffer_accessing);
 }
 
+/* fill the PCM buffer with the current silence format; called from pcm_oss.c */
+void snd_pcm_runtime_buffer_set_silence(struct snd_pcm_runtime *runtime)
+{
+	snd_pcm_buffer_access_lock(runtime);
+	if (runtime->dma_area)
+		snd_pcm_format_set_silence(runtime->format, runtime->dma_area,
+					   bytes_to_samples(runtime, runtime->dma_bytes));
+	snd_pcm_buffer_access_unlock(runtime);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_runtime_buffer_set_silence);
+
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 #define is_oss_stream(substream)	((substream)->oss.oss)
 #else
-- 
2.49.0

