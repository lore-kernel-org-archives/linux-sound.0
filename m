Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7F37C108
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776052231; cv=none; b=ojuMGACdoRAUb0D20PkjPD33Sv8eKI2ZoebgsihUjm3GYiqtFY2B+dmouoixzPPm4tZqmh75rf7tEUl9l98e4CqK5+BvUfWjX8SvQjSUv+9NccVl1b41AMRWyRXCNtlbAByhJnw5hj9G1dCKD7Y4yki/+X3qUNkqI/F4InNJSDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776052231; c=relaxed/simple;
	bh=G+z3juLYTTGNnge1Q7+l118XoMP53BlwRMWS2rp4EwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZnyJqpEBdqs3fyjiB4kskxwqK69ehXax8dZjUwgskl8jeIzrbOc4SefaPXIL3oLsTtqrcwazrS2PJIWZmoEwN56bEJHFjb8DR6PcS7pgsMMgvJJ4Wbr9f3zjDiPcRdpMJnhFwR1xbbQ/Ah0cFmrUS8eqZRQdiOenIJAMvuMIJqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lW3XHypW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lW3XHypW"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so3984929a91.3
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 20:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776052229; x=1776657029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLYrZW1/bb0BohbqxF1IHAXhdfS6eaDzFERz8UW0w5s=;
        b=lW3XHypWwk5qpf0yKb3Gq68AQDZ80/kx9uMnJZfPlwnrGiAyzD6FUTk8riQ51UEVL0
         8AxZW+fd0/eiM0t+TeqWX9F4o78R3yHikqr0lv2AZae7/DeZD6yHBNgoZFrMZIONRoS1
         z6uaWCj1B+CINvxF97eukhHHFGnln6SjuXtR04Z9Ik25yqTTyLIrhFwf4fH4Co5+z5+n
         DSoPgAgs1m1tDZGxcJFiOU93ufZ0mCpSyVfMTSPkb+/qmdG4N1gKscRrra5N7DxByVb6
         iGeqzejFN7Ru8cjCUqn75qhCk4GL1cVQ1N+fqZaV5Fi7quAOm9+Ccq2+r8uPDA8YHZFb
         tbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776052229; x=1776657029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLYrZW1/bb0BohbqxF1IHAXhdfS6eaDzFERz8UW0w5s=;
        b=I3mCEyCyCGref96XhQrnT9n8QRoBd10zTxxkl2BtdJdSlX0x0HYZ7yJEeXjPuPZPBo
         y/vx3w4ZiRBRhu31orayblSb7SDCB9Fm98h+4bIRhxEo7YDNqGTVOjPma+/1jCiG70m9
         XE5OfpT8zzoFHG7GWKXPPRqIfHoruMQTcbCN/tPb4Q6T5ZvQi/qJIWpkBJR76b6GTKNM
         gBmIoBfWTPEvrJzBgZaHHLViPSB689mINFPdozVvGUv4IROkBkPJ6OsXMeGc5ej+XJHj
         D9JWSJoPy/fugGQ1X8x8aQgJuXYSSeM2NXR+/1l/bBYaPuBXh3M9zBIVLzl1XwKcBpcT
         Vy9Q==
X-Gm-Message-State: AOJu0Yy+JTcMnvij+MzbddJUvMP3BaB5ZgqPuy+8cc9mgYE8YmCJz2xs
	/+OwQ0N+jmjf6/BZ918kJzl2nEQjpJw2EXWp7jsW5arlsDej+Kh8mLa/
X-Gm-Gg: AeBDieu9On2cOkjPTtv+C4GMEbRNM7T/tyqqmrLG6MD/bYV69z5esDfS5Yo2jwx6ST7
	i5MqXHiAUugDfZl95HAG+vX+p3CrYsxXMbgPG5YHW+q27MyQ1qz9mXGP1eWSNf70Kbd4wzLacG1
	2YshHTJZN9Eo+t8V15LwdupktwuLK+TzA5T1f1B2ycRHNyHV/od7dn0/HmpC0qAxqvQztfUp8Ty
	dPiDl1l3ptS/fUVzrGOU8N/6KUudaTFMQ9S/ROWlOH1T1k778JTHbqIc8M1DVskB6C7DFSXDz3b
	kthDtoopAvn4hXJ4rzHCtYP8yfNCkVgLTbd4vNHyKOLwZJzLqwFQ5yFNqLcEqWVqMAOWxL0tamc
	KWrUOfOoM9w5VgxxaeQ6er5rCBTUAkkj9ngDhHvZ1QcNmLakQiulrCaS/HOj1oktsgYRF/DWbmD
	Z++dPA21+Mven1IN1EreM3Bsv1UAyCcSiNnhXaDAOQxUpgMm+rmmEy2n1Ll7CpF9ff47bXctCqs
	Q==
X-Received: by 2002:a17:90b:4e85:b0:35b:a8cf:7960 with SMTP id 98e67ed59e1d1-35e42769f93mr11744410a91.3.1776052229174;
        Sun, 12 Apr 2026 20:50:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:6580:9cc0:8700:96ae:8c3d:9c98:97d9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4e2dbf47sm7030644a91.0.2026.04.12.20.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:50:28 -0700 (PDT)
From: Berk Cem Goksel <berkcgoksel@gmail.com>
To: zonque@gmail.com,
	tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andreyknvl@gmail.com,
	stable@vger.kernel.org,
	Berk Cem Goksel <berkcgoksel@gmail.com>
Subject: [PATCH v2 1/2] ALSA: caiaq: fix use-after-free and double-free in setup_card()
Date: Mon, 13 Apr 2026 06:49:40 +0300
Message-Id: <20260413034941.1131465-2-berkcgoksel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413034941.1131465-1-berkcgoksel@gmail.com>
References: <20260413034941.1131465-1-berkcgoksel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When snd_card_register() fails in setup_card(), snd_card_free() is
called on the card, but there is no return statement afterwards.
Execution falls through to snd_usb_caiaq_control_init(cdev), which
dereferences members of the just-freed card, resulting in a
use-after-free.

setup_card() is void and init_card() still returns 0 on this path,
so snd_probe() leaves the freed card pointer in the USB interface's
private data via usb_set_intfdata(). When the device is later
disconnected, snd_usb_caiaq_disconnect() calls
snd_card_free_when_closed() on that same pointer, producing a
double-free and slab corruption.

Add the missing return so a failed snd_card_register() cleanly
aborts setup without touching freed memory.

The issue is reachable by any caiaq-compatible USB device whose
descriptors cause snd_card_register() to fail. It was reproduced
with raw-gadget + dummy_hcd on 7.0.0-rc5 (arm64, KASAN).

Fixes: 8e3cd08ed8e5 ("[ALSA] caiaq - add control API and more input features")
Cc: stable@vger.kernel.org
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Berk Cem Goksel <berkcgoksel@gmail.com>
---
v2:
 - Correct "Fixes:" tag

 sound/usb/caiaq/device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index 3a71bab8a477..d52f3b9a2bac 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -369,6 +369,7 @@ static void setup_card(struct snd_usb_caiaqdev *cdev)
 	if (ret < 0) {
 		dev_err(dev, "snd_card_register() returned %d\n", ret);
 		snd_card_free(cdev->chip.card);
+		return;
 	}
 
 	ret = snd_usb_caiaq_control_init(cdev);
-- 
2.34.1

