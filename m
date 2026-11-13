Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566768;
	b=wG2DzrCYiqt2aC2IBlKhjbm9+87RwCZ7Pf0cESDO+r4bWtpP82J4GClDeA1W7i6T6kG5
	 wRrRlORzl/fIbw1m6cWvRgiQtiLiTpYPOOr5J0XYM10NZ22u9W745uyj3bYOi9qqQOs4V
	 1S0czhdpsjsVERMidwgWb42abD1SWjJaa/0JM94mc+7CVcfCcVRBrneiOPgcCTRIrThR9
	 jkTBh9ZJz0gOcb8oYlMxoamsD9YvArb4siFIr620dw/ye8mgwur8WiYYYWJ5A8bbUissK
	 zZ3se4ZhisYAvDJZrnHeYSLCZEMGGEeZT+QC6gWU1HfZUWwXIqWLCy/GVmrOcbrZA9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8PnJyxubkTTtjSEauU0CPHUhE2dGssek0GA4nSRRVtw=;
	b=lanWx+wi3uF9D/MYHjyWPF7iPp5c6OZcNMESgxjB7DVyl062xBcZZiAnLYK495E4Lu1a
	 RpY86m5swet4AmhNveGBDV6K3EI5dN/AQQSj6goD3WPJCiR3izdfnWve2pCP2nAG2pqeH
	 4GJwwPVkoQUDj0f423sBQZpecXu/1x2RR6nvB7o/Ee25XE0lO3Lr9+yJrz3dEUBlQ85Q3
	 tkJ9+b8kZ7bytLUHZ+HADimhaqt9a0zD6diMQtiFxWqzrGz/f6UqT2CmNcjGlX6DWorqI
	 UFtGY7wmtc3e2wE2pSsPF4nepZ+WgeEPP6u8vwW0rz7iRRHKyav5dZlXUy9X7sRaSRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEkC3zGa;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB56606A321
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEkC3zGa
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so711355a91.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 02:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566768; x=1795171568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8PnJyxubkTTtjSEauU0CPHUhE2dGssek0GA4nSRRVtw=;
        b=qEkC3zGaLKoNyGMuTJxm9djN9UGLhbNk5TDj0+nXX/3ITiKPxz18xRfX0rWH+oCrI2
         mfsjYl4qsisfTVNet1REkhsJ9MRLjVjdfCqU+4j2e19LCGthyFBzvkfLhnZJrhIR+fKZ
         tvMjGJYPVvN573tHLqfsSrdV+Zg1Z0LCUoQVLAVI6VXL4iYLoyd1uKAVGy96uGVOxcnt
         w3YeBkg/HlXWc7S59jArvCLEA8/WdNBERHsCMJRVTqnnZlGSJh0rJHTuIT6cpZcW0eLl
         VnCF7FBCIG6b/9E4ZVmZWsKhb0/AxxHCZ4KL/O1f5eQXL7p1rUORG17T7N3lhJSREbnV
         dI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566768; x=1795171568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PnJyxubkTTtjSEauU0CPHUhE2dGssek0GA4nSRRVtw=;
        b=0zD8w3ZW/R1h8Q0Aa1Lw+ccHbPYdSl4cWgS/d2mZSJDPB/CnJYf0bUITQy9RreEiRR
         SmqlSF0w6Ay51HXLXBqqHMTN4pAMzzoTx9I9X4o/+qZ9d+PAnnnHUAbo6ZrNu+jUHyK4
         qyht0+C9uaguXLmE2LlXPVKC28OIKYu91pm+HvfjLT5IqXQHd1Jwa5+Uv4mRjJ5l2z3d
         GFuXlQ5GIWY/AR/jJTVKw4MDstoB1O0FRGtsTtSsXaJzzu0gtDVP+HfIp6tVeJhrXIQV
         cxtq17W0y7FpzlyTOYCyS/Yx5az0hvxnom/Zi2zEGzglaJf1e7eDeEEanj6plv/mIfex
         zqOg==
X-Forwarded-Encrypted: i=1; AL+hErHlwFjRoeOLfakXlyzJOBql+xyS3Q+ljzVg9PwVuLHEhiI7AVNLb8S/YUzEeICeSpMvoUbuaO01ZBwPrg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/1OuJamdjaOrP5G+nEnSe3vSFAXLgb0SEYqYl11pX7JFtrHHm
	GfAPK25jkhZzDdVIlj36ffiwEYa+QsJbS4+Ar/GUA2XAZiDWAueIYaYu
X-Gm-Gg: AYBFou0TR4kbqbBWboKALeLRskiHBcacSZGS1EBMtyTPnuWy4nAzwNwAIzTlkG8LYC0
	3KMz9k6fGyzpKP2U+UK8rCZBcMVHT6zHMOfpJTzQhOeLSB+nc0Mx2s5dRlSNPVt1JFpiwP5JxDX
	jHXOwJiqlYRD9uVTNgfTG6Hul4tbiAgKyCTxk+mOW3zrUtyKDTsxUiZTpuO5j97JbZBCgQzI7sS
	NVX0lB93NRv5qiZr3AOa3ATztnmuZPeoJfB4/C8hiRVHW5fbHQJ3LpdC2dSbkfTOLyjrZfMXP8C
	BufHO5Y/SIRDGHx3TR3x+0A0QWs1Bs3GoCQ/A3quK+h2PfNBwCBM2pYyTMPMNuBIs1MjnGX1Soq
	k2Bw55mh/FxKxLBmKzdFoGmuTIh01U+G1RVY7QuDtPn/Skho+HKXasjsurajFJcGGLRn8QC69G/
	/dwQHYhOdN+2OENJYi48BcIDVmxcb6nsK2ROpuYR08E/IeODpDED6t8JKbWV22O3uE+8p/WTnxQ
	l0IKWLEzqs9BpIptSoQF+agEQS/zGG7z2evaK1VGjO09yDLf7LuIX8KWdLfb/GN39iOYK9AXPbd
	VcZn7xPWnd0+HdtNHFwT1BpYvrWXvFHuhAvkRoggm+QaVk1k77aH
X-Received: by 2002:a05:701b:291b:b0:1b2:5f31:21c9 with SMTP id a92af1059eb24-1b50306c4a1mr1955852c88.6.1794566767473;
        Fri, 13 Nov 2026 02:46:07 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm9373693c88.9.2026.11.13.02.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:46:06 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Fri, 13 Nov 2026 10:45:18 +0000
Message-ID: <20261113104518.3951-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The task creation path allocates resources and installs file descriptors
before copying the task information back to userspace.

If copy_to_user() fails, the function returns -EFAULT without releasing
the allocated task, DMA-BUF references, or file descriptors. This
leaves the task registered and leaks resources.

Delay fd_install() until copy_to_user() succeeds. If the copy fails,
release the reserved file descriptors and their DMA-BUF references,
then free the task using snd_compr_task_free_one().

This ensures that task resources are properly released when copying
task information to userspace fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/compress_offload.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 5e5e0f78f26d..432717d5d433 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1124,6 +1124,9 @@ static void snd_compr_task_free(struct snd_compr_task_runtime *task)
 	kfree(task);
 }
 
+static void snd_compr_task_free_one(struct snd_compr_stream *stream,
+				    struct snd_compr_task_runtime *task);
+
 static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
 {
 	u64 seqno = ++stream->runtime->task_seqno;
@@ -1132,7 +1135,9 @@ static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
 	return seqno;
 }
 
-static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_task *utask)
+static int snd_compr_task_new(struct snd_compr_stream *stream,
+			      struct snd_compr_task *utask,
+			      struct snd_compr_task_runtime **runtime_task)
 {
 	struct snd_compr_task_runtime *task;
 	int retval, fd_i, fd_o;
@@ -1169,12 +1174,11 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 	/* keep dmabuf reference until freed with task free ioctl */
 	get_dma_buf(task->input);
 	get_dma_buf(task->output);
-	fd_install(fd_i, task->input->file);
-	fd_install(fd_o, task->output->file);
 	utask->input_fd = fd_i;
 	utask->output_fd = fd_o;
 	list_add_tail(&task->list, &stream->runtime->tasks);
 	stream->runtime->total_tasks++;
+	*runtime_task = task;
 	return 0;
 free_driver_task:
 	stream->ops->task_free(stream, task);
@@ -1185,6 +1189,7 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 
 static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long arg)
 {
+	struct snd_compr_task_runtime *runtime_task;
 	int retval;
 
 	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
@@ -1194,11 +1199,24 @@ static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long
 		memdup_user((void __user *)arg, sizeof(*task));
 	if (IS_ERR(task))
 		return PTR_ERR(task);
-	retval = snd_compr_task_new(stream, task);
-	if (retval >= 0)
-		if (copy_to_user((void __user *)arg, task, sizeof(*task)))
-			retval = -EFAULT;
-	return retval;
+	retval = snd_compr_task_new(stream, task, &runtime_task);
+	if (retval < 0)
+		return retval;
+
+	if (copy_to_user((void __user *)arg, task, sizeof(*task))) {
+		put_unused_fd(task->input_fd);
+		put_unused_fd(task->output_fd);
+
+		dma_buf_put(runtime_task->input);
+		dma_buf_put(runtime_task->output);
+		snd_compr_task_free_one(stream, runtime_task);
+		return -EFAULT;
+	}
+
+	fd_install(task->input_fd, runtime_task->input->file);
+	fd_install(task->output_fd, runtime_task->output->file);
+
+	return 0;
 }
 
 static int snd_compr_task_start_prepare(struct snd_compr_task_runtime *task,
-- 
2.55.0

