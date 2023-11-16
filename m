Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604F4C197A0
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 12:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345159AbjKPMwY (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 07:52:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345160AbjKPMwY (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 07:52:24 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E42131
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 04:52:21 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9e623356e59so111267266b.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 04:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700139139; x=1700743939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sL10YvM1YU8R6lo2ORtfYeaqpfTntqniPVIvmwAyX5o=;
        b=ihVyCnUpTRHHVjXCtAVkgSJwzJ5HpAaB2EsqiLwvcB/jniI4/mYMJrsdlEZPS72J6c
         HVyuRuwLz6i7zm3AICB9n7Aaezu+5Vmvvkk3/4Ol5l6y+chVJ+a3l9mXTsILbUl/eRsU
         /ZEG+E4Cevc0n1UsbVd+Y6Q7i8GOv2LT6WivwN0Fb7vSzmGTR95RUCUD+4b3QSrFztmk
         HLzvY75ijKbvrvJQRPtr4TzyzxtW6SPXWPzq2SYGHi9mLO6zfiP4RFeUAj04V+NO/8iZ
         Gjovo2N4rbnVp05f3pIIk2Hz6t/xoH2uq12qa9QFhNiKiqMY93X4Z06lil8RxvsZgXP+
         Xbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700139139; x=1700743939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sL10YvM1YU8R6lo2ORtfYeaqpfTntqniPVIvmwAyX5o=;
        b=hT2gqNgaiapnkaALUAiwoauy9YFJ0wc6VSR1Me7Jxrp+PpU7GfW9IZy2KcD20LT1ig
         f34f5O1lIHC8q9I8XsE3kIQA20ju3fy38oX2aichpWTCLBUkUSIpiCyKOeJxwF1tKD3H
         7lysI0trMr81dNh1jqREw53+eG6Sxi6YL79gF0Cumk0kbwaXfpxJtvJSwjPnRmnTM1/z
         6GOwPYdTSPNfmgqIzJ4eslK+w8614LLpIgJBELwVh6bkgxJ69zhxejI/luqCGsMzpd6b
         M8mLNvbsRpzlx3NmmxMwBNzqKfpdqstUB2Y6JY+3UMMoM1iimSUZe/J5uL64kdzjo67D
         wBWA==
X-Gm-Message-State: AOJu0YwoGrH7V77dB7VQEi+0k4P51J/ua+2jX9G0NthpYkcw5lgmf52V
        KY2iPtn6BVM+cBh4Rf6Hgh8=
X-Google-Smtp-Source: AGHT+IFUVWfNWN9IRaVZk99cLw9hffggPTg0o/XoJEFMI8KPLZveiyqq0duxoYCVGpa6E1JJTGXXFA==
X-Received: by 2002:a17:906:1919:b0:9e4:121c:b9fd with SMTP id a25-20020a170906191900b009e4121cb9fdmr12495678eje.12.1700139139103;
        Thu, 16 Nov 2023 04:52:19 -0800 (PST)
Received: from IFM10N30752.intra.ifm (87-206-74-243.dynamic.chello.pl. [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906231a00b009e50ea0a05asm8378645eja.99.2023.11.16.04.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 04:52:18 -0800 (PST)
From:   Kamil Duljas <kamil.duljas@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: Intel: Skylake: Fix mem leak in few functions
Date:   Thu, 16 Nov 2023 13:51:50 +0100
Message-Id: <20231116125150.1436-1-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.35.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

The resources should be freed when function return error.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/intel/skylake/skl-pcm.c     | 4 +++-
 sound/soc/intel/skylake/skl-sst-ipc.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index d0c02e8a6785..18866bc415a5 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -240,8 +240,10 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
 	snd_pcm_set_sync(substream);
 
 	mconfig = skl_tplg_fe_get_cpr_module(dai, substream->stream);
-	if (!mconfig)
+	if (!mconfig) {
+		kfree(dma_params);
 		return -EINVAL;
+	}
 
 	skl_tplg_d0i3_get(skl, mconfig->d0i3_caps);
 
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 7a425271b08b..fd9624ad5f72 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -1003,8 +1003,10 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 
 	reply.size = (reply.header >> 32) & IPC_DATA_OFFSET_SZ_MASK;
 	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
-	if (!buf)
+	if (!buf) {
+		kfree(reply.data);
 		return -ENOMEM;
+	}
 	*payload = buf;
 	*bytes = reply.size;
 
-- 
2.35.2.windows.1

