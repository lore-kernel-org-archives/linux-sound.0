Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2EE23BCE3;
	Sat,  2 May 2026 03:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777691687; cv=none; b=pfBLg944H4Zr2ZixVX86zjt6xO4AaQxBWLTXVkyMF7Fsq5NmrYT2Q3SKRl99QgQW8WKwJlJ1OKPR7gCMS1DFpm6tGnaR19FmiDdGZGNzOGkyo0jy9MWsQnpFk076/2wwrSaJIDf7BpsnCogoty+Bt1VvBzdH7vzqnuALRvEvsQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777691687; c=relaxed/simple;
	bh=ozNADaANWfGmExf+wgVpV2dvAPf1WfwHsN1Zj1SGTKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p8ZJ4ICZmyZecebKYJg3BGF0OHR526NGNnP5vACnRyX9ZWEW2vATl5zzZ2CSbZ0S3y9RZMaSimrb0/CXCXgE1fvZoxGA8g8JUXtj4KjhgCwIWOtILa2+9E9kPB1zDStL5dRp4WDD2TO0GjD4DCRIQmnoZc2C1yMUfuFZpVB4iGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=torICY4w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="torICY4w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0C8AC2BCB4;
	Sat,  2 May 2026 03:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777691686;
	bh=ozNADaANWfGmExf+wgVpV2dvAPf1WfwHsN1Zj1SGTKM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=torICY4wJEFYNqEeV1ZUgk16f6B23tPd4ue0Pc32LspyV4iK5TegpKBPHCrfRjsy8
	 qmNruLMVj0GPc3Nx5yh/k/llgiDZHCMg7Y8OsFGkS6NxxrRZ5FpVxPakX6mTBWky0f
	 rUu6d6DRiCAp/HPZKpeCbjj8VdzZDC/EpyKwqAJQWiFizvlgPgzSsVogPsYG2pJev1
	 4guiUSEdRhrGhqQUoj8PCFK+6MX6e4z/ds22jE4Yukxu3pbG7MvMsR0vl+/Bh1+kw5
	 ymMgXEuANRv6LVSz57GBkrN/5r+U7aWhlyMnDtcobEoKb+KYq/e8Eob3FhbpRh8z1q
	 Sytl2pdVtpQcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91829FF885A;
	Sat,  2 May 2026 03:14:46 +0000 (UTC)
From: Fernando Antunez Antonio via B4 Relay <devnull+fer.antunez24antonio.gmail.com@kernel.org>
Date: Fri, 01 May 2026 21:12:25 -0600
Subject: [PATCH] SOUND: hda/realtek: Fix mute and mic-mute LEDs for HP Envy
 X360 15-fh0xxx
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-hpenvy-muteled-fix-v1-1-8c903e3608ee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwND3YyC1LyySt3c0pLUnNQU3bTMCl0zI1PDpERLSzMTcwsloMaColS
 gMNjQ6FgIv7g0KSs1uQRkklJtLQDAhTAPdgAAAA==
X-Change-ID: 20260501-hpenvy-muteled-fix-6251ba996478
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777691685; l=1533;
 i=fer.antunez24antonio@gmail.com; s=20260501; h=from:subject:message-id;
 bh=rizJAej4eULwlK5TkysaXIIDGp528Tn54JOsQuo8xus=;
 b=pKeigPO0uYwIs6K3LZvcGupuBUokA9iMFOWxYy/rqvSuoFYBPFuKgAXr4i8VetuPBYks/g+wp
 lY6sjMilv5hBlaO3t2/2O1t3Q5RV82iJEIDVYA9Pa1uixJvkolHRxVY
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
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a9cd03bb73c4..3194fc1737e8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6975,6 +6975,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x887a, "HP Laptop 15s-eq2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x887c, "HP Laptop 14s-fq1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x888a, "HP ENVY x360 Convertible 15-eu0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x8be9, "Laptop: HP Envy x360 2-in-1 Laptop 15-fh0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),

---
base-commit: f1a5e78a55ebf2b05777fd5eb738038ddae609d6
change-id: 20260501-hpenvy-muteled-fix-6251ba996478

Best regards,
--  
Fernando Antunez <fer.antunez24antonio@gmail.com>


