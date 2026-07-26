Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1534918A6CF
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785052923; cv=none; b=i23YOw+uuGbwGREOZHeC7WDDhSzDhMTCLCHcNgvbm4TOR9ewSvC91/4B7bzDcMcorTjuz8ycGT6SsFsgTH0AyxLiW/0WcgU36YLORSQoJJxjfrOPEC7Q+9EGEOjZ4z54+6IIVJHAycOW2AjLfSdK38bkFmp94j/vcVYCuGFWT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785052923; c=relaxed/simple;
	bh=CZg3tfVfU6vFX7ksaybHLxDTRxaigw6WuQHqPXJV9cw=;
	h=From:Content-Type:Mime-Version:Date:Subject:Cc:To:Message-Id; b=edUGoQ4dfJtP9oDHW00wNHebT2bBz51srcZTE91fdxwjf8elABahF3KBuydjNhFrb7CAP7siDl81u/b6tK614DOqObLivJsHpxiPtDMRGUD5Uc/CSTJY93i0o2yeNCGo0o0AdeQqy3bbAqA+FWXlREx48Sc60MSUf4CciX+VMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=CTiIp0v9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="CTiIp0v9"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso2449883a12.0
        for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1785052919; x=1785657719; darn=vger.kernel.org;
        h=message-id:to:cc:subject:date:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QrhQ8oZKtoxbrQ3gHCQluy7mPK2e62qeBdhvjYYjz4w=;
        b=CTiIp0v9wWxnEA9bzPEgwmG/lnYWDRRu8erg5r/ib1Rg4ND6HRgWFrCjr9Ddqz27az
         V6OzhfrSaAjBsHVb+MRqw5XUgPEAaNDKQ85NUracAobqI2Zeu2vleX/HcG7LpYxHAmaH
         yY1lyKW4IFfYpDQJ6hzdEDK8+xkL0KRQlFj7dlxxWl6vD+tDod1sUNN+Vnx3wh0uoQmu
         6buMbqyIQmAQGtTUKQort2OhApMYn+LkSYoSvI6BUosw4oRQC9RZEshZz1VN/tLNTjl+
         bbrKjp8PXu8uH+7DG2PLkLmTdrEaSNQ618hRcow4Z3CtzhNCGut8PzjFKxhHeqkncJYJ
         nbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785052919; x=1785657719;
        h=message-id:to:cc:subject:date:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrhQ8oZKtoxbrQ3gHCQluy7mPK2e62qeBdhvjYYjz4w=;
        b=AKgkR+IwJ3iNCuNrjPZRejASR+tDEU+FSLMI5W2xBfq9evlnwvkqx1xE0pPLU7qRgE
         b413cJzIpAOWwJp2wdNv+tP2EI+5Kx2fDkkA23UMjlQXpE2J2WNnxDQLFdi2IvqDrXiR
         73p9gbMmy60ZYdEYgDjBEOWAmepEVl/IOfvehXixvk6Kl2WAvfVpVhAtHQuJuWpdiK1C
         VPMn6iB6JowWrfs+rx2DhqnK9waY3JnzdMrV6n22+eGYK2NzPZ3KVu/X2GUQpwSPgFuo
         +PRHhmuVrmtZEosYZwJYkzpbepHKwh6NX6oTCZayEgeJ63g03e/awOWOE4Agz7VKnWfu
         7pyA==
X-Gm-Message-State: AOJu0YzA2fXFBG8Dxjgvi3OXaaQCM18ECfDh8yYnzaVEjLcKKsC+MMhd
	W+FKF6FQdcPWP9VPrw7wMi06u1BaWoCQn1HP1u2kwNz4gxHZSD/1xdqYu1mAQgoLV/BmWHyZz84
	spvbHRN0=
X-Gm-Gg: AR+sD11HVV7dh8vN27LY2hq9OxIeRu4mibuFgUYNsbkV3eu8138byXRxDR2QthBEoFd
	9OM10MaHgSKxmbRNFCA6n2+VKEA1Dp4Mv0fpSXUaGd61L+g3DUOsTi2ckKKZsJAvuU309ozFhHo
	WycKDX8xdSEzPJw2zYY78l1JxctgVxWTaQnXqyRQ44D8D/AMpbzIop2BnItMabUGuzJEW8uqf0s
	inLu4ZoFQEFvhgHBL4pcYu3HYnjpcBWmFQ9dKzCnKRs9HPvLMB0Dbz9d02XAv/QsEo2tSkwrM1m
	T9G/eOsEYANFZQlw6NzKU0i7KmWoWFQs9ovhprYlr78VR+0EG8058pH/VAz2BIJamFy4+OwhWvX
	9TOn0XlCevvqJD4CkWJgwiqFKFkxdbb1/6mpk5sdbXHJoiaM1ZLhAQH2lw5om9plBaoZG2zJw8p
	CFsgJxc2zjnY7uLwHibXg9/OdddXjOhRwl/y3BlrlssgweHCBz/kVu0YH3KG5c/Y40G9u976uAw
	RGp0Ztvo4K5Bo9F/ngWRWtuacjyyoGw/6k4ZlgDuzhETtyOtJRFibk+kw==
X-Received: by 2002:a17:907:26ca:b0:c1c:6f0c:86f3 with SMTP id a640c23a62f3a-c1f1e9f97bfmr166307766b.7.1785052918984;
        Sun, 26 Jul 2026 01:01:58 -0700 (PDT)
Received: from smtpclient.apple (83.10.16.193.ipv4.supernova.orange.pl. [83.10.16.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c4bsm524285266b.18.2026.07.26.01.01.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 01:01:57 -0700 (PDT)
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
Date: Sun, 26 Jul 2026 10:01:45 +0200
Subject: [PATCH] ALSA: timer: Clear SNDRV_TIMER_IFLG_DEAD once the close
 completes
Cc: Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>
To: linux-sound@vger.kernel.org
Message-Id: <CA41AA48-75BF-45E9-A36D-3A5D2F124F60@doyensec.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)

snd_timer_close_locked() marks an instance with SNDRV_TIMER_IFLG_DEAD
and returns early when the flag is already set, but the flag is never
cleared again.  A completed close ends in remove_slave_links(), which
leaves timeri->timer NULL, so a second close is already harmless through
the timer =3D=3D NULL path; the early return can only be reached by an
instance that was opened again in between.  For such an instance the
close unlinks nothing, so snd_timer_instance_free() frees an object that
is still on timer->open_list_head, still on snd_timer_master_list if it
was opened with a slave key, still owns any adopted slaves, and still
holds its timer and module references.

snd_seq_timer_open() reopens an instance exactly like that: it retries
its fallback open on the same object after a failure that has already
run snd_timer_close_locked() internally.  An unprivileged user with
access to /dev/snd/timer and /dev/snd/seq can force that failure, since
snd_timer_check_master() returns -EBUSY when a pending slave matches the
new master's (slave_class, slave_id) key and the target timer has
reached max_instances, and SNDRV_TIMER_IOCTL_SELECT with dev_class =3D
SNDRV_TIMER_CLASS_SLAVE keeps the caller-supplied dev_sclass, so a
sequencer queue's key can be forged.  The freed instance is afterwards
dereferenced by any further snd_timer_open() on that timer, by
snd_timer_check_slave(), and by /proc/asound/timers, which faults on the
stale ti->owner pointer.

The flag only has to be visible while the close is in progress, which is
all its other users need.  Clear it in remove_slave_links(), under the
same timer->lock that sets it, once the instance is off every list.

Fixes: da3039e91d1f ("ALSA: timer: Forcibly close timer instances at =
closing")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 07ef127b29e1..9407954034cf 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -458,6 +458,8 @@ static void remove_slave_links(struct =
snd_timer_instance *timeri,
 		list_del_init(&slave->ack_list);
 		list_del_init(&slave->active_list);
 	}
+	/* the close is done; a reopen must not see the mark */
+	timeri->flags &=3D ~SNDRV_TIMER_IFLG_DEAD;
 }
=20
 /*
--=20
2.55.0=
