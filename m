Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C963E5A1F;
	Mon, 24 Aug 2026 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553415; cv=none; b=T7El/ys8SwXT2n61ngxe3lEaUUoRZe+tl5HQHM2q2Pvjtkc+IHA8L1sGW/RNK+yCkv895+B82s+VosZcBTctiXevI9Ub/rz0XWDX2K6QRo3mHCym4fVEGiQACObwm7K5PeCXYWf00NAs7zi8WYlhd5AatQ6gPoXNvMdD1kNYcH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553415; c=relaxed/simple;
	bh=KID5bWrcDrGAP2jJZPVTCdS3CaV3XyYohe39lNcJESc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SdvbQzBjc+xuD/QGqMM9HRXTizvyrWEONMUWC68vc7ibDelaIpdMPRX45GjYlcEoQT9pJhcGIVHvR94B8CVx3yrIeccO4qrwbRbCn7US+oCpwTdEWKW7q0iXUxhfX6vhQDEFCsrupdfvj5fCnsnx7J/zrIu/8vdgfwmtmflHidU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bKGIMpQJ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bKGIMpQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=k3
	GzsywLI0xbrpNzKV5ximzgeXqzruW7tWu3X5mHKjk=; b=bKGIMpQJQBg90Tqgkq
	9ugFmhY7nRFmxg15fqNC3lpuBeh+jUpQyIy3gz16PlPEZ2a4Hx11CWfAS4pQKNCT
	eJUWHEcSo1AVL6O5xL1Xq4wIg4azqMoASILqygkrBuN4H7+5adfT82UWZSghdfHx
	65tBYSMtUJFaGuEiQF0mQMZvU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDHF_5K5otqcu0eMw--.50922S2;
	Mon, 24 Aug 2026 14:35:56 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	perex@perex.cz,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH 1/2] ASoC: amd: renoir: fix disable_pdm_interrupts() to clear mask bits
Date: Mon, 24 Aug 2026 14:35:06 +0800
Message-Id: <20260824063507.483784-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDHF_5K5otqcu0eMw--.50922S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47WrWDCF47ur1UKF1DAwb_yoWDtFg_Ja
	1kW3Z5Wry7JF12qaykCay5Aw42yrn7uFyxuFyxKryDJ347Kwn5Aa10yFnxZFn2vFnrCFWx
	A3yq9ry3XrWjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRGFAdJUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6AxKmWqL5kx-EAAA3T

From: wangdicheng <wangdicheng@kylinos.cn>

disable_pdm_interrupts() uses |= ~PDM_DMA_INTR_MASK which sets all
bits except the PDM DMA interrupt bit instead of clearing only the
PDM DMA interrupt bit. Use &= ~PDM_DMA_INTR_MASK to clear only the
target bit.

Fixes: f621a3676d3f ("ASoC: amd: add ACP3x PDM platform driver")
Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index e60e3821703c..3f59b753243d 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -104,7 +104,7 @@ static void disable_pdm_interrupts(void __iomem *acp_base)
 	u32 ext_int_ctrl;
 
 	ext_int_ctrl = rn_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
-	ext_int_ctrl |= ~PDM_DMA_INTR_MASK;
+	ext_int_ctrl &= ~PDM_DMA_INTR_MASK;
 	rn_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
 }
 
-- 
2.25.1

