Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79EF1A08BC
	for <linux-sound@vger.kernel.org>; Wed, 26 Mar 2025 20:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743020436; cv=none; b=t7+BxH72cJJV9Um0XBTWXx9aIZkBq6TsU8GD1D6a9yT6eUWOCZbAp0U6Hp+196bfQxLXwjm5p0ko4+0Lag9ZmQrPb4L3QluqML1sbzD/5d9kfRX/Nr4++twBIHcNt9APv4WAtCpoQDh5PCRuGKi2SRPkJYQc82msZeB4IsN2GTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743020436; c=relaxed/simple;
	bh=pVrFwhxu3XGkoNdOV87Fm/ssA6Z7GFTUklINiUCtRes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E62W1ql5a9Toqf4XuCuUTirx13C7/K7abZgcY4hpu/1ZHFJtfny6lycpvTYdemBq4MG7W/ESbclNT20nciB1+9XlW0QqzpPkw2504es/iTMMscQj0sOo3+os5j6x63XuQMJ10wF5w7tLta9g7oSTz8yayO7hbBDfBUITU5FycUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=xhavpwYe; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="xhavpwYe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=V5pkytyT+DEhYADKt/xvin0SePU+eW7l+xfacZv2jTw=; t=1743020434; x=1744230034; 
	b=xhavpwYe9zlAxHOKYQsOL2Vj7N+KkSBdJmloMaKpBhWukQhUQS5G2991EziarzECsqa87JBmsm9
	OiZtIHW9vY5A7Ix/Brdy8x6H0QF57MtgWVmKn7TBXfhSv+8IwVVej6f7VfMFlvfK00RTfFyZ9xTIJ
	YPHYYFA2xeLTw6TwflQRUrkPDbEeB5ywTwwFDeY49tyavAhlJdeEm4Algd+U8K3G5snwc1sFO31uK
	zIPkwR7OOfqcPYzVOjeu7MGc+L0IPirVLnDWECUaaRdzDnT18/RCHjpNxp2gKJ1kVcgcF8yfw4Le9
	aPF17Fvbo+hz91FJmfKW72bpWj1gaw2uSjoQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1txXEl-00000006P46-0WvD;
	Wed, 26 Mar 2025 21:20:31 +0100
From: Benjamin Berg <benjamin@sipsolutions.net>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCH] ALSA: hda/realtek: Enable speakers on further Samsung Galaxy Book2 Pro
Date: Wed, 26 Mar 2025 21:19:53 +0100
Message-ID: <20250326201953.131948-1-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a further NP950QED variant of the Samsung Galaxy Book2 Pro
which has two speakers. Use the appropriate two speaker quirk for it.

Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>

---

Note that I didn't really manage to test this directly. Trying to do a
reconfigure resulted in a hang and I didn't figure out how to use the
patch= option with a firmware file.
However, the machine does work fine when configuring the two speakers
from userspace, so I am confident that this patch is correct.
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c735f630ecb5..e4ea5ea5bb27 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10758,6 +10758,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xca06, "Samsung Galaxy Book3 360 (NP730QFG)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc868, "Samsung Galaxy Book2 Pro (NP930XED)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc870, "Samsung Galaxy Book2 Pro (NP950XED)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
+	SND_PCI_QUIRK(0x144d, 0xc01d, "Samsung Galaxy Book2 Pro (NP950QED)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc872, "Samsung Galaxy Book2 Pro (NP950XEE)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
-- 
2.49.0

