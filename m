Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F5396D1C
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541080; cv=none; b=LY9ujXjJbPbgItKsQuVPxz26lpuvBoXkRhXnoe3XyUvCjMx9Esc0KLubqfiTkD4sMk6LvoKSXvIDMxkdsfOc7d5JmTh657UyU+e/lAFIrUiAK50p0rDy95zNtUrBXj63fqzZf4/mcjhB1tr1mxQUU5LwGkkN8G8KUtF4HXcyNW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541080; c=relaxed/simple;
	bh=4tNo6Yc77QWmYsbTfGflRg5UZrmccNSnHNrFESVSPCE=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type; b=nxeOSsAp3yM+vqdp+dpSd8w2er8y2gN7y8aYYJgXd0b0Tyx1Ne37qjDT/V/2XaL4r0mMEYLhf7TcKvKKr6/x7NH6Hga7aa9rp5jecrp+hwTerkO5fwf8442B7vY/EaQZPiHwx3gOqoyW9wWcnGqAXBv5YsTmeql0OX7KhSO3SnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=OrNBb97b; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="OrNBb97b"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 89A86240103
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 22:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1783541071;
	bh=Y9MEOAxh5b63Adlfao2iDHFPLGatcwLiz4X9KR+ESHU=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=OrNBb97bHZ9XULCBNTyQ2N2mRusIca2zw70TywWCXIjjDlUeIVkFxE0GDoPfDQis6
	 ZBX8BaiS2y4oSJSyIF0Z4cRybDq/wx9SslgGNC7W3QBxHopOzsKdmNeqNCR/vvhlrU
	 OzZd00+HtTsxsZltJaMO5NSO/qh14AjNaNbCK84/E865EVligzq507lAOCrZntP+gc
	 EwKhViS9VESc+0Nzpj6UUDuyXIcDIngpNmHWmwUAL0X4FLJsEr8upnfzihAssqRpyj
	 PUxncuGdzydEZ5qxZATHGROp0j5aTFq7rPoUTgiQianJNZKdkgs2+jRdnnDxf/z4N6
	 T/a1O2BVLbOdg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gwTZk6cGgz9rxN;
	Wed,  8 Jul 2026 22:04:30 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 08 Jul 2026 20:04:31 +0000
From: Michael Diesen <michael.diesen@posteo.de>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Elite Dragonfly Folio
 G3 speakers
Message-ID: <6b2b71bb318263aeb4f3ff67754d9978@posteo.de>
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable

The HP Elite Dragonfly Folio G3 (PCI SSID 103c:8a05) has 4 CS35L41
amplifiers on SPI, identical to the non-Folio Dragonfly G3 (103c:8981).
Without this quirk the amps are never registered and speakers stay
silent.

I've been carrying this as a local out-of-tree patch and would like
to get it merged. Note there is a related, recently merged quirk for
a neighboring SSID on what appears to be a sibling board variant:

   0a10faad5ca5 ("ALSA: hda/realtek: add quirk for HP Dragonfly Folio
   G3 2-in-1", 103c:8a06), which uses the SPI4 + GPIO LED fixup
   variant rather than plain SPI4.

My hardware (103c:8a05, "HP Elite Dragonfly Folio G3", non-2-in-1
SKU) works correctly with the plain ALC245_FIXUP_CS35L41_SPI_4
fixup and does not need the GPIO LED handling. Happy to re-test
against SPI_4_HP_GPIO_LED if you think that's actually the more
correct fixup for this board too =E2=80=94 let me know.

Signed-off-by: Michael Diesen <michael.diesen@posteo.de>
---
  sound/hda/codecs/realtek/alc269.c | 1 +
  1 file changed, 1 insertion(+)

--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6817,6 +6817,7 @@
       SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)",=20
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
       SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100",=20
ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
       SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9",=20
ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+     SND_PCI_QUIRK(0x103c, 0x8a05, "HP Elite Dragonfly Folio G3",=20
ALC245_FIXUP_CS35L41_SPI_4),
       SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx",=20
ALC287_FIXUP_HP_GPIO_LED),
       SND_PCI_QUIRK(0x103c, 0x8a1f, "HP Laptop 14s-dr5xxx",=20
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
       SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx",=20
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),

---
