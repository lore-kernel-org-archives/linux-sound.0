Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267698;
	b=TPr/sdXhc4d3wES4W+E4mQoKY3ZtRsFIoc60MaM6oe3yezHL9/tKJbyQW3hT+MH+QdcW
	 4vHm9kACWFMJ1NCbrlierauRIZzbcr/8WUlbvfzOh7mRVTLkucx71oD2J6D6iQwcfSLTl
	 EDhy1RC/pwB5a2uwj1KD7zH4hiMI1NZhQvs+/x/iB/5AbFzFp7C9nmD9dMNb6JrRqWQ3Z
	 TGmiDUNaqYiLsCjRvhAdRAMeovs+WpMmv33W3/nDFpTPk3ciQd1Q6Noz6uAXbZfTcWULr
	 rRerNfBuELBJsxWwxoyJa6I29oydEAGDHs+lK0kTrN+ta2UzUUWjUgErXa5BTUP7KMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
	b=rkkrpiG0JbcEP8j3yRkXMo93bKn+EUjt/Y3S0K0CwJw5rr4QQtDix/KYVHP1ZSr7Fb7V
	 bpBcWyVtgoUZtH+MdxTJZHUOWYFJ3w9azku6iqbLvfEPH4JKxl4W00n8C37ao8COmmSou
	 Ogec9wZs35EIE6Cm0TmwIxb8yc99UWF3B2U9ubvobT5sykCScKSsXIVDqWxlyC7y6TbsC
	 hhlS4yW/zdzfgyiORKF4PuIuN2r/mYzONDmrNV0BVEclusZr8Yohjs/xm3OmUlMcavfHW
	 RxuEzJ3eWgKFgZvuUO1dD3NUWiOH0jchMXrfGjAenAR01QgszsgK1/Ixv4HtPPnI2ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOXyq+cS;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C50A606A33A
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 23:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C50A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOXyq+cS
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37071c0f42aso2662165eec.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 15:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267698; x=1794872498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=fOXyq+cSXf2AlvOAXFEdxNXljERxklqhGVDeNzLAQgY3isaWq4Em/VJBlhnJSZxZcl
         PE8g0gRDmy5rNm4Ud4FHIuklDcKDQ/QXOVNv7xpqhjINNeHNSOwdm7PhW8/wR4hreUhy
         4dftch3sFcEXjvtv5pn0CIfwdkim4i2PqcGa0jJZD3Ut5/LpmKwxi2bJISrXl0ZEQ7zm
         jEFS3T8EovVvtnqHOGdh4eWC4nmXHuX7vj4QzN30xKCisUwrwm/FPiwFijGKYFA2BdW9
         T38ErkoLFesub2KMAeGRt6TBJvjqnjNEamtaRV4q+0b89AoE5e2qs4I9buYdqBRoqSlu
         AtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267698; x=1794872498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=qd+HxIBLPpCZmPF/8c93w9By9xcdQWKlqhrLQHbs1awOmp7ttITPAq2XRxiJbycwAu
         kz5ZPJ0DAcTwyR3mIhoeleMbIAZ+o7QcZ93g/Tmpka/PboqNC9xOGk5gHobgi2noBIfU
         XewGWXS38degJmwCH4k4Vsl1B3zB2FCV6tWXx3wJ9LsFM84v6LiyrNfe3ydB77+D2cv0
         0xe7NH25iHpmBSPJE93nHBydzD/d363xLl1T3h7C42X/cwauDeOBMKPW4PLrZtkU1BNa
         JhyC4PUdfUYWbK+JNDQe5rXTijc9OtHMudLGVYv33IlrsdzL8h+xBaMf5StrbM8q9MEl
         ekfw==
X-Gm-Message-State: APuU4Z/adSxAJqIQ9a61zgzyAcmgMAsXPeXpj+L/X+n0GjBukx0R0huk
	4zjAl6YmAhPx96hjaHq0ViSU4CN1i0Rn2mG8xfmf05Q1SqroG3TdPZbUFmxeQA==
X-Gm-Gg: AYBFou363CkQlIcybar8cy1tiyjk5y4/5W9EK2Oi7Wg/dXqtn58q1y0YTwD+iobOKGZ
	U1b7n/dA5qCNt7D7DFRJsinAlfj1WHUY+/bhWsSX8UXCDxvWBlcvd322vA054Bo+K+rsHBoUs3f
	u10whFlPv7wicV3aXnBMabsfitNeCiLVykMuTC5gowKiFeplsNfnLPjVyQowuuGf4Rf3PfT1Dnf
	cAuggP/99tgjQcEHnMpHTAHOPxetKDQj3cl6vnDvOtR6cCYc109MHm8ZXeM9oyxIsN7QRTltmeW
	KymTH/kPSBI9Aq2yY8A6pRd5gmnk9GtdVDAVZOr2DCZwmaWkLakHJf9uqzY4yNUFCu0FQLhFAE4
	+jxdQbwcdiDdek2Fb7YTjd63Y9GJlh7icFamgqK6MwAK+5xe1eWamDOYbzpBG8A5J/SSII6ug30
	Gnp9KvQ1cBWxqXSt+onP4vy5tEHG2s+TD2kaiqmW06D9gHISejaLY72K9lGRyP51sLqc7qpD6TI
	XXj+el/OZQo4eQUfOShSqj0sYN43jfFV+YNzK1omP5hzx6uppF5aiYqZZnwdrQF2aX8ljlh9i7S
	IR3trgOGspMZiy6CA/OBdB7/jvB39d+5znUgauSDxllu2W3MDONryeBjnrdwaCRio0lxRU6dQBm
	T/C+Pf1J2EVbjz36tHKB/TS+3WBvJq1X2OdIYpXGKKRADNCHA
X-Received: by 2002:a05:693c:41c2:20b0:36a:4ea9:19ad with SMTP id 5a478bee46e88-3751eb8db6amr975022eec.9.1794267697349;
        Mon, 09 Nov 2026 15:41:37 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:36 -0800 (PST)
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
Subject: [PATCH v23 13/14] ALSA: virtio: prioritize staged capture period work
Date: Tue, 10 Nov 2026 08:40:48 +0900
Message-ID: <20261109234049.79534-14-mynameisjune111@gmail.com>
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
 
