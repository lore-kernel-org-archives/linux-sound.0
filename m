Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CCB30BB95;
	Tue, 27 Jan 2026 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535322; cv=fail; b=BGzbHM/7S1jNEz8bP1q3+V2KN+vFvTkliWANLV5lluBjsXfOmgahJjFdRVI+Z3XditM/PeTTjAwhvpL2LN9RGbL+bFA2fR/MkUWxQccJae/ydcPyn0mSGoBUGp7f2Ub2ycOg37QPEREtb914cA2/8FsPyeFWHZz5p06IbE5XQv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535322; c=relaxed/simple;
	bh=qEGatSqASYw8ucKMtB3yH3NcRn0NjiYseOBFrI1hXyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L02rf40Yz8G5wh9s7QMdXIuOyN9AqxfNrNeN7vq04hpGDU/vrROFX8uvoK/xBsWceQ8soe1rbiw0ammh/yf8HElLCg7Uo4r1giWAJtMMTzkAom/Nz0oHnvXNWuY69DRiMiumpGToJ8IA0ps4IiynPADEqUsoIEeJRWaZQkkQG2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OJzNG7us; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vLsoyAV/; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OJzNG7us";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vLsoyAV/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R5mEts1615650;
	Tue, 27 Jan 2026 11:35:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FmI3rVxvOdTgbfWoCO+Zv2ZP+x9hd+NL5fX+FzFsjgo=; b=
	OJzNG7usxD64NCjn/XV83eZLJd514xmSAHc3Le1usg0cvdY1czyKoF5N27j30oj3
	1/w6+ZUxUFrJQsCx8KTq9f/+uqVvlU2qFhNwRElcpgMW/k4gdbYcXVgGlkGWPdPf
	Jcff7ks1eDhNWeZ3jBGKQUA6735CJAjyoZ3gkN0GkhnDLjZntcP4JL66weViP2p2
	M7q68wANnDntsMhSWKMEfeQ9KWZ4aE1OPC/36SyMKWld9rLHxSGMn9kzSaiAw3c6
	YlCOcypAQxheMOYVlyFaIylaHQFkpfqp5xDJwrz2GG4/89FPsB0EbQAXi+bb7+Vj
	gfLuvAO2/dInNL/B9UbFGg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023093.outbound.protection.outlook.com [40.107.201.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bvuckb8pd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 11:35:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTtXC/8KSBCWcnLOPpQ5yHF7LxgtzaIIKLywwhBh6LpndpspAX/AWq6eBA0hdRdqs8EF/3H7z6GXCQe/akBcx9AKoLPpQUYyjOXLEaDu0rM3o5e/3ztsW2YTWhVrxS+v0czHIyzmVzUeZ/Ld/1/ww6vqeW2LerO7CQM8Ca/CKPERLBc8fdyceIwjIe8X6I2fH7Z9ZSRHjXxIn836mQSkkM08yeGjgB0LtHT2pfa7BchkZ68ny6q8IQR3rCJKxpZVGgaK0y2mCM5qJd2pBcL4avF8BEPt4Q9HW3MY4tGebWdmJlJGt1F+dtioSgjttgS6TgMOHNm5MZCbQwr4SQsj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmI3rVxvOdTgbfWoCO+Zv2ZP+x9hd+NL5fX+FzFsjgo=;
 b=T0r9A0bkYZNj5e3eX9Ak1IWwZQH4BQyDIkgEIQmMKCImM2RBNWCoXKsnlCuR61U28I4C2JA77JdeK32XGBzi5YkI5HqLu6MSd3PV751BD8qCnVohgJ2Czo2S8rIf8bywe+YZrwjG+T69AT6OMI3r24oEtn3uTolguPZV1BhiZNAVET38cECIFvZ7EIhNB6Xd7jwvZ9Tz0v82Dk3CZzK+bsA95x8d0CUqmx0y7dBvAQxaZ5K2dNAHAZCfMziX++amkbqflPaA4XkN0hQmtUcPxC4RJhpxIS0pOtR2UCylXJbdpoD5X2cXh3XrHYgq9QD1kYPYkhQ0BsW7Am2odyKcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmI3rVxvOdTgbfWoCO+Zv2ZP+x9hd+NL5fX+FzFsjgo=;
 b=vLsoyAV/sbn7Dk61rS4lr2CPsL3/wlsOb5C6PU96kJDzGu9xwsP86WqyTeQVIutsUdsn3aHEgnwTbDK9UvU64ueJwJ0jDHtzFXpB2x/pZZHbC0SysWKG9u3tDsE2HeWK4iPMlUKeqDJnckThZ+TSDAzhIFf2fNVqdEnHWtqbX0c=
Received: from DSZP220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::8) by
 DM6PR19MB4091.namprd19.prod.outlook.com (2603:10b6:5:229::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Tue, 27 Jan 2026 17:35:09 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::15) by DSZP220CA0007.outlook.office365.com
 (2603:10b6:5:280::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 17:35:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 17:35:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2E47F406541;
	Tue, 27 Jan 2026 17:35:07 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F2433820249;
	Tue, 27 Jan 2026 17:35:06 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        syed.sabakareem@amd.com, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 1/4] ASoC: amd: acp: Sort match table into most specific first
Date: Tue, 27 Jan 2026 17:34:46 +0000
Message-ID: <50c385a7f64ccd75cabf49eddbc0ec6fe13f3252.1769534442.git.simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769534442.git.simont@opensource.cirrus.com>
References: <cover.1769534442.git.simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|DM6PR19MB4091:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6abf2ab7-0730-4132-18d8-08de5dca6abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jQRLzvTV3xNwIIzkfRe1l2WDeQhsbYBskgmSIJqzUGpXXbzOMF2VQ3WwYung?=
 =?us-ascii?Q?qvunBDIMrgTmjZEGKLY8eZXcMhF7XiJvUnnPgnWcnzM9b5mq8JK+JUMebqKs?=
 =?us-ascii?Q?PH9mIAAPsuDuvmFrRHw0HRim9uphM9/5I9YhBGEfVE8mvEFWYZ/jAHE7n5dd?=
 =?us-ascii?Q?2cTMJzcEgU3qGB0WfhwPeFElntCSOWxkk2stgeDxSkti01nigmkWs1AId81d?=
 =?us-ascii?Q?y/t72JQ5NB+fG2YhGk03JplsFaCSMJuYzjJBDVJ5RmVFqeFv+l4T8OyY2U/O?=
 =?us-ascii?Q?NmceBiUKTBzG1222uVGqqlCHCa/7UluZahfzf6DLAAVca1zWnjjOBJLDDVfO?=
 =?us-ascii?Q?AUOExatv/wFhL6EoM4iPrwP8u70LVY7kIJe2rDjFGfO4XSTCbWFoHY6O74tD?=
 =?us-ascii?Q?EL7rsRIouhvtx1xC/h7377/bkwTS8jGJXzH7ePp+FyLWa/Rh+hD6bb00qT8r?=
 =?us-ascii?Q?M6K5iqrB9GdWtLEzDkrCtvlGDlZAyR/Z6biiQN1qhKTBRbnFfvpBM20m0+5X?=
 =?us-ascii?Q?/2Q2veglnjwCyVhzK9HNAyfjSQagISXMCl9FgPkMUpDMkhueAqcL7vwxUfxw?=
 =?us-ascii?Q?kMoYXyKhad1Z+4aRLyOOlAjTQzIw7OIsvsNEdcfGrEvCVv1Vudn2/49Elzt5?=
 =?us-ascii?Q?INWgrc+1NNYzSI9IQX5LnCLgBOGJJu8t3xYYxsEBB1nwPD9En84fdtWArcZM?=
 =?us-ascii?Q?rroAiglkEHVEXOLs1wbzmnskGc7CtAgi179+7yCnrEe8enp8fiMuBfkzdlvW?=
 =?us-ascii?Q?l3HAEp2zQDIs7lhVfwEGNeu+9J/VK9fllLK+MKNwLMN24z3FOwVa/tcijdAm?=
 =?us-ascii?Q?xus2ZoSAxJ41trSckV5t1zKsm555Ny0lJOTUHfE3YCx9Asq9EgHNJLDIgSOW?=
 =?us-ascii?Q?Y2zoQez2Vcxk9ILYC38nvxTF6H9/fCpFB7PTV5YHnNBlauYzAdlpKhUJdEqZ?=
 =?us-ascii?Q?7ZeGNUUhqzogYXxgwxn1avNWMNatrZstwhd3Xci+O758xhszSeuMl2OW4Q3A?=
 =?us-ascii?Q?QtkkqCoMvPT8AZnC5a1MWd8RCD07XIWvvf5eePqkpT9VdQ4Nhq2f/tb0UKqA?=
 =?us-ascii?Q?J6bOJcLR2U+4FLLMHLzWGtOG3Z7u9WvLAJ9/AT1VVxjTCaKGpbD9oLrwKbji?=
 =?us-ascii?Q?MVJv/Tp8a8wqynTeXy9eY2I5Vt3chapgdNXr00uHx2gl8gaM8ZBPMhFw374h?=
 =?us-ascii?Q?Wcggxr8DAVYSRgZqhKaERNeXJctLqKzhKRGeoWCjph3Y3/gnzH/4Tnl9u2h2?=
 =?us-ascii?Q?6n+fyVajYnws66a3emVDtHXPfD9KXBaIzFVww8/HOgEDng+6Ke8DxRzH5dbI?=
 =?us-ascii?Q?2GOuw/ZkPX7YHuzFLyC5aHfqaOjUymsPYX6hWu4Wi/vcQJO3m40OpmbppIlq?=
 =?us-ascii?Q?sKhzMihb2dnGCMNZcM5I4HqkqDsa4fd5MJW0Cp7NRGyOcHtaOhJ5Hd+2KFF+?=
 =?us-ascii?Q?OXcTBfXpM8RaMvwqrQ4ldHWjWyJ1AQuGdYdo3lmnx3ztVtpDIDeEFTaxiu1e?=
 =?us-ascii?Q?YhGIjxar890uT8Q3PD5M1TFeL/UFpjFO6DZoHMItLvQpRym6u7Agy4UvCZLm?=
 =?us-ascii?Q?T6ceOeOEqTLkzeKr5x8SQ/eB8gFTDRWYqiuPsdyVKhFZgxmwyVOYPVK4KZGE?=
 =?us-ascii?Q?QMb+Evqn9SG//RZmEHHv2nWmSVQWLBUpwve9wXengo/7JeDphVNIXmAbGFe4?=
 =?us-ascii?Q?bGjHmA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:35:08.6173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abf2ab7-0730-4132-18d8-08de5dca6abd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4091
X-Proofpoint-ORIG-GUID: KaY7mACVmlIeLhS4ljXajUhkud6ax5HJ
X-Proofpoint-GUID: KaY7mACVmlIeLhS4ljXajUhkud6ax5HJ
X-Authority-Analysis: v=2.4 cv=Vb/6/Vp9 c=1 sm=1 tr=0 ts=6978f750 cx=c_pps
 a=oX9DDLBFzmmLrgrYpmrGcg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=jgX93pD1Kwg-rslIDxAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0MyBTYWx0ZWRfX1sNxP+LoxFZE
 72jrinC43jw4k3JOMCqWCS8HN4TLgTxx/DienBmE8E0EeNrQHwgViH5EThNukXGBqdP3w6/sSy3
 Az2wCyvrv/AVpukDNpIH9FPUfASx8xaQcOFAT8Ka/wg1LupmPusyxlF+dH/Px/h4E950SMfuQkM
 6hGu6KJy9PkeLgESdr9DjaJZ+5Ls36nRxdKL5WQD6ovOgHb4OIaTezkI7JfCCHfVo/hn138V3G8
 Qhf7wrcyJcfX83DPpX0yDdXk8xFbmAGBGnI2HmwlP8VGt+jwJ+B5YJOOHoQcxTxYLxVM4WD0s5r
 SY3dF/7sVUFd1YwfhmC8of1+I4GdqjaxUSh6c50LBBxGXA9N0g/vDbm3RfJbw4l4omGp3STMmoL
 +qvFJt4e5drNn8Aj9FpgdQdXpb2Fy+FhjkjHaizXmLFGM6z+ulW4eTUuU8b4yNQ4/aGSyy89LvE
 wMt1dZ7SlMMjsO1pBxQ==
X-Proofpoint-Spam-Reason: safe

Match tables should be sorted so that more complex combinations of
device matches are before simpler combinations, with the single device
matches at the end.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index c5f42bd79548..93eb01a00a0c 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -326,11 +326,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_rt722_l0_rt1320_l1,
 		.drv_name = "amd_sdw",
 	},
-	{
-		.link_mask = BIT(0),
-		.links = acp70_rt722_only,
-		.drv_name = "amd_sdw",
-	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = acp70_4_in_1_sdca,
@@ -351,6 +346,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.links = acp70_cs35l56x4_l1,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = acp70_rt722_only,
+		.drv_name = "amd_sdw",
+	},
 	{
 		.link_mask = BIT(1),
 		.links = acp70_alc712_vb_l1,
-- 
2.43.0

