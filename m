Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356833C4164
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443676; cv=none; b=qtN41Kkx97Tn7AIucjs4/D4Lq66zjDQWGZ81pphf77/geJzG6rZrg18A0YMY18D/PuPkKkk+W8O27w0hKzsD6lTQmO376ZI7Dyx4SJ7r1whWh4AmYTuuLU1wvPYnOZHeZlbPCF4Ayioo55+D7UVDFZeMxjPrW/5ERIcVHVEaSQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443676; c=relaxed/simple;
	bh=qbDGhHNnk9OCLZQ1PGxrrKjrGTP1fFlGw+ruMcn44HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbI1szECP9CYUq06MQqmoPJYrzzcgxHA+ho3jZDsF08QeguH6Ovb7BtWthlalo0fK8JijZFPMD2HYofIMo5vEaqLDYuALlS2/mOUj7+6VTmXtHFKEpuCKn+fSfiA9aVjsqFcvPtQEsZC3X7dNBKwj9owf2Cl6Q+oA84941R7OAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZZlWvhq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZZlWvhq"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3327704b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443674; x=1780048474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZzUxIkdaJ6gBxa9mowChRFjkNJFrAHd972GUGZ8zKk=;
        b=PZZlWvhqvul1AjFa8ARbD4hZ0tLpuIqOYzY4ugtubN2oEEwTj0IbktdNO3uGSZDvkA
         1WkF2IVImCiW7CRKvR4KJnZxaYlIDEeCjM89E5Vf36Npu0UWi8268NK6KobJP2FCQ3oo
         wGA5LEk1HsJRPuuycAiamTpXXABT7uZO2prKgXbd+VYmlVFTxkyNathLRaA9X4wtcHpc
         ZerW/NSXnrUIRvf/Ba8BP28RfBXTJuJK++OyR67Ac8vfcYrJXn+FIKFLzA/oXuoCA8wG
         00Z0hy5kPuCXT8MYxpX6eQQLJsJrhqfePgOK06m/H47mjSLdNTRyT9PN0tnx3uTXZ3fG
         ZcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443674; x=1780048474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZzUxIkdaJ6gBxa9mowChRFjkNJFrAHd972GUGZ8zKk=;
        b=L4RI2/nYNWlFRt9l/Ot0tXuNopLeRaUuX2/Hp1lXrLjmoKFT0orgYJORz6IHnQ04Nu
         Trb8FnPHke06HzPc5VO/eCsYgd4xbZ+dIg9Ac9rcnoHrjqtcIV70QBPLkogFBLeoZsfV
         PYm4Lgg/gEFVmjZKEZXSz71Quv3BDfvuOuBqvtTgtpiFC7A8Ioe+Honssk4kFGsncU6I
         5UWNL3pd89Xclr7dta6fiEwpjNhBvbrjFwJSurChNBzR2Tmb3K6p8TQPJT2xRcSqKCvd
         bUCTdAnGRPij+uAo8m7d8U28OYGj5MxUCM+qVrCMoPXpDtmCj/J2Hp51qOtvUfi6skPH
         Ha/A==
X-Forwarded-Encrypted: i=1; AFNElJ+ELZbZXxNVq4VyySMAmPewCv9QEVZDGbca6r5Qs7VCYFJ9BpsBgv9OdZpAWjtF2rj65DK+O/ELwvwsSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjt0Tq6LZcxpWDc896ictEbarFK6tWRJ2rfXN/klv5ETduDO+
	yYkGPCGFBnnDegfuQUKvqJGLcNLDv6+HRnygvic867WqB4nfgRbGz6pn
X-Gm-Gg: Acq92OFmmxnsk10FFfiVHsKpYFQX5/WvbuKWiDzGXYhmcVTKGFKrjLHquGBZ6jZTjAp
	TvLovrzVjQoH0EBMybJLe2o5+fAcmbMYWhG1a2p2vZ8ag7GF+qvw6tJXGCF1EBn7EQnB1aYE7ei
	BW61WlJUxRplwHq2fFyPiPPlp8UcLCB4/nMNQN2zJvfnkC0qhtCoRIEBZUzlBtQKQWpPv35QnS6
	QsPEu69CYT/Yx2Orivyg9xVHzdF86UbYL6iZPA/9fWHJT1v1BSIeI9E72Xkyk+3t/c7YkUl9lyQ
	nmoyrThJRHXOKR1wrk72WbfhYrwymzQwQVk9qGygSJuLNwhBN3tr3VZH22S8YYOmU5f4KcuYGW2
	9yktQv3ByhbTJeIYbSs/55eAoBDp01qbu0vVw6siUmkk2neNv8Q7Wwgpt5fGOYW8GxsJE+D/aVe
	qy0g6Oxx3sZdQTX2fHyTi/qiMaTiStdYe/YX+m6nr5lqqJmSWnEs/jArJdiw==
X-Received: by 2002:a05:6a00:17a4:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8415f3f68ccmr3185755b3a.49.1779443674325;
        Fri, 22 May 2026 02:54:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
Date: Fri, 22 May 2026 16:54:01 +0700
Message-ID: <20260522095401.72915-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522095401.72915-1-phucduc.bui@gmail.com>
References: <20260522095401.72915-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the APB bus clock before the SPDIF module clock
during runtime resume, as register accesses depend on the
bus clock being enabled first.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index f54eb14c9ed8..102db1a2afbb 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct device *dev)
 
 static int sun4i_spdif_runtime_resume(struct device *dev)
 {
-	struct sun4i_spdif_dev *host  = dev_get_drvdata(dev);
+	struct sun4i_spdif_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->spdif_clk);
+	ret = clk_prepare_enable(host->apb_clk);
 	if (ret)
 		return ret;
-	ret = clk_prepare_enable(host->apb_clk);
+	ret = clk_prepare_enable(host->spdif_clk);
 	if (ret)
-		clk_disable_unprepare(host->spdif_clk);
+		clk_disable_unprepare(host->apb_clk);
 
 	return ret;
 }
-- 
2.43.0

