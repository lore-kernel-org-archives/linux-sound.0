Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C436532C936
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765399297; cv=none; b=pgytNKNDWGiIU5XfaE0pz/zzlfLHcG74Em5fLj7wtbysZSRXz81NfWqgwBXnRq3WUP4UUesZ3zBfCcY0YKghRKLtAFk9vfQtNCyTzEllTMO5CJhI6ZIHi9hwu7DFsolkmLRQxWEUXvdYR9Y19b+QDjR+q5NRyBYXS22MQ3Z6ZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765399297; c=relaxed/simple;
	bh=TRyLCd+ncXqbnRsh/grUAYh0/d/ygzxIV8KiJU6IL+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+kX3hKdSwICCutUwi51ZQb5297xn9XLNqaTicWR7bsxI+NK09ZH8E6Rw9adj1rwMuO/dTQ5MDHChG/b+QStpI4OYO2l8JaMmEg+kq4s62BsVkB2Nm8hiULb/BEJHDelPPuexz2snXh0Ok0Hu1/PqvQ1kJIQE1EFiIe55OQlgsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJA0Q6YH; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJA0Q6YH"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4eda77e2358so2069011cf.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 12:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765399295; x=1766004095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGnnIWhAb1bzkSy61y4yLLtVCAL4PeVPAsSuYFYfM8M=;
        b=bJA0Q6YH28RXAivwXcxSCzZAsax/oLDKYAlyz2WeFmPSjKO6tqUmlndbOs1MXAElMi
         eq0/BXHdN22fw1ey6g4nxZhpGBV0UJUFHD0pdyDH9HvGgosDo9lcR2gi79OrVkokeG4G
         1oCLVcCPpdMUbX2DAThZqTP9LaESrYyzim8ussbtgj5AnMMG1oW9SKzje9TPwBlcDw7M
         u/OHGkSFqxdkqY5cxyf3zOYK5wkGNX2CvAZa/1bm4l/hdslbSEDx8nwI2/WWjbUucbJX
         m+dEvI88jAMRtVzw1gLN4SxNCRuMBeRk9htpSOctIAI+xmxVHU6DX93vpqHoa7a/y0O+
         LFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765399295; x=1766004095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGnnIWhAb1bzkSy61y4yLLtVCAL4PeVPAsSuYFYfM8M=;
        b=dtWjkc0e42iI2Chv/gNs1BZTudYsNnGb0oBBKvku/3VPAHyQV7MCLweABl8Xlp5jU/
         RJv9cJM85DP4556AwrJ6UGctqLEycsAYQnMJ/QLxXkyGrlqeAt5DOznA65cU+sMWnnro
         TR6VfbWrF/5/xP5ayRQxLGl3sRxSsKLhKJRETjMrQoeKNjhqbmnLG7dZ2NhAo9PT3c+h
         ZVJ2j4xLelIwLr7SOpXujTPM07wwx05ontXfUhZoXSo8YHU28LxglT82uU0sfMqjLP6R
         H0JsG2up2a++ByuYFAUZoCPXSYeOx7/oND3LMomAVxH3IhWqr0Pww5vTMZgXHsyoUOYF
         oprg==
X-Forwarded-Encrypted: i=1; AJvYcCX4skuSvswh6Iie71WsQXiVmb3T0C/Cmzweg9X79Eeclsy5ajo0UpqsQbCdd4VSI4bAgMePFUk1DDeeug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAPhqV2EUZPNx2AoJqFQ9m7QGqzvnX4F7/isdIKWX8d2UPcO/k
	FOXdi6Q8SuuUmte7iB2KWEFQI1V+vBmyPmvCm39oa7w1snvYw8gh1gn7BrMVgQ+T
X-Gm-Gg: ASbGnct+21WSkO5qJQgwowTUKcwz8NNz0I+U0mJiQUr2gMcknrsbKcG99iS19Kw/YgW
	G6wtmIKtbmAKIf67bZq22LcFb5XKIe/QKAy5GplQs+VChMXitPAo32t81FJm7QhI2sWxDDKIBOA
	UICk2BwtC3WVAdo3lMkI7FKq1n4U0uGcjuHdNsFZZaKhXmT2o+sJQ5erDAbLV0/NVnp+HUQtki1
	kZGG0SpLESzlIj5CRWcsKcFDAV6YxXqWIxPuD45v5gLmMVDHg9wdO+IBp4hD7tE4wDQv+aIswui
	2H4aMpqYJnmr13fx9yE1H0/usn+XRDCbjl+XAolPiT/LoTESVrzeZGFxnSzsX9YjFBrRqgYPTbQ
	x8gXMY5Tq/aLQ0hIgK930syBseDEAdrOCV+8rbiTmXuvq4pYe1dwMcLA1YiAIGHGNlP+Qre1i4I
	TeJ49BCDD05L9Na8706ejvQuadpw==
X-Google-Smtp-Source: AGHT+IFh7BfhZVQssgyJw0FyvGQuJ0VlGnbRTYVC/qPD0j3szewpyz45kxL37EBXzM+MNXrZ9an1bA==
X-Received: by 2002:a05:622a:64f:b0:4e8:b288:7b6a with SMTP id d75a77b69052e-4f1b1ae6074mr50514801cf.82.1765399294678;
        Wed, 10 Dec 2025 12:41:34 -0800 (PST)
Received: from archlinux ([89.169.15.126])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6e8179sm2937861cf.24.2025.12.10.12.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 12:41:34 -0800 (PST)
From: Bluecross <elantsew.andrew@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bluecross <elantsew.andrew@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025
Date: Wed, 10 Dec 2025 23:38:00 +0300
Message-ID: <20251210203800.142822-1-elantsew.andrew@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a DMI quirk for the Honor MagicBook X16 2025 laptop
fixing the issue where the internal microphone was
not detected.

Signed-off-by: Andrew Elantsev <elantsew.andrew@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index f210a253da9f..bf4d9d336561 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -661,6 +661,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 15 C7UCX"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HONOR"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GOH-X"),
+		}
+	},
 	{}
 };
 
-- 
2.52.0

