Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B041A0BD0
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210018; cv=fail; b=eXrHVqhszz+JTbp9PCpp3y375FN8BKMEDxFQ7YyoaJDevBuYp8Qa1n6Mgqbp0bzfoYKLbbATy/AvNEQt/5sBpFCzBrjpCKa8a/ZuJTNy9ICFndI0hbD48ZAPNLpbvWcRRxSsonpMmlbY03r0F/vg72UevoVBbOKd0OCUrYYocVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210018; c=relaxed/simple;
	bh=DFr8AWkJfUh53JDI49i7SBqPWodAalqpUSfFzUMQA/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RWqEuoFa4oH5c7eQ4F39xk8Cyf1s0itneuOfNYPz4XYGECCd6W1iRmDtRTDKhDAWmPyVsBkvdQZZPUASdPDp2Gm/Hts0wuPOpE6KItEO/IjMcaRvvBEA5heRE1fIM+mEG8o9MwWWOVbnWwrOyc+nqSDf2HSgheXjAtYdyyMFF3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QPfOS4bm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=a5uZzKnx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QPfOS4bm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="a5uZzKnx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614AGW2j1329851;
	Wed, 4 Feb 2026 06:59:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=4amEdnkMPqECzBnB
	571qbPtwKin9Iq9qaSI4pxyft1Y=; b=QPfOS4bmvdT4EK8mEsb3L2gJsZ/deR8D
	6hB0U/rxWfe4gUfcb9DgEY49ahOdvjIIh7ydpzjXO/euQBMKJ0YQvE32zUHxzifC
	g+cDMPR7Q9TpUqjoDQyq5Tcw/vvm6Xj42/5FDBVh7Y4A6k2nFZxeQUyacwBY9mQj
	1AGDOatJmIGSTykgbI1VAAuw5IfSkkI2AZ/OT7/jYbZqKayvqpXX5H4g+NdlGgb1
	p/iDOxR1gXsQLK6CiH2/WjaLOFJq/tWXu4WRbYi1KM/ijiieFO6+oicRdXGZZV2X
	2p29JjiroJryZeG3yhUVpahp5b0I9Cim8lkDiSVowp5Pv3D+832R1g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020091.outbound.protection.outlook.com [52.101.56.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c1f1k4kqd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 06:59:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyurtbQerdcDuQlEesRoLW1bi1gre0iV4nni/Qdsul0nkXCNB+2QlFWzQ1VwSSZyjqtXMvwENXtRDIItS723jOfzsW1xHyapjRgkJ+cppiTql2R2gWg4gLaWeIEOhiXMPlOucc1+Ar0JKbGeyq00DDYTYIW06pZXGYij70CzkFGz+iHJMnnKQpHFCFlpWrGYR2kFIPt+0zQ6UnO88OQs88sYEDVn32MPesxGsa7rIChpkrrtwiUnzJsX32GXyyozYoYUsB0z8KfEGkWYWX0tf1mnHTTwHhnn0Ib61ng2wTRM6K4pVugnn8AKqWgw4O0i2kqsy8nvIXFX/ggjs5mivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4amEdnkMPqECzBnB571qbPtwKin9Iq9qaSI4pxyft1Y=;
 b=CjasWnLNq8kdUCJmPZJ693q3dATLE1R12QBhYM7Mu/ghcNY/k4aQnPK8QiERwCOfBLg7w9tEnNqK9M0NTnNhAyY3NA3R5nfZtOhByqhMd//ROEvBK2SFhon8RLPVgNRPQtzGp9IW2Yab8G98YCBoVRjD784ZAJbMKD3sFnZ6vYpD2N0+Mpe0/PnIwnLG6R1Ce+1O7Z3Ob+Js9DiujNNJXfqqw4/2GJUhyUal0lcUVX5njN8ZLW+anveQ9Sd2ZiuL14Ru+uObTT6NMFeQKO8EZ2/f2Q3PuCmYb2UPa9rCh1gOqjowHriWhOy/DHDmu/UC9yuny3JiL1DBrLKY0xrf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4amEdnkMPqECzBnB571qbPtwKin9Iq9qaSI4pxyft1Y=;
 b=a5uZzKnxweZDBz14JKUZfw21wpoSjzf0E480sx/PAF4QVgUOmu8B7eWdcC5FHhvhLKxOpmgVVlEwhFNnmzBVeTA2QltUnS1cPiQL5/ZI4g6a2SQ5gEt8Gnmt8sUi0e9FWDCEUykZCGyD/HlG5SwN4Kl0ySglyfKLjNAx3Ngtyjc=
Received: from DM6PR01CA0022.prod.exchangelabs.com (2603:10b6:5:296::27) by
 BY5PR19MB3922.namprd19.prod.outlook.com (2603:10b6:a03:228::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 12:59:50 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::c0) by DM6PR01CA0022.outlook.office365.com
 (2603:10b6:5:296::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Wed,
 4 Feb 2026 12:59:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 12:59:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 150E140654E;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E6ACB820249;
	Wed,  4 Feb 2026 12:59:47 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/6] Minor SDCA Fixes
Date: Wed,  4 Feb 2026 12:59:37 +0000
Message-ID: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|BY5PR19MB3922:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f5d78d5-ee8b-4574-fce3-08de63ed47b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?39cTvbP/CCDzm8iNXAnCh0XVHUU+JqAQzo5YIETsaqymDcaanAOvPfqejKYG?=
 =?us-ascii?Q?5XVmS7pn7wmbOawIqzprmq+97UgSGZTa7eq+KTzZjHqICqUV7dmLCsgqzjE4?=
 =?us-ascii?Q?Ps9Mm2kKvkqyxP3uuqCbcYoaIUeKOsCq3vWdrA8jNaEEEEL53cTFIG2t4ub+?=
 =?us-ascii?Q?jnrmxFc0KLF+BcXqSFkPCYxZB9HE0PYF52s2Lirt6zL+jSAABfsnm6djVRoC?=
 =?us-ascii?Q?B/u6n4OJ5ymr5H9xztVjmS6/z2RyOTUtK33b3ZaoWgJ1fJFkJto8TyxDrmk2?=
 =?us-ascii?Q?+nxq/EjYHiGkBttA1hPlkxJ2BJC/TxTapjNutBuL8q9+xWWbaBY4w0jIktfK?=
 =?us-ascii?Q?IGyLmuxgXLsiJzAVbtHDAcgNZIaDUtCmmEbP6CdQ6zqpksZPJsymrzhkowck?=
 =?us-ascii?Q?0zuEcKxTOASJjbRvyqXR7Ohfk8Y1yscxAExTxdOYEOpKCVmB3zOdzeBLQ5F0?=
 =?us-ascii?Q?Vd/y55F9tnSzLjcUKOeHSoXjmjSIHAVGCF8AR/uPW5pQCDnQm+CvtmhhxtXT?=
 =?us-ascii?Q?eqloiQD9UAVc1QZonusryfShzSpuWPhGu5Hq/lhgkNpQQSHj+Yb9Xm40ud99?=
 =?us-ascii?Q?ZMFprtzJdFHNogKAR+/uCZyRkZga/c29oRYQW+I7AfagR9EtMUaKG0/3zl/f?=
 =?us-ascii?Q?/UyRWBm3ejlj+p4G7Xe1sKv0Xa1Pg5/9SuHvvtss+yk/6CR/2lc9a0uiRlmW?=
 =?us-ascii?Q?vfZuLVdzZ+acBRqG2mQnHpXwbzX13wmEESdEac6qjgDCs06tcQ3z+mk55YEC?=
 =?us-ascii?Q?j1Ej39OIDJ+88Co+TUaxGqRvKvar9D39+U6DFXA60VyYGRJSgqVhV+3Tqlop?=
 =?us-ascii?Q?9v47yCwfbsBVLSVRT7mepjnUlOEVV6TovkUbd7ButFCKavNpdRfP+neYcJTo?=
 =?us-ascii?Q?4Of2nqhAnz4w120GIpbmMe8zGcaV9ITHFvi6gDjOsxAgZDR1Mxs1Hw8ldr+v?=
 =?us-ascii?Q?VSTuqKIOewSBmDnBsZYb4Lc0fRW4E+JcHnsBggaNcdv6nbKg2OdlWotW3GQt?=
 =?us-ascii?Q?Z7/1Ph6z6tgKI9BwyWxtL3OL6aGkQ0T2FUgqeXddw5u84JGN/Pf5L+V2YAYB?=
 =?us-ascii?Q?H6mF+71jTim/G2XOOhtY9mJmpeyIhd9g4VZAGTPD4noXYtzX3cUxev8DT3Wb?=
 =?us-ascii?Q?3uIZ2ntioJgkbLAxtRZkKSkCRwZ4Bm+ZMH329sCumsZJdPu4xCGiZXq2X6Ti?=
 =?us-ascii?Q?lR8aShEqZQQ2r163P1Xe/jotf85Z4Vo5A7yDPZPYix9TI9xDL9654hqcnzW1?=
 =?us-ascii?Q?dwYdSYa6PqTygXdqUmQksP05C/Gn3gSgj97+G5jPS1pwFV2Eg0DWPBMEv/7G?=
 =?us-ascii?Q?7QE6yjY3f36o0PqlTcSpofMwTt3M88xD9e2wUiA1aKWHscAMTLFn247YTJGu?=
 =?us-ascii?Q?YXABABT8EHaNnkogc18M4V4yIvGrJ25XGeuGBFUzS47oz0mBJLtpyVC2k8SZ?=
 =?us-ascii?Q?70jE5hSv4DdZRG9m7ViNirdocMZehPwwxmFP6zc1rZyzppD86MQZiny2UEh5?=
 =?us-ascii?Q?N+q58yFXyPG/m0/kb7QReuZ0oOv76oaypaoL6d7fbDDSw81fVxgtHgLffLkZ?=
 =?us-ascii?Q?l6kjnRZ8U95EPwJkCFD0zAT1oX8lmW7xoPBN5BBST3a76p4euH2lbZoIcLSl?=
 =?us-ascii?Q?Qfla7yoyDWKe7YEu4L74D7AQFkp/VVz8/tESiF/WoGgRcY4xcT/O1HDbZONK?=
 =?us-ascii?Q?29MX+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tq3QBeZIx/f7BobATb1Sdx1Du989y7fKiuyHsn5CK3C6689rNISrYt/3whKbc7iCf7DI3ZAXB6DhGilItM0fX5bQkxI7Gjo16o58IBjBBrJ8/bm2YV3Z4y82H1tzptWweH2SVZbL8SvoeLfUs4NBg+858ubjHJzR6s+E+hjag36W75jXzSRLt250NzyfuJowzrNt8FyD6XE+dcb4UddHEdtrRgb8K9GiJcWwXbAniVJimkfQNfKpuiWorTCnAkN+e+W59f5/WYMZJ4p6tGaW5t5+v5ajv4t3LPh/fh2jyi2LyqQFwAiMkQZ8okEGhx5BmQ2oD3tyrWpspuW/W1YkHZRTP6XGZPyix5UGW616BJgtXpz4l+cJuyZTKXTlyu/q6KSpm49gGv1yuGU8Sbomdha4BKSV3Y/qTm6kOfNHuABHm3EJkeURfIqoZCaeaZgL
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:59:49.2029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5d78d5-ee8b-4574-fce3-08de63ed47b5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3922
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=698342ca cx=c_pps
 a=DCeSEX+nBJmE/I7rcEuDsA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=aY3IsxZzZEmWk4elV8EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5OCBTYWx0ZWRfXyLKJcLT1pzgM
 B9iN5nJrUJajP/MvqXJ4c6sbdj38bh/4+UM6b2YtjrAIRXtkYe4/gljUOo7q/N36l1VdTHJgNQs
 kEXD39XHzJKJMfIVNNnouJMKQm4IDBN/cur0gbAKtmzWetv2gjPp37+FjCrUgBIx1sH5+EvXKxa
 JZJR2ShjNfl9zUhLLQwzrljkKTQ2+GvrB5Rfd69SQRn0m7K2SM64jFxIoBrjlbs4+cCutzN3SZI
 gF19EMXCV6dzKOwgkO+PcOUf8/n7FGrhuWiqbKMGCekqDqbhE6oLLMSlIF3dLJESCSXJfnE+FhA
 wCwflCufwYseaFyYxBabhcqkmnXUD9pQuj3CqzLZXMXsmEwB9pMcUWrHxpcKSjqn7iedFRgvpWU
 vTt5fybmVChaJ28qcjQxgjeEu1ZJgtERfRoPxB/gxikxNxtJo2M1ouLxvK9auqdVAOM5nkC/8b8
 XUNFWWYYlWB25iD2igQ==
X-Proofpoint-GUID: 23hEhnPMEuvcqdlwj-TNBOeLSHtaTthL
X-Proofpoint-ORIG-GUID: 23hEhnPMEuvcqdlwj-TNBOeLSHtaTthL
X-Proofpoint-Spam-Reason: safe

A bit of a mixed bag of minor misc fixes, improve handling
of volatile SDCA Controls, make some minor bug fixes to jack
detect, improve the cache syncing by adding some more defaults,
and improve some FDL error messages.

Thanks,
Charles

Charles Keepax (6):
  ASoC: SDCA: Remove outdated todo comment
  ASoC: SDCA: Handle volatile controls correctly
  ASoC: SDCA: Still process most of the jack detect if control is
    missing
  ASoC: SDCA: Rearrange FDL file messages
  ASoC: SDCA: Add regmap defaults for specification defined values
  ASoC: SDCA: Limit values user can write to Selected Mode

 include/sound/sdca_function.h   |  4 ++
 sound/soc/sdca/sdca_asoc.c      | 89 +++++++++++++++++++++++++++++++--
 sound/soc/sdca/sdca_fdl.c       |  6 ++-
 sound/soc/sdca/sdca_functions.c | 41 +++++++++++++--
 sound/soc/sdca/sdca_jack.c      | 52 ++++++++++---------
 sound/soc/sdca/sdca_regmap.c    | 14 ++++--
 6 files changed, 170 insertions(+), 36 deletions(-)

-- 
2.47.3

