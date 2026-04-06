Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE282FD68B
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 03:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775445624; cv=none; b=Mn4bKJk08PNN7x5AwJCgiVIG556ScT8bB5rOrj3lnPHcgFAwwZz7+8Hs05928EzF7QhD5c43WNn/ijF0pUV+E36AoajAXO9D09biBQJka/V2JVPfEXJHFZLqKNDkFsV9E/tRE8MBvLqjbO8swNsSzmFl/5FCxYWsZz8rwz31qWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775445624; c=relaxed/simple;
	bh=481Wi8F5rATpoD3yObFt4kyolEta/MdoULkTbw9tEns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1uky0HmdaIsExe+yHfc4GXT1oPr8xyjcoFXWJqEvhJZMMsSK1/NXswpDQn/eZAozLywEuHBp7KbdZ3xewwRN2i+AniANyr7dx+l8T7yyQa93dRWRnF91xFew+WQAAKdehaaUJq2PRr1mznGNeoGB+i+DVxc9COJ4aoNoojCun4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdQhmjZB; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdQhmjZB"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so1734578241.0
        for <linux-sound@vger.kernel.org>; Sun, 05 Apr 2026 20:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775445622; x=1776050422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6iklTPWapiRZ7MgWpEEMZ0NKXNj5RY7pCEbCs4h2g4=;
        b=PdQhmjZBkZudzg241asu8XKrdZ83zgAd9kzloIDMkh9CUgmB+yziqcFX1SUR48+JHT
         6AhBevQIJqtKY4IKmSvEEI0GjMrcbX7KQg8BytUqeCU89M8QmE3lkirSWkqgIsAQ8Uyr
         f046A3vPIRp8KJAheY4GD6DgtzEE7ygFAgyzyfeCSIewTS6zaM3Hpth8kUIEy9Kedu9e
         rg00DjvCF60UomUF2ucM1zpdxW5uZ0fbksbymLNDDrM0XGsrx3jd05AtufeecehwANoH
         QvYxHSEOe/j2wbn8BN4c+ACPJctGsJen6AJq7jhnTgF2DWVVOnDm04kvgbi5WIcbbgQo
         P5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775445622; x=1776050422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m6iklTPWapiRZ7MgWpEEMZ0NKXNj5RY7pCEbCs4h2g4=;
        b=DjzjuwKDfvxuNukFWSnHvtfJlkiCBTxEST1YWOJtheszVukb8rR7OnTu4HXFmUjsCO
         pNOuKlCSQ6PhRnWGAdErKe7eX3Ob0UJJV5dBLvErTFy9L0zGXFPWcf0URfWfVcGLmOA/
         3ItcwEPDQ+8eZyiF5w2SnE4A4xY6BrxoMHFIRnKb47RIege7htkjmHTxXoBLaR3aVnPS
         FvJdIzFSGrybgWvKQBt+9wEqNDkLsoJ+PoN75yN02cag8wdu7UUxjygcCIuhmUynQ2Pv
         dliGpPorPaYOrR4Q2OeK37pM02BFwS+SnB1CKda7W1aSIgOPJRmpGnTX9k2fvvV5S0iC
         zBVQ==
X-Gm-Message-State: AOJu0YzrHrgcbwTfsW+ybZgr0BTpysJNIACi7SHvQBPFdw2qfXs8SEYe
	Xx+kjuaB4kWDl0nqv4+RdffeeLujMwWipYDl2LKbWf8OKXcazl/Rq4Y7
X-Gm-Gg: AeBDiev3QscJILvCsV4cdclLnCFuXpjyUXgg4xwZFYB5UwjyiRUCbAIuzdxxhOGHgnK
	fY4hOGB4Lkd2DLz0lDK+TuCW3Fqu4c1EJfFohj2bFYUuhUlB7On5getoyGDSShB/OereIiWXJM6
	dwo5HQ+CRO2zvXareNaNIh0livYtPEAnf8KOibQ6nqU0Sd/16YfqcJq6luWysUQbeHXHzjakMaK
	6SMwrf14AkNKklFVjCmgL7IAMln4CDdzvWX99Qt2hviB7nOe8o0otOD9hfFv5DhHtE3Gie/YtDU
	9itD/0QJBsdU9Zv3LTaDYZPIZjrI83maU0N0kBxUq2D2jK/GpL4VLwmhGJuHoJLhC1q6Xbe9L/z
	1P3i7WpfVhiMDumC3xgdx88TYd7o5EK8m0kjtEOC/b44o3j+SAEugPBC97MjOratc4VI5rzFHP+
	jl+6AQqOyGzDWYNugH4OWl0aJS2o64vVWpH0aql8Xch5njvvHJmrAxrzdS+PqzgjlY04m2itpvd
	s56
X-Received: by 2002:a05:6102:1487:b0:602:b037:4de8 with SMTP id ada2fe7eead31-605a4cc6f09mr3898658137.4.1775445622284;
        Sun, 05 Apr 2026 20:20:22 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm9162146137.5.2026.04.05.20.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 20:20:22 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 06 Apr 2026 00:20:06 -0300
Subject: [PATCH 4/4] ALSA: gusmax: add ISA suspend and resume callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-b4-alsa-gus-isa-pm-v1-4-b6829a7457cd@gmail.com>
References: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
In-Reply-To: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=481Wi8F5rATpoD3yObFt4kyolEta/MdoULkTbw9tEns=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmX1bLPnL+9q8bsW4H7mh+WAdeZv1/esGnmNd+FcllbO
 yx6l2Qt7ChlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJ1Joy/OGYlaf6wdIgsOAU
 794pXQZHXCb9zNx1/Wnl0vrvFQ+3yvUz/NP4cHx3w7x7+eq+zOaXTnAY3d1w9aqWulh4T37xlO+
 LvbgB
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

gusmax still leaves its ISA PM callbacks disabled even though the shared
GF1 suspend and resume path now exists.

This board needs one extra piece of PM glue around the shared GF1 helpers.
The attached WSS codec has its own register image that must be saved and
restored across suspend, and the MAX control register must be rewritten on
resume before the codec and GF1 sides are brought back.

Use the existing wss->suspend() and wss->resume() hooks for the codec, then
wire the driver up to the shared GUS suspend and resume helpers for the GF1
side.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/gus/gusmax.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/sound/isa/gus/gusmax.c b/sound/isa/gus/gusmax.c
index b572411c4422..f1fd7ff2121d 100644
--- a/sound/isa/gus/gusmax.c
+++ b/sound/isa/gus/gusmax.c
@@ -328,12 +328,38 @@ static int snd_gusmax_probe(struct device *pdev, unsigned int dev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_gusmax_suspend(struct device *dev, unsigned int n,
+			      pm_message_t state)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct snd_gusmax *maxcard = card->private_data;
+
+	maxcard->wss->suspend(maxcard->wss);
+	return snd_gus_suspend(maxcard->gus);
+}
+
+static int snd_gusmax_resume(struct device *dev, unsigned int n)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct snd_gusmax *maxcard = card->private_data;
+
+	/* Restore the board routing latch before resuming the codec and GF1. */
+	outb(maxcard->gus->max_cntrl_val, GUSP(maxcard->gus, MAXCNTRLPORT));
+	maxcard->wss->resume(maxcard->wss);
+	return snd_gus_resume(maxcard->gus);
+}
+#endif
+
 #define DEV_NAME "gusmax"
 
 static struct isa_driver snd_gusmax_driver = {
 	.match		= snd_gusmax_match,
 	.probe		= snd_gusmax_probe,
-	/* FIXME: suspend/resume */
+#ifdef CONFIG_PM
+	.suspend	= snd_gusmax_suspend,
+	.resume		= snd_gusmax_resume,
+#endif
 	.driver		= {
 		.name	= DEV_NAME
 	},

-- 
2.53.0

