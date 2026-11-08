Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182166;
	b=4Ym2+STo3bNwdrx75uhi8tgsGAG9km4SB+MdzM6zfT2MiXPd1XzSDAHx7ckZMGNATJcF
	 d97Q1rBJ8S/x55Xl6oOzCRmP6MaAnZkTBF2CpLKGinZEKT1++HOU1fhaaRYeZhMCe8TcP
	 MhMNAuEupzygQGu+0/js6kHuh9z3xUxlMpZnNUWCJIaWumSRvkflKP35SOuwi41mFiI08
	 0yaHmghlQxNqUFa1Me6BR+4wi0Nwi0M47LHPUL/pkfJIcNPubtzyhFkg+l5Q4y0NsjuHi
	 kdpIzI5Z6OWeakSob97CZGZDVp6BjnUgqudbFxVEDftEsyk18GlKnOiZEeBRGyxlb0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=IVFtsVe3aKTzaASsaaeqxuvw38HY9Vl9sY+IW4lWyEwqBzxtNWvdmD8k8GvBxDh1k77A
	 oa+2Aa4B2yvaRLABnjT2fGtbmnQBAm+6lRNE6krcrRImKLN87u2ysswnCymlYRH7LXOsb
	 lJXhlzI+9l4re8bWBmS3HAVQzIWbKxoRh9OMFjwo7A6XhsWtezAVXrrKOZisjTZE0n6Fv
	 qOIgIphmSXLFa/Ng7xfSooXg5ZeV0BAo8Bd7MGxRH5PW3+9LNRvuE2RgwKZWA8kpLaPft
	 aJ9kc1pVWnh85rOt2EIwAQpXXQOmwRtllu7ObG57wHlWP2SFJtQriiu1qPdMrrYBw8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfAXwHEp;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80773606A334
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 23:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80773606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfAXwHEp
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e985106c0cso2346135ad.2
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 15:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182165; x=1794786965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=FfAXwHEpWz+7F0rrHdash2jTSoSQ/VDYiaYZGkeI4+fqILu3imbBO7P75zDlqnvBj2
         nB5OawEZC6CclFl8E1FYRHx60lCtuHBpNgs1D8Ier9+o2xN5Bj8qhIc9MnETY8vhz33Z
         P1vZjCDnqH9L8nrptg59oxzD8NR8DZ4Grt2aVnEkywGOKVc+xNrLfF3wnji0fERUAr/m
         d4QwOctjZCnEy5vDtqyoD8h5TXlRkoAKsr3UfrhEtRlGvF0iOqg0v4MevbttXMAyJ7fY
         H+e+VVYmnj6fmFC4hZZc3YCswqzSP17AIB3BC77XmzIzOtQpcNWgkgdL6khvkR/wp8dG
         Oq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182165; x=1794786965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=uiXbcDn1uLgzOk0B+eQ/zb4R0OXWF2T3XxUAW8ERWW/49hNHE88t/ff4qu3udpmPsH
         pvl7l4j+r8G/DN5nh5bx+5IJhuk88moBi7s3PY878Uo5+zWDlge1nTogXTuy6t4uTiQZ
         x1vzndX5QdwQM5QNBc2swH+bMgmgOeOa+zw/lHhaPjKv0qB9qu0Wq240Juc6Z+YFd+O6
         hMfO8A7U6ALmeAlTqhbEQOsHlCx7Mqwn+2+2iuvgrNdDojXpaS4j3A4GoIq0JeURDkYX
         2Cz2L+nZQICHwmKREfHmXrhgncRSf2ZUsfCkj9gUo9lyjpZN8i/px9wPnwjo8QIwhBV1
         JiVg==
X-Gm-Message-State: APuU4Z9VygMMDAtrAV2T/QYkd7HD5CpNcU2nTProsFGlVhC7xfTevmFy
	a03fmbTLTHbu2YyNvAYRdF+GHNRwPXPy30aU/wmi4CO3Xyupiyn6GQ2YCcnrEA==
X-Gm-Gg: AYBFou3RNa2/1qJkgphdqaoIUbOh/LUng7jAPIkgNyqeecz+RHFZp0nT/1MeNll21gC
	54Ql5wPEas3MH3AdZ3jUVy548blNo2ZpKvouGx9bdt0468pQI++UHk+YJBmycIJEP1EIuDmw3Zs
	nvmrwZSrig3RK5e0bVDTanEcUqLzt1geGW448RPtC+rXDBeSZGEU1+3pr4PH4bgA7KYk2g7e7i2
	ZZmwIpXA8b55VKBpIidXPWgrci0rY7CDcpKYPFmAYjD1RbaKLBTwsv7baDEj5rjSwvx0XtfwcFq
	2ipGdenQIeDrUNGQrmmILEZhSJ64DXSSJaxzKi/NCFc9uvN86JCkRzXlGZ0Ll2+Vau79ATmarT/
	aEibsUYnZZt0t6eZYxU/WHJr1FykjymGuhhAp+VIn9oS6AS2UIbv1UESGuEL0/aHZB1KQ0u6P3e
	dchhrhxcd6L0dnJAcW+VnBdnDl6j0OEkuXg+8ufbrSiwCdt0l9iqEXvrLCJMrvhkD/wtNOlt0st
	CCBbynjf2ihkbLAsSAR2HymZod5Uku7H/Auru2oWCfxKMm7bJHauE8J04R9bO+7waZAI7O2YU2x
	BEk/2Y3o8j/J7x5NAkMsJflVuv6hZSZximkGsCaXtf0V7+S3ATH7J4GZFSEuQyls3Gpf2Zuai0d
	CRd+96PIuwewei5wJNHUVUBPo0SJtj9OC9qnwT/d/+dMB7vc=
X-Received: by 2002:a17:902:ec85:b0:2eb:4a05:4b4b with SMTP id d9443c01a7336-2ed837a9da8mr24182705ad.49.1794182164926;
        Sun, 08 Nov 2026 15:56:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:56:03 -0800 (PST)
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
Subject: [PATCH v21 11/12] ALSA: virtio: prioritize staged capture period work
Date: Mon,  9 Nov 2026 08:54:56 +0900
Message-ID: <20261108235457.12688-12-mynameisjune111@gmail.com>
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
 
