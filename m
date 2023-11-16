Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DDFC54E76
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 22:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345568AbjKPWlq (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 17:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345563AbjKPWln (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 17:41:43 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894FCD5F
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 14:41:39 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9f282203d06so197417166b.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 14:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174498; x=1700779298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkYOsjbO3YnBcAkSwiI6Lkt5UTyKsDvNbvGkwXIl22Y=;
        b=Gy59TxaAat9ApgzMubQ2LgdyuYY4qm14SWJocpAAmg01W/mnLhwISExjnlHWdTk+XV
         bz2A7/byA3I6QwBP927Z+/tCBMT5TWW64Ca/kXYUCrv14pQi6CQGW/4recTCkSKqtQ1P
         ZdBNs4fN1NwxRHaF9M1ClYk0VBaR3BdqfbeJLsFCsIFI+2070z01ASBZASlztYHjKSzI
         r7GITleGVNPJbPg9jyFJu72541mkxC20lH+dZj5n2TKrnt5+cgUIVIBme3jBOUM2U93/
         QZX1RlMV2vTmEQV5Hg+kaXMNUV/pzkrZx/RKsJSQ6r3vkw6OOzoyJ3kdAt48Oco6FkQy
         AY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174498; x=1700779298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkYOsjbO3YnBcAkSwiI6Lkt5UTyKsDvNbvGkwXIl22Y=;
        b=DoDtcILoIgBDBXE6D3jOYRe8/SMfipsEo8OgrPOUj6BF7R6orA7a7BYZQltRTicn0j
         YM4j/nXTfNDY8v5E4v6vrqCt+aa46eUSaX6EmreIB67WsM6r+2vbuDfdsNrCa6+DsLBJ
         toR67NFQv8vbjp6upJr1l4fCSPCHicwW6tDkPsrx4v2xTB4RJ/KJnzrrYQJKEG7g1JgW
         qGrcSA742IFAewod318h+3hmkFsIQB3VdimZNQCuOwZeA17yBhKz2fkppHHNWbgNBiKg
         qrqZBRVK5V850a/PGS45Ttz0M9Kb57Pma+NZruABcyc28N45JkCh3pNi1kbkjszfdAEj
         pZYA==
X-Gm-Message-State: AOJu0Yzp+OnCD1GOuspqSOrxWTsqQLdinWUzJwAwW97ZaU6rr5h/mqjZ
        tlvloOmM8Or0D8r6bWhG3Vx3fUOgGoQ2/W8c
X-Google-Smtp-Source: AGHT+IEA7sEQNhqIZPT3K6xZTA4L+cnbuRkCp6N6sSnDsqse8+u/YCYPLchwfyukXsn/2HNwOo4tGg==
X-Received: by 2002:a17:906:d201:b0:9cf:18ce:95e6 with SMTP id w1-20020a170906d20100b009cf18ce95e6mr3042773ejz.62.1700174497947;
        Thu, 16 Nov 2023 14:41:37 -0800 (PST)
Received: from localhost.localdomain (87-206-74-243.dynamic.chello.pl. [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id um13-20020a170906cf8d00b009c5c5c2c59csm118829ejb.149.2023.11.16.14.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:41:37 -0800 (PST)
From:   Kamil Duljas <kamil.duljas@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: Intel: Skylake: mem leak in skl register function
Date:   Thu, 16 Nov 2023 23:41:13 +0100
Message-ID: <20231116224112.2209-2-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

skl_platform_register() uses krealloc. When krealloc is fail,
then previous memory is not freed. The leak is also when soc
component registration failed.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/intel/skylake/skl-pcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index d0c02e8a6785..e2578ee001ff 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1462,6 +1462,7 @@ int skl_platform_register(struct device *dev)
 		dais = krealloc(skl->dais, sizeof(skl_fe_dai) +
 				sizeof(skl_platform_dai), GFP_KERNEL);
 		if (!dais) {
+			kfree(skl->dais);
 			ret = -ENOMEM;
 			goto err;
 		}
@@ -1474,8 +1475,10 @@ int skl_platform_register(struct device *dev)
 
 	ret = devm_snd_soc_register_component(dev, &skl_component,
 					 skl->dais, num_dais);
-	if (ret)
+	if (ret) {
+		kfree(skl->dais);
 		dev_err(dev, "soc component registration failed %d\n", ret);
+	}
 err:
 	return ret;
 }
-- 
2.42.0.windows.2

