Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680788;
	b=ClWBIaVYea3vGaikFsANor4NOGzYr2CNmbx2/Cx6nI9hb911MqdmtzjfJTrgiBdk4Im9
	 eCnVbEjplfXCJtN5QdX9+I+doc7gfuOnC3/Zew5ZYIKWq+9R2+1BLKoMFVoGZtL6gEliK
	 i/Q7v5RFsOqo2scG4g2bQs7+ZPIH85H858JxIpUp+4ZOExh4LbrPxhGexN+wz29uSNQ1X
	 P8Rr9MSdbsy5HnBi1hCdapyzrCEVcNQ0Mxso1b8c3hC07xuBXFmxFgs+BA/qysVX/5JKW
	 VyZIGY7fGiHrIwCeiAObAh1nYnNJZZu4MEF8ZYXR8i8JwkKJ6koiJsFah9gD6iwRdBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
	b=io9q1m9/WZ/vLxFwBghLG5/BDfclaBdpgiseA8rXxEu+a19M8Mq/rHcN0vYTk8chmGzu
	 D4UZgZ9ITN61iaHGeUZ0Z7r+Cx+cKTVmJdgRKKjhP217Odc75ox+EzuNuJoXitwzlpWqx
	 bJK8J3bDLoAFfuPdiTlZFQU4DRhj7HvH92zWwhu51zi+rnzY+uo1SOVEUdTHOUyragGMs
	 /eGCCkIMioiN10+c0Rkysdo/uxiV0IfGiPxwhDO2YhlRyzgkiou0f/eFuusVbiIQuNuPC
	 boUJy+9EFSUaljy2L7coWjQvhQm9EzRdnOsLg4PExQF7MVKN1n37RfD//DIHuRRN+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MQAahmYx;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63046606A31E
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63046606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MQAahmYx
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so1122430a91.1
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680788; x=1793285588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=MQAahmYxNC3kLSCRoMpvINqt/HMuJwwmTVHWcqs6kj2EnPHZ/Wu9w4B8q+1DiweW2+
         hFxe8sSGFEaUA9+hh8KTsQe7k4SVgCqcjQOCe8zw06mSekdcAaFde42tPodYoUNYxEVK
         Vefy0wsp2us4+0ELy+ju51348LC7bl+Erv6AeyqzdJty8BG5Cb3KRtZFqSUSFPstgN8B
         AjhzbY5M/DYRDkQT0yRedwF2x7NFJPepLrFnuCZyHVKjXte7Gg1a+XeAohMLbdcjI6Aq
         PwG1TSi8Lyq36N7QG4VNsn5wzz9stXCAD03ImtTxByqsHDavVLulMaqKNw33NDspaZT0
         hGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680788; x=1793285588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n6BoSwZW2ZOQKx79Pec/c6hMvcR0c9X8PkRx2zSQ/I=;
        b=cWiVG5IVIoRziZmi2QqMcdm3f284qQck6merJt704VhbZSFENdZYoAIa0J9sJfsPyi
         MpODuHQDD0MIcHatnrjh53I5VRw2m4m2NNRKahROcuFrWAHMlfOhkvHZquRihJDMqN2c
         lPrckQUElueDl0LRwhDabbibydLt5CF5NKY+4nBLHqaOPbuTRP9WIesmrudvr5qJEmiZ
         lBhlXkByOR2HF0HGKEvrHwj8CTfEuWqQiJlqQE1wO10uRrUw/2TGIqMV14fq2E2FF5Dw
         xr2YOrm+K3OAZ7mFWVD4Bt1aTyGReMzsvDvyLknGVgkY4Gri15EVKnFLynLgbW12+fV3
         eDZQ==
X-Gm-Message-State: AFq9FYKHkjq3ISsgmHszbhE4J4TAukWQe4FuXFZLBK9zIGfqQYQAsHCG
	QiNgKBBTtWdsri5aH95zUHtOqM/x88gHpwDl1wbiEAVLdkKCDhkqIGFR
X-Gm-Gg: AYBFou1ggl8ZTXULgbMQ3ooLcP7JV7FS5R0t4mn9lP4KeqHBEAaCYUQKiObjJguFkdr
	Ihr8eco9ky//h+aEwc4qiJ0ULVffHxDEfkYlt5cq+Pf7CKyYTqEwf4gzLlwqWSiDBFgVR3QY0yM
	LYsUFwy166sWaqk68g4sIXBDA+ia2ktR2/hQDpzXUzwQ/0+PWS6Lm0NvIQCgHJvNBkmrxd5L2Mz
	AgOYPRpEqIdTkTaxJeJ3im9rs2mHCuREcHpiDKuU3i2tPuxw+ZlWZBvVyZV4KHoUp3lApC1AE1E
	LfryrgDFM10xvSzfRfh1Dv68LoLmK3++SXv2qZvoUVR86mIr6Cj410cmEOLXHqWBDZsIp2pLDOX
	Opw0LwLWwTPGEufTVUQzzpA8R+1oJGcAkjOZ/YAuHrBkkKUErR/3hT+pzM8RCByyRR9/6PtRfA/
	ht7umuRoRuZSM3BFML2dxKDLGiiDuS1El4+7tv6aesRvujq5Y0X5ZMgGftH2N9/jJcMkca1enZY
	N6Qwc26gGkfEehLSB1wmDfcwuGXPbmKyj/tDw18IlemmFA2f2U=
X-Received: by 2002:a17:90b:5390:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3ad86cdd7a6mr4244176a91.67.1792680787720;
        Thu, 22 Oct 2026 07:53:07 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm4767829a91.2.2026.10.22.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:53:07 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 1/3] ALSA: opl3: Initialize the timer before publishing a sequencer port
Date: Thu, 22 Oct 2026 22:52:53 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
References: <pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com>
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


