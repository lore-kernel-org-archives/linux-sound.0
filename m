Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691671;
	b=4hH1Jyib3GQcaolERzdSc+D+0MRtinb2x4rFB69pgSVYLBtKoXiMDwNrDGyRGjwIO4fe
	 0ueMZ4ybjELdP3P7SBpPT2akjEVA0VJCJacczSP95bsaOT5Pu4hsul6ygiqXnYgdSQWFp
	 Ubq9EyBwbXJNgsZeCYoK7FLLr8MsMIXuagRqUg6kYo4GQGJnDUfgGrF3QRCKrKDpO3mlC
	 pDoDTf1c4fyvqfi/kb5A6wuZnyzQ0j8v/2yGrY/BBzsikBqolfvecYjV4J6VuKagAn08g
	 Q0b/fPyxl5iD2pH3C9d/QyD+2ht3sUMcpD4awRaATjJQxE5SdRB5RSKig2BrLi9PGxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
	b=JknxuY1cym0w0wy3zJ1vc+Zs6uQa8bp6+KifAejrJMFgs2os6B9X8jO1ZLB5eF+vO6iV
	 lXq3HJTxoHopDM/PpL7WKcrjmeEvz9zZpOaGgpkm6HUBMWyGuN2ukth/2etSOCKEPCJxG
	 nx0g3bD7EMpJcIvUZXfPLHJNwQBXmdmjkGDYq9wgFF9B9VDBYq6HGAoc++g2YFqXHfDyr
	 WCso0J9x9u2gJlpaLiSzUUTwkppVTWqu0ZwFnsQxiLCkzMgfE6BFkpp7Am2chsJYjetFr
	 3KYR0rN/JGwgWMaDvYXZWrRcG0SKLGKqXh6Ahz7Ld84RJFSXDdcYG99N4tUfHyFFjYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZqlL7Br;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE1B606A32F
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE1B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZqlL7Br
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1604703a12.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691671; x=1794296471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=GZqlL7BrWlZyuXUeUESSneSvR59/v7EsOw+HT2GDB044L9f00feUe8TGORYlP2WxGJ
         Ks8SwuUUYI2dgxH+W4OfFZSQlm2kYh//77BVnQgBOkl6hfOP0ufUo+zw1Rz/7SDYl8kp
         PPG0VP6h1bbRSF+QglgfG/d1tocj2mKisThgCJZdlLezhdCwhDnC3mh6jEIMjw9HSWlH
         Eqx3PAYC072wmpf6jDaxW+1J/w94Cncz8znFiIlRqiKjJIkGxztqY+CHi+GxfitubNCS
         SucMQxLtit23/W9+3fIg9d45CR4yJjwvlTjy/PtUzyWu+9UsU4Z3jYSkgZodC/HSjgfS
         XBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691671; x=1794296471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzVZd7Sd5nTndrVxkEAfFRXwZl3Unz5GPtpn9y+HXD0=;
        b=PfpuUu7eZhPVEzr86f7Lj7MtU/Pksni82PROsPecGL5p94NNjshoq2bqYA6P/6svJl
         rvfGXRZm/uy66bq9HDFjLV8A2/rnP7xA1fELqYXdcv5/5naj8sEfneUw91rP9dpw3Vf7
         cw+uXkZ9Yck4nVQ+q4J5O1T7ob1XYoThf2lW5yhIpVYodLs1VPaawH1+YXNjhGEqR18c
         g9uO8f1Fda8rHrgsZHt4OYOdsQBAKXGEUOn/39qycyhg6EF8UJF8wM9oN5D0fRUfpDh0
         XBd206FGsHaTTxQhAMsJ4sFthuBOZYiSFsTmiMBfU3XCODLzXMAUXiGG9jsNsjj+atbN
         DN7g==
X-Forwarded-Encrypted: i=1; AKwUvBxlA3otUiMKeCEgdXtNTyJoKiRnk/1fwp8wNxaNACqhBlbQBsovT5OKBR0ugQM6BSb+2aYNlWrbLeyZDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lwt6BwUAeLmt4bmj4l8IEQO5Sdax6gCPQwXWbNNxOKJrV1b5j
	qivf2Gktz01MLNmika2Fz/R/lqgLGvwNZ1H5Wd0IAUCyrxgrR621wlWC
X-Gm-Gg: AYBFou1P/AJp2z2QymaClUPD+knjLaP6yC58BKpfTjbHthsYpbg3rEwsymV8SZfzjsA
	6BYBbp84fJc66ZMYM2v7QmEihmpxKwKODbCrOrpiBxC34ICt6jQkZxFrWH8DUCbF795lVe5Tdlp
	Ksaz5uurrIOitfkPqynD0CS15iG0oXyk4JFEB58NMHp/QLOS02PU2WiAxYs/g20MxFRIMLvR3Oy
	kXCXf8R7+I3DRrU0319/DVmRtjNHhIeULzXKXtzYH3TMAgB5XmC1hbYpOZZxFNDSWGXumQBHDoP
	wS9nqV6BY5jsJB3sK2BRUIrOodr5qeQzjxgEDRy36Es6ktWEYHH1D3GDsJsjfYWpGaP4F6vXV/d
	8CItKdr9R1U2EeLKb6Iojw53pMbRDSVSKY74Oue5FqligIkoCOXBEa7tWvlYnjrF1ORD912JgLy
	XUlbeI0j+AHb9itQvjPVKRnlDhmHWTxQ8xzUVTpvFPcXJEFLS8sic7ZayErxnC60wBCCsLf89MX
	apA9odC0lWvgprBVJXoXhUPVtAMnNid/6lAHZPWSMXrKUyCuAymo1SF+RjfbZJnD4Ma1R9SIId1
	WaIU4rydwc/tToWtEnzqquqcaSD4ajgDwhsyi835+6ryjXpC5QrTGeD2uj3HbGBP1Nr77xZlkE+
	K7lO2vIl8gtgF/6W8C9Bsr9QXYdYBiFzI8R6M7K+ebByOC726imrpOCNlu8WWW4/xRF0aHdj9U7
	It9/c=
X-Received: by 2002:a17:90b:1c07:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3ae897c9501mr9764839a91.19.1793691670795;
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:55 +1000
Subject: [PATCH v4 07/22] ASoC: card: Let 'fixup_controls' return errors
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-7-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=2OZVyHzqzH+8PcXoAdYlRjbU/QYAqY/WFwuuw7hvh0s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88dv6PWURB1okEw5aSq8G7Wic51S16aXTmtcOFTt
 eLLV2z3OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMdvpPhf2bIkuV7z5n6rp6tmH227+eD7Ie9ojtd1veKTHyVlxhwSZvhf+iWG13
 LWxZ/3KeeNcnGfUeJ1OWZzZXCR3bNaWVlULpzkA8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Let the 'fixup_controls' card method return error values which will roll
back the half-done binding of the card.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-card.h                  |  2 +-
 include/sound/soc.h                       |  2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |  4 +++-
 sound/soc/soc-card.c                      | 12 +++++++++---
 sound/soc/soc-core.c                      |  5 ++++-
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 1f1e7d45f553..c392e6c4844b 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -44,7 +44,7 @@ int snd_soc_card_resume_post(struct snd_soc_card *card);
 
 int snd_soc_card_probe(struct snd_soc_card *card);
 int snd_soc_card_late_probe(struct snd_soc_card *card);
-void snd_soc_card_fixup_controls(struct snd_soc_card *card);
+int snd_soc_card_fixup_controls(struct snd_soc_card *card);
 int snd_soc_card_remove(struct snd_soc_card *card);
 
 void snd_soc_card_set_topology_name(struct snd_soc_card *card, const char *preifx);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index c77119f92dd3..771234028fd1 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -992,7 +992,7 @@ struct snd_soc_card {
 
 	int (*probe)(struct snd_soc_card *card);
 	int (*late_probe)(struct snd_soc_card *card);
-	void (*fixup_controls)(struct snd_soc_card *card);
+	int (*fixup_controls)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
 	/* the pre and post PM functions are used to do any PM work before and
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index f07aeb637108..f93e830ef4a6 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1283,7 +1283,7 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
-static void mt8188_fixup_controls(struct snd_soc_card *card)
+static int mt8188_fixup_controls(struct snd_soc_card *card)
 {
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
@@ -1305,6 +1305,8 @@ static void mt8188_fixup_controls(struct snd_soc_card *card)
 		else
 			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
 	}
+
+	return 0;
 }
 
 static struct snd_soc_card mt8188_mt6359_soc_card = {
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 282d666dae9e..e4d81329cde3 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -184,10 +184,16 @@ int snd_soc_card_late_probe(struct snd_soc_card *card)
 	return 0;
 }
 
-void snd_soc_card_fixup_controls(struct snd_soc_card *card)
+int snd_soc_card_fixup_controls(struct snd_soc_card *card)
 {
-	if (card->fixup_controls)
-		card->fixup_controls(card);
+	if (card->fixup_controls) {
+		int ret = card->fixup_controls(card);
+
+		if (ret < 0)
+			return soc_card_ret(card, ret);
+	}
+
+	return 0;
 }
 
 int snd_soc_card_remove(struct snd_soc_card *card)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f33bece378b6..d4743d68deb6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1845,7 +1845,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (ret < 0)
 			goto probe_end;
 	}
-	snd_soc_card_fixup_controls(card);
+
+	ret = snd_soc_card_fixup_controls(card);
+	if (ret < 0)
+		goto probe_end;
 
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {

-- 
2.56.0

