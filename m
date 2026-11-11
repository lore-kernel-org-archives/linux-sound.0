Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355570;
	b=fC0zkVgujb1c+b/xQ5ATMZhV+odj1S++MV4QKlN1dRlger5xryssQUnkmERgOssDSSww
	 KX5VHfftHbrQI1aPXs6xbC5H5w3C+gxpnr0ou/6tQEtH/8OSu4Lq16eaVAGigKmXYZoyg
	 x6YeP5NkrBK/a0Xq2f5YzDsGHMr5BFvnP/1TkeklBFRnA7NL/xTcyw8+HYqAqeGKCgTwK
	 J1sskYgt4QXEkqwgjwNM6CY7BS67B00+PuRghBhj69ciBzJw/Z6Oh7gHlwvTfqr9rB81j
	 0Owfn7/SV9GjmCQlHFT9CZw16SOkyR3HzYbRT6qezI8vkMQXuV0q2SkBuHvhyLLtbTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=MdI5aY3T43Ilba58Z7aTlTWKZpHRHb2ssx4+lAY7LM2tlgmnI3fi5WpRSbZr5B5GsorA
	 cEJDEnZExgxffJ6d+QfufGQ4fsR00BP23kJoxeaNnBnUA8axT/+vEZpj8wa4VaI75Wfeq
	 wqfh+tLfvGxG96Ed1AYj1VX1hnyMC6ALjYqT6rIvNIMGEQfQDI557Wnmn3/eOhG/Eeod1
	 P4JiG/hN8qUoXJGtNaXZk80L/uNp1INcedHeooLMi/FENXXWMQ2oDppowmTPQqdOR0O/H
	 5ZPkYrBtkZZAOrS+drefaL6ClrdreMnOxdBA/a0DJRwAOsfnm/j4/xXy9N3/NGE00YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKampxFx;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ABB60A2608
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20ABB60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKampxFx
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1323784a12.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355569; x=1794960369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=wKampxFxm8nNydEO1UT+cDOg2+NMkwPubI3yiuLWKdQ1hIbrDvZLwEYGQ2C9jbJqnt
         Ly1kxxxhMJRMBQs9gJJ37JPV4yhTknTuWXxPDZ0xVScglCeEl2EqbzVDoKBodmX/53Zu
         wQKLW0UpuOrr2U/e7Hsw2XcCRslwih5Xe0kaxuB3j8eV0jLUL4ZiMLvXb3+rRvI++k0y
         3E0xtIrDBfY3nOILyacGQsolcGsnNh1qb7jT1e614cO3KwiXJN8tgefTu7WkchBtAdSH
         Uw65c0EyA5CBvQpi/IYDgE98NV9UXdM06i9QssYsLA2WFEFnch6qWPV4JEDI9nf4guAM
         e7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355569; x=1794960369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=HP8QGVKdkbED6NFz7NLcCZyDfuZUQWKiejdebfOTbbXRQUFgF8qyxcNuwsX8YfAEal
         ZhEYLDSWYQSko9rJqhD29Iu+zZR/EwWLY1shZ81R5SL47dTStWP0A0Zx3I1q7d3BkWei
         ZYFUrQuYJflrtkb0y96jMFegAhjbB0E45mQRZGoMK65BabRIRXmiRb6byurt+j7oMBkB
         j7wtM64MszRdtUp6kExZyjo3htrAk4mOL9xOMfGVJP4oG6uLnMJIze7XUCT2e/+0y6km
         EsdfMtkio/B/ZX+v2U4/Eotg4j3d8Zt1dd8+MI6GMqn7/ELPRhtl4KqNuFO7+C0AU4Zj
         R8rg==
X-Gm-Message-State: APuU4Z8CDVLGnwLmE9XnfhhcKh3I4H6CFrQXHqJINAjCconemgoPI4Rc
	QYdje3k5oSIq4WQs7HC5etyT520N3E5sD4/vdlQ+UGp/bunlU9eftowTnxY4pw==
X-Gm-Gg: AYBFou1zv4Hj503HOgwyZ3tKEI6w6UN+gXxIw39EVB+G+USM811dfVGGM5UXKQbkeXk
	fnf4e6JzwGipu2HlO4jfAD4b8Wq/lqVQ7Gb4ShJmwYSYD/a8gRz8oR5yAhBRR8mx70QhZwgNuRM
	58phCY42X74TmSDluHII+aRmQ1QyIm8Q4m/QhrApUX1gzWz/sV6n0+0TnBfkNZKfkUj73WHbZ7m
	hD5JGHuBZgb60x5lOVSYOcDH9a99BVuBLoguYI8ZsJ592Y6mva+tR6jwoINCUVJYT+W12G6YZN1
	wGDoq3W14Gr4xL3zhYJGss6RNEIHj6erft5tbq6X4Qq28NozZnSMdna/3IA4j0m3x+fZYoXuQO7
	lY8QJq6K5dycQb2YNeVJfswEQLTe9R8QoHrZLlROjiwJheOigaGgj5mtzQ3kmT3uIFPOMqoXNCM
	/BDPO9Oa0yxZBcgCs4oEFoFhnGe/ioKTYVjx0KxIVuAKGWVZRlzBJjT1S1wVkRI4fsFKJMsOMbm
	Mu2ynmDRtThtDrJgVbZdQH0JKv6ZHM00tp8IFmup8mx3+6vw4rPPhwVQK+Ba5yGBWthqnE/Fqoc
	Mm/QE8llnW5TyAfehRuclEpQN4NbyUsE02cC3JXXGbwNMh0tteyJ3YIYZb+Dzr0OeYlKeqT4ohY
	2mmJfkSo9Ttp6hyRqbfhNKLjBr+buOG4Bt/SFPqUdwf+eqv0EzfyMBf7z+FZgoNhZ4MTx
X-Received: by 2002:a17:90b:4c50:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b182efdd53mr527004a91.17.1794355569317;
        Tue, 10 Nov 2026 16:06:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:07 -0800 (PST)
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
Subject: [PATCH v24 05/16] ALSA: pcm: serialize linked buffer actions
Date: Wed, 11 Nov 2026 09:05:32 +0900
Message-ID: <20261111000543.28550-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
 
