Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02E43DB323
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370944; cv=none; b=oZsVvOor3tnpYD2snULgB8OcIH2sLxOETJON/291fUfozNIWvDCXW8C8bEbmkLqsMj2SySC7rmwCIYtK0NiwknfpJyXUrhwnDG0AFcrdjUkiFlVbbiW0z5SQskq35AuKw+wEdStDftpSK9YyiNyX24AYty/coqWIVPTK4H8zk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370944; c=relaxed/simple;
	bh=EVDRcKmTVQAmuHJWES9U2hQGWq/76vGUhS5zLMa3z4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnx3kzrtZcTjK5X6p0KRV69DEL8HqlgmEYvI/JfxuNr3FRdcSpC9+t2Wu8ANlj1n0tEdgJTmjZowtP1esxmNHKtv8yQIus9JL4VQwpXxffZFIPAPqpqGliGxNZvsan6Q5q2DENKUx6PKiXQWQduue0hmNRRPEMqLZKQjjl1Ulac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glkL16Fj; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glkL16Fj"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2002541a12.3
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370942; x=1789975742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=glkL16Fjjl8jE8SF7ZjkTrR0qvvkyqAXJpJ3f/3UO5lBg+Bxlh0mW3Dqn3IFDMfBiA
         qdrR2AQjeltCxxeV85L7D5MK0bu8UNy3rohbr7puz/L9WkMrvheITj8LZafG2cIRn6Td
         wQWXcbsfszgVYAgoIKgFhwdl3snW9+dHk+hoS/ZCge0Qv9451DikfiKddZ/ueQQ+weJC
         CMSxKZzsWqw2oeflGbyLiVcIKpdQSPUHXPXp1VxxeVF/d3TsEzHiNywOrFQyQ3eeAxer
         DNppwrXcxfCTK5AgyDrTga99iWw+2WUU8bvFUHG6NwpAtmHnvab36TLVSnBYOM8p3dmV
         b0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370942; x=1789975742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=NqOcgbdtu1hClVJwyIEzjAOq+fHtPzFXL+dQ5cfMLCpucYsAIN0AU3BMlJxWkCSTub
         DUHCiIXPojgMabKR4pszeR2jf+m1OwSXJUzudrYkZviod1XoSCy6m0XIhVgIIHi3M6y/
         azf2qszaxsC3Q4VRN4eDSZacPZYz5rD7mLnUwuSd0T8xCnvjTkhDHSeVlNgiAMYeEZf/
         eUvqoXPhCqbQTgGnCAM42I+I4GMGJTd0+UD0aOY6ydenlH+jgMmHcYgEHq3hkmX0V9Op
         hd2wAhegG9rOx4mA2vqdTYrBzLkt404Z4zNRsRxEakQCx4HogOHcrgdcZSDFL7V/Z6jf
         qmQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvPhdH14yUJE9JIcb+MwgLoAVhPf5l902eAGAIN5+UUNjHAUSCVsExDah85Jy5xqSzRqlDEnp1uLabiA==@vger.kernel.org
X-Gm-Message-State: AFuF++k9vLH4CHipxwY1KExUuJhlWR1xePJLzzSm4mqNL4hD2eyPONjs
	v9LoruAIaunTZDJv/QlqTs7qBQQyhAZkEunaYCCsbRuiBTflRhxl/Uds
X-Gm-Gg: AYBFou3FjS/5he3pPTggf6G6Tr1/MAZWLDHXEs9fczHzEVBFSFLVCqYy/Htw4lreaio
	CZBkf5q4om4G7MFA5RRWEgX8Jlt7g/MlJofAyeDFkE6mglHpEa6bHCN4Z9KjKoHojkUqU4TZO11
	CIpa3uS7riqs6rL+2a8V1WEC1cENfC8smkfrEfiNMQNbDxOcnrvUDJXsRBmsK1mMsLgdjprc9zN
	J8fPe1w1Iltbd1K5NBNraUn3ctJVUPkDa1RrSQUikjCjGgDpoHoEBvcoEkgbPLFocIVWTrrRsUJ
	S8idBalROFCxZHHucNVewoVcQPMjbtUsI9DcJI0KWwZtW60uLus/70gbnmKiEyW+SKyD7dbBqm5
	2MqhcgGiqnVVRmAgpqIkGbbOEnezN8Bh3/Sbni82n9VK5G+jN1lXhv11FODa6b9cPLZ2pU5jnBp
	5EpO68Wv/4PVzaEi3/1QezcyZbgTalGyte91IDarMb0zBoegL5RlqtmDrUywRyNjH4KrUv4l2Fq
	WvAkVCZdUmGaJ/DCQc2/X4XDJ0U5E3xXSY9Ea71W4zG5YulZF2epsg0YmDjFu5/MDWbnIiND8cl
	qbSC+Eq50AlMs5G0IunL5QDd8g==
X-Received: by 2002:a17:90b:582e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39dec08daf1mr3030942a91.16.1789370941989;
        Mon, 14 Sep 2026 00:29:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/13] ASoC: mediatek: mt8189: Return error for missing regmap
Date: Mon, 14 Sep 2026 14:28:30 +0700
Message-ID: <20260914072842.24420-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_afe_enable_top_cg() currently returns success when the AFE
regmap is unavailable.

Return -EINVAL so callers can handle the error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..63e03a40dbbe 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -236,7 +236,7 @@ static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 
 	if (!afe->regmap) {
 		dev_err(afe->dev, "afe regmap is null !!!\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
-- 
2.43.0

