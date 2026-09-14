Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D40B3D566D
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391790; cv=none; b=qW83WQZijd20XoUNdfYhNFo7mtiynOiCvU9FHJz94EzhX1WucrA0FAM/XAlS9a4McsWg6015P5Ft0Gh3BBMjI69rzj0+KjHb8GRGQyKUw8d9RF0HcDfyr/oun4Ksg5pV2t8vGyooU4AfbVey6RUi0aCclT2L53qbL/+KUHkBZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391790; c=relaxed/simple;
	bh=NeGXUXRLm7h5fh/tHrwMbiOXfb3fpgcGV2CwhD2kv9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McbdF7+Oaod760VDoDQ7Cja2+bUoGDMMvGOrCoHypukK0tpQi//5Ic/rgZWacESd7GLnEgDT351KONhLM7wReh9NEW3ubELqVRO8PtA3HpxT1l4H9cU3b8Afz5oPrk7wElTE45ab2TS16yMFc0ygqkHCw5wrmNeM/ENjxmquHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXgd+VsL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXgd+VsL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5e907853eso3407926e87.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391786; x=1789996586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeNBUWeOKCT6NHcWHOZPhRDQedkHJaXnecAyw6p7kGQ=;
        b=LXgd+VsL/LOGW3P9aWU7EnGXT7kMIFs0p0tMb30NFYPUEOY/185oYJacvp3AR+icYS
         VlmbRymO47Zo+PXGEEDAWoJql4GBXGjJ3v+D57GAJzcQE87auu/hHZDuqVlWdzHa9AEP
         1V3njdg7QPCqp8H/r9wNIciqvtPHtlAbxGuojY8PNnUNAroVPiu+cErJkCE3LfcTgh0D
         wS6g9B2Ux1gnT66dtiykmn61Ds1QGXCAUiKpyQXpXtwPkYA1uPzuuGY7agMIU1nHQksm
         3hcJSihUP/efiREpuDfWX5gRkB3lOrwVk9nLm66hgzasmPhMOTH6XYK95qQpmTE5xGYE
         +AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391786; x=1789996586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeNBUWeOKCT6NHcWHOZPhRDQedkHJaXnecAyw6p7kGQ=;
        b=iFpKpuTksI/fplOwZiK87bhnkY4jMxOAzFIq/CwU9T7SK9PjgBKgTES9X2v+346jCe
         kDr7QZwf4ccIimK0ABWaBwMDQ082tJaOplvC9gO6aiCq6Ug2ekAqGXHOl01/h+XCnPGx
         soGCM7kwTB9+pGFDc0bKzINUENevChUYmwxk3NE3v+tejAeRe9ffpe2EjHRVHawqvg7b
         Qr7+jarJEZdXxWgxna2zWSmpAsnVs42rTHpbzbhY1bWRIkEndEIL4tXsWr2gKbkMNME4
         HWNllsVc5lkmxWd1NyBCEB79X71J4ctVHqX4KOVrIA9sXQpTlH03IOOIQykznmOcX5Jf
         tkUg==
X-Forwarded-Encrypted: i=1; AKwUvBxXfTZvC7Xla/Dia0ctVOMhBJhZSg1kTa2/UD4+zOF8vQL6qEUdylgrTPY/dF3b3EnWaVMjb0JWOaJKOg==@vger.kernel.org
X-Gm-Message-State: AFuF++lJvNSSu8IAP+2nbwNvZdyRRScaTkSe9MGGShk3ZtAphU+IjDBz
	YESIDzQYPaXyQVp237p7+nc1tt9Sr0xdNY9t3hTTmnnqftkbbSTmMRiG
X-Gm-Gg: AYBFou32QnJelxp2C/P0UUaMaNYaslWYjde08V4y/tcZ0SUK41JbZTRng9i5CbdI0+O
	n6yEplo7TfdOGlljUC9Sq7HhhoZJQcJyEcVsiMmbWqL9xiStRWmYs/35rx2rb9z/vHSnXaWLy2+
	WJfhvYdMsy27FCsO5Rkpq6yyesBTikY8YEoTPb5XWutkg3ZilO4v4ULTuoZjppk7RWs//07iolh
	SAsQv4bDJgt6EHHdAE1Wp+RviI03cRsI5MvYwrpftZie8YQZvxPKHhuCi+HylztIBzLqC3Qlz8y
	o45904y2WpJJP3fnkHD9u+FceDNDhWCE3x/OGq2HkANXywNHLHNGYPCeWN4WB5T7ph1qJBbRbS1
	7Xe741VNGS2jecw5G+ayKvyXBB29lsBqSVP3ROUVO18E1Ryj4oFe+Ah+ByGYqKOdP15+k60txfI
	S00WSaUuMUJknPW4v+Kxm7YI41F31AnSmy6feVNEvtFFZFqfe/nKQQpJijQvWk
X-Received: by 2002:a05:6512:691:b0:5b7:6568:3039 with SMTP id 2adb3069b0e04-5b8ae6a7d32mr755913e87.60.1789391786099;
        Mon, 14 Sep 2026 06:16:26 -0700 (PDT)
Received: from glass ([81.25.57.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04804bfsm2423768e87.84.2026.09.14.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:16:25 -0700 (PDT)
From: Andrey Starostin <ndrstrstn@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Starostin <ndrstrstn@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI entry for Acer Extensa 215-23
Date: Mon, 14 Sep 2026 16:16:10 +0300
Message-ID: <20260914131610.46732-1-ndrstrstn@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Extensa 215-23 has an internal digital microphone connected to
the AMD ACP6x audio coprocessor, but its BIOS does not expose the DMIC
through ACPI (_WOV / AcpDmicConnected). acp6x_probe() therefore falls
back to the DMI quirk table, finds no match and returns -ENODEV, so no
DMIC sound card is created and the internal microphone is unusable.

Add a DMI entry for this model.

Assisted-by: LLM
Signed-off-by: Andrey Starostin <ndrstrstn@gmail.com>
---
Tested on the affected machine, running 7.2.3 with this change built as
an out-of-tree module. Before: writing to the driver's "bind" attribute
for acp_yc_mach.0 fails with -ENODEV and no DMIC card exists. After:
"acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI", a card
"acp6x" with "DMIC capture dmic-hifi-0" appears, and arecord/PipeWire
capture live audio from the internal microphone. Speaker output via the
HDA codec is unaffected.

DMI strings of the machine:
  sys_vendor:      Acer
  product_name:    Extensa 215-23
  product_version: V1.18
  board_vendor:    MDC
  board_name:      HerbagEX_MDU
  bios_version:    V1.18 (06/18/2024)

Per Documentation/process/generated-content.rst: the diagnosis (HDA pin
defaults, acp6x_probe() failure path) and this patch were produced with
the help of an AI coding assistant (Claude); the change was reviewed and
tested by me on the hardware.

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 385fede6d77f..246e18c66272 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -52,6 +52,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire AG14-22P"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 215-23"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.55.0

