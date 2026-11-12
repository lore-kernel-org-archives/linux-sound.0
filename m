Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466233;
	b=tBVk1SiJS/mFFy3dfnrjhcGKPA8iER6NETWaOmW4DPk2aB3ZYrWzUPf/nuEqNN5pMoWr
	 Oty2n3+rYm5NOI5nWhPf4gw4B3q/6WuueraxicyaBcOkhCEsgpk4TW/1wPuVSeDF718cu
	 CM4X0/I0UVIQiGOUGXjR0O66YlNW3+GegaAIBoUZdxTvaX3IYwPtm0rL5ZLBAhj/hE7eu
	 k+4ZE3vnvcPQwN7x1UkCNyH3eJ6UruHay5Jla+RBWQy6+/RmNBiOI7cGTW681KF52tFOF
	 ZDHNh8I9BpT8TClZzNjJvfJHkwiudkvUpqpieU67rkrsyT0G4BTBnJKqmZxs7GY152A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=apGijHOneSjMRJ7/KxoXeRzwMNxajjkgCtWf3l/l/CBgGaCOArIdjmSZR4QUmW+8WiL0
	 KOp+aySNKwtg+ANDHmWr3CFOC69HBtZ055BpOC3XHdVW7F8oNW2Wc7G1gP+oJS/g0NcvA
	 p5Is71ltecYqoNqgzUU2NsDRwYWnj6pt1KPPiZu0n4fzxG6sQN83Q1yRl9sAMtjoraKeC
	 4qqenIU/Uy8BCdE8UigI59SdDRulQCpoQm1v594CZBMGXvcdIIS3uvpn6k+JJECkMqcM1
	 xYjdGH15VawDw0ab8gys10ZgJzvfLu7HIXq7AyfrJdA3cAvv9a9g8d7mDsOLGpKlz0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQTqTeo+;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB101606A884
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB101606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mQTqTeo+
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1562588b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466232; x=1795071032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=mQTqTeo+OA8UOtvGEEgRIRP82v3t4AD/fi9nfPBAHKbDDD74JZlPFfT3e8rx+6RFXO
         Zipc83ZjfSvnpucakHXKd+Jjhe2cxuH8mqfcHch4T97udRu9IxarhY9ZWkNmUFMFX+ST
         rVvljvqISdYmrOGCROnJ5lpvb9s1GVU1okLNwkMsYRYfxha+VttBUhhwoE/njGl6uoiQ
         GW0UG5/gmyWzreKQYsI7H8nm7u5M14oy60pT+xCzYYRKqW8S9a0Q1X4b2cAywHqje/kv
         HJo0TcFN21Qv6wxezIyLW2ULguyu8bv5BSNf2cbqPDOtuFRQAU0VagSNqOVZKlfALk5n
         k4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466232; x=1795071032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=HuEqdwfenCcO9r9rllD3TuikZbYXNBHbMmO7WEnbL3io6NcLmxOVYabDyAGKOTFw6m
         GqPTlIgOH0f8aNSLB0XXn7c/Z79L5xhUASaSUI1jCHNI6AJ9c/4sss39PwyCrYL1EpAT
         ve3h3jA4iqyMO8FCVOkeldC9ab95EOs6BxXR18mL+PK4dWhUwY31WzO4Ytn0eHmIbCGD
         j15Oku++zxBmA1xNmmO59+fnnTNfmxfaCuYMkS+6UB+ZzoT9CXLmOE/ezGXZI37DURTr
         Tlhsyverr2WwBDc+nCdfxv86t6exde1658NSViWJLapaxF3p51vnJc1ha79wafwFX0BV
         gEFA==
X-Gm-Message-State: APuU4Z8knjoLXk3yTk3e2CysswkgnDk6MQ7iPTtg2nq9WlSby7HStPf5
	i2Z0OrW8vUB7hEpZJ6hQ4ga59DqUlU2s91L/4MLSNvSX6rfFb9VplOIYLLsgHw==
X-Gm-Gg: AYBFou3RBw7cZ4C+pCapS+TKPnDwW4+WRDNLlqTUgdESLcHi6PvW1hcFe4yJLP+k5FZ
	irRdqP0OsvpoxMpgsQd3VLQzFN7Iqq5EK5REJQX+nzzDOl+1UmRxIw0vnMT2r1BkAr+V4+ro63U
	qoCb3tDnghxahMFkUbKKSr2ZLx3RMjbhQl2U3GDhzujKou5iCr9RZ59JlYoIYFNtNjDTm/f+j9D
	9gZyaguwnA6NZPWn2enLS973/umIHxarGqE+5MKM7d+CJsq25RldhgpCDX4S/tKvWuoXjtCeYn4
	lC+lFVthByzFuIyM7wTNrY9TEeBdG8ltSuPED20s+e077b0AC1dwKgCNk5W6WPp3Ao1Iui0Dj89
	qmBuojIGSJNfjK0v9x/GeGM9idn+G96St5z/aU8qNaQEoMagCK48VZsYBi9qfHY6R5dwELJIVNq
	PB/G+C85Ouc1c1rxh3HFSmDtdEuQS4XvmOnmHzK5bZdSekZfMZnDQa7Y92+xLPE5pdhLMAZ5C6C
	pcOwrMtm4Nseq31sJ2uw5xse0+gpAWgjVdz1yqky/Fa5YY0+BIIJqEmY+4dK0ytDxfOupzlsYaM
	QFQC6LrigqkOjU8lOIFkIWXL8Xzi58hRDhYd6+dRDFY8A30h0+mofFX9MDB1qLmQYBnUUnqSLfZ
	SwSwOXyDZo8Qk/sAo2UvWLwckmRt4TCrIIS6o6KI/+BSJQGE=
X-Received: by 2002:a05:6a21:4ccb:b0:3e2:3222:2559 with SMTP id adf61e73a8af0-3f2ff7cafa4mr5180122637.62.1794466232303;
        Wed, 11 Nov 2026 22:50:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:31 -0800 (PST)
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
Subject: [PATCH v31 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 15:49:27 +0900
Message-ID: <20261112064929.11211-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
@@ -1011,6 +1011,17 @@
 
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
