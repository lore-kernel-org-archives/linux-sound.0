Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412566;
	b=1pkQ2700BZUXUzkTA/mO9rBcwlkVrng9QwluzbfHCi4DcCMaQu+SvzlPr11Xi3uMNXNU
	 XeBoutANUU93GdErrzoA6BrF+RrN7jjn2h9RXY2sPtQaqGnOi3AlRnr7TEaTKlbWZA2Pf
	 3Vk0hFvKocOdtx0RiMdxPxTHEUfCvsonK7Q+IwFYEMXrjWNPfPkB64pTKw++1JziJdRjn
	 lP0tPPnd3sZG/tDFunG29MWTWSPIPTxYyrMOuHy5xHGIK6Z2A02LQG1qkSP2lmHsWQg3a
	 YHzFpigZDs+4LVLJFaPhu+qDuqv0WE96DKxlrjWeMD/9PAIaPcWO0VXr0bRMYupiQBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=4QAbM5deQ9p7j3zMmk8PsyLYWn4Io4v6eYBcFPOdG9iigSK3G7ZxyNsKp5syliD4D74O
	 XFQ0X15GfgO7vhSNuuV0h/KBiL4whpvI2jDmeWNChk1jIp+j0srt2trTEgdpR5zU5k6hT
	 6P5ieM2JVRdHMkJvTz2S499p5qEYLAX78R8zjTJvjEXGYAUBxc9p6wcGSjiT7REfB0DxG
	 G//h4Y3mdnJKK9Hzhjh0iosSxpEx2ewKircuJynEVdCC5BMdUKFvzsnWX6MRMDd0dr5JT
	 vr/W/WSyT3I5fKzhLgkqsTdqiVaX4ZbFfzTJ7RJj4GWoT362x1hfuG7xXjQsEgpJvdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FftBoeWM;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF92F606A334
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 02:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF92F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FftBoeWM
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a17a332ecso2340202eec.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 19:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412565; x=1794017365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=FftBoeWMKrGJov3vr943GXnzD5UwGoMRdcw0WG3QsWb7coV2Vd8GP5g4gavePatn2Z
         iKktiTHSMczlgv5VUJNmaKGju21HvVOMj+2drbJpc4dPv4EWrfHuK+N7ZblsQVFnXsqg
         2IKiNcWfqHMk3PNduFEEIhN9+5u3+dqNZy7zD/4ENqseyHTZ4tn0tM+ukk695SGgbqAT
         +IdjfaPrwkaPd84Q7y6sdEFi7Zm7EgzSvCPHcAJqRBt3zu7ZMFCa/9clMXScXxSJBqD9
         FplLe4k/doPq5GCTrXUaJLkxKLPPYPUp/ijUq8EdVGLvIWabtrLLFd4BDiHzniKmx7Bi
         9eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412565; x=1794017365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=d0i40JjeMGjkKlb2KnXNIxWnY3p/4L+4ay+cGF0+4VAyNAZHHuyloJWuwvBNJrbCao
         TdMLonB30am7tKXt03zK3JJvmkwf4gdBTgNRriLLY0pwCn9EHmN+uLzTnfHxOlv2eTK+
         OaXYGhCT+SuR3YBWeIlgq9Iryy1FNGaE5gEwGuf9zV3/btfXX0zZUBds6/YMLcL5FhX0
         jhYONkgOupWZAv+C9gE3VLGUKLK4rGmGxQGQtx8fJNBbFJ6+0KO6vvqu33TmlVMYZXD9
         yAGLpKqrHOaXvaJ+WWWi8FDDvjjU/NpELe4pZLzXAlSoteNCUNswI0Hm4eFCRJxsxt08
         1nrA==
X-Gm-Message-State: AFq9FYJLGzuJmD08AAexqwBvT6SeLpi5L2veOBkR/pfE+clX7NEYL5Pk
	8I6ezuCH+D4+9Kay9o+nXtXLtggsl+XgnaI9KrWntWdUHO3tHH19tnviSrWnidGW
X-Gm-Gg: AYBFou10daMVdDm7ZlqFonHYjOty34a8lbW4rNbZK2QpYxWQmkX/z7yBj+S8tl4ITdU
	anI7z+XwKesQm2N1/TNVReshN09HcdkI+GPrmZIWBx3JE7IaHS8E18S/JruecJicbbIhuGwLa/w
	SrIuxb4escVtCod5P+4++Py/BAvnbOFp0MoEhIFEUBtTULv1NYma8ggH6Lcf+xdvvXpOOG+gY4M
	Y+hMHA3iVLDdM5gTD8PJPudl45zK5aFEfw1caRm8bzcfacFWjs4rLSa/0FrICfGXBIlPi+3P2yb
	5KEsy08MYXvRTWcVxsMebh5gvzAr6caH4ldn1x+jK7DRgGkf29c9JYnrBdFVu99Y3fsgKOpIJCW
	Sx9fDTb2znR1i75FQFGMg/f4XC8DrELwsYk1/Fx2pr03Yn2T6wOQjuIfwUZ2UaUfkffgCMVCLk9
	/IgSRKA9RFEbwarvh77h8kD7sos0DtjehOksHtFdrytZFaz0qSfL6+6tz23pBS0gzU8JEt4tq/D
	8aBtZWPT+ZpdnAmxVBoautF0nfDK6mYs22U8MdwUYiYoXS8w2rbqyOTPxJBg/waiZ5klmtYVbBx
	BMmFsNYO9kP3JpW9iHFu0MJ30xwuLUxNMu84gSkRxh1S522cuUn44wvrRaUR45QOBCo8TMqgIke
	uXAH6uRHrru11J5dFr3FUT75Z6WAZbuPJn0e1HQeZbxxmcA==
X-Received: by 2002:a05:7300:c00e:20b0:36a:2289:c599 with SMTP id 5a478bee46e88-36a4243a674mr7312950eec.29.1793412564948;
        Fri, 30 Oct 2026 19:09:24 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:24 -0700 (PDT)
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
Subject: [PATCH v11 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Sat, 31 Oct 2026 11:08:49 +0900
Message-ID: <20261031020855.2402-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
