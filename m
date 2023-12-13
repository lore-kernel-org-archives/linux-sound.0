Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="GhlPr9XD"
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936281BD
	for <linux-sound@vger.kernel.org>; Wed, 13 Dec 2023 03:40:19 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d345b187bbso11949625ad.0
        for <linux-sound@vger.kernel.org>; Wed, 13 Dec 2023 03:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702467619; x=1703072419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkeEHXB3/T/jnmWhl5vUXIuVy5c3DWow9x1MikiYeZc=;
        b=GhlPr9XD9DnyMkWpTsv2qi3rSGt1BfEV2SiSrQmUdiyQnTjpzm7HR9JSS1cGZWP+L9
         64NRa5VIRODXOi+eGdum3WYP959fcFLz7V94Ii+9+echZGMiM7B3S5BVBT2e+969I2ZY
         nJep2WBDgTKJrMTBSQPnSGS0UmAdmRv4R+jeyZape5aF7PcPw4kM6idUrkf9CciGJKq0
         T2QRbphnJZAENTGHpl3LdMvAYsiozSkjJFhk3EubSo2HAcYGKohyv86ziH20kQhswTKO
         jVRqegdx+dhTq2w5ciDXLMGjxZ28ar4z4dax24hJL+t65jXUACxMZLR+pNORL0vGKuAU
         JgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467619; x=1703072419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkeEHXB3/T/jnmWhl5vUXIuVy5c3DWow9x1MikiYeZc=;
        b=DIfuVv1/xsOA2WzntPt4eTep/e9lEBO/pKEbGRSJW59ZPy4DKKKhtEXUbJD/tq5YUV
         uBzIK7Lgtjlvbdhw30qUFULCaoDf0Blpd3liMOruxEXHQo9Bp2eawgdvAqYKBjeWTQXs
         elEdMG/mHgVl95MY1WfKNBBh0YA2dGBb4Eo29wq2oso4Eb8n/LiRSAAQD5EElemW+8Yt
         ALCeNUsOPFWi8tdvdKD4n0q4zJxffPfKDKpx1QkGJtiVvy6/3sIaMWKbygXeT6Tyc/ys
         f+et2NH4f1us1/+MzGhHNtDHAlW48ofip5cUMcdXo6oQIMeapJ6Zv8+mHgNXsUNCQU6a
         uTWw==
X-Gm-Message-State: AOJu0YwDB1C3Tah6Sgw6GS5czh8hSqhOoiUXxGIfh9RaokXuF2zW787+
	n/HxQ5+1h3rRt2CnCJOK3VRwTQ==
X-Google-Smtp-Source: AGHT+IEtRpE9piN/TcHjX3rZFm4N555Til6W/9RSMkR3uib8RAC7Oaqpe1Y4KsVWjCzLTxENloKduA==
X-Received: by 2002:a17:902:8696:b0:1d0:6ffe:9f0 with SMTP id g22-20020a170902869600b001d06ffe09f0mr7464532plo.78.1702467618911;
        Wed, 13 Dec 2023 03:40:18 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902b20100b001bb9d6b1baasm10331066plr.198.2023.12.13.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:40:18 -0800 (PST)
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
Subject: [RESEND PATCH v9 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Wed, 13 Dec 2023 19:39:55 +0800
Message-Id: <20231213113955.47668-5-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
References: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for dual MAX98390 amplifiers on the mt8188-rt5682s board.

Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index d1884f23a1a7..a391066ab204 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1448,7 +1448,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 
 static struct mt8188_card_data mt8188_rt5682s_card = {
 	.name = "mt8188_rt5682s",
-	.quirk = RT5682S_HS_PRESENT,
+	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
 };
 
 static struct mt8188_card_data mt8188_es8326_card = {
-- 
2.25.1

