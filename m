Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23137385524
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761398; cv=none; b=EXP6TendiQZ1/HrTBAF3i1Wsel9G29UUeKJ5JMSvyjmTuGAENlfhexAPvfQhI4rjW6Gt6DVyql3zpYdnTWQE51MJyIvgVQQpmGD9m5NS81VQl90Gu3T4U4bGxjg4T9O+TfZpsgJ70Teyo+Mib/S/Wm8t9TO3jI8bZJNBZgFwMtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761398; c=relaxed/simple;
	bh=ilTd8G6rGzWSYiPXW0gzw/K+PrTHWdJYsdsOd+dPDUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDIAYNjKoORc4m6b/DMDqkB62F6NUQ9C9Xd9YpcIR49P4CBD047EtnwtsZ31yFtOfbIARRsl5Gtv6HcqPhEaKmVYPQxkT/G1oD/bPIUgs+pvXmdrFkmFeeONRNmqxIcJw+vfM6jhmw/oadhqTxPeWmIJOq9JJz8HoTOh5N/CoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGyex/uU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGyex/uU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48374014a77so50946245e9.3
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 01:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776761394; x=1777366194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6n++iIdotMt6CGRY5H4br6XbDJigW7PJuq4uyuIolAg=;
        b=EGyex/uUeAITQJUif3DYxYdLL0Gs8QZVjc3MlML6wHCcsZ7MzTESRyFRNi5r+LbzkJ
         r5bFGYScuHL2bC0cfphqVtcFQw1rgkUo++uAxNNxXue7/xQb9G0HQY6YO8D7Gztw8Al9
         DxLeHiu8KM6hVHPg/8ubRBCjT3WcepRQq46ojNmL57GYFagjRwGQnP1p1XNIRnOjpHnu
         DJKhZr0XA4F6lD2uEQAxXIHVP1gEN3G3NQn1calC7WKy9X93V4Y31CwTALescYiWjWiV
         N2Ujyw21RSCrEaT3pdO9C3UuXtiyWg49xvWqzdxHqVN2cKs1v5BXoOTX/SG4iBWHduBp
         YOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761394; x=1777366194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n++iIdotMt6CGRY5H4br6XbDJigW7PJuq4uyuIolAg=;
        b=eUFe0SOndzuKFVQRdJa0eHuilaUujqutSBQVDzMaLnSw6BJFeiAoZozzQXS7IBH6AE
         n0gk1sr/xdJmJ3mkfifK/uVmCGFxuqhz5sOXuH6Iwwz5qsyoPaP1NTYOLAW1wDIk7BfM
         H/yy3D7xiaCJVTnSxdHDHG4nnW+qAOjn6d9tyfUbhhE2gYFLQACXQ7o0txqvignfZmPF
         Bxjc0p9OxF7wwggnQ6XD8Jp3lD18b5dDi9zZ8DRENMaBxBNIl14r4BoMzdCL3RzLwQg9
         I8G9n8XQd2ZrGKQr7Q+JDx54oh040wP1GDidc593ssvs40LA9/bNJ8TkpS6dX1eCyUcA
         CTXw==
X-Forwarded-Encrypted: i=1; AFNElJ83VcuNNy2YJrl796lGMN5QAq3Ov5FgFGANhcrLkLEaW0CLiuPemyOVpeMIWcrFomhfqyoq9Gjv/01X0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIS7IKqKpYJSmeFRqd3G1NVy1qyBeRjgm/ghxfE78ol0V3aZIY
	kXnEfJOFdK9yTupGrP71IN0luPgLJDI/GaBDBrMTUk1CrSLN3vde2Sqm
X-Gm-Gg: AeBDieurIPczKNsS5TWgBVfqylyFW5eYTPwrkgioLTyEmyXhxGDoZutdVwo1wGLyQtJ
	RPsHPDT/wXWmu21CdFwxIHdxrWymoSbC+vym2ePiNdjmTyq4CEuQVWc/nZbf/R8y6y5tl2wMpnM
	X3rTMPh1O6x0i+fY+eDMAoYLNWBzP7YMIxOdtM5ywSibE1nYSzKgC8k6h1oFG5SfGLOD2pF9fvI
	vVi7ZbhWe2rW9dDySQG+8y429gxwTs50oV3N3gMmPsYYHimqV9u4gBnXL3smYk3nbvixUwcdNEk
	F+pK0Zek5MqefrPjHEx+QlpsSU/U8F/ycHYuU+TEwb97hRCGPPXPmnpXBUC+vVwk0pk46mWf95M
	jxLrXKuWxkjY92gp3BtOdcHSYImAxa6LuAe9950Z7n7v93IwLdSwcKr4+tUae0APw7gqtTh9lyG
	S3Z2IBi0HJvN6c1H+Cdzqz7WZ1xuwpg3bPawpSLwOwI5nxArIY9OARtIRIbJV3XRMVo7kJQpPtI
	5HVpV8DCtPdqZWcPZDXKRPs
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488fb771613mr189503025e9.18.1776761394058;
        Tue, 21 Apr 2026 01:49:54 -0700 (PDT)
Received: from Friday (dsl-197-245-177-193.voxdsl.co.za. [197.245.177.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c68asm110715915e9.3.2026.04.21.01.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:49:53 -0700 (PDT)
From: Spencer Payton <spayton681@gmail.com>
To: alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Spencer Payton <spayton681@gmail.com>
Subject: [PATCH] ALSA: hda/realtek - Add mute LED support for HP Victus 15-fa2xxx
Date: Tue, 21 Apr 2026 10:49:18 +0200
Message-ID: <20260421084918.14685-1-spayton681@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute LED on this laptop uses ALC245 but requires a quirk to work.
This patch enables the existing ALC245_FIXUP_HP_MUTE_LED_COEFBIT
quirk for the device.

Tested my Victus 15-fa2xxx (PCI SSID 103c:8dcd).
The LED behaviour works as intended.

Cc: stable@vger.kernel.org
Signed-off-by: Spencer Payton <spayton681@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4b6266536..98f218844 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7154,6 +7154,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8d90, "HP EliteBook 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d91, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dcd, "HP Victus 15-fa2xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8d9b, "HP 17 Turbine OmniBook 7 UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8d9c, "HP 17 Turbine OmniBook 7 DIS", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8d9d, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.53.0

