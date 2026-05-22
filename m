Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102BF3C76AF
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444223; cv=none; b=q9+dU8z9OoGDtbIhkP4mr8viHKq0YDMxB9k7CooFEKHqfsJHVZ30LF0jabnGOYEnAjzPXouEkv/EmJKdwyQrfZMbox7fOj5redxzUwPl2nkbQ3Y9A7rT1RihkO4T3ygAoPuJzh+cFwg7d1goAcWvpuP8AfIhiFBJJTlyCVTWr7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444223; c=relaxed/simple;
	bh=5IVRUpeRERkgnBnFFAUZRPR4vuOlaquMQ2M1F5gjZLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UD7gL5SrTR/pKkjf1c9onZCj3KtgyDYgTYxrySEaje8+IhdJZUpjZSf/SZ78pE3rg4NbS2o3UJofzUHFnoNODzhATl34nGDixSxMxpOf4oWFc5fPHy+8Run2zTl9ZdL9esxPV3aHpJ3v6hJX+X3WYG1dCpAD+7WvJXrfJuCuByA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeLQgG1J; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeLQgG1J"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba1e9d3687so46764745ad.3
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444221; x=1780049021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4PQwaR5Pu3llNRhqAB+zh6CPiNVALJe9/CtlXd6Tm0=;
        b=FeLQgG1JHsnqdqvZ22qtf9F2CAlxSoSlveQu3TB3+nS5LMHhGg2jDLyTy1cH7nvjPs
         6KkANarKJqbWVrw6BtjWZnSESZ7cF3drpC40T4FEHqZSfC9Pq0VdiVCzyWp9i7pCJQv3
         WUeE59NXPX3kRuaHZCnkmJg7fumQeCSZ4nrl3wHMtvVIZrzmRb8is1uFEW1jEAtMWd+D
         2jtej9jP05PQ7M1pUDvk1bmKMSam5a4QqSZR+jq4Fv6GGITfKwPGJ2G8I8UplpAozYB7
         incXhivilL9lHpGJeah92xtRLzqyFVDzBXTOjV/v2dWcgSw0RJ7bdn5pfsJyMyuGW1Br
         Zldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444221; x=1780049021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4PQwaR5Pu3llNRhqAB+zh6CPiNVALJe9/CtlXd6Tm0=;
        b=QmKxKEWFGUNf8NPAMNcuQ4uDz25bwwv4uYDR649tgb53/eH53bwWu9GAJrEQBlhZuc
         6OYreuTZq0HDAmKQvGl9rmTdzhhGNspcHTg3/ba2LnlZVzoJLLgd4wVHdAVjQ79Hz6KW
         s004BHN2VCXCvu4wHCh6+dByWRW9yQlNZ/k/8GfaEbNXWqgLeRCvhbc0ZdF0H15xxyXR
         0BkrAgGzPotqRa8JELc+RwmMQh+Aiei6c9MJx5m4znmJVhM9If5Y7ONtYOZVdD5ynCQz
         bfPk1wJMWE7upctJdf6MbkBlkPswJ2/BlTxM3tHHFWwBYAfV6TrErqeZS7cyfzfFLrl3
         twkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DPmfgF+kS0tU9KB1NRZoezVy+1McYB60qAAEbbo9M51C/PlStdmjkrox8iIAwOMc8R/ed2d7nQQoLbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyOXbXCh+Cfz5Uh7vHxAkP9q7TzEuO/zH1PbYm+XzUvQ6LBBT2
	a9+G2gq6239l991HozVSz8DzKj9bvxDLS/uav5gE0Kx/CrGGUAf+DhlY
X-Gm-Gg: Acq92OFJmZ+kv+mtchIrWKJ1ycKpVn8ciz9BpUfkGUXQAc8kl92rsBg4Uj40QvWdkPA
	CyHsGOYgVqXDJENck+E0pJcNG3sKoFLEhHqa0bA+lesyX51SkxB9cgtGYzQjOR9Z/hW7/bk9pBn
	XSsKFs20+P2ZcQ4yjrW6W9JBGsORmuflV0CFsMZVHGz7h6THLfAkqyXYS2Tsaya6WDQZ0yo6S6q
	2Eyu28td2e1dOLS+bbHU9ljUvariDFKEJ7x1QzbqXQBD4cKXh/VZcmyF5lmFhn2/PVMo0kemrtg
	izPsrG3Q4qks3kou9shHVZbuqcum2/oNspGwiKKNohq5u0cl5x1z4QgQRMAoGBwiqirZIIAw14/
	6t36JN9h1BJs1A6TPE39W0I/K7mvpIAUWo6j5qKSkWSRFbXpVOzpR3/3d5fzrXCbGlhPSsRU8FO
	1Rka2Isc2S8jPkksYwxva4xEQWf4CcgaJoOuyLEAJDCnFTf1Fp79Qw1jbF8A==
X-Received: by 2002:a17:902:ce92:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2beb06924e5mr33628175ad.29.1779444221237;
        Fri, 22 May 2026 03:03:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
Date: Fri, 22 May 2026 17:03:16 +0700
Message-ID: <20260522100318.73474-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522100318.73474-1-phucduc.bui@gmail.com>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The clock descriptions are currently swapped relative to the
clock names used by the driver.

Update the binding descriptions to match the actual clock
usage, where 'mclk' is the controller clock and 'hclk' is
the bus clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 502907dd28b3..b174d7498029 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -45,8 +45,8 @@ properties:
 
   clocks:
     items:
-      - description: clock for SPDIF bus
       - description: clock for SPDIF controller
+      - description: clock for SPDIF bus
 
   clock-names:
     items:
-- 
2.43.0

