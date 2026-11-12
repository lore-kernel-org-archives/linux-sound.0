Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458140;
	b=p4wLjMs2UHO4N5GD/Fyd+JkmnLeOCToOTkoVGblXi3+/u21IBzJirLhVMwuui7RaJ1vU
	 jR+mc9U5kU7MYr/vB11WBADxU4Rn/QGyNiqYBTeFrpDYJ4c65pCfhl4TuFMjEulINlXZQ
	 Awr27ak4/ptUjMsa7d4HnQgk5AAOWFZeEYq+rWRE0ueVhrvMxvpFiFryik0vCsSGB267B
	 VYdbvizv0Ga+0un65Ynu2SNg1FutaS1KdceD4LBUGLctMTgagtjEzIZe/kav8S9AMtrsO
	 lOhRV7YdWQeaVlHZ69OORkGDeyGkHPQlXywG6jUoIwFtSxOUif6xHBK/CVC6PouJk+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=Tpb+hgmOARKEm/9PN2CZublKTpiiQT+FGLoIUfqBDjl2WCuf5IwExdr8zV0FKU0aSgo5
	 9zXRLyR7pkn4dUGN8ghVsQdWUbWF3139OdqAVWJwGrAqdw5NVfrgv1BOB5t7HHMxRYmrD
	 vQAdnU2U+P2BzEMa8k23oHhZfHJawrIhG0xcNxNNOf0CXEMDb7mZjdHoxDe6xLJ5AzEDv
	 KK5rKIfgDMS9ib7YwzutbE42WbPs+uVlUJNvh9p/rgeVFMhyJgDeywS9YKgSDtJBe29Bf
	 eG/rIV6yEUs+HjEp72oQcsPt0aN1YuOjPBAqnb5GtYHBGDON5OkkLzmlZRQpA/0bIrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSXxTDnz;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A960A2622
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 125A960A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSXxTDnz
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so3016841a91.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458139; x=1795062939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=gSXxTDnzs9Yz06wkBcn+IFF0WcM3FFbDJQL5Lv/dXAREROLiRPFk0dAfNayGnJo4+G
         L1SADkmfSes9JM3AOgAoXNuOFvHLuNIF20dm/hosk7frjrVE78HPQJmOgIFZ7aYTRuXJ
         Vmiq7RySgiZq6PfzagCedQIVtS423eQBuxmVmLkTja7ehGAak610JxUv67i2Klo9qy6J
         mfiCYVEcpfQOsLt5EcGY0LGOjMdk4BXJSXMbJDI+ZwqDmLi/68Cb44eOqFiI/O8IbT5u
         hGs6eBKjAbWvdlX7eX1beT92RXo/L9GJzx6wkz9OmKv1+7s7txo3+8xKHnbPYaRnUE23
         uGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458139; x=1795062939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=cvJxJ6AOWR437WnAvF2WozrCYljJ7yFMjf4OQGszT/lqpFbW5+TyvGChBkRnHxYN1K
         sltO2PhgAI14QV5wAdfzoKnRkn8vILqOcfuT3pSefT8VYokdUW0FydIF4vmD8no9XmmV
         mKE1iUIhr+shxFmjJO5Rvw9+xgpLj+RrbyAmUFrwJrjqdAu/BCAqTHp6YGkkv8FHUVc7
         ZWPrstU4uzK9Ux/6NVPos1EjjzFfSHsmob0B+pT2OZnUeOJbt0+X79GoYnRQsDP8ca4R
         hPGoPBZTOVqP1clcSlUVFEiqnIpm49tH0pcyEav7iM7X/wfMvZiYXAzKmxrBM5z+Qzta
         YsLA==
X-Gm-Message-State: APuU4Z+KvECjfqLydwFwDH9XdkG6ofXwWIqyD3zpy6Oi3B2M40vNKToZ
	o7vdYI/N4RoMB0psT/MseKH00cCW+/5BwGizu/DDG1ylBduFhldvve0f6vTi/A==
X-Gm-Gg: AYBFou2vVFv89R8BTgKxo2vlz6K071l1Ac2BboJeTg82FN2xpjE09KlPuuzrlOgUlH5
	z4GOI1ukSQQwO40dH2IAUSk5xprHz7ByJnNWIA793ka6miRaRC02vwQlnHGJrySjfYM2XBSsqIB
	kpDi4cHJsBvybRj1COjnCWWn0WI0BS/RyVlMERDysTSSCwnkGsvJ5ar9Z8hr4wwzga4nkyzR0Ct
	gc1zOYk5X2YJEUZo52UKz7OWKkIMTF8+3FR97AfN28bMhP62LTGpVyHkR/YurSktlDkVSJgKZzG
	E6qOR8CkSjNbJ0rpI4O3CeMYyde49iIg3r7IhJbUQXtOQasnCvQt2p+YRuprJBNlJ2VNebcjvjT
	a/nKd1cWflgfF3FgQ0+aA7QW5A9b/eHnaB2oFrtnqAvL7750ENWISa27LgqttXDnbnxTi/fZwzw
	Slsvb2+NLNq8sH9TQjlKtb46noKRqf7mDF12h1VjKuZ5fWmmR6Qeg3/O0WwmkNUk/IbA5DpW4Ec
	GNgbHgftnTgM+EosX8nBlCAqufvy9mXPcDqwDcax6pwKOfocKm+IEgw0FggM90yV0TtzyBrOeg8
	T35VHLOEZRsVcMR+km7VZWWHlnACT4MBJcwhcaQ4G0Afa8RUK+U/hLuqHpJgfOOQ4iwGE0vGpNm
	SAGN+Zq68lTbkqBQmeG2S86zmITFWIYIEtCpeLMwq1N9JH+s=
X-Received: by 2002:a17:90b:46:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b182eee78fmr4576779a91.49.1794458139239;
        Wed, 11 Nov 2026 20:35:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:38 -0800 (PST)
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
Subject: [PATCH v28 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 13:35:04 +0900
Message-ID: <20261112043516.37010-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
 
