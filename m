Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466236;
	b=EG7XDFxfIvB2bThk2wCBpZLW6kaBXbqPUugCU5LlJhUNOIObX0ph7J2Cg5ooM3Zvyntq
	 EXrsqQ/y6K+wJ5NLdWjvrCUUsGHsyJyqMculggJYOooNWz3oNFx7FZ+jRywpbm/y51SUu
	 Diduawi09G/vZWYroQ8keDk5bOCfS+I4PZnydPqpiQ+zrDAxp71ruh0o0MFL3OT3kfKoh
	 Kegxjii/HrnqPIWbhWvpnsclRvmRQYcvErmhyAqpYAVJ75zAAWx+H08UbD/mjd9bcRAFY
	 5seE7M4tJlxP5Fq6HGLMSUW0dDq5tfkK1z5P24aj6vku1sPvZ/EQD9/sGUtl1voA3Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=1In7GemodWOYICLOeI9FtjsSP9SnjfsDGiixpanIV6PY3ilrF97E3WqJkTsDbidSfyJk
	 PuuMcT1hoakLbEGDeBpywcoGJbLvqVHEoaIXy94wruWS1QdW8bMt/ZXMU5V624kN974E5
	 4MBCC+16QAoAAJALzypSAGPDLa/iDyDiyuQwowlr9YxojZyUYgGyBbNT3Ixy+bRIj1A2c
	 ibcwfpBX+NFuGd+dh7/g7vlw5WNA998NMb7FgC024J6x5Yy3jnqbYeBrjH2QMOVN1YkOT
	 AomXeso6CvqKqRrO4w3M3FLX5oH8d8RzHvAdF+UOmwR17r3MvObIx8+9a9n0OGkqmDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re5eZ50X;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A0606AE44
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0A0606AE44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re5eZ50X
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3205347b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466236; x=1795071036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=Re5eZ50XOIHjXAjO+dOkeKxBiLyJrId9sTxxacONgvjzdn3YlBHqF5aH86aCI24vjP
         dAj5VywG+OE4wLv5GJdfFnmSJUVw6ScJBl4uhAnUU7SHyQC15iN1VYf0vsmtluhHg1Ld
         NhxpWGONyRbGqK6ACLzHDJsFerewOD0Zy6YQAPvjUZOe7UilC0nvi3pifQExLCNhfVz7
         al1z2+OX/x6rO4rcziaqcOk5gox/xhzrasBaW0jyk0xwsfn6PrO8LAOMFeZpqxgWTsFU
         G/6fTxvNNYMLdS65ca5YHZr85YjMPJY9JiLti1zuPvD8jaNCu4vsj9xfjEhLmVh8aRaM
         tACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466236; x=1795071036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=j2/Js38QnZZf3Aw8fdqKNUgcvx9OMxGFG6+3T4rHQbYMoBzjOR/EtF1w8pr4cdcA+Q
         uY6yHi/4I1aFQH/Ri6AUebPLq3Vw1iZcpRNC/5/Npl4I9PvgMy3N1WdR1LdPK3S7uXMY
         1hxGuce6YUFexKRkKqMz3HNHlWM8ocNWgA+GBNBmeAKRvy0snDtLdEBMH06HY3auFALm
         MJKmDmu2QF1GDHuY5+SZdO3U0EdQpRkrCoWc9H4QCN23El5suw3+tFb5O5FJnHDz0P7Z
         gc1cOuXy0kGcdeY5ljBfuYI/+Yn7AEScwTmJm+b65sSByJPotCfzZachTofoa7HMnPMQ
         0qTg==
X-Gm-Message-State: APuU4Z8FDGEse/YJJNAcTda+RWdpFFBpyly9i8VZ3iVWUwkvxT6PN906
	QHp0YATxfB0/3juITwkS8+gSwOqM0lV8WCBOMgbuxXpK6nMBBEddVKWzfLkjBw==
X-Gm-Gg: AYBFou0q2NvQJHGUQOkRr4dhckZTyx4ASGov8AqNDCpd4Hn91QTG8wbjLd4rU1dFDle
	7DETcIhJkXb7LmWJrq/5mK0phWG1DPqfbO4HLmm/kKiBhSbafLuxwMlQ4VKauH/9b3RDLS0Yl46
	l6VJtB2hevl7eAFNDUL3OgjfMKdcQTxAnXM395E9OcmXEIutPTCekj3ekGOUAJ1GUY8hvnl0353
	1tx/+OS0ji4LC7LiLss8D7mL46pi4IanFZV/JEMaEV4RRYXfpscEmudS7SYVp0c0+d5rCO2NtAB
	CLbZ42AiEPMjnZv393+z76Yx9pqV5Z7XtKukqfzdNDl5ghUf6GRBPzEuD8poNI3tVBwF0O004Ni
	r2H+CS5lpahEoBhVhUCnySirGNplfSaqYMI8g5c94cjDaTVACmzKQ/LgyPTP6K2ydXLFHS1xF/l
	aVUe5HuFekRaG/UxO9DJmQ/CY228tQCPEhQapisOjgusQDFsJhiN7wveY5588DKIguD1nFdTp52
	QTGouRLclC7gVYa5dIUulnvCpAeMC5z1hC/4gEBhEJAzXYB9hWiTiu2rTwM4Mv5daipFcgVZYob
	W00NXqM0H63pBvmZ47QSYUhQTRVSzaW2txCQ2uZY4JjiObXXYDe1rsW6klObQn1l217jVxx92RN
	JjJos1Pcs5kFRVJh0LW/7efD5VS3cls+5i5xYbeNkqxZR5tY=
X-Received: by 2002:a05:6a20:2583:b0:3e1:8563:2a2c with SMTP id adf61e73a8af0-3f2fdd9da05mr5074381637.40.1794466235997;
        Wed, 11 Nov 2026 22:50:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:35 -0800 (PST)
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
Subject: [PATCH v31 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 15:49:28 +0900
Message-ID: <20261112064929.11211-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
