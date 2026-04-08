Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197E39DBCA
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775661464; cv=none; b=gHpRItzYAyTzDtGrZSsNu7dlTrUCQ8vFeTcBwz1E2Gk1/GnMxbquDb6qENyWNe/479wRSZQ3Ya1L/AxHKyjFQi1gW/bsUBBvJWXlSUxkCSWV2lKoyu5PODdgaqAkf+NKQnEqO3/Fb4bvme1RfWivGXG7hng73fNP076HpaBfA6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775661464; c=relaxed/simple;
	bh=zqhOOhhMQs1mNPtV+owg5UKyqv65STjMAQnsQz96t0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jqzdK2AwHp12Pi8WNp0AbnxlKa6JkyzGAiKw7Ug2DYgvD+SoV0ryv7saNp+eyULad25XNuVD28fEEZqaL3U9sxrGELdv8ZHyn5g5+1STMH+TcNPfglGkfZvY6HqJilzcahqzvy6otfO60Rkg5elJzm/nCfbSHy7GVByP68X/Myg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka5mnqsl; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka5mnqsl"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2cfd69b564dso5685703eec.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775661463; x=1776266263; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vj/pO0PY5Qqs9RsedLzk2y6e92BAj0jhJLtTmRDZr0I=;
        b=ka5mnqsl7enpkrIjxbrcfXKVkeGIvFtK2udFsW5x/ogzqXIsYtzWXMEEwWpbRpLpRT
         sIsXZA65I2Bf+DN6LvIeHTGsagrXp95d1FeXYBSZ4qfcpbAQoze2HUVDO4brWJVm2jCr
         Otgh8Q7onZjSxxGEvY2L0MgIAJ2uAWdlDGY77ouKhY0dYC+JZt6TeUsn7k7dhEXRN6U7
         HU/CtNKC9BhaTw761NreJlq2s5kkeMNGESmPv7blbMA/v0m8Q1xbJD7h7AZ66tkrt4YO
         ILUJSDbPnTiK07E/nKrEY4PaPeZqZEyf0W04KhVhazQrWL6SkYL7wZpjPklmwQg51RuH
         COnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775661463; x=1776266263;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj/pO0PY5Qqs9RsedLzk2y6e92BAj0jhJLtTmRDZr0I=;
        b=J2Zppqj/4wlsnikvb6XYFK2HybBRAwr0gZo9bSjiGW87oAV5iJgltcm/x53M6xJ+OO
         HxaCC/gb7DKHdH82uzFcFlpVSAUKnLLTAVfdhOv1L3UpIOyIqPEIpmyqquxlo3FkR+fc
         4Lo5v0J2x7bqgxlqzx++veCcnLkGCbTq79blfK9UI20zD138ZeldEEQfGKnJz9I+KIwz
         RI+1zJ4mC9Q0kWnq0SFqKwsQzGpB24lbFDC3CPaVHV9ldBlUS0mp1eIO/1wl2VhxQYQ8
         dbi7PRZ0n4FxoL7+ipqjJy8TdotKJTPsTjWGsjK5f/NRcZh7lnSDaQ261L4xR0dx/r7K
         vSyw==
X-Gm-Message-State: AOJu0Yw3erQcxTcPrsdpaZEoj6dBtNxWVrXDMwVwJsWwKubpV6p9+pMi
	4WG8MYzSJs73ImbSXHBN+nxfi1399GZY0v8TMBRDOWRBXOM2igtPKJ7D
X-Gm-Gg: AeBDiet/4iJDhNi+O5JegwPDBTYzlSqRH7vmxV3gPygaPahWbBV1rrYGgj+H3hC8M50
	H6KuVIuED8cMF5DjNfktP84bbTfZKoARayIgTSvbALdzRLvl38rqCSZ1iAtxBga6eq5TxfNmb4v
	SzE0AX0EpElGfsx5x2bECCxWAqlyaJ67DwfdilQ8hdwgKQgyuOKMSI0pd6eeRzzY/odYwdSOSJ6
	s+iNxz+M/TDGoLRNQdxNboEkNTC0//5BJxl+zgz7dijPhg7MEGahCEp01hZPiV5wSsBd6tNwezV
	C6t/yh7bC+czYNx5kIWw+bj1LhPgHmMs8CdN1WXV5j3dFzYODALkNiHJUB5D7WWhJ3AMaqZCpq8
	91pQXWOwQXfMyQ351R9jIg6zeXP192kSJKYAUEB0QVA/DGBoKg9kikaveKo7cA2YWvI0BKi88Fb
	rKN4Cd2+o5Ef7zZE8Y/TEwhgaHeXs4YzJDD10ZKVEJbOdhBDvAXhcwYnp/gdzR/Q1Mm/8sF7k0n
	XKi
X-Received: by 2002:a05:7300:fd10:b0:2c5:b23e:48a9 with SMTP id 5a478bee46e88-2cbfc360002mr10475275eec.25.1775661462291;
        Wed, 08 Apr 2026 08:17:42 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm20990195eec.5.2026.04.08.08.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 08:17:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 08 Apr 2026 12:17:37 -0300
Subject: [PATCH] ALSA: i2c: ak4xxx-adda: seed AK5365 cache with reset
 defaults
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-ak5365-cache-defaults-v1-1-fff639aca3e3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTtJpbT+XIWwGNoBRg2SDhgTw
 t2psvwW762gnIQV7sUKiT+i8h4zzqcCwkBjzygxG0pTelOZK9LTWe8wUBgYI3e0vGbF1kdH0Vr
 Hlxvkdkrcyff/rZvDurQPDvNvBtu2Az2KpOV5AAAA
X-Change-ID: 20260408-ak5365-cache-defaults-b6d5ad335e79
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=zqhOOhhMQs1mNPtV+owg5UKyqv65STjMAQnsQz96t0Q=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnXCieHV2xf+Js/6l7MY5k1rhs8Sh7FVhbMC01gOKaX+
 1OsxWJzRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEwkWY7hn3YkS2Dn9nlveD86
 WIebSn7Yc+/a6dRrsyvuqarNb+G8/ZOR4YP5kvSX558lbd39T08l6Y1LXLzJ+UXNYROU3wvm9Ht
 sZAMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_akm4xxx_init() clears the register and volume caches before
dispatching by codec type. The AK5365 case then returns immediately,
leaving the software cache at zero instead of the documented AK5365
reset defaults.

The AK5365 capture volume controls read from volumes[] and the proc
register dump reads from images[], so the initial capture volume state
and proc output are wrong until a control write happens.

Seed the AK5365 cache with its documented reset defaults instead of
adding a guessed init sequence. The datasheet documents the reset
values and states that MCLK/LRCK changes do not require a PDN/PWN
reset because the chip has a built-in reset-free circuit.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/i2c/other/ak4xxx-adda.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
index bdeb3cef3640..9dd36b82a6ac 100644
--- a/sound/i2c/other/ak4xxx-adda.c
+++ b/sound/i2c/other/ak4xxx-adda.c
@@ -281,6 +281,9 @@ void snd_akm4xxx_init(struct snd_akm4xxx *ak)
 		0x07, 0x00, /* 7: ROUT muted */
 		0xff, 0xff
 	};
+	static const unsigned char ak5365_defaults[] = {
+		0x01, 0x00, 0x00, 0x2b, 0x7f, 0x7f, 0x28, 0x89,
+	};
 
 	int chip;
 	const unsigned char *ptr, *inits;
@@ -327,10 +330,12 @@ void snd_akm4xxx_init(struct snd_akm4xxx *ak)
 		ak->total_regs = 0x05;
 		break;
 	case SND_AK5365:
-		/* FIXME: any init sequence? */
 		ak->num_chips = 1;
 		ak->name = "ak5365";
 		ak->total_regs = 0x08;
+		memcpy(ak->images, ak5365_defaults, sizeof(ak5365_defaults));
+		snd_akm4xxx_set_vol(ak, 0, 0x04, 127);
+		snd_akm4xxx_set_vol(ak, 0, 0x05, 127);
 		return;
 	case SND_AK4620:
 		inits = inits_ak4620;

---
base-commit: d3bc0384ef6f4b23dea8c753496ebf027237112c
change-id: 20260408-ak5365-cache-defaults-b6d5ad335e79

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

