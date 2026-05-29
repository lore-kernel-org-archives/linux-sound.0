Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E573AC0C4
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063918; cv=none; b=gArFFwQo5jTfbhaOxlWdDtrG50mVZLo4IYc45Mi3xQ3A91oeBlpgJBQFGrF83nw6QrXwQdYBYtrpCrw6f+1PK+BP6rRFXKOXhP5YY1Wgm2baIDB95PzBnP2Aejq8x0CeysEA9qkOPJdw01m0am/Jd6ejKNkeVbHftBTJZq2H6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063918; c=relaxed/simple;
	bh=voMnBWS8cEwfefp8PCxJqjZI5qwsBJ+SwoKj9MSHzzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YdxyzQZYOUjPy8IVXKGihYSyuNqiGzmzVqV6fkCiSPlGKvXNlIdRVIduaHv16pa/A5JotJ4aRaslQdm46I6oBKGxw0wBRvYjFx0mVtJqw9JhyUMo53R1s2Rb8QlSPkIRfKO5x/gK7SbG56umHhO7T6v+txImqn3qZBdKEB7mtGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QC9Q1Gb6; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QC9Q1Gb6"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12ddbe104ccso10236897c88.0
        for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063912; x=1780668712; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Im9EwLlskN6tLRrDssrI4Txz2shPxQYbcfE75EYkiHM=;
        b=QC9Q1Gb6HwWBnBAb+vU5G+e4Dk3zz6LyUoV47WbTb6nx/72uG0atjJCRXLiV9Fy4PU
         bUNq8JzFwkST+RV12UpKAG5Q1P3s8ALjjP1nM7dwhQAg9UxvL2EgqgH1OGrt3Q3R8JsF
         plbTO8PmBGVwmplaeND31FXqWMPaPHdnMX2NLlBSM6b5LPN6IP+JjxJblJRfY+BYvAH9
         WHexXuqebwe/Tol8dmlRgA/lClIgWI6g1d0FPAO3kc3JiMOL1l82BbR9Tqc6MW3QMobx
         OXyUAXTKNXqXQNucBqtg+lh9PSZ2DIpo6JJsyqZSuSS9y2klcEOkQkdTTxyxrP2A/KqG
         RK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063912; x=1780668712;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im9EwLlskN6tLRrDssrI4Txz2shPxQYbcfE75EYkiHM=;
        b=WlS5LFwO83wGum32wUBdsnIQELE1ywsnHqWx/nfCXINVUwaqyLghXdZ/sn+8ieIyDN
         fhhY7oP4w4x/9V0K/lToZMXkiHj+RHSt2AX45MjWjC3HRJ+RxvZXWU6RSAi2b2MauwCs
         5dzpYrx2Tocwr9IMNZhIgmlltrzDqevtD1KKdaXG1pWlp0KmZ/wL/bKf+XsNV07T5pos
         vE7LHTt2EtB9nwOD+TMBJHT6gP7Yb8F104gk0Y6VZMQ5W7M+TPdhxtzet7BcTxIxgLgx
         ap0kI1jcdpqUOwBssx3vJwE9blxscLAEJBKGqZHDJqVB8/wicTD4Tevq4lxprDO6pTGm
         qidw==
X-Gm-Message-State: AOJu0YxmbZ5nhyaW/ElMKAp21nDWbvE735xWkrdtYFiP7vP01O9c3Gz8
	NSVRuXLom0KuJalrA6QVNYFQK7rLT3bN6bUI95bh5+voWZAxwDDfiQgQ
X-Gm-Gg: Acq92OHCuOOtiuNs3ZNAoeSmYV/Sz+1L4Arh5HizthMN8SqghyuF5nZMyLIdmOLb4e8
	4W1z3G2v/SKt1HOXUozyb5mKzpGARlI53BdsDIQSY9bCFq5MSW6Qg1FWn3SCMUzZEmHwup8DdwW
	XxsbcfDS3D7Tv3IDvcdYDWaaG8xIdw0H9KS1IXyS64oLQYyHbEnF0UP4amaEFmoVc7wnj5lyXoa
	t8o5oo9oD0PYWWGpKEMj1WRnIzKAREkXGtISHpWdl1J8Sg4apbo+xPKiimShqvSbj6Uwix+vX0e
	S9/ZPdr0MwgjTj8PalmmVNkISFUr2iHWGxHoAI/apwsDNZ3DLptNiZuGes/hPXODhItNzm+KTyV
	Ri2sZxJCTmy7P/y5LQuWyuXqh1BWfj409ng3ATd+jBG3+C4hRbLm3sniEIWEsRST8KPGL5mjo2y
	WFJaPyj5gUrfnSOzfrWEV3Wp/a19FmyTFktaDX8+gbeqfZcFNs325u/prBAfUUwJfJx9shsiyle
	UyUIyCWZIqLpoTBSngyaqY=
X-Received: by 2002:a05:7022:62a2:b0:137:6781:7dbb with SMTP id a92af1059eb24-137aedca82bmr1146585c88.27.1780063911838;
        Fri, 29 May 2026 07:11:51 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bcfsm1172473c88.10.2026.05.29.07.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:11:51 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 29 May 2026 11:11:45 -0300
Subject: [PATCH] ALSA: core: Use flexible array for card private data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-alsa-card-private-flex-array-v1-1-370eb58e251a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAwAwK+Qnm2CK3DwK8ZDd7fVGoKkBYIh/
 J1Vj3OZDZxN2eFabWC8qOt7KDifKkhPGh6Mmosh1KGr29Ah9U6YyDKOpgtNjNLzimRGH2ylyRJ
 TFAkXKMVoLLr++tv9b5/ji9P0PWHfD5eZjGSAAAAA
X-Change-ID: 20260526-alsa-card-private-flex-array-5f4dfbcbff23
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2634;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=voMnBWS8cEwfefp8PCxJqjZI5qwsBJ+SwoKj9MSHzzM=;
 b=kA0DAAoW0F0/Glr/7oMByyZiAGoZnqWi68AFg0fguHvbXC0oTiAMeGaEKadjoio/Bc+Xh+aXe
 4h1BAAWCgAdFiEEq2KiObyK4NV/XqhI0F0/Glr/7oMFAmoZnqUACgkQ0F0/Glr/7oP8AgEA2GHz
 Yen4o7ZFzjYKqBB8QlSGODUT/IQ/IcSDimleRG0BAIMD7hKg66lJ7WzMtFhYqme96ESl59RpFVg
 u/xa+/0UL
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_card_new() and snd_devm_card_new() allocate struct snd_card
together with optional driver-private storage. The storage is currently
described only by open-coded sizeof(*card) + extra_size arithmetic, and
snd_card_init() reaches it by manually adding sizeof(struct snd_card) to
the card pointer.

Make the trailing storage explicit with a flexible array member and use
struct_size() for the allocation size. This documents the layout and
avoids open-coded variable-size object arithmetic.

Align the flexible array to unsigned long long so the driver-private area
does not become less aligned than the old sizeof(struct snd_card) tail
address on 32-bit ABIs.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/core.h | 2 ++
 sound/core/init.c    | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 4093ec82a0a1..4bb76c21c956 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -148,6 +148,8 @@ struct snd_card {
 	struct snd_mixer_oss *mixer_oss;
 	int mixer_oss_change_count;
 #endif
+
+	unsigned char private_data_area[] __aligned(__alignof__(unsigned long long));
 };
 
 #define dev_to_snd_card(p)	container_of(p, struct snd_card, card_dev)
diff --git a/sound/core/init.c b/sound/core/init.c
index 0c316189e947..98e702ffa856 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -181,7 +181,8 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 
 	if (extra_size < 0)
 		extra_size = 0;
-	card = kzalloc(sizeof(*card) + extra_size, GFP_KERNEL);
+	card = kzalloc(struct_size(card, private_data_area, extra_size),
+		       GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
 
@@ -232,7 +233,8 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 	int err;
 
 	*card_ret = NULL;
-	card = devres_alloc(__snd_card_release, sizeof(*card) + extra_size,
+	card = devres_alloc(__snd_card_release,
+			    struct_size(card, private_data_area, extra_size),
 			    GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
@@ -280,7 +282,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	int err;
 
 	if (extra_size > 0)
-		card->private_data = (char *)card + sizeof(struct snd_card);
+		card->private_data = card->private_data_area;
 	if (xid)
 		strscpy(card->id, xid, sizeof(card->id));
 	err = 0;

---
base-commit: c784d0e6a62abbd2af58bbbe2d20f88dd550e3eb
change-id: 20260526-alsa-card-private-flex-array-5f4dfbcbff23

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

