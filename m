Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267663;
	b=1MWAoIXE0xd0Yz+kZEQDRMbZzR5w1ouiamb292P/dKcK/LpeHGtrZemjC+r+sSP5Hd6+
	 3UHtkXzBcjVrOKJ2UcPK262op+jYmDC/XDDpnQuUavvDIhdrESC07nDi4BTOEdPVX90nl
	 3sddqAepnBX/SMaW3LpVSzFyv6VEhBhWEdkOqIlKzR9p1zpQRjDVSKIykIVc48e+1mLgN
	 WqRBNlXWXLHnhQCwoIxnYJeI1GTL2hQDVY+oAY6sZgE/tKa3niTAje5YU7rYU/1+QoUj1
	 UC+7vBatl7vFdbf5M4jurlO0XNWfdvCdFy0cpYhK+OsynDeURVLScq02/tkNd2VrWOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
	b=lmMU0Mh1uVn+wXz10Q/1dlKuLb198L/3QkYvxdObuzzyeuXvSRcLNw9txwW1+v+EC/Og
	 HIfZ0m6kguNA1teFEJ0+WsextlZsa1FGcSqYX3qAiS8hvQJijC2Ghi2cYmLoQ/NWp7G2P
	 gK6DH1iEO9d8k1GnbzMt5r5nN9pA3G0RQQ7sAG8veWd90CUkCHV36TmnwcJ9R4qrZmjgA
	 1LCDnjxnDXW952LQs6KP1jKZWuPx8qi9jVFKU1EcdgSCr2ynBuFJ5oPxxynCg6bTj3IgB
	 E55kfhRcbgcO0y4gF8+9k5BcBJcsJkfqMqsdAk33jy/mL8Ry5Pm0QZ0x+L5l5tfjXOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQlG78H2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19693606A330
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 23:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19693606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQlG78H2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so2746498eec.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267662; x=1794872462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=vQlG78H2my4XhG4ZqYO+LiSmKyKJxSB+VDFJjB8p3fCcjaVKLBbdZWXpFzRHwfQGNw
         GiC2PeRe2HQnrPpXPnQHPtMGWQxl1D84rRMBzVJqwIb2/5Wk0FvVBW52adlOFRsXg9dY
         kOSLD6HGzZbbb+cFyUK5FpurUxUoSwuoCCB1+apvr1Xc1AOFZ1L7g71jTKpTwVm6MfEw
         pifQpdCRyxisOYZ687883L4RBYOgd4yFasYYCiIVo6KdzEIsdkunQCw4iI7YL16Xp1S9
         Y/fHfvG8OuSOxmf1Csx2KxHXH/AaUcTsoFLnKFMXL8EBsf4fgLGkmj9eN0GyGjTts4DB
         VU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267662; x=1794872462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=Fhcg/jWZY4tnL13rGDF9CFdarXXvcEijB1smmzmJxJJDM6RBZY1iqmkbbGClYZhhh1
         NGWo2rFdX7B4QhJHKsmel/sZbpPFWQ6ySkTUWn5xquE4LR4FtxlR0K5CW1yq0vJrD3QB
         CfubjwKQqMDVfad5vjdU/0jkb+YYHFD/8/sDBeRbnaZ99gONdYW9Hakt42U7M78kIqrC
         1BjmJgugUUwfAgOJ6bOZCazFdhz56VBs7H96vGAwSMzpcVFpo7m8/0fq8kMbCghwJT1m
         rh0Xc/bWwSjjmU0YieJ8lF/L1pkMzplQLJDR+824jt4T1uc1LwWNIDaCnWA9ytqdFk+D
         J8xA==
X-Gm-Message-State: APuU4Z8NW7j3tfwYwkMbeSlldrx0jXMI3wUGcucuGOesHX5da8ZrplVM
	V1Phhs560ptplH+YBAOQFYaFSKLMYB5GFrTThQ520GBbzGq8+KZqnaRrgoeilw==
X-Gm-Gg: AYBFou0Qmmy94Lb6jqt5SEdxAJ+p+7Bxa2ydV8DNpgvsUfJNbEUnPLp7IehSFbJYTA1
	3WNY2gtaAYfhFqAWgTm/Do55X9sQDkdHkGyS3w32qTihAWa1DVeZ8yVZuVvTyPDi4NixvLtIp9l
	p6F1Zccpw7tkBk/ZjolsE9nHJmkPqb3xqT38xRiQUv1oBTu+/kqbWM1WXjL1tP5gvHpawpyvB4g
	AEVUu6pTqo0hB6K01zD382qCA/EN3566k2UIdFMNpex8+Ot9GxJ7ckOMwgJ0VFpoS+IsKz08g68
	2pNx6zh7vP+7nlALjrnlcGRWxJJMGyCHmM/kfrd66FTw9ptDjlN244RNu3hyrT+59KZqa2Wm4Nf
	FXARnqsFncTHmThkxpcchIoVA8h7Uqr4pm+y84Ftu2FMooFnp2maD0ZXIqwY6ipo83Dt8T+meEV
	nTpmZ+XD/sUjbVrNQ/gkn/gzJX7Dh7fCSnhZ50uHbURBKXYP3bcL83XMgmkcjk7JeBS7XoABdTW
	px8vnhzY+lTHZ6uYXxLTVWNH8Y+dXd+UHIlSU+yJ4tp/FKcu79XEEMCo0cFEyUIexCQDTsq58Fb
	KDS7wywqAXlX0zfjBXFro/c0aOMJSspOvj13vDzYn9Bf05dWyWqrgBIUFCEcXRaYMB+0ZtSr3aL
	M2uXhDtGCd0Vu8IP3wFU65Ow+qkHdUGd83BIuvIrUyoK+jr4=
X-Received: by 2002:a05:693c:2a12:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-3751fb32251mr859755eec.9.1794267661936;
        Mon, 09 Nov 2026 15:41:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.40.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:01 -0800 (PST)
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
Subject: [PATCH v23 02/14] ALSA: pcm: report partial progress under the stream lock
Date: Tue, 10 Nov 2026 08:40:37 +0900
Message-ID: <20261109234049.79534-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
