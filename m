Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6EC3290C9
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 03:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948648; cv=none; b=WWzomDf2qY8vsr7i7g9DN0CooMXM2X5BObyhBRItkMaqhMut/TosytSjQF0ZNpA2h05cJgzA+OQiWpsk9fGcXkeC0u+ZsRyn+nnZIcxqbcp15YnaXloYChBKf+7O9bEgRSR1rP11qhPL080KLz6QyYC+GAcFIINkggiUxXE1zqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948648; c=relaxed/simple;
	bh=OFqdtS1oJTHFvjngsO4Nq8qXONJKrjQgc65t4eunTXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTcIkBpBBiltUkHQxoWNnCPJMp+J7h1MJFJNzueJawEwO4T2Z5MnCi6tGiS5L/ayMpkkng4jx9R0PQTcOO5DmYU69T4dhaY1z0CSFXXqKMtEmD2OFyXI2usnsgytR0KchkCsmV7qHy68f6uHJOSvK/WgFmkkvMccIS1v2G12E9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fg6S6giP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg6S6giP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e82462a3f1so2994615ad.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 20:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948647; x=1792553447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=Fg6S6giPy1cTGicIRev2RfQlt181dIfxGVdcFTizz5fzPIIUwt///clE9SNZmu+F08
         KksgRVk5iZVnT4Jev1vS4n01w1iktIhcARGV+Jb8zRWU5r48/KXSvDh1olXZvwNqRMWi
         z97yoPJp5PlyTT4E9/TQiyhAKrQ29J9AZnoan7GKbwHV7tyf8CQ16R2FF9O7dRJ99PvD
         tY6vYTHXgt1Bqg7QKSLUdR+n0uc3KiHSxK1LZ9Qs3YlPx2CTXqEBAvTK36fTsYz5TIhQ
         KzRhDNmslOjn0NyrqCvluKpTgTauzwLmNC92QNV0ZoLYa2ESmDX1M9IRK+ZYJX7L0/sG
         B/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948647; x=1792553447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=NqKQwShc3C3ESSdAi4uuMwZ/g92kPxBD7rR9Yb2LLwlsOCHiZBy5LPYCcjc76etpfB
         laHMLUyUFAqCMKn8epVfAT7FicoCa0ItERqDL19muwmFvIQckaXETU7reUnpbYplmS3A
         /MyVymuU0Gyygr5OyDq4QdDTOt6B0BrD6vOVw67E+kG5iGIIglOt5GP7UURwqWCinfQH
         s4U419ORQHnLvcaY47LL2Woq9dyhReAVUPmUMsYrG8Q7ulghiBuTupCPK9AduZWkzB2q
         JN2+PoZ7Muq1cRpK9vJg17rGjI6brKmNZRxF9mPdp0vCUXbbOJSwJqQ6kw8JufUsKvMo
         QoGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYMugqGP1TnzWv0Kxo9gSsuJh+it89oN0mAMAHvxr7H5QY6mRKRG74t6HZFf5/UvtvPQMRySk7DXURWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJG/c92MQWHYEgKAs4ap899bT4H0IpDL/STMv41aIejyfuPAL6W
	+26lv4VQcegsk1hMlgKg/cQu4aVrzb9ZPtki1Vz3TU9QzRSuJXt6ko5G
X-Gm-Gg: AYBFou1YVmrxNx1UmV444yzaQCjPsp98xLEpO9+TXI9l+YSYED5yI7vlh+IA0KG47Ht
	8+P7YsV5I6/+ZkmdKPfaCAqtKbJTgr1ThPxJkRoHuGXTATUOTCbWn2pJ6SHrEUiKi87fBa5IwDo
	b2c/S2huLdLpYni/pgSamI0eSLEwso4tddMeA/sciePQ49+qZ1nIxPLQjJf/JQD3A4QeL8s3ZwS
	Nm3nIJj2C+bwS24HwhpwPoKgVOFm7ZkQo3Ra+4XgcJJ9Ndf+XZR8ZfvsmVObIPEozJ2Gl3x/nkP
	JNbBbNyPLE3VJx53u/bsuB/xYkHf9nd6Os/C0pRtCu1oAXiGhqOgHB9MhxdFFJF3Jwk0EVE6P5h
	zCjiV/R/DdmgLqqYArU+cw0VgayqeTQq8CYHQ1WFRgOl/mK5asCKhO2GH9R/RYgSE3AJFB5Z/Ht
	TiX6Z1PCL8nejJp5Gg0EuodIeqBPuCPc1GAmRojW77qHvffxEfCoVa/nYKNAINa9BoDRfHvBDYh
	y1/Utch1fBTbjC8NQ5E83Gm0MIK0zJOnRF/QSaeWFWKfRMfv3ivni7jMjg1xeXAcY809kJ9bogF
	665LPh7QFPUKXaLHkA==
X-Received: by 2002:a17:902:d4cb:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2e93dd2c08dmr4245535ad.16.1791948646992;
        Tue, 13 Oct 2026 20:30:46 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0124csm63352505ad.5.2026.10.13.20.30.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:30:46 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 14 Oct 2026 12:30:42 +0900
Message-ID: <rfc-generic-control-wait-1.112c40f0e9284eaa@gmail.com>
In-Reply-To: <rfc-generic-control-wait-0.112c40f0e9284eaa@gmail.com>
References: <rfc-generic-control-wait-0.112c40f0e9284eaa@gmail.com>
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
