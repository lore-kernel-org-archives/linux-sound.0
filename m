Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776903F074C;
	Fri, 27 Feb 2026 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197355; cv=fail; b=sg5zWiWKU2EZBhkXtGdFk8rTRlRxCvmYU4BE5Z65HsDscEwynzuxuRHKGsx4rOgyipi+aSVAdjJGuzbMh623PX7BYs74Ef8c+xNYsyFwxYnK1BMLNc3hvjcWlHUDsasQ/nrzAEva6+DQL4MOpKAdlDMmdWE9ZBcs8TTqh6fcK58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197355; c=relaxed/simple;
	bh=1jW6eOYZF2grhiSwbdcuTGtwj2ZqQCyYdJVcDxYxssQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ho1rPTjGmgm0kH/fgKT2/EodxbYxCeAE0bq0z5lig/0FALd+HNAuHjYu/qThpKWStHJURRh70bjkX073YxLDpLRWJe87liMGUW3RS8jkc5w4IZtV0HGCQIMXV0F967x2jCS4fHZ0F+2Jp2bhxIJfltu6sONAfbf1pXpRrdtzdYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EIFSdnZs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZfeAWPQe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EIFSdnZs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZfeAWPQe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RCxKsi3721156;
	Fri, 27 Feb 2026 07:02:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2ghMa5df0xnW+POQh3/72KS6t9oRcQnW3hhL/BwPp6A=; b=
	EIFSdnZsBJ/nc4vYR1JEO3spZhXrqLGomqi236usvB7zNqOR4qE/Cn71E0svIevI
	djP7thSR6cbbW/k2+k/f931vHZpwDDx/xO0Xho7uO8RX2EF6W038QbLFkkXlWSrX
	FiO2xOk/4s+ws135ReHpzFOwCCTX6/QDlnhXSNb58PA/PHrX4FIz0YVktBsAUqvX
	V1XmZ192A9uF5LVQho5MVkXk5UCEy2WirAGXDVn9Q95cQoGbBwXe0pLBdIRwK9IZ
	NzhZnwQ988HoYLsqSjHC8d9tgY2+Z2A6Rs3+fm6HVS//R2/EhVJS72m/UGevwS5A
	SC0gjEUpc/LJ4D/SUb6Q5A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020112.outbound.protection.outlook.com [52.101.201.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j76c4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:02:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzbrMDqAmSphYWIQGIJIvXN2H3AssGbYxZECbyE+g5Y+GQTCh8W6eD9n03MVXNt+e8EfavOtJZCPZqJt9KMkjwjwQriKPo6KuDhJbWWtyFr05wdGUzz48NjMSLtbtjlrzs0W+lwQUrqRNfJDGU+qOnsVCfskMwaBjkc2wVs7eFsfHj4YTLtPbTZLJFA4aC7WoQfTWHTD91j6O1UDi0FTOuo/QgWF6iLDurmOi/XAmw+O5t25a8qKv6kLyUb68m8DKtgu8u4d6mPFe8AGU4ySmh0M1TDElvd5V7nRngglt4FPlN5AfKhlAJXN7StAZ3o+VusVNufEZgkLvHovmOg7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ghMa5df0xnW+POQh3/72KS6t9oRcQnW3hhL/BwPp6A=;
 b=wxgVu1ibnpkhqxPs3ySl33c2JzL6FZEYsJiVjzD7kyKIhs32VXfJyGHtg1Q4hka1Saf7wD3yDQ9IzjSwUIys7qFut6hucdWJup+Vv+KxG+sx8pwW4Ri3VPmWG8f0PCGrAxfGj/nW9qDYJgkjXQkj+FwtKIcqlmavVL+ShfXkjmCmsF12W+zHY192WukwzdJU2AOSeJnBWQ2E9HVHDImoiZL0AA4qSSBt2+Z9eYp9DghzhqzVAEzxnfbc8KS9xvhnKZSBE2HFTUy72qL7WX7kYSXj53oWuStdaUmIX7k/OEXetZkpFO4CToFo0UXUa1qEriTWacIXhtHypPBuchzGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ghMa5df0xnW+POQh3/72KS6t9oRcQnW3hhL/BwPp6A=;
 b=ZfeAWPQeY1bQMFWqNdakm/ElQjRjRpgphCs3gFPoJXwkd03FWdnvV/CClZkflkASHy1sISejRrRZVRtL/EMP034P8VV2nTEKmxMqKBiMVqCU8Eo/JMKumiUkQlQyeMXQBk0Dkppsj96JWsgIPaKp2iDkvRPEqgdmgu9MliVtQo0=
Received: from SN7PR04CA0025.namprd04.prod.outlook.com (2603:10b6:806:f2::30)
 by MW4PR19MB6794.namprd19.prod.outlook.com (2603:10b6:303:207::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 13:02:15 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::75) by SN7PR04CA0025.outlook.office365.com
 (2603:10b6:806:f2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 13:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 13:02:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AC9A3406543;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 70925820257;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v4 RESEND 1/4] ASoC: sdw_utils: Add CS42L43B codec info
Date: Fri, 27 Feb 2026 13:00:58 +0000
Message-ID: <20260227130120.3070893-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
References: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|MW4PR19MB6794:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d33c2143-2b63-479f-9c87-08de76006d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|7416014|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	5g2t961+oTJD53GIqbfm70dVMC0hLeyekgiftKuh1+onHNFVvn2PjsCkI9SBE6wf1qnYxk7jbGLOI/nLEx2IEJ1m3K4z/UgOPZktSIXxMIzbmTXl4jQP+FDX619WTJCyCNRitcF7pWMpVsX5vsXhSdpGqxyTez3Gmdb8Yc5GC7Jz671a0jShvGh4RkrISxgej7V7wnXAXrdkQx1zOKxvMrQU9J41Z1n7Pw7CFmSAghRNPuIuGb84IKdROwCjOz9Mfa760Mi2ihbJ+EQLtUe4m5K4JtU+HxzIpciY7O39+VyLwQ4OSp8W4v1w7wZrade28WOpVRBBGAZ0Usp6LWl7IL2unWIqDG7oJ+1kMpeG1XHyUC6DSzLD0vrzUqmBQPngcL+IwDbiuDUGgHFPIlbeDJvGMtj+5irvEt2QnOd3amsUTdY+bLZ/C4ovoJtx8ETvbB+Glatm0rnctLfiWCAo/cd4aofOHud8YEDu31z34Qjn1UOF1OcHs9CT01bBSgzYAMbAxA8GsTlPpWMoDwsXJVUrIL7tRl7yFWRVjr/IvV5avOecglgORLKJjAcW7fEPngBR+qXnbbKa9ejBMtF6BL+/sDB+jbZkBQjpUAH3X2MCsWm2mCk9JzlxoKxxngKHG47P+Q+rIRTZfZUNUXmzlKmfNV1zQRAnjVWSrS9dhG1ig8yh0BPAuompAn5ME+9OrOox2HrF78sW9MqweTnzp6SXvxolI/QvQmtu2LPQsDlObQXcwrL4gtw/XUofFOoyZ79RvvXQ6Ak3GAOtCs9A14in9VPorvYWy8VS80lSVpUiXzszsjlmVfc6j62w0BMAWhCiMrH57rIrNRCamkwNgA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(7416014)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EW2YWedkf+bhqcltoqMosoLrgV1Zv+iR7ydWPbiZtgXljGvOjSQClkP0bE2FrHjFQtpqWU5iUJlZaal+b+CWn54jP7EA3OoGrarVipAJsDIB5ilgVICEmlQyXChMx8mntzNFHeuXSkWeFWWcZljzZUpDfrYx6G+WPRoU71PUr6ym/bvFHvTWezJAEZjfpFO5EZrwX+xZKzqe3hvWCURXMnO6kscSlW4ImPj2LmqVQlvR5xL9DGUP42/PiUD6Pjz/cVk5xA3NJuFAQ2150lSraQO/HpMi2gF3nX6CBN8Dwqr+FM69Oz830sXX4VhJ+81WAxngDK1ejP7Al5eX+SN9eggg62NWof99+pfVf07/E94TN4J37c5TOX7RbcSkYpnoSqoztEa4gOU54dBOBB+CLQ8/6epiNDpUxANnEvGMnAN/47T0vPiyGhrRs7KbUHC/
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:02:14.0814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d33c2143-2b63-479f-9c87-08de76006d92
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6794
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExNSBTYWx0ZWRfXyKVd9nkq2atq
 /c8DQK/AsESaCKR4SDjcJ7QrM2SqxWoqyw82L/0rftIwmjmSHGLNBlj1eMVQ0iaSdCrAszaJ3CT
 IkzKFlZ5t7oFeHm8YLwD9aka7Nhic4U9dKD8KR6nHwZ8URaso/Txu7U+BNUVSvQizTYpX883jIg
 t2PPZ+sneMrKiAKpAMG2eZgavHh2rnT0VFZkljEuzcG97MzCdOknJnlLv3jOxvYAliQxj2pFcAz
 h4hCpR6wPRMZg/9oewF5kqqFX5CGndOFUNK0ataXMYtigmcjprsVlpm0jP9Z5tapZJT9SCUptnO
 AfK2KCmenora7AFybRf1KyfzlgyIKdpDMfzB0OsBCuixWjiZNvtx0O5cyLEE+qXXKdjdpncM6id
 rltgA/VEBNHm8lIo2KcpncyDG0wjDYd7mYW6CsIfBdWCA0B4Dg0xo9H3JgWuwgzom4Xqvt15USO
 nNZHWnp3fGnVvNpTMZA==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=69a195da cx=c_pps
 a=cE3fiHRxMl4nLvvI2vbFbA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=tJGs-QWwAZckUbUC11UA:9
X-Proofpoint-GUID: wC9pTNYpiar4wceaw8wNHbC_hKclkARb
X-Proofpoint-ORIG-GUID: wC9pTNYpiar4wceaw8wNHbC_hKclkARb
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
index eeeb91dded9da..15333d52e396b 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -723,6 +723,60 @@ struct asoc_sdw_codec_info codec_info_list[] = {
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
2.47.3

