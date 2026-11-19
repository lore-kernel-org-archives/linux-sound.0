Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091049;
	b=ecZvP6b7sFTWQZZR6c8AMFMH+VqQsbXfFMX39/N+PlQEuzsDYIidCkxlphFZWkpVdNgU
	 jF88M8RWeVoSxh7E7W7cZE8A5+qRtw6ZCQfZauh9Ia09aJIZy0LJmf8mx9T4hZtR7sigZ
	 64m3dfhEblgNio310mbzkAsvt3+TKrxSRooXDUxT891s2fDSFnVxT0uaj2i3/fbR3GBka
	 2jtU38GPa9CjKLTgd22p5aVCR57HHGZh30+Qb6ohytauB1OY6tYOkdLDv9zzJOEaX73VO
	 7OJXZ3jMclEzabjtmR2iSjxgSXQI9863TIpp+pUQZe4a0jJ+vw/75gJ/cOo0CV4XcTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091049;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=RA/JUkkG6FRTlJ+spOqNtnTyJ43KCafcpak15PjXfsM=;
	b=O1+2ETEs6VnCPc+PvvBcmqciQJGOefz4d9YuIEiI94PR14xzrKdlJ/RhAREB0Rgs/1im
	 Fx6AIFmonWIYS/WS7Zu99b5f9SQO1HbyM/h6KyWg6v5quvaDdtfZzdsigBAMSrEK7ee4W
	 UinLr+U4A67dO8I5WYISk8Gm3Ju+hlM+vWx4wKdKF5Bl13w/UJtVDrdUHzJsiqgAPRHOs
	 Lbd+edcGu7Rhrp9mSPT8cnfK+b0mgv3OWX6/l67u1NU6m4mNknRMB5Vz/MW0Agnj1Tjwq
	 Tk3ATSpm9lfqB+2MbgXAK8fXTBhceC9whWIwSPIgRKqT0cCaDmvMLjjLDawDTzj7htw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VX6UFIT+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=82vZsoAe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VX6UFIT+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=82vZsoAe;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979B3606A325
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 12:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979B3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VX6UFIT+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=82vZsoAe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VX6UFIT+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=82vZsoAe
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6ACF5219DD;
	Thu, 19 Nov 2026 12:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RA/JUkkG6FRTlJ+spOqNtnTyJ43KCafcpak15PjXfsM=;
	b=VX6UFIT+eLI/sVEIChsExoJLgkKZeU87fvAbDJ7h3OK92T/F9p1dVj7RfM1kpOD+5z3sG1
	Wg0aR6TV0i5UzjQHEK1AnOLVLz2iyhxcDF5td8BhbDs1rjhYLckCv4ZMcbGAjNBr0n1TXc
	7wXkraFVjL/QiEq3/rktgsqUChH4qo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RA/JUkkG6FRTlJ+spOqNtnTyJ43KCafcpak15PjXfsM=;
	b=82vZsoAeY94XSUDqbj28FGbAJWK0i6sEOWrqKU5HfGPQ1bxubzDRV5xrN0xFyUDIfJy+uo
	vtwHmAkwnQwZ+pBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795091046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RA/JUkkG6FRTlJ+spOqNtnTyJ43KCafcpak15PjXfsM=;
	b=VX6UFIT+eLI/sVEIChsExoJLgkKZeU87fvAbDJ7h3OK92T/F9p1dVj7RfM1kpOD+5z3sG1
	Wg0aR6TV0i5UzjQHEK1AnOLVLz2iyhxcDF5td8BhbDs1rjhYLckCv4ZMcbGAjNBr0n1TXc
	7wXkraFVjL/QiEq3/rktgsqUChH4qo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795091046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RA/JUkkG6FRTlJ+spOqNtnTyJ43KCafcpak15PjXfsM=;
	b=82vZsoAeY94XSUDqbj28FGbAJWK0i6sEOWrqKU5HfGPQ1bxubzDRV5xrN0xFyUDIfJy+uo
	vtwHmAkwnQwZ+pBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1773B134F6;
	Thu, 19 Nov 2026 12:24:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ENprLGXq/mqWBwAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 12:24:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 1/3] ALSA: pcm: Fix potential ABBA deadlock at snd_pcm_action_nonatomic()
Date: Thu, 19 Nov 2026 13:23:52 +0100
Message-ID: <20261119122356.2134523-2-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80

snd_pcm_action_nonatomic() is called for PCM PREPARE and other
operations, and the function takes snd_pcm_buffer_access_lock() of the
given substream (that takes runtime->buffer_mutex internally) at
first, followed by the call of snd_pcm_action_group() that takes
buffer_mutex of other substreams in the same link group again.
Recently Sashiko suggested it may lead to an ABBA deadlock when two
different substreams in the same PCM link call it concurrently:

  CPU0                                   CPU1
  ----                                   ----
  lock(&A->runtime->buffer_mutex)
                                         lock(&B->runtime->buffer_mutex)
  lock(&B->runtime->buffer_mutex)
                                         lock(&A->runtime->buffer_mutex)

This patch tries to address the potential deadlock.  Instead of taking
the buffer_mutex of the target substream at first and processing the
rest in the loop, take the whole buffer_mutex for each in the loop.
This assures the order of the nested mutexes -- the linked list itself
is kept intact by the read_rwsem() around snd_pcm_action_nonatomic().

Also, this changes the action in the snd_pcm_action_group() loop from
the direct call of mutex_lock(buffer_mutex) to
snd_pcm_buffer_access_lock().  This prevents the unexpected state
transition or the buffer access during the action, too.

Since the target substream is no longer locked before the loop, the
lockdep subclass for buffer_mutex in the loop now starts from 0, so
that a link group of N substreams uses the subclasses 0..N-1 as
before.  The subclass for the stream lock case still starts from 1,
as the caller holds the target stream lock at subclass 0.

Note that this change might have a slight side-effect, though: when
some concurrent operations happen during the PREPARE or RESET, now it
may return -EBUSY.  But this can be seen rather as an expected
behavior that was overlooked before the fix.

Fixes: 3c3201f8c7bb ("ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/sashiko-outbox-221145@kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v2: new patch in the series

 sound/core/pcm_native.c | 63 +++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index da2b789962c2..c6c2a7053923 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -718,14 +718,20 @@ static int snd_pcm_hw_params_choose(struct snd_pcm_substream *pcm,
 /* acquire buffer_mutex; if it's in r/w operation, return -EBUSY, otherwise
  * block the further r/w operations
  */
-static int snd_pcm_buffer_access_lock(struct snd_pcm_runtime *runtime)
+static int __snd_pcm_buffer_access_lock(struct snd_pcm_runtime *runtime,
+					int depth)
 {
 	if (!atomic_dec_unless_positive(&runtime->buffer_accessing))
 		return -EBUSY;
-	mutex_lock(&runtime->buffer_mutex);
+	mutex_lock_nested(&runtime->buffer_mutex, depth);
 	return 0; /* keep buffer_mutex, unlocked by below */
 }
 
+static int snd_pcm_buffer_access_lock(struct snd_pcm_runtime *runtime)
+{
+	return __snd_pcm_buffer_access_lock(runtime, 0);
+}
+
 /* release buffer_mutex and clear r/w access flag */
 static void snd_pcm_buffer_access_unlock(struct snd_pcm_runtime *runtime)
 {
@@ -1317,26 +1323,38 @@ struct action_ops {
  *  this functions is core for handling of linked stream
  *  Note: the stream state might be changed also on failure
  *  Note2: call with calling stream lock + link lock
+ *
+ * Locking:
+ *  When @stream_lock is false, it takes buffer-access lock for all substreams.
+ *  OTOH, when @stream_lock is true, takes substream lock except for the
+ *  target substream (that should have taken its lock before calling this).
  */
 static int snd_pcm_action_group(const struct action_ops *ops,
 				struct snd_pcm_substream *substream,
 				snd_pcm_state_t state,
 				bool stream_lock)
 {
-	struct snd_pcm_substream *s = NULL;
-	struct snd_pcm_substream *s1;
-	int res = 0, depth = 1;
+	struct snd_pcm_substream *s, *s1, *last;
+	int res = 0, depth;
 
+	/* the caller already holds the target stream lock at depth 0 */
+	depth = stream_lock ? 1 : 0;
+
+	last = NULL;
 	snd_pcm_group_for_each_entry(s, substream) {
-		if (s != substream) {
-			if (!stream_lock)
-				mutex_lock_nested(&s->runtime->buffer_mutex, depth);
-			else if (s->pcm->nonatomic)
+		if (!stream_lock) {
+			res = __snd_pcm_buffer_access_lock(s->runtime, depth);
+			if (res < 0)
+				goto _unlock;
+			depth++;
+		} else if (s != substream) {
+			if (s->pcm->nonatomic)
 				mutex_lock_nested(&s->self_group.mutex, depth);
 			else
 				spin_lock_nested(&s->self_group.lock, depth);
 			depth++;
 		}
+		last = s;
 		res = ops->pre_action(s, state);
 		if (res < 0)
 			goto _unlock;
@@ -1351,7 +1369,6 @@ static int snd_pcm_action_group(const struct action_ops *ops,
 					ops->undo_action(s1, state);
 				}
 			}
-			s = NULL; /* unlock all */
 			goto _unlock;
 		}
 	}
@@ -1359,17 +1376,19 @@ static int snd_pcm_action_group(const struct action_ops *ops,
 		ops->post_action(s, state);
 	}
  _unlock:
+	if (!last)
+		return res;
 	/* unlock streams */
-	snd_pcm_group_for_each_entry(s1, substream) {
-		if (s1 != substream) {
-			if (!stream_lock)
-				mutex_unlock(&s1->runtime->buffer_mutex);
-			else if (s1->pcm->nonatomic)
-				mutex_unlock(&s1->self_group.mutex);
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (!stream_lock) {
+			snd_pcm_buffer_access_unlock(s->runtime);
+		} else if (s != substream) {
+			if (s->pcm->nonatomic)
+				mutex_unlock(&s->self_group.mutex);
 			else
-				spin_unlock(&s1->self_group.lock);
+				spin_unlock(&s->self_group.lock);
 		}
-		if (s1 == s)	/* end */
+		if (s == last)	/* end */
 			break;
 	}
 	return res;
@@ -1496,13 +1515,13 @@ static int snd_pcm_action_nonatomic(const struct action_ops *ops,
 
 	/* Guarantee the group members won't change during non-atomic action */
 	guard(rwsem_read)(&snd_pcm_link_rwsem);
+	if (snd_pcm_stream_linked(substream))
+		return snd_pcm_action_group(ops, substream, state, false);
+
 	res = snd_pcm_buffer_access_lock(substream->runtime);
 	if (res < 0)
 		return res;
-	if (snd_pcm_stream_linked(substream))
-		res = snd_pcm_action_group(ops, substream, state, false);
-	else
-		res = snd_pcm_action_single(ops, substream, state);
+	res = snd_pcm_action_single(ops, substream, state);
 	snd_pcm_buffer_access_unlock(substream->runtime);
 	return res;
 }
-- 
2.53.0

