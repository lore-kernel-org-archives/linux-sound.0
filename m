Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BF53D6497;
	Thu,  5 Feb 2026 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310142; cv=fail; b=Kbl8BLkoFKs6+B10tQlObjD/xwyHnAPK7Xc2JGj6lRZ8/P9m/y5JsDC0kbf0/qHwL5bptdX+qiYqqvgxHU8Z6zuVTk7IcCOOy2o+LIV+Jii1ZVzm7OBfzSWsR41Lih0Turph8LpanX39BlsRbS0TeHZXA2p4+mGVRhetCDvbklU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310142; c=relaxed/simple;
	bh=ltU1dVF5X/RHitCr2cC/IFv7W6pQf28Yhwehu1khWRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cbRSwCAkoe8BTTVAW9UktlZvdt9BZ4FJM+f36xzxoI1fzX9TNOBzv35PBvJ+a8OLLdTgs3FIWPQ53EAoKsEEeKFMvUGr05jtmINdQkR7lB0lcfX7a1b74POV85mTWv3oLwGNXxItWFKt09tDhOgygMZruf8fgtFbgonoET9fn7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ului+CC9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wZoCU+Dn; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ului+CC9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wZoCU+Dn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6154w9cL3212087;
	Thu, 5 Feb 2026 10:48:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0RxKFTArsj6w3f4g
	KkhucsNV3KFOBRchejoGaY8fOUs=; b=Ului+CC9A6mKk8GUCssS97SuURoIHE4g
	XS98Shi0Dmm7EHHoLUpRaNjP82AHhxyTO68tN/IJvUMca9gfoR1IhU5z+yPH9LBz
	BnOzZTbW3n1QtKUeAXwCKMOscxK24BM/+GzD85XRoAEiriUPmMdtoT1VCYQjuT+j
	qaE6mXKO+Z+d5UWA+m3YSXBJcDC30R4KJvpN5ztMUQ0MtEetv0vTf3ZduKsS2sgq
	75bkN25PtLYRUqsGU04R0uvtIiyFblsneSyoiDi9V/Q1j3rvEHE617wXSmrGHYvs
	dKNy7eRXnGZNZeoD2/8jna5ABRMwFDh9Tyo1m8zfFv4VEtDzw5LAxQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022081.outbound.protection.outlook.com [40.107.209.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c1f1k6bsr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 10:48:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpNKmxEwu1RfSLuD9iftT/VJV2Ib+t/Lqh1SaGZSd94bTpUTMGhAWKoj1m0GcwD83A0z57LWttwFBAFeuLyGOocoTiCcmaeJR2qjJB0YL7bl+xOzwBDDEE4NTC8WUS/gjqtEJhc4h4zWPG/bBIIJfqhAlLvY4k7w9xIDPppu+jL1BPFEPyOcbrvtFsAAhkwikt+5bIH6N9j7GZUosMOMnvMtfzwvzFpNWRlDmpXYmLRmLJXb5VR5kZhnxt8VZxV6CIxEIfL3uW5yvdxLhjl7eOHWwFMrRuJKXcDizF14ufxWAEiYIbENmoKVJ0e719BEOHbbYa+P63BmAYAmNDyJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RxKFTArsj6w3f4gKkhucsNV3KFOBRchejoGaY8fOUs=;
 b=J1wub+YRTXGeBmx+uEqPBfHN5MczZdobJFZ3tL8crBDgKFehe5yVnS2IsS11w8ZHFOpgheTLjDLpbsHg0NbDU+GCM7RJkOwEzZkhhQHdiVspEV9xtMNPRBavGOYXjgIZ7BQ9/ClFVGPRHr4TxZVW/mLOy9zunETs23+JC0CBM0RB6GJjb7bRADoUCxKm4nw9e3seX8ZovhFhBO6wItgb/MNyN47o8QIsWgD4St+Js0Rb5RtkSi4pQJ9lYSfeKTnFzpK1OYc1cMTMRi7ZYS6bwayVKflL550E08kHCuPKkJI+yTWdSMUQKD29bt9Q0RCdsBAjf40rhLFiqJqt7RJ8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RxKFTArsj6w3f4gKkhucsNV3KFOBRchejoGaY8fOUs=;
 b=wZoCU+Dn2nFftaKQy1XDZ52zsx6tEyQ5ZmmGAkkWpAKuA88xeH/gPcmSFX3Cf8i37iq6Ii7iIrAsaP3lWeTNhhQPY1Vq2IHxyZ2jKwnbNQIf/uh3ABSH7+Q+iNG/DDnA4bE7TZr9FCquSQwqGK4nD31RRzd3hD0m0gm2iF+ZZ3I=
Received: from BL1P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::31)
 by DS7PR19MB8856.namprd19.prod.outlook.com (2603:10b6:8:251::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 16:48:40 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::f) by BL1P221CA0024.outlook.office365.com
 (2603:10b6:208:2c5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 16:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 16:48:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B4835406550;
	Thu,  5 Feb 2026 16:48:38 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8F4B7820249;
	Thu,  5 Feb 2026 16:48:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/3] ASoC: cs35l56: More support for new Dell laptops
Date: Thu,  5 Feb 2026 16:48:35 +0000
Message-ID: <20260205164838.1611295-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|DS7PR19MB8856:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a8b5d6a2-6f35-4bc9-0608-08de64d66a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YojTq5vqX7ZUjbSNpdd137fX+OsKJ++LZHsyHyva6MGdCetFtjyv5S5pX8NI?=
 =?us-ascii?Q?yhLh2qghDvw5+c813F39TXz746+dw/J/v3kUL8btkC7QYkiWomXz9WmiUV30?=
 =?us-ascii?Q?mWMkymne1tDrHP+hJnD7TYBd2QRgaGOkUnABQ2HzJCjNrl4xnayC1MhTsy0e?=
 =?us-ascii?Q?czsTtHv97CXVROpZfKlz90yzijU3YuwU4q08JmtVd5DOzXt8Ex5pjbXqUWi4?=
 =?us-ascii?Q?vAk/PxBygKBJ2nVJ8IvQOzpVwA/rXSD4zNYeLpp3Wi7m81cfXjn7rndcXLsY?=
 =?us-ascii?Q?EyDp7IEx85NjpyYhbfIvTvA9aRtlQtpJZnCUee2u7bDxJP+3ebiEx2Vmm1fT?=
 =?us-ascii?Q?53n2JD3IMJ+G74h4lzyBzzCsKUBna6wJZxfgIAOwqCO6cvNEXW6kTqYqaDRb?=
 =?us-ascii?Q?B0jHWyDyzJ1V7t0k8CgvmlwLXiSOpOC6jErvprpdONUlEsbvAMUdQBA+cNE6?=
 =?us-ascii?Q?xe4ug/dtANn1QY8Tc5nsEIev0zuNvVF9GCAQ2O+H7a435l3XcfYpJhqsSpJc?=
 =?us-ascii?Q?xCVkVH4EsEQiwTSo1EylNyyf9SXP488y28JDSjipk+UTWEUkiGIpAlUMVQXG?=
 =?us-ascii?Q?uwWoy7o7oOnTBwU/Q5OCO2gGPFglcUmDkpEEJFvpiT00IaB0E33o6sGKvmX+?=
 =?us-ascii?Q?3fZRNHoE2newAc6siCYaZ3F7/m5GncO9R6+bNKLhvXw4gILsLhXpUaLOuUn2?=
 =?us-ascii?Q?bw+NLfK+WgTsfBJ+D7yKf90gNdeNZxACWSZbJpN8SK/ZP4eSWl2mmkGSvD5G?=
 =?us-ascii?Q?cmdiN9sbKSLKGk/WBwi155wEoXKaW9Dgd0EauX9vU22/xWqZywyR5M6oBzp2?=
 =?us-ascii?Q?vfUKLlZFjjT1mGy+hptMKOv2QCNDWT95cO6ehX8JRAgxt99Bvwtwa+X1uOZE?=
 =?us-ascii?Q?iWkqpjjHT0UQe9QUwOpnciHkltwlXon0+4VWA7VLi/Rtklf7lZVOtTrIJlQC?=
 =?us-ascii?Q?dxvSD97+Sygl3aiXhXOHruMyW3KgCuomWNPZ1qI/ypKBx28Zw+O0nLh+KpYd?=
 =?us-ascii?Q?xJX8rbakbHE2oRPxJrKrhqDA/GKKmVEaTRN19sBB3zPlN3vQfhkwIXfK/SV4?=
 =?us-ascii?Q?cuIvmohWWCabiXOTj9X3a/F8Vvwj/2lIG/3D9sfYD0BDk6ULpILJ2l64FTMi?=
 =?us-ascii?Q?VtEx4bxL9nt5ugOJIaffaKa0FIoIlxWZZfJO7zknPJaqGkn0TazKso18aJpL?=
 =?us-ascii?Q?btDKbWTQuUxmf8xU40Y6oV7J/VVWHrvvgaRzAemknZJzeilntrp24g7TofeV?=
 =?us-ascii?Q?I7UwXV0Tgt+/x0Pos3rFjub4bEZ4MQ4K7+Ix+xnL0YHzQHNPN+w9hAsYt//W?=
 =?us-ascii?Q?5gs8iz3I6VnQ/QTnI8HPN7GSOgvGhvoNvu8iH3FCevf25hSozgpSJjs8J/71?=
 =?us-ascii?Q?Ty0cDibTUUIzaISKt5WEOfD/TbRycSvSMQp4zeG0j4R0tYzuxA3KTbR195iJ?=
 =?us-ascii?Q?HPs1822JpRuSwHEibYbdW9Z1GBfcguLzwcbweui8yJ/08OjCMwgwB1UYT2CD?=
 =?us-ascii?Q?zqCC8AzHHy4yZOJGqDvXilDQVTHlh7kh9enQEarWMu2NJWlTxc7CH91lH1g0?=
 =?us-ascii?Q?twO1DapSYMRpindWu6lUNOmCTXUdzyjIuUNOX/23e1SsQ4z2OEfXIyrPzBv3?=
 =?us-ascii?Q?EJ3PdBXwt0l8zhYdb/TmnKyKe+yRIps3javjNcthM792HCnk9X0OQRScsgXs?=
 =?us-ascii?Q?m5aI8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YnAcW/F4MG5B0wyWpsM17Sw7IuZeVGeFB2E6bMs1dLpJqb6QkJT4RTeZHbjpTvBloqOF7ANprMAJk/5FPhhpgJhwjwy8xCtUHcTKJq1GeZFNswUWUoHuWVK/GGBZtR0AZC22B4V1cIoGNAGtbPaHCkFXeECFrh5LpClLTTfBlgqLie8xHiC1AcuUSLxKO5py3flE3EdMOx+5So/OgxaFf7p280FvbaxVsJ6GH8kb49NvrVIEameyaZIaEvIZeyfwgQJF5V4SU5F5wgRbgmdoCEs8q/f8IlxmP2U1QPLB6yNAbgKcgJvu3drQgJrC3sln4YsLxfRTO+9r6grn3Z7A5CUBTxWT3CrxCGdTykaJHKCoIVvM/7d6UMXAq++Kx0iuXBuzL0S0/nmuSRkA6c2RgmKc/ORAVbvPgpCaU0tJ3uoOyq/xslcbmsaSbVHkyyCB
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:48:39.6742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b5d6a2-6f35-4bc9-0608-08de64d66a16
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8856
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=6984c9ee cx=c_pps
 a=XJoAL0HPiv6B0cYJlRTKVw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Lc9OJlxGe1G57YDyX50A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyNyBTYWx0ZWRfX9zvCl+MNrQd+
 i2DiivPSPmPYPg8hD//91IA08MioTiYPcw1+J57sOIYrfUjDDwmy1kc3kFPqNTr7SMR5yCPtGVM
 oxPrEI5H6AgHbHxab5LPgOmZPCBynn0B1WTwJsIsrBEY/TDudkx5mYMYGoE3gHn7yZyjEZI51Uj
 ZBXccdvdRVkN6YMeHcGgDdyfmRbwnzGLoyCIAtnrKrIJaTglCxCW0YJdKAl8beEKwyxVK4867PU
 6FO5a8XLT5SF6yAxsOyIhRtohWwrWCDFrQ8BXK8hVBZYAyg38eGLnMXJ45SUmGhpauP8ODqcY4S
 QYnC45EQHLKu+ucKzz7mPdwoj/5d1+eneBTQMCD077ac13Lo+yfnIf/1tj946Q9WrTVc8I2Denv
 m/hCngfnCy4dwKo4EtrZAZOkUZydyVbxCjq7mVzpSgywBMUnN1XKKCgceEOzB9AnURAsyiwfXS8
 v4jN4ZnbTopvWIjm01g==
X-Proofpoint-GUID: 2WvKE2rWMXpAbvRg2tawalTB_k-I_Flz
X-Proofpoint-ORIG-GUID: 2WvKE2rWMXpAbvRg2tawalTB_k-I_Flz
X-Proofpoint-Spam-Reason: safe

Some new Dell models use spare pins on the amp as a binary integer
value to indicate the speaker type. The driver must use this to
select the correct firmware files for the hardware.

Patch #1 is the new support.
The other patches are for KUnit testing.

Richard Fitzgerald (3):
  ASoC: cs35l56: Support for reading speaker ID from on-chip GPIOs
  ASoC: cs35l56-shared: KUnit tests for onchip speaker ID gpios
  ASoC: cs35l56: KUnit tests for parsing and using onchip GPIOs

 include/sound/cs35l56.h                |  37 ++
 sound/soc/codecs/Kconfig               |  14 +
 sound/soc/codecs/Makefile              |   2 +
 sound/soc/codecs/cs35l56-shared-test.c | 680 +++++++++++++++++++++++++
 sound/soc/codecs/cs35l56-shared.c      | 172 +++++++
 sound/soc/codecs/cs35l56-test.c        | 273 ++++++++++
 sound/soc/codecs/cs35l56.c             | 141 ++++-
 sound/soc/codecs/cs35l56.h             |   2 +
 8 files changed, 1317 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/codecs/cs35l56-shared-test.c

-- 
2.47.3

