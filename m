Received: from e3i282.smtp2go.com (e3i282.smtp2go.com [158.120.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF12EA72F
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 20:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057516; cv=none; b=iU83QL4lyQwWXzU/6cInZWHymWW2dTHLFzCuVIn6ODJCDLbF+ovEdZvoTvF/y6MS4UecCXE/Yo+EoQDyhNrIPYGgLAHo2tfIjzw8ER2Xa3cZIoZPEtn8DUuKPsOykaGUrI4NWUdbx29cO2XzO1ljezrISbtR1xuYMyVWSrbNQmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057516; c=relaxed/simple;
	bh=hnIQiztxMqZWdOo1P+htuYxmTRJegAPaInqW5mKJO1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rT4BbJeIaWk9dwsz90ls2bAKR6feTCQCSKc9c5D066ukTDDkBBSIXJ21Es+Yb6GaXH3W4u4afWfRsLfPLZ1oaI2UxuJs7mOkGQKNRW8egcMj7U0tWUGQY+J7fMriXYD3rVVPLUNBK//oXfszt35LJrHvct39uKQ570/qDto16SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=mXxTdAyb; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=MagLAvTS; arc=none smtp.client-ip=158.120.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="mXxTdAyb";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="MagLAvTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1751056604; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=TqdWV7/vA1rvF4B46py+BIoi1Rg8y4mycuMpMH6ZDBQ=;
 b=mXxTdAybXd0nnfUnStIyDY4wZn/usYqKey40sJFKl+Dsm+r+SVJY7IQSdGE7RhxYVMSZb
 YX+dDjiov0JWuo4Y6cXOW3bX484LE/5T4PObQjKK8PqiHHamQeBlC+YbhaPtap4oPvysujp
 DA6RHJfCnwxBMQlZXuZbppU96l0Ue0t3xspOEw42Fnpnt0WXDnlZkNfvskTsEkXVQo1l2fg
 XEXzmAkUgsHcTzn1fLEIuFZqlpqRyrgbNAKeJRgf1qyrwD6o0s36SCrjWuJ5LqAgXZn0HrV
 XWe8Gi5ASWJz4kxHFSi6TyvJ36w3DjVV6iuwdBMJWNIzn4tGkoycKjX5a21g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1751056604; h=from : subject :
 to : message-id : date;
 bh=TqdWV7/vA1rvF4B46py+BIoi1Rg8y4mycuMpMH6ZDBQ=;
 b=MagLAvTSi3d6th0ylQESSGcTeB1DN9tjBZNpbiqYiuvyIlPLsWdWFEawt5/Abk8faodWI
 P4zzcN95rInmuFjU8w2eDW/HQ5yNUCtT+7pDrU5UBhVuCqvVow4qY06CMNm+JW9cENwBeJM
 zQZvKU/PC3Fr3XfIomJjf2AuDzDmk36aXk0EiZE7tPcTEs+NO8nPmItUKRAK7BjXGp5D503
 terj2DsLu+DgOpeZGbB5bNdL4e9S3rm+wkx5neQCoi3z0I6zBJwAa85MHR5mzZNiYWeIoB1
 wnGJ3v3BtWhyD6PnlBzbYueX6YnKf2XO30BIhg24fDduL7PmctXqlDiLf76Q==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uVFoO-FnQW0hPsXUs-39tC;
	Fri, 27 Jun 2025 20:36:41 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Add mute LED support for HP Victus 15-fb2xxx
Date: Fri, 27 Jun 2025 23:34:16 +0300
Message-ID: <20250627203415.56785-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sS8hnAP156
X-smtpcorp-track: -BPQYTnLJ1C7.taiHBTAF2NIQ.NcbG3QT8pXL

From: Edip Hazuri <edip@medip.dev>

The mute led on this laptop is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the device.

Tested on my friend's Victus 15-fb2xxx Laptop. The LED behaviour works as intended.

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5d6d01ecf..a33e8a654 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10881,6 +10881,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ce0, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d01, "HP ZBook Power 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d07, "HP Victus 15-fb2xxx (MB 8D07)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8d18, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO_BIND_DACS),
 	SND_PCI_QUIRK(0x103c, 0x8d84, "HP EliteBook X G1i", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d85, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.50.0

