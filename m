Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3FB2931D2
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673271; cv=none; b=TsdwXiRJxv5+0+KFcUBnTaaBjPAJoVwZH8yU9iv8CPxwTF8LzJUZ/nIS9QF8Eaw0jSKlc6MWzX2eoHUiQ0xSI1Soc8BIp83tdpTaLcbHzHPb7Q5ZY5ELaJImJu9pr6gNRgedH0K/PlUStoE2NqSo7rHKmwTR6wTxLXDP1ImhqCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673271; c=relaxed/simple;
	bh=fQO8bKpqFYtdX/vQNWJHNMELZfW0O1OEK1Uf6ts4N0o=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=BLG0l0TwJw2yy2FOZ9eMypzT0NkA1OQjlj0VlZB3lyp5AjOwIMy9YqfsLvZIhzKkZgvtAxtUS1ahnBqwUOn/t55JNczvSINqCx7VtYgYjgl4t4PiTFLG9GIVCn/6L855Rf6og9P8k4ij3s6ToVegNWkKjcOE0dVogxD70fBsetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com; spf=pass smtp.mailfrom=tutamail.com; dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b=MoVN6t8Y; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutamail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b="MoVN6t8Y"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id B0DD716E9BB28
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 04:07:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786673261;
	s=s1; d=tutamail.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=q7N5PGZfBop7MqITEpFqN9zsxQb2KRTxkibGaJsjQbI=;
	b=MoVN6t8YoYeLU2pVYQC0e1t4I1CPjHLUo6vN9vCiE9+ouHE/yR3IbSIkC+3KTh8S
	ohWtfmG59g2jQAbAUvIZa9mYx7mLdIuegFhf36k87BX9c18D6s9bAja2peVnAaiK1xN
	yU9iKlivDKELZQ3W1RMJpMWolRKhyjJQFz76LSEmppNeTIhcvFlIA1U8K2MZ6Z1QWvm
	wDXzrCEMfCMD3DfkX4H0oEtZg+q/jAkV+hWYbcpdM37/sNU9Tg6Re+duTCH95WhUVtL
	gNXF3/ckXpWIc9HseXkj5KHmFukx/MCUYjsykxyp4icIhi9tdSTZ/moc0uXZAR0F7CS
	Zth32JGcwg==
Date: Fri, 14 Aug 2026 04:07:41 +0200 (CEST)
From: cloudyweathered@tutamail.com
To: Linux Sound <linux-sound@vger.kernel.org>
Message-ID: <Ozy0Y1U--F-9@tutamail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LED on HP Laptop 17-cn2xxx
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_94761_852535102.1786673261719"
Feedback-ID: 0144a90d6a9a357c608f5b7bdb4e6a30618b0c9dcb277d96100c9bad91b76d7ad6692750e9841a667796f32173979224d1e5ed594b0105b476ae6e456706447898:TurnOnPrivacy!:tutamail

------=_Part_94761_852535102.1786673261719
Content-Type: multipart/alternative; 
	boundary="----=_Part_94762_843799183.1786673261719"

------=_Part_94762_843799183.1786673261719
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The HP Laptop 17-cn2xxx (subsystem ID 0x103c899b) uses the ALC236
codec and controls the mute LED via COEF 0x07 index 1, the same
mechanism as the other HP consumer laptops (15s-eq1xxx, 14-fq0xxx,
15-gw0xxx). No existing quirk covers this subsystem ID, so the mute
LED stays off when the system is muted.

Add a quirk entry to enable the mute LED.

Signed-off-by: Max <cloudyweathered@tutamail.com>

------=_Part_94762_843799183.1786673261719
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
<div dir="auto">The HP Laptop 17-cn2xxx (subsystem ID 0x103c899b) uses the ALC236<br></div><div dir="auto">codec and controls the mute LED via COEF 0x07 index 1, the same<br></div><div dir="auto">mechanism as the other HP consumer laptops (15s-eq1xxx, 14-fq0xxx,<br></div><div dir="auto">15-gw0xxx). No existing quirk covers this subsystem ID, so the mute<br></div><div dir="auto">LED stays off when the system is muted.<br></div><div dir="auto"><br></div><div dir="auto">Add a quirk entry to enable the mute LED.<br></div><div dir="auto"><br></div><div dir="auto">Signed-off-by: Max &lt;<a href="mailto:cloudyweathered@tutamail.com" rel="noopener noreferrer" target="_blank">cloudyweathered@tutamail.com</a>&gt;<br></div>  </body>
</html>

------=_Part_94762_843799183.1786673261719--

------=_Part_94761_852535102.1786673261719
Content-Type: text/x-patch; charset=us-ascii; 
	name=0001-ALSA-hda-realtek-Enable-mute-LED-on-HP-Laptop-17-cn2.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=0001-ALSA-hda-realtek-Enable-mute-LED-on-HP-Laptop-17-cn2.patch

From c9afe91571f34075072b67cf1dfe3bb05ca6be99 Mon Sep 17 00:00:00 2001
From: Max cloudyweathered@tutamail.com
Date: Fri, 14 Aug 2026 04:53:13 +0300
Subject: [PATCH] ALSA: hda/realtek: Enable mute LED on HP Laptop 17-cn2xxx

The HP Laptop 17-cn2xxx (subsystem ID 0x103c899b) uses the ALC236
codec and controls the mute LED via COEF 0x07 index 1, the same
mechanism as the other HP consumer laptops (15s-eq1xxx, 14-fq0xxx,
15-gw0xxx). No existing quirk covers this subsystem ID, so the mute
LED stays off when the system is muted.

Add a quirk entry to enable the mute LED.

Signed-off-by: Max cloudyweathered@tutamail.com
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 427caf0..870f7a2 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7073,6 +7073,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8992, "HP EliteBook 845 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8994, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8995, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x899b, "HP Laptop 17-cn2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x89a0, "HP Laptop 15-dw4xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x89a4, "HP ProBook 440 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89a6, "HP ProBook 450 G9", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.54.0


------=_Part_94761_852535102.1786673261719--
