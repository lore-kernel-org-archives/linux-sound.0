Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A42E7199
	for <linux-sound@vger.kernel.org>; Sat, 21 Feb 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771674500; cv=none; b=BOof9ZeczO0fN1pIMsqTb0QwxfQ5Q044BLuMHnxPVQv7OXOch1nLGvt3Rd+pFTbhzxJP7jfudsLwAeawoAwnEX0O0xIqmH8htlvRm/j3TEoRlNQH353z/LfYVNigPtaO6zvxGP6Tb85bf67bMowJuSgrSCJouJ6XDvfG5VR/LGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771674500; c=relaxed/simple;
	bh=8ZJl7CqQ8CUNGshJzoW8XXKIK+SHktKCo135AmA+3Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJ9vpPFpJdN8DUgIsX0BXhRAjrPhuRdsOheXKvO9J9bW9ot0uROxVGxaJobaJ4u0B7ShNw4wweGs0m1rOIOk+1ljmy7b6+4Ucf5kT7Tcu7lVLankqDawENkcaVJ2sC9D7lYK9gII8kukR+6edy/vaDdwkS7XB9ZTTNuGO2npG/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EusVzODx; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EusVzODx"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-436263e31abso2658499f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 21 Feb 2026 03:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771674497; x=1772279297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWh9yuRiyy53CShbVm3p3foVmXNXY4LMW069b7w17ak=;
        b=EusVzODxsAScPETZUoYZyNG+Zjy647pZDIHl6/AxkZSP92QuEcDX89cLSaAt+k6GIH
         SZ6hSKxQyTcaYTH5OUgSZSf9c/KRj1lV2u4I11o0AAnQDIbh99AkRRR02BNdDafP7TQg
         eusv6JHKIIHL+pRQtGUQSbkRAtUJAQRTjecUPTPQIyQXNic0h8NX0My30XgyATdvB0MN
         U1HkuQakfmiqBc52Dzx6jbA2olpf51klv7dzrfPsCfOGzIWe4s/5InoHMZ6Pd+UL77kB
         u0nvVh6QhG4gawQem7hh5ep+2EmMxfaDpxCwGV9leekAE63i+PZ4H6hKZ0REgiF8ISih
         GFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771674497; x=1772279297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xWh9yuRiyy53CShbVm3p3foVmXNXY4LMW069b7w17ak=;
        b=sEZycFymyYfJLqXAeyHjiajsAM17B4xPjIyop1KPjiij3gxAavu2z6YigWaxyswcES
         EQ8qOMUYnSRSAoC2zonQrN3BxNQwqLkmAheMXcxS7PxwtksbU5Um0OnK71PxE5lPQ/a5
         vUWf6IJnZRmr4Royt6GVJVVUgU7dXM+p7C7uG4ca2xpi0GKnIaLkgmpx0O/vrOrFD4vL
         tf9Ivl+yPfEpQneT6z15SxnVNqQWm5dSiKT73h+bRcWTLOTFwnv9Lb/1PtGEDQu5Jse8
         kgaOJ2Ts4tY/ijG8TxtJK6hq7blXStYbc5e8hRg+Z77OW1Xo9bVxcIz/Ib0d52X/TSM4
         DPRA==
X-Forwarded-Encrypted: i=1; AJvYcCUowhd5Ce9F86QpKq+lFNY4m+euwaAkDO/TiVpFo/PdCs3MKpoXsnztLWUPo5wTmsqnOVzKdCO6Mr8Wbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+TB7zHLL3rQpafpPY8yYa7KbtPTfMiDS+rjnrwxe6g9r0d5p
	0xiYsA9kyoQ/ObH/d8vS20IB74P7faWU4pRW0/5auUwQx7F6+2n+oJNh
X-Gm-Gg: AZuq6aJQtRhqpXmReEbWmy1YUhhEkk2iGFCL+bn++OBRFOV3eVbn1wq5oFhI+jNQXPI
	0LpdSv3DC9XtKlAYfI0g0bkdPg57xcVYX1XW2BECm+0ME8PBp2Tiqf2hphtqYHtNi7kN/AWXGva
	AotDuWLncrqAGFkcpcyBflS4i9xHx9DyFQ/2l+1kovuuS7gvUcusm9mY7a38thnX1B3tiVsAJwJ
	KzqeTG3c7WnphFt/IsqIKjxEuNh0J7GTJNQvqHvFU2j+U/+dWALg2v44NOUdvKRyss0PIwJSWKG
	KjdXLB97Hsi+L34r2ouOmHTQDhFo4Wx2k7EVE+2V8eoYM+tAIakqm1qms9hD8IogYYjukTRU6wd
	wINV5aNo/rkUigm6K/ah2TQ5jMwZU7p5kJVq9jjiMA16PaeoEDE4RTTJmLSrlG8m+51XjF8YSvs
	NuIkVvwii2oyccgu6Ihkks0zqgIJYRUM+NB+8BxKRWIM8onIFf9TNa
X-Received: by 2002:a05:6000:248a:b0:437:95d4:fcb3 with SMTP id ffacd0b85a97d-4396f17ccc5mr5367341f8f.36.1771674497043;
        Sat, 21 Feb 2026 03:48:17 -0800 (PST)
Received: from arch ([2a00:102a:500c:d439:b6c8:546e:825e:4eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff27sm5386422f8f.22.2026.02.21.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 03:48:16 -0800 (PST)
From: Azamat Almazbek uulu <almazbek1608@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	almazbek1608@gmail.com
Subject: [PATCH v2] ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table
Date: Sat, 21 Feb 2026 12:48:13 +0100
Message-ID: <20260221114813.5610-1-almazbek1608@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217121219.79960-1-almazbek1608@gmail.com>
References: <20260217121219.79960-1-almazbek1608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ExpertBook BM1503CDA (Ryzen 5 7535U, Barcelo-R) has an
internal DMIC connected through the AMD ACP (Audio CoProcessor)
but is missing from the DMI quirk table, so the acp6x machine
driver probe returns -ENODEV and no DMIC capture device is created.

Add the DMI entry so the internal microphone works out of the box.

Signed-off-by: Azamat Almazbek uulu <almazbek1608@gmail.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index f1a63475..7af4daeb 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -703,6 +703,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 				DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6501RR_M6501RR"),
 			}
 		},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ASUS EXPERTBOOK BM1503CDA"),
+		}
+	},
 	{}
 };
 
-- 
2.53.0

