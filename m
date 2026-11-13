Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567899;
	b=b8YwbxH6fUF/wNs5vQkHu75n3+d7s2rLpoJKfYDK9A0F5bTb6oG22WVt2kc+aisB8FaO
	 GtPAGffecEotp/1r4HdQ07Uwraq6b53SgSwbSqbix55JEpy4q8lGlnOZs8rzryfS8YVms
	 dlref2n7zwoQP7g3O907dF1QIp5nQhepbd04TofUJNnzzhLATLy4qAni7ABPqORnbftQV
	 9pBqCaA8aSuMdeFVMRnxUOL5CZsk+J+ynaUgGwbfE4RRVeiCYtQ4e1GgOO4U287evG6gc
	 eCPmOpRvuuO60jkH+pAPyrKtS4xAaTkst+1qtVtAbO1bKI5HWWdehW25Kwt4SijuV5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kAtCiR0ZuKR2R9RouzclbymoG8didRg2rOJs+0NjmQg=;
	b=IwVHYSlwmk+ng6eY3v7WX/CXO8LqW9LaPTw2vHtt0QL5LhfkDRIxc1mJed26YONEngvS
	 d2pVSsBAV4KHcVfzQXCWLMbEFbVRIXjKf07VXSqD3NWBm7+F1IBA2K+ljpMsUKPC2ET9s
	 B/TTWsQSd8lVbQgL4qt/Qs1rLabkYqH7A75S19YnjFJodcYBK9ZHtgAmWYiAJtWlQ2D0S
	 a17S7a5i8A64YUGt+lpbkUWewaajFVlQ+gRdOIOrxwU7rnEACgxEkHSrP9a17eGD07x/M
	 ZOQnbQMjTk7WKMI1KWM++5Rc4LG2sIHbs7Chpy6q8Wd4bpZDHd7hq7nYzX6ad+AIdTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxAi4yMD;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCA6606A33B
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 11:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FCA6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxAi4yMD
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so5449505ad.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 03:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567898; x=1795172698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAtCiR0ZuKR2R9RouzclbymoG8didRg2rOJs+0NjmQg=;
        b=qxAi4yMDoGkIQPY1NoRL/5crFrECSYUzazs3YEJBhVFjwdzd2zTJE6qXin5jCIWUxd
         kGjY71s18FcTsDnmtdKUCdgmf+qc9xUPOfXNReHdx5wytcfYoi36SzOdfvLMC0La7obJ
         ad2S315tQe2zNpmdi6v5He14nqGmG3tokxly68EpNvezE7aCzjXMUzJhRbuga1UEDQx3
         wYkuwpEJyi7QTEwjlH4hrTXn4E5xXok8iY0clBFZFdrzCuYhRWe1aH30gk+G9NlA7CDu
         dkUQIWSRCVzgF5EfS4KoqkSdvgKcXRXWS6cPqW8wTn9R0C3ZtxxucqbRDbtaieRRibqE
         2eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567898; x=1795172698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAtCiR0ZuKR2R9RouzclbymoG8didRg2rOJs+0NjmQg=;
        b=L0vjDbQEx4odT6ErvFKS9SIdp1bMx2bqwQjtSrjoUvevevc74kaz8k9r55KaujGOkQ
         mdJz+HLH91rKRZHOBppgtZp6HofmgculgYPuzfxmA9OwJ1R5TK+0Hr8IwUdQ2lv3IvXy
         a+IL111iophqVH16TiPAUJgs4CJGX/lpzAA702jIGhwAm+Becm4eOm5n1MwYqgafm3zx
         DJ0gc5FSnr8x4tdNqYS9w89qz755/e/dHKaHGTEknLlvHYEHLsMpvA1kfpDT3f/w0MH8
         MNnRRcQkBR/NXnfsYqEVVTFGYUpbREsvxnKVluIYgJBhzS7sKe7oCTHGHW7taSAt4uEy
         44/g==
X-Forwarded-Encrypted: i=1; AL+hErEXWc0QQuMS19P+6F4TRjdw32PJwOhuFAZ3SQezOwRl9LKsrkrqoS/k6DPw6roCKx5Z1etU8eR1TPIdwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ke1DsZqWqcQsTxJkHdtYjJTaivklphjipNStUDlf2dUuxvqAR
	/3xbE/GlQ478u3ULLADsxgJSa4Uk3j3X/ncP6CBY7oSmmMCeWRYz3TInYVbHTfW7
X-Gm-Gg: AYBFou2Capv/SA/OfUGNGVxDGgVCT19xrMwonBKnTNXG+Ls794owrkWrg7Omict4zpd
	oS1VdG0JlHxyuxswnOBNocKXnKd9axVkUaDTn6h/AvfmjtOjNltJKTOBAWgYJchsolAMV+5NsDY
	6Kw3SqQZQaF9hWyXXn0tnbw1K2n0zQGzQ/SKDhwXo872pYgL8xxcEXRLf4DfhJlNfKVAZeX5CKX
	qxenDa0n6NpaYiD1x7aKh19lzMlMWolSQ6OkSsQeldHkr8zrj6l2GSQlaCOp0SGHQgq9fsgLVJ1
	oZE60IwwqD3OAY6tTCE9VTYMQCoys2WyGjLBSHJZiFZ6r7gRDg32oFh+Fe9UuFfKQcIo3pgWSMm
	P0/RYnYrzfr2nJyIeU1Cvxzk71zMXKWkyeP71oBt/p/t4PncDh3ghSoq3BGjkXHeIjodH3OCDSe
	pSpbJv9R3Fwa4UoXtxUaAc0z+/+AmHQTOAkwgaZWHzmou2agyZunZTUEM6cRazyi1Y4FUBVNpB8
	VzSfWGc35BUSOXeH0soCFFxhOuKet4qBzP+8rE+NHK9i0NU6vdr7Mxe89/FDxXVlenpT+/HD+58
	I3JZ767U4W0/Z//BUo7qZNUGas8vVJjLsUZPmQi8/HuY9fhb0ZSW
X-Received: by 2002:a05:701b:2402:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b503193011mr2018955c88.46.1794567898410;
        Fri, 13 Nov 2026 03:04:58 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm6856653eec.0.2026.11.13.03.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:04:58 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Fri, 13 Nov 2026 11:04:27 +0000
Message-ID: <20261113110427.4256-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113104518.3951-1-sreekuttan2156239@gmail.com>
References: <20261113104518.3951-1-sreekuttan2156239@gmail.com>
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

Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

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

