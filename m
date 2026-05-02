Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191BE1A9F97;
	Sat,  2 May 2026 17:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777742947; cv=none; b=iL+XoynKLvvL0gVvvSta1/DWEDpryfyXDYUcziUgMxas3zguDDAMciLAkaGhxNKK0SSwdE8W1h9VBTRja5KTXPgfOfJNuKOMTyI2G/FUmL6WyI9cXMQ1Ja06WFWia4jKr3QwEApD7OHfdVupM7OkA0Gx3TTOSZux09nV02JIw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777742947; c=relaxed/simple;
	bh=7VYKiszLpoz0ZqLV77L40MWRPq5+B1M4gAeDe6Cdtvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kZ/Oo2VAAj77jMIbuiirTpcNBBvlt5m7giYoK9OfOXj6NWNd8P3DlIDPCKcPS/5xHzieTWsnGm9j2gQ6s5TYg4b4TOYF19RkXfBQZLnw+Rs2DDWJ6QIE0W6OqUwgj4hCuGIQBNT7RPOS9QH7oeYFPcnLka6ZcJt3tXGwqe3FEVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/NArUUh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/NArUUh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9E24C19425;
	Sat,  2 May 2026 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777742946;
	bh=7VYKiszLpoz0ZqLV77L40MWRPq5+B1M4gAeDe6Cdtvs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Z/NArUUhbZQhiv2PpTIhlvQ4228B/woMv6dcOMmlY7KvK/F2mE3+i1WFSVQZoH3Hg
	 9YN0avyCuVbdkDjinVpd0S7T9eG/ZujuZ6F9YKzetE0k3cVwBih/qi9PddyP6K7IsK
	 2XA7b7KJt1Yp5+xw2uMEJf57P9uK/6aEWzug1oviqOB0NjdPlgkp2He5SebWjICJSG
	 6T/zSFPqd/fE9/GBguio5fxQZEEKEHiwhAnX3YYG63+IR/wzirYGFZZ1uFq6dYlDKm
	 06TsjT6g0cBy+hkhXVfTEUCHkHVXJ2Y4wXi0jJjNcjy/vcxENu1MxtHxQLAzUX0IrE
	 kekODEB3OYBQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF63ACD3427;
	Sat,  2 May 2026 17:29:06 +0000 (UTC)
From: Fernando Antunez Antonio via B4 Relay <devnull+fer.antunez24antonio.gmail.com@kernel.org>
Date: Sat, 02 May 2026 11:28:22 -0600
Subject: [PATCH v2] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP
 Envy X360 15-fh0xxx
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-hpenvy-muteled-fix-v2-1-df2ba19b3b4b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4Xs2TVtkQqcfA/DAcoKa/hLC42E8
 O4WvHv8JjPzbeDIMjnIow0seXY8DgHUJQLTlkNDyHVgUEJpkQiJ7USDX7FfZuqoxhd/UKtEVmW
 W6ds9hTCcLIX4PH0WP3ZL9SYzH09Ho2U3j3Y9rV4evb8CL1FiajIRU6xFSvRo+pK7qxl7KPZ9/
 wKqzlRdxgAAAA==
X-Change-ID: 20260501-hpenvy-muteled-fix-6251ba996478
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777742945; l=1712;
 i=fer.antunez24antonio@gmail.com; s=20260501; h=from:subject:message-id;
 bh=dnfuLzMMMLgPx59tlBEYIF31US4c32XH7htV/V7Uxa8=;
 b=vBd+zSwT9lxFjoX4S8zEHSewL2flXi3bYRwiO1uoiVTBHS6akWgDic0H728w+lyNl1ZjvDIMd
 DZ+OFRUO+fqB9VnlWbfiUdD1FBC2ezT3y5r7RnK31Fc30j+ZmADlTzU
X-Developer-Key: i=fer.antunez24antonio@gmail.com; a=ed25519;
 pk=KtAZSzHv34SEFf0i38Wjweb1kiwZdCAcJmQ8koSweKY=
X-Endpoint-Received: by B4 Relay for
 fer.antunez24antonio@gmail.com/20260501 with auth_id=765
X-Original-From: Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>
Reply-To: fer.antunez24antonio@gmail.com

From: Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>

This enables the mute and mic-mute LEDs on the HP Envy X360 15-fh0xxx
2-in-1 laptops.
The quirk 'ALC245_FIXUP_HP_X360_MUTE_LEDS' already exists and is now
enabled for this device.

Signed-off-by: Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>
---
Changes in v2:
- Moved quirk entry to correct position to preserve PCI SSID order
- Removed redundant use of the word Laptop
- Changed subject from SOUND to ALSA
- Link to v1: https://patch.msgid.link/20260501-hpenvy-muteled-fix-v1-1-8c903e3608ee@gmail.com
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a9cd03bb73c4..ac669ae298d5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7098,6 +7098,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be9, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8be9, "HP Envy x360 2-in-1 Laptop 15-fh0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),

---
base-commit: f1a5e78a55ebf2b05777fd5eb738038ddae609d6
change-id: 20260501-hpenvy-muteled-fix-6251ba996478

Best regards,
--  
Fernando Antunez <fer.antunez24antonio@gmail.com>


