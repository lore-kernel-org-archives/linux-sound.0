Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461752;
	b=4mpufjvZ5/yXxqrm3A7j6Dlae6F46bz7nibkqorwJoHL0jn2I1voXXWPbnk8IIxJWWnd
	 doNJMQ1sHV4IFFCZU/PSUacJ14NQuG8w289RyB+UuaTeyEdDRomIfhiGVeAj83aNpu8bQ
	 qeUb7Rzs5nfk5pk/PL9LzQNJPXkddzghzGfC04WeMcwSZccPhcIzxZ6bj2djxnEaYZy+z
	 wlCxdAhqAX49QBI5NvLvFPCRsrZb20dIjwxUC1+L4U+K9d/lQN62t/INg4rYreyLHFfxH
	 9u/gHlUOwywmih6AxgFWlTV3St2Kc3GrQb63WGzPrSsrlhj2bYe06IXEFyeo2KUfYOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=WqtkaCVm0HLyWu7gEmxs1l+VezXXDYUo1QOiWTANbsoYJJm+darqjtoAqUl83aG/Tk7j
	 mW37c+1//OxmEJJTV2KNj+vu2EKJNGxRt321YE8N8c13MruKoXOhPHyufMGeOPGIDKkv5
	 RIA6D24FdmilMfv7jZACvF7CLr7vzmx1ltbk0wJ1hwm9SlAwdxTGXJHlFvFfZeiPTPTWo
	 QBuVnWaPcSVUPK6YZvgejOka5rTfKIipbKob9YU1VYdGm4B/A9dxhi5YUFl7yHJ+gJC4o
	 SHjDO2vKjpEXjAk5w2QS5vlZjvEZxBmoq+Byyv4GcRWfOLECiwIylezy6h6rsrvK+RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TI5BID5;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F81660A6F5B
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F81660A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TI5BID5
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-18818daa3e7so237148c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461751; x=1795066551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=0TI5BID5zIUzBPJbxT5G/q+VhgeuGtoeikmkndVomxQQCRE5UEu7xhdgbxcVkEwfv8
         3aj+oULsiIX6vq321kSfh+CvND1tlBQkLjOvOfuREpU/i6YKcnzXyWf+ZDD+hkxsmyWv
         fysdTYvHjQ2i2ol7hr9CQgT/TU57B1K2H1IZ9uxm3lfF2OsLoncaCxh5uC2wz2qQCo6L
         p53xzUaLGVmw5nqFE3btlf/Goh7u/OxEy5K9Vhen4Isw2j9x0SnxwRf7cEmhcnkijARx
         b5nMZo5qFErxfYeUPBo74n9YEWC+6+L6niBxqEOxUbU9yCNii5B1wysgjZ6K8QBAB+WF
         QPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461751; x=1795066551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=bfrT6Ejf+qlJd9Y413YzQqmHOdT4olhf2jounb2n71MU35mSygJaQd6Z2CwBBY6Yj7
         tG+M5fo0EL39FLXlZagMB9wyhsiloMihHze3WhwCx5y8IHvkTuoBtIa9nRMwIcbVGVjY
         wgWVvGOWKYt7tsjIA3P7Ho8wkfICiaZtebMTelflDZVV6EOBnEyxp3d9xAw2SzKqylnT
         kqIuNSOZ8/hGkxOhdKZTSDHEx13ntLNneVb5Q2wKVQyAJeal2VCaxeVTfN8dzPKGcsiY
         W5VUAXb4cbrdWgIcSQQnvN9F+LTmA8d1d1Cknl01WzpAOHfAE52i6oU6DVp+vacdwBfG
         GZ8w==
X-Gm-Message-State: APuU4Z+RbA66EWCLz8eof/PgkK9uOyx4iQI2vs8D2SWOOED/zyU+OEry
	x0HgUFH8w36xM0wQgr7yqCZTslXDAOCa7N71oUqW7p2pYkXyaii29jKDFdRbnQ==
X-Gm-Gg: AYBFou23cm8dFVf+5ttJXw/i5v+aqdSOCYZzVJc9w3YvXWWPZ3SFNh54g18I+y1thdF
	7K3yF81Pbz5MaxLx144/gQnc8270OZDTuBWOWnvL8LTG0i12UDSqyfFUNOX1OjCaYtVgc03TdQM
	TdQ1MwxLt0gPSLzkFTdkR+/Eo7VUQ42eVe1Mur3oQ11qJBGTE4CMhjgUImMavlmARCdSwisp0Kl
	DwpRoRm45JdgWCaprSpuPnKs3jCIYYlg1MUdNW4gavN2Uw71GuyvgA/t0FvgBDPN+B/s4SJPZ9B
	vhGG4ZKofIeHJO3hcbAwy4jQ+LI4pjMjaIm9DrIhYl3UlztifKhKMXoQlDyft5u2fgVhKj+xfnp
	EQjyoIdtQiefSrt4NsHdxwyT+snDfCWBCctUKCZTpodITqZP+sv31lA5kwcGXkwv5fNDfbrDS2A
	ePBuYHr/vBDGZ0fwIrhmBbnAuIT3q4CpshHK5b3ar/7cu8eQXgsyZgeAnU3ilgRgfIpMWg7TCsi
	D5ZYPRXRpSXwtw9+37Sig8bWTNBKF/kqiIZ7oPzCSNpA4lHEXrH5oM14ga0RaO3jmVWi/bLNmaN
	ftSJwMgtUln1AoAJpoB1KBMOrICKrpjSlyR8jrC4ztt2fOAiTQ9m7Z3+AamWK6r9Lb7MmGk9qta
	MbGDuiEe1+/FZOJGmCdmjPQqsNA3hzHdCmNC4iBVR+DT+6sY=
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr1543438c88.0.1794461750617;
        Wed, 11 Nov 2026 21:35:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:50 -0800 (PST)
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
Subject: [PATCH v29 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 14:34:45 +0900
Message-ID: <20261112053446.73504-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*
