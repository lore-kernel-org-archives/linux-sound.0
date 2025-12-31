Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91FE1C84A2;
	Wed, 31 Dec 2025 17:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202048; cv=fail; b=QIrls0/MFF2ucjfN5DLVZlBUIJskii/do4OA+8rw/8goeQ035tN868LaSUW2jW/ojaxARI2lEHrr+b8uW3ebBKUsAyNOlipvVHg2YhDEOHn6aeTzMt1vRYPM54EW8rQ2fBi6mnDHU+3UePZ0Q9797hCm5uir4pEwYKBtR5qoKmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202048; c=relaxed/simple;
	bh=qM+mKhkc2USvbu08HQvMGE0QvQW7DVbt1Hakb41/PkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H+PxXE7uUlAKogQ1NrWaXVGQoibN8+dy28p05a9qR9MWOwo9dMwrm9S5UL42/kt9zwFxAxE+5wgta3tDjd3RQknfoWLxVzAUWH4SEuPb3Oa9EE37x4DqzH93WI70rgGH/lHFjBID/2Z51OqFoQayUo9TaXFoF5fRwrcCRUWHuO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Prvtb9jf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OBhQmEsz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Prvtb9jf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OBhQmEsz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVF0iao743550;
	Wed, 31 Dec 2025 11:27:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=jrWE9dDG2S5My5g3
	wCI6DaYwuMjOO8vu04HY4r8J/WM=; b=Prvtb9jfqfxmZGXjYQgxLNkIoIZukf6U
	801OjCEKctu+A04WunzZYmlB9nhf7M9TVvXiKtod7Q9xAvDiLao1bmmEzlCvSmlC
	P77setDcGxjcirQO5r6nCF55uyKJdncipobjpf+wD2Og7BizPuT/9GIe/AzmqJDD
	eYCOcyTuHZ7BmSgYwgrfZITCxiXj/MEEcYoW9EGZD12j7iGjp+jUnLVUUpsxuFYT
	CcuSAsMDGN7I2JT9EA3oDZdxeEBBu+JUxq7SoBmWA92aKUVuFJADNJXoafFkY8gv
	/Da4WrS+ppUoflV/e3N3MmBaHscghkhmaHHMkV9rklZGbJZXxvRMBA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020074.outbound.protection.outlook.com [52.101.56.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3cakn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gce2eD+J59y4NvMVdpTzuFBEAKkm06UE+wzJCDm6LR35PXrnASmiY8sCGRj6G6ETTFtPIvcd1wVUYezPecL4P6qfq6RDcxaxnoRd7WQbMIA0GE3Iiopzl25RY0rsAvCmElnxBXVZtPurpD3f6Hafb86ioGsOLqPTh6gz7STUos0Fttn0Br5DalRAq61HIEWT0D8ZDKuLnLV5szGMzcQW0HzGASvbxSwlchbTaLQC8UV3ik5v7PCA7nDti8tZJgopSL7QICHif6sdST1X5+Ac1QDxCI+uNQPoMmhdR6YtbivVxL8jdiS6kuxgN/lBz2/dKg8FT0tVmTGe6h+jUkXVkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrWE9dDG2S5My5g3wCI6DaYwuMjOO8vu04HY4r8J/WM=;
 b=w5QG6YoA00LMvGmqeAsOj/IM+5J/1+9+fd1gX7HF/Rr3+U6qdMl+Amy12t+8GAO5JbeaIxSjzk0tgVUqZb2oF389LriiMqs1D32Gat4jS16/DbhMDbPvGRh9iWIK/0DKpzLRhXvDcN58dPV37VyTVnwT/jJGsntUbcM7bTvAv/8/kRQXvSvlpNlC1PEk+T6syvpHRFY2+I78oxyLyDoh0VdkTu2K6SU9zJBVgTIft9plSlkgNO7AsQIpxnINwZy9MOkcEQAaicP6hMrmWlqdZyskYkvIyoIy0bDC4n9VWAbeTzZXWa/PRiBvStXoz8IGRmO91ULFksWp/k7/IHA2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrWE9dDG2S5My5g3wCI6DaYwuMjOO8vu04HY4r8J/WM=;
 b=OBhQmEsz/a8q8lj184l4YB2pd0mFIhcJDfDa4s5O348cMpKKX93nx76RuGTtMrjjvtGqStqLrwRgTmh/Lv7qFz7q9Djwb3iw1rigXZt7cI0Uoi5bsNsV1SKH7iQiEPCQXUFxWUwicU1QPpWFytWctV6MkqBp0VILa95jR2V8tsc=
Received: from SN7P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::11)
 by BY3PR19MB5220.namprd19.prod.outlook.com (2603:10b6:a03:355::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:27:20 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:123:cafe::f5) by SN7P220CA0006.outlook.office365.com
 (2603:10b6:806:123::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 17:27:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 579D4406541;
	Wed, 31 Dec 2025 17:27:18 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0B851820249;
	Wed, 31 Dec 2025 17:27:18 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/8] firmware: cirrus: cs_dsp: Add long-offset WMDR blocks
Date: Wed, 31 Dec 2025 17:27:03 +0000
Message-ID: <20251231172711.450024-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|BY3PR19MB5220:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 702fd230-62c7-451a-58c5-08de4891da27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MZvbagMzDOuuIspN4mFj7cl+BePqt7WQdvIv+bOJusomIq9NDLiIyaHt2VS4?=
 =?us-ascii?Q?0Nd+ANpjwZ8UHGkENGAENLaJcnoxWajnNMan3+CTxS3MJaHXkD8yzWGS9gp/?=
 =?us-ascii?Q?M+W7RUZo25VpfSy8WNSmARQYPKxNNFs0aGxtkjLS+NJO91G1LKDMhsNoW6a3?=
 =?us-ascii?Q?YvXagFG4MIoE+yym7vsMgWLH86DuiOCya6vcGSHxQ9yGMNc26AjvF30QAf1P?=
 =?us-ascii?Q?8aUzk5s+lqyBn+tJRTM2JJ/IbXIVF6lujSUIC3AocI4gKU7yQ0axLmh9wTxN?=
 =?us-ascii?Q?9djGPoY5DvMymVnVERF1yRza+ms7dyLQL+HiR+pwV6N739C7ctI+zsBQ54QH?=
 =?us-ascii?Q?5S7iX0KCkQjUKUSAi7Pq1mmU8ZHn0ik2AFINpU6c4bJpdBRFyoBv02iFSYaY?=
 =?us-ascii?Q?8I5wJXTH0O+FvihOPCL9yE3sonsWh4fW8NL0Os8zE/JMfZvN/Fx9Pii9qqU8?=
 =?us-ascii?Q?w04ZSwbokZ/Ul8fQCB5U8TgY022sP/kWoNw1WFNHw5hoQ98D6B7xsCwhljg3?=
 =?us-ascii?Q?3s5cykyiL+VUnWwB+b+pIx04Ftcgy1+3dKO5YzGH05FH8z4489TrjF3pL+QU?=
 =?us-ascii?Q?setDUOD5SncYUvouKy1QnSmb3wHmebQlSRLo5vfga6LI0Hi4mwgZj1QgFe/e?=
 =?us-ascii?Q?hQmYcYsIEPgg/SDlJ1+8XXdNcMomf4PyQirxIIn9Nao6lDFzonKH0wuID34p?=
 =?us-ascii?Q?+7meP6HsueOpHeQ6TeF7N5BlfcFXQvP+VfzGXoMac85NLruzmfEuxmumtCyG?=
 =?us-ascii?Q?ZNLIs6Ge6iVozoD4b4CmGyIQo7dtq9+TsezFSIILUc+i8Bo6wgJ5UXtWwX5p?=
 =?us-ascii?Q?I7QqlTaadrnivzjNnMsafc74k+y3fshCIvQeyAYSLhnSJOoaz/3PoJBcPB1o?=
 =?us-ascii?Q?+gpdkB0S7cOgedhfizj/XO1LNHKrkypUbAfOmcQB1aq34u4lIPU7y6wdF3fQ?=
 =?us-ascii?Q?Cm9Uhg6Pjl7G2UTyeEZXj+ZCpTq4QJXY86gQniPgHgUTn65hzbWZOai2Rdn4?=
 =?us-ascii?Q?0M6t8ygHSsnSqSz+lYDN6OYeTYELQghxNnqbI3r800pa/Vx6BMS6mYr5jnjy?=
 =?us-ascii?Q?rWZzTIEbaUQQOsXn40/6kCRy1TLxOJOduyOByxl6ZN6IZnJLs2JZZV3NgscX?=
 =?us-ascii?Q?Fv3PhOLk1Pd28iY87p1+vxiYpiSx+sMTlJHqC3Ahi0BrlmBjaI6SMOKjuJCb?=
 =?us-ascii?Q?XBuhukMRNuscpqAYGBa1HAAkYG6w74Jm6BS+kPU9lyH9jfVujZSj85HHH85R?=
 =?us-ascii?Q?vBsfH1tfl6pUqxwRItoaWlQ5k4Kk0phRMpjWstUM6JP7Lrh9W1dQaNPR6Kqa?=
 =?us-ascii?Q?5BIJXm+FD8egL37OvMg6Z7oSl5FeHeHpoUmhkrzLxRUmOtYA2elbDku0PuEx?=
 =?us-ascii?Q?SBDX2ecoSm+hjaC8zcPU9Qw47FlnSp6CDqPevXHaFenFA9Kg+n21vuH1KvsM?=
 =?us-ascii?Q?pKJkEpHEPPuIxKioNjNsIn+X7ep/HJNEAkNavdOpnEAGFD5+J28LOujZk5yd?=
 =?us-ascii?Q?u1IManRqAGUQ6uKzyLhVw3l1ygFgStvsaztCQ6x3mNpvfL/xHp1Kp42ngY1U?=
 =?us-ascii?Q?FvMrkckIWiffoKiiCuY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:19.7915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 702fd230-62c7-451a-58c5-08de4891da27
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5220
X-Proofpoint-GUID: B2RaRCIYelTc2sMcBKMvps1nbVE_6qon
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=69555cfc cx=c_pps
 a=Syn3MuHMyA8lBdxmL2NqkQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wTkoOD7hNADaZ-IFlkEA:9
X-Proofpoint-ORIG-GUID: B2RaRCIYelTc2sMcBKMvps1nbVE_6qon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfXzF3wu0w12Hjc
 TGtuj4gh/oGOZD6AspWtlnBniNjH6pVoadUIiKE9VnHtuQa8JEIVpVhhRzd+/RRqnrywcV8dvxE
 uWgjhMAg1r8yDLyxy1TE3F791p8SbCU4jvMebBRhpZ+Rpz36hSPlfHgMCffOrjMb6PkIYktj17l
 Aru4ChQSYqSAiSBmF5/9OL8Kp8fC1h33W64LtJUkHFpMe7sbSF4YjP+W15egx6r+x6rfHIedd5a
 ATdWcassTU2fF0Btq8qvBTnWv1DRFu2uD+uFNRMiBIJ6s7z+L8O5yYxDfvGw/atO5c57XMUVvMv
 QrFHpQU9ON3arrFMl6PLZ4Kuxa4FoVaadh6BYj9yieuX+HKr/1X3WWVResnG4Wh53OnUVzhdRAJ
 85foO1whObDiH5yCilsCTjsK50VoLtanrpCl1dqTuEmy3zhZNqK7muhgDPkMcMmPDbIQOKU2c7g
 Jkg8WcnvZkDh1mTtdkw==
X-Proofpoint-Spam-Reason: safe

Version 3 of the WMDR file format introduces a new block type that has a
32-bit address offset.

The first patch of this series adds the support to the cs_dsp driver.

The rest of the series is adding KUnit tests for this.

Changes in V2:
- Fixed inconsistent commit title prefix on patch #8.

Richard Fitzgerald (8):
  firmware: cs_dsp: Handle long-offset data blocks
  firmware: cs_dsp: test_bin: Run test cases with v3 file format
  firmware: cs_dsp: test_bin: Make patch function a test parameter
  firmware: cs_dsp: mock_bin: Pass offset32 to
    cs_dsp_mock_bin_add_raw_block()
  firmware: cs_dsp: mock_bin: Add function to create long-offset patches
  firmware: cs_dsp: test: Increase size of XM and YM on Halo Core
  firmware: cs_dsp: test_bin: Run test cases on long-offset blocks
  firmware: cs_dsp: test_bin: Add tests for offsets > 0xffff

 drivers/firmware/cirrus/cs_dsp.c              |   19 +-
 .../firmware/cirrus/test/cs_dsp_mock_bin.c    |   38 +-
 .../cirrus/test/cs_dsp_mock_mem_maps.c        |    8 +-
 .../firmware/cirrus/test/cs_dsp_mock_regmap.c |   16 +-
 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 1017 +++++++++++------
 .../cirrus/test/cs_dsp_test_bin_error.c       |   14 +-
 .../linux/firmware/cirrus/cs_dsp_test_utils.h |    6 +-
 include/linux/firmware/cirrus/wmfw.h          |    7 +-
 8 files changed, 731 insertions(+), 394 deletions(-)

-- 
2.43.0

