Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90923815DC;
	Fri, 26 Jun 2026 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471992; cv=fail; b=cmfbb4hInqYm+kKISBpKW+2vGWPvxoTAXgruhoDms7l0+5+LfxIVZcNBVwKPvuyhSY3fYyQgUea9n2W3GHoYk6zNXc/1laTTwDuNFF+6RlzjYFq4642YHM/j4bb5gX0Zb0+dxUCHnZPr7EF10/w5Jd4xeJkHKR5EEtmOoRy5Xp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471992; c=relaxed/simple;
	bh=+cMxJn7tel2kPnD7L81K60gjXIcWMCe5N0YdbpTc+QY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MnCsGNPEDd8jZvN6V65VoejZDcwzSmCA6hxRv6B/WyQ8aYBuX5XBZb021Cyn0dJ8YCXzgl2o01FqbDJtYTUykgetqz/za1X5Dn/xFE4QltmDGoKU44y3WPzi9h5Yr3VtzDbsLbmBZpc64LEepR0cA8886CbSCBhbhGc4kUG22sI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=JKDsQPgf; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cddPftet; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="JKDsQPgf";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cddPftet"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q9upcR1648153;
	Fri, 26 Jun 2026 06:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=hqjyrcM7x2Kaq
	56KpL7qOZ4xn8t/GVLsrhBwe2bDaYY=; b=JKDsQPgfI2g58skTcFJJ9FK+FVI6T
	/XTPtfG+9GHOXUuZq3IhdPWCoqKzFa8lqmmByqYmgf4zvS98ZIbQxUIUGZaNfidb
	rnspSdhgyAyBx8k7vfCKkJXjpluHweM54tGZsQdwbZkaVyg0ykhm0jaa/wCac30r
	AkHcYcR2sTDAOT+O4BQ9WW4YHH4KKPc71PlHcvU9QVHF1aS1yNZ/3cNqjOL0+Dup
	7Ct9uQ70iPr91ODSakqWRFJxr//T4raciYNuDPPEMQkQCMw9sa3kbf93+4OdiJVv
	cTWt/s2Rx0oewF/Q7sF3Tr9U1wXboeNciqva3MhH6Ol4GIzLambOJPw6Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f1h7va1pv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 06:06:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNOQH1FamCI44P7hSzDO/B/b3nrLn9+ecDwLGaHW5/P7JB5vJ6GxVdJ5RFAH50l/x74Z0R5Z0svGkNO4nFb1rROZfRobuqxuVTsbUAgb/IuTu2CuOEtSN2ZrV7AzMJPP+o6z20pT3tivPdFza2OrB3RFb9jcf1F2NL8m6GBprLXE4aTXXzOnu3xLP49zyEJ0oXtApYWMCicFD52ydpknM0X2Cxu6BAIOjSKGLrmi0VLpED0B3x0cJCqkf0uJtkYUW0q4XKdidk1eYnABlbZqWZQH1y+z+61eLlf59vWyJd0W1S9WVyb94zCAyUL1gzxEyGtW58yEZ8kR2EyGmfWbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqjyrcM7x2Kaq56KpL7qOZ4xn8t/GVLsrhBwe2bDaYY=;
 b=sOsNRYAbbteSdxsPykq/2xzkqdJSc4shxAboW0jlznD3C4zf9J1PUZ/wEgxN1jYlRc5IBLMRGcOIMCsgbS+CI04SL8TaZFS1qyBG+8l0SH3Df/ygHmnTGiBGssXZQZWotFWQv6QD1cLhH7D7rcR/a9V5nO21zqhD1220HWHvnUFk8l8ex7GX2JqqUxZXUDGl9PO+70xR0VuC3zmPvY/ff/fpZ96SfYhbMkvXS//D32DnQ1aUA7sp2QqU8OjyI9XfcgcPdFm+/NOBsPp9ke1nOxavxJ5gtOYuQkCYnB52ZngJxiq+rwkVfyY8b2Pd+jWU0hn/hWWUfBYUoYSwltkBgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqjyrcM7x2Kaq56KpL7qOZ4xn8t/GVLsrhBwe2bDaYY=;
 b=cddPftet+aK1M5raWF5jyfHw6FM9LUGJ7jIUjkSJe2dF4u8ZyxhnbUEkIXJV1Mv5UsuhYtodSxMiIAHtHHdOugvtsv8V5OrtmGVzMQf8MHBRKIvd/Spxy5URWd69VsbUYsmO12jRORMh1gNvLdMICXxuw94VvU1Lvful/jFYxt8=
Received: from SJ0PR03CA0350.namprd03.prod.outlook.com (2603:10b6:a03:39c::25)
 by CH4PR10MB8227.namprd10.prod.outlook.com (2603:10b6:610:1f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 11:06:17 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::57) by SJ0PR03CA0350.outlook.office365.com
 (2603:10b6:a03:39c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 11:06:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 11:06:17 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 06:06:16 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 06:06:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 26 Jun 2026 06:06:16 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65QB6CLg794448;
	Fri, 26 Jun 2026 06:06:13 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <jwboyer@kernel.org>
CC: <shenghao-ding@ti.com>, <linux-firmware@kernel.org>, <13916275206@139.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH v1] linux-firmware: Add firmware for new projects
Date: Fri, 26 Jun 2026 19:05:47 +0800
Message-ID: <20260626110547.23469-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|CH4PR10MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b63d0f-162f-4b75-e20e-08ded372f218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ng7yJcSBGCGnAP9MN3bk55CC/uXZsQRkBn15oTmS1P5J7s998nGoToNL/DUlofF1ipJyD8fAtMRHxftolJb0rYmiyYgkcsGBP6U0/ggqNRrYQxU2LUY3pZWUccXalwhH33Hl0jDtYee/pqu+UMfx2lIf3i7sxLJCGBXyOBTFtjp5B9IcRIvMPkP4d6vSBPTejtO+tRXjQ2L416bwHTYXu5SIoAcM2tV8VUqpSkFI2oifJNocV2ggS7+P/d8SULOUB+om49ttzuaLRM0HIlkYWjzCsoT6XQuHMmlIMBdgsZk++XTh7Jv+CXbY/6q70nT39iNcGs0LLYtaDw9Ez1kDQGsZt0ZKje/tYJtHkeytK7Pviokl1DqvfYQrIDUzuD+IkZUuzhFClZEX1g1Vufb36+1EyHuieVy7RpwrQIwUdOGjFaIr0fLv44hoFZwkNx9tuC1dFk1ZGjew0x6cx/vajI5YACM903Q76ZQTog6u21iYT8IW9+Mwom2EwyGct16yXIY1yeVUQA8T8foUbFFlkAihTK7Zv1U515+SXaQKYC8o03LB/7hJo+6EfFUzuOHUhbHIwljcOokjTHZDDrBWcCQUWZtCR+blovl+Fcyn4UrjNitqwv6/8LpFOC9pX6qLc7xUo/PCrwwEp3BceXv5g25OkYcM5eT5HOdalkERe5LauhQAXX3yHeVDgT40oO7lBnfjf/fQV+/gek8AZrg/3g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AwTkzP/ilC0kupiklqewKAxUsTj+y9AxdI5w7+zgnxiFjXbEMy3AoX9DW3Bij9cTs0S+WxrYyrm+RbytoWHbgTm4Cu167CyLX5OXy7XFe5/MBfTXLQVM52QrqgxAqFcAO/mSQspAUlrx3UoFNC4lS9qsrUlfT668Q0Ge6390BcPrunhUBmiv4HOPeAdXq4ehl3pnAPna1lBO2Zxa0Lb4PNwlcH9j7qv6RXQAKUe9al3EgzN9D8mDwtri+Ail3TAJW/Xa+upyvOO4CqgbgB0rxW3cERVfmyC9mib1I0iCzmJRNbad7M5NcTdswwV/0ze2XKJZuuiuM/sunA6zZyssRtJ8ZDQXQG5LUSq+WsqnZOGUKCFUy/10im8OvXGoSGDAPIKu5VkkoMWMwRL3fCyJl1wKVGJTz6iDcE0k0MVNG+7Q+Z3B6X78EY/e8QuaiXUG
X-Exchange-RoutingPolicyChecked:
	GVKrAFXGKTufBMJ+Bv8xG+Oy6iU9cXko+psnqFKuUDpRyfujjHH9DEy/NegJAaVazgirc3kfHOSHBdRlE0HR3ugDdhipe1nlV8ir+HuzwPA/GXvuk0QL/r3jQRTXeL8Nt5tLXpwyKTu0J2BJnjHy1OXJ05kypCHr/YGhV8dwQK/8qYMCSs1Q2jDAXw4+xP4YIE+DduaDGBMdH13XzTUh7N802e4EAOLOuj9Lbk2IwKoJ0CsslwLPmlLLxDJvGrbON95+mOpX1sTQ5PC0FqX8nPg371Dnc8jZGbpBCldeotBF5oA44ovBeHJxKh+OfywcGql1Tm7thnBX943s0weErA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 11:06:17.2881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b63d0f-162f-4b75-e20e-08ded372f218
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8227
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA4OSBTYWx0ZWRfX+bEHQw2yHMHX
 UgyFiZJVxfDB0H57HPTVE7xhIetLF4vtO6x+MiK6umvTPCeZRkO/JV6vMlXMrnNQZfzjGN2PxnR
 2cMncXsBhxw2xXEhjUPKlw2S/g1nwFo=
X-Proofpoint-ORIG-GUID: F87BbwqFn9KrX50BkIquakb-e8qa1wke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA4OSBTYWx0ZWRfXwyCxjAKQKyUk
 U/IO8g8beTN7yrJuLW987Iyy04E/9FfzpuOtQlsmW7xNLkS3rXV66QJWmSLs6RMlWL7Kvijp6o7
 QpmLLzRI/c2GXFrghY/mQyeGfRcBaqZIKyymhUNy9SRdFT//mg6MMVt8L+ytFcnXNx3dCrICB/F
 MqYAEneCoWptn2ztCekMdUid7UcSkvm86lnNjuScHLhg07WUtyuSqhyIwJhC+8ThlKrsrmv/IQO
 itVxeBTok56/WAt0FBMZ7rWsARo9JhuNk0+fEY5cWa8Kn3JaenlOSdj56Wv7fvZn82wEHNHcCDx
 af0ywgvsmnN2ewIj9dA9XmifAe776YxLH3NLq8GRwy0JMOxtcX3pXE3e/Tx4OxGepzjy0Wrsht1
 eLRsYbIMozIREa8GURlnrsHxtnoxHgN7LbG1TmPy4zpkeLo+Lp9wI8tw9hkX/UuqmlKVnfMdTYW
 yrTSxbKZFsx9tQCpmLA==
X-Proofpoint-GUID: F87BbwqFn9KrX50BkIquakb-e8qa1wke
X-Authority-Analysis: v=2.4 cv=SJJykuvH c=1 sm=1 tr=0 ts=6a3e5d2e cx=c_pps
 a=WVTIIPXEjO/6WBYygohQVQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=4FnRMb325A9iZhwXA7sA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260089

Add firmware binary files for new HP projects.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 WHENCE                           |   4 ++++
 ti/audio/tas2781/TAS2XXX8F94.bin | Bin 0 -> 49824 bytes
 ti/audio/tas2781/TAS2XXX8F95.bin | Bin 0 -> 49824 bytes
 3 files changed, 4 insertions(+)
 create mode 100644 ti/audio/tas2781/TAS2XXX8F94.bin
 create mode 100644 ti/audio/tas2781/TAS2XXX8F95.bin

diff --git a/WHENCE b/WHENCE
index ded383de..680d0f94 100644
--- a/WHENCE
+++ b/WHENCE
@@ -9661,6 +9661,8 @@ File: ti/audio/tas2781/TAS2XXX8F40.bin
 File: ti/audio/tas2781/TAS2XXX8F41.bin
 File: ti/audio/tas2781/TAS2XXX8F42.bin
 File: ti/audio/tas2781/TAS2XXX8F62.bin
+File: ti/audio/tas2781/TAS2XXX8F94.bin
+File: ti/audio/tas2781/TAS2XXX8F95.bin
 File: ti/audio/tas2781/TXNW2781RCA0.bin
 File: ti/audio/tas2781/TXNW2781RCA1.bin
 File: ti/audio/tas2781/TIAS2781RCA2.bin
@@ -9785,6 +9787,8 @@ Link: TAS2XXX8F40.bin -> ti/audio/tas2781/TAS2XXX8F40.bin
 Link: TAS2XXX8F41.bin -> ti/audio/tas2781/TAS2XXX8F41.bin
 Link: TAS2XXX8F42.bin -> ti/audio/tas2781/TAS2XXX8F42.bin
 Link: TAS2XXX8F62.bin -> ti/audio/tas2781/TAS2XXX8F62.bin
+Link: TAS2XXX8F94.bin -> ti/audio/tas2781/TAS2XXX8F94.bin
+Link: TAS2XXX8F95.bin -> ti/audio/tas2781/TAS2XXX8F95.bin
 Link: TIAS2781RCA2.bin -> ti/audio/tas2781/TIAS2781RCA2.bin
 Link: TIAS2781RCA4.bin -> ti/audio/tas2781/TIAS2781RCA4.bin
 Link: TXNW2781RCA1.bin -> ti/audio/tas2781/TXNW2781RCA0.bin
diff --git a/ti/audio/tas2781/TAS2XXX8F94.bin b/ti/audio/tas2781/TAS2XXX8F94.bin
new file mode 100644
index 0000000000000000000000000000000000000000..84e5d20474d182828148f408b451ece8a948b140
GIT binary patch
literal 49824
zc%1EA4SW>UwLddEyF1xz!UiHq_{s($h7U0yAXJ1&NXUi{yCf(P(IgTGQ6%9b8WG4Q
z3@K_%z*;M4ZB%Nt^=aSxSw;L>1O6IOTPm$pY-?0neYLebEs7<{zW=#1vn(-C@T2e7
zzS-aJGBf9%d(OG%oO|xMH}^7W(xeGQ?QNSkjod`^O_C(SPom|MAG&GY($!TftH)0)
zosyq-0sk|#G<(v7DRc(EctMP|&F!O3CQ1Q3W$`~EvY>Wl)yhi$yy}XjXTm%BlgQyP
zU->CX*GbnAjXR9@T1ZjXEU832+6d|bBwB*vsn3?;tarJCJk)dkb~%jt9(l}(_!^z+
zyD6OG)!QXmZm*AkriyompevKoEUN~dOf}82k7*ajww1F<mZzYk#u?vXAITb}%K;b3
zLB|G)q`lKhk$0OTt_D3IDf(<BRSqaGLf(aVmmqI}zE6?$c7^bCpzTCCKn^)beu@lQ
zFLdBAWY7ajs%Qh+csk@Px>w#$vq8%bIu89+K|=<O3qYg49E`sWbQOKH;-tvn$wEHO
zwN=jrPL{h2Z6vhql=r*ZTDn2AJ!36sI6y;^wfNiQpj#9C6_r4PC^Do(&<Ic%?MR<P
zlbT+l$7N0FM%|BD_kjCay5nzC%C?Pdj(80{4cDsWGV--%6E*h~`t{t5IK3!Cr8~4W
zqP|C4&(D@_Dr$}>ZTj;{TT@4d+_XQ#A^1C0w3E;ungu?aTe_sbG9K{L^sqF*!UfJq
z-~>z@^ug6Y5qXu_Z+^c|ya%16KTqj;G0lLyvNtX>1F#Uj^YxctJIxhAA9qp2cbDMr
zGW0KNo=X6S9(={dcRcJ2-3MtaU~dc9J_@1#>H5A51;vBn1Kx!c>HntTAEe10j-b5X
zQNnOJAVD6QV%lGV{$+|JB?-Mm^793Mx5YpHVmSamiwr&6lxHqQ{QC_5cOB(#IgkK)
zuEU@OJpW||p0}AI<8!QcIUs*Tk!*uThx`$66*=HI7e3{LUy%H|W4PSmhEI9Q1b<Z}
zdA~bTKd88j_U<e>=m{|o_=N=7W%e7;lm*Q)_*K9?uIWYk4$)S*wG6(pZxo6Yw|NmY
zs2XLUZ7M}Hg~uZNIAwD#HRx?J$$KbS?eZt7<nzNu(*^%H*grzk1>OBj8+{v|dk6cV
z+NC@xw^6oy4W%_l9N|t3QC*LRFF6Q)o)#M3Nv$=IX$kp+PX}lcMZCA^dLikWk_KDt
zmV-)2E>X4$`pY@?-Q&<ZBuNj)li=@x|F;8wUlnA9Z*<TuVJnOY*zN+@{`<|5_}wVC
zvHvUnZDXS`Vt7s#>`lU_taiBy<cn{QY1=Mj10L&C4tPOVc@cKLOz@94><=BJgNCa3
zX(a1M$SwK=+~K+F<PK%4US#-@5kFk{rahFFZf`*E7$w2RY1~in->H|3;y5x0<1`@8
z5o5`r2PIk00WSQJx-*UbdsQpOE)?=<h&cf&;P^rjnk`~eP)QSX_K-&}Q3gSOZp1q$
z=(+Tga?vkAV<x2vd`&Xwi}8r>BBtx+xHXI-344wHf<E(4PzkX^5q)n<8q0k#beo$D
zoSkT!hPr2kY+*`ZTfjdrfo?Aq_U(}7$YH4teUc3M0SjR42Hg{Y^Sr^!Jpp6!S@3Z{
zC*0S`tVh8=QDylCne8x^ea8%aNbksDjL9HP<~qdZLDo2i?F`)qJaY|t^6%xa{97?r
zjQ9##UQG^qr(m3x3Y~-z--F5^*p|mcGve~M1pj^*e;vxFz|ZD(l$o;|{VZnxXImn2
zf@d6fIhM+r;|l#nnvbzlM3MCO%$QRw+A<B3u8<eJcrHNUd1pSJZj56u<W(@viZIV?
z5&V77e;cvf9@ML-k7FMO&Sc0?54>Aj{gF>m??e9*fx~{5030Xub5QO`1g=~Kye8BQ
z0A7FKA(qfa;Kc*4AM~>i`gsU=7s;>76^Jz{z#S;~C-L}G&O*CnjJYJ(pW~QDk-PyI
z+bVqKR?v}Qo84kw3{Z=RWf~O=IRo?rzTJ>@BVf-07AI^F@HVrY^6M-kwL(wNpij?X
zK6?u|@!;<f{QC?3D%!XpmlZ3MpwCa_umiT2KSDfD<G6|X{%GgpJ_%jyQ@j|TTj3+H
zNA^hJn*ody4StI;Bm4?;P%GyV%ZdGy$ESjrsp=(jjPW->_}^fRDTj!;0mLSZQ=cys
z0-qt~xJt9elis1EsWg^jEXHK~{fgf=7Q6-vJn&%pbXD$P#J?f%mFa5Nh&P1q=3u;a
ziCCEiU8qV~(g?vnSw*}OV`3rf`6u*c5oPAi)%8)vxJ9hOQwDq@o(lSH<Pbp@<{*qi
zF~{d#DrAer-w*s(d*eGFHglapknJMD|11@8eng$#kpW}-{D^~{i1)~&Tr1fBIj?{`
z%XK6qu<vw?2gL4CB4&ecwb^gktaET(>n`wUpMz2^F-^{eSQncMDIK(~_xguqATN1O
z@E-{MzeE>7hN%qW_h`&QyyCcJ#ViYsc*3!4DBwRwUh*mIaEB4QlVauu%^07(;y%Z8
z5&Mn2v#vQs<iG+Ka`{N<5%Vehkohe{rSXm2PRs>#j}Z?vR~!13ZhdoX;@C}*Vc}E7
z-Pk?|{;4X(_QjF~dF`u+^^-Zi!CvQ!T)LyYe^a=80MAdYM=3$A$b@yacsZs;`@Jl8
zpW&xDY@e5rBXK+8C)!A@@X^+v5YLlF{Dn8S1}RZrgjiLiI9lr>$K*OOUL0}_<^}iw
ze0dUl{5+0bm|LK*mPEZR<5;IROihi{S<~t7Jld&sLQY3bXIZBnDp!sYy&rPZQjQsb
zE0%nXZaRwZN$8s__#+~NHsWN43OPS*ts^I7aWw7EIV$`&oZ*E1oUIxqww4f_xW%Qn
zDN2PmM4<wILuaThB)NTlH7_$;Z?7WIbpSUL{ZpDcaz1PAj6{%oJHhijK_@6^B<tZq
z!~TO+QX-!@^^oE`MAQ%}payT`eN~z9q!YA++)?<92UVfl5d7hO@&OJRs1ouj%-8Cp
z9+J96y<g+{kV<zV%gGMN?IfvXuKw~tlF_zN@E@X5NDDWr6bwK{SuI<(T7OlN5BX+(
z0=*D&?;}m&jK3j1b%nIO4vx9d1A<YDhjUBCd-Njq2jN?9QmR@pOXSaod}Tsr{dGlA
zyRudxKkRC1%aHYO4k<I<aDnz@!GEX<T#e@&a+M`5K$}Lxk7gEoXLR_`uSrIXnRyxP
zD)V|y@M_dpFCl&pRr*;UX?mlg9P*bDp3YENo1vo+p6zAa#|FqTRSDI#AwHyww#<K+
zk^cx9dl(--=mWAMGG<W%`2xIVRJB?2p`QuLjL#C`kK<rdA-BF?;#_l5Q(I2DRN%{2
z^MDtWcn)&3258`+5aijXb*>#!AaxBXknwbM4J}Zj<3AnxucW^tOG(s=(2n(DtzAJ=
z&}tk-r=r8{8Hd|5Psk&2UM%8aTMiu(zDmo?Tuz4lhDG`NRp#T>?^8I}kPdm<pew2b
ztUuF&zYfESJC0+jQQyh5mLexOig6&Z&m6A{8Erc<J_LL`<Uo9ANwWOIwCf%r$Nn6H
zKbDI6s~K$H4)`6(my^?|FBfoz>AD;eal>!K4*5Q;<*~d#UnammCblk*9F59e&{k>1
zAMcF!{k+z1B^rl#_IEKaAeTTc=EXc3FZd4^>(9};tT?S45_CO~pYtFGk1dLf{IikQ
z;ya9aze7>crZWZ~`7rW_TwW&)KN7_aC<!9}?2(F$x~$itbwQ<{;D5Ht@l^rNP6J0v
zjp7hw3iJMfw889$3;pPZtTOKv@K`j~l9^7?2ZT$|;&{n(3UJ8*{O6#f65w*51Bgxi
zn%c^Z+>-f^Q0cht{1vE^VD}WzC<gEOh=*o<nCmMsA6LSE(wlpb11&<|W#oeUl?7s6
zejV$mgH^^_w?p|R#|O>@@E&aaN#rSfyYXHKm<J_M@W*OL<X#=h#h`l*{4EP{Hy*G!
z=vTyI;Hv0j9Q!o%Rsz`q=H8BiIX4>HDL0SDXd-Zm&D<Dr<kWc|S*}_z#PdRo-HTC*
z1piEP|0OJuQWf+@X<e0frGU5Rtc4!FDQq29=0LttBF`^EEH8_6LhkvXIUDrmvoD~2
zw8%kog`ZrCHbv0SJUvU9i#9Ikc8tii+ZDIqe-8V<*vDa?D1=^9U|aO}Y`LWiI!1qB
zv$4z<W1vXPfw@8_oQE@yOTZ%+JPLV!G1u#?r+H{Q7rL4QzdLB=U5UWU1OCjGu8aYK
ze-`H7vdCf3WE<pQT;I$46j9&ibwjRbw-D`S17{XudVyFguzlFZ2O*E9cqx+m1mqkm
zY!m<=O-V!?kpUYoa=B=n;25J-3jU*n|Ify}z5({1DsnlV_v?7iutmi@Ptke44D)=M
zhG!X`p`)0~d5*7yT<35O!u>O1Ox`}s=NsgGVID^%)RXs${*vocd7mb}`Ca$}^B;})
zhuj-}UW0Yeb%=EyF;*5S9Ov^P`&2n3<Q{xto|E^MF)!u4tv5;{o^h;VnBu)<nRjK<
z+!((+EaDbo8}D)Gua{qkG3gcj$EZ=7-pKMrfG0-h@%`nJ{%W~P4`WQe&%St#2Xc8?
zb`gKGAm1)p&9aKUQEEv!LB`Dd1S1xfI~9NYGVdevkIS?yKS}T(Yx3{OPty10td7QC
z<ZRwYW@oUR$jxPrz52d#C)OUE<FIbL@O!Z*r1)!M#!bGzH7oKLjGJ1-qXe<<&@Q<l
zo3U3Ua(Co##vW{4^SLU=wH(B$9>fw6(|9dM5o5ns#IlGMXU4>6-w^LSBK}22{GpFJ
zzfqTUz^a2RQY&-p8Fe-4CxG7(!GD~}G0Y=ti6`*oZ;IrPGWOLHd95GBn$#`6_s9FN
zR!WsSJhR1EGuHiBlVY8l6)(n&T!OXk{&-amdrGkWt-`wZA%l*iMh-gacpVM?+0EyP
z^``^lUoqF9D(o3Yk(qA@*$L}ZOSi@x!1LBxlD(t>wDjTT^XiX1o*YsN|6Kp+iYzjJ
zAMPDRe_D%F^ABY?^2;y3%&^F@w?v!R--&Gp!*?$riYtrOhof(@^(Z5UN)s_AoZLPV
zi9~6|ylZATfl%6i(HmU{Y2fp(ia$_L+V<^S9J5za<jO>H|6#vC^$nfDe3Hqrf<F(N
zrIXG-|9n%1Izota%$~pE+^d_aCjyj=l7M=6KgDm~zQgnK%dZIjDbDBduQcwB5ANkM
zd~Vh=tCJhq!X?@>PlTtUA53HYl^4tE1=lW^{>n?c>U+8iSlphTosS82vmQI74%l4I
z{S$p;{ul}I<y)YHaYA1!z|XmT2hBBg&A%JAZ{O~m^4E#l{lD?Boq~HN9ndo0n>OLd
z*q*F)nS1@2ANNbUdBDQt!m=08=X1Si>luCUm&_}+Y(X(eCYt?ULA-B`UkLJtA#7(S
zlmsmuMJCkMb-V~1Q~jN$B7tHIdG-k|K!^Y#0))un&li)YLay~>_J0AneRTa@PixZ}
zZtT~;t5bRU+do?I-nK_xn)UmqJ_7bdD1MY-U3WH>AA5G?c|Cv5ZR+`9ZtBU}!0!f_
ze3Hp6>`tD0i+*Y8Tr=vtq^g#mIihl@u)gFPiTCBCriuz~OL-FpD5f9sv!Uvv4I6Jy
zXm9+*A8I$=k+6x&rgICf*!W<T*0^EB_nGbuuZ8b!&_+D7@wqo=HXQN1RR8#|w{2XI
ze*dNie(>)4%N7mQYZI@izpV7r_2akwSolGl8tdgJjDg;;(9Z7#>o4p6cEhZirS+Fz
z^%E`)TOLi^So`6EO^J8Dz47|sM_f*qp5X5}eg1vHlzs`BUsPX$f4pIjGt%2vq%Z!v
z9eGtcW4(PzeSxn^-a0X^xCkFiP_6g1l;EYs>x$pJfAhm5`MGe-)EA!a9x<#hSnb|F
z4%)n6i1592KYq9T<_pvQ=yVSnXcY^uFW9=Djk#d+lwZBbPi`yhk*E^W=v~J!8eH(2
zRZa<mA6Wg4?74FOXC=pe*p-tS{abPv<&!tZPXDClEtwF+5M*oQp?B2_{{7&Ot^=zp
zzV(;+C(!xzC6_XtZmLN?6&<PHhdU@P?e)*K$J8L?kb;+=v_13p@pwq7p`YG7n$CLd
z7N(;Ca`t=Qp5Zs2v38Y;-#w@2cSjEJbKPH8j=t%cRl83Y7B*c&JVPU%68w{l@ffLp
zGrxY>f6i#2!t3k*d;0B~<wM%tV<MrNbn&iw-U+46oUh{P{`AN&t52Q-3&gy0WbBXU
z9>{v3<vR~NwESc=r0<qqnSJbqd2x6O{{2;QEpNMz+cUo3R3HCy?d4;Cd)v+fBlvku
z_b%nWmZ$IR3s!RBdDE@($e_@U_TT6Hx-XcilUFUB2>t_9f^MFy@44~*oZBB>CW3T)
z*`%l)e>P+_+wqv3{oSYy*yf%Op6P!6=$7t3Z#V$ZVYb`aN8Y;Nmihh{`MGvn^A+E@
z_paad1-t&}<SqKh35Ny$WFsEkc<>e97Wa!7q(uj<V&V4%yYYjyqxIxlUgM|Lwl5g@
zemKY~pMx>~vta+2I?ePE#|JkrW*g@BTQ|nVkb%!F<0Aih_w})G>74X8=-gdrTV?(C
z98Wg&OBLxomjMr~zc*~^Om2Csg_3J`)<^!bBW%Q;IvQyD-&0rq4T|5zL8-T$*ghLp
z%~@^wukaJ3VLM3eSTq1R6ep2W`8(s*zmjM1<M>>W1iQ_+yX#qRam&Xvc=brZ<It^d
z)_<1NKa}v~0L|jh``PkSF1j{;9Z4zoM4uy;ghWYrph>=e$IJAM1MAr4<gD$YZQuM%
z6lcLBL{DE$@sH19p`^f(Jxo?GlamTL#%y?}q5%oy3NEgSJxeSfVjT$nscJN5jp_jT
z7d;-2`1n+UX%CrY5o2l2_pc@C&=w&h$|b*(`ZJ!;;)>zRxrF?C@9t|(kmi2!jfnQ>
zG=46hobj~apQh4}F8|)gjDO3*;52^LZc3cGb@c9tpvgKN^U&h@UtPMB9J78)RQxVK
zy_au$`{>cX-{vYyIVMfIWUO@I?SE6|-navnsCQo!?r^<QeYG`CKHL4PdgV_k^Brfs
z|EQ}r{y}=;(3^;PM*JTHF3PH(k^EsW?%;t(9e3ydj}~KRt609oIyLoGf9bK(Z4W7J
z)%*-zSX{gJrmP40g2|qpZ&;-=drHPbYr8JzcflX4<lc1#ed%?|%gZApZ&TRcIA=%B
z`wGV>*Ro~Hq=HA1`zoleK=GKx$vHj&pOV+T%{hMpXk}UcH$>$PcH-}3imqQ&pZR1O
ziD(-(>xEwS-t|Bd#!2sD<(|>J-)zIQr|<f~lT0&qUJ(3;suVjvM8~G#k4M-adE7FL
z{g-XZ?><k}XI2^iLEN8yOL+n2>F(|OW;@Q$tithw3;3tfFqJr#Sn<Sl++BHo9znwv
zQ{;bKBOSl-Tomie+^6qu>crCEl11hSNu~4?b4%mrY7yIzG7X{hir9(-l%a-w-GwOP
zd<pqgYJ1SfVoqkNA&TZwv&mROT0beF>GpaqcrQjtu_`p<A*PbL*ShY}=;Awxj@u_z
z2-JU{#Mw78{2@cN=0NKyMHLd6%xkrc3=12eTlszCuK6E8v)vZYn7%idGCO1G03J5<
zA~Hk6%NWM|hl`JF;svXTOvn2J8hi*%(6V%4(SADyF9z<|Yt}0<^ce0naV&hXze{JU
zR-eNs^0nHzH4|>plTCP4FSugBJy)1C)&ayz$zAa2+weRa&)s-(em5Ouf#5%)FCSu2
z`QVAbmyYW){-9B)ABnLporCf$7T6oe$YC%aB>Wt0_d$HDOydS)i5c#Lfz^{bK22lt
z<kMYwM)#P%(rL)e@6kTpY4+tT;zOB6Uly41nR%<IXV^4DSMG6S_&vqc7lD48;GZe@
zPc-2C_glILW#Q+)c|3^kg~xe)$shASr!W1V@;AtQa-aMt15x<!X@4?w!hUcy8KIEJ
zD(j}%d}0hJ)uyX92>w~j-_=B7RJgX17z=DWLQd$;#M5o+5IT$Fc8DDwGd6gFM!l!R
z{4T@u2gHj`0gv|?@c2{``V;=788)SW;6I8{y)54<BSc9X4OxV|lYo3iduT*-`g>^1
zfAn$vhof&Y4cy~<_n)wbR!3t5e+Wd2sgJ$1Q|zH_KkYrV#<Kdp_Rs|Xu|__2vc0rk
zduT6zm3wG{|G6riaxaa(zCAR-f1LXHy)@#plO&n8=DF;wuVF9Ei2vsa`#(xzynKF7
zEoLw63DL%X`A<3XW?0DVcSwlr;27EOv~maQCnMfw$HpHscQD-kaWdwupz-Z6$GD@$
zeAZEHe&7JE#N#%x5n^a0WuSFR2T5suk_vuA(xkN{$$qgH!+&-*`mb2~fyR55F`oF{
zv%r|x#CrwtJ{MXj)SZw(-BXLHdwMQ)=kpmErNTLvW|+7Y&MaDDwUgId{lxn;vA+%)
zkXbD>Lipg}2r*A0S>-uFmY$QIL-=DaXeRsoyM6xMKL2i?f49%S+vnfy^Y8Zgcl-Ri
zeg54(|8Adux6i-Z=ih}N+2`Nw^Y8Zgcl-Rieg54(|8Adux6i-Z=ilw~@Amn3v;X$_
zcl-Rieg54(|8Adux6i-Z=ilw~?>oXq?6J?k+vnfy^Y3Jzf49%SlYRc(KL2i?f49%S
zlYRc(KL2i?f49%S|DT?J7ny;BQZsVMUnq|jZ4jq?A2({EXXMij*Z@*JLVCbbLIw;W
zdH7^i^hnV4k2ByC$@S!aJjnmiyb+==giBuZI|EPqgeWH&?+9Rv(}=Es8OxxwC9v&M
z$Wm!$D_2wh8=1o$vO#AJV72h#b!DPniZM0IB;^~qq2i;H?YsA~K{6>C^|j|N@SMqF
z@7#FzTlx$V^!%0YpY#6kKXc!l`-C*u@?c4mH2eO8egDC}|3LQr2mAhmegDC}|6t#L
zu<t+E_aE&05BB{B`~HJ{|G~chVBdeR??2f0AME=N_WcL@{)2u0A#C4&u<t+E_aE&0
z5BB|sK4JF#2mAhmegDC}|6t#Lu<t(@vB$puVBdeR?>~@z|G~chK=%Cy`~HJ{|G~ch
zK=%Cy`~HJ{|KZ>2{zKls`2B}LWZi%Gc4OXY-hYtn`w#!R_aBy2uUuADS-ZM?ZB_Nk
z(s@f)SFNlbKe2R5e%=NA&(zZFNfV}&E~s5uwX)JbuexGs>BK4iIe~ShYsQym8~%^q
zQ=yo_#2x7`ZIv*m#&a$*#IPUxUL5T2G4I$U(8rCMZqy}vjOiSHz<)z9_s#A7@{{2A
z0kikZztDcUy(j+vcTarEm)aATvCc}$`?CAuN_1bG$3TCdy*F;}joW+U_TIR?H*W8Z
z3;UuB@8!Zdy}t8%eGiaskZw3h?mfuLy|KKrb8lfMJNLG8Z#(z4b8kEMwsUVg_qKCy
zJNG6#_ZIdgadzN@Uv97OS+O5W%2!lfW$vV(V#oaCzmx5yUngA$J+Lnf{i^rUV}D;s
zzIUei{7oPF>Q^`ZrosEnU+S+*I?QF$#48imx9{$5y7a^G>tDL}BQ9se|I6m{L?=C~
z|Bq<I=JRL5^K@bVNMBYyf5v+I5-{`cm3BUF=ks<xZ|C!U=kvcwexlEO{`s8yPA8w&
z=y(pMnL2Y0tr|jE9~6F(e16?KcN{YP`0LB(>6TwuPnKKc@5tvlPMna>^O*e_^LddM
zt{C`yY(CHWn<ifU7jt3STn4R~*=gtVc0T`ana_)}OMC?Q3+$;sCOvkN9Q;e~smK28
z9Nf;qzX;6E!R;K}&cW>*+|I%69Nf;q?Hv4HAO}CAz4gdx{;IB7Q<~p<n|<J1sj|AZ
z^s@5mUhtrF!_u14xocL<JE6(I#nQD)t}0!0ebvR4*Op&>99||>->|OqlI+sjtLtL%
zD<tMyFtfB^UgfIe@RSm%_S(wQ;x*UK$uF3B!%_==R-SZCWku=2HA_n8uequwia&HL
z<XKWWbJd!q#cNirIS$Vf^oy%2uPLakuAC61vsNlvT3Wbr?TOv0aFj{q<NJV*nJAS{
n=mS2bL@KVToVB97@<jNwX+oaj@};GhouHo*>2&S!Rsa4Msu`4Q

literal 0
Hc$@<O00001

diff --git a/ti/audio/tas2781/TAS2XXX8F95.bin b/ti/audio/tas2781/TAS2XXX8F95.bin
new file mode 100644
index 0000000000000000000000000000000000000000..d9b846cfbcabcf7257bd2f510549eec6477b7006
GIT binary patch
literal 49824
zc%1EA3wTu3wO;4UnVFNxBupSe!gGQU!$S-R2#RnL5;B3HLxK_zO(KC1<qgq@Kqm2!
zT8)WXYX!X;mD<{e?d@$9@HGbf8bMnMtq**qN~;wgTrCQhBy<0@&pE>o0|g(wUwhAd
z-{zdN_S$Q$z1G@muf4N3<Hn5}L)6mz$=gMni7q8cBK#y;JpL!o&0M&ua@q3H<4Y#w
z=1ky!vPv??jhR4a@QWA3=#GMJ>SUrmfcKgIkBH2!T2{HN!as9)`NA{d9sNn<aG0<B
zl%#{wL84KI@LmNesv9Jgs8bt4?SMo}P(1bNQk?ZJw~~iC&)+16QQs+#I1yi?Q+?Nm
zv%GqXB+D%|5ztie?htfkQW|8{z>{f3gY0A4MX_z=Op@gZC@FEqci2a=MuX&li{zkV
zJw;OAX`;xx4G~wZ9*`7$x{@LXloufH9K1`AH&5TC$a;%HcskH_tQ;VR93($Q`mPf?
za2PV^0VPGW0c|`Tat1vp@1g0S<p&*yzE{wYLE{3@=qU%|?*v^%AFenl(r>(wPjlU_
zX9Fk0U5Yjm+P2AiT+NLgpxKhP1~eR?A<0_&opR8v3I2*opg|PrUo2<@D2#Tb&!BPj
zyXkRRQ#w%hQ`SA;zQ&IDJC)KqMm9vehMop%%jHt?HDwYtbmsf@?6f$&FioYqwbi1&
zQ(MQ+#ttfMh$zkab4qi4YnoiYC(R-FJ5{uk&>xxxJ{ud`rB4_S_^EnW>Sf^qXDDz2
zCJy@Gs-=j$((E_CKP29RPST&FL3$BQfxNOeE<Fvf5WaKu-LReJilC2MDdM|V@OK&d
zmo?92fI|<yBI7$Ac82bQbUR>w7O-6uLjMQpyV4XC4~h?X7g40=>xO@jCbv3*@*YPq
z!{vYkd1!)Ze+l}RDUy^V^b*O<75v>6|M*Mf0Q@X6;A~T#0*d%|8UF7&!ryWr0rXsl
zKnr;OxdxuMfg+=`tamvee@c-|gGQ_TDR31z;5ZjP<%D05{HkNH-0Fr;c}fL;RV8_k
zJ6+$exQzDh3_0itF%S5K1leWw8_<*m%~JSPz&)z|1^PbG?Q&Bod}Y@#6e(`wJgQYS
zN<-Teif9UtMfh=_joDPIH_IgNpk%e(pQMt{4;xJu{NrH%2u&7r_b_erZE*J8?1O5%
zvQ2KLO!-<$ZHPF+Z5X1u9uHq~5d1tfG`NkLRzRi&<P$y}pm7xO-l^;Pq-#nlY_(ku
zDj~U8xn0m-%(3r&hu$hldN`g0e-He>1^BxvAuD{Nm9`37VNAew7r^!pG(_UJquj~<
zulVm68I2Kxvoc_B5<X?M%T^#?d`nE*79kt(Sf_Hp3%be+u=8BOKi;rEbT9}sRK-t2
zSwBK<(I?;z&R#3GD!1!}h94R6!<B2=Luu^r2K3fp5^S8x{RICldhsxhBYiPW1M&<p
zmK=IelJzX$!XK$4-RQqpwPNfXA)khr6QDefFBGBaA~pq;R6%D4dGunXFZAa|ymNw{
zOD`@H{Sq{$Qi{OWB!j*fkN7TRx^9kJ11XZQ)95egGyepY5IYpn_vWOL+!sT)*~!4!
zg0`usdq&6>rUbSH{PQyC_Htq0R%wPDma5Sw$&eqg0LE_6Jq9?>8NA$MFczNy9|v^8
zeI3tw6#Nramanhb4rAGO%+QDQjvU6A4AOY6LwxRQjbqr((0#yDV9=A_lEd;FVyqbP
z6|}sX9Q01WI4u!62_wD-mA<eokBJ7v<?jgoJuv=Sl`nvw$?YgTYdiW`#Qx8=MC1g|
zIPh{Tlr_hd`U^A*W2cZJgWfY^PLXKKG)%feUhv|%0EOqBS$MiJj=hjq!8j|#Jae<)
z?}PrEiRJd7UPXNz`!I0ELxvjQ-PYufe1Uo&`j-eC_Ok@wIH8~Ya%&=R<x1eyqplb5
zdIArzgf;*#9(X;VpIy+;qrkgZepN0<tmy;X-hzJ;k3Z!sv`faAOM?A5j%gIh>4mYa
z!e?#+9T~RSF6PAmHHuiKQIU`{Ku_S?4Ouq;_6%Tg!Uh3v1IsDD$}&<D^z=0P^epDH
zw}BH6{vN@<r{J%mjSF&Fu`&tz{9Fz@V0-yf#Pd{+o2c)Jc0TTt(8Vsri}86od<6E$
z94dS>fN`S1Z!u<sUttbv;yhw8v48UTR1h;&y?BN({(1@j>xVJr5HUA^*o1NF^Myj-
z)88Cdsn&SXTa{FmMskeBn2di|@%u)CS3iLV9!#IE&hCf!*B`zzS#2Nkn(*B$jJI|X
zD^sBhRVhsxBKRk(h*x4v%z-^WKwsujdUk=X4>QIsVile;;A8Pr&~GD$2)Zx_VH}D%
zKKpVZTP*$_;P35<@BEpW>-2?e7YqJpsfhDKs`b`17~AJZ9Bf0pM;_%`!v4>B1>{+*
zBO!r(Cu2Myb`KLV8+@0W{g%x-2iG-i1&@{)C}k4U<Xnh#u`!<pf!6h2fB!V(CGQFT
zy`lfzbTMR@$S{77#w^4uj$2mDvfzj(9Loj({yXF)U%(D`8?ienW^T}o@!2Krb4(Yp
z-^e?w8~TVGSl~h~A1R$;K7}7Lzd5KhzLDFBxq$9B;(_LBM!yDG-yEAbc2i_v_*8K>
zwhw}Tib}D4v1CDByBD#3JjXZK>wJ+*x0dy+50~}g`Kjp$C8*`;u+Gh1j%m?;FUsC!
z_-Pi~=SAd5+>ZE(Hc}IOwCR_`^P~}f;mu7!O4R2eRuw9ars~Ksxmt`Dhr9yw0(=0z
zJPtm79>*@sEl^lvqTZZ#tj!yy`Z{V`(dKVE(x$aRPREM2(l$L*rW_%9Kjfx`95Vn{
zEcxo(bOhhy&^KA|M??l~#K|-ja(>ZNO-{(-sNa)yMEGww%?bNCn>0#nDkeB_qf2jA
zlyYx~LV5n$wor3Oa{K&hPI{)^Qc0le0B$<^r_{G*9c^lhM38$s!Sg&pCn#tn>*0LE
z{{2)^B1fHiNO2w@stx5)tvB+%s!ZAD1T7(V6h7t0s?co+{_rsQ0EY}z0eKbXYxPkN
zNgblzuW@}yrF)R&WCr9GlGIXHPkBGdXj>=v_g5*Th3ixb1|XxXmM&VQ@0H{OzNw!>
zFNECtaD6!K?}$(BA#JCFV=nZ7VASa0+*0u#xtRSy_}1%`qLxn+`SSr^sgPNJRZ-OT
zjFrd_+v}UtWIdck%9Ph!pgmsjAD{wP<N1bMrAf2Vrq1xAsYTu?tv>W?oDpND&V^lN
zUe5_$bsFm>#P6XBKkFk^uTzu*{!+rz87gfybQHp~rIh<v3ppk#q3UMDhe4t(^B-vB
zKZ3>%#>Wr(fUJm&8I(Z20IwNUZQ3m8XN)rCXd?V^6l^Nw*7r!9YmTdL&Ke};`7+fU
z-~}a~gB(o(>U|&td3I@SYx?I&?fvs)JRR)=@|5WK9|ZkZ(ElJyNz@C`j`d=#T|raO
zsvAb9qQmVOhubqx$RlxHEaG8v799}2N{h@~PKNykM)~_y=Ht~LQaIO;4tSfPE2;pj
zC)0wz4#bK(j$^7(-^R2SA}2V4aUikJ9Ip!*ZClem27EN+KzwLSvi!re>kc8uo-Bhu
zmWuk`G`4Rm{Ep-+$Z6D<2{^-aT@H!3;WuK3{1DdiSYDtnW8fcSn-)ioL}kxwuCU^d
zcgp*IUh6jzjY2&8A2BZ=mq0G&#XK4>_zxEA&*8ePIISEKbUl!t^B@P0Es6~N(8z1?
z9mc%hs;Fqw7K4v`82LjsuagEJj^YNC1d)GsN`*#U#>>&VpwdI|KU?MassLw;fup5F
zaR@SndH+CKZ}!85esn-qnfD5KEE;Rcbf@S8!X;>NyyQ6rxa0u-v(Qm7aJkO`#HJqg
z&1FVz$^3_?bX<4-a@0w%dmqp!0`FOfhh}}4>nkuHSHOP;HFP2enuos2$OZQ(v&Fpp
zD%Mf^D~+{ot8yvF2hIiX9&Gw$<Vk$H@tzNu2PIMP$7)C9UaiU{pnDGdEdy~k9<Vs*
zSHxoAs_0`J`!w`c4A}za-j0GfHyYb1JBP<;B5;b#+!%6XReK*>tXeR{^L&imOHc|0
z|8#TzB`lFr8T3YJU7d54fVX6=fgUauwhk*ZAm1>N=NBTDmqywk_bkwy4tlfL7f?T3
z<e=HYPcBEBLg;6vo}m<=jSIRRA#&{&#Vz=s!~QS!ao8vFq1QgJE&6-5+}I8sqd&0O
zNal+%P$=fWY@rj*!<olr;E@d;`8>av>vh)COtdY4u4cgR_M3TEBJgs6Kee$vt(V}R
zf%&&IatJip23Z)_5Ar@m)VF!vkS*HHLA&X|nTD92C)NsVAGYy+$fGG<iex_lIY$Z`
z1;9sB5)nsaz($K)E*d8|#%L9S|1jbI(=o5Fhy5ptT#o1cYTh$!R58y}be=E8JYTBe
zS&C=q2<CF0<0~N7Ih=!V|BM)uvkUY2dU;ov$5AnL=Deiuc6}l5(!@8v3x8n#!x8_G
zd&AFHU>$TFVx32fm3a!s`CQ08Q4R^Y`<<BQ<h*UnOF4hm>m(7+I94%C@!q<~yDX_7
z#xD<vxP{opdmQ?!W!GU$dIkRxYLuoovUncgiP3p{Pno3eEpzE%jLG-e7q9g|E-%Y2
z;%^4z+e)igR<SoqjeSm#F+DfIh=pZN#UH=O``E1GGA+tY68uM+{5x}#^j%r2qVX3w
zoA<HlX)GslbD3kWzN^fMwFl=otQ#-<UhD}e{uMFfCfDDT5%~z?rV8;WLF_xUNN&hx
z>=lXJ9XXt_2V326uF7#O3vsFwu|&i)UdvI$*zXmwETYAkF)`XV#5<3Oe~}@7>88$a
z)Mf0m>L82M#2h<^U4!~D;CEQ?AEj~(^T=A_34HmRBDuqieYHeh>j$wWb&Kyk@jk4T
zQsh?8bTQV9bwAdmSm$QMi!mb?W39U<UX{b1Vyu5FvF?4;pyOB}2OZVCjt2kChV#Vw
z(}D4?m}^iK_Kc&*)YpXUgmtQ=TVoF3d20>HUeW+s__K!dYK}dg98&T>todR|2ARK)
zcMhWu)*#jVOKFz;;)^dbEOP8^(I)nHV%vW3-3y4~N~87R=$mXkO39(pSd0lLw~s_3
zQCczYnpsXDl=>@rt$jcBer~V$0|ljS+Qh{%eHlfrN+kDR_6StpfGNx;nH)>_^N?BE
z==}4~H)W_Mgh<EqSxe5nrhfTYfRa%XP!I2?_)VKOdtQ9;CBeUs^Ev!0je70igIop|
zWIVkpxsEMdtUdiicq012G}c{piL73*boS(zc5kie?8swrJ3F`hTCkh;>jP@9jb+?F
z(MRTwkq}>YGn6n&=xYi1IX7*l0#n!gyJ6F&P0k6QjMW}~#lv<A?ijaEOMh?Dn8PDG
zGuEc>^rwH;BlVVEbCUB*pGTk1^`fn3`2IgIuh?=kib*oj?EezteQW$ekUtDz+uEQc
zXz2(tq4xIUMc|m~Z!;AM6l2J<PjCT31PBozL=Jtqm^>A7ts}Glv&rqF>+gL^n^b#a
zkDl#q%2VI_$&&Z(cx?Byx1RhI*cYStQ3kf(Q(t!MnPum7ewba~`J?QVleK~0^)mS+
zlUvxGJP#KB!P2>A)Okr&EkAQa<x*jN$u$)3i%Crp72K9`#`IE5Kjdd^<)`a6+?CK$
z_xrz8ZMZw(CN4Lfn|I}gA6II1>xVqRbZ>Y$d|$0L<mnC1zCN|~uxEG8<A1ti!|Xv1
z-}J~2-(5F%-T=KS@yeRHC10!?eaBCQAH=D#UVg$D=n4znw5g-!#@Y*Oo!3;>tXt&Z
zQhVWJ-`TKp>5;nCcPDOme%1|KPM4nG?>T+`-NBR|3F%)|UxI(UVUIJ?+c%^y{<|G{
zRXSt6eNBCVuS(u(F|N1>A52iK_cfH@rTJ@%UVnJw&xZ1I&gzNJKh-g0V0W;poqz4S
zadv;<duxCCZrLptrT*3F?%Ufc7G8I-wZ9#4!Nv)He1V_bR@fs^C8p7}j$za<?`5l;
z5(Yo8`W@ME)vTk%$9~kFl@k41av0_F*GEqNe8t-`A&4Q!u8;@ZTO;`QfIqtStt$V{
zN3%|#^QX%$XF46UV$iARNIgE@OmV5NeyKgC1|f$OyyB$onZJ+6L!TA&n_Gs{Sufwp
zbTmNDe(!rz{N^*(u2Rvv=XAb#cppF4ezI)%cb{Il{d8er(>261G~`LaKgk%6k($?Y
zYZm?Ilv>KazUFU}@6s$E((W4(39T3;-c`>#q136fR6N~Z93E)($+K^^n0F43{At0y
zjOQD_|Hz|@Pew!fLCIB_$DW@Vho|7*Qzh5p=7+dF<NHnZ@jpwi82QGXTlNj%=d~SM
zm4_Oix~Dr>@kQrNw#s9DLz`RP%KB4xFjFUcEu9Gdy;Op3w$*gr_;A);KU*Y%bbRT!
zs2zXXe-+#Dn4I~8s14ZWo`X+!Ja^>gjt|%G1LzRjZOvnEUvTRz{|o$FGpgar?>~6&
zo87^#KQjJiedw4&f`76Rk8a%mlJ92s3mBw@`>kT(cL%%i;F{rj@~toP(`wrtjC?=p
zYn3m-nEzR@e@vZb`iSG;E%Vuixjoj7a51F!vx~Sm($b%eg-hvm`E=fnVOCl9@o%r%
zxS;%@u<0AU9$EKb*wmTa`0GYWuG&%)`Dk<4h&|QR+w{LDulhR_zm<bhS39wN)~}qg
z%Jg61CrHCKll$o5UdW+1iJUk;<8w;8?Gy6Me;l7nlJ=i7ZOVP^&v>U*I;r2Pp@PSO
z+g`6Zn$$Ctu&tM7@#p<)`AHWojbBSrpZlZFAqzsHBs@|tKfL)xx^UlGwmCVg+Ubr<
zkBZ{VsUX_^TZ(^t8Ve;A8Tp=ICMV@{j9LFqc`XviC0tzPI~G_z#5xfCQ`BhA8r1>v
zFM9lUC6Ft@w1>>Hh_N)|fu$rJxLL@Ea@m_wPsS5kTrzkumymzwecjCoQo-jJMzmi{
z;^*S=X-^6MsVe>CivReG@o$|IoW#$nn-VA9K74yb&}5yCcyxZvA1~iRj%jZY6}`*P
z_|LX2J9>H16^>t>^Edg;Eqmn;uXid1H*SU{YFwXfsCLbNZKpL(j&8qntn$J8GaP62
z`Hib;O*$>TYYb7wHo?CyxG2}%LXL#p&WA30L{7i^zqA-TTgCDv)~Ttln#+%s-0`T=
zyqurGi;AjtemCQh?qITK%WGDt$efV&=$iH`_+9YFD!FT&L0@{6a&mIW$lDb5H_q9S
z^S;C}%C%_GA}Q~&<n9Wp%TYXLadM7Nz^CN3f99M&0kkqK|Ld>v20QV0GDX)fs?U5f
zjYPB!oAp93JMVoY3FD+|v2xF7-fy;H+LO2ba2wN%oficE0V>7L57Dt{_~T*rM;^Bf
zWB+BF^1IJddDJSS55|4)2IT~pr@O1~o9#G1vkJ!#F5sU+16AT!V#O2Jad+kUc?b=h
zPm%w24RyTYxj5FBxlcd1sSQhm%jTIQB!vc@m|Ge@SEJa5l&L=rDvzy5Kp9}z*PV|d
z&X<s1rRE>|Sj_QEHAK-|YC0K9Nb4sh)ZbOZ1@A>DeXI)2c!;T_`sMcfHM-;;qT}|7
z6$14SkU0BBhCigK)*NU(rKmz8<9V&Nfni|-bQ`~K*gESVG}~eEjOlx=DYG+{4&Y%!
zFCsHEyo_PYf3Wz-BwnzZ$aK6vpuvaG1T9M!7VSUB;KjflJI#6}h91McCXR(K_IK%Q
z)#`KjM7~x#w`RgEda?<x>;hK|xaUff##(@QDY+FseJ7r0<GCGA&hI9p%ohBIbmv1X
zDjz%%_|kD*#_u-@^&m0UrE^f8!2)|d89B@jxY_T}b{E9Q$~3MYmYCsg7+5{2=F>DL
zPd?q1V|0)CD{Y3{{2uMoJ!W6dB0iL9^kudwpP9FcdWKChbmbmJhTl_6eIe*K3;yYX
z|5yXgf4`;sQRaO4o5zFro^zbn*ZeX6bGp<2DSv&<C-=#Z(i?>jpY|j}C+r8;kP!-b
ztg>zz%qPZxvfOmlTERbq`Mc^#j0)H7B*p^Uj*t_&)A4khI)u*RxE*4L$BYf0pi%EB
zHor^p{2}q8Q^4bW20T86g#Ls-X@*THAovesR4>c7(g;z~216Dh?>Hcz(H<HRo&Fvg
z^B;a(|KaGHOucvb-u)-+p;gle!5;$AeClQ|?G$@xn@)QVt**4DyFE0)f25I*oop|y
z%O2W`-{c;e;D4@4r`$`UZ*LDx@E@gqc`uFl>?BF1t$8jx>s#1MGvfbw!v4P?F<!pB
zrxvr9_JnBTzv4G|aIAEM%zlT2$PSK?Jx(ikuzoV)ZDwrzF>?pQ?H?y&-U=Gu4s(n<
zR+!Ifip>ukz?FF1Ce}d=jifZR?$b(As-L91pO7?e4N0<J?8We(osIr0)_$Pzo?(n9
ze)r5aCN}Y2PQ1^B77BGFBv8l1BI=l&O&z&>Mn)-j7SI$Ex7?XQ3#@kXI;)>}pCtCz
zK?5?Y`9=uuHy9yi8<JI?6J#lkh0bIzXdwIiyM6xMKL2i?f49%S+vnfy^Y8Zgcl-Ri
zeg54(|8Adux6i-Z=ih}N+2`Nw^Y8Zgcl-Rieg54(|8Adux6i-Z=ilw~@Amn3v;X$_
zcl-Rieg54(|8Adux6i-Z=ilw~@0-I$?6J?k+vnfy^Y3Jzf49%SlYRc(KL2i?f49%S
zlYRc(KL2i?f49%S|DT?J7ny;BQqr=>pDzy=Z4jq?pVeuiXXMijST9mNLVCdZgbWx$
z^5F5R=#il7A7#MDl55+~f6V{Uyb+==f=gcfrh%t@PL!35cLcEcsYF-8jHOW80@!vT
zWT`N-m20Tyjm+V0*`Tu;uqt@*+EP(3#h999l5&mQQ1Q{p_T9VKAej`6y4!OXc+O<8
zcW%7<Eqw+Fdj7`u&v}3NpSf?&eL@;+d9d`B^p<`9!M^`s-+v(c{)2u0!M^`s-+!?0
zKiKyl?E4S){RjL0gMI(OzW-p~f3WXA*!Lgo`w#a02mAhmegDC}{}8tCKiKyl?E4S)
z{RjL0L$@&d{)2u0!M^`s-+!?0KiKyljM!t}f3WXA*!LgEzW-p~e<1t*gMI(OzW-p~
ze<1t*gMI(OzW?xVb^jsfU;O?<U$X8$e6KF&H19u1_Wg%{-TMy<mM>dWSy8pBY)$3z
zWhFBguBu$NeDwH|3As5F_@Atj%yDBTl+3PLR=KRgKXZBc!jiEQ{4)Y;OID9A$u#^Q
zzb8X6gNZxRQ~IU!OK6^Rk^YAL*!SXKe~)>`CV@Vy({!UQ*<(!S@B{uEg1K*Q@0Xth
zzZ;mnU;dT$%k4e!|G#_U6Ta4-xQumHQqI@i7gwVD;yea=`s}@NdvDy{8@Kny?Y(h(
zZ(P_HWpEc4&g$}=+vU5LG*_B?lH9wmm3w1(XXoC+PIm5X=iYYiZRg&0?rrDZcJ6KG
z-gfRycJ3|gOXBRn3BT+v-_v407L+ZiyxQDJKgEvu$$ux?OK+4Kp$GPb0pIjqdhG8T
z$@k7Qpa1U1zM55auhe><{;1}<q(fY88hcgZx|Z!7^_PD<dfn~^Kjm^p{J(BKPju3=
z`u~VVY(9S`JWm()kMw2b^JlELuK_dvUTNp^c0O<C^L9SpeLnw6@)O<W^WLAob~^dI
zM#pn7&D5E5KxKc*IGF!c^7*yz+<n0G<8LpYr(1t-Jy~v%zayXLIB`Ng&tvvm%;!a3
zxb(hfV)J>{-z4$szl00Z=F)fd)HXYxxAXab%Y0s(UE(9aUtv$ZKq@#%4*s?G)MI~k
z4sPe*Uj=68;C2pf=iqh@Zs*{34sPe*b`Jh8kb|Gm-g@LTf0fs+F3Ih>&EC5}s#soC
zGPi7b7kE&*Vd09Bg4HW$p3tQCd}--|t4roxUwKKz(z0ug!%L;*H>@qWEVHEQn(A2m
za*6roO)bfrS+Vjsyic)IwX~w7X!X(=xp`A>SZKk|%8{<EC@-0_dO^vo)mN{G;tv=J
zc@~sRUAcN;(dw0}kHa$r{i5X+*XC6$uNV`hvqmahSdzbN&57MAca%zHqq~8R7%P>H
n=>|TbSSqTln6{*>;zanQNkX2YvV|pcPtZ@Xbh`HVrhoqneqM6~

literal 0
Hc$@<O00001

-- 
2.25.1

