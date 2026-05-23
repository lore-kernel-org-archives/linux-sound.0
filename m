Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F05145A1F
	for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779572189; cv=none; b=nnMceWCe4YWJ6INVCxkv1ZD7ZeHblP/hASRF+0FI8G/U2a39VR+9apBkDb1mt5JKcZBk+6NWniSB7eob2vicrDNkYP2JWdXVOUvERSv3dCNdNGgS4Z/mKbjq7JXTlwp4f/c8mIAGlk/vct/k9+yOChSnavN/dCLatvTJhvZapok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779572189; c=relaxed/simple;
	bh=VilKTMUODu88Eqm2Pw4VrVCsM/0NxA5+oGoozbxftRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rGCNmC3+gyN4Lz9u9tNXPWjyZyqsdFEYz9P6MSNm5IMYmiQEP/0Ssq41i4PhhmMcjhul9c2Nx32ae5Kjg7pSE+cch0nqV5dso3HKWOwZjRD7AcLkCcDJ9Q865N8ID2D3EIt8pdvroGzhKBTrEYA8GUlTww9edAD2p5IFekN/xaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNmu87lc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNmu87lc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso88549095e9.3
        for <linux-sound@vger.kernel.org>; Sat, 23 May 2026 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779572187; x=1780176987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/dF/BREYgluq2yc7QavjflbN1wLiPqAZu2uhlcXNI8=;
        b=FNmu87lcH/btjpSmaaezNQXSa9gTDxlKVQb5Qi3TtiFeAWDvZUbCM2ZOjZ314XQfby
         5okNE1CwJb+4d+cGu4vx19AhKmLBXn0sIDoEwsEGODLPJ/imC7xKGQu0x5zfeB7VXcU2
         S8Z2tkvmHPyZSzjy3UrVclxpiOPH1z1K9F6t/EE+6PIP7l2bQorbsBb8UihLO+OHmSdK
         mGQ0ySQiGldkixbbXG4QrSZk9LbTz7nOo30Wlh1st24zkBJxCHGx+ErUK58htnevk9pY
         FDUgaxto1G5X1BdN4fiDAbu4uwl18/XrfeCMeXwtH9gQl2G2iJqAG+LuKpz8q00LOcrU
         3bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779572187; x=1780176987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/dF/BREYgluq2yc7QavjflbN1wLiPqAZu2uhlcXNI8=;
        b=gnBNzszKuWDstbCWgO0swswAqfeWIgvIOxtHY2T0mvBgXQSvfRVskdUn9pTGFW2lC+
         ul8BuFWvA5gyoT95a9q+Yv0TUvKtUR1HHepWfea9Edc9qJTEcYMFmHAnQHrbhz0nKwMD
         Xuz8dDw0uR3jhtsoKXXMVjSbuITXDt+sitFuWJXdU2jTp4TMR44L4/HhyGGgaVGCYtrb
         pX8UTMcQ8CdX5yah3yJ4Y6qKAKcMGbjCDp8mQcu0lFaGLWC0bVJNYLQl//p2G1kgpeE8
         RDLrsh8g4kXNbKP9yB/rwxnueWVhXTUlU+K4dCmRCvNKyizBZzPKIgm4E5U6dvezsXNu
         tfTg==
X-Gm-Message-State: AOJu0YwnZ5XYyEUTapCVB+mi5Tsobg1BCFzMIz6nd8u6wGUIfiy0KhCq
	97x32x9y99yt6g6TS5gY6/3YhSVsX+l/bRLUFAbcW0rnJSKX4m1cUKd6
X-Gm-Gg: Acq92OGUqpZ93jwvZvG9zdxdbrfHEAOmLDcNtMZOUJ4EBUPxeVY6me1hc7K7cKXLedl
	iv2BnKNP9aa6Juw9g6Aeix+ajrYSBvymoxts1SyTsAEJtkLTVQ+qvcr3f94xBTtTlYWNf7IZkg1
	xSAnkRlO/gZjtWlQi3gCub8An1f9kP/717tT+poc0qZXXeZlUOXtFIY7Mpt0/gIQKfFV3JToaPb
	t9A9pvcR3DQ/8uMKJkDXxDJflyPSCGbWHsmo83xDJR3HN1J0hLxqDmA/anQSN3eGRSTbG+yI8ni
	FThuXaiOyghDDe5/tkUNfGu9xTjMwqBEZjr7LtFWIJnUwbt8Lq/pkyI0bEnEXbVzHVEtzQXRrEU
	MJA6gi0JNwePUd0JUxm9yqN8ufeLKiPXwP3QAuDS3hVT+tUe1IOFQjf5whHJ4wzyNU44YkzFCAi
	mVtAIzyqaUH57j/8fTxdOHEujtbgumAGv4hpO1EzPURwBJOy0GUYEsc7GlMFNJ
X-Received: by 2002:a05:600c:4fc9:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-490424828aemr136469025e9.2.1779572186445;
        Sat, 23 May 2026 14:36:26 -0700 (PDT)
Received: from joaom-cachyos ([2a01:b340:65:3800:7f4c:52d5:740e:706e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454b1ab3sm156419135e9.14.2026.05.23.14.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 14:36:26 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Miguel?= <jmiguel.ghp@gmail.com>
To: Vijendar.Mukunda@amd.com
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Jo=C3=A3o=20Miguel?= <jmiguel.ghp@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
Date: Sat, 23 May 2026 22:35:48 +0100
Message-ID: <20260523213548.5219-1-jmiguel.ghp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MSI Bravo 17 C7VF routes its internal digital microphone through
the ACP6x. The machine driver only enables the DMIC for boards present
in the DMI quirk table, so on this model the internal mic is never
detected and no capture device is created.

Add a quirk entry matching the board's DMI identifiers so the DMIC is
enabled and the internal microphone works.

Signed-off-by: João Miguel <jmiguel.ghp@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7a637d6b5..a93a7fd48 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -794,6 +794,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M7601RM"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-17LN"),
+		}
+	},
 	{}
 };
 
-- 
2.54.0

