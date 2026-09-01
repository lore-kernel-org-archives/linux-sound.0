Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039C1479881
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254008; cv=none; b=dOQ6JgJlPUN4OZbZMDxthsQMJKA70F1SQKb3jL5GoQnqJBMHdilXF97qOMqxuHfaaUBEitAmKgBveQwNyCxJ9bZYrU/qMZFIEzMe+xBkmFnyWT0bspDx8trTMjnE1q7n43bAmu7rwjo7MXhJmkJNh1K0hxFQbQvYlx6af2c4Hd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254008; c=relaxed/simple;
	bh=5TXH4LC7ZsK53s8hTAxjUirx2sEYY+ExHWiOtAZax1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rFXVwtmg0xwjTjC+jwKA8hEVHBdls3Qn1dc6/NXb6woyfBrYHAt/0Une1az3nsdCNMPOeH+b8QnRgp5mlFU56bgN+DH+xFE90uTCdPPaRI9Pe2UVMkqB/Ofnc+HNyB40PWhHbnoM3lakBHlOOZ2zz9scl4x9LxNMS3w2f3OfC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTVC+N+l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTVC+N+l"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso8566195e9.2
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254005; x=1788858805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6/zRLtsUSMddk2IzAgWLfFXWAC9OmiNCU9k76PvNK4=;
        b=KTVC+N+lmN5KJcwrfqShoqBht30i/ldO42Hk4YXOyFEqc7l1KbwfwvGTc6tJGWzxO/
         HrCw8k/KeaFULbtM/AuRJ260xcvBXFyC52LL+fxiE5+iN9C4mekdHDFze7kWZn+jeu2W
         5bYpQM2sjkVWGAVelCuieVBmilz5n0PkTHYH7EKq2Icrk9347KORMEDHQd6n42MGmxMH
         ZvGnpLp79fDyNrSYFhfB0GgR29y7lKY89kjP0iXQFby6PBJQDK/7o94Luht7AwGXytrE
         Lf84/g3tpsZM3JzfB6K6c5OrLQWKzSilpWBqwjmeVYRqfUFINhaWs96RkegcHDfhL210
         4POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254005; x=1788858805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6/zRLtsUSMddk2IzAgWLfFXWAC9OmiNCU9k76PvNK4=;
        b=h9NgAHaly9dO74DvCdacw9fR50rGDPsisdY9yEhCTFX8F7V2jLAVcI1epSYjAAtz78
         vcbA2rOxWTqI+ynBnxylE+J5mXQ9NIwEVHMC3n8X5b2uv/IKSDBsKPuxjeqcoOBxNiyt
         DI4TrDvNbaw2OLanrq+MfS6I1Fxkvt+bFyy/QR4e87ICFgW40EcFjsMOyX84KEsXgDz8
         gwABc0YnyMSq7v2L0oZUQFWND5jm0PgMU+aJRWL2AV+K5rw2tk3ocT4lA/FAqoANbKgJ
         kWOcdCRr4I56/cliVZ8NjO9lRN6BH21qaRbf8rZEZC6XDEhwehQkQ2+aL++NKeu8Q8nf
         +tGw==
X-Forwarded-Encrypted: i=1; AHgh+RpU630d+gnqGnuPW8wtXa34j+37aySQD1EuOelkzBClZeJ80+mjByQ2GCxTKh1VDx5YBn++Jryph76XdA==@vger.kernel.org
X-Gm-Message-State: AFuF++mA/bF3cL2cnc9VecoYYkTQHNk6XBqYz8r27obTEiocSfUHatAG
	4pJCbJy0XabjRnnE9HKzAo+dE8sZq7C4YvbGeVfE2aftGHoSKQSjffo/
X-Gm-Gg: AR+sD125rw3xpCN/FD0ixrOQD/+nD4rASoY7C5+bNIOjhP34JJsdaWOBtewahHUQrRr
	G6rsdPGyjAPgqLB3jz1/fGa/fsMQGLytuFvNKkWKGa8wFO9Mi+ECbTfzG/H1WWSrn3jT2XECwdo
	KKWON9n3hgNnUcZLWFBwIvzD1qpehXj16RJp1CDm0k+EGrlONiXs4jS55bxru5htFn8qyPycbho
	SfJSkHeXnhYrHpJCov8ec9ApxjkMDFwvElBbW0w1WKCDdJSzWKqb6AiuMSXH1VI+cqw4peYDJCG
	taWQru4LY6w3vbq0WAyQ9pZjzj04Mldj9MOFeKotSazuxQ6AI1EjPE0EDI0ZAOf9gBoLkOWhgpO
	JoamRsq8HafL8teSb8byP/4g9zrgkMaWMfFt4hrqeVAMjxcHBbaBf1c5ricMrVJXd2c7hQKd+Cm
	ZXfTrE/YeUMtseA49rA5swL3fR5eHY0i/jKZHbQupqGHX6mCx9nuMF/o7/92YMa0HXfYMYxguyo
	TIB1RnknuQdN3p8QRCbD/6a5J2H/xqtOuVmGDFjlvriW1wrNPR//4NbTPrYnd07/GKwZ6IvaGgN
	jvGp+LZcesYSieOZxZFn5E8SALlMxb3F1qOGpeOCbMwmgWxThug/k+v38wvxfkdEqXFDusPfQrc
	tDQ==
X-Received: by 2002:a05:600c:3b2a:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cdc57d1d1mr105123535e9.16.1788254004957;
        Tue, 01 Sep 2026 02:13:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d781bcsm3378291f8f.26.2026.09.01.02.13.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 02:13:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6.1.y 1/2] ALSA: aloop: Fix racy access at PCM trigger
Date: Tue,  1 Sep 2026 11:13:01 +0200
Message-Id: <20260901091302.66860-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901091302.66860-1-kmehltretter@gmail.com>
References: <2026050445-connector-rebuff-f713@gregkh>
 <20260901091302.66860-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 826af7fa62e347464b1b4e0ba2fe19a92438084f ]

The PCM trigger callback of aloop driver tries to check the PCM state
and stop the stream of the tied substream in the corresponding cable.
Since both check and stop operations are performed outside the cable
lock, this may result in UAF when a program attempts to trigger
frequently while opening/closing the tied stream, as spotted by
fuzzers.

For addressing the UAF, this patch changes two things:
- It covers the most of code in loopback_check_format() with
  cable->lock spinlock, and add the proper NULL checks.  This avoids
  already some racy accesses.
- In addition, now we try to check the state of the capture PCM stream
  that may be stopped in this function, which was the major pain point
  leading to UAF.

Reported-by: syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/69783ba1.050a0220.c9109.0011.GAE@google.com
Cc: <stable@vger.kernel.org>
Link: https://patch.msgid.link/20260203141003.116584-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[ Karl Mehltretter: dropped the access-mode comparison and notification
  (462494565c27, e299a9fd433f, cdac6e1f7164). ]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 sound/drivers/aloop.c | 58 +++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index a38e602b4fc60..67bbadcec02b0 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -319,35 +319,41 @@ static int loopback_snd_timer_close_cable(struct loopback_pcm *dpcm)
 
 static int loopback_check_format(struct loopback_cable *cable, int stream)
 {
+	struct loopback_pcm *dpcm_play, *dpcm_capt;
 	struct snd_pcm_runtime *runtime, *cruntime;
 	struct loopback_setup *setup;
 	struct snd_card *card;
+	bool stop_capture = false;
 	int check;
 
-	if (cable->valid != CABLE_VALID_BOTH) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			goto __notify;
-		return 0;
-	}
-	runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-	cruntime = cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-							substream->runtime;
-	check = runtime->format != cruntime->format ||
-		runtime->rate != cruntime->rate ||
-		runtime->channels != cruntime->channels;
-	if (!check)
-		return 0;
-	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
-		return -EIO;
-	} else {
-		snd_pcm_stop(cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-					substream, SNDRV_PCM_STATE_DRAINING);
-	      __notify:
-		runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-		setup = get_setup(cable->streams[SNDRV_PCM_STREAM_PLAYBACK]);
-		card = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->loopback->card;
+	scoped_guard(spinlock_irqsave, &cable->lock) {
+		dpcm_play = cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
+		dpcm_capt = cable->streams[SNDRV_PCM_STREAM_CAPTURE];
+
+		if (cable->valid != CABLE_VALID_BOTH) {
+			if (stream == SNDRV_PCM_STREAM_CAPTURE || !dpcm_play)
+				return 0;
+		} else {
+			if (!dpcm_play || !dpcm_capt)
+				return -EIO;
+			runtime = dpcm_play->substream->runtime;
+			cruntime = dpcm_capt->substream->runtime;
+			if (!runtime || !cruntime)
+				return -EIO;
+			check = runtime->format != cruntime->format ||
+				runtime->rate != cruntime->rate ||
+				runtime->channels != cruntime->channels;
+			if (!check)
+				return 0;
+			if (stream == SNDRV_PCM_STREAM_CAPTURE)
+				return -EIO;
+			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING)
+				stop_capture = true;
+		}
+
+		setup = get_setup(dpcm_play);
+		card = dpcm_play->loopback->card;
+		runtime = dpcm_play->substream->runtime;
 		if (setup->format != runtime->format) {
 			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 							&setup->format_id);
@@ -364,6 +370,10 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 			setup->channels = runtime->channels;
 		}
 	}
+
+	if (stop_capture)
+		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
+
 	return 0;
 }
 
-- 
2.53.0
