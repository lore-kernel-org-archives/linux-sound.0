Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837371;
	b=rs7HH0fZgQoipcXowLtXrf8RMqb7heEmk1/STonO6oIRvYobiFdt/qVjUuWVHblY9WkV
	 T8iClVp0Xaz/3PFzn1NzfR7M3fy9+6ZpatSeSfytwUByY8L3vir6Xm0VRBzr8ihO4CaeO
	 CLuQnXlI4571swLAKfwY0HaXOOf2nrbsVZv3DN/o9QbRItwNqs7SBGDUWw6Nimt4mmWxA
	 v+H7FPZIijgJbGDmo9HOMwML8UFGupJoJFAl2zijllrr7sFymE/Jj9JfbWeKd9XI1v1qc
	 KgHwgjMQmGiZp4BVhuREYARtSGuf1OJ3RdMf9FVciVOxc2YxRjj8bL6tILOdSR5WO8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
	b=nROl/KBslORyRJozi3dP2J3aM+qsN9yG5de6R8m8T+LXQiORKAPMJPwCyxhsxEqsTnQV
	 +qAUrF3gi8WOWB8bC2x3fmiuxY53+8YPI5bkZV/Beo/N9DlDQBtOAvog6q7e/4Q1KOMSs
	 sLMSXVsasINXNaR8QsNYsyOue0OOlIlXhydyJsSqjow4GY8TU+UjKuort30MWDTfc1qC1
	 uigR8tGfRg7tF+IgP+qSolIIfc0LGB4ObgzaWn+d/aAeOMdlf501qOG6ADzRuXNuoV3Wd
	 9zqn9qu+P99v00Oh8R687gUToihtK67W8cB7uq9ENw18ACDCwCi8i8yJXyXBbwLz2Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl6OFb5z;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F1606D835
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 00:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42F1606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl6OFb5z
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccca948203aso575986a12.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 16:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837370; x=1794442170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=jl6OFb5zBydNsD/tNT6jBv/GBZ8ZMQye/xJcvyH0okOw+yu4OewG++lPVsQbbNLf+u
         iEogngGvmBSPwP6LOTrM7lwcICdBjt9aFHG1vQ9UZk7ST5SO6mG8uV4rTLqJx2wEQ2Jl
         DVvTBWL2S9SX9IY51lDkUD5bRYNSdVlYpiGvkNSoFAa7uvrmS37L8ayDIKVGwKG6Fiis
         xamH3kbyG01qqnPmyCubvJ+9B4pnknpnd2aajEFigos/0KPc3fPEncS0/xkrAzQHZ7m5
         X6TkBDaLvMDtpvSajhL2y4jq64tLDj5MDlhs2UPMg/GpYIumQTVTIS2F5CAY56VBaPjb
         zPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837370; x=1794442170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=o8kNWBDvPzVGT1GGZH6/GyfIg2TxCKri+Yhi9PsglOiQK5tVDlW1RUogSsiJwQ/Q00
         jFxVL9pgqHK46TkUm4hvyoUcfs2571KvTCvhvr5z+Uobxoyh1R5L5d1+Pc+nTUk+FDZI
         vxgiiGw/nk8VSeQISOsX7YAk+WautiBzgpxISSOXEbgGU7BexRKrRZ86XFr533CWU4X4
         NY+26winqqqBkSobJ82t7s7tpKHuv8PcPskzr0pXbu7raSYIKZDN4FRKd6+11jXZvuUZ
         t12QfCKXjjRjMo4afP3g05bKfhFu8gygrwFxe9xMuDh0ltbDcpZXNfI+kADeYXLEZcYB
         k0KA==
X-Gm-Message-State: APuU4Z/90h1iGt+pgpjAfK/RDD8gjMln9qVklDcTEsSQhSIxwalhvIlN
	FHgWiCAd3Brg9MhwU6P43KaBzRlggkVcOhzIEgqZfRy/BqkE5N30rSYEDOQGwg==
X-Gm-Gg: AYBFou1qKDCImTbMQcwg+qIAk1b0l04I9hzbjKvR6jJRL6WsJQdz6dJhfLg0PBg9UIG
	Rq8yx13fBuh6Zcow0tB+wci3LF0KBJQ0JEK0x2aMclKx2F1VhBrkJ957u4EJ3oiZHlXhG4Nksw2
	Jk0l8eJodFx8Bfulo7Dm7NeMx0br+AxuZS/QF43L33Q4TfHR+4sRbHPgTZhswJoMK5PZlFEn5E+
	UrYZp0VAzpbel+yr2Nwnujml2FgBIWzRYhwi8z2IP8aKvYe4bhwAVF6w1ucZwKyS6jrQFGKsG1f
	rsH0mAvdfUgkhA+61sv1Lj2uEyEaHcu01sPMDQAYKZRRxhIeq7TwgjJ2V/Cf+oftBQBXQFHz2If
	zrtXkTHfIt0rFMtxtQ4GuaYAGmoNPRh8sMgRtHdNOSa6wXRJx/mUzTEqa+BjjjSkSqFGuc0LGUU
	rwva8jFg9iCYg1eWzLBAhwLSsbYojNzPHvo9jWlat/sE688eJ1SruGRvm2/8x2F32xq0HNac3Q+
	PCtwrjoBS0yg23Huj9WZGXhSAUojSWGOU6se5sZokFyERFed+pigiFze4c55o8uc2h2/1kLdFRE
	IIXDo3vXHDPPPXZfRBKKTH1HxPlEigofGgf0ZSHFpSEQ0dZ5WZHPoPyySh01Z9wzv18nTnGmuLI
	5C+B7mrT22dlDan9eC55SbNzU6JUysHl5EMLLUg0D8buZyNY=
X-Received: by 2002:a17:90a:e187:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3ae896f862emr13929601a91.15.1793837369930;
        Wed, 04 Nov 2026 16:09:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:28 -0800 (PST)
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
Subject: [PATCH v15 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Thu,  5 Nov 2026 09:09:05 +0900
Message-ID: <20261105000915.15177-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
