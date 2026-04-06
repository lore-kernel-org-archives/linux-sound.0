Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDCE3385AC
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 03:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775445620; cv=none; b=rEx+t8fifLDsvaEwNupURyCOiirQS1k1uNDKOnPSMSbwTXAYK+f5JXeAljBJeE6+3CwcbloIRQ9f+CSDZudTEjILIND4Jhaln60qBCUDpFzHICrZx3xuhc+S5C74YhvAcMGqiYBG6uBJjbaiW/BdgOIYCXqpE3T7qJmArHcHmOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775445620; c=relaxed/simple;
	bh=nPo/kjyyZRkBlCq8myr47QLdwjb5HP5ssuD5hqCZ2yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cql6Zk5WdU3g7pr6ijkn/sZQq53mpKK+AmFXfDxrbl+SLpPmM0AvjXTac6P0yaF3fZ13AZCzSWknTli4taZ+8cWvQELfErAiAszrPdc7gDNyYk8KlX87C2ffz+O6ULepri5IPOKUtYm0AHDk/z+YM++H5waI2LcV43kgne0hFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SemLeNPi; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SemLeNPi"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5ff05af29b4so1147681137.1
        for <linux-sound@vger.kernel.org>; Sun, 05 Apr 2026 20:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775445618; x=1776050418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at+4HFvLiy7DCVXrWuZymI/850oW2s4mdcUHo/q9/rk=;
        b=SemLeNPiIJFyTMJI222BQmokUxgyXDUVKS0xuKVOEbaePNhOHqu5yUcevRDs8AzKRG
         XIj6ayg2YBZawFeYn1iCSggv5uc3k12kpJBI7X/OVDTAVdGlU7RT9u9HJq2L2s4F5d+M
         NYDlbebKuBjqQb6T7FY5mk+Gs/AzhdI57jmME3/72U8E5ZBBY8tVrmHLsqzz7oK+4tGy
         Hplx+rN7r67KpBCu0/TkEucPPMgZAJO/WKlvgKGhBDJiJFfaB6ohBxmtRyBnbjUiozcT
         KBg2jJM7BqWgHtZsZdvB0EbCWsBxAAkxJXpjHeP/S/qb4/6gbV/LwLWgAVA8jNttGy5x
         3uxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775445618; x=1776050418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=at+4HFvLiy7DCVXrWuZymI/850oW2s4mdcUHo/q9/rk=;
        b=XZ7FkZLqMzO7eAbGqHwtEo1wZv9K9rBSqZPlBculjVjPqlt6I1f+KWK4DiQvvupeI7
         mb+3I8fCDxqKeFWxuSm6rr+VIJDluJCl4pOfEA6lIui4oBeWuFU/E14Y6Tb93XGnNexO
         lkA5xMJ24hnRQTlKpztBSrrmwnAT0Mq73l4xw4YocgXcGo+abCp8Lj64aNdR50cY++Mp
         7DqPjMXOTOx+yxkm7n8akum5116XBuyIuUcNeLHQaQcdpkGbSsSp+kGN7PAXFPz5aKdo
         GOM2iJJGIZf4QiqDwR9xGBPzsACUc7+2QryH9fY2/kOw84ILBdVRmKU52L1n8Av1a99W
         jxCw==
X-Gm-Message-State: AOJu0Yx/+Y0KqU9uS6lRy73qaNbIygGmI+Lg/JQplWd7ry3ZN+Mc7mrA
	xyCQT/D2S9U+9LsLlt3MSdoJ0Rsa8eklt3yRMqY55T6DcHUl+1Niscnz
X-Gm-Gg: AeBDievuWgsxtBfQQ9RNYnflPmV6JH3CmqmSWm1XULRfuPpKQqbIzLEaATPen4ci+LA
	Qv87KVVWkRbRuYk+5qeh0+TSPuybwjGo3X2LcrwauWRJ23tsEvTNrI32Nm+lXjoOJQw31Vz9UJ1
	ZX7MTWpXV+SyLsGLhOq+fyITjZD64fZiEkDlfFXkfEVtTrAfhUMhLrjMZUIVU8vSIo41DhTCTVn
	qZYNYhm0mfSbrmc+W0lDvrhsHKDlrljnMnCI6bQBQ6QIEdtEO3v6sGBLaxoF2PMao4sDD4NjXpO
	dv6MP23eGkapKbilF0BxmuO5/r5wToPMd0Xw5uATF79XYv7+bEKXOfg9qi2Lh+7NpvyYYeBSry6
	6AkgjR50cOrHHi4kB2+yIGQWCr536AAb0h5YEi4jVYY99k/Bbn8cIVhMDrxAyV/aGTIKL4gFgF3
	XPysRB3kdzNarLoejV2pRstdDrlu4TUciwK8LQeG911G2dUoNHwQiPmMoeoUfzSwzp+5xrwNCav
	FFK
X-Received: by 2002:a05:6102:5e81:b0:604:dc41:b142 with SMTP id ada2fe7eead31-605a4cd8a92mr3550769137.2.1775445618006;
        Sun, 05 Apr 2026 20:20:18 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm9162146137.5.2026.04.05.20.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 20:20:17 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 06 Apr 2026 00:20:04 -0300
Subject: [PATCH 2/4] ALSA: gusclassic: add ISA suspend and resume callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-b4-alsa-gus-isa-pm-v1-2-b6829a7457cd@gmail.com>
References: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
In-Reply-To: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=nPo/kjyyZRkBlCq8myr47QLdwjb5HP5ssuD5hqCZ2yk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmX1bJPLpfi+Xmk5l5EfZXeJOnGGNMHnqktb59e3aGTs
 CFR9I1GRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAExkTQEjw7IO40/lxfky6qzK
 wnrZlVa769i1lsn2mr16rt7feCrtGyPDgaONrFyzquybJ19Xskvcah+S+EzhocTWs1YW7I2aH9Q
 4AA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

gusclassic still leaves its ISA PM callbacks disabled because the shared
GF1 core had no suspend and resume path suitable for PM recovery.

Wire the driver up to the new shared GUS suspend and resume helpers so a
suspend/resume cycle restores usable GF1 operation without rerunning
probe-only detection or tearing down the runtime bookkeeping kept by the
card instance.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/gus/gusclassic.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/isa/gus/gusclassic.c b/sound/isa/gus/gusclassic.c
index 101202acefb3..363c819ced89 100644
--- a/sound/isa/gus/gusclassic.c
+++ b/sound/isa/gus/gusclassic.c
@@ -145,6 +145,7 @@ static int snd_gusclassic_probe(struct device *dev, unsigned int n)
 	error = snd_gusclassic_create(card, dev, n, &gus);
 	if (error < 0)
 		return error;
+	card->private_data = gus;
 
 	error = snd_gusclassic_detect(gus);
 	if (error < 0)
@@ -193,11 +194,29 @@ static int snd_gusclassic_probe(struct device *dev, unsigned int n)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_gusclassic_suspend(struct device *dev, unsigned int n,
+				  pm_message_t state)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+
+	return snd_gus_suspend(card->private_data);
+}
+
+static int snd_gusclassic_resume(struct device *dev, unsigned int n)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+
+	return snd_gus_resume(card->private_data);
+}
+#endif
+
 static struct isa_driver snd_gusclassic_driver = {
 	.match		= snd_gusclassic_match,
 	.probe		= snd_gusclassic_probe,
-#if 0	/* FIXME */
+#ifdef CONFIG_PM
 	.suspend	= snd_gusclassic_suspend,
+	.resume		= snd_gusclassic_resume,
 #endif
 	.driver		= {
 		.name	= DEV_NAME

-- 
2.53.0

