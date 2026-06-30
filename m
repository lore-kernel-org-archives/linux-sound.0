Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A0143C048;
	Tue, 30 Jun 2026 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831000; cv=fail; b=hBB+QlPfOfIRMKfUYbenoC69BpsqmDiy+X7thTvqcUO8sWg9P+iPW5dxc0CZ8ET+vy6GpiG4c51O/EUIi9A1PjTVLdx9sRswXetenHCOpeDQV0XogDw3B4vfk5owfhahIznT0dYVCKfcm1rrS/El2iHQ7fj0crWDidFbWVOdw2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831000; c=relaxed/simple;
	bh=K9PzNUDFBy2SuiGRu4ck52iyp0WH7M2FBWsEHDTUDuQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YXLTsM7PqvV3BGs6o6R4AG1srxxLczKAaH7KvAhrYZyF/Y7SiFueEB+gAMXYiSA6KI9d1bo4Lnc1R5I8Lipx0gLFzgY2mEqSxiNdHOamjrBzflYcOlnkuDOJovbBqX0NP20DX9kXtWQBnPZZP4Sqg6SgxYxMTxyRtoZeQvX3Rqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Ytzq2SJs; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=t+vwF+tI; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Ytzq2SJs";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t+vwF+tI"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEdZkL1092955;
	Tue, 30 Jun 2026 09:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=MzYdQTV6ctDa2
	423+8vpWXjyYKYbShSWt5aFg/MaoWw=; b=Ytzq2SJsSLfmavlyIHM3FOAHTDBr6
	bih87+ozNbZr5iP8oFyRb/CEvYykulKYkIqtTa955v9gOtDWzWEVXDC2W4UF3PAW
	pLKqrEWI63WSo4Aj4k9fygi+oXnjkpxTHQG0UMtOGpizNZozRv8HL290DneKPGK6
	qsJ+JNd6ehc/nIwmWmMt2MtEWTEhkMR5Dl+d09+DRSTkTReLJ9OIiNhw8zNwvd9k
	H/5xMdMA+/rfY8S54g6r6kdXT63X/q0dXDMCKlbxYDJt6ti0s6rMPTyyjg/GM1An
	LrcHBHkoh9kvdLvTqtmh7OglhUrcsMj2O/SIVPFHasTPbVnxzbfMFyUHw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f4cpvs66h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:49:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgnpFumGcB0h244CBkkutkUjESy0x++gHI6wOhkkCC4QeG7OYy3+n+7s4+urU+/ZZt85ghSpXM6gzTdoIrK7NhAfTMwO8JX7DIwTxwNqcD1fMDuUrhWAWGdOcl3aiH0lbVnQAOwcNKR5SL36o2UZ30eKlK8PnuYuCWYGgc1xjgmnlBCv8tLQlqsyb1Idc6Alo9fIt/ZycxmbGiUQwrcBNwwfZ4HVHO3ahH3gh3uIOsVltulhLnwVZ4Tr0S7fl1STFtX82ElWeln99d4/SjzshtEcTxCN+TOz2ovjnE8xGTM/AfEwf/6bl+/qfXG5NTqzefn9rucP9/Dbs4w020i98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzYdQTV6ctDa2423+8vpWXjyYKYbShSWt5aFg/MaoWw=;
 b=kqGs+n1dmbDTTSdyXM78uzvOlQ2WSqS0N/tCDdRANU2UkOq4re/VHZutDKBMRiAaSyxzjmTe1gA2kD1XEQzXMwWbQTbs/cKqnqKJRQ6yphK02okXVBg1vETfSiHf1SMuvHkeMh0u9Hx9inY1JjtociqfzrtUchrpbiWrrMjc7pRHUifhz5+7odY/8ehxCo03YuHZ4866tSnQC4Q48TbXUqNi2fJhi7VVn1CzWT8bT3MtoASG/pgKXEiV22YpRFyaliUGv13pSY/1kprCEcgsbZuKdv7Jqj7lU/mYxpjISEcRMB0Cexf6zqWu479daspLE70+nSo3xCCPhKZpF4b0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzYdQTV6ctDa2423+8vpWXjyYKYbShSWt5aFg/MaoWw=;
 b=t+vwF+tIn/EqlTYWpY1qUYiFeRUlDxHgWbocz20jIkx4dxcjFC4CPEDgSQW7+9I13PO7e3xQfqWW2s0vy4SC0dUkkSHTCo+8Coj+CvovQw3BXiVqhoiuRF8x5ep1Gmq7kQYPNFwgGCYf8JXH9cTE0xWhj02r4Yx5O9OFj7xlgIU=
Received: from MW4PR04CA0358.namprd04.prod.outlook.com (2603:10b6:303:8a::33)
 by MN2PR10MB4176.namprd10.prod.outlook.com (2603:10b6:208:1da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 14:49:38 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:303:8a:cafe::3c) by MW4PR04CA0358.outlook.office365.com
 (2603:10b6:303:8a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 14:49:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Tue, 30 Jun 2026 14:49:38 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 09:49:36 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 09:49:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 09:49:36 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UEnUir3298208;
	Tue, 30 Jun 2026 09:49:31 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <andriy.shevchenko@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <shenghao-ding@ti.com>, <baojun.xu@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>,
        <niranjan.hy@ti.com>
Subject: [PATCH v2] ASoC: amd: acp: amd-acp70-acpi-match: Add tas2783 support
Date: Tue, 30 Jun 2026 22:49:04 +0800
Message-ID: <20260630144904.865-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|MN2PR10MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 985ca72b-1438-48d0-cd2a-08ded6b6cf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Qir5MHACwIWKr+afHw8xljxYlaD1+1/baC1RmFzbWhCtDhL9mfbGM8Ut+YApCA93htRz+fDV5BdSn2MBJvjjo5QZCwC4xl0ANSoFQ3GuFHIG48xpMe9fTEfTm9mIIX2NZUiVrmY9thTWX25E7eYPU+E8VpT5JxPSNUdt6GkCFuc7l0XKbSZPfUf+dAyY1bmQFWDulil27o+VzFMzX/K+FUkCgM3RsqDO9ECtlQnbxO/GcF8LTFnk553jdmNY3rBuqwEKxkmHfl+FEznfnogASAvj2+lIct0O4CekVpg0YKXVKTwK/uRp4/qfoqJS+ddf5hFRyO9Bg1/dWio5BqCzxjpK+Z40AcgWFL1dMuSxZU40DfLutTtoBmeZgjq8dT2s+gJZiq9+hcq+4PDuyOctZF/sS6ghQgOd5kswmXMefV7NGWVuwZBas3clg3AF6S7L+yiTWbUyqClO/wDWgSlIJLjsZ9srqgZOuMOKHoJkK/0hpUcdX0n1DD44xN9QHXOcQoXfcbA7rZ5jrY7ZYWR8ri0kshlGXQCD5z7DRis5YXSvhxhAQMBpcWy0RKIf3lwMzcIeoLiWBND3CBIES41XqETsueLJWIsxBaLmantRAWBd4wNQXqXSAUY1F8XaZtYmon7V8QXSYly8Wi5L8t6PBOrbTNtKQbjvlIWybwoFAoN4Bl1bf1GkS0U8Nl0bodiSDA88Yyp9ntIuZ9PWOIKJnQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0uejS278Q5/gpZ1NeaoHy3x+DIZpr7hh30MFcDkLfizccvHOa7TEEuYLS2Cd009SlSBJADmchgClhg6Fay9hdEqwl2pfOZwa9xJn+jMKSFEYZ4pslRIBYoyWek8ZNc2QMooB6tgPti9jKXZjXSGX4MfaCVRi4GrzD/0RNNmmq3X7pXro1Y8+v5Rfyrt9npXRvmWbbLYR30PrDtHpVHSwLhjeOy4GGaSgs3Ylq2Y/knIpNAWs++9R9LU1Ee7ymszezuUN48GuRcr7MTagwt5pknohShi6+q/Fc/ymWPJdNHGGJ5wmq9UtCRJivkuAyx254omUpcgBOCf7Ez6ONfTQoDrkTuYs+qROEau4dTEQmLBAlUVZhiEz9H/0TvlBuGDJCwV2rgleVe28cqUAI/KqbGlILzCGNUuJt8+xk8gD21ocZqTFbtxPv4ONF2solhlv
X-Exchange-RoutingPolicyChecked:
	osv0wqKYFjV3Y8e9rf7z0G7S9HgF/dTzgdzaWHOLXUrsb701Wh99MhlYUuTh7SFo/wUZ8unaonYWj0DGP5J2PWKWQf1DR5qEmnfcmm6+m99w2KxApfCJrHF1dB0CwOP+6WC9qeXCQzRVThpp/RWeXbeGfzXfMIf4waiQE1pL31a9sn4BDZc/YtsmXMot2aUA0XpvCQ/takTeHHhtT/6FwIrccrv7eSBY1k66V4hC3s3tn28Sti7iVvW4/JEtsKdz60ZQ5V+NPcDUAi780c+H47kBtCc1Yq/jV+1lUETr1QRF2P/C/rEFJkrbV/30kGaS0YySH1f2d4NpEnygreTEyA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 14:49:38.4926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 985ca72b-1438-48d0-cd2a-08ded6b6cf75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4176
X-Authority-Analysis: v=2.4 cv=c6abhx9l c=1 sm=1 tr=0 ts=6a43d785 cx=c_pps
 a=0bDVNUKav+K/acou55tioQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=H77KnCZ5ihsEuogUPfoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfX8fl5tKoJVB7x
 As7CDSKpKtUke42asZY1goUdtw/ktgKJbVB7ByEi/2djlmfjr9v3OIKwNgrFB0w5EHqT6uXvs2X
 OfBjEq23Vc3uxGQQBubxe8A+fTDH8L0=
X-Proofpoint-GUID: uPpNQOB8O79Pe-Qr-HOFYNrOjPmSTF0X
X-Proofpoint-ORIG-GUID: uPpNQOB8O79Pe-Qr-HOFYNrOjPmSTF0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOSBTYWx0ZWRfX9T8Qle9BlU7U
 f5/Fz5pRpcdusmjM8ZX3lsHpMHXpbGst0INDHXIphz+sM7PXUpGbo+b1EbMFPl18pJdyz3lCFib
 6rON+/HdAuU0far57Iyw17gOr8/w3JooSsYbtzmIhhuIWhOpjFTZZDpsP6cv2IbwH7Zs1HF1L0O
 dALrwnjjk5uGj8kNH8/7BbDzSeFjDJA/yMy02z7fxA54e2OdcuK5bWl5NTDvoaBG2EwVCaNgJAp
 qmSrEV8geo0aTVuzJeRFLAmK1IkOJjvr0ZhZ5s+2VMUhs+h5G8HSH5ZHtsQtO/aOd4FBpt+JDJU
 aVlgwDLezyfs/tlt/hpw/EeyL0+WuGoZ1W6lwErHJOq7Qs5MkhiiwpyxiLre9JV5tMmpm2BKSTh
 c5s0qymdS55VIOmYevy/WXQTWp40U2qT2E5Ilkgzg2shxlfNFJGY9w25RPZwjPI+n6yP1ZjPBlM
 l1t9j9rBbbD84oURsfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300139

Add driver data and ACPI match table entries for the TAS2783 on ACP7.0 and
ACP7.1 platforms using SoundWire link 0.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v2:
 - Add comma for the non-terminator entries.
 - Correct endpoints from spk_r_endpoint to spk_l_endpont.
 - Add two more devices for current test project.
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 78 ++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index 18f2918d4ada..10ef2aeb939c 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -45,6 +45,21 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
 	.group_id = 1
 };
 
+static const struct snd_soc_acpi_endpoint tas2783_endpoints[] = {
+	{ /*Playback Endpoint*/
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /*Mic Capture Endpoint*/
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
@@ -91,6 +106,15 @@ static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
+	{
+		.adr = 0x0000300102278301ull,
+		.num_endpoints = ARRAY_SIZE(tas2783_endpoints),
+		.endpoints = tas2783_endpoints,
+		.name_prefix = "tas2783",
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt712_vb_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D071201ull,
@@ -406,6 +430,15 @@ static const struct snd_soc_acpi_link_adr acp70_cs35l63x4_l0u0246[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr tas2783_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tas2783_0_adr),
+		.adr_d = tas2783_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr acp70_cs42l43_l0u1[] = {
 	{
 		.mask = BIT(0),
@@ -553,6 +586,46 @@ static const struct snd_soc_acpi_link_adr acp70_rt722_l0_rt1320_l1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device tas2783_2_adr[] = {
+	{
+		/* left */
+		.adr = 0x00003c0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-1",
+	},
+	{
+		/* right */
+		.adr = 0x00003d0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-2",
+	},
+	{
+		/* left */
+		.adr = 0x0000390102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-3",
+	},
+	{
+		/* right */
+		.adr = 0x00003a0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-4",
+	},
+};
+
+static const struct snd_soc_acpi_link_adr acp70_tas2783_2[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(tas2783_2_adr),
+		.adr_d = tas2783_2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device rt1320_0_single_adr[] = {
 	{
 		.adr = 0x000030025D132001ull,
@@ -659,6 +732,11 @@ static const struct snd_soc_acpi_link_adr acp70_rt721_only[] = {
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = acp70_tas2783_2,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = acp70_rt1320_l0_rt722_l1,
-- 
2.25.1

