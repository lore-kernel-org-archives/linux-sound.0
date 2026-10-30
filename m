Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338016;
	b=e3AZuWLL113IX3nbzUBbb43jdudiETGi6UgEbnJ13qSFN2eteLuSjM1wbU20bla9qXzN
	 PsLThFNfx9feX0PWMMgqXmQBpNT7nNUVF/VW2Dr/FeE8grjCw8cKfgzLvqFhnJJce6fb1
	 v+oaHDO7x072EPkeTNZ/pRTsLqFztGTG49ZVBA6P4NWKiD1XDKQd+S5J0FPNLiiFv/PqQ
	 thheMxohM18pLeWeVs79e0zCrXnDjtJUOAcqcbh1rUfLGButto+oVz4RDF/N9xAP9/uHi
	 TyTioluJREycPmMCoKY9lpa1QilWtDSWSk7bppTJmGfRlwdnyfUOFx8bFR5Nerac8ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
	b=T8OfDiT4kmrLJ862LalZsGrpQswKeOBGUOEVqsNx7L7QD7Re/I98ZnVuvc89qEXT5wj/
	 sXaUFXESriiOTNmov4s6iiiB05UZXtV39PM74b/AnvkkBWEDguGGg+VqDJ31jOdxBWEo9
	 liYI66iVLsHnbpgl/Y3U9uFLRprSCwPPpKJ4sMNvrajifD0CsLAsGp3NbSHNeAfFfcBHu
	 O49k6ocaekpAQrCEQLSMX4vKReNKyiP6JPEAh0BSHlRSX5Q8o7cVEKZ4u/JFyYoqc+9kg
	 KCZH5pYduf8kVZDMqSt988Gnr+lqFytZ4mqrFzfTlr1cHQTE/qGoRLgJyYQqcChYRcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+bxHsU+;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE87606A339
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 05:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE87606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+bxHsU+
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so263289a91.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 22:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338015; x=1793942815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=d+bxHsU+DaLE5VVrgkliIB4ayMjVY+RpWtD7z/NIoM/o+TsvaUBRzUMgZhUdq6kRwd
         voWJcAcY6FoodTYsDMBAZk0oXXP7IIO+khO1dOARJu5PDmPa1szbHzpnswezgnnhcvaf
         reH7UMuhhcK0GTyQz5Dofti5nIYrEZyGYvMlbWQ/IN6NNANQJHbJ+fP3ygHyUueGzjVb
         QJPdLI9TQOIFxnjVCW2Xrd3wmj3UqDld/eS2yZEbjGDDQdZYl3RsLtLECskewmzhjywd
         xepQTfqij0cXM8dmK9OHZ0/TkSfQok8VT2viqG2iwEJmavJHzbdfuHPojpmkc1qDNaAk
         dCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338015; x=1793942815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xyRi7XDKpXV1gU6ovNhxbTiviMkA7YCbmNrm8NAAe74=;
        b=WqMx+Zsq5Ts6oHS4pquw7K7tsLVc2zAnscxx/zQa6lB8w9DcodmsXPyZ69BBeLTK+r
         ZJYhm2B54CZLVGJ2bovgaz/ug6FlOjbveCZTRz6e6ebp3nYeFb8wO2tPAPoU6du4S9u1
         f1Sb5jA6mlFSxuwtUzjsmLY97UDome0MrdQfqgB2ep3MdAtiTVvOHY2IF/ewhUz45+kJ
         3Lr6Oz5Sa87sQ1HieaFdm3ghcW33+ETCIJ75csNP0VqvK2lH6+CUetqJIG4q6ZmTK6WS
         aK/0A/ZffRxSF+rnKxF6Uilid5iJgtvwUCqcjZS6k+xiSpMceiCRYzwfPtgzDCHiGLFi
         GleA==
X-Gm-Message-State: AFq9FYKJWbTg9Dv/3WNYI3DsIFr6J7NqYJKghNS3TUFNZQ2VyuPfsDxo
	VcATV3oeVhcs5KMODN12rXNTVqgaw05Uu0FJGdm3YIwzSACT6jSpyu7V6UKKZA==
X-Gm-Gg: AYBFou2myDX/T5WwvXRwv+KuOEL87a8h/2rGnhY+jZOXWXC5ML96D+o7Xo2XuSTP6oY
	VuchzWPsjg5IIarllfa/C92V8gqWIjlObM8Scabif4wskkRtW+82kYH7ghM0klCx6gBB3fwQR4X
	l4gLIGi/EA3mk1Ntx5muTDCPiYxIdAYSfsqHd4Q5LXCQ6hZO1+iHMFySM6fFKZKsGAipdhPiQWi
	oT6vQuxolt280muG6QCxVAnoUEfWTPH9Cp88sWujATxCvbsfpr+veJ5+MveXeqBi7F7luwT7NEe
	ZenT8YU8FB+nco7eaOCFIFw2M9biPjZbkSrxkAWqaAXmG6hOpf3F3S3PW6oqoVJ3nyUBwJqK7Ww
	s/FZnrVjabM9Uz9pZyRwyatQPTfvB2s2Fkt8UEnDcZRaRWKkOTY4d6JRKYABS5wFURt8SyOW1Vi
	tiReioBGiomgiQ71xr5/g0Whgg2dIq8aWPvRhFC1zefdhQvptT0QDt1Z5QEQHgunfXdbJxOGs8j
	0zMriL3464iw2W+6Dqcx7SRekn7IUbzYzePVxirK+1rbX7rWgk/Merk05o0NJGQsSs+Sw+lCWkf
	Q8GHMVIgZWjGHxoUpyvH2dJnnhmdRqIuoJFACsjt7uaY/W+0Emvo7E+KqoVWyLlhpsYqdmFIUn+
	RTMfknL6gSt4SHePYBXnymSRfVpXURG9P4WlcmdECteRjZfM=
X-Received: by 2002:a17:90b:57cb:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3ae89776ad0mr997346a91.35.1793338015580;
        Thu, 29 Oct 2026 22:26:55 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:55 -0700 (PDT)
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
Subject: [PATCH v10 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Fri, 30 Oct 2026 14:26:21 +0900
Message-ID: <20261030052629.27742-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@
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
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
