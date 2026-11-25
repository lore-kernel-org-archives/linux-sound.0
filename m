Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589440;
	b=neQ8pjEuCeCf/6YFjt27AE+BH7+wFMGXivHwbyVF109xKvnNAxmqR92e3hKKtVdfUQIl
	 oDWBKviSmL6/FTBn3LIWXMJmgW+Y2awP36EbkjtpofaaC008CNZVT4DRvJAUr8N0ufQCU
	 aVC2rCI67pfMGJGEJ+ZaVXgHgdH/lVa/vNko4Bp2Sx3I886r9U227fo1R6hCueg6DtY/L
	 6bYCKheNLvi15/cw4GIOoBVIw4QRhSGoSS6oBDUqNWbiOrfyWL7otcR1Fnx5BC7/Zj0If
	 q6IkOni3s27otWQ995yvf4U5+A+XLdb2pPTWCHX22nZM/ujgQW1I0QU4J38Y8PaOmlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589440;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=dckA/GIzuTawkPjZQNHf5tzrexFgB4Tt7W3vxrn9E0Q=;
	b=Vl/876xepDsJVlnapnfa7NOC+uzSRa/l7mdNJu92YFJVfnik5GuhEK1N7o2ErKTtulvC
	 k7zYzbhPqrcfGdZ+1FAApUeuGT39HxH7j/YihSJUI7vxeVzoOOaPwTQ/zu4R2DPPUAFPL
	 BP300rNVUY4ux4yBH1tDRSb6L3IsR2QX5qBde/aovECZG9h0Xn6PwlI3OMGzNKseGvn4X
	 7Dq/kGGkMmkgljkQG+/TJy6z/EROYzSR7nLQGY0RmH5WWMob5tAcbqaskInqU1yQIl2Tf
	 PiyzFgqTs812gdKC81nXzmL9MCQljM2U9venj1Rw/IADqyBVg41unNqjO+MdvvneZGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A6XsMkXz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=k5u9ykWt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pE1GwkOp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KeZzLupG;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AAC606A339
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 06:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AAC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=A6XsMkXz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=k5u9ykWt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pE1GwkOp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KeZzLupG
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F34222305;
	Wed, 25 Nov 2026 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795589438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dckA/GIzuTawkPjZQNHf5tzrexFgB4Tt7W3vxrn9E0Q=;
	b=A6XsMkXznqXJGYk3hoOM0kgCv4o2xCHnGdODv7PLbIptpQcd0pCZXzptDt07ykul0lgb7s
	MFpDBufr5ss7jfz8duNIc1tfUlOlCWqlv/QxQH+hknzAy2ulUa98FtR36cVoJz7hOkx5Ll
	wA7pQ4oMpm/VlY4RkkJaQLvSCh9gz3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795589438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dckA/GIzuTawkPjZQNHf5tzrexFgB4Tt7W3vxrn9E0Q=;
	b=k5u9ykWtcheTIuH2UxKb55aRmgDhHJ+kA9HGsZhzQa9rWv34z82+REpsRs22UWjKONHLxJ
	qgnaXpCICWEbnOCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795589437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dckA/GIzuTawkPjZQNHf5tzrexFgB4Tt7W3vxrn9E0Q=;
	b=pE1GwkOpWuPJYhizvkYau4dqAd62eRIziEgKmx85Nww0+lPefHMwtXfbiHSauRc7+hqw7A
	4cegIMz+wKJwMH6bT/rrhcLS+IXhZgga9gkuCur4sokJwUAqFsVzPXMIcEDhFpYuInMlhO
	hOsmcC7N4Ptg5HKPyMjROeOApjHPzOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795589437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dckA/GIzuTawkPjZQNHf5tzrexFgB4Tt7W3vxrn9E0Q=;
	b=KeZzLupG6PCEqrqdMmksdGE083fsyCAPPjYxjq5wzQe0W7kPrPektfY5Dm4QBMcCXAtvRl
	D2uBa+KyUwOd0lCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1FE0134E8;
	Wed, 25 Nov 2026 06:50:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c5yuGjyFBmvpBQAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 06:50:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: pcm: Cover buffer access gate in all read/write ioctls
Date: Wed, 25 Nov 2026 07:50:31 +0100
Message-ID: <20261125065034.1470697-2-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125065034.1470697-1-tiwai@suse.de>
References: <20261125065034.1470697-1-tiwai@suse.de>
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
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

We haven't applied the buffer access gate in interleaved read/write
because it doesn't involve with the runtime attribute access before
the actual snd_pcm_lib_read/write calls.  However, there can be a
slight race during those ioctls between the PCM state check and
read/write calls, which may trigger a kernel WARNING() for the NULL
runtime->dma_area check in pcm_sanity_check().

For addressing it, in this patch, all read/write ioctls are assured to
take the buffer access get via SND_PCM_BUFFER_ACQUIRE() call for
avoiding the unexpected PCM state change during the whole operation.

Meanwhile, this change makes the snd_pcm_buffer_access_get() and
_put() calls in __snd_pcm_lib_xfer() (which is the main body of
pcm_lib_read() and pcm_lib_write()) superfluous, so those are dropped,
too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_compat.c | 3 +++
 sound/core/pcm_lib.c    | 6 ------
 sound/core/pcm_native.c | 3 +++
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index c5931fdfe1f5..924fd269dace 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -293,6 +293,9 @@ static int snd_pcm_ioctl_xferi_compat(struct snd_pcm_substream *substream,
 		return -ENOTTY;
 	if (substream->stream != dir)
 		return -EINVAL;
+	SND_PCM_BUFFER_ACQUIRE(substream->runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 3b66677c037a..50bd5f32d2f8 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2377,9 +2377,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 			err = -EINVAL;
 			goto _end_unlock;
 		}
-		err = snd_pcm_buffer_access_get(runtime);
-		if (err < 0)
-			goto _end_unlock;
 		snd_pcm_stream_unlock_irq(substream);
 		if (!is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
@@ -2388,9 +2385,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		if (is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 		snd_pcm_stream_lock_irq(substream);
-		snd_pcm_buffer_access_put(runtime);
-		if (err < 0)
-			goto _end_unlock;
 		err = pcm_accessible_state(substream);
 		if (err < 0)
 			goto _end_unlock;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 897975e43a9b..9e4a82d4ee82 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3418,6 +3418,9 @@ static int snd_pcm_xferi_frames_ioctl(struct snd_pcm_substream *substream,
 	struct snd_xferi xferi;
 	snd_pcm_sframes_t result;
 
+	SND_PCM_BUFFER_ACQUIRE(substream->runtime, lock);
+	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
+		return -EBUSY;
 	if (snd_pcm_get_state(substream) == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	if (put_user(0, &_xferi->result))
-- 
2.53.0

