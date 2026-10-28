Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156023;
	b=QC0CfvThU/zyrozhqq6PNZgD7xEJUzDdZWb/9dW6j3S42ra8bqZzyAeT5qdk6Tfp5w/L
	 Pol/isfYRlSFOMX2YHCqtisiwiYxJVHZauXFxQUtLuFVRxhCXTTGdxf5GZGT4Nvl2oq1d
	 Wf5QJF1hPOeNhQHV9tsWNpVvKvBEIzWgai0s6oEo5ZcEFGG/et1UWGG9yl34JzQoc0UQw
	 /D1JO+TnEs/9UQ3c+tYK2/87da02srVOKnldUBOhzDDhDLXMV1Ef5xlNooY5C6opy8c8P
	 b8h2dR1p6D2cC0xrXvJMXBil/781g3mqEuYsjwoaDhGHmVjYoNvxnEoC31U42NwNIDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
	b=tGh917ABzBjLxkzm+AyDZkovRLmItQkHV2o/jT6hZ77pMLyO+ec49enOV3a+HoZZaOAy
	 /iuwn4MLh0p9XkIuc1rHKzhI738p3KN/hmeiy8AZCbZeJLKusq8/rLZoipUe7JiYmEqpL
	 C2cK9GVOfKIT5rg5I8PU06wQmC1v/8kE4/sVt6J3loIEJYwFpgxBwsNnj4Oqtxr0F7iRn
	 DvKtIfs7ZKZ++XSWITPoseZ4t3Y0tAMbH1IjoyWJArDmosatUpbwoZ5ZGPff0xUf2/9EO
	 2ImMbwAAHjfcUHnrt6D2+/g3SYd6rkpezAIrW9aDaVMMdNRcu10bU77sWgKY12sKJrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCIW0JxQ;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF260A261C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAF260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCIW0JxQ
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so985341eec.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156022; x=1793760822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=sCIW0JxQupG1G0xdyWEWEm2lrNOPf4/+dB4oaUSL4wL2QUbgv5w6oVzYYr6H5Myg7j
         4c6e84hcIFdCN2UmV+GJQQcjztEJcMXQm7z19o6hJ7jqca0Pf4KO5ZymbPDrcIVFFwrH
         WBdrtbPh0uR5DuTMN1DSJ/+F0Zr19G76ws4R8J3P3xaEgRoelyH+uWndzr6qQQrERhqh
         y22KCkL2lgddUAAYxFpLu3qkxvESN11eX2pslooVoqXO0B3ZFnG0xZ2z//RhvenKND4G
         L8V6xnbagJ/ebZKBkWY6w6LBtCB7DgLgsDnITwfvQIcoOYgzh88kDqaI6FxSaNhiQxfj
         +nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156022; x=1793760822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=mJvbDtEV0d7qkac3pol5NhMU+bMxWWwcQUeayvzQMwz3GuYFKADSvZd6PAZhiaX99b
         3xF0bNLa1Qq8BXjywPikgQylee87uRWb8Gh+tTDLF7H/ZzQ/JIUZGmMrQUn2CRwg0I30
         LSBAn/qjc2WW2MdpdCvISFzraC+ZFZZ2vGnvoVJpbtcyWZDm7vi+arNM/waWNaZQ0EcD
         +zPodMA4X+Lc2GFC/oRYCPgnC8Jp9F0th6MBL7Nlh04LpH3FiQ2ANn3PVVjWs1zytzsv
         LIYwyTr7WYJuUGhWM2h4qYapDwssv9JXoN2r2gDAE0tOSg8CeT2N50Wwpjk3BRLYqCEd
         a9BA==
X-Gm-Message-State: AFq9FYK3/z5a9b3V5pJxtRKwTLycKSiQIrA/T2b9+IN/kVSLpG1/jME2
	3wbYz6jA7b6r07O98Aa/cUfSjl6qLey/+OQYyxCHP622viSCpB6Z/NGwpX9+0A==
X-Gm-Gg: AYBFou2LvvxNhPA0H8O3IVg50iETBYJgKqRC8VZ6SmQVE+BcsfyaxgwaSHH2Wx40Zt+
	I9us3DyZT8CQdnvAjGJk3o1BsvatxQyn06sfmJOpjb1nkAV2SCQW9OSkgy1duo2+PYE2jNUgBxZ
	O3rmh0v123gqel1cM2dFWNkHLvyDDyJned1bON4EOvVj/W6wWifhvXifemxfrk7BhttGecF5B0m
	ui3TIVBHeCm/+lmNF0MvTDOrA9crb0WG8MgFJ+tGdOoiNw0j+FJwWyd/Iud1HA+UInHRJyxh61d
	g/xnKvsLx+5zvn20p1TVYt1XapbOiAuB6sHfPNXgibd8/QDMymgxvZjA17BSZprFjMG9dkt/gzw
	d2fk9yhb1MkkXVDhO/Nx3eYgLSTMqjHgA95wB+4K+Af8rW7WYcCTEaPOhQF+dSNdQR11E6/bDXz
	HG7Z/SZ9pI1RgDKpNqN/nSpL6IUa0wWd80RSqUOaLQGK86McebzwVDHvuHg0tJ/Vmek255Cyhy7
	Sh2e3xKDFrnvR5EegWDwQxXcJcryaIZA1Y4CbXSvS+m9CDYju/qSny60IqVhwwq6DgBPTKjMiOn
	c2QaXQoJZj1yTNJAB8sl07pPwXBfrIM54eBTzm2A1wZh3FBwG5ptIKdG5rUvnDeT6jmgSRxFZOn
	cxIzXKvtHkuEBlmz/XQPBKvYDMdtQZMsxz/y/QAdLFfCEVWY=
X-Received: by 2002:a05:7300:a95:b0:34d:7ae5:8d78 with SMTP id 5a478bee46e88-36a200febf0mr1531973eec.31.1793156021726;
        Tue, 27 Oct 2026 19:53:41 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:41 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v6 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 28 Oct 2026 11:53:09 +0900
Message-ID: <20261028025317.92450-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
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
