Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060B346E57
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777978; cv=none; b=YQunJKOd0jJlIdmCQvdetWo9pxHqrA+MvCoiOveexfR5RGfCTpUFhySmxTNL2CBX3A5hUZugdqTvxBIC67suew/cqRNe0BYzz2RIadvStRnYMgYv3lNWi1HnlqhzJu3FbR8Kj1vC9I1vZvcWfyXHGCMNez9XNvZ6pZSPMy021Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777978; c=relaxed/simple;
	bh=qufCrOQJ/MJGYqiNMnzTRvzHIxgnM7CS2Z67MI2gGG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svFe6H7wZHMl7vIOlGxY8BOAgq4SYzuXCWsojd3h8FasVbTRjZQLe/PUHy+RGCKw/Cbw2pEbxZIWYm3DWfu8ua0Mnmr6yEqPBHSlzufxDJ58fhiRUb4W2eNoZNKu+DRR0vFPArMCFyrVlTWjjnh0d+9JexaWM9a9/1bifzgjCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HG3B0A0k; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HG3B0A0k"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso382905e9.1
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778777976; x=1779382776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJlVXS7VpLDAUn2I0xTgOYEtx2bom/696v/PF3Hempg=;
        b=HG3B0A0kZZ10xzNEvQpmyINykzMlvc+q0OdQUvAsdJ1oL8NqpofEdocmdqyV1AmMY3
         YJobNnUw/XeBNouY23/6vSvJskmam+urB2WJbMPXS0slBYScJAAvVLjaNgS/MPAkUNAI
         TD25h02X9FRrsFXu+4t6/om3b/MsKiNX4JEBTCN7J4TegTPVHB4Csv119KqKyWU/7rsF
         m7XpxBGo+LtQfr8OwmbmB2sp7b4D62Ky6u+Bk4u/i55Zs5KZdNy8G6WLuqrFmRDo/wWD
         TSvdI90vNN+bZ9BP+EvDRiTQNwkzfAraBXXOEuQtETdZANzCsAqr9JdyLDWghrRvVqUZ
         40Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778777976; x=1779382776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJlVXS7VpLDAUn2I0xTgOYEtx2bom/696v/PF3Hempg=;
        b=SoMWMo5/1U72FDxvLnAIXKsjRAmXt7i37qg0G21788POVamKFv12nlJRDDbx5lldLQ
         DFzdJ61U2/EvkuIKbyvDXP/mbjAa552OvrDmFlr76yKHjwuG+A1IpOzhAy+xunzrHYoA
         npZiP2of7kJnjjEIMzPL58JwK0Fzidyu3KPE+9IufSndiXguRYf0i4pEBJ+KPDPcufBQ
         q4zlv7MBvU0THPMRjiPYhOssUI2yOpH4sRIenLiMNKJDxYQgMAe7z0Cv5m9tMFAnuFpm
         9vAsXBbj29sIswFi/xXFHhXNmyE2HovbkAwwjkrp2tRI9R9P7IiNzc4v4PyOE8ODxMCz
         qAUg==
X-Gm-Message-State: AOJu0YwZbNjYbU4i/QpDVQdmOC7+kPgHtSnwP+X5Z4ih+PSBnwZOIP81
	8EwpMJ951PojAHQ/3POm1NAkiVeGARIuPIFFT+LcIJ87av2lY5r5o9RM
X-Gm-Gg: Acq92OFNCpJE4oHRSd9LpfCb/3zsqdVDMYYaxBCwrZAVEGYpD8LyzYeTHj6oEE+Yg1d
	K9HG/NL7+zsvmo/si2qdHPoaejzxGf5EhawG/a/Q8FlLW7/PP73XyZy8o2iub1xvCEtG0movjOR
	QY/fvyDfOitWV4Mn+8nep8qvdxtLwJGqLc9gFZNtyy8zb1dL5SLqlUbmY6t5F7w/1srDQ3PovAP
	loE8FQMnVp93HOGbCGihJl6dFs0Wn+uKtOqDcuGhuCtioNdZXNl+SsMTXHB1A8mM8uyrhZraLCF
	S/7xFUONqH+1mifgsnkWKTu2K7qk6FzzfB4bFz520vh9FmE7zWma1bsaW57ouWoOg0sHz7ko8aW
	PDvM2mX5JY1r+pf8qJUDS7HefwkintgYDYq6hacGxIcBcssBxxjb1pkPIe4/X7TXWLmP4261Ohj
	FptH73sjqcxmitOttkuSrWtRboZ3e+QuRez6n+YvlQUi8P/cgSWh27o14=
X-Received: by 2002:a05:600c:8485:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48fe537fb6fmr4017675e9.9.1778777975741;
        Thu, 14 May 2026 09:59:35 -0700 (PDT)
Received: from fedora ([88.191.73.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm4660455e9.9.2026.05.14.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 09:59:35 -0700 (PDT)
From: Adrien Burnett <an.arctic.pigeon@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Laptop 16-ag0xxx
Date: Thu, 14 May 2026 18:59:05 +0200
Message-ID: <20260514165905.21175-1-an.arctic.pigeon@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a SND_PCI_QUIRK entry for the HP Pavilion Laptop 16-ag0xxx
(subsystem 0x103c:0x8cbc, Realtek ALC245). The
ALC245_FIXUP_HP_X360_MUTE_LEDS fixup is already used by the
neighbouring HP Pavilion Aero Laptop 13-bg0xxx (0x103c:0x8cbd);
it chains the master-mute COEF handler with the GPIO mic-mute
LED handler, which is what this machine needs.

Tested on the affected hardware: both the mute and mic-mute key
LEDs respond correctly to the keyboard hotkeys after this change.

Cc: <stable@vger.kernel.org>
Signed-off-by: Adrien Burnett <an.arctic.pigeon@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d720565db..04d784343 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7135,6 +7135,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ca4, "HP ZBook Fury", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca7, "HP ZBook Fury", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8caf, "HP Elite mt645 G8 Mobile Thin Client", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8cbc, "HP Pavilion Laptop 16-ag0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8cbd, "HP Pavilion Aero Laptop 13-bg0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8cdd, "HP Spectre", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8cde, "HP OmniBook Ultra Flip Laptop 14t", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
-- 
2.54.0

