Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0448CF2
	for <linux-sound@vger.kernel.org>; Mon, 11 Mar 2024 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710174589; cv=none; b=rbsczRGSvYI4FlDyIwDNaPE82TdorHVyLiHcB6zN5Ldrq+JmLZXBtBr5bhGc6BZTc07KOjyx9T2oOV3QkS0lMzcaswZaZW71eQbyqqF4Mj4DqR7+UH6bVm5v46OfQpxfyJoWUgYON99hcfvruu47hkOYJijYnJ1ImRtc7Q99+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710174589; c=relaxed/simple;
	bh=CUpbO8kwee/8OAuBc7UyES2klzueQWhJFUBgbb/WfQo=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=t2VN3zlZdzgW4QaDE1Vbk5en2uwBcxpTEUTOTCJC1P0mDSCkK1N3gkkCfxu2UoSXODEk/qFUEhnyfyb3RQ9rHFbfkl88RuVIvSY4NNnONHMqkjjo2kgvgt4UKdWwv1+6EsgUSnMRLaREkEp6ne4wHTb2/QadGN6ZIrWWoQMoSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KNhWEndj; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KNhWEndj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1710174584; x=1710433784;
	bh=CUpbO8kwee/8OAuBc7UyES2klzueQWhJFUBgbb/WfQo=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KNhWEndjcaZZ8oVNusLmu0P7EwkQVrZ4QEg5xQe/5B9jzrUEZ6NztSm2Vwx66/zeJ
	 Riw5jOIFix7RGf2KzQa9l6DajGFz/p+X+Btrndz+PqUWGO3HTG7lwMIN2pPrJEqAdK
	 NyO1av/xXJuY/5s83v8Do34JJcQAvVcsSckwqmbPstge8r4vVosGZzSJKUjOhKND0x
	 WoR8KmR/fV80T4zoVV5qNCT4x8772SPOhvTG7HDHWI6HKahVSLGW7O9R+AraYEIhtj
	 ofCaFjPkPW5sfkgB0E4ttubqTAQkdzEryD61PAZP5rXvdrEMWydcTuEfyN8R2YuuA6
	 u3WAzJRqRse/g==
Date: Mon, 11 Mar 2024 16:29:21 +0000
To: Takashi Iwai <tiwai@suse.de>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "trivial@kernel.org" <trivial@kernel.org>, "perex@perex.cz" <perex@perex.cz>
From: =?utf-8?Q?f=C3=A6talize?= <faetalize@proton.me>
Subject: [PATCH v2] ALSA: hda/realtek - ALC236 fix volume mute & mic mute LED on some HP models
Message-ID: <Cr7YybgkHCTDgDNzWyiSSkh_2jepJZ755gwCbKBKVOF2n_69m9TAEpb4Hikk-iEtQPxED0Zs0pdEYcwbI0a7qQdxPhiL2Fr3xkS7ta5jojo=@proton.me>
Feedback-ID: 76527010:user:proton
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some HP laptops have received revisions that altered their board IDs
and therefore the current patches/quirks do not apply to them.
Specifically, for my Probook 440 G8, I have a board ID of 8a74.
It is necessary to add a line for that specific model.

Signed-off-by: Valentine Altair faetalize@pm.me
---
V1 -> V2: No changes.
--- linux-6.8/sound/pci/hda/patch_realtek.c.orig 2024-03-11 11:59:02.989267=
710 +0000
+++ linux-6.8/sound/pci/hda/patch_realtek.c 2024-03-11 11:54:16.764227013 +=
0000
@@ -9890,6 +9890,7 @@ static const struct snd_pci_quirk alc269
SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_L=
ED_COEFBIT2),
SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP=
_HP_GPIO_LED),
+ SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC q", ALC236_F=
IXUP_HP_GPIO_LED),
SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP=
_HP_GPIO_LED),
SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIXUP=
_HP_GPIO_LED),
SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_FIXUP=
_HP_GPIO_LED),
