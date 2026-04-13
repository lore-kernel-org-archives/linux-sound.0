Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BBD3C6A38
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084407; cv=fail; b=mFBiqEAM/5zXSj92DGKddFEvo/qekaLq3m5Ps+3GNdUbWSjKbh9eRH9ttTV8Yf/hC9PqfdjY1IcMT88VAwEiyqQxReH44XWMs5RjKszZCVR0kTYsRv7vPj9rmrKLjodeJ0zLTBjQy1l5ezUHAFOXTxWP/08rSsR3JTct6a1/mTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084407; c=relaxed/simple;
	bh=EBOCegzjvqBnHh2MNTeUUnobS8CBRhYjw68bh1pxIRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFsRHsk4gtfLhuA8vwFs4mywp7KU6XudSDBvy3s7oCMQ1fcLoW044ZEiuNSNW+IXHXu3lMI7irdLGP/xeeuPkr9p9DhlxcpwupGW7siIXbkQfxD9gcDcuiLkxPjnyQBKiFjdJ3BYKe1HvjicS/6rIQ7kJDlN9otLt1vFaLGdo5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=idLAAToU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ApKbtKQo; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="idLAAToU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ApKbtKQo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6xiTp4016491;
	Mon, 13 Apr 2026 07:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=w1X8EEoUx+b9nZCkUxKJanq+7/TcZcwL23q4Lgts20E=; b=
	idLAAToU11rv3FzOAblrglhSzEZhKAy9yYNxOla1Y5Vhi1ygWpHJ6qKZnXwxH0iO
	S42v1ap7WyEbogqZH6Uk5/8UjTOz0z2i8e7arO/SoCPI200adQLziNZ6gDt3OWO0
	8ldegtRL8W44ffrpWh0ixkfCbxqG+XpiAuWHCS4b4gCtQrkhbj8COSQ/Ko+okWCE
	joCB8WZdkkfGSEYJj2XUQ80b0UGyb+Lpt7x6unU2Ap6L0Z8cqXCcdcDCSdY9PExi
	zoK5Tj6/E2LjDrYTjRG9V6ii7M9DjOUlUEKOwf7WF0msewNQ8M9qQU5gQazvv52o
	9fRQ/pXti3MVxNSaEzhVQQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021143.outbound.protection.outlook.com [52.101.62.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dfkpw9jxt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 07:46:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKHx9jLZ90F3cDLiPui5RsP13jMWLIRqAA1vXgKYlN2jLRM4B/I1cKM0W904lEQBYMCTye6GNOY2D505gHVsdn8gDGukxw3/imuxcydKOunFEoLJdnzB6WPQ+Yv9/EseWOscDdn0ARP7V6NidX/Ly230PBDjQuhpB1pP6tpGcqY/+GAWnMTun1k9hUv7+IlaL8/H/bZkFqrki2tr1cCaEMlucUl/C2HmWTTP/lfJr2l6+MAeMCQGG2SqTrcPGJTVccUHlmE0YQ0GEDTtR2VEpgrNresqH2BB0KrzHir15Y/C6ZF0jxmJ1QZCLBKyuQNYY3VtmYFdQww9PuGtb6L2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1X8EEoUx+b9nZCkUxKJanq+7/TcZcwL23q4Lgts20E=;
 b=X20RAeexiuJz9rQVSZHjXhSSmkjC+MBXQNvcWsy6LjqGNx5v9a30WwHNLnYV0ypdZA6fOp7Bl1Roa/ULKzX6cZfe7Qbnes4iGWwQ1bn0V+8oevCtACs34/TCMMbgK+H3d/h/dLU3gYBZzfRaTPG55URRcPs3PGa3d4aRSvN6zPcCY7z8XwPi6ner796XbIdR76PW/ZhYOvheYnofYz1Lz6wn7auKwY4DWG1CToZKaiv/NXvoHLFgeIDj/hRwLiWzomsc2G0umo25TU6apOUEGLBWbmzOkKRuND2uvnPXs56Rj9sXOpyJA5q1UEMbhJLjcJQg+JoVO00wTLPR6QQJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1X8EEoUx+b9nZCkUxKJanq+7/TcZcwL23q4Lgts20E=;
 b=ApKbtKQoP+h8ANKgzEnKKZymoC9Bp5eQ2+4kJTp93jQokw07XFx0+uY0bFJnTZ8mTxQZsdmUcpzm+3W5e9Gvb31MM8OIjEb408LxbuHvTzqG3E5vdTiBGVIvt+C6K4BYmWgFo0Yz75Z7V0GgLVIM7K9lEiz8DGB94E5pi+2p2Sc=
Received: from CH2PR08CA0028.namprd08.prod.outlook.com (2603:10b6:610:5a::38)
 by DS0PR19MB7467.namprd19.prod.outlook.com (2603:10b6:8:149::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 12:46:28 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::b0) by CH2PR08CA0028.outlook.office365.com
 (2603:10b6:610:5a::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Mon,
 13 Apr 2026 12:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 13 Apr 2026 12:46:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B33F1406544;
	Mon, 13 Apr 2026 12:46:25 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 94157820273;
	Mon, 13 Apr 2026 12:46:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: SDCA: Fix reading of mipi-sdca-control-deferrable
Date: Mon, 13 Apr 2026 13:46:21 +0100
Message-ID: <20260413124621.1345315-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413124621.1345315-1-ckeepax@opensource.cirrus.com>
References: <20260413124621.1345315-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DS0PR19MB7467:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 328e5fc9-be01-46e8-f018-08de995aadae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|82310400026|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	tTv2MVVY0/DsjtBfXgWTbgStCqDWktQcfkiVc/51T/J1/ZfZgdit3ceJXc075h0wkMRf7S4RmFxzmoGwSh9F1QP/BO+OzT1IdZvZukzTiiKNtz8JD5KTkFFwV1F3ZJSLRrv9VrW5eJrlEbOnOfSuioJxO7eIz08BOXFUZx0QLa3meUpQjagx6aeKs7vxpQH+yrGDOlZg6T6KjFmM/ljdTzl3R6ul5i6DmhOeruBL8NJkEraI7Q8D0OVnLGAT2r3c8Xg/BmPH2N5l0wCe4FbHHrPOnS4fI2D4qDQVzyqUXpM2Z7XzRNLKH97sWrU6SjmRDIuopHNecOq14SiNDVYRkDtCrEdjSkR8TyAFhq3R7nUYgPMFyqev4+SZ5tKO9XtrGz6EjrTKd7Z2YwDhh/BamYrtaG4sxG8DFrTfzG8tn5Mw7NK4IS9FcpDhw7/i3RvzOP4n+Yl6jsFWT1CVjpjMVcpBk2rv+x+fKnZ8XJSaakfLg8++uwOpkWZZ7h/QvUfn+gCUjSyqqU7NH7PF4IcgsQRkBuzBGrTFtAmG5D9j6ogd4DS3URYDFTNf/sNOjjhCTi9jqj2L5dNpk1Dw4tLvnbK6TZ4/6ujs/W9SYrARUUGuS+yq+sjkebQDcHkS3txt/f6F+dwLOb3+ALJZoM95U/zEtDqFPFqZiwBotdaZIIbJe/k3wEbzBVuP3CdnEqWgyl64ITo3+iObsPflfa3nvX8wAORfAtGUg3zMu+UTdtb/RxPUBPA0WBDoKaFFPBf47ILqyDnRkEEcOVbSMajEdA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SFwHRU0jYdBZ/sNNr/txdysB49BdpNnBX9fVgDM1HtrMRSPioQDya+96TEq4kY5ElIWMMcXnuRVwGaJ2xBkFlZ8oVCNVYXqnwT24NnUk8txF9OrtJNaJYj7KJvZmCLIKpzz0fBHIO9wbzJkQZYZvblwLgU/hzyhvhDpp3aQXP8AwpFHb8NskOMpQFcLL5EovEB5F7CipeU/FkAuVfEG9C/s/XdwD1FfkEndJwB+eb5J0w8KveFkhbch8LnxOHdzkMKwZpLpsbcoS1G90am8jqG+I0gGiKRv1FthNqel8vUy7ui73ErAk8ofzquOPpSC+nFXcMqn39s7m9lXjTKrjGWiRUFHq1wTHNMuXg4+M/HrhaCJPQJi8/fkPH3O867SZJkEIFhLWBPzXwbnqNXdxYpdwFxNFmqX27vh1r+0bEgJjd+MGby/wJUExYLQjXLQb
X-Exchange-RoutingPolicyChecked:
	sx9Duy+2e7gWE8noFc3JK58lYndKqCGyPTA8Mv39CtJGhKT7b/kXOuGVu7YO240qhzPV2vMWJm2s58Iqi62FlxU4+rf/+pxA4KN0hy/8aMfJMhQ/T0+aUJL/C5VaQviWy6FaIIUsZrvSx6fSb/MXceIuGvq78bVwZrSD4ezqss9G4NiId9x38yoYn/v+RDfvoedEa0/60QTXHmoi/mAVZmFMFTsI71ZNUzxAfHOfUxP9RoaIKCGu5OYV9A9wzcSpCu4qhMTrMpdNnzXF5R+8oPUJcP2vxcBvkBXx3lSp7Oe7XrUHEVCQmp0qitj8tiC3cRk/gMUZaIJVEbSqSjPJyQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 12:46:27.0855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 328e5fc9-be01-46e8-f018-08de995aadae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7467
X-Proofpoint-ORIG-GUID: gBNE1QXUcKE6JdX_E_5YXMAJf4ijHDfN
X-Authority-Analysis: v=2.4 cv=a7EAM0SF c=1 sm=1 tr=0 ts=69dce5a8 cx=c_pps
 a=zUXba1i+DNHe9EVMNcbDHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=Hkk9QMZ32v0-i608VYEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyNiBTYWx0ZWRfXzhtOCOTQjOH7
 28I9PtAejSJLBYGS68iHw7QbLKU+n8Nb25dQuY1FbWnM1MB5XM22IIqCPosY0ADX2MTEnhM8Vee
 Uhab/lrvi1r2muu9O4u007OWK3XfVK2TWrcP2lqOLerIEz4268r0jtUALmF2CBIDAdz3erOLCPs
 nNtYfxDKxu0Yl6tI2eAk5rgCDHU6MIS+sOa5oE3WXw4lpHUPWZDo0X0dY3H+3MKKOomHw43YGB9
 iAV/vvosypsrMDcWYt8tHiCyzAba01Wr48n6UBVopa4y5BCJlnq4jcB+jQgBlV1cO2ANtkLwgZF
 Etkmpjb9dCwl0gTPbsEtmXvNcF5nbTuCBXqommm1vfRN4h8PDsSmhHMNHL6okbv26FKkvFPFTGC
 Yw0M/8D8OmZcXp7hQkj27NSPDsZBTOZjitYGLZlV00c36RZ3sVbqT/4OMXLqKYsXmibSW2d+ZKY
 vL5D1Kr/kpJ61Uq1h6Q==
X-Proofpoint-GUID: gBNE1QXUcKE6JdX_E_5YXMAJf4ijHDfN
X-Proofpoint-Spam-Reason: safe

The discussion in [1] highlighted that the SDCA code shouldn't be using
fwnode_property_read_bool() for DisCo controls, as the spec allows setting
the value to zero meaning the property should not be used. Correct a
small bug in the SDCA code that will mark such controls as deferrable.

Link: https://lore.kernel.org/linux-sound/20260311142153.2201761-1-rf@opensource.cirrus.com/ [1]
Fixes: 42b144cb6a2d ("ASoC: SDCA: Add SDCA Control parsing")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index fd6a254c95305..196bade11ab5d 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1006,8 +1006,11 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 			control->has_fixed = true;
 		fallthrough;
 	case SDCA_ACCESS_MODE_RO:
-		control->deferrable = fwnode_property_read_bool(control_node,
-								"mipi-sdca-control-deferrable");
+		ret = fwnode_property_read_u32(control_node,
+					       "mipi-sdca-control-deferrable",
+					       &tmp);
+		if (ret == 0)
+			control->deferrable = !!tmp;
 		break;
 	default:
 		break;
-- 
2.47.3

