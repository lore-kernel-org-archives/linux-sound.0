Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300AE31079B
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429489; cv=fail; b=HJsXRQ9ZbiHICh+kPtFChgn1BVfqcbDw8cTPnQ0chiuab2yDd45MjDg0ilYtXlL7x+sUpNeypS2rPSXRGUKQLGtjQbKq3Apur89ELisvhUFL57HlKrHLrEuqBIRECzU3UisOKkCnb+CE3VwAv/p9ELVjZVCtpKfOg2zG6661nYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429489; c=relaxed/simple;
	bh=bdoLXfNQ9q2+Qpc815hHwuTEv9Fegv+1yVTApJ9EnYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dRx4+XDjqFUtrRcc9PXs3Np2hzBIpXf0W/4l5jjnhFFIc7CSvGA9n8Ee+GyrigzJQSaHqlpzreUeF9izJbVLZGoH6V90wTT1GVHzWORgaP5lby8qW1zl9WaceKGLagwg3Yhy66ZoQMjyl1dEJ3mvzPSoUqJDP5IEO83NKh6D9Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=H5T6/+H2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WMeGwStX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="H5T6/+H2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WMeGwStX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A63tDsa019774;
	Thu, 6 Nov 2025 05:44:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=BCbQ7X58JhP2UCdA
	Mwfk5VyhC42ddkXlBd+rxKwEMeA=; b=H5T6/+H2y9F/PiQsfudZ56M0FtY9aFby
	zddG7v1AwQjT3/Jj8CiVNiEYIA+1ivu83voMKj7fxY/9pYzWJ9cED/k0NAGxKYmH
	Rs883qr2A+ADeKpt8TRO+MPncI8zdJRn8NYWuJ575kLa1aqPecW61ZHws0e8EiFw
	qM+BEwT4UUiZKar65esXbRFu+d9Qts6ruHyIBvFBW9XD9YKLnfOj4QJhdDo9g4YD
	VfBjvhsWzjBG/GenWatc4UlD2Ptzc/6GEBd2xSyAcVw14ZezCLixa0EwHhqSu4hC
	26fouGc+yVzyMeVMltxSaAmf7f0PCCwA8PHSNSGNjdcebcskmfr/eg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020085.outbound.protection.outlook.com [52.101.61.85])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx3b5j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:32 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3CnCmNKas2ev0LqfFF1WrvScJxc/YBCaGcduSSYPzxpWpExU2dFzcq05hNFown1VcKVGd/YtUWq+HxQBoLyw+/T+LIAgynbTXsByGa2GckvC7F0sC6TCvbSa7gbCrC8F/KUfvQTWIPImbo3NaB+hWdKwboYLJNrRvTeelIbr4Bk4NtxhFDO1hmZUGSpmWG7WznJYixcYQDjmX3oi5il1TffbQQ0lG7kD24CnlsR2vPVKs3k5zaC/QxYt71YUDaXyiP2GedMTutPvgcLNGwhONe4yfXSRk5HPHzDLJ90popBxJtkNVfdwft0lsoBoPsROAhHChQuw4W+VPDbf+WcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCbQ7X58JhP2UCdAMwfk5VyhC42ddkXlBd+rxKwEMeA=;
 b=dY5Cj4yhpX9s1ChhC5jNbhRWSEPC51JQnYNHgEA3QjPKH1hPU/st9I0cGiXIgSTyk+0XPlALfzG2bueQfQ3Rb0ds7zhFHTv8bP6E6Z1umdNsKn4j1UchYFC4CRJdtwI8h91mohDI/EAa6J4xqWccfpqqvAiPaLiR4D0jdGfckad3JYiTuanoWiAZ1gCMYLRI/5pwqMEgQ0Pr5hhxeHjn4ByplJQe9cZPVkVZaKhdDXri6njoZqAL6Ec695RmS2IktgztfexruLsMzCZA5QPR9s2nHDiw9sY8Jwm9VZLlRFqhq4hkNlwIDp9oOl+57mxINATwJt3Ks6UftsKgqPWcQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCbQ7X58JhP2UCdAMwfk5VyhC42ddkXlBd+rxKwEMeA=;
 b=WMeGwStX6qdGBtA0PL7/Z2z7klJEBQl5Y6JLkK9M9rez6tLFZxoyh7yorVJgm1Jwo+8xxgVVwAZ+WCdYo/olBWbhYGA960ohM7eUoCWXP5uZd8Q6V8YXM3otSGFgIOy0976PG9OrUobvUSMk6bimZ0Xpy4HqYJDyLzogZiJK3nc=
Received: from CH2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:610:20::18)
 by IA0PPF94AC58BD3.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cb9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:44:28 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::27) by CH2PR07CA0005.outlook.office365.com
 (2603:10b6:610:20::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CA35D406543;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A93BD820257;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 00/13] Add SDCA class driver
Date: Thu,  6 Nov 2025 11:44:09 +0000
Message-ID: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|IA0PPF94AC58BD3:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b4ea60b5-ade8-4f38-6650-08de1d29d704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3fqUirm42/Xtgl8fDx852XgnMDwhqY+PpL3yd33cqGpnDW9hgsUTTomZFS/Z?=
 =?us-ascii?Q?EIa4y0JSWWuIvctRhkgg7ULu3T7qBn4n0KpVQiiZcOTl7yJCOsZ8UgPZSzoJ?=
 =?us-ascii?Q?nanawBdYMq7d6MhSeiYn6PhbI1YOCDena6/aAjEVQ+ZsLcUq2Sfc/PvGnAwP?=
 =?us-ascii?Q?Ygx+e2db1YkfayxjnjRzS9Pzs5Qp6ycUc6t+6PjhMZzuTgBP8IzRD3WRk4rT?=
 =?us-ascii?Q?UfnfAwcLZEepqqrlwGgQsMadgCv6S/ftMSJl7jD5oE6t/8zTu4C7Xj7Dqw0K?=
 =?us-ascii?Q?mg+bpHVHypZp7LmYgmFwHtfmuiFy7uKZgYL6ymGoa6W2PVfjmBgjNxTuBiXo?=
 =?us-ascii?Q?qyJYsvXPnMtGL7nxWMLljyP/2+R2c3vUzV6tzQEp1qIR+5kJ0e46TU/0/vx1?=
 =?us-ascii?Q?ULGyf9CijtnYEDg8ro19Ez/bTriw3O6Js9mj0ZY3gAuwcSXLqzP1Cm6Xg0nv?=
 =?us-ascii?Q?GjiWWDur2WmHgp3yZkpufomIpIkl4swEaYmFoRGsd0VaRsxuYLvvToBkINdJ?=
 =?us-ascii?Q?InFU/xS/xb0p27JnD/YXgdrm4SLW+1q3KlPJiNoSkRxtQPpWtomqajPa3VF/?=
 =?us-ascii?Q?MH/HGKSvNKUh2kAzJBUAtvbLOVLR+5R5akA0P4IKETu7CcYNScAvhHNZSZvH?=
 =?us-ascii?Q?V9sAq96ptWw7UnvBlIPIASBdB9CK8tC7wFKfAeOWSqPVxqDUNzPrnXtRtpKk?=
 =?us-ascii?Q?HKvHBRzLS1/7U/qZaY549G6orh2jo1AiZvTTu1O5V6547Jlt7hR4tzTr6Abp?=
 =?us-ascii?Q?6yH6OZFwejcRPVui2qcVA6WII90JG52m+WaY22P0vR8ZfAmrp+HimM+Jb1KQ?=
 =?us-ascii?Q?nBcaj9gUSwH6EXjoVtergXJ2yvZ59ATQokiCx09djpUJq45NRgu1gNqTGhpv?=
 =?us-ascii?Q?lYj4SRVCGhje9r1yFQLP58+FdSMBuIE8DTMEQgXtP3SOXFvwTiQamGB0kH15?=
 =?us-ascii?Q?LwxaZ6SlemdeqIqwR/QMJpAoSry38vZcWebEnQx2fQsrERVFylwCQdETjqro?=
 =?us-ascii?Q?AXOreuwgAiuUoz8AA55SQfxif8o0+3lfILypr+cTZaxH8Sw/eWRa3Q8taZf1?=
 =?us-ascii?Q?/YBmdCeFlEKQpb8OP4lgcWUqE3EWX07X6HPa/tyY9T94epWsFbDF9Col9rV3?=
 =?us-ascii?Q?UMWReytNWqAG7biPO1NM3BfSUehCOzkvMh0JUSihrYJyYx2NqcguTppDaFoS?=
 =?us-ascii?Q?DiV5kpPxoh1cG/fj6ojh8VpUTxCebaTGHfj0OaOM0ebupHZ44f7zIP5fc+b8?=
 =?us-ascii?Q?+TWDIz87XCd2zIbqFQW0PEkr4F+Gf9CQYlWEI8Ufd3fGeomfaB51ZXI+c/ye?=
 =?us-ascii?Q?MWP3vgN7QPi3+UWBSx7wIU6fWY0InUzrbJQj3S3vLbuLGerB6rWiUfM57EAr?=
 =?us-ascii?Q?rwZGaeB8vRFuk/jG+n8jT7TgPenmpvWpYy29wn7riwKRGZRG12Wtx31EFgeA?=
 =?us-ascii?Q?Wtleh5D3h1mhQmt4xFglc3pccrt92ZnGPxsA8gx/TSnXRPl/i4+IG/S0M+MG?=
 =?us-ascii?Q?Jb2Mqq7ujjv3T928mVT605M4vjAO8WBexNT4rSvjnhAROZ7EhzEv3k5zRmqY?=
 =?us-ascii?Q?dl4qa1oPP48xaTlyClA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:26.9061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ea60b5-ade8-4f38-6650-08de1d29d704
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF94AC58BD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX7lOcLgltGR50
 GDSmkFf9s2Q6Z+Ilra8fHfIbQ9tBpamOa9uRqwiorzBlYRjZnve/N0lchhdCydJ1qKqZGxg0RNi
 shXf94J5etpH9MEpDfnIxABmhnHEd10Yz954deo03NJLRyClbNTLuc/IHjBTlAMfLe8Hu0Khvv2
 X40cwqQbNaF0yL3asAJrWiMMkJwc/zXUw3q9jWcJY/nRIVz8qkiu7rXLBHQhCYYhQywNi8CkrNB
 SnLWSWVMGW9LhjL5kkbm6uhERh44JJS0+e/7P9cCNZqVQMDzhjs8u7ix7jUFcbauVr2RN4eB+vC
 Z8mmwofXrdtiwo/B3DXWioy43U7kbqrGURzAlLI+/W1H4Jal4apA2y7M5aSZPK8qeki3CHnVI+8
 rEfu+kaVG1FGHjKOg6ujsBAxMWAvmw==
X-Proofpoint-ORIG-GUID: XNnxv0FtKg-AwY8n92eStGCKDySnmkoA
X-Proofpoint-GUID: XNnxv0FtKg-AwY8n92eStGCKDySnmkoA
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690c8a20 cx=c_pps
 a=CX+cjZXKan4d/jn2X7CWJw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0VqtTrD6c825z-Y2eb8A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

This series adds an initial SDCA class driver, this consists of a
primary driver attached to the SoundWire device, and auxiliary drivers
representing each of the functions of the SDCA device. These drivers all
use the APIs added over the past series's to provide the class
functionality, as such these final drivers themselves are quite thin.

Also a few fix ups at the start of the series that have gathered up
whilst the last SDCA series was in review.

Thanks,
Charles

Changes since v2:
 - Updated the locking in sdca_fdl_process
 - Correct some spelling in comments
 - Renamed suspend/resume functions to be a little short

Changes since v1:
 - Add a bunch of bug fix patches
 - Change some prints to dbgs
 - Add some additional comments
 - Flip order on regcache operations in resume


Charles Keepax (12):
  ASoC: SDCA: Remove duplicated module macros
  ASoC: SDCA: Fix missing dash in HIDE DisCo property
  ASoC: SDCA: Add missing forward declaration in header
  ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
  ASoC: SDCA: Add comment for function reset polling
  ASoC: SDCA: Move most of the messages from info to debug
  ASoC: SDCA: Use helper macros for control identification
  ASoC: SDCA: Factor out helper to process Control defaults
  ASoC: SDCA: Populate regmap cache for readable Controls
  ASoC: SDCA: Add helper to write initialization writes
  ASoC: SDCA: Add basic SDCA class driver
  ASoC: SDCA: Add basic SDCA function driver

Pierre-Louis Bossart (1):
  ASoC: SDCA: add function devices

 include/linux/soundwire/sdw_registers.h |   2 +
 include/sound/sdca.h                    |  14 +
 include/sound/sdca_regmap.h             |   2 +
 sound/soc/sdca/Kconfig                  |  18 +
 sound/soc/sdca/Makefile                 |  10 +-
 sound/soc/sdca/sdca_class.c             | 304 ++++++++++++++++
 sound/soc/sdca/sdca_class.h             |  37 ++
 sound/soc/sdca/sdca_class_function.c    | 460 ++++++++++++++++++++++++
 sound/soc/sdca/sdca_fdl.c               |   8 +-
 sound/soc/sdca/sdca_function_device.c   | 117 ++++++
 sound/soc/sdca/sdca_function_device.h   |  15 +
 sound/soc/sdca/sdca_functions.c         |  52 ++-
 sound/soc/sdca/sdca_hid.c               |   3 -
 sound/soc/sdca/sdca_interrupts.c        |  39 +-
 sound/soc/sdca/sdca_regmap.c            |  89 +++--
 15 files changed, 1089 insertions(+), 81 deletions(-)
 create mode 100644 sound/soc/sdca/sdca_class.c
 create mode 100644 sound/soc/sdca/sdca_class.h
 create mode 100644 sound/soc/sdca/sdca_class_function.c
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h

-- 
2.47.3

