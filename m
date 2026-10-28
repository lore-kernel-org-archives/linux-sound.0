Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180555;
	b=CskRbL2MahlFbfx+QwSTgpahYJaAcJpJM7fuLSqXylhp6rkBidJkW1h/Niq5FxhDJu/Q
	 /zkr7Thigmy0qQQfWlVXFgV5LQh7JfSNaqXI8kFVGvcqNSMXEpmUuzrXBb/hrypnPXMn2
	 iafdP+1dUQ5CHdsdbNv7suu4+BuizJ5jx90kaaVR1X+uRsa+r+uTg0qVy987P6NYLd79m
	 HXhpF+P8HhU+zK2jSOtHOFLR0RQ8SQ4K6w0fGaZmVZ9e06OdjCqZ7qR3aGJlxGbcWyUho
	 fZZs4VABaSl5Wldo1K2OU/eOhdlmgzrThAnCb/TKGEuSuMoeAiI7cJHwSGK9czKjSbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
	b=hXU0wOk5OkHj3DKeJBbKsq05RaB5RD+Pur5z9dOiXR27IkrDJMzTNciZ5fkI+qHnvfuH
	 qj16QT+UNzKGbvP/n1J+XYkfMBiE9z3rR7EkwNToFCMbXJY/Q971HS9g3fTjvrxzyHfiF
	 fuD968nbp93QTi6TMPJv8mg0aIws4PLIRr/3hjpSGf1EhlIPytjXFgTPq2i06gKEjbBw6
	 Dhv2M9l0pGJWMxruYNzlYB/DEQuJiEmzB5uZcgpIFQfkEuZYq1YqurpStrcuU1G20xAEu
	 oBrl6xhHGfgof79Z01lj7MrcijIY/pSxxdOUAkphDoJgmqDs1kM/vQS/h2Yq/Bw3Bqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B609Pss7;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8283B60A5BC0
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 09:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8283B60A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B609Pss7
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so1136023a91.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180555; x=1793785355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
        b=B609Pss7x1M+vXFNl9WZoVkKNOL9Y1aSRCo2gJtMqpMlah2xfLBYh4elDb65a7RL7Z
         P8vmh2PA7ZXnjcXq1H4rsJWB+yidWlakk+e8CIsx0q7DuRBNsWgs0OSjVqeEBexp5tOR
         XJmiQTW+JPOcwiuVq2bgs1A9HTUNt8LlHf1hrmF6h0adr0PigdN46Ehotm06s0XzICg0
         qTxFG+zJB8WlH2BpWfgR3ODZcmkSI3FOihNdTb+nPhddmpmOnhipMj0HI+ce0WYesURu
         buZ1wfdxBjhbsoE0pNSAe8B9smDvD53IxCsCFyIZh+Lk6fvz9+Go8DBLA/j/ursNXZUg
         gWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180555; x=1793785355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
        b=tN5U5o1SYpxE7d52gidSIQIZWnESaCvUAjosBdIljC1AW8z3X5y+F8rNFjL//krGb9
         jsl/pP2wBS2tOq5xg0b/6g9sB7EGqrr6OtBG4h3aujvdPsPyueAnyxZPqx2odw9FH7gS
         GK96k+aEPvcscNyrY8fyjtz7JRYhy/IWiY/uPud8gQ+u8OsbN4HnaMvwYVvwCLHJEj/V
         rh88gddN+od2NcKeR9kj6EaSBccH9Pto4rTDLga5vB85VPrRIYhzYH0OtyEp0Rsl/vRq
         E3lodoGtGiBHcBtCFiTcJmF6OEXDREH9sQGjUwFABZzz/sq3vy3nV0LcY4yEzTZDpee+
         jEbA==
X-Gm-Message-State: AFq9FYJIpgyFaew6koIr/Sjc9msOKVVeZfoyJBE66EgV9p7p3d4eSpSE
	QcESJg+7pDIa7ajwz5pOzbn/yuO8isAj0sNk8uSJxxoTgg6UcwVng94RLJt0QA==
X-Gm-Gg: AYBFou2nHmB0wHXgS2tMOgafIWV683WT1Xo8UtmIOL+2Beb6GCE59nXuiGkYRowFF6L
	FOq+ZDKBQsUv8vIx6HvkUwMxBwMHk/3Zcdgy8M9SdUucnknrPB9qtKrydAa8KyYvQiDXzkBracS
	88dOj7H70slisd37C8FECM8PCjh2ulumdAxyIxfYQcwJVDiqnaNAzGTAk2fP3g/pNtHYa8UhBy8
	3vJdie+IuEjStRFoMNw82eEcOi2sN4mHLwLwMhuoeYCefVfItfKXTjRh6eXWaeT3IiJZx9x4tLt
	rI9KWX9bpM8Fq/W7uhua8lYfIxZNB0WUJfP3GKmeyuXYX9iyJ9I7bLY6ZrED5tjqD3tCVmJ0M9i
	gHKZMI866/clKhQmVe0RC5oM0gBgGN2oMz/J8UisazSnxI50HnfBnJTGMLoiDQJDt0PYKAQroE3
	7OKDCkebn7cnCo1BYBnSnsoNCB5aw0jUDfjvpFqJqrZEztOfDL1nbkuzPoeJ/aGm3anvgHNYkYF
	aTORqjAmlI6oZQpxOucTHoN+SVkYMGeGxZux/eHlBaCDBBL6oWMmtXeqH7bvBMq+vq9EyIQpw9y
	pevaHklkOvIqOQ2yLfhUJCA/ya76PxrQy8niWMpHjQvLFXPGrcUuXJc27Pyw7fOO10GFKGIMP2/
	KhjO9feK/AJ66OfEEdL3oHx2Ubc/HhUrnQB1u7wNdYhKlnaxrD30uhUs0t+9EthVNP8ve
X-Received: by 2002:a17:90b:2587:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ae5c86a185mr503200a91.23.1793180554903;
        Wed, 28 Oct 2026 02:42:34 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:34 -0700 (PDT)
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
Subject: [PATCH v7 15/16] ALSA: pcm: synchronize stopped paused streams
Date: Wed, 28 Oct 2026 18:41:31 +0900
Message-ID: <20261028094132.20364-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

A paused stream can still own DMA requests even though snd_pcm_running()
returns false. Stopping that stream without marking stop_operating lets
a subsequent prepare skip sync_stop and encounter outstanding requests.

Mark a paused stream for synchronous stop when snd_pcm_do_stop() handles
its actual stop transition. This also covers paused XRUN cleanup without
having the driver predict a stop from an intermediate ACK position.

The non-staged virtio-snd partial-read test previously failed its first
prepare with -EBADFD. With the companion driver changes it prepares and
captures 48000 frames. Playback pause/drop/prepare/write and reopen tests
also pass under ARM64 QEMU with KASAN and lockdep.

This changes the core stop path for paused PCM streams beyond virtio-snd.
Coverage does not extend to all PCM drivers.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a2ea44c..ac2e5c2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1611,6 +1611,9 @@ static int snd_pcm_do_stop(struct snd_pcm_substream *substream,
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 		substream->runtime->stop_operating = true;
 	}
+	/* Paused DMA can still own requests which sync_stop must drain. */
+	if (substream->runtime->state == SNDRV_PCM_STATE_PAUSED)
+		substream->runtime->stop_operating = true;
 	return 0; /* unconditionally stop all substreams */
 }
 
