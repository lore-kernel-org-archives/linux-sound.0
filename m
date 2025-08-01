Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B53225762
	for <linux-sound@vger.kernel.org>; Fri,  1 Aug 2025 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040501; cv=none; b=HMXoBU0oYuyomSr4mhq9iNzoXJWl4vV/GS3tk+DkvY8O3OGHxsJperoFbbS9ws1Ox8U4LJPF2Tcl9OWK2D+ETvr6N6fYEp168ZEcYCmQv9OMlHmfcE+JHXRmAXjmWFJ6qU7atFCHloHmTFO+e/yVT216clL2AlMYed00I2y+p4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040501; c=relaxed/simple;
	bh=gk2nf5/MPwZnRVOVR7/JwKNQsjmgQi916LQ5DollH1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r6xkd1Y3khxUNCO1hzkyn1Y7ZwfYmLHhWj47eed2TzpEPD0KBJbnqzyrBXRFt4sLPLJXTIrXt+5bRaaQFFt1yGJOcfRwYXAUMbiJ5BFqPjEavHIf37BAUfosGXa1bOji08wlRc8IthelIghTzCYbg4qQQYY2iy/xgTlLgcMRM74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=smkrr9v8; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="smkrr9v8"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b78b88ecfeso9388f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Aug 2025 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754040498; x=1754645298; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sGqJwcIIXGX6gPFmMrFyOlEh3bYkZD3CtGlIUbK7Bvs=;
        b=smkrr9v8Sko9RF0p6/j681o9u2bDA7DnsG2rxIDUIR0PUmcsKIv4qN2jdVkpmbjn2q
         CyX564xaHhQ70we3Ypi0jGAfDCZG5qUi3Wje2o6CTzMH/J3lo3FQf+e02/wSsKIfRVSU
         cIwjF3nyq/4tryrprHblfTzBbodVxFlhD7gXqkKTZ8UQrSdVljY9kkYr13aKRyeAwGkD
         K+mIml5nZPr4EppqQ3rqozwXaN8peWji2Y7eHjGx2eZ2h8wG+dJYoUsQjMVh5CsD9NfI
         aVJaZQ8eVF9D+fd4DThickvYds53suJh42GdRsLaAHuoNxN2ng3nQM9ULhxQxX26pmVP
         opaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040498; x=1754645298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGqJwcIIXGX6gPFmMrFyOlEh3bYkZD3CtGlIUbK7Bvs=;
        b=VxRQZtr2yx2M3A8f/ooFHZfEZPIxMNqUxOAocmXRAp/GyiV/hM40U/WgBjDe+M8xJK
         6oMzdzI4JlZHtlEk0L4yz4cZ6F9oA9eNIfIJ/ck1b2iQ7+InmA+6sI6OehIfHQDNMOqH
         H8qBtWHGo3ocZWvziXYnvUIxlfBsS8i88n9hfw8yMQmCYMWn2JN9IkGLkhzveFrozbK2
         0kuH4PmqZyI52CVrHNo+8zIvb7PUIItuXCHl96rl6vDzJEXw6ycBvggueU67LWXb1ySW
         ZA2SfgSOLxE55JoZFHR0NlB1t3Sa6OSBcQvZyp4Nx8m+enzL0ivfnyhLz7FCKFHg2IUN
         aqVw==
X-Forwarded-Encrypted: i=1; AJvYcCXGO5tu9CRqOMB8LitZRKXp7jjDk6yUNy+lpVbPPaZBRvSJDcRfcBoHQyYNSGqaNtgbSAqcpgGXt4/dNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPd9bIKlfV0tfAlUeqo+rb+28NZsM6v52e1/DaGv5EooZKcOAn
	I8rK4eTLAY/2jnUH29q0kOoZYjIS/0eV0qVfU31cktxwDdaFgdP5ipSpA1TWtJ02o2VaftA/feP
	5ytKWZiNKLxPtR6a8bw==
X-Google-Smtp-Source: AGHT+IGuGJWlXT1GgrSFR5jnLb7A8Xwc1RjU3pAVlVHHLd9Rq5DVeyg7S8YW7qeBp1u7A9f0qGgaXcOFCxNv/1A=
X-Received: from wmsp28.prod.google.com ([2002:a05:600c:1d9c:b0:456:1518:6d6e])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40df:b0:3b8:d5cb:ae1c with SMTP id ffacd0b85a97d-3b8d5cbb0dfmr948024f8f.28.1754040497655;
 Fri, 01 Aug 2025 02:28:17 -0700 (PDT)
Date: Fri,  1 Aug 2025 10:27:16 +0100
In-Reply-To: <20250801092720.1845282-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801092720.1845282-4-verhaegen@google.com>
Subject: [PATCH v4 3/3] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
From: Joris Verhaegen <verhaegen@google.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Joris Verhaegen <verhaegen@google.com>, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"

The previous patch introduced a 64-bit timestamp ioctl
(SNDRV_COMPRESS_TSTAMP64). To provide a consistent API, this patch
adds a corresponding 64-bit version of the SNDRV_COMPRESS_AVAIL ioctl.

A new struct snd_compr_avail64 is added to the UAPI, which includes
the 64-bit timestamp. The existing ioctl implementation is refactored
to handle both the 32-bit and 64-bit variants.

Reviewed-by: Miller Liang <millerliang@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Signed-off-by: Joris Verhaegen <verhaegen@google.com>
---
 include/uapi/sound/compress_offload.h | 11 +++++++
 sound/core/compress_offload.c         | 45 +++++++++++++++++----------
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 70b8921601f9..26f756cc2e62 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -84,6 +84,16 @@ struct snd_compr_avail {
 	struct snd_compr_tstamp tstamp;
 } __attribute__((packed, aligned(4)));
 
+/**
+ * struct snd_compr_avail64 - avail descriptor with tstamp in 64 bit format
+ * @avail: Number of bytes available in ring buffer for writing/reading
+ * @tstamp: timestamp information
+ */
+struct snd_compr_avail64 {
+	__u64 avail;
+	struct snd_compr_tstamp64 tstamp;
+} __attribute__((packed, aligned(4)));
+
 enum snd_compr_direction {
 	SND_COMPRESS_PLAYBACK = 0,
 	SND_COMPRESS_CAPTURE,
@@ -231,6 +241,7 @@ struct snd_compr_task_status {
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
 #define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
+#define SNDRV_COMPRESS_AVAIL64		_IOR('C', 0x23, struct snd_compr_avail64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 445220fdb6a0..4d3cf49c0c47 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -203,13 +203,10 @@ static int snd_compr_update_tstamp(struct snd_compr_stream *stream,
 }
 
 static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
-		struct snd_compr_avail *avail)
+				   struct snd_compr_avail64 *avail)
 {
-	struct snd_compr_tstamp64 tstamp64 = { 0 };
-
 	memset(avail, 0, sizeof(*avail));
-	snd_compr_update_tstamp(stream, &tstamp64);
-	snd_compr_tstamp32_from_64(&avail->tstamp, &tstamp64);
+	snd_compr_update_tstamp(stream, &avail->tstamp);
 	/* Still need to return avail even if tstamp can't be filled in */
 
 	if (stream->runtime->total_bytes_available == 0 &&
@@ -233,32 +230,47 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
 	}
 
 	avail->avail = stream->runtime->total_bytes_available -
-			stream->runtime->total_bytes_transferred;
+		       stream->runtime->total_bytes_transferred;
 	if (stream->direction == SND_COMPRESS_PLAYBACK)
 		avail->avail = stream->runtime->buffer_size - avail->avail;
 
-	pr_debug("ret avail as %llu\n", avail->avail);
+	pr_debug("ret avail as %zu\n", (size_t)avail->avail);
 	return avail->avail;
 }
 
 static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
 {
-	struct snd_compr_avail avail;
+	struct snd_compr_avail64 avail;
 
 	return snd_compr_calc_avail(stream, &avail);
 }
 
-static int
-snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
+static void snd_compr_avail32_from_64(struct snd_compr_avail *avail32,
+				      const struct snd_compr_avail64 *avail64)
 {
-	struct snd_compr_avail ioctl_avail;
+	avail32->avail = avail64->avail;
+	snd_compr_tstamp32_from_64(&avail32->tstamp, &avail64->tstamp);
+}
+
+static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
+				 unsigned long arg, bool is_32bit)
+{
+	struct snd_compr_avail64 ioctl_avail64;
+	struct snd_compr_avail ioctl_avail32;
 	size_t avail;
+	const void *copy_from = &ioctl_avail64;
+	size_t copy_size = sizeof(ioctl_avail64);
 
 	if (stream->direction == SND_COMPRESS_ACCEL)
 		return -EBADFD;
 
-	avail = snd_compr_calc_avail(stream, &ioctl_avail);
-	ioctl_avail.avail = avail;
+	avail = snd_compr_calc_avail(stream, &ioctl_avail64);
+	ioctl_avail64.avail = avail;
+	if (is_32bit) {
+		snd_compr_avail32_from_64(&ioctl_avail32, &ioctl_avail64);
+		copy_from = &ioctl_avail32;
+		copy_size = sizeof(ioctl_avail32);
+	}
 
 	switch (stream->runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
@@ -269,8 +281,7 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
 		break;
 	}
 
-	if (copy_to_user((__u64 __user *)arg,
-				&ioctl_avail, sizeof(ioctl_avail)))
+	if (copy_to_user((__u64 __user *)arg, copy_from, copy_size))
 		return -EFAULT;
 	return 0;
 }
@@ -1336,7 +1347,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 	case SNDRV_COMPRESS_TSTAMP64:
 		return snd_compr_tstamp(stream, arg, false);
 	case SNDRV_COMPRESS_AVAIL:
-		return snd_compr_ioctl_avail(stream, arg);
+		return snd_compr_ioctl_avail(stream, arg, true);
+	case SNDRV_COMPRESS_AVAIL64:
+		return snd_compr_ioctl_avail(stream, arg, false);
 	case SNDRV_COMPRESS_PAUSE:
 		return snd_compr_pause(stream);
 	case SNDRV_COMPRESS_RESUME:
-- 
2.50.1.565.gc32cd1483b-goog

