Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384A63FE36C
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479048; cv=none; b=QZlmBzXGBOa6z9FkXeJWS7+zmQRsfzQkaTpbG1F3+hg5LZJDVinSYf44wgqf7Rq+U81eQvd1Xj6aifU/v9wjNVUy/8WJqpwhgmNHp1GJoZfRkISzAmMLcd+O26tuwKdaKhALAg7PJipGCsa+n7+2qZZfsF9nenoPF/pXXpatgA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479048; c=relaxed/simple;
	bh=DytySb4ZvigQDwLMhmo/xI438Ra2nb2hFZ+vtkYS4bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TH2SuUDPZCA9hCYXMogs/4vYWKPEhq5SvFnwSGNxPf6aNS/6kAj7MioEpEYk9t3r707hIrY7FYiu2CpZ7KctPC0ACt2sGzc4+/7lXMgaDUw7pBxfhpQ7znJcQn0kgdB8nuPQmEwhkQ6KXLqBm8rDz+hxIc/vabqTZzuMPeQo/q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRtPb0iw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRtPb0iw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso99368365e9.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777479036; x=1778083836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YR+77RgoEJ0AmITQg6v+6hZLh8ZTCmvX7iqaggTxjks=;
        b=PRtPb0iwjA+Jc+6fL9H4GViYLyG5XvoWymFnQzLZgLjVNt/ejRxNB9iHLyrENapH+j
         2N/uFPeuD64FAPM8xYFbfYH46LlWS6Mk3up8pAgyxNtvWZmLwZx7KH2oUfFYyrs1tvdI
         GoVoOfKe/tgxAnKtlIM4ZR1h/i67FKtW6BtukBetnrvhLT6Z6vVODUGTFcZqnUjCkAA8
         p5IStWanxOd7SUIt75+QUAXVGwtlN6UPDrSSkDFDiwUHt0SfPolGjMxPqvMW5lRt78k3
         mT+tqs1YqA0Lj2pbZZ2DeTw6ZZRm61Z5TI544AfobZr+hDnwL++n9QzdUeUeENJQP7DW
         eTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479036; x=1778083836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YR+77RgoEJ0AmITQg6v+6hZLh8ZTCmvX7iqaggTxjks=;
        b=ZUo+B/Nj36y24Zh6pel3GpmqOTyCGh/hQdSnflKcv4G0kYI/raaIHG+vwnQBUjUpq6
         bfEJSPyx8OcjuZJJhhl8CS/bsk+EDKderWdozMIHLobJRBTe6EDLXJJCgJRqj14altjE
         JsClF0FkM4tzjVTrYuRG592NygO0tKh5RN49EgsTXgisgTnDW6GYpmdRDZVWujZqKzfn
         m0SnDKDucSDACmVERGS70+K6QC0Yp2yhIzYNlqRhoDMzqvLDrMAWnLHGtRcQ7WpMdXK0
         FRsEUcJBjUcB9bVIQbusup/qJ/ytKOqaEkEYvd96VCRhaJ8wiIMf61pviMkT4ZGzdrzJ
         cI3w==
X-Gm-Message-State: AOJu0YzqQbrkEhDszgaLm6QA1ko3JyvjjU3Jg1lEHUzcSnxPfP5YQhCa
	9QzSOAc3OlqRukr6C0ozVvUvQ0T1iDhPrnIbTYOboxb03DJ7P9A9f4JCoJkloa/27rg=
X-Gm-Gg: AeBDietznguREr2erPpV088ageJWX2tpMwRWvTSO5zp4bTng+fdfxNApJiaQ8gOLXJF
	Mhn1+NDGQtfc2Y6A3CDyIASlbyfVdVG9+9/g9uApkfWfi3lrST2Ri0KhrCj6tdNEtQwJNCsTBxD
	GA46Wro8uiGN/TArr7x0q2CpnwuIwvhbXuCHNILcoUDBcpi3lA6FVGope9DOcIRGUMm9AmRFaFm
	x5/kgzxv5Owp0GFIE1CeOevoCoUmvhF/zom4XwlgMPHOLrPQ+evyZ5X0iqYFyfrtp9xDB1Mj7Ac
	ptVV0P5VHnu4pR/0VUQjgsiSlotK4FQe3WydrnuMhsxEFkxoFf1mrRILXkrfzxLhb0E8M0WIECu
	6UWYdRPN8fyQGiuKEEYZORv1OFsdEW7cSbE+K+FjtHkUGtiGh5LP+6Cr9tCt5Yv+JW8f4MAmmhP
	jzustwr8XGJaeAgnaay7emnPWuDzsnYrqr08IitVsUhedUwsAvjawX
X-Received: by 2002:a05:600c:530f:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a77b298b3mr125207095e9.26.1777479035979;
        Wed, 29 Apr 2026 09:10:35 -0700 (PDT)
Received: from poldo.fritz.box ([151.71.61.80])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a7c2f2eb8sm36761295e9.6.2026.04.29.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:10:35 -0700 (PDT)
From: Tommaso Soncin <soncintommaso@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Tommaso Soncin <soncintommaso@gmail.com>,
	stable@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add HP OMEN Gaming Laptop 16-ap0xxx product line in quirk table
Date: Wed, 29 Apr 2026 18:08:57 +0200
Message-ID: <20260429160858.538986-1-soncintommaso@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk for the HP OMEN Gaming Laptop 16-ap0xxx line fixing the
issue where the internal microphone was not detected.

Cc: stable@vger.kernel.org
Signed-off-by: Tommaso Soncin <soncintommaso@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index c5cf45881416..a2d744b75f52 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -59,6 +59,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15-fc0xxx"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN Gaming Laptop 16-ap0xxx"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
@@ -668,6 +675,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8EE4"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8E35"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.54.0

