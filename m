Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444449;
	b=jqApmPQv4kjb7GUAeVZHt0xBinz3rO8C/fL9WqzJssh9gT3MM7Dh4EVInskq9UWTqkI4
	 NlmGGnF5GU6c6EUUIUeE6ALcRaVqeKkdi6Tyd0A6/UOTTmcuVfMWYN5uklbaIVOAA2rrp
	 9ZnH/cO4GQAwaeRk2wNXUadfvHV6ErJt3iGFbSd2F2C0iTxKGcVKzcG+CFKQXHzyGrkSi
	 uG1mbrtkDardxyky40LmkY8glAfzDkC6sCra9Lg+pNJY+ORT4tDRqa6HOlngHycO+0ol+
	 oNIWD313nhhskOfi7eisQylJXY6OcO90vlgv+zpYokbLFXyQkbaQQK3HOoYMw9kpCgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=I226mEpqzwQ9Us9++LwrGU2AbQwGQngetq//7PkqYXwFae9cWLVpS4Unv2AcNXyRvxcq
	 aloxUjFx292wbGnilbsspWkBjf/6rHcmpgl2WY4HQQPzU65LWeckDNMGpf3UC08Znnyuk
	 R9FSLo2eT8Rp+U+bwXOQScBUEVu2a9F8972/bXpnJf77wWx2G1RNWU5MwmxYC8dOAowwG
	 xHK88UcfgFkqK/zkrnmn6GY0Yk2wk8BWTCndHwP5gCS/ac1lE/+b+GsIAemJQMpLsO8uK
	 dxI649wk6Rr5PZzP71jLJlqEAwcFK8EovbI+TRyHGY+w8sJmqQLqOsyFhK7uPdEt0/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0hxkjDb;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AD460A5BDF
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8AD460A5BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0hxkjDb
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so5704263c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444448; x=1795049248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=M0hxkjDbCM9QdAjrUKmX6TVBJCBIgPQaPoNbbqY4Fsu2xwnrKZzDtxwoD6CqSiojGW
         hR0/bYMj7ueCrBfQFxveaxyBkOyyU49/Rd3tv74LQr+h0RENibBZXOAXeVO7n8HdxMaE
         r+wj8HDNiQu/WicpREqZctlS6yWi8p8rrkbp12KJVjO3HLWuxGEjrUU9UgpNPNoCU27f
         ohdSJrv9nDrdIpToTqm/hNSj+wv/kcsW/1VeLJaj2HVwS2Z2nOv1MruLrx4xEvZ3OVh1
         L3b+S9hha1BfN5XzJfsrnha7idgr/sGwceXY2dicFAN4lLqA05KxqsgtzGpPpkjEg+EN
         hLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444448; x=1795049248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=PvGa2l5/eGbUGLYDPm4TeaPiA+FpFJgFmp8XuFfWX0DxexYiythzKgjUFSxayWwvsb
         swkqpvJuPcTaK6J0yTSMY80fAQJFHCab6yYQUEnm0697qsESj4BHvq+4MnKqMXvdHp9a
         4c9vMjMCMSv0DeAEDtgaFZ0c4Uw8bog5QSRkzvj2223OL1E+wNn4sMPH25ybEyq/IR8j
         Fzd8HLvqpqXGE9ZMc4oKL4pnSNs6s1x1Z1LoKtAUqY1pFAfyb0jNh0CfcVNdAHTu+rEU
         Nq5HK0jtALlIt41u8tIXDmF9ZYAfdiqWi9o5BmoRZVhh7z45tGBF22cl8ZWyhZ95h7fa
         eeBw==
X-Gm-Message-State: APuU4Z/nR9iLkFXLMwekL4iRTaJldSZD5zIGwe3HyAu+cc3QgNPwTP68
	7L5yoRs/ksHBwNy4ablzh/ODMTAsB0yIXFTeQPx4Vev+e/ReT2YXQZZQ5XojMA==
X-Gm-Gg: AYBFou3FAdAnOoz6gl461Dftxg2k9+iRBoeORe93DctUC8HSWEBbqj+h63XzJNG2f2m
	vQS1sc8B3ROvPnTOqMLmF+hkUm0V0DMjndbQ4psuhZl9QkLK4nzMs94iQyBHwLMsQMIKgCCF/vP
	NA3lrYoXFW5/YQX44gW+QSNTAnvWiVWUQR1u6iFkGTRvNA9T72EAXD8u9e0t+mriY2Iv/Ggs8UP
	vJWujb+bQ1bcaXQQPeaIfe/aEBu77uhCCZX4002LZYTrs9Qcihe+1kTnTB06uu3rWWPGVjGAFfR
	CRLzcfsrVB52QsOnt+Fx95VCCoR4opKt1dcHMbOYYyQ/Nmp7pFnr8PhBS6vqAhyRH/D6R7BtV+d
	8S//ux3AZ0G3iPTHaAV2E57ZEHH5se5GxJ8H0YuZIo76JUfRxHhlmpNHOst2160n0D7GQ6t71rw
	LXn2Zi2a31ZKWL9Ko5wjH3NGbulDiOJktpKkUUnP94Nr83qwgsnLmvmiHnuuEOQoPRenlbQpMzR
	oxI/kiOCmyRf6gIk/Pa39HkbGnw6c9GyteOlLa4PZAI3rwovxtNxCndTFKT6o66N6m6FWA3951I
	IImY0SjmXCedZH5sLCpWDvQ7TEpaJA8wx+GMFW9nX7BfCOUAxeSDIynO+QpReL0unsCv9CICm6/
	O7mrypmeFn00nizI0ABrATdaoloPCguS0ulEl2Oguu+3pfoU=
X-Received: by 2002:a05:701b:2608:b0:169:bef5:f445 with SMTP id a92af1059eb24-1b3c024096cmr2938338c88.4.1794444447838;
        Wed, 11 Nov 2026 16:47:27 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:27 -0800 (PST)
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
Subject: [PATCH v27 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 09:46:52 +0900
Message-ID: <20261112004704.49758-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
 
