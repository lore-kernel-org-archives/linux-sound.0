Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464712;
	b=cqoE3+3nZ9Z8xlZqQR9sSaouxG0p1wVIaHbH/VITqPvR1o6HasxzKbTouJ1ddkaA7uvH
	 BuMCtysT+SOz2rExoiZsiY2I/3gEX0VqXvUsHfuAhJpqruhmzJNcPfoYnysjwGO1CQUcU
	 fM9w1OKHiourYyEl6cQ/nPIrtwgg6atp9jVC/poxXO9lE8hgtMmq5lXuLXxP8m028w+Yj
	 1qWuNKpQR4S0kYQ0mRbXdMoQWZ+oGfIH7tGv8YvOPHddkTCXH8oCh6YrOpswD7wBqF0kQ
	 kSylG3PaTRd3mMbCvKvqGPJW8z/LpqwBrOKQz6vx6to+0VZFRU0jxlxIutitOwWfKaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=Vtk+3MizjDz0CM6hsvS85GN8l3aHePzsFF2rJwEjbRQ9M4bUZsmzH4ow/Yhq3BuLe/74
	 gYE3OeOh4MjOdNuPfkGkbd0RZPJbkGSPf0W9sATWXM3FZN8TTFiOE1XXpcNLum8IgNAN8
	 pxUuD4/LXLu1CJ+rFYbkw13eiXh0tRr3Lqok2A5Wr1xdM/l+2puGWzeKcHg9VrqjrJ0JV
	 fao6iQ5FobS/e+ckcNMvRW4QJYyXr657Y9IZgVM4KwLKr8ChPJiOgDRhhg+JIZkkVgH08
	 y4TBWPZXNoTiVIeRpsR870wcQD6gtPQBUuUuA4yf0UpQNUZubb5LwcNPuKBnHR9hvEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GczOJfSt;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BFB606A324
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BFB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GczOJfSt
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed08b07213so15763295ad.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464711; x=1795069511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=GczOJfSt8xyq7v6cN9citRojAsltZCu/O7ZUOCf1uoFDflyuIACplYy8u9tNUQPbFg
         n95Q3XREILPjpqrfoPylpfCKbdJOzVJUuO/i+sC1WkFxN61JIF5/n28PZlow9i73ARHZ
         fTKbtYbHyrmsb2QHCmVYU89HtJnqo/c4E4b3f0LGJsfRK/rWFBPjiVpY/wrkf40AUCzO
         4mceO/LHRgTTH6tc4GO+s+VBHaSbisIXF/dnvBEhj9/2d50jZi5nwoZj7pbS1K7tzP9T
         xPeYSCOMUXyidnLOqnzoFaKkLgWE2eYjGUgRil3IMehYNZrlAQpzw0PhoItZkEVSX2Gj
         NE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464711; x=1795069511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=ae18/8s5lTUH83PdWWAeGMo1+jejDcxAt4Hl23/SKJITMACEz1WadPPduLTv1JW9Oi
         hMNwWG3JUZPQonkLBR4oey3SZIz4yTZIJ1ZEfHr0MeSNtZhLuY3KzeFsx/vcp6kPDu6V
         8xqfSqJeW1csW1byidKd6rh/gh9Q7SBJvboDd79ENcH8ryn6YLyzBji4NdBdWHF75XKu
         qjMCevh+NIdQPMsNofA3CnY5K2vMPxFRgy+S9miQyzsJ30Kl9/GteqqxzbvDUbtnXkb1
         r5jftj/x+wMGbxFd/ScjISD7iQnblNVurlXsDbMp/2/ZITmqdmG6K4DWirLYhKuCfODq
         jpyQ==
X-Gm-Message-State: APuU4Z9WoeUFk2lSTd2SVbvorz3KSUwjcom4E0T/1Cz6DGQO75IoI9FW
	tk7UxIGXXPSS4lJbyB2RZ1dhVUZodxgtoNpQ3mxE2M10nuIe1YbZA6MKeveQXg==
X-Gm-Gg: AYBFou38vWahfRHOgloGXwBHvpSWa33EJVHLPEaLTPLOoSdfHImOn6DyEHuiVQeNbW4
	dsC3S2e/Im5UHOM1RQLvPSwl6MNrHQT6LbSO0BMKOxDIlfysxIdsEo9vN/U2Pug2AWsXn2U0jXp
	hICT21bE/myhyPy2/8fqGND4b9Hq9gaERzsCvAjxOdHjVwPZtNDzarAZo5giExzVgOF6RrAZDHt
	TaWLS5dOT9VLbXCwyrZyTniB4kOSDLpYEAttI2oS+Rn3BSS27OVpfF6RTApqmBaR18w0C/QNB76
	lzUTk9JaC+0Wj93t1l7ScRr+kdPq5Ah4z0sl5vBFJurGLkzk6xYIVbf2a660S8+yUXdAZ42nmsi
	Ew8R0mDZfD1Ob04U1gVOIwKy5e9EPBasuPaq8xvHbrNqEQNV8YemiwKiTl30dESVTR0Fb1Vx6L3
	uzqe/MXxUacUazdiHz2Ipsh5CxlsZva1yOXI0FMRWPblzL8lGuKG5vB5BWGrrOoec+nt2cKS0P6
	Qy787ruTfRsZhaP+RrvjxkeVlSxLCXQBMkKFxStiOtrTku+8phV9I1gzrzyz5xeUtnuBqM+BHrk
	hvZpj/89mS9TVv9ZgCfWJ2umkXwPtRWWT6U/44oS4yni3cl2mBg/c0YVt5fDXWR1Me5jvvesu6R
	earkdxbLgh1KcHXE1a7zFVszCuG7lRKZPmHNGE6vYeRYgTCY=
X-Received: by 2002:a17:902:e54a:b0:2e9:5ed2:c393 with SMTP id d9443c01a7336-2edd7d3ae55mr45385565ad.60.1794464710958;
        Wed, 11 Nov 2026 22:25:10 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:10 -0800 (PST)
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
Subject: [PATCH v30 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 15:24:34 +0900
Message-ID: <20261112062446.159-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
 
