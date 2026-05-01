Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F72DA76C;
	Fri,  1 May 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631426; cv=fail; b=bhM4oaRgA6oUTlEwlB2tI6JGgvJC0cbxuP/OG1fDHuci4Ip/NG6/SgrQZ64t5hLlIPL1C1+fwHkLrYLdvpr0K/hNHrqRH05oyltSXV+Lpd78dn9aYb7RAU+6Op31Z0xB4LrjrtYL2pVVBk2cvAGISJQSpVjNsK20w3buQjsIpUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631426; c=relaxed/simple;
	bh=4v9OBEJSO7s7C+niogTUPEtwY/fJI5iENxCV7AUjMOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BDDEYhPzkesSnF42Yaax30NoluNOBCw7fd86RH+f4Eh7f5BI1Li3N+lwSwbguQLOKCVcuqGhiVED0RZFW2E8IENxocHDdOkSXkZ+fPDDeXQ3N6V0ObS+0bbhI05n1dcK/b6Z7YoQjefxPaGGanPTtyQ23Xxq1AmeQ6z4WotVG7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=j0XN8/PV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tSoaLdGC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="j0XN8/PV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tSoaLdGC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6417unmU1233703;
	Fri, 1 May 2026 05:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=1nZu3dR3LWhNjixE
	uz+mcrptVrNLgiJEkbR403k80oQ=; b=j0XN8/PVgXPoT2Xldnc7VNWvpnezGg8y
	/UgQiEpimXNVPqMJf4lcBMWhoxiKgWqBQPuIoi+w5HGsVsIrNqu66XgZJoa9t221
	AIX03m2BnLjv6PbA3TlR/cUCK+Gyd9dP3kMvgynYRhT8zsLHjg+LllCEzm08RUNh
	eypQLqUnZyQ/3ptz7ZiXa8DCC9H5tNdBTrRHzYZGj4OO0Pvi0ScforIL/xufb2iU
	3E1vWUzPR1rn3bXEBFYmDNMa3rUXs1tcn+vJakaaICwwzXIBqiaGV0ANbL9ipzPj
	/CgsgMffKZj7L87O9gyoy5l8+A1EZzW6e5Cdx65I2U1qPmYAZ3iWpw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023122.outbound.protection.outlook.com [40.93.196.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10fvy2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 01 May 2026 05:30:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACVdvxBIYc2flaFxyzpFLku2hJ+JKK2XLw/ItgGF8bywmgFj1UtXGa5INB1dX89BuFrm4ytjYpLlz/guegbwcL6qWfelXpt909zq6qGbwiGtVYLKgr2pVz+bCLsAaST3+YrBea7mkybx5iWEtWF4SAEjWcL7IxyGlr0IyvdIovOT+aPH/D76MPCfqo1KH3FoE0cIEZpeMG0ht92uEGdcPgy4812qxUSO95IDfCoIXRLIWrntchhLYK5YM8yoM+7oumS1kcTNcyLSSfMZyqK7NtQKPpX0m9ErMxhCXRAAUfbzwn3il3dTc65BH58qsxZgvQ83GmcObWNBgV+jAprqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nZu3dR3LWhNjixEuz+mcrptVrNLgiJEkbR403k80oQ=;
 b=oPgMLZxfiuDhLk1TS6QwrpiTuDFw1jULbjJFTijQornE6Fd0v2iqCg6NtNHpT1Ioz4zzdvUWYAlxVgOFq/AOPJgTDZqSKusHmSnfwd8RDQo6ZCjjXYGfNOPfTAL4pR+YA//eobxknLGdzy6Q7s2/Mhj52dOmPJ+47AQvwq99Nh4Cfyqn6jqDNMmShS1C9BJ+8wPFMfIQiYdBNzZQDISLTCJkGOwFfcJRXcsYjWWOHF0o7DsE9YN4dOzqtU8iidwIxCgxmM9/JWxjK1wtuYN8qIHwyEQtVgZA7T7mL9OaXI4odwf6akZP7oBJNb/Nqpu+UaEMheFtga5K71Slf6ll8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nZu3dR3LWhNjixEuz+mcrptVrNLgiJEkbR403k80oQ=;
 b=tSoaLdGCtyF9z1w9s3qTbr5NaHDe02aXatiyXfFqAw6kxcxoe3WVuTnAr3UTkC1Hxuw7Jz7I8RRMPXYL+IMlWYoI9yOoydr7dNi5LDc9+J5d58/8AZxBjVC7wWEb1JdFO2xdT4pAhzLpT8+3mQiQwbsxqHzX1Y4tCj0LWbrBjWw=
Received: from CH0PR08CA0023.namprd08.prod.outlook.com (2603:10b6:610:33::28)
 by CH8PR19MB9095.namprd19.prod.outlook.com (2603:10b6:610:26b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Fri, 1 May
 2026 10:30:04 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::53) by CH0PR08CA0023.outlook.office365.com
 (2603:10b6:610:33::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22 via Frontend Transport; Fri,
 1 May 2026 10:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 1 May 2026 10:30:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D7B6240654A;
	Fri,  1 May 2026 10:30:02 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CCA80822546;
	Fri,  1 May 2026 10:30:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Destroy workqueue in probe error path
Date: Fri,  1 May 2026 11:30:02 +0100
Message-ID: <20260501103002.2843735-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CH8PR19MB9095:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e110e1a5-8e0f-4455-0af6-08dea76c9bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|61400799027|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VXFWZ0Ft7bxYBhFN32sqcF425M+FkhH1VT6qLqSkpJc7fp+FG6LFAevGmDN6FiN7pQ59rJzzL7+jsDyKz8TF53sj4ML18SJnqb/pdaCXcEii5rX/FkYzfNo9NKzIrgRxWwi8PRFHFbfUsS/Oa/JoOhdQH9LXbLgfBF5En1yiDhDdemRb37x7IZX+bQ2xQlUoCb3h8Dpepuc6eshb69HtPq8/ZNvT1cT9hj/qYAZhHuB9vKSQGUQq3/vb1yvmnasVKV2GLmWFnYVRlEFfruG6ItqnyxJhWGzondMwT+nKfKUBJ8bOQ8ejHHJ7pbfe/977ljrNTd0t5R70B1FoX6ZTYKWe0HARUCSBNi803iKCqjb63lJ6D1f3s3V1Kobs/p9IGFcxvOh/s4zZ+jecMpCeMt1pz1yHLQ4v+f+uub0tbxv4VkItWo1GyyBTWHKe3KcavUNZVn4v1NKTujwUFxHSZ6NeYlZowQT1jijQhUS3LSzOfhptdRbEzNCPaYsycRq2tUXOiSFYWvlDOTPGBWbzqWTvP2NnUDJTruVoGAXE8NaVRPA8RCykehoQXgltZqdBs++Wxz9s/l+QL6D/p8x9P+cvkDAFiXCK7xHYSZNZCQ1czNSLrhpmP2G2zzJPTk03DwxUFr+If/0HsU0Q4T35n2K3RX3rQgus93M27zpLNf9T7n3FWVcJm99ns3Gc3RzeWfYizELCn2x1Vk/UzcpV3+gBWqG2VJQ230XYgHrmHm8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(61400799027)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GLUSXazEx8X7UdKDTVLnRlU2YfahNASqhp6INuf09kNOxiCXTG80jE1rmML/mpvfeOSlbknJ/8awYGH4epqqPY3Ntr9T1l3MDA/qLhzWY1SiR4TJdNo9CCTLPRNa4/WLtXPrhuMhgCsk6hk2ToBT9uemogeaiV9Pcr9Gc6pIR+jXJpJhhvB/fJao2ucGciFtL2+jmvNDLTKqQb9LfX9V2eIy4bkPh4GKxeJVPKjy9vuTZyQ06/iNKKmzIoUPlU7pOl6K+pLHZNhJZNCj+vSYHQUWmlKte1LOjIqcr+voaMwQ/7NWT1zKoBzTgNTKsKXRSWIbmNCfI2Pk0ICHj7QrOMayGj7mAoeBnca7fBM3tS5pmNS27VWwzp6VqSboayqCnxQ6F+5OSe2V7TZ7YFIIIlCymZL5vmz4rSRMFeYrvbSb52XHAecvR+PUIRi+h1HL
X-Exchange-RoutingPolicyChecked:
	ImoYLxFSJNzbTkZv3PYfsaeQFGEW/lESBrE/rG55AEqnBM/NHRszwN0hRn/ZCuKJpxw6LK5KRzkBPK/G+hH0YvGEZMTvlWXNQiZDb4qDJYp+DO09sAzd3fOWbLh4xdL9RVFCdutNe1zCfntgyHYjLHiP0rvsODqtfA9tXYh3SCdwj3nFgOK2+vAU/m2yBjlLRvEYVraIre5jBzitqX5fN5WzWTMdaqSu37OVTCfpu6RAoypXg2mV+fT5cexLRMY41w2DsXv3/n9LDhcLaz+9x2+PrAuJ/isib5K7DqEhJmPQ414zGfcrIyt8t/46Hs40N0hZaYmpyZvTj1vXqMU8qg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 10:30:04.3826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e110e1a5-8e0f-4455-0af6-08dea76c9bd8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB9095
X-Proofpoint-ORIG-GUID: b1mqZk4DuuumwJKOEQn_ZzFNIrKQgz-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDEwMCBTYWx0ZWRfX03V5rR6LFmzp
 w2ncprunObYDwg8jzUS5VFtRnyrdbox447qD3L9WW53927Dca3w+KwtNSKr2bhX/JIPV+5OQ/bm
 LV3s3d+VvV36T4IgQLLoWq36awTDYJFajLS/HeANo0ahzwlPTI126kivvW34mCGm4yv9gx37pUp
 md9qbOF2/Km/Y1DI+KlxDBUla9Rj3Z2eVgvV5HX5uaMUj53U3P++2vyvgNx9NXFTDGcf0Bt1blu
 VTiHkis778BBoYdqpTh0ASvye7xdOpS10chBqfMMzEOzDgoB+kG8aziY1esTKYCN6esuYC+H40v
 wP9OdMgYn/AeQyRXvydHlDpM7RuAHCEBRj26kKebTiob/Amqw5ON2f8utLmxV1mlLLW6L/R+Qm9
 Bba5G6nyodV+bIJTtddPbu/Oy6/D5DKP2F+ej+sF+kCRcggim5cPCMSk+wXDItltxoL7NSUQGWv
 lYpSSHOEGo8cb7v7k7Q==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f480b1 cx=c_pps
 a=+8ozu11IBk2Dcx/W9SapsQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=xUhIR0su6rBK1gKWfMwA:9
X-Proofpoint-GUID: b1mqZk4DuuumwJKOEQn_ZzFNIrKQgz-1
X-Proofpoint-Spam-Reason: safe

The error path in cs35l56_common_probe() should call destroy_workqueue()
on the workqueue that was created by cs35l56_dsp_init().

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 378017fcea10..401a41b648f5 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1970,6 +1970,9 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(cs35l56->supplies), cs35l56->supplies);
 
+	if (cs35l56->dsp_wq)
+		destroy_workqueue(cs35l56->dsp_wq);
+
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_common_probe, "SND_SOC_CS35L56_CORE");
-- 
2.47.3

