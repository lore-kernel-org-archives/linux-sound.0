Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355557;
	b=uvq6UDaghUk9trmv6SgHICwSrTMXGqKXv02K8Rl+xRVId0cbEVabH5ggNT8jHtZAy/Tc
	 lE1J6KTSq33zGIrT4ZEM56/9YOX5mpdqAXFMyx3zfx+5ZfksXRHJcFkrOxW4Y7aA+5tuq
	 7yYT0lzOU8i561H26phYeH/PO3Ig5xcDQ2IXeApM+S2ZZKRTwQbckXQkSdGTLcfACsl98
	 GFG/iD9juuoMrCnBOXdAHY+OFMehZ1veV9UlwF83e7QRKDwDLYBxxvdjmsfnCliubAh3k
	 lqErR4hc1uABf5GfTZj2bQ7qC8X/nBM9jGAKaXvf2QOf3up6QZHEKgOZnNKo45tVpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
	b=ZXt6qg7Xa9GRPjwUALwPto01rO53/ba/RSjB5cGw2lnyg9xDSnByb6cHnGrGNNkIqOxa
	 iF40owtQkRzzUz5PKQxRURRkeiZEYtqqdXBPzoGaQeqdn7Lsc/duFoymt5msx7+qb1LcX
	 +uCWDRjkn07VrRkLIB7A/egi8p+aTnKvVjo7KAnuf7qnk3gy7vcbxfBcGyjRIdo7xf5g8
	 y7fr46ODZVE1N/KzLde/McPDisQUELpvvxtIuJ6NJL3yy9y/MtRSrVPqw5fPEOxHHdmGp
	 IP+653MhejgtLezY82m/maefogxSWB758onZeQ1hkeeYaDcVZEiHXFM86fZ0Ic/BrBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLCiXCou;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118EE60A2613
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 00:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118EE60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLCiXCou
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso425329a12.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 16:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355556; x=1794960356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
        b=TLCiXCouxRQsySRLF4jYb4EARhU/XvlRWElzYhgGKvt634MXWfsCR5W2qWiQGNiB+S
         RByd8Ib5etlaMk4WuH639pCCns/bU188ErMFjtgMAqtVWTbqk3r48R/1646DasJSB5jw
         ALYPokjYhOsLTpUots+SFMfsXC3scwrf+P8VTj1BHaUchkpLryKjMlyEJr1jQaAUI+yy
         Xgv/2uW2w285W7hzy7xRdw/hkkNtQtGNoW/kTd2pa50+5JBOcd9RGfFW/60wNXxRoHE9
         WGOOyLg4/YMrGs3aCiNp1Er+nfhQYFPOTY3BxhR7SOT6cCAU1ARPK/BgqxRjRzV9TfmI
         /XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355556; x=1794960356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
        b=x+a16i/FyKaqv/QiynkHTLRgQzjQgqqKrTPsE1mwePyv5V7pEZvCV5XK2kF0a3jaKt
         WeqRfbw6LKdkG8H01LVw/hpK/vmFYantri3LowZ0GDIumj6jjkg4+IN7ZPgLX4peI42I
         fltxD/fqI5RA6z2L5owOmAaYZtrjV8UGQ3RNJGMppyXxwoG6WPZGzaSo3jHLEaun60BB
         Hu2E6Y1/rU6pxfVwzMyrAkqOn14HMrsi8ROXu6q3S/SzmHccIoPChVjPXBzc1qz8a78m
         6LhI9wNyCUdzDX/rQpchNGNs1Jt+iU65BjxlqWMCLhiYyjUXQIqybtorL8Ge7K27CstL
         22MA==
X-Gm-Message-State: APuU4Z8mBlvI9jRxPGBExuVk6RvYunfql+kcyigoqHHYzxhtHu/lpm2a
	TLCaaTqCz2ygUmpedyU3n98QJICYqhlXK1pQ1DdDDuQkXhL5KlUACEPzHloNlQ==
X-Gm-Gg: AYBFou02ygeNNvvMMR/bZJZo4Ydqz6cDvPRkQ+VTcJ9SH2btATozSFVab9ri+2+X7uz
	SXf1wKu7J9pwKQZK9UVz/xwDlIFRjTcsBhLH0jfyTJVoCwFgakh8mqsklqMHAnYgy+JGu8VDAh9
	udex9UeRnmUD/U3V8bHD9ICoff/z7eNE5CL/T/llBJZNlV/8lJbZBtn6xmAya5C/cIz8NGGzGY5
	JonTbcw9h84UPBMjmZ76sIIp2SO8PWHoPcV9Qf7ZVBHOArIoFh/yyRrNMwJ6oTheT2mani9mQoa
	HGQM1A9fv0ChpLQgywBonB/RL3ymlAJ7NlJtXP71M8nrHY2uqufnXJ+itAmFUlM7WF7G8aIB/cc
	zsYSDHlYSepbCWJT3Frsuah0+riYo7QArNGjstkcS2G4NqtkwZj8WGUhWO+iZIY4qAFWuBaKX7Z
	ACOojPGK6IAMazgb4KFZCaBKprzzpVaQyoq++tU/RDWDD9bn2u6tbIKtaYzZfPGiJNIfbTGBkhg
	xOe+FGa1VkWWPJ63tJegbE6H7wQSatb836pV52EU0XqRC9lpw/mQSvZnVqxDV9guJrmuQAcQgMz
	PdJCdtB/jFaI3Yb0NAzfczAquKuBymCcQU2nWg9STfu8G9e6yo7amVAlq4899JSiGqDGTowX4IQ
	hg3F1xQMzfrQgkTOw1ntsdWxpc+vj8v72SI9vkUmvdB4CeF4=
X-Received: by 2002:a17:90b:4c:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3b182df3c21mr660693a91.9.1794355556265;
        Tue, 10 Nov 2026 16:05:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:55 -0800 (PST)
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
Subject: [PATCH v24 02/16] ALSA: pcm: report partial progress under the stream lock
Date: Wed, 11 Nov 2026 09:05:29 +0900
Message-ID: <20261111000543.28550-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

Allow a driver to publish subperiod progress under the PCM stream lock
without generating a period timer notification. Use the ordinary pointer
update, XRUN and wakeup path. Capture DRAINING can publish its final
tail while playback and other inactive states retain their existing
behavior.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

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
@@ -1919,6 +1919,30 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Capture
+ * streams may report their final tail while DRAINING. Unlike a period
+ * notification, this does not imply an elapsed period or tick the PCM timer.
+ * The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream))
+		return;
+	if (!snd_pcm_running(substream) &&
+	    !(substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	      substream->runtime->state == SNDRV_PCM_STATE_DRAINING))
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
