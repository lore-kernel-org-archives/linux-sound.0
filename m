Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823465;
	b=bOyshF0lkROuTqua6woiGzUMEuHpgIulsZjCk8qmI5BoFLYwK3e61cUSIHOk+4m/mFqv
	 FFqsD4svyulpVsXRTGX3tu3BFY9ejdxmkZagk+m09L3Uu2NzCYI/wjsr44sQ29yPRsJbt
	 jQrC9c+z2aSQe/ccHTL9ncUxchXPON5IVraVD5snzDQdAxu7h8/5LQOrf8FgSzj+9F5od
	 xSXtzdRR/64VhHKtTMOZUCHKTt8FqxGR3VituRdWelo5Q0LIevuGF2h1CKjqE+YgV5CQU
	 ij+47FyCu4Fyr8I0CdU1NvXwsY74PgYeImWVfqYd86h5gwvHpq60GtmDvO5t0S2IYqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
	b=v2wSG2XFxlZl2Fp3qfKDtetd4hhobtd3OgCz3SPtlR/hcb9dPTgU44TMIJjnnwSDX7Hy
	 gQrnJVXrkZsgyHu6LabaR6hgrZ+xt4fR4RwmHtv3b4ZxBK1xu2qG8wANR8pfx4ATthrPD
	 oLEG+xcwHPBUVHi5V9fVSvl4zdutiAyz88OuiItadtJHZlYCN/FM+G2E60+BXj0bTLeUr
	 UCVsyLSPj/mDfjeZp8vh0+WEPHAGuA6lgxvACMbNC1RisoT6RdQQKrJKR5ttpDqBmm+8u
	 vvlMapudWmbdGpyVqTEvbh7iA5IbqPNrrXjGgIY0PM611GwbV4ea3gANBGx9qp8CY5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DgRoTCau;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C610D606A31E
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 06:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C610D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DgRoTCau
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so918332a12.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 23:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823464; x=1793428264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
        b=DgRoTCau56UkmUNgN5n7quLRHJIrsKVW0Lzbb1XnPNNZZT93hrO6alpj9Hxdy7zvgB
         98X0Dik3iN/EqGbknZb9br9Znt631fk84IURtKpaVEQnGMG6D1Xbb49MyzyZ5RgBvYNS
         Gbhb02TZ4jQUxOrZGsn1plCvRwwF72aRuel1UqQ/KpNKneWmSNFUnWKWVMOvtSMfm+/t
         s6aTegbNtMLntxNw4GAiHx5uTFyvO4yGIv8plqQx7+SRWiigZxOUXU7fqjHdfD/TKvq9
         5zOALrhqVKuUgyx9wwm627mlH3pTLnY7TiBvXmT9t1zl0TQrfxm7cb/1JGBCgJWvCdfb
         0sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823464; x=1793428264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TeuZv9pVyg5PpxXbUEbxc/gGTNfQLawZcWlzWojNhY=;
        b=2mXKEeu6Wb1zfObzZXudPEs5V7HyhgqpUUMawLtz1grptXo38h+2ULPbqAVnP8qyA5
         RLc0wMkam4lHp5BUlm2yRD7w82pv0pvlS4zY/orYOmDMuivcjGlFnKU1wW5sHyV2bW5C
         YzphLzNbQ9NrMMuQdss8/ZGsCaKHi63+WcDt8eGPHVF+IE4LuukewBBwaw9gS8inE9GY
         A77cykSg+ukqAQUu//gpSXrSHHXF5vzQRfitRY0yucnUhgnBkG556EhU0SojO2sjDVTr
         U9MhpVo/kTD4FKnAVlCdaH6UJVGg3yWRG4apxsZxqQTjlOpSgJ2mM1TqTcBbs+yEUArc
         cBBg==
X-Gm-Message-State: AFq9FYJ0WiCJPyeIkXaqGDzAmVV5fE1Cdl0RicWiX+NcA2swIBASTxq+
	M4D2ALhbeys2ZgeRhPWnSCKCdGrc9nX7TdohINo4k0PEhLLhLJZoT5Ed
X-Gm-Gg: AYBFou3IjtGsiXH8zCAhV8pbd7twVfi/PvJ4Co971WnBux5tohPz0VI/RTCf5rQhwWa
	EeoQNgDkVGofvkACGv77GSA9HS2XzGEaSN9e6pczQm2kiOl7nga0SZoMorpi5p9Z9TyeyTtaUpt
	mS0S1l9lK2qe9A0o1rBu9GfMtzOmnxwgk6B84oAMNB8bHbrfx+600ddlxQ0l65CiGsIz9Tnpn8U
	vwWw2lU2jKsPEwnqCWiSQSFX1VDJPyb+r06HozuX19sIPq1vncqBjaQVe3TO061nQFBHSu/WJoy
	hwkdM85HahOb/rfptMwkR7cv1Dd9pbER7eTwOegCLIF3YnytT6QPkAxuFE64eUFSOp6BDb308lv
	8gpXIVUEW3qY4BGtqznP6NEYUW4gcaFCUoMfm571iREePvozPDeaFoPamB9kikss+wfpMu6BRgL
	NwETINtFA2kcWnqErt43ec+6VIXpNOvjPqZWzRX2v2/vtkV299PIv0Y1gbkMPa7CW0E2UObUKYJ
	kLV391BL/23wyDLrrDHTsi0TR/JBig3FbKpxNka+XShtawpjYE=
X-Received: by 2002:a17:90b:4403:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3adeae86b0emr1230023a91.55.1792823463996;
        Fri, 23 Oct 2026 23:31:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm1248371a91.2.2026.10.23.23.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:31:03 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 3/3] ALSA: opl3: Shut down the timer after draining sequencer ports
Date: Sat, 24 Oct 2026 14:30:45 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-3@gmail.com>
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

The delayed-note timer is independent of the sequencer ports' use-locks
and runs code in snd-opl3-synth. Deleting the client drains the event
callbacks but does not cancel this timer. A direct fixed-duration NOTEON
without a subscription can arm it without any unuse callback to stop it.

A shutdown in only the native port's private_free callback is too early
to finish shared voice cleanup when the OSS port is enabled:

  Sequencer client deletion          In-flight OSS NOTEON
  -------------------------          -------------------
  drain native port
    clear native voice aliases
                                     snd_opl3_oss_event_input()
                                       refill shared voice array
  drain OSS port
    clear voice aliases again
    free OSS channel set
  client deletion returns

The per-port voice cleanup prevents the timer from dereferencing a freed
channel during that sequence, but a queued or running timer can still
outlive client deletion and the sequencer driver itself.

Shut the timer down synchronously after snd_seq_delete_kernel_client()
has drained both ports. No event can then start it again, and shutdown
waits for a callback already running and prevents callback self-rearming.
Do this outside voice_lock and sys_timer_lock, which the callback takes.
The probe initializes timer state before publishing ports on rebind.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 sound/drivers/opl3/opl3_seq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index e03c88377bb6..1004a7df1b8c 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -259,6 +259,8 @@ static void snd_opl3_seq_remove(struct snd_seq_device *dev)
 		snd_seq_delete_kernel_client(opl3->seq_client);
 		opl3->seq_client = -1;
 	}
+	/* Stop the shared timer after all event callbacks have been drained. */
+	timer_shutdown_sync(&opl3->tlist);
 }
 
 static struct snd_seq_driver opl3_seq_driver = {
-- 
2.43.0

