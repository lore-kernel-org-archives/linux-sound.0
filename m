Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84523DA5C4
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395413; cv=none; b=MP2cplojRtga0RJ3GPYR55mL//cEAwLdLRR34/O5JyVj315bw69tPFogDeTdaeXxk9mJHZ51sTYTkiWDIX7F+g5/tOMrUbT67+PVNNYM4onZavVaqPLDp6qyGWgKCYG749bzFjGMAt+72x5BMfjkRyppZbh+OGS+Bf0o4UL4Rg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395413; c=relaxed/simple;
	bh=vhEkZTw4QlzQZ3n04KU8Ww88nfpYBe6Oem2sU6WQQ/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tt4s2u4KJUZ8aazjkSEuCktSJ9oMh7mWcIy7LJhh4lpspHso2hyWh1D6wuoL/euYzzTlcQ1i6VZqtgL1eqXJHDOEi+/iy4EUWy20UQFBjTIoOLOOAiPz8lw4GqJlWf+JHml6P8EtnphoEBIMOVUJpaP8eevZCTAttXxKYqBcumk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKUOceib; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKUOceib"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso15209425ad.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395412; x=1781000212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCb8DxBgLNYKl2se7nFRUFkwYJO2PqG9toAr7Dgva9M=;
        b=AKUOceibMMmAKWnzXZzBgWiyiwi/+OxZoPWK36atW27zLbhPRMVx0xhWqR0yFRTlaM
         RUjS+/5ukYAmwFeliiiJzgjsYcRhmzJXeAseByAuWKiias3jIWcjHYrWVO77VqA++mfR
         LVn2n1+C0eN7goUADfuE5eYtk3Od7gXzFGbw7uFz57RUtX9rHQraym7Qi5tqt42kr09e
         NlUcQ6eqxVNRHg3jdvFmWhBsFhqSJnd23wz3vRjO26Dqp/3zyd8vHxc+aO7/K0tzwxK8
         I8n+r2uVICI4UWzDS7/t2O157yRryCQHMTyxQCz236IO6J1HInXp8byUy4abFdCw+ei6
         BDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395412; x=1781000212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCb8DxBgLNYKl2se7nFRUFkwYJO2PqG9toAr7Dgva9M=;
        b=lwQmP04/ehCFd6MvudXm6ZM3C7DKXo8+ZP+tMETFoOYg8XE4Ju/WdTydp7h6E28uH1
         hUu6bJfbpWUC2u/JHCREf7wveDL2nP9tA2e5YPRRyc/cRGfH+cLgAzFdgOCd3wOeoMOj
         lLNSW/dGc4Hqhm842XaSySjfL7mOpq8gymNt/xigP0pxMAisH/ecijQXAtJHONch9Zat
         Z+GIDNRP5Q17wvjNd7PM2KhamlLqbi3VTpM0N3tS01x9f4Jv5uFmKrVTNeivz4/ZWOJA
         EVPVrDIOGcCfED5EbkR0W89JpQJd4uGGvhM8EDW/7UyOhz/VedJX6WbUfNW5S4OaSUVp
         7kng==
X-Forwarded-Encrypted: i=1; AFNElJ969rX1pCAAm12Z5LL7rgzS9qZfjkdpZFU8zW99158ts9hjpO1Q1coMs+PwrbiT6YmA+paungz+xdHsEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJMBlmgYWbSsOmbncRkxLagiyRdInviuH+aaxTprYjEgmRGnes
	5w8o/Qt+IQdslFESSKzSlCM5B77Duw5OGz1Ln9oXJ/sEiu38K8aUx+BC
X-Gm-Gg: Acq92OHgI8oQt4lIJ2W7qLwkDm2xyz1+5GBKJ5nob6Uxi5cXTWlrycLcfydAGirNjkz
	9YLfbfl7zorWeCaexPFpJISKYbhsEO/uaztm27RHBh18mw5YWiMB77+7Ejc/D94LfL+81dKDaIS
	Y+JjzE2x7XbJ4YkapCJ7mdr/LSkxaxnv5EtYpxG1RLZNH9P5a72GuTppV77Tr4QEUyVYgL1DI6e
	I31kkPkoeOCV3XwX5s0xLGIGEg+MKaEkESYpMrVfIo87WvImyeXsgeilk1R6/3VsHBbFPbptn7E
	MARCWGmL4XECHiEuSnEcXXWg8ZAJF9jWG4zSBShsBqrwKYA8OCjMreOnRipWbQ5oF/2QnjAE348
	xJZQayGihQCJDKqEZSsP8K5UaTLwtChLDcTtjWB+ir0vwG+qlRB7WvLRmsMm+FR+wfvlnJuGX38
	pWRHQgh0o1kc4SWvTCSMZm1ATkhYmLj3uDk+7dU9UOCAjvKFrBuDtf5g9rR+NYGpMNuBYF
X-Received: by 2002:a17:903:46cf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c0c6254383mr111686365ad.37.1780395411951;
        Tue, 02 Jun 2026 03:16:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:16:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/5] ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
Date: Tue,  2 Jun 2026 17:16:06 +0700
Message-ID: <20260602101608.45137-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the 'hclk' bus clock before the 'clk' controller clock during
runtime resume.
The bus clock provides the register access interface, so enable it before
the controller clock. This also makes the resume sequence the reverse of
the suspend sequence, which keeps the clock ordering consistent.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.
Changes in v2:
  - Clarify in the commit message that the resume sequence becomes the
    reverse of the suspend sequence.

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

