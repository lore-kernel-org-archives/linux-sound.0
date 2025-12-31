Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153282C1581;
	Wed, 31 Dec 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179811; cv=fail; b=XKNoPbK80LmKJHgelTrgffWM+ira2K+qnoUWIsvC9FZbtIPy0fwJwgG8XaVZf8DhznEBOnjDtJEQ8ftnSNc2GYzdQ0cUq4gbM1Zbia1wHh45kXRPAtAQniD9WOPpagX2vdiJudPXr00MUx1KQ1vlcRjnQzWTDsn4YhFbbU3veeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179811; c=relaxed/simple;
	bh=oupUcUWg7TzNfr23oekS1IWHVhaQ6nqhsfIMqp86M/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ieky9czKKgI6q7Nb6zp6+MbykOCvh2KERlSlgk/43L0CNG5vvVJwD07nVvbyZn1A7e8f79C04942HCG+DxG+2P8NLjVG8ZGay+uzGP28elG9Kqt2YLa0w047a8XEBPW2u7dcFaFOamD7NPTxkNTcVgsKMQNQYmSFnUFB3lA+q/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OxVaAPeQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Z9PBNPqC; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OxVaAPeQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Z9PBNPqC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV8NE2p3502298;
	Wed, 31 Dec 2025 04:50:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=MK4roPS1UF8mmUuS
	E//rgWBMq92PPl3ImgBrH6smAto=; b=OxVaAPeQkhGAinaKV32S9uF3A3dLcOWN
	V3uWIxrhD+os0rKP2i70cP6N26m7E0USI0b3ziViZfdr9/alZNo7vYFh0j1D60Zs
	XSykFOmjcuGHEKY9QfQJ6GEaUM/q3X/C8cjLPW0SFjVrTRM9BnvsRs6tvYO2adzJ
	0jBER4yfy4TPwLHO5swv3UA8YULanPimboAyTDcQ6+6sRrCzWwcOBtWIIpzFJoVV
	ZElIPRbsMA+lYT03a7GAE6c9Cw/W3VbSdxWZRrOZYrSzIOtYUbfXc6pauunFocZy
	0v+r1GIQ9zoQPxub0eTMPkPBYjqpB8u88Lzw9fq+oGJQc8jYPRD+Wg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020084.outbound.protection.outlook.com [52.101.61.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmv3yn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azVXlg38Tixi9uMU3CfhH06QzMpVrylDVew3DMexnulqw3pzW0QBPKoF4+eAEmZ39Ox6lLb+/4MK2bP5mYizt/gPMuaM26wGNk7tF73HFLf8B3iw3uzZBbeLsO9OziqfOOh0Js7m0U6tPOTFVw5ChDidtCDC3jE0dLQfs5/rV6SMbYvKoKiBd5Gw03D02o/aQF/ARSXtVq59qVe1mI8XN+ncMDw/1SgS7mfl4eMikx+XcPxValFg4q3SKRRYa4YcYouj8SjUsXrVy+3JgI4+vwLNc/PuhVJBY3CXTEmQTKAvFxOKGPss0M80oNMPBGSZDJ9MOvbL1HeJQbTEPK9SAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MK4roPS1UF8mmUuSE//rgWBMq92PPl3ImgBrH6smAto=;
 b=q21x/pH4omLfzZ/kG2jn+BESh0xCOyc+U7KPZGIWY42+nIi3qSOQ4qAHIC181G4LjYxvIWYJ67+6cE77+lkAgLJrX1Re8s5MT0KpGmr5pnIrdiQqOlSph/f4BWK54cYAPl1H5lPcyweeOZ1yz3B2xcz5H+LGApjfuU02WvlohU87v4txhcXPrXRy7RSK20qRuljbCnL9xoVSo5PB/IO77g1+oI9J1KxQY970W4uFj9KkHBEi9Hxcj8rE0RaT1elmi9H1FpRL490HsBV1m97ro+nlrdY8k6ZHcd0PM7Izh4AX55O4D+Ep9wHGT0hWHxpA5wvWIBoIHuftpouNMGmnXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK4roPS1UF8mmUuSE//rgWBMq92PPl3ImgBrH6smAto=;
 b=Z9PBNPqCyxFZ2DTF23uUj0eDKzyqjA1iungL5ZB6l9pmIxbVU0n/5olJlvWmgj2yN2C3mm1S9opuOYoxorNYsjVxfseZT5W0T/aFjif7qz1u6Wf5ub3wvI//ah+69FAaQKy1+IKyUtV3RdxGP0d/AMeSSUNNQqoM5BqDZ/V51/8=
Received: from CY8PR12CA0066.namprd12.prod.outlook.com (2603:10b6:930:4c::25)
 by EA3PR19MB9304.namprd19.prod.outlook.com (2603:10b6:303:2b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:50:05 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:4c:cafe::8) by CY8PR12CA0066.outlook.office365.com
 (2603:10b6:930:4c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 10:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D716D406541;
	Wed, 31 Dec 2025 10:50:02 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 866BD820249;
	Wed, 31 Dec 2025 10:50:02 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/8] firmware: cirrus: cs_dsp: Add long-offset WMDR blocks
Date: Wed, 31 Dec 2025 10:49:48 +0000
Message-ID: <20251231104956.449696-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|EA3PR19MB9304:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9cf5e139-5c2d-4a94-f48b-08de485a5afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s5rd9IaCqacdlfidCRaQIKh9jPLQaZS3Y6343utcMKC72r1pP5+v2mI+Bubv?=
 =?us-ascii?Q?oNLz8nLGF1pZxXJ+4CN9WTtGEyXcQlVqRGiO1qBOlEbLP5FSpoo0D4ihEXDW?=
 =?us-ascii?Q?3PR7bnGQL2FHx1IQ+LEECAljaTT02mpR3oGYBK2D3X4P3ZR2BqoiI0sSEa+D?=
 =?us-ascii?Q?TgdJaXPq8vph4WQxwwgGB5z+BO6aEpq7KjsJsNpBez9gUdxs7+llKtZsa+eF?=
 =?us-ascii?Q?0yx6LfNgXVZWZAUpyQ5mjwQ5eybt2S4murHUkFznuyyUCUuqC5Ronokd1RcY?=
 =?us-ascii?Q?MbXk6DYPLOAJ4rpCH9H8lScAAaIfLmuR9WCC/DR34ZygxRYpm77uAIDMph8T?=
 =?us-ascii?Q?YJsqoRawpPpcWxLE0lILrImdP3oOzpRxVg5k6hYfu0G2Kz8zz2Gd6W/EGilM?=
 =?us-ascii?Q?KcuWT3mCuKUk2FV+DkAwPV0rI5gmspM6hathqpcRRt65amzUB9MGmxX8mPoG?=
 =?us-ascii?Q?MtiJSge4+nLfVkrGEObYf9NmuBpWzfaCYO4JuGNoqis86/JzT+6B05+9wpY2?=
 =?us-ascii?Q?SxBDzHbghp/HHAiyYG1xrWKacxkeIWkccpelmTx+goTlcin1oPW/kI4rWjSy?=
 =?us-ascii?Q?Inlkn+Gt7oxSV6xyAJHJxWnGX6c9plp3TxRWFxWBB8M+zM72iKBWNCtibP73?=
 =?us-ascii?Q?OaGMAjTEbVr3QshWMsj3w8g8Rfamd3+7piVgMSxbh5mnTVVCrUIzcl4SMpUp?=
 =?us-ascii?Q?t8l8JB51BA6uHsng2ZlbCWYLGtlV6X5mRi8rfBh3GMZLpBNb3Nia4JPaHfFP?=
 =?us-ascii?Q?JCc/8Yyp8LBnAPEu/IAOCb14/xtvJziiqCJivgRmeJA4cadEC+yl7mIP9Oao?=
 =?us-ascii?Q?w/mfns9U6Mzvcb/GmK1FttrlCbPpkWR4tzn/ehW82qmccoMbjDtJabBYbsNq?=
 =?us-ascii?Q?ptAfR4fQ+VFqBJ1ZuP4Iu0xbdKO/q/pkeC6VExDc+Zh+BX5nqWO6VZ5V4F7D?=
 =?us-ascii?Q?MfIxZWlLB9Ves3vecVrA3kOkqtOMdzZqscAYxCto/f32Pxl/+6/QA5juvSM7?=
 =?us-ascii?Q?52Du+HOksS1nHPNnNL6m7iCUDikeDvJrS4TM33TBeaYgsC8r+aWN/2GaJnoq?=
 =?us-ascii?Q?CA32lyphn8BgMOfkI9i+sIc6KyiAPG8Zc/QwdR9lVZ+Hc0SFRiBAUIYNjc+k?=
 =?us-ascii?Q?k4I4EYqwne5SWEtDuoRpn6dqHpVRQvw54NBmh8OdHgzEp9pCycVTv4ifctq7?=
 =?us-ascii?Q?W8y97Gh6GbiEZggpKBop7GQDaLeItGPdCnwH94OX4kGNQxcnT8r0FvMgpj1z?=
 =?us-ascii?Q?5HkiK/Bcqvd8LEtOZS3BXyzvsoEZk5Te/sQ0Yh2GofpYVLNWLB6oB7NxmAur?=
 =?us-ascii?Q?d9eCY2fKj7Ml+2UQXGYy9DzKM3EUZ+BNeM0PLLkIgPNc4/IgpaTwHnQUAlkx?=
 =?us-ascii?Q?9x2Z78cwOiOzn6Yv3RGTHsYXpSC32sqkg6WpuPUJ+QgNhKRo7B6ukAC3NPit?=
 =?us-ascii?Q?jHMfajCFvYfBJpeEgKIC6AU2WAZPwWV8lC3+nvTDPfwovldyPlQuROGbWjpa?=
 =?us-ascii?Q?AgZYqob6CaKCJ0uUkWCNqqhasuaHqx3PNrcbbe7hb3LgD88BlFrN1OwGYBZH?=
 =?us-ascii?Q?KUXoFcivmrmFDjNZHjI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:04.1084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf5e139-5c2d-4a94-f48b-08de485a5afd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9304
X-Proofpoint-GUID: m9i6zQNiMrFPHdD0RsAYsAHG1ERM423q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfXxAuxIOjcM+L0
 7j0fgftyyKtMQTI4WImshjDa4kBujkVoMZ0UMZYg3hBCWFCgRSuM/18t9zNBouTqbuc9AEDqSDh
 +pRSc/r3kZ0seYLjUwjFAkqgwmATJNhDQLwOuAE1cSWEUutgoZo84vFGReZBzjEslL62HYUCbEk
 gGSqHjNx2LdVyBJoVObdiLEW9RK6qijCItKYrLtaqLui1c43xlUsapY1/vPgHUF4CDR6jNOXjXe
 rkkGk2W9iAiqrMo81hTjBef0cdHItB9I2vFQGgSq/zGpAlVyFTAMpjPbNmTX0WK1njoVn5piMpT
 +17uHjlSIVPeeI/fkr+7yRhGATcJF/EZ4h0QnrmK1RtZx76X7JQJtAAKzRxcU67Qbuwggmi7ZQs
 L85G75aWB6W1unxAKOiCOPqPBG490Xk04cYy2d4ldZeJfMB+07qUBdLpGp3ccMe132JlMPtiyxo
 vI5p/uYh469mvH8p+xQ==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=6954ffe0 cx=c_pps
 a=n/INy9n90Tzyn9GwErGIDg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=wTkoOD7hNADaZ-IFlkEA:9
X-Proofpoint-ORIG-GUID: m9i6zQNiMrFPHdD0RsAYsAHG1ERM423q
X-Proofpoint-Spam-Reason: safe

V3 of the WMDR file format introduces a new block type that has a 32-bit
address offset.

The first patch of this series adds the support to the cs_dsp driver.

The rest of the series is adding KUnit tests for this.

Richard Fitzgerald (8):
  firmware: cs_dsp: Handle long-offset data blocks
  firmware: cs_dsp: test_bin: Run test cases with v3 file format
  firmware: cs_dsp: test_bin: Make patch function a test parameter
  firmware: cs_dsp: mock_bin: Pass offset32 to
    cs_dsp_mock_bin_add_raw_block()
  firmware: cs_dsp: mock_bin: Add function to create long-offset patches
  firmware: cs_dsp: test: Increase size of XM and YM on Halo Core
  firmware: cs_dsp: test_bin: Run test cases on long-offset blocks
  firmware: cirrus: test_bin: Add tests for offsets > 0xffff

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

