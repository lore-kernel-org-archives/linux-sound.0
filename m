Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444488;
	b=vXEWrPp8abCDyBud69b3IBXNmxpdUYEm5XB/sbYtb2o2d3NXeTxxdJGS1CcPr0dNUy3H
	 99fXKcGy3DpX9P8+IJkIsxTeW0zNfZz3LKTTM+ZVZukn3ZgENMNGwu6ZgE3nxVLWonjBX
	 xoCdEPqLnlCRqD13G7xy4Krf/tm1gXiCjJ3n7CL4e4nZWZuT99vNz5xUhTMWEO7FE7Co6
	 TEBElj0iOnkyJyCaXFdhYcZs7/N+o3rAHSpVUGgUzJqdxydlh2RLceOqTmrEGuv3MhkCp
	 1Q1tAo6/lE5zjlsTCWuj/3Dhl0oE213J+PT+OAXTDf66KCcUxO3QdUOuN5sJcXjA/sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=x6EtwXEuFh5Y8XZ+G4ZsR9x1A8IhRYfccZWuOIcBMzrmT2gvDyse9UDY7XWlkcUdvFMG
	 KScL9b1iVC2V+UGGOmRMPr7wEKBInT20w6asT7nidDiYyzzKdq0Ih57MriliQe8SFINC/
	 0rTlpWitt9ZdiL/gsiijYyDaiTgHokW5t6Q9BkeszYzC/I35IAGwsq1JqNYYkSEUOhsJA
	 v4UZfu0CijIPZVtIvvMBMl6Dy9NNy1E6U2T60CAENeaaH3l0W8jGHMCFCsXYfmqzHZ188
	 E12muVgnkUwzD/2Dopsx8cVyKx7NqVOdjP0D/sQHdsDyvTWzecoDiPXqaJ06ND4xPJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VRyNuhB/";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C89606C77F
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C89606C77F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRyNuhB/
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so6228498c88.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 16:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444486; x=1795049286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=VRyNuhB//q4Mh1RlEwxvl/TskKyubrjCDwlj5azMequWt7tGf5cEhBKtRXs1UgQfAP
         TfUPRsukE0v+O0XcSw57aV+6jm3lH+9FNI4MeWbxHSXQ3MiWjpNOOFazcch3CEXn6h6S
         NBearu9sxzWfRYlSeSUcBSqaaDa+eiGC6A0ZAJlqoLPx/rujuNhE5hHqEb8S57p08cFe
         l4AO65WD228JNjuf4MztRaONJz7m+NI8tztR3LmBeL0R4JVjYwh6C0OlR+ElpXiF+hip
         p/Ti2+FCER21AGZOh1QUoaL/oKSqWP5O9Qij/nAWiarXR2DD1CqwM5WILvA2h1e8/Diz
         mhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444486; x=1795049286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=sQNPcm5iHtSTKSJi2pTAufkstJ7bxyhLxTaAJNTaYJty0n1W/noKWlkeP0DhA5ZCgA
         VMnaS7SP51t1C+TlthsJgQWaWDt12HMS7hGQms5zSzBeGzJYkOCn+hnfwwKD3iUVSTEY
         Ynd8VWl5l1xREawAkXXyBMi2jfloBd1oDLWzX7iFCTewMSXFzq6/gk7ISESjzcFcBJ7t
         1I82o6WPDIMoRoTEQyVSvDA8ONgj0RE3wLeoksI2wYO0U6A99a+DjEnqnHT2gAIbsf9t
         Wv7V/ECJXlPF3Tr6HOPH9+UoKWpa4wNcDU7Lk8dC7faKAmOLrQ1XeaphazQimh7YKXgm
         vzxg==
X-Gm-Message-State: APuU4Z/0pI0E3nn/6PDlMisr6VTYEdaJyDVNoQF3Z/2g12i88p0sSKIa
	vB9f8gK9bMxQUbMsSFGMi1D0jvo2RMXFZintRSQFWtxyujrZHOJwrI4CAD/DCA==
X-Gm-Gg: AYBFou3OyWndjZj7OFAza9b/h5MZ/DhcMj4g88kTlznF1SBGzdGWt9WiXXKao/XJf8D
	pfmMtuzToX4RewpcH7wPbAc89PF0Nm0ZSgKJ1eCeK/7z02tHBzyloh1U8hHh8XSQF12drFmSRus
	9p+cFMgb4TjH5wfKAZMF3/bN9H9gTvjY7HM5DFgyzdJ4dubWLkzUacohYUrpLiCQrR7kWCbernK
	TDNuqLTlgC7MXdRuRKRHH4Atiko4sezTqzLPe9G7vBPzXJFkbm+buV8tIdfnauPk8bCuuJuuUHo
	Po76oHVskV3aHVfI2kh+A3GV9VuBkP7gbm2akiRfyqNbxpIEwbXmQUSC+HqkIMQbCXmVuJsXfoa
	Fkvxr3x4c8htMQPeBheMwgNo6a9px4zQ2T2VvvLSn5s/QWnPZ20HmZb7C2czatICmQOvlfsW/6I
	QOlya0lKgjoLjyj8UyQ0UudgR1lm2RwJma3JpvUJhK8OeXKfgV1E81FTF+vVkRGK4CNotGuGZJ/
	KBHIKcFdh+gRp3Aa6rPmVjbvxSvOafR872GuAgn6B60gfYtmDDY4FCrMP7iOe9hhg43aHk7hqfP
	WeTs7fBsYm4wF1d1P1CSDDg88TqSbSPDTkC5kYxyiV0Ig8DMwCpyVJPsTrFdG50epfZ2qlGTUR/
	0Uj8SgGRlILvPIEAEhDTyLTq1SJNvYCp/wjbslNEoGEJmzRM=
X-Received: by 2002:a05:701b:2504:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b3c0342f23mr3517225c88.29.1794444485979;
        Wed, 11 Nov 2026 16:48:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.48.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:48:05 -0800 (PST)
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
Subject: [PATCH v27 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 09:47:03 +0900
Message-ID: <20261112004704.49758-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
