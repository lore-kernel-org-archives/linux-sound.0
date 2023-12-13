Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="OWGqYGy8"
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F4AF5
	for <linux-sound@vger.kernel.org>; Wed, 13 Dec 2023 03:40:03 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d336760e72so16233875ad.3
        for <linux-sound@vger.kernel.org>; Wed, 13 Dec 2023 03:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702467603; x=1703072403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUJk9866S4PAQXmA6qnwohjo1oiLjXwOVCALe6AI8vQ=;
        b=OWGqYGy83SE+10p1aPiHjy6yMLYL7gd6yeWuPgESOF3yqBdb17S0kxKNIvlb8nzVQD
         b3G1P13/BxNddjWaM7kg586nLg1sxjtspOQYsJqLqYXx56VKGkGUkz0+Lnb9qhphw0AK
         XkZl+GbhGMe/NzY9xtmjFAGchzXCJ4EW2P9yiPhu5eemByJpyoiFL4j5glQdA153s1/u
         yK56bCvTrtUGt6lAJOGf9XYebZyt/bgiYOMcYQxniqc8mRlxZxTsE7fghWz2reSbWkgC
         XOmne6oD8P9sOrzhIBBQtU208+MuC2ae0m/BgT+rWjmVMpOd5TGGpWKVq1S1g8CeIqHY
         /pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467603; x=1703072403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUJk9866S4PAQXmA6qnwohjo1oiLjXwOVCALe6AI8vQ=;
        b=fhvubREsyOb14+g7fCOTV0J7dwUxTv8C1WfSXz0DcvyMl4jiFld5ofdJyid9nwjzj2
         fya6b3XwAxF3BddD3fu5LOswbJQiLp/ugGgD+3cWmbnfM4wXGBimsiN86oqb5VtkpC4M
         mpvqNOUvvyAPoRXbmTpR0L2J+8eEkOoD9YQPLarg4SUEZApxUjJ5fbtYN+LqYVEymM6C
         XTEp+WHhpFYVgHloXTmT6rI4FqN5cV8KbsDGRp4owbIfY/zLtiT40gD+Q5btAU8nUM8a
         VLssLZu0eIPYrVMIYDsVjuFLf5zjMGUqhnvJxzCvRPYvrqWOpJN4oHLcByzOL9FDvhos
         dLYw==
X-Gm-Message-State: AOJu0YyQvPqCvk2r95y73X1jXrt8D1NihXfNhOvW4myfjJsNzTfe48tu
	UJD+iCbmb5SbOkj178Pd3xbWkw==
X-Google-Smtp-Source: AGHT+IGGbsgbPQAiXakBe9/BFo0noPhdiK3IMylMPnBNVKA3otJubCkUkx7dQEtus5lgzgTO7E4leA==
X-Received: by 2002:a17:902:c412:b0:1d0:5ac4:4959 with SMTP id k18-20020a170902c41200b001d05ac44959mr9916483plk.6.1702467603012;
        Wed, 13 Dec 2023 03:40:03 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902b20100b001bb9d6b1baasm10331066plr.198.2023.12.13.03.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:40:02 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [RESEND PATCH v9 0/4] add es8326 dt-bindings, commonize headset codec API, es8326 support and Enable dual amp for rt5682s
Date: Wed, 13 Dec 2023 19:39:51 +0800
Message-Id: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for es8326 and codec es8326 support. 
Remove duplicate code, commonize headset codec init/exit API.
At the same time, Enable dual amp max98390 for rt5682s.

Changes in v9:
- PATCH 3/4: Add comment for MAX98390_TWO_AMP.
- Link to v8: https://lore.kernel.org/all/20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 3/4: Change the #define ES8326_CODEC_DAI macro definition and filter the es8326 widget
- Link to v7: https://lore.kernel.org/all/20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 3/4: Completion "}"
- Link to v6: https://lore.kernel.org/all/20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com/

Changes in v6:
- PATCH 2/4: add a patch, commonize headset codec init/exit API
- PATCH 3/4: Remove generalized code
- Link to v5: https://lore.kernel.org/all/20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com/

Changes in v5:
- PATCH 2/3: Change the names of some apis
- Link to v4: https://lore.kernel.org/all/20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 2/3: Change the names of some apis
- PATCH 3/3: Change commit description
- Link to v3: https://lore.kernel.org/all/20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 3/3: Change theme description
- Link to v2: https://lore.kernel.org/all/20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/3: Change ES8326 location in bindings
- PATCH 3/3: Change theme description
- Link to v1: https://lore.kernel.org/all/20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com/

Rui Zhou (4):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 125 +++++++++---------
 3 files changed, 63 insertions(+), 64 deletions(-)

-- 
2.25.1

