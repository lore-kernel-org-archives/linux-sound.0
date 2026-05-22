Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CDE3905E4
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443759; cv=none; b=Ygnkley8/6nZaXiJJw8f0EXe55Z/48ozkqz9WVIt/naiqA09iXSeiDUTBlesfb3O5JlvIRPmsOIIbqsnssx0a+6yEehDINw5hQ9Ht2qeBE2ZspwR4QKTLBup6YX3XOPQSnWQfnYYp2rcSD3yfxwRfqiw7E7VwU/3vkjycydC+o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443759; c=relaxed/simple;
	bh=xUYDqpMUSiYjYknvlUc2DtVTu2MReCm/9zoyeeggXbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qznam0iST0A0KcsFSx4AvTHpUITRclCEgjUql8L3wQipttuR/JCYF+auyB6tmGd/vizQKS9S8l4hg5EI3TM+0/FPjjnF5qb79mXVOUxoqkAdbiuJpqPTkie+ZSAWO60brBIxjl/SMS6DTOGIclGTC3gWaSHvgxVt5Gj8+sJzYKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/G/NV9r; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/G/NV9r"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8367df48711so3094325b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 02:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443757; x=1780048557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdspRS+hKmJQmW0Wsieo4FX+5eK/WlAigCd6WtBtyGk=;
        b=V/G/NV9rODZs/93Zx5yu8IT60iJfX0nT27wrrdhKMlyg+V0d2Lw+DtEuioivKWRkHZ
         5HAakQ9/uWoWoJQxqNjfAKQWuJWH+KNkOq+xVBOiryRckgXJ/J56iYYzbZGu8mVlXvOR
         VSDs/8+BmNggCu+gjLIPX/3AzaKkFgF6G6oyRpIZOXXMdUdWfghCaU7YQ12GNCd4ofRX
         zfpQ63VyVRX5WDqHrTP2+xSikiWTNnsh/VrSTME6gEzDU1UZRDq5kj+82WT+Tzr3lJ/H
         cZPIFLGYSv1yM20tEnBxmQk8RIv0ahs9NXYMMqZVQefkaF44xxC5rVnzZbfkClxzg7zE
         aVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443757; x=1780048557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdspRS+hKmJQmW0Wsieo4FX+5eK/WlAigCd6WtBtyGk=;
        b=Pe6GWqKe+rsiBGNA2CVdTjztTF+MIrZzY0prbNjjQmgWNkKrk9iJkkZ/x7sKZ14Wlt
         FwlcTFnHTWRGkm/4VhxBbapJLvZkayTq5mFTdKa8YSTaqKD5v59UYFZrj911O1yOcDTw
         IhsEAjEad3+RrM/CII6ky4+n2arltf5Z7ZCClFKydXrL+pZaiKF+7+pxH0FaWHaFFzu/
         LZzualZKvqEuWewXqydl7WeD3SYXpg4j/FHIhWr/ehu/6hS0bB1if3EKTNoJC1Nd7gNJ
         USu58wHcsoZiCpmrJ3A24JXz1lUSdBgCcrMXm0WiPX+r/DCPHMOpizIGDpVVU6RbXcN2
         GVjA==
X-Forwarded-Encrypted: i=1; AFNElJ+l/5mJO10Av5jp/UcQR/nC/7nD3q+TvNQW5UKNxqdQPhHBNj/qJMKLVN/Uc84msex8mlv1jprj3Fn3Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGzj00xRfwIkXA/dGdFfxXJpR3dAfj2djlp8gB/OLMKKLJ/Zg
	y8y5vMHidnUtQngybSbxHSG0Sa5s1MCAf+j6104IaKqfC58/rfR++qit
X-Gm-Gg: Acq92OHNzsX/o8gsMgDs/nlYa9lljiCovuzGVBH4+GhakYdR+8oxK6AigVOOQqTu9jR
	linUxdKVvMH5F+gvmuwbMRFInpf/XkpHUhSgPIgNLUoHfCgtRimfFOPyQcLXaS7N3sWu0cNk3DQ
	wgX+3OUjPOCh7i5vBdoG/3Q9sExRoUT9eendYOhiWRtubob+gMyK6y68eLThYVQWtGh3/zugECk
	kHrwFitH87cpg4ufLALeGD7o7qzHhc7Kt9Zfu2Kgke5Ldn7Iz726FsVDGE/ZX3XFoNnXRlNDRR0
	Dmo8MFVDnIT+/eGc2zU3tcSJNFJqDHAYL2gCK25bIt/7VngOSexgWu2TeCyEEvhNgvEAa4qlepa
	Next9yshrJHGblH3Pelv1pDYy1r5Aa73mGqVx6gLs4pHUEBKZIkIynwbhvKGAT7ExJJ223atyy6
	Pdi9YnhJrsRNKK0idIXC3z9DnAA//8pNHsRrgFICTq6+eJFBi60P1sitLVCcmR3itc3tN9
X-Received: by 2002:a05:6a00:3020:b0:837:e9cc:d470 with SMTP id d2e1a72fcca58-8415f330e98mr3144147b3a.20.1779443757359;
        Fri, 22 May 2026 02:55:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe0bb8sm1338786b3a.51.2026.05.22.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:55:57 -0700 (PDT)
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
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
Date: Fri, 22 May 2026 16:55:39 +0700
Message-ID: <20260522095539.73025-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the bus clock before the DMIC module clock during
runtime resume.
The bus clock provides the register access interface and
should be enabled before the module clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index eddfebe16616..7aff1afdf265 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -323,16 +323,16 @@ static int sun50i_dmic_runtime_suspend(struct device *dev)
 
 static int sun50i_dmic_runtime_resume(struct device *dev)
 {
-	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
+	struct sun50i_dmic_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->dmic_clk);
+	ret = clk_prepare_enable(host->bus_clk);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(host->bus_clk);
+	ret = clk_prepare_enable(host->dmic_clk);
 	if (ret) {
-		clk_disable_unprepare(host->dmic_clk);
+		clk_disable_unprepare(host->bus_clk);
 		return ret;
 	}
 
-- 
2.43.0

