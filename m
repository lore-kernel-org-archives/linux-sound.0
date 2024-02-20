Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CCD77652
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708451934; cv=none; b=dkN1uG6z+NTRmWGKpFrIhO7yWnes2tBf3wjgbJdtkq4Zlf//U9wsbTAswtN0Xfp5o2xsV9I8Oz8Mn0ItcqpkTcrsvHPJSivOaaXrF+dtVzyrZkgCJsSToWRskgYb0HrXj0tTdc6sshOppTfEunIm5R0uErwyIugubEc6ZYmf6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708451934; c=relaxed/simple;
	bh=ZFlkdl8lZjjJs/iATNcGRmZPdeWEsDsB2bR6iPpU2Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHAQkSP35jbQAQxluhvLDa1F3thTk4kmqHiD1U47n3I7anSP0pebLhoizuinK9jYrYZxilMGnkrj/sWrYFFAQqYjSeZrkyOuNZubn5+uqJ/CJLN3Qoa4o6XgWMAEsKdC/aoh5dcKByaE6WVoCAG+vOUW/9pdu0vqnpK9JJNu05I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=USeFFDC/; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="USeFFDC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1708451931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFlkdl8lZjjJs/iATNcGRmZPdeWEsDsB2bR6iPpU2Qk=;
	b=USeFFDC/XDVkC0DGq1kWV1DeMzJucWRU1ocG1qZoD57BeyDAS0OI9y/x5NyBYI2P/eLwEG
	roqoLNp/LTg3Xms7a3Wesp8XQ96fkesXe2+Se/6VDDzLe020wYp2m1xItfNNjWiXOUmJY+
	fCTNZlBKQZGWqQVLJKVMqREQUVX+1mM=
Received: from g8t01559s.inc.hp.com (g8t01559s.inc.hp.com [15.72.64.153]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-TeU0FbfROz6XMrsyVfxQ0Q-1; Tue, 20 Feb 2024 12:58:45 -0500
X-MC-Unique: TeU0FbfROz6XMrsyVfxQ0Q-1
Received: from g7t14407g.inc.hpicorp.net (g7t14407g.inc.hpicorp.net [15.63.19.131])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by g8t01559s.inc.hp.com (Postfix) with ESMTPS id 2D56020582;
	Tue, 20 Feb 2024 17:58:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [15.53.255.151])
	by g7t14407g.inc.hpicorp.net (Postfix) with ESMTP id ACDF814;
	Tue, 20 Feb 2024 17:58:40 +0000 (UTC)
From: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
To: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	eniac-xw.zhang@hp.com,
	Alexandru Gagniuc <alexandru.gagniuc@hp.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LED For HP mt440
Date: Tue, 20 Feb 2024 17:58:12 +0000
Message-Id: <20240220175812.782687-1-alexandru.gagniuc@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87frxteoil.wl-tiwai@suse.de>
References: <87frxteoil.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true

From: Eniac Zhang <eniac-xw.zhang@hp.com>

The HP mt440 Thin Client uses an ALC236 codec and needs the
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk to make the mute and
micmute LEDs work.

There are two variants of the USB-C PD chip on this device. Each uses
a different BIOS and board ID, hence the two entries.

Signed-off-by: Eniac Zhang <eniac-xw.zhang@hp.com>
Signed-off-by: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
Cc: <stable@vger.kernel.org>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0ec1312bffd5..f1b204d34928 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9902,6 +9902,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 =09SND_PCI_QUIRK(0x103c, 0x8973, "HP EliteBook 860 G9", ALC245_FIXUP_CS35L=
41_SPI_2_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8974, "HP EliteBook 840 Aero G9", ALC245_FIXUP_=
CS35L41_SPI_2_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8975, "HP EliteBook x360 840 Aero G9", ALC245_F=
IXUP_CS35L41_SPI_2_HP_GPIO_LED),
+=09SND_PCI_QUIRK(0x103c, 0x897d, "HP mt440 Mobile Thin Client U74", ALC236=
_FIXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8981, "HP Elite Dragonfly G3", ALC245_FIXUP_CS3=
5L41_SPI_4),
 =09SND_PCI_QUIRK(0x103c, 0x898e, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L=
41_I2C_2),
 =09SND_PCI_QUIRK(0x103c, 0x898f, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L=
41_I2C_2),
@@ -9932,6 +9933,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 =09SND_PCI_QUIRK(0x103c, 0x8ad2, "HP EliteBook 860 16 inch G9 Notebook PC"=
, ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8b0f, "HP Elite mt645 G7 Mobile Thin Client U81=
", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 =09SND_PCI_QUIRK(0x103c, 0x8b2f, "HP 255 15.6 inch G10 Notebook PC", ALC23=
6_FIXUP_HP_MUTE_LED_COEFBIT2),
+=09SND_PCI_QUIRK(0x103c, 0x8b3f, "HP mt440 Mobile Thin Client U91", ALC236=
_FIXUP_HP_GPIO_LED),
 =09SND_PCI_QUIRK(0x103c, 0x8b42, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_=
LED),
 =09SND_PCI_QUIRK(0x103c, 0x8b43, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_=
LED),
 =09SND_PCI_QUIRK(0x103c, 0x8b44, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_=
LED),
--=20
2.42.0

