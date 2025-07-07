Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB772620E7
	for <linux-sound@vger.kernel.org>; Mon,  7 Jul 2025 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892194; cv=fail; b=BF1HIEbmZFeShImvTkGwZV6lDJ04rbnjVfifOpm0H2nAkdZKk8pzVH1gYiWc96uryAdEB1WkauzKi6UhkZldNB2b2yTQOba7cdWooj59TgiTwOkpK3ZKBkFOOdcuebrIWtC+PuWwNQ8mQQ1IXSwGjSN82t8GuXlRbNftsKdzBRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892194; c=relaxed/simple;
	bh=0Vq7ii75sgtahjS+AyWOneG1tyqbCuiIeN1Gb67dMyA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RZ7N6N03aNKG1hElUGQTMf1BFHQdVn18kdqaWxyyriB1rjz6RGxGiOc67/p307ky3rGBjfSsLscQCoaWgLOasTyguaZC20FxyFUqUwnfZ9ARm+Ji5gR5A5sSZBudducZd58v4s93zIZphE4Fh/NjO7mDWx36S6ukV+ZKgbTqNqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=J+PqW3Hg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vLCfW5l6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="J+PqW3Hg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vLCfW5l6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567707w2015160;
	Mon, 7 Jul 2025 07:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=NXZ5Ts9NymYOa8Us
	bbtWWeozNbP02j72dfhFJPnVnGY=; b=J+PqW3HgXLQB6xneozs8LEUdQECxG75Q
	Mth9hzfsj44e2XeN/BLvKUrQo2h63mesw2oV1Ic1bH+gt5CZmOPP/MrY6tq2T14g
	eE38Gux+04IQVlBc7/8nSfDv7oYf/BdAR8OJQflCx1aEpWdDZnSxbM7V2LPnIkkT
	2kzNEX3W9Pn4ImF0awcEXLh8ChTI10WKgZZOgIXJfTui7kreJicouxc9vt3ytgd0
	Wyd3VgHGR80oQjXFPqx/ntJvPjDzL+sUnC258dN3PW9zWrnJWkPyETGeuxFFOCTX
	O/Oc7/Yi1Ac2/yRqdb7nn9D8WV2BqDVPUbme1P1IMoUAlcGleMgXSg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2126.outbound.protection.outlook.com [40.107.93.126])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47q1f3j6u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:42:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvFljriaIH9uWnqnpLPUuenx9kE/pBfxM6KIkg6epeG7nhlNmF4p5VlkztJIDu/z3JvEFzgD/KW+TuuY8PbrzFK+7HFHdJxzOnyi+ccEAMw9wM+w6srZkjIBoSlLi6wDuiScOyGvj6/RhE8Yoas3gjVu/80uae0lADs5a465CM95k2NimtYbIyDSATSfm+fnma86hA8xLOabCvMRg/T8G9L2xgwdmPYcv16hyA5y3InsuJ6xfEjz0XsrfMO5teXQWmOir3g3xpCAMcx4aFZ5HxxcEBGFuhzMCUUkbpoVvLR5rOVUYDVyzGTaoHVqswkTqH/43AyVaKxCZ3iSOjhO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXZ5Ts9NymYOa8UsbbtWWeozNbP02j72dfhFJPnVnGY=;
 b=jVrs2AHgAAgOJQpl+W+mxv0wqT3GNuOSohPhwFVmOPmVRRoTOe9I7ctowcvXXQfPG1kxROfHYm7VxPg1Hgss5nWKfd1YAm2R7zLd6Z1HLmR/l69zfRbBBlzoMX2eLAQJKjdo9y7KEVax3EEYQZpmZ1U2FEkQwgjaP9i+Qb5O90hYcz3/mx/ivX/0Qv75E188sSaSFYxErGHn0zGuFwDXUqTbSQQjqNqxa1RcVlpY4AMjyUkxKBHeXAENHmkIKeLOQVScQBDp5ZqDYV8vJg/6nojj8nZzoQWa3r5ndIbtuDkCPig5aHC+jn4avSXY0gXeuqByeD+vpSsVDhOu3ZD6yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXZ5Ts9NymYOa8UsbbtWWeozNbP02j72dfhFJPnVnGY=;
 b=vLCfW5l6sjYXZSOSrqVG3Bk4vIHEphw2fy99NaVGzbRW7p/1ZTQN/NWjbVqtahVebIOuaFxepnby+1+X9e/Usq4sFnVVrZGbTEWyuK5I8uFhALm3E7nfAScO8jTCdvJAMLToHyKp3VjvR8fYD6fxfc8zIJEgcGPsYcm8Z0DSqN0=
Received: from BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32) by
 DS4PPFB7AA1E5E6.namprd19.prod.outlook.com (2603:10b6:f:fc00::a4a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Mon, 7 Jul
 2025 12:42:03 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::a7) by BYAPR01CA0055.outlook.office365.com
 (2603:10b6:a03:94::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 12:42:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 7 Jul 2025 12:42:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7EAA2406541;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6403C82024B;
	Mon,  7 Jul 2025 12:41:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH 0/7] Add SDCA DAI ops helpers
Date: Mon,  7 Jul 2025 13:41:48 +0100
Message-Id: <20250707124155.2596744-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|DS4PPFB7AA1E5E6:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b7f6f0a2-81a2-4491-afc1-08ddbd53abb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tiUdKnbWfsINjjU9BfXgAuNjKkzk57pp5rhsT2Dp4dE9s1h9kSKDd0Q8V+Lf?=
 =?us-ascii?Q?e5h6pDccvMVX4NMSj0AS4la4Z7RHAHxXP2Nkwv29yzvZqzSex7h9acCbwFaJ?=
 =?us-ascii?Q?DgogxRj4Ccq9XBiiXAlHFoAxYqy0IUnJpxdMlh6PzDig8rtnGepww0at1k1F?=
 =?us-ascii?Q?zIJGgEP7RotSjIz5svxiu0SWivjZV2pvAyY/sjOkr9lCQU10UnC1SxnG3fhn?=
 =?us-ascii?Q?5u5LZFjbZiyir7Ex0UAChoBeF4O/0RWA0AR9iDASCtOXwjNTGMKy5egT0J11?=
 =?us-ascii?Q?VEAuoF1MutMAwUATynKD7FS3vrpLQX5qAXDHmgnApSKVwJiLjPwpme0Pmabf?=
 =?us-ascii?Q?C79W+G11qiSCYaZ08gVnmDD23kLHtrr08RZyVEgbI5Xb2qfEUMRxK4XnVok4?=
 =?us-ascii?Q?cK3EORfBsyvaTWF269opkzZ3pLqhPoGF933BwSOuYBKb0CoRu1ggwFpmNxEf?=
 =?us-ascii?Q?2fUUIkYIeUAcP1KE9O+HJRKvwSPd3cnsbXrYqrat87gN8XhOH5/FCseBuH7k?=
 =?us-ascii?Q?m4RE7yBHJvGiYFdA4jW+en1OtaDy+/EwLpWfdS52hW0YLTw/05wv4or8Ef/g?=
 =?us-ascii?Q?9sc+10sNfCcuMDwYWrCCc4bQfgU6MXS24iBw064skwxPvkD3Y4iRBxA1+0xi?=
 =?us-ascii?Q?JTlfCj4H9k8Xp0dyt3xBrPQynHLVHDFZHHpJAeEGkeGqkWLhihBr29RCdRDl?=
 =?us-ascii?Q?H/06XF29rDQFDtCIwfQnGUEOsdsT9zVxfQnd9BISf1p6VpKDiYSVLMCDt1Nx?=
 =?us-ascii?Q?iB+n40LuhRo9lKHMaau5bajdE5Wntg4SgFjKmZ/Y1T6jp9gZyMpmOQFf4Nf6?=
 =?us-ascii?Q?U9N861D9Ob2RT/o8aYFwfhOY27Xpn8R58kTRb6Gh0vv9QDEWkvKqrh4zxxC8?=
 =?us-ascii?Q?dWryS/Ysj6KBa4SecH8UuhwwuVmU7j2nmSEsRa8SWJc/BBLsz8ot7Rbb5WcE?=
 =?us-ascii?Q?jYXbQwaXFix8XtwumaxOj62RcNfJF7l3k2/ySf3RxT5oj6bwOH2P56zpSl4K?=
 =?us-ascii?Q?ZOnwT2bmx3OB1OAODTeydollPqtQ4GzKwny715nvp4kuNBdCUBi4d5vzHdcl?=
 =?us-ascii?Q?M2TDjSWBgkS+aVQLeLcigvb7fbF5BsV1gNEhA7ZjvttI2kCEodyLCatPnORK?=
 =?us-ascii?Q?/0RPkwV+JRcDF2yKy+qtQJ1q7ka/1hAl+I6x8/ch1RRafc0T/HMO0ZL6QpDw?=
 =?us-ascii?Q?d/2M7nwbX2cnOiyLXgjHMBJG7zHQndetTs/WqDeaMM5Rb2NZAnUvHMSUVp64?=
 =?us-ascii?Q?KFIKoLVrYaDZxfhYLldV7ahIMsD4QemwncHZxLpoadMJbmprLQkjO0f/2gaW?=
 =?us-ascii?Q?RAAO6g5Zxvmh5l+/sJCMDthnAuvsBtXP/v2UVD2RCYGfEPHkcS8vv0FwMmMA?=
 =?us-ascii?Q?WUWQvvU0o1Pj8pBq/J1hAQVhrZT1gLs38+R2SeIadpnjARPlefAlUNz/SK5g?=
 =?us-ascii?Q?Jxb8JEAHZcHTRFXTr8PwCbhZhg+gPXK/1386ITILfXUXC7A9OCH3oUlVd5z7?=
 =?us-ascii?Q?t0w/7wqrG4Oaqjm/fphi77LsBVAOGHBKj4Kn?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:42:01.3806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f6f0a2-81a2-4491-afc1-08ddbd53abb4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFB7AA1E5E6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfX1nrTR95yOjwH Nj0IaEZ33h2TMpTF9fZE1IYxKy3QmAW49RvWk8cGaSwTVOu0AyObFYGGKGcDGcO4YvHEl1FVttf UFnwoWmK4IKjQ04Uv3FlWL3aLzrFqhpZt86Qcj6SGSAuNzWTGPUh/loD7rYMnsz/mOFU/lKe3V0
 ppzohR7NLcoH1aAYjUKvTHtgZdX+lNk46E+jT5qEJt45fQxrdzXyLYF02wnxMqdKuKLx2SiBLAs L0S7qZCuVhCJIgkKCMBfFGYfbBUgvUC1AqCg7Xd5ENOGnixFRID1MsdcGe1uYRkJGhZ1Bzvz8lf uJsI3ClNz13JnzB3V0vulmNgjcmuNSYzoHblPg1ZbHCyVxhPLk8Iz70U8hLGKOvX13RPNjtgtsG
 rBoVKQZLzY9EpV+hLaVOMiPL5cLQpKZEuck5WCBeA7xt4xxvNcWtdVu3rBMhsrFcH92uaqx4
X-Proofpoint-GUID: XWrwOKmSVZS_6TnXjCiavlI5wunIiMAy
X-Proofpoint-ORIG-GUID: XWrwOKmSVZS_6TnXjCiavlI5wunIiMAy
X-Authority-Analysis: v=2.4 cv=YNafyQGx c=1 sm=1 tr=0 ts=686bc09d cx=c_pps a=dxS29g6ekbaI5K5MEW66qQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=P2BvfiwTNq32rdUKPEQA:9
X-Proofpoint-Spam-Reason: safe

First, a couple of minor code fixups to already submitted code. Then
some patches to add new DAI ops helpers for the SDCA stuff, these allow
configuring things like the sample rate and finding out which SoundWire
port should be used for a specific SDCA streaming input/output terminal.
Still a few bits of outstanding work here (propogation of Cluster
information particularly) but his should be good enough to get some
basic use-cases working.

Hopefully we are getting fairly close to completing a first version of
the SDCA work now. Should be one more series to add FDL (firmware
downloading), then we should be able to send a first version of the
actual SDCA class driver itself.

Thanks,
Charles

Charles Keepax (7):
  ASoC: SDCA: Allow read-only controls to be deferrable
  ASoC: SDCA: Remove overly chatty input pin list warning
  ASoC: SDCA: Move SDCA search functions and export
  ASoC: soc-dai: Add private data to snd_soc_dai
  ASoC: SDCA: Add helper to add DAI constraints
  ASoC: SDCA: Add a helper to get the SoundWire port number
  ASoC: SDCA: Add hw_params() helper function

 include/sound/sdca_asoc.h       |  19 ++
 include/sound/sdca_function.h   |  31 +++
 include/sound/soc-dai.h         |   3 +
 sound/soc/sdca/sdca_asoc.c      | 427 +++++++++++++++++++++++++++-----
 sound/soc/sdca/sdca_functions.c |  72 +++++-
 5 files changed, 490 insertions(+), 62 deletions(-)

-- 
2.39.5

