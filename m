Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F0157487
	for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 01:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773536949; cv=none; b=CwStNZcyMP+GAc2jCvEfO5r87OuIcFU/JZqSIGZOfL1bIxg3gU0+HQ8LEjZvaPR8lf67+kFXlCvlGhFUPvbBPixCholVJhVm+MSXMW6LkfB9fQL990qjhj3R6JCPD8L6VBXK6V2xvsbj8pBEjWntyCdQwTb0fSHpNF/Nk8m1sPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773536949; c=relaxed/simple;
	bh=yNHf5Bqy0jBRJHUqOSnWhVnNdKtgOpetRKigJMBYGzc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fv9PAB3It0jTVZ13sZQdbTXcPwOHvTR9KyzmrEt842crxqkEutjcZHutdorxEeNfYqF66bZKSv9Ez/2y1KZkfYsi8UoAuEeiehHKuCtvWGKeh4VUWf+D9DG01K7y2es0H/ODIs1TjpZ5p5hbrWgkEs1kZQwiNMIEqFV+aexEUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=kw4KTikP; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="kw4KTikP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773536934; x=1773796134;
	bh=yNHf5Bqy0jBRJHUqOSnWhVnNdKtgOpetRKigJMBYGzc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kw4KTikPi8Z3wU+m1iujHw7B9u/5iGwMHIu0fRoJLsy56OXARBZBz6XZJ8psaPGhV
	 PXBqJGcROGUaqsX8RDg+dlL5Og7CJdOLgmXUebFPka96IkWtydbKsmliVyp3bGp09j
	 oHuaghZzaxEChWTbRF8hxnjFmSZpKlLfnjLEzB6zLg6SALKeAqhWz+Hgzk0od4l4Zg
	 bK3CQJiqq9lEYJuOGbRghf3Sp8K7Zna1d6/bkSNm0G07r8ypr1aFD9o/AT6PjJUEex
	 Queq2oV99KHfhrlUwIYzTgdZ5nU+d8gbmkAb43fKOAvpKwNZwgzQzeNCRz9rBLmHEk
	 nqWoNC6Bx60kg==
Date: Sun, 15 Mar 2026 01:08:51 +0000
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
From: ~rosset-nocpes <coderpy4@proton.me>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "coderpy4@proton.me" <coderpy4@proton.me>
Subject: [PATCH] ALSA: hda/realtek: Add HP ENVY Laptop 13-ba0xxx quirk
Message-ID: <u0s-uRVegF9BN0t-4JnOUwsIAR-mVc4U4FJfJHdEHX7ro_laErHD9y35NebWybcN16gVaVHPJo1ap3AoJ1a2gqJImPvThgeNt_SYVY1KaDw=@proton.me>
Feedback-ID: 45834777:user:proton
X-Pm-Message-ID: 6c98e1f53ecc4a6faeca1d3f0eac006442194964
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From d051c71ce849cc8504bb8e00784a830d718c3f00 Mon Sep 17 00:00:00 2001
From: Andrii Kovalchuk <coderpy4@proton.me>
Date: Sun, 15 Mar 2026 02:53:09 +0200
Subject: [PATCH] ALSA: hda/realtek: Add HP ENVY Laptop 13-ba0xxx quirk

Add a PCI quirk for HP ENVY Laptop 13-ba0xxx (PCI device ID 0x8756)
to enable proper mute LED and mic mute behavior using the
ALC245_FIXUP_HP_X360_MUTE_LEDS fixup.

Signed-off-by: Andrii Kovalchuk <coderpy4@proton.me>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/a=
lc269.c
index ab4b22fcb72e..a1c9a508bef3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6854,6 +6854,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =3D =
{
 =09SND_PCI_QUIRK(0x103c, 0x8730, "HP ProBook 445 G7", ALC236_FIXUP_HP_MUTE=
_LED_MICMUTE_VREF),
 =09SND_PCI_QUIRK(0x103c, 0x8735, "HP ProBook 435 G7", ALC236_FIXUP_HP_MUTE=
_LED_MICMUTE_VREF),
 =09SND_PCI_QUIRK(0x103c, 0x8736, "HP", ALC285_FIXUP_HP_GPIO_AMP_INIT),
+=09SND_PCI_QUIRK(0x103c, 0x8756, "HP ENVY Laptop 13-ba0xxx", ALC245_FIXUP_=
HP_X360_MUTE_LEDS),
 =09SND_PCI_QUIRK(0x103c, 0x8760, "HP EliteBook 8{4,5}5 G7", ALC285_FIXUP_H=
P_BEEP_MICMUTE_LED),
 =09SND_PCI_QUIRK(0x103c, 0x876e, "HP ENVY x360 Convertible 13-ay0xxx", ALC=
245_FIXUP_HP_X360_MUTE_LEDS),
 =09SND_PCI_QUIRK(0x103c, 0x877a, "HP", ALC285_FIXUP_HP_MUTE_LED),
--=20
2.53.0


