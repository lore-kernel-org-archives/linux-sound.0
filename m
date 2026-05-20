Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75C136A369;
	Wed, 20 May 2026 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295074; cv=fail; b=qKQbqG/NW8suYFw2IRqfIWH1SRhWQ8jShnuALWInLBM9bVok0DyxF3D5n1bHaBkBVcYE73AvEaHjv7aOYMGJx5GLyROeusnEbRtKBq2nrW6D0XwNihKxlmrtHJUsMCfhbgHOVS/2YZUA6LunOMSCi/jIhmfs0i6nam68zT0eAd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295074; c=relaxed/simple;
	bh=E0NvSvfdgDUv+egdBHvdkjePdmB+H/0iAO96zdDJrTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rJ8IW8Jwtb4OIphRS8zytBxCSS6P0/WsOsycEaMirBTdQinT0miBThaLAq3ze+mO58gvttBCiudIx/mn9Hac2b49HAARZBpHMy+Q0j74Lqofa5wpo8y3NoauKNZIi7IoKwCyfqD1azGawKsl/laOEFNurFGw0kpwFZr9aOYyV4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=E1urNSsw; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cUss/Sde; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="E1urNSsw";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cUss/Sde"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCebxQ1160533;
	Wed, 20 May 2026 11:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=s8Qy+NltQtX40nu4
	WMtg1rcfM945q3P1M9yNNO4izFQ=; b=E1urNSsw7/aBj3C+AZEB9HdyEbVrTtJk
	Bztg2iVJlXg+4cEPUjmYTg/hK+Oo07Xv4UwxlcMewmf2RVynGYEDWPlvfANOOaCa
	cnVBG4Ez2XhuYC70lCoz1cc46+7i1zlhZkCJXaIptzp8udzWSCOwxwb09ZF9m8nH
	p75OA1jFMrscQsINe8IKtBUQ4rTUab0LWot/0ug+Ls509fn9H6whg7YAKbZ4mham
	18oyGVcV56aMXfb7Oi8bt+3/wr0FJncn/N4x0gPMZQ3KxIKH22cd56F4AsWios25
	FlzHRI70MVAlhR9TYr46FzzuS0eBqX+9XYWEpw7ymOrEN22uMLDvIw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020130.outbound.protection.outlook.com [52.101.56.130])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1h32s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:36:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Si3bOoem2EVCL88vKAsBLx2XfdKmj04hS7zn74CsBNdOG3iQXM1LJEPJvoh9DUFzZJ1Wr8t9nVaygaAAGf09hLyzvqy5UthwmwgDTeaLSgUOgR0QTEfQ0gr6douzt3nJv7UCjRvz6ZVUDzsFWjxQ8VeUqm0qLCglwWkqwscZ1hNOmHw3ps+5tILXfY1KeLnQvfro4KmaZeAbgsA7EfUJeP2IAaQCcypU8vho5kJoObmvRkvqgpe8OLZj0ibwW/8CA6cz07Yceq4HQTSC4uTrXgbforkgrgl6Ugg3raL/p4Y7iG0DoQHj1jsFnTL9OCphZvnU5igVb7gm1PkeaiFbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8Qy+NltQtX40nu4WMtg1rcfM945q3P1M9yNNO4izFQ=;
 b=Qqg7VHY1QB9pJ0PG+QUSjc/cPt2ORwnOPJZ+vmUMgHYVBbnP7Ck+KwO5PzcGsc+eEe6mEYICqzghjfQaqUELJnjA58YMiXPqtHzJrCfKt4rDSDzefK1Obj5OXUOkYc3jmB/4GLNJ6UrCF/03d432ejjxA2dSqvbPSF8uXiRJY3eSf7bZeoMv3F9JmESimpBLo/g2mcE/7SIVkl7oIqe4cRA2/+NSd4w65BWU30FTCbHSKdU8rjg8QZW3Wjr3g03ZtG31FjYxiJ6TSK1TrOI2j8Q6PA+dfv0UjaBZjH+ODYCQ7osDgeZ8v8SW7nGnMCvR3Z369VMNUAPuf5zNP9YjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8Qy+NltQtX40nu4WMtg1rcfM945q3P1M9yNNO4izFQ=;
 b=cUss/SdecBheWdLa2vQjBUMQ1V/nye/WTbHEiUunIrB+cZPviq43WP0rgX5xiJh2gAt4BodIMZmZAblf//DXBEzpSjToaNCR1/9TqDIxhMMD8lsAep7u1B2suBFIeucBK0clZw7E+a5tSKGUwirtxmZMROQLG0vHzQeEbJVTv4s=
Received: from PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::14)
 by IA1PR19MB6370.namprd19.prod.outlook.com (2603:10b6:208:3e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:36:37 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::79) by PH7P222CA0001.outlook.office365.com
 (2603:10b6:510:33a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 16:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 16:36:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3A8F7406540;
	Wed, 20 May 2026 16:36:35 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 212FD82024A;
	Wed, 20 May 2026 16:36:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/3] Update some topology matching for newer laptops
Date: Wed, 20 May 2026 17:36:28 +0100
Message-ID: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|IA1PR19MB6370:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e12bcc74-b5dc-4c37-6e1a-08deb68df622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|7416014|16102099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	fuQNAba0TJnz2eq/FeOvsI2hXqjbNJgwTzsdXYwIsTW8WLXoRnzF9WExjH76po14DfR5EaEreNOvVkPeUI7+XtjF9vUx+ziUnOBZBBFrWFuccy7Iw7sSYlEiU9S05Qzk432/KArRmR29xtRNjx7EvlqbVgigy75OkKpJDaJvpJgFVAJ0+TFORCAf2UdKJl27/O3oJswXwycpU7fiVNlW+lUpCxAi9OgVyOsOZTbuYDQmqB0zlF0VQv2aMhva4kIpKtGFEAZAk4BZtG3sVdeD7I4RS8kof+sutXmx6Jt7uz2zz7FYY6Bro3kRFBpLxy7dm6uqLcR0Jr5glC3hMT/jK56XRKTqANqF9FPw8C33b02KgWxfjg8nzTL3CXptCjBphLfsqsPJQy88sUvGs7nhOFk3ZJfiENGc4w6oaBn+t6jAPwcVpRg1JxB/xhDTelIojU+8w7HFL9JslBPj1/8nmzXgfvGfoLX+5e/sfhUD4ZfJc1bkV4EJKBhHbG6mb5zmXQE6D0L658JmZ2hDPJj0SMeiEcjwZJWDO0PaXUfrxRzRysIEk8TO5pjMCxgC2Qo8BxBD35Mt0g4qEOCT3lVc++fNn8OWCNzUio+B+G7B6AludwrIbLbHV3u4e1qx8GulubBmutxf7kWs/Fmz+lFSgYY8JuCXxDGdgyLBCaCb9Oc0ey4i6luPAQuh7AaIsVnYJs3QJ8p6yjnRa1rtJJsz9iaYdejGMla0JeyFG//fU/Y=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(7416014)(16102099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JnddHeXvlcrIwd6JfsS9NVNXm0YIAkT1w14hWa8PnFGVeQ+2VUHcbFhEsl7wQSXihsa/jKggYFnslS3OZaMBlgTFKfObjdYUw0mnF9BS5IEDFT1D/UsGUDUBQ4TMCCzGxFbBtm1xRvB/N1DQBY2XD4pa9m+i3932gA1hTFTN1C4W/tHBQ8sr77MlTDJk5CIjQ8TftRG7cYj39Q9HmwFQs8dDoESuWmBglRhGG0yu/FfeJs2iunAuNslfWmga3CZhHgJDeQddoDu/WymX/FHzBq+rqr20p58P9QNfNw03eHc3w4LRM267LCmM1RI/NrIKJ63jDyFo3TF6MLiafycNjH7C5KNS5qmQkB4/jV+foJ5DDaWZhXRCXlt+X5ZF2dts1qW+XPsBVZ/sTCiod/MwGFMYodqI4Mhl5AS9ZHRr2vikUl6b5UNpcQUclvKcIaYt
X-Exchange-RoutingPolicyChecked:
	acJUn6J91uwp0ntbULvNyWwwpft/J/19d5oEP0qeTSnaHCgsHznuKpMLBFEmaQdMgqhJZdXuW69dUAYqI9qcZT2JEht0uvQf8ofvzr+IsyD5TO+4K+FGaSZnikN9w1itXbe3EBd4mgK2IFjbcviifKVO2n9QfMtJF3IQ2yWQRNpyuniXR/4SL/mOA8FwNz7dyXDwnqoq0ATTieETyZt71GrGeZ7bTVAjWXldgbLulrIgHRLmlyYepj14Ci/TvQUgcYYTeuRGS9ZxI8uKuUHoxiMLV/KjUS6D55kpJTlmv7ETgu6CfwXu42yFEnHdcauXYpB6QsJaESxiaBAGeofkfQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:36:36.6491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e12bcc74-b5dc-4c37-6e1a-08deb68df622
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6370
X-Proofpoint-ORIG-GUID: qHyljyGqQ-sy3ddE4L0weqNG4CLmomAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MSBTYWx0ZWRfX/I5k8vIzVAwu
 EATZjanWpiZsdxl8K3ore50h6wu16j8NK2lNPXLr9J+Vbvd5p2zddqEQmX7ZFnWEaGEDUmjtW3W
 /7ehvq6qUI+XfOrKugYkDQ6Tbl36pdjxpErm2dV2VV8OEal2PB50PU9ntEB+xKuEh/ZgC1UrzjV
 yADxfyMvgyT9UmlYpETTTuB+5D5VnuDAIXm54TExrEewil3lCbVmVvX9AvGDGDHgvvNJ+jKQ4mR
 jCx+l4Lb27LnBM2ufcdmFntKI0sA5g2WtWPZvJtwAik1Y7a5FjqzwihHM2Y8NdqxsfnaRuY8y8A
 p7HJK0PegvGSJjQ717gnQnZYHmtD2hgJJ3NjfUHw4p8xfh+KcCLL/NCw2rb88w6jiAPXoLToXjU
 +AsQVTHVYgr7/vPoSbXM65Wg/Tuvqylf6CtwjnNSntSyUgCVlX7IVAdoadXgp8b42Wqa1vsgvGT
 CR+D8Mv57nQEqq/SQJA==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0de31b cx=c_pps
 a=ggVxh3PvYhYh/Lb5mCqIcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=YQtSZQEB8huoX8ct-IoA:9 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: qHyljyGqQ-sy3ddE4L0weqNG4CLmomAV
X-Proofpoint-Spam-Reason: safe

Now function topologies are being used more routinely we are hitting a
couple of issues on some new laptops. Firstly, several laptops ship with
devices in the ACPI which don't physically exist in the laptop, this
confuses the function topology code as it tries to add those into the
card. Add some quirks to ignore these. Secondly, remove some unnecessary
matches and quirk the ones that remain so they only match the laptops
that require them.

Thanks,
Charles

Charles Keepax (3):
  ASoC: soc-acpi-intel-ptl-match: Make Chrome matches conditional
  ASoC: Intel: soc-acpi-intel-ptl-match: Remove unnecessary cs42l43
    match
  soundwire: dmi-quirks: Disable ghost Realtek devices

 drivers/soundwire/dmi-quirks.c                |  35 ++++++
 .../intel/common/soc-acpi-intel-ptl-match.c   | 119 +-----------------
 .../intel/common/soc-acpi-intel-sdca-quirks.c |  16 +++
 .../intel/common/soc-acpi-intel-sdca-quirks.h |   1 +
 4 files changed, 53 insertions(+), 118 deletions(-)

-- 
2.47.3

