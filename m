Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC294A3860
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965742; cv=none; b=fA1g+E/pY0B39/frLy3PzLWHfkd4wzCL0HPFS4g4sLRbRtOlHl1ovz3WREY3L1RPxMUe1nMU1kdX5QGZqO/DYCBpzFI1EfEnhpJV/772omw1FDhU9ie5i5rBuNtVvm1JCu/x02ph00xCepK/NpopEo1hIDpkGMlzN/GqiHbpJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965742; c=relaxed/simple;
	bh=OFqdtS1oJTHFvjngsO4Nq8qXONJKrjQgc65t4eunTXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2qjzVaHMyRfKshxaGIJZTu4oSYHL95ZnuyWU1ulSBX67qcA8j9qLHPaZYEGq42n4MbTx1dNED8AGm6BxSSmEWjIpR23Nv6yEmOWtAoBz3Nyvb6SkFL6iBtJFZWNfQUhKU90LIvuOg3Y7s87uPRTymYc5/BtkrVSOXXI/kSa55o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnLALEoB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnLALEoB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e940d5d2beso1083245ad.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791965738; x=1792570538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=qnLALEoBE9FCIEmoFxOEEq6XrTm2jpAZwAOj3TRAMXzST6bWep2h75nUE7hjoPz1qX
         Ecd4k5m5HpqCVPN+zPaDPKreTaINIEKAbxhKz24aHxEQdDADvApbgwhtNrrS2ONGloDe
         2gge24KT6Fg2EO4eCZX/lx5aQ67t3SA0GzEGKW0MbvCcPJBXXPUtyCXh9yQis/aSRnuW
         wI1FLir2dYPGJRphvoX5jXh+dzPdXxKL/3GbCW7PchcAQ7HdpoewfN1i8AprqLrNfp0w
         1qN3wLviIVrJuKoKL3S2jWMwtvBNmScWPJ9ncTQRHJ1biSOawVS3hZ6pBYc3Of3j1GGg
         wxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965738; x=1792570538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=cAzEdNPam8fxNYMCDWJa7CubVJEUXADf9byqJzbbc9m59BHrend3mwJo6SNOw1SSc/
         dbYPXJsyIKAKKVhAzfs5w31q/WwVzVZkKRYO/JjbxZYXZHO6dg2/Z5CgqBz9ugk/s8jN
         N8y5S3eNYN0q3OGNe9MkGQ7HvS2le2ytD0bcFANqI5G7FyPmT5rOni1jucav00iEpFdm
         r7iLIcVdZKGEA2PAMLGuT4fTAdsb79RJ1HSBKTRuPj4dWYw6i2jayZ32tuV95lVslsBG
         KzKO9Hpaft4bkYz6y0VROZhSFCtT8ZGPVkO97aDqzEPbpiYZl1uPlPeNMMrkqROQT2gm
         vb9Q==
X-Forwarded-Encrypted: i=1; AKwUvByO4V2qFiWvbw0rU81w7fYZ6CG2BnvI1FPK+k/qB1T8AyHB/sRixaedH742OcDeqW/N4NzicynmNGpA+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTmXGNTOaz+vhCXtspGsynuvcB9pwC3yazALQFc0JdCm7dNet6
	7ndawh14Zt4If6aMtXmx7S5Pm16Pt/VJzJ9vLMdcT78964w/sIMN7EzNcvLDVQ==
X-Gm-Gg: AYBFou3uIFNxXl4MYpyJS+0oTSOf7KaY5v+sYQdZXMH9PvlZ0Oy5tpWTZi7pw04HY+z
	fDJEIRApQpphjkKs9UN07iGiGBsMCQI4/stQxcjtzMcGLc4A2sa2dY5JqlT/DKfNEJV8LpsqRkT
	DcEjru8eWgPVq9sQUk1+Bi5p9Arygd3xBvt23CnNyfl/hOXtSfMct8scOdAX/VhAiOrlVsyYlQw
	vBHHCMWm/cfOHlG5VmhLCe+9AKKcZ7ba75WtBGa1qmtDMoA+B6Kc7Vb1zRAIQ0WYjuIq3cVdfeQ
	otzG4lhPCn1ishlXRcwKigne8sdhyjm6g9BGZ5UNEsuxry5x+gaLJCbkrhXghZziO+DJpwc4diC
	iDVifNbqurSIqjfdkjCmU8rQxpck6TId5P1soLS7RtVGygUITyNjQycZWqYfxHIO3xsalF+gVWN
	ZPN0GraqlmxDAt2/dVv+b3Ts1gaZSgNEAWYV7K3C5EQ/mbKv6mB31etByUI/cv7/waIifldBRZH
	hs26ftixQ9NvZQaGy1H9eBOU3HFhaItAQNZwcRqRpOQlOIrlw5lc9JKQAreLyU8WjA4wXJ9FSXr
	AfKj1tcbGDCE5or1
X-Received: by 2002:a17:902:f550:b0:2e8:4bb0:21ff with SMTP id d9443c01a7336-2e84bb02397mr126394125ad.68.1791965737876;
        Wed, 14 Oct 2026 01:15:37 -0700 (PDT)
Received: from localhost.localdomain ([121.137.86.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0002csm67533115ad.3.2026.10.14.01.15.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 01:15:37 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/1] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 14 Oct 2026 17:15:32 +0900
Message-ID: <rfc-v2-generic-control-wait-1.2eddd58a796e497f@gmail.com>
In-Reply-To: <rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com>
References: <rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A signal can end the interruptible wait while a STOP or RELEASE request is
still pending. A later teardown may then submit another RELEASE before the
first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels the
pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_ctl_msg.c | 15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 2e0ff15e729d..e50e6c7f3b8d 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
index f867b9b9233d..d84f0740fcb0 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
