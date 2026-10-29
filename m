Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252688;
	b=Cuvoc0EYhP9upRxU2tWWsIXTjt3jsa+XKPubuiScYh5CHDqUVz75ef0CCpaNaX0X1zqA
	 yFM3I9Hkd93sIKJxpPiExsmUXyXN9QWn5x3dRsZT438FDFwi9w546iRCP4KvmFjV0sfWo
	 jmaYzN03Ryx1gAosksVAEGYnNowuUdJuhBkCaS805zIWF2Xfk41mGQ1bMVN+wWhsqSYsp
	 RFR40dT0VSWNdeOSnwsgspRkD1rtiLPGRmOB07d9xmfpsxoIhmbg1ckTvSluDmLV6WdtM
	 vkcLt6RB6DnaURl4fdRjrTNKtHpbr9sMMlG7mg+RqcqvOLivExjBRGuFWFcwWguzN6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fs/ZgjrW0cZrAbuUtL5SEnJbOMz43SREcKUWySyyyzY=;
	b=1HfY6Y4+Y1JmvOtq3YstI5iUFLQ9yaFRfKxUYMG95t5PA5Cdl7qyz7ksdEgRndEebf6n
	 ofd4GbeQhgtmIApkxtB30drMZSUAmD8sVb6oMSRCdJD385VoVUB2tH0DxxPHUy4mOsL0t
	 4JEnormwcZ1uDjdlOPXCyR2ZJgt0hXeR9MZXQj7sujmLqgHMHavDORMUOlsxSN6n7eC4X
	 icEexCuu//Giy2Fg7rGh07wSLnAPkrxXLn/AmqqY9aKxVyb/DsvCdmkq4uHBf+YFB/47Q
	 XkEA131aCetAOdpWMv8uH0XB5Pf9rNZnUwNKHZNhH7H8Kcu4ix4qIi3n4kCZynoNvdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoI562t6;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFC4606A31E
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DFC4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoI562t6
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e95bd1c14cso14160405ad.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252688; x=1793857488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fs/ZgjrW0cZrAbuUtL5SEnJbOMz43SREcKUWySyyyzY=;
        b=JoI562t6qTHpcNefDtoCQkeq8yYd3HXZ/PjSlw03tPVEU/WC1KQQjOXdDR6Cqh0aEp
         Pccb4gf58nJ2sDnqxhX2EYXRyFTociR6uMEO+ZlMVIeBp0C9m3FoTOG0WAtmNQk6s8W/
         ScREPQajTrZlM4m+/mojIMzEuDKbJtgvbcGYBlkIxbbfoLC+/3BN6iDxr6JJhmKFu0Wf
         mfoE2eg4UqIOzgK4g8BpQXoAdm7Q2/CXXusT425pNM7eJHTBoYsQ8APX55C3l6z7s11F
         V52PgnXU/SGfca27YBJ3N+zKlZxGr4st/Q3Kc6+pzA+m4DjRVovzwaKuRcWQ12h3neTQ
         017g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252688; x=1793857488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fs/ZgjrW0cZrAbuUtL5SEnJbOMz43SREcKUWySyyyzY=;
        b=A7sJrha+s1YSG9oldd5mODgj5DMLgY/H84XI40SMFgv2S72/J0elHSEa5kWhZ20iBK
         IrY9psrjX3qzlDeQXIfw2jh6ndxg7WFac06uGe7+pE6RFnIKbff81TRsgI+hNfGGepaz
         OIw3sPSza1QNumA8uW1lB6SYV1KMeEvKchYEz+21PilcsbOuw1GPG2su807ivL9tqNrN
         3i4coT+kRXB3jK8lXYjbxmfgVcVnrbDfAEmeQMkZQrvMYpxgQ3+OSnbmJE8YJJL7FsM2
         JtQyV6aXRUaXACqWDQEcTaVWxgHluzoSDECuGFrZwPDsxS4QnUxlUbSSvsHmPZvU9ehK
         Kb1g==
X-Gm-Message-State: AFq9FYLYQn/mN5IsNq7NQID1bEZyjACVf6fh8Q8Xw5QH9kzNAAqfzSpC
	CzL2yd1MfTfPUxwOJqoKbmjSG9HbQGJB8AtBCorJENaIFIRvFcqoyb1EOoA6Wg==
X-Gm-Gg: AYBFou2jM3rLZU37wAUgX62q/fBnAJuQfGPXpxYLV+XxI8GABdMm8pGRtU3QoXqK1+X
	sAg4U3LisXn5SA2eZ7CoLZVmM1O2e8MaKUYZFGP5yR4AT3hsPQub2/0repfWX7NS1kJHvV/uLR4
	zcVSTUvXJdWOWqxicyVa1kNJFah3xZJ2R8vZOdP0OHl1bg8bjN+s9NUNTzZTPeHjcN+AO1blIPT
	iJmTJmS6ml4RyDRuRz9KNDaVSU9LWx1Ez68ws+azNzLBed9LPBMGGJr3JASrABGV6S+QP///Yn3
	V33hE7IFrNXNbep6K8w90tAbMaeFJTW/v4x87+daw5VERuXRTMdkmJjgcOZhztxVkQTjy2LIM86
	kafaBpA5FguX3kpDc68kXprFfJewH3qTF6f4AXBQdJu0IYSGo8DP0eVcuGAq4CwE19YYldGli/t
	Wg7V7IMGEhsdlVEAfWyY0484U5oe3ZmxjT3gsKdj+GLMJYFCjgfUMttffXfR0UfNep2h+hmx61f
	WvEan1Mb6ZiwAJBvfatEKUxTXEYHWapckZ+VkYwZnpLjcggPIxrNCAp/XpcMS9ALVoj9BdT1G4o
	fQ6uGbkeJq1QlTFJRcpPzDg4LTYVId0dBBDcU8fdcXZhscuSKe8sjWDsih0SbpQEzP3lnN4jI/U
	gczfWB9y/f4LxrjGv4FHCUSQzrMoC3/UheL9erPUaEYDu+pw=
X-Received: by 2002:a17:90b:54c5:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3ae58195369mr3420391a91.66.1793252687719;
        Wed, 28 Oct 2026 22:44:47 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:47 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v8 12/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 29 Oct 2026 14:43:52 +0900
Message-ID: <20261029054354.2931-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

A driver which keeps private capture counters needs to reset those
counters together with the PCM application's position. The ioctl RESET
path releases the stream lock before core completes the position rebase,
and appl_ptr is updated in a separate post_action. Period processing can
observe the intermediate state.

Add an optional reset operation whose stream lock remains held through
the core position and appl_ptr updates. Export the common pointer reset
as snd_pcm_lib_reset(), so drivers can reuse pointer validation, time
accounting and XRUN handling without reacquiring the stream lock.
Drivers without the new operation keep their existing ioctl path.

A successful callback member completes its reset immediately. If a later
linked member fails, the first error is returned and completed members
are not rolled back. Legacy members retain the existing post_action
behavior, including in mixed groups. An error can leave partial changes
in the failing member as well. Callers must recover the group before
relying on its capture positions again.

The operation also runs after a successful driver prepare. A later
prepare failure can leave an earlier member reset without the group's
post_prepare state transition. Document this together with the atomic
and nonatomic locking requirements.

Linked synthetic capture tests cover both locking modes, four callback
combinations, later-member errors and recovery. The lock-window concern
was found by inspection; the existing delayed v7 test did not reproduce
a user-visible failure. The new-candidate tests validate the
synchronization contract and recovery paths.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,20 @@
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
 	int (*ack)(struct snd_pcm_substream *substream);
+	/*
+	 * Optional RESET operation, also used after a successful prepare.
+	 * Called with this substream's PCM lock held; atomic streams must not
+	 * sleep. Do not reacquire the PCM lock through snd_pcm_lib_ioctl().
+	 * snd_pcm_lib_reset() provides the common pointer update under this
+	 * lock. The core completes the position and appl_ptr rebase before
+	 * unlocking a successful member.
+	 *
+	 * Return zero on success or a negative error. Linked RESET/prepare
+	 * stops at the first error without rollback. Earlier callback members
+	 * retain their completed reset; legacy members retain the existing
+	 * post_action policy. An error does not guarantee unchanged state.
+	 */
+	int (*reset)(struct snd_pcm_substream *substream);
 };
 
 /*
@@ -1179,6 +1193,7 @@
 {
 	substream->runtime->std_sync_id = true;
 }
+int snd_pcm_lib_reset(struct snd_pcm_substream *substream);
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1760,20 +1760,39 @@
 }
 EXPORT_SYMBOL(snd_pcm_hw_params_bits);
 
-static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
-				   void *arg)
+/**
+ * snd_pcm_lib_reset - Reset the pointer while holding the PCM stream lock
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held. The caller must not hold driver locks
+ * acquired by the pointer or XRUN callbacks.
+ *
+ * Update a running stream through the ordinary pointer path. Other states
+ * start at zero. Pointer errors keep the existing RESET return semantics;
+ * a zero return does not imply recovery from XRUN.
+ * This helper does not update appl_ptr or acquire the stream lock.
+ *
+ * Return: zero.
+ */
+int snd_pcm_lib_reset(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	guard(pcm_stream_lock_irqsave)(substream);
-	if (snd_pcm_running(substream) &&
-	    snd_pcm_update_hw_ptr(substream) >= 0)
+	if (snd_pcm_running(substream) && snd_pcm_update_hw_ptr(substream) >= 0)
 		runtime->status->hw_ptr %= runtime->buffer_size;
 	else {
 		runtime->status->hw_ptr = 0;
 		runtime->hw_ptr_wrap = 0;
 	}
 	return 0;
+}
+EXPORT_SYMBOL(snd_pcm_lib_reset);
+
+static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
+				   void *arg)
+{
+	guard(pcm_stream_lock_irqsave)(substream);
+	return snd_pcm_lib_reset(substream);
 }
 
 static int snd_pcm_lib_ioctl_channel_info(struct snd_pcm_substream *substream,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1989,7 +1989,31 @@
 			    snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
+	int err;
+
+	if (substream->ops->reset) {
+		/*
+		 * Complete this member before releasing its PCM lock. A later
+		 * linked member may fail; RESET has no group rollback operation.
+		 */
+		guard(pcm_stream_lock_irq)(substream);
+
+		err = substream->ops->reset(substream);
+		if (err < 0)
+			return err;
+		runtime->hw_ptr_base = 0;
+		runtime->hw_ptr_interrupt = runtime->status->hw_ptr -
+			runtime->status->hw_ptr % runtime->period_size;
+		runtime->silence_start = runtime->status->hw_ptr;
+		runtime->silence_filled = 0;
+		runtime->control->appl_ptr = runtime->status->hw_ptr;
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		    runtime->silence_size > 0)
+			snd_pcm_playback_silence(substream, ULONG_MAX);
+		return 0;
+	}
+
+	err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
 	guard(pcm_stream_lock_irq)(substream);
@@ -2005,6 +2029,9 @@
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->ops->reset)
+		return;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
