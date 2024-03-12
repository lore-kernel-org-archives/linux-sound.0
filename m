Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E518446DB
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710254542; cv=none; b=JBlsec2OsxvWpCwGX5TL6sYuDYKoPJhZwhFsBwpPIdvt95oPXwyU2bJ3pPGvxs4MwARjaOz9YZYNbfXGmDQHlQcxKk3E8xZbRodyasj2aEh/uH9h6gVLMnFI+onf4tFeuha6IZrYaSQqabrAifSfaREkYIH6dtaq8wSZ8ZoalVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710254542; c=relaxed/simple;
	bh=X//buwCiz0903jlZSlu9H96pe9FuzGqiNb+EvvLM8r4=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=BbBXbkD8ChCeuwMnuckGKfsTsbrmelQ96kgwihj5T5CYgHezpJJx25rH+iNwMVWJmSzE2P4UA5GKWnr9tFsySTXnM7/+ykEYczN6/C+9sD9KjQH6VFgHEWoPamt7mqH8E8fmmNgl21WiNBTzDKPzFJivgr+N3Nm/H7s2tUVJmY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mAySH3J1; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mAySH3J1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=kls56ykjkrhjrawvcn6nrpykbu.protonmail; t=1710254530; x=1710513730;
	bh=X//buwCiz0903jlZSlu9H96pe9FuzGqiNb+EvvLM8r4=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mAySH3J1kOvpkNGOF91WWvZBQBIrR/BX2XnXPkUAdOcp2I+DPg23fGpXMn7nS77v7
	 SFZdbs7TyplhHnIWUX7+OYiMggn2Tlk7ByYVcmXUiXB8MLQok4VoXh942jox7PEYA6
	 kHqhaxef7V9KPa2uV9vrjxOxNwYG4KmQVASi7nSWAp3PcXOZ4fa0X7H85LTdtGoH6K
	 yYMJGN8AylEdvrvJBrlFob5r6otgnl+lu3DTTKg/J9Z+8wO18t18IJMXy9Wgl0h//b
	 dkE3K7t3mC3Ky9xocEqUNo5m8A6AbAhGEJQ3sFR/lEXSPWM6MiO/pAUhHbgHi+3MPT
	 Z+uOjC3WreNnQ==
Date: Tue, 12 Mar 2024 14:42:00 +0000
To: Takashi Iwai <tiwai@suse.de>, "perex@perex.cz" <perex@perex.cz>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "trivial@kernel.org" <trivial@kernel.org>
From: =?utf-8?Q?f=C3=A6talize?= <faetalize@proton.me>
Subject: [PATCH V5] ALSA: hda/realtek - ALC236 fix volume mute & mic mute LED on some HP models
Message-ID: <kOqXRBcxkKt6m5kciSDCkGqMORZi_HB3ZVPTX5sD3W1pKxt83Pf-WiQ1V1pgKKI8pYr4oGvsujt3vk2zsCE-DDtnUADFG6NGBlS5N3U4xgA=@proton.me>
Feedback-ID: 76527010:user:proton
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Valentine Altair <faetalize@gmail.com>
Some HP laptops have received revisions that altered their board IDs
and therefore the current patches/quirks do not apply to them.
Specifically, for my Probook 440 G8, I have a board ID of 8a74.
It is necessary to add a line for that specific model.

Signed-off-by: Valentine Altair <faetalize@proton.me>
---
V4 -> V5: No change.
V3 -> V4: Added entry in the right order (ordered by PCI SSID).
V2 -> V3: regenerated diff using git.
V1 -> V2: No changes.
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a1facdb..986b99c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9950,6 +9950,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 =09SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_=
GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_M=
UTE_LED_COEFBIT2),
 =09SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FI=
XUP_HP_MUTE_LED_COEFBIT),
+=09SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_F=
IXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_M=
IC_BOOST),
 =09SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIX=
UP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIX=
UP_HP_GPIO_LED),
