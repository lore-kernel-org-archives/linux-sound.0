Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE6324B16
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043947; cv=none; b=MO4gXjlKwazy0dXgxdqQ4uS29kfcdnw2nUmKQtz15LOGD8kwa3zd1IktyqOvauGj5vendQLC29UaHCPQgaJrhyy9or0d6ZuKhMB9q/wT16gs4fyS1XjdYUgu2jMqD0Q3k/IwQvs5V3ZmuaSVBo8GfcGoKzUMxdU3uTjSDwBlsY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043947; c=relaxed/simple;
	bh=SgAKu3w02+QeTfuUSDWuohDIpW34VKXcOJeJEWHNI8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G4Eg/fUzUBb1PcFhU5hOvjshdq70BLXDqQSpffEZqW0g4KtteTNQOmNVZJuNaNJ31bOMVGygx3RH8DAjdszfjyb2FplNjtUu8pO1637a78KCUpjU5Nba+RdCMD0pgMfdDXx0fML3mlQMzl0yQ1D6QCa45KCtw4JUskla/qEeLB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLqV4iEB; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLqV4iEB"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c54c68db4dso6143211eec.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Apr 2026 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775043945; x=1775648745; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgccuMBanA331lWrXQNSWh5waQBY5u44pRfQZ1IB7tA=;
        b=MLqV4iEBTQCHPHrsVzmboTbFbLD0kIgwzhmIEMA6e2nka8zGgmbXHKWDxX2ThjLcSr
         DZwHJ4ksiOwzzwsKexqaYIJx4TQqncNoMTHvB1uBjiMYGkMwTWb5wrvV4/YU+I6fa1Hu
         ehr6U9KWpnxeWeNpuWAYyTAkNqcDm0eSV1uTta92QRsZ06PA6as/6GwPaJTM1RygiYvJ
         zkIVVU4abwZUU77KVTjHK/69LrwFaQcJitoxplycSGslsQcfyAs8FXTchZYY1N+QHV0a
         p5J5XA40slbF+rf8V70GhgSEhsGKG5zJRBJBVk3DboN+6ibfTlGDiyKNnHrfMMlcWw13
         nZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043945; x=1775648745;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgccuMBanA331lWrXQNSWh5waQBY5u44pRfQZ1IB7tA=;
        b=nRIzt4i1qhWvaiIpXA+2jT0kPshY69n3/3MjoQHCOSox8YWNVQV22OYjkmHwpGn7N0
         Y/h3eNua3ZR5tySqE5lWjR/rdgctveWRlBRejOnZPsrWEtdWPnY2lwJQzPgxiXBtlclo
         rIesFK4E51OpI4hfRcDX+51JIZ4coNMg5AMWdVB9ICc9x1MTw9eFmauK58GjMFgN6vux
         TPO1EqFIIUn9HDfhbnVyc8za9sCVdVD2tJc/YEtwGdB8G716kfhBKAR8S9pDc6nVhhwO
         NDOF0dVXLjylBe/97/FGE4hWRUuqCnV/7jDtRaBlyopB7+v3riT2Jp2tKVIoLwXrOMG7
         Wdow==
X-Gm-Message-State: AOJu0YwTnkbI/ZAZ692aR0m9eV/WYVbg4jpgu43XNV5FtiEbZy5xrQ3X
	eXCotdf6Xt2P6JcAQpIYYVRl6m8R2O8gwz6WOFTJiEtXp75bjk7MX+Hb
X-Gm-Gg: ATEYQzwnFGp7Z+dCoadOEFldUbYRsFR/PS1PcA5NziHCJpo0oMP/t7Fj3BWxQQf/Gi/
	5TrvIBEmEBmK6MXt03+O18TxiyQZcscqlsD1zMyZAVR8bMFbd7uGboocdViW+ckT42Z/NW8r/dM
	wo+vSI2d+OOuF224dTV8dj0cgQiK2kkvqDdOWosdPKr6U20at6L3FyEq7fHJQKg4q3hRNh196Va
	FLxSdicdoQQAUev6q1yQHoRNOJV9Q5Ok2TVMiTbYUxC5M+0DcyEKsg2Z4zRXRckO1HaSiapllUs
	UhtKbwXTdKWTHK3l4hTOLE37uZyUuEfSKnDczEGrsmlnbnjP7yyN+EWk6eafSTzJOQ030jOv5mg
	8mZBF8tblgrZ5xcCY2AzcAAY68OZ4gpWFSoxN4DuV0++wqV6GMZ0OVr273S2nMyj/H3R2JQS+Vy
	OpISaDabzyvYl4XmKDOyIFG2ijS+sOxxXcmfYWCATXiRqKyxrnHneLZtRJlbhsPEVNaAX6W2Cos
	lr7rjZIMFBpxV0=
X-Received: by 2002:a05:7301:1015:b0:2c5:ed1b:c8a with SMTP id 5a478bee46e88-2c930c76645mr1830944eec.5.1775043945177;
        Wed, 01 Apr 2026 04:45:45 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-218.user3p.v-tal.net.br. [177.4.161.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c4cbbc1fsm11999306eec.13.2026.04.01.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:45:44 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 01 Apr 2026 08:45:37 -0300
Subject: [PATCH] ALSA: es1688: add ISA suspend and resume callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-alsa-es1688-pm-v1-1-510767628fe6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2Io4TQq4iLmEx1xFrJaCmId
 ze2y7f4/wDlJKzwKA5I/BGV95JRlQWE0S8Do8RsIEPW1LVBP6tH1so6h+sLXWMicYhEzkKO1sR
 P+f6Gbfe37v3EYbsvcJ4Xg7o09XIAAAA=
X-Change-ID: 20260330-alsa-es1688-pm-840d2ecd2286
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3132;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=SgAKu3w02+QeTfuUSDWuohDIpW34VKXcOJeJEWHNI8A=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlnWdOrlaxbjjzMdjRPrju6Il5m3nXLosh9S3ibTf1PG
 nHf8ovuKGVhEONikBVTZFmdtMhyT9eDq/VxKzxg5rAygQxh4OIUgIk8Xs7IcHZ26eGdPRGtkRtX
 TNqlpvqENXHznimXFBcnKTwIq553vpSRYc9pBaeTNyed36J4Ra/ZwWJpr/xFzVhTztWxXPt6TG+
 d5wQA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The ISA ES1688 driver still carries a disabled suspend/resume block in
its isa_driver definition, while the same file already provides minimal
power-management handling for the PnP ES968 path.

Add ISA-specific PM callbacks and factor the existing ES1688 suspend and
resume sequence into common card-level helpers shared by both probe
paths. Suspend moves the card to D3hot. Resume reinitializes the chip
with snd_es1688_reset() and restores the card to D0, propagating reset
failures to the caller.

This wires up power-management callbacks for the ISA path and keeps the
PM handling consistent between the ISA and PnP probe paths.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/es1688/es1688.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
index 6a95dfb7600a..7255b34f9148 100644
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -184,12 +184,44 @@ static int snd_es1688_isa_probe(struct device *dev, unsigned int n)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_es1688_card_suspend(struct snd_card *card)
+{
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+	return 0;
+}
+
+static int snd_es1688_card_resume(struct snd_card *card)
+{
+	struct snd_es1688 *chip = card->private_data;
+	int err;
+
+	err = snd_es1688_reset(chip);
+	if (err < 0)
+		return err;
+
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+	return 0;
+}
+
+static int snd_es1688_isa_suspend(struct device *dev, unsigned int n,
+				  pm_message_t state)
+{
+	return snd_es1688_card_suspend(dev_get_drvdata(dev));
+}
+
+static int snd_es1688_isa_resume(struct device *dev, unsigned int n)
+{
+	return snd_es1688_card_resume(dev_get_drvdata(dev));
+}
+#endif
+
 static struct isa_driver snd_es1688_driver = {
 	.match		= snd_es1688_match,
 	.probe		= snd_es1688_isa_probe,
-#if 0	/* FIXME */
-	.suspend	= snd_es1688_suspend,
-	.resume		= snd_es1688_resume,
+#ifdef CONFIG_PM
+	.suspend	= snd_es1688_isa_suspend,
+	.resume		= snd_es1688_isa_resume,
 #endif
 	.driver		= {
 		.name	= DEV_NAME
@@ -266,20 +298,12 @@ static void snd_es968_pnp_remove(struct pnp_card_link *pcard)
 static int snd_es968_pnp_suspend(struct pnp_card_link *pcard,
 				 pm_message_t state)
 {
-	struct snd_card *card = pnp_get_card_drvdata(pcard);
-
-	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
-	return 0;
+	return snd_es1688_card_suspend(pnp_get_card_drvdata(pcard));
 }
 
 static int snd_es968_pnp_resume(struct pnp_card_link *pcard)
 {
-	struct snd_card *card = pnp_get_card_drvdata(pcard);
-	struct snd_es1688 *chip = card->private_data;
-
-	snd_es1688_reset(chip);
-	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
-	return 0;
+	return snd_es1688_card_resume(pnp_get_card_drvdata(pcard));
 }
 #endif
 

---
base-commit: 28f54b0f58c5855d924f970e05ddea9a9d51842f
change-id: 20260330-alsa-es1688-pm-840d2ecd2286

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

