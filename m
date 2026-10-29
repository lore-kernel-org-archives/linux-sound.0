Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252664;
	b=rZdpSi10WN0lQOzNDF1VJQjO6WXjirejPNu3tqqKsvSQMpJ4Wt78Pct5b+HcTsu1N7Ha
	 jbD3M2QnTW3/PaZQ05PIke9jBFaWhL+UotIotiDfQJ9N+eeeZ0scKboD78kDZIPKsRGtN
	 R745x+1PfueBHyu+pOhdTwyLEhS+0rse4SKPiU1ptyrHfm96sNjz1U6Hv6H1DV0tZVUP8
	 KK1j1RKxbxV84iBZXSSiENvvr6iB1QagHfZLl7tr93aq27ffq08I/OOvMeKT7qnvgQAkq
	 LzL19LPNC2kt/6puKSMev0bHJ7za4NaadxZldHVBV4frK9kMQFot9AH+69Vmh6SbbHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
	b=HxAkavJZlofkydoJHtE9dKBXSJ1E5G9lPPq1pNWdXxITr4VSmfJGuPae3tie21J0+ewm
	 w9tpUlpovItFx6GA+NZIKwslYt/uA/SFujzQZ7NfoQnrTgLGl09xQE2wUoeOIZI7UIP2U
	 QS12oGqsl6KkrSGBGRZ0wh2856GE3A80O6aUExF2JvJIeBkukUIipjDYCu431K/Jo+AJQ
	 nnvcGn/8e12Oq8110ayZksGkof77s+PfJgUym4tuml4VXizuA/Yr5eyWfu40h6o5/0HRn
	 a7SN32b7zabgQDX5n7nYJ3EAAykvqFZziKvJmKODHPUZtUKAeg86uxGNTNJ3Dr3rr3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+uDPZoN;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B33606A31D
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B33606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+uDPZoN
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1494451a91.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252664; x=1793857464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
        b=h+uDPZoNulg1nGEEyP6wT/3jB+xLA453W61UTEusvi6ID01P4Y+OqREwSAQtuOiSGK
         FOLZPTqtwD4GcVLIJgRmWUcHYVmRbvqy/HUSBK3CJ1FkVq1IThSmsG5efZtXrTjZA346
         FvkEOdsKwYHKP9w+TKHb9ZWvWcngFmcC5boy5J2ftExRuF/7cO8mECbnUbWly0oYDusS
         2r6EAKVIOTLHSszgosQYSuAaFJJzkighPfmnLUG8UfeOWhF0txOLcDzrJ3l/GF0iZSrQ
         ek5xWSiPKT15ZDmVxWzFw1gSAmXImNU370CqpJRhcLlHBNyfW9BOMbX1OMm4/oX4BvIB
         byMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252664; x=1793857464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5Cda1iTEohKGqJz5gtxJbapFh8jTgiZxocpRrDCK1w=;
        b=xl5E8LJon0n9o2H9XQxrb5Qcf7s0EC1k3i+j5sqcBljcLcnCCM2XmvOim4tKExIdFd
         tKnmjr4vlYBUNyLr/HnGxK+/B1FS9tHiqoNMGFsFF0vvF/Vk2RmuQ6ajJ/NDmfymX38D
         TTHR1HPrMkGp4uq2JGEJCX/YOM9H8sPEy+egJ8tOEzJfXpOVrFeYc8uQkFCK9rlCrgtK
         A+ycpHpzlk0eUJZR2NSark6vyD7pJw2ZTESFyA25lhqmAXblbzmuTUS4VobEVuzFghbB
         Sunn3dfqgKMwaM0++X2e5sGeH4+ZMTlcgrRwr6j5w6gwIQAPRWojkP7LxxGS/pBSB5Oh
         3+dg==
X-Gm-Message-State: AFq9FYKVJubt6s4arewnJAUGRd5zB/KnW+7sC5ullhjTmSgBATlN4RcB
	2Q3A1x1JGVXbuX3Pqubkq83YVENGEcsTrVC5+CzGIeYSGR10fYaDFoKwyIYWZQ==
X-Gm-Gg: AYBFou1adLkJKY19DYBPl45H1CYHvk9WmuVKCcJEGtwzf+Bhmp71cn9LtqvgMcF/0MF
	MGPWwv1JZCquRN4pit9kFEKZlEolDTXj02cagZ4d5gbRM0KgSKe7LDh0DQChZTbY5Q/+7Xq71AD
	PU/xgWHAP2J0eYv1Lm8/tmsH05ggQY8beZsWnZU79hjNte1RL/PeFTh0lfzd/hSQSJP8lrkDIMJ
	EXPDJk+O0zc9Or4RjcRjc7bKxOejkpszRoV7J36S7a8Yn/2OL9RIz1FYolK6GWt+iceeZldooJ6
	bID03CCyirsvMegTgon7slj8crys3mQzwgS3kAxHIPtmxbzTWWF9ZFb7ybl3r8Dc5XyIbQzoUAd
	35WFWP7dLbX9QJVYp4V6GuE23wOmZZwhnRpy3tvHl7Bl0k1XTSvWVmCkrGv5d3DL4w/v9Bzewwt
	bElwqJGQ6U9tvbDhNTrYAAFTkEJGFmdSs2Ny8OYxLYEZPfbG7FXvyVWdD9IC3xXwLWuoxi0AEnD
	jOcidAIF9hlwByPrtcxJoB7k06a1neRKKWX/xNGI6CRYVwLI4McuOQfZNON4mfY4gwv+ul5wbQi
	9+3QCAGGUnl06iQkYMBlM5Ovtgns70r2skPJ3cs3NWKuTKfVCxEQmUWU8EbzSc5sh/eY6btNvIe
	19tOmWYnRzkX04G/Vwz6ZTtsVp1otJ1zqlgkY2PRv5Qn8zYQ=
X-Received: by 2002:a17:90b:2745:b0:3ae:5525:dc25 with SMTP id 98e67ed59e1d1-3ae5830a184mr3504844a91.51.1793252664007;
        Wed, 28 Oct 2026 22:44:24 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:23 -0700 (PDT)
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
Subject: [PATCH v8 06/14] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 29 Oct 2026 14:43:46 +0900
Message-ID: <20261029054354.2931-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

