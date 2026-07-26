Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EE213B7A3
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 05:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785042999; cv=none; b=WuGJ2a+UvTZguJEU3I62UTDE1H0pZqk6HOpSi25CteAClI4g/IVDn+1bpXVKSdbM0EvdrBdaEIorIBc7U1n2Z5c5FiK+7WsLvwAhS99A5T7RzQ+bw1+93ox1LEQ6IY9uT1pqsYg1NIxmMEVeApnBVoLtzz18NRwwgD9tWheMlag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785042999; c=relaxed/simple;
	bh=qQw9JPEm96h7ALUc0SghAENmUNYOa4c6FVUiTYHLPnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bD+rSNPF/ovT0hWfE9K4Xhhp9JbPUcZrSqMgsjuK2yItLFoIyaDtzvgk2CY0ueYjysoT+hrG4df6P8q4rKJNfFzT46qk8Ny9ERwPTDmSaNBxO7VOHBm0U+redzEahdcgcknEDJe0TVHyi9avLdogbJMhBfuWAtP9tnSOsIm8IZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=WFDJjNCy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="WFDJjNCy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cca0c5799eso15523235ad.0
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 22:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785042997; x=1785647797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tzWhDyTff580ghlpgewRs7awFwMox1Cw1VJXwDERVqI=;
        b=WFDJjNCyzcM30HiNfDCZeyARCvy2Nwb/yqQsWaF2JfY9sMop/6m2kfP6w0xYDay9cj
         G+jYrI0FiVHnfUKW9PYMyv057mimcNm6W7qoadNy3NOyAZRFkvlf4+7PAjsiIZPdZ7jX
         mjhOnwmZI0OGxUPeR0WlF7I+B1NL65Y15bMZ1RTzuEOCEngduXWyQZvmomuBvTAbexEq
         2QgA7DsMF9/ov5xtRN5Bk6ePtWMPLSCdoHVyX2yGfrJbDHwnkhHbm/gM0haMIelmaThm
         70qBExfT9IZBClGi1xbL4EvF2hwZvec62HSpk4C4aDQKBYU8hzodzhc4thr/nFZpYy3O
         TZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785042997; x=1785647797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzWhDyTff580ghlpgewRs7awFwMox1Cw1VJXwDERVqI=;
        b=J0FGIoxgEzUZXcR2jTFXsYAw5Hheu7B7FsZgKtI8OvIbpivQnIWi4dSjXSJRorOMbb
         4K3Xq+KU4xvtX1TJVCKaiGbF7X0AITwEHOFRu2aFtr6CQKmFDSIZHUVSd6eO09Pa402I
         xbJgNIVc6TT//kR4ur/oJZbmukMcWcOLPXtZ4WJ4AYcwbU1TK3/K7GMdxjsgO6vVwBpb
         u4hxiswEt8PBCqueQ5qrqUnt6jRmoM59Tz0j/Nphaan4cgUp6TocObM2rXAni5ZF99l5
         vlmNXT1sV9Bz6jIsZlOBJJ3kRB5skDQRXs9rKxGoUSo3sD7/U3koKviIs0AvMBDnPrfm
         Oecw==
X-Gm-Message-State: AOJu0Yxex6VPRfQ7OXWzq3yQR/PrCXYwNmJ3tPLd9b/Iuff277pTkJ8z
	AJPA+izYoTs1XqPxlWyH212kCfv+9LB2Lj5TS2DWc5wOQVpTk1tVgaaSNek1ecn6atALrWIZxz1
	PjB9F2Vc=
X-Gm-Gg: AR+sD13CPCukqQz7CFafpDJ2xVtXK4iqbsNmYaPM1xXGUT4L1VfYjRYLn7wcP6QJ3Lc
	qxnQ3Y4+XREjubrlE4WpCZXussQs1plV2+jPzUOlTjC0u4Zylo7Q9CC4EgjSSg0OayS5/jSFf/p
	vbqSyzoc45XwVsmcJqTUCOdEBM3NT0kBjKZMDniWCy+3xan+iS1pHcQW1EMfnqshtEE0aMINXld
	ukTCxwww4crAj96lcY7peTvMjPKUM00zyHYsmr7bzldR21ksSjVuEhU6sxKU6WvAuRNSI+YEGLx
	eUfAB94G012wiEqtoPrgrca1XYQP8K/v9plTlfdC+YUZKHVToWE9T92as51n06bZvfxVJmx+L6l
	YzcCpDloUSTum3YF/7gWS3F41SvDfqxorxqeEGaMtZOi+2BQllC1SUqWdvjnYm2qbDOCEwSWz8/
	DidAXqMQsTzLuTsTl13hiQrXB7AEh/kDMssquyUxO5Z42jrY5c6PUFev7/Ea74
X-Received: by 2002:a17:903:2446:b0:2c9:97a8:afef with SMTP id d9443c01a7336-2cfde8673a4mr38550675ad.40.1785042997347;
        Sat, 25 Jul 2026 22:16:37 -0700 (PDT)
Received: from localhost.localdomain ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5c8337sm16912195ad.20.2026.07.25.22.16.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 25 Jul 2026 22:16:37 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	federico.kirschbaum@xbow.com,
	Baul Lee <baul.lee@xbow.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: ump: fix double free of out_cvts on rawmidi error
Date: Sun, 26 Jul 2026 14:16:33 +0900
Message-ID: <20260726051633.41206-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_ump_attach_legacy_rawmidi() allocates the legacy conversion array
ump->out_cvts and, on the snd_rawmidi_new() error path, frees it with
kfree() but leaves ump->out_cvts pointing at the freed memory.  When the
endpoint is later torn down, snd_ump_endpoint_free() frees ump->out_cvts
a second time, resulting in a double free.

The host snd-usb-audio driver attaches the legacy rawmidi for any USB
MIDI 2.0 (UMP) device, so a device that makes snd_rawmidi_new() fail
reaches this path on enumeration.

Clear ump->out_cvts after freeing it on the error path so it is not
freed again during teardown.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: 33cd7630782d ("ALSA: ump: Export MIDI1 / UMP conversion helpers")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
 sound/core/ump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 70520c7ca293..632c13baf21e 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1365,6 +1365,7 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 			      &rmidi);
 	if (err < 0) {
 		kfree(ump->out_cvts);
+		ump->out_cvts = NULL;
 		return err;
 	}
 
-- 
2.50.1 (Apple Git-155)

