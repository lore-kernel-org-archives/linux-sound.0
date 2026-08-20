Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C24399D7;
	Thu, 20 Aug 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226729; cv=fail; b=nnEIqtcXTofEym8VSzvkCNDP+bOnKU8bSCU1uRJeg2FYa/UpZYC5nT66up49PAMHj87ccwN+uGWmEhjdbBj3Eq5sUcp4aD4RBHKDMK5REEpBtrgqHfOsLafFKipS/L85Z8CmaXizALfaXBJUodgNKULw3K2YZltes9/lXQKf4sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226729; c=relaxed/simple;
	bh=7v8bRheWpNPtQAsGOhjARjXn6OiJsmXGbAjExXvdGH4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CfQu+0glj5gSTL0mz+9RRMHaBzAdrMN6tX6819eThTCLJNbCqf8Sk8DMI9if4qDm9WSDECmWmtv1osUDDoAIobkhQU2PFRfw9XUi0T3nvNymL67tm+W5gqsyRf/I6Dk6zyXu8ucqzzz7CgPqWzaxc7p/1nE/YcAX4M9JngRDkbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZjgXXb4O; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n0ILNev5; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZjgXXb4O";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n0ILNev5"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K74XNR3544120;
	Thu, 20 Aug 2026 06:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=05dqV0+Y/Vmh2
	POyoU9QUrum455+xZS4vDopJkVHQ9g=; b=ZjgXXb4OH9Ad80cM8YX36KsMTa6Wh
	lRq3CSfnl+eJ3VpthXOREuZBdvC0nF8pdzcs/dQOXDnfSL5qH9ZvH8+SffWIx0Yp
	FWVe9YfwzOw9YgXiNDiSUuZKPymvE2JO9JVyl8DV3oMl0S4CNM7+cySE8qp1oWvL
	sIl26uDsnfyIPkg2aS141Uq/zRHeJyWoE0O5NQEMLMar7lbBHsRzXaxvZDDD76uY
	e9f8lZxdwDpqn57f24nlTJzuRt8QTy+fxeWCsXV6HhnzDwW8ldVScb5Ub2cK1E2H
	zz3o8bQRy+sdvh7CHWr4Q0qRx8ZwW17xIe7JqzH4VCp4mO88yfF0HxY9w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5qrkaypc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 06:51:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHcdOMJDGj0Ffegtnf7RrNXKnia7tWjOwRrYnkAViDh7LcDhFj2EkWOMJD7JsgHCN7o9nVNLpM7k54aGXSmGAcZ6rx2PwtwkMSSN/bC0d8Yimp5kFHMj9gMJKUcXs3H/CDrNn1W/yHQPuN0cCwodcyHbTjr0mrEWEcojIt+JgQtwcJEhT5wFb7Jen4sSGy5y8jIguIbkiPqJd50xdDN8Zjl4uiGoCOncd02aex6yjNL6JJAYftMzA/PUdLYCNygeXv+4+gbe4GR7UoKtxzH5N1n5j6Po5es1m6gA+kxf626fdLIEa37jZHWp9OqEITVAYl1CHTyQMFszXFPFHYcejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05dqV0+Y/Vmh2POyoU9QUrum455+xZS4vDopJkVHQ9g=;
 b=UdSL+5b+QT40C5q5MPm22Jlsa7ACOKUNvJPMgOFzjqpas+pPZXY7WLckZ2ZFOQwlLi/bEpmX8m7fo0ny3f7ekh3qdt3m8LrE/gpHVY/F0Pp6Mw+3vNJKtJxkZwoQWf162qk4CkrHKSisdCC5RSlKWul+12VRI7LzlfijEY1+dKqrdvB/zPy7U8b2nGMn118JjNNifJeIqk8Cdg0TePCfSyEmo0FuOUadNkNkMDkDIZTZzRPGeYiN7napr7sbQxeuXoYM22aaQvcgaIApaoPv3p/VENC3cGCrSxzkwJ0MXZ4E9hGqH9rnmj/FekU1aSiAq0lXXku3/cwWB9vFHUFBvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05dqV0+Y/Vmh2POyoU9QUrum455+xZS4vDopJkVHQ9g=;
 b=n0ILNev5ipI2qbTLcbuSfYveAD0z3RlGgOrYoLd3mSQgMJGOnvHyTgHghtjQGnc4nfoXDUR+OfjH74BbrBgMhBGg8b6JzULlmk+Rkv3iez5kkPh2vE7ixtxLoOWrPYovcDxdO1s5FoXOEQFveMktwjCnj+6tJe3iQ2XZr7aU3n8=
Received: from CH5P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::25)
 by IA6PR10MB997611.namprd10.prod.outlook.com (2603:10b6:208:5dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 11:51:38 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::51) by CH5P221CA0023.outlook.office365.com
 (2603:10b6:610:1f2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 11:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 20 Aug 2026 11:51:38 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 06:51:29 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 06:51:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 06:51:29 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KBpNeZ065128;
	Thu, 20 Aug 2026 06:51:24 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 1/3] ASoC: sdw_utils: Set component_name for tac5xx2 codec family
Date: Thu, 20 Aug 2026 17:21:12 +0530
Message-ID: <20260820115114.1203-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|IA6PR10MB997611:EE_
X-MS-Office365-Filtering-Correlation-Id: 05274c13-f09f-442f-fb65-08defeb164a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|376014|36860700016|13003099007|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	scI6MvGS7D40VmEQ5/R1neDLtmkHiJZM9ugFvqhxmwy3+3NXEFtZph6QLg/CAKb/7w+W7E3sgMT6bDuYAWfVPlWNNcBHKfD+pcXbdOmVjyfS2hcfuevcKLEua3s/foV/EYx+UkJ4O2rFII/9mf4ArPGTHQcMKO4JhiCwf6s7lRD4QgA2lXDrr5KNrZMa4+/CJZQlh35oc//m/7Hd1EluviWunS003Wkc2hZDwguqnPlEsIBKwWd7bpvIwu8eA4EoPdA2rYQSPKvPywDWGYTuSMBeSfiSQUz4Yf3kyjlqZXWDR4xllX58qHEG5pnSUD5CPY2GE1iHZAC5M43P7zTisF/qt9tElY6TSj0gh0PBBai2A3XzgHUfAjKr9zXlD8HGm35cAWP5/clJhYrq1AyzpZNPTc3B57LX2ie9nf16jS9OB82ERjJsDrgDNllRhJekPx3pfJDzETmnGpioQZPgdlUxjCugFkU1oYqYIQEwJmeN7hQm0HfyDVnFn1FK5UjNZoeR6yRTy+Mi1+17R5hu8Pr76kH6S5xd8UeP1Dt9uhTsasmJ9VBcfp2oO/ov6rkZa/GYyIc8bcCVsIdiPabYVdYVS1krDiSH+zgnYmRJYnQgylUOlgkdyTQjQMGip2Uz7T2RwT39P212trA+Se/+9/T62RVi5S/ZhZ0xi2m4bxvBHaT99SDvsLfc8HHo5YyftMU0ZpZlE5kB7tEh4hOGXA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(376014)(36860700016)(13003099007)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3L2zL5Ohgerp6aiWSmUf+jsoI5CKGtqJNrN247zixnhZOQmv8Q/gNtGcKpJjVM6JV4/B9d6uT/wYeQb7xFuH4FNoRjGXnaRwGNSfUM8UXv6c+VP0xjDR6YeLkLCH/jb3yv6nfCY+QZ6MoLgXg3BNtF+Majw4nKTlMKVwAdehE8LGE7cGsv8CC70vu5+RhgiEd0s+PyicNjICXxiI07+HNZGF9YsR4W0lCJOjMJ/tXm8skYUIbN8WLOPyyk8vFSxmRZkcjaT0K7EMi56wx38FzosKEjg5TMDC5XHMnya/Wb2YsOB3emuVyz5iby6uqWqkY3DgYXezCwgNLEGoLTNf8gT25BgNLSV7iYeImlWXd9nZfAYOzwkfR4Ddocpn9qkshoz9T7Wjs5MDzfZBDIMcWLathP5tzWIuJMdHnmkgAEzdE9oUYQUQd63uk+vMHqlY
X-Exchange-RoutingPolicyChecked:
	qCYU/l9UcppWyG3lcGtaRt0CY8RvQ4BK1GqBM6yrezMLvcpcfKgoin3XOic94hL65tGqcgwOO+r15pVqmjIG+HSJUPja8xyhyteCgAHgC2tO09q/g2IdUt/4IvbHNE87xCFlv/tqlF8N8zYQHbgFiysGZAPhMq3nijO2Ww+eaWVZVZEmJYtToUp0WSNMBjeBnzfSWU6CLfiA8MB/PFiNEPfb4e8OaQXSCWubmFV/csqqy5YhXWqxOU2HBpDRQnJ4/Gi7f1GQxkXs4FZQDvL7aI2h5dM1nF36UO9l4e78WwDfRW8O8pdMIK+v/Fey9Rk4VRKq+6cqeO8yA78WOm70ow==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:51:38.3479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05274c13-f09f-442f-fb65-08defeb164a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997611
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4OCBTYWx0ZWRfX75dHFc5553ot
 o78XeQHvk13im4G+yBZQgGkzRNuzp9LlrpCaNpBz//yDCwRNrW+YebktMYartf9HaTXaRtauFZS
 YESD3iwOui66/+2DjzBirrq9QeyaTA4Ld0Hpa4yix40NavRu9q/bUpELspBwFVbehpF9ymEYE58
 0pWfMOaM+fDSLXn/kpdTXjv0FQEabgP+LiWwuUZ1rFbKkR0jLW3/HuGi2MDAcPgNEiD4HEpbCXb
 hIg+pDUvUZnLQpZZwuqTzLGjxgrbySYoDqWg7nEx8kClonTjIER8mZEIWJzOZJxbIXcMzmL9pPE
 nzV9oCw+QvSxGoNuDlzH6t2HIvmRlEUq8VjChB6//KLIXXWKbSJzTX/J+CPA1S7lImKiFB3m8me
 uuNaBIbrTDVvOT9xrqUFPe/On+8goXdS0Ij/s4YRi22mk9URLP4eloCBNI4na9Y+HvdKMQV3E94
 ItMnxUa8v8aZce7cuyA==
X-Proofpoint-GUID: XHBmsRB1WXNUnW5Dg3UDQwe9Uza56sVx
X-Authority-Analysis: v=2.4 cv=JprBas4C c=1 sm=1 tr=0 ts=6a86ea4d cx=c_pps
 a=QwCZ9Ep3279coiJ7nb8JBQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=t49_-Cc1VuUu6M6_Uk0A:9
X-Proofpoint-ORIG-GUID: XHBmsRB1WXNUnW5Dg3UDQwe9Uza56sVx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4OCBTYWx0ZWRfX2faeaI4TTvge
 qAvkmMaKnd6w8yS25GfzYS/47REEpZtiG8ekCQ/asB/rzi25OJJhTP2JW6j7DdPvxaRJvHNqslA
 eY7Mly/VFoTQrp8FdWkjnsQAVU9LKVI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200088

* With component_name set in the codec_info_list DAI entries,
"amixer -D hw:<card> info" includes the 'spk' identifier for
each tac5xx2 speaker component. This allows userspace to
identify the speaker codec at runtime and enables UCM
card matching for the tac5xx2 family.
* Set component_name for the speaker, mic, and UAJ DAI
entries for all tac5xx2 family variants.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
changes in v2:
- update dai's .component_name filed instead of manually
  changing the card->component_name in rtd init
- update commit subject line
  original patch:
  https://lore.kernel.org/linux-sound/20260819053427.2277-2-niranjan.hy@ti.com/
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 8a07ba2a2..bce13e159 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -81,6 +81,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* speaker */
 				.direction = {true, false},
 				.dai_name = "tac5xx2-aif1",
+				.component_name = "tac5572",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_ti_amp_init,
@@ -94,6 +95,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* mic */
 				.direction = {false, true},
 				.dai_name = "tac5xx2-aif2",
+				.component_name = "tac5572",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
@@ -102,6 +104,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* UAJ */
 				.direction = {true, true},
 				.dai_name = "tac5xx2-aif3",
+				.component_name = "tac5572",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.controls = generic_jack_controls,
@@ -122,6 +125,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* speaker with IV sense feedback */
 				.direction = {true, true},
 				.dai_name = "tac5xx2-aif1",
+				.component_name = "tac5672",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_ti_amp_init,
@@ -135,6 +139,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* mic */
 				.direction = {false, true},
 				.dai_name = "tac5xx2-aif2",
+				.component_name = "tac5672",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
@@ -143,6 +148,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* UAJ */
 				.direction = {true, true},
 				.dai_name = "tac5xx2-aif3",
+				.component_name = "tac5672",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.controls = generic_jack_controls,
@@ -163,6 +169,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* speaker with echo reference feedback */
 				.direction = {true, true},
 				.dai_name = "tac5xx2-aif1",
+				.component_name = "tac5682",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_ti_amp_init,
@@ -176,6 +183,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* mic */
 				.direction = {false, true},
 				.dai_name = "tac5xx2-aif2",
+				.component_name = "tac5682",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
@@ -184,6 +192,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* UAJ */
 				.direction = {true, true},
 				.dai_name = "tac5xx2-aif3",
+				.component_name = "tac5682",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
 				.controls = generic_jack_controls,
@@ -203,6 +212,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {true, false},
 				.dai_name = "tac5xx2-aif1",
+				.component_name = "tas2883",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
 				.init = asoc_sdw_ti_amp_init,
@@ -216,6 +226,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				/* mic */
 				.direction = {false, true},
 				.dai_name = "tac5xx2-aif2",
+				.component_name = "tas2883",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
 				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
-- 
2.53.0

