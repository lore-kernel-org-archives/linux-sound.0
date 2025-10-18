Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE291A9F91
	for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760797258; cv=none; b=OYVDmDSdaOJhBLyLK5cxiZTILcJnn6/IiHLcZBvX77PssU05cr9UZOvfEqlKRTAiIfP62i9DOeTSfmBu1m9o2kA8St4LUnHED8WgqP5sIjLOM3TaYavh3I16Abc8BvTOi2Hb5AeRPTPi77tHL4PqercRe8EwUvn3ygshDfVJyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760797258; c=relaxed/simple;
	bh=P6dbtKNi/8ud749WZBgq3PEDG0g7UVhhNbevUYOUsMA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hU5FN7EFJ1hoz1mBKuSfxuE8tDFCZJHlztSVDXrZLNPCqeIUweDtKzWRCDZULMdltvfetec/FfNUqvuLHJdyxyC/Zh3PJAuO3gF6pIhTkNyjAwQRGp564nV01eixl0RmfEI7SMHVuHD1TkEiMtGBkb/Q40w47h+fxtVvO8ytcqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idi3Vmbo; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idi3Vmbo"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-78ed682e9d3so39970886d6.0
        for <linux-sound@vger.kernel.org>; Sat, 18 Oct 2025 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760797256; x=1761402056; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DB8KO06DJ3QfBe1ypPFSnXVAlt9csQBZk0Nkft/7/7A=;
        b=idi3VmbozY+nTdfeE+KpjjZ2sew0YLRcMOkz22674RNtY8GOPmJoZ7qiKBjRaNOotM
         MsHvQkrUBRsj6N6SG70CCW78MeuIa8pz8KWjdfR+PePt78BvG709yIpCWxKljhYRBT2F
         p52Z3mM2JXb0TBOVbYOK4DPmxfC0iZ0HHZFspzlCz1yTmAiquQwNQtHFr8JH41n62cx/
         ANeRcUlhGfegovI6hQjmYNhWodkw6w2UiIj6A3ujE4bIGlFbg5zYGpmdsH8fLheunYG0
         /Hjag7Gtv5PTsbjmzbeHZ7KesWOaCypNWKhoMH0WqV+PhB/1OGozOPIBXcs+5zYKdBWx
         1Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760797256; x=1761402056;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DB8KO06DJ3QfBe1ypPFSnXVAlt9csQBZk0Nkft/7/7A=;
        b=PTEzih61/jxp886Fo29Wu6EINECzORGNrR0D1HW+dMMqEPIJux6q0TRzAfme7u171y
         ihrv0iuaboHd3ly6ZafXp+tpdA+tnC4nPigj1Cnx5zvcyGEntfoYIgcViSsatXtRlNhM
         mkZA13uEn209g+054LCLRXAKsfsIPcNZ5AL3rEOSFYwt5nalOjDwu2WWYWXP9dBiGrra
         /Hmrr124HPSPzjbSTS/GLN5VU/CgkMQoco7HuvRhGNVT1BEyESdR3ZG6yC2952pmHDmT
         zp5FYceRHU/JwmqMfPjYJWDX8uyRPduxkrjoCnUyzbhrYvJ6sxOrCwbzz2fu7M/Rxfbm
         kwZw==
X-Gm-Message-State: AOJu0YxR3aZ1Pk+UmecYZ8JYjg3m3DvsfEnJTxfPqQo4ATzgYJxnZSJD
	ghzZaheJegb63lUSjCePK8QsgGIrKDSf5hxSsJxwZSMB7GmXkJlZqeiGUcDx14FLL0LTXfgfAn0
	6zz5XB7uxzpfdiGZEKbQxgYN7reDAZWE+8flhXRE=
X-Gm-Gg: ASbGncuWnqshWj0DKCKcRm472dLExG5JULzWVzqFzbaM8PtssidPw6hCXIa9bTkeopj
	ucOu2wMpHnh0nhTyJakwncWhQQ49ml+seTOSNKqKGdTTQJVLK/9SAcUCfE07ej5qNtceFGDFy9m
	bRdQk2yaMGknOw46mh2SmktxAxF+W+Pi8QbkZ3OnT5skAiOkH0duJKTWdrx7U2lB/JzwzohZV8N
	XUeyf6Y5FhEtUEg2C7I+4nXWF/xW6aGHEOFa/5hDX3XDZp+RuVynXNztc6EM/cJ2vIwjDXTwSDk
	qDzm
X-Google-Smtp-Source: AGHT+IHs6rTlOKBfuQoIQskn1f9AfazqLMJj2LS/PmtpzRvx9J2+/InTA6foy6qtNrFsprvmuULQZGGK9IeoLQdPcOE=
X-Received: by 2002:ad4:5ae1:0:b0:804:9cab:926e with SMTP id
 6a1803df08f44-87c206335b1mr114075766d6.38.1760797255790; Sat, 18 Oct 2025
 07:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: J-Donald Tournier <jdtournier@gmail.com>
Date: Sat, 18 Oct 2025 15:20:44 +0100
X-Gm-Features: AS18NWCeDFbAlDH9vkW9vYQLKdEtV4klpONdS1fbqkTPRWJYCXY0SKTvMv1CchE
Message-ID: <CAHgym8KY1S83uXXvefsE8NPt10=S+eNRG05zQPXHJ3+XHM+R-Q@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This laptop requires the same quirk as Lenovo Yoga9 14IAP7 for
fixing the bass speaker problems.

Use HDA_CODEC_QUIRK to match on the codec SSID to avoid conflict with
the Lenovo Legion Slim 7 16IRH8, which has the same PCI SSID.

Signed-off-by: J-Donald Tournier <jdournier@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index 214eb9df6ef8..93fa4b888fef 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7078,6 +7078,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P",
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
        SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P",
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
        SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8",
ALC287_FIXUP_CS35L41_I2C_2),
+       HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1
14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
        SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8",
ALC287_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8",
ALC287_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8",
ALC287_FIXUP_CS35L41_I2C_2),
--
2.51.1.dirty
