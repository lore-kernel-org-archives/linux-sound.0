Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C2374C3
	for <linux-sound@vger.kernel.org>; Sun, 28 Jul 2024 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722170178; cv=none; b=kGplGw5KRa9Zv24CjErc3uqa0ZL9/W9MJunnEnxwnCN4pE7au6fwLvJv9Ci1muDhDodKOBguUk5H9H+BBQCs2i2O+825q5W7zA2ByYQZBqmzaOue601iX24pJZwFqQKeU8QEnQkSUcRqOkP59EjwPmf8JpOqmAa8jCsQjk7dxpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722170178; c=relaxed/simple;
	bh=KL1Uek1AlXEmf1EG35sIdKgxJf2Dovo3YAoBvGp8qLo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RKp0ozOk77ss/KQL0BRXBHOv+YIuQlvU5iPNevpSkv2v+XyjYjgvptP8mvR0rudzbfzgEIBIkQnyVhGTU/DGo4VexAgIEHa0E3lCzloxlipjYpjbB/IilD9ver51AGqIO/BOdOs2xB/T+hhaW+5tB7xpHlS85buLOV0e99CoJPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=c8qWFlUk; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="c8qWFlUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1722170170; x=1722429370;
	bh=KL1Uek1AlXEmf1EG35sIdKgxJf2Dovo3YAoBvGp8qLo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=c8qWFlUkz6KYRqjERl5V35KVayeOOfbs+JFg0LptF9S+E56aj6FaA9pEy7jUKz43L
	 WsfT1OGjNxK6mSOoUG0GaXLYibgwX3sCfeHNGyARsFA4fFhcDcjEFjNbPJS9D9M/Fi
	 ucD/FrCmqL34+lY1aJPZGhhtS40lgqPAvF3o9wZEwzeq+2ROzNmzDBOhddCwyFoQGl
	 eLQhe7dWr0IFfEqnkPqGAgpaik/ax7naHkNb6M9NVmves2PGTGrGlqaXrH7MNhn86g
	 WdjUM15uKX44a6rq4Tl/cQVce2Hg1yYhOH9iQ6Juslf3T5xEr6vFtB7yijFLqb0F7M
	 1MJu4x9+m8nfg==
Date: Sun, 28 Jul 2024 12:36:04 +0000
To: linux-sound@vger.kernel.org
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: tiwai@suse.com, perex@perex.cz, Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Acer Aspire E5-574G
Message-ID: <20240728123601.144017-1-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 8490e2e58e62bd4b164fafbf762bf1e3f458b6a8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST fixes combo jack detection and
limits the internal microphone boost that causes clipping on this model.

Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ba0ce8750ca4..1645d21d422f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9872,6 +9872,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 =09SND_PCI_QUIRK(0x1025, 0x079b, "Acer Aspire V5-573G", ALC282_FIXUP_ASPIR=
E_V5_PINS),
 =09SND_PCI_QUIRK(0x1025, 0x080d, "Acer Aspire V5-122P", ALC269_FIXUP_ASPIR=
E_HEADSET_MIC),
 =09SND_PCI_QUIRK(0x1025, 0x0840, "Acer Aspire E1", ALC269VB_FIXUP_ASPIRE_E=
1_COEF),
+=09SND_PCI_QUIRK(0x1025, 0x100c, "Acer Aspire E5-574G", ALC255_FIXUP_ACER_=
LIMIT_INT_MIC_BOOST),
 =09SND_PCI_QUIRK(0x1025, 0x101c, "Acer Veriton N2510G", ALC269_FIXUP_LIFEB=
OOK),
 =09SND_PCI_QUIRK(0x1025, 0x102b, "Acer Aspire C24-860", ALC286_FIXUP_ACER_=
AIO_MIC_NO_PRESENCE),
 =09SND_PCI_QUIRK(0x1025, 0x1065, "Acer Aspire C20-820", ALC269VC_FIXUP_ACE=
R_HEADSET_MIC),
--=20
2.34.1


