Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C264071DF
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678924; cv=none; b=U9aK1QjmrwCyJCKmVDf8/gp2jAukJvSkchAEN1fkM+N4GNMaegZWvm3I7WiaVRG4X1oKQFasEDZEjG3wyU+w4SV4ZNmdJPJ2KjtWIVL6ULJ7CYJ1pKh6iqHop1J5QtcqPzj7oawstMNVRVwlZIg23IBuSs4wQz0436baRkWLJcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678924; c=relaxed/simple;
	bh=/lWqMzub7I/4pmp2JnBqOYFglVzfcpTB6DebdmZGAy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAzlZqc9dogddZEa6I6mBF3Q0YKEMDoYKXth8ARGczZwrBFWiz0WMfJGWVk3hg/F7OFHvpw/NDIyZPkGLqSapL99f+HRbQcN3rK3xesb5qYQZnLEPLBwK/aBMxfQBOfzqHjHyGJZ3QwXpBZ2EhWKf9cjEA7nHwSsdhcesLiaJbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnyJJBN9; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnyJJBN9"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so963111a91.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678922; x=1784283722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6S+nvthRJHE/gqft8+ojzysfQduu/D47Hr0LnA3Vlg=;
        b=MnyJJBN9kUJ7AAfFPA7rFS87pBQeQDi4u8NE6PCCyHTIPAD4EMUVoQ9sdeTGA+xnnz
         d90Gr0U/y3lUWc//GRlX8XwUsn2/W79IwHmKJ6FyosQt6/roBKgdcJgOwxj8ULDqIFWW
         Ek8jvxbSXaP6YMIo2iIS68R/KzqXxkr7U7/S8QyCil6fPKdV6JWj+9Hpf63j4eoeVPCI
         JTeG6hFozAr0FAse8WjkkwGsayE+o62SC6nTzg7u9JHph3iIXFs70WheDARNEP4teoxs
         +b1pj43Ya2vuUuoH6xxGznbSOXOI2fbMwxXFEIUU5nXdhRpDRzOdyGTDkpMiXx7wiflE
         W4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678922; x=1784283722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6S+nvthRJHE/gqft8+ojzysfQduu/D47Hr0LnA3Vlg=;
        b=LsLTD7PJoskyX7l9AxNeFL3/8nxL6t6A7B66eNAVmNnTWeniFJwL0wf0XOmcJd7P9t
         bVagGH1bkAxUeHxz0x+b3Gh3BX6Ki9a2uccbNsLR1Mp03QH3vTwOozgkVWPBcEB3uths
         pO1ss55wQWThRMHdkBEwSBPLe/qJMgvjM9kETA31DPrFfKjc52Gm+QBgPv10Ur64rwES
         30tXmfkvwq20cEFEaNXgn9K8+jBzkbWOzC9P7FvoB8FBR3MM5TKAChRjvfidbdWlrzCc
         ck1pt6PZGzBqUgHx8cEIAK5OaKB8bEi8gdjR0fDlpo8kctXPCsKhJSqfG6nYPVb2cC7k
         0L/w==
X-Gm-Message-State: AOJu0YxvBKgWyt8EWqwWvFdnON6/XZYjRmeG6mzPqVbwoSS7yUsPhXbc
	8CMiMIIN8alErchGfGXsrcuoBNkUdTYTxIDdjqzTFxbWIzO9MJUX2np1
X-Gm-Gg: AfdE7claa7fRjVeLDnUYIVsJR8ED8wF7Tw4n547Fv0VBf4KgIKtA7WaVa3t9zRvz5R2
	qi33SZUmholKKXSakMFPyxF8GdQXeVvs5ouvFhoDuJ1asf0SXd+vR5q6HFRxQqUYu4KoXN1l2Yz
	HLDmC/FYX27q7UefVqzdhnUgvBvB7uIMkOBYP8cGVKlozdxAlzDrXSgW2fmDJYBQ8yKyJ1RJ5PJ
	pP3kOd6Z8rCP5yZgcOHhNO54TXNZV9fiari3F0GSIcg6bVmAkymNKKuNBp0tjNTgiraPxbfPxAy
	/yzGEQZ9UNRPUGCkb3ZNILM1Ne0DNwZOZsT6LNvttQeyRqugdDMTpiJu76dhzVvb6VVGLDSWo5o
	2lNsyebjWreJ+IOkbi1BOEY/53MWbPZs2yO1PWsdfRgfz/vU249bnNadAX9lPc1YwhG2EzgEjvY
	X3ReDXSiQopulY1WHMECUoVo6SvJ5Q/JfAgmhAGp0RgAY8b8M0Y0flJN73gA==
X-Received: by 2002:a17:90b:560b:b0:381:bc6c:25b9 with SMTP id 98e67ed59e1d1-38943463158mr9847157a91.31.1783678922024;
        Fri, 10 Jul 2026 03:22:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516abffsm2490240a91.4.2026.07.10.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:22:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 17:21:36 +0700
Message-ID: <20260710102138.29347-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling where appropriate to
simplify the code and properly handle deferred probe.
Also remove redundant error messages when the called helper already
reports failures, returning the error directly to avoid duplicate
logging.

Reviewed-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add the Reviewed-by tag.

 sound/soc/xilinx/xlnx_i2s.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index ca915a001ad5..0676da122edd 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -185,17 +185,15 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(drv_data->base);
 
 	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
-	if (ret < 0) {
-		dev_err(dev, "cannot get supported channels\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get supported channels\n");
+
 	drv_data->channels *= 2;
 
 	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
-	if (ret < 0) {
-		dev_err(dev, "cannot get data width\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get data width\n");
+
 	switch (drv_data->data_width) {
 	case 16:
 		format = SNDRV_PCM_FMTBIT_S16_LE;
@@ -233,10 +231,8 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &xlnx_i2s_component,
 					      &drv_data->dai_drv, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "i2s component registration failed\n");
+	if (ret)
 		return ret;
-	}
 
 	dev_info(&pdev->dev, "%s DAI registered\n", drv_data->dai_drv.name);
 
-- 
2.43.0

