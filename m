Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998272;
	b=4XiQgxI2igVlsz2U9m3AAtC00SBm4rGGXg9OitqEbKpUdwclFMd8A5Ug+n6PklIFqlHV
	 F+P4/x/bPUxC9Iv9FaImRx75agy1PkUQVOecriymyI8nKc73uZH6xndRxZ3s2VKLgUZGH
	 DIY0UPSa5KK7uyBAH2Z45G6xsyZcRjQ7uNaIT3Z0+LC3skuKk29SKOs2IfxBfQj/kLJSL
	 W64iksX8WTNMle2o840HPNIv6KY9iGXhW/wPCGUSErwWMlgTVuQMvthG6qSiSpgoXJNN0
	 Q/c6gVp1RX1PKL3YsYEKX93S02VLOSvGWKWqd4XhzJfydedw5FpcDl4cQ5cKb5sd8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xMKIvqBHSojUYc+gMYW2pQouvXFob5OFUcbc/iwXI+g=;
	b=Ufh2eJFwFyauk5ipqg9W2av24Coxf28SUqZdVs40BdmK7DD9j/3J9PAY5IbN2SgvnmYU
	 /elGIVEaGO6/Xk9BM5wODrQCFRk/Xsw0jZZtlDSESnHcqFT0vyGSBWjA7jZOHA+uZZtIO
	 4EUBI50086VfgLNh55Jw1U8wkkCcsIuo4jlbybGD852ugpV29vfpLFyrShSnTs24eyxGJ
	 f9G3lpSc7YY9oEYF4RDTy/r2Qw9Q4Og9S76FR+su7O59NZLvgiEfjZZ/sIOdzbUAG7nZ2
	 8TUK3j/11LQuNDdLLWq0bShYMt6VFeWhk9zJkY/CkU2sH6qHMEKERxVlACU4Gfwq95g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JonuSYig;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E64E606A331
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 20:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E64E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JonuSYig
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so1595397c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 12:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998271; x=1794603071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMKIvqBHSojUYc+gMYW2pQouvXFob5OFUcbc/iwXI+g=;
        b=JonuSYigM5wLpSpLysMmYjr8rUPEc8x1WhRFARKvUe15FZLFgiVRHVnoln5ZYk+ioe
         uFGImKeIOL4HZ7xmG+a33Kqkk6PzkjUqDhYGBodLkfY0/U3gOZbdbjW1QMl8gwURl6Kc
         ZNMX5QwicpIvSJwt3JpEDZ1P1EZwNNS3FBP4t2cJTHhvOX+Uxzd0IOAooFrJFauomeVN
         7DS57rYBB2QXUTRs7kBoDFtbAaPw7u0A8OprnbNNHFeS4BLiZK0c1XxHZeWz2cCcUVPs
         ox9/JgSM2KKSGKB9JWQyGSh7OmlpvEQyPNwH5rbFE7+hEefPayjOkPy0f7eMLmo+orn/
         IXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998271; x=1794603071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMKIvqBHSojUYc+gMYW2pQouvXFob5OFUcbc/iwXI+g=;
        b=baCWt0doVpxRsSPCiadD1g7ZRzZXPNIYiuBp50bUKtRCOCGly9no4jo5a2jL6MtCwD
         VcISLDhZW+z1JjRsJaQsSFZDiNUSwM0GnhIGEGEcEOyFfaP2AWoLVQ05vyp7XfNIYpGR
         3u4fX3C1wuBI9TIPF0Gp5RAtCpvudoTMVrn+FHg8hRGLN1formARN56NpnVOL6Pp0zpi
         /TZTj+4zni5sQjM6IP0u1it5WlMg9VtlgZJRWAxWT/EQD7oQAddEv5fhFTQsR5l/1Wrl
         Ss3fphL9hg0DUnvINkcVHkoX5Er/wUy0qTPZ7GQcnBpdr1nGlKiKSPM1+2fOCjJAwzmM
         5b6A==
X-Gm-Message-State: APuU4Z+rZTg4t3g9QlQuLMV9HFOBJ/MrPj0aC/djDW1mMuU/gb5gFLXL
	3H3IFXdXeIuLEF4kF6/mdlw2lqvkAzuQUe8WYh8m+wEN4zdc0Weu2SeK
X-Gm-Gg: AYBFou3ULH4sGup/D6SITpeBz/y4rSLTHoQjDCwAEuB5Pk+ajAPFJ/LqLLKKnJpFLh8
	1Dul6m+C0PVbacH1FT5AyalK7LeyLfyf+qRjzWjoY4E15iwaL4beIQVlBZo+DrBO6YzBYOFDgn2
	SDOGeyYoSmsqTogq8mf6hdrQ1Pp+zph37jR2OlEAgGM7bYVnbwjrdGoL7iH5RzTPhXYC6UwS47I
	RrLL9g61M22Khe+icvRwO+uUwfdMg3s1moaHTlTfN8zYtI0idUSp/bFiXCs/y0CxkuWQqeAsimv
	s9IMJ5JvGjMGLb/O+4IRmMr95FnfNc2ObGIC6WlZ5Uvy/7xcgi6MsZQ7CJSj+dUB8Is4mhNwRhK
	FNpLVPp/gH1hbUT77oBi8y6U2CbKRHqyd0lKZJYn40MOcwexBsiYjCFHa2UmPQtrjRHp1egyun6
	6WtfJlpsXac1dUQ7moLeebc8989ZWlYGJ6IyFBUpKaIymfirYvuiTZ+mMQHZY3UTdxqHhfVlx7O
	axYBZ02azfRVJQ9KfuUuXSriUhxlSLGx0A5vBvo0MMnCMeO2PgqzIM8apC9G1ecBJ9tbpnKe+8B
	hzWvuWhiWttu5oxXydDQx6QFG9Qi7fGDC3Z7Pa45XlAa4YDgsOGnVrpcToTImeoanpC6NioIg8Q
	fzKzk1d/mBqVHuWfLF4vuX4YYWbw5/A==
X-Received: by 2002:a05:701b:4346:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1b25d286bb0mr1903646c88.2.1793998270605;
        Fri, 06 Nov 2026 12:51:10 -0800 (PST)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm8445952c88.17.2026.11.06.12.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:51:10 -0800 (PST)
From: Yifei Gao <gyf161023@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH 2/2] ALSA: hdspm: Take hdspm->lock when masking MIDI interrupts in IRQ handler
Date: Fri,  6 Nov 2026 20:50:47 +0000
Message-ID: <20261106205050.8048-3-gyf161023@gmail.com>
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

snd_hdspm_interrupt() clears a MIDI interrupt enable bit in
hdspm->control_register without hdspm->lock. Every other update holds
that lock. This includes snd_hdspm_midi_input_read(), which sets the bit
again, since commit c0da00145f9a ("ALSA: hdspm - Fix locking in
snd_hdspm_midi_input_read"). Updates racing with the handler on another
CPU can be lost. This can stall MIDI input or revert a control setting.

Take hdspm->lock in the handler. All other users of the lock already
run with interrupts disabled.

Found by static analysis. Compile-tested only; no hardware available.

Fixes: 763f356cd8de ("[ALSA] Add HDSP MADI driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 sound/pci/rme9652/hdspm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index cc4cf43e5a5b..135761278556 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -5383,9 +5383,11 @@ static irqreturn_t snd_hdspm_interrupt(int irq, void *dev_id)
 				/* we disable interrupts for this input until
 				 * processing is done
 				 */
-				hdspm->control_register &= ~hdspm->midi[i].ie;
-				hdspm_write(hdspm, HDSPM_controlRegister,
-						hdspm->control_register);
+				scoped_guard(spinlock, &hdspm->lock) {
+					hdspm->control_register &= ~hdspm->midi[i].ie;
+					hdspm_write(hdspm, HDSPM_controlRegister,
+						    hdspm->control_register);
+				}
 				hdspm->midi[i].pending = 1;
 				schedule = 1;
 			}
-- 
2.34.1

