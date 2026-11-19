Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091049;
	b=2sAecUOK2gdKpwGr/jVvgHdMUbxJz+wXYMUAiyIPP/W4j6XXmL1L6BuFEfn9774tBTOg
	 iVpyGO7xu5QzcRaVd3lcf6HlbvuLX/akAp8+rqkD7Q4DG4+28WFsoKUHv8/ruKK0JwqB1
	 W8MdheQys5PGQTyk01zUxJB0eJNjdibl0ygkSlnETskfYvZhznXox15stLVZzmKYENTWE
	 dzYHvTafBF+7EXUAUeGGytJIJTDJfZJuRD53RFHbndm85t7fK17FdSkMBQEcvx/GLWeU2
	 KUKcEE5Edp2AkT9Qj/ETIQ9mtr3ODJMBUuST2krwaRpJ8twjwayg0Mjs1JdldNYg7eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091049;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=GbN1bJPpWXkaUmgiVE2HEUwTlsDogUXengM/21I9DwA=;
	b=vEOtRYqI7s9Xogy6myOj3KmQvkdYZv+zxzQbvY5Xq4l6zhoCsdILcXzPNVlyV0rRwRhG
	 4a1rBgcAIutIUt4J8icl3bergnMHiegt9aJbBx5VOMXa7FPtiKwTV27TQgRJ5Fhkx2cYM
	 ImL1AN4/U5IrygtDtcM+7GXJ1HNkda+J56Hqto542FPMWoEvVEGo0T3KFpH0f4/mEqYFG
	 9gsp/3rfpBIMpVWfiyeK9w6Sagq1kgw3+RrF5eMwQv3vJ4ECiofTKQI7/8y4PQqsDWNzv
	 N3DPPn14zMQApx52gliOI8InNr9X/hn4UP15YdjKFrYJsp36NZp3qtqrGarhAXUKU9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1U7qxnpi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sNnJTxtH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1U7qxnpi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sNnJTxtH;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C701606A326
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 12:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C701606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1U7qxnpi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sNnJTxtH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1U7qxnpi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sNnJTxtH
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1084C21D7F;
	Thu, 19 Nov 2026 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbN1bJPpWXkaUmgiVE2HEUwTlsDogUXengM/21I9DwA=;
	b=1U7qxnpidvNF+dg6YRifrZcXsf5kcX1Sa6/0KqMaz+TJqVA2GB3uhTywhmm5JfNq7Rbq8v
	2YNM+sV84sEnJ4jdqkxOF94S005dVqk7xi25JgGCXkQTj0Y9Wf5WHF28cPmkqb40eFDtan
	YbaYAVIRt58zFDVgzIAHtZZs9oTSIPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbN1bJPpWXkaUmgiVE2HEUwTlsDogUXengM/21I9DwA=;
	b=sNnJTxtHeFtqgLuu2wfQKLGiNTTbKDqkgjahorcs9mr+WnLqbsAJLgqM3SfoTeDX9pfzST
	wWOG/p5RZIcB9ZDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1U7qxnpi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sNnJTxtH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbN1bJPpWXkaUmgiVE2HEUwTlsDogUXengM/21I9DwA=;
	b=1U7qxnpidvNF+dg6YRifrZcXsf5kcX1Sa6/0KqMaz+TJqVA2GB3uhTywhmm5JfNq7Rbq8v
	2YNM+sV84sEnJ4jdqkxOF94S005dVqk7xi25JgGCXkQTj0Y9Wf5WHF28cPmkqb40eFDtan
	YbaYAVIRt58zFDVgzIAHtZZs9oTSIPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbN1bJPpWXkaUmgiVE2HEUwTlsDogUXengM/21I9DwA=;
	b=sNnJTxtHeFtqgLuu2wfQKLGiNTTbKDqkgjahorcs9mr+WnLqbsAJLgqM3SfoTeDX9pfzST
	wWOG/p5RZIcB9ZDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67BD513510;
	Thu, 19 Nov 2026 12:24:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ENprLGXq/mqWBwAAD6G6ig:T4
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 12:24:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 3/3] ALSA: pcm: Avoid hw_params/hw_refine changes during PCM buffer access
Date: Thu, 19 Nov 2026 13:23:54 +0100
Message-ID: <20261119122356.2134523-4-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119122356.2134523-1-tiwai@suse.de>
References: <20261119122356.2134523-1-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1084C21D7F
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.01

While we've already protected the concurrent hw_params or hw_free
changes during the PCM streaming in snd_pcm_lib_read*() and
snd_pcm_lib_write*(), those entry points aren't covered by the buffer
access gate yet, hence the associated PCM runtime instance may still
change concurrently.  This can lead to the inconsistency, e.g. in
snd_pcm_xfern_frames_ioctl() or other places that refers to the
runtime attribute like runtime->channel; since the concurrent
hw_params may change the runtime->channel afterwards, this can result
in OOB access for the array allocated for a different size with the
former runtime->channels.

For avoiding such races, let's take the buffer access gate at those
ioctls and read/write ops from the beginning.

Reported-by: on Sim <tlatkdgus1@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: cover buffer-lock more widely for state change races

 sound/core/pcm_compat.c |  3 +++
 sound/core/pcm_native.c | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index c54cb07304ad..c5931fdfe1f5 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -338,6 +338,9 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 		return -ENOTTY;
 	if (substream->stream != dir)
 		return -EINVAL;
+	SND_PCM_BUFFER_ACQUIRE(substream->runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 7d5e662b219b..d028f03369e7 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3434,6 +3434,9 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 	void *bufs __free(kfree) = NULL;
 	snd_pcm_sframes_t result;
 
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	if (runtime->channels > 128)
@@ -3673,6 +3676,9 @@ static ssize_t snd_pcm_read(struct file *file, char __user *buf, size_t count,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
 	if (!frame_aligned(runtime, count))
@@ -3697,6 +3703,9 @@ static ssize_t snd_pcm_write(struct file *file, const char __user *buf,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
 	if (!frame_aligned(runtime, count))
@@ -3723,6 +3732,9 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
 	if (!user_backed_iter(to))
@@ -3762,6 +3774,9 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
 	if (!user_backed_iter(from))
-- 
2.53.0

