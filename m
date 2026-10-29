Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263877;
	b=dcFTIMUoKPKyLcHRrFuiXD/mzB3Wr7vSyzyjFPFfeyij6ZQwarDLKEokMwG5MAAE6brD
	 4BKZONSSR5krnt7GjtCIUQ6wpvwwA9NR8HEUYTDeN6j0werD/w57PvlJToCF6DT+DIv0R
	 VY7YMvvNW5RphDfPk23lVE/oGm3mCz4G1VvAc0RWgDQrg5X5V0QJDLrKHvS4AgqCHM40n
	 X6LxMawVGRK9103eUAc1wx1/hqtMVxcP0EAMRYc2fPEFEkMBo1u9138oB+b4Rpto5aJFp
	 ah/H/ULCxebu8yi5vpexg6yDTWHsCJc3IgOji9NB5SbeoZfomaLQ67Q017N9EEq7jtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=kIkzwTBrTzbNBFlErqYyftupkwyUkZO/aOUDA27Prw0c8QDPGTZvaysAd7Jl0EaeLrZ/
	 SN2n4VkfenOQQhOpeGUxL+guuKe+ORqxz8UwrQsyxYCjiaTazL7feMa6pNmds8M0vF7qM
	 lMO88J5JcPAkwS5vx8D08G9Svg59vm6UfzJeG6JIb60cts4jy/33pzCRGCc8DHAm1rfyt
	 hzhdHDaWU2uFOZ15cslcRKjvKm7es5TrBZHWevj7qbocicVjq2X6CJ5NQE5or1NI1oFl/
	 36e7twBoEeoX+R1dYT3ZzyW9sIMU5cUveI3VLwp7n0a1tHe2nWCO4c2m5KzcGkjrhUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9r6GOqv;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E57606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a9r6GOqv
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e95bd1c14cso15285235ad.2
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263876; x=1793868676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=a9r6GOqvtReidRbizvrwYq5yG2LsJtD1l42uCKo3/jhXYRdPvyaMW/RTS4F3JqPaNU
         Y6TGybNcwPerJdGie+nqXuyKQIM9oikNKYYWjiV4+VuiebMyCoDnAmD/6QfRKzggM/vB
         lyi4nWAU/3gA70Ije/TI4fu+sqL5ptU7plEPlXlF200RFK8hVN2DPBaHg6JZCAVQuCJ+
         CMZAg1hOMRMdU124C9wW5pME2QymvW6BV0O5nzuPkm/i8eJokjfRbaTv1sRZ8f1d261o
         UZH9STY1hyz/P8GTbzJkJCnawpEhJcK64GTtUMWWiLwGPWqs8g3S6bcLRXyvG6yMGwWE
         w3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263876; x=1793868676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=frZgs+PRWb8pdNg06VHp8my47flOjNHtUH9JV1JAsBUmq6n1RMfFbPSLKALrak4V7K
         UbDcaCw4q0TuUGpEmUB9wUR0Uo9S2+pw+2NfelvUEl+d0xCxJDC07JGP2jHzSSuXRhOk
         9RINJ7VYSgNgRopPepOQRAmToAzVrdIFqktxKWabyhsCXtfivX5/z/Wj8RERYYPorxxy
         93mzKT6Jo1tg6VDM3QCePwPP5U0gE9Vrbg2/TPgSsNs3ywg2ZExO7CJZPsBxxc2wM8c3
         bkew3YWHR9uFPVcRUiWBg52KNsBZXtjupe+rv/lVW/WgpFUlH4EW1SujZlz0dkEr0mJz
         L3Aw==
X-Gm-Message-State: AFq9FYKkr5nqvIBYivXjSAc/LMbAPCU53hqPF/22liysHvvr3wvf4WND
	3uL7WEpr6N8LzWl1nSED8Azyt+WaumHBTYXO10faMMP96nQyHT91h4FJrIRvkQ==
X-Gm-Gg: AYBFou0PqNL9LiSRqwEghvepd4wRnBAYaC0Id4bdHI7Clp/qNCZfC4GIRO0h3EyWbto
	q4xVsRbUWkabHKIyumawBUAHI/Q/25tDXyD0nbNobnRtvA1rki6qBBQuNr8ueBjTpOqyv0K076W
	GLc/TJFtvqYBgaVDHgILJTdPioQHV/bdEMpYT4vlB4whsakjwz1FTPF2dR6K/2KgBu2LsTCv201
	TAS4bEh3bNjL1x4FNNA49RAjm5o8mG8A8BtmuQsTAyrVX5zSWn/i2mQ5cYIczy/ikxtERal+ipZ
	hcsUzs8x7+mJ0lbIlWbqVyZeDhdZMHcDPqv/GL6+N4r+kaWaCZVw9gC0qWtKP25gPJKfqAvu0qt
	8d+hoGTG2zSfmsWYL5bOzzyZQ4G251XkxujaklRzcRF5xQL6Q5g4VHDqMBC0TV2LYPyROCSbJB9
	u6XTDrP9fb03BP/G3GqaBxvkATRmv4eEVJqq9rww89agathIPSE/UlTJcgK2IGQaxxMZT873Tsu
	jngcwo/a1ZxKQ/tF2Nt2om8eroUsuUrrcIe+I+c/KCPLUDKxfbLHCDkdaOvs2K/hRpLDZmucjYJ
	E32ALJ8YgAoQIsnCdOyNkCsfy6Os1uikwbZCD6e5cgM2BRLHMU1lz8wf8QQiuI6IiqlOY3qe7qJ
	3ktp0GpEaY4QWZ0hU7bvFduQpz/EvtkuQP3UGpnpzhA==
X-Received: by 2002:a17:903:240d:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2eb00519403mr41782825ad.20.1793263876019;
        Thu, 29 Oct 2026 01:51:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:15 -0700 (PDT)
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
Subject: [PATCH v9 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 29 Oct 2026 17:50:26 +0900
Message-ID: <20261029085032.70689-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
