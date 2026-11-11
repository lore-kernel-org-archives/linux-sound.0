Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365837;
	b=MQchMHjm77YEZGxCg4mULZLkS+82RWyr7fGTvwIW5YOVuAn0XSGEZ4Cu84qdsXOrC984
	 Izy3hBBzUjQCuED9IZiBBONdJDGeraa6C0IQAXV8CuqDsnHbL/b2CN8n/bBwZG0LhpCM1
	 j8q2d7gSaNJlr0kMkWTYyhKz6OO56MTlQ4vHWPCR3ZEhSVw8oiq52jdr7G8D7ZTlk14Jt
	 lvNojKspiAjJ69O1PpXEopJSiVBElbXx8CGvAR2uiaiDxp96RUH4rdRpnbhfDxfj4vEOM
	 JMBggyi60ucUKBlls+RsQpYubghDhcqGoDbhqGjVgZbkuKptRD3Urg/PPPNM9Z5S+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zmiIgqy4cjH0UGo3VGOzKAUEYd5iSjgfVUfTajSB4Yc=;
	b=yOoFfmDpzO0QbyW0wS1GCyouTRKPvlfLQLREC/n0ECx9nIu6sTCh7rgqKtR7hgUpYtxE
	 dZQyf1YaVkvmWmaIwryPVwVIR932H2OjkqeUUBS1vnOq5xmeJtE37z5nn5dDyXxh2fFgR
	 V6VT8OwfD/gdDmvDn8pOfYb71GochRXvntP8Twj+AObhKOL9HbRwjzkOd8DbzDAvGFval
	 du35klSkxmayzF9ODEJt5CCyhRlW3piqIpx4bOUHa1s8+k/jKnf1V/JTdeHLlFrulL3+P
	 aiJb7RHL11/hHkOYg2p7MmOpYj6rPxlC6Bf2JTS+DK0+McxTcPEvzBk6uRVE6STucAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEeFzemm;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDDF606A32E
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EDDF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEeFzemm
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso240621eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365836; x=1794970636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmiIgqy4cjH0UGo3VGOzKAUEYd5iSjgfVUfTajSB4Yc=;
        b=KEeFzemmSJgOSRxhHyhUDFnxgy/f+OpMl8lKlkMYhZlHMVXRADlrNjmXlADIkuDfEr
         NXOU3IeUt7FCio6nngzBP+46gvpEcP0qWcKyQr+0/jx8xjDig9gWCf+K/xhwEcK7UUej
         X0vwlP+Hdmm+yOfGkhD6cAL7ZBP0xX5h+J+8Xo2XR9GCtBOgYk/e8fKZzbbKWoKi8LjI
         LxStBHlYH4A/uDHg9bY6jmMb1q/Y/GNejKfJURgnqXPeLUfBSz0Dnii382w9Em1JeHN+
         MAx/EbgYf3NhiRVLkznCVDE6ols5uxMwSrHDZjlLQfy3954jjdIG5Xa44X0FFYaCmxpy
         FRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365836; x=1794970636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmiIgqy4cjH0UGo3VGOzKAUEYd5iSjgfVUfTajSB4Yc=;
        b=T+yYPABBK88OaD9B6/Lffu3qD3XpUrIo6QSi1bDAb3fYHvv4uQi/VqBnj0GtiQl4/D
         cAZpAqLtomyEO99ONW/8bGewxTx30C4mU7VRtF5y9FbvE+04f47s2Of03cIUv9fy6UcV
         5Z4/REJB3SN8KVwiE3JaTOnKZuAcEV85ilBRd3yLEptyfcUAwlxfURTWgcddjwKvYp/j
         dRu8xIVtuDHBkHEzuGmX0kYLW9XLunZvdd5HgUP8FulMXf2I8oh4vUv3g0O0jiYpWkFq
         adwcKz079LVanC/Pkq537FK6N4Mwdt1Zi3xhPLvupmgUG3WfavfBCwCl1yw+SAIZnwoz
         9euw==
X-Gm-Message-State: APuU4Z9dexjpDfTwcxwVX2fooqm66+NZIQgSd9aAHHXWP7SHwBA3tOSp
	X2mDqANY+4GccbEjOXHXeOGOx5yDx221c5Ptur+MzExucXyf4hCAn63YjyPmYw==
X-Gm-Gg: AYBFou2zqc//xSy/B7iWm1JUWZ2xyfyAI2lIj8sEfpcD4CznxKRYYy4aRZiB5bHO9g8
	Bmm06a9z6RQlTg2sHdY1gmaoul1IsjLCs1tQQZJLYh+Evs+lDu2TBNXiwxeMZcoiwOFNrf5L483
	bBYRfBo0kMZ9xYxNHz7Hisryuwhuybl+MWTTq9U0ZxPXta92TE3Qorrz6c9zhTyk6FQ4yUejSa5
	3VHEhhDBXOJdRCxqFHOAJb/7Xv1/1rNhIfTYHE2NClSZLd4Ol8vwCB43CIbqjzrs8x8bqxBBZI8
	KhUlEhTbhW9xB0bUB1y1S1HZSKc8BvoZskMOj/Gbg8Zk6wiOO7mvUaxkyim5WpgqJwmbas4BFqK
	5YvtNEKeSLjYkC/5qshAH4ARQRNN2zfuDaoOVQfTIeo5nljcKjSkajg3SbNx1ACBCE9D4DwwuiZ
	NR/Z4l1caWYVvU17KtGixCd1xYDNGJ1nD/Vs0nO9itUaGC1ToAvBBsOj7PGezJy/sLPIYZhVv7y
	hCuKDyeC0HVox8FRinA+qc7CMTPpWT2j7gSBxa+2Bf81zEXheErtoy0/8b+cwN4tNyobNLnApr7
	3aWnHOpTXGbOwn3oGSmh567DgwCDwg/CXSHKUoS6SjXHILM3DAulHdf0dnizAMXoRIJCQ1Ak9Gh
	+RYonu+rj2DScNL5aViXl3SKL7/OOBnYK7NWMCiRz46DBvHk=
X-Received: by 2002:a05:7300:dd09:b0:36e:20ee:b288 with SMTP id 5a478bee46e88-37685d717b8mr1560097eec.12.1794365835899;
        Tue, 10 Nov 2026 18:57:15 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:15 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v25 04/16] ALSA: pcm: notify drivers after linked prepare completes
Date: Wed, 11 Nov 2026 11:56:43 +0900
Message-ID: <20261111025655.63951-5-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

A linked prepare can finish one member before another member's driver
prepare or reset fails. Drivers that admit transfers after their own
prepare callback can then accept an ACK while the group action is still
incomplete.

Add an optional prepare_complete callback. After all sleeping prepare
and reset actions have succeeded, take the group and member PCM locks,
publish every PREPARED state, and notify opted-in drivers before
releasing those locks. Keep the buffer locks and access gates held
throughout the operation. A concurrent DROP observes the group before or
after this commit point.

On a driver error, notify only the attempted prefix, including the
failing member. Opted-in members in that prefix return to SETUP. Leave
unreached members untouched. Preflight failures have no completion
callback. Preserve SUSPENDED and DISCONNECTED states if finalization
finds either in the affected group or prefix. Successful driver actions
canceled by such a state return -ESTRPIPE or -EBADFD, respectively. A
driver error keeps its original return value. DISCONNECTED takes
precedence when a linked group contains both terminal states.

Do not generate a stop-timer event while closing prepare admission.
Ordinary legacy drivers keep their existing successful preparation and
pointer rebasing. The new callback runs with the group and member locks
held and must neither sleep nor acquire another PCM stream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h     |   17 +++++
 sound/core/pcm_native.c |  152 +++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 149 insertions(+), 20 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,23 @@
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
 	int (*ack)(struct snd_pcm_substream *substream);
+	/*
+	 * Optional prepare completion notification. Called while the core holds
+	 * all linked PCM stream locks, after prepare/reset actions succeed or stop
+	 * at the first error. On success, the core publishes PREPARED for every
+	 * member before calling this with true. If any member is DISCONNECTED or
+	 * SUSPENDED, all states are preserved and opted-in members receive false.
+	 * On failure, called with false for opted-in members whose action ran,
+	 * including the failing member. Their state becomes SETUP unless any member
+	 * in that prefix is DISCONNECTED or SUSPENDED; then all prefix states are
+	 * preserved. Members not reached and pre-action failures receive no
+	 * callback. Standalone RESET does not call this callback. It must not sleep
+	 * or acquire another PCM stream lock.
+	 * A terminal-state cancellation returns -EBADFD for DISCONNECTED or
+	 * -ESTRPIPE for SUSPENDED.
+	 */
+	void (*prepare_complete)(struct snd_pcm_substream *substream,
+				 bool success);
 	/*
 	 * Optional RESET operation, also used after a successful prepare.
 	 * Called with this substream's PCM lock held; atomic streams must not
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1310,6 +1310,10 @@
 			    snd_pcm_state_t state);
 	void (*post_action)(struct snd_pcm_substream *substream,
 			    snd_pcm_state_t state);
+	int (*finish_action)(struct snd_pcm_substream *substream,
+			     snd_pcm_state_t state, bool success,
+			     struct snd_pcm_substream *failed_substream,
+			     bool stream_lock);
 };
 
 /*
@@ -1350,12 +1354,19 @@
 					ops->undo_action(s1, state);
 				}
 			}
+			if (ops->finish_action) {
+				ops->finish_action(substream, state, false, s,
+						   stream_lock);
+			}
 			s = NULL; /* unlock all */
 			goto _unlock;
 		}
 	}
-	snd_pcm_group_for_each_entry(s, substream) {
-		ops->post_action(s, state);
+	if (ops->finish_action) {
+		res = ops->finish_action(substream, state, true, NULL, stream_lock);
+	} else {
+		snd_pcm_group_for_each_entry(s, substream)
+			ops->post_action(s, state);
 	}
  _unlock:
 	/* unlock streams */
@@ -1379,7 +1390,8 @@
  */
 static int snd_pcm_action_single(const struct action_ops *ops,
 				 struct snd_pcm_substream *substream,
-				 snd_pcm_state_t state)
+				 snd_pcm_state_t state,
+				 bool stream_lock)
 {
 	int res;
 	
@@ -1387,10 +1399,19 @@
 	if (res < 0)
 		return res;
 	res = ops->do_action(substream, state);
-	if (res == 0)
-		ops->post_action(substream, state);
-	else if (ops->undo_action)
-		ops->undo_action(substream, state);
+	if (res == 0) {
+		if (ops->finish_action)
+			res = ops->finish_action(substream, state, true, NULL,
+						 stream_lock);
+		else
+			ops->post_action(substream, state);
+	} else {
+		if (ops->undo_action)
+			ops->undo_action(substream, state);
+		if (ops->finish_action)
+			ops->finish_action(substream, state, false, substream,
+					   stream_lock);
+	}
 	return res;
 }
 
@@ -1469,7 +1490,7 @@
 	if (group)
 		res = snd_pcm_action_group(ops, substream, state, true);
 	else
-		res = snd_pcm_action_single(ops, substream, state);
+		res = snd_pcm_action_single(ops, substream, state, true);
 	snd_pcm_group_unref(group, substream);
 	return res;
 }
@@ -1501,7 +1522,7 @@
 	if (snd_pcm_stream_linked(substream))
 		res = snd_pcm_action_group(ops, substream, state, false);
 	else
-		res = snd_pcm_action_single(ops, substream, state);
+		res = snd_pcm_action_single(ops, substream, state, false);
 	snd_pcm_buffer_access_unlock(substream->runtime);
 	return res;
 }
@@ -1660,7 +1681,7 @@
 int snd_pcm_drain_done(struct snd_pcm_substream *substream)
 {
 	return snd_pcm_action_single(&snd_pcm_action_stop, substream,
-				     SNDRV_PCM_STATE_SETUP);
+				     SNDRV_PCM_STATE_SETUP, true);
 }
 
 /**
@@ -2063,9 +2084,12 @@
 static int snd_pcm_pre_prepare(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
-	snd_pcm_state_t cur_state = snd_pcm_get_state(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	snd_pcm_state_t cur_state;
 	int f_flags = state;
 
+	guard(pcm_stream_lock_irq)(substream);
+	cur_state = runtime->state;
 	if (cur_state == SNDRV_PCM_STATE_OPEN ||
 	    cur_state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
@@ -2089,20 +2113,108 @@
 	return snd_pcm_reset_substream(substream, true);
 }
 
-static void snd_pcm_post_prepare(struct snd_pcm_substream *substream,
-				 snd_pcm_state_t state)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	/* The reset callback path already completed this rebase under the lock. */
-	if (!substream->ops->reset)
-		runtime->control->appl_ptr = runtime->status->hw_ptr;
-	snd_pcm_set_state(substream, SNDRV_PCM_STATE_PREPARED);
+static int snd_pcm_finish_prepare(struct snd_pcm_substream *substream,
+				  snd_pcm_state_t state, bool success,
+				  struct snd_pcm_substream *failed_substream,
+				  bool stream_lock)
+{
+	struct snd_pcm_substream *s;
+	struct snd_pcm_group *group = NULL;
+	bool cancel = false;
+	int cancel_err = 0;
+	int depth = 1;
+
+	if (!stream_lock) {
+		snd_pcm_stream_lock_irq(substream);
+		group = snd_pcm_stream_group_ref(substream);
+		if (group) {
+			snd_pcm_group_for_each_entry(s, substream) {
+				if (s == substream)
+					continue;
+				if (s->pcm->nonatomic)
+					mutex_lock_nested(&s->self_group.mutex, depth);
+				else
+					spin_lock_nested(&s->self_group.lock, depth);
+				depth++;
+			}
+		}
+	}
+
+	/* Preserve terminal states instead of publishing a partial group commit. */
+	snd_pcm_group_for_each_entry(s, substream) {
+		struct snd_pcm_runtime *runtime = s->runtime;
+
+		if (runtime->state == SNDRV_PCM_STATE_DISCONNECTED) {
+			cancel = true;
+			cancel_err = -EBADFD;
+		} else if (runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
+			cancel = true;
+			if (!cancel_err)
+				cancel_err = -ESTRPIPE;
+		}
+		if (!success && s == failed_substream)
+			break;
+	}
+
+	if (success && !cancel) {
+		snd_pcm_group_for_each_entry(s, substream) {
+			struct snd_pcm_runtime *runtime = s->runtime;
+
+			/* The reset callback path already completed this rebase. */
+			if (!s->ops->reset)
+				runtime->control->appl_ptr = runtime->status->hw_ptr;
+			__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_PREPARED);
+		}
+	} else if (!success && !cancel) {
+		snd_pcm_group_for_each_entry(s, substream) {
+			struct snd_pcm_runtime *runtime = s->runtime;
+
+			if (s->ops->prepare_complete &&
+			    runtime->state != SNDRV_PCM_STATE_SETUP)
+				__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_SETUP);
+			if (s == failed_substream)
+				break;
+		}
+	}
+
+	if (!success || cancel) {
+		snd_pcm_group_for_each_entry(s, substream) {
+			wake_up(&s->runtime->sleep);
+			wake_up(&s->runtime->tsleep);
+			if (!success && s == failed_substream)
+				break;
+		}
+	}
+
+	/* Publish all states before any driver observes completion. */
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (s->ops->prepare_complete)
+			s->ops->prepare_complete(s, success && !cancel);
+		if (!success && s == failed_substream)
+			break;
+	}
+
+	if (!stream_lock) {
+		if (group) {
+			snd_pcm_group_for_each_entry(s, substream) {
+				if (s == substream)
+					continue;
+				if (s->pcm->nonatomic)
+					mutex_unlock(&s->self_group.mutex);
+				else
+					spin_unlock(&s->self_group.lock);
+			}
+			snd_pcm_group_unref(group, substream);
+		}
+		snd_pcm_stream_unlock_irq(substream);
+	}
+	return success && cancel ? cancel_err : 0;
 }
 
 static const struct action_ops snd_pcm_action_prepare = {
 	.pre_action = snd_pcm_pre_prepare,
 	.do_action = snd_pcm_do_prepare,
-	.post_action = snd_pcm_post_prepare
+	.finish_action = snd_pcm_finish_prepare
 };
 
 /**
