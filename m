Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8761CC5AE5E
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 20:17:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235733AbjKQURx (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 15:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346193AbjKQURt (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 15:17:49 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9543698
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 12:17:46 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so3557730a12.2
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 12:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700252265; x=1700857065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mi8ISTsArPwPL7ga5yoIlC1IaD5VKkkH/FsrB8IjmmE=;
        b=hI1AJTfLDm+DG3MQytzw2XAsq3Gd3RKKfnRW5LA4yLXOK6jawqId0Zra4xwnCVZGx+
         euZ0dC321usTRtz54S81eoIffC91rwBEATTkvWBVYF9xpq24Yf0GVwsmXOGCN91CC1td
         VrJxlP+uuMrHLcZFrObbka0aRHWxzUe+PRjtyDj4brToPYQ0moFpdSIhnvERWfLgtz2Z
         Qmp43c2gchxoYVvWmgXCmtezpXXmjZmxXfLzD70CjC2wvtq+xj9fCQOfCLHLOz0KwbRm
         FT8ezX5Z1cmMI414JQXjKa0okxgK/MMTi32upujJLVROc4Ep8soggrBFSKVQjnfh0uV3
         L71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700252265; x=1700857065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mi8ISTsArPwPL7ga5yoIlC1IaD5VKkkH/FsrB8IjmmE=;
        b=swCbJxs2Al9hmeIsCiMVYghnpE3hl7vWUqVMNJtH2e5Up3WCC52/GUIF5CDfuONeii
         Go91Ld3C1hPCzt5Kx8DGkP5INVX5mQyyY44dnphGGi0eQCDW52W063Ld3xbxaFwnrpJu
         44b2nez89qXGThSStDXxEOVl1ucoFeA6W47tUTWa6Y8DcwCCdvxeUEymRXOKc/zYy8cF
         FiSiRndNHxXIxRVISwB7HsX5YEd9GpJuq0Np1D5aBKButNIKxxW4NKSkkjiNoJsW6h3w
         3jXcKkbm0Py7kJhF19KO6euI8KkntdpN8K3ciHExK3AF2R+h+Ncc1tQfxgyHdJulLIF/
         S1ig==
X-Gm-Message-State: AOJu0YyYOon5aFkwL91LHTDnbwJzaVSJOjFn3QVsR3ArTrYqsX1ffKdo
        EwxjrCiLW6MpBKGg9CT+nxdftT8uYe4kTg==
X-Google-Smtp-Source: AGHT+IH77hFHX8GrcvjdUH4PXScFsQ/iLIAG2r073PEHo2aTsPknOHJfSFQ+lDSsNeobF/G4qA4rpg==
X-Received: by 2002:aa7:d409:0:b0:53e:7d60:58bb with SMTP id z9-20020aa7d409000000b0053e7d6058bbmr79671edq.27.1700252264798;
        Fri, 17 Nov 2023 12:17:44 -0800 (PST)
Received: from localhost.localdomain (87-206-74-243.dynamic.chello.pl. [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id e10-20020a50ec8a000000b00540e894609dsm1016175edr.17.2023.11.17.12.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:17:44 -0800 (PST)
From:   Kamil Duljas <kamil.duljas@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        sound-open-firmware@alsa-project.org,
        Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: SOF: acp: Add prevent against NULL
Date:   Fri, 17 Nov 2023 21:16:06 +0100
Message-ID: <20231117201606.1955-2-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

When kasprintf function fail, then NULL is returned. The callers
dereference them without null checked.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/sof/amd/acp.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 603ea5fc0d0d..c60a3e28b5f3 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -548,11 +548,15 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 	dmi_id = dmi_first_match(acp_sof_quirk_table);
 	if (dmi_id && dmi_id->driver_data) {
 		adata->fw_code_bin = kasprintf(GFP_KERNEL, "%s/sof-%s-code.bin",
-					       plat_data->fw_filename_prefix,
-					       chip->name);
+							plat_data->fw_filename_prefix,
+							chip->name);
+		if (!adata->fw_code_bin)
+			return -ENOMEM;
 		adata->fw_data_bin = kasprintf(GFP_KERNEL, "%s/sof-%s-data.bin",
-					       plat_data->fw_filename_prefix,
-					       chip->name);
+							plat_data->fw_filename_prefix,
+							chip->name);
+		if (!adata->fw_data_bin)
+			return -ENOMEM;
 		adata->signed_fw_image = dmi_id->driver_data;
 
 		dev_dbg(sdev->dev, "fw_code_bin:%s, fw_data_bin:%s\n", adata->fw_code_bin,
-- 
2.42.0.windows.2

