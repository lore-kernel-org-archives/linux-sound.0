Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C532E132
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 03:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768794337; cv=none; b=ueKJXwfB+J3hjYdSj9qoofOd7o+Es0xQ97Ojyn8CFmKaA224osp6GElXya4VPLcVkMoVFPfT5W8aSkpF+XaMxPDSGf8uhXCKrvoVGHHT+aLACzakeXwJTCwYyuqbEi03uI2WvzlgS8lr6MQwljJ2kiAeF4/h+bDVeSFevjckRrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768794337; c=relaxed/simple;
	bh=8teWPsVcmhwbWt3AJfgeYG+siE5omaKueU7yvI5UJ/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=EZ2dQMK1UkfSdmjQHuCpBIk7JdhsHBf5DmWG6BtxF5Pbg3GjDcc3jn0h4oSQhrfmIY+Hg2645KfOOLA/HlgqWtf0cVvDbkoKVzlScAZ2HG82MS+Wa6+72PuEdMUhPiFAOsNm9rh95O1mn0KaVuXruKot0eMfeYP9KPjwtUIITMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (2048-bit key) header.d=hp.com header.i=@hp.com header.b=GLN6eLE1; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hp.com header.i=@hp.com header.b="GLN6eLE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20250822;
	t=1768794334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w1svD2Zx+IdAy9vBQy3HwsLBCUqh5817SLKgbIGKAHY=;
	b=GLN6eLE1hJr8vskGjWKDSLnE9AOGC0SvJipbLqvk3TK+lV+8tRrzjQFwJF7jwIcZoQlxva
	U4PE3G0i4ettrRn+x3VVv4km1KdhwMoLZ7ukqFzXWk4LnEG1aQVtP3btt1cO9SVXy2k6Rc
	dlSqNNQSzFKlR08+vHwx1H8rt51N97zMycgzkTvRkBVz5bZy86RYmGH4g96gGJHzRbCKQI
	J6aXiGYjHXMc36/kRhXZzP+lYFpZgxFcwtTd4ItqYN3SprKOSxb9ZKvi5oQcR59azvsnGz
	yo90ppK4JQuvnVEucs85ML/21Yd94bRkwUuFcAMY/OPWrB4VdTb7zyy47XKuxA==
Received: from g7t16451g.inc.hp.com (hpifallback.mail.core.hp.com
 [15.73.128.137]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-yXmHJE0rOJeqXiS2xpQzcw-1; Sun, 18 Jan 2026 22:45:31 -0500
X-MC-Unique: yXmHJE0rOJeqXiS2xpQzcw-1
X-Mimecast-MFC-AGG-ID: yXmHJE0rOJeqXiS2xpQzcw_1768794330
Received: from g7t16459g.inc.hpicorp.net (g7t16459g.inc.hpicorp.net [15.63.18.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by g7t16451g.inc.hp.com (Postfix) with ESMTPS id 83DFC600568E;
	Mon, 19 Jan 2026 03:45:30 +0000 (UTC)
Received: from linux-Standard-PC-i440FX-PIIX-1996 (unknown [15.36.178.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by g7t16459g.inc.hpicorp.net (Postfix) with ESMTPS id CFD4360000A2;
	Mon, 19 Jan 2026 03:45:25 +0000 (UTC)
Received: from linux-Standard-PC-i440FX-PIIX-1996.. (localhost [127.0.0.1])
	by linux-Standard-PC-i440FX-PIIX-1996 (Postfix) with ESMTP id 729D7205FF;
	Mon, 19 Jan 2026 11:45:06 +0800 (CST)
From: Qin Wan <qin.wan@hp.com>
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	edip@medip.dev
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	alexandru.gagniuc@hp.com,
	Qin Wan <qin.wan@hp.com>,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix micmute led for HP ElitBook 6 G2a
Date: Mon, 19 Jan 2026 11:45:04 +0800
Message-ID: <20260119034504.3047301-1-qin.wan@hp.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5vAGcgfapTaNz44-so_QrHKYqfgBqwMfvufijN3VYgs_1768794330
X-Mimecast-Originator: hp.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true

This laptop uses the ALC236 codec, fixed by enabling
the ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk

Signed-off-by: Qin Wan <qin.wan@hp.com>
Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/a=
lc269.c
index 0bd9fe745807..49590926199e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6704,6 +6704,10 @@ static const struct hda_quirk alc269_fixup_tbl[] =3D=
 {
 =09SND_PCI_QUIRK(0x103c, 0x8ed8, "HP Merino16", ALC245_FIXUP_TAS2781_SPI_2=
),
 =09SND_PCI_QUIRK(0x103c, 0x8ed9, "HP Merino14W", ALC245_FIXUP_TAS2781_SPI_=
2),
 =09SND_PCI_QUIRK(0x103c, 0x8eda, "HP Merino16W", ALC245_FIXUP_TAS2781_SPI_=
2),
+=09SND_PCI_QUIRK(0x103c, 0x8f14, "HP EliteBook 6 G2a 14", ALC236_FIXUP_HP_=
MUTE_LED_MICMUTE_VREF),
+=09SND_PCI_QUIRK(0x103c, 0x8f19, "HP EliteBook 6 G2a 16",  ALC236_FIXUP_HP=
_MUTE_LED_MICMUTE_VREF),
+=09SND_PCI_QUIRK(0x103c, 0x8f3c, "HP EliteBook 6 G2a 14", ALC236_FIXUP_HP_=
MUTE_LED_MICMUTE_VREF),
+=09SND_PCI_QUIRK(0x103c, 0x8f3d, "HP EliteBook 6 G2a 16", ALC236_FIXUP_HP_=
MUTE_LED_MICMUTE_VREF),
 =09SND_PCI_QUIRK(0x103c, 0x8f40, "HP Lampas14", ALC287_FIXUP_TXNW2781_I2C)=
,
 =09SND_PCI_QUIRK(0x103c, 0x8f41, "HP Lampas16", ALC287_FIXUP_TXNW2781_I2C)=
,
 =09SND_PCI_QUIRK(0x103c, 0x8f42, "HP LampasW14", ALC287_FIXUP_TXNW2781_I2C=
),
--=20
2.43.0

