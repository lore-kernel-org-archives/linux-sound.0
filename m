Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3677C306744;
	Fri,  7 Aug 2026 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786115886; cv=fail; b=O67+wVFVRE8sdTPksbg7qk1xd2BAbZwWhjL3VuK3x/71uJ4PzBp+K79RJ2qDRKCwPdAEF8XiV/z6Y12uOHGL+z2DxEY+BjTd7zluqSh+RUdNZnyCqG14kCeKOPjGexHCer5232WupHxu5uJv6EbMmCY7N/LFr0zTWV9Eem83H5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786115886; c=relaxed/simple;
	bh=3MT7uB7dJVpZ6HDU3ytCiFYUT0a+5iNUt/z9rwRhupw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HR4/byIcI/h13/psNFZOsIbk7qsnz8opvclNKnanvyqxK2rSKoqUKQDUosrEfgdzaEigt6UqesZ35XuN9mK5DOyNfTw+yEMa4n4oONfwJePIOpxDwQC60ffL7RZq0USVSWZhebqN5p2CopBz3kEPekrA4JJmQRe4sFvqk2VuV+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=CRB90MNE; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vh3hx9w2; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="CRB90MNE";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vh3hx9w2"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677CenIv3177167;
	Fri, 7 Aug 2026 10:17:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=cKADjBRVcg8o0
	YoePJpQrfJkVRHQ01qWZSUalkkL84Q=; b=CRB90MNEDK03kUGbMbY0IP8EdVo/M
	o3GeTtqWDdGmguiQLwFrUvmwXC1Z4wqagRjSUTRrFapbQPKPWErKpJ5OeC/awyV0
	sO15zdPMhDF5YPpgbtflH7JGIlt3eBtRjHrfgavqJs5PYoErsldncwhrrxe9Zvll
	aYQ6Z6dsnqOtJOMHJNBe8ipv9anPl3jGrvmPBIY7gPF+fvgx8+I7WLmlw3zZYdBB
	Qx9U/gFFCXIjQbk8GiNjVhszy3JiYs1qsMS11LmzTl8erEQqH11bPejPBY5ctHEI
	3LSEm2gGi8i0YuZ3Wylg6n5UBkGEDCezbEymlCHb4iq4Ch3v4jH3VGrjg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fweqbsa95-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 10:17:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msR8kKZcSyAJInusXnXEyQ09mMqNbmhLFrmcQNKTGEJO4TrNnhB93G21HV7ogThiwfN4BIxZA+ctNX4X8nBYQNrAWXGe9UpuvGgnDFooW/lQ6DohYSar6vZuEGf47KVYqe6FlCceSoHGymiAxpJnmfMBsVG0MiDWiE7NuXYXk48a+TLo2vK/YS4iHMKeqeW2QU3WeEkH+R24enE65IREGQ3GXBner7JRdwqzKPdqQS8wXbMvYJQiKEElKC0oif2pOaZDltpCd7rAy9pjzF6pDBsagoEbW2OzGHY4TjS/gHGQ2HrfIQI3jNTAd1Vg9Owk6SqzBYODyWTykKdklXIHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKADjBRVcg8o0YoePJpQrfJkVRHQ01qWZSUalkkL84Q=;
 b=EL3pjQ2asqrE24yAD6NThCsdgwzzGIKpT00/O8W+MvPrUjtpc0n3emkjZOnWHk3m2tgsszUDbDZQVlsBiY/H0Qouz6sbM2BaDWq2AEfcOs7mKKZovwxVrSVYwc7I5cRKyG4jJBLDNqlZ/hYmg16Zg5Law4XUS1FhF8n+EWfaRzfVeLKw8c0tBCJib4WNA0hqFnihLr9YnYfb2+feURLCXZbLtIRI+FyXe7PFB+9UI6P6+v5epHYlNEJCX/l6TfBfM0odaBxFJTOUxhNrdEKszdUD9H5afcnsXYS7J2/7GjxXaFU+Pa/w46phHR28xmczhW71oLEKxxtMcD4EAhoPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKADjBRVcg8o0YoePJpQrfJkVRHQ01qWZSUalkkL84Q=;
 b=vh3hx9w2YQW8UfBRWMEbvD/w2Av9a4nZnUGzWBFWENaQf82izjOwNbzktweCdiEuWwLwIFlCsx0LLZ9To0i6VK+jnwaih83IMZNeLkwfoTZW5669eia73B48xsJzPAabRRS1Y2kgrDsXdAFZmxR+wg/4L14zUToN/0vR0t9AGkM=
Received: from SJ2P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::13)
 by PH8PR10MB6477.namprd10.prod.outlook.com (2603:10b6:510:22f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Fri, 7 Aug
 2026 15:17:15 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::a9) by SJ2P220CA0007.outlook.office365.com
 (2603:10b6:a03:5da::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 15:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 15:17:13 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 10:17:09 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 10:17:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 10:17:09 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.136.11])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 677FGqL92052760;
	Fri, 7 Aug 2026 10:16:53 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1] ASoC: tac5xx2-sdw: select REGMAP_SOUNDWIRE_MBQ
Date: Fri, 7 Aug 2026 20:46:23 +0530
Message-ID: <20260807151623.3005-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|PH8PR10MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bed4883-3c3e-4981-36e6-08def496f589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|3023799007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rU4H9BrYZM2IQqxw/8Z1GjVCVr8HckXPk7KOEbDs+ObrJqpAkuBedksLA8jR9R7+ummnKoI9Bv+1uTO7srkJBWWWpioCEOeoCMtonCVdnWs+4cJUaeJi4PZpOsidHk4vbY9Z3/qohJKcD3k+fBLHbeLkSH6vkknh5cFuBl/SYPYoLTBskKgRpNW52b231mLkQZxG5zG8eYZEcmXDkzxXwKlnq5QhWoqcCIlD3l2Uy3DuxTSG5Q9gjVLuKlC7cfj1OZ2pIXwYKy64nVN75Bi1xAjqSiBvYRE7rdatQ8t+VktucqT5BbAzMYcfLBkQr3E0RGG7JSkrFV3e0j91DS3CAAZiRdSznGfVTpeBvRNw1BZEW3CxMDJ2PxOnGQ9ETyLdZBneQkZ0Bi8n7FIp04RwCTSAh8Iua7ME+21I8gYNZHxlmWMsU3192WWB0s6DJD3hNE8YwoU8YcdEkhA8Jxu1YyZnk7+o1Qc89aMDOkFxl00ULN88/6PQZ68MHVLYwUF2hZFIm3S0Y4C3mHXtlddvnJp6mRG0L3lsvpOeewkgbzT3TFni0GhG61rwdVC1K+b5K6hQOylaHrSyocK3jysNY5MyR6EL+yK1he42fomsYp7XQ8iDpd6+OGF9FMK+gfFlhPboEFJM+94DGzD/2mTdFiOaVc12kU2k8G3CRZqCQHYX8u06lFmO+4X8etnViDSUyUOobHBKt/I/Z/PQKEoyNA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(3023799007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dxsQBvyNmUYrr1qt/Calw+mkyx8W9qnwzglRmyu4O9AgX+hzO874CuxCaINryvYNwhLbZDg0gbcaSdfjNvljQkC2UJKdTP7CLOuLxNx+h8Dpr6ap0+LP/lfpA/xGIlCq5+O7KDkfLQkEP+MI2PtUw6mol8t1Quw5fiUXWZFpk3bjc5Qcl1W8X8SntLrLKUZQQy73x9DbufR/lzG1XVBmCaM4j2SdDrXO+0VS+/T97YNxhuvY2l56F+k3Ci/MM7D5frejs+S5BifYbCnHvM+arBSO89+lvzmhvrOUNSEZ5pKwv2F+9m/doqVeGrwiMKcNfNRDEiRJppNxJ2qZOuFU+nKJCbAPRtIu57607GUlcIqQui/11pYIMPkIf57x74k4MWrIXMSONZA7/FJPHMj79lg8gbHVibehNklaCj9R0Qgu26pQZn+sirD7XSnqKur/
X-Exchange-RoutingPolicyChecked:
	dpzuIG5hQuUzEk0oyLc8xQznFM07TIOXd+qNuNnLQnUbgaAYLcA9RtvU8ePuqSNFtQKtupOQvLHZU5yxaw9DrKNjBqSV0qK6WUBe+TgJyLZ1jQNcR3XYU+JHFbvgcYnkqcadkJBwBxOa/k0DrqXZ8aBLimd5M4hcm1nHhyv7/TnAlNgh6WQrHtZ8z6zK9siKwRMjKwcZnWny+CFMc4yhKwRyDvnQPTvredpewg9q6IGIiWGv9jE4E+bwJTCJAda9ccNO0rQyVRve9r3TBuPTUhGICWAqEaHH6gcaKD9OOohx6ssxfGwvOkevcdIrlPWHYil5LPzebklWUXV+rEpi4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 15:17:13.3590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bed4883-3c3e-4981-36e6-08def496f589
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6477
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfXxWBxYUInpD3+
 MrVWqRK2tpjYvsHK98SMQ7u1CmLuQT6+uDRyfqxbj7JNin9SGIvUSFDsH07ChMr31X/ynbIBVNs
 x+UWpT09jxvRSl/z8bTFp46SfOkTo18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfX/4TTMS4VdZZg
 uiC94C4S+DWGW585uBnv9872lmwm5y4ZGa/AWtALdjMTxR7Ar5iWulgzaRRxpaEx5XfIb6xmS1q
 /s2BqXpm7Im+MdzNlwWVtWdqMdH4jJ2wHU8f8Yt1Nf2pJysHKRglDDh2KZSXG7siBAF2QbGQrkZ
 ucvj16eL+oFy2lYhqRTAzgsorBXwUUpqE3y0UEQYAtXUw9vfc9dljC2g9a4gff/5HP2ODh97wTi
 mLeykdl7n9aK3Rqu86bq4VCxmvnr0HM3kueDr0hLEA4GzloYzmqHBw3xBEa++R4mrp7/njQiFpr
 wMFwvz688hPC/omPljMIFWPDQ6g2Q22r3eMACae2IsQlCmIiKVyjj42cLnYSQ6wGlAtIcooQ8eY
 oZoZezd0lC/48+dgVqNazd0Yr2BmxIf5BcbUqOo7oRWGepi9cPvLsaT1aHQOeKgRJq+XqywcdOM
 E093V3jiJ2gM9U+TprQ==
X-Authority-Analysis: v=2.4 cv=bMYm5v+Z c=1 sm=1 tr=0 ts=6a75f6ff cx=c_pps
 a=gS8+cbQEeirDoRw2OPG9zw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=EAnxmtt6ErqwK7as0wgA:9
X-Proofpoint-GUID: zB31OTXvWvrRt44xmG8tiE_Yx650y6Cn
X-Proofpoint-ORIG-GUID: zB31OTXvWvrRt44xmG8tiE_Yx650y6Cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070119

 "select REGMAP_SOUNDWIRE_MBQ" to fix build error:
 ERROR: modpost: "__devm_regmap_init_sdw_mbq"
  [sound/soc/codecs/snd-soc-tac5xx2-sdw.ko] undefined!

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6af024778..49cc7a867 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2173,6 +2173,7 @@ config SND_SOC_TAC5XX2_SDW
 	tristate "Texas Instruments TAC5XX2 SoundWire Smart Amplifier"
 	depends on SOUNDWIRE
 	depends on SND_SOC_SDCA
+	select REGMAP_SOUNDWIRE_MBQ
 	help
 	  This option enables support for Texas Instruments TAC5XX2 family
 	  of SoundWire Smart Amplifiers. This includes TAC5572, TAC5672,
-- 
2.53.0

