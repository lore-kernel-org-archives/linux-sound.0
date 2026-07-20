Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D183AFD00
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531410; cv=none; b=W8NkvXbS+y22780sjZZDKfkQvlXMYq4sjORGJ8Tzmf4sFuvZdyKJyLck0bv2lHgoMrQGhnR/Av1kklpSkaWD7rtqozFGMMd831Vj2j1vHXOvCOi3/vPT5K2YfZYzcf/FFejeq/MxLl4SDET00gDPENIUnHQD8i6G7jVfBP8pz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531410; c=relaxed/simple;
	bh=hqfg6so42unj8zmnIxXebCj+aQ0vMQuAF4mF9mpk7do=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=jCwvw+X+CvtSEErnQ0BwxZUT5XL3CwV7p5iRpSf+9QI9HGmaLAyGMj10Y/SlT9MEdyyWHJsDYwITPko4SDIrAnj8/e+cq6C2VscpQ8FYWqJuM2a59rYp85ENK/wsGlBN7bvW6sBD/3JOUiX9haHUchjJoCJE1nDbQUb6uAT1jdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=KkZVambK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="KkZVambK"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso6627053a12.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1784531407; x=1785136207; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oi3ZbPnlHwU9DFLUJTGqO6dU9swUKcGZ3/fvMYOPSZE=;
        b=KkZVambKM85yD2P6EjUDMGguAmY/lwqSa+eHk0NjdFH6uSCpXNjo5GzyANBWlIUY+A
         4rXvSX093fSinAh4vjf2ayDZmXOUy9LhWT5cvdUkk1r2brjjy7rkYwnoxh3vXKi1X04u
         6oemfi8MQz/Fl3RhzHPFsaG36XTcTqcVVN4hL2JJe3qM+2EfHU/E/Z2YQzYkDDxiRA4C
         iA+/ZLD5q4nHLveD9kbqbljXbVYu3ZHeoCAnvx8ebeLz6ukcans6ooMFhdUMrVdMcbrd
         ALRyMp8fPNWZW549/f5TzNS0daMJ1wGueyM8wges+vNHROQwkwynB57fzpBqTyZRcWxR
         5Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784531407; x=1785136207;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oi3ZbPnlHwU9DFLUJTGqO6dU9swUKcGZ3/fvMYOPSZE=;
        b=ip6Z9YE7UsDoaHuYB5VSwpCSjsE1Q3Wj92rv+KgGw3DjhAikpiqHXREibjfTp1jlC5
         RXtALYdGk062+mHlNgZ917Pu2zoPPaHKWr0rqbfTNPgaYaU71I/hFxBKw8zsbka3BUl2
         PxVcJTs/keHtmVFCN6Nv5Jpb4SMVMGOiIi9yqAaYU1F4u36ZvMAIKRAoyC6+gZaSzTya
         SAFiziK9f6YW8DvmC2VyZr8OP5RYc5S8z7BgmmbA0UUOrLHHA25c7RucmVv2AJ63NCE3
         TcO3yTNnY3kE0V5LLpqiWB649wQRxuKDRHc5F2Yl9YGI4exJDabuoMsQ3023sywlXxB2
         syxw==
X-Gm-Message-State: AOJu0YxKd5VYAtpX6mSsAsW0VWxbZ/nPtRqnWaijQtxgb/w+no+ia2bU
	Q/pqcONdAxKm3v5MHdK5z80cF7NSQyZDcuk3i3gceQWpjOoDhSz09TsmuFQZo0Q5cGX7fWnIY5u
	F2cPsHAGUyw==
X-Gm-Gg: AfdE7cmYYDidfHPJ4HKM0itCIWv2KIVBksuihAufJB+8W3i1MAZDf8LGKwPm+wXVgJ2
	I6pkmnbJX9fUbM3oIkTB/l2ajt6xNUX04KhUWd/DPEM/h0ADvpZZYhhjCnNDBezsC8xdmj47fRk
	DdF3MVFaqJ+AGE87Gjrn2fdwWbenqIy7/lfdrjZsEV3d5mrfPUoZcUsDmCJTthMjiG31R567pae
	WwepsYQIcpEaUiGNYhzm9Nd+ubsDtojrQaeMgsfZpSpTnSyfXqJ2qJNQHzlyEAJ5/fygHq53Lcq
	GqitGY4RyRCPvaMdgckyiM4lm2novn9hifqcrK4wVknHljKY1O6VV1SIQaeu+4Z1nCHKzni0V/A
	8dvnCQ8ocxJANWE1xMmFc+l3DJI+cj15YsBrdS/j9tga9vf5PJx7ZA4Ayran+SSgO5La3q4vTC0
	QReLdaEAyUWDbmKfV4Pm4XrAZlpsKE9GKuAxbQ3DI6AosVT3Y07/JnW0Yf9WdlxJ43xeJMHha59
	EyWkR8VAHsVgojnKeFiuzV1qNBVttyb2F/tTt93zdMA9YI=
X-Received: by 2002:a17:907:bd84:b0:c0e:883e:e4f2 with SMTP id a640c23a62f3a-c16b4856ffcmr415917366b.30.1784531406928;
        Mon, 20 Jul 2026 00:10:06 -0700 (PDT)
Received: from smtpclient.apple (83.10.38.128.ipv4.supernova.orange.pl. [83.10.38.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf638asm417482966b.59.2026.07.20.00.10.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 00:10:06 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: [PATCH 1/2] ALSA: timer: don't re-enter an instance callback that is
 still running
Message-Id: <6F9B6501-8E65-4265-B02C-7EFB240D1664@doyensec.com>
Date: Mon, 20 Jul 2026 09:09:55 +0200
Cc: linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81.1.4)

The userspace-driven timer (utimer) TRIGGER ioctl calls
snd_timer_interrupt() directly with no serialization, so two threads
triggering the same utimer can run snd_timer_interrupt() on one
snd_timer concurrently.

snd_timer_process_callbacks() drops timer->lock around each instance
callback and marks the in-flight callback with the single
SNDRV_TIMER_IFLG_CALLBACK bit; snd_timer_close_locked() waits on that
bit to drain an in-flight callback before freeing the instance. The bit
cannot represent two concurrent callbacks: when a second interrupt
re-queues an instance whose callback is still running, both run at once,
the first to finish clears the bit, and the close-path drain then frees
the instance (and its callback_data) while the other callback is still
live - a use-after-free reachable by any user able to open
/dev/snd/timer, both via a user timer instance and via a sequencer queue
timer bound to the utimer.

snd_timer_interrupt() sets IFLG_CALLBACK before dropping timer->lock, so
a concurrent interrupt already observes it under the lock. Skip
re-queuing an instance (and its slaves) to the ack/sack list while its
callback is in flight; the accumulated pticks are delivered on the next
tick, so no event is lost.

Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven =
timers")
Cc: <stable@vger.kernel.org>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
 sound/core/timer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -927,12 +927,15 @@ void snd_timer_interrupt(struct snd_timer * timer, =
unsigned long ticks_left)
 			ack_list_head =3D &timer->ack_list_head;
 		else
 			ack_list_head =3D &timer->sack_list_head;
-		if (list_empty(&ti->ack_list))
+		/* don't requeue an instance whose callback is still =
running */
+		if (list_empty(&ti->ack_list) &&
+		    !(ti->flags & SNDRV_TIMER_IFLG_CALLBACK))
 			list_add_tail(&ti->ack_list, ack_list_head);
 		list_for_each_entry(ts, &ti->slave_active_head, =
active_list) {
 			ts->pticks =3D ti->pticks;
 			ts->resolution =3D resolution;
-			if (list_empty(&ts->ack_list))
+			if (list_empty(&ts->ack_list) &&
+			    !(ts->flags & SNDRV_TIMER_IFLG_CALLBACK))
 				list_add_tail(&ts->ack_list, =
ack_list_head);
 		}
 	}
--
2.55.0=
