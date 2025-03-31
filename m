Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C222B9A8
	for <linux-sound@vger.kernel.org>; Mon, 31 Mar 2025 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743438853; cv=none; b=qpKWx2O7JKrIpJauonOI6PQJOuoa/Z+gAatzpDgvQxONB73d4Yjs2F84ajGmvvO1wCMl1Zp3I4u6Lay4UM/WiJNTNKA301aY3o0jivjMJCoSXhPyek/Sgg6DSyX+AC/QTjjnBlSVZPpjbl+R1zikFmLmRbGZ7UlJVIGiMeCP1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743438853; c=relaxed/simple;
	bh=LyymiZcnvyCARp+PZ9YDJ/WjZzd+um0odXUXVVG8jWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCpElYhnwt0YB9B04CNF9O95OvT00hYrS/teSsPhYQ2ugloeyrfwDQzw7L7r56UDL2vDuqcRKTU1UoCblV7C0C8GM/Eq2suX/WSoxQEhvC6DhrbPZLwqR/OtrDR97bl5ByoTC8T+k+l4tnokEaTMRts1WoBX5Zu7i7RTYDP/1iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UF4MBujQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UF4MBujQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743438851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=buRU4hcgPy2p/+OGQ7gQUBzV/bybYL5hkzFKdPTt7bo=;
	b=UF4MBujQ8sYrKPxc2J3IpGdlRIFP2AACCveL1IlsBvhYMcB+u05jWbewIBW8THsrMz1QXr
	R7mnTUYfZ57DFTHIzOV+SOFu8kH4VBjTBsOv2xYzq8jhEjzBOQNqc5WyZbZSynRzfASiN1
	VJS967WZi5sZtc4Y45RZo6AwTmh5d/A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-aoK2RIWKN9SB2tgKc2sz0A-1; Mon, 31 Mar 2025 12:34:09 -0400
X-MC-Unique: aoK2RIWKN9SB2tgKc2sz0A-1
X-Mimecast-MFC-AGG-ID: aoK2RIWKN9SB2tgKc2sz0A_1743438849
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d01024089so42197675e9.1
        for <linux-sound@vger.kernel.org>; Mon, 31 Mar 2025 09:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743438848; x=1744043648;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buRU4hcgPy2p/+OGQ7gQUBzV/bybYL5hkzFKdPTt7bo=;
        b=MDX0HBu8EGOwWcWiFNcAXildUL9O+DY48nkVUwe3hA7WQcAhtLgCCxQjDc+92yCZP8
         py27p3H1Zj/EvV3jLCVU/sakqs0EDpTdt5Ay7pMPxjvJer7cYpFeYomKqCk+L7QwzhzF
         DHBrTmOV/Sz7v1iscQDR+fgW6ppPijz3RGGyeWhjOUg52Xna56Q+Ey2JOraF/c7mipZG
         m1xvXk+smK770avyq9S5u9Wp+njpFXd6g9fmnqIW05JpBvu41+1/d/ghvrfYjkL71BYe
         lis198qVkaxFAbb3ilbyuoiG2fFoAA4mNiY6atYGDBfKdPdlhr4gRRhaLJ/4hEhTWbfM
         8a7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcEWVgflPIvVSVULcn8l/073tIvbVt6u5Nq/Grpu+KEsycZ4NBDJgXZiSVAsDP80HMH+JZsZAWQZG1jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8yV3X6mtth3GMfcrnftUfquT+GkYUcVOJySYZ7dMFSVQiYJ2
	iIfpNGrkZZd9pFQMy7HGmY2Q6Au0KodMNN4DFhlx1Md/iQs1Fn5vmFxceYgC8mjc/Amd4hc5dMK
	0W4tfhpiQr1uyoq03rTe7IIpsOIwH0ZgJARFM1HSKQVbNMkjG2KecIJkystuk
X-Gm-Gg: ASbGncvVEkWLsWAYQowEIcmZy0HwSdD9texxNkGIB3GUd+eU5To4haCqfvAqnNK2rg0
	4VrqpT9DoO0l4lcHXdX6w6AhSZi3w+wReTkpfrOWC16jbcD+0IV5Y+VvsVdn68r2IgzB8NiKP0/
	sskrl/mw6fgDybMHuESuKBRiERjggbLZ3jJiQlX5HvW91rK75FiANSIredpT2rSiYEHYdr5cS7G
	06i+XBdLArz2wji5Pw0i9iTdklIXTIMUNa/M44laFTBlW0cOm0T7SFR0vaCrmGO5W1gp5lbrG5l
	iJb77v6p7g==
X-Received: by 2002:a05:600c:8117:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43e8e3cf858mr88891405e9.16.1743438848570;
        Mon, 31 Mar 2025 09:34:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRJoF9PNksiJNrRvv1RABMA+H1wRnu+cFNlckFr23sh4bFVTCISuxXvKws13VYTTCpsWyCEA==
X-Received: by 2002:a05:600c:8117:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43e8e3cf858mr88891065e9.16.1743438848107;
        Mon, 31 Mar 2025 09:34:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efeb11sm171403855e9.22.2025.03.31.09.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:34:07 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:34:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	anton.yakovlev@opensynergy.com, bettyzhou@google.com,
	cong.meng@oracle.com, dtatulea@nvidia.com, eauger@redhat.com,
	eperezma@redhat.com, eric.auger@redhat.com,
	hongyu.ning@linux.intel.com, jasowang@redhat.com,
	jstultz@google.com, kernel-team@android.com, kshk@linux.ibm.com,
	linux-sound@vger.kernel.org, michael.christie@oracle.com,
	mst@redhat.com, perex@perex.cz, sgarzare@redhat.com,
	si-wei.liu@oracle.com, stable@vger.kernel.org, stefanha@redhat.com,
	tiwai@suse.com, virtualization@lists.linux.dev,
	wangyufeng@kylinos.cn, wh1sper@zju.edu.cn
Subject: [GIT PULL] virtio: features, fixes, cleanups
Message-ID: <20250331123404-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oLju8LR1AmoNaNymciLj6uvdU_oWDcLZcbgt0HYJIOQ_1743438849
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 9d8960672d63db4b3b04542f5622748b345c637a:

  vhost-scsi: Reduce response iov mem use (2025-02-25 07:10:46 -0500)

----------------------------------------------------------------
virtio: features, fixes, cleanups

A small number of improvements all over the place:

shutdown has been reworked to reset devices.
virtio fs is now allowed in vduse.
vhost-scsi memory use has been reduced.

cleanups, fixes all over the place.

A couple more fixes are being tested and will be merged after rc1.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Eugenio Pérez (1):
      vduse: add virtio_fs to allowed dev id

John Stultz (1):
      sound/virtio: Fix cancel_sync warnings on uninitialized work_structs

Konstantin Shkolnyy (1):
      vdpa/mlx5: Fix mlx5_vdpa_get_config() endianness on big-endian machines

Michael S. Tsirkin (1):
      virtio: break and reset virtio devices on device_shutdown()

Mike Christie (9):
      vhost-scsi: Fix handling of multiple calls to vhost_scsi_set_endpoint
      vhost-scsi: Reduce mem use by moving upages to per queue
      vhost-scsi: Allocate T10 PI structs only when enabled
      vhost-scsi: Add better resource allocation failure handling
      vhost-scsi: Return queue full for page alloc failures during copy
      vhost-scsi: Dynamically allocate scatterlists
      vhost-scsi: Stop duplicating se_cmd fields
      vhost-scsi: Allocate iov_iter used for unaligned copies when needed
      vhost-scsi: Reduce response iov mem use

Si-Wei Liu (1):
      vdpa/mlx5: Fix oversized null mkey longer than 32bit

Yufeng Wang (3):
      tools/virtio: Add DMA_MAPPING_ERROR and sg_dma_len api define for virtio test
      tools: virtio/linux/compiler.h: Add data_race() define.
      tools: virtio/linux/module.h add MODULE_DESCRIPTION() define.

 drivers/vdpa/mlx5/core/mr.c        |   7 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c  |   3 +
 drivers/vdpa/vdpa_user/vduse_dev.c |   1 +
 drivers/vhost/Kconfig              |   1 +
 drivers/vhost/scsi.c               | 549 +++++++++++++++++++++++--------------
 drivers/virtio/virtio.c            |  29 ++
 sound/virtio/virtio_pcm.c          |  21 +-
 tools/virtio/linux/compiler.h      |  25 ++
 tools/virtio/linux/dma-mapping.h   |  13 +
 tools/virtio/linux/module.h        |   7 +
 10 files changed, 439 insertions(+), 217 deletions(-)

