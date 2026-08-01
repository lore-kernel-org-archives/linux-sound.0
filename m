Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846423B3C05;
	Sat,  1 Aug 2026 02:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785551528; cv=fail; b=gMAPuHfWN2ksjq17nbhoTJgstl0tKmWfynRppM3WKnRyCYirttGDUptQoEsMAGeyYXA1mw1OMF6Yy5YMYGNp69ra7jkGnQYcxD8zc/AmoXnnsG2yAEaKGP7Q6T3Nc7REKJ8PYVidonKL8tyJrtnOvxd7+Syy5aMqBqAmMMRDdY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785551528; c=relaxed/simple;
	bh=+JPkIhtsmUB1JvHBqYcNoJAXelOC5gCwVYcSKGlNTRk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Swdz9IyUScEKZljVglcn73mDWsltpMUftmhl2jSQ8AUTBsGVrCHtbSCZslEYwphWOU53TAP4VxsTsY5O2/pfK3I/1eMBhePd5WbdvSWG2dXOb2i394jW/itPRXiF2uCEBTTj1IuExzXehsEExe1g/uXHPmAEdFFMX2G362SlHzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KhnOT2Bo; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EQnFq8X8; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KhnOT2Bo";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EQnFq8X8"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66VM04d52400795;
	Fri, 31 Jul 2026 21:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=RyNtmPW0/uMlP
	HBmtuddG1dHhrK9D7tTr78Yd/uxY9o=; b=KhnOT2BovLQQFk6x/sP7SEKsqvIKo
	X6tg1/6eD/OPzO7ucxECU7oiC2xdnVWUcTRqO/0544nYMqA5Dk/3i6K0o2JMWgfo
	CecrnKjejr5aQCwXAxCp6rBGqyTikgLgDSLRUwSNAhcyXAMsQ2MoJXWkkU2MPYld
	jLEVfr6ruWnXEeZ1hYGup6C/pQqAF3CjGZKmoKEUZjOXNFG16oS+/GYkvqSAXoQU
	vOFIDUKpEoRvkBrO29pEcKFw1o0v+BeJ1GusbuNkDVA6N+PBkJ70bNmSDtkDPMwz
	2jiXVA4mh9Jhnf2oPIfdag3OgdHWcQpfOP0oZmlWjMH6ZVWBK5onLWsPA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
	by m0384305.ppops.net (PPS) with ESMTPS id 4frur8ma1g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 21:31:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGBQpQ91Cl8tV5ZdGh7Ty8TGtknrpe6Qltjpj/aVJmyZjNURB56ciEJKfBoGFWYhBO1QrCev3Mmlm/unPmovj9IjP/tq4P/CyPQE0dAt+BNVcS2djdS+blFJ0uiMURJK3to2Mv0O457/QKgF8h2e0DTZn/9cIXnpnFXua+3eHYixlFbmi49QC36zghhAVp6msJjeswk3jsVPrOpOLbXs2Tla3WyS7R2TS4+1EgXa7wO5m4U8I60CogRVufnVNiTl0ZJHl7rekF+AYPbCtsYsoASEEuAtwLCZ6A/YKrSGGM6QdbOZRL0SutEp8hASVXjEo+LfGgn62OxM8emaiHny+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyNtmPW0/uMlPHBmtuddG1dHhrK9D7tTr78Yd/uxY9o=;
 b=psZgNsukcNoRhbLGqcb4bNfPHnm3FZbVtSSgtyqgCezZN8WCMq1f3RjGsbmf7mrsG6SD4VwziPMXAP2PwYVdhCRSvhO/nUD0PmP29biSg4dLITKh3EbhNAirooe/IuBMMrW9fLXyeMOTbsug+TYul4sqFtYyKcvvB4hYA6tjTR2kyECBrEjETEULfz8WndXgciG762pXB38eRpvUELTHIgYgxMT7xdR4F8BX4dXyOgyOcPX72fNUgKf8uyl55TgFkT3zxtpElUDeHW8gqevyyb7MY1BlKiKRB8Zq86FxQgEbksjcUZ65ns/4bc9D3FAQk9na1VJawHvj4/GXwhiFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyNtmPW0/uMlPHBmtuddG1dHhrK9D7tTr78Yd/uxY9o=;
 b=EQnFq8X8bKFEsCbPrps05zfTYz4aPxwvRlbJ1MYvbKgB0hayxDR1CYlKzyKJK7xMdAbukKWHAlEuojIPR04xFYlzW63mJYSntaI1Bw6d5Ke12mKCdNd/dA37SfXgZ9B8R8Aqye8inlJaSyBF9sVS0vI1w7gilh6DNe4YRYziGa4=
Received: from MN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:208:530::7)
 by PH3PPFB6E8A1B1E.namprd10.prod.outlook.com (2603:10b6:518:1::7c2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 02:31:51 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::24) by MN0PR02CA0026.outlook.office365.com
 (2603:10b6:208:530::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Sat, 1
 Aug 2026 02:31:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Sat, 1 Aug 2026 02:31:50 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:31:50 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:31:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 31 Jul 2026 21:31:50 -0500
Received: from LAPTOP-70RJ5B8Q ([10.250.165.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6712Vji41696450;
	Fri, 31 Jul 2026 21:31:46 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <jwboyer@kernel.org>
CC: <shenghao-ding@ti.com>, <linux-firmware@kernel.org>, <13916275206@139.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <robinchen@ti.com>, Baojun Xu
	<baojun.xu@ti.com>
Subject: [PATCH v1] linux-firmware: Add firmware for new project
Date: Sat, 1 Aug 2026 10:31:43 +0800
Message-ID: <20260801023143.1295-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.55.0.windows.3
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|PH3PPFB6E8A1B1E:EE_
X-MS-Office365-Filtering-Correlation-Id: 0040bc6b-5545-425a-27c4-08deef750b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HwQTqtXwDIt9ST8k9eB0lHD1ZjWlkKqryfenKLmGiDcn3KSmbSDw7gMxLTWDed/mPkVn5VeLZKSsjAX2dUXnMf3+4Ru372cU2wJRfGhZAqwcniAuWMoVvF2G4OR16gWgOPIpy8AkV/ojwhfKUUfHqW0epHzDy1MJIyyFiKIQuQHUY0U9y26GtuxqH4FUGav67w62xkIIZRzVFJOjg4EWrzEjknFJ1Rnv0V7DpHpy5EwAvJMxptmL5y9j1kJIPnJiGBoPZrPMWkBiMa94KnlhHjzuGszcSJjxCymPHx0E0lVSs+HpvAgWn+nSe/lfJ40WoR6o8As8YGCsNDltpb7Xn1MxfkVsosao7SpU7xxeiUH99vIvakTesuZY13a9rK/ogvwZpk3J61+aKrRV7xU6D4hvuQigDFv03VLcv+XwEWswqP5KudHnEHiQu3yEkId1430QtwIk3Xu7DDJAGrYMoJFWZceSbdS+K3Pe7+TdVcfgYuN9qQfk1Xiy1QRDfoBVEofmGZ6878iewmAu8RznrzGeFQdS/POH5iHoEg8DlI9Zeja3JsqIljrf7zTFG8z4/6kztlsBGwqg1SyqmFpkR2CgNZLuQAsuFwz/GTatqxPDnaR8rN/XzwwIRB3k5Qq7J2PKTvWlWogWZ2j5fsypnhwS8K5qhC54lLQJ8LLYWUdJvF7SnmX2d4a4GPbW5+Tr6GBjEHYqAWKK/TI1/WrYqQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BIRPpDY/y+4FSCdcuRbu57znLdqGSsv1GJolpaYle+Z7qbuYwVxwryQRGjpC+72bVHlaQfrsOomBc+kwfsaFCIikz4t4cgHfPd4L7t0vxKPDJ+u90ILyDQoeOiWLZ3uSeQi81Oa/bRkkJeHrOSxbM+g2v6799fjaasbOiHTcku2IC9DU1w5ta17vop+8YgLA+BF5+/j5KDo4XBsft31Lg+OdwQe2+InKoFtP4aGaVgnZHo5vz4Tw3AuuleloanYdDTtAx5L9SrvwZYx/znQa1Kc++UaBsaHg1PMa4u52DNlRQdWP3gwNyqrDuoz35MTxg3wgniQiaWzDwekN2hYR2zKUhM8BHs9ozdCv6QEcMmoVxMhVgHHqISn0o2k113cQGWB7M9uc805zn20jZbH+ZBgQfrKVZ9+tICOV+JJem8uLoHhN5jCuWpB62TY8k4rs
X-Exchange-RoutingPolicyChecked:
	pm9ftCKEwYhM+T63JgMqQ8y0t+ASUqOSUno3ifrLcHx2jJ70UXnUbMUODp5sjVlTWHsfaKOCeVYhrQu7xKFMbHPmLMS9peFPpa+KhTBDos0YKmeTXLrT65JcuxcIXvK6wH2YYfupIM/EWDoqe/KMdMxuXaW2Y5CZ088VwlgJNaOnxm1qtybCkUyJfkfta9rl7CQOcw+k873d2Cbuiqi90pO3aBqmAWUdbv9sFsIJq0HKgk/c2imcd80Llx2r61cxWEVEyEI8pSdHkFfrPMK5MOJnfZZBi1sxqImHfkwEhxuwSRjAgPYjJBzsQU/+5kaWrNzen0UOR12KzX6AB+x9fQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 02:31:50.6725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0040bc6b-5545-425a-27c4-08deef750b00
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB6E8A1B1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAxMSBTYWx0ZWRfX4jAQrc2kxhzZ
 FbheWQIATxVezmeO9dpRtqoJXQaTM3Ywv207qODmb4vxhxe0+c4DZnNW8c7O8oOlx5nsvNeXxqG
 JV3TmamCDKFH1cdZGyZdeU8LApuYf9seiJEROHXE6gsH/Xbh08F0QgmFYBf+MAIUKUmGnmJA8Hp
 YLhhaC2/IeSpNwz0k2n9aam00aTqT6NX8PjQGiN7B69kkdtmeRtpA5VDFkPk8PY2MkMRA8zmpzL
 m8yyIqJEZtqng3l+070/5hVgizxgF2GZwuvLXVh6z4WOGT7d2uQwzuNef7EA0vBWsW70XFa0pNg
 WzIQ6CGw1mYO2wX2hJbmNQrqyGYwCPyIcFaRYPBDlN1bjg1YnMypx1Sxq35LFCS5lDEDGVLt2ZB
 U0MsQ49MKUkPPhAo4EK2nC9LrQTmIE8+Nx+wtahcI/kqAAbPFhTxnCT9G3VbLDwWmH9s4Nn90DS
 cWlJFS1z+Hq4G7OHuVA==
X-Proofpoint-GUID: jjuHH6kyx4KOVUePKVNZuF53hfiWlIQ5
X-Proofpoint-ORIG-GUID: jjuHH6kyx4KOVUePKVNZuF53hfiWlIQ5
X-Authority-Analysis: v=2.4 cv=Dr9mPm/+ c=1 sm=1 tr=0 ts=6a6d5a9f cx=c_pps
 a=St7v3kIWLLX4ycmTPR678g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=I0psCi0X70ZjT9_gpkEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAxMSBTYWx0ZWRfX8R1XRxaJ4Cn8
 NP6VdJN/J3RY3AwiHOdcvDQxmSfEIn70owFTpAcn9TlyB/F9OqRRgQ62RzByuIJ0lLMjAu5C2jC
 GTO9XbDvNeKgzbu5AbblplbXK+1RFVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010011

Add firmware binary files for new HP project (Messi).

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 WHENCE                           |   2 ++
 ti/audio/tas2781/TAS2XXX8F7E.bin | Bin 0 -> 19364 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 ti/audio/tas2781/TAS2XXX8F7E.bin

diff --git a/WHENCE b/WHENCE
index e3efd910..e21f3929 100644
--- a/WHENCE
+++ b/WHENCE
@@ -9725,6 +9725,7 @@ File: ti/audio/tas2781/TAS2XXX8F40.bin
 File: ti/audio/tas2781/TAS2XXX8F41.bin
 File: ti/audio/tas2781/TAS2XXX8F42.bin
 File: ti/audio/tas2781/TAS2XXX8F62.bin
+File: ti/audio/tas2781/TAS2XXX8F7E.bin
 File: ti/audio/tas2781/TAS2XXX8F94.bin
 File: ti/audio/tas2781/TAS2XXX8F95.bin
 File: ti/audio/tas2781/TXNW2781RCA0.bin
@@ -9851,6 +9852,7 @@ Link: TAS2XXX8F40.bin -> ti/audio/tas2781/TAS2XXX8F40.bin
 Link: TAS2XXX8F41.bin -> ti/audio/tas2781/TAS2XXX8F41.bin
 Link: TAS2XXX8F42.bin -> ti/audio/tas2781/TAS2XXX8F42.bin
 Link: TAS2XXX8F62.bin -> ti/audio/tas2781/TAS2XXX8F62.bin
+Link: TAS2XXX8F7E.bin -> ti/audio/tas2781/TAS2XXX8F7E.bin
 Link: TAS2XXX8F94.bin -> ti/audio/tas2781/TAS2XXX8F94.bin
 Link: TAS2XXX8F95.bin -> ti/audio/tas2781/TAS2XXX8F95.bin
 Link: TIAS2781RCA2.bin -> ti/audio/tas2781/TIAS2781RCA2.bin
diff --git a/ti/audio/tas2781/TAS2XXX8F7E.bin b/ti/audio/tas2781/TAS2XXX8F7E.bin
new file mode 100644
index 0000000000000000000000000000000000000000..b0a4b3532abf264c79029ef1803a0c8ff11a5d85
GIT binary patch
literal 19364
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
b<)^~Oj+OEhl`SZleTsgHm9w?SH~suS8j?UT

literal 0
Hc$@<O00001

-- 
2.25.1

