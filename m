Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2247830E0C0
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875070; cv=pass; b=PAz/tqBq+TkNmojAnFoo2JmsgzRGevE1bA8nEe5ednJkbRdKyjjCDUFMRTsHWqrv6mhW1v8+Zx0sgk79Jv5zOrVEWm5OjwS2YhRp7s4Ins9oG+I+Q4DArFQxfFwJ3ybQS9iFspWtRw6Z/qUnKeeYn6qdx6hbusAYtUXc6jBW6/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875070; c=relaxed/simple;
	bh=bl7SyYTosk81Ca8QjWRmxmj4hjuf6WytqVZKqGU9kxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sd+GcDGQXZTM3rR5H6LQ+tcMMkxI09Dd9/9W3CzXOmqGHaJ179M1DsZsmR0593nL1A0N/1asgOraKUmANXT39TgxN5XWH8pnsZSgZzmwTB81rrJUbLQyR0a+Rw7QYzZk6PtENsEuZo+Pc2NV1COsHrSmdDFM9mzJD0/p1LTL8wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fC6eCzhx; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fC6eCzhx"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1a6xjISC3MIH58rXlm9v0g3mrLOoKxEiged5KmR+apQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765874990;
 b=s6UvV4teqqfa+1G+HLzy6A7cSMIov8S1Fz6ty+EO8rCpGZ/mxJdp3zJNfXWXyCCNizbMylmX
 xvnp/lyAFDu+5JHPr8OUqxPrctA+E09YNNdHXeJURHhKV0HtYsFMdwXbLMAGOgTLRI7GKL2j/1M
 ipDmDwuADkXWxO4hfdluuu82p+eSZhB/k5oVhbGuHlVN/0JBnbJAmWEDIo9MbuY113paKeOxFNV
 JfKItBc6c6/XYTUWxPX8ib9C/ygqCuXcvliYd3Iw7xmrC2UF2W0jacZp5Ed+1GCY5cXy2RDR/Y1
 2Ea1aJ9rjpPzTJjHRf3njCBFEkY6cKd8LUfFLZo1w5s9A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765874990;
 b=QfW2CUAEL8c0MBkTu107Cm+HS7EUlswNKKXhnbdT5SCc62LKPLRX//bewawljy3PHwp1T3o3
 1xzFy9EHkt94kOWFDif0r7HgZVw+gwh6Tt3+/5z05WTAsrTDCs/AzswFL3Vab5nPFU4rclDHpOi
 LYIWXrc2fXAR8gZX5g6UpuhZ8qbzmOv7S5zp5BpyJxc73N5/iNlpAww98sZp+6k6k4fTbeLQh8z
 ySazvwIVdM9Fs+ggi6AkxOI5spfmUNYiihQDvYj0Krk8XmJIm8NXI7B/KCFDCE8VWXbUjgx96O4
 sIb3lkTBFwpg6fZFLs5rwRVOZnfR1Ei6MnhE2cJILkhcg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 16 Dec 2025 09:49:49 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D8815A4079E;
	Tue, 16 Dec 2025 09:49:36 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: fsl_xcvr: provide regmap names
Date: Tue, 16 Dec 2025 09:49:30 +0100
Message-ID: <20251216084931.553328-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-sound@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dVrG94N62z4MVKN
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:027bbd810df21f0f4fe38bf7871a09bb
X-cloud-security:scantime:2.241
DKIM-Signature: a=rsa-sha256;
 bh=1a6xjISC3MIH58rXlm9v0g3mrLOoKxEiged5KmR+apQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765874989; v=1;
 b=fC6eCzhxv2E27KGjQn9Mf2Fplfm2QdBExgnJBT+Jp3+sH/O+n0bmDSKMrsHso6JLQJ/KVD9B
 gHSsSEpBtM+BGp0oltebgtayxDITN8v6638/Gu4dUP9gbkMpcyXStSRw0aueXU7VB+tiy9LuaEo
 mZJmjECwsmjW/qJ/e5549NTWVWRMn0iHKbxDpvqrbvL2qrCqYoKe1mlP6TIrJ/fTxii2UzrgUDy
 fCXizMbNF3vuquysHHWwboTQrea0iIqoil+oykOaLOGaitR7/DK+Q8kyppQnnWB/qs68OMGQWcP
 DTVIiEJtfPUXeLx8ISBLQydNGnI4sKP3oseWG80g+2FLQ==

This driver uses multiple regmaps, which will causes name conflicts
in debugfs like:
  debugfs: '30cc0000.xcvr' already exists in 'regmap'
Fix this by adding a name for the non-core regmap configurations.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/fsl_xcvr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 06434b2c9a0fb..a268fb81a2f86 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1323,6 +1323,7 @@ static const struct reg_default fsl_xcvr_phy_reg_defaults[] = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_phy_cfg = {
+	.name = "phy",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -1335,6 +1336,7 @@ static const struct regmap_config fsl_xcvr_regmap_phy_cfg = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg = {
+	.name = "pllv0",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -1345,6 +1347,7 @@ static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_pllv1_cfg = {
+	.name = "pllv1",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
-- 
2.43.0

