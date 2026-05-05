Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3A930B51F;
	Tue,  5 May 2026 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972113; cv=fail; b=AGAodRh1D+KRf8NvT/SY19aJFDUn3weOpI/pMdQ7mHKf59pvG9Wi14hoRvLDpKEVKL5RRiC3tnl51Ult+86zM0qbS/5cAunW2xqq144FtlvJg8nlrtgwHy1HdxaTZqbfTJj/M90hyGR0RQfZasKfTcJNvOUS9/nqoUV8uW1OaXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972113; c=relaxed/simple;
	bh=S0ZAyVbP6Z43AVKGRjzx1vTrEwsOvbmXoAEPi5Av3Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c1eghIqN251eQwNnrI0cvHN3f3Eu3tNamT21ipXbRdTvITMYLGZZsbbHPsUzpk63uR1n9RnE9JQBBu6sp9XhW23qcHxjPapvoadRx7vhf5hUijS8CKqdJ/1/gj98BgqOYr+jBZGAUkYALERL7ne2jpwcPctw63s3uTkI7861vbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LL/JEu/H; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SwCJtfKk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LL/JEu/H";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SwCJtfKk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456TeHS1903558;
	Tue, 5 May 2026 04:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=2FheDl7wozZfQuep
	HsinS4r7fioxDWTqMdA4qkVHxgw=; b=LL/JEu/Hopxswj3UNHXQ/5iR/Vm+WzpS
	+e47vHiD9nEI0qHiAHwrd697nBJvbWpOQlyxZEoLVgs/RnrlXaJDhktYnhC7PQZc
	wyNl6o5LPB0f11pIKFIZk9lv4evGuytSKHxcU/lFgN59KmTpE5aYrW3rvpOIZ+my
	VUmzCDbeluSxkcNrmW5SOe/1WGTZRcbIuCGy5uC3e1v+8i/iITeejL8gVOfyy25i
	jCGpUabOU6qNEmCzzHCnqUoeSWlBuRTxl/w0w7yTprmaBRN5zNe5n4UdpmJEmYy4
	vbSePe9K6eLvOjW0DNFEbIR7VxBU5rJLWoylrVkbXxrKoxSeF0fPKg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020094.outbound.protection.outlook.com [52.101.193.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0u7a9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 04:08:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPWFbLMj2Zyw8Jydub3E6R+c/yAos/syLMsfb+aVzOXiVMTrXRUcYAlIXTX/VD02dGeSHl1bKF3/94kIgNK3zlEm9/eFAxqPLxdviX9MB701y58QoNe7mLHiP6U16C/CX797mtUd3Gzxq+nPVOD6CSH6u2C+11tiLatvs4rLNIi0Sk/ZzTSpkLvxkIUlaVt/aJrhGYIyB9veICqsu09HFRcEYuhKYKa0t5m1VCwkZDcEe7kSxOKj6+IhW8WOWowhj7ayCS3gfwkfGbdbAwUNe439P5OvPV6ae7uJjt9x5xxQzt6sdSx5R4UZExUEoIK0Fk0HefD4J5ZDzS5tC0wZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FheDl7wozZfQuepHsinS4r7fioxDWTqMdA4qkVHxgw=;
 b=PEIirODHrxt1DaIAu2KuUYb6vfVFlY06y1m25gqzeGjt5/a0JfS57Ywu4j3veUab6ajTndyFVV+VQkSxebpvAFGTrKozglHqtRUhbBfbmg61C0EidOcIQPXgh5r5I01sjtqCWTZzJ2AjFi/V4PW6DcbIsOG/UEukmGRs5Q3k1Tghj14tPZtzPQJW7UtXEGHU+TTHZImOzrOkv6qfPQNKv16VHTeocwOjNwy22KJKfzGH2mL1Yy2BsLsP1cPh1HLgSP7Pp8/AabH4qm9GT5BTn7Q/6Vek0ct81CSKizezUSVJUfr/yYk/e1fc5ws4maVC6xuU2pWasYwUxbejgY5NEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FheDl7wozZfQuepHsinS4r7fioxDWTqMdA4qkVHxgw=;
 b=SwCJtfKked3WVzP1SXAEah7JaM2CcKKZn5eimgqBsj9av0rXKTaKcPoRRZOr0sbP3+ZkdSO6lxu6UivmiobPAO5wmSlkwX+5u1Yt85UOqIyXHNWR2BoHurQzI9jJqw16gutyuTfA4DyiszLnKCYSdrlmiSXVmNpjyeVqXZDAo2g=
Received: from CH5P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::23)
 by SJ0PR19MB4607.namprd19.prod.outlook.com (2603:10b6:a03:287::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 09:08:17 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::a7) by CH5P222CA0016.outlook.office365.com
 (2603:10b6:610:1ee::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 09:08:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via
 Frontend Transport; Tue, 5 May 2026 09:08:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C085140654A;
	Tue,  5 May 2026 09:08:15 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B366F82024A;
	Tue,  5 May 2026 09:08:15 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Fix bad move of jack_state initialisation
Date: Tue,  5 May 2026 10:08:11 +0100
Message-ID: <20260505090811.3697153-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|SJ0PR19MB4607:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6da9783-1b93-4692-7723-08deaa85d876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kkRiBvRdS5y1/uRBvtzXvqeQ/I8cJ0q/YIVObtMh0LyJMmz1sZXnOpmgu1h+dCj4L1WjRqPZm7UNAWAydJMxG7Vd4TxHqaZV0LSVL9WYkTFaVGwzDBTzSlNhdqz9iAQSPrXMqmozA6YUtRugRDoOZKehSHWc8PARNryelwg//ypwh2S6Jjd5lajRVQ8cEyMZT7G+88D2CV+TyryRcmuzOwkcABDy69jpTwIVg579lqtearKtRv5sgg48H35qRZPBXHWeA78M4VswyM/epeqEOmambCkx4oFlWrwxzDDo/dc/5QNUWSbtK89rF7LYYt7zadtdCoK5sxTNuwoqrG0aG4QuiaAWe3LJKYzjXlw+ZGx6RzvAewdkbUENsRkuq2IgfsIlhZc9RKR0Tj+hfcv9kn2JCrnUU2BbO5ygRa/oRM4yZaIWAZKV1WMCICn0HkDzZ1E5I3VA2xV1yPxiogDOOP0hcpck6VTpQ09kKMVVbCd7RF1e63nL+T2adiATvFSOyRcEBJ5jDO6wlbfsLEwJuckThybb7c4bDJlCh2xHSZE5PeTWFBeAh7c9WcB52pc3SK7bxGx+/jEipdTQdyon6e4U9QpEewD4F8uY/6qVUWgjRo60Sx4pEvjX5oeY3VWuOBeabWBSJ6IH4eO2kcAhDK+U1uFgufsHhPzAh2jAvRUjnc4A52VOJET2OmuXkStv/O0RVYvrn9ZGkmI7E86UXVmP+CdUv9kcLkSkz+vwKUQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2IU82hNWghwg7GY7ZntTypsNwah1+3frjDCFbMHBCXomyj7P61K6kALisZuzhsVNFlurAa9NZohQdRcIVLd6fGgRYIOmPG+sNOa7pF5ESfwZo1R+XJtsZ2I1n+W024wYdVLL9Zu22Ikz92J80XFqxnaQ1OY/fafjVc0oE20KdGBNJg0Y7nOsW93UeTe7iSqtwWWzrgI0vquZPFyaUbZrO+bZZGyfOmU+7mWSj+9bEzcXVKNBSt+vc6Odh/q5884hiUo4XDN0wgA552+HizVwjeeboUSXbdOGjtNQVCN1hy+nqG4ACcNx2T3y1aE1220MsfNP/UFp7Z5a3iqsm1YSlTqYF/xR+Ab7JqIqP5Hws12MzajY9xW4HIB80v879ivX9+OxBXxZvb5bezYUpyLMUund6BXRaBJeskCdHuVOl59YqORIdxydOWxPYpkmMffP
X-Exchange-RoutingPolicyChecked:
	NGic6U8seXZOAqgrdxMCFDeKJ//jP4RljJKuCNxibxXe8jJz1hjj8SQ0W/OJ4ZTnGv9lUaItT+dNdtDWW47rzwGGH8qKVk862j22TnL1GdZrUj7W7+spCgz+X0/WEz+NTALYZleOyJV+WcrL7R0ZVBzo/5W6e962bInTGlDuSuFhcXjcpH2+ABb1Spei9GnKd4C23Ul0UCqjBLhgNXmLvHnujGkL94LD+tZEn4J4DHUtkS7jTlmlhPnAox8JciCmzv9P4IjOHD0vMpRjSEzqjLz65HmYF6DTKMNgJaSelkkL73y0QRH/5F44L1D16drhTSM8RwwFsRhsO6sX7N4j6A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 09:08:16.9440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6da9783-1b93-4692-7723-08deaa85d876
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4607
X-Proofpoint-ORIG-GUID: kkLA3mq4iROs-bhMpdJrL410XzXf27aP
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69f9b386 cx=c_pps
 a=R0VBx4CaF46Y8RBs4q2Lkw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=SoqyjOwrTG4h2YStLSgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4NCBTYWx0ZWRfXz4euWvMCeTxK
 bf5WWYJRaLrAu44OWSym9ATY6ku4cOUJdX/Nj7eXulDbB0hlJXzMmbazhp9un/IWpILb7lriczu
 s3yKmrZIJzA5xOK+WDhcmjEnD5Mvao5azV6tG7f+z0fQ5fbKVSLiEN5zj5JGpzJQAzWi6chrVg0
 VKjAzG/jFGo8dWNefXU8Og4epaTvEtv1su9gjQBHOB/jGS7cuV5yiPrRKwuBadSo7Oesu0ALtdU
 ZM4q5f7BZms8qD6pVdwVecEh0XXTovy+Gbomtfw3yZpXvnsMa7Dhjsu868221HvScE85ungyMiy
 rn+GEOVEQigFanb4nViqtQoNGj74IXVxhh3CjYSY6EK5zopTftDt27RlV0wgqiyqZIRE3/YDamf
 nB5OsMmWDRjj5jvuLvGPLySnniQP6+4mzd8BubhkfL22va9S+6MifrJAhYVFM8WpCIVUiq30XUI
 ENnz0y3iY6wtaA5PXWw==
X-Proofpoint-GUID: kkLA3mq4iROs-bhMpdJrL410XzXf27aP
X-Proofpoint-Spam-Reason: safe

The initialisation of jack_state was accidentally moved until after its
use, correct this.

Fixes: cb3c257e0824 ("ASoC: SDCA: Add correct masks whilst reporting SDCA jack status")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_jack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index a2d95b124b789..ae9636622a840 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -203,6 +203,8 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 			if (!range)
 				return -EINVAL;
 
+			jack_state = interrupt->priv;
+
 			for (j = 0; j < range->rows; j++) {
 				enum sdca_terminal_type type;
 
@@ -211,7 +213,6 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 				jack_state->mask |= type_get_mask(type);
 			}
 
-			jack_state = interrupt->priv;
 			jack_state->jack = jack;
 
 			/* Report initial state in case IRQ was already handled */
-- 
2.47.3

