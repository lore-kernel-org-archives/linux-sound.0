Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267669;
	b=Mw0RHb2TCMyJI6Ag2FANXyiHEVcLNX6wTd1MacDOEJJqkBONKBKqM76f8KNfmfBSsNp3
	 s0iIIYpyVOAQ7R6wamtbGz5RApgnaGDkLiTj/6EuF78UIKVEbgcP+dsWQ3yfQOYSdMI2q
	 SCSJXIiuw5KLoLesm5r39UD4ge551zA2R/On2ZhQVjOiBBgAVwlqHMApE818GpKBUwXmL
	 L+f0EhxS+jTHe8uqOocgk9Aah+xLCPyKLYTk+oD5R4EgeZMdzQJ6AzDjLegrM/C4OHH4f
	 U5frbXC69as3myi4kopDIWux/RIUMxebaEOEA8R2/3bUclqMkS3evJcOpKBQ4ab0UpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zmiIgqy4cjH0UGo3VGOzKAUEYd5iSjgfVUfTajSB4Yc=;
	b=puIvOvGmR588yoWoKv/mrk6efAuwbb638kKjbvH2FsuckLuO8VAH3dRvEMEBEbdYCnJa
	 MfsJdv3iyPiJza9kcEP1M76r2LRMYL/Dw8oJTbGkwoTXZrDn/gJdZ4U53K5krlNEbvTM5
	 fgQOLec8Y0YpRTnDzPX2zAnGg6L+LTb1ZcxHg7E5oyPQCAuyroyCDUlFsw7ps1X8aMbxw
	 vjUd6WP0zpABEB8gxKEKxfEXKguBTNHa5SqdAMjik6d3xEgzcDMNwfvzWfIPLX5SLSjDN
	 YkEaBgQo458yByBibROOs/yIK2GFC5NsuvrmtDk6yPZDbrLeHEWkJgAOCraNjpB6O2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoS96PEP;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4603460A2600
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 23:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4603460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoS96PEP
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3720addb068so2320692eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 15:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267668; x=1794872468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmiIgqy4cjH0UGo3VGOzKAUEYd5iSjgfVUfTajSB4Yc=;
        b=KoS96PEPxXx1gs+CaU7tPdlvetynmN/afT3BBdv/fwb50QwBc/+CXRNixkHprm5GeT
         NIuJNQG3E1MpMOw/Powzbe9ChRuMcpSrj5ubCJ06K8Lo8SrVTCSkn84qaIB5YMkUrBT3
         +bD7BOmGaPn9KKHveVGOh12iLGwJFB6djMqu+ufC0Sm2yZbZ2QnhYik3URg22ZkSmN7S
         VE5VbkxhKRnsJwBJhmhDCvrtMsjexkm2bwUH+76P8vOysYiuiltsN4q3c+IICJi/R72o
         brwzBqtOuf1QLTs5w6hfLKTVliFXODXLbvoiRqG4Zp71HNzWZ0b/lb1TENBF0KSJC/Ys
         +XGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267668; x=1794872468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmiIgqy4cjH0UGo3VGOzKAUEYd5iSjgfVUfTajSB4Yc=;
        b=LN7iR0Z8meQKUNz51GI9kQgsL5xtYtfMws8WmOAqLNX0Bf2W+gDmi2H9phCDvZOIFq
         sT0sMLaTcSfMutiEYYu0LmK5cLBrkrrCWjiFvGG3aTP7BfiWnDGWssL3FKtN9iQmgoAf
         BWdN0MztF5pxE2rwT0f/cFf11BOOsu+rtNBrFATr1VzaI3E+LVhqGuvJFQ2CCmXr+Oz4
         Y0a48akJ1ypo57X5X3IJ+D1jPwK6Vf49fRuUzoR/yTwg1NAQwizoxEcJopzhFELBwr7Z
         gkd5vYGrbarBVkX5Ipi6Wfe3Zr0BTZD4njdvtNaHSTBhbQphHUiUduSug6h0n+uTHrxY
         esqA==
X-Gm-Message-State: APuU4Z9UfXoGgHFSu9lYZ8FQ4v1dG0rwCCYwHYPjQnLSCrUzTJ+ljBZX
	Q7LKZPrPQa7dxfrPOSsERXkfekHt69YgzzwTo1YzumiafPL6iEFDwrlmoBy9cA==
X-Gm-Gg: AYBFou15z/wcBYNK7tYDfVL2/gWCvEhWThOrcnA8J/ny2b1eFgK+fKzHrwKvrlJ7zfv
	OJChFdWMNnsE848kc8ljFiGGqbTK8zdqfEg8vbtf2Ur04BeGp7wP9M6RvhpXZwGVz8h9RWePWjf
	oniVJMrJY0viAEcLCNIn1KDSjNwBsT0x4nWcQ32bqsqaLwXffe4calETSETiA8IYlqLRDvvtJ+E
	02SkBFnqvNun9gZ2UisxQBPNA18+lg7Upwq4lqZFqacv2v9KY6IucaWxGJxZE+wdL6jKzbZiTkc
	+L51mgDwH3UN13qmwNSLWSkTx4SlaSH662jJPQihIvSkCSyaid5BF3cLjQ/xzeaHgHUguT8t9Ia
	YVMDyvjyCSjjuuRl9ThWtIwKyrfIAWAEdkHjlZrRN2lco4apiyLbNYKpP3nu9ZzjHcyJ55jxPxy
	jRjUHG/z6Kq7dTzosk8iruQPkPwJ4CPiFfNo1V3AwMFVzhmgMefXZWy7iyAbVlMu/UU2H1ZR6H1
	2hcWehzMez5xARzZ0Ob0Sr9UOVm0qn0g3fEqJg6js6IrFRZ2zpd/LH88otYacbcVb02v+MfDtps
	SEFZmpyvaasTNPynUYiqunmpGQQhBXmIWWA0Pz7FhTGl37ZbteWrHYN6C2bgDsq32hX9b41QcDp
	CtmwfQyKjvChxrbHvRCfTMmoJqieCPZlifNGWZaYMPFgyrqM=
X-Received: by 2002:a05:7300:8184:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-375219bd11fmr1389016eec.40.1794267668071;
        Mon, 09 Nov 2026 15:41:08 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:07 -0800 (PST)
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
Subject: [PATCH v23 04/14] ALSA: pcm: notify drivers after linked prepare completes
Date: Tue, 10 Nov 2026 08:40:39 +0900
Message-ID: <20261109234049.79534-5-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
