Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476801;
	b=Xet2pgEQUMFaf+9Fx60GVrqKJmfnDbZGMlj1zenALL2aaNQp3pGZcSaO0znYFkDLXxo5
	 7ZA1hjOsYOuo8gv3scSIWQJ1ZwKXlXG5e7P9ppNn/nliGogFWYQnfXgT+BSyZRz08YF0H
	 BWu0I9Ny1dUwBMgaRL4YE43Os5TGpUakdWQe2sonRuFq21gmS+TWluOBcLO3GgidF4Ayw
	 eBDRKG77NzRyVxiZz0nZ7rZroRlz30SzkEw4Pykg8X/m455Qq+RsudGFOujqpdJzPXBd1
	 CgSfZlO30jBsI3zrql0Tn5l5nlL/NmfuurEY/N7nhFGuZ99Z4GsoFK+sT0FXijXN+ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dYd2NNAvqk4TskR6myFn2rxGUljRU+4C/GW4zVnLWec=;
	b=XFbtR3w3lNz4gYSWTtOC0xyuMhbywpZHvMect1JR49v5pG9No2chouynJNaROchV91ml
	 6fhS0iPFFYrm/kHQHpo/fjuShrd2wOAdLS5RA1HlqwEJtILXhkQT4SuaGaBxINxvABCvW
	 47yj8LIxSEJp+rNf63tJd+ujlGDIT4DzBtD376aIvU5gutV4zHZR3cmnPEKItFocmaQrC
	 X5WFz90Q22+WfH88XF5A5HkkRroqwXYIt2oSbAz/qJmBv7I+g6Sxh/zIo+dzCQktEel/5
	 4HPRDZS5EUfMN1bNihyPC5Lzcnad0bX8HjPXJFTELmZB2IYfMCfD6v9jtqPo42wKpHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzA0CLPk;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD42606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 09:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LzA0CLPk
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50715c2757so37299066b.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 01:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794476799; x=1795081599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYd2NNAvqk4TskR6myFn2rxGUljRU+4C/GW4zVnLWec=;
        b=LzA0CLPkEE1dWSIQnN2dPn9ZmFmpJvMXM28EdBwHimqfxFtd6+7EgflRA5j07nxNWJ
         rj19KU6ncHZtYxOffsSMRAQUDTsjhfHZZD6ysHMjox1ZytQrIVlqHZSteuAXFHPU0GXo
         p8287Q4YpxU/nueEva7jRt3roLN+t5kSSdGVCoxZlfWlO/of+LhsORyM98f1j1RxO5nY
         iNpxIREjfOv5/3LnSdBUXxpbxDintAIicA7rzSJJvCE9bppHrRav1dN0K7OwsEwwo03G
         xZWOvXJjBF/9ERLoSvKUrBW6BILa8h/BpPQcnGNruae6u/3oUlKS6y+AkQHc0jzaAIBB
         htmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476799; x=1795081599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYd2NNAvqk4TskR6myFn2rxGUljRU+4C/GW4zVnLWec=;
        b=ODQ0MfNs03oMTebC4IVkKP1dLj3vEI0SO3AaAsbCNDYLsIqYw2oJ23QFFCDhl+vVtH
         BRJh1zNbWIXo1MAW1ZhM4PJ+BPsmIfaZFNSK1IeG2ojk0aFnNg3rdAr0yIxW43RV/Nmd
         TXL0OUe6nd9SZMcUnAZ+NI/jYvFRCEgdE+dPmSuD0YiFMCYVZdubwrFIuVq1snS9bN4e
         qUzpfQ1jb1Z/mfUHmQMPrLIzJNCaLPLcWvQfgHL1Xi0L0qsJlvQ5KYvE762d0jOyc2Hf
         /OPGK/lU92TAHuPR+hef7Nitg2qFr1hEh3Vh0gYuIv6YBq6T8AvWu6/XyASn8goOwFOl
         yIPQ==
X-Gm-Message-State: APuU4Z8Qz8Ciu0+ewyXvI7Skfu1u/CDRLsx+kPygMLS+aZ3tqTrYbspU
	PYi78DF8zPamEK2Y4WRZB7V3M2GvN+5oIZdU3lZwLm7fuVHf2Oc2q/V3zcNKDQ==
X-Gm-Gg: AYBFou1qzKN/K1Qr+GsRDp1EaUQCyFExY4sm9MUiluM2roM9AoBNKFr+VQbucai0lar
	IMnh6sSZ5RKv8oYUcAuIV9wm6WMEKyDzV8ezozVOj6JCRU8rKN7grTEHZ9Kx3mWVRUma+EC28BL
	zutx+Wja0D8hCHZcOMV6rXvZ1Gu8AEweZ8gNytnu0FavHHLMBxeeCe3/V5LyxItvrROWC23/hLQ
	XQ+puXfc+zCenFQp3u6CXHw/QwGJfH9FtkqZCgEAf+AA+YG5ybJIKGUHEeqW+PwhQ+Q46GsIchU
	z5Hbo0jLVya9h2bDC5QL1/MoEI+hyoR0FLGiP7lG0v3huF+VdJ7bjh6JsSc2ytFDPMlukFi9D4b
	5oL2E6pWJwhNjbMxSy8Xocp+QLXqij6HW5AjKjPKeD47BvE6DKZ6EkPCaqKeT/bTqqM2EmR30oB
	8A9eVcsPgf1rtwnbwv1KIJamP0V3x0R9lttV/+oOq8sbUWxytmZwt+y1TcTOKIoa3xkfKJRpNNt
	hZIVbcK70JowZuBYT/RlPySpXdeyUo5SEgtCqTRRQ113V2tcLxgrYX191jxVsWG+1m9PxYUlZvD
	bYBOtLwDRLltRtg7Pky9lwbCUEk3wvRQt9RBdOjX0cyw6BTdhUDy1g==
X-Received: by 2002:a17:907:96a2:b0:c2e:317e:d711 with SMTP id a640c23a62f3a-c5066b1d786mr340502966b.27.1794476798945;
        Thu, 12 Nov 2026 01:46:38 -0800 (PST)
Received: from localhost.localdomain (h-94-254-94-11.A230.priv.bahnhof.se. [94.254.94.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578be3e5sm3201418a12.8.2026.11.12.01.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:46:37 -0800 (PST)
From: Mikael Magnusson <mikachu@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2] ALSA: pcm: update state after xrun
Date: Thu, 12 Nov 2026 10:46:36 +0100
Message-Id: <20261112094636.13671-1-mikachu@gmail.com>
X-Mailer: git-send-email 2.38.1
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

If the snd_pcm_update_hw_ptr call from snd_pcm_status is what triggers
the xrun state (eg, as opposed to an IRQ), the returned status->state
was stale and told userspace the device was still playing, so they could
get confused about device state and hang indefinitely.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222201
Signed-off-by: Mikael Magnusson <mikachu@gmail.com>
---

Changes from v1:
incorporate feedback from Sashiko and Takashi:
 also set the trigger_tstamp since it can change in this scenario.
 check return value to determine if we need to update the status fields.


PS Sorry it took a while to send the respin, I don't have a dedicated
testing machine, and I didn't have an opportunity to reboot to test it
until now.

 sound/core/pcm_native.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 1f5ebfd288..5d80b56449 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1127,7 +1127,13 @@ int snd_pcm_status64(struct snd_pcm_substream *substream,
 	status->trigger_tstamp_sec = runtime->trigger_tstamp.tv_sec;
 	status->trigger_tstamp_nsec = runtime->trigger_tstamp.tv_nsec;
 	if (snd_pcm_running(substream)) {
-		snd_pcm_update_hw_ptr(substream);
+		if (snd_pcm_update_hw_ptr(substream) < 0) {
+			/* update_hw_ptr may have put us in xrun state, update state */
+			status->state = runtime->state;
+			status->suspended_state = runtime->suspended_state;
+			status->trigger_tstamp_sec = runtime->trigger_tstamp.tv_sec;
+			status->trigger_tstamp_nsec = runtime->trigger_tstamp.tv_nsec;
+		}
 		if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE) {
 			status->tstamp_sec = runtime->status->tstamp.tv_sec;
 			status->tstamp_nsec =
-- 
2.38.1

