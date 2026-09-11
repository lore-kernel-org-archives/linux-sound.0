Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5383E49D4
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096291; cv=none; b=bzs0c8Wl5V8NyhtTD+zK9rnWulW6+cqsGajiyIp8MRE71qztqnNPBVxUu35FROjqpVhR/GPq8PFdQAusU/qBikG55ID9nHgTYGMvpsF7Jg1FjB51kHlJ7p3Z2D8y5qnaS7v6pikM3439dLvFVNo6ruP7FdDXY7dgZ7mPIDvN9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096291; c=relaxed/simple;
	bh=IsH/uiXS6PCMYKUcTa6HJLyo15+CD5yZpyixAyCfD84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q/d9uf/gXdepHacezuHjD2SWiGx7Fs2LPusYlmK3gmEDETtDdCfRiD7+nui7WrEjmaxUQT8C/9gYoJ3Dq/buNgXtlWeVzU6osUBYrKMwCZLDJc00Lz/E06gJ+1OKLBB3qwoLQxdmFhiTo2LeqHUMtbKdcG0p2Wh2tP3kIoYQzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgm6T8Kx; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgm6T8Kx"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9399daa3d43so31826385a.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789096289; x=1789701089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+7mpvDw1F56ZPu1ONqje79/4zvVptkv9Mg6Nl0mTjo=;
        b=dgm6T8KxbyCxESOM4r/q/CFHYw+ksIcv+MUJ3BZwIginVpvVqLvs+KULqtJcreG2o7
         /UdQXv36CbYJ8MwUmKKUJSOsU35ohzJ5onzRDnK1z6uojOhOWuYal6KhFvSGVIJmMDYn
         Bbapo5gb0sk05iUt/utI5HQO5Ah/vkZDoTsDbljbwMAvM+LZd/AcNcetPwy64WXgZw6z
         5ZjXrDI5fdOSEr2/mr9cvcNuD60AO4QvtDMxBB7fFdWRujCWC0xRJ3277xO+vFK1ciMX
         8KtmCCIcgcP2463cBXEl3ZHoQDutfsAxyFbaU5Vz3lYI/nbyA7Od91GKcmUuagGKfdcl
         3UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789096289; x=1789701089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+7mpvDw1F56ZPu1ONqje79/4zvVptkv9Mg6Nl0mTjo=;
        b=ApfZH+0Npt0M/Z6H2Y+KKz920Yt03wcPUXT9BOovvW0BFhf94784DFK8sg/ZVABClf
         CyC28opWA47vFQXVDx9KEpb0sIVyDO5RZ7IUo+LAhxjB8hfLdtmwV18g2RA2/Y3NY/pD
         o5wlAhbYeMtuxGFfmxudwwl63U4OtJYB9K74Fkh/xglBMAzXKU0m2C1KcWaQwV6zrzZa
         agWEzWpNE0ivM6OmIp4TSavKaYtFJwgocozQPaYMFj/truzf2Vmy3cHSDEDsU9HqKoTz
         QnhLrVcnYRfz6RLnCTeJ7ZcSSiEDbeLOxd58Vsm2IXHNv05D1PKVBmD8bH+vA1FU3Z03
         JjWQ==
X-Forwarded-Encrypted: i=1; AKwUvBybHniu6LVZ0X3w9q288RoJ+x/EV7+GNdaneK6VVsZBTERdBLTPa4s6QaM6NgVztS5zcZ2xO6oSo+5/kQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mVbPhSfgWTjf8kpIpaP8LYzCJ58JByVasBIO4x/3s9GA3fx9vJ
	Ptar/wHFbrWIa4/m5zLwYsBFGLQfObIsERHsMzwJLmP1vxpBUqwksA5Z
X-Gm-Gg: AYBFou15u7E0gkJzvmKg8N6Mz4sYuxODZ57C/QI5TuPkBxk+R0wU68lfFwbVa8ADdd9
	/jPkti/rdf5TTbET63V5G5X/vo1zRjRx1Z5ZeJW9xpkQdt2xndVWishH71I5vKpdZC4mBPqtF8K
	l+AQI8Yd2conP+qjFPddSJ7LjFIHwmwtbYBoMNjlzEAPQ3QkaREXFRC3QEg1v2anNVELAhuR2C+
	PFhHk26u91VkeEW9hgYV7Sh/Ko+Wvi8jQ06Fx8y43swfWBh8JkiyYlXHKPfrD9wK4lrmca0lixb
	FJ/Iyz4aDbYCft0L9B89Z3YrOynDlWtYI2zbCrFUgipMVQxJR2cKesdI3UTdXHWsZ1F3HrsL/wr
	qgpAplTww3o9+xPo7YLubhzRWZ7H8MqfDX+O6jFVx0UPw/kFjpT56OF82TgvgwhK9byVusiWoOV
	ZVZaHDkMTZvCa5NQ3G0dBCgwZ5vw4LM//kImOXuQLox6iamLAJHmIA1ftuKlnrs2JIBkFoyjwTg
	/NB/1Terrwxsq1nYA==
X-Received: by 2002:a05:620a:1a08:b0:934:970a:beb2 with SMTP id af79cd13be357-939ea22a13cmr252005985a.26.1789096288727;
        Thu, 10 Sep 2026 20:11:28 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm136878085a.37.2026.09.10.20.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:11:28 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] ALSA: virtio: reset device before deleting virtqueues
Date: Thu, 10 Sep 2026 23:11:21 -0400
Message-ID: <20260911031121.1542502-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtsnd_remove() and virtsnd_freeze() delete the virtqueues before
resetting the device. del_vqs() frees the vring backing, but does not
provide a generic device quiesce operation. In particular, modern
virtio-pci keeps enabled queues active until the device is reset.

Reset the device before deleting the virtqueues so it can no longer
access the vring memory when that memory is released. This also covers
probe failures after DRIVER_OK, which unwind through virtsnd_remove().

Fixes: de3a9980d8c3 ("ALSA: virtio: add virtio sound driver")
Fixes: 575483e90a32 ("ALSA: virtio: introduce device suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 sound/virtio/virtio_card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 647190f4d5afc..6f35276416fed 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -354,8 +354,8 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	if (snd->card)
 		snd_card_free(snd->card);
 
-	vdev->config->del_vqs(vdev);
 	virtio_reset_device(vdev);
+	vdev->config->del_vqs(vdev);
 
 	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
 		struct virtio_pcm_substream *vss = &snd->substreams[i];
@@ -383,8 +383,8 @@ static int virtsnd_freeze(struct virtio_device *vdev)
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	vdev->config->del_vqs(vdev);
 	virtio_reset_device(vdev);
+	vdev->config->del_vqs(vdev);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
-- 
2.43.0

