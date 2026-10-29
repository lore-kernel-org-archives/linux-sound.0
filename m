Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252672;
	b=rt6tl8fR2LvWEaSjStp1vn1tjD9RoE1xF5FyN2ooAw/SjOvaAR3dhilX6DOeWlG4tTLs
	 2H1K05N/YEvin6UrQ61CnQBz6tUQ2rMsJVK+2uK2LjAQvWSVPfSudk58IH2a5ZeV/lMqI
	 UHYjHolWl9OLYsRIRygohnkHddOJ3A37dcl9sFRFRTCTdYgHlrEjd3OfUvIwxWsLMpjKh
	 YLtOGJNz8UjFkOUIsNh4zwe3o9/R2lLx7IGUSOh7vCNFemnVQK59teMi3NCaJ4LEhgV9N
	 BiBrDycmf1JET8bfd459W59Ty8Nltq5Aa6+U49XQ0dqnxyGylncwaP0eBnR857tu1BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
	b=yjwSsFvxhhozJa5PR9FSloRyQq0KjjIpuKTsjkmPWt7MYxxEtMbiV1WNq+I3qo36ZZl4
	 DpwiyTHWRap+kkWeUBV/eiANQRFAW0Lk4WivXtxg2M5r1W1XsfXAhOWP9fNYrRzDkoNJd
	 vzbbJ6BRM7XWrB3eGmEt5lpP10Ca4jc4lZi18VO4XAyyKAkIfVZFQyoim7X1dYtnEJp4+
	 0UATYM/FNn8a4xV8RvPmilaO9i82E5BF520zL2T19FlEbtS+uEDpzUJ6V4YpsU2eUTfhe
	 ZHGMWtGYq3rhpaWfCopPHwmV5UDDrcez+hCquCVTmQkuUyvT7IDB3l0mk+z3lqVziwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h++Z4L5T;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7748D606A323
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 05:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7748D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h++Z4L5T
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso58202a91.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252672; x=1793857472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
        b=h++Z4L5TTcsGx7eTj1KcAyXeC3kBONYMwk6Szxknge1HwE4yiWmmcpT47uBUXVwDIr
         M2wmP3XnFHB8IpO4k0ql/PSfaxq7UkQlEsb9Hxw0ANBavFSdyYjHL6cDdlvc2HDssTCP
         hPPM4JcUpjsUMb1Wm2tXnbH0yeVmnxKnSpAu3p/EojrfEiXNPuMG4RCGhoQjxoRUCNLP
         Z29i/uJ/QXHfYizyvK6VvgricLlxGzuUwShIahB73XfnWjgSzaSK08kw9EE4nlJckbgA
         YUZ5CPMrl+MUUAcpJVbvqLwBD1DHKF5NVEtq9tE+TuvuBXfpSFfDMa7GVh5b+Xh/DJrt
         La1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252672; x=1793857472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1CqVlBSvwYPpTYL33mCW1+ANjaMpjIs5jzRD0wJXE90=;
        b=P7k/Vy7O2EoRJVWQ0EejiZdrgkF8jM2g3gZtrabV1MtI2/wOGupVTeRxVPi1SSLFhx
         HqzOH2BHf85RpAr/cR8gwS8p5fak7yQPYyVDg/d4NAhpGIdPlallWEwn/fafE/XaLtoY
         74E/zzeea2MVeA4fZVl725gJDI4sGxVFLFd6mIwwRWu4S1bO9XfwkCM/aMMJMq19JmH/
         yRWgKAzOetQeOlVF1TyV7w6HbbdeCq4OEmBJgtiFD64Gi3OMRScZvfjDsoEp9Ss6+bxv
         QIX6x+mHv2rBs3jqWxAQPb3m/+YT0eFMCLOPXiKl7coTFV2oYzHPo4ANAy+9F+1aQpv+
         68FQ==
X-Gm-Message-State: AFq9FYIqjJnLYdfeRTK6+wR+87RVLc3yR2Oug1wfGiHsWvuUAkrlvau6
	SoEGMbHBcZFVqI4SRPcinQuOyriEu4SYykrLno5CjaI19fSkjON7P2sTP8naoA==
X-Gm-Gg: AYBFou0CEA9z1Kli3muHR5qV9M2ZsSiHIlqMVKGAtJULi1CwRw7ptA3pnQnpEmE2iHy
	6o9+JnAUKQPwJDIdCeGsd5/N7HYFthl9bJ5GFnRUW6jKr+n4PsUbfBTBvAmX5E06NZaWsgZG1i8
	WrL8fPFz6tGqC1v2OwRrTOCvgq5Y+6JgamqWE8wlIe/5BqpjUW/RaW2yD+UblKF13Ln2XZWwY23
	fV5R5AkX+drwLiCAvhrwdIcYJmm5t8xZ141YBv06W8Ubk7Au0KbLolp3uG0j4EpExzj66Rit59d
	wx3Rm8IYXev5vMoe/f4lDJsP49mhG2HGEgZccTVW95hVDJkXECc/Zm/mnMGvos8nBUNAIoz2UH9
	o7sRf3MW1JiMpyGnDJPnc/Aa8npA9F6jp7rezlRZMmcVLb+zPwSuDH3XDaj5xyYUcDfW4+aYKLI
	5pURGi4rqhNv2zpioLCrw/nf+MFhTxldxdzluohOilUVC2KZvZiKIJR28zxHM2P3oWrQtHsmydL
	dBhZk67MeGshVu0mKw9FCPSvh0Lu6yuSY+aj7pXfM1bxMcUO34oc1HGfOHNA4L0STmBPdb+bQ4B
	e+QHpg5exLUtZ5JZHvGpuyEZ/TXVumztfTyhtALkbqYqjUTFzbgAmO26iGfJ4H/XRzj/DsPt+wP
	ndx41vG+995ToLMzjdrSPgJAiAkz3Wf9j9sLBn3/1AwW7/SE=
X-Received: by 2002:a17:90b:4c81:b0:3ac:9a03:20bb with SMTP id 98e67ed59e1d1-3ae57f9b35emr3665083a91.18.1793252671816;
        Wed, 28 Oct 2026 22:44:31 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:31 -0700 (PDT)
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
Subject: [PATCH v8 08/14] ALSA: pcm: stop paused streams before synchronizing teardown
Date: Thu, 29 Oct 2026 14:43:48 +0900
Message-ID: <20261029054354.2931-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

A paused stream can retain outstanding driver requests. Moving it out of
PAUSED without the STOP trigger leaves device state paused, and skipping
stop_operating prevents the following sync_stop from cleaning it up.

Run the existing STOP and stop_operating path for PAUSED as well as
running streams. This replaces the earlier v7 proposal which only marked
stop_operating. Drivers now receive STOP when a paused stream is dropped
or stopped by an error. The change affects all PCM drivers.

Playback pause/drop/prepare/write and capture lifecycle tests exercise the
change. Physical drivers beyond virtio-snd still need review and testing.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1607,7 +1607,8 @@
 			   snd_pcm_state_t state)
 {
 	if (substream->runtime->trigger_master == substream &&
-	    snd_pcm_running(substream)) {
+	    (snd_pcm_running(substream) ||
+	     substream->runtime->state == SNDRV_PCM_STATE_PAUSED)) {
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 		substream->runtime->stop_operating = true;
 	}
