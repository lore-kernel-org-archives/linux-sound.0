Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DF18C2C
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784961243; cv=none; b=nj6p4QqeVnMGInKHZF7WX1EXBCh2QEJehj+YHvJAnBcWVrjfV78whUC+izgUdKxuafUR+joKJNGZFy1p2LVB3WAlVlvX31VLh5ON2C1BTOaVuOI95pfg8tlXbbCCUOZ83Leg22LGGeTv07+ETyoAmr7XHFEgb78Dz5T7OAgUcXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784961243; c=relaxed/simple;
	bh=2CuIyFlmlTCKetruRz+WQL/6YMIil/xnQAxE+O/pzVU=;
	h=From:Content-Type:Mime-Version:Date:Subject:Cc:To:Message-Id; b=IVhe1QxMdrNM1NXnuL+PQHpjitwL/leosicHJQ7S1+t5EFmvl7ySCXiG0KDl2hEPkN+HNvFZewBQxogYTSzORuVmPo0Bw8utyHxZeHMQPbIdHn+nBj0kRco6izxO1mTnXsFYntPildN3MenieKlCFWkxnf+gVBvKC4JZPsA0ToM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=LpnjVuK6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="LpnjVuK6"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso1765326a12.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1784961239; x=1785566039; darn=vger.kernel.org;
        h=message-id:to:cc:subject:date:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lc3raA/Jv90IvyEqvcrNAAJRAJ7K55sWI0QV7qWMXIQ=;
        b=LpnjVuK6iej0hKOEfJLIOzlUnNRPMQ9fc9nn1U7x7iUqQGj067C81a1AfkcFQXtD15
         psZykNNkEbJAkTzgumWfly/XVdzHtpCq4LHDhZt/fmkSDSCVmCQmX0n85Af0M/U+8Fhn
         ak2CDusngSsBht9+s09ZiBrGtV72X1NOjp0MIg2N+i+skIuF/TiSALOTj7fx/onCo62j
         +f40pWot7erZYKHrbMSVH1ahNV0VcLlt7eYCSUchghXY3FF6IDuvFjuR4rbKbThwlwT0
         c2yqZcknBDOXpWXaEVNUSu8stQM7Tqe7SsDBm5tWDg3rfa446zvLUzeKiYvYIurmrb3c
         yKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784961239; x=1785566039;
        h=message-id:to:cc:subject:date:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lc3raA/Jv90IvyEqvcrNAAJRAJ7K55sWI0QV7qWMXIQ=;
        b=geb8ZAEYi6uzrMf/QUZPInGV/xTvn2acvMyLSBs+lp17flcVZcfPun0HERHVIPv4ZU
         +5fqNedyujRZCh/QdytdTmUQxdf4+L1qE2osHPF9XvgHIldIbyMDk3QJyn6HuhAAB0Zy
         4tEgCzRZY9T3Vdy6J2GVPhacLY2TuUF+u0ppzblwfbyoVh8PZg//SC9JhNQZZQhXBdmr
         q6u7sRDHNgi1WwIgaIX+9YWN/6iCcY3hAdiXBM0t+6Z/ouRAzX20Ge7FjRwzwLzlrQPY
         LGoeHMFLOJHelnNUgD+Zr9APKKejtIzs//ld+TFC5mYn/A/ycFrdhk3sACz+UeDT5bvM
         CfkA==
X-Gm-Message-State: AOJu0Yy7TncMzazwikwd9ZIxxupfqwSIkJDUAmchSVKlqvABk5R58384
	HKPDqRtLhGZzCUb0tpEHte/NcGHgDuAMIT6ww3ugUCFAOukcLwmwiWJlAlNIiOsusrr8zYslsgN
	Nb41Eo4s=
X-Gm-Gg: AR+sD12diPc0pWp7QDiAiaStKyqR3AbctpJjLRyoABKpwLyC5zE9MImC392yBkQ/n5I
	oPOCBBkqYq95p+SfAst/iU5hDiCnojiVif1i+M2SdQPcdMDxS1Pj8tboPTbMltpxCsQg6TLVEZA
	VwK7QzSQ4qrnhbsHNUKxPFQj1Z/+UfzCUeQMdocyW/j18hkj1xHAus9GwCJDpXe/++P5GP3jZrN
	X4jv5LwWeW83/OoVWhXpH294zkALkVa5kEJesJVYx7jvOGJOe15UsNl4/OoSJrnc5simur7Fipx
	slfIoOhU6FW3z7mwu9AShWwmzWBF6qn/sJOnHXiyvSbp5Xt7EhHhKVCWWezvHi/hoeS8t0vBCQG
	F99JEaDhVobntiHEkZJ21Ye7tJ6pEmNfDbLLEQBenyrf+e8FEyXrG8bEkf6xg+8HNggXabzsI+u
	iDr2krtd3h3flG7hT0p4i83ttDTQlgGq9vDqGaEyEK4exR6FnoeYTZ8g3/Dq6u6BjlBWDbaEMsd
	afE3WsiJNJhVWJTI9RlRKzUSbYMmH5pvpGAypoYmuwBgsc=
X-Received: by 2002:a05:6402:1f10:b0:69a:a708:7051 with SMTP id 4fb4d7f45d1cf-69fc113fc0cmr396612a12.21.1784961238939;
        Fri, 24 Jul 2026 23:33:58 -0700 (PDT)
Received: from smtpclient.apple (83.10.16.193.ipv4.supernova.orange.pl. [83.10.16.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5958ea0sm579910a12.31.2026.07.24.23.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jul 2026 23:33:57 -0700 (PDT)
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
Date: Sat, 25 Jul 2026 08:33:45 +0200
Subject: [PATCH] ALSA: seq: Fix division by zero in initialize_timer()
Cc: Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
To: linux-sound@vger.kernel.org
Message-Id: <DF8A3844-AD5E-4B8A-9CFC-BD83C212BA38@doyensec.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)

A userspace-driven ALSA timer (SND_UTIMER) lets an unprivileged user set
the backing snd_timer's hardware resolution to an arbitrary 64-bit value
via SNDRV_TIMER_IOCTL_CREATE. snd_utimer_create() only rejects zero.

When such a timer is bound to a sequencer queue, initialize_timer()
computes the tick period as

	tmr->ticks =3D 1000000000 / (r * freq);

where r is that user-controlled resolution and freq is the sequencer
update rate in Hz, clamped to MIN_FREQUENCY..MAX_FREQUENCY (10..6250).
A resolution of 2^63 makes the 64-bit product r * freq wrap to zero for
any even freq, including DEFAULT_FREQUENCY (1000), so the division =
faults
with a divide-by-zero.

The division runs under tmr->lock with interrupts disabled, so the oops
leaves the spinlock held and hangs the CPU. It is reachable by an
unprivileged user with access to /dev/snd/timer and /dev/snd/seq.

  Oops: divide error: 0000 [#1] SMP KASAN PTI
  CPU: 7 UID: 1000 PID: 456 Comm: alsa_seq_utimer Not tainted 7.2.0-rc4+
  RIP: 0010:initialize_timer.constprop.0+0x20a/0x2d0
   snd_seq_timer_start+0x15e/0x2b0
   snd_seq_control_queue+0x56f/0xba0
   snd_seq_write+0x3e0/0x730

Reject an overflowing product with check_mul_overflow() and fall back to
a single tick, which also avoids feeding a wrapped-but-nonzero divisor
(e.g. 2^63 * 1000 mod 2^64 =3D=3D 0, or other resolutions wrapping to a =
small
value) into the period computation.

Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven =
timers")
Cc: <stable@vger.kernel.org>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
diff --git a/sound/core/seq/seq_timer.c b/sound/core/seq/seq_timer.c
index 419288eec4bb..7b671e270ef4 100644
--- a/sound/core/seq/seq_timer.c
+++ b/sound/core/seq/seq_timer.c
@@ -362,11 +362,10 @@ static int initialize_timer(struct snd_seq_timer =
*tmr)
 	tmr->ticks =3D 1;
 	if (!(t->hw.flags & SNDRV_TIMER_HW_SLAVE)) {
 		unsigned long r =3D snd_timer_resolution(tmr->timeri);
-		if (r) {
-			tmr->ticks =3D (unsigned int)(1000000000uL / (r =
* freq));
-			if (! tmr->ticks)
-				tmr->ticks =3D 1;
-		}
+		unsigned long den;
+
+		if (r && !check_mul_overflow(r, freq, &den))
+			tmr->ticks =3D max(1U, (unsigned =
int)(1000000000uL / den));
 	}
 	tmr->initialized =3D 1;
 	return 0;
--=20
2.55.0=
