Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AB3382392;
	Fri,  3 Apr 2026 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211010; cv=fail; b=VE2BHTzQnVzaCazlOblx2FTDzS53kSe/kkPIhODVNkeX/HrczLzrXRkYbGy112Cptb8d0Koth3QaLMECNrluf5brdEMoOk5d4kgwMaItKcYBaK4onrC4o+2amzSpszJy6PL5b55Hx8UEd6ITN1nj/T8Os/bOcPTZ3RhtF0VT2gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211010; c=relaxed/simple;
	bh=Lagsbgom41gt3PFmuTMT6Ob/69nw5asVsxlPCOQkmoc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VWsRtL1FGEJr9oOct8oNa/GwVecwak7FXnpR31xdtcoJQIne5XhoUB9Y6XxxZlAvn7nSersI78YKwk79Nm2CYB8ylf6Ig1YzB4vSOAQ72/oXTq0N5fNyZAiDAEaAke/W0TIeNwAcjIwZCa69JhMOCzNyaJ6lMU36ehxfRm8Y1sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wGjkp576; arc=fail smtp.client-ip=52.101.56.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wGjkp576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G98UcBGi2e08ztl2HshJ3tlpEN/+NX7bsTE5q+3E7k8M4ahIL5XFe93ckvoV05DiI8+sdn5t3lgMaki7d1s46TIsLPfbL0DcTOI5+p0UiwOM8saDP2RP8ksJQ8//YHP7148RELWOtKrQkhvfjeXBL8YOLHv4kEfI1LB4v0fcekrk6XBt/tUzfwV7OSgndbJwm1TqlvdxzvPRv9+jaKccXTb3FKmbOPiXlrubnktZPhALv72Ap1LZuKPSl4I266Gf8Y4rQ2sjr9TuOVc7BxizOEEXGOURb9PU7WC2NDvAy05WOg+/jcofPCxbEBESsqWoIVdP6JZ0nvkRdvRgZOBCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUPEOF/GGfcMZeXhXlP2Zi8Jy001o5WNKpXiIT9lI4w=;
 b=UK4dax2ocLGDtG9WNku3kHXL1kM0fsi6+lalhvvwGo7uD3KASCxliKIwi2e7Xi5b0Gtc5P9uAOhcBQ1b+rMJPLoo9TUhvZnSsdMLYoyYgf13C7F7V3XG5wbPL7qlLpt+4Xzuk/TUBxExOpJP/K9DvdCd67SSXcbS+69FMukUEq+JI6tLjAT17Zx7aVT3vH6Aa/5Hs/VKHTEjUMIqDp31eDrv7hphwF9d4ehQrAruW0a0WFSSzyiSpMQfUIaxJ3bwFSwtLLCrsOXFeshOIffnizvJcFupXTAYnoknQfY7S1lhG88Nq363iogAIaWtJtq60zB9YBCOlqJmaN2mAC8+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUPEOF/GGfcMZeXhXlP2Zi8Jy001o5WNKpXiIT9lI4w=;
 b=wGjkp5764c234/kzcj4GGO0PP4vf4RexE8u0kUHTNoPPP5pMG1+X1Yu99i5OKqE+4tlK/h2oB5pQ+JCSSEo8hCyJGNsSsdGPHgDt1DDdh88IebbzxUmwxBqcCntHkLxszviAu38CfBWRF9OzkRqr5T8fJMzWDJ2Ifi6byW9tdbk=
Received: from BY3PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:39a::20)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 10:10:00 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::8a) by BY3PR03CA0015.outlook.office365.com
 (2603:10b6:a03:39a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Fri,
 3 Apr 2026 10:10:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 10:10:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 3 Apr
 2026 05:09:59 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 3 Apr 2026 05:09:49 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: Mark Brown <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Sunil-kumar Dommati
	<Sunil-kumar.Dommati@amd.com>, Syed Saba Kareem <syed.sabakareem@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, "Mario
 Limonciello (AMD)" <superm1@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Hasun Park <hasunpark@gmail.com>,
	Simon Trimmer <simont@opensource.cirrus.com>, Kees Cook <kees@kernel.org>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC : amd: acp: Update Quirk for Lenovo Platforms
Date: Fri, 3 Apr 2026 15:39:38 +0530
Message-ID: <20260403100948.678548-1-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 09930b10-0315-483b-db10-08de91692a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	aJ0oNBpnKjJzdm2uCi5ENcSr8ISOV4u8cFcJdlATlxDgQCI6KdIUlDDWa3rmaB+d26QetEKXg4nCq7V/jY5BmZK5KEsB7fhH7wS/1PuPCA2LPFTyI8ALQsxaeuc5hDOlEUs1KG+jyVNdl/GMYhilrd8zWXwFairgAOj7/yeYUNRbbfkIWuVBs5MzNF3tEMn3+4xwiiMVklcqmE2ZqlGhMZqtio//v+Hd8MsHIKbzKcqYfJXrGAGfzj7GuBZHUKqMyBI+6LVNuw4dr6YSHyFSpjX/nj79HJS8Q76BFmfujbZLhM0PQgzzTX/PJxkFpZmN4xN01ETGHFMffyCpCC8zNe0NYM5/NkMsMsw1giGKgqBFFY68rYO96rcbtOp0YgLZKPptPuqyBeIvbRVJVt9X902ZGyLM/yanHyrEkFgXaXSNcV4Mhi+SAzbIlSf6V0W6LBlktNNBzRGTYR7BV2RoGFjiXNQj6lGU/87JX7PR+v4YE/3QcZ8Ifags4YUjI8w+rgNI4riHxB9AqOOhDiu8fTZYoG+pV3HBaiogrArlULPDs+bDNz6fN6NxHYyEpxhCY13ErjWebSXWigGO2zKrXOQdg5Mo8wENpgUkOyoCPbSIz6Jra2lkG79dQkYjSrogirdWLYRVZhQLxfJ/u4tYWkiun04Ep/qNwhMPJPBc0UggKCIgDMc/rZ8mN9taVQkzUu8ZCamndOr+TB4ZCFEG0Jlhemo4AIFnI1tfQouKOqPW/kSn6zjDb58ZP4IszlFhb8acncabW0LNaxvhoqm5Mw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A5Re5MDCz4hmSpnQCCppARP6aIibVNXc4C4DZ5H3CgA6Lq3CoIk+sjBu9v7p7q351luLVt7vgKTnKdzWvGlnozwJRJMNlT4wo+gzLo/tITLdUZnD68+ZhDP89DUXNespRoe5x8Ptp8R7SyZZEXDNWvDeKiBmi6qKU97Zb3/rhyK28BQE7LZcYpqshDAQBZvh6V+Pv2+ARjT/86WwiimitKHPOH0X0QLNzI4AcBKNcOE5RwiukT52uOWGzk6DzqSpdV7KaT2mdYDY/Zf+0hkXUGwxGbdDYZgJ4cJ5cidt53NlesacAYFoddPo37Ccj2zPyAvSjTFA8gR8kNu1GmtbD1g2btJPMpe3ZHcOvs/OKM79bCV013xvkLhBWSgQfDxK1kHH3ahnxOpxcNTyeSUEXc2Yiu6fQD5+AxR27L4xALEKLL+P5z8GO0ekGCZvlk8L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 10:10:00.0163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09930b10-0315-483b-db10-08de91692a53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817

Use DMI_MATCH instead of DMI_EXACT_MATCH for the Lenovo SKU,
So the quirk is applied to all variants of this model.

Fixes: 3acf517e1ae0 ("ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models")
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 05484c72f9a8..986fefd0de08 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -99,17 +99,17 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
 		.callback = soc_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "21YW"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "21YW"),
 		},
-		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+		.driver_data = (void *)((ASOC_SDW_CODEC_SPKR) | (ASOC_SDW_ACP_DMIC)),
 	},
 	{
 		.callback = soc_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "21YX"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "21YX"),
 		},
-		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+		.driver_data = (void *)((ASOC_SDW_CODEC_SPKR) | (ASOC_SDW_ACP_DMIC)),
 	},
 	{
 		.callback = soc_sdw_quirk_cb,
-- 
2.43.0

