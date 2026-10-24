Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860603;
	b=ZEzVwTe21ADxO1/ksSDR5xbON8eQyxIwLZmYFS2k9J/pqdNs3KDdk4sy0DwgT3adCbKq
	 YRZUAFyrKuOqk3B6QFWf8FyZedkaOgczifL3vyslu4ioa+0JYIK9QHdcFSaCuNG0mt3kg
	 rbdwwDjvE0hpwgSl4JjufY8FV5FS/+kY4iq55R3FLZ9cwIdGM6qprIfxcdqHognO29yYg
	 0yPl/bd/dm7aB6z8Tadwhz8y13DA6Ymez1CWlMj/oMZLbmgW3SpiLnrMauLotZ44+hzHz
	 RJsUJlNq00KgtJnLT6sg5YfHAzz865fctR84R8jmyBPe2+fDsKYPWlxCVrjJrCDSmOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
	b=5a8rfWtRGgyqbQkPn0n7Qu6ac4drgZqrbfwFUFV6BNwJwmKVQFS5RGIwteIp23aaMx7B
	 s3S79FVvdVFgraSgZ13y8LtQcKPGKIIaDxRhnMSMXg6MGNDROn5SXlr3T0rePPQxOB3Zw
	 ZkuOVIM6aNo98KRvEIFK/UXhoSoxkCZWRMD7yqXWgHKRewALPMIePX5evLw3q9x04PXgb
	 6Rw5ouwQtvBoFECfuteVLc230YLcZPyJbLlDcNHzp2ibNK6zJPRcnTjKEBTzuYbnYOGzG
	 7HgZKMdE3Se96pmQchH+0lOKQ4oOi7IWmHyzLl3qf38PdHfH4mV977SrPY52x2a5QAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCxts6NI;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6C1606A323
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 16:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD6C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCxts6NI
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso624053a12.2
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792860602; x=1793465402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=GCxts6NIssk3Bvl/vgqAdT+sii2KOLbdMtx5vBmdg1qBMSwmEzn7HgKd78JvZWMH7G
         xWUy+dsukPRRvEYux5LFPBkIb3x3D0FNPgPVZdCnbyO6rRDa4BPvFkKVfPzj3P2frdH4
         muxAg3SCAga5aJNBOJxcHMWqKEklsdAQItNImQaB4zfPPheN/s4R0ECO7hKpejjKOmZq
         TPCZBjI3JjufwsQNDLrxWnfREn8vyTjk0jOlUhGiSll0o9W1lGiTosdaOFpSDuHG0cfm
         wJZDwsD2obLjEpXEMm355N+j1OZOQjGoadIlF2YvU1CDWBIOsCCCByC4J8TI4Rb5lqSJ
         6Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860602; x=1793465402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=ZUjO1HvI3Wm4IioO/kKrWt03gAs9wm1s2Npr779Zqu7+QAlplIuowY+QbPUwXKxVxi
         HtWrFOeAfwdZ85IjYPqPk8deitSgKjMNPe1Bh+epP938l/088e6Ikr51rlPcS5ttvaK1
         SIt9JFVFPwz6MKkdxUxPZIvjkKtKY9xZmMJb8P87FybR7qAQ8v6MwfNYoqHldDSuufnY
         XaxCWARbu8ICXVT1ciV5N4vJVGf0Wj6na4ri+ly/dLY8NrU0qJkMLz+FfQXX9eir1x5z
         oj+ygneOjZ4T90Hwpn0RJrZnQHEEhNHlXEa1LUocDn2DcY1LajCI0jVbavbjIwauZGYQ
         TBeA==
X-Gm-Message-State: AFq9FYIcTxHRbwFsNShiv6eeYaTOkI5AroKd7omN8wZdY3ofEWVGkILA
	kvxaE6dE7BI8stkxrTAG/pB+E6cVyfqZM0LBzy5uEAr+M5HII/z8V059
X-Gm-Gg: AYBFou0ZDrvh5FcVibyMiY0PG7u5wol9/smRednMQliRttWbGccS5NoVoF2np2VdPkd
	a2xjSIiPtbGDPGoddFpJuXg58QrCrKJOlLcMi66AOfqL6Q+r/UVApkUzX83YFPpW4CSR91STUgE
	0rAJqa5Q2LaVcrV5PMyOAv2+vVTWks7wMrg1LuZqikM13No5tV0Q6zoQqPZJHBWFeXPahRKpLfr
	upl59mlqK15IZaY2VxCL0rA2x2c5qmj74SOY8b5GzfCN2rHygThQ7lxs+2P4lfKSKY7/okJJIfh
	e3QJETY+uM7fwSuflwk/B9Jb6rCqi7ys3g8KvBieiYTcZk4e2IrXMnnX73iL7khOYgi8Dp0Zi8m
	sVPIM/aTtW40BDckx+KzoaJGAJXuV25I/qWQQ9JpOFb1VXmr/VXkMGWquiGtgXh1njB1+RRBUnB
	wOwWeA+ABKoTU+KDbTLsvKJXAvjWNJM3pIxwwrDYznYkLbJwS6vQIM10/YilUKvSXImE+SA13nv
	g+Rt2Ku7ux4p1A+s65P+mX4HSJWja3xUJCuzJSVrqaDkQ0nnAA=
X-Received: by 2002:a17:90a:e705:b0:3ac:a11a:7c7f with SMTP id 98e67ed59e1d1-3adeafa85b6mr2034413a91.23.1792860602000;
        Sat, 24 Oct 2026 09:50:02 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm3406683a91.12.2026.10.24.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:50:01 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 1/3] ALSA: opl3: Initialize the timer before publishing a sequencer port
Date: Sun, 25 Oct 2026 00:49:49 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
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

snd_opl3_seq_probe() initializes the delayed-note timer and its lock
after snd_opl3_synth_create_port() has made the native port reachable.
A direct NOTEON does not require a subscription, and a fixed-duration
instrument makes it enter snd_opl3_start_timer().

On sequencer-driver rebind, the card-owned instrument bank remains
available. An event delivered as soon as the port appears can race the
late initialization:

  Sequencer driver probe             Direct NOTEON
  ----------------------             -------------
  snd_opl3_synth_create_port()
    snd_seq_event_port_attach()
      publish port
                                     snd_opl3_synth_event_input()
                                       snd_opl3_note_on()
                                         snd_opl3_start_timer()
                                           use tlist and sys_timer_lock
  timer_setup(tlist)
  spin_lock_init(sys_timer_lock)
  sys_timer_status = 0

Initialize the timer, its lock and its status before creating the client
and attaching either port. No event can then reach partially initialized
timer state or have its newly armed timer reinitialized by the probe.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_seq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index b77d8e8f12fb..2bacefc3201d 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -214,6 +214,11 @@ static int snd_opl3_seq_probe(struct snd_seq_device *dev)
 
 	spin_lock_init(&opl3->voice_lock);
 
+	/* Initialize the timer before an attached port can receive events. */
+	timer_setup(&opl3->tlist, snd_opl3_timer_func, 0);
+	spin_lock_init(&opl3->sys_timer_lock);
+	opl3->sys_timer_status = 0;
+
 	opl3->seq_client = -1;
 
 	/* allocate new client */
@@ -232,11 +237,6 @@ static int snd_opl3_seq_probe(struct snd_seq_device *dev)
 		return err;
 	}
 
-	/* setup system timer */
-	timer_setup(&opl3->tlist, snd_opl3_timer_func, 0);
-	spin_lock_init(&opl3->sys_timer_lock);
-	opl3->sys_timer_status = 0;
-
 #if IS_ENABLED(CONFIG_SND_SEQUENCER_OSS)
 	snd_opl3_init_seq_oss(opl3, name);
 #endif
-- 
2.43.0


