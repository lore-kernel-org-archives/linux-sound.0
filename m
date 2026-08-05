Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A72F7F1C;
	Wed,  5 Aug 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933750; cv=fail; b=BQqkGHYkMa1zH2LErv1uPswB9wGus0L3icNHhuqTV/scxta2eE6ttbAdxkvqJjdQMOKzyGz/O/TT0dq8QlMEmgz3yV6K5pyMRmBiEEnpo28gOUUxjnFxAZDTkSypwAyKk4gdgvP3DTNux2UUyiQkHm8eh6MWcV5trC8zS3WQDV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933750; c=relaxed/simple;
	bh=DKIa1dY9rLwVq3QXXuzraQ10gxWAjSEQAteeH2E/X/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pwepwLtdozBlFMR16O4bevIHOWuF7ZL+F+3/BZZryJyXO+y2D60ba8JsGaRnkA2LzaMADtN1INGzvkRyAN/hEbFBp5NOJ2NUZWpma0cMQBbIJlPL0PbXg6aNUxntKH85GOL8zb3eohHC8/g16EU2w70yNGrzhUGmJ+V7XStzmnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kLj8QFph; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=o9pq0h6T; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kLj8QFph";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="o9pq0h6T"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6754uRgP3419307;
	Wed, 5 Aug 2026 07:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BrcEMRV8eigX5Ks0
	U0mYzL3Ak5rOYJMXgmU1CWiYdAY=; b=kLj8QFphGmHuVeS1jFALbPA6HHm4pIf/
	0Gg82rRqzyrZfzb4mBY1TtwCzXFzzzseeVS4ppvAglubRjLKq+94e/vn4kyYcFRg
	ukSE0K5243X+YMkNyggbiZFaTHqyofrEYhhvYh9hn3mKayelgw5tiDGDs4A/OZQD
	Te+Ej9RzM8UclLf5EVcmeeZm6PPoPWkjLleZaAWYIi+WUVQKuBhLCO65uhueaPz3
	MJ6Yl6ptSQ14HquCgAkyI5zGnpztNy2SMid+/WYN1AXbnUSC2GIB1gEpV3JGGXhu
	3ty+zy1giupMccB6sTnm3q8b/vI9Nxai18qAdlyQ9N2OfIjSer3YTQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020078.outbound.protection.outlook.com [52.101.201.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vnmdk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R245m+UNMtwiHrr0j7Fa9553UxG3ZnFjDrAXOqTA8TW8K79U8pFq5RjQYwt7jnoHGGGsKSvMoLtIvCMgzDY9rHGSHau2NeLacjdKUcrjh9eVWB6jed1h/dyUis4RfbRBiZmltx2dSra4C2y2w95wLWjbBEg0LETfpspoCaxcHsda3RMzCeaFbexOvTskHFAmZmL913xRTXhYeCXhSiIdXMz9hkWCV6wrASwiS4/goNSfE5YbqiIunawsEo+rk2QMZyA7cNfj7icvIUYOkTSIusaQZOr3qm7jz8SKc6u8NCa7F7Pm7ViKfv7IEOPlqcZPrT/vtz7SEQQF1x4bfQXshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrcEMRV8eigX5Ks0U0mYzL3Ak5rOYJMXgmU1CWiYdAY=;
 b=kMSAuoTBCnHhEsXCH579TPYsCvZD2rvsKvr7zlpliw0HbkF18giUZoQXmxm4/m8gJ9i/XJGjRSG/5tA7ArqTKhrDAD3SUdJ3D5O00NhqVroWT5pmgXVWERrmk2eqVUTHrfHAlsq46zCrNRt38rdxg/GOrX2Iof7flVRQ+CkQi3Md1GxsRW5DO6SesHnrPso1PtDv6hwL6MNvk8dOn9JcLWiVhDkDgyED0T5MO2FdFt0f00mykEzf6Shs+ZZuEEA848i+eocVjb/3I5dr5UParMrjUUHZKijH6+Z47383glTbMKluG/WO1P+pWpBIm41C2ZabjY9lLJvB3XR0JxJagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrcEMRV8eigX5Ks0U0mYzL3Ak5rOYJMXgmU1CWiYdAY=;
 b=o9pq0h6TBa5y2T7CBbU2Ie4wnZxByUg5PTiKZj5zXqpXNjU4gSC5RvyYSDQYU2pYZVnTORA5v5YePnrj6OEecLWPSoK5aci6FlDLa2cca2qLPx/fDulj5K0sZUX5MHNOYNY6+XkXSnhEujUA6eN1K2+DRAxNMkC37ltxfQ5wyxo=
Received: from CH2PR12CA0004.namprd12.prod.outlook.com (2603:10b6:610:57::14)
 by SJ0PR19MB5637.namprd19.prod.outlook.com (2603:10b6:a03:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:42:13 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::92) by CH2PR12CA0004.outlook.office365.com
 (2603:10b6:610:57::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 12:42:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via
 Frontend Transport; Wed, 5 Aug 2026 12:42:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6D0AB40654B;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5CE3282025A;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/8] Reword the SDCA HID code
Date: Wed,  5 Aug 2026 13:41:57 +0100
Message-ID: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SJ0PR19MB5637:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c7cba5ce-d75a-4018-a104-08def2eef812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|61400799027|23010399003|376014|56012099006|10067099003|11063799006|6133799003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	i9VVJIpX3WVbmMu8ZVMJmNi2ggUi0cnSpydzW4CJA3J1oDOAVNGeT3hv6FxZGkFuthCsqRi3HPLDvR29ygm+M3rJMDFT+JSgEffV68N0sS5oNFdlhypLz1Ah/LrXZl1rCs+h8k3qUwE03Yga4rPLuNwQ5h8IwdU5lE6mfrVPzbq3uhcu/TN7el4HDlqNxR922MlohPM54M15si2G46KYDbbaMaYaWQR/1Htp1mZSbxrs0mZ4gfKx1lU7yh1fnBXwiRcPH6Ms/1SjGWlKHBxEJsLgVEeFh/1M0VwpWX3+3Ra4/QwlqBW1/nY+EMqgwqgA7Czju42T1xU9puUOIsJjNaIa/wLzifk1ekC7ouyQNYCInP/lKLg/2+sGIPQxQc39mMvxQzT5kU0/VAWs+tnSyDFQdVi2yU+FUPBFy4P1PdKGeJg5i2Yn6N8UT3FOTga63Frgznad0IFSt9uhHXpCyDp41VQhGvvNhofVz2s7vR+56fJmu026NkMvNbo4GbcfJFQZcFqlhMCinJOiUdnSof3Xzm8Ne3saxZKWxwxbdDIJrkHRridny3mW8d2o1ympgI37wQqSISDY5Z/jK9l4AQ7yLyP3jItsy9QiOl33qmHTfVORhDPjaoyoMKHJdoTw4gDl7x0blNcHVUhImPmWGlQWntDb2L3XkDgqqt/iS0+53QOZ+fi0yTgXqut8d7Kg87nWAT6f0sC/Fp4UMp8uhQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(61400799027)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7n03cEBRKYRuG8V5Y8WcUhnCQ5EnWBVjiIKKoKwD1tm4lPj3stWZwUm05RJyQsONKeQmKXVLPJZNy4hpsateeCrfYQZfj8p3E+Uwj8vzEcjq4uaxqnLouBH7ikJoH2UatzAzHICgPQR+bnHOOCGdlTgCS4EqcPdpTwD1unRBw1moA1N1k0OxZF92AiU4XSt+RhybV2ZGYp0UkTtb9PmndwVJQQRDDFhLs7k06o7DXlUzCbdzxPvWIX5JyTEihxybDRjVofmtPLZZ1Mhd5PJzT+2dHbCDsWBgUrmKLNpLHWYAScJrr59ED/ib+VdTXlcaNyTQiAubvm8ZY4QHBcjZvceLdI66ZyV5gBeh2NMnweMQi+kKH7iEq/qIfe4LPV6SsX8gLl90HeGpf/cZokwDEH1qaFVUojYphQEDfViGbNJ7C1EM1t+CAABk9dbtKhfG
X-Exchange-RoutingPolicyChecked:
	H9+pojPr9yQSAmgrnwFWCla0ZrIO7ZaaVrtDSqCHnVez+STdY5QhnzPnaIpIbnBlOpR2DmdSDK33vXDH/obKpv4bS3AHBe01cpEtp5NeC1o2HK816wJ3KbFFImSMoX8UG0hP5N3nzyLuQ2gBQ5LUVA5CuNXMWl0iI+Kq0X1Cgb05/UeSM5XbUu7H1SShqcFGqZ4upECjq+35X9ZzgIfPDz2v8KEVWixV/07BS75rRhenk/xEtnLmRcihb5N7GZCz13qCTeN9XTVvv/dBsBNhknK+ZpKwQCxVwsCo6gF2x7HVOJgE1YzooWf3Bk7Bt3JJcS1w8iw4clpi+7FW4jdEhg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:10.8653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cba5ce-d75a-4018-a104-08def2eef812
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5637
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX9lfLrX4g6cCB
 zxG0vUemAeVCmzvmSAV01YhFdB8UwOJIWUoaLnFvdcmxn+gSWqvvWzo5lm6WTpM98uAHUBgORnK
 ZiFUt2Cp58NXOQei9kWh08XFVKjaJyQ=
X-Proofpoint-GUID: bV_QgGgsxd_tro7rMBgN1FhRlyJzX9ut
X-Proofpoint-ORIG-GUID: bV_QgGgsxd_tro7rMBgN1FhRlyJzX9ut
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a732fab cx=c_pps
 a=liVm50ALzK+Uh0u2J7W3cg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=GFAeOM2U9eHOgadyRbIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfXxAAH4IQEH61n
 A96hP9M8otMWVInjGXZO+B9Hht8Ho+1DfxcXkRulxHF+1W4LWmLknjRunXJ80Q+F6iSo1j3aa3b
 rcdSNTM1yFQMgldK7rkZA4+90Iqi7hqCeJsLiWZ6V4VOMX6g0HGPUdM5ZHcfo3pfYAawNO2+HmM
 jxhbbm9WFe57S13V4IE8rd+xR358HLvWPJfq/0O6TJXJ52bRgYYSLBI5RokEyKHqNwbv6O4Hmxq
 4JM6ceA1JOl5IkH+2VIGqIPAemd+IrJLvwHOVstiPCZjA32TkSpStaH3xegqELfl2dZJDsRJJ6p
 kpacw/rwrPtytPRt5By6Gu60OZkNGf1jjNoFtKin5/FbDzTTOT0EUvA/RhrbB3LKJnPNxmjxNDL
 r50WqKIUjBguz4rCv9H6zA4YxMVRTxje4xzyYdZGhQpOyP4PICphyiJIQPaphDfa7gzKfgQBLeL
 vLLEKmCyolgscAbWFwg==
X-Proofpoint-Spam-Reason: safe

This series reworks the SDCA HID code, the primary goals being to no
longer store runtime HID data in the DisCo data structures and remove
the need to pass the soundwire device into the ACPI parsing code.

To achieve this the HID device registration is moved to the IRQ work
flow rather than the ACPI work flow.

Also a few small issues are fixed up along the way, some formatting,
some missing cleanup/docs.

Thanks,
Charles

Charles Keepax (8):
  ASoC: SDCA: Tidy up error message
  ASoC: SDCA: Remove unused dev pointer argument
  ASoC: SDCA: Move HID registration to IRQ time
  ASoC: SDCA: Move HID descriptors to function
  ASoC: SDCA: Update HID DisCo parsing
  ASoC: SDCA: Add missing destroy for HID device
  ASoC: SDCA: Add missing HID kernel doc
  ASoC: SDCA: Pass swft table through sdca_dev_register()

 include/sound/sdca_asoc.h             |   8 +-
 include/sound/sdca_function.h         |  24 ++--
 include/sound/sdca_hid.h              |  11 +-
 sound/soc/codecs/rt766-sdca.c         |  26 +++-
 sound/soc/codecs/rt766-sdca.h         |   2 +
 sound/soc/codecs/tac5xx2-sdw.c        |   6 +-
 sound/soc/codecs/tas2783-sdw.c        |   2 +-
 sound/soc/sdca/sdca_asoc.c            |  13 +-
 sound/soc/sdca/sdca_class_function.c  |   2 +-
 sound/soc/sdca/sdca_function_device.c |   7 +-
 sound/soc/sdca/sdca_functions.c       | 180 +++++++++++++++-----------
 sound/soc/sdca/sdca_hid.c             |  48 ++++---
 sound/soc/sdca/sdca_interrupts.c      |   6 +
 13 files changed, 211 insertions(+), 124 deletions(-)

-- 
2.47.3

