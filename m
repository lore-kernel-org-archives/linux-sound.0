Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E843A8721;
	Tue, 30 Jun 2026 18:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844329; cv=fail; b=QIDivHLoyByucbUZt5KQe7aXQP4m7hG5olTvQkvUwh3GUxLfBDnT125x9b4Ql7PUtQrcgtXbF8pAN5o81/OtaGBgFoqUae9Nn+DiUDyggBEBUkja1leZoBOzcytP70exHEKGQRcIZoH718IOhE2mzqzRTcTmv1lL0CvlxLwwv38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844329; c=relaxed/simple;
	bh=PJ/iX+j/ADUMi6PMHnt0A243iXdKJoHrZoTCHyNPkRM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nuSdBOXI65RhdVljeUf9n7s8O/y6wTB2ecTQ98Vme4HcEikdRcSN+iGlyuMv/OnXjYXInu5NOk93o4QPfbFhAIHausNzk//VLDRhRXtLpig2UYvOCTXojiCekajEktCLjH8AhDqMCWlz9gJBSJ79HBew7w4OFBAdbSPOIwUWKlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Y7LWhAwO; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tEPKRZLx; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Y7LWhAwO";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tEPKRZLx"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UGkVD61344311;
	Tue, 30 Jun 2026 13:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mJO5D3CHOIRAfeqF/UR7U52TesFKaQMiDiCJausjV
	TQ=; b=Y7LWhAwODNPtzfZRm1JPTCPwRHsEhn5KAdhKTYWnf8kznAi4veXq2hET2
	DGu7q6hUgpootgSYGP3ZImsvJFKCsMt41c+eRHiwZY+biDuqaPkZcOilCWWPg5gv
	jd5aQO/jB1oT9ZSK/qI85uia51t/4zVoDQs3nUvQLv8nNNRo85jgoZgZrbAvaYVJ
	kLqLEY1ja734UtRu1ynKZjKAuCi2hOPNiKyHEaL4a9uA9oN/KroyM+CLIJd1nGKv
	2HpW1IcJxb/t2+HJZ+q0emrWoIF5NCMqCSwsUzSXA0p+7KRpURJRNLMQJhvfo1Zv
	/eVa4FPlYMlU8xlH8Mg9A8/NPs5sA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010070.outbound.protection.outlook.com [52.101.61.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f4cpvtfdp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 13:31:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGmseYp/eFcCM75LxaYqfnXGAC3+ARLWL0bvkOGKT0gcWrlGnMFKZdwNLHSP36wH4EZL97207p7rOYEtMDbU00nZfvBDPA158oWGBNo5m3GncfzZ9Yk7d30SuxHKukMIWSQH58rOnzcbXcnxiPrSmc7UtpJKUt/WDWK4AQEukbJ0ngE9cgl245aRaq8tD9PO9WER/2BKvicT02AbGYkje162XYuq24WZ2oTnJpcqn7AYy513o/UIt8tyrQBNkoJHArXq0Zy4I078m7IT69uynUxmRpm0zVIDNcewIwut+/uu4LWmb8S+qrMjs70gcdvGJ5Y/hFqZjcN33nv/Fp9olA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJO5D3CHOIRAfeqF/UR7U52TesFKaQMiDiCJausjVTQ=;
 b=RkoTxW9Hm9P66aLmvwEBC5swDSMAzpOTngENd5aFJIpWfVObRhiAwoZxxY74u2R1xWkC76SX3pJ0t6hY/Nf5pWsCqoDX2F/uU8qb2HLRwiGd8rGx6IDPffCGxIVScnoMwwgsnjpZ0KqvTpsj84jvgVtc4pvrC2LEf5O5o4fmqabfnIsQ1WaYTcdCdOHJnvXuWpLUNRCTNJ81f+OwdRRcTolYIckuCcso8LHGD69/wvHFM4ysVJ4PiwxOMKiNqrup8WQmVgRD7mlzF8OAMFdAsR1YcxuEId1H/c3kVnA28c/2ZfqFCF8kOnlvYHTz2s0At0hHpyCBwy21BOFqp9GOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJO5D3CHOIRAfeqF/UR7U52TesFKaQMiDiCJausjVTQ=;
 b=tEPKRZLxvbg/dOgqYsFD6JAc4YzzQVE0X2OKtMw9I1ftdBJhoCp+e2VdofetKjcv8uK32bIRj5tHNysdMbLlWcLTrtjyAGH6Kp0e3cqDrDXlHhfYBKvkQ17uf8ZvU4edhbg7roh1O8JyqAikn7QP4dGbHbzoo2pSjaBCx+AMcEU=
Received: from CH0PR13CA0009.namprd13.prod.outlook.com (2603:10b6:610:b1::14)
 by CY5PR10MB6191.namprd10.prod.outlook.com (2603:10b6:930:31::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 18:31:46 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::88) by CH0PR13CA0009.outlook.office365.com
 (2603:10b6:610:b1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 18:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 18:31:45 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:31:38 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:31:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 13:31:37 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UIVbML3131834;
	Tue, 30 Jun 2026 13:31:37 -0500
From: Sen Wang <sen@ti.com>
To: <broonie@kernel.org>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sen Wang
	<sen@ti.com>
Subject: [PATCH 3/3] Documentation: sound: tas675x: Fix temperature range and impedance documentation
Date: Tue, 30 Jun 2026 13:31:22 -0500
Message-ID: <20260630183126.2588322-4-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630183126.2588322-1-sen@ti.com>
References: <20260630183126.2588322-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|CY5PR10MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5e5025-c2d7-439c-43e7-08ded6d5d710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KijrNOAWpaHHqCGPn64P+Ut5Apny4PUE2BfgRD+S7GW70DdrE/+v+1OoOfVNt2Nrw9tP7WYZEGDmvvHXEezvRlvhTa7k/KXOgO3EdhwKrIGaYRIwB8fVnk1JTMaZikE0LM4KLnOIvYotf0OdJ5PAlmAI5z3XsmIL3zcxCkTEHAPZrLz1qvJ2hENyH0I7nBvqYo63A+Z2EsasYDBD8fAknzKjMP+bm9ZbwyHYPEhku913DtbqZ7zMmoFhIGXx9Clc+Y2t8TdBGfBKE5bOa08Ocp/VRLEC1jDkoUrwaUklw2V91dT0WttOzJRTQ/xKrpKh5VJ9nSAzUvvZoDa9QnFvNDFLBrlNDeBKKAuJSR+WB8/vuWohmP3OV4iOFqwDwiakRVJ1JR3wRi3XrlbS3GdHOPrQYSP29ff3AIlBy0MwzVEkALy7Nyqbpk2HhiDNVE9VWaws+IffN4mzGcpUOmDGFTTsY2AjDdOlfmcIidcNFs9DtjemMN7fevBKsLmxFQLdrvJ03bvlk0d6EE9/ehE7GWHZ3NbUREyT9AjIkWMZ5B1l+YbTqZ9cVZshPUV7m2HVJR8w8NOaWwF8KZlESRz1X0R0xdpYuiPWsm0nyGWbtiu0OG/kdtLc8r3cD2QjsANM/w5UEpshpNm7FSyz6rJxzY0y0TpTC6isw2sUhs/FcDwi+rz1SYxUvFqeVLeQ+vCVgjIM0+pefAjpD5y3lGwQhw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zkBfDY5022IQCEB+IJ1uPEjVRB+jNao29ON7ri/4CyWo6YlK6EZTNhjCPZiSfVOa4CAs8vNZl1ZYhVl2mZxbfxjL5vbbiExr+251fCcOs485ImXjUidcwwXBXjNkZi+w7yfDDdJoRI71qonMNjYx1e7pfIkSLPHy44OHB7LNHQCF0V4LiXHojnkK6kuXatb/RX6/fMDSRvHNEuF22ArnDRAdRO2f2MeUxhjg2Dvyaazsu1yFaGMa0FAsXw+XBOGGU7IBLwFA/eSMZiiBLU/wyL84+edwrslx+wsWg7+76JsGkcV7o48V4mbpit5dfOxweSs4sQQRSdBMSOGSX6ZHEWH4PkgAiFYF0I+zkpns1RPsNm+FXnDXoM7sXm9/dgd+EZXU/bb1OwHAhZ8ALkTpLR1tdp3vr5hEXVjMN6Ia+v8130LJKc6KuUAz1G5VdE4I
X-Exchange-RoutingPolicyChecked:
	nNTlxWuBjxhgJtLxBJB4i19WiQZzgVojRm5fYGjU4biHnndg7vtmHd4ChPF43kTbyVBgaAF3d5ACmpM3cYxh0bNoZiWMppuLycw+7bjMiPflzo03Ev2A6sLKfWBTr9o6HyVG0qdgQp2hhvu7j9eHQtj7pCh5s8D+q7k5ZOhjJ3viVFLEbKsydYyaHEmj3tUOOnAd+xxiBGTewD7G+ZE2w4vPdc4TYD0KN/kUTHRQ62KyI9VjDULEMry0H48okGZyVoQWn7DGTw4N2UWeTOkFdSXApRHTqboV+YJK7nJnoZBrbcJlOXbwJPUJ2sSKUHm/ucoo2TxzMmPE4Xg7DH6wvg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 18:31:45.6798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5e5025-c2d7-439c-43e7-08ded6d5d710
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6191
X-Authority-Analysis: v=2.4 cv=c6abhx9l c=1 sm=1 tr=0 ts=6a440b9a cx=c_pps
 a=xHwt0NLWInP9jDJIu2hPAg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=1ELDaoF-rJYrU_bXw2sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE3OCBTYWx0ZWRfX+liJdsfmqIzQ
 xAEzOSnjT403m5vZFej07UQpgnFTH4fh9nCiOtdkxQuxGw6KAOkMZS1wA1e3SWFEX61V8eh4VjT
 yWnrZuXL+St2tZ0Ei6dGZpKwhoB9Y7U=
X-Proofpoint-GUID: cNcNpeJUAwOnBgH-7p2w5CHlcIhOXVgB
X-Proofpoint-ORIG-GUID: cNcNpeJUAwOnBgH-7p2w5CHlcIhOXVgB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE3OCBTYWx0ZWRfX6/kuvcxZhlCg
 8x9vQ6ZgczJLzvjo0SuzSXX6iUYB/whTibx79TzipO8TTR1rV879qGMp/nEam+H48riYswtWPik
 Jf8puoD2J4ox3lKpwplxsol4AmlJayt2xzTuxYyCIG95xs9ZeFPshPogXFV2EVVLxdugPmGra5D
 c/yURSsRGXblvAnwuovv+fA5APzsocp4NtUL0SRl/1Iu+mN3DZ7iXQNWhp7b1myd7gVFkH/K7k5
 dhtVRtWDc4+y7/b1+W0tHrTFHE+jOheD5MiqcZNA0hbq6iczm3J3jt0ELvd1Kl1tyVGsip7a88O
 5flLbpJpr9XQdWvLSuM0GlUiZarZWpX3pLU6KD/NBNVDzQWb3YwPkDLUqxekuk2gxm2PwT6Yl3Q
 K3BzbN7dhvyULEFGCgbKIeGr/3iAVQNbGoRlszDBEAQLS1fYTbTUx+GvGinYZuSrSU7xTuLM4lP
 +J+SjXqngEQToCa6KmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300178

Two corrections against the TRM (SLOU589A):
- Corrected channel temperature range
- Corrected conversion formula for global temperature

Fixes: ba46edca354e ("Documentation: sound: Add TAS675x codec mixer controls documentation")
Signed-off-by: Sen Wang <sen@ti.com>
---
 Documentation/sound/codecs/tas675x.rst | 14 ++++++++------
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/sound/codecs/tas675x.rst b/Documentation/sound/codecs/tas675x.rst
index 3b99c31593cf..e006eb8a03ee 100644
--- a/Documentation/sound/codecs/tas675x.rst
+++ b/Documentation/sound/codecs/tas675x.rst
@@ -281,7 +281,7 @@ Global Temperature
 :Description: Global die temperature sense register.
 :Type:        Integer (read-only)
 :Range:       0 to 255
-:Conversion:  (value × 0.5 °C) − 50 °C
+:Conversion:  value × 2.19 K; subtract 273.15 for °C
 :Register:    0x75
 
 CHx Temperature Range
@@ -289,10 +289,11 @@ CHx Temperature Range
 
 :Description: Per-channel coarse temperature range indicator (x = 1, 2, 3, 4).
 :Type:        Integer (read-only)
-:Range:       0 to 3
-:Mapping:     0 = <80 °C, 1 = 80–100 °C, 2 = 100–120 °C, 3 = >120 °C
-:Register:    0xBB bits [7:6] (CH1), bits [5:4] (CH2),
-              0xBC bits [3:2] (CH3), bits [1:0] (CH4)
+:Range:       0 to 7
+:Mapping:     0 = <95 °C, 1 = 95–110 °C, 2 = 110–125 °C, 3 = 125–135 °C,
+              4 = 135–145 °C, 5 = 145–155 °C, 6 = 155–165 °C, 7 = >165 °C
+:Register:    0xBB bits [2:0] (CH1), bits [5:3] (CH2),
+              0xBC bits [2:0] (CH3), bits [5:3] (CH4)
 
 Load Diagnostics
 ================
