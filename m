Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664277;
	b=UibWzET1fthjci++cT/aHzutprYxltmaGoTVfo/ssUjP3DpefdE9recg6AUYV2VWcIUQ
	 Ez6s9uZiqLrIWmxwYa6WZxcHdZIoM+VxGhKjTd5LrVoH+9LYvsySoAxAZyj8wST+YZECt
	 tP1S7ZEiMu9AXFbUpTLxTxNt4XBEEiCsD8HuB+e7/Scc6xiEpW0F0wo4M+T9Qmd/KLws5
	 NpSMi3swn8Mxhlu/GbR1Hj4XSENcfquaZt0Zly81RnASfoXQCYKuohSFXtUUGhf4bxhXD
	 78+ou/udKojPWQ0Unh1Gg1eu/FkKLlQ3YDk1wlbVymL8ssFEhz4+ZDlFcrMPTIOQNxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=IGdD3f+rah5ugwAyO59F3rsI21Gn2ZlUanBVPRyYm/Vxfc0M+T2F7jM5ndVLfLB41A0a
	 0FDaGo2g5UK1wp5NRHdMvXTWFe87OwJNS4mFiF8gel8vgAPgT+Uux/Dp1jud/06CZv50t
	 zejE9SnTPEfRFrBw6R94qnz0AijWxONpyPSApHbwDoMluk39vnJ9BTvnD8rddkGGyLwxE
	 gwUIc1B6y5scrw44qg/Ta2lWjbQbg4//drO11i9klbY9D0L5k+Y+HLsUsJna3JD281NXi
	 RlU4cB0K2YXoKYbmFfVTEV62AVg5YGYUl6ot4J1xEArVrTMQPsCEDzBqfwxsMRPmVYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nd2Tf+lg;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA60606EEA1
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 00:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA60606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nd2Tf+lg
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1423490a12.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 16:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664276; x=1794269076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=nd2Tf+lgrd05hb07aD5ySNOnXmx83NsZLjVBLUkumOSD4/Q1gHUo30WOvmV1y52kWJ
         Cn8QuoAbIF1TpKQ5dYTaYFu6//hQUg5j2HsZ42iM9W4VArfMybKJDZiqyb29MR2D69kX
         9cXNZ4C1MDffLzLIsnvysb6GJAqJZnmJITV9y6ErxD+aGMApss3kgU9TUalBPT6nirCC
         2UmvIboMRCXKJPtH1DMAwCvXWi1WxFGVBWPwR6qvR9Y3q+Dag0oWxMEo3qMNDRKMluDm
         xWEoo+D9HGdFeBkrI/8UX6XQNa7gv/5O6SYojTLXCajWHw5DT0H6Lt8deqBz2xasLOwG
         3tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664276; x=1794269076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=RR+xAJOQK2H8OlQjplRESpdAMlnfjQqC8vzojyDank59k+wWyWnVV60hT1HUJIZJtl
         bKI9sP1NrSefsLXel472UHG6101cE9r4alxh4sicHwQmO7HRxTKhtOD5jz5T+Rrmdw2a
         Ags7N9qVaT36DSmIwdioEW6250NCLs0T1fW18CQgmcCPeZxO2rz4xyaP5tGKdJ/l++AS
         qBfDcmDPzEZaCCJxRzFEP6hiPN3vQtmr1kB8KKYTWBHWI4cD4yEZOZguNgfp5EK5ckfo
         7GJTKXygY0qA9PCcG0/L5Xybji4hgZwmkoaS1YRmzY6cVjOMKvR/nnhH6LSB5EHhzn/R
         p9pA==
X-Gm-Message-State: APuU4Z8wzPU8QrtCGbghO9SHknuh504zaMXQ/qamyH20P9N/MFpudkH6
	3r/3vf3IKqXE3GX1rgH/XVoiOl2fIXJ+VNW8lP2MoT1Ef3ihRlwzi8pc9m/Ikg==
X-Gm-Gg: AYBFou07q0VxOzcZq/1NG8TgXoZelx6qmTNrMdusw92cUTghxmsq8hhVZEO5y1/Lam2
	t+7QbmtLvnqxn6Whu5ysncltIEoDsaUqRdm86CBcx/ivqMFaNUKonQ18xLxUsVZoEAJhlWXZ8iv
	OYYt+Q27udA7FiEVpUVbaIJiwtZCmlrWW4Fxv5wONhYTsm10aeeZZLmju3TOLSKCkGH05S4VLot
	54VPAuQfXptsGf1xEshyeSD4ZQB6F0Tfo9y4AAFM9eLnrXx0N6r0R9zOjJN9AaHtk6F8KrJc0SW
	F+116XhAuR9D9YKQYMhREzLAnlvsrqvPu+6Isqw5UyLgeaM5+NVIebyoXZ/QeZNHgnxF45NrTDO
	/GZyj0fCWA6Y9of4pHnJwcwl9kLpsKRb5FqwNd5k7fLO/JHlODfKiGrbVAXl3E+++W15vrINLH/
	8nVarBR0d1OjG+q87BlZeEPkfxRjLF3hlULoUONn5CGu1fVNzPBcvrG1lEXXpYjOQBWctok4Cld
	UGQZgpFmWxeyz4qMZFR9ClB2I0xwdXl0nYrk69QnPnylX0zLYxRGefzbM/dwyaMiFV5799LOcSa
	mv1h6D88IFizHc08T4zpmt+LIsr8NOrAT2RBudMuRXqvZTSBvgu4Zv4ytMgh6AD+oHWnhM4rYI4
	3vmiZxdbmFzuSlWwJ9ZDVub7aQZRV5Gmv3WNqmKW4KXiFTNQ=
X-Received: by 2002:a17:90a:ec8e:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3ae897d5fc0mr8022586a91.34.1793664275838;
        Mon, 02 Nov 2026 16:04:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:35 -0800 (PST)
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
Subject: [PATCH v12 08/12] ALSA: pcm: report partial progress under the stream lock
Date: Tue,  3 Nov 2026 09:03:59 +0900
Message-ID: <20261103000403.67106-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring wrap
when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM timer.
The driver must release its pointer and trigger locks before calling it.
Existing period notification callers keep their current behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames and
reported four available frames after delayed partial progress without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
