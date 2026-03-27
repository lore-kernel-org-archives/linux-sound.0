Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3E237FF60
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639855; cv=none; b=MhzPnsQOcfhSRFmA0Knz0CPfUGLxc56iv8Qsz6MCw/fwvmrwdCXJbjL0FF/8H29ZDq2ZasmTGlEnXD13wtz95zHFjfampgay2gZi9+QyCs2GSJZPe1DJ5Zci8Jyru0brS7UavnMpVnzwKTIvVdPe9+z9S+6aWN4za84cjS65Nuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639855; c=relaxed/simple;
	bh=92+MxE9SEiqswIswB1QejRLUIDn30JoIRpdlHoppd08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUcSrCJpjzRUvvVTq60lMBK8S59sGjGoV+ZnQCNd/fUVB+gHt/A52LviRSyhMxbLmS8gMBr9CErvlYi+GB6wo2K9brY2o+Oq+6LcGhnn4GqXouKDx86jkmRRzoyGBv32n8ojDtCEg6Pi+rZcTVfVL+A+9XwRWVfGXdnxqGxP7EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pz+uADq9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pz+uADq9"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82985f42664so1522967b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774639852; x=1775244652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTEZ8G0K2uJjezFm/TO5VfHbEE9noX99ahkzaPJskNY=;
        b=Pz+uADq9Y2Clt6SVgI8yp15SmEfUlRJOGzTEWbsniu+V1mdNI6+Z60Xc0Dmran1xxJ
         lA4KP2se74vdZxtRbkLbRZSP9qK1/BbuSgP9CB5Ci7e2QFQtB4upT+VxwtHEM7vgqFnB
         akMqT+zDZq3JhQF2B+/IMb8Sh7t1xbSafkJvWibuuf9FOGVXz/GTezVzljCodHq6tRTD
         b2jYeM0xWF72TaQKgxPjPquC6VTaTdUPzxsI+ZJwBNZ2XNzPY+LE154mcZDF41QX15Zs
         ia+7at0fNkQS8UWBXnvZe8hjfmRgKNVhZQYCSaupIXF3Ag4W3WTzzKF+0e4Pbp/gfF8+
         QF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639852; x=1775244652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kTEZ8G0K2uJjezFm/TO5VfHbEE9noX99ahkzaPJskNY=;
        b=RfY6/mASfl4X+mK6Msy9ujs8PLfP3OhyktZX1NUadEZIoEHr7ermzgX+DikksbYr3H
         72DCFIyF5vP2JJ6kfb/gX4R9+cnCdpbinmKts40vPXt7Sa0XWW2/RT40T41K5egaFCzi
         lsfeNHCTTYP7FA0j2kcWRVDhpuzJOEtlhZxL0FDTelZX+RZIs/LmQeORdEjPtRiFjsJH
         lhdJaYqb5c+x0d2z2Wi1mlgIQtOHqma5f3vg5kI1bEI6tNkPsgsni5nYwhLLcWpqIB+n
         QGdJZnwLY8DIyMMu3dZoMTwiILc7uUHLNCazpZilfys0o6G+P9jAByWRIj1aDADmpse+
         zMWw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ6vh5pG7kbjW3mbM/yxas+1hjF+X5wb3Br8hbcp8bGwWszszYokpcZmvyYbNuZCpYeyfL4zgYXsN8yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxecfQ8WVz2cVD3js9Zq7Vt1hp2bNaiRjp/sPPMiDNHJUz5p2xv
	ytraUSmXzK8t4iUzWmegbJ72MnedkSZ3Fbr8VDEWqXcwTfcy+6JLVbmB
X-Gm-Gg: ATEYQzwZ+b2B7dw6beS0tPyiAQJckkLlvidbA3xbFUiAfeZM6HsKkeNMIWzV7dw3Lc8
	6/qfIMYJDIOiDuwYVqB1KYYRlSpIU8gJyeI6R12KO9NPoQmkdYpyi0xVBQzSP0LvKpjrAAGTTll
	6zRQe24JVw3yUUFFE8SEf+09s9XJYQBSnLhjvO4yZibDo0smbUcSUCZ+4spcAcHuz5/HZCEWVDD
	ooHa6KrMbPl264cXy/KO+wQeBzcDKazCv7taSvI69r3d1zHWvgeBi3r3aaIaJLK6rYz6Py6cLly
	Lys0fqpGyDyZSC0N14UR0SzT4QEj8uwnZ6ebvTUQp3gvt6CR2YjdOdbIw5TXVnfHBWpmSElwMAh
	BNkU9qIhf+qi/pKYY/xUHHSMeRUh4JMBGwvgmtSYXP9lClrB/SfyP0M+rQp5KtDbw6xCaNG4n6j
	vjoGPnZPdmLvPk/Tyw05K5kGSoD8YSYE3RVCFmPXEFGQ==
X-Received: by 2002:a05:6a00:c82:b0:827:2ed6:888f with SMTP id d2e1a72fcca58-82c96035be6mr3435922b3a.54.1774639852029;
        Fri, 27 Mar 2026 12:30:52 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8466e01sm25136b3a.20.2026.03.27.12.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:30:51 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH 3/3] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control
Date: Fri, 27 Mar 2026 15:30:02 -0400
Message-ID: <20260327193002.423897-4-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

If snd_soc_dai_set_pll() or snd_soc_dai_set_sysclk() fail inside the
EVENT_ON path, the function returns without calling
clk_disable_unprepare() on ctx->mclk, which was already enabled earlier
in the same code path. Add the missing clk_disable_unprepare() calls
before returning the error.

Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 359723f2700e..e5806dc16ff9 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -67,7 +67,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			ret = clk_prepare_enable(ctx->mclk);
 			if (ret < 0) {
 				dev_err(card->dev,
-					"could not configure MCLK state");
+					"could not configure MCLK state\n");
 				return ret;
 			}
 		}
@@ -77,6 +77,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 				CHT_PLAT_CLK_3_HZ, 48000 * 512);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec pll: %d\n", ret);
+			clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 
@@ -85,6 +86,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			48000 * 512, SND_SOC_CLOCK_IN);
 		if (ret < 0) {
 			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
+			clk_disable_unprepare(ctx->mclk);
 			return ret;
 		}
 	} else {
-- 
2.47.3

