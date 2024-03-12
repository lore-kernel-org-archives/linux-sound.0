Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CE25CAC
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 01:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710206333; cv=none; b=tk5WvcESY9gH7VMhTy8eZt2w7jVgi5w5jh9vF/zDsPCn8pSP/0/L1ymiO3iVD7kE4DmSqL0Ll7rsE8VbrUnlFbCluGZOzbBgA4jkuWCDCYBxWI8Zkd5CUtUxjnWg6m5uTi5WykLMa3EjlMif6TbiR2ZHC8DHqfVO43NP0G6TpBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710206333; c=relaxed/simple;
	bh=U7QlsJJbWAdTANPglIW+ODPzVlRHVQzQk7XZEpxzL0I=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=rxL7iYqEKz671/n5wrwrITjoiNYB3eGh51RrF8jBSVH5Xbq1DBqL5QqXX3bHYssrB9+q5MBZxbH50yZY/UU4PU2PM46l8XO2FtF7VW2F7uVsTzTwK79DsPht4wHu47hGZ9WMAsYAnLMn2nJ4b97tLrJFSVmupLmEx25ZVofbRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=CdrvKBMS; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="CdrvKBMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1710206328; x=1710465528;
	bh=U7QlsJJbWAdTANPglIW+ODPzVlRHVQzQk7XZEpxzL0I=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CdrvKBMSvrsMq5NhxsW6VXhJ9Cv2el9CkCRL2kj2Fo2Ea0YaGD7cuzOhtrz3RHJ1V
	 WgWN4KGHft6tvb0AMz9sOhby9XDOmLyzgWybawr32RewcbKBht1dYhk0ySEU5OyNPT
	 Q2ycl0dggwxGDNtp6PIyK+QwTa4hiX4Pxl+dj9dqMuVNF3IScbnXVFMUySwrM6zAhn
	 JjBj/T8mvf/5NWJTyMtsN2lPUOZ2Qbe3szqmffbcY0e/gG5jsf3Ic+dmsx+rAp4AGl
	 6eYtD1X8LQvYFT9QyF0qvNtMM/tnsUn2PFe1n+WiverD9e0LxYYh0QS/NKwL7MU8cj
	 t/ORE9NVpGlJg==
Date: Tue, 12 Mar 2024 01:18:28 +0000
To: Takashi Iwai <tiwai@suse.de>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "trivial@kernel.org" <trivial@kernel.org>, "perex@perex.cz" <perex@perex.cz>
From: =?utf-8?Q?f=C3=A6talize?= <faetalize@proton.me>
Subject: [PATCH V3] ALSA: hda/realtek - ALC236 fix volume mute & mic mute LED on some HP models
Message-ID: <fYpNFBsL1RgCO3Ag9BWsfndkd5Z3toPsW6hMfNG8EDFj4V4RaDXsZQ5CC-YxMR8ekj-sqGx7RMbuXlRZhq8q6prm1nn4VVUAgyJaA-qvY6c=@proton.me>
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

Signed-off-by: Valentine Altair faetalize@proton.me
---
V2 -> V3: regenerated diff using git.
V1 -> V2: No changes.
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a1facdb..f04c3c1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9890,6 +9890,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 =09SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MU=
TE_LED_COEFBIT2),
 =09SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_F=
IXUP_HP_GPIO_LED),
+=09SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC q", ALC236=
_FIXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_F=
IXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_F=
IXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x87f2, "HP ProBook 640 G8 Notebook PC", ALC236_F=
IXUP_HP_GPIO_LED),
