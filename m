Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928353F6600
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192943; cv=none; b=PfklqnAqXTiQFBPgoxg3GxrsN6gly4SDb346FnrXiU4v9+4IeazOztBsydyqEmmpywaLazxQWvAC3A96Pn1syz65NqjziSq23Eq3V5Mlw/o014neDAz/TAFeRClfn49YazwMTOzClaOUooU46uBqlDgSvjzUprkvShtmEPP3nTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192943; c=relaxed/simple;
	bh=57NVq0S2AlHmeh0L3SJpPKysGLjaiNdhbzGWZRlh98Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqE94kqP7fknV74pzVCcLlHzuCmK/506xKVZ0jjIeT045YOlDgFSXdzp6ER2jAgmorAVenUSNnsJEZjC+AiEP6XhRnnzZCIKOxMzT1l+Q8EJQ74X8cgd5tbMDL2Ga8MjKjVUbnStMKmm05sN0EIAYx0l59ahrPjByG3XSSP1VOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3BKqW3K; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3BKqW3K"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso3706623a12.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192941; x=1784797741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAFG2wBH9r9TrXOu1Xguqk4pZPLZGhj2LPXn115L7c4=;
        b=Z3BKqW3KMGONdfARxNOWYPOm94NOVsspQ9PIf53shbrG7PrJaFxwSviZwfWPh5uIbf
         aQ48uTvCHPviRtyMdJG0U8wboQmHoolpc+vn2jdloUMq7pnxP7nbpdw2eID0gqPyzyHX
         vkI9TO/tDACTpy6N7ZxHieWUqcIgRtWHSFtG41wrGvMEiMIPN0TREVxL/bmhaaMM91Q5
         gEwpo5NCUDDCZZODf4MXbI2N0l7u4SrYuIwdNn4mls+aqNHMfmXjbLWKDNcLkRgx5q4c
         NSe8Nl8o282NtvG4JlsVx11wjt91CKYlkLfNhdt4ekyLHHendl+OvDCf/yP0ZfGwXWQf
         mMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192941; x=1784797741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAFG2wBH9r9TrXOu1Xguqk4pZPLZGhj2LPXn115L7c4=;
        b=PX9ULd4+djsefbH9GfyV8PR95sWdR8EYaCyXAD/aYN/tN0omYTreOJyifgPX0dd8Mp
         3S8lCQWLaKrYwSPd2N0uTdxMRESsh2stm1m9RHl+ERDlm7beCsVBB6u88/R0khvwyagj
         FtuvnV351cteN17tbnMr++/kM1sVpcBq4sMxU2+vXe8hZPebMxeByRnaDyX04SD4scyv
         aFYKD2zgWM7EqbvAedXT9gRsMm7uAIXWd+22ItrbJyQbmPKgQPIQVoJeARdjbr9Mnit5
         n/5DRWh9miOQhSOqRQPpnljKmVNrOxmnI+HQ5uA4PkFBdRvwjtywMn7rPC1degq/4E+l
         szjg==
X-Forwarded-Encrypted: i=1; AHgh+RqrEy7EgCOGXc3y5OcVjNh1hGVAeLRVCOkQWHLl+I4JjbVkZkMLCQLhcKYtQ9HfgF7AiJyRSrC27HrAww==@vger.kernel.org
X-Gm-Message-State: AOJu0YywjwZ9Pd8O+6p2SnVfn5ruQSiFI6xSFQyS4AKOebqEVvU3NWYl
	s3A2bKu9rmxujAUzR92cy0Jwy+zEGL7Q+HTf0+meo0CeWKoWY7sDeF7G
X-Gm-Gg: AfdE7clozRskzg+U2Grqdpct4MEeiWMOSIBLZV1vMAz/iJ+KVoAtzmmm+2BxKrHtxQV
	t3HObYSSMZsdkbEFH+om2kvFf3sBuvF0QjWeGk1pBOWALBIMcl9kaHWxGinqLapAxd5dkwsh/OE
	LclC2L40VPK+TWeZteAqSEtrpyRY5+QvBYBaOrBB6Bu4N16XsI2p5EeaEXDte6ccYsxe6CltQ3/
	hxHmxXO6JYerQifq7Bbye6AypfQaEPlyLImFfrLeEgO3v6dKnIvJqiX1Af1EofVlAAHJGEyFcPU
	PijNCRzQesO4QYgtyAxgkaswBQu+zhAUgeXEKnqRjfqYyflmBTWZJuX2JQJOTi9fpMk46GWNhCg
	ZLc2uFC/zUAfa9+8JPb2Hhl61kwl37SdhIgoTmco0C+A0YWA4viSc7vdxcqxFRzh6Yt4S0Z9b26
	iNb14A1qEXyjbEeeDbzjM8bM1UKNpAvBIoUxY5
X-Received: by 2002:a05:6a00:f92:b0:847:80c8:dfdb with SMTP id d2e1a72fcca58-84a6739cf29mr5798838b3a.55.1784192940913;
        Thu, 16 Jul 2026 02:09:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:09:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 04/10] ASoC: ti: omap-abe-twl6040: Preserve error code and drop redundant log
Date: Thu, 16 Jul 2026 16:08:23 +0700
Message-ID: <20260716090829.72082-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the original errors from the OF parsing helpers and remove the
redundant error messages, as the helpers already report failures.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-abe-twl6040.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 56aa4b22083b..dfa931071d81 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -234,16 +234,13 @@ static int omap_abe_probe(struct platform_device *pdev)
 	card->dapm_routes = audio_map;
 	card->num_dapm_routes = ARRAY_SIZE(audio_map);
 
-	if (snd_soc_of_parse_card_name(card, "ti,model")) {
-		dev_err(&pdev->dev, "Card name is not provided\n");
-		return -ENODEV;
-	}
+	ret = snd_soc_of_parse_card_name(card, "ti,model");
+	if (ret)
+		return ret;
 
 	ret = snd_soc_of_parse_audio_routing(card, "ti,audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "Error while parsing DAPM routing\n");
+	if (ret)
 		return ret;
-	}
 
 	dai_node = of_parse_phandle(node, "ti,mcpdm", 0);
 	if (!dai_node) {
-- 
2.43.0

