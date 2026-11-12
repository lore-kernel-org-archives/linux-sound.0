Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461711;
	b=E4PSS9vf/Hs6LBv5XJYVvkeqDFLIhYzDOG6Qi2IodD/KUtCtHk6DTCJPXrOfAzyNcCN2
	 Bl0bIjmoYip22whrC7iVbstDKJTewbpTBbJDC5SgeWsPPSP3VSXJmzKWdX0Q1JbQajJQ4
	 EFWv8znsh3lE28Ge+EKLJbNeMTXs2lAbPvqbZoXMeNpWg4cC2xD0NCOudk1f7ZcG/2JwA
	 W4882BaCpiU2oQHLWCdtB6jNsnouSDhd2cc7u4o2SVDciMevg/6Iei/xKXUbtkBzeQesZ
	 jCighn3FhkYoXvMS8c1G+Fd+vpIKiZ85wzpzdC/DbfBkjtrUfEy7ZJwWWTGp5pAOmSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=G9wCkT6iAOfW/LDJn1vSypQq1CHUcCgN/PFDGYCkdeVP6gwoPJX+vqt8kYuo9y3aJxDY
	 lVZxWTlvcKkeYSf7QMlsnSswZvmxmy3becrv/SxYBuOeCS81MNM6OrErVEGp2NTRg5Rsg
	 1U+SMP/4Btxa8azdOqcHaIwRxCRrwTMhiRX0gOF9efo70lViVINcm4oapEBCpf8EYS/JS
	 O/06z1WV5VwndTJu3okhyZyJEN0GFFV1kG36qFeCOKmPP/yTOz1+qmzs/ZKxFwS/sj6ND
	 FcVYpnBNC7euLMn+NRdr71OF2oJlY81rvVLZtC5JemEuBo6ivWb6oQCU8a3MON0bsMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRjnk851;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3A606A88F
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C3A606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRjnk851
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so6079309c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461710; x=1795066510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=XRjnk851GeuCGigpxYnUEZ/Zhe4jR51Itjm9IFWpxmOTBnYH1jCBqMAjpVG3fLEA0s
         kynxud7KAa5Car2oc6LcJofyDw9/WuMFaFHk7+p+/ONBql0b0pLCrFz4UxYqRuRHCD55
         cQRU9uYd282KP6GXTMmvlbpYgPitayBzywurJerHSA2cMnS8xX0KgbuVNhLO6wyUC8pB
         4Vey+6nNM3PqYZPYdFKzxoLKL4oYKBRSYLt8cCbuU5EcbeXT1oHAkSLEbinU9gOtIher
         155es98IDyaCmS9B5zL1QN5+PwphqdPIV1qIvj4UvNozfbE3WYOCZwAX3ohAvENaSYv/
         mxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461710; x=1795066510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=oOaOKz5KAXaeOEqzylDjTC1wFGv194aeUp1LbFXj6yujziRyfQLB61lEYkuk/1jhSs
         aAxpnjt9TTJlxlH8jS6CbL08q4Hhd93C+ZFeSWuUD5B8y2hdyElCRHvZKrJLozKiXkaz
         5kDiraX0fpWDNWIFyQI2wAZbgYKkqPyRJoOO0cxw1Izu1q1k09ojy6foDCRqXbkiKmsx
         H7MUeGFrRbER6MA9whI7bWh6Yhm21CF4mNS/iaBGoiGvZj5O63KqcCr/DLlJdTXQWY0N
         eBG0rO8bl0O+1LI7FKHvCUDXRU4M68IAFw1jOBocVAKnBW+YuRKwAC/hlKiuu0P8bQnk
         rNZw==
X-Gm-Message-State: APuU4Z/kcHi3P8JCPcAU2TN0YOTJRE06SwM26NRPFX34UAVVXrB1+hyv
	GrAb4mSAgUS1vF+Q8dz4QW4TLkkpCqFAl4gdIdmikYCfFYUBzWddEGFDFEScmg==
X-Gm-Gg: AYBFou3RzFge7Slrg6Jx+Izroaxa0kfxA0iTHSnKReD5HW0lQ8RJ3N2dEC0vujsf7Bw
	ZTRZwcOef4b1fjTXhUOsnTMZBW+Z0TToZtqOT9pDOXTy4rd0LC7/THgtvT8Dc+h5UA+BVJbYlqa
	+RoE9EO2NVqdG4+FiFMWnhOyVCic6+ZdUyMEblQaAnrPTp9UQayncOl3aaXWV9aO9jCV41UHuYG
	tjgPzTlUgVyPugkUWTxhTlU98qc80DhFJPFqfDxmA1oBWv3n0HegIQ2TN0wYsqQ6j2G8HYawlTw
	fYwQSvcUFHTOiAajzTYh1cCbbH/H2DxyLNsqW/eeWx5WYiofb8fVypx28LPdfZGj1G5aKygN9eD
	E0RSrG+aef8R4BeTQAQbn2Z3OYPsl72FEpRpUHw/p6Lo/qIFqLjLiFo0vrIC7MQMX23BOnPY2ki
	vhY1lHxnypa6ht6c1CMO0DWCRdcwjjI+eB/VRSfvteCSka87OA4U/e89wWVjy+DDg9PTIOGEFLe
	/LQjZxeUx3DqkCJtVcEq0LInrfnzy9Wnu2CSb1I2oJ5s+vJ30nIn22i+iaEdq9MpaFHRrL76vtm
	FwIQhX5J2L4YtKN8zyJPhoVR75nmQyZJ4QsOy7ebXCkT1ZngP3plBSlD6JWfNNwdqeYryj9dTBH
	uohQ/3VLZvpkhenvdDlqdf0IEJB2T1uCdT8W2lXyyvZWyMRA=
X-Received: by 2002:a05:7022:b0c5:b0:1b4:fa58:9d8 with SMTP id a92af1059eb24-1b4fa580c0fmr962783c88.20.1794461709986;
        Wed, 11 Nov 2026 21:35:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:09 -0800 (PST)
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
Subject: [PATCH v29 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 14:34:34 +0900
Message-ID: <20261112053446.73504-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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

Concurrent non-atomic actions on different members of a linked PCM group
currently lock their own buffer first, then the other members. That
acquisition order can differ between callers. Sibling buffer mutexes
also do not close their buffer-access admission counters.

Close buffer access for every member before taking any buffer mutex, and
acquire those mutexes in the stable linked-list order while group
membership is protected. Release every access gate on success and on
failure, including when a member already has an active buffer access.
The group action then uses the buffers already held by its caller.

The PCM stream and group locks are not held across sleeping driver
prepare callbacks. Single-stream non-atomic actions keep their existing
buffer-access locking path.

Fixes: 3c3201f8c7bb ("ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls")
Fixes: bc55cfd5718c ("ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and mmap_lock")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/pcm_native.c |   71 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 15 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -731,6 +731,44 @@
 {
 	mutex_unlock(&runtime->buffer_mutex);
 	atomic_inc(&runtime->buffer_accessing);
+}
+
+/* Gate all linked buffers before taking their mutexes in group-list order. */
+static int snd_pcm_group_buffer_access_lock(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_substream *s, *s1;
+	int depth = 0;
+
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (!atomic_dec_unless_positive(&s->runtime->buffer_accessing)) {
+			snd_pcm_group_for_each_entry(s1, substream) {
+				if (s1 == s)
+					break;
+				atomic_inc(&s1->runtime->buffer_accessing);
+			}
+			return -EBUSY;
+		}
+	}
+
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (depth == 0)
+			mutex_lock(&s->runtime->buffer_mutex);
+		else
+			mutex_lock_nested(&s->runtime->buffer_mutex, depth);
+		depth++;
+	}
+
+	return 0;
+}
+
+static void snd_pcm_group_buffer_access_unlock(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_substream *s;
+
+	list_for_each_entry_reverse(s, &substream->group->substreams, link_list)
+		mutex_unlock(&s->runtime->buffer_mutex);
+	snd_pcm_group_for_each_entry(s, substream)
+		atomic_inc(&s->runtime->buffer_accessing);
 }
 
 /* fill the PCM buffer with the current silence format; called from pcm_oss.c */
@@ -1317,9 +1355,9 @@
 };
 
 /*
- *  this functions is core for handling of linked stream
- *  Note: the stream state might be changed also on failure
- *  Note2: call with calling stream lock + link lock
+ * Handle an action on all linked streams.
+ * When stream_lock is true, the caller holds the calling stream and group
+ * locks. Otherwise, the caller holds link_rwsem and every group buffer_mutex.
  */
 static int snd_pcm_action_group(const struct action_ops *ops,
 				struct snd_pcm_substream *substream,
@@ -1331,10 +1369,8 @@
 	int res = 0, depth = 1;
 
 	snd_pcm_group_for_each_entry(s, substream) {
-		if (s != substream) {
-			if (!stream_lock)
-				mutex_lock_nested(&s->runtime->buffer_mutex, depth);
-			else if (s->pcm->nonatomic)
+		if (s != substream && stream_lock) {
+			if (s->pcm->nonatomic)
 				mutex_lock_nested(&s->self_group.mutex, depth);
 			else
 				spin_lock_nested(&s->self_group.lock, depth);
@@ -1371,10 +1407,8 @@
  _unlock:
 	/* unlock streams */
 	snd_pcm_group_for_each_entry(s1, substream) {
-		if (s1 != substream) {
-			if (!stream_lock)
-				mutex_unlock(&s1->runtime->buffer_mutex);
-			else if (s1->pcm->nonatomic)
+		if (s1 != substream && stream_lock) {
+			if (s1->pcm->nonatomic)
 				mutex_unlock(&s1->self_group.mutex);
 			else
 				spin_unlock(&s1->self_group.lock);
@@ -1512,18 +1546,25 @@
 				    struct snd_pcm_substream *substream,
 				    snd_pcm_state_t state)
 {
+	bool linked;
 	int res;
 
 	/* Guarantee the group members won't change during non-atomic action */
 	guard(rwsem_read)(&snd_pcm_link_rwsem);
-	res = snd_pcm_buffer_access_lock(substream->runtime);
+	linked = snd_pcm_stream_linked(substream);
+	if (linked)
+		res = snd_pcm_group_buffer_access_lock(substream);
+	else
+		res = snd_pcm_buffer_access_lock(substream->runtime);
 	if (res < 0)
 		return res;
-	if (snd_pcm_stream_linked(substream))
+	if (linked) {
 		res = snd_pcm_action_group(ops, substream, state, false);
-	else
+		snd_pcm_group_buffer_access_unlock(substream);
+	} else {
 		res = snd_pcm_action_single(ops, substream, state, false);
-	snd_pcm_buffer_access_unlock(substream->runtime);
+		snd_pcm_buffer_access_unlock(substream->runtime);
+	}
 	return res;
 }
 
