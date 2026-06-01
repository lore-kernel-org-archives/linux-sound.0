Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13DA5733E
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 01:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780277027; cv=none; b=j4warrAjJYriGmrJt9sDgfwhzVFfDUhN46IgzFpOa39QqtNJNaPEPtNUk1AG7yuTYu5UkkUT+qp623EHCpHi7Q5N2ucvjLi00alajP0o0ple37adPybkg7N8gjwOw/ASzh7KMJEQNyp3qJ+17D8gGfI33uLYRzzFTkV0y7XuO/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780277027; c=relaxed/simple;
	bh=nJCgTMFiRgabN3an7EYZs+NWRtA61piWagt15POy5qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WNoubwJXQQUakMVYfMU6CjcPIlIPB/FxMMWaCPmRs6hHLcOCEveHAGpXWDONMc599HTawIU7lmlBl1NQwhHAyEp8ZKVLWTPD0ef8VLxezVgLXPbGr+j2AWxz2lMrSxuuzMEUaT2JjeVeSO0on7R3JFXlle1gOMuK4orRftl5w7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMmiwYy1; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMmiwYy1"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137d457acd4so1109517c88.0
        for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 18:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780277025; x=1780881825; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZcjgvZCvNpJWentv+qnXvtNSSU1VFpEqOO1EMSQO+g=;
        b=UMmiwYy1kFbeNWVquEy+PLlXRG0iOD7Me9bh/5UuEJXDIN3Nqmqj8/FPoI14Rg2sjo
         ExPaPLJoM5cWbsX217JMRQj9WjR7pdJt+MGbHnQHAocL9zmCQUxgYbBTZ53lo8hQoqe4
         2nF4gIVEK9qAiLQTB1JneoaeL9l9obBlOy/VQbNHpLj/5015i2BT5uc10DQw5zf3u8QC
         uNNEQJl0xajlscF5Zp+QJJ0+2II9HyAmw7AjHePOmg4lL9MVtAipWPp5r+QBkZzBFXAU
         0uiKrvOdBv/fmYqAnZ41K+hhS0I1T16kRnuxDpkODXAvSnPcFdEtCq5IJsKq38Kecm71
         U4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780277025; x=1780881825;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZcjgvZCvNpJWentv+qnXvtNSSU1VFpEqOO1EMSQO+g=;
        b=deTD1y/3eu7pJ24xn74Xizm3tk3us1wj7h1Ig3UCeUDOjThZaYMAaXLKpgAuuR0als
         v1xwRmGSZdwOXFPDCPyU7OWiDlPWd/1szJRjYv1mPkK3iDTrhi7mgi3L3XUI7XQ0V3q8
         Id44Q3IWF8S8DjIvIKpjgMZ+rd6YnboIOvuKAxJO7Oiq9uvvMsgrhGNcdRvrAZbGSMCZ
         nj5Mp4slrznLg2vz8E42X9HKQ6La1aoy2dorFiD26ZyMqZuzvnEfx51ytkK2PI7qZnPt
         pF/mc6tL0z7HUeVtgm7R7cl6XmrP7JzWJHPkn/jHOhZlPCIfZFQfPV6aUTyk9Ka9uh0U
         Z5jw==
X-Gm-Message-State: AOJu0Yx0ZmOIL1bYroii/tAe9I2or9K+K0Z4ILvS9ecSrzCeVPHhV2MV
	T+XcvLkAaHkfV1XDh8p/S0nBkH/jTlIULtvVSUZFYGXBlfEABngO7cQ4
X-Gm-Gg: Acq92OEFygm39oPWjCHczZw8GmTCr7EWKa5s1e9Jng+BGeUBHRND+/xLIXOB0ICCAU4
	nddc7WanzykbuSMgPvYxdxhDQxqCqvaz0Fpq07mjo4WMaKVDuvvsZQnUMBkObT2tiErhftwdyEF
	vBpJqkHZfI/ekPwfcBhRO7gPG4HN5agcXIfJb/oOnu4hjcWkATP/IxZObOdy32BmXazvuMvsN9l
	mVyKKoQlqOVsaLdp+lTCJt30UoO2O1JzCG90N/GTbl9q4M9DTZDyCRdN98EerbbJQ8kqq5StZfQ
	vfZ3QlSwedWAP/kuD1cHnZXSd/KFLqzSM1ROIQZe4mo/X+UuFqVd0MXppRWwjVfWf2MxWDl7KJK
	/mQYTnvwKZRn97y45GLHgQvIVPHLUrT91A7i/PuDxTuxCXsbHpw3QG2Lm782GKRFoRm0LPiB5vE
	4+NpOlbSFsrNxdi5zsWyKJN6Z0Ox20hMbnAJj8h+xP14mbB+MbiSTKnRG3EN7d3yNBgEanaTkaa
	aYXvAtzdUAv
X-Received: by 2002:a05:7022:6083:b0:12d:c9b6:bbe2 with SMTP id a92af1059eb24-137d43bbedfmr3995240c88.2.1780277024699;
        Sun, 31 May 2026 18:23:44 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm5835614c88.9.2026.05.31.18.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 18:23:44 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 31 May 2026 22:23:35 -0300
Subject: [PATCH v2] ALSA: core: Use flexible array for card private data
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-alsa-card-private-flex-array-v2-1-e4ff67f5bd23@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBAAf4Xs2TVtSQU88R/Gw1IWqOGVLRIM4
 d8FvXjyOMlkZoXA4jnANVpBePbBD/0O5hSBa6ivGX25MxhlLsrGGqkNhI6kxFH8TBNj1fKCJEI
 vNEnqbBGrTJODPTEKV3755G/3L4dn8WA3Hc3DqGTocGqE6Wdjsv+bWaPGOFFc2JSN1ZTXHfn27
 IYOtu0NtBEJMNQAAAA=
X-Change-ID: 20260531-alsa-card-private-flex-array-278c5b3091ac
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=nJCgTMFiRgabN3an7EYZs+NWRtA61piWagt15POy5qI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFky9+UmmSyseMCpUGfbLDn9NKfTzeVqnIFf+RrLhQ4xP
 GQ2cfneUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABNx5mP4Z7+HY9nW1/ovps86
 8+u979Kn5g/l5Vh3Vje9vrn6+esdznIM/yyUM9e4t7Dsyntdqu6wctqr0NTMKYnXl+1+yatppbB
 ZjAUA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_card_new() and snd_devm_card_new() allocate struct snd_card
together with optional driver-private storage. The storage is currently
described only by open-coded sizeof(*card) + extra_size arithmetic, and
snd_card_init() reaches it by manually adding sizeof(struct snd_card) to
the card pointer.

Make the trailing storage explicit with a flexible array member. Use
kzalloc_flex() for the regular allocation path and struct_size() for the
devres allocation size. This documents the layout and avoids open-coded
variable-size object arithmetic.

Align the flexible array to unsigned long long so the driver-private area
does not become less aligned than the old sizeof(struct snd_card) tail
address on 32-bit ABIs.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- Use kzalloc_flex() for the snd_card_new() allocation path.
- Link to v1: https://patch.msgid.link/20260529-alsa-card-private-flex-array-v1-1-370eb58e251a@gmail.com
---
 include/sound/core.h | 2 ++
 sound/core/init.c    | 7 ++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

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
index 0c316189e947..2408160b8ea1 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -181,7 +181,7 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 
 	if (extra_size < 0)
 		extra_size = 0;
-	card = kzalloc(sizeof(*card) + extra_size, GFP_KERNEL);
+	card = kzalloc_flex(*card, private_data_area, extra_size);
 	if (!card)
 		return -ENOMEM;
 
@@ -232,7 +232,8 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 	int err;
 
 	*card_ret = NULL;
-	card = devres_alloc(__snd_card_release, sizeof(*card) + extra_size,
+	card = devres_alloc(__snd_card_release,
+			    struct_size(card, private_data_area, extra_size),
 			    GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
@@ -280,7 +281,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	int err;
 
 	if (extra_size > 0)
-		card->private_data = (char *)card + sizeof(struct snd_card);
+		card->private_data = card->private_data_area;
 	if (xid)
 		strscpy(card->id, xid, sizeof(card->id));
 	err = 0;

---
base-commit: 5fa82dd6492e9ac3ab27d2c15d73b601b4e6a87d
change-id: 20260531-alsa-card-private-flex-array-278c5b3091ac

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

