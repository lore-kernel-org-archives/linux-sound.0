Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED63D47C6
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395403; cv=none; b=jU242MHoCUPzWMdpg7sm8nFBNUt0rg0HpIXVDKNOLTGNxhTDCUFxxrFxsrrbzelE5VPAVvzvho4D9b6t1+7XE3XdQdH7OSJogcmHXnwgj+2QErfOwjudrxuii+gXeNmo7gZbgql6oiI4s1w6VodeoTk3ZUZ+eHM/DE0yBcEXaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395403; c=relaxed/simple;
	bh=uW2jVibi5UlVA0sr1KUeudNxCWTIR8KeS8lo2eLVMg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvYGkIxppzQga+mxTU7rWsDhkLHAatBKafvw/baH/tX6QYjhtXJAx6LfQ4EaNdajfAd+JTANWK9rObSd1egKDDzfYK7WioDQ2i/4DCvtmJe4himfJKlNyXvUarsmhPvfhVTKQ0WdYC1VteP00nOaOp5FcFpbD0xs42PeF9Ve/+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7eQFVIb; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7eQFVIb"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8573e75425so1491947a12.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395400; x=1781000200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itZ+htTWHTauD3C5JTmFzIrqx+Hfh0DDPlT3jqkIXr8=;
        b=V7eQFVIbEAH0qA+HSG67mI9/Dy15UHKBjRc8dC51Hqx3v+3hd05Plp0x/2Sed7WThn
         aDc75iNsSDHj9CJ5kFMCXsJk+uTX3Gu04NL/BuVHsIkcaPL2MQHZkO89T8VHMuJpOnKG
         pD8cmlnkVF8cg0RLH4mLc1mr2EQR9IIgR0Wh/Y/Q/j5mVqGL4o/URmz8/auMR+OPJluB
         eIhb79uYKw8MFuCpcBMR3LCWc3AaordjJY715aT4St+HsGbjToJ73UvxZYKgWVxN5OPZ
         vhZEU8QiGoJzskAWrm9vcdLGzKk+7NtS0DOhBkmAYENZ0OqDPW94Dq/bsmIYcqWcb3VC
         DfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395400; x=1781000200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itZ+htTWHTauD3C5JTmFzIrqx+Hfh0DDPlT3jqkIXr8=;
        b=OOUPaZdf1K6L8SXR5WCrQBR3sJVpkEr/w1fUqYYmLboXKnrOKc3QUsiRVeSfI0ivoQ
         Qgxc0/UEKrKiFJeVlv8gsNw0H01XBN5N6I3WBZP8vzTjlzaGAeqqQ7dRTgq8NTocruHO
         lLzvCnGPE8IWlU+DTmE4BXSSOPca5pPdY+7Hk8mE9mcQGZ2vTWYCBx5O5f9HYCxYLotW
         rL1wmGy2vKyz8bFXR61E/wuHI3A30caJhQQFsPXEzyYmR57laplSrv+g4IuqkZ9d+7po
         9iVjKhNgK94pHOg2qTEDrxnwwJJSSxqOUsZvrpYYI7zDBp6URlUH5TZhRCgVi5Gsmz2B
         OWqw==
X-Forwarded-Encrypted: i=1; AFNElJ8fs+M3yrQu8dFu2S6RmT3bzul1bC+VzaLjFtyn7esqIqGlh06K/AG3hsq3j5ZwkoRut5J2k2s2lF5yxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzPnpXqknjtOVqwxh/JbD2SF95fqYZ27gcihytz0SEmM4fd+4/
	6LX5gRUj6163Rw/Xzdy8seSeVJGwZVjTIGTJd+gO+zSP/Mrc6D/Z0k0d
X-Gm-Gg: Acq92OHzRGhl/LVsxinmJ/ge1/9rL/NQjtI3eCVmE8N90fNJr3uRlRDI6ZShEMdV9HN
	SAWKgajLvWtJBsS/wal70reU19JY/stcRc3XW3lp+3Ej5+oXlPPT4bNe1vUUTwsV94+LpQJJUDn
	yuAhXcpTj8M5hHowwtU9Y4+aIuUth0lnRwsMlYitwifMXNFix7DyL+3cDf1TFqu0sY/glAjs76f
	397CbmnwbM5vZExH81OyT/5BfSOhlaZj6Avx6C5UZqOhL+VMBKlUqCNiTEkgLF6QtFk6NIGHMuT
	Xl9fDPXxe3EcNkUXLUoS/1L/qB/gMLFUZ8jC6kj/iuTPncbaw7v5XWOvkIzKxZtWFbSGdfTToKn
	9f6GyQihUJsrhwV6DP61iZwVkKskYr7Bg8I99YcJ8qdqhIj7DM+Xw8v2KFIKYb8AQR7S5xr8hrO
	5ThBPioc15bFOLOAjqSyar5ajEvwYE409h3j0BnbpOsE7rwtG8VHhst7mJzt0qF6oJLVm/
X-Received: by 2002:a17:902:e88c:b0:2bf:30c8:bfa1 with SMTP id d9443c01a7336-2bf368bd8aamr168629675ad.41.1780395399946;
        Tue, 02 Jun 2026 03:16:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/5] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
Date: Tue,  2 Jun 2026 17:16:04 +0700
Message-ID: <20260602101608.45137-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Update the binding descriptions to match the actual clock usage, where
'mclk' is the controller clock and 'hclk' is the bus clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
  - Update commit message based on Krzysztof's review

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

