Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10A1A23AC;
	Wed, 31 Dec 2025 17:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767201578; cv=none; b=QTXmvS+Z34TrBrKN6gxbwrB9jMAI2Sw3DS9KG8R36BQIh3JGFrglRxRSxym8ETjEJGz/1naurTPSXsuaxNag9tn7s7Ip4by1iy4lRC7FO9lALRHHRp2Gekx2q/VhgyAX1HjVzXiqlzKZqy56lYUQgYPVVhKTmpxwxyrCTwRbUVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767201578; c=relaxed/simple;
	bh=QnulXJnxjU/CR/rwVtIh2MM7ofeYJQi9WlmHiRNO+Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UFnoP4+1p6+CDyJJa/bjwvqu/kmJRxu21GC0g8xyGWiecQs94u5kXMwXyn63QL943d3oPh4txzCBVrwMoCTz3qmGtPaCq3m0cAFUnf2vjoB/i01ZXNmvJeOZ7EpNYsxaAE/F4qUJ3gjXtUvgAy+PZ6YxVZ0rC2oGOITA/Sa/Pjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz; spf=pass smtp.mailfrom=post.cz; dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b=HFxDUlKR; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=post.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b="HFxDUlKR"
Received: from email.seznam.cz
	by smtpc-mxd-6f5c89cb7f-rgmm5
	(smtpc-mxd-6f5c89cb7f-rgmm5 [2a02:598:128:8a00::1000:a0b])
	id 78d0d4ebbf826c107e45436a;
	Wed, 31 Dec 2025 18:19:30 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz;
	s=szn20221014; t=1767201570;
	bh=moqLXQLwzZJlbK6eLspxRn6nx51pPI8N5x9PekBkUjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=HFxDUlKRf7HDdFhtnItXBQMq+tjqQS3VD2cNrO3Co0VfXzoNmByveAgvn5z64YMa8
	 o2TcLqNUJi0IkA4skhkPpkNl29yMmPjkRLfIspYFkYX9giqfe3AS9ujTZDFsrsBF6l
	 aeh3qJ6kyNYdgH24SeqOa7934Qd0GDVgfQTSnr7uH0XfoEIw4E8gU+T16N4kvggFVX
	 LPE2ph2zzX2Rq5FFWCudcIBGIaDpzyklfZtG3+N2XCJf5syH/TF9AjLt0bWBklHTDj
	 5lh2QVlVDqD574tzR4+/fDYXeSy9eyaiKbakkMi9mXO+KHokejjZCdB9TtF13UrOl3
	 ExH+Xral6n15w==
Received: from archlinux (ip-89-176-227-181.bb.vodafone.cz [89.176.227.181])
	by smtpd-relay-6cfb9cdd7c-fgxf8 (szn-email-smtpd/2.0.64) with ESMTPA
	id 1f9f41ab-cbb9-4c90-bd76-92daaeaadd53;
	Wed, 31 Dec 2025 18:16:34 +0100
From: =?UTF-8?q?Matou=C5=A1=20L=C3=A1nsk=C3=BD?= <matouslansky@post.cz>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matouslansky@post.cz,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Acer Nitro AN517-55
Date: Wed, 31 Dec 2025 18:12:07 +0100
Message-ID: <20251231171207.76943-1-matouslansky@post.cz>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <87h5t6y85o.wl-tiwai@suse.de>
References: <87h5t6y85o.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add headset mic quirk for Acer Nitro AN517-55. This laptop uses
the same audio configuration as the AN515-58 model.

Signed-off-by: Matouš Lánský <matouslansky@post.cz>
---
v2:
 - Resend using git-send-email to fix whitespace/tab corruption.

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 171a71457ec3..3013fe1e54fa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6304,6 +6304,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1826, "Acer Helios ZPC", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1025, 0x182c, "Acer Helios ZPD", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
-- 
2.52.0

