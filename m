Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461748;
	b=dTkFxOF1bMZlBWZp3G/12LgVlT5VJvueQDAIwTSPzclP/iNZaVHnL077U1bk5vhACvpt
	 bGWGDp16BqnjdmNMI3Df4XnI0wC+mvP0CcWwivPNzY+Dob8wOCLRifm4AjMngg6w6j58c
	 cB7EgDYaLsSpOJT5n1RYf1uCejUEpVO4sMsTzHX5PBtgNTSsu057uTIE7ZuH16z3AyuPs
	 UyXA1H8mndfZmawLYYYFaVDjV61piI4h/djbXkR+Q3dYfC2eSiNLzfpMI8IHr5/PzVmh1
	 OnR6aSbP/SmaMNhhp2gSD77txmW1UcuvzEMXNpEZ4+ZAHIKrmeJridI0uqmN7PPP7xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=0OcOdilwolZIfBGqggWaCKYoiYd5hEIWFUQ3FyheWLyaIFaxT4vXLizsAA7NHgs4eeH2
	 CbePdWns16Pj0/sQVluzTcyHGIsVd56AfLaHzNep6f9z0ZzJ3H6Q3xeXb6XpEia55w/Cj
	 yrlR14vZ5RHl5t39Sw9nx4/FApqDJP0KmrcFXcB3WcZh4kBwsinNPqgOZfbJ1IELDXqsM
	 6WSGnVe0xM9JNI0znQohP08nTbeiYJopWN8icb54M4hwJyUxSiOR0kaM8cLjRR53o9kJE
	 RRHmSqcAYVY50+CGQJ8A+cn+SvRVtceYSx5iP/IDEeWikPMiWzdMibtOOwWr/KvENtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mMcXtp/s";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF560A6F47
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CF560A6F47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMcXtp/s
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so6969767eec.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461747; x=1795066547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=mMcXtp/smF2zc1bvpl7H3x9+N+w3QIgeSfhjTlJ+T/6oLoBVEdxdUugW6RpiSYdK1l
         K9VVP1aLlnBenyyfrP/mBAWG8vp/tuZZ3awdZZ0zC01dhXncU70kXwqv7+/uvbsF4k9/
         pE7EB1AD2mJ6+15sIaWoDmT35fjMmWNxFV36pY18f29vigDTivdLFpHoM1fhww6hndVJ
         hrzNBEKNyoWmiry78vTUBcnoI2dgTc9a4tQ7Fu08/giW8ikPtX6qm6PoBf2n1CAkZn4F
         XJIeQWS/nkaV2DcOofeNbTnVOICBUKIWcWelCnCMryerRYpiS69uaA7ZbKtIYnhfGvZS
         JBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461747; x=1795066547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=ib+Hl8AabkdFbFGp0UQAO6baGHJyLHv+yrbmx0PyHqXiTZl+40RlOZsxb8F5pZg+98
         88kClecr0Hz0W2Qe3p0QoG3vulMFEZ2gFxHFZYtTpro31V6ylS464ZWLIrUtD63L/Ufo
         bsntMDBl7FsCeYF9igdrKH2MF+mh3coH1IFCmsPfI6Ic6aPiz8GbG6tTQVB5VeRuCIe6
         dYqL1BRw9PPeFRwKKqw0ctCL264/PA2DFUZJSPp15UcX6SQW6dQDfk8jvW7DR3fczD5R
         MJGcBgdwXvkOSAa/k9nGx023uA9bp2jxnPNQ5t77DLYKzfhG8pd9MxzydYh5pq2Tjyc8
         mixw==
X-Gm-Message-State: APuU4Z+ZwB8KMXoYxG86rfso7Vg0Zf1YyLHc3ZjxPuarEQ8wgQ+92wb6
	zXKBArB92bt2lZpvAgQROnpQTnveNXMNiQvPtfGdAITR6jpm9+79m8dMwGqdPA==
X-Gm-Gg: AYBFou0jpQRnSHIRpD1GdWUaxSJaTP7B/8uPDWKKaQzorcX3xnZJgavmwMkC2L0Nm9V
	DCELVQu8gZB19CvWUNoXegJrYAcBZn9YsSx+KujH28Sk9fF6abNz9bpDwwAXbkoSmncDASriOk/
	S5Qn0ZL5h0FAEnBcpgOOFT3GDilSfACvnhy6n6lusEbqQBvLs9841/PqBXcEU5M/WYXATQo9XZ7
	iUCCuU1TXMzTDFSEaMyNcF4aJpyGk76CRkb9wl6Wgl0mV4IQer26C8w+oD92ePJSr/bmeGlVrdd
	wIw24TDnI/cjMJNpBBOURd2CIHv7ERS77bXZqdoGTK8NPGf8FG2Guja3YnIFCNuFb8rbPT7X4KV
	f4IHU1lmfJ1L/WOdjia3fTqvGUHzPkSqy/ntlM3Xabf9inRyHmGR5LT2vLLmYVWcZGIlG1nVo25
	T2bjqwAn7SFPDjLi9WesigH8EFfJQv+W6f1CT3nOp4qsZxMMEbAKzqaWBSzathuT/QrPi60f1gA
	GTrVT9hSKV/MrX8pu8VSDfNTtkYhRlOlLVbZp3ZaMqeKmhax5G7gd7pTdPUpvDqWIp+rA+aujvZ
	q5lsrN6v0XKDpHr+m3mX/ld9DRIwkaAHbm0WbgK34QX8o//ahDK34NlwX5soPtKdOW7TSGPVgmO
	6Sop3J79NuDR0KdZvA6Zp4YXciB7FCjgvb2dDRKghJSYfaXk=
X-Received: by 2002:a05:7022:7e09:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1b3c0392172mr4615594c88.38.1794461747161;
        Wed, 11 Nov 2026 21:35:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:46 -0800 (PST)
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
Subject: [PATCH v29 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 14:34:44 +0900
Message-ID: <20261112053446.73504-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
