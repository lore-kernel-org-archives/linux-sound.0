Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747EA3C5DB6
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444228; cv=none; b=dxSjv07PFgbuHAaly07rRmNW/ysjQNVb9IglvrKS2G9hA/AJSAe/Ln+B6MsQnXSvPrWfhbqlmLgpPxDB5SwHS2zByyRT0IfBSJsrCCiOW9YJTvIpnCYFBITM/hlP5iVylOg3zdLErCaCEPQdqW2LU0JJjNH5IK+cCimJkFKgaHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444228; c=relaxed/simple;
	bh=ExiN+C4YNDod2sNQFUItCwk6WYc3E9pIc8syzk45Va4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHA0xFVJG6bIWpiN2Uoj9rVWM3YaMJfU/xWngkmBJVeOY877eNJAaxFspfdnY+VxBG/jVVZGFwpz+2bA6IXx9hax9Owfk525qVoYFsDuuZqjUaXSrs3w0gcI4kwwTsdg6VBiBxpRwZEWQslgMkqB7+5lmT65mMwVh1W4Enr8ygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juimpBDg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juimpBDg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba0714574fso39068445ad.2
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444227; x=1780049027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78Vi4OavJbre02Pi7gJRdT8U7hvyFu4xORETXxXDTp0=;
        b=juimpBDgoYOXPurb+Z7STz/uD8aMkpza7JZCL6oJCvR0j3lj5FZ4V1brovd9XsxmHp
         fUHtRvFw33GS4UA6BzViTj6gb/F/86r4BE80jYFvMHHF1hnAgjMyXATJdroCpYhjfk4B
         v4UHQ5rMII/glj0bfLN3uGq1YzJNiDei44eDQNx4KlIgxkEkUCBEwX2pn6+KwgV54Fpc
         WtOvsqzXhNguN/xkHwIkKKoJ6INRA2G/P8W+HYKlLhDSi1BXCCSdpfnrxFaf7BEp1w0N
         n1Ws+AKJ1WiqPU0J25CfX8rfYhGBrB8S8flM5WMphOmhpVEbPJzz9/6S3hraK0XHk2hE
         bPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444227; x=1780049027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=78Vi4OavJbre02Pi7gJRdT8U7hvyFu4xORETXxXDTp0=;
        b=DuLsoEsPqw6tLtiX1XmQPpCwCYnyV2Sxet2vLXdUxGhOPHWcQVKXoPrWFEWChls8ev
         NVxvC8gba5cKpfINCgpV6Heym/AMycN4VLTUayyf8ngOy5MeAvbHKE0g0pxHkZjS+ajB
         b2KgyYOvc27KaAf9cbOdG93FPlQTBMEiM0BDuBN9J3ahABhLXubOuadCwG8+ywnj5JZz
         p8l8rVBsfCcgG4joC37d4SwCJcSobGVhwJKvrdQRdkgyUpTtsKnhTtgIEXaKmLn3zfkr
         V6mbLxdnr+B17/4B/wIlKUCc1bZk1wE9FCvwJGHGCDo0JxkZTQLxuzkQm/POCxF1BkP8
         eBJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+JmGTjFKvEp7QULR81EP4W04H1LnvBMTGhB9JSg/8nny94jPL1jZRbMGRkFVxByeNwlrhBs44RjWDRMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlyHl4RNSvGgsIXOFvGKHQOl+9qoLyGfYohCKa1kP700FpMECR
	iOl66iqpQ6KAxk87g+B6qBXjtcr49GZi19silzSG9ghWtV8in9Lopz1C
X-Gm-Gg: Acq92OEq4/tNju9uUl6DEO4DxZzVBdjvk0FyPA4Jn5GltcQxQlKGXSWEjoXFJu/CE5U
	u7x/rVoOOdJ56co6F4ACm56hI6dZLNqBKPuCRSxNStEaktP/cC6a/bPedJEkDb+Lvq45Da4EzGw
	MwoIpmwQOK+emJ5xkdprC6OUeIuEL5hTDkPDTIV9XibOtCG8y+pHtFd7136Kq/mvnuO3R8PGNYj
	HEQv/kr1JM91LDgDYf/sXs+xNgZyz1wuWKGsrJb6XeFrdNUCQxTbix6GfKqH0aBAh8nM/DPAiMi
	dXOsI59v5fRmwH3d5zlcgAcV8wHf2FW6rYlTLvaUukwn/Cuu6HhpJHhw9SDJSXdD05gnH7HwTv/
	FvuHK/AT6ChltID+LsymEolHEmoyjnn9pZA/CTvQmWRtBVoe8F2117MctLUNR7kmKlj+TyBA8xO
	8bQLD1UBlSUvDJDN2c2mkN3/61vaf7gn9Csm6QHL3spMtWuQMZweUbtNzA6Wq/G1dP/r+i
X-Received: by 2002:a17:902:ce84:b0:2b0:917c:bc4 with SMTP id d9443c01a7336-2beb03661a2mr27377715ad.4.1779444226741;
        Fri, 22 May 2026 03:03:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:46 -0700 (PDT)
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
Subject: [PATCH 2/3] ASoC: rockchip: spdif: Reorder clock enable sequence
Date: Fri, 22 May 2026 17:03:17 +0700
Message-ID: <20260522100318.73474-3-phucduc.bui@gmail.com>
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

Enable the 'hclk' bus clock before the 'mclk' controller
clock during runtime resume.
The bus clock provides the register access interface and
should be enabled before the controller clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 581624f2682e..8de5b76cfe79 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -76,16 +76,16 @@ static int rk_spdif_runtime_resume(struct device *dev)
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(spdif->mclk);
+	ret = clk_prepare_enable(spdif->hclk);
 	if (ret) {
-		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
+		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(spdif->hclk);
+	ret = clk_prepare_enable(spdif->mclk);
 	if (ret) {
-		clk_disable_unprepare(spdif->mclk);
-		dev_err(spdif->dev, "hclk clock enable failed %d\n", ret);
+		clk_disable_unprepare(spdif->hclk);
+		dev_err(spdif->dev, "mclk clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0

