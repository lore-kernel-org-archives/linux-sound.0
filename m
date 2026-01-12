Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438135581E
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 20:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250320; cv=none; b=NcYjyo6I3yQATjsyY5hxTVQIc5ewNCv5D/yskMA6eYpH3Qsneg68fUUujPBjk78jQuYnZzsDqiHn6p2DuGGz2NKa9g4gB82ep3Ouoi71eMFIsXaQsi5559bWpD8j4WaWndzfEWVKwunGckrpvy7Z9DthKvp9WIHB9AfhEjYSuyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250320; c=relaxed/simple;
	bh=U/lXMKP0EgvrBsQnDHEmEXC6G0Vt8uzgnEu2xoRPm0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=anUWA70gcApV1knxXD0u3UrvpVzSVS1OMTWQ6Qv+PTsIlQpWkuAKIgJBUDSFgh97B+i/JEJA2YBuL40LvijyIfrhpKjattALoC4HnYN4jH8YW3U0/iaIRDpX1m1fxTcnvbDLAI3qes0F6i2iDRghn7V4m55RkEsdECr6myp9wHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4q007qZ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4q007qZ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b87003e998bso321990066b.1
        for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 12:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250317; x=1768855117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K57o3AMvG4m4QtNGfImWJgInFfsB71qBbmp1KagmM9E=;
        b=c4q007qZq1p0rzh/Nc9DANXyrL+MVMM1Sa6KiIZhTkqUWr6nY2rYc3IWyabGupj5RJ
         IYqdWcs0TqGwVIX7E1NovSBiSJqr4mZe/JzzJXONhfBaOiIgyczfuiSQpAM5V5J69SLd
         ZnijbvsBc7f1FPB+IDBqJe0vpQUWbVireXzMh+bCvbAZixl77p/q5MMbG7hcSIsaHZMe
         jZrCErrKcBo7FLcGvvACN+s7O+3dnYQxJK39EWt/BnVQIMjeyWNP8XESWE8FaTAJG1gF
         pTxgb2R+Q7tYjlPcvoBwNbIPdwyxt+7KZgKQ2ZljTx3KtdzAjnekSWcCGZYaakJ7as0f
         fRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250317; x=1768855117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K57o3AMvG4m4QtNGfImWJgInFfsB71qBbmp1KagmM9E=;
        b=m/NlJRQn/cxWAtLVAUVZKZWxvpSZNcRpxxChbikIslhROJH/OkLkhghmReLZHoegFC
         yuXcwL2zWZ0WOelG37jViz3G0PhwWoNMXmmv5F+AVHNK4QFpEKGn7Mhb+xdhBIaUoszB
         PjTc7V8RL7zooWKzWvAVKFi9VCvo8UF9M33FM4H5EDiSJz5MVpe33aH5mwG0C/VueT4y
         J1FJDi8Qys98iKvQsU/c+IlAfp+95I5fUYL3mMeGzcCT3qWLl1Gj6t8eBJYOfynjo65l
         LysRf1+r5QxAAyQMEYa4SQfAvx/s779vV8pbEfn5KzKc/aNXZ79ypjD7iZPR++ONbWhZ
         5YmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYgZp47I3fQRAiPLHHS/KVCMNFzU3yNS1NDLATFkzomJ64H3X+3ERWiNrRiPIYw0tHinQc8UslMMWRHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywSGlNBsy0eCYfbxwh4OAMRaU3gUxKn7QZkafmcOMCwroGMBdC
	Lz4UPAvrVTp5+gw6evtotII1ydnaoGrTKzs3Bq3ib5UyqSvEaOky/LeO
X-Gm-Gg: AY/fxX7kXh+XPfn/Mm05e7idEr4x7fiVb2NrTjYZ18YZi55BiI21TBNHlPRE80QBPfe
	vZkor4qBVifF8KbnRSen9Gtb7eHN6PT3KWUIpIeMMb46kxJMZUSUbD03/ANSlfpQtl69zYDMd6a
	GTWbMZT7vbuaDGxoIMtFgPNEQKDSFnRaJav89uC7tL9dYXDjh7zM/064b5syE1NB95t3b15dKCK
	gf0BuPGZOWSgoShsGMDstxf3d60DLVZSV1v27oedgbWOOz0A5v3+4KkxujNXbJmAUiTH832FPIf
	LrwAQSjKiddbr4RComKU2oSor2Qg9pwGeRgulzKVWo8ma1A6EYVzSsIzG4XUKbtur/R+XRNkPLr
	tf8YkIpp5oLG1E6hbOIWBa27XeU2yjzYNRW9ZBcLP1dXlBzV3i2DfiCMLDNWKjHhwD1sKU1b1kz
	/f4mk62lplahmDSKk=
X-Received: by 2002:a17:906:9d0d:b0:b86:ede4:2a8f with SMTP id a640c23a62f3a-b87357db8bdmr43959466b.8.1768250316803;
        Mon, 12 Jan 2026 12:38:36 -0800 (PST)
Received: from windows ([2a02:ab88:8d:3780:b515:e940:acae:f11c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4454sm18615296a12.3.2026.01.12.12.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 12:38:36 -0800 (PST)
From: Radhi Bajahaw <bajahawradhi@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	Radhi Bajahaw <bajahawradhi@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Fix microphone on ASUS M6500RE
Date: Mon, 12 Jan 2026 21:38:14 +0100
Message-ID: <20260112203814.155-1-bajahawradhi@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI match for ASUSTeK COMPUTER INC. M6500RE to enable the
internal microphone.

Signed-off-by: Radhi Bajahaw <bajahawradhi@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index bf4d9d336..0294177ac 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -416,6 +416,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RE"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.52.0.windows.1

