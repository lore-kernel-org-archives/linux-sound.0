Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F018A6C1
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737008722; cv=none; b=uZ0BF7nWZe5MkSB30GJ4XZFlgmJnh0vhkHtsgeXu1aoxbdkLnpltoR6clE745Emv6u0CaN8yIxcQzCX5bxpc22hFudCG2r4g6IxAYh1SMlwC9xy3vQ6C2JrDV3XtWIZfVNygNqYnhGsWOQTKJXkevTdFAAKgWLq7Iwzzbqc6Ei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737008722; c=relaxed/simple;
	bh=WMJn4P15Uop0ZUJaj8l/izNbz6zUAeoohtTpPY/IIWw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RZim2vW56EDNIA3B317yhMAzMOoSGEYeoYugoegkOb17yFPyFxmwu1WLjW2PtevAfBl5OVG8WcnjYp/DRTZDbDnjQGAew5+HwDOELA3SaaYKRVXYLxC7F+3GceImamErrWhoV99RlawUpLup+xgMWi9gZD8Bq8ObnO9/oub2vwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ut17uI3K; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ut17uI3K"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2163c2f32fdso17234145ad.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Jan 2025 22:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737008720; x=1737613520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0AN0Fv7sq/hB9CZnHK+4fFyVr9YDFDdUdaXoaXDLHo0=;
        b=Ut17uI3KBSdLqI05uGPeQuWDsszKx96ay15OMqzd1E1bLE5xLdM4MgfPy+gluPpUMy
         v/Y5hE88RZATL1ixBAaGd9e2v0pP6kVwSrHF2LRINGuSo7mL9eFV1SXuFW3zGT4FPdX0
         1Zl14vVXvhQarHOLPAkQX/CG2VLcSxtSLF7oLg7jVauvxVszDqys4BIUFmkS0eMesc23
         BSKx226XRpSro7GnjRhQV/DnHrc116uIyiQo+RwnjJr8uOVmH3XKgN9wmhSDjmp3YyVV
         1V0m0H/oV5h6ygnR2QrS/1Luj6UQeXgvdcldvEmCJMMJVVUEqQ8QfOsMlXg1482jYMCX
         jSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737008720; x=1737613520;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AN0Fv7sq/hB9CZnHK+4fFyVr9YDFDdUdaXoaXDLHo0=;
        b=R0TWep0MkRdhy6Ii3Zb6QjtS/AHXxP8ew3rRsvS3OhutAr3NmvXPA8BDuO1idyEi/H
         2FMg83deA4V3A70p2XYyK8oIL5diemhFVwMjIV/G0bkOpddrnRBrMb+jEMj2mhCWZAPK
         BaPE7zO4LKsZGuQo29LDIgFvXrWvE/ijuoMecZBomHAvDYWCks0bOyGOzlRYyjfZZPj8
         XwdcjNWZZqwZjEF5iz5DpmlAOCaxDMv49LjXGWmyg8qMKbzzqDBqzLFskG3LUfdTyepK
         yWXSFWPIiicKNIoa4fe9CMO9Pz8x7Uu3JQeQt8f8aiiuidSHEzRINRRcykYtLJXTH96t
         75JA==
X-Forwarded-Encrypted: i=1; AJvYcCW66rJR5dXWE7AQgb4zTs2tHM4yO80oKMWolVycfeT4DAJ0f4fEHIhfkWtCcT/mlR5SVYaC7OLV0UOiFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPVjak4onuI+Vl7sB4CbM7iuQ/TcL4DCAK2uLePjwLkl6PXYhS
	M1sH3XyfxEvJjPzAaqKGu0EuK5i2al2EKe8wLwnsW0dysE0obJR+KQ/LLhAEapNOfJV8MNyrHsd
	j3D1B
X-Google-Smtp-Source: AGHT+IFuQloDZ6I9ZKV+hzAUpeyDuwaFLgqIic+b8+hSoEirG8TVYZ5FbcDjE0Zwn+8UmU2ObD/PiAwBYNLJ
X-Received: from pghv4.prod.google.com ([2002:a63:f204:0:b0:7fd:38f5:be0])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7885:b0:1db:eff0:6ae7
 with SMTP id adf61e73a8af0-1e88d36152cmr48823832637.33.1737008720197; Wed, 15
 Jan 2025 22:25:20 -0800 (PST)
Date: Wed, 15 Jan 2025 22:25:08 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250116062514.2391108-1-jstultz@google.com>
Subject: [RFC][PATCH] sound/virtio: Fix cancel_sync warnings on uninitialized work_structs
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	virtualization@lists.linux.dev, linux-sound@vger.kernel.org, 
	kernel-team@android.com, Betty Zhou <bettyzhou@google.com>
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

The simplest fix seems to just check the work_struct->func ptr
is valid before calling cancel_work_sync(), but I wanted to share
in case folks had ideas for a better solution.

I have not yet managed to reproduce the issue myself, so this
patch has had limited testing.

Feedback or thoughts would be appreciated!

Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: kernel-team@android.com
Reported-by: Betty Zhou <bettyzhou@google.com>
Signed-off-by: John Stultz <jstultz@google.com>
---
 sound/virtio/virtio_card.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 965209e1d872..87dc49c9390a 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -365,7 +365,9 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
 		struct virtio_pcm_substream *vss = &snd->substreams[i];
 
-		cancel_work_sync(&vss->elapsed_period);
+		/* check we initialized the work struct before cancelling*/
+		if (vss->elapsed_period.func)
+			cancel_work_sync(&vss->elapsed_period);
 		virtsnd_pcm_msg_free(vss);
 	}
 
-- 
2.48.0.rc2.279.g1de40edade-goog

