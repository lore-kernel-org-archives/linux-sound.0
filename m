Received: from e3i331.smtp2go.com (e3i331.smtp2go.com [158.120.85.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF9238152
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753813199; cv=none; b=q3pb5ASJUoJPKJPoF+XkeJlH5fu2SvpEJIh50oFU/ijHfV3oJKTt78nZ5vFw1iAoWugOfCiGUAk/TJOgfP/6Fw8Opizw58BQX61OwTbt+fxNjrLxUzMqpGrEBvD1rsmgkvIk+PhEjDWmQO3WkInF84n/ydbCJuowHBqsjWghWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753813199; c=relaxed/simple;
	bh=8cZ8iZ8qtV7gGNyVIsY/ItajFVHqRLfZExe/pKoKmuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1zQETBNuhx72JQBO76hAp9VZMtaoufZQpIhV/wBn9SCEsOJwMVf46SFqwp4IUVrEMSRlsTKJROOK7JvK0qtYwokhrqnFXBXwmKrSN/ng82ZRBhIZspj5Kd4JQHlmhsCN5dYgOyfOZ6bV2RTGpsFPXQqAs50sPLu/PlRY6nK820=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=yZ0z/yOK; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=AJI3FRAo; arc=none smtp.client-ip=158.120.85.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="yZ0z/yOK";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="AJI3FRAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1753813195; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=W62LCwnhZ9/NUInAK1TZuyBIe4Xaetrqj46TOlKwxq0=;
 b=yZ0z/yOKAz3mX96fwhM8RKBbFgiNINjXl0MVA+RDsPomV8lUc0iv/zTyUysLfhialPlp9
 khOvcK7GmPqm1oiq5KvI0gZEpDlpAr1+yjSWyeE0iSboz2NGFAXCvbGxsU3fbRCLprWVt7+
 fKkiE5ZcTlpoe/xbMnvVWBvpWRW9OQke9PnkwL1kwZ/m2Hh4ZGtJWgW5jgQLzEOp+j30s9Z
 7GUnaosdJ78uGyLYYUqoT0+uVIpCJ3IJoNzZmBGP5LPhCDds+K4z8uJLYXkMWwPKNuOLNN7
 wHl+L1RpSPapwb+9eqCkDf2qhuDnsgng5zy/HlLSwm75K2Q6u4YhjjU8V/TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1753813195; h=from : subject :
 to : message-id : date;
 bh=W62LCwnhZ9/NUInAK1TZuyBIe4Xaetrqj46TOlKwxq0=;
 b=AJI3FRAodUpOAPstQzmAqujyEowsK3foHxnhz8LrvcBDHh0G16K1RqQYwTgwDMaNbICRw
 TkllPuOlTDKLBWtVHyGF768M8ZhcdKXKP0y45MPw/H5iTdyguYi6PwadvghK4atyXb6w6je
 oeb+a1LhH1vN4grsDqAs5nkac2MRgH6QQ5sK+vxt2gZ171Jo2BWw+1zps5fa7aXn8pFeEk+
 33zfcz+Zu7u44ZAWK9ITCoYQ3FRTdVvzda9b7wWyl2+r2ShsHyLPIYhL2md2xs8H1n/1QOF
 I+Efx3wwBhjODuN2Kh9D8UN3hetFxswy/TO5itk1/gNB1S55weuHJKr2x+wQ==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1ugovR-FnQW0hPr2KU-OeZJ;
	Tue, 29 Jul 2025 18:19:47 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/realtek - Fix mute LED for HP Victus 16-d1xxx (MB 8A26)
Date: Tue, 29 Jul 2025 21:18:50 +0300
Message-ID: <20250729181848.24432-4-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729181848.24432-2-edip@medip.dev>
References: <20250729181848.24432-2-edip@medip.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sDUZirJ3h6
X-smtpcorp-track: BhIW7NfjkIDH.wYmRbTfmXfjy.YoguswAo6Mx

From: Edip Hazuri <edip@medip.dev>

My friend have Victus 16-d1xxx with board ID 8A26, the existing quirk
for Victus 16-d1xxx wasn't working because of different board ID

Tested on Victus 16-d1015nt Laptop. The LED behaviour works
as intended.

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 77322ff8a6..d0f1d01bfa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6470,6 +6470,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8a26, "HP Victus 16-d1xxx (MB 8A26)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a28, "HP Envy 13", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a29, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2a, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.50.1

