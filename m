Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823457;
	b=np62zJqc6fgvTicpMCxembLVIe/9GDLgcZ42sONwA91Y+EAyGmLG51YHDRZB8pFQNlxk
	 FaTLHk1G36b8uzUgfvWVyjTeoJ/d/EOY4/Noko+zuNYWjIszcwkVUDwpR4iKqjFc39A1I
	 wQM44db+TQ8up5FN5wOXKqyW0kjodW4x8Qa/kK+cLEp6zR38azueNrY8cRZWtq3XCxpzB
	 tBHL5cnHIjAdidekLAADTR5wali00/d6XoWM0SV5FoC04F+sm028wnurt9+VtKORkZbo8
	 BF1v1pwzxhCcn9M7oTN80Fku7uEVVwslD6A/P4lafsZrwroLYSIaT9EKXuKRg3VFwfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
	b=EPi8nw5Mh07+OzUGb9i6lhvzPnQl2c1/ooWwqrms4/OOEmBuklG/JwmLIh2t8eygMWMZ
	 bo/yOQIP5qVqWS63qYEQlLEUEO2p9a+iAojWuU3gtUzz6R1ILXF1tHj1znA7TuBbDiqW7
	 7Zi2PRXk8p3rxwnxQ57NNpP2ziNstGNcBEiIx7LdhB1Ie3wFZrAIg97QMhtxi6kRDNBzE
	 M9Ga7eJH95oNst2eNIXst53Q0PrOPJ43heJMt8zv9HRHTA+UisBhvQMAPHyxHOhVwpmJc
	 NOyu/K6ItX+iOdJf+wu56iJZSX6Z86+PGVIFZaThnBISBx9asZ1Q33QTtvqOrjL7tdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WvTzDzFp;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E21606A320
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 06:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E21606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WvTzDzFp
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1879663a91.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 23:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823456; x=1793428256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=WvTzDzFpwJXxsq73z1oDVR/CZx+PqdwKkp0nA6/X9dnDZyJ22GmjPVxB7pSgJsDDpB
         G28R2HCAbxzYfFj/aP6AH3IrGweRuknoh5sq8Y9/XOSjaEVVbvSf7hEjorUUzKTx7COL
         ZWC6SKp1eq4UH6qUd6uuemlcFzwSt1KWai7l0qMWnKhLuILaErlQyUY6S3+1KqquV4ku
         /c00zuqPbIGKYQJSP8pa6T3XU93RA3Suiocdfq5H9cWerRyzWlDfx7T3UUn+Eo5Djk52
         oNNAq/vHZ5rLQLUZG4NsS2VCTrd0MqSamTLURPTv6kIyMuGs/G5EK9azvh/i/BbXIsAR
         vSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823456; x=1793428256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=g1KRD/AYV8/rQX7lp6Fs8N2qvhaCCVKNlByyihVhcnMRXCwCkyHLxCKkt5G5nD218H
         xUdk6vySBrizL0cQnuThRwmkEP3AfcEMxvWHkj+JxCElxFtHdn6lh/hOwFBD51+hBX+6
         RWOXiLb4ctg3qxwTErrnzux9GGUf2Vl0xMkCaO9mpLiMT6afU/4CfQzZXihOLa0ZQzBu
         KMIknEjU51oNHtvUpEW5CQJt13QQsq9ty/47wKTqp4Wm9YV4UJ18T0nRwdcqUV/jV23n
         5Ld/vGPavgpeOYMP/3sKSJAKJc/i8o9ZWGpvNfrtBSyKwN2BqMRQnsK6VoVlQKsftnc4
         1ujA==
X-Gm-Message-State: AFq9FYIKsQlW85uP7SoJtWFgf9HVu608u8I4C2I1eYQXU6iprfAYDn7V
	ehIb8FLekrg8OtjulVuh9mtTi3jf3KdAO62Q2OZPvhC+pVFmxlo0oYz2
X-Gm-Gg: AYBFou1k49yoPJL9cywVUjFCrt/M6JyWhIT9mJVC3xuL8aYJluwhe+jr60m/gmCMEbd
	Ty1YjI4VflqyZiwQBMuxDa6lOJFZfxI6tch0/HTKmKQZhszLBIGIXlTlqym8IQLu/mD+cFCymJG
	oXPl/I4pMaLDnlFmZz9PHIfrPZLx+nOgLqsaQC8uLBr0GqpszoJL19vVHSTusyG4/SoueICIfiM
	Ka10NN05WvBvpjURJcNjUzz3bftw4SOEiwISjg3cvOthl6HW0dObZ0TQnsN5X/M/P4XcQWOnnTq
	il9i3GCC5LLOXYpmGXqDBjq/EfVPtwLD0byotthNAxeHMaTTmQm8Bo1hRATmEYZHqGSLeVc1Hef
	lIbXbtc3ffJ2MN3ze7vqLEpLfpNDGAmvDIhU6ieaJtUWv1MbRwuKoFNtOah2TIp2/tyyJ24K7S4
	34bATaT04jJ+cQiOwKbmmBUHLYVYHHceyfRSO+32LE4/e+fC13D0nZgeIhTT4qQfWUGQPvdkKh5
	lV7stB4rQYdfdfI8pex4GuAt05Far5odNhNU3W9z66pxrlSIkc=
X-Received: by 2002:a17:90b:3852:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3adeaface72mr1329537a91.55.1792823456015;
        Fri, 23 Oct 2026 23:30:56 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm1248371a91.2.2026.10.23.23.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:30:55 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 1/3] ALSA: opl3: Initialize the timer before publishing a sequencer port
Date: Sat, 24 Oct 2026 14:30:43 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
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


