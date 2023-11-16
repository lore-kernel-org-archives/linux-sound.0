Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BD7C197A0
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 22:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjKPWBd (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 17:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjKPWBc (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 17:01:32 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B986181
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 14:01:29 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507be298d2aso1755322e87.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 14:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700172087; x=1700776887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y9DU8iPPpztG+f77WtVDbQ5xkLxfUk+3E8kOK2eG+Q=;
        b=jmH7CxsO2waACXWJhHGNXQDi4Fqw9/xt9OjRRO495E/2kX0HTJBXraccYSaYjuo5JG
         tDd9q00TBf0fIEjCHk5A6HBo21Z4lOL6edL3uQzoXuRB0CFIMToOfchjTsOzKnDh/z2O
         xH617Ws5AkR+IZNKurAU328GNfXXY1x3DAk2FH5aM+8byA6fuq0y5A0axSNKdlu6QjIS
         7hl4DYe8kMQq1t9Zz3zXS2RWB4JeEZPf06KkYb+0BK3Zp6Gofv/zC0royETUpQuxyy2W
         xm2mrtT3VLkhwSPShgsp41VniJaS1zN/AqPREthskGQvetJgiCxvTQLh07N9z7V4OzuB
         3HUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700172087; x=1700776887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y9DU8iPPpztG+f77WtVDbQ5xkLxfUk+3E8kOK2eG+Q=;
        b=MNRIocGTaCDguO1jc0HMWo66kzXwLOU4iku2pqsZCWnwrZ03HK2PPTuMKM7GgLV4hZ
         CCnHhFD3ScoLtDX7QT/Zkq4nZLswg9D4FY9LOIsDXq0hn59rqTnweVSaCOT1q457EOJ2
         TS1yI6lyDZzpH8f68xO8GL985SrBvAyyEaAqdCB+wjueH3XaRtgAvhRPBPWgbClFHkHJ
         UghWyvZ8BihNLkE7ANBbNy5OR9ECo8piPUC3/zQL4hhRDSlCz4OL3wmURU0sHqj8EkSJ
         gm9aM1Tqi6oAhce50q4af4tkyKB0coQLZPSd3W0wCwPRodG0Gi0DvubuaX92Q6HZh8e4
         QhvQ==
X-Gm-Message-State: AOJu0YzvK/m6UoJQmqIJV169Sds1ZYHFMpVz8gqin8R5rGkHLjdYLEM1
        6337voXlvUcN3gfdeZJhIXk=
X-Google-Smtp-Source: AGHT+IGcXXb7T8Tz0qn0ou4E7i88L65qNLWRa2dAPZ2Mgj7FwbqtHwDnrjIBT2bigz6SfJllA9JVBA==
X-Received: by 2002:a05:6512:234c:b0:500:7685:83d with SMTP id p12-20020a056512234c00b005007685083dmr17360520lfu.48.1700172087214;
        Thu, 16 Nov 2023 14:01:27 -0800 (PST)
Received: from localhost.localdomain (87-206-74-243.dynamic.chello.pl. [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id v15-20020a056512348f00b005079a61a182sm29431lfr.143.2023.11.16.14.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:01:26 -0800 (PST)
From:   Kamil Duljas <kamil.duljas@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>,
        sound-open-firmware@alsa-project.org,
        Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: SOF: icp3-dtrace: Fix wrong kfree() usage
Date:   Thu, 16 Nov 2023 23:01:03 +0100
Message-ID: <20231116220102.2097-2-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

trace_filter_parse() allocs memory for *out and when
-ENOMEM is returned, caller function, dfsentry_trace_filter_write()
trying to freed this memory.

After this patch, the memory is freed in trace_filter_parse()
before -EINVAL returned. In caller function removed kfree(elms)
from error label

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/sof/ipc3-dtrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 0dca139322f3..93b189c2d2ee 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -137,6 +137,7 @@ static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
 			dev_err(sdev->dev,
 				"Parsing filter entry '%s' failed with %d\n",
 				entry, entry_len);
+			kfree(*out);
 			return -EINVAL;
 		}
 	}
@@ -208,13 +209,13 @@ static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user
 		ret = ipc3_trace_update_filter(sdev, num_elems, elems);
 		if (ret < 0) {
 			dev_err(sdev->dev, "Filter update failed: %d\n", ret);
+			kfree(elems);
 			goto error;
 		}
 	}
 	ret = count;
 error:
 	kfree(string);
-	kfree(elems);
 	return ret;
 }
 
-- 
2.42.0.windows.2

