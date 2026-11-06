Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998269;
	b=DtcEi8Jbn/YVHseZZiKVHAlDvvYPBBfj0UZ2qxvE/AQ+O8E/GwZmR95Ju7mEXLJJnSLV
	 TIJG9P7AplYL2nF9pxpVpcTMRCr7fdc64aHVKHET5CFPOlRB2XJx+1cEvd1Vkc/TeaHxK
	 Cn2FmlpCDqbpTPNhEhHF7ur2t/cvfbX4DJAIjU2enL/AUL8WlSqpG1Jx95Nj7Hh5oO9BY
	 9vAUJ/Pxy5hsLMQzTi7XRqfhYILA4vvdOy1rLrhDSUDSTnhHj5sVhzqrwrkE3DJzhZq56
	 JzzDpsjEDkOu+vPEcyB6ATBsCepdZ3TF6SCOZbAm+dh8Sais6qyXy17Q/BL829XzcCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jYHr7n+/wWgPNZQyDSrxLVljYRX5eMWCFsLRVNc3/qI=;
	b=I3FjlCWOq0LWN/jccPRr3a6GgTaxEJFcJdFUlk1sLh13HSo7j4a1KEheh74Hi8W1pP3v
	 gC0/63KvGLTO02NJ9sjWTN9GeoCabvg2tkbaJHg4CuOY6ioaCrrBRMTqluxS2ualciDAk
	 ttC29f7kcec/f+nOLWGGGi1TH8Pr7a52cyLp04t39G82cNMnxaacq5GJpxBMSJAYZNYaz
	 62CLVe6hCc1FZi1BWu0y3QUUFHN8EZJbXFqNgFz0POV3okwkNfhL4ocxQT5tmyfLNWbYK
	 OLHweOkOP2knxw8uyY+M7a/86eVx/jO/X0wPEdJJdlJtTlTG9nfPv0s2c5HafX0fGLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3mt7+eX;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D4606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 20:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3mt7+eX
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2296087c88.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998268; x=1794603068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYHr7n+/wWgPNZQyDSrxLVljYRX5eMWCFsLRVNc3/qI=;
        b=j3mt7+eXVOm5o0TUcFU4Eyv53kXqVSqWOigIeqe21b3GkB279H12apMkhMlSByi5A1
         S3f0ybtHKD3fDa7iBtPqNf18bLNJG2ovr6ZK//1GTyYqATFg9463difP/s3PFcHhVXXF
         KM3nTKZdOtdgQDmW5nv6wKewVVsozx9SrX5yzy4WQLoT0R4fhUh93F+TaHgAN3uTNnLJ
         hv3MiIVhVrlpa5fzOFGF3Og0RaPEuLEd/hEFQ4be226v9fbokeIsG1ehDeU2HAqTKrcs
         ktDCSjkWCnURZfvJUNuVTWavjdEOBpxFAmSD9emh69CldBjNy9hPx3Nx3CaZGk9NyrHU
         I1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998268; x=1794603068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYHr7n+/wWgPNZQyDSrxLVljYRX5eMWCFsLRVNc3/qI=;
        b=eTaZaUPrm4HKBMowv2meYR6SdPnw00LiDbmhywmlKv8ylm9tkeiWM8602S7xf4nmPP
         O6sFZ2DdmrIFGUKoagLaMpiEKIsu8a3ZtOloTDDe+udzmXM9S1GgvT9m3RLwCAQaoLF5
         BOURBjXDMG/HziQ74KwbljuDox9RDH58YDAhXfVQ/Jkd9b4ck2Y1UQUw97GDnz1kNUA7
         y3J6Ut+ek//kBuRqMi+UAoe5qkl1EQOwdLdxGdloD5w1vUYtXfr11z8SJkEXTDHnYd5h
         XROYhzP5kFm1hfLHL+97wdtQzchQ2E8srai4lLtKt/diPm8N+MGj39vGCAlI3VADJSr5
         +8jQ==
X-Gm-Message-State: APuU4Z+wn/hZDMYslIqtm1rIA+1xoRooAAOfrKNTLZkjJl5pUCC47kJ+
	P2eh8+yXWLhjrXqHhWQz4ScyNiy58Jpin4l3rUaTcXohy8qZwL4G2ZGC5aC2hg==
X-Gm-Gg: AYBFou3rfRruPJ5UqkMnDRe1vaA/hYwDxnOqzTWFfHiJJTL69c6GrzcD6TmJjg3gTIu
	sD5kC0EZP42s/KEFrsZLKXt5oZFwE+zTkGRUEfprFsk75ILAVWdQcrSa7m55P1OdWs5G0OXST5e
	y2BGVBj4qvsPtm1oI/zx73YC+wNwtpbdvGcRWlj9MkLnolzvKdrRmjiM5EMCzronN2qpsewSgso
	ptHR/s6Q4SGf/iTql/vbdL6P8DRTYuhGATX6HvN3ZxI94QODjZV388EaugumEdU+QxcW27g1SN5
	HJntOloA8xD8oAY09vTItZ3cEOD15qU/EFxnSej4pLLHFJLzWsvDBFgNUrrTWlsWKOGfur66RJP
	FcK7RH2CNcfpCc6l20d5VxrgPYSZQ//h8FJgqZIWwuowdCzggxdtogC8oXB5RBRjinn6e2qlxbN
	kHhb0jwTgh2cMgeMtK1RB9+XSfMb/6eLSIuQT9H63+GtUDtQQgAWQN2GDZS7tQweg1mMwjiP4t7
	PVzx6fLngGsv8A+vKVNT6PfjEtidnEdWLMGlZR64c/0qFkcRPVaxM6DDgAnad0s05jROQu0xPK6
	ROYymnLJ6Zn1G6D1bAAasUXDnVUohW6erYEUFrUnOoiQZg8nTRs2z7vAV4W2iAzGNNDMmuq1bn8
	kDfGb3gLh
X-Received: by 2002:a05:7023:d01:b0:1ae:7fc5:662d with SMTP id a92af1059eb24-1b25d37e5d9mr4772806c88.42.1793998267505;
        Fri, 06 Nov 2026 12:51:07 -0800 (PST)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm8445952c88.17.2026.11.06.12.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:51:06 -0800 (PST)
From: Yifei Gao <gyf161023@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH 1/2] ALSA: hdsp: Serialize control_register updates in MIDI input paths
Date: Fri,  6 Nov 2026 20:50:46 +0000
Message-ID: <20261106205050.8048-2-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106205050.8048-1-gyf161023@gmail.com>
References: <20261106205050.8048-1-gyf161023@gmail.com>
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

hdsp->control_register is a software copy of a hardware register. It is
updated read-modify-write under hdsp->lock, except in two MIDI paths:
snd_hdsp_midi_input_read() holds only the per-port hmidi->lock, and
snd_hdsp_interrupt() holds no lock at all. Lock holders disable
interrupts only on the local CPU, so updates can be lost across CPUs.
A lost MIDI interrupt enable bit stops MIDI input on that port. Other
lost updates revert control or PCM settings.

Take hdsp->lock in both places. In snd_hdsp_midi_input_read(), drop
hmidi->lock before taking it, as commit c0da00145f9a ("ALSA: hdspm -
Fix locking in snd_hdspm_midi_input_read") did for hdspm.

Found by static analysis. Compile-tested only; no hardware available.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 7dce548b9f36..4e9f3a95fe0d 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1347,6 +1347,10 @@ static int snd_hdsp_midi_input_read (struct hdsp_midi *hmidi)
 			}
 		}
 		hmidi->pending = 0;
+	}
+
+	/* control_register is shared by all users, serialize on hdsp->lock */
+	scoped_guard(spinlock_irqsave, &hmidi->hdsp->lock) {
 		if (hmidi->id)
 			hmidi->hdsp->control_register |= HDSP_Midi1InterruptEnable;
 		else
@@ -3869,8 +3873,10 @@ static irqreturn_t snd_hdsp_interrupt(int irq, void *dev_id)
 	if (midi0 && midi0status) {
 		if (hdsp->use_midi_work) {
 			/* we disable interrupts for this input until processing is done */
-			hdsp->control_register &= ~HDSP_Midi0InterruptEnable;
-			hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
+			scoped_guard(spinlock, &hdsp->lock) {
+				hdsp->control_register &= ~HDSP_Midi0InterruptEnable;
+				hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
+			}
 			hdsp->midi[0].pending = 1;
 			schedule = 1;
 		} else {
@@ -3880,8 +3886,10 @@ static irqreturn_t snd_hdsp_interrupt(int irq, void *dev_id)
 	if (hdsp->io_type != Multiface && hdsp->io_type != RPM && hdsp->io_type != H9632 && midi1 && midi1status) {
 		if (hdsp->use_midi_work) {
 			/* we disable interrupts for this input until processing is done */
-			hdsp->control_register &= ~HDSP_Midi1InterruptEnable;
-			hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
+			scoped_guard(spinlock, &hdsp->lock) {
+				hdsp->control_register &= ~HDSP_Midi1InterruptEnable;
+				hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
+			}
 			hdsp->midi[1].pending = 1;
 			schedule = 1;
 		} else {
-- 
2.34.1

