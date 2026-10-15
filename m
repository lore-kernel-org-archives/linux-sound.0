Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A22D2D12ED
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 00:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024572; cv=none; b=IOPlE8+TdjFxYA6iNav84L2eSjqHBWVneReWrmfpOUdFRqyknqOIwVa1XW595m/nTgptof/xqZKuhjBh91hM8gsCKGqc/IiiHy/U8e3FEBePKzD2PNqTOSk07UK5GdSwgNKR3sLTQHeF5RNjv4pyOzfIwZ7gqlNHrGLjNSOhSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024572; c=relaxed/simple;
	bh=PT9ArUjUozHhUUTYiMZwczp/mL27AYQ8/pAM0UOxD9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmZv6YLzBqmOSN7BmioU1TK6+JEBuVHBnHDBw8ddOwx7D/n7DlUAHgsfGnLZvfKlUZyY5YGtaPXe4qMa2PoMe5Ztzg2ggvLQIY2P76k/jwNPwqrTOr+0pgC0LE5i2rvaVDL1JcuFAD+uPShI95uR+d8dyzYvkiQG4f7z8AF2sNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo4iQtam; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo4iQtam"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd60d155070so738444a12.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 17:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024571; x=1792629371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cQYVQp3cNq+IO9sRvJYpEZ43wUtWXqrA+QLO7PX+bJk=;
        b=Bo4iQtamKZEss0aPPv1Vejqy69BgsrxgDctwYE40z1yYgUo7oaAnhAP48PyDglhEKh
         R3+y6FrnAIMDkF5wRfBVhrRboSJmE++9wj1qw8w+/kAhtsV98gnorHrikNoqfLTT1XyL
         fI+DVZ+nshXxmktHtD6bCc9mxKF7Dm2cLtHsNULCZAW9Py2wS3APZ/kEw579ycYvKAHN
         kodNd1Q83LnL+Y+WNzhfLk6EXyLae2asqHr/LxAhSsplpqdCNLhoK8bR2MEgVkc5ymUw
         xsi3aVfnpEq2Zz7ehEdzLdvcivhELTbWZb2rkzOroTA6/pc9Ujjhs9vAKqipTArDHgfK
         aRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024571; x=1792629371;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQYVQp3cNq+IO9sRvJYpEZ43wUtWXqrA+QLO7PX+bJk=;
        b=ZM+iiYWNMXH5kNhCHhl3SKfV+Yu0B0hQr83Cp69/len/FxbxcGB5VSq34AZ3WH7njg
         3z8fcpSquaeP83+i9hD4Cytk61N81jMbJ5+g9eIVxF462HjrSgzcIiwXLm+Ufw68wKtE
         OkAgu996+2e7vL7xQS3i0CzsmTGICGY5rk0wbT4u6RDyvp0RXYRAUHh6/9yi9f+VW5/9
         uNJR/SIiJ9JspXtmY77r0osPXK1IbQTuIG6q0CcAEkRz7g6PXj0yt/Hq4LEwLYvsY2/L
         LGf0vbNmXj2S9CddkDgqLOGCL87FlvVpLAnelRk2tjR5AOQ49gFmF3VKKcJBQ0ExLy+J
         UeQw==
X-Forwarded-Encrypted: i=1; AKwUvByg6kxLETRfgAgX7RczgoqjSdH+JZbCj0WorLZCz1hEgnn3B8qVaUMl5vEOm3SucqhPjS+m0Kud7+Na2A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZhhUzhWDUKFFu0VxSNcQubjAJcdz/ysLjDRHtsV8Ni9GN5QHD
	VDv8C4dLrqJB/1HfHJzkmnBoIf8G63WwNsB2YgoFILX0ae+26uo7qQ92
X-Gm-Gg: AYBFou2Fbpwot8cP/cJadK3gebjCEAwEUHN5DL8ieecKqpXazlTewsLRpj+Hh/X/iuy
	eA7qU+IgEoI7+SD88+/+Dq0q0YYJYDsYEzgNQcg2MjJ7Fobf3fljXkp9qfFNdZHi+fxzIkrMo2Z
	p/7M9TLLj3fDBx3HxA0ZlK2jYTfCssKeJG03i/RwRkq557lekhLk3INpvN1KPmgEnYQJPaIlsTC
	M8P5j5Fp33dGVIg2D7b+7Dgl+oNFIEty5HBqrlq6MGEla2TCnxwBQ3X7LnUIdGOLmx5EW2Del3J
	S2Gj9VbcIQxBe8VapxfabDLKN9ZdeOzqf4bQxG0QkRv/iN3GGoUo665NaLvtKcRXPTmjo/pJ7Wb
	DN82EpSavcEdyZ675UCJj7sdFCqv6g/OnPrftRaA6IqsDmiVrnyOQg7i4Ktd2H5GCmN4ZzipK5u
	zgXSrOaM4eKeEWzK8881faZR4QS6PO+Yeb6DwyL18U4wLCD3Mk4s22Is3xKtENRPZckYDf1Kkt7
	cVpdLrQ+GRQDBfE4Y8oowS0L6DBtnNovuNd+rF0Oq0lXocWnkvsO210i/uYBc5vxcuAnGDpF1i4
	/Phh9a3c1hANg8/b
X-Received: by 2002:a17:90b:1d4f:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ab3a954001mr14475363a91.30.1792024570657;
        Wed, 14 Oct 2026 17:36:10 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944a9365sm1651372a91.14.2026.10.14.17.36.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 17:36:09 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v4 1/2] ALSA: pcm: allow capture reads while draining
Date: Thu, 15 Oct 2026 09:36:05 +0900
Message-ID: <rfc-v4-core-capture-drain-1.b56779f7976d4657@gmail.com>
In-Reply-To: <rfc-v4-core-capture-drain-0.b56779f7976d4657@gmail.com>
References: <rfc-v4-core-capture-drain-0.b56779f7976d4657@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Capture drain can leave buffered samples in DRAINING, but the transfer
state check rejects reads in that state. Allow capture reads to consume
the remaining frames while preserving the playback state check.

When drain wakes a blocked capture reader, return the actual available
frame count from wait_for_avail(). A zero count would make the transfer
loop discard a nonempty tail. Finish capture EOF with snd_pcm_drain_done()
so the state transition applies to that substream and leaves a linked
playback stream draining its queued data.

Allow capture hwsync to use the cached final pointer in DRAINING. Capture
has already stopped, so DELAY and SYNC_PTR(HWSYNC) can report its remaining
frames without another driver pointer callback. Playback retains its
existing pointer update.

Synthetic atomic and nonatomic tests reproduce dropped tail frames,
linked playback stopping at capture EOF, and rejected position queries.
With this change, a blocked read gets all 64 tail frames, playback stays
DRAINING at capture EOF, and the queries succeed with no extra callback.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_lib.c    | 16 ++++++++++------
 sound/core/pcm_native.c |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 4d665b4148d7..e8f6a9da4a4c 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2009,8 +2009,8 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 		case SNDRV_PCM_STATE_DRAINING:
 			if (is_playback)
 				err = -EPIPE;
-			else 
-				avail = 0; /* indicate draining */
+			else
+				avail = snd_pcm_avail(substream);
 			goto _endloop;
 		case SNDRV_PCM_STATE_OPEN:
 		case SNDRV_PCM_STATE_SETUP:
@@ -2208,13 +2208,17 @@ static int pcm_sanity_check(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int pcm_accessible_state(struct snd_pcm_runtime *runtime)
+static int pcm_accessible_state(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
 	switch (runtime->state) {
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PAUSED:
 		return 0;
+	case SNDRV_PCM_STATE_DRAINING:
+		return substream->stream == SNDRV_PCM_STREAM_CAPTURE ? 0 : -EBADFD;
 	case SNDRV_PCM_STATE_XRUN:
 		return -EPIPE;
 	case SNDRV_PCM_STATE_SUSPENDED:
@@ -2320,7 +2324,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	nonblock = !!(substream->f_flags & O_NONBLOCK);
 
 	snd_pcm_stream_lock_irq(substream);
-	err = pcm_accessible_state(runtime);
+	err = pcm_accessible_state(substream);
 	if (err < 0)
 		goto _end_unlock;
 
@@ -2348,7 +2352,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		if (!avail) {
 			if (!is_playback &&
 			    runtime->state == SNDRV_PCM_STATE_DRAINING) {
-				snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
+				snd_pcm_drain_done(substream);
 				goto _end_unlock;
 			}
 			if (nonblock) {
@@ -2388,7 +2392,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		atomic_dec(&runtime->buffer_accessing);
 		if (err < 0)
 			goto _end_unlock;
-		err = pcm_accessible_state(runtime);
+		err = pcm_accessible_state(substream);
 		if (err < 0)
 			goto _end_unlock;
 		appl_ptr += frames;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe..657e77d33b21 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3014,7 +3014,7 @@ static int do_pcm_hwsync(struct snd_pcm_substream *substream)
 	switch (substream->runtime->state) {
 	case SNDRV_PCM_STATE_DRAINING:
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			return -EBADFD;
+			return 0;
 		fallthrough;
 	case SNDRV_PCM_STATE_RUNNING:
 		return snd_pcm_update_hw_ptr(substream);
