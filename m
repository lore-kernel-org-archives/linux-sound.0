Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87A23D7E0
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970367; cv=fail; b=N2Mr58QVHXgSzBtx4+7SIqSRItomInFdYprbXv9teERGnCb3dzDtB4v4xmMFbVHXEkBeTEj1oP2WdPEtZjzEinehqlSDTLB2cAZ8wsyCcN0yEBKlGBcsOs4L/zHYf1FKmluR0iKG/FK5NDA/f4VSCK7sNIz4GPWBuZ7p9kPRcgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970367; c=relaxed/simple;
	bh=2r0iMKTkMNKPfEp6Df8Z6QwGMGh3kmj39LY1rLjCOms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Am8HWyMuRCq/F3w5vjDVPRF7X200ofQ0SsYYjaMhLt9htUp4VrwgkvzhDkUzPDyWvcFXQEHZFVoTQfXl2P99H+ByaM5019cwLxkOR9RqX0jQ+QQgStYYnlk/KUxQIHZD7Ocb55NQUACHR7oY9gdNlTa9bUZzVS3P8WZ2OrjwHz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lcqKr5b2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=M4OzsgOW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lcqKr5b2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="M4OzsgOW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095g9XL3769025;
	Fri, 9 Jan 2026 08:52:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=dMftybrcK/YJUrRE
	6RJ1ExyqFvAtucTStf8C8tDlCfg=; b=lcqKr5b2cb0qIEkbHdLqKRwxoibQTuvA
	XW+J8CWTAE2yFNGMGJmAmwnq8Cw2ahX6hDGX4OSHBwuYp1PlekiFo2UcHPECd2Ir
	ZwzrnkBkk7r4iobjKH9U3lNbsOsRVSwrCXCml5+y3AcYhX0JHXCGAjDJxigc4JAk
	Gud7ibgBejLaUPHTYLeesJOy2XGXc5FZGH99vlZ6gTmQFTGunLdlkEg7ZjafHM7M
	WY0hjdALV/1P8DW6fSQc80PVFEzMRGuFAgwG6ERaBtWVbftyQquN4Y92s03j2x58
	HY2oEHRaavXTkiDP8vWytuw7x1UEmuYJz8TMuechcF14S6+3WT3q0A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021076.outbound.protection.outlook.com [40.107.208.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bf0dnxvby-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 08:52:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZzKnVJXsF6qjvskaOoYEmBACINZ90yDitOxBb57psj7mj1qZLLjq/3NpJ1T4iCoL4ibqYCDth496gm1FH3bxDYF0wez4M0VyLC9S93mN+akdKCHlDnXpptNEGUteYzpNz5xIbHRFIh4TgJ6kkTEoanaKZbaYYu/aXKUB5c7vCOanvyF9aUJuWJhVUCribkfvV4tGgRk8TlBSsuF8Nu1DUaVh1JWwTywV0OtYbeyd3i23PrGxOgmd952hMQIbK4xdiz6YGKnb9iiDRayKYUfb/Dy+uqi7D7fDHnj/iqvczCmk4VT7naLBEsz6H7XhUp7ChHtY+uhSreK8laNaZIwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMftybrcK/YJUrRE6RJ1ExyqFvAtucTStf8C8tDlCfg=;
 b=Z48ETLThBFK6c0DNR7D+BDd6MpeJ2KfjKQYbahQmRtsiJBjsKo367CyrGdrnw5f/RHdabcQRwQ0MhKrBKm4PqEi+oaCOY3qPrVTDKUictOhlzvDKLORz7ccBXr8pJ5yQ8E/XLHDxtUzt8B9gqzq1IX+GUsDMv0cMwpnhqSU1/w/JwO6fnw4mbio62tXna+rVqiroN4LCTy0kSpIEhQpux2fJlKGiJb0wDbWbdmUzNOwMuKqCDafOrzAI8PBUuLNEGLqci0+S/CqGHy6opUBn+cfQwdCPzQmOxdbAKxKXh1ksLGJbXNSVn0hcfQoA2XbykITI7T3TD7RMee5XoWkpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMftybrcK/YJUrRE6RJ1ExyqFvAtucTStf8C8tDlCfg=;
 b=M4OzsgOW0oAuIdDoamicTSchMaXvBg1oLwlbTKDuHTSvV78UBCCyxWEKWkcNQ2CfAB4A4+EfJRwNDwznd5GLuTXSvMi9WLOSLLkURTrm5hzEYfVt5e4cXeL1ETRH2cgqUygqPc1Qlj9MdL4wdEWPMF+iwtNWW3TJaZiE+Ptp71A=
Received: from MN0P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::31)
 by CH9PR19MB9681.namprd19.prod.outlook.com (2603:10b6:610:2e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 14:52:11 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::91) by MN0P221CA0015.outlook.office365.com
 (2603:10b6:208:52a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 14:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 14:52:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 352F940654A;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 14E81820249;
	Fri,  9 Jan 2026 14:52:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 0/4] SDCA System Suspend Support
Date: Fri,  9 Jan 2026 14:52:02 +0000
Message-ID: <20260109145206.3456151-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|CH9PR19MB9681:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5a490a59-7020-468f-6597-08de4f8eab63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YOQKYKwZd1Zk3BF8yXgL8G6T9zsrllE8Gvldt8jfUOFmTJ4SjEtC8fhzyYan?=
 =?us-ascii?Q?CUfy0f378M+D1H9G021cnRJ6+ZorXEIY48Tf+t77pOLfYLi02kXIwdeD3hD1?=
 =?us-ascii?Q?JyRJUJROtchwzAyUXG2+5lFqkXAnmdDTLlpgTJqE2pjG5zmNJ9P53Au+/kr7?=
 =?us-ascii?Q?SryQ1Op7jPMkVgKF9pB0gJDc4J5jG08l82D1wxvXZFA5T2WeQJjIYf9l8wAq?=
 =?us-ascii?Q?Sv2FuC78p7tpqxfgW792dZOjjrJ0EFiIeg2MQGotxUQkT4W3kpZz39HCNtkB?=
 =?us-ascii?Q?IUuJP4d8hGvm3JrfDNni/3D+cTU48CSz/oxR//8k6BZUgORSyNEQ/nlxNLtf?=
 =?us-ascii?Q?TTBMMfENbo9ANHFUWyYpjLr0TKj+uuJkQiagH6ZZi6Y0Ao7WCdP2n2NuzQR+?=
 =?us-ascii?Q?KYaK/bI05GeswYbctXvHf22ZmY7unz0EUI8qQlMJq+qIPfi4tTysQQS23l2R?=
 =?us-ascii?Q?8ArJGH01Mnb4wd07HwfHZla/uD7wjhbtd8zCE9pwbzTXRyNcivFrFvUx31Ho?=
 =?us-ascii?Q?dNDeyR5pqnM/ADomcAgBd7ScPZOaR15CLrkNFM9cDx/2Bh4HAjsxotJOOldc?=
 =?us-ascii?Q?xS/Ft8MsvzOWTl5NAh1ANyOM28mpCp657LyYKb6+MvpowEkPrZAqTvxSL8ZL?=
 =?us-ascii?Q?2cWQokvaOQIdKMS1c0Ek0SDOoSr+jP7vrlz4G5dEp0Tw5FGj22J85+H32Y6W?=
 =?us-ascii?Q?aeSKZn/v/reo4EMNZUer49L+9JXE9947QZEk/2usWh4xir1xfs3LSjt4BS8a?=
 =?us-ascii?Q?IgELrNn1C7910UxoZcEN+nSQq7hnbpvc/+JeOnzc5HGWqRVqv5/ZFRgXrrcQ?=
 =?us-ascii?Q?IedNLu7Oo50suwyJmG5816oPkt0w1zRjQtk1LFcEa/dTFhZHTN0MgtJvgjwR?=
 =?us-ascii?Q?jbXAVkd2b5RxG1LVhoG9YGPIKv/BiXwm2wf51Kz9monXJzepTTpa1G1kCv34?=
 =?us-ascii?Q?2RcjzYrrSxZ20m4IxTsse0m4iG+oaV6MQG5BNaqnWGBVr/JdwejQcvNybSaB?=
 =?us-ascii?Q?5WSumt9CPzVakluKMVzMMNQpcpTtkNw5tW/AxcmZwLHkiLh4ys6rAYkNViBP?=
 =?us-ascii?Q?zZnRODwtgv1M6vyKRdmv+9AHmkg8rzpAmrmdsm2izIqwVS/oMkJaN+uyGPFO?=
 =?us-ascii?Q?5e+4y/tivrad1aASrgEM60XHWd1IKDENikdJby22kki9J1iVW2lS4OCuIH0M?=
 =?us-ascii?Q?jt3OnRyOsOJB1SpP+ZRYwRZ0gwiAAxkM9CMkIfwiA3YcN45aywnQ2SM+Figk?=
 =?us-ascii?Q?gDe2YAST2x3uUkJ6Zf2rKMcibYUmlApGLLVLxrYQOZxKZFG0SqWvepv9SFgr?=
 =?us-ascii?Q?qg6YbkvxyALVnbrUMeuAzO71uxmc++4h0KvYiqTYpOO3hfctAvRy03aAt0am?=
 =?us-ascii?Q?GP/UsHQk3EJMPmX05dvrZMsvzuJw8mozwPbQK1LgXdK49GCmiC4q3K6At0SZ?=
 =?us-ascii?Q?HAmfkBtuxCBriAu0fTamBjeF4k7oO60oB/PP1G8Z5D1Xj4J8sD19xmterRcZ?=
 =?us-ascii?Q?H9GhKGy8tCp3ymOTdx5hUDu8RTkbUQ/WWxFSucwAqd7YoywDhMvHb7cLQK1y?=
 =?us-ascii?Q?BbGzdls80lr5NDYR1M4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:52:11.0494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a490a59-7020-468f-6597-08de4f8eab63
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9681
X-Proofpoint-GUID: Co3Zlv7wrqNzGXjpIAtWli17088mIJQ8
X-Proofpoint-ORIG-GUID: Co3Zlv7wrqNzGXjpIAtWli17088mIJQ8
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=69611620 cx=c_pps
 a=Jf/U7KFl3YoH1y/TBsSIlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0DUNjG-pwzJfvNCNsE4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExMCBTYWx0ZWRfXysiIy0e5D+rV
 IqkgUOwMFJBjat6aydXxusBdMm5Lux8+K4r+xSoe0tixy9VYO4R+F+UVKzXUBHCnbMwY+URblW1
 YkVxXC3EKScndaHePEAdld6pigohfAHukpltfv49eNpuR0Y3X5aHlLYfgw52+VbVpGvNwvpiXCD
 hOouGj59MdDJhOmt7peP4uw3t0+1hdfsd96y/Dk6MmVlFwBQqsI9ve8HYlPeDzG9NecJ49RtwvJ
 INaMZnIGTh04emv4ARvf0TuzNPPtlfija4ISOLkEThHWJCx4xWaDKrHFWCCzMCio0L7vvyF4wkc
 6R6pIoAEs5HCY98ofeq/3yJiPi3Y2LRASL8WAm2bnlGIh5jmAU6UeMJmliuhp3HBWoVMhLrp6ZG
 0M5rVWMDxzbjGyViiGE25WF4bslHFswiaAqVqmzh3T/VKsVulfa6FmO/a0pP+Z4WFzJQ5iKfDyI
 GdgGKyEyoaexgOYvsQA==
X-Proofpoint-Spam-Reason: safe

Add support for system suspend into the class driver, now split
out into a separate patch chain.

Where we got to on the previous discussion, was we don't currently
have any parts requiring download on runtime resume, doing so
will add noticeable delay to the runtime resume, and we are not
blocking someone from adding support for firmware download on
runtime resume in the future. Also as runtime resume is really
a kernel concept and power rails are primarily controlled by
ACPI it is quite unlikely anyone will actually power down the
part on a runtime suspend anyway. So this version of the chain
still only downloads firmware on probe and system resume.

Thanks,
Charles

Changes since v2:
 - Update some error message capitalisation.
 - Update some kernel doc.
 - Add a runtime_get to ensure force resume runs the runtime resume.
 - Correct detection of system suspend in FDL IRQ.

Changes since v1:
 - Update SDCA IRQ enable/disable API to be more clear.

Charles Keepax (4):
  ASoC: SDCA: Add SDCA IRQ enable/disable helpers
  ASoC: SDCA: Add basic system suspend support
  ASoC: SDCA: Device boot into the system suspend process
  ASoC: SDCA: Add lock to serialise the Function initialisation

 include/sound/sdca_interrupts.h      |   7 ++
 sound/soc/sdca/sdca_class.c          |  34 ++++++++
 sound/soc/sdca/sdca_class.h          |   2 +
 sound/soc/sdca/sdca_class_function.c | 126 ++++++++++++++++++++++-----
 sound/soc/sdca/sdca_interrupts.c     |  93 ++++++++++++++++++--
 5 files changed, 236 insertions(+), 26 deletions(-)

-- 
2.47.3

