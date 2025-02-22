Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231C6FC3
	for <linux-sound@vger.kernel.org>; Sat, 22 Feb 2025 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740224495; cv=none; b=CbMwVtOCCEHX9+8F5POJJZdpEZN0h+fz18knAqRF/hmk9hxRcTIoiZrrjMs1Cv+JDBjTEyCW12oAGEXXLNIr5VaL0AyrJzWKTxAtE3eR3/1kNlKuNsdcLogaUN0HMs9v9miIR0WcEIGPoin+D6sJ8xzCWEtclpPCmyGFKK6n1MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740224495; c=relaxed/simple;
	bh=0eo+dpDy0u5yQPp5P4K2//p/JaR4GQuP29JV3GjQaoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9Rbz7Eweu7nFbIQi3lJ96ovav/dAV1o9JISldEw3dGV/jZfaInqGLbHQ3ZthQFlQdt8DpAeatOjG0vH21gbg+/0/3nuIxKu1yNJTB6y97CA8iiU41kH1T2mP1rw4zQN62qLpL02x3SR2a/dqMxsFdm64vFH3KaIQAbYZnhHUgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5rMLQzS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5rMLQzS"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5debb4aef2eso474332a12.3
        for <linux-sound@vger.kernel.org>; Sat, 22 Feb 2025 03:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740224492; x=1740829292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HoSZUQ2VMWFtlgAIDLEnV7B9Mgl5ZO2Q7HcxD/gCGf0=;
        b=F5rMLQzSScsWihIKdvc8QTVr6HTx/bgnWTbubCniUbhDBv0REjDskNAMwMZIhUsUmv
         9O+IZ9xNA6znZozFeeGVrsRRkFJg0jE1QwFvrDlA7rDahYqET0N3vEHMS5xnJFn5Zspl
         L++P/HokhtOMIzoTPqqOmNe4m/gpC/FwRi7tpjEU9Pp3sqBKo7U7rxSYrE2CKWqKxrzd
         BimOtcUwPvtonkpy3VPJ4Ejt604enlpCZKm/njeS7Zr/ycZojzrQYxAy5n9xp2w0HDx4
         w19WOQoGGaLQYbhopOx4zH0oTXvEhggFo9yu1XbqswLx7sQly3Exma6I5ZSxYsA3633n
         lvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740224492; x=1740829292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoSZUQ2VMWFtlgAIDLEnV7B9Mgl5ZO2Q7HcxD/gCGf0=;
        b=LCUQqIP8jCgEjkbDDmtZ/Ruxs3mzyo0q8u7axKWAiYRNXCgrjvb0CZ3XIFcOLpQpGW
         P4VGORisvJDzjvAU+PEUEFjr3hXqN4kEZqEmuysB/36F5sn36gTBlBkv4vYcECHd/v89
         GQ+IGQ3XtT6Sa3xgYuSIlBHva7MZRfxzKMjEroJvVDYHMCCBih1uR8L1SumL4md4yal5
         7xfBqxEqJa2iFmFf046t8MWLCNeW6zxpFW4wa1khqxgnwUJZhF/BkEDAAdQraAniuB7G
         rquxpmNXcurkYy07MddytsO1iNuKOODb6dXmZfCBW1+ZJEhdW2pExs5SREKkqcplKNW0
         YRRw==
X-Forwarded-Encrypted: i=1; AJvYcCXasBuR+h+gunKUlKhwE8IqLuqY5BzTxprJKbe0laNro9SV2Nm/CJ9Zm+KASnTqTScJtSLkgKIVkeSXwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Azt712aMGYazZfEpVuTpzlvpVrpDbHvM4XyVJXHVIQG/NfJB
	NUwlGBySsJyLX1WMjQJmQjT0hqJT6Vp4FIEJkxvyAjVHPCGWieoLgWxb8ydNAnw=
X-Gm-Gg: ASbGncuGU+Z/q8h5/l2uf0CeQUC8T2tY2RTUD4Y3pK2I4Qo3ILeDBRXAlxWrOPKSsZq
	uonwhlOtNeiqriLLfayoLJxdN4P705R7Eu9ZepGzi0kv5+nmIa26jWUImepcyyCHFpIXg3HOt5/
	7RZDED0IWYYiWegj3mElQIAGj47n0zKhZSTNdb8L9YV9cnow5UZDaoW+aABk6N8YptfZXSpUHFZ
	PqtK71T74i8k60Q5u7nzEHgxE+kEYlVWdjs0BsMDplP7sLgersxNg6IhlYbrmqGhKKG7USwr5Ft
	KkQXVcI79xfrOZ7MNbwamGl0e8UWXSaqb4l5sRE4c4G9yl1yQMuLfqThxcvOf7SEEsbICkoDKww
	=
X-Google-Smtp-Source: AGHT+IHwhMxegxJLpOX8mxPkjYTencEu7XqqUkNBqFCyXK2r+OfVJTBxshzlcy8+OorXLkNnvmH1IA==
X-Received: by 2002:a17:907:7f28:b0:abb:eec3:3937 with SMTP id a640c23a62f3a-abc09c0a42bmr227118066b.10.1740224491862;
        Sat, 22 Feb 2025 03:41:31 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53232275sm1833180466b.31.2025.02.22.03.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 03:41:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ALSA: arm: aaci: Constify amba_id table
Date: Sat, 22 Feb 2025 12:41:29 +0100
Message-ID: <20250222114129.162794-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct amba_id' table is not modified so can be changed to const for
more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/arm/aaci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index c3340b8ff3da..243965615ef2 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -1061,7 +1061,7 @@ static void aaci_remove(struct amba_device *dev)
 	}
 }
 
-static struct amba_id aaci_ids[] = {
+static const struct amba_id aaci_ids[] = {
 	{
 		.id	= 0x00041041,
 		.mask	= 0x000fffff,
-- 
2.43.0

