Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338024;
	b=VyTYfPWdxt5uAKcTpM+G9H9mka24cULVdu2/MBpK6WPx2QNJDsD7msyWCcZPtqMrC/i7
	 C4LlYuvGngLCNZH/fEHVhx1HhvOO8ecRPYBlJTd4ip0gNGCMzFgQyoJGEKqAtj612aUho
	 +0UVO7NxoC2rXMXwQxvEjSGRtIKoE+EL4axadiHpaBwzkAxdVKA674+/HTRWK965UWKYh
	 YD3K99z3lTPyes25ipcghcrFIZdMjbxLc9LzAM+3Hjl5oIFEJL831Y36ZMS61RwRrHx4W
	 OZkWSnb6Gvf36ILxeeGi8aks/phrcIIKSYPR2rNztFfnGoBKnSap1C7HcEkqn/emoyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=eDbyFrCooKcC5V7pPucZJGSE4In8qtAq1Z1ULFTZE3NCTA6B+05Y8LAUsKbwRsmgK/VB
	 FNKPGq8MHYCmpMW9/iSkYvcANR6NfSMH98n2hbLtZobbi0gwrxmAgg5niUzw4T/YMOoZG
	 W0rXfU3TdBZmfXygr2XJJ5x701SBZOqEN4kR5uIInGtky2d4lSlKBnmI9GRhcGOMcJr67
	 iokkZuqXfPN8JrOT+u64Ntx9xFN2IRAvmrtrs6JVBYDiSmCKS91ln+EMnaq7KloVcxJj1
	 SUkm6cykVZKUdoyvNyK+SuWj/UULjbCcADDX//6oaTaD7CV0l9G+BOgcg0WMLJCBWKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJalwrOw;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBF606A336
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 05:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7CBF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJalwrOw
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso187728a91.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 22:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338022; x=1793942822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=tJalwrOwo+hAMP9G1MHcdAbrPfN1IgBT4xsFRsooJsDGhT95P/+dyfMlnUAiuCluxt
         4OmIo83tg7+qN9oiss1N8GQPe1m2uza2Il5k5t9uMjYyeBM88EbviXPmF9Gj6OZyDwBn
         Nj3yeZZ9Hqg+z5RLFUxLc0k8FCACdZRj5wdcFn0W2Yv1u72+Izc8Wv4WykpKfBVNiuF5
         Yx09zR50u0/wgqbfKa7UWgawo6fmieb48+MBhV533Tw171p/EFq9Wj2TG1fpJFoWB1z9
         SM7zlVa+TqozoSwyO2/9lnvynwbKI63FcuKUyS36K5MjGVeOx7SLO7rvtgF7Z5ASwndc
         3vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338022; x=1793942822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=MQPSPObyEo/ucAY31DjRoSXIvw7UsQEhQfkpVgka0dsXxJBO6cfYwP7UlHRx6V0xDd
         rkNFMTLT8t/Ocd7c52lfj7D6t96N0XWXkR0OhO0WsQgG/1B+GPmiQOeDtl0Q0L2r47Qe
         nZMRTjkMCiT0Y56Yjqu9Bca4k5+CeK5EjQmgXLVWVkIfvtJY6ApJ1WSDJD+nVGSzAV1A
         wXmjefXXPBm1NgyWj+1Q7WaWnLeMjQ/17D4YTKID6e8yw4LVQjQgpzzZvHUPSNyO6mnD
         KL10T/JM4RHwS1bvzC96ozJLRez2+JLVMAzGZvcmpViX/6oW5bVfsGSqyNMY8XWXIbGz
         9J1Q==
X-Gm-Message-State: AFq9FYIitDFZceNGWYEaldh2CeEj5xq2539CKndaxBt6Ui8K38VW81aU
	F3dGnK1TtNFoa2vNWtxL6tLYL2+46vqlNgophCnQNY/gcANUkhwESLAqyIMvQw==
X-Gm-Gg: AYBFou0SMd8Bknph/pxHBpKKUwTlpArPdzfK+cxKjNyafSUaSouBc3tlrF8tdfeN5Gw
	L4dTiDLD1+GtMSYsD0LKgy/FsWaxhAjJpBAdUTu71T6iV1tjJ8FfcMkSijGZZa5FxnNP8Mmn+t1
	Xw7tc48NzDCKiM8Jwl+kRN2QehIPP8v/mAEHNGrPnAvITLP3OmoYT6Blxvk2bTS9XR1GBsFnyNX
	mVP5iKZEwm/XeSWI+9dcQjuwxciwIrtRItfK2+777TiNzkMfhkmY/CTBYKjsUFAAlFF7B0QssDh
	zO7WM0UR5odsQm1vBFr0ED99Il71F1Ep/EQppAvGglXxk8paGClfNkgMzYujo1kWbKO3eI7sxiU
	oalrPm8F98wRhiQM1JZJIfjlKiItucn3viGs/xa6rhS4LQ/I8mZ1E2VxY7uqaNzPyISuuJgjA9r
	FulWfwyNuJo2mTucsQh8C/mpBMm3pNFGWRkrXdTQ7Q7e+FpJ7UAU9nAhNOcYLyWiPGH7oSMkuwM
	+Y3bjqa4xXyRkJsHHQC7o86Gve1n0NRjJBmn01RspKazBx0etUONVYCnSA/mkobNshOLLlsu0oM
	TeT22Nj72iWfe3vs21nN0o5pWCj4fiDPM7sjCniFTLyRMH2wx+3zGKxOmMVoN4Lfjp3RSUNPSuU
	5y/EdfQf3tR/qvs/fCInCH+f+cnaXME/gnvDv+mVA9tIeGucW
X-Received: by 2002:a17:90b:3b51:b0:3ac:d19e:85f1 with SMTP id 98e67ed59e1d1-3ae897dc967mr988753a91.53.1793338022165;
        Thu, 29 Oct 2026 22:27:02 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:01 -0700 (PDT)
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
Subject: [PATCH v10 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Fri, 30 Oct 2026 14:26:23 +0900
Message-ID: <20261030052629.27742-9-mynameisjune111@gmail.com>
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
