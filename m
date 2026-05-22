Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C394A3C98B5
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444234; cv=none; b=ScrP+wxgZPiDHAS6TC/RzfP9cl3tAxTmdp8508yclwB4oIVBmHFPg6ApHpdw8P5wYHY334Z7YVH4k3/pVLC/WU+yAfD1AKS2DPIMdw/nlpGJknvnP2DOcQgvEFZ5skiB/Ozp5ERkdPgpFD4mK7bRj15A+NLN1bkuFHHkTD+gX5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444234; c=relaxed/simple;
	bh=wlWvomiauZ7B2iJ3h1A1PnZrGVNV+2V7Wo95ZMBDObc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+uu5qASQc+oM6P3OrDV7vya4to3f/9ww245R9UYN8ykrttyZzMga1bBA9wERFKxe8Mt0RbfekpABPuBYci8OxOL1Oo9ye1lR+Ua6r9XCegZsUcqnkglQngwSj/X0UZ0cE2dK30U51+X8lQ2id33JDtUcZWq6jGhmaQdqFN+r04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjDYoiKO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjDYoiKO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ba6485d219so53878925ad.3
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444232; x=1780049032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieAL7FXG9N2pPYlycZklbhAMC0pexNuJqkqoSDsbdHQ=;
        b=YjDYoiKOLoDN6c6IpccmhF87lmEMiUMfSu5lMtQIPgmCbTbq5mWubHB+7/ZoadiRE1
         V+QkVjP+GnRSd4itNYGgAA8KMLDKCum64BrOGW3Un4nNz+jw4HWuNbfDRHFJwLYd8KVP
         wKrz8LJpkahpvcY48V/vF+66dgc/iPB1s7+Ck1H9RpG5Mi1taZflg4riBujSOYdpewnR
         l42SPU1riW11RJfByzxH3W9MYc7JYyukZvIyVaNGc4F5LKM00DgIHxB+9n9UBhm6leKD
         qbHotJ3kCy65F3GTnHyk8oOndLtVw8RxqPXCZ6NdbPDHFSJDnlwcu90MkEujggczRC+F
         A1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444232; x=1780049032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ieAL7FXG9N2pPYlycZklbhAMC0pexNuJqkqoSDsbdHQ=;
        b=AqDCXAv4SbG5P3NT7eDUqrp30aLDDdrVdFfYF2Wt4dup8JEBLoq1xtZbl9psU3ougq
         wmQDPioA4zDX0XJqNR7tacGeCics7j0FHyuuH3cISZ7iaXCOYmRK2F8MFKY+C2IROAv0
         7zd72ws0juZ7UNUFvFLY+DtDFk4F50r3Hh7dQM5hVchSfaqz2wQo73jN+SzK+TkbpvFJ
         egB8ONwD07va5yV7J395n2MMFp62tlGrBErIy1Ffz3zkN9H7FTwjSCxnY5zYQHezWLUY
         umtRG1e6Thq3gadp//yG/g8bncqQLkHCxW0/esTA8/XZmoxwHZonbIsUOOhs4viMGAlR
         VRNA==
X-Forwarded-Encrypted: i=1; AFNElJ8pzxTm4ZXZwBlHaECR7dO9a5v97Hs4/q9oPk1UoQjColMA6PEqcsgGNcpN55M7jJLnT+qF8514DvKkcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe6CGxIA6TsfCQy/SwKYi2xyhMKFYw6crSmYkOmgJQDUUiSind
	lulsRF7ESPp7iSxJsTdt8MpDLGGNQo+mUeskaYefzBagc6MIq+o8ddfQ
X-Gm-Gg: Acq92OEgZu4fdHIMtPfwhO3N+xqpLLFPflsFD9d+P978PF3aT8arkUjHKHdqiq6WuCk
	zAh5O4dXfjJGD7LUG65A7gqr82qErcA3CuJKLHny8dx0DE8uz+x8Nb7pcEAmfjrAwWQj/WUNjnF
	aXvrFDGwe9pMQvbxpZXPvSwk873SAWmEUjVk1/xU0G9SFGXGwny3mZz36RNXFiJUNypOBUZXomx
	iNhH4EkEYvtPo8msqQlJ8cYY8vKpIr9OJlInEDoYWXNIDRUOSG8TTU4jyaC0AngKdQ5BWrE0trQ
	7G49lGuPpWd0D5khlV9aeXdlOHUrfJSinGFS3N4+oieOKJXN8yKRkO7/RfH9W6dllCx/ilOjK0k
	3nwm+XZzbBkm4BHXSv3Q+McpnvLpLcnoa8NoYOTLxiqYfkq9Z3c5Xhv1mS7Fx7yDQHQO9wRrck2
	Nqveg5PM+LweQORnUkHzIj1Rc3zHeX66TLx/6fNnwKZbscUcAjjMuwuEuTbg==
X-Received: by 2002:a17:903:24c:b0:2bc:9f51:2922 with SMTP id d9443c01a7336-2beb06c45e1mr28671585ad.41.1779444232060;
        Fri, 22 May 2026 03:03:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
Date: Fri, 22 May 2026 17:03:18 +0700
Message-ID: <20260522100318.73474-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522100318.73474-1-phucduc.bui@gmail.com>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the 'hclk' bus clock before the 'clk' controller
clock during runtime resume.
The bus clock provides the register access interface and
should be enabled before the controller clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_pdm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index c69cdd6f2499..8f78f7bc1806 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -422,16 +422,16 @@ static int rockchip_pdm_runtime_resume(struct device *dev)
 	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(pdm->clk);
+	ret = clk_prepare_enable(pdm->hclk);
 	if (ret) {
-		dev_err(pdm->dev, "clock enable failed %d\n", ret);
+		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(pdm->hclk);
+	ret = clk_prepare_enable(pdm->clk);
 	if (ret) {
-		clk_disable_unprepare(pdm->clk);
-		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
+		clk_disable_unprepare(pdm->hclk);
+		dev_err(pdm->dev, "clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0

