Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759A2E3B1C;
	Fri, 23 Jan 2026 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181030; cv=fail; b=Vk8P4hflaeiDLRaCSsC0Q+AG5CoHbggwbnQFeNzX0t2JxEbJR1TxpCJXqgTZyrc6ehfCvOMoroucRj9Ni5jDLXptAm+qYgi1/e40Vot+ol1vhXBIK/xkuTe7YA0aKEjuiU+El0FEJeq1t0RoNa8AgCo1Xx9yr6aeggEwuPy5vec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181030; c=relaxed/simple;
	bh=GSLu4caccebvXuqJDTR9Ishb7HIOeS11JD1AdadWztw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJpqYJVUeaB0WBIVmPVJhQfqKDND6UZ7FQBr0xB2F+ikN9a0XFdoTBz/4GS/5OlsoDbUhTY7poUGGXp7MkMHM+bqZ7vK2BINr0sc9GgQX6sCj1FSkqlxjlceAqYBrmhjeHkZJKz4LKJ+/VtlrGZxjIhtHuHeLolrcxwjNza5LDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NH/+dBJZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lNk/jFnu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NH/+dBJZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lNk/jFnu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5eaXK3358802;
	Fri, 23 Jan 2026 09:09:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=61jFpIR+KDCSIbIR+Je9mX1nl2ePnt128AHcsCZmOBA=; b=
	NH/+dBJZQsCUGj8bBxSixUud5npMnLkwkoKZEFQhMQiS2u9VaLoynmNlRX1tfQMg
	blsjX1J6IZ9soxV8sW3wxSWU13sRTBRE3hErkBpTfGBFiPnHWSeY7LV4Jkk9kPoK
	p4r3FDP+Xxh+5dDp0KgP37xZJIVcthzjsbmKEW1cjzwKYb22FAW5+XdmCVQiWdNM
	YCdTEEMP7WT9Q7skoIrmb3yy4UuAK+NPMySVtC9WN645RCahSS5x93g0+6FHQYnb
	26KWRQcrotDa7SNubzUDvbpLZIO8m6uUFNSsP6GeH2tRNhVUZB/PV71BGGKQ/yX1
	CCKXnCeu1gg30eq4okbqwA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022083.outbound.protection.outlook.com [40.93.195.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4br8q1ypdn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 09:09:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8yIYRtlfz4WzHqrGilLeJLj5euGZP7sKUXhUUUUm7v+rSIqW1x+Z2Y2cKZLwCTd9Eht/n9HY9K+e0n7YFN5xUzn0/xHMmD81M61Y07+iOMLeUjFeFsrk6f5eWuka1j8qO8MkuU2hMKGEqUpZmf+e2qyFT5CQHtu13vK+QssO8NgqVEsDsNhVlOsU/AlublAn8YUM6Uc6+na5buXCwWVBU1TfeyuS+EAwHLb0VFxx8L3OwyzzNscB6WSg/tU0xZtruqVGp5HqwTN2cQOGTzkTpQzUOzmkBC4FyLQvWsSGuRGLy93dlihhG0J5JIjFamEl4LVQgN/KJu43Zp5zdcTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61jFpIR+KDCSIbIR+Je9mX1nl2ePnt128AHcsCZmOBA=;
 b=GcdM2JBLb7lS3aWyykmkob/Xeg0WV6GSIx/RfTdX6/njslVYHulGvCw14jvqf6nMGpR7RYWttCDZRSoxP9eNA3cx/51M0BA0JMD9yqklT+DESmnd8HPUBnPSkYECTHp/leeEu33ctX48N2O21LNI7kVX6zBFgGTqkwgqBiLBpCOS3rkAaYVCeZATS3pY7PHMC1wT4APWrMtlx54l0eYMb0VmpEc7Zi+RMPRPT8Qc6wvnVT1UE4iMEUJRD/DgD6rmWd5XlXQdFSDrYi0srL6RIyCDl4W8KOLtKiyJwrs2K27cuI3VS0p2TIvVRX32BfZaB6JvRP3DIAL6K3mysLVjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61jFpIR+KDCSIbIR+Je9mX1nl2ePnt128AHcsCZmOBA=;
 b=lNk/jFnuNm3N4rqaUqTQV/K7U4aKOKzlaWzkkts98jpla34ROaG76Aa2zW9j1jSvaXMGvX1RX98It/9f3dHJZ3nCRdGcz+N8KqpLWebpORlzsu82+p96MDDLTafQtn+IvkmabRKNMHqFbVLF3VFUDPiHm2b/ojHuz9BOR49zSzI=
Received: from CH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::7)
 by DS0PR19MB7348.namprd19.prod.outlook.com (2603:10b6:8:152::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:09:53 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::4c) by CH5P220CA0001.outlook.office365.com
 (2603:10b6:610:1ef::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 15:09:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Fri, 23 Jan 2026 15:09:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 912DB406541;
	Fri, 23 Jan 2026 15:09:51 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 66CCA82024A;
	Fri, 23 Jan 2026 15:09:51 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v3 1/4] ASoC: sdw_utils: Add CS42L43B codec info
Date: Fri, 23 Jan 2026 15:09:36 +0000
Message-ID: <20260123150945.100038-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260123150945.100038-1-mstrozek@opensource.cirrus.com>
References: <20260123150945.100038-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|DS0PR19MB7348:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3ad52dfb-ec87-4a95-bd84-08de5a9175e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|7416014|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h7KCxnFpnoTx0Mj3aVgdEUsv3IKseYizNfcN462hzGSdWGd5+E/NAF+YlI/f?=
 =?us-ascii?Q?29PDjab/XGASRQVXyZE2wL9T8OZw/ajAjSzm9/pky25lPJZqQOBTD5bqKcS0?=
 =?us-ascii?Q?TP0lMcadwR/uCRiibOLC9GGWBy0SYEVJssNeOYy9IHgS9dDfe+CV2rUieLK3?=
 =?us-ascii?Q?iZuJ7CHI0M0PqtlJUiv4OjkVnio2Q4TBCyxWdfcufoZr0mNFFafFDjBqcu18?=
 =?us-ascii?Q?L+VJE28aTQvGwHOG4gi/IuChwRWA/K7vlJrYN1UwQF4vtuKov6a+1/Ce8RfX?=
 =?us-ascii?Q?QnePWgCXf8Pc5h5k57ojo8dzGMZb+FGLw0n9N7bEycoRpndt8WzoVK+pYsbq?=
 =?us-ascii?Q?G3BKum4TSfitbr20pjP56sCL41HelOqQ0iJjn6MHSdKuZ5eEY+6xpRL7OZw7?=
 =?us-ascii?Q?1lm8cC8coJVaLOFQp8noq+A4O8wItPkyZvG6I/akFY9er7Hu83UAFUo0FsOj?=
 =?us-ascii?Q?PoNeGGrE8StKflsRSirroHGY+Gk2qH386M18RU7wmmsQhfZvsQUjE7Ocfipj?=
 =?us-ascii?Q?8axjFLOa090+0h8j9hg5D2N43HoCsYh2rqfNi1YAhgZoI1bEja+Kej6EVL8s?=
 =?us-ascii?Q?Czd7Hz7yn+DGA4mkhDe6mSLBpvXhls0l36eooskJDMx9cTwDcUVDfsOJNydr?=
 =?us-ascii?Q?StUlNSOPEVH7EuALr256XOxcwEVYNaOlFHn6L5yBU+zAFYuPEBnxCm65M0ij?=
 =?us-ascii?Q?H8e4d59m6pN4ZQpBkQCnA3FwLeOZVyZlyRAsMI6DlkbmHuUIEg5s4nPzymSN?=
 =?us-ascii?Q?n5ZkSjKUTRcP/4mvGEg5sIu5wFzShvPV6oNFkvk5EbLvNPaDfYtiVeDVEocF?=
 =?us-ascii?Q?AHa7LoA/Dga6la/R/F85Fj2aQPviTRPx7j7syZAEaAaK2vNy0txoutacYsxR?=
 =?us-ascii?Q?iBue2JbcEXGGL8D21HPX0vxloxxdHY3mYL7dvdkO+3O58ls06TY9oeBJMlCN?=
 =?us-ascii?Q?GL8QxdNpdFSgtIn9CbV5p/s3qA5M75ClRolFX67X1Px8/P6/t/fKDopPBlqg?=
 =?us-ascii?Q?GqpSNnsf6TMw5z0J+nnuMtNGujWFkz1E3l61s0G0grP82D+XUJx1gce768kT?=
 =?us-ascii?Q?NJNWP1n+SXrQXR+86Rgoi0PUTrjIoPX+r0weCEo6s1/5kSpqXw+O7rDmWu1m?=
 =?us-ascii?Q?EUAZ3h0QV86wPskzyMLnHwmOHq21vr7/4HclODeRKlwzq1esX/TwE8S0aWJV?=
 =?us-ascii?Q?4FUkIynx2TXGM++0pTr5ZdPMgZLdVcWiRl7jjo5niHBRqdxrBRi7P7CZd2tC?=
 =?us-ascii?Q?Rnv7j/Impg7fB7howpDE0B8ixanfGE84pICI9T4fBTq4HjxfeBmX9kMDyld0?=
 =?us-ascii?Q?woJvss4hcbl44kFm1WKbhs4BfjP2C5CwSBnrT3lP8Vg5bWU5t1dB0ICtqth+?=
 =?us-ascii?Q?cHN6iuvMPZbuYYfwWwqwyTA5LpRKGqsYOZ8ZjL+AZr8fcN6uBAOmNLcHTJ5/?=
 =?us-ascii?Q?JyQDaG/mKqHpncj7Dpzz7ObT1bdyJKVSJRhlvONoh1MmZA35iEoIam0hMOLc?=
 =?us-ascii?Q?zwNk5DM8a1mfVEf96pPkTOaQ/GrW9/kXbDekAE35gSOUWRDP3IxJpsyvfjMz?=
 =?us-ascii?Q?jneMQXtdgn5+OVMNAli18mIVjNQhWoh3onK3CBwOYReBBRf8fB8j5j9TYPBZ?=
 =?us-ascii?Q?PmQDx2+8IdPVXDOgdrxNyEnfQZLU1mktCetT+1D1TpH2khbZdHHdFzVXat+u?=
 =?us-ascii?Q?+p+Fxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(7416014)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:09:52.5295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad52dfb-ec87-4a95-bd84-08de5a9175e0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7348
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExOCBTYWx0ZWRfX0vVHIRFo0Lww
 GYgnDW61WBCrBKalv+yirSn5DxGxFj9bHYL1cco4PsFInDQfcueD/bMQ5ME6+9Jv9adjdzF1cFA
 wkhKb+QsCAuZyEmDT8D+dbiXM/bBumllhgeCSbOAR/YUGIsdHX9clxtMbTspqH8+YSQEUzX02O9
 BOMk2hBH4MhI5qt9KjYUUEUkCr75wVAOiFcmAiVIHeSNTmYSDWnJ93yCJBw0snnUIMkK/Qkpd8r
 ntzNz//uDzxO+jjnUvhM2nTNIQeTi77DoWlzttmq+7X7ov6EYWA6excH9axNvOS2901/zu0k+DY
 Mt+Db7UYiiFODVjWuEyF+3maa7mN6ovgGK+B76uVhfOhfWk6ZRXPTFBJCQZFsysnyAAQrFgrNHR
 wzPaWCbCv1vPhw4rI+63AUizwwg6UEXrNG+CPY6uOsUMDnPEQo4KJBut6LmYU+INfguT7qqLC9g
 Kp5dHjmd8nNREt0ZFPA==
X-Proofpoint-GUID: wQV3naduVk_NDb9Au95lLvkppUs-lhyW
X-Proofpoint-ORIG-GUID: wQV3naduVk_NDb9Au95lLvkppUs-lhyW
X-Authority-Analysis: v=2.4 cv=JbmxbEKV c=1 sm=1 tr=0 ts=69738f46 cx=c_pps
 a=qXrkyhrtrlo5bn8cMY6OCA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=tJGs-QWwAZckUbUC11UA:9
X-Proofpoint-Spam-Reason: safe

Add codec_info for a new variant of CS42L43. It can resue existing info
but needs a new part_id.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
No changes in v2 or v3
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 2f3c9698a0e8..196f17c908f8 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -721,6 +721,60 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 4,
 	},
+	{
+		.part_id = 0x2A3B,
+		.name_prefix = "cs42l43",
+		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
+		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
+		.dais = {
+			{
+				.direction = {true, false},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp5",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp1",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp2",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+			{
+				.direction = {true, false},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp6",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_cs42l43_spk_init,
+				.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS,
+			},
+		},
+		.dai_num = 4,
+	},
 	{
 		.part_id = 0x4245,
 		.name_prefix = "cs42l45",
--
2.48.1

