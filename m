Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B252E718C
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443799; cv=none; b=NpW13Jg33452M8/y/0HJMRl2UcuskyCqilSoc7IjGCEltxbiW8z6ov5SsYEduvvcgt1ZpwcbpVJpohizfGXMOr2kmXDH1qOeia/4C8XTruWKdD0YbChdEdw/5IWGxQ3/YL27d83NdffGuUdA/U4231Wnq9Q9+gCCtbXiyEQU70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443799; c=relaxed/simple;
	bh=xYkxiSGB3HiyrpwMmesA1Pdc4KekDGsxkxYb8FOqOsg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z91i+barLRz4wOIWfGiti5qNTV2HAnHjxa4I69mm90Vy6rCMauoHSekP0w+YwaEIcWMjVuuiFjFC7TeshCw0IMCc+p1tgdagz9YRLXC7OcVu9b3zlBd37l8Ruex47X+RB7GWwCDSxV66SAlf8Y9V+BtYMerBg/G+efAk+AglRBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QCAvnuqa; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--verhaegen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QCAvnuqa"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b77738050fso274525f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753443794; x=1754048594; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+a+TqK/s3X4ICiheNo2EUiGxut07xdB8F6iCq61W8U=;
        b=QCAvnuqacFtjmtznrz5Pd1zL22ykpTdZFMU1I6Hzc1PUqlHTHDN+CAPtpAM6ixWSyN
         J08IWfFgU26wJuycDnfjMJidbQlCqYWoeEo8qYgmzzEWdDXWiALyyopvrW7nqYtWwLwC
         BHznZRmYr+ZG61nl80dluKe5Tt0CZN8E7XWdQUCETuFj88TMGt494LECKqnQ2Z08FeJ9
         jzZYLlGs9SmxqZtrZUv6eaYKGNF3ziAvoj2llJ2r8lMQoRsguX1ZBuIhmShYAB9PT4gu
         iRwa71mV/dpPjKmVZ8i+lKt2AVUxHno8VOOFM7S1iKPZCxV7leKn77MLGsiOUWzrS+M6
         0Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753443794; x=1754048594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c+a+TqK/s3X4ICiheNo2EUiGxut07xdB8F6iCq61W8U=;
        b=p3uqfxL+pPgJSgmPqcm44nXxkJx+6d62BWjPRQ7RszA0SNurZ+rJ7ycYPZUuLGh0px
         GqLifxxkMEsgrFkdJgMdNvbHfvYCUOjf1/RiWb8uRiq5T1B3z8BeIrF/qB65OVQ3m0aZ
         phktoIC/HEEo3gWTgvsj4iP/e6esnPB55IKN95BMQI+pXpFldsffP01Iqa0lsm/5iuSY
         d7FTvMeBfSt9ACWVPaKoTBojuhP876wRfUwHN2IzqxTyfLB4726TW/gst0EvY+o01xpM
         uKKCnLyvR+cpgt5e2es2J6p6cn70Cp7LoBHgc4RKp8II0WkA9tYSrChsXAtg5fH/P3V7
         AG7A==
X-Forwarded-Encrypted: i=1; AJvYcCVWFad7Z2wnOhTJj27lbKWzYoFy6RGp0GQ3n6I8/U1eKTgY0bisd4dfHfCa213PpTMdwrcLy5bmHaigPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tWvMp8g40SmQ6x5jNgO/ZC61hgwmt8Awq1XhZJHaCqDbNsti
	nwgZrvPcvtnwnB0HKVR9Dze3JE9tJYoJ59uKwAXukh+lLSC3mxpSK6oSfrWGXAmPo3OTJ9m7+6k
	Ukogpf6gaHhQUg6iuWg==
X-Google-Smtp-Source: AGHT+IEjxdJR1uJLIOVLqBDV0bDsdc/XTQjcc+CXgCRPq1R1chA9MEbontl1NBvD61YpGImuSVWX6wytCW9/eOc=
X-Received: from wrbee12.prod.google.com ([2002:a05:6000:210c:b0:3b7:6ea1:a86f])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1889:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b7765e614amr1746678f8f.1.1753443794521;
 Fri, 25 Jul 2025 04:43:14 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:42:44 +0100
In-Reply-To: <20250725114249.2086974-1-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250725114249.2086974-1-verhaegen@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250725114249.2086974-3-verhaegen@google.com>
Subject: [PATCH v3 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
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

The previous patch introduced the internal infrastructure for handling
64-bit timestamps. This patch exposes this capability to user-space.

Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
applications to fetch the overflow-safe struct snd_compr_tstamp64.

The ioctl dispatch table is updated to handle the new command by
calling a new snd_compr_tstamp64 handler, while the legacy path is
renamed to snd_compr_tstamp32 for clarity.

This patch bumps the SNDRV_COMPRESS_VERSION to 0.4.0.

Reviewed-by: Miller Liang <millerliang@google.com>
Tested-by: Joris Verhaegen <verhaegen@google.com>
Signed-off-by: Joris Verhaegen <verhaegen@google.com>
---
 include/uapi/sound/compress_offload.h |  5 +++--
 sound/core/compress_offload.c         | 19 +++++++++++++------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index abd0ea3f86ee..70b8921601f9 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -13,8 +13,7 @@
 #include <sound/asound.h>
 #include <sound/compress_params.h>
 
-
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes
@@ -208,6 +207,7 @@ struct snd_compr_task_status {
  * Note: only codec params can be changed runtime and stream params cant be
  * SNDRV_COMPRESS_GET_PARAMS: Query codec params
  * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
+ * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
  * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
  * This also queries the tstamp properties
  * SNDRV_COMPRESS_PAUSE: Pause the running stream
@@ -230,6 +230,7 @@ struct snd_compr_task_status {
 						 struct snd_compr_metadata)
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
+#define SNDRV_COMPRESS_TSTAMP64		_IOR('C', 0x22, struct snd_compr_tstamp64)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
 #define SNDRV_COMPRESS_RESUME		_IO('C', 0x31)
 #define SNDRV_COMPRESS_START		_IO('C', 0x32)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index d3164aa07158..445220fdb6a0 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -736,18 +736,23 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 	return retval;
 }
 
-static inline int
-snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
+static inline int snd_compr_tstamp(struct snd_compr_stream *stream,
+				   unsigned long arg, bool is_32bit)
 {
 	struct snd_compr_tstamp64 tstamp64 = { 0 };
 	struct snd_compr_tstamp tstamp32 = { 0 };
+	const void *copy_from = &tstamp64;
+	size_t copy_size = sizeof(tstamp64);
 	int ret;
 
 	ret = snd_compr_update_tstamp(stream, &tstamp64);
 	if (ret == 0) {
-		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
-		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
-				   &tstamp32, sizeof(tstamp32)) ?
+		if (is_32bit) {
+			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
+			copy_from = &tstamp32;
+			copy_size = sizeof(tstamp32);
+		}
+		ret = copy_to_user((void __user *)arg, copy_from, copy_size) ?
 			      -EFAULT :
 			      0;
 	}
@@ -1327,7 +1332,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 
 	switch (cmd) {
 	case SNDRV_COMPRESS_TSTAMP:
-		return snd_compr_tstamp(stream, arg);
+		return snd_compr_tstamp(stream, arg, true);
+	case SNDRV_COMPRESS_TSTAMP64:
+		return snd_compr_tstamp(stream, arg, false);
 	case SNDRV_COMPRESS_AVAIL:
 		return snd_compr_ioctl_avail(stream, arg);
 	case SNDRV_COMPRESS_PAUSE:
-- 
2.50.1.470.g6ba607880d-goog

