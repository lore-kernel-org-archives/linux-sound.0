Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923617;
	b=4XW9GetQgK2brmCOY1MpIAn/JFbhddOm9Q7d62voNxp4/WJ5mvfelZMix4r/3roMyRJL
	 Twq3nD9SvEnxvpOKrUmAUJqqCitR6kVT7LfDgh5TYygMN9cY/EXf5mIMjLYDMlkqZYO+8
	 3MJpGrhC2H6p8QQ7AD/gAgW4uQ+bVT715INk1CbEryQt+/x8CBVUFpVhYyAX/r7pKJ9E0
	 LXd6KdxJyEJ64z5SLfk/vUq5QoyVhqX+FmI6VNf3tqkUVazWVWvkh6IHA3WHOZ+o1hMIH
	 x+ZJei5PIdjYWSQyw2qLYcoxVZJtHameo20Fij8sDPp/fobLf7R/xRHcgJtexQTrbhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=Ptfqi45AObqzoKeB4aqZybBsObZw6mFTc+AOnwwcPuyXACRdtPZxjF6SSaeKy2KV5Tpe
	 ouwDzKZTqLotBBDf50ir8OPhmgXMhmb9cQKLo7SjV9Z43C3C6ADRsGhBdeehxNVLnXuvS
	 RvFHaOfGkoboiTEs1U4pSH0hVnb82nmtycZV7/r2ZJCc3XoMqbSQmhcw03xmmQZXhjJuN
	 EYQri6KWzHd0qAhRe3Oh39ejHKLr4cPebzD7kTJoeZDaLoS+IY1mmUvuybeixhOdRaPXO
	 WQFbp+0YPaPzbwqLsCJate5eyzIe+i+Ai4paqOl+YL5cSYh+sYwgH4gMIsOU31p/9bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKIPV015;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1409C606A33B
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 00:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1409C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKIPV015
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso303659c88.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923616; x=1794528416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=TKIPV015QX68EFJn4+P5vo+8AJJTVzCEXwrQpRqtHslgsG0c1c7uRhofueORAGg55X
         a18LTagKezCVYqP8/bC5uyxDqDtHPpkY7j/tBSAuKvwCkUHrYhKvqqCxz9ZfAiQCWJ3r
         HoOP80q9UXmOfKvq1zJR/Q2MSumiCLuEXFGWJMtZtEPZVt39YbFzPJud+XDrSrX41j1m
         VvRYndn1Dpcd2H9ak5LYQMTbj9QUyL9BVCmYKJ3NJ08HPHD/H+IDT99L1Yo7bdm7OTo7
         SNiM98gyTE8WDSR4pvi7gZ85zH5GpwtLC++Ar27DeH6gvas5qzeEHGfXmO3l1LffXh0j
         +5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923616; x=1794528416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=uEycVDrcSGo9dGYryRKNRJDeh74tljYBFhEWeOS6RQ39u/F8cJ93D2f24rw4U0q8fI
         Dec4VHWhRlZgLsfYPsknhjemZ7WY52z2mzJXdQBZ+4HPFg4E3Oa3QrfHkQmvLXZs63y6
         CV9+HSqP41h1cPo6mbmWRTWPEFAmF/3/hBVAe6C1vxluP8z+8qlkUpzbZIqgpRNsPGB/
         3K216N8bLCZDvwbqzK23dONa+/Xl1dlrzln840zyx9bgk5AcEV0/rfVUTSSRTD412X3L
         ugW90maqHOifhAdAcVq191oRA9wlnHyHQfiq5CZR9LCSZIAmj4xyZ+JA0qcTmsCTDoLW
         dYaw==
X-Gm-Message-State: APuU4Z94BXkXvssOlR2n8UP5cFUMlcakUwGIl6CPLIU3feu2Bn3UrGUF
	6Kv5HTRQotqaKwvsSZ2qxfnSYcOiICD06nc5/08ULHbztrbEQ+MudZvnsrsWOw==
X-Gm-Gg: AYBFou19SpkoqSnjoeShSqLYSHAQJkGiSXx4FZ6TmqzwhpVEUZCcOu+HEkdegML2tRZ
	RsvNF4I+wHRbaCBuH5w2XiNqZeToxWKCPnQ+ZOP2El7DopKKdVlmyPVyuDW/M/3wMQG3LWyqoBE
	DzJ+mYSNN9ByVBWT7MyQQbTYP6clEE5DFnzjQRDCmKZ7j40pwo0/gOkSOhL4AxhnZ67davG5kh7
	JpJZcJfi1z/jaWuxBm5PKFvaCMBVSPkekxeIFtZWE86RYfntk+gv2nQe41Ulhm1ePDQH/cv2xNa
	SpbwXO7YTSO+BLgtNWG60IB1DNOsXaDxODKj5fgbmnbyrx0J/ArCVkF9Wy1jMZBercVn2u5/zg/
	UeFJBeiu8J4HagulND9lCPhywOm3A2o7AszJckSmXqaKGszaFTShlXPVNol7UHfsmNu1S6XYnlH
	R92Ev94ixTNmZdQnggNgrSVQiZScGGx2x0+w8q0MVufEMnb2QVJFez3c0bvgn3mRZbTJvNcqKsQ
	8iia0zQ/y9iDLkoK4KI3OsnNDcgzksQDWCewsbbdrFYQl6RbzwdM0sAburFRueKYKiyTwrpYq7Y
	LcJftF2Jnn28tz7QzTAejU3K+CDpt+MjwPp/9HuYDquNL7ZAbIqygPGcxEFjiLAkiWdCNoVsl4z
	sNKHVGE+9YimXIpojUaA/fSeRHaFuL4jGGoxH5x1Uk9LPmiA=
X-Received: by 2002:a05:7023:a8a:b0:144:de98:eec1 with SMTP id a92af1059eb24-1b25d30dee3mr1114593c88.11.1793923616042;
        Thu, 05 Nov 2026 16:06:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:55 -0800 (PST)
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
Subject: [PATCH v18 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Fri,  6 Nov 2026 09:06:34 +0900
Message-ID: <20261106000644.20460-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
