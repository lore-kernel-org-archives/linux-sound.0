Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862543;
	b=b0mmx1VMkNlBP1IbH3cRJ+uNOR1UzYDmwJDM71z0/hqoMBGe8pH+UKhppOq2UPJIRTSt
	 ENNtlZ6Sv1LatuEnClJm/HxiCQrq4mc7t6tmcXbClUcCK7qOfBWi5OKb2oANSA7gHDxUE
	 ETmvoxJRaqbwtOo74joT0uFKaoAISS8ZN51FIWgTBKKdO+VMKOqMo5nVw44ud7dU54Lnb
	 n2UIX4ElrBKhQ+vWT3Yk++/M//UVoOkEJCv+IK8rCn8gAGacUkX4v1B3Zrbk8VnpaxQws
	 oUv4WRwd84p0SUs8NtVM3ptesNfpU4Qgr6khVkf3MCqGPQmfBzuZIuHEj/dheOLQqgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=L3CIXhLam4nnbSqWNjI9PjyWU4kM6KPtOceg+Xl1nidRsUOVf7Fku0mwlIuJkJaYOjSC
	 ztRYuIkaCwd15lCUwS8eULC29DwXaDecUCs3w6jLl8Kxn0QtiUd2bxvBqRfOO5eP6T4MB
	 KlPNnF2xsIx0IrrBiW4hv6AzQatNVAR8UIwBPBss/Ru6fATEnlL8UGXo5jLH9YPvSIgCI
	 Jiq+6CIsfrfv9eOmbmwYukZk3NzE0YxoJqaEvH4xy0CKivbJ/4QUj35c9itIz+I5afpen
	 AMVI51XWQQgUXwtkpqfmFPsDVAO7MLoEeN4vfJAW6JPfmgwr+mOeMrMI+sUGRJM1EJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXE3XpN4;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC87F606A335
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC87F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXE3XpN4
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso63501eec.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862542; x=1794467342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=CXE3XpN4RTbZ/pRIBLH2e5Le5OXSIuYJVvkZhfWt3DW5rOX0uo3RhrBlGEQKhyPTBh
         QcUeOJEw+Nwe1aYHteoSRSbNsMrnItZAYCX7p+MNC7B8PyPzyCt2hnxeI3MSgW29MKOD
         GUMRaaiV/ldqgY3rGPFUPvgdKpgqrwTMfsK1L76y2Ezpf/i7WYLjMCrpcD7/D3T41o4K
         acfaqFjkC4WkKFIEEqnDauvvJRpEPKfK7DxFCQIL0eouPzSTDRd6CEkcNG9sUwzm8/4E
         CFQoC/EDfPFUAeXPvyHeDfoImXpgru2Fy80B6JiykkIrUTPC+xKmM0Awk/vzvy+vUV36
         KfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862542; x=1794467342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=BAAEE8a2vRlmLxOCF0lu+nHkTAAiFdO+GbH3KIHnmgOIzs3+awyQ5jPMa0NlzR3Z15
         xrF6thoJwUyOoly66BMLmheXtWDBXJrnsw1wx9+umaFxL2z16CD0HekM/iejzWjf8+mL
         r7PZM3E35bErqGjJerbL7ECpkbhNYavOloDQtJmKjCvwrCNESs34umqq1flyZfkAuR8R
         yUNW5tgdtnyBSjGvRdf6stkwbnQtlyMFx1x+8SY76iAjFHubxzyWkykjQOA8dNDIL8sY
         U00L+I2jkRmeMgt2n8xXEnEEXPo0x+O9Z5l7gm5aI/G3h/5mrTjbG4c3DQVKF52g2gpy
         7FzQ==
X-Gm-Message-State: APuU4Z+PtpSJh2qXKEOZzwNxHKayC+b0haq3cPR6xHEU5RijuUGI+66m
	QTnqLLBIgax5toCXZgfWtBY9HMbVk7hc+53F1/tUqEkr65kwVSBynsYKj+hbNg==
X-Gm-Gg: AYBFou2K8Zz5ZuSV/cgXBdeN+Q1DvS3fNKYbwYK23no7IaHMPeXF0UZ1VeigCWeOOH8
	2LK3wW37gtmViwKFm33pIubQoQyzft/sfoV2z0P+h9SwdvvGz1Jf9EoNVqWgSPaVJPIK7d6Ggyj
	UmaRLiR9/cXOUn7Jd8uNBllBPjg3+NLWReVQ4vGFIE+jTjMpUwKbURTChYfn36PQ4JKilDTiWRO
	n5fVbCmwHE7OVUHYGuuiodHzhZrhql/aq4qbR5m062/dVrfs8TgskoALx/yHlIN/dRHZwEzp0wV
	2u9W0hVvwXMySK1ZyfovAiMQosev5tjkq0fH3xrBLbT8Sai/57thggNAT4LeBAatFW7EmjRcliF
	6OwamnCMmrsFwN7RjUiCR5JN71bo0BnMLpZcSF1qe5NA84y2/8cpvVk5RUnhxLjdDazckjn9Ptg
	qb2U/yk7I2HN/hczf+qyp1N/p20prBz5+tRblsZKcp3dRKOQ8qMIh5lFoDU8SRZlhxHDdACeUbr
	HFeCMZbsQPynPifetwThCW6uM2kdtdvpndoVAr8OE1X8hcrCMDtqn5TrnahHtlU7SvhExw9f5oh
	ApPhaUJ7Wnxzv8lafPO49H+jhHVATfr5puR+/Tpl6vuRsN/tFptWiqQwemb6NNgKqza68tavi6M
	f8zh28YPrDMmnaEiQMMdp2aCkvcPkkryVjb5PqFFdp39fYqNmvnuWjzvCa/w26u8PhNQq
X-Received: by 2002:a05:693c:42d4:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36a42484fa3mr25645993eec.26.1793862541804;
        Wed, 04 Nov 2026 23:09:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:01 -0800 (PST)
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
Subject: [PATCH v17 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Thu,  5 Nov 2026 16:08:35 +0900
Message-ID: <20261105070845.6449-3-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

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
