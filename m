Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB141B423B
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760799221; cv=none; b=bFmK/1yZMu632TcE01S3wh7yrW+OGt+evDmEi8sr9cDrY0Yxbjx9TsfHqJ85z3FwX1k5tPsD+93inZiq7hgQOc5l/zqXFmw+jlzRV6gF0HftORB2dzstJvyel3FX8SAZNTWiMt0QSD0rBf1iJ7MyafUcEkag3LLxDG9jeMl7dX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760799221; c=relaxed/simple;
	bh=JfI3Kx4M9IbMrPI3o4m7fqcnizF9dtxNdPV3z5F1KEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQvZp7JO74EHvZLgQnBLEuyBdl3RQKt47MBgZiIjORfqVwazqNHDG7Vrjalgmcd8d4Q7+NwMt0M9pOGi6gUfzRdh7L4nyd4Nvq2HDDIVh9HhhaNA6EBdLafHEGXlBxr3EU9EGH8xzb2BzXwnNPzxfetoThb6dHJKSlnswJWZXjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPTY7fWx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPTY7fWx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-426f1574a14so1915490f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 07:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760799218; x=1761404018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFBrD6yQbYxxhYNssDfUuvkr0Qo9FZHiyDJm00A5EBE=;
        b=UPTY7fWxHHq0PYnTyhpKHMtcFSu/iutN7B4pPcAvik95/8X6lCNX79/hZNx1MQkeYF
         MaAVKjK9DPEqFKFkBiPPg4taOM9rbrXnEfpogMVwHDs0dpyI5XkcpZ3D+izyajHQyNnk
         +bt8WojlozX4/vk4N6XfxKqAkBRSaMPLSKPf0iNJFraB7hrEMP+njuho6XO/U46Hu38o
         MOxJTfXOR9CH59HFsmfvpBguS/D2EOzjaJ8jnJdLMraI/nX+4DIklcJS08l/Ay8dqVYw
         TgtxmRSHxQTwlAETKPk9earB6D/H7HnJcx5ZgiHuZySVrwv/+ptfnsUITjDq2t2kOZub
         blOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760799218; x=1761404018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFBrD6yQbYxxhYNssDfUuvkr0Qo9FZHiyDJm00A5EBE=;
        b=jncZY9CwVCFtnW8XBPkbgMSHXWwFutkWpw8nW9hH7bFbTM3IVapjtSwS1O1yMEbBoH
         yDzxM3qABBjD5+rEgfoOgJt6bCiB2dsqv4imj6yUdbcEvqfMg6JlbePsi7Dfd4Mz+m1Y
         IWM5sIJl+EIf6MPMV74cobLwxrOAiWmKvGLt+rCpyIiOPj8rEe8yozX/aRzeOv0Z0v4u
         X33NoAx6vjSqQyJKnQiGAahD0DB2mu+4Qh/daIlzXf/tNGQ9TBNQnRg/Vjf+B9VQoxF3
         Yzc/a20NociUIXHKBcrDA6DGvdjzC/eEXc5Tlz2RL9xAKzTymtvOfJaA+s+s7fTgcFQQ
         HJZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5dpGVzAr6Ao4Q9SqClEgbVoN7fI38XsAmOG8dTWuEC0cLACdMrFQH3XQWeCdsmYV1FOnfIkM9O1uDBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgdm9mKkqXk7reTOX/Pi2fLdSUbUO6sq6ab1yDwbRrotEGQVV
	KYsWyr60tQP3LRQirwom8qrVS+VLaysBpqf/Gr7uWBbqIZDcClE+cVqO
X-Gm-Gg: ASbGnctB6hcNILIbB2mbdkXIbiQSNyj+fShthjkOlchF3oE1jBIeR0sEXRoCPnJFyJ8
	j0Eh9CPkt560tLwJmi1Lpamp/hLnMTuPB1UOYDKjLjZy2MbOUMflB/+c8YlFFiHDwIOHxnW9YWH
	d6fhfou58jwaxssLmzWjgYdodPb4De1zubpO0+3R/LN/N+jnrMYJ7xCc5oPCKtrEWpk5Y6n7INI
	KZs561mShKpkR895uKSwKmqJErgPZGvAR/ZwPbv4u4nz8JzKWVXV0UCcG6lvb3Kwz+qqwUHLWwe
	N1msy9bHwEUZMYbesBi5aDFnVCkC2bDRVlwI1EntGoWZIdxU1jiTJEwgUXphuCxcceFDFP2X0gr
	GiBAUtS+8AI+hFdOUu/1zB4V1trkLsKDS2hnUwF7b1aTR377rKIOq45NH4spaCmmooVRFrJca86
	/kscijtzqbLTsv5IzDzCb01RIaADs/hZ2u7Hdv+qzyirYhmk9ZWrE=
X-Google-Smtp-Source: AGHT+IEIL+g6JNIPawsD18SethxTJuMuoLD0SKJtB+eWTtDyrjeSJZuvlw3Bo98eWV2ZzXGizw6Xpw==
X-Received: by 2002:a05:600c:8b66:b0:46e:1d8d:cfa2 with SMTP id 5b1f17b1804b1-471179117b3mr48257655e9.20.1760799218221;
        Sat, 18 Oct 2025 07:53:38 -0700 (PDT)
Received: from localhost (cpc78661-glfd7-2-0-cust32.6-2.cable.virginm.net. [81.108.41.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47152959b55sm52278245e9.6.2025.10.18.07.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 07:53:37 -0700 (PDT)
From: J-Donald Tournier <jdtournier@gmail.com>
X-Google-Original-From: J-Donald Tournier <jdournier@gmail.com>
To: tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: J-Donald Tournier <jdournier@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
Date: Sat, 18 Oct 2025 15:52:26 +0100
Message-ID: <20251018145322.39119-1-jdournier@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <87qzv0478v.wl-tiwai@suse.de>
References: <87qzv0478v.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This laptop requires the same quirk as Lenovo Yoga9 14IAP7 for
fixing the bass speaker problems.

Use HDA_CODEC_QUIRK to match on the codec SSID to avoid conflict with
the Lenovo Legion Slim 7 16IRH8, which has the same PCI SSID.

Signed-off-by: J-Donald Tournier <jdournier@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 214eb9df6ef8..93fa4b888fef 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7078,6 +7078,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
+	HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.51.1.dirty

