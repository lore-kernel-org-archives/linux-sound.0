Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D76033938E
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025908; cv=none; b=ObWBqanaGTMN/Cp7VgHZy7cCL4Az9Qjvf4u6s3xBEjmjQA5SQT86z3q/C/FW8Le65/g4zyH1uRjd8HlVV/v5+iiTihvjJU1IrFHzc2hKP6PqWM0+fh4IXfH34CtppiRbs5bcER6l1RaeFufkTMhCxkP08YRct9dGQB13Vmps5cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025908; c=relaxed/simple;
	bh=5IB3apJ5mTNG78JxnYAc4Vhd50d2SAHpTuIVYKEGMME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5tsK+tZmNc/rgPMoyBQA6w8FdRAyPPIZwLIAtxWIZYd7eSV639gYtaDP5Bvisx6ZgB5zBrVlHuUUEZPKc/IV+2TbHRdqdk3ZLFOH7T8NpQCI6H6kR7PBTiwIjk82jISQpi4Y9e5Li62EtTMpn8IZX4r6b00yKPrBiDgU5AdDBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxjZrwzx; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxjZrwzx"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2402148a91.2
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786025906; x=1786630706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/J94ndUcSa8/fzWrR5UWTi8+iEtkdEMZkZiFQhYOhk=;
        b=MxjZrwzxlHmLanYsF0aYngE7s8TWaYqXdk0zR7qizXUii2a0ohwTDyxMj4J5YkcV+S
         /DewfWdh45uA73hcp/zJEwM5eQSAW+ti7osAABMo8HY8/KJNLMRqCGQYS5CIIFVdB0RS
         vgLY42p+Wjj7LR4a0KDPwEX4Wtc7iu2+Hm74Vb+oL9qAjHSGNql/pBKr3Lfx2Toe1+gv
         Q+JrY5Tj8R69J1HoLjV0RYS16p1QeJPm6fsq2OB7eOKTnqCrkP33VZsuRVDcd///pYYC
         mjPsoGTTIzaOhiRxeArolfdTS+lpCIXUq7fsnsenhYVc7co1Ml3Zf2cYu5ioDQzgeuc0
         zwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786025906; x=1786630706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/J94ndUcSa8/fzWrR5UWTi8+iEtkdEMZkZiFQhYOhk=;
        b=MPfkzUHhpQiKio4GRocU5qjaM0HZYYvjZDqJrq59TRYSQIoMEQ9z3tRtd3SzujtnoE
         h2KuI6wo8aiMt2KGXuGNiUu0IH6F+rDbsT+gDMY+XuUEyVYaNFvNfE/JtSPfMAu6W2mC
         bXyWJ8Z/svuWGXfN4WsHjGVrVsxO2S95B/N1Yafjh3VXNxnh4dih2JwCWuHjujNh/5E4
         P16wxfUqO0HTeGd5LfLfIiIpYfRfmhcdnfvdt1Ecaj72tRcRW4Mb9VDTlS3L3FnAvAJx
         h5kAD7Yz7d7WvczwloRk0E/tc0QpMK+32kDyFbgXHG+vNntsKPSGF1ItghkovcLe5ZrX
         jp7A==
X-Gm-Message-State: AOJu0YzprQM7OXnIotOkikPnfpC4sfBh5W3qfrR935SChYSFeoaBWf3M
	lC01iyZF3Laf1+kxwSOn4Gzy+z2yNRL8dkfDvuHKtpNcpiGvcXO6E70DYytlDqT69x4Aam+y
X-Gm-Gg: AR+sD12+AQwFWcqi0QQ96hGjoWrLee4HMF7mmzmHgrZZGbkZr0X5nvOFO4cBbl0sipn
	ofa+arahXmWlxwpwhPeHZd5HBUWGfUSxm0Jn1+g2SB9Ri/nazbYK9+jBGZASITfkj5iNUdvPSZD
	c60zdCBrJ1+ze0a/7ID6XPG/zGuVhvS9c6ZxiTHEyCK8amuqW8Wcb4FK/VEcHcCIBUbOR0EBSma
	WEXj6gFErPVRdzZjowqNnq2wQBlcxhZUsv4OjfsFZsXtvoaFiNxJSOfgNz7cgDoqjCYUgOf3yyQ
	txExWQDHFK4nFt175Ag684/3PWZa+cRaAbXQpLnAGOpOFJjQjG2InNy7gZdXXDOATNERlpWXWrg
	Dg7aZY2ttPnVjUJmDR+WdnC7OH4fkTxDsx2SwkKqCp76ERniBhMktF+yWuHkUFBAlkLpnT9Lhe4
	d3eyJqdii+PTIGMnuHZGStGvAFj0vvoX0yRAfL5XFQEop/oT7fxCpK
X-Received: by 2002:a17:90b:4b87:b0:38e:7a05:9c0a with SMTP id 98e67ed59e1d1-3903c5c0fedmr13075467a91.18.1786025906278;
        Thu, 06 Aug 2026 07:18:26 -0700 (PDT)
Received: from ankirin ([112.47.201.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f5ab5d3sm2712467a91.2.2026.08.06.07.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:18:25 -0700 (PDT)
From: ankirin <ankirin4@gmail.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	ankirin <ankirin4@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable speaker on Xiaomi Notebook Pro 15 (1d72:1709)
Date: Thu,  6 Aug 2026 22:18:15 +0800
Message-ID: <20260806141815.40527-1-ankirin4@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xiaomi Notebook Pro 15 (subsystem 1d72:1709, Realtek ALC256)
silences its internal speaker on Linux: the codec sets coefficient
register 0x10 to 0x0220 (bit 9 set) on boot and after S3 resume.

This is the same mechanism already supported for the Xiaomi Mi
Laptop Pro 15 (1d72:1905) via ALC256_FIXUP_XIAOMI_PRO15_RESUME,
which clears the stuck coef bit on every codec init. Add the
missing 1d72:1709 SSID entry to the quirk table.

Verified on this board: with bit 9 cleared (coef 0x10 = 0x0020),
the internal speaker outputs normally, including across
suspend/resume.

Signed-off-by: ankirin <ankirin4@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index bd53507..084e814 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8168,6 +8168,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d17, 0x3288, "Haier Boyue G42", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1d72, 0x1709, "Xiaomi Notebook Pro 15", ALC256_FIXUP_XIAOMI_PRO15_RESUME),
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1905, "Xiaomi Mi Laptop Pro 15", ALC256_FIXUP_XIAOMI_PRO15_RESUME),
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
-- 
2.55.0

