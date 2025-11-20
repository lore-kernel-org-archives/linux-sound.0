Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324E73612C9
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652719; cv=fail; b=MNbLKGEEuVviVgkBD7tOjfa2EUOs8tOYl3CrWhrgw7i8bY9oeMp74ZlNYZ+x3e85AV8exzzYDa75dz7vToYyeMJSPcfvBjaSutcB9m976Owlg/rvsWglychZ+gxCC/UcHOL6ANWmhb75LtoTonE8tG3Qrbu4hhdaybp2HTZhCOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652719; c=relaxed/simple;
	bh=dsEQKtcVspdLsJD2zlf5xnuJbQHNTrOY8HyxtCHKGy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fb+KvF2ib+k1bPQeYkRl+pRCwRIOBltdG1ylR4d5fElT3P/ac9NkWYHO5myMLpeTvRSScu1gy0TMxlNjc3dROk1eqjRbQ9tnMmchGjeZg+G5iksVhhmU4XDmNoBpgxuiPeuDtG7RRkGtGqRJI3nlYxOzgcJHyDyYIg7goIgpgto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dC2B/1SL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=T/rXWRlJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dC2B/1SL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="T/rXWRlJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK609eV460858;
	Thu, 20 Nov 2025 09:30:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=g44nItebJeh5vsXScXxEOlXHzi0+BiDxoYEQSntoiqA=; b=
	dC2B/1SLO5ETYz5890T9sj/8nDNYKj+J3FAMR+JWKxXF53ImFhtI9Sk1gP2HOSUS
	VohG8c7D+idVccdMMSiwSekbtKeKY61NPFWeA5kUYR4NeaJ/qZoIBWjsy4AuqiBe
	OF+CGn7HYAvTg78M+ZpU2RPmdFiy3u2LgN+3ad3XxSVgKsSXyDXTWpQlmUXcuwQW
	BUXokdnjDKNxESy0HNqnsC+7DLcIekcPJKQt3VzmDUhT7F/bvHj8f+c/WJQm3vVg
	TaLcOIAZc0bOn5v/13C9DP46hGLo+/4SIaPRF4gj6pu3N27wbEMD4EzBjlSnzxde
	ExlDb6ctjPZQX1mVUb9QRg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023101.outbound.protection.outlook.com [40.107.201.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1enjc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XN87Ft9idK+cJ7EiWIbh06Vv42YhPZeuYseBhbetzbx97fhsE1+bGuiCtqZ3aDoqaerkrAa/pbg4MxQeJ5iTGP0v8h+RFAlWyjwC28SIRkBnZk1cUn1qOC1f6Wq2kh2aQmYH0FsJ2Qt+QKfVxAnV8aA1c0i2rnL3tZ1j16+nFHwQfD6w1TgkedTBnjq2eKHEir/jndqqv27el5VzZ6MX36hVKGbVNVQ64q4qKqrybArM7IeRmO7IulEfqQJTS2FjPKyh3qu3BmhAHRaZhYQyCAP5duCQ//KAitXciLg5UIPkn4WWJ6Qb9OpuZV9mo9yLAdcrl6vvmJ2fVilq/jwVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g44nItebJeh5vsXScXxEOlXHzi0+BiDxoYEQSntoiqA=;
 b=Z4uxd3nrCoefWfRz5IPwPlcG4xY2hvjBoaFrNI/E0iTaKGfA2WLyZmSmQimOphuANo6YBm7xVAAdQ5iG5LNPwcrrvHgb/X5uHPcUcvHVXAjns9aUxXiu602hFwpCT7+nsR7ebIqB0JeNkEv4vhVQqdlTMenpxiFVKtET2OHYfsgqTd+MRkRsMLY974320S35UUwugKEJ/pkCHza3TgE1LoRhCqvbkrTGC7lAS+p9pastmL8JscsKPT9xkZBpMLXWu+GnCvjqki4nw/DATnftLq0fsoZOs8fPyJ/CVb2fvCSm88rya3LB+neoTxe+/Re4tS9rUXlAua773o/jbFkPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g44nItebJeh5vsXScXxEOlXHzi0+BiDxoYEQSntoiqA=;
 b=T/rXWRlJDggb47+FOdi1PVKzyh1rHmE/JfzGt7SoxiDxUM/hybvcyUd5KGLD2tuikqjnn3oxIxibOUM/uMhWe7BDDR6xWa1NZ35NpzXZb6Vem8w503K17uPrFnqUQDqcv0gDgv3hRXZsRFnOzemlLQyeTeRK1QLJRDeUVylhOJQ=
Received: from DS7PR03CA0179.namprd03.prod.outlook.com (2603:10b6:5:3b2::34)
 by DS2PR19MB9673.namprd19.prod.outlook.com (2603:10b6:8:2d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:29 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::c8) by DS7PR03CA0179.outlook.office365.com
 (2603:10b6:5:3b2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 15:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C0833406553;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9B63882026B;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 03/13] ASoC: SDCA: Add missing forward declaration in header
Date: Thu, 20 Nov 2025 15:30:12 +0000
Message-ID: <20251120153023.2105663-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DS2PR19MB9673:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e4bec73-697c-439f-9e03-08de2849bc6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R5ClTMgfkx7tdiVf+oYSnKyynf0ghZo6PLuc92kl1B01FgQkgGtXKS4pprEV?=
 =?us-ascii?Q?MxEsdjS9XtPxYL5W1tz13fPDBtmU0Qt0svR2QYkoxauRVc4fJWdCMIXYSe80?=
 =?us-ascii?Q?OMSigyA5gRq2Rj/3BeBOOw5CoVyhOj9ls88G8SGlQfqsxEiTE9uC4e5fE9kG?=
 =?us-ascii?Q?6XbD6BzuSpZgOJ9Q70eWLnTC+kZOAS8MsUoERUdZfX4wAprG2gDCOxH5rzv0?=
 =?us-ascii?Q?hbwrUopGzSJYNjNR8FsHCxtw/F8k6ZvDGnRyxUeORtKsO4nFM8rxpbfO+zWx?=
 =?us-ascii?Q?VFDePJ2R/PF9gwNX5g1mCP5B+p8PG0Q6x2DtH9/IcgoZcMGVi5qdztfxKqBH?=
 =?us-ascii?Q?ZcKycZ7sfqLScdL87bFuwgW3v5s2/6+aiTTt0V7HeQno7/FcEbeC6HPIHd4Q?=
 =?us-ascii?Q?r8c+3QGctslhksijJUjA659zEuklD06/Lc/mnqH1G2kb7II7nhDvCi3IHiWl?=
 =?us-ascii?Q?vUWVkpc3dzkOmfpYFRbzJtOSSEIfVKHgJQnFAEo38E9KX3+RAavb0BJvWG2R?=
 =?us-ascii?Q?TBodhr+DDgnsu0AQCwWy5onpDUft4IYKBK0TeiqRug7m7nmYJGg8C2kJ/7e6?=
 =?us-ascii?Q?ocXRwK64UgZVDoMdUVDPxJBKxpa8K3BBGqEsNWsFGNFOlfP65zdgv6Mu58Z4?=
 =?us-ascii?Q?mhF4E+J3mm12GQitzjoCyegx0HG5R3pVtlHbtxyUIHjnaO3hO61beY4A1ai8?=
 =?us-ascii?Q?Ng4MUQhYPLmQhznsYoANYM/MGXalVGjzfynamLqgzlwBRpbwNZTAsWW3wmCI?=
 =?us-ascii?Q?1oaj2+jXngfJiPGA137YlGtfRL6QLu/F50o0nf2Y55vwQfZ3VM05w9fHX11u?=
 =?us-ascii?Q?NIKM35rYI2BIKQ6MyV83ZfGTz6+b+VQrFICh9uft3Y+d8CcGPaB+K1wgGoTK?=
 =?us-ascii?Q?87pgK8szHXlburhAkD8dcVPYpY0eXX+lOGAefNyphtHIQgIx/3UWXP/3jf2g?=
 =?us-ascii?Q?2A5bWCPbdUYipChsE80FSPOU9lGrq1WrPbjLts0aHl9lsZlQBrXYsSdw25vf?=
 =?us-ascii?Q?2lr/H44gokkxdmH17EMUbJT4t1jL+PQRzvZjLcKNkqaNHmpOM+PjdS30W8fj?=
 =?us-ascii?Q?kLNzv9scve+yYfCXubw+8fhWgmAUY6aPlAqGeZhp+XxYlXYGeqN4Qje70k1h?=
 =?us-ascii?Q?5GBk+0CuHzQugpZJ1aPm/9DDx+K8ykHHiv44twf0f9mGKHcv8scmMBQJf3th?=
 =?us-ascii?Q?B83hX0Wk0D3HaKFF/WaOtnyHu0PRX4K6bZiFNQt0X4qeJbfB+b1lGIZgSZnw?=
 =?us-ascii?Q?jkKHgPAnxOGXR0rOZz+rw5YkFqS8UfiNIRKdc9xDeRzZubsSLgStiDQsOvy/?=
 =?us-ascii?Q?wUGchsOlAlfL8R00LZPhpEq3wriOoRsE8stDUPdEJheJDcMoVYjvZNR/EWEM?=
 =?us-ascii?Q?Qq6Ds1z/BgkfLk0LzeYGhaFMlaqv4dOJDGP/CSMFobeNhK0+2yYHmxx/Fgdi?=
 =?us-ascii?Q?qjuZpn85hebT5aX3iUxCWdQFRkuCHoDERzr9Clk2T97AOn4iQYybCJezbC93?=
 =?us-ascii?Q?zkWI4MmOiyiSN2ldqF5rSWZec9CMOMJ3d5EyXjGklkdu5r6vdLSK1J9TrCNe?=
 =?us-ascii?Q?8k2vi1Kxj0YfCjs4pAc=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:28.9369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4bec73-697c-439f-9e03-08de2849bc6e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9673
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f341a cx=c_pps
 a=fEtlOdDQS7EBvc2olrXP4A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=bIwRk3ihQrIhPJFu2ZAA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: eHiKB6LPiNMx8QpQGi4tjdrxsfOC6Tp0
X-Proofpoint-ORIG-GUID: eHiKB6LPiNMx8QpQGi4tjdrxsfOC6Tp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX2luU7ixWYV2h
 NAaYEuImUZIE2VzkWMpiLjmUzad8xYj4p1CDnqXMUDaNcoZ5+zt1UZ1jgI2BRjisKLIDlaT0kjq
 GlMFMRaIKKBN3OXXNai2yLvCuz3i0yhvKdBWNXY87bwsCq2pMFRJkJ/y4/q+c0lvsi9qFUSf3tu
 BT7SDjo0V+fqHXq8k7SctNJI0fBzWUhuYDkYDQmPwVs2c8AR0UUjKc4kA/AYmd99AtCqUbtYNWT
 QAA1lRMe2wAziXXcTU4jA0uD5Dz7h8Jq0UysfuWT9m8FyUIG0/SNDHJ6rcteLFQ44OeVtk3/wCN
 bDk8QGWQPf3E6YcvqotsoUilCN5LijvfnkxyqwtgmKf3qjQa3KdYDCWgb+pQB1b2RqwcsyTjgMd
 Y233JS9WfGIUZiB8I1ETMJfirA0oGw==
X-Proofpoint-Spam-Reason: safe

The structure sdca_function_desc contains a fwnode_handle which is
undefined if the user doesn't pull in an appropriate header. Add a
forward declaration to avoid this.

Fixes: 996bf834d0b6 ("ASoC: SDCA: Add code to parse Function information")
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 include/sound/sdca.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index d38cdbfeb35f5..d58d602212771 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -13,6 +13,7 @@
 #include <linux/kconfig.h>
 
 struct acpi_table_swft;
+struct fwnode_handle;
 struct sdw_slave;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
-- 
2.47.3

