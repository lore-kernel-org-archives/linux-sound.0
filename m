Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DB9210FB
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 18:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735498356; cv=none; b=KqLl/MJR+qEFfbnqnl0SyhZA+f+Ulw55Myc410ImsQAqKX4b86uaKcuB7qsJos9GpLs59k9pHe5J47dWywJicvqpfELwZ89y0gYTnvYl9jVFal5g+wSLuwD8LTpOAUTuAiyPrslo48/eQF4U0uhnJE5xM3WprzJIudhc4T1KjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735498356; c=relaxed/simple;
	bh=W4cUdBZBKGeBWuN/cvq67CuVacaJDAYH2puEsKqwAGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9Jq0W5pAVS3bAVghOp1GsicqjxGkjZRGfN52xyjiC+35q+hBaoO3SSEXUKANOFH1GTnaY4wySfJtgLF+sWgVHD5LCYFyfuAE+Llt7dqw+76tBlNWZp9qwDt0msz8M8RBFSbNv0swn+HBPH0IUJTS13lBWcKen3ytnoh/b7NIyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=PmddiF29; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="PmddiF29"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wRV4NZgBJh5ZdnEc/CATUJJbUruJNckTV40t1sOR+gQ=; b=PmddiF298pNY5fEHotFiBHxmQY
	q0Fbob4pCYyKXHIJpFf09k86dMB4m2RA04nU0G3VHG7mbWP9pZdwfhrkFn+s1+nAKo4kmZb1HTcMU
	4sLR2y10Fr/ZVBXh/z8EaGzX0FFyfxrZMH3h0X4UuxVnelOiTDOj8XIsxlnrS6SOl+/UHbfYgiPmN
	KX80d4xAHh5CkTS/xFXLL6UfMzkbKcKgvYan4f8l+CRWp4sZjLOVBgoLyDId/q4bAhhsur5wgcPbp
	AD9WGGx4ymFAsI7IkK6bJDfB2Ed3I0byvJMzS/sq86afSrWz+qoRCNLakBSJPzL3hB9caZugo19wK
	8eqK5Qww==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyOu-0000000DXwg-0TSW;
	Sun, 29 Dec 2024 18:52:32 +0000
Date: Sun, 29 Dec 2024 18:52:32 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Subject: [PATCH] fix remaining descriptor races in
 sound/core/compress_offload.c
Message-ID: <20241229185232.GA1977892@ZenIV>
References: <20241226182959.GU1977892@ZenIV>
 <d01e06bf-9cbc-4c0e-bcce-2b10b1d04971@perex.cz>
 <20241226213122.GV1977892@ZenIV>
 <20241226221726.GW1977892@ZenIV>
 <87o70udgzi.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o70udgzi.wl-tiwai@suse.de>
Sender: Al Viro <viro@ftp.linux.org.uk>

3d3f43fab4cf "ALSA: compress_offload: improve file descriptors installation for dma-buf"
fixed some of descriptor races in snd_compr_task_new(), but there's a couple more left.

We need to grab the references to dmabuf before moving them into descriptor table -
trying to do that by descriptor afterwards might end up getting a different object,
with a dangling reference left in task->{input,output}

Fixes: 3d3f43fab4cf "ALSA: compress_offload: improve file descriptors installation for dma-buf"
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index edf5aadf38e5..543c7f525f84 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1053,13 +1053,13 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 		put_unused_fd(fd_i);
 		goto cleanup;
 	}
+	/* keep dmabuf reference until freed with task free ioctl */
+	get_dma_buf(task->input);
+	get_dma_buf(task->output);
 	fd_install(fd_i, task->input->file);
 	fd_install(fd_o, task->output->file);
 	utask->input_fd = fd_i;
 	utask->output_fd = fd_o;
-	/* keep dmabuf reference until freed with task free ioctl */
-	dma_buf_get(utask->input_fd);
-	dma_buf_get(utask->output_fd);
 	list_add_tail(&task->list, &stream->runtime->tasks);
 	stream->runtime->total_tasks++;
 	return 0;
