Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263886;
	b=WFI2tH72ErraGSAdT0oG03zGFTe9QC+VjKOuaJRoOvYnMf5+GAaEtlov132bFug5cvlf
	 0AmgNlQqy/GWTWS9gbVirXhJr0EAZSmqIWtfgJGX/KpxNGPxPskELCjTiqhjKl0VrAL5Q
	 dVSl2A7N0GhWihdya21ohV1llflkO+/49kHUcQIoDstq7v8uZpPc0gCgtzVQVNHgN9nA3
	 dMyEuoOVjLJ/DZFlfXp3Ma+XdJ+k4vQVVQohQFktSFVK/rWtDgXZBc7rJXjW+cwP8oDJH
	 WBQIVCFLdMj+OzApiDdpH4XCUGIZl4PoCrRXgQm2VYaWTa7R0jmYxbW7kCetqt6fj/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
	b=fJEWeVuSLRZa9DEdEvxGcQfQbaCh/19HGmWtONIQyVec2RLHm/QiGaEDcqj+b6fgFYlD
	 meRPSSm7ZSxskcA5byTp0sLfDm7HAo59jhLPOl0C9KWc2apu9bJ0yklD4TMSnr2G3DYRH
	 hQd1vRm3ToaHESf6TyZlbK7/A8mNVymSGMVUj7x5skOar4naYEqkura3yeJ4vlnLM827F
	 TucIyVM2V53rD/EFKYPu6hJW8+9a/nlDtfDJTQWiJHa1HKgDtbUWyGTI626mTEUek2NK5
	 J840i4jcV85OKc+QEqyDsdU3Trc1xmFUwi2cXWX4O0l3DtwhEKLAhZqK5B29Y23Fr0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwSdMdDx;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C96260A2600
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C96260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwSdMdDx
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9d7791b00so12095425ad.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263885; x=1793868685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=QwSdMdDxdAQT2ZVW4inzwIEgbDlf+xi7TJUzjvFmUlGnZi43i+k5ZM3vjXLcreVLDB
         BY7K+G6hoM7VVbACa5QyQk5mYd2K/atr21Z71jMUh4ITbUgqHXy2mK5jXbpFOCRvLE5u
         tqdx0X87XfigTw+YYgNmW15uPM0Gxl51qNylrRs9PytUCqj+wGwphQqDw4pkiIQfgp0M
         TzV4rgNnIAUyvxzd44JGLPjY3kM8Y5JxUaNDTniDHVxTH4V61C/8AXlSzBpvqApLzcHS
         LWLr0uE/oJ1sS/pHwXqm0lDwwQMlw5gDMjuCACJdqYp/KJ5QRcZFfVtSQKkbqF3Wh6NT
         Dk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263885; x=1793868685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=w5hm4hNBC51vclD7n1CSr1KG3agVW4pb0iCPSauEGPcCk9F/Qbs307LBm3UbYtbbAI
         qU30aIWgWXISZRJWqYzEHenBRcBcxAGpi4Ya3x2m+PhJDSQ0uxE6Vq1VNprpuPeUZ1CZ
         dPzjV+SQRTtuk7pKO+KzDyfitpVDfOApkodVGxqgYcWs82Sw21mqNku4XRrj/5JsocFx
         f0bAvhbLFHP4UYZ1+pzLECoVj5Ng37fFM760skGBW3W2i1xlyaiJCyX4C0TRGKez+Kp+
         28y4z70oPu9l4B42jjbUr+f2LavjfmqBfAHKvEf3qB5jx832lx9OdX8EiyUE596OEFJc
         C8Lw==
X-Gm-Message-State: AFq9FYLh83qlH0sReYDC8dr57+mJABzBgToJ6E3kx9Hi5NZnmqn5ukNa
	H234UjnCUSKaiiJwz60l3CRumUaU2hsb7TSMaIC3pP3mc3BLhGDuv/kFALsqdA==
X-Gm-Gg: AYBFou1AJSqvTT9wNVhDeZypJxpqVld6KaPxAPP1DlTSI90JbatXi/cFsO4YIY3qx1t
	cB9LPYLIhvdO2fuglHCqO9913NP7tT/lQddOexkLIM5NyA0wt5yDOUCs1Fl80rCYz3VeTMI7Obx
	DbVxfBZmdVKQirew2RtlsdggEZsuGNfIZBg8g9wjJm3Y9DXOYenDUldJKacgsx6EKXLwwP+ARHM
	A0mTh4wushwRjYRnc3dLl/R6gHOOwjATxWQ67Ip/PxMeRSIAe/mHDUNmULBIn3pJhHLPXIsPUvd
	WYmiiFzeNKAxclg8CkJ3DizbyN6XEOl2bXfkqnvmB9bZDzFdcci+s+SyLNkwG/EqtNtlijsbM63
	5BBUYysGGvw+LrejPJsZ8+6G+jiPvnpnA6nB9IG9KU/IEYVJo2+Yo8bn4QhT/SfR1u0g+2wf4wl
	4wsy+6sLgwTXjA8cRwL6AYb1FXRrQL1P7IY/AwaSl6/oem754kw2G879ntMz7cth1sHsMWssluj
	EVusRzomvILXrxfHGZ04eI9KrJ/LK8Ta7pzG0qkbA+0kv8cMsNiL6nbZjAQNNuvLn7SYzEdREn3
	gEFE5kau2DC86XOIkTy4kEIsuUtWt4hNyySfJUubOrOfS7J0bC+fsIoivI1aQDniUwCWzIE+dWb
	GCwdWchjpMRnXMQw5xkEMNKJ1Q5lMTzrr0W9JRTJOeA==
X-Received: by 2002:a17:903:1a0b:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb0012b52bmr46327015ad.6.1793263885507;
        Thu, 29 Oct 2026 01:51:25 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:25 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v9 10/14] ALSA: virtio: prioritize staged capture period work
Date: Thu, 29 Oct 2026 17:50:28 +0900
Message-ID: <20261029085032.70689-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -159,6 +159,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
