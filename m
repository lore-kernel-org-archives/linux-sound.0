Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355610;
	b=BNTCuBIvvO/dzDle1fXA+tBcIV+/q5Wq3P/Fx8uvlomwLzHEnBqrEN+G+HK4sXMMWk+A
	 E8X0WvXBUs5n9RLHd20cySCiUdYsv71Te8wjaQ1WAe6TnrUaaf/QX3s0mOLr7C7LmsLUz
	 a5q8aN3uFDCOYuQzaHLzGC4YFHuqQqXi9p4K6WkyI5wr8rQGO6IWP5oNx8i+pTw8SmgdL
	 62yrX/lF3lQHz6r1T0iReXmQpa6OiGOoTgVzbUpHGbdAVvgZaacF7vj+aD/62v2UPfJrN
	 0b3Oxm9R74WOkcSZGznBBCW5hD/ZQuGTSvYWhvCt0chhx0NP/qGRFz3PUuPQQJzob8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=sFVEHdVvqs6TJKbu4rs7xsHXZ7j/nZDmPKaQ+w8Vh6jAtyXBgL3FY/06MpNRShRMswj+
	 hjNlAcB17cAy9Ckp1u8+kUovZ9VeqwzywvNuKV8odi37Pf17nfwNX8OYkp7yRntbDnO39
	 PTBHo5gt8ps2s0Ev4gNnCMZjjkM80g/ByN9uzXFfKvyDPPvWj8IWX0VDIdl0mEnxyxZ61
	 Onvk1O7Pr7a876THKVlOJXGf1Z1/oZANCH3vREFxL7LR1dLBOokSuOagLIkQCSINh/WvU
	 fIMXVcTllF7QySMKQ1dPWxZtG8rkTlTc9L/E9VGDXpsAafJvy1tDyR2N1kbmnz2K+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgBwT6Y7;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3BB606A33D
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F3BB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgBwT6Y7
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b179528d56so388073a91.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355609; x=1794960409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=DgBwT6Y7RSxD3MuIEU5idrNj5eE6RclS7sUg8ysyijUcYKa1H7xJmOlRr7DTmY2RIh
         iJBpR/a+E06l1j4Yk4YQ4U3B2dl6Sji3vUzn5VNAMXlQR89d4XeEENLk2zvdv4Y8pB7d
         Ug20KYcNFWAk14yCmVTv18STHeh2klrXOnkEftwG78XN2Duh2s+16JM9rvc66JY16K5M
         zdPGTp6FXZMU3HmWfnjwu0qmknxAMbYrLxiRFAJraNFSJ9wB3PcpcO2IBxXE9ixtsSmW
         JzFqCJgPtYySOUy+t6Ral8cDCUZF4I8K66mgpQl0sUsysXhxwQTM6SpY0aEZ7pCLj9uF
         dazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355609; x=1794960409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=VbPHVoYFNoQtr3NLadzU+LlExEQcidc5bMKgDCAR1w0krnBzVduKFH9znTGw/Dfs1y
         8L/ULBPDs9GiyQ2vMswYuokUX0zHQam3c73KOu0oUlbPwI34SUCbwbeEBx4babUUqMuy
         siayKIK7WlomFXuiyXnLr0/fGn5fI52ESsvgCQGQ+gQl5z8Sds5eBs+Dp++AP4kMWg5P
         bSLf9HwwWtnyZ3j+i+PZ5OrsY8TGeWiRNJxdIDXoAgulaOrC/8gbHfi1kHsqE03xM3cg
         w2Rmlgw9qBA8I9Jz0G8ZGZ/ndEO4XVL0ZXwJxBkt8XQvgGFTrdnbTnDCcCTn0O6EbPVK
         DC8w==
X-Gm-Message-State: APuU4Z+g1lX3rMzW9kA1yQBlxUhjXbp3le63e4fcpB2axT0qmfpm+Ba8
	3keAHwTiz0KiCnxaIrpo65zEY8HFzq5r3pRH5oXALLIQqbTVxSVDJLwZcu2uIQ==
X-Gm-Gg: AYBFou3WODRNKg0wwSWUTlRuX6klb0N/nT4+x+iP1pK/me9unxnr4geWn7zA1noAsWo
	kHuUXFg+OnVRzKCuEsnjuoAMz1SLbY1b2bkwUs0hrkd7wusiWzq10Jwmru2HVzM5TDbpWfyeP+P
	CBPirbygRcwez2G/fCUHzlaeZvVCuHGvoGdfoWx1uL9ZadoeZmW0ZY3FCAIhI89p9GCTc1fKdci
	W6Q9Kkq8o+GNEFtzHwQXUduGZUaC/eVh0PIA9RmrdL2puxr69yGFaPDePdh5cm2x8i+YWHBLgAf
	BYJKwHmTJzyqke/4DWXpoDb9fzxh5w+AN0iqgjlOCwzAy/9V1LuvZ/fpfhj58sdpCokgNpyOBF8
	i5cr3jIYQX9h97ck3Zw56krMi9hBK6FjFhJz9YWMbCvF1/1w0heopIaxYsgjJEXk7LJEQxK3RtR
	ZWuZdrJOvFjvw25i3sRJsr7tl2XSn5qytdBnuiZCmueDq7SWLBD0r6sOH226c+2krmAKeITnvNr
	TBNgdAyLT7SjbCZJU10+0ZgrzqsA5nadiBYyhA5EpT6WiKaTCFgjVWZ7fK472tMQNc9Qepl1J07
	Um+uvGUD9LTUcJ3JhznXA9z+p1QxS/5NrPMfxzbCDyM6SunXHDCw0LoKfvayyfR6lWfDfEo7Id4
	IakzgFwGH1u2rUyHcmHY17H1Cf3qJ1U0fV1BVgpmYE+NFAAU=
X-Received: by 2002:a17:90b:4c4c:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b182eebe65mr643070a91.16.1794355609114;
        Tue, 10 Nov 2026 16:06:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:48 -0800 (PST)
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
Subject: [PATCH v24 15/16] ALSA: virtio: reject invalid playback completions
Date: Wed, 11 Nov 2026 09:05:42 +0900
Message-ID: <20261111000543.28550-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -980,6 +980,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
