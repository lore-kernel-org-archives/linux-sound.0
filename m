Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201391;
	b=Xov5uhLEwE/EqY0nbB+VcvNF0R1X/Uifk5natqDm04L7VIbTVqR0r2wYvrhYF3I5Zkb6
	 4kZoZDG6+4R2S9k8BQZTPzsgavRq5hap8ukUviUq38G4Jy8NA+B7p/ZBFkCbDx9j6cRLh
	 8+pUQ2KgvoQ/YZofs2KbSo+v8574ATrfNiSBU3iCYlXzXgo1sks3IulNXHkjccVLXFbVU
	 ciqnv5gSNrpgn6tRymIBynjbhqZVLVZYzfsctmQ5z8UxF7WtY1CVqEE0Uyz7PMdWPIriu
	 lWsE/xFBhky8cYIe2olIBEdNOMB+FuDT2z4oVGZaBLHZPHPsiSL97aRlHPaoANauulQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
	b=Hi5NhhoIRdz8loS6x8QI77NbqM2WX0mP6Ezuqek2sdwImP1G5ELaZADB9NkEHM4loXk0
	 YtdFb2bs67u8kUBL4bTbE4q0ujmAeEHa+RldDIPJkbKmT6ZOsga02YipPDZDIpHi6Ob0M
	 pjoxIjKWSp84ZyxCTxLICrV4P4ebBgL6F/11l7ltWgM6XxdUqpVsIL0J8p2RJw2aDFoI9
	 ehodl2osiTbgsSsYVPw537q/tK6BuN/vjJ6wO/FuklUcYkaS/kp095hu95UKBAWUDvOVO
	 p4PIChs9izq+SzWEybXCvJ+Hd4FHkzFqBKdGWreWVfD3RbdQdSOGbBempx47Dj/AZQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="q6//wb7x";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E5606A336
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 05:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F4E5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6//wb7x
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so665004c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 21:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201390; x=1794806190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=q6//wb7xNb9npoBwL7E/9igaV0A8UxA6JLgLNUuVkh5SM6Zx9G934sxRSzBmdh6pg+
         g+MFs3PyNEIMuYpehy9LDb+zQYW1EL5Df04xLDsSa8UPFJqnFiw7nZ8jlulXoOlxei33
         M2yEXVYm46+TTFlkqbq+N5fXclRvbO5n5P6xbzHRlGNoFsrr2TSKOWrcb5yjU9ZD77oS
         eB1Gi/jURNFou1LhprEkKOfqI7Vp5DF0CP8gEVunUuuRWob1WuCdDLJYi8WaxX1cJuYG
         pBPsgxATiWFVdAf4KJVotIcbSVWV7syeqnUP2Jpl5ndAPHWQ2YFsPPSI8kY8+K1/ddQl
         StMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201390; x=1794806190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=CaIU9JghRSZYug+DZgLww2xfM7fLF1glgcz2HE4D6AS+xTmsJg1zWez+Xgp8RCTg+h
         vjQ0lssy6mXHuUGCW267NvDgteDak2Pq4OcetpsBWNYkNDT5WsAOzoIoBPPmgWj9nRuh
         xxESmCTws1MpS3P8bZ55RJqyJj2wQM89013j+o8ElX9UY7dFO1Bgnyyhb73CspCDzDs7
         VYhdAjmLgvkU3iRoCA4B7CTAR8ENwrfksST0h0mN1qYC8daWul5Lqy2LKXa3FAXEpRg8
         +BS/sc3N1p14EdVofqKv5LBVltkGexSo4Tya6Dk2EBzmSKVv4BxE0g2pwTBgV2nNGjVl
         wY2g==
X-Gm-Message-State: APuU4Z+okMuqigQui38qV+BPkiZTW2/92HVkoynab45Rus6a689F/Im6
	QFPxnyXYkAVUa7+lBRieWmsIWQeZQGFQdfJMYq50de8dD4b+OuVilruN8ZmlDQ==
X-Gm-Gg: AYBFou19sDMia5aj0Ts75oPyRCB2yVEcX5PY0yYGLoHYqxP0tDuK/Q5CeD/WNBlQ2UY
	YFsDrSDVZHs+pc5TAckE4EqbByGlEhqm8QZjZWRG24VWsO3RNwanLBJZEcLoJWhrXZUPMsYx+uD
	U5EVZDH41mRYhN7kgfpgDhsQGCcMsKoy/FqlGqdQJn+ko00+qGQwdn4Snn9BFLyE76nhzFzhva6
	eExaZ3JU08Af+mQaOMc5sh1FB0zrJwwENXoDgxrVf5/d+9glzjuLg6dNRLFcM6L02rAlxhVApJH
	tUJvj5PdchtaeRgfff6QiWp9x2DT+HIjSceK5RHZMOiHLjq3ptxavUmFwChP2rJiG00W7RxSkK/
	LWIeOqRxQLfq1h3Jkn7yGSdIITmZ8Xdq7ILuAryctAB2CrfDvfr2TUUtjlz+IlMDP0pMawM0yHl
	Wn+wQ2W0DFgeAIrYfI+tK11m/Ua7ZrL7UTcrgEZx+Edv9f/zObRRqfYaF7rFPPCWquPB1/yK77I
	3Qvcr2rIzSOib91h0NfRSG/e6I8YJLiJzP3eeedmx5NfCRYnJBtu0MvyETW5L/DS0RGmFn2uTuN
	ZrjedzQqMrfqXCwz+zVHpFaFAWwFPDuu4IBUA4X5nKvwblaxL09qWP64alwDANgSQnjwh20bWqx
	/eKIMoYjhu3gG8J9PXbMVcxWEjAF1z/QYvR1uSpo93zMHrU0=
X-Received: by 2002:a05:701b:2902:b0:1b2:539b:496c with SMTP id a92af1059eb24-1b39ff1388fmr4548819c88.35.1794201390152;
        Sun, 08 Nov 2026 21:16:30 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:29 -0800 (PST)
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
Subject: [PATCH v22 02/13] ALSA: pcm: report partial progress under the stream lock
Date: Mon,  9 Nov 2026 14:16:07 +0900
Message-ID: <20261109051618.22506-3-mynameisjune111@gmail.com>
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
