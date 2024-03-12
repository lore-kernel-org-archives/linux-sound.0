Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E96416FF3B
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 14:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710253985; cv=none; b=jSADpInWPsLKHn7Uw4Kal1TyYOgC5imcZ1M89rpu5U8h32xVwdCDsH4MkA3b6q+fzrDe0LlgtemFZgv3Ws0P/C9/qGMM0NCCsvGYvEtrXXEuzJwApK8EUOlosOE/MEDXEQuMy1Mnn729jhQZNAeVDkdhHpc2b3Twc/rxemMVqmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710253985; c=relaxed/simple;
	bh=1glY5eIo11rlVsr1KtLK3N1ayppfoc5sRGadB34ajHo=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=scKWFJv2VRBFO6aLg3mGGt0ymBJXgw2aOkNgE/O3jfdA74YV9hFi/CqfwrmJdhQImWgxdG+o1u3r87+5KXQc4PPOA2rJ6HITLIWbHFgXs/xSzHUfoFZuG7BFeoGYa1DnmvRqkLI4R22FYF9YYC7uDUe1lh3HuXpIq4XYVdBIKFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=etJFEA0j; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="etJFEA0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1710253971; x=1710513171;
	bh=1glY5eIo11rlVsr1KtLK3N1ayppfoc5sRGadB34ajHo=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=etJFEA0jmxK/0R5gsEnygKzEwnJ/hfkF1yEsvmipGdLr+q0VC9vw+5BvoQSbMYRue
	 6ypE08kk4CE7jsh9XzgETBCgbnncYztePe/fWcfwIASS446mNzB0q0g6OdoHs7sR6g
	 Sml+wC/9HwGMLnKe72w9Tvfnp2qJqMYkkCu0nQ8n4WfPq3C95XMibqVkVKTcOdEDpC
	 /4pG5EPA9SEVGjBZ0zZdkbllyXlTkYlt0EsS6N5f8Waw/pxQoBFnuKmTYNS31E+lD0
	 8D4qJliz7AJRh6CQ4PejrjpkKhIrd51ZjE4gV1h72AJPajH+riKQYQkP9sW36U4oEc
	 o2BWD4zcORG6w==
Date: Tue, 12 Mar 2024 14:32:30 +0000
To: Takashi Iwai <tiwai@suse.de>, "perex@perex.cz" <perex@perex.cz>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "trivial@kernel.org" <trivial@kernel.org>
From: =?utf-8?Q?f=C3=A6talize?= <faetalize@proton.me>
Subject: [PATCH V4] ALSA: hda/realtek - ALC236 fix volume mute & mic mute LED on some HP models
Message-ID: <Cxl_wqve8dKqfAvFk0MGn8zG_gdt5vut5hmg5E4pCWVKHP1zGam7z5uiD3bgX_Tq0PJwbIzVOH7TUmL_o2QaIR49GRVHFI0xPWvo-Xeg36I=@proton.me>
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

Signed-off-by: Valentine Altair <faetalize@proton.me>
---
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
