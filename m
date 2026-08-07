Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937754B049D
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061045; cv=fail; b=SS3pKQ36guHTfEq0jLcd42GhJM4CfHvXLHI7kXWqoo2fPoA1GDrbcbh1oN1p0/XOuBX/0l9ZWONqam1rV9bLyGNxlbp3Zz5X+TL6P4BsZm8mngVqp9D+mykyFmcpNlOIPmzb4w8L9pCMy+vSQinZdiLYJMWfVZyB+mHIGs39Cqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061045; c=relaxed/simple;
	bh=wz02vjOBKsfqM0DrS6R/pXPD5speDc5rbDbcTL3dQpE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ANWx21CUErX+dNKWmJ/TIuMqwgIL/2IvNKG82oDsf8TmgzLS86M2uDM3CqxHwEFySeRaNTC0FUCzo9E0cino7Xkt+aBiSY7KbkDhA30CSDiaBOkIDR1opg6xsJvVIUbdHisyQ5PzKjGS4u1u5LUDPxPqNCJvaDoBhGRCy55qD68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jJWP/PXd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F7KFVX7l; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jJWP/PXd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F7KFVX7l"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 676L9lCW1946610;
	Thu, 6 Aug 2026 19:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=poGJwLQm+sPhn
	S5ylNUX0og8vzIAyuUWE/FPSbRaM20=; b=jJWP/PXdQSI/J1A2ZjNdGHxauRY+/
	+w1jMNbuVNoD3TJrM/p6f4RtllmgUn46/84Obdp2y6/7F+hioLEx7FgTtH7nRzwb
	tvMrA0KhF77F/1xmXksiY2Dv0cIcypnTErw3FrQDELzA//VyINCGljs3Y/oqJnDL
	d6lxA+JvybIY+fjnlcrHnQVMOCLR8SQiOtxSu+oPUcXYDa46N9hm6u69t6IvrBI4
	ne4/JpCsfREby0+lFdLTwY8fU4a7/vJYygq8EDAObqH4YlbXy0LInBWsoFXVO/JC
	21VObz+iJYtIlAVK09p0GcX35f6k7uf+OTjiu1XjxzhcOGXtvI6nmOr3w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010012.outbound.protection.outlook.com [40.93.198.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fvqjge7sp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 19:03:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7Ppu2f4F8sf8IMFqItbYxybHzZYT/5ff7w9AstPOUXLtIFpkT8SsbkmMYMegZV5RRF00104HAjQm8H/g9IjHOJEyV9yapON+BnZNRACnHK7v41HzYQYaKgRMy+yJa0CDsvB74ExtIPIu5pUo8IbVJZ8c8upl9rnLwnyztSoyPmtb/E/4gdkJqX8J8EZUzqxFUgHIMeLvIW67CNqvoqdPH6ehniCpAJJDf6YeF9K7llsN16gLY+sbSm04zLMPNI9YCJLfF4jsUNeL5UW+kKuZHY3n1dKLZm4yJ7mRXdu6et3X0fwv2s4mA+WIUxGoTmRc1L9RqM/LMAnxtSgqcXCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poGJwLQm+sPhnS5ylNUX0og8vzIAyuUWE/FPSbRaM20=;
 b=yCt20VbIBen0ZPql9ojwf5KmuRgFOS0bMzYdrPwdzwRCCoCsPQM5ggmBzHZWblLhOGaTZmwjlpZOmhnUzK7JeF/UXLuPkcEzWwYNW9yGrMum/gKypJRAWM6tDtunBf+zGohBGq0RH+132YKpRDvKyDLBdvQF6Ezbiv8xhtmXnAUCcQj92sbLhZFlU9zu11uCYsRdu4MV3oiDlTzmKYyzjjkXnkeq0kBuSrruoCqu9uI+h8duLJB/HKdS2q8dHCq7EbseEzTZoIgGWlq8RC2VsY7cWawXfKb0ZwbI/FtqqYXa10TBv0oXxJQxUZuPJGdi76+Qc2ngkdxWUJkbW9GDPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poGJwLQm+sPhnS5ylNUX0og8vzIAyuUWE/FPSbRaM20=;
 b=F7KFVX7lnSioCOAHLOH8vLgrVu4hpiZ9iYCUy22HTWxzVlaLVcinIj1kzl0KUAUC5N98378OpSPAFwXeZi0tNuYCsl1DCTwFLn3wmtpuNEAMA+GJ8k4yGWMMT890+xm0o3E8OjUq6pxJJwUJxqYy5H9fV6MmZHtKOG2ESXmVKqI=
Received: from CH2PR14CA0009.namprd14.prod.outlook.com (2603:10b6:610:60::19)
 by SA1PR10MB7831.namprd10.prod.outlook.com (2603:10b6:806:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 00:03:16 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::6e) by CH2PR14CA0009.outlook.office365.com
 (2603:10b6:610:60::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Fri, 7
 Aug 2026 00:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 00:03:16 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 19:03:13 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 19:03:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 19:03:13 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.253])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 677039DS764865;
	Thu, 6 Aug 2026 19:03:09 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: fix clang build error for goto bypassing cleanup variable
Date: Fri, 7 Aug 2026 08:03:04 +0800
Message-ID: <20260807000304.826-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SA1PR10MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d013f4-41c9-441a-5ffc-08def4174853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|13003099007|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s6CHvbzUCj4Q4isRwg+p8vybjVbauODU9jUWqphxVq84eQw8oQWJVK2D+QYDq4mbG30oeDJDETTo2QhsD/IZvmHCQW0WXAMI9UqztmwW2lJUbRAVjgG8qwuItZlfzEuksK369qNRVmkH+E1H9qCQlb2Dn5L4VY3zZ10L/5WFyaW9AXmmysvohrqpzFNn0+MqAVtQaGxiHxZxROnFTRM9Nr88xjmTn0aeGo9iAYK/PDNP8JjgZhgFKOBIuT5DDf+cQWFE5NFFLcVqPcLJ+h7Cr5LC+y6QeBvFyAxV6UBMRRhsZtf7WdwA+/KmH7er1cZDAXqP5IF3uIXy8zLj6IrXRM5IoSvXWxG82CemBXTqxu/CVkqX8AT+0IRkfTdIReMweBQdOvc78PN2uS12Yv6cB1FKRiSUqyWxa0Jo9RFynn3qvbOb745JIHJqdDbBtvDeKHUaGWAZjKd6A5NKhlrCUGXnWuz7Dj/34gS59mc25MauG7qbq0ZNPdsVSqFWNZ5tW7rEVh/S93VlK+hvCiV8nwXMxtDo/A5tc+KxT/ycs7/87GgVTlD26l8rYD+WPVIbg4IksGLxSjkM5hhWI5OWon3NZs/XH2uw5FybVP1bo5hdu60xkewDUNmNU0AC70b+DF+qIYbB1QZp3I2iaCyYICZghBe+ZXJPn6Dw9Lzbj6KBTr4iFK0u5lNb5qUqO1NptHkBGpsqvLc+PxhtdTveyQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LsHccsVogvpL0PsDd0sslt0Bb+KwLHO2cza07nXQN4RGdrpykMidPoTkutsqGLTjGgHU70L6HIMU8kHNwPqVyNWDqUi431TkalGZeT8LgjF7xbN4yK2OUvDnW3HuDwZAQaAynsZHqyqGAJ6+5Nfe2mWGGnF9sTHxg73EsV9UUjLumkwOM+uV1OSo6JyAWUzAbvEBCV7w2vgMpxPMJrvpHX+wfRKhnvMpaFtOnfHAcQFAWeMSqlDBotONyeINJBYq6a5ViK4XiCsLsjy3DrPHZmIdirTGjRqZJ3oL7YMaKGydkNWwwZQmIrFVN6ocoRIw+FKJDL9nvOc5qUce2Eml80RvlGuGjBwcmZmzpzxb2WcsqGDDEiCC3FWKSR8ZHwnP3Wf4O6no5rY5ngWy13tQnnXh9gUF/GLCZoBPdFgZEdifG7OmltCfjXNpb4AUCNBM
X-Exchange-RoutingPolicyChecked:
	atHaBD7Bp8atgVfp383RmTpbRBluB4jkR7SzbO/Xds/S8/k7j3AYO9boeSHfWFX2KHPuzp5n2Sv44fTnLCvfn7FDlhz6jxLQRrbKPt057jMNaaQcC86xo4SXKbh/ONG6EyfJbZUY9clior9OnyISR/bc1vfF2W/UnjdO3XC7w1jzX/K9rwzRQpXeR504Jarj4cuIxSYlvQB8MtRE19FpKT8KbVZS24/p0Sb1QWJVHy3mgEvFmTiHgIH1JWbp5UjA6vUJ7Z7qUuhuRvYciaoCEGEfYClfxFw1Xr9veJf6C8egZUnSyvx7/fJY2ZQQRgY5jurQrxVx+7U90XNCGtIL+Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:03:16.6309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d013f4-41c9-441a-5ffc-08def4174853
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7831
X-Proofpoint-ORIG-GUID: LR70C9tq_pLjJ3GztBi8CYGcdaTn41Rw
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a7520ca cx=c_pps
 a=Ho/Krdd5x/ljPkV1+9yTnA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=sozttTNsAAAA:8
 a=pfiS57PcdICeT8Cn91AA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE4NyBTYWx0ZWRfX7SgKwVLXYCe7
 vUFF9oaYbIuANkcvrzp7pHWR0FvMrbc01qE7c3H4jfpLLEyVB16yCykOdU+Fe9oE3q6v640MOLO
 7hEBrfcmUAqceE9MC272KcEuhb9PuoA=
X-Proofpoint-GUID: LR70C9tq_pLjJ3GztBi8CYGcdaTn41Rw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE4NyBTYWx0ZWRfXzqKAiO/PnE1+
 AZIc+NWZbEyjoxryc7dNwEK+F+wDT5AnANoc8ktFWJOyYkoI1JoeViQzRKQ9xko1BfIXrIdbGrn
 X3PlpkWeIvCKIWZ28K6pgNpPLvZN9qRCfDygNz2JrMJ1WH8Lnxsb45Dw33lC02Ooz0Ybc+ppgFH
 Qbcyo3kGSxWKEp5icOdtZ2lLMg5yagzV0eSXEkz7y3W2jKK3Pe7N0M56sPA5nsOUYAq8Ky+068k
 xSEyShvuEYSulGdgV/P2t6vVhELI28Bu9rAfAi/MQ8E6ijbbGRawm7IxiK4cP2YqD6FmslXzbNC
 b3jj7IwgWw2T6FBtFo57PJn5nqq5OmLPLn9SlYlGHC3gfcu4+T+Vm29gHCzP3yIWN1Eieg37Bgi
 quHIU9fefvEve4xjKFfP/+sKMTK48UzXOSZeLQEV+6Z69qDck/9mf+x9e5BnEEGk5Cqf6LbdMsg
 iRTs1a/VvsgQW9x/nOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_03,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060187

Remove invalid goto exit paths that jump across guard(mutex) cleanup
variable initialization, replace them with direct kfree(src) and return,
to fix the s390 clang build error in acoustic_ctl_write().

Fixes: d75d38dc4604 ("ASoC: tas2781: Add a debugfs node for acoustic tuning")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
v1:
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes: https://lore.kernel.org/oe-kbuild-all/202608060659.Lp45DCOl-lkp@intel.com/
---
 sound/soc/codecs/tas2781-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 70229e8279a3..f15ea99e9119 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1663,8 +1663,8 @@ static ssize_t acoustic_ctl_write(struct file *file,
 	if (src[0] > max_pkg_len && src[0] != count) {
 		dev_err(priv->dev, "pkg(%u), max(%u), count(%u) mismatch.\n",
 			src[0], max_pkg_len, (unsigned int)count);
-		ret = 0;
-		goto exit;
+		kfree(src);
+		return 0;
 	}
 
 	switch (src[1]) {
@@ -1678,14 +1678,14 @@ static ssize_t acoustic_ctl_write(struct file *file,
 		break;
 	default:
 		dev_err(priv->dev, "%s Wrong code %02x.\n", __func__, src[1]);
-		ret = 0;
-		goto exit;
+		kfree(src);
+		return 0;
 	}
 
 	if (len < 1) {
 		dev_err(priv->dev, "pkg fmt invalid %02x.\n", len);
-		ret = 0;
-		goto exit;
+		kfree(src);
+		return 0;
 	}
 
 	for (j = 0; j < priv->ndev; j++)
@@ -1695,8 +1695,8 @@ static ssize_t acoustic_ctl_write(struct file *file,
 		}
 	if (j >= priv->ndev) {
 		dev_err(priv->dev, "no such device 0x%02x.\n", src[2]);
-		ret = 0;
-		goto exit;
+		kfree(src);
+		return 0;
 	}
 
 	reg = TASDEVICE_REG(src[3], src[4], src[5]);
@@ -1727,7 +1727,7 @@ static ssize_t acoustic_ctl_write(struct file *file,
 		dev_err(priv->dev, "i2c communication error.\n");
 	else
 		ret = count;
-exit:
+
 	kfree(src);
 	return ret;
 }
-- 
2.43.0

