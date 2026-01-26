Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1C2231832;
	Mon, 26 Jan 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438439; cv=fail; b=dyXTvzpuJUQgD2j81Ztt+2IvvgoV5dVuswH6pzTr6bXPZtBO5hOgjb/EtqU6UCbAUgJhVw9A8fNNMLsrIa/4FSi4MqXddy8eRld3sugpgWi8CpU/icJWEk33EABSuwnn7BL7xfz3cNpncuJs7cS72DHD0v64YtBNzQUaylmU4UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438439; c=relaxed/simple;
	bh=rbJE9UDocsVZn811Jn02YzOPBVzMbT9LUWtRjILJdc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfrg1nW2R0S+CgFXJiS/a4muiMIHV65LFqTo2NOXaKiAx0gINuQiNyQIOpcZnOMSP3qBvyB3hBtSjk2Lc82IBLL+g1XEjj6neH/VCP/49MshsAipXv5gHMNWkWX68Pl6i5fdIcFAwEqa3KhoN8NRTFR8f8pcicUNU0wRZ0NodRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U+D4BNz+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=j0UbwAPd; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U+D4BNz+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="j0UbwAPd"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5IWgA3348945;
	Mon, 26 Jan 2026 08:40:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=A665TJnRsieg4Oqfc9+3p75RFJ25waK3G/aHghVVxNI=; b=
	U+D4BNz+tmw+CWhZwmPhXT8cGzv89dQIYBMi50RWqNIanWZLNYs7BJz3NH1IpZmV
	/dlmdU3J/3imEOCawop93vVnNyEn94iAKe7tNYzUvjEim6Mu4uTrwSTdqfeegimQ
	4sVX5YzNWqNcNGfC5hoSsLlrAVfUHGFiODhgx4JmBqe1rdCuSaHX4d7uY9uKMZQG
	/puXHSoTXWhvO6IpFHel7BVaE0EHbGmek6CDC7cLV7c/pUUu0EF0pbFTz+mdlifC
	HQXhcvxojC3c5zaDyeyoHcS7bpsfj3ZMqaU+TwRMZsO+nveq7ofBUNXKOd3QrT3h
	DpgU+FBOvqsaODOG46eEgA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021103.outbound.protection.outlook.com [52.101.62.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bvuck9ktb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 08:40:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7NEbLuKtMc1y3rA1aWH/F/B4i4VSarBjt3a+ej6tx9trzNia+Vez/wtr0q+8gdCEIONzSB5woG6FFvrcp+wbJlNI2WNleSC3fqMXg13fidJiqzJq6ptVk+kdPSPzfoTvv1758cBv2wOFXqAsaTaMFMN0UzsgPAfK99NI+ErvC0QhjVrfMhQd0382uK9iCejiZ98N7xZjvAou8jv2lzgGZTjhyCMmNdGB451X7IbZ4Iv3EqIltzI8BlODgJm4BlNtrQpcmV9bhNcaM+4hKvnDVdhGZTsQWVmksZiMhCGo+lxkRWQfYZU+UGwumN9/3WL0AfvHiKjtxrdUUivUa2w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A665TJnRsieg4Oqfc9+3p75RFJ25waK3G/aHghVVxNI=;
 b=e08TA5OhM6jq10/fW5o/n8Mn0ZGDBB75S+4tX4hLOiFyrdYmddMMD2fHjPDFxrGsnqpoYJLXLHXlQzAtpJferTVzp9eFXHj8r7o86ED4gEkTsiUwoigx5gfWvFn/g13NMSTa2SQrBD7yWtpeNxmKwnTDQLndeq2x0MFor/LvvEb6gf/z49HMAtcravPWLKaEPda4LVi+WNACiohXImQ/yxGz+nuKXcTJiWDCBRRqd+pPS4xoyL43Ku5hsw8J10FGYzLYReIRJ6hQ0q7WKY7aSpn5MSJxW7LuwaM+44n05hCXbaWbBXGEC3TOvNzCjyIunjCQ0Co9/I8B8z+9b6c3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A665TJnRsieg4Oqfc9+3p75RFJ25waK3G/aHghVVxNI=;
 b=j0UbwAPdtVr47eunTGwz4iY9JeRoK/X0HN7E/Mz7p3kYtoCgVtJTzmm+PQhhRM2M32n4KdPiPaujLCipLKWZQqDlCMfqeEk8H6UKGz0M3zVwqmnTjhxdb0hPlBicoE9xUDSRM0FGz6/Olhp/Kk8m/W2yYLfAeMiSCWIlHXTAWDQ=
Received: from PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::9)
 by CO1PR19MB4965.namprd19.prod.outlook.com (2603:10b6:303:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 14:40:19 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:34a:cafe::d0) by PH5P220CA0012.outlook.office365.com
 (2603:10b6:510:34a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 14:40:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.0
 via Frontend Transport; Mon, 26 Jan 2026 14:40:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2CBB8406541;
	Mon, 26 Jan 2026 14:40:17 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 14C8F82024A;
	Mon, 26 Jan 2026 14:40:17 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v4 1/4] ASoC: sdw_utils: Add CS42L43B codec info
Date: Mon, 26 Jan 2026 14:39:15 +0000
Message-ID: <20260126144011.140029-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260126144011.140029-1-mstrozek@opensource.cirrus.com>
References: <20260126144011.140029-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|CO1PR19MB4965:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 74c30e03-2849-4f75-6061-08de5ce8d3cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|82310400026|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LWQQ+Qk/ymzOPel/CfYCAs2INMcDOmIETTeAiipZqHRujR7eoM9FGqqXyPt/?=
 =?us-ascii?Q?7sUGXqACm77DP67wbMCrK2tV6RHRcp5+kWIUmlywBe5wOMZtLK5GXcYFld+Q?=
 =?us-ascii?Q?DW9KcoRih0aUy+Wa/wNaU50ZaKhSHPERiilFVCn5J786rltGV0K6M56ak9wH?=
 =?us-ascii?Q?8YCPpG8s5xwz3/kCufdljSXW4pT6RORNo5m7wH8PfEMMYykE9W+ST0uENYiO?=
 =?us-ascii?Q?V8RRHzs24XxeyYxWQGPrEYM4emgRw6na+Kt8ukN43HY/87VZnkMGg29JtC9b?=
 =?us-ascii?Q?1LneEk8mPqmdGG5okwctk5kk50ykyXVaD8jKrbK4qWWTN4z+E0vXSnREf8HR?=
 =?us-ascii?Q?Z9zJWEcHJ4gVFNiVUU6eW+BEsgRD3ZElLS4543xXlhjAAMMR22g5/dI0m4td?=
 =?us-ascii?Q?Uqc4Q2kFRJIVVOCsskhrOSzHe2mHxfWbFyCpCU32Y2e/s4LA6G84LGYBz6UE?=
 =?us-ascii?Q?wiWA8yGnYcdqhs+04GZaubBU5T3SiztBaFQHpVGVwpTKuWSoc0zyTETStXAk?=
 =?us-ascii?Q?Rf3xfpfkZX5uQyYAIOmkSq13Q0cv6p60IIIOr6FCvbXMNOYsNCpbHC/RwlMh?=
 =?us-ascii?Q?rDcVhqKmeBg++aNUYUaGUkeQowF36vF5DaTdzOadH3aGIwAIrUX0vcg1DdXY?=
 =?us-ascii?Q?lsqvH5ZVR/Ip+NCs+1+1pvjwePR9tPdhI5JRmzeO3E4kwxiAl59tl+ZiBCCq?=
 =?us-ascii?Q?1nj3mFrzzlxRbkfwRVNSVYHAdkrUg4MF2D3mXufvjE2CW8E/53RtCZfGpC8I?=
 =?us-ascii?Q?O13O1G4K6QP3xv1TCjSvNdmEIz62FzPP/NeXfgeNumDFqVFO8DXOqgVmaJ7H?=
 =?us-ascii?Q?0xUmzQax+B2NcdA4/R3uoi44xjAuenbctkpDWEAkUE3FACZoiKSnpmH2EWjL?=
 =?us-ascii?Q?19JLvgfkJttm4/+89ZvHOAOda9HPKlcKGxasjiYI0w9icuLobG30ZPC75UxL?=
 =?us-ascii?Q?iIlXZym8ZMkYDvPsmiDN+Q98iP0pD45/rh6RVPpNvhaPeec2tgCr6ZX7DWpU?=
 =?us-ascii?Q?sErgCYCtfnMKhQXBJR7n/mFbuu399cnmuxTu9MUPOXAcaFcbUd1loWndxO6F?=
 =?us-ascii?Q?RhTlCRwc7/9GFqbKEfOERhrBifp3NasJYnpQUYmu4utb/ybr92Vaopf2H3gL?=
 =?us-ascii?Q?RPu9vcVPGSJuIhhZH7nEtaKWnRGGMD9rA6CK58QN6GYVBTu1uCGA0si7FGhY?=
 =?us-ascii?Q?fPCKBY13dwwQs9k4qjUecots+j1nVdLNsS5by+E2aaSRLJUtfBO/y8N2CzbC?=
 =?us-ascii?Q?G8KZWxMkifSOoCdRgKYawoWVMDotx81ltzFKgGgfhe1yflO3CQRqsq19R4rR?=
 =?us-ascii?Q?Ycs6lo7fA9YlU0mzoFu9XXonCZCgErT8OS6e1OXUQWlj1uVWFfDGKLT/eO4W?=
 =?us-ascii?Q?DUpqMLXZUqec2WsZ8M1ximFylbttds2LqlaN2h5PfFCoJrIL8TNveiITlL60?=
 =?us-ascii?Q?bf/aY6jTaoAgLGuuixcAk5fKgpaY5Mj7rszu4wEbLo5olm48FBDF0dNvSrLL?=
 =?us-ascii?Q?MbJXY0unuL5yh6GG7zr0u86xOnZd1HGTWcRArvL3d6tismuLZsip4aOYJFuO?=
 =?us-ascii?Q?bXUI/oQcBYhsTOAjzn0vK9JvHFjLLG7LJojzX2PwN/W0krSCUntak8VGiXJo?=
 =?us-ascii?Q?35RgH/eKUDhLutOKXNIu0D/4tTHSTmJlpFfvqURElJxGFLT9dpPZ1TOP5yx0?=
 =?us-ascii?Q?6zEBjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(82310400026)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 14:40:18.5600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c30e03-2849-4f75-6061-08de5ce8d3cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4965
X-Proofpoint-ORIG-GUID: fA_KHU8gwk9uVmWEvzN8vvNEQz0zkGj2
X-Proofpoint-GUID: fA_KHU8gwk9uVmWEvzN8vvNEQz0zkGj2
X-Authority-Analysis: v=2.4 cv=Vb/6/Vp9 c=1 sm=1 tr=0 ts=69777cd9 cx=c_pps
 a=QJ8jp5v3SeQRmo9gzrsiOg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=tJGs-QWwAZckUbUC11UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyNSBTYWx0ZWRfXx8gSEHMF4HBT
 5/Bm0jweLTMRcmiHSqRc1xUzmr1WHEtGq2LLXshri7lkW43iR1xe1ARauNoRxfUEgyzGXMoJ9Y/
 TIAOhCTRaUdyaIaXbrCaGsUzlyv5/AVDTS+ud5inP5q4f5WJpndJA5LDVCrGfEgspI3m63E6T+j
 ZSWB++JobERrOWzf7w0erSheRoF+jiCAxdgqtI0u4Ws6cSK8DNCUq4wH5rSRghMCWNNvpLCanTe
 TnROr/wC+rw+aWq+sQkgPG4CpIABMQgzvfvEWgcaYUBrSj1NaHi45240Pv7pG+30JM3ZhZK756A
 2bjX+oHeZrsrzEEepEDqGqNlUQDTD1+NOxbiJN9ZUYBoVzeQLkpkHofH8LdQ8jZSKREUZHViy01
 zD0fvx2uNjqam9jGbyG6l3bScsHVxCBNPW5y6giXIQQQyJSCWn6n7gdGeSUFu7KhlTlgDycismO
 Z6P6WtCUk2vuaI7m7hg==
X-Proofpoint-Spam-Reason: safe

Add codec_info for a new variant of CS42L43. It can resue existing info
but needs a new part_id.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
No changes in v2, v3, v4
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

