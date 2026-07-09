Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591E40BCB6;
	Thu,  9 Jul 2026 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599167; cv=fail; b=JlWNFjepqjQUvBG/HHUz5X9ynFrF+nzRNwq8sPF+O64xgGxWB6BZ3OCeARl9tkUzZxQi+UjDrUzfVEAqWXbJq8bxQ1YBEyKK6vnsO9EdaWYxMwni00vlWdcuspf98HFU/hOWQe4Nl1+lA3/38viJM5PFivhaXCKTcIOkLVrWWT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599167; c=relaxed/simple;
	bh=KpaVjIAWd9E5Uj2Wkc3EGp3JfKErKuuTixFwXrZiP84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gjGH9vp7lBKvhtDpKZ3hWg2MDOMZ60RH8eNzqCwA13lGDisWExHm2wvPxaMFM+xLndMc7mub/pTQ8/vOR5z6DyTVCIlag4+M8Xnqzh2yrFqM99sTBJV0N5OM1pOqhPU+1tuWCSqYsQetMSXFcZ+Z7D66FoFZMhdbs6xETPdgBEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZKxanFLF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XW95R4zO; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZKxanFLF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XW95R4zO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696ktVZ078939;
	Thu, 9 Jul 2026 07:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=TMB1jFNOoQvAmbCV
	gcD4LoF9iLPUM4onXEoPvPkrpbg=; b=ZKxanFLFHVxU8X0YvoR+JJ9N/gdVZ7oW
	A2mYA7sX4js6C008EShJwn3ANRECfz17sstACi1eazP/+Iji7jxPg9hTk+cJnnBy
	8oK2K1iwYwhkiJW7oScTnPAgcEp+VCajbEyUYeXVhzDqLRpRw7bKrbJCaKLZU5zA
	4CcshJGNt464piHWmATByO1I+o6LpwvIsRd7ER6ubD95w3UqT4qtpuzg6ztDd6II
	5op3Dd1tQjUlOroF5orA22sAvBYdMGkdbUGWb3brNTv5sAD7QH/3Aq8YRdGOy4wq
	pAYReiUA1mOryWuQ15lTagkVwzv8CV7dhwtAXqS7EogVqHPq5JZTlg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021124.outbound.protection.outlook.com [52.101.62.124])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjr5w3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 07:12:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ydoyb7mhQv+8cSYKaFgjEuB6I12vhuJFfqvS01DCzsa+6xyeqDKvYnDYxClUoiT33D+0HACyKoenT/zJRBl+L/VKyz/XlR8OrQNVqb1LVlKgNM2dl4nNv9AxuHp/9VWHlVBqEb8IPM2FezPoW73m/ofcyg3+GdwIHbJhilaulLOE6aOuxftSV7UIG3kHZwMp/fKYDBUFF1e1YzfRMMeXwoCEZ7mljJzRtJoIN0qIlMCIF2N4qZwFUHF+OIk+d+bU0tM8Qou4jvotE36pul29v7cO0KK8B+JoBiqhxSkAqcOl+/3XwFf9SGQQ7Ymmho4PLKdATP1uK126Gad/tMR7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMB1jFNOoQvAmbCVgcD4LoF9iLPUM4onXEoPvPkrpbg=;
 b=SziRnE2rXH7A5HIR9+1g8W2no/w61rrGz75HtOhvRsti3mnll7hG++58WkBjY0NoQsJWhIfe5bwrBz+uX/uXcIp3sm2ODQYoISlEFzEZgnjY9TgYa0wi6IRalQ6e80cwLacwrC0TP/oQbnRPjgm6OF9VpsKrbtF2Oh+SbaTtcnuIFFqayDfwo/jlpzLrD4XrrDsP8TIz5B0Q0SSXLCSU6S2hL8h5utS2fyPNaEuaY4wtaJ37BLKHX6uL9W1dl4LwLdjFFxDdbAKHAOOCP8IBHD+Yo2rpl3q7DY8evDxxSeXrOZbPtL0Yss18a9yCIvtaNglkGtHhPA58Eg5YhVYMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMB1jFNOoQvAmbCVgcD4LoF9iLPUM4onXEoPvPkrpbg=;
 b=XW95R4zOeR1MjX0I+zhfF7RhYd2p+B0CnyixvxJ5NhIlvR8u460bXZfolJhqp1fdqPi0GvDdVuKeGxePJttMITmJS/iYS6LE9yTG04Ufsb8vNtEvK99tUicHGJcv+QlYS3xmv2hp7RNA6lBuOavbM4gQXKdvA2D5p5SqDxOjXAo=
Received: from SJ2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:a03:505::21)
 by SN4PR19MB997529.namprd19.prod.outlook.com (2603:10b6:806:504::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Thu, 9 Jul
 2026 12:12:35 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::73) by SJ2PR07CA0019.outlook.office365.com
 (2603:10b6:a03:505::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 12:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Thu, 9 Jul 2026 12:12:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0E1B2406541;
	Thu,  9 Jul 2026 12:12:32 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F3B3382025A;
	Thu,  9 Jul 2026 12:12:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda/cirrus_scodec: Make Kconfig visible if KUNIT
Date: Thu,  9 Jul 2026 13:12:24 +0100
Message-ID: <20260709121224.614350-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|SN4PR19MB997529:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bcc17704-9626-48c9-3f51-08deddb35bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|61400799027|82310400026|11063799006|56012099006|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yo8AzlrqlaD11B+COI+mAM98zldBVEG8AfmphyQIPa6cHvB0UGRfnsafNmAS/MoLV//3Cs9a0Rebb27crptwWqg2neX37FEP2YEjblWdPAsQ27xJZQJtK/QGCAkG+EK1ej1pHjXEe8aXinASft5LCvDZRyYmhfaUa8Gd/53+43UcnxvuFJR1uL1uHzEvWa0i9CKIaTOTzZLQUc+loQmIuc46bWRhwzIChSqMLmd0WJX+xqfbqjHyFxcO/9oBcchHYaM1AqpAhcVOlIG0IJ3j/6c3C3B4lX1vyQgjLEnVAajevFlOtc4tZOoQeQH5k0grzlZwYgok4ZH7JzcC559vPw4VgBIE1fA1cG5Xi6xZAqhavseBNhOfei7Yg4UE1V+qDATHcpZIucq2kUq42zNiP3JlJPK140pCJjEX/SRk5s3ofixrdprKbVSFyLxudaNbHiEZ1sr4CSizvF0JkAmiGoPakuOd5/IAYTXwU92gmfs3pc/XsfEvuKIXKkGuMao3SKCtOz+Qu+gto3tmWwdBNRUMHsOKj0ODaa8kq+mR0uy5jvP887EPs8wN/Pmu9LFnacjitL6vK1ROn2PoahmS+CmXYDkNSYn/KMyHd4nh1flgF1B+L91bd2BItgBp1vnPCvqTWpoo7lh76F8FteZJaH0nxqojJBPpP4YqP1+UBo+u+6iQXeRksVN/+PC+wSuOMR1oXPwMHy6GiHPU6mnG9w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(61400799027)(82310400026)(11063799006)(56012099006)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DSHMB6S8qIbSsC+SkxsBpOPEHwoj9l8ySH4OPc+145aVSOXp1X9LIdXU59cagCASeZi4IERCH1wLMXn7oopUPKo6EM774yWHeJ+OZ49dj93PTnm3i99QA0vd5LBCB2K4+ajOQVoVG9BoymBat52rSwxWhbz3EB7M2H38FYaRUDg+QsEgK+6RsyD/qxARa+0bEl9yhg7vgZDIXmDAMl0sPK1bS26tudkHU3ticmQcLBKcw7j9UcpXwj16fkiDnbyMnzFBemNdXRcNXg6wKlcikicLoiZKeTWDL6DYRyR6spusYH58g1ujLNKyS215APxJeQiRtKE2lxKKEtcPzRhALHd9dk02ueSa8AJTSWMd63U4zRctt1+jfycJZaqlQ53Ti6amK48suUkHCM2yrK8XuXA0ZEwdY7ZTFmbm/K4lWHKEqhDStQNFofk7Me9CAdNr
X-Exchange-RoutingPolicyChecked:
	W+nS3oe5FI6FxOqSUoOzcHMWGSBtTQbxc7awns0ny5NMe9b27STwblWvjUBCYHwjMxSwzcdvdThWIN0LcnHDTpY0NOB59x7vAbw2UI1oNn+vPtGazA6GEt2Jx1zrCzfrvs3CH4vPjkdcnoYx3xK16SD+Pu8uF9+7zRIJ/5BdFEEs8Ru4EIkiwz4/qDHC/kQFh1Pf6/1gkxz6I/+hvSwrCFyDW+GaA/ffQ9WZAPzJSRH9Wthi6JPq5vWSb8xG71D1UUskypWyA9DmbedQE0lXUgDoW+0CBbaoKICGIEaGdp58+oLGRPwTwP5vjfjq4CCHZ8fSrXNJAvysJrZ4/jBnkQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:12:33.9692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc17704-9626-48c9-3f51-08deddb35bd7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB997529
X-Proofpoint-ORIG-GUID: BV9E-vmDTzygzThD1ViBU_nT0hDdfy6Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExOSBTYWx0ZWRfXwpfuYO/8nqFE
 7rzHJFEJjd9Ax14ylpyGZE+vz+S3x0YhEsymGjAedXOIIEWBTjgv8pt2YLheDdo+fGs/j+eDZGG
 toOSKCizpbXQnbL9RUrUX0m8f6qed9w=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4f9036 cx=c_pps
 a=xVCXbABICjn79FXy6fcvAA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=yOCAHaEZgwejtmnEnjEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExOSBTYWx0ZWRfXzVPUooUtCPmA
 SkwZr9XOAsOgGwLbJzglsEcQFItY3sRtIuhSNubYnGmeCTodyh0V9knyWoq2FyPkALFfdXgsSVh
 XFJfHU3wdDMDvq7Ng86Fdxs2nBDsjgYf5gEyGmIeMz7sELELh5byXabBlIrINQi767RAA4Y2mJP
 rz5sT8nP3QAi5C9J4rclv9c8+1HERQDeRlTVNvBAAwMgLXfmGluNIdvGvzC8Dnp3DMtvoyH+rPh
 mtCL7lpzsk8r8GowrIJonEF0CSzV0mR0ht8bUSFAdA3ko5qrkxOnPDCMV8vP0NasAf6RpuK159u
 AcmIfpsueAR1+/qw0WrLTYWdA0GzxRwxiVynS4+G9wcn2Xs+iR5p9a83zVb71e21jfR1toGVBKn
 p6A90RisFAKKA9dAQlTBScmsUljzGGxVWGQYCYlBnyTVSm1Wn1jHb7RqRbF0/JHtQqq7fFpb6Mf
 P6OkkqBXujQF+xj07GA==
X-Proofpoint-GUID: BV9E-vmDTzygzThD1ViBU_nT0hDdfy6Y
X-Proofpoint-Spam-Reason: safe

Make the Kconfig item for cirrus_scodec visible if CONFIG_KUNIT is
enabled. This is so that its KUnit test can be enabled by KUnit
scripts without requiring a large amount of irrelevant additional
components.

The general rule for KUNIT_ALL_TESTS is that it should only enable
tests for components that are already selected. However, the UML
environment does not support ACPI, which means the HDA codec drivers
that use cirrus_scodec cannot be selected. But cirrus_scodec does not
need ACPI.

By making the Kconfig option visible if CONFIG_KUNIT, the KUnit test
can be enabled with only the minimal set of functionality that is
required for cirrus_scodec.

This is still compliant with the KUNIT_ALL_TESTS rule "only tests
for enabled modules" because by default cirrus_scodec will only be
enabled if the drivers that use it are enabled. It must be
intentionally enabled to force it to be included for testing.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/Kconfig b/sound/hda/codecs/side-codecs/Kconfig
index 2a2e8804bf9e4..1cfd83e251e4b 100644
--- a/sound/hda/codecs/side-codecs/Kconfig
+++ b/sound/hda/codecs/side-codecs/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SND_HDA_CIRRUS_SCODEC
-	tristate
+	tristate "Cirrus side-codec library" if KUNIT
 
 config SND_HDA_CIRRUS_SCODEC_KUNIT_TEST
 	tristate "KUnit test for Cirrus side-codec library" if !KUNIT_ALL_TESTS
-- 
2.47.3

