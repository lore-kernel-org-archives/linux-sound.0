Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF738F621
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030525; cv=none; b=tHqcBVIG0QBEHFrOZaaPZIIZ9X5QgvQfWDvFqmYv/qZ0+6qRngmn8SpDWvI7pkuMqK5SGjNkbvO8yicTR6yRqMHdxSq765qEpmUUsyatS1KPLIKPeI9Uf7bB4JuuxRnIZqgCeSeUxQ1UIq+Bv78QiUnmcZqLP/aKoiwDLcixSK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030525; c=relaxed/simple;
	bh=NWzTd6xiPdBaZy/6UXtXar/YN26w4vS061xIq15Rj1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jC96ENx4M7DUj4iJs8s3lcXGngftPAI+asfnvkRf/nujF0VECKULlQXGeklH9EmKcfV1kdHohnIUzS4z3PC9AdD9XoBBtzdcxdaPxsXu/xC1KzNvU9lZMH/JJCN5OaK36aVJLI27SW8a8MQMku6ty7mxbxM68VAznr4fjkwJ10E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GN/Ia07Y; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN/Ia07Y"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so4372302a91.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030523; x=1784635323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xl+ER8kJy0jFgleq1xDqpQH2nfl1PFzj8+QKjTW72EA=;
        b=GN/Ia07YcGpVoDQ4OUKzp8IES2PA1Tk6bbOlBDV2lBJAiyErMNiUiHORK5Y+6ZxbTB
         gTm1rTctr686PvZJo/LTXWlNXvObxbnp08kMOzjG2TU20OwA9jx4rm46qEPvFs7loHZW
         8PBBvEG30P3ufhnt20htSKTgQpVkwtqrUTkg9Y/8Pw7D2Ss7HAncpKuPheOy2puhXDyv
         y8oLvrJBfM/QcanmnqW5NpxFdTg+2zPZOfx5rov09DEMG5fm6tDlO1/MZ9JSJPeBNzPS
         19ZonprahmuVh7DgqpiQW7cP/PIYApoOqEceaLNUYhUV59h58ZMaIKLX6bN1hJQRoCUa
         sPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030523; x=1784635323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xl+ER8kJy0jFgleq1xDqpQH2nfl1PFzj8+QKjTW72EA=;
        b=bP78pNSHzLZVThZnwG0byQ1r5LsH6oAv94KhT0WTnsq9gbJ8f8tq2MUAyGVVNLiO6s
         msMI7SjncuLAbWhMarwi9dlmJDS5kJMoBDWXlt+k88KIlmsmDJVDU8kiX+0F6P0Koo18
         eMBVz2JFrYao02HiSJx0ZGZIYWMv/pK/ie2LkSzy3jvRGetSpXp3JLnRLG43sWQDojzS
         24U0g1+eBnoxnUT5IHk5e8g80Sdsc2MaIwwt02AF7DSTps8WMGj6uk29UbFVAH0pvu2s
         60lUysVargYipZ0jsPXm0nLg2qE0QpN6RcrDn3VIAYJ1I5vKHpXR+C/hQ2GyuyKI2/4B
         zVTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Za9JVvWF0o9LFKVUhC7imsWm7yTItwqKSJzuPsHxu7QeX88c2uj7WP03rDg3+jEqWGpsDu8fjG9XMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4HbRSfbQoSZGVLTzxUWnFMqkC8J62WqIDGUz3OJYv9OnKEQgG
	oRzwDUPtfkvWjCjdo6u9fzq6qrgZmZbdg/vE8o2R8fMksSnaftREFNGo
X-Gm-Gg: AfdE7clRWRZwFX0SOIQ/S9b0EvCOPo+PBR6xE11cPVMAoNHFTX8OmS6gPCXryVyDthB
	dEUH5g3wOx59Ccn1c/LayeVQs503u/BzbFIETAygkOSgQnnNZBrmp0Qc28Ds/cUOWfTKCl7XXNk
	t+/KMUwVq5Gb4JuhaP83fA6EbuAyVDyPpv/IN53GWIO/a+WfnJ6yGgfJeag/C8g8+5ooxklc0OT
	v4xyi1vebLMN25hpnvF7E1K+uHVGEy88yh/Gx5bwtJR/uuqb+TIuiz/JUd1Tw0L8lehjTVkU/jm
	wtFoi6esmYRJRmHcoeGMfr07/KldK9gdnpyK9zPRM7A4fEm4Exxe/MiliCRYNGT4/zxiD4xaJya
	l9ACAl3e5Di6Z7lNgcyidOpNirhXwGxrIT9RgNr+WDNF8cxQG3wrmdxrhvy5Gk76rv3qsxLXgNe
	HiRzRJkRDSwg9U5ljy48g6acrs54zw8mr5ebrKdXnGXyu2rrA=
X-Received: by 2002:a17:90b:5585:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38dc777b895mr12241476a91.22.1784030522664;
        Tue, 14 Jul 2026 05:02:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:02:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/10] ASoC: ti: omap-twl4030: Return the original error code
Date: Tue, 14 Jul 2026 19:00:40 +0700
Message-ID: <20260714120042.491712-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120042.491712-1-phucduc.bui@gmail.com>
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the error from snd_soc_of_parse_card_name() directly and drop
the redundant error message since the helper already logs the failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-twl4030.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 4d80f8a7a947..2a80e44035d7 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -253,10 +253,9 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 		struct device_node *dai_node;
 		struct property *prop;
 
-		if (snd_soc_of_parse_card_name(card, "ti,model")) {
-			dev_err(&pdev->dev, "Card name is not provided\n");
-			return -ENODEV;
-		}
+		ret = snd_soc_of_parse_card_name(card, "ti,model");
+		if (ret)
+			return ret;
 
 		dai_node = of_parse_phandle(node, "ti,mcbsp", 0);
 		if (!dai_node) {
-- 
2.43.0

