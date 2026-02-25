Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DD5392C2F;
	Wed, 25 Feb 2026 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018631; cv=fail; b=a6BzxZ7UFrSk7Eok2ygc2b/Tp1BIOMFuuc4uOHt0sgV6LLii+2VHzb70l8NlfI7V4cyfllNkDTrVn6yJ+KhyED47OKnKhkjRUWLlhGzXlOp7vNP4soWtfzskZjFYorVFlS049tzyG3vaGhcAi/DlbtMNFozzIbkSDcpUy1o99ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018631; c=relaxed/simple;
	bh=uuJkXZGnCib0zUet3Q9uXkPqslSZIfTRSOetMfHvu0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CRgwGlED8UVenWKgJ2aFp1OIPMMEWgKTaKNv9syv+RyDIvpifZFZpWlb55S2ZDchLZW4kCMXzblLaElPLFSl3ypZoYk0PKEzwrzD3Ph21iV8kQeEXxA3UyXAaZgodWwuPa3qDHKyAdpTn5M/Q20THAqsJo2sfn0gwEDmZaTmyjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O6BGrVij; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d8Yi4th9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O6BGrVij";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d8Yi4th9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P5TWBv2324916;
	Wed, 25 Feb 2026 05:23:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Km4EGKztAcV9Fobh
	QRP4bTUgYbBrmdNdQe+m/MuTBqI=; b=O6BGrVijcLB50WtYY5COpdcNwGe6Q5FB
	D4GeaDlGsRna5esC6nb94c6HigNY0irHTUEDKfABOEquXnPYZ55rIfNE3Hv8GQQL
	KzKVcrIAE7zssrujsQp4eYwEy78S+4mPSmJtSNKoH+GeSGB2ZYbqmLBbUDfKMHPs
	STs84M7wZdVsGmLF6V9mJYgz20UzdYPtL2wyek5rEdd0MTIcv8z1GwQOCWKRNUQH
	HzbNFfv1H3TA6dR/EqLKb/FJyIwBszyIFtpSZn2wSc6/nREsgh2CBYms2vLVW+JO
	7UTGkDTLcF5arRjBxriSX1EzM00oevmrMRHjk3b3+mZsocgT/KcZJQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021086.outbound.protection.outlook.com [40.93.194.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j497f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 05:23:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C29FGyhxe4qqX0NWFZfSoBSAyE40w0WmsavUPwIeN9zfXCCs50BYDBt674X3uZ7cpXEzSoWCkKyDEGiniMj4MOqtMF7ilUU56rWi+HaqF81q8CmVf6EqFQ4WCwtiQu4maZdvcfYN6LlkHXVJGNmE7kHw0+B9uw+QJvau0En1oa82r/Mmucav34DA904q6xRI+3mFbjmyF2W+rdTg4xpGpNeC49sph6Whw1MxjRJH1R/ttlz555SvUJCgnqE6bRWbDyiGaqTmPY1Mts2AqZQtMTxSiB3CjSvABlMPbuxBf4+KSCRRR16dlZCo80d3aqJfbdaWo0mABwFJMTxZG2UZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Km4EGKztAcV9FobhQRP4bTUgYbBrmdNdQe+m/MuTBqI=;
 b=lINsq0DLl2dWVVtoRbehJ0wFKVPyst4VxQZABnNWSkI5iFQC+kZIH1qYJi1yijQTsk5ru8tVRAvEQAJCHY3fLbWLrplPLQJArT59nsWGX6BdR6fO8KzcGJw9LNfNyhYH6ovO3Wnctg5RujpWggRF8tm3PRqAq0jPtdTKdxWQYhEKdqoLmwjQHK+IyDaSsa7YRM4wVUhvzCEVLF0LnCGAuanCTPi2+BC0lpyeRvHpjZ9I4dNmc3k63+YKGMgf9AHJCkJcwnhX0bB3L3g11I+zOTaprKIV42dHTqdL/Kf+7uzvrNik3YfZF13oobJkFOsAiOOPTrrH8hcSvorkbj/exA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Km4EGKztAcV9FobhQRP4bTUgYbBrmdNdQe+m/MuTBqI=;
 b=d8Yi4th92ICi7N6aDQ3hkWzNCkko4AOD3lHum5u3NRaCH1XIwIcozgPgSNisVI9VfcnLq/WdgwQYQBWeXuCPy2MufpPfubMYhZdwR+QGBnd7bA8fWzNH2t77K7L0l3lpvfdIvrGkFjvEXJU1FYcAWFhWeuoMFYxnr43roUybib4=
Received: from SJ0PR05CA0204.namprd05.prod.outlook.com (2603:10b6:a03:330::29)
 by EA3PR19MB9231.namprd19.prod.outlook.com (2603:10b6:303:2b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 11:23:42 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::74) by SJ0PR05CA0204.outlook.office365.com
 (2603:10b6:a03:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 11:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 11:23:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CEA2E406540;
	Wed, 25 Feb 2026 11:23:39 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AC7E382024B;
	Wed, 25 Feb 2026 11:23:39 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib-test: Stop including platform_device.h
Date: Wed, 25 Feb 2026 11:23:39 +0000
Message-ID: <20260225112339.1179585-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|EA3PR19MB9231:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e53a440a-9d2b-400d-a242-08de746054bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	bQ3Jgvwr301EN4pqlgP25qefWzwOkH+QM6nCOkZJI2OnF/o9Wmuc7NkJP9a5nT8F9W6k6HY6NhAxuaJ4bkhjG3VH6DiQaNtKb/ynmXVhna4rMyceHqJitPG74aMYfTGVmKKtQ0JG9YxMAkMSJ5plTkCAGLlhLb7RIWDAkSD+2pvO2gYtDAK0EgK10cWmxTdkHbuCCRdVL4eQgyYJSdQTQd526/lufLm12qTaCw0Q8lj2u0Pc2gjzq4k9gjFOzbpo+LN369KFcTnZppUFr0BdjBOWD67cs3QmeKr+NSRapG4FrTov3x3LWbj0ZpTHGSymajmqV+CJGxH+0Go1ySc/4Yx8VUCYT+PF14lq01mWUi6RT1Nv5OZp/m1Uyqb5cG3jytV3OvpZfTyvDxkvE11Xiw75e7AmL/fPujwclntq7ysAERUjNSirw4vXIL++N33MVaZiOoY4VUC9MMueXLFTryRFSTaiAYCdEA3rzml856mvLD3QEInQ4QjMZxOQevCM/HouS4MZZzCrijAqcmtEfMLxg1/TcxTGEHSkhxBFrz1xnyYpzRJJTfymmQ9DcFrxbC6vFTC6P4rI0r0wnSxtRWXEFO8UZofrPeAF0Z9fCkZkw1riRMZeQD4QAWlv5DPvLS6hrv+3iIINDrVUCaVWU1oDqTeyNa8lSt9fd792VezhShGANAMOA7DcEi4WwJBoYd2iMexpJ4W+LowQZqe6WXzzpgBUnZl8b+GV50h5HoQb9DaGtf2dYM9iwvwXGPDkbmqZFZowleGrvHrg8UIPX6GkXI7Dx7iUZbHMQ8+MLTgXa0YoTrR0SpG9S9y+/mUfRbvnENKEjaKRAz5/FN5fUA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	upf0CEWY8VcZioDjRuqf1Qqx8fENKUyJFKO0t/R5INSIrZldABuQjS9kOmk0yQpUOTjsH7mOKhvoQtDivpYZBS1Sc5kkH2Lo4XtVnpIySyNHyccGMffJFcTQxow+xLL0L+2uj/FWEnam/zObXkryfwhNfrGAYhem6JWGq6LCYqIJkGhMOeAStlp9CvLJwbzSa0W2LjygGa/c2w7LPRIsl4ljf1iPM/3vn0htyxEkArSBD+MAkw5Pn4xlzTnITy/Nev+dI3Q1sDlW1zJ/2+8vOMp1J7EK1cNLoq0C26WMTW0xforW8ZPQYbnB1ugQhYoV34h0LPW94ccKjqokGzPXoRs7AW4xuI2SR11EbbsaRiBJluuHC79eC7gkgz+m4nf+4UFOdIadlY8tOG5WCyt+CuEtxIXWVkzGzdLo6xETqltKHgOpwpdK8RPdeAJnZS0M
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:23:41.7098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e53a440a-9d2b-400d-a242-08de746054bb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9231
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExMSBTYWx0ZWRfXwaWSQjkK8zDg
 7gveNIODbtmjT3pttVFPd+per9cZv/KfuYQspqwIkyCbIX20ZIdf7WL3sY64MTE1nMPOoN9on8J
 0aku07zLnX3Jkdy/+Dh2uE8wg4SdhF0MSgSLyEPCz+6r9zxJh6Ck1Ceu/j0GmxFacAhWBfoT/SY
 d/56/uameTU9AslVq7YYMcqOnW06bCzIDECI18HpM4H8lFHHUBQMJZLlfzZsbKhuyImfhnABH98
 RuHWy5iFzWeHg3zGYvYYXl2bIJOzTxnVxn0G2Fz6yN7psnFORw4a16FPYCU4P0AK17VHCSsvx/9
 LtcFjkMsmGBtdOVcBTVc78qRbA6jx2icWQKa66Y3x4KDo/emX55bHmsEp2mVdRSVoS3BoRKz0H8
 Dz1cTBhLaVBf5HOxLKQuD1T3SkMtvXCQT++J9EPLDYtZsC+pCTimz/UKRfcMJ5ivE2Nf6iUsiz9
 u3KAgIBKZcxOOCx+sRA==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699edbc1 cx=c_pps
 a=9uorYk6M2NiaUO0sqEzvdw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=DBs-fRHfoGwBX52xYIkA:9
X-Proofpoint-GUID: Zc7j7lsGDdb9JQxpZ8H_4r6xPSd3ggof
X-Proofpoint-ORIG-GUID: Zc7j7lsGDdb9JQxpZ8H_4r6xPSd3ggof
X-Proofpoint-Spam-Reason: safe

commit d1965f008f22 ("ASoC: cs-amp-lib-test: Use faux bus instead of
creating a dummy platform device") replaced all use of platform device
with faux_bus but forgot to remove the header include.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 2b1529343f11d..636d0f3198b8d 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -17,7 +17,6 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/pci_ids.h>
-#include <linux/platform_device.h>
 #include <linux/random.h>
 #include <sound/cs-amp-lib.h>
 
-- 
2.47.3

