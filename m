Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862566;
	b=W3P3u8m0qxIeqBBlqAzqJ40Z/4TmkKNXmJ+4hZc1jOFWQYmcP+qDPSutjChI497r8UEq
	 g4KSo1HTvsIgHKgckySNWcLDcxOSoDQXq0Bnny6IxLJg0lMBouHj982Om3n4mWq/pp58q
	 8Awu9lxHwz6lEFR/OUSAGT1dq5UPzMjZIj3jLEGeeGGwlfcpClLDK+Ik7xs75lW0RhwZs
	 JHGIP1X3k1Kwt8ttE8NvPxoldXGYzhLXveg1y2r4BLIzso9tAirI68yv86qYY/F/WBZ+d
	 ZIVOUUqneH92n0ACGsdkQNoKBsWuYgJu0O+quM6BxbpxnoXDBPo7uMHmx6UwZRsth/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
	b=vCMtnkkaoqgEnDjv9Nfz2eqXnkZuEcJGsj+LfM8sQTfW/V+z8IMbR940074d4d4hXqy7
	 wvrb/AhtXQPqK9YRAhkv9AG1rcsKiW2vOPk9ekQDXxWUoklNnyiXGKMSt6fxImIZXcIA+
	 kbtH1qRIha6tEER3IScinSMzpYLLrIZVjgnahlf9sfAHy1Zqf9wq47MlA1nLN0c+zCP8V
	 0+NYNovqrQHQr9u5mNLtuztqfpVETHsqhAg5QCPCE2GD+C2vUMIgt16ENqJgEWY4jstHD
	 k+efidAVkpnr56gZF/YOjxScgcp/EeF/XChfVPt28b16t4Ki1PADHC0Y2CRXemCUe9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VoN/PEsd";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15E6606D826
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 07:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E15E6606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoN/PEsd
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so2995694eec.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 23:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862565; x=1794467365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
        b=VoN/PEsdJpiWRA1ncgCpX/2JoQUoG8TuaRp+iKG7TtcNUAsCf54u9QixqdCVsOkJpv
         3MulJH4YjMxjZQ1tY5KbwymqR/NzoHd2jQXmCG5NecyJ06nvLXzNdR6jevfX7Tsw60Ug
         JbQUCVEv4FA+O/wLf9Xh03e6Tovxj67lAHAjMIedyDgWp4wVQUpdHWO0YB3vOvODIFgj
         dMNd0UArWzMKC10Z1RRWFQB1soXRN8cZza1pbtUiyxlvOHOw20hXVQAwd94A+5Z9BDc5
         FY9agZc2XM8YU1P9DwMCu3uHThWUwc0TFLDPzRWs7OGDNUmHK2w9pRWML6947dWrJI3F
         2HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862565; x=1794467365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
        b=uYabdP69sGJsPEV46YaZt1HlH1YGt1kxo4aTz01+N/1//c+wyo2NmJwH2tyYk4Wj9X
         8QO1GYBtRmHwHji+WYW0OOYSCe9Bs1pAhSWbn7z44VzfeyTUVv8ZPReOiRitTAe+1GbT
         dVleDjccOZAfQ+920OwjSSx8itVwpBJFM9t5G058IvH9DoXKrFvut8+u/5M3gtf6VIY3
         a/pPwG/9pRHWZmrYt+XENUmXUQjbtwpm2gxF6vs/Orr0FefbKO9zSS9ROt6CLCgld5z9
         SQnEHI84HyamVdBcmO0WnPOre3Co/xm69bhBXpmUM32Und8H6Es3A8GTBxYgcBkCYsYO
         szFA==
X-Gm-Message-State: APuU4Z+XOh0oiQ9sXTDkP0yNz/pcXzgWJD8nDPNI4dxcoTcsG4c5bJlp
	d8OCCEOXeYVL7prn58Cnhr3cLQcRjOhtJuRdxIO27zwzkFl1Xr+5Z67VrNvI8A==
X-Gm-Gg: AYBFou3t0w8ReTTR3zZoCDXqyiB0TQQJz7FJm6ssAtiW91u6paYAdYRLZ+OkpYo6hbi
	pQfRwJBubnrSZboAqfBIBexjXFll9okEsF/loB7FwgUgBhsMYVV8eRRhNfxW4uil4ORuWV1yKbN
	moxDivEJR+Jr10Ut+OVqfaC97yASKZzNutikJSQd3umTLah83MOsGPtpBj9lHfzIRXu4GMEn58v
	cUjibn8H8WwjzHxXSH0xRX8NPXT+wn3Y+wkWAwzsapKGTVmxG3Ht5i09NBBxfmMWo0nmDa/6t7I
	PMq4knbxBViJLu7mUQJyBWY20i3bS0xycxYkqQdWBUE/cD2Kp3m3grocQZeHt7wEO+wpf6huB4k
	x/A2ZNHxDRuxQK62KY5K8w3XxNOuf+ehFeMtdRzrmsCNex/RDlLPZ741i6NhZbWFG9pYobscFVO
	SsXBmfxLMjLiQE4BIJ44/uJFsjmiMNOw33CjrcS45Fiw7O3a77YBpzPN/lghO0G2TbfNZeNg7IJ
	ZeAP5bddXTQTZr/CFX8ngUwdt1a7yj3fn9jdghtpRB2+nILU/FWivarE+g2/nkr9/UFzK0fsxrc
	ht6to4yHDd1DPXhMUaW85xSLOGjkbsRkIaW9k0/PKHhSMn40aUUzBA2ehZ5dC3WF5+MANJMd95D
	x084L1CWEl5pUWHJdp3J+uuVwufwbxsHu2eZJeq4qIzPdrmI=
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-36a423408a1mr27278440eec.8.1793862564710;
        Wed, 04 Nov 2026 23:09:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:24 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v17 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 16:08:42 +0900
Message-ID: <20261105070845.6449-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Keep completion timeout and wait return values wide enough for the full timeout range on 32-bit and HZ=1000 builds.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -265,7 +265,7 @@
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	unsigned long js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
 	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
 	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
 	unsigned int nouts = 0;
@@ -273,7 +273,7 @@
 	struct scatterlist *psgs[4];
 	bool notify = false;
 	unsigned long flags;
-	int rc;
+	long rc;
 
 	virtsnd_ctl_msg_ref(msg);
 	/* This reference stays with the queue until completion or teardown. */
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
