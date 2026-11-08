Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182120;
	b=Rg2QQ6vBPhB2OGIAjjgPbPGZJm3CS0lVFKvPha0SA40nWOvxWvgN8Novm6WHFUlgodnr
	 B+TMuaLnqb41aSastMl++oc/Ndu3zrM3vHZ8PdDY2O044+vhWNeANHaxuZjtt7Hm/hvv8
	 dboQP+hJdr1GjhEQ3EXOl3iWe1G56IpojZ2WroiQTuJfFs9MfK0W1gnhkMyQssrFHNo8R
	 CmW9YxnK/a/9OSOecOnUn3QvoLfWU1chnqggR3eiFWBhqzdg5CIfy1j9xH+3if2AikyXm
	 nfQW6AqrZk08BOdWHvZjekCHa36ANCV+MAH5J419sry5lijvK43ToJk/LaALUWbIGug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=l41J8TLLTCnSLPUk5mMJ4d5xX6AAfAcsrtuFiqeTcm7mtWXjUAafBNFBe3pAkDJ/f7Ba
	 nCR+2nmdSDzDHUTNgFwhHyJeVNUya1YsF+zreliaztaTjUBmye8IY8ooFN1hDmSQkdCUd
	 02xuaSPElIVhbaJI/ZQVLJ47N9PhohhzE0c/9AK6yptskm4+sFiTqeaWa8CfN6cde5ji2
	 j92JKuhGNXXmFIMFHsd1zcaHl6Q+RLuoyVGGqj8bOvc+3Ujo3Tudcx+XOUV2xVSjj1eMl
	 qf0Jhunr/4kANFk2qSr/4hITdNChW07wNJ4reDXvDqu8BldbU2am6uqyhOWN9vMAtvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBIczwu;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25BF606A33F
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 23:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25BF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZBIczwu
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9ae391a05so1493075ad.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 15:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182115; x=1794786915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=KZBIczwuLkGkhh8jOtFgXeYfwkZdQ1LFnHavSzMhfPHIZq/O/vzePbTmIhhSjCHqcH
         fcRvmWKFvWGt0ot7/blINy35dq/XvsSXPCnzieM/BG7cWTxWf5mRHGL1z7tw7EzjnpiI
         Gslrrc072qMkBZv5oldz1diYmgX0GhNT4XF17lpSOfWLmx5CQJ21zr9GJE7XxNvPXMv2
         O0KukkwKNkGQ7ErDczOigHd2d3hKlcukilY3bl7q7aemWaK6e4+6Bu7/Yg4Qgz0QamIu
         DNmqR6IcSR/1IqZECcXPaV8jPmsvrBO1hy5wmC9deeppANk77/h/7fhkspVd0Jhi/Nra
         zWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182115; x=1794786915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=WWYUg9eikInbJ61+jlxu5BHj3w5kV73WP2TFMMruW/CTfyS5sQ6WTJgIlnoWO7pWn+
         QlOGzohN/VZlNIB6BJZvWXXPF7IJT76k2YALW913/j1dc0ViDjKAgPmTpiMKcboB0j0r
         3TcZ4Se/ubes4XqxE4XWCsTR4qHDUHXUa3Q/BhV6JJltlTJSQ8to5PzxBXDj0WRTz5za
         56YHHUKXKVjLe1ytElEbwtXu97d4dMwoTO/gk6FQQ4KdNM6YUObEmms1PKsr6uqehiKo
         h7hZQT++grjlX8u9Ehyc10o6no7D50yUTEcO/qPanPQUOJvWjOhYMh31oJT8hW3BSua8
         Ms2Q==
X-Gm-Message-State: APuU4Z//z9Metf8HqmL2DaFxn61PhmDbcjGYJtadFSR10jKKMdo/591w
	GkiIhExqbY5H1h2wDVzcve8QEqK8SHk/3HLYwuQyUJotWmXfagi1cPu1h9ZVNQ==
X-Gm-Gg: AYBFou1cy60NxFVX0+Ld+Q864YWlGgHs/uWAdYWQpnj+i7o1Vsi96xhnPuykFyZ74OM
	DeIVksUFC3jVQfxdUGGJw6Z8PG9T4yTp6IQfdW/6xToePeQ1BPbV6/oqJvczBwgmtYlPaigps8y
	Vo8rzIJBd6qN5y+6bPgBwqpKhYvFQgtZaTiVpG68+6v0yFMrkU2FW2MtFHiuMKoc/3ycq2/bl5S
	k0LfRl6yJqQshyes0e/8Ny4u3xHBWw+j4wG3xZABuSk3KfKGT/v0FAhp9klmpkS9s18Bd3WOSS4
	cWsvEpWewpkZ+86/y+WQ/+vcvtyfHAO1OkkPE4P+nv+SdYJ9ExlpQTMIYZid7zJGNYP+ku2dzu3
	m5PZUyyGGCV0PeoYU4GhYEjdglblDC1aRV/PLZGSiEVMWzjp1rzJmZV6nDVmVjdtMj1mz+reov2
	3wGhyI/HBhPOe0g1hl2uoXle0aDf+dNoj79jYHEmS69vn5KlwdasnnA9TVGfyi8WGTMKotzTJ4H
	oAdvk0cnopBXGdDey3gRh4L/vVj1ClLBZevSRs9a2kvL0vFJ2eOupHreI5GlQMeyEPPJS+qgrT8
	ejtODQMD6vXPZXZZEVN3sNy9FEcy/ACKkMx/xd4sAyTMPiMTxtMUPmdeMoDJMApP0cL9T6wcm4X
	fdy5+fAJlZPqDEnH+a7w8P+fhMMgBjm6ZKoRiPB02+kHS1+s=
X-Received: by 2002:a17:903:acb:b0:2e9:93b7:23fc with SMTP id d9443c01a7336-2ed6809d0dfmr37072905ad.17.1794182114866;
        Sun, 08 Nov 2026 15:55:14 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:13 -0800 (PST)
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
Subject: [PATCH v21 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Mon,  9 Nov 2026 08:54:47 +0900
Message-ID: <20261108235457.12688-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
