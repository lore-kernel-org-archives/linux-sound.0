Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7D1E1A17
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319742; cv=none; b=qoZO8WUXjPl1g0v9LF6uZm57B/EXArA3vzXsKCfvTVzFsYqL6tGCycQ9cJViQbaxlUKnhTsjZlQz3b6qZPmeI8UMkLwUDtdxplnirSK+seNJoQ09iMvjl4suYvUVRnYaWhn8ICZ/B5BmcyZ4T7wbVI2Lptju9Pt8W6imBwDY+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319742; c=relaxed/simple;
	bh=I0mJ9RDsmaLtxXImalqDe4AtiflLnN+GS5Tu6DG17QA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=dzq3mG3OmONSlHfUde07z+ZdlT+i4yPXnQxWZN4oXeCsxjEq644ceDYTYfs+N//mnOesskIfcHCKS2DFCR4yq92bF3Qwbs2/UFBlfrFM/iKa/vuGHJ2+KDCrGCRacoZs1aDTITgPszktU930CdHnelYleF11nen9atZz4qVHp90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckKaXjt9; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckKaXjt9"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30c6c8d7503so2499536eec.0
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 09:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782319741; x=1782924541; darn=vger.kernel.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mubFC22CSLLB6diA8ThYgBPTgqW0pRItmPC7CBfNrH4=;
        b=ckKaXjt9pu/3cslnRHmzMzDxz+ucYiyxwEnpdK3v7Ln8WhsU1YeDVC+txswJpp3rK4
         x43+1qjwV6FxH+O8de+eWhPv5lgaLlVhY7AboXKtAhoQfD96Fc7avszgmVC1KqWdusKt
         iJ3JpWvDrdA7wiIaPiw4XXAxd6K0BFxA/+3PBaK/3qHp/STTpDnw2WRfWl5jAZCLdNPD
         +MPjANRatjM9SWMI9cT28GNBzS7qzhL9QzHcFjlO4YpmmDn7zFS6qhpOKkI0zdVo1OMJ
         RaA9is/2e5b69z8WC7KbcU993sowat+ALPo0kWsVLogdDh84t+qVm13gIpNMJZAu7uc6
         zilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782319741; x=1782924541;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mubFC22CSLLB6diA8ThYgBPTgqW0pRItmPC7CBfNrH4=;
        b=EH2fR0WRqyy/jBHNtC/byyyxIA8ZX6aC39U91WGzA7rTimKlpB1gBvpACLNlZ3pwBt
         PGB4+qvjSWvnT+nVrXFNFiHKlyidgANP5wJE11xn2dmM0ugnA8xo0QH6YBSHOPU+21+c
         IJsFs+tgBadpzBzyK7gmZUxF8rqVq+O6YWV0XLbApWTpUOdtkYbHnDLSqbt0Ly5CjQgf
         a+t7MYHyamxGACGhzXlGHE295b6BmeD4stIO5U/vhLtlUX8lO53a9cQKaKmX0j6x8TN5
         /pulvFw/Pog9k7cY6OVHosxtMfjQla5fpdH29ehKsCS6K1H9BVzlVwrzkO5wOC1Sq7BE
         5ySQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHfmpDBWrYY1MGt+p8/ExM2BdijXMpeM1Jmsah+XkwEoopAGY8O5zDKR+HBI9GTHx1sUmoKOrcFe4s3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk0wJJXuIi46FyRs37+Fulu90kte+8rsKsry+efebI4b8hHPkT
	baoqawImUtQMJ9OtzZZNvHFUx+UMVdt3s90KnXOR7qdiNJUtCMlc9yoX
X-Gm-Gg: AfdE7ckRTAYgLAHYHXB/GGSNMnz98DRWcpqn7rJBjA/kJRC0xYREsJK7rB4QHeMuiQS
	HmwSrMXZtjlPdK0ij/u+Jn9WxhY/d4Dcwvkr9VDisd1Z+hRMHk2Wr4Edraiwcwf2u+eVVx0yXfF
	tuGu9swtcTlETgdq2kxFzcTYzq9NwpuEIG7u2YYMEQB/zBXAUfCpHI+Ma0glGj1hNZpEyf6rvtp
	ag5ECHyrrIn6muQ3F73YLGYjNpfzZXzqoUu6u86p7JKR/m5XP8AMfZN3Jj5OsAKCB8Hai8g94w8
	U67OzCXihCPrx8NFa90nAGYEDpgT5lQLU8howD7e0kTZzSliD6QluP04RbPGE+xxqgXscCwx8UY
	WZK8m60uAcFvrPBd0Ll+PkHDpW78Kg1SerI4g20rHs3PAv7pTFe6GXV4VyWgdTCIiiWx2CH+kY3
	uoL2VPHe9QvxTUrYOqZw+mi1Ne/3bi
X-Received: by 2002:a05:7300:3210:b0:30b:dd58:e167 with SMTP id 5a478bee46e88-30c6938c45bmr4076419eec.29.1782319740564;
        Wed, 24 Jun 2026 09:49:00 -0700 (PDT)
Received: from localhost ([2402:e280:3e1d:59f:6752:398e:c71d:48d2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c9e9214sm395425eec.20.2026.06.24.09.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 09:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 22:18:57 +0530
Message-Id: <DJHFM80510BV.26U78LFDNJLG9@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mic mute LED quirk for HP Laptop
 15-fd0xxx
From: "Kshamendra Kumar Mishra" <kshamendrakumarmishra@gmail.com>
To: "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2

The HP Laptop 15-fd0xxx uses GPIO bit 0 to control the mic mute LED,
but currently the quirk only enables the speaker mute LED (via coef
bit). Switch to the existing ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO
fixup which additionally registers a GPIO-based mic mute LED, mapping
to the same verbs (SET_GPIO_DATA/SET_GPIO_DIRECTION bit 0) that the
platform firmware uses.

Signed-off-by: Kshamendra Kumar Mishra <kshamendrakumarmishra@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/a=
lc269.c
index XXXXXXXX..YYYYYYYY 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7185,7 +7185,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 	SND_PCI_QUIRK(0x103c, 0x8dc9, "HP Laptop 15-fc0xxx", ALC236_FIXUP_HP_DMIC=
),
 	SND_PCI_QUIRK(0x103c, 0x8dd4, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO=
_BIND_DACS),
-	SND_PCI_QUIRK(0x103c, 0x8dd7, "HP Laptop 15-fd0xxx", ALC236_FIXUP_HP_MUTE=
_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x8dd7, "HP Laptop 15-fd0xxx", ALC236_FIXUP_HP_MUTE=
_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8dec, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPI=
O_LED),
--
2.54.0
