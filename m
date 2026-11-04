Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758680;
	b=0BZT0Jr8vUB+fFsCq2qDvkF+fTRK8iXm7bihGy5EEnS24TJwGMx6Gl/gJqZXrNS1G0Ye
	 lKBJZ0cGQVU4Rnc5URs5b0blZSqmYdtCT4jDXBJOTi4Q+XCK7wrLCra/RlMLXLHFMtOEr
	 03y02Qo78eX63Bf7RqXDFmkgJnX4+CzFrMNAFHud/2a3nSPCZ6fP0cIrP2sFZ9wJh9p8O
	 K9Ij0qOMVGLOJqE/Wbhn2bHNhUUNMwkF9TMu/qZ1QjqU2q+OY5BS4SpjeuaOLQa0B9DrS
	 BK0EfZVNTY3YJS8ZCHPEnnwkV406eVhfj1x0OP7l/s4Wxb54L4x4MoGL1q+pyoi0TkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
	b=KBABIJO58P2iUITo9PCYWSIZneg5hL1G1VLKeao1wCtde4fFi/PHlwpJvc9xZaiEboKW
	 L5JaqKKSdUIH0FHWMBDnw/qe3tBYsIj1Yc4++jXtIaUf1ZR14CmXSfGR7o7WOyaMmuRu9
	 Pz3PDqVhykiydnC5kBnvk55aFyiYh9ZQIRRC1623K1ziqjjKsktycRhTgk7/pJ60/k2aO
	 3vkFfR43oldLpJu6eaXXAog3UWN/KIWyW5IE3zE8rp5kDvODZEzx/7r1cdj59+hHEE72w
	 KKW/zIhey4zDS0UXOMYgVMP+l6I/0d60uwalr7JMLa8sHYMxGCe6kEilcPQJwGN2KHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvwynNCQ;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6EC606A32C
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 02:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvwynNCQ
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06210b29fso126652b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 18:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758680; x=1794363480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=qvwynNCQWzyzbn44iaEUNn8gNwqbltYPcnY5DD4n6jcmpA2yK1rbj/naHt/mbyUbpt
         gOOAsmFZ61NojLVWyHKJWJPBL7MI6VcPF2sJMSZ/fga/ETkKImCoe8vAhF3vUEpLxRmn
         MloxzrC1jDXDmSvYvXGO0IvcTiBgkemKfBJJbYQKt+dt71ueEbE1fBlkpLiNfbbnTzmv
         uT7Z3uNF9zgnv9bP+VCOSueJZB/dL7eB6Zd3aY73lBttrO/afM2voooiB9NW0+7vDu9Y
         egfbtkJd6oIO2I1sT0fSRSHYEn7HDxA/knjCRAzOVweubaU6+BU8FnrmYuqqgSUcUeC1
         LSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758680; x=1794363480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=C1szmbme4oYKbViSD7xzWVhCqS7Pfdpfsbls0AVnV81QYSQSTfwdvaad32ll3ClwzS
         JXGZpkqYKYSZH8DaI9a834hbyQTlu4NfcjiuomxMd9HnsThMD/VCA24+BMBqpipSXHR1
         MGcefStj36m3mOP5nYbc7tzLJ8rITazta7RZ8xAxOPhDxryxN+dZi0NY0G7IiNYCctpu
         oUG96zRL+cyshx8fGHbB3YaY28tkpAyb5NsWJ7FYkDDzIDHaXPznlD+r19Nqt3vq5ZKF
         Cb9s7pzTlFyuaIghjDWb4ZWKvHZWp/4ZPt3YUFSamdmcwkeOvf865ApdISew5PaHxIi2
         nlrA==
X-Gm-Message-State: APuU4Z8dgySLsVEhtVaO+qW8EtEIDZq4sYiaR98ZsBE8j0PM4I+z5KuI
	5ehKYLk+LBreyM4r1z+/g2607IgQr4H27bgJjD75bLJm5kqNUbKt1AL9wZtcDQ==
X-Gm-Gg: AYBFou2C5Y4IlKG65r56Siv6vB2M19Mbp667ZXjJgNRpZLAhs0DpvPFgJfPrlcsXllZ
	FiJRduo1MwqQFUAtZHc1GcUgu5BZvnurRCE4beBbB/ipyjmaxyymL2/f2loRxE8WpJMY9ObCscG
	xYXNiyC5QPY6bsFY5881Q9OKIw6hVHubYH/rn8bnm88r+tjObnEWtwP1WJTfvqi13SkNB/dRxQv
	e9p5oxLubu6H/4wWsrJNw7WSGij4ck7gYpBRMjCFtUSeVAVvoeVTi0lFVYLNBgMzw/0BNXVB48V
	ke8hOwV+PPaTg3r3Mz9NVLlUmt++8wrY/W5IxOrmE9VwAZaKw8UsnxXVO1zn+qXC8FywKWCPjrw
	uK7M+QkNPxrZI/zO8JuUQB5ZqsjmOEtfWukeZuaH7me2MwE10DBkXF5x0q8Yr4E7t2NWPFkoUix
	+/BuVZGWBFdsiEKCPfsvXNmcELOm7CKJjfXqwOhe+ZxHKnd8nKpAgrcnD0TL2UDEPfE+5NmifTS
	s7Kr1DWaxMGEU2KtbmnO+5qMu3hXtfPogPs1bjY84PqXpptku6PtCZUhyQSPiAuOGbtRjVGY/0g
	4GKqoToaOZupY0rytZX+XK616dLzCl2P2NpErCGPXznzK60JUJY87X7zjrkX9tI6OvW01uNsD+0
	fsE4Mvyia/86NJ71cVo1hu0TtKmqHtJAu/oVqeWK1y8LPwYw=
X-Received: by 2002:a05:6a21:a103:b0:3de:4fcd:f9a5 with SMTP id adf61e73a8af0-3e928d553c6mr9724186637.41.1793758679552;
        Tue, 03 Nov 2026 18:17:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:17:59 -0800 (PST)
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
Subject: [PATCH v14 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Wed,  4 Nov 2026 11:17:35 +0900
Message-ID: <20261104021745.57733-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
