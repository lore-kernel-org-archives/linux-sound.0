Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5B1DFD91
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430063; cv=none; b=dvro2i1I34XeOVtYdCtdSInhDKs6S4NTb9l4wpD/fo1/snW9hPdEyTkbvu/X73/jxi9uCtyrPr+BLmOhi8X4vChQw5Z3DXQ/DHOYlmnsm7/WDUaZ6WgQv4eNYlojoqy4WX/zwa89yCCyBlc3q2dYb47QUqrYLnE047esuYUTryw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430063; c=relaxed/simple;
	bh=h8g9ir6sKURNYOCM3Qi8GLO62x5h5BXynSCgDEQD+zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2u2IkXKdoMNk94wkffZc5Vnu39H5fIFPpVh8Pyy2w1LVoC7FPY0N2TEzjegAiQ0ms5sROm+BfI3EHYnjzmOXE7yi+94UZNkXnZIVj//KYuZBRELKdEttnQHo8fHLpVKk5uj0h2Vk/LmfQVoRvAv/bSjDwEfVKEoEUW0b5GiqYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=o4T7Z7CS; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="o4T7Z7CS"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 73E392A2C;
	Tue, 17 Dec 2024 11:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 73E392A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1734430056; bh=YxYDvPT1b2VD7vMHG5NvMbNhyvPxuF3FxFrHmUuxBwY=;
	h=From:To:Cc:Subject:Date:From;
	b=o4T7Z7CSU8NlMy6P+nGeviuDI8o/MMsGxkMAFk+YAbWvkEZeoV7C0zO4+OIH8xNpR
	 tLDlJTGtfDqsp6aIJ9X+Z0fStZd21L9CY6yB956PPX4UCjc2mB3K14y8A6rOTmaX4/
	 HKaL6aWPNCCujrSfTg7in0jtJHNEjalCG+Kot4DA=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 17 Dec 2024 11:07:31 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] ALSA: compress_offload: improve file descriptors installation for dma-buf
Date: Tue, 17 Dec 2024 11:07:26 +0100
Message-ID: <20241217100726.732863-1-perex@perex.cz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid to use single dma_buf_fd() call for both directions. This code
ensures that both file descriptors are allocated before fd_install().

Link: https://lore.kernel.org/linux-sound/6a923647-4495-4cff-a253-b73f48cfd0ea@stanley.mountain/
Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/compress_offload.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index ed69b742786c..0c2ce5005488 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1025,7 +1025,7 @@ static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
 static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_task *utask)
 {
 	struct snd_compr_task_runtime *task;
-	int retval;
+	int retval, fd_i, fd_o;
 
 	if (stream->runtime->total_tasks >= stream->runtime->fragments)
 		return -EBUSY;
@@ -1039,16 +1039,24 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 	retval = stream->ops->task_create(stream, task);
 	if (retval < 0)
 		goto cleanup;
-	utask->input_fd = dma_buf_fd(task->input, O_WRONLY|O_CLOEXEC);
-	if (utask->input_fd < 0) {
-		retval = utask->input_fd;
+	/* similar functionality as in dma_buf_fd(), but ensure that both
+	   file descriptors are allocated before fd_install() */
+	if (!task->input || !task->input->file || !task->output || !task->output->file) {
+		retval = -EINVAL;
 		goto cleanup;
 	}
-	utask->output_fd = dma_buf_fd(task->output, O_RDONLY|O_CLOEXEC);
-	if (utask->output_fd < 0) {
-		retval = utask->output_fd;
+	fd_i = get_unused_fd_flags(O_WRONLY|O_CLOEXEC);
+	if (fd_i < 0)
+		goto cleanup;
+	fd_o = get_unused_fd_flags(O_RDONLY|O_CLOEXEC);
+	if (fd_o < 0) {
+		put_unused_fd(fd_i);
 		goto cleanup;
 	}
+	fd_install(fd_i, task->input->file);
+	fd_install(fd_o, task->output->file);
+	utask->input_fd = fd_i;
+	utask->output_fd = fd_o;
 	/* keep dmabuf reference until freed with task free ioctl */
 	dma_buf_get(utask->input_fd);
 	dma_buf_get(utask->output_fd);
-- 
2.47.0

