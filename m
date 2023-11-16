Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C14C47071
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 21:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjKPVkH (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 16:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjKPVkG (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 16:40:06 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B1AA7
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 13:40:03 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9f26ee4a6e5so188728166b.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 13:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700170801; x=1700775601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3icMdxmKgmrF875Es9NP4wIAe3Sv8Ur+LUuEGA7jjU=;
        b=PAKVZTuX/DWb30hoAAXBeyD/wXDrfy82OdQ2qBLCjSxwxpNcFKgJSiyeL+qyPP7EGe
         gJtdbxUanxrmiANWo89s2xAKNll2qJBHR0mJpabYkpbchPNIoAvRu5CDy/mYpzoSVszk
         Dyg1JH8dI7sAqFYK+6mJjUQTQqL8m/z7BYLZwanHrFrbGDy4kZW9Eh+v8LrFc5h55QIp
         Rg8jaqVv/IgKe/uS23LaKYAui71Ha17ZVDtsSvuGAvHXJq2OyHw8ga029cE2n0B/YMkr
         uPQus0EpERlUg3g/r3pfW+wv4vbo1zjTyp5XUsMQvu3DMk2z3wN2zNm5e9F4y51Uxnu8
         dx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700170801; x=1700775601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3icMdxmKgmrF875Es9NP4wIAe3Sv8Ur+LUuEGA7jjU=;
        b=dJGc2xsZyq4M5HmrgOG9aTZ56791BDxOjPoJL3CmB1vJx5Pp7/S0aH9vkcQNV4+qIu
         0q/O0CJqeZtga2lBqmJjj0RIb8QYAz4byt8tIXmfRt8Xi6KsCWxznSOBvZJ8KqGk2XGt
         jMB04dldvDDJbLsopjbUktLb0LpTUeY5agkUDfSqIOWJ8t6uzEd2xmzRdlVjYSiKK404
         PIk9+3SosGUMaNi2c25kj+RdRq15kbapZBTgwdSOqgc/e953+4JRqtJTOvrCYN+MW1Xy
         sil74sH4H5edKke2zCvKaUT456jXN8nym2didmmJvSrGlTZ13PbEstJh7PcjdstUEiI4
         3dPA==
X-Gm-Message-State: AOJu0YzQ5ROYrs78AKcK6Tu/w8iX3s+Un7E6oxHboa/BfRS7rJmQZJI8
        l9qKiQyHSjMOmzvVz4dhFfueFfNEw+IaFFZl
X-Google-Smtp-Source: AGHT+IEv/WqgQp0fzs3MYmKZlvrz9LqfpDN/sWUJ82CoKn8qve9khl8T6oZD8pXPjY0kcnjKRrW8qA==
X-Received: by 2002:a17:907:b9c3:b0:9f3:18f8:475b with SMTP id xa3-20020a170907b9c300b009f318f8475bmr5915340ejc.62.1700170801550;
        Thu, 16 Nov 2023 13:40:01 -0800 (PST)
Received: from localhost.localdomain (87-206-74-243.dynamic.chello.pl. [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id ka13-20020a170907990d00b009a9fbeb15f2sm79312ejc.62.2023.11.16.13.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 13:40:01 -0800 (PST)
From:   Kamil Duljas <kamil.duljas@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH v2] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
Date:   Thu, 16 Nov 2023 22:39:17 +0100
Message-ID: <20231116213926.2034-2-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

The function has multiple return points at which it is not released
previously allocated memory.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
Changes in v2: removed wrong usages of kfree
---
 sound/soc/sof/topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a3a3af252259..37ec671a2d76 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1736,8 +1736,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	/* perform pcm set op */
 	if (ipc_pcm_ops && ipc_pcm_ops->pcm_setup) {
 		ret = ipc_pcm_ops->pcm_setup(sdev, spcm);
-		if (ret < 0)
+		if (ret < 0) {
+			kfree(spcm);
 			return ret;
+		}
 	}
 
 	dai_drv->dobj.private = spcm;
-- 
2.42.0.windows.2

