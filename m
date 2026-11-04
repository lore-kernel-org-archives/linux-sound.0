Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758712;
	b=15Vqbbr4Ka16b3MP3k+8g51aFWtHgbpHMF1kVr54OC8r+zlTlb+9ekaea63GzzDxeSUd
	 EBlzCFUF+1hjfoBF3V1nVW6Vzyx4nQfshMbiqZ2rwMXi9gwmr/d6FOA1kUAKTBhb7AQZl
	 1M2n0XgpIwjFlx+8SukvmT4moFVPcEQwGC0izfrXY9oQlLphUEANufY3mDfKTe0X6oBen
	 qxu9r+Qytp+6eBL7YecHt+GHm03czssx8GU4L57RB1bgetzqckFoVIa6C4XoIsD34l0x0
	 DbmbGI8MDTPzH7MODtqU1xnU8vmMcsE9uadYNK0+buSwuwhfX7Ax98txlCmq1x4nGHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=Z1k/Fj/Zwd2Oj6MnRUxALyQETM0V8ZXNweX3lR5vR8Ce/bKH1ZTl8zslycXSOI41LYU3
	 Sepv1HpLk3juRAppeKCJCMgM7NoPiGiSxxj4oHRz/6QkreyDFd8vtXISa/XR1BJApGdFm
	 js7MFIaNNzh6sKGZ4xsUHvEI3jvbICoow2AeF39GT6SfJkC8Dax59W1crs5vDLBrFwSQg
	 2lgqQ4jkx0wx+AXYby96rz8SFIicJ2d6AjLBICB7DFfYaaB7DIFrlLN1na1CE2ybaAqbD
	 YePAnjrPrOU4uyEG48rwJnBx+Op1Y3c9ioaL2ZrJ5wNQZIR0MZM8I8g6SzJTYxlFQfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPfguUdM;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23806606D806
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23806606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPfguUdM
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so528700a12.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 18:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758711; x=1794363511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=fPfguUdMhbE579afw7yvV4+5C0l4YkdVCezy50lqJ0iQ/c10n0crJQydMDdQ93YdzH
         Iv7TgDYD2qXMxVRm/6uCQT87M9RwTy3+4rPplgTAXu95H3uW3PUbcS70zfto+9fYZUst
         x8eeJ87DA4sH60YA8TxfT6VHk13q22eTmqeIzrHgzUi/yTo+qAfVkqG/r+WoW/81j/6/
         X3/NY8ARdg6ierQwH7LCjtTKMg5tk/NI9Aj1asEALgqePbUk2rGy3nmKA2VaLdgKa0y5
         /So8iMX7tR7xqhtBawjU92z/S81f4Xl+KR3TaSqnwjUreR89mmXNmV4olGRd21FeUJn0
         qAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758711; x=1794363511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=lELHaVmB7XTXucDwSitZJxtu0r3gvCw1q2kU+0fBQxwu//2b804AmQSs9ov/Qmj4ss
         X0SID4qs0K43s7L22uEIgE2dsQQpOmV144Kystsl9AmAKRUJhBRVQP/Q6wmONWuMITKc
         uZPLyGOYTvxLHpSInWq9qhy0EaBvkHoV88/v3DDFszKCxu/MjI4fuW4VGs8qRvyO0uqy
         DfhIWoaz+9qvM01dB68ZW68urCJxEPQbEtAeWciB8SOP2f2jGeOuLFmMpPURjNdLvLHX
         zqgD5kfubfYAIp6syhNgiWlkFa0cAgAOJAxqjnN/6Z4FU7uEobqptov5jHSGF6Wx6wQB
         9FdA==
X-Gm-Message-State: APuU4Z98bFpa/C6Z7ezAG3pNoIPzyWLudUFAB51ZCfGxEyffdJysxzwd
	Qyh1Rb6ZVhlhizn4protwlwJRw00lPLo2/56/haZbouH8HmTESxj+Am12ne32Q==
X-Gm-Gg: AYBFou3vQmdYINrnFkdHRwlE4Zst2/l11307Ar/6/UYh0iDS5uV21VVaXP9xfkEjh1i
	7Z8jN7d544Slrl4Po15gZtMcAj/d0a3Pq414wnmlIv0pSJ7xnsQuuP00qnPxdhbbCqbu3PEiZh+
	hpx4RlMoykcZvXbrvs9BLNw1aQfsEzotPMggjtTUSOPdjMn35SOlaJ0CAhEVftVk6Oa6CFWX5zK
	W+nm74XrcD6PEngkMsmUTAxz3fDM3qSJN8/bicMtg1uCCWKJLPFCsRPEeL7TVTcea3VFrqRQX2z
	7DKjQjzSckkEwD9GHgwlMzZRYvb8I/8Y/kY0ssKcwTkCOtoYdj2333PWYSwbncJ3p2st/htlNKe
	ApCC2H6qmnQJVxx0MTWAwxvrxrJjfzNL1WM/Ba37je1T49cq4obodP3SyG4tglpFL4CZU8KDnsX
	vdrjGiAk8+8N3I8G1IELt2k2ASf5xyCUH3vmB+fEyNO+yEvCK1kqjQB4sSmFD4aMTYTcYr/jnX3
	OtLZut8KokiciySf7CEVkDr7L2JqcLlnNbhyhqFc1gdgPGzIpiSSk9KTbVD8Ahyw5VL4JZJBnAu
	888+vrXAKSp1Ke0WuSdKKaOCIp/Yt+rk8OQBxW/Tck98cVrKNKHw4yrcvk2KbkmUMHmsBQdmjlZ
	5/mSc9vTKlH4yTrURC9/rBYcKdhbB+zyJPfSGvfcUOe6NjbU=
X-Received: by 2002:a17:90b:2692:b0:3ac:92bb:cabf with SMTP id 98e67ed59e1d1-3ae6efb54ecmr11165443a91.18.1793758711475;
        Tue, 03 Nov 2026 18:18:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:31 -0800 (PST)
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
Subject: [PATCH v14 11/12] ALSA: virtio: prioritize staged capture period work
Date: Wed,  4 Nov 2026 11:17:44 +0900
Message-ID: <20261104021745.57733-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
