Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570E4414
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737056483; cv=none; b=Pf6UgaVZxevAiVw1Emysx67UGWkFWlhFv2FZAeROQBGM/zrFOD7tza9RR3OIQlujVGiC5kqWXUEusxjbuzO4uWdD4agiIkFqzyIqmml4IF3wSuVkK62kZWMN60oxxNnvfmum0Id7q5DZdE1zwYHAxd5YOKxWTprmlNp8MzJzntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737056483; c=relaxed/simple;
	bh=9teq+JaoUOCCJi8v76Xn+Iblh9s5emNTyUVHhpT+Amc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Slspkq0grhK7tsXdeNzQOsWI3kTE0MYUVimu68HyssjzZ13CTXUgTjVlk9wkdka7Lhm5iyrIgohhDRpR0CcGjzzk8iEjoOmFYh7bBGpXYf01QBP9fwkHT6r3PocmzDzQu0a8RPiwD++mKXa8zhCt4ndl1LqA5nr84QycocEAPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HANtayAE; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HANtayAE"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9e38b0cfso2708508a91.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737056480; x=1737661280; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9c+mKdS6UvxTM+mMX7MZ1E/vU8+YRkTBKKT8mptdijw=;
        b=HANtayAEJeoH0SSrKKVHHmgf94Du++CeyorgZYqE0Eq5XPe9LEZpIJR2HbC6w5QFrx
         V4nDcKQoutYma5KMLcsdbzw5r3wUzBJxwce+1Rwn2BJEaREkfX1fM8/hTq6SPi3Zs1YA
         Nrz0TWfiQ/MRSAb0mgE6oA7sSlVUosJPBS76niV93/aNy36GOhTAh5jOWDBp0N1ug38r
         R8moy+ibaGQWLHLzZIl66ymdHoCak7uJbnlM396MlzpctwLKAepWoYr8c3OKtUkDwRYk
         Vesi0QNB8cYwZ8dpHECfXNdt0q1OBLbOCtH1ekg3Ajr2udDW+Foh2srkWowTNdJnCHrS
         tg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737056480; x=1737661280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9c+mKdS6UvxTM+mMX7MZ1E/vU8+YRkTBKKT8mptdijw=;
        b=venNp9VjNVxM+vICOEy7mcPH4U4st/ZaBLZS5VGeibm2F6q4pHiip/1X83sNiFxxDc
         WprlG/mOIoHx1lr8C0nECzSR+BehN8RtP8NXN+JnrFFQ/DoLk30tt+OyMBtO++SqCb+k
         RA4DBrVc/q7VQTbWjsz1FIYnriLkEKGvmSsCEVQlISZESUOS6b8sdu9b6A55aJZcYwpZ
         sV5a7s3jhO26awUZZYRsLKjKZ+21GIKxDoKx3OYuMtXSXYSeHvOiCQ1fb5BMWKHndGOj
         16pe8O4Bj/R6rKOHjKfSshhlO58XGK5qTfPrvhn3V47ZYlxhpYFviclkH5dJD+OncJEZ
         X6ew==
X-Forwarded-Encrypted: i=1; AJvYcCVlOz4EcmDSdU02nq4GFW3GjrHi9+a160eeCJotMs0Tr1jjliuSdx/7odQru9esBWqyZVUsUpPN0bihbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVqhIgTB1tJYCj+Rf1vQu0hN21TW9xl3tWs1ABi1GcqBZ5ZkJ5
	3rBdqX4aUkaRDsFrV420WAtsjKoLA9ywsBAzlvqd1CM3ZAxcFbIf4V0AUKuZx8OK74Al4tq0w8c
	3z5hB
X-Google-Smtp-Source: AGHT+IHAxCEfJhjinmdp7iL+RcQHMoAkeF1j+7nASLrBvD6x6xTr0/mXwbpnY2YoABTiPpn8G6D6/jrHd328
X-Received: from pjbsn6.prod.google.com ([2002:a17:90b:2e86:b0:2ea:4139:e72d])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:258c:b0:2ee:f687:6ad5
 with SMTP id 98e67ed59e1d1-2f548ea5b95mr51110210a91.2.1737056480195; Thu, 16
 Jan 2025 11:41:20 -0800 (PST)
Date: Thu, 16 Jan 2025 11:40:59 -0800
In-Reply-To: <87ed12j20b.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <87ed12j20b.wl-tiwai@suse.de>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116194114.3375616-1-jstultz@google.com>
Subject: [PATCH v2] sound/virtio: Fix cancel_sync warnings on uninitialized work_structs
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	virtualization@lists.linux.dev, linux-sound@vger.kernel.org, 
	kernel-team@android.com, Betty Zhou <bettyzhou@google.com>, 
	Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"

Betty reported hitting the following warning:

[    8.709131][  T221] WARNING: CPU: 2 PID: 221 at kernel/workqueue.c:4182
...
[    8.713282][  T221] Call trace:
[    8.713365][  T221]  __flush_work+0x8d0/0x914
[    8.713468][  T221]  __cancel_work_sync+0xac/0xfc
[    8.713570][  T221]  cancel_work_sync+0x24/0x34
[    8.713667][  T221]  virtsnd_remove+0xa8/0xf8 [virtio_snd ab15f34d0dd772f6d11327e08a81d46dc9c36276]
[    8.713868][  T221]  virtsnd_probe+0x48c/0x664 [virtio_snd ab15f34d0dd772f6d11327e08a81d46dc9c36276]
[    8.714035][  T221]  virtio_dev_probe+0x28c/0x390
[    8.714139][  T221]  really_probe+0x1bc/0x4c8
...

It seems we're hitting the error path in virtsnd_probe(), which
triggers a virtsnd_remove() which iterates over the substreams
calling cancel_work_sync() on the elapsed_period work_struct.

Looking at the code, from earlier in:
virtsnd_probe()->virtsnd_build_devs()->virtsnd_pcm_parse_cfg()

We set snd->nsubstreams, allocate the snd->substreams, and if
we then hit an error on the info allocation or something in
virtsnd_ctl_query_info() fails, we will exit without having
initialized the elapsed_period work_struct.

When that error path unwinds we then call virtsnd_remove()
which as long as the substreams array is allocated, will iterate
through calling cancel_work_sync() on the uninitialized work
struct hitting this warning.

Takashi Iwai suggested this fix, which initializes the substreams
structure right after allocation, so that if we hit the error
paths we avoid trying to cleanup uninitialized data.

Note: I have not yet managed to reproduce the issue myself, so
this patch has had limited testing.

Feedback or thoughts would be appreciated!

Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: kernel-team@android.com
Reported-by: Betty Zhou <bettyzhou@google.com>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: John Stultz <jstultz@google.com>
---
v2: Use Takashi Iwai's suggested approach
---
 sound/virtio/virtio_pcm.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index 967e4c45be9b..2f7c5e709f07 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -339,6 +339,21 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
 	if (!snd->substreams)
 		return -ENOMEM;
 
+	/*
+	 * Initialize critical substream fields early in case we hit an
+	 * error path and end up trying to clean up uninitialized structures
+	 * elsewhere.
+	 */
+	for (i = 0; i < snd->nsubstreams; ++i) {
+		struct virtio_pcm_substream *vss = &snd->substreams[i];
+
+		vss->snd = snd;
+		vss->sid = i;
+		INIT_WORK(&vss->elapsed_period, virtsnd_pcm_period_elapsed);
+		init_waitqueue_head(&vss->msg_empty);
+		spin_lock_init(&vss->lock);
+	}
+
 	info = kcalloc(snd->nsubstreams, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
@@ -352,12 +367,6 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
 		struct virtio_pcm_substream *vss = &snd->substreams[i];
 		struct virtio_pcm *vpcm;
 
-		vss->snd = snd;
-		vss->sid = i;
-		INIT_WORK(&vss->elapsed_period, virtsnd_pcm_period_elapsed);
-		init_waitqueue_head(&vss->msg_empty);
-		spin_lock_init(&vss->lock);
-
 		rc = virtsnd_pcm_build_hw(vss, &info[i]);
 		if (rc)
 			goto on_exit;
-- 
2.48.0.rc2.279.g1de40edade-goog

