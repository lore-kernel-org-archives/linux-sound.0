Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F813329C51
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229287; cv=none; b=Kx+QTPN+/N8fSL2674pbI4qNIkBbZRX7+qoH6NU2LacLOP2kd4pgRY+svSL6boUCA3F12uaC3bDuThn35zrZTBcts5JEbGpqyPcTCAwW/lIGSshn/FCccuk85VSvccBeVKs6xDlsgtxiRAz8llNdBO141IJ+vR9AQDsZ6wqph8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229287; c=relaxed/simple;
	bh=IpvvKMDeUVDhUPvWRXSZe9FOqh+M52LzGhFaBjsBh/g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=srRUkilHzvSNS3WGcUfQdUXMrtVykeaC6ukEWS/7en+6GDt16jw2gbUxcJ6QQp1yq9ZVFVkdlDYv2pkCzG805kF/hV/bzmH6tuul5OO7otiuuL393dinTr8caWMFXJ3VH9GGWbiK78qveqL+7x8tEqgReP8ECXWc0EIUcCWc0eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEDLHGuL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEDLHGuL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-475c1f433d8so7429675e9.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761229284; x=1761834084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/eMMiYExXphSaV0eJ7915+DqGCkBLLJG3TnOqbWPUA=;
        b=FEDLHGuLfUgd4pS7wCBIfctqStZPMGmyRSJAlIBLk7tBs8Zf7i4UAGfEPGCJMuq+KI
         WWqqLaETPFGETcB9HXW0qnVREZlsgyHszpR3YRqPoj/IwwXrQoXLuSGUgCR2F3nXhosE
         CTVlArop07/vz+PKl/O2dCFWNQsgQ7ZEM90oeh5uDt1V+Bibrwrf0ctRMAAuMyvgUTmR
         4QyNMomofEGZM631HjWLl7piNk0hr5OcyXTRQzyM2wNVZ5OhMuz3zE1MAHgQNVPzoCd4
         iOR8bRw2KXqyInr4n0bnlHayAwWWia8pSwv6Vx981Baqyv5nfdPMCQtloENAR5B7Gpnw
         sZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761229284; x=1761834084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/eMMiYExXphSaV0eJ7915+DqGCkBLLJG3TnOqbWPUA=;
        b=jZzNemKTnMIqJ/P/GqqRiw9J89EPEfEsZtu4hHjbOIBkEeJf6rcVpl1t1BILjRb3pt
         AjxEYs0l/zFDhfwIz19jRumir1DbbbvJOwBWBIWdvWpGAvjoO75OUSuM9Yzx2PVUoRZR
         w28Nrm4J6LirHty4hfyT2SGpkvH1mIuEKw61p2AXuTyWujnnaLcrbM0M6QjWYT2O7G1U
         E6uG1WmDe2CT78teH6KicIZBVu90+chs4W0dFmo1WS8l6aZ76fHV8+QH9Zg5T/3Ct20f
         49LaIcPcNSKJWNgw3GzqGlUvn/PKkIj0B86eyDg7P4YOyUT2YP7Yr6WQvvBdYIQAC2oZ
         RxKg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Kl20CthXI7xRofDS0kNBs5tq9rilr9kIpbXieKQTaApGC5zQSDEUDZVCm/Q85vYWwTXLOWivZdWLKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtQB5v3q81fbb/Bmorsj7AR6EryBOzuk5sdvw4zp9WrkP0z/7p
	SSha1fpXRv3w2aG3ZXSWQVGBenFXAKAthe2zDXfWXGj5h0aQQnWVVuYC
X-Gm-Gg: ASbGncsfc5ZAL3tsFv68vj5R3z9Wdmkwp2+hWWwp15zQH7jAG5TUr7spD5xJOKzs6rk
	8K/SaKj4QfkIANY8Di5b9xwlQhbZPemgYsrfZB7eyMUVn7etIE3cho0xPTyp0pqcjuCq/hMyP9x
	bH/8TUQhLIAUAUR1jrYAq3KssdcN2mEZ19gFCdxu4eLre3N88HByI/eH2z+SOmNelrSp5ckG9wW
	EF1Srxa+cG5w5ygtE4gFB0IPCEvfWIjMH37I1bbHe+VcVm3zz+4QoH8UUMRXUahvfaXJFR13cV5
	zlT5mtHtJZpUI9CIdaLLp2l1obY954ssP+2hAtV9yqEHeMIR6TFg0GAEqn1xTEVf/nTDhKG5Iw2
	gowgyQsqo0wO1cdYvR2Be6n8C1FUZyqXqITK53USJYVc6MjS6WYCJK9oy3fSaqTpeSNAzMMk5Sp
	CouhsioKnHGR3lr0/Gq3LfkNqwAbC6ILMyMFozZRrt/Vk=
X-Google-Smtp-Source: AGHT+IFL08q1MS2S/p7E47KzM6eARo+lq1yMEc9iupRUimZVu63q+M0knvp4VE7DkFbjmiryOQC+Og==
X-Received: by 2002:a05:600c:6290:b0:46e:2cfe:971c with SMTP id 5b1f17b1804b1-471177c0f91mr178647585e9.0.1761229282180;
        Thu, 23 Oct 2025 07:21:22 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494b365adsm61847845e9.6.2025.10.23.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:21:21 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: broonie@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 1/1] ASoC: max98090/91: adding DAPM routing for digital output for max98091
Date: Thu, 23 Oct 2025 16:20:44 +0200
Message-Id: <20251023142044.2247989-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each route connects two widgets, so in this patch, the widget "AIFOUT2L"
audio interface output left secondary mic and "AIFOUT2R" audio interface
output right secondary mic is connected to "SHDN" and also to "SDIEN".
Route with "SHDN" as source is required because "SHDN" controls the
shutdown and must be ON for codec to operate. Therefore, "AIFOUT2L" and
"AIFOUT2R" must be active when "SHDN" is ON. Route with "SDIEN"
is required as serial interface logic must be enabled, that means
serial port must be enabled, which ensures I2S/TDM clocks and serial data
lines are running. This is also the case with audio interface outputs
"AIFOUTL" and "AIFOUTR" in primary mic.

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>

---
 sound/soc/codecs/max98090.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index ef0c4f2ce1b2..2e6ec2ac5327 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1436,6 +1436,11 @@ static const struct snd_soc_dapm_route max98091_dapm_routes[] = {
 	{"DMIC4", NULL, "DMIC4_ENA"},
 	{"DMIC3", NULL, "DMIC34_HPF"},
 	{"DMIC4", NULL, "DMIC34_HPF"},
+
+	{"AIFOUT2L", NULL, "SHDN"},
+	{"AIFOUT2R", NULL, "SHDN"},
+	{"AIFOUT2L", NULL, "SDOEN"},
+	{"AIFOUT2R", NULL, "SDOEN"},
 };
 
 static int max98090_add_widgets(struct snd_soc_component *component)
-- 
2.30.5

