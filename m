Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F33E557F
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781530659; cv=none; b=llIHcbg0xLPfUMn/yq9WDvY9s1DtzqopX1kCNXd2VsXDkmLZ6yYFVjOfKJBAC8yjzhph4NNwMrJIuxL2ebT76l3vRarfuxsyTqen41DgrPeMsinXAqktUH3YZmcvQ+t5r+Qa56FMyrzDlilUFAHOg0mqRz80IiO0VVIIRrPSVRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781530659; c=relaxed/simple;
	bh=w5Bm4VuVxCQQ/wvB8MrTa3T3tyUvG30zDULIWN1Ib9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fnsYBXcRbOOMxV8BYGOV3Zh1RdwUNr7MIE1S+PK+DKjkePz0F3ry3onw0V/3znlU6UYQUYAtNke8goL+f07UekKbuMlWv7aAV1nLIgi1xekY679wJh8V4FmoogbUtX598pDKKt7CwaNs2r9g1eNxS/wOzGMTFxA+u3Xyx8cn2qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/wbnnDk; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/wbnnDk"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59c9b666822so2312859e0c.3
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781530655; x=1782135455; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MtCDXKwtPPC+mJQnDzrDC0nMi/ogBssTGKYuyEP+oYA=;
        b=Y/wbnnDkVp3IPdKgL+nOK4bIb0ztXhxc7TsvUDvLfJrg0TKBUm6EjuhNCFcTKLHi51
         /ZlQMP7ZSs8ti6YA8nLzF8l9eSnLs6AmM4wSp5lkBIVPcO0nzvck2dE6/eLigdHgZp3A
         uiRhywmmXMiF+tn9orcn0SKV6apsaTi4txgfr1NE/tHiioGcUpsEqRT4ghukJhLQrFNC
         H0xFrI/3CxzBpV6tbgmhmO+CYwwolwpa4+d4JbMWfQZRHYtaXNCEBgUnNOJ5mbvtsr3d
         9XIrc28CChFJiGmfKWO6CRQ93shQODMgX614L5BM5QjyA1mzskZoq+Y4ehiIn3LYrbCh
         gyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781530655; x=1782135455;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtCDXKwtPPC+mJQnDzrDC0nMi/ogBssTGKYuyEP+oYA=;
        b=DDaoQ4Ot6uS6akodSzc6ejlNfgHoxyihoEeY5quYjL/wnoZHT+c15T4B4mkYO3/FmZ
         Uio+BjhN0NxT8Cpc41tWKBtTOURSvYXdfS8kYb34x7Ho7GCwEJaLT1PfmkQcdoSMgp+C
         jwhCWjHLmYJkd4JFbBef0Wyv7wz6nyn8yDNAvjhdfpLgW0iBZwIIdP3UPhpnRhYROdX4
         cKPfzok7R4FZMJmO+bUm1GOD7avLsLt9IMEzD6LwVYWP8x50tjPhYlhht5jyijPGVdNX
         tNvPv0BbRou/LL97sJFJ6dLtE6Yhb7aA/Ki7UhYaxBxGue2vrVIGcweRCTtjTXIeW5Na
         Cv4A==
X-Gm-Message-State: AOJu0YwkQnxokjuu58qxJrPTNhZEAaTMAYkF72YpMJHV588FNhW4C143
	Juj4pWkf+90bYdeE6ZhI9pcM3EqzUCw8ED7R0zsRHwY6cZ70YHEjG1Mi
X-Gm-Gg: Acq92OGvqsu1Wl2eWBk1rm6NLX2Yvknl/a5nXHgqENBRgqMrZgqy9Ghjwp25i9pUevX
	zViYTj8pnLQjM6bCucasA0H34JXsjyIvGuL6t6dRQ8LUUUe3RdDPOQpyuboZgxOUwxBI1MpNGgF
	lkde6EJiifdhselS5CtbSeqktwRAEkEWVfWsaER3kpTrzLaJ4lMkjvCTqQZnkBJif6wheAARq0/
	crLEx5yPYsfhXsFM/MPwfdw1SyQ6M2btjo+0l9Q6kH2RQn98elIzZ6zD0FpoVYrZrGEh8tqTp55
	133dMpXNRwzMFOZHpOwvpYh4NQf1QUo83IcQjed0LiiGam2aZkBgjxaFtpgMtlQx7AN23oekPyf
	ieNHW59ZHcOCq89o5/K/SRIyxK4ssweoz6Jp2+LNhZe3BftRVthn48odfrI3T9FUTyWcXiEvoDp
	1kr11+mitggyZG8yetuSKTPVWmzHceXGmKoR2GhTDk0xi1ob1GBPxVp1bIlL07odYbir3E+G6pZ
	w==
X-Received: by 2002:a05:6123:2e3:b0:59e:f727:4bb4 with SMTP id 71dfb90a1353d-5bb6bfabf9amr7529733e0c.1.1781530655428;
        Mon, 15 Jun 2026 06:37:35 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb90180e79sm3527213e0c.12.2026.06.15.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:37:34 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 15 Jun 2026 10:37:26 -0300
Subject: [PATCH] ALSA: compress: Fix task creation error unwind
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260615-alsa-compress-task-unwind-v1-1-39e8ad3ddb27@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1g2o2CC9iriYjhmN1rFMtAri3
 Tvq8oP3/h2Ug7DCK9kh8E9UJh+RPRKwnfEtozTRkKc5pZQ90XzUoJ3Gb2BVnI0OuPhVfINkqSg
 L51xJBPEfF062q13Vt3V592znMwjH8Qef/rkHfQAAAA==
X-Change-ID: 20260615-alsa-compress-task-unwind-6c6484fff866
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=w5Bm4VuVxCQQ/wvB8MrTa3T3tyUvG30zDULIWN1Ib9E=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkGDNLMBWtk++c+CTiko3y8r22Lkle4lXnx1SdT9jNOj
 8q/dGZVRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk4ByG/5596+rrGOfnHjpa
 dWVX8gKjh1sK5y7eVxzv5td14bnsmRmMDA/qsrRk6hS3OYunK3yZ5REn1FW/7fAn9rcJCm/7+R4
 9ZAUA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_compr_task_new() allocates the driver task before validating the
returned DMA buffers and reserving file descriptors. When either of
those later steps fails, the core frees its task wrapper and DMA-buffer
references without calling the driver's task_free() callback. Any
driver resources allocated by task_create() are therefore leaked.

The dual-fd allocation path also jumps to cleanup without storing the
negative get_unused_fd_flags() result in retval. Since retval still
contains the successful task_create() return value, TASK_CREATE can
incorrectly report success although the task was discarded.

Preserve the fd allocation errors and call task_free() when failure
occurs after a successful task_create() callback.

Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Fixes: 3d3f43fab4cf ("ALSA: compress_offload: improve file descriptors installation for dma-buf")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
base-commit: 419f8dc84429d67db48393ffe6aa420ea38064e0
---
 sound/core/compress_offload.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index fd63d219bf86..ea699491f0c3 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1083,15 +1083,18 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 	   file descriptors are allocated before fd_install() */
 	if (!task->input || !task->input->file || !task->output || !task->output->file) {
 		retval = -EINVAL;
-		goto cleanup;
+		goto free_driver_task;
 	}
 	fd_i = get_unused_fd_flags(O_WRONLY|O_CLOEXEC);
-	if (fd_i < 0)
-		goto cleanup;
+	if (fd_i < 0) {
+		retval = fd_i;
+		goto free_driver_task;
+	}
 	fd_o = get_unused_fd_flags(O_RDONLY|O_CLOEXEC);
 	if (fd_o < 0) {
+		retval = fd_o;
 		put_unused_fd(fd_i);
-		goto cleanup;
+		goto free_driver_task;
 	}
 	/* keep dmabuf reference until freed with task free ioctl */
 	get_dma_buf(task->input);
@@ -1103,6 +1106,8 @@ static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_
 	list_add_tail(&task->list, &stream->runtime->tasks);
 	stream->runtime->total_tasks++;
 	return 0;
+free_driver_task:
+	stream->ops->task_free(stream, task);
 cleanup:
 	snd_compr_task_free(task);
 	return retval;



