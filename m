Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981961;
	b=GQ9Mp5gDAcm3ri29XHLvrz3GGza5KH3YXDrNeBDN+iCtiOTi8pCKiGSymJdiVsBhnA4W
	 p2huCxSDGWNuvR6LFciQ2DuGi4Ac9k0A3M5ZjmIiO/UMKLa8UiM979v5EdbKwGwJUiXEu
	 I8rzn8j1GKxDFR1iLC02OMo9bap3np2c60SsChGEBc7N3XWJWaMbScaUIjoLqz0Trw5v8
	 vo4GD+c9WSGiPmoITIL3ADbvK5vs2ivgLV14mklEhSmnx8o5BrmVO5PdfhQ8TV10NAd8r
	 GyfXwURbfvzJTpkG9kqyupjdbmBAdQ2fqzWOmp7zBmzA5SG3o31utT8eThbAaAkB5Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=jKSr9FjC6p6gbUYVym7eDGzAF9Q86Y1sv2IGDDT1TO27VlVgHfKQj/kY6SWfkyB0piH3
	 GCDf5jdrmfTizDTZUqBp54FF/GygpjrIuP4tKMx5CgMfDQiVLarTtVmkqP8VzEW+0pvFW
	 qrOoT9mTn1rqxj34cs44womYBGO3nDWU7iXc4HJN8wvvH4aa6YAVo5wUv0NFQFtEFih+5
	 lXtCjShT4v6yytfiIvPFmRzQssRRn9l6FtGgXQ1AoDbtmSp5JQg9M46/w6HqfrP6b+8UX
	 +j2dlPVSMyRwZ6ZZUQW4Ai3FZRFfxJhjh2qiS08CL1YjJbFiVnieFhoS47w9CnD1SHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lKBiL5kR;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF29606D83A
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF29606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lKBiL5kR
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so1493014c88.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981961; x=1794586761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=lKBiL5kRm9gtUqJ1h+dHeCxWYpulv4/s2XsUQ2lNdJ7xrrd53veE3fraO6xmIx6SOB
         8Fbtf8ylUzysFcU0b4OY9xgKIdcWV/h3KNox8JSpZ/lLYOrMYYeiXN9wqdh66DK5rXrY
         6khmDRLKI3DAw+jgbwmkRJriI1oYK5AxVLhdA75BHHQpWbVl+Pz/aRXgS6JgAjB3EAgk
         PEMTklcvOXDkcX2Hm10J879LvhYmjhyWAhIyrRKKYoszFtcq7BNA1+SDwtvEmT7zixIS
         sPJibyUJlL1b5kwE1uQtjUqO1ur1JS5IAtRKYIa3kRIXCGAinSQiAa/hT8noUUV0PXVc
         IyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981961; x=1794586761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=OCJwf8iuL6A9pljzocgFB4Vv0NZ15Q8x0UhEFjWjkEcfPHU/2ffkxDjib3IQ/OETsz
         9iPrWcMgifGeei+n5/FF6S5+bdx9ceMu1NB6WFFxvDMZM8Ujzv2aCz29Uh1aY2dnvBHW
         vFIBq0TAjReDC1nhpEQpJcSFKPa9ehRpaw1qzQwTE3ZKgYQELDVAw63JURQ+w2bjRpiB
         oQfoqz3b3VuARpLk4TwcDzSPbDuaEGgegP3jFXfNKUCylwhTBUSnQ5ILESb0ZSRSqQL4
         xBUAGebZau05swsg4AfyQGNSRFeaQmYX50OeuicfdFW8HzWcGCeGlJsxgwgujV62xdtR
         MyJQ==
X-Gm-Message-State: APuU4Z+J1IRNCXUaNSUYMjjYrxg4p8MtnefgltP4YP9MZ32lo2xE4KtV
	QmwoIU8Q2M1VltYVU2Xdpk8ZmFUJ9xKEaf3Fd6SXvUTHDqRBsjpVCIwSw/LmhtL2
X-Gm-Gg: AYBFou0tUxYydPfnSR2hBbPt1wTfbklWv9FqNTFqEVKkEts6nfbND9GeMl+oQ/C054g
	bOFFqkvFcbqAPh8Qd9HHF3AZypM9KFsLEupK5IqtIFG1J9JcoC2ifuUlGqmBLc9kHWjZxaxzccn
	O3TaCrxrlsHHiLuMHLNStA5SUtukI1qfTOextYfX37WloW+YEYwD0o7NUJmO6yKCF58mT94Qd4o
	VM2JuneXHPcBuPPqMgeTfQuUEmDvT72NheTQILsiXdaIqwPXzOK+g8DHDgeGKMCHjFMZMxoX5dN
	Q2c4VYrVEWs5gZQrICshgV33dUXFQgfVwHSikDxSNwaWkK97F1XqBijCXBaZaidh6KusVvmYmIF
	MHNBDQuaFaQLqH+fq3ZlPgtKBlJxBmzxfSasn37sg+wCh/ebTNX7A1xZl92ECVIIKSTpPLPl5ky
	f1otWzeg8A9/vcYooK811pYghxuaMvvv2SJHaH8/3AWZ10Hxz23mwsh4fZtqCD5d2Vc208VBTF/
	WexXtcQa/roPaBWpJ7PgViHAUQjfJYmaOUiykBLFjqLUI6Yy2PtqpnN2IpnxKwNigGue8KbvRqI
	7JFne+xUhBpuIOToQtK7kdTu0jdeSe22naNE4AJDWshR4zqZ9YluoavuK6lNk4md8Lr+WCFnVpk
	mC9uUe5TH7YpjG8ZL4QlC5b55synoQiz2b4csjhWlLrBIjg==
X-Received: by 2002:a05:701b:2719:b0:136:b50c:c0e9 with SMTP id a92af1059eb24-1b25d309c43mr3587753c88.21.1793981960370;
        Fri, 06 Nov 2026 08:19:20 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:19 -0800 (PST)
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
Subject: [PATCH v19 11/12] ALSA: virtio: prioritize staged capture period work
Date: Sat,  7 Nov 2026 01:18:37 +0900
Message-ID: <20261106161838.94308-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
