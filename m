Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010166;
	b=n53rvWLgB8oTxZ8qV7aDv4cqeaAjaCTEZxmq6ckjpuwQIyhxfRsEdPhDwmz3kg3aiihL
	 2rM+hhitbWz6P7jRjI0ggo9b2lOkqJG7S0K/XGKCtCMtgZWoU4uKM9J4O3a1XfW5o1RUW
	 OBJkcbUnA+o4IXNB2qNdmSXQtIcwFI4chxv1OU2eNA/nXhSrCOMsKjqBb9TO3XiSKtg3f
	 BfAeekU+XVX2F/UGmoLeqCqybkowCc2V8i15oZS4ET9X6EqH1beAwUgAOlC30CYuwJYyB
	 pcZKUGuAxtZvMbR29bbEmGJE8y+yzrReEuJJ4XNpA7sg04PsPR6pCcWPh+fMmK2FkFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010166;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=IWgJeDqCh/v1PDeIbPpPQd+IIM4jRjKyr+ke8+7fQ8A=;
	b=Q2XCpnTnei19h87Rhw/S0kKkgp2dHFk+enechNRUatJjIq1G6qDY5yXsB52zkQ6N6/b8
	 7+0hlrdwjG5hBoMknTvnp9n+RV/5Iit3kpsxamXfwOiHwIkjTCBAD83p7PVQOscjriFKF
	 40vIrfaY0eGdDeiiKS5lT3Hi5Y0EjTy0zngGAtb7o7Ss1b04VajemVLtUxd14YU/ibD/N
	 QgrzpYDPK9pDxT9yzJrc+3tA4Lsf9oJKUMG8ZXvJfzEDxjwgzj3EhmgbgFR+Nvpr74x9N
	 /5YYRvBu4Tj/eGVL0Qhj4Ki9sER33MBgRy42mVXcFuaTnxZaF0M/0vKf3q0ekJJdg+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C0vPiYw3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=owVmdivC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zq06kejo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IueC51VV;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1A9606A325
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 13:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F1A9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=C0vPiYw3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=owVmdivC;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zq06kejo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IueC51VV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 35F37220CE;
	Wed, 18 Nov 2026 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795010164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWgJeDqCh/v1PDeIbPpPQd+IIM4jRjKyr+ke8+7fQ8A=;
	b=C0vPiYw3iDmV+q05Fivk8Av3ZEQFCPhCNunl36FQNP9kWyPVMDylg3ZhUV08rSV3xD3yTp
	fI3PaMGWSmpC8451HUpobFAgk/uyLrAmSZQBXwuUn3LPFcCyaiy1pf3BuXyXxLh/+rqZGI
	VU2HmwCEc0+7nB7UpuUmfDXkUsWlzLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795010164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWgJeDqCh/v1PDeIbPpPQd+IIM4jRjKyr+ke8+7fQ8A=;
	b=owVmdivCRJ8j+8sWjf2nIJMwZ948SdUl5FNEFJcLm/TfqAKPN4hnb6XTcvgjKlUa01eBmF
	R5LMtb/AgHjygmDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zq06kejo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IueC51VV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795010162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWgJeDqCh/v1PDeIbPpPQd+IIM4jRjKyr+ke8+7fQ8A=;
	b=zq06kejoTkKJgnkewcxKtXnxfOq3zcjB0rvRV4i1rg3+Jjf0pk6kIeInxWjdaOGJvvXDE5
	7gGLQvb4c4ujYiUyIpvsuehHgzegKDFUFFcrnXYZ/xAZBVN1mN0J/UqB8CpOlpa/q1sbHQ
	KqGIIQe+0GGJMD7OSeB68QrsCWdOkOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795010162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IWgJeDqCh/v1PDeIbPpPQd+IIM4jRjKyr+ke8+7fQ8A=;
	b=IueC51VV5pIHlczPdVDnnfcJ5KJ4P6C2N2/brjCcgGA1Ii3VO+DxnFL12bouE6G8V3RUZZ
	axv+OYwOxWTVKMDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE995134F6;
	Wed, 18 Nov 2026 13:56:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y4KfIXGu/WooHAAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 13:56:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: pcm: Avoid hw_params/hw_refine changes during PCM buffer access
Date: Wed, 18 Nov 2026 14:55:56 +0100
Message-ID: <20261118135558.1928160-2-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118135558.1928160-1-tiwai@suse.de>
References: <20261118135558.1928160-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 35F37220CE
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
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
 sound/core/pcm_compat.c |  3 +++
 sound/core/pcm_native.c | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index c54cb07304ad..0321d4241ec5 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -341,6 +341,9 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
+	SND_PCM_BUFFER_ACQUIRE(substream->runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	ch = substream->runtime->channels;
 	if (ch > 128)
 		return -EINVAL;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f58d9be2ad44..6d29b2d10a5b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3424,6 +3424,9 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 
 	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (runtime->channels > 128)
 		return -EINVAL;
 	if (put_user(0, &_xfern->result))
@@ -3663,6 +3666,9 @@ static ssize_t snd_pcm_read(struct file *file, char __user *buf, size_t count,
 	runtime = substream->runtime;
 	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (!frame_aligned(runtime, count))
 		return -EINVAL;
 	count = bytes_to_frames(runtime, count);
@@ -3687,6 +3693,9 @@ static ssize_t snd_pcm_write(struct file *file, const char __user *buf,
 	runtime = substream->runtime;
 	if (snd_pcm_state_open_or_disconnected(substream))
 		return -EBADFD;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (!frame_aligned(runtime, count))
 		return -EINVAL;
 	count = bytes_to_frames(runtime, count);
@@ -3715,6 +3724,9 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 		return -EBADFD;
 	if (!user_backed_iter(to))
 		return -EINVAL;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (to->nr_segs > 1024 || to->nr_segs != runtime->channels)
 		return -EINVAL;
 	if (!frame_aligned(runtime, iov->iov_len))
@@ -3754,6 +3766,9 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 		return -EBADFD;
 	if (!user_backed_iter(from))
 		return -EINVAL;
+	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (from->nr_segs > 128 || from->nr_segs != runtime->channels ||
 	    !frame_aligned(runtime, iov->iov_len))
 		return -EINVAL;
-- 
2.53.0

