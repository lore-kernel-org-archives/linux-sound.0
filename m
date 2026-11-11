Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365841;
	b=bsQcWGVGv6zR+JQxhXVcrwsGIkRpENaIRLFUegbsthgpiOxyd6ftcX8wkMbfPPfwxrl6
	 WeltdVh7n23PfL57/NMBUWfpqDdPhwIPi8mRnsDLFyylLoXchjrRRoHy3azEEeVM6mFQu
	 85tXG5kQ1WCZHiEFJ65SGMIzxr57dFW0OXbJZgjIAB0kllhHjbJBq8CusT0FP1JqsF8vY
	 oIF19917Bwq1XtCbc7FwbaJuQbB+mJyhgGC8/XgEgBR64Ig0g131QTqN13JgXRlCcAUUH
	 6UAN39jWlOzqQtmPtDcUE0bvFlpvH8VbjKqVwI4aGNFnd2OWNrBotb/Nqn8AqeqsvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=wt/m33z/e/cO3sUppUni2vvQ6PxmiLliTjSnZTaAOETG92QqnURHD59hjcLYyMtA6LFK
	 dpv24WPvvYQg09Z6B4+fWIHHBJibQkeS5vkcbvDWM0lRlN2xcd3FvpovyRyXBQlfgAbE0
	 7Il2qCZnFNdD4syojbQnv9WsFosXbbDguKIa1q434TrqIY4SJ2og7NChiSU7VOsQ/vtsg
	 EMv1sYRCBhD7TdKGxidxizr2Rie/i8K6n8onH/KI471eqEDXShoegEXsNlNye2FFgf89F
	 QjMhlNdklu8cL9vuX42q7OovqWEhchlNumXw/IPhFAFTskxu7Dmcso8l7RDHh5bLwjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tB1rR9DS;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4F606A332
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD4F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tB1rR9DS
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5555451eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365840; x=1794970640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=tB1rR9DStkQH7stPleKYGokbMJ8fXokgsFRvcr7eDPYByC0GkhDKkK61QmWqGNQPpv
         qe6fbDbTO/cbAmVoJGJyrTCD70RtkMzTpAVhOmlX1Q5oT7L2KBiQWbkUjP0ACfRQx9L+
         d7YxQSQJPBzOmOn3F4wus4cFloJYvyQzHyvOP5IYieLGCu40yj6BRkgE482Kfp6BXZPo
         wO3rCkzCZyCjSGtmlL80SBntCmhKAusV5OPfxaOPpWEzSov0VaEejYoJ2fDtE/oidx46
         pyUkf5fyeYO5Qjm/IDZnrXQQD4EPsJhYltNsHu57ZHfrhEYg2PizCVbivhdzMiB0QTn2
         AZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365840; x=1794970640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=RsmxOUiyWzdLZ9IjW5K0s3CZMXJj2A14TmA8PoP435I598kxJlHrLu5qzfwZyxExCF
         FpiQtYL4dSThYyOufBVGHhiQkGldC3tjEgTpusiR/U0SrwCMMCW4kYLbEJ6VAWRESRzy
         Wki0B0h8+kzuakFX5voaefPSwhzUzy4UA8NKIW6UKaXj7wdPJ5W36GJHVokrv7RS9zoj
         RO+a4YaSFd3dSsssCfGpfdROYBzKdEF0BjoYKmwimFlYFOOYetuTx9/Jk5KjzZ8S4PWA
         did1Lx2CJQiXnnRHcvgthygJh9wun9wop8w2YQw0dFZAaXRXRXyeHDLcRV8INsjD8d5N
         AHpA==
X-Gm-Message-State: APuU4Z+sV7Gz/9RiwzCnMVHszveEKuL2blAr2dHGuWI3xsQ2bez5o6S8
	ywGaxROwfOqhgM8svs1/r+S/cg0QWJvMjCOG0Bn1Bxyx6dPJq8K7fQFQs8fNQA==
X-Gm-Gg: AYBFou0UhsOxHRCOhRG49cK/qdLEZDTgiM9KzYcnw4/bu6/gLyr3BeJe/3DNGDRC+CH
	ylkeKmaUGbueWw08rneYsr8/oj8K9HjpC7u9z62niQgJi/3/ZS0vqHn+rYsdWYPr8KFek8UbOzz
	6XY/7wETX7DTvj6wsOMs8Ao8RZsv1mADyOCkC+rBogC8Tu7KiMgJE2SLdm3CtewQIj5pLn4yeq7
	TLxRAgTFKvF7JkT7Dfe7P914J8KrsZc8cXFj5tFPtJ2n01hbb0o08DvGNynJ9OhErh4UDJvZIU8
	CuBUvbWku/G5tkmoLHj+MsrSmUJ60yNAhq0FkDJHVPvktceMC8Bsnt7vdHP5e7QdRXi/aywlgyG
	hp3Lo+2Pz0NEAeTjvY+PGC0dSWVQABCbootZZC5RMQF8ZbDhWeaavWkX4RJEnYKcgktgitt+IZf
	pRxogkhazX8LpHdqapGKSe24U+1aT+L0PPRAn0k5spLemRmimUBV5Shm98x/k+L69toDzwdeu6j
	877Cm6O5N57WPl+uU2mJ8g3W4wBhaGL0vvyFBMhmQqvTaukh9clRQBRu9mqDJhxAUR4eROnzpal
	UGw1eQj495GYpbG6wfIfp3v3PB/6wL0kqx7/g0LnvxgquxKkTe4rnfIbqMHHm4w9YwS7bstdfuf
	rkBTpzKBLFVxCMKCXXIYCGnfq9Jx/AVIA8NSGNOFBDmIbHIC92uScfNOVFL26c/AWOG7J
X-Received: by 2002:a05:693c:66d9:20b0:376:682d:bf1c with SMTP id 5a478bee46e88-37686b42abamr1754725eec.41.1794365839352;
        Tue, 10 Nov 2026 18:57:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:18 -0800 (PST)
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
Subject: [PATCH v25 05/16] ALSA: pcm: serialize linked buffer actions
Date: Wed, 11 Nov 2026 11:56:44 +0900
Message-ID: <20261111025655.63951-6-mynameisjune111@gmail.com>
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
 
