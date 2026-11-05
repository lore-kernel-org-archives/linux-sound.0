Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891989;
	b=RD5ys3WMEqp2N6ok4C93ZFI0fRYWtZRzsjouwVryHbdxQlCHsEOedo4ih41fZpIewZ6b
	 ccKX2mL7WHRSFtgGweFwTRt8ZilsoeXClTYVsjx1utA3/aU8s/Z2vwxMEXJDXemiA0SaF
	 Bd4mwv5NOgA+ygLhWHqhSqR9YtBcNCjmM4jd8dvKKboHGFhGAiJl/8S50SKLBWwfZePzK
	 Szpc0uV/4Wj2roDGCAAl7qBElqx1DiH+LCJf6b/MGCnEdPDORGrGTn/a6r2ULsIS+zm30
	 qXF+oMc0+b9G829Z5eissmR0nZDUWBhWzAK2zl4K3srGBY/gK1oiXPVJyGIOXNl7gJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iqKgCijpj9ab+BkBIEugALnlDmONm52bKTuzp4FLzzU=;
	b=40vOZcDBlcYF16zA9BxjulaZDE826zP+pwczw15Vrv/YiN86RrxJdUoKs5Y+812Ibpls
	 kUZmiiOQP2A9Bk8uVE6tjeZg/XaPwWgZdfaiqVGbuY6nfGXog8MFOSGDtDQWqi8TgaxcF
	 Nu3/PPPubOEGH/lGLtpnhdRs4jY+v4cqCkYFSAyOyfKl0ctgWLTt5spFPxz4Z02G0dsC5
	 AEK7Kpvu44ls+w2Hcb4dBOiGdxNGQr2jZ2Y7OGkhQ1z2o+iLQlO4gV0lc/lEScYCgaQaP
	 tea7FtOM2r3ZE82m1YF3ArDBL2hWHN36kCoxB9/OQAD/06tzMnV3tFF18ZUzJur/tMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ms4pqF23;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23746082BDF
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 15:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23746082BDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ms4pqF23
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so16215395e9.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 07:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891987; x=1794496787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iqKgCijpj9ab+BkBIEugALnlDmONm52bKTuzp4FLzzU=;
        b=ms4pqF233nqWrjgmJEtwt+z25wy1UCKh9vFFfYLj/Si/kmHESiFTsNoOFZVmPsmEtD
         F6L08K1a542ic++SLs/FeFcUKBoPCOczUrHqV/Gi2fa84dob9nCqyVm2OsZgmZncQs2U
         VUawwXtqSdfVGnhpvLvWzEwOyDl1N6i2cMLZWqyZwCFhqzjhAi3PFMYEpzjLYFu4nCEB
         HntE4C/ZsQGlfZ36PxfGMXWOq3XmFfrCliIHhEr/PpazuyDZ/3uTcRHsQwbbMmbMEY2i
         /H4DoBREF35VxDIsMjQ2Eyn037A1olR6IFo4UlZKQrnDdhfBAz2O8lCadvPOswNi+K5p
         bRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891987; x=1794496787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqKgCijpj9ab+BkBIEugALnlDmONm52bKTuzp4FLzzU=;
        b=h5PZbUE7BB3IJm/SeDACrbfgNpuYFsrysWuDAws/hmff2u7UnWtI0J/z/2kne4Dsjo
         RGsuv/SUAnlPZCJlL/apASS7/xtwecatBZoO9u85Tei8bCsU2qzq0rnmS0uaNN169E5s
         JVkxl96Q0OWd+l5drWuvjk8q8UhWns5pdjUpz6qqg5M+eOqon2v3ixRytlTq15awt8FI
         6X5GBnbJknfsmlktsk4dY6r0Y4fn9kLpgbsAYo+o8piI4rOeik+UqDlC4riehG0vYIyp
         m62Dc+DBA5dcY7YR1dbAf+yCRNHqHA0lD0KdJyVZobiXFdlY+GDy2f36U1S+ISjeMQVt
         dvPw==
X-Forwarded-Encrypted: i=1; AKwUvBwzAJA/Yx5wiuEQx6k9SO9xlXG0RFDhVxfGNKo+T/7q6o1sFoWgmooTBpKLn196B21iC+fxGiapg8VzMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8436V5sotmvs9CmM6sNM3yJkx32pbhUfCwn/B65B6AE/j7Z51A
	O8RFCHJ9SGRiH4SdIXTMbL8vEN3VWDFNjpZBvx2AvCv0HpqedvsitCzo
X-Gm-Gg: AYBFou3qpTySA+OaWR/x1oLJytVvtUVnP3RGM6J6DNUCboH9ATzVq9hUeb1P6lz5aBa
	9TcvDO5gS1wLonydlmfeHhpIA+5NwOoYnOekEkAFci2TlAjXORaCC0Wf6bbuWGqbBSFAmPBnxcx
	uhyjRax+y1dDP7wqOEkakTBBheEDz6VPxfvHJLIQ/A808J8JBKQ4ydFQ5rCGGabDjP+TnF3rqHA
	c9TwZhC6cO3thHCtFXd2+wEDJkHb1EPkc4QdWOBuNlquF3BxUqKQtBxyhAQP/76zHzDDUSmJDcb
	J9Wy+uTJTjewFaXcKFOwMWInGZnho5FQeZml8NBU+WNGmoWYo+nfuUK25zq3v/OIgJANNCvGcNG
	qzabZZTs7DKVEgKNMMcId8LW7okqQJkDe1dA/dnjrVkbmAjdDb/QrfJ6SP/QLMrs31X0bjSr3P/
	sjuMqB5xsBokBvIJJHga3irDEhlyZu7XQ4tVpH+LOgTLTvwJCEAkxqWA+XTsp0jVK0zOBPmew2j
	orlo2f4DJXBPalyA85fgwX29Yv9+hLaV6ZjOJ+TDCdVFoA1/5wftCQF8NDUA8RSp5wqRtXgCwHz
	t0lntpb+mlOj9yBgOBHUI2LoLW9P
X-Received: by 2002:a05:600c:4ece:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4ac185bca52mr419437475e9.12.1793891986984;
        Thu, 05 Nov 2026 07:19:46 -0800 (PST)
Received: from slavik-laptop.. ([2a12:26c0:3205:5301::1baa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180eaesm12372226f8f.2.2026.11.05.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:19:46 -0800 (PST)
From: Viacheslav-Illia Detsyk <detsykvyacheslav@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for Acer Nitro AN16-41
Date: Thu,  5 Nov 2026 15:18:37 +0000
Message-ID: <20261105151839.13524-1-detsykvyacheslav@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The built-in digital microphone on the Acer Nitro AN16-41 does not work
with the stock driver on the tested system. Adding a DMI override enables
the ACP6x microphone card and allows recording.

Add the board vendor and product name to yc_acp_quirk_table so the existing
ACP6x driver can register the microphone card on this model.

Signed-off-by: Viacheslav-Illia Detsyk <detsykvyacheslav@gmail.com>
---
Tested on Acer Nitro AN16-41 using upstream machine-driver sources built
against Ubuntu 7.0.0-38-generic headers, retaining Ubuntu PCI/DMA drivers.
Without the entry, the card is absent; with it, the card registers and a
ten-second PipeWire recording captures clear speech, verified by listening.
Native x86-32 driver objects and minimal x86-64 vmlinux/modules also built
with W=1 without compiler warnings or errors.

With the installed Ubuntu driver and the same quirk, recording passed after
suspend/resume, and the microphone also worked after shutdown/startup.
A full upstream kernel was not booted; boot and suspend/resume were not
tested with the newly built module.

AI assistance: Codex helped prepare the patch and message and validate the
results. I performed the hardware tests and listening review.

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4908f4cc1..c1fdda668 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -416,6 +416,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-41"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN16-41"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

base-commit: 68e9934bd17af558b62cac8a444de28d4d5cdb9f
-- 
2.43.0

