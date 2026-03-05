Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazhn15011023.outbound.protection.outlook.com [52.102.137.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF63F23B3;
	Thu,  5 Mar 2026 19:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.137.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740731; cv=fail; b=IsKt/QN39iiASa0aupieFQyqjXfRgFrLPiKr7uSZKRZ7FudsfI6xFPBNhhP8/EfLOjPX82Gq07b6QiErbqr6dwbPPFKEt2ry/QQMHOM3bPOze6Vrh3t//cY6s8lk+oXzqqbUuf1zHhChOxCjftksRyhr/DU6s4NsPOQD97zzA7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740731; c=relaxed/simple;
	bh=zC4CGJh+Lm59E0IZ4ez/J5OAjdxvpUJQ5VBCxVEPq2A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLfIGLDLX7d2C5E81mkYxxo+VouOUCKztW+uQuVQzjYEpTwe8oAcS4OwGIn2ho7hRIocqGM3yok3ncqQvRMMkwXlkjrDnHaJcIBMU/2WFbIxyVN0DICaRTTDGvlB+Y2UJG4M10+7IMpdxALbUEJbML6fEeM2u+FCxKAlcRDcsyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cqXfrOon; arc=fail smtp.client-ip=52.102.137.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cqXfrOon"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ca6eY306Ym3C1ehPKOaNku0aklPerifORIH3XyL06sL5zayD9iSJnRWODjZaJESPAdRiol9PUOUPhN6539FSBVlkwqvnI6Paf+vRiwYHVGQtprU9Cr6w1aseH46UZuZlrKCPQa3zCWz+VA7t1Bau73JgaCSpp069apcgkYD3il9ugZvOHtRYbgs6FtMFQHIcK9rFexwEZcFxujxSLpmhgzF0LEPBsAV0z+rTi40265dgDEhbIhl7WM+eoIyzuaGeW9KnA7ksPgrbBTk8P6DPNHDD2Fr7KWxecjuQuuV8pPeduGD26XbHorehoY3S8f5lTeVVZe+pieuw9n6u4VkwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vz62rF02flvsODjbBeCfADvSQDmn38sdvzbsQhr4NYM=;
 b=cDVAq4p2Yn01dnv8kguNSJ6mP8gpmPXZEe9yB/mfGg0tT9zkFLgQEkZh6vX7bp+3Tnz5yYPLWcqmU8SoCOoiMCJsELQunMGpZ26tqzHr2qywRPD26jx27hi0sH19yyTlqDU8TmvJoXh7b7ecjJIT9FfYDlRdtxU6oFegQRldLhrZINZecRwhqU8CskJhmYWzSff+oI/rIXtog6Yo50sPCtGMzpRvf+17PuZ340K9OxB5RiAIigU6G/Kpx3fuRmLewJbsUua4EC4E2+kkMBACwq61iojEPITFArcjZUmsneFxEAhS0d6kmUpkSUC5rT7YNkW4u+FwvD8O2Scy39z/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz62rF02flvsODjbBeCfADvSQDmn38sdvzbsQhr4NYM=;
 b=cqXfrOonpcd08s7qh1kE3fBtPMy0NvutQ573KaDCDpewNGcnYESPkRKdEUg1rT0WaOa2B1S0mztHcTRZwNdP7D8A2tA9t5N92Fc567a6R4Ec5jqfOaYrHjH4/1TsGHhItT8U7c9C5ZUzRqvdDBlatIYc+b8Hi7pm5seljtrOAEw=
Received: from DS7P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::30) by
 BL3PR10MB6113.namprd10.prod.outlook.com (2603:10b6:208:3b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:58:41 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::4e) by DS7P222CA0002.outlook.office365.com
 (2603:10b6:8:2e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:58:40 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:58:34 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:58:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:58:33 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625JwXNj2458533;
	Thu, 5 Mar 2026 13:58:33 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <devarsht@ti.com>, <r-donadkar@ti.com>, <s-jain1@ti.com>, <m-shah@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH 2/2] ASoC: ti: davinci-mcasp: improve aux_div selection for mid-range dividers
Date: Thu, 5 Mar 2026 13:58:25 -0600
Message-ID: <20260305195825.9998-3-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305195825.9998-1-sen@ti.com>
References: <20260305195825.9998-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|BL3PR10MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: efd241c5-d8d0-47b8-4198-08de7af198b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|1800799024|36860700016|82310400026|376014|12100799066;
X-Microsoft-Antispam-Message-Info:
	kpi/OG3B2NYGdj/KIQA/SbUEyztWInBUtjMgLQVDJgbTIGO+ob1ug4e+M3VzhK7OAjQatvkCqiBisTq8SwoVB4y6HOtoZc7zP6Xst0H52Jpgug6WJvUkzaBkzw9zXBqqR6tMNeoN8bv6S4ZZsnVetgk7RUqU3aN5x2zJVulqwZZtrAFrV71r0+yUjOhIM2VV4lFEljiikYtgnzw/YPDByifacTiVM9bA7Ig8U1AHWIAzeRCQkrfPextT+Mq6DGkor8LYZIWOpcwjkj11an5gCizcwxRf/h1jP8Ygcno4QGHa1s1WvTz6WN08gHkPOi2qASxAiHT4n0MTJHzRVx/jyTPPM6c7x9Isp56MOnxf3uqXsTNJALunRWRX5shAflKXe1XhA9mS09ID/EFSBm0tx4qTPVMhQIo1Mj/k3ITGWnGquL0pkbbJ+L5S8H/dOP1XOl8LkaSvNmuDyW7liGeMYGMwL19qXu/ArkPmo2iNffMLFKticueEo6x60YIvK2ZFKOvV+l11+mlIcO+M4LLUj4aoiXEKhIStcyFgYKjl3TVYOFfAp2RlC9IKVOzAcKR5K+of0oQdBl8Ed/NSBiB/WkqnkhbXPVMPbcWAEZITyd2xu4Njk/YCG3XeJ8xl4AVDasp4eNfUxltdyIyqXis3BoGD+iwy5EtGdTDVAN9EfNcGpuCEBR9E0d5HZaSAeBoCeF8R4/Ih1sEVkIxworA1UXxAoiz3p3JWphRl+m2Tv6yxyF65NbwPkMAvLMxq+f2yMpawgYodw3TJvOvB3IQvsQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700016)(82310400026)(376014)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ia3pVHhb3rP7yfPTBG67JxKkTkZgofbTlqUISTsf25PGyA3H6A7I8Kld2R3PjmZKeiLOFRXo89WHvVO+ch2capm2cfKWmG1WbT6r2O9DBCbu6gvIDtQMGcb3mrewPRlcf+c/kr1YeFMLHAtC3KiHD8i61d9q5M32RP4isODl02a/xUEG4extk2paAelIJP1p7rNwmRBarSRrHrNgUbNN9wplPOefvYQ5Oc0jK/8TVLZEzHXBZ0pJIwca/8jdWzAPAHT+nAp5sxWbN75XqYaR6iTlOZpXjnGmg+kB/gIFica8px6vDsu/U/8m4ObagaA6rB5zvDkRjnkD+zhytWbFy3O5d75nJ0NHRN8S/MlQdKErVa5bVEtvIaiPqL4NhpkCLMcswPCQlPZe32vGOZt1dIdsSztbbWG7ollJXhTQdhw2LSygXdvv6ylWxGBgGy0N
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:58:40.0098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efd241c5-d8d0-47b8-4198-08de7af198b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6113

When the ideal total divider (sysclk/bclk) is between 33 and 4096 and
AUXCLK is enabled, the driver computes aux_div as ceil(div/32) and then
recomputes bclk_div from the truncated sysclk.

This two-step integer division loses precision due to truncation and can
sometimes produce PPM errors large enough for ALSA's hw_rule_format to
reject otherwise valid sample formats.

For example, on AM62D-EVM (auxclk-fs-ratio=2177, tdm-slots=2, fck=96 MHz),
playing S16_LE at 44100 Hz gives BCLK = 1,411,200 Hz and an ideal total
divider of 68.  The old code picks aux_div = ceil(68/32) = 3,
then bclk_div = (96005700/3) / 1411200 = 22, for a total of 3 x 22 =
66 -- two steps from ideal.  The resulting error exceeds the PPM threshold
and causes S16_LE, S24_LE to be rejected.

Therefore when the total divider fits in the AHCLKXDIV register alone
(<=4096), use it directly as aux_div with bclk_div=1, and compare floor
and ceil to pick the closer match, to ensure the best ideal total dividers.

Dividers at or below 32 never enter this path, and dividers above 4096
still fall through to the existing DIV_ROUND_UP path, so previously
working configurations remains unaffected.

Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 6d0310f09b12..800c383ed2e1 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1358,19 +1358,29 @@ static int davinci_mcasp_calc_clk_div(struct davinci_mcasp *mcasp,
 		auxclk_div_id = MCASP_CLKDIV_AUXCLK;
 	}
 
-	if (div > (ACLKXDIV_MASK + 1)) {
-		if (auxclk_enabled) {
-			aux_div = div / (ACLKXDIV_MASK + 1);
-			if (div % (ACLKXDIV_MASK + 1))
-				aux_div++;
-
-			sysclk_freq /= aux_div;
-			div = sysclk_freq / bclk_freq;
-			rem = sysclk_freq % bclk_freq;
-		} else if (set) {
-			dev_warn(mcasp->dev, "Too fast reference clock (%u)\n",
-				 sysclk_freq);
+	if (div > (ACLKXDIV_MASK + 1) && auxclk_enabled) {
+		if (div <= (AHCLKXDIV_MASK + 1)) {
+			/* aux_div absorbs entire division; bclk_div = 1 */
+			aux_div = div;
+			if ((div + 1) <= (AHCLKXDIV_MASK + 1)) {
+				unsigned int err_lo = sysclk_freq / div -
+						      bclk_freq;
+				unsigned int err_hi = bclk_freq -
+						      sysclk_freq / (div + 1);
+
+				if (err_hi < err_lo)
+					aux_div = div + 1;
+			}
+		} else {
+			aux_div = DIV_ROUND_UP(div, ACLKXDIV_MASK + 1);
 		}
+
+		sysclk_freq /= aux_div;
+		div = sysclk_freq / bclk_freq;
+		rem = sysclk_freq % bclk_freq;
+	} else if (div > (ACLKXDIV_MASK + 1) && set) {
+		dev_warn(mcasp->dev, "Too fast reference clock (%u)\n",
+			 sysclk_freq);
 	}
 
 	if (rem != 0) {
-- 
2.43.0

