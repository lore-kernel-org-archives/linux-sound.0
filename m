Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267673;
	b=fv8E0sYtsj0DMJXPL4djVQLl5R3qPVVHcCS8qfQ4p+mwYfkJfGV8SGUXbCasXZQAsmbf
	 Z0tpTU4S28MOfN4ehYRoJw82CbIDCpFJISpCGW/Z9eAq2ibwAoteRCX58aaXft4NNjNjv
	 1bJP/AqiKg5mRMvegW7P1DdR+oePgPMCUyUd7roi12vNrzvXSuREizqUlTM4YSZhVw6EH
	 UVcPam/A86EptUaS6HDsq24ZO/Ddt4XHVsRH0Bjw6Y1dFg44Xwsz7MNci15H1wdMumA3d
	 6VzF7ZU6RLEYwf4srW88xz3QZP7t/Bj3BVVtr1sdBDUVZROHswdRSiAh9nUUoFsXxog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=CBMZqbAAxwD4r75ovwp8m7gK37Tc/Fy7f+knlXEKhurDovGbm0vL+fO6Maam5jdnwUD9
	 XOJVZUTqD0b9+gOf/xM6OJHBEnEIEo7RCeKqJuqng0cRIMwLx6BCq4pL1a00iUeZ4j7BQ
	 WTYXpJQZdJxx72zS8eKDDBaBVEVkFTN3Kn23/CXNCWbgYgi7MjKglftHjD4php0cmvdag
	 /v/PCJYbEvOKP/idRJCSBGJMVNlIVV/jRtXcNWTv48otik9ACZBNntvtC35Po5bIPxtVT
	 aW8jTAA0YZ5BkfRfQNH7RaJXmwyKfpltXk9QKH1fo/ZVV5Asb3NGkGzjEmV7ARvh9gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXj1N3rr;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F16760A260F
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 23:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F16760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXj1N3rr
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1931ff67a29so292933c88.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 15:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267671; x=1794872471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=MXj1N3rrC7DuGvD0fPuWvQWGqG6Kacj3wlLoPtO52/Tri932QRA2pKzT9ML1IxV7T1
         6Ab0RK8ypjfzDBGFB9qz6V5ygmlNQO40g6fXu0BRv0Y52OXWuzPwlOG/1/llO7FTEZvB
         qU28wGvwWRGKRsY8til6p20hGLFPdPni0N13L1M1O8/O0RIN5moZiSRVDUnwAFj+OOMb
         hIhBy+3sjl3mSDenUPS7RWyRZfsOVp4ao2ep9tmXBc9qhOkCsMbrC+q70eiDaq1wN3l5
         2XMzY2q51MYj2WEks678JNXQCX6947/g1biZrshsS9e6BoOm/XQiodSfjrJ9RUzWOAz8
         PgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267671; x=1794872471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=vPOVhUHTeYNGfW9cI1Mb99q8KPc5oQMuVHxOWqvnvx9t0X6WHeVZr9DokN649KvxUD
         xfUdyLbmedGGGeQ0pHmRwHLRgZ0y8hSaIRhWGqiEu9ltH/gPR4758XGOiXYcabqRV9Gm
         WpSfTqp7kJIjpwYDs2vGnw6j5XjqSvD6JZY/Czqw0m/baEBpm6wQcN4P9CCCM3Z+7i1i
         9aMQR8xNHE8PlRS5mCuJCE2Fq0sMyIhOmYsOFROmPj5rXbnR93/SCevYhMZTMM8yYa1T
         Uvr6twIvMAtCgQO/0ycEZs6gsEAZ5wgss52EHd9KIK8uKIucbwu80mKoq+vj2ZRvmGNd
         dkUQ==
X-Gm-Message-State: APuU4Z+jSmXvngoqIOQyHUjJt13y5mZ2QW/EIeGs9qyigxkXI2mfoQdm
	M6YTb94ex5PxFdshshxf6yhjif5g5R5d9pcjio7O61yHgfbwy4WxnBLsFvBSmg==
X-Gm-Gg: AYBFou3xyERLY3ia3YaE3cUbp5SE1NDub1aU7kDrhYGwgmS2xjOBBUqOJcoRquCTWE5
	IjifrJ3HQRw+qQ4/a3r67CIbuHq1MDK8fXR2XVK7vX+HvakM8pLUsxuZdd21qCQlEMizk3vR4qj
	xF+si6/1eXu2ddS0arpU9OtPMo3d/v4eRI0lvN86+/DxU4GSt43y1je0/7uieCzrlIYeAEhrBkw
	0QjoRpF4dT18dNhgeIcC/YEJN4oeDt9OiMhX1Xe242Gt6/PXhY7AFMzp2uwOo7psneHErE6kfUQ
	Cg/soHoM4Y1v0g9wAruHKZuMCKk9qW8Yaa1Pq8IW9zmwzI1AtaHPAY8dazmqMW/ioy+TI+450xU
	pl8EV62iP9VRzm7eNbN10Z+/fwa2G8atdrKYQTevWJcRe2Y2iJIuhaM9WCQuVLz5OfvFLVudbfc
	S6IImwxtLCKzogeBGS6WVCQeA15CdoZiEqkAbv8kNpyy8X7Aupw+vF9pypIcVWlNRiXg9xinmpQ
	ZTIMbHK+QXCHsKCe7WO/Xepw4z7kdGlf2tIQazTwLZJ2SMoKuMikgRiKAIQ1da2svDEdE2Px1O2
	b+c3xOChWUv6RbPVLL99AuTDzVyUwE3XCiBRhaWwatNpZNyff24eDZ9gFKxQMO1APBoCArxSx/Z
	csH8HBAmcWidrS+2zZCZHIybuUbX2C4Gk/cfk9gzZcLASxmQ=
X-Received: by 2002:a05:7300:8186:b0:36c:3b8a:8089 with SMTP id 5a478bee46e88-37520216bbcmr1562365eec.36.1794267671108;
        Mon, 09 Nov 2026 15:41:11 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:10 -0800 (PST)
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
Subject: [PATCH v23 05/14] ALSA: pcm: serialize linked buffer actions
Date: Tue, 10 Nov 2026 08:40:40 +0900
Message-ID: <20261109234049.79534-6-mynameisjune111@gmail.com>
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
 
