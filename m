Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795755345;
	b=JujPLlTfcwoh1AEoxL3PGPjHNZMvYYpPPZrLB5nstpGvFrCamviEgdZNQzMJUWkV1G82
	 Iy0Zlo2aOKIu5J4oFZ7jri9IAgJNP3clM88LMx40Vp8y+/pEtSaqUtdD5NDko5OG+hAVJ
	 8ElOw6aYpso7ucnl2WNvV6W3iJ8wE1BgjTw8TcIWuA8nOle7tDss9+mfLkwpnO9Y6EdHD
	 ECfx5gRxmeRUWv6ljDQscff+4F3R1u0og62px8SuVaBRkEUB2YxI05HxTl8WZVJQHVWqG
	 u5w+HxSXVUgSVn3N0VL+bRujBFSekf8OmA07EqdqeumDjVkWmE0L9il1+Hg+/ztcnGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795755345;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=mjGds9HC6ZrJgvBK8UcDSDjw3BcDwOQ+aMz7W8IJJsQ=;
	b=ZhBSSUB+pFahir1wUYpFWbKkDDEIpIjo4Ud5QVkE75iw3WQOyLVGwuiXZ8WeePpSFGJh
	 4uiXzDrPwJ6lLo3I055L3kZdbazrXkEHK1fctfQ4t5grlAEZ2CSAUE8NBtzKte/8TNg1k
	 jtTMjbeTMiwAU4xWcyh4NfE/nSMz4h9zdLND/juKqPGRyfC80hbLQDSWbBuefxIRclp8U
	 ukJWCpFZdpOExuhUrY7F7I6sTN3JVHQbj/fpRuepIe1vDor++iJJCS2XxaOyW18CxgZPU
	 1T0caGS1S1a6wr97Wg7qtkog+biuTTrTnqazv5R23vtUaVuvI2YXvHtq5QTUHQCBTcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I6MvsRuT;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF80D606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 04:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF80D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I6MvsRuT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mj
	Gds9HC6ZrJgvBK8UcDSDjw3BcDwOQ+aMz7W8IJJsQ=; b=I6MvsRuTaiCmZSTfeo
	YDgGsOOEKQz1QLq7hgWXyDI0jUbNdSnoZ3mdWWyAxUi2tBlcRDNepMdbT1thnmj3
	pCCN4i11TTwqNZdyIBdh6UdDpTcbbtqjev99Go3FPtf1Vq/2vMaDeM9/2tqEHgo8
	rIXneoOEzxkV/7NZxGDo2AgKI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3F50uDQlrylnIIQ--.23374S2;
	Fri, 27 Nov 2026 12:55:11 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: perex@perex.cz,
	tiwai@suse.com,
	cassiogabrielcontato@gmail.com,
	tim.bird@sony.com
Cc: linux-sound@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] sound/oss/dmasound: unregister OSS devices on init failure
Date: Fri, 27 Nov 2026 12:55:09 +0800
Message-Id: <20261127045509.333969-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PygvCgD3F50uDQlrylnIIQ--.23374S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UAFy7Ar47Xr1rWrWrGrg_yoW8Gw4fp3
	s7WayrGry0grsakr45AFyxXFyftr4xCFWUCr95uw4UArs5Wr40vw1DJrW5ZFsrKFWUCa43
	Cw1rAa1ruFs0vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_hL8dUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7g9r2WsJDS-UWwAA3c

dmasound_init() registers dsp, special sound and mixer device
but never unregisters if something fails. Unregister the devices
in the error handling path so a failed initialization leaves
no stale OSS registrations. Also fix some code styles.

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 sound/oss/dmasound/dmasound_core.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index e80f730d0803..15e4682e6cf8 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -1377,18 +1377,29 @@ int dmasound_init(void)
 	/* Set up sound queue, /dev/audio and /dev/dsp. */
 
 	/* Set default settings. */
-	if ((res = sq_init()) < 0)
-		return res ;
+	res = sq_init();
+	if (res < 0)
+		return res;
 
 	/* Set up /dev/sndstat. */
-	if ((res = state_init()) < 0)
-		return res ;
+	res = state_init();
+	if (res < 0) {
+		if (sq_unit >= 0)
+			unregister_sound_dsp(sq_unit);
+		return res;
+	}
 
 	/* Set up /dev/mixer. */
 	mixer_init();
 
 	if (!dmasound.mach.irqinit()) {
 		printk(KERN_ERR "DMA sound driver: Interrupt initialization failed\n");
+		if (mixer_unit >= 0)
+			unregister_sound_mixer(mixer_unit);
+		if (state_unit >= 0)
+			unregister_sound_special(state_unit);
+		if (sq_unit >= 0)
+			unregister_sound_dsp(sq_unit);
 		return -ENODEV;
 	}
 	irq_installed = 1;
-- 
2.25.1

