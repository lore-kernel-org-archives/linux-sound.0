Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA54377EC2
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659768; cv=none; b=HdonuiL7vI9LoTVdFAnwq18W+h0DlTK/1/+V1ta34XRjMzIUicReR5xIVi1IzN0O9r439CK/KXzsuwebj0snw1avuSFarn00nYvUa53yikFQUi1b1Xkr57aJNuNTf4Uw3pLo/0VXVb++iq0F/sUKoy2qGLCjANtFm1wowzLlC0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659768; c=relaxed/simple;
	bh=Xa8yF/IuLRLtCtMkxppwZASR9ScQ7OKF5bveI9XEJgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpSJ8dm9ekCeqfkh+x+DWSnW3YwaRk3+s/pDI7DwN+vzBVx90Iaca9ZcSdNxXkJwV9F2faACpsML5SckXr45uttc7GEdS5SJVCcveIlEXO/llqSKW0sPPnVT2p4pRcKpHS+bJHA3sg/AO4wUL5CaJzWYqgozG0i0S7DQSt83A1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3kJAbxa; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3kJAbxa"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso708180a91.2
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659766; x=1784264566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpEEKAJp3BqSZSJR3hfnA3eBxaF2LazIySDJM1KKJg8=;
        b=n3kJAbxakCVF2Z8SjKvfn0tZ06s6Ve8WcedYlaDfIkfEAe3YPTVOhj95n0I6+LXlrP
         K92Q/xSe8wGTLDN5QP+10eN04y+RqQLDk0bLM4Xn0209chV0TTZqXmaGLzjcrF4eiZzh
         qBBqim1nfhnzO/78wWXrtinqHt/tRO7xIyu7iKVnHS5wvhqO+VWKt0ShJ9niSvPQ1DxI
         OvvtAp6GEW/WJ6Ud2Rkcj65xCzg8LopZb71zy0RXvSVfk3N2K2fVgIaM2KPxJRIpCkrn
         UCybQq6kpVl8wcMzNw1s+JbZPhE7RQP1Bu9w2DwB4///B0weeh20Td3jsaSSpeNs7NQg
         mjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659766; x=1784264566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpEEKAJp3BqSZSJR3hfnA3eBxaF2LazIySDJM1KKJg8=;
        b=BuHrcePzkPjAC83oVHX92zV0RWe9AlW2RtyA+uRQOV7B+zHYoYJURO0puvTJAnkMay
         jzh+wk1Y8cBXj+4AeozpV1fXW+44t+uxZHgcULtFC7F4WvSdKyUd+409VYBFixDjwLmG
         zhRqNLZul6Mq+yX1QUsQALxsrfLycdF5e5dXGsNHw1MAS1nA5pDL9HoMxpAu1ReJRUip
         /6Or9SZpGzr2Npr7os09Ac/Ws2wqdNMClrzu6SUMZfhwkUpWdvDQnqt7+sv/wOp0pY31
         1ZRuY9HSxmiYgGsM67J+2z2Kl9DWXqOTA43TkoUhjOQUXNwbm61u9iZgI+SbBimfOtNJ
         kFMg==
X-Gm-Message-State: AOJu0Yy82GoRz4su0kh68qhqu+gdUTm2ZMr2eLmO1lj3UQ+tlVmLChwp
	4UEN1rO8oIJlJj4DeHUNGmz84d1GxD0HY04vEXAbgYo4QvI2yEDpn8nm
X-Gm-Gg: AfdE7clZZFRCjbfSfY9zubx0DWxG9as7dRFkkGg0AFJ9dxmWUejYBzP6jLnUPHg8NMQ
	MYX+DUmYUSXPdqTtMzrlGw4CkQ254D9k80aUgNzIT3ftCgDEOlC3a2WeZPlofshb/SID/clMjLD
	KJZUQg8zy6Iv6kK0b7BHMZ7Oo3uduV/XdPt6QjeQ98WzzHXs3XYlSTyJXlbkdgVIwDPpvoXNCsR
	tha+8gBJ+IY7aJvE78H4cKbhcwVs59RicN2FOSkyf3eHm23RE81VOqvZQGY7LsnISWttPfPcOx6
	7bSfRtiRRHlsiHMIP6hgrnjosTfIndPfIU0ul8RVpBiq4Mwq+nl/kdQMB4RlYZF8nYLqv0lf5Vw
	2YvapSuZqyGNwDZtcZu6a4Y6uR5KAf0Xngo1iAdCs9KE92iEgAEYVlY2OTHldHqKl7tjCdvJtSt
	WRtW7cj/OvE2sTR9dNUIHcZxLvUYfpG5IZd7HYv2YMxzQY448=
X-Received: by 2002:a17:90b:50:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-389407321b5mr9590297a91.16.1783659765935;
        Thu, 09 Jul 2026 22:02:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad85sm2139647a91.2.2026.07.09.22.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:02:45 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 12:02:22 +0700
Message-ID: <20260710050223.14266-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050223.14266-1-phucduc.bui@gmail.com>
References: <20260710050223.14266-1-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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

