Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA9039EF35
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785269867; cv=none; b=XR1NfqS8oJHLfS9bkBqFu1vX1gLiDZxuRGhusG0YbhSdcdgrijmFDRdszFoEITBlPad/h79a0Cv8W3D41fwC97FE7D7SKLApEjLBvv8zaAgdgy72d3BdLaEbOvNkG36rtqjxuYOUrs+U/rIGJSSZ1hpzy+AoDaYCMew44wmtWcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785269867; c=relaxed/simple;
	bh=sjQLodJGCqV+uChLep9HZs5jqBfivMxq3Co1F+PXJIc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=D68UkQA1IPg7Yh46YvQQHiaZFOj7f+m1eaD50NZNnLLY5EJ86eo2KvjeQvifTqm0i1VxVqH7ZIlVIFD5+epyWmtwkEePJ7xVPdoh4EoBBE8jV3jdwz5O1YTztAZMZ9bYNvFfYOnH/B4ctV4hq2Ayy0ypqVTkLSDp5otdmk72czQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sonalipradhan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dH7S5t1k; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sonalipradhan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dH7S5t1k"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a3514f912so335638b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 13:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785269865; x=1785874665; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5kgrhmvADb8rlHytqLkDTPOL4OV9lgDm4ab/YstRW3M=;
        b=dH7S5t1kGUI2P+AVhr8uaIIrcVmm59HK+o1uk8/HyPho85JzZT2Wf38grmaWmf+XOI
         UK2dmlEiPhS2ssi3EcA4HZX1nQ/SRLG7fXGK1PkwHUG6xenfRXhrI4oulwpyb5gY0ztM
         uhZ09QCEKCJiaF8PpvVY1RLzObqaPIDXwddd9uGgLxFn9pg6+LE7mK6HOT6YL/LM65nw
         IMfFIJRszJGBlpMKr6nkfhZJWGwbIc05E3nzxXzhlI4p7WOxwkZibze91U3mO6kVbPw4
         VS80oaHmwyDYm1RwEiXFCKyi8xkcNRNAuSia1Cn2AzBTj2q+STnU6FIRusA5t/EYLph7
         B5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785269865; x=1785874665;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kgrhmvADb8rlHytqLkDTPOL4OV9lgDm4ab/YstRW3M=;
        b=KMHq0g2opvUplCQSulbtiSKIauPImQlWpWRBwlqUD1q1mOttwDz00r47mqUL5ZQ0q5
         B/O26b9oArmNgH6nTPrdQBAJE2w6Y/YX6ca/YzOlkWEw3Y3Q1E3a1I/YHJwh5ksfoEdT
         jh8mc3Ghbg3PGoyiCkThQ7chLh5joIRz+UwUcEx2ME2ahsHA0pgUKxV7AdMnPPaMyLSP
         zwpO7GSy0CuFmh6hW4YQ+cKHLruCXJudVEIbgUxtVkmlrh4VljrhFGKWkt6uJIGUmP5/
         uQW2MV11UfN4pT+OopA1mjV1PsM6IcBV92yw/usfNWXqpnfXhVJoRSHVDOy9exlk46Ic
         BGLA==
X-Forwarded-Encrypted: i=1; AHgh+Rpx/9K+IftLbjQd6YCdr+zH87TpukZLwrQhDQib4XWV/ZHP/LqjLEldQncqtYSZr7OyTyd0ctwTYjxgMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJaHoI2Durv43U2luJjsY5/Lr3jzbd3zDwGurfPlXx0pH9n5H7
	KndhN8JgQl1h8eAAGexR2auAR2K4Je/Grjg2rl32g54F+TV6Shk3ENRBWIg9Rb/VjPogI9HXLN/
	NUEDdsoZKja0ytv3kmARqWxVGNlpFhhhQ6Q==
X-Received: from pfbil5.prod.google.com ([2002:a05:6a00:8d45:b0:84a:3e5c:a215])
 (user=sonalipradhan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:179a:b0:847:5ec6:3afe with SMTP id d2e1a72fcca58-84e9325cc94mr3878191b3a.31.1785269864566;
 Tue, 28 Jul 2026 13:17:44 -0700 (PDT)
Date: Tue, 28 Jul 2026 20:17:16 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260728201716.2347726-1-sonalipradhan@google.com>
Subject: [PATCH] ALSA: usb-audio: Fix DMA buffer out-of-bounds write when
 fill_max is set
From: Sonali Pradhan <sonalipradhan@google.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: Daniel Mack <zonque@gmail.com>, Gordon Chen <chengordon326@gmail.com>, 
	Kees Cook <kees@kernel.org>, Jussi Laako <jussi@sonarnerd.net>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Sonali Pradhan <sonalipradhan@google.com>
Content-Type: text/plain; charset="UTF-8"

When a USB audio endpoint requests full packet transfers via the fill_max
descriptor flag, data_ep_set_params() promotes ep->curpacksize to
ep->maxpacksize. However, maxsize is left at the original sample-rate
derived value.

Since u->buffer_size is allocated as maxsize * packets, the resulting
DMA buffer is far too small for the requested transfer length. When the
USB host controller streams up to curpacksize bytes per packet, it writes
past the end of the buffer via DMA, corrupting kernel heap memory.

Update maxsize to curpacksize when fill_max is set so that the allocated
DMA buffer size matches the actual transfer request size.

Fixes: 8fdff6a319e7 ("ALSA: snd-usb: implement new endpoint streaming model")
Cc: stable@vger.kernel.org
Assisted-by: Jetski:Gemini-3.6-Flash
Signed-off-by: Sonali Pradhan <sonalipradhan@google.com>
---
 sound/usb/endpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 24cd7692bd01..d825c09a766a 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1172,6 +1172,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 		ep->curpacksize = ep->maxpacksize;
 	else
 		ep->curpacksize = maxsize;
+	maxsize = ep->curpacksize;
 
 	if (snd_usb_get_speed(chip->dev) != USB_SPEED_FULL) {
 		packs_per_ms = 8 >> ep->datainterval;
-- 
2.55.0.487.gaf234c4eb3-goog

