Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201424;
	b=cuNrWPnMAeX9UOgeiaxI71/Ebo85CZC86fKAZhoQG7wJJPOAzrtgk4GSQeSXabHibPiU
	 nXvEBxD3EiQdzSTrPRzn08bGd3SPLTv0xELkop319mjVmutZKgWz+pC57dbDJYgcks1er
	 9BaX9zPQXLmYkLVERIqu5SiZF/Ub48J62mc15+bOJtRMcjnupqkfmBIVaoUkFtIkvaL+L
	 php8fGbZorHFEQV21OSbPOkYG32zb/8ijCVIoG5rqm1ap5nJm4e22djIO/jLFT9lMDX6H
	 cYvtaxh9cEQTxnhNRAgB/ZtDf5V+wK/Mc18tKkbQbeTKuVw/UlpCUDhwgbKvygeavkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
	b=JWapL7iBYBOC2B+bY3/072zKmb6/a+dxQK7uh/MjNMAGThGDk9sTQ4vtZtgXejS06Gjp
	 zgzFM/DpUWmp3Umhg0LBgzplmrG7ebOQJlzgqCqBubaIA+wEyLhZnQE2SgbylzovQaZVG
	 aLBwinJJ1rnpK7NWkjDgKUiKZLmzXZYhMpFV476deOPsD8sHeSlPF/zBrX4GLvSauGWAR
	 EKMlcp7NJjjSKLN9kGNVD24Yw1SlaTYdsx014zpx8qdwl3Yi4NaPBwn9/g6L60jrPG3iA
	 RH6LDtrbEImuzfyKsC425YIcA6buSYjL/R7PgVJ03Zena0o4Q9YT+F/k/i3S9jKfRKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vun2rtUx;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6CE606A325
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6CE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vun2rtUx
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18818daa3e7so41765c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201423; x=1794806223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=Vun2rtUx+CEwInyc92H3Nuh5Z1WVo5bDXABFoh/Dwa4onkkyKBoI4LCH+6wc4J5FtG
         djwFvQaHM/I6+yCYaeIr2f+8Be1i81Ztl5UcvsMnH95QbN5DWW+iSyzwWXx558Hepmhi
         GGlP65PB3FNP82P55DkSjrr51hiWFtaD0JsWWZC1vU7PkLcs3hzwfaEhXYpfFCbxpEaF
         ogPVk7YBpjQ032nA3wOp+ggfkATSKLhsWhDUf7Lp5GMnmmumAZKmWapGn54f+lm9Nbrk
         A4av9NDSr/PsMytwuyxwAOVCYYyAtEPIOAZO1iLnayPm/xYOtJC/qbsfXVSlk12JYQ5O
         iiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201423; x=1794806223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=tBdX0tF2CEE/OR3lAshleoWkvCAnWQ++lf0TDXekBkujv6GClgEpZ3PdIKTTJ3+dey
         lkvw2DCHeSXmlfNcxCiYLxXxfPrtMbPYNOLt6jrdFSpc6fRwJRn2QLdSkvGQZrqsf/Zu
         8kGmsmB5SI94aKOrvMlknNCqOBC+3relHUPGsEj6WypCxmegfoHN5gnBKPe4ihaQlqFh
         2JWMKJKBs4nbU7kQiP/UDC3UF31tCvyHtVqVdHGzw6cad+jNiWysVyrqVKWbAsvFfxBI
         PRoGT/uus/5hFIJLApuM/MG/vRlwdUD/BgBYNHDM3ry8YRADRqcgGQN7XYQxSdLvUDOm
         +MVg==
X-Gm-Message-State: APuU4Z8SW5PRPEPBIkNd26HCPW5VVmcnw7mQZTAbnnr7k45okK6VWCcP
	1deh+2KAQI5xUtlQ8JyYeCiWijJJ5cyyvDBScpz16RbTxx7VKTDIAi5j6x+x2Q==
X-Gm-Gg: AYBFou3BNx6IH4ougvUWqBeDfJwcWNdqzVIU0I8t7YOdvO2fPPmfaRrXAoTZr33NRQG
	sf1ZEvJwZMC2ji2O08zncjv1TLlVcuahWwu+XRHY9APE3/AQ7xFZPN8ZPGkro32UpZlvG8sx565
	K16+R2M9KzjyhCMNKpLu8r7HQmUmai2VQ1L76CAvWTU7uXwU0oH5URrNO10wCkV06baCe8ofxWa
	HIxozCYZwfgEdCgkvlPDa3bQZzB5WkzTXaXCnXT1CKr7fkYaoZG8vwTNQ/847JhR/8yK3rcVXTv
	ztfaqyoY1iJ6DCV+VujGh4bhbTzQdbIaGmlJkao+Fy9lLhQFbi2bpVyqODoAIRYs/uAFL39wcJE
	L34ROuRX/GTCqMsJKXKX3voRuW/3kZfGwDg3y1sAcghRfsqvHtYFEv2EFvlzlyadKHHRFgPbquk
	v9sZPe4uirI0WEXCb2+49o4aOUzEgRbNPJGkN9df8D7pp33T3Lic83vgAlPZhRXqfW05SOpIljb
	XXh/OIKrjnwE+qj1w52RfuT+tX83ayFmZfv1M32xsw+uN7Q1SJtEKakO/3oxcxq5rmclD7VI5eS
	3aIbbLbtnFHceveF7JYuEySlA811T1uplBnPTF/TkqmJXMCLf5DyWaoc4Ye0GtwXZh7oo9Ioebn
	wW2AOzMoymJvy6BxxGVXytDd0LsxoECySNUfU28fFsvsZ2as=
X-Received: by 2002:a05:701b:4244:20b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1b39fece05cmr4832119c88.19.1794201422928;
        Sun, 08 Nov 2026 21:17:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:17:02 -0800 (PST)
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
Subject: [PATCH v22 12/13] ALSA: virtio: prioritize staged capture period work
Date: Mon,  9 Nov 2026 14:16:17 +0900
Message-ID: <20261109051618.22506-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
