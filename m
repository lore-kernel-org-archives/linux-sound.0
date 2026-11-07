Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062107;
	b=l1ni+A13doXPzmRScFSSrXXV8Dl/97p8vZRK0a+v6QootCK3hhPLGcqUaQ7qP8FMGu66
	 OtNLcemlmIGSyXg9HMhVdOjpOx64q+sCs5W6pDpWO8dJgqJ9KGBea9mJyc+izlwPkLndg
	 8IxVzmd+NEhV8LsosE2hlIuGWCrPZYe8G4YES2/pa1OF34FTd+IuGzZH4sF+DeFiKL57L
	 CKTakdosLhP3NKMGmXHri5BP8cl6Wpw7FuHx0JGqEAgninbfxRw/x1yxGYQ+NMjXZ4x7E
	 DjPoKVfv5CqSYZ7plcqpi37URBMiqLmS63vV+GP8XOke41iJqMbKks4bWmDFNaytQZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=GOEi2C6UOWDiYhzO9vnLg9z1EWuHEQvkImF3uC2rwdWgbwjzuymAEfyCy1ysgmAiMI36
	 YPLBGVaggQBxhtSllJqLi3LocdEcJthCi9quwFHqnc4efMFrD1LgcAFt4VBR3keT4Gr9f
	 gkLeZh2C4qPVfiHVcoq53DzhaEEmPtrFVjKbtuzmi3QgMle6u3eaB0UN6CvPCQHRu6XHT
	 k2KhIlm0Z5vmNCflZVPalGkICqdm4a/Se/fz5LnV9CVWCAUeG6ZI1l0zhCi9WjT/HY3kN
	 bUFIWmCqZ77RyjCOgzDaLl9Hsunf7uWTni1hVDEKPqJdB3F+Y0Iyz2NRlI+p0tNi5Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=It0tjF7X;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B3606EE88
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 14:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5B3606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=It0tjF7X
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2584043eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 06:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062106; x=1794666906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=It0tjF7XWj++NO97QlIi+MzWsqv7dS+rLoAjkHiEBDKsdOwkLwXkcxT7Ik7ap4Urjn
         YI8UTGIEzQo7stz5MHOmV30obduE2A44pHBsRy89yax5YgZPFcZP/I/ZjPM0PbTZ8anh
         kE3UVi//VVoYYPYw+MD/c0+acOFFpYGqmnRZzHyK+1Ynu5aRuW1Ktirfj5RGHoDSMXcY
         yx0+sXtBo1Z7Gd6IJoueeJi2Kr8NvRjuMQxx5CfOdnBxdeZ3sDK0qigZEnY94G09p2H2
         6wG33TspzAHEgFIYLN3nhjmMxdOD9tpWr7Vldo5sroGRSsGU+5fCbivBb7dTslLwANGj
         GzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062106; x=1794666906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=Ru2nFeHGkGFCT27oX0fP3s24l6PMULPd9N2c95s61/uMaU2Hu3ehgf2K0LqLpmCWKD
         tNcpIGrLBPKYow6TuZ2v3NVZIBHH4ziIJ/Wm53EiOgQLfda6YMgZhbfDVNQoNRzp/VDB
         4geGW+OsF13s9UFJjbfb87HUT9ojCfA3PwLIFR+bgIVG7K/f72ZZxctlJJ/GdshYv+JM
         AX0lYncFdRvoCITgyYKI4cBWr3tCNWqb4S5kd1ugHy8JE0PMn9IUcY56YOXq8LdASKQi
         Uon4IfZ0WwLEZUbzCz3bj/kDMyX4Dr7HITV+blbunj/bfUB+xV3tzodF+7iWHLDwUxo8
         FhJw==
X-Gm-Message-State: APuU4Z89NQGSwYXAB5hA86u9rz98ZdYBuu1NW4lHHbIhjYdgdtt1LRHt
	qRn75SjNOTXDWBH3cnDxXjOVFnUmcaz4LSuzGZ5N4Upb0rNM/HQHdiaYqSJlXagv
X-Gm-Gg: AYBFou2Cx3TIGPf+b2zqi1l7k8ShJTXBnRbTC15XXE53d0pkvB4m1TeeiRdyPMRrIG/
	VxbSgz/aJfoFGq76hgGPjDbLL46FsY/Lfc7cdc1uh3sIXAtC22xU4eIQij4dc0ImPORaJr1NeIO
	CN0bgNG/LHKKa5oZMxPyq/bkBIajY8Lye1jdFkBc33LpZbJRWq0peCTHRD7eakBVb0EZWdePgWi
	+Kj9iY4BZYsmXWGoladhCouJlFm8KKJRqvrtrf7XLhksAujC1JD6XZTc/OqibULQ0s31XmCHXUD
	HNBR6yu40DBMCor5naWKKaTaERE7Qvy02VhoEyrzsnoZeJV8/U89HILzmjyXWlqUEDMIwGGE2bt
	LC5OcwfXqMHK+nIjJJSVFGTxSVFQ1LE6kk2w+f0E5yXTYVBAjSyTk+bChQqUZrunws3I6jqDsjz
	SlHoRThux1OHLw6GA6Yb3jlknBEiEACIpnugrRbv5Z7HkdlWpOdnZE/f5XTCcqQdxEET8NvfYGu
	/0DqeqOcs8rZ4oPJMIwt7HN3RzIJW+1iE3OQqntEUKhH5/Xz5yLr/o2Uy+wjuBwHKVh0NphOvn/
	2tZqHESKeZ6AO6bD2azsQLsHS01CkBHPEsRtmm0BbU8omFeinGO2Njc+ehP56+69YDivp7+DJs9
	vtraQOXPwI9vsGiBGFEKitTLy9vPZm5kWCOgBuXvcM/D/xw==
X-Received: by 2002:a05:7301:d805:b0:36b:f09f:924a with SMTP id 5a478bee46e88-36f7592e4d4mr7639013eec.14.1794062106044;
        Sat, 07 Nov 2026 06:35:06 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.35.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:35:05 -0800 (PST)
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
Subject: [PATCH v20 11/12] ALSA: virtio: prioritize staged capture period work
Date: Sat,  7 Nov 2026 23:34:21 +0900
Message-ID: <20261107143422.29319-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
 
