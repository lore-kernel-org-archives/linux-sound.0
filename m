Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6303BE624
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 04:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780548515; cv=none; b=r8GqP7XzmxrELd0D5fAN3pPYxXtbAxksG6NfgQL+XpBGcYiZ9B095qO1vfWKKl548fZV8ApXR9jGTbuYshpU0Lsb1NRi6OyqeAAs8Hbe/FBTPX64oWEkzw+hsU4WRQ9lt/8J1kAllf9Z9MneyELXH4HFRvXodE98O93TXCaxjFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780548515; c=relaxed/simple;
	bh=bB1vYJSSsJt9BPF1zYdGfpQ7LI1f6Y1FGNnXE5Sp1sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lb/crZT17dZKxmRxHz0IaEVsuw8UGQRz74xJYEU1Y5kAwNFNzchf0m2/DlGK7oORmfLEHwDIA8y+77hmuH6YA0ysEpOSQ4vK/tZfrC8/bphmwDL2ukGUMzU8j6S+n8DXuUdnC9li5+/OMAma1r5VwCkTPkJwftSGx4Sa9Kq0JH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtKw2geZ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtKw2geZ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304f0039c02so432352eec.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 21:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780548513; x=1781153313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXHfUcuH10L0/6a7zR3RLI3Obf5/Gim3DEF8nv2ZMnM=;
        b=WtKw2geZX47homOADiYrDtK1cUZ3//WTBoYUOOrS0fT1OmE1XmkCmcnEiBnwHE+Jws
         8uJqrsNqI/cFSk+scoiz7DgHef7vp2y82oFDEdDuuoV/BrLD81I6E11W8F69TB9AOazJ
         u1vxK+FzYe3bV1v0DsCKRRh3nz1gcqbxbWWYy7ydwImj+mKglOn5XnbmXtueQELY1eMR
         GVH28i3F/8Mqt7iXwmBcHAJeZVn2WA9Qh3S1v5nz1mQXRNgYNKErNmR2hx1U7SpibMCS
         JhKpPaTE7G5hFpTR0J9f++UTRj0fG/DboNIdv6swJ0j7BB2YJy6TPx/QAsvVJUQs0CWH
         N0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780548513; x=1781153313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UXHfUcuH10L0/6a7zR3RLI3Obf5/Gim3DEF8nv2ZMnM=;
        b=rwHS7Tqy2IONASbUguCYyO1JHq+G9qYUDOdK9fSYwrFat8LPxnNdSUqlkU8eJLp3dM
         y+U6yLLuM7/NHDvYi4LxghAr5k5pa7sIYXV68qTEKMDI0wSOOJnpy9nQXxiG5A/YCy/E
         oBbalgHhWUaYz/Ljk7gqdccJvOb+W8GwjXW6ufSmsO51U9BgdRU7srf5xXidU9Pf0NX6
         eU8foi2CtSzqkc9OiWdDqsfzYXH8ynV9kzZIKEeFvweB1npZJNf9Jlds3CBOPqK7xvoc
         IFT034o2j+oxJIEJ9PIcuOxBRwosNd5fwf2sDJOCDSr1U20xmH6w9LiHjm5AIR07hM1G
         I40g==
X-Gm-Message-State: AOJu0Yxm6mvBS02GMrhdTsSKrFFiP/BMv65XuisvpFvf6r5RQWZyHwfr
	WQ/7EG2+9fvHVyPaf+3LlpfOvYzJLWNu8oUlrgRj1WFwJP0UrYV5wS4y
X-Gm-Gg: Acq92OG82XbU0t4xDjKm0ardTnt82NnQbVGTVRwYoclSQfspm5MWE2x/Ei1yxytI/NL
	JGTmowlm0JJi0riL7l4mxOa/iPYeA9k3ORmqVxLMPcOb6ZHYt9uVmzDvtyTXLjOWz+E3yyrpFgT
	vno/6shvyVADmcdIU70RmdkjT/Y8qyTOq3ojcCP9luBoxCor3whl0O3zclYlo3CcqTDdUQJ6WbQ
	l75jlFDGobpJ5ZpwLO48naNrEpfQXyRiuV8W9384vk8DzSphtt+2bhDbHRSJ3ccA0ChUkS8577y
	eljv6bnpBcd3TjJ+uppMmlem3Nb4+uvjo5gEyZH2saPjANHeHTkRbmVWoVrCFQWObs8k3eJpG7e
	AQGB2tEC044A/8a+Bic2COKUtqwFkC25YWamBXgdyvOUe+QoacwMWX+wy//ZJxUHSwi7H8FBY1O
	iS57GartaRfnlQT4+riysk1SCIZhQ/4aPtJO3Mz8As5XW79rHW6ll/3BIKCGnWzd0tWZQEh7mmc
	iF2MpKSwWe6
X-Received: by 2002:a05:7301:9f0a:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-3074fb82479mr3992499eec.17.1780548512851;
        Wed, 03 Jun 2026 21:48:32 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm3815039eec.10.2026.06.03.21.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:48:32 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 04 Jun 2026 01:48:13 -0300
Subject: [PATCH 2/3] ALSA: core: Add scoped cleanup helper for card
 references
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-alsa-scoped-cleanups-v1-2-10c43152a728@gmail.com>
References: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
In-Reply-To: <20260604-alsa-scoped-cleanups-v1-0-10c43152a728@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=bB1vYJSSsJt9BPF1zYdGfpQ7LI1f6Y1FGNnXE5Sp1sw=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmKzDP+NcrrTtoxy3fdLNegYscZZ5+eiZ7+pIOj/J2Xj
 V5GudSRjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZhI51OG/3n3Sq6eCf4+safY
 p7nb5PWSS2ZPfrzM37i28mnRTuOUXFFGhtvnUnhmJbVMzz+873CLR0O4dDvXq5Lb53srZW6LJnY
 8YAYA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Several ALSA paths acquire temporary card references with snd_card_ref()
and release them manually with snd_card_unref(). control_led.c already
defines a local cleanup helper for this pattern, while other core paths
still open-code the release.

Move the helper to the common ALSA core header and use it in control-layer
card-reference paths. This makes the ownership rule explicit and avoids
future missing-unref mistakes when adding early exits.

No functional change is intended.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/core.h     |  2 ++
 sound/core/control.c     |  6 +++---
 sound/core/control_led.c | 11 ++++-------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 4bb76c21c956..8b2ca95d13f7 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -319,6 +319,8 @@ static inline void snd_card_unref(struct snd_card *card)
 	put_device(&card->card_dev);
 }
 
+DEFINE_FREE(snd_card_unref, struct snd_card *, if (_T) snd_card_unref(_T))
+
 #define snd_card_set_dev(card, devptr) ((card)->dev = (devptr))
 
 /* device.c */
diff --git a/sound/core/control.c b/sound/core/control.c
index 28fffbe92e66..7a8dc506221e 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2291,7 +2291,6 @@ EXPORT_SYMBOL_GPL(snd_ctl_request_layer);
  */
 void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
 {
-	struct snd_card *card;
 	int card_number;
 
 	scoped_guard(rwsem_write, &snd_ctl_layer_rwsem) {
@@ -2299,11 +2298,12 @@ void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
 		snd_ctl_layer = lops;
 	}
 	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
-		card = snd_card_ref(card_number);
+		struct snd_card *card __free(snd_card_unref) =
+			snd_card_ref(card_number);
+
 		if (card) {
 			scoped_guard(rwsem_read, &card->controls_rwsem)
 				lops->lregister(card);
-			snd_card_unref(card);
 		}
 	}
 }
diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index d92b36ab5ec6..8cbacee57ce7 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -240,8 +240,6 @@ static void snd_ctl_led_notify(struct snd_card *card, unsigned int mask,
 	}
 }
 
-DEFINE_FREE(snd_card_unref, struct snd_card *, if (_T) snd_card_unref(_T))
-
 static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 			      unsigned int group, bool set)
 {
@@ -758,18 +756,17 @@ static int __init snd_ctl_led_init(void)
 static void __exit snd_ctl_led_exit(void)
 {
 	struct snd_ctl_led *led;
-	struct snd_card *card;
 	unsigned int group, card_number;
 
 	snd_ctl_disconnect_layer(&snd_ctl_led_lops);
 	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
 		if (!snd_ctl_led_card_valid[card_number])
 			continue;
-		card = snd_card_ref(card_number);
-		if (card) {
+		struct snd_card *card __free(snd_card_unref) =
+			snd_card_ref(card_number);
+
+		if (card)
 			snd_ctl_led_sysfs_remove(card);
-			snd_card_unref(card);
-		}
 	}
 	for (group = 0; group < MAX_LED; group++) {
 		led = &snd_ctl_leds[group];

-- 
2.54.0

