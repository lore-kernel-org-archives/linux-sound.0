Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C543B2BB
	for <linux-sound@vger.kernel.org>; Sun, 20 Oct 2024 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729420093; cv=none; b=rCWjWSf5M2yX2bMiW5LyIlndG0GWrcpm4P6w5yx+/vdWLRVogBWBBJ1W6ao78SWLXuShwB0oI+UMN4uB4PuVlsF2EtZoEwrkemi/EDWiyMgJGIazqhiZXClQ6SJ2ODktHKz+SaeJ1cruNqDQnO/BubViVmm2Y8ddFhJL+1r5A40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729420093; c=relaxed/simple;
	bh=vg0hb0pHe/a/rfG+Gu6+2ZMtmU72ioPlO3reRK+CQoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OaHeKn7I5BKzmoXpdHy386l8or1PH1QnzEgEs678GqXx7n+W1koTiin3E7N0hN5Y7dcgPRS0cdHVlPobL8AwQziV2hk1D51ZiCvTiYQRoaSmzViI1Zr4w4fKkwqMILuILS8pcdGBXv8Ct4paTabtdObm11RVL1gG9zX37dWqlec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKr9t2dG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKr9t2dG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314a26002bso38323165e9.0
        for <linux-sound@vger.kernel.org>; Sun, 20 Oct 2024 03:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729420090; x=1730024890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ddEwkRO4Do5CV2VLgVcigeiKwo3XZr7SxXFG8I1TnQ=;
        b=MKr9t2dGks3DTTNE0GdEcQsKulu8SwMZu49t59YyAHOT1//xpiSS0uM+92OY3LjyWZ
         4fj9qkb+v+5cjZQHMepRKzmaGrY9QpUim8/fcHvnkU01JjoHzPhapdRCMSniFoWPNkjX
         JgKbynkvAhLcGjk4nZ2ba4F5sHjyg3D11276GpXQqzqkbU5ZAUX1DsfHZPXAy/d+v+OQ
         rjlRNweUyo3mzm36eoXb803cXrsmwRWBddYHmAfccXwtcGvY8SE0P/PMk7QiEjRuLCEc
         x8mPTst8EXUaw6hnuedM+NKPZHK6to/Gij0fS7tg5+O/Vt9kx/Kp6BZER/Q7OO4AbGN0
         MnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729420090; x=1730024890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ddEwkRO4Do5CV2VLgVcigeiKwo3XZr7SxXFG8I1TnQ=;
        b=AAEO17qhzuPVJl0/lR2fazFnrXx7N93AwI3mELDsFU9fS/TryzJ6F0B3JQm/Z9Bidl
         LR05zjKS0uN+whDqh+sg12sJRhPcusCBxFYDKAEA9xe394AqgkHaIodUaZiNLT93r+oK
         ud5MjUoJfa7Qrd4e4YOJPl+eAgDEDqrIssZ5WEc3LbL4aOAOw/8QIQJZK0kZ+GieIaxa
         AK+vYiz+8DnFdPfrwHKhCfeCYtdCCdCBNFs/Z/DN1dnX2hbNF3nviAQTtGsEDb2tcyd+
         I3OvJa3TigsfiEw1Ydw6XTZAzYAyVQcKK7dJZOUmH0fallQ4WomlE2GpuclAdZoqD9Dx
         C8iw==
X-Forwarded-Encrypted: i=1; AJvYcCWqQo8Sou5vmyetHdNffgtjhnByvNOAguS2N6uafJxDTJWWstX9Mib0jU8SSEqEomD8KHdrqHqO3v3m2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn9hGNO6Sh1akF/vBkqXINGj1HJtDxp2uzG4b2eAXtHR3uNZKl
	4o+rbbpRUiMaP1nPkKrDeOb7noaNjceqfBz4xhwvDc2o1GGE61vZ
X-Google-Smtp-Source: AGHT+IF3Zpl4JxMhYw35ZApQZ5TaaPX0Avo/1ero5ijgDTPfza9yYGYxQtZPDbpOSAnaOKAlKmegLA==
X-Received: by 2002:a05:600c:35ce:b0:42c:b1ee:4b04 with SMTP id 5b1f17b1804b1-431616974efmr61081405e9.28.1729420089618;
        Sun, 20 Oct 2024 03:28:09 -0700 (PDT)
Received: from aquecedor-3-0.lan ([2001:818:e81c:ce00:dd42:5aef:97f6:aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc183sm19779075e9.40.2024.10.20.03.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 03:28:07 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Relvas?= <josemonsantorelvas@gmail.com>
To: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Cc: =?UTF-8?q?Jos=C3=A9=20Relvas?= <josemonsantorelvas@gmail.com>
Subject: [PATCH V2] ALSA: hda/realtek: Add subwoofer quirk for Acer Predator G9-593
Date: Sun, 20 Oct 2024 11:27:56 +0100
Message-ID: <20241020102756.225258-1-josemonsantorelvas@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Acer Predator G9-593 has a 2+1 speaker system which isn't probed correctly.
This patch adds a quirk with the proper pin connections.

Note that I do not own this laptop, so I cannot guarantee that this fixes the issue.
Testing was done by other users here:
https://discussion.fedoraproject.org/t/-/118482

This model appears to have two different dev IDs...

- 0x1177 (as seen on the forum link above)
- 0x1178 (as seen on https://linux-hardware.org/?probe=127df9999f)

I don't think the audio system was changed between model revisions, so the patch
applies for both IDs.

Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f787ff4182d4..be1954c38f51 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7607,6 +7607,7 @@ enum {
 	ALC286_FIXUP_ACER_AIO_HEADSET_MIC,
 	ALC256_FIXUP_ASUS_HEADSET_MIC,
 	ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
+	ALC255_FIXUP_PREDATOR_SUBWOOFER,
 	ALC299_FIXUP_PREDATOR_SPK,
 	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
 	ALC289_FIXUP_DELL_SPK1,
@@ -9020,6 +9021,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
 	},
+	[ALC255_FIXUP_PREDATOR_SUBWOOFER] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x17, 0x90170151 }, /* use as internal speaker (LFE) */
+			{ 0x1b, 0x90170152 } /* use as internal speaker (back) */
+		}
+	},
 	[ALC299_FIXUP_PREDATOR_SPK] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -10103,6 +10111,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1166, "Acer Veriton N4640G", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x1025, 0x1167, "Acer Veriton N6640G", ALC269_FIXUP_LIFEBOOK),
+	SND_PCI_QUIRK(0x1025, 0x1177, "Acer Predator G9-593", ALC255_FIXUP_PREDATOR_SUBWOOFER),
+	SND_PCI_QUIRK(0x1025, 0x1178, "Acer Predator G9-593", ALC255_FIXUP_PREDATOR_SUBWOOFER),
 	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_FIXUP_PREDATOR_SPK),
 	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE),
--
2.47.0

