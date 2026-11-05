Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845949;
	b=r6I3LGR1fCuDJKHZADJ+fct24WT9nnvPbF6NSzlruMGGL5CPabxAZgkLWYln+8Ve6cJq
	 pI7I/vh2VXPgoCmGbIQWA+F+Dn7AOvRv1dfUWuW58AQMCzQ1aE6ckpSj6uIQ/OWSaZo2Z
	 /8fs71nyycR4K9ewoLtvyCG2m/fOMGH75R4E7QD0P0Nfxv7Nu0a7ho6PBt4cA2+hlIiRs
	 pjUiliDyDX22hl2OiV7ai+yzgOLR+E24UMhuekScDDRAoWNYu6kE2d9AWeFmIMAaeL2RG
	 Vrdmiy9xqOYDp1eq0Gfy/4I5H9GdJYoXuwfya4r+DCIFC/iJBUgoFC7xQp69uURbjnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=AYBi2U9SYW7kjF0p+KscP4iHvxadahQIS+fRblWVcMjmvKFeFCKZhmZgJkb0ShVA09zo
	 yOwrzwsen2O5ez/LVwTYoGQzOj57gBOUN+0bNDIcAm7yfiIOd0euWuud7NVj/bwKf60CT
	 QWKf8/H4EvKBkFxNG5OtVTmbSGlMpt5GQIu/JSn/w6JS5MyEIy0dyO3VEjMTRNbLCNeEP
	 XwztQSLbSW3Cf5NfL5Otk33K4v+P7Ir/x+uYEr2gZopnwo+hmTqRVX+lgO/GHOkXwc0Te
	 BYXDK1TPWi8RjZDt2WQekSqR5rnmbztHq9qqjseJ28kz9xNd0qMJcI1rhXRBVOYfouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4MG+WAU;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC91E606EEAB
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC91E606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4MG+WAU
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06c60065fso836276b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845948; x=1794450748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=h4MG+WAUIg17ayp2jqseAit3lnCAASZn9oBrxo06jUVEVyzrP5pajRT4SgFbgwFahs
         lXUbg+ClgfxJ0b4rxjD4sgcXczw+CjE4jDyOfjurh+Acyeq2RVQHm5Kj+KElr+b2Gzd8
         b0C/+AmK7AxNxWEn8uwASsIY66kpWBlAdk/emVZ0sQOWPc/9lV8zw2wUPLWIqdMa/7MB
         hRDsX4seWw7aJb0TvSYSjJdCoj/hB0pQe1oW8sXseYkUWAhjyNu9iyf8IFa5EjylSNQR
         aJQ9BmlepHHi53X8jtJ1TCS+au64Ukr9u77j3ZpyAjRCPshnOwQ217OtHO4Mfz12zXRH
         wgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845948; x=1794450748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=d4LqV39N3P0zJ57HyIWmkAjl3m3aTs+Q99gEBW4Rk3QtbsmkPypropLoohOVTPu+C3
         wON1cMzFlk66eh5SvuDc+7eH+QWKTJ8v8Qy4EfcK0pDLb1cJj7j8+9+pOqF2NVTLrANA
         ftF5FExfLZkHYUBMVqBLSkp82g75kaJxaUblFWhFIns/5ycASSuuOZE0JI+K8OlIcYix
         EhsBzY9L49c7o/Aw0QqgW5k91gqmSaClPol33sxm4gONv4JTidhxViBliWnBPeyf2MSN
         BMa9Ci0TZMz5TI44caHIgUOla2jLzEv/IarNMZsbyr3NpF7CI7cplBxMOnOz49o3hLrA
         wUfA==
X-Gm-Message-State: APuU4Z8it1QU02MCvqAjmUWmEk1M7BE56Yp8xbYVYzRnaVwCAAJtM1o8
	+QSKyUVq6FkVw/HNp0ug/6w/a+zvgrJrjjLZqMdsTW6bhgim5Wlsx1TMK8k67Q==
X-Gm-Gg: AYBFou3wCKehVCxPC+TjrFJncDDdhUjhibwzD+r0+IWUQPzWfCIEEX9rRJrffPw08yA
	vMUpQwh6JwtXG+mK4SHs6dGO8IaHZo811Y1+tU+7piwljmN+JdTTt6lkbvYii6nmcyUPEqw2mBa
	EQ1HxZsSk2W44g87QxaKn8edms32nztq31hV2mgWG0SqdIBzpEyxY4jgCY7e6UJzfkF8vx3ZXts
	hq3RBO3XgQ4axfcITHyo2sJlU1c/q15FB59iu530hiDUTgvUKdZI2cLBorshUk38E3HA3KWJ/tH
	+nZNNmGP76OG8TJ26nHgEK1zCDTY5IBx+h8iBOQsAYu59HzxZtVTnEgJEg5sqs4Mp2Ck96Ps3rW
	MFgY+bn+MUp1ox9QpvzHCBJ31xE4NLeg4pkvyMcC4CA8Fl152qUCUR6h8rRJmQVmVf19LmF/ztR
	hdgff8IenHkJAKAh8H55cBkxiq8KBVmRsrQClFRm1hO5Ut7xEFLZSf/8xvogmmGvx6xlY1qIcos
	s9tYok7gLF43sWPh48T0uf42aCH2qVtF3yESYjhoRFwY7pLfZ2VKsOr2MJ94y/5Y+ryjvmq8ENk
	PIdk/ceB/5wqFO1bykZJTA/b/uYe3bAddcyVBUnLTy+7R5/D538sJS4DCCugSo9LsH3/q5zzftn
	ODu2Rc/JZuWydE8EJkCHAzEXLCUfG0UUGCXFcDfTnGsURrpM=
X-Received: by 2002:a17:90b:3148:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ae897364c0mr14242904a91.22.1793845948373;
        Wed, 04 Nov 2026 18:32:28 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:27 -0800 (PST)
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
Subject: [PATCH v16 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 11:31:39 +0900
Message-ID: <20261105023140.18373-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
