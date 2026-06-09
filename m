Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC4426EA3
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013411; cv=none; b=i8/p2ZO9PvVV9aTa7L7krfr0umuwFUgcevv6ozOBr7gvtqsyvmkeGrHmAtPw/fTbAD5vWf4DWvxEyAzYVVliVHRTm6zkNDFv1vUPItcSdH4MTO0EwLhKBccY39AZQRfVKmccEDiCrpiZyrl2nDNNYWICMhpzg8nndgyLr48wE38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013411; c=relaxed/simple;
	bh=2c0HdTPmfgiYx0VZ9832KtelLqJIiFgIFRLUB2fSiY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OstU1plCahmv65oIvGxbuqu/1mrj814JirI8FJdQchh2/PWCKnvfWoBzO8JSpYWRUY1wlC/I+2loZSz3tcSFlPU63ug9r82rJp9oN3iCSn6m2ssSqdjhwVX4PJn75ltlJjhHXaAa+bxGdsVrtw0I4BNFXX/jlllxhn/YgHDtM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clFDpMqG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clFDpMqG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-692491fec0bso1058838a12.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781013409; x=1781618209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsGS2lh6BXhGcxqJg2vWNAdOVLmYnmyYBZj/jZXEY/E=;
        b=clFDpMqGt9l9Q6HOE7NkUjkMkfp8LgeB6EnFze6EQVu9SFzX7sHAhII0+F4AtUPoGb
         tOO9GcAlyocoiGoGcGRK23GoeS1ECzjoAY70zcsKI21FqTA98HXaqrLx5xvJzxlpm/lj
         xHCjowzktcotAzv+nE67vXN4Tkrm0S9VUgHP5o4PweWpkNS2NEnA4eXY74VHgw1YNOor
         D3DhHtwRurP4WsIZPNFxtvLoulHoEJ5X31A4dpRwFMnpTKFC7tmKBHYXDoL+bOYj2u9I
         JR1MGgQ6V3bmws6aEMi6cl/ZMkhirdC0O2HDIONA/uMwUui3tPGIiyaowyt1U8iby9Jn
         titg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013409; x=1781618209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VsGS2lh6BXhGcxqJg2vWNAdOVLmYnmyYBZj/jZXEY/E=;
        b=P0nItkwJ+Dvq/YwRxkuiwHdgmlo1b2gphscO3mUskQgA72gW1MpVgsd+p5Y0uqZAWY
         F21AA4b9Zb2qz3qP/BBvgrT59r60u0BVFEehRtNRzWwHPntcRZ1dfGKZeLakl2fUoxd7
         tMwEIFUjP6TWAj4bDLwAWe+mBwK4UKgYlhRd6ChCbZ92WLOUQzzzUJ+L1sQrvJWPP9Py
         kh3oi1LWZRHf1lpbwHu+qQcL/oyLM7AAyOIL4t3mWN7hS2LmfnhbdYDrwntlnUx4MHSL
         h/JZimGeGllm6doUnR4y6JTx45+4V/0iwTXGknG+viF3lZ8SQ9z3QkaOFGIAujjbpUYb
         Ql8w==
X-Forwarded-Encrypted: i=1; AFNElJ+zd8H7dZGYSQ5uquQS2YR3q+YDJvUAJywg7pbs//VzQcXrbRl5CCLcq5t0BTB07AtcBSM1vbdDAiTE7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRInatXzqIN6xCnEFve3Dmo1RAJFclmRmoeCPTgIS9pkfHL5mo
	NlQNKqx5W45WGM83a0mPRXQ/qmaRu0uwv/sjRXFW3QuoXetzA5TvBsA7
X-Gm-Gg: Acq92OHRRKdqZyVdiX4NUxhlFk8Or5naOkSLrv6Lw9HhDnYs+AsnOe3y38wXIgB9opT
	ZcwT5bWWNWfT2A7XFXEk6vjHGh54GwgdYM+GoxB1uKj7Rhn3PqSkd4yI8oS/zSNgJyHzslHiE3R
	/YZN6eq+0GH67IhWtWyeqs6ih4m/jp8AmCuMA9kcwI4/7o3znMCpHxO3xR0aZ8Khlcxj5A2qtPz
	RiDM41Xid+eiolvvsPVwSDjnRR1rqR25hvMJSqy8BxxSTav53T9ZggiqlpRrBoLiFj9d1CzCSZp
	Lvcu+ZBAbyvnvg9YPR17eHKKjK5bcTmiLjZlIaYojuYo62jRCzKYLIyorKoaGjCXkz1SStmWuUs
	yoz/0l3+R4q4GhItrmeXfPa4phb+DbY7Cax/gfPsbroBo6tKf7av3VhFUuPtNAiJe7uPNyC5b5K
	U5BqO58hZdMREYjxKFwmZxtt9trVOd8jA+BRLcAUoQlBAx77/u5TtF660uN+f0bdBFLzwCoQiu/
	hW4Mw==
X-Received: by 2002:a17:907:da3:b0:bf1:6366:f8c4 with SMTP id a640c23a62f3a-bf370a629admr1009745566b.15.1781013408573;
        Tue, 09 Jun 2026 06:56:48 -0700 (PDT)
Received: from macbook (polaris.rmrf.org. [70.34.242.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm1082867466b.26.2026.06.09.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:56:48 -0700 (PDT)
From: Denis Batishchev <ii343hbka@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	ii343hbka@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Enable micmute LED on HP EliteBook 6 G1a
Date: Tue,  9 Jun 2026 15:56:07 +0200
Message-ID: <20260609135607.3960625-1-ii343hbka@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604131518.45993-1-ii343hbka@gmail.com>
References: <20260604131518.45993-1-ii343hbka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP EliteBook 6 G1a (SSID 103c:8e0d) uses a Realtek ALC236 codec.
Without a quirk no fixup is selected and the mic-mute LED stays off.
It needs the same ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk as the
already-supported 14" variant (SSID 103c:8dfb), so add it.

Signed-off-by: Denis Batishchev <ii343hbka@gmail.com>
Cc: <stable@vger.kernel.org>
---
v2: reword commit message as was required by Takashi Iwai

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 78a865709635..8eebf91595d3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7274,6 +7274,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df7, "HP Z66 G6", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8e0d, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.53.0

