Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2E2EA159
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330382; cv=none; b=jscEnBtd+14WfO2DLJ7kOdnHvP2GUNYo9evcLEJvZFp3TniTrksRKm67D6GMwDW0gs0fS9HY6WlteBqbWgoAmagJjZYodpq7QsP0dI+IF2bmG+Ir+IHRld+IumcE2mHZ21dbjBnA1tjI4xWwgQRmOiAKdl7kKcGx9wz8F7PIEnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330382; c=relaxed/simple;
	bh=/xNJZ7kppqg1LK4R0Nwaz6hbibx4ZITyLeJPP41q2AI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bHUgJ+C/BASzb7bk+H5/90WAvkmlpBFUr4fShvcP1uvo5TdP6sQ9BfQEghvo1gNuTTGaRCqvgeqpAl3YQA3va2hfO9hC5Ysdit0JNteCCYm6z1Lrj7OpXyZr/XIWSa3xg2YOHtftNeLbVw7UzzGLwGfEq7HTEdqGod6IjsT1J/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDQy92FX; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDQy92FX"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4837584120eso27304765e9.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 04:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771330379; x=1771935179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/NfKUWEPnbl+HfWNMu5nFQW9oH84ZgRoSY1M34rzUY=;
        b=eDQy92FXEvNLYYnMa1hOpwUzphz69nxtrrGoEKdqPokBkeAKWMFNOlrZUdTf2xtiWP
         8jJC6rprwom8g6UNmy+pM8vcUPXq/07fS+LWTd1Mueyl16gWGqNoig6njcteLW6grn7S
         Wes+ZZNtx5TXim9WVZPjU3qFjU9a5fczMOR0SZntdWnVnhYAgo8F7l6p9Pnx6c0XYIve
         6KKNY8VvzktTdSyBOAr622u5GkXlYO7zqDipdcpNlRFyz/is2OmPKYC/+qEdSnrNQ1Gc
         jjCekWxeIEYvOrq+gqJnEPH62f1eFjze4E8cYRm49DGjCvA6Hb19J6/TOZKbitLRNnV6
         yZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330379; x=1771935179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/NfKUWEPnbl+HfWNMu5nFQW9oH84ZgRoSY1M34rzUY=;
        b=OOkiBQTIwhct71uNvYPp+FySWkO518u8piS5hZoiuGhSdnuPHY7z+zzfzNNekzRMKs
         9SBsUnmaxOxaJv2lxcdy+xFOuUAuYs2dGSORRdH3dFZ9IDXc7l04DBAFo5TgeL40kYB5
         +acxGRlYOOs9K1/cArHKN9OxCS+lySW6zAHuOYW4c/SPmJ53Uv32u9NhXN4tpJfL45cH
         MmDAqebI6GPg/O7767/0U3Tq6inkapY9qwZMkp83FrD7JWzigNHIXCQE3xttCuhQj2a8
         N4ZxinZNNkVeGdyV6Qy11qr0EJMiCMTwDBG6/QZVknnhSIIQsqrIS/jc7qDnLJ8QOEOu
         RWuw==
X-Forwarded-Encrypted: i=1; AJvYcCWjslCny2cY/LuS8RjV7Qf6V38joAyX0K7zrSKIOKbeT6fbiiOalgt3jdz0HHykRp6LmHJ1Q8dMJ7u2gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6RA61R/znIvrCqmCE5JMEFfmXGuBYbZjjQ7Y0jwk/GEUP+X4
	3EPAPeQ0VgkTsF+E0gclyX6i0A9nGVs0OXBr6yeuoY3x2Esr2tRYIaz+6Igif1uli2I=
X-Gm-Gg: AZuq6aJySKE3o5WOeLEUIorR4FIQQsQDMjhzQgsOWXw+gwqXNcJnLqp3GdtCfCdnu2Q
	ZoFl2QCf00LuRcbiZlRr/oxwhZXfehds5ICmY7oXdE+ReAMYevqfdx6RMwOtNtiD+mtdZgJxFHx
	M/j/tOs4UiaeTH/OWZy0G509yGYlsmNDIv1xrLuZiTMexvM9zBT17gdAOTea1bOAIx1zRh+0pO6
	mhTQAS6UCJN0OsiQzyakdkbNu0jUTX9beQrmOdqU8TxC115QsPdu57+qe3WfpOUuRO3uLtkKOKO
	CfcW2sFEIdH7dh9q4ws9rOip50YOP1vWaWLiwd6FNJsbpKqfJ00Hm8ecII4w55DiYt+nLUNsNNm
	CMlZ04yUfzepR5v/eEhOPHQcG+NBBsx8rHnqsTPr0LFuhYwJROLIkDFmJpWPNs1JcmC33vPGmeE
	VOov1fU7UH+2/07UXr9f3RkIwgwqU=
X-Received: by 2002:a05:600c:6814:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-48379bf4788mr178293195e9.34.1771330379021;
        Tue, 17 Feb 2026 04:12:59 -0800 (PST)
Received: from arch ([62.77.119.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d835f6bsm497132565e9.14.2026.02.17.04.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:12:58 -0800 (PST)
From: Azamat Almazbek uulu <almazbek1608@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	almazbek1608@gmail.com
Subject: [PATCH] ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table
Date: Tue, 17 Feb 2026 12:12:19 +0000
Message-ID: <20260217121219.79960-1-almazbek1608@gmail.com>
X-Mailer: git-send-email 2.53.0
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
---
 sound/soc/amd/yc/acp6x-mach.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 67f2fee..9417b53 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -696,7 +696,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "XyloD5_RBU"),
 		}
 	},
-
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

