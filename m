Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8803542AA1
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424249; cv=none; b=Gm7yZtuART7qKBsK7Y+DlAlRp4U0L5Ybti0nzc07MHT6IPSYwZhtM2oAu5Xi9VFyae8/eiIHI5ffXwRp7bcNnRzzOMx5dEPFvziLlPLulwZblrU2H4HIEERyvazHOOTLiFOR7lmeHdQMtjO4tR5GLRd9hziqQN/C8mYSAmf1wGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424249; c=relaxed/simple;
	bh=Ecbmgltbc6unao3L/VR+48dx5HG/JT5F2wVH8J05YvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C8B21fq4bsrPQTfEyvxTIXC+NkrQUj3b3b1WW6gP+my6yBLDFCM22k8wyM938+6DnTvoXYKVa/HCnyDDN3Oi303kdl7Slfr7ppcqfUtRM2PmIfmpwfwl8nPkWxjuUvyl/0/tWUPOgotf8HLt3yQWht8azzxt/QVUFkig/akDpU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZU0Y6mw; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZU0Y6mw"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so9095108a12.3
        for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 00:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734424246; x=1735029046; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bGIF2eAaI52Oqa36MEOiZ4+3ozT9+nk3eXn+U3x/kAU=;
        b=TZU0Y6mwpiMprYzL5NWtXfHOWnV7b6evkVx98xwX4A/Dzi+YRjHFk3W2gZVJg1K17b
         5lEBOGDIOlE27ot5whGalY+f0Owrp1sNdEBP1QHpoW9vlSRUFWAlvlI28p4JYnovbPAP
         k3S9M09Z7OORkO+wZQ/AnioucWQqewAYxOuRIb5xlJ6LVwzY8CeKOeEjQq/yflswNv57
         007fDO2chRZu04sRijYi5RWqDR+OwW8GTHRNN4Z5YblF4HdMDUvJopdruJhu27rXG8y5
         Oba47lAdiNoghTVa/S6n+l1T5P+JSUxI8V2CQlxACe6iKTZYa4YNcqM7D5dovVjO/wxK
         jidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424246; x=1735029046;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGIF2eAaI52Oqa36MEOiZ4+3ozT9+nk3eXn+U3x/kAU=;
        b=Z0bxXrCClJqDxMu+jMfWQAnMImjGu/HgHrgYf48dYRNb5D7W1Q6QLes59DsboSTnFv
         52t3AxmO1iYrSI1cZ6fYymCnnpYzJ9iXx+QuplvSjHBOyGaAxpi9ERKXCLSlvxw8kPnN
         ycLkBfTBILJqyPGFb/NmaO9Y0f9GY+El+5yuj4nPUnjq0r62vxfOu8BU0S9v4zJOe5on
         +nyVAt+DqAlJ7ebJnvRmkD/KKma01V8ZyE/OdKaSrVFYTAW6RMcgmEUOT7MniVCcUSJZ
         ZKhy6vMs7Q1Iiu/0ZkXbmK+VeIZnNjaSL4TY+AbA9Gn7beCpVs8XxuQcgaxbqUARj272
         VhfA==
X-Gm-Message-State: AOJu0YwAxJMjnuSQkt3EToWPwKBqt/YN5LfZRpb2aSS3OgtaMrYAiOFN
	7lqlD9xxnoXlOgcQnr9Bkm9GWAqnYjhFNekClDEY4m8Gf5MYDlGV3sNWJ39JmiPT2wHU97bpqt2
	O
X-Gm-Gg: ASbGncsp0BED+p6+KNlATjnY7+G3dB0joq6bR9WK8TUl6vnkQxEIF3yiFEQ1FsXdJqs
	AHMz1za0cxXrifavRN/lXo2ppIA4s28ztYLkftfbtvL26P8D3NoQv9tXaF2WR4HIGMyX2wwVV9T
	+Fa6xcZzRpFW30jgNi6JHuTiGYnVwUv19JUa138nPNlPbfzU2GPrtPVrQxkGWTPlmBTUn//+HlZ
	QSiAcWv7oT8AFD4RV3qx0azYyBJv9b+8QUD783Vn3LJCXMpGlz5Ue+oCPDQqA==
X-Google-Smtp-Source: AGHT+IGPmj37uUDvWEGD4Ql5gWtGGCrsLuixAb9N9Ts+l8vzUia53CUXK1D1gNXByMi11uE7lLV5+Q==
X-Received: by 2002:a17:907:6d12:b0:aa6:8096:2048 with SMTP id a640c23a62f3a-aab7790a02dmr1662970866b.17.1734424245669;
        Tue, 17 Dec 2024 00:30:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963ce2f2sm416841766b.201.2024.12.17.00.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:30:44 -0800 (PST)
Date: Tue, 17 Dec 2024 11:30:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: compress_offload: introduce accel operation mode
Message-ID: <6a923647-4495-4cff-a253-b73f48cfd0ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Jaroslav Kysela,

Commit 04177158cf98 ("ALSA: compress_offload: introduce accel
operation mode") from Oct 2, 2024 (linux-next), leads to the
following Smatch static checker warning:

	sound/core/compress_offload.c:1059 snd_compr_task_new()
	warn: fd used after fd_install() 'task->input->file'

sound/core/compress_offload.c
    1025 static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_task *utask)
    1026 {
    1027         struct snd_compr_task_runtime *task;
    1028         int retval;
    1029 
    1030         if (stream->runtime->total_tasks >= stream->runtime->fragments)
    1031                 return -EBUSY;
    1032         if (utask->origin_seqno != 0 || utask->input_size != 0)
    1033                 return -EINVAL;
    1034         task = kzalloc(sizeof(*task), GFP_KERNEL);
    1035         if (task == NULL)
    1036                 return -ENOMEM;
    1037         task->seqno = utask->seqno = snd_compr_seqno_next(stream);
    1038         task->input_size = utask->input_size;
    1039         retval = stream->ops->task_create(stream, task);
    1040         if (retval < 0)
    1041                 goto cleanup;
    1042         utask->input_fd = dma_buf_fd(task->input, O_WRONLY|O_CLOEXEC);

dma_buf_fd() calls fd_install() on task->input->file.  That exposes the fd
to userspace.

    1043         if (utask->input_fd < 0) {
    1044                 retval = utask->input_fd;
    1045                 goto cleanup;
    1046         }
    1047         utask->output_fd = dma_buf_fd(task->output, O_RDONLY|O_CLOEXEC);
    1048         if (utask->output_fd < 0) {
    1049                 retval = utask->output_fd;
    1050                 goto cleanup;

Let's imagine this fails.

    1051         }
    1052         /* keep dmabuf reference until freed with task free ioctl */
    1053         dma_buf_get(utask->input_fd);
    1054         dma_buf_get(utask->output_fd);
    1055         list_add_tail(&task->list, &stream->runtime->tasks);
    1056         stream->runtime->total_tasks++;
    1057         return 0;
    1058 cleanup:
--> 1059         snd_compr_task_free(task);

This calls fput() on task->input->file.  The user can mess with the fd
and make it point to something else which leads to a use after free.
I believe there are two options to deal with this.
1) Don't call fd_install() until we know we're going to succeed.
2) Just leak the fd on failure.  It will eventually get cleaned up
   when the process ends.

    1060         return retval;
    1061 }

regards,
dan carpenter
