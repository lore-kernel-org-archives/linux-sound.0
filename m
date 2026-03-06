Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF08F3CF67C;
	Fri,  6 Mar 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810959; cv=fail; b=Gu4I2e27/LGtaEFTaTSkNmwUzfHK7daOFF+szNI4eNKyPQoZUcnD4+/wnIOkRu7p3/LlmuaVFHwFO5oEot/YNjc58wEEIw6GBw6eJSJgczVsDZG/D0nM/WBkyMTWTth/3CFm85or793eldiqSCb28RTI4bDGVPrG53CUhDL4WBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810959; c=relaxed/simple;
	bh=+8iFPebnfS4TUBS71R4957Xz98zf3B/LI4DbwvGjLK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7wdJ44G9pfi18guQhLu1MqH+W6/mAGH+YnsCm4eOqV7mXXRvN2C4VdokeFuPLEgJjex1Y/lfGS0MEVK2+ESCrNRbrFPCypYowbqsms4VLLDj+4Cj18YNSguvkMuX/dTntVltPlZz5Qrh36E/XM+P4JO+jzmsRf7VxWnpofgmiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eaRccdDY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vxpOWrMf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eaRccdDY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vxpOWrMf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626D4jcd085812;
	Fri, 6 Mar 2026 09:28:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FfC4v1QQ/6C9K1qxmEEd2cRqn+4R4SAdSx9JrKqMsjc=; b=
	eaRccdDYIBQ87BkMCHgCsDTE30UAZAW9/qhffAaGuaIjzF1hEvYRg3J1iCBnr3+S
	M2CML2/YwqSZAzSF4eytwAwLL5vZR7aFjL9W+1wr1qDkZmZhm2MV4/PD3sABRFB+
	a3jiAkOd7eFHL2AZOa+1/U1oL9da7CCJRVGX9Zz6izB4eGiJeHQWWCO2Nr1WIY5E
	yN7+tbhwlIkFYXMx5IsbR4y+eBBn7RdG2ACTvjv3Lpba9j9y6zq9Kn33IetkVEqJ
	asfDyJNcHAQ0yObzRQ4wZS71casVnhH/6saBOm8eKOLl7eEriahIvEkETfZiYqOU
	/NSpqgAFQJO7T0gZVHVaUw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022125.outbound.protection.outlook.com [40.107.209.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cqyg886en-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 09:28:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMzFagrXnvuc306tTL1zn3BEZ8ydmGem/XMaKIziomSs2y+mtuxuAEPJ8WAQL+MozpJ3tfhPIXQ6ttVbEV81Ct6R1NWYxOCPooXYDLjE/ntONLT/0xGmVwhQP8kO4CrBGU1x0ANwdDgK2TKGS+PFEvASPSG329H88sGYfY3nKkkdcBnNLBddLmg3GZfROvwIdvx1lzVr6mMw3iBvisaB6bR1AQjvSCyPJB2BsTKQoD8hdyZURi5FaA2ZNrbW2r6fE7d60xvHdfGubkinIDcZ81DqmcrClnL+C066veJfRGz4dsw2mVIj1EpxuCuBbR2h69EO3u9yDsF+XgEfWLIEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfC4v1QQ/6C9K1qxmEEd2cRqn+4R4SAdSx9JrKqMsjc=;
 b=Fn1aRgj0T7pCtm/Ruww6yMycUQDLOfwXUw7eHUSgrbBM0/36B/Ij++K51yZw/ryKgTI1kq+zu0OAXv8JAuz38gVhsRFa4pGs4qOYBZdNDetuf5VCuO3BQWRe5FFmxEIHkSd5mzRaZiVCpsz2GQTcqUHXeOWuaTpG6EimgP1Ei+DUQ5bKXa6auC9nzZ5ijE03rngA/K+c9GsRpXFEJiq2TRRBmKKvoPd/yxndq1zYtkM3bZAhBVKAlT3ukPjGy5WTssq6gJYbDAxds6/b+i7+3glz4xfpzxjL4AJ1RD+m/edaZqlgwajODK5ladaOr+lrCIkMBfja2/hQFKgLk1TAYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfC4v1QQ/6C9K1qxmEEd2cRqn+4R4SAdSx9JrKqMsjc=;
 b=vxpOWrMfXHCqd4lelikOpTnsFpPndLTu807B5/JeoL48Wn0jbKgCUfnAEMqxl7TGGLQxPiwINF+Za/orFt7ucELJq5nxh3GGzQblgWng5G8mv4xs2wwVnbh/ZGRxuBD/b97P9f/uWumXM4gv6v3AkG8j79Dg38sVeqpdtd8UXVs=
Received: from DS7PR05CA0015.namprd05.prod.outlook.com (2603:10b6:5:3b9::20)
 by LV5PR19MB9011.namprd19.prod.outlook.com (2603:10b6:408:2fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 15:28:51 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::91) by DS7PR05CA0015.outlook.office365.com
 (2603:10b6:5:3b9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Fri,
 6 Mar 2026 15:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 15:28:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 143B0406540;
	Fri,  6 Mar 2026 15:28:49 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EB8C1820257;
	Fri,  6 Mar 2026 15:28:48 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v5 1/4] ASoC: sdw_utils: Add CS42L43B codec info
Date: Fri,  6 Mar 2026 15:28:08 +0000
Message-ID: <20260306152829.3130530-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
References: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|LV5PR19MB9011:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd2987fa-38bf-4590-34f4-08de7b951161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|61400799027|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	Up+pfdRYhDZ36nsExXVv+mbQxUPNkatWrcTP1Az70LjPBUVtwYD2ibJk3g7vEQIfh7dE8tv1Or6nw6BXkrqS2XotUpdsrDiVQHA1bgzfs1GlFdH+ImNtQZMgS5xmEjE18NinfOsK81dKSuJvAl6PbYWnIwLJD8O+ZksVZ1cjlHHUTU/jm9tJrNetBv5EK0fO3fHGSMdgGN/qrhJuNIny1Zi9cP/98NRG+u5QXGiRMpgcUGqDqsCPx3Dx13u45PxuAn9ReFUeBLrLaQGMA3nMStseZ68XDLo+0zTd2GQNiQVrErHiUXYEASDz4fRCP/FBu8NiDHVTZhx603WdEG9l/v8RaZpBkILz9xeh3FJCK75er9uQ54jTydRDjNBMUj2c9Knds+dsObcg51KAQ37YuMmwqpLAoceYxzcRSMkhFLlPEKuZ3K68TFehmrGtWkCy20BoTWEAv2jd7/tCzsRUunQPNhuXYtdLL9LEVX0NusJtkrQZOAY3rHDJUTbjgrSxVeWCoILD/nLk9durchPzy+BrLl3MYCZ8OxjbOjVtCeeuKSubAmuBCZO3isOKZKAxtjyb2Mh8SFCduLN0YPZyxo1LUrjgsXacfZlP9KjSqGEoZ4K+sj+X8DiELt5brgetHSnRMSpnlQN5OJrTsApg114ZzbrDc+S8fmldPmz9usIcSX5bAgkC3sB7PwaRIZEw/zKiRWKD0NY4gg3IKw+Og/4l5A60uN3he3jm7x3FlnZsZblX+XQ7HDvDRycR70fND2h4rm0vekAxOWjtW9j3Dw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(61400799027)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YKSxk3tPIBZdsMpIrGhr80jdUvYZpB/5xn+XpvOTCl6o4xHh68ZzJB5wTjbVoPEHt0fWN/tg/mUiguGcjRqyKEx0hDLs3qGFJBRTWILRxYr1DOCETHms1pONMr++GM4CK+plkb1TeWFWjviGtUONNZ83XaQ+h18ZYkkSi2QdnVAr0rukQpYXU4zVq3qKbbtT1AS/dZ7Qh3H2A6u3CsIAd3n1Vkb3Cpp1Op1J8TnyooeHMh19APEK0JUrKt197w4ihQdC1oHR6BuNpbDGFxY2WqRAHqI7GtGhDgXenxLuwUo3QDRrgKGz6P+Mz8VPs1JN8hijXi6V/HqzaeDn8b0x9C2KqY4WANFVEojI49zr0hpc0DAApXyH6H6up5p3Hkvdc1KHDWj0udIUQd5DdwKzSViHq7YE9FpPU5u1B/HJlKJlenOdMG0BAKZdWJ+bA1UD
X-Exchange-RoutingPolicyChecked:
	a+le5t+9dY9V5QIaKSWL7Dn/ZIppSWWEhmDCCLCYHdFffUyKPOaE0b29KsgyWnhv84V7XaFo1GUTms++V8JFZAaTfrBLFN1U6aAac8oKpEFyyer7gvQ5fLR56k02f5YfM67qabkmgb5Z22KJ5k/OOA0648GdAZ1l35PEyRHMusq4c7NcH7HRdJRHFWgi6+MRrz4XGHe7wNzdNoYvO2YUyafbAmJojAdkNNZaODHDK8zpZrSp4gh21N+Y4z01SNvm2UcERIijB8DItQHZSMYIksj1NEDpsM7iriED2JZwvOy5RPMLGBmF3uFThy2quk5zWVQwUD8ySfC3zGMPLVHzlA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:28:50.2341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2987fa-38bf-4590-34f4-08de7b951161
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9011
X-Proofpoint-GUID: sEZhpDgCUcW_HL5yozvmbgO4swNR641x
X-Proofpoint-ORIG-GUID: sEZhpDgCUcW_HL5yozvmbgO4swNR641x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NyBTYWx0ZWRfX6WrpdzDcE9iE
 3npLLjIwYG5pnqLMntFbb63IvrldglvUmize/517iQd/HBndvzZdQfcCzY2fmGd9uDtlwmi/ekH
 BXq5EZNbpIYJVeyKKCUVQYybBSU+QoEnqStcOfEJg0zx6EN8OZ9NT+81zp5J5wqqaGatDNQwb5y
 gIS8xYSjrbwsmGfn+pXvOQIh9DMZV7nEBH6X+elgOw19N47AY5FDbMWeXzdFEoR7Fjhg+sa90yo
 3pDLvuhPmbjbqaKsPTyGLzdcr4KcHy6x9sCgwj+a7epjAKKiafJJIXIZOiQZQyP/IRn2A8NehOP
 OZeris7vvcYiXz6Ep8Z+f+qTX/hmWVHS7khfytFTrMKpOWmC/53bn+P5MzKZ7ofP+wcPefjdBM8
 RE9wVEUN4OBoLKTrXhHhpoowpU8uMhjaRvATzSdwRDZtgxJSe2dlpPWzDTvi1JjXr3KvyZNOtbi
 BKoXXdWpEOAFW4f3iaQ==
X-Authority-Analysis: v=2.4 cv=IIwPywvG c=1 sm=1 tr=0 ts=69aaf2b6 cx=c_pps
 a=nfcSLRJB1gi4FwH/l32d9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=tJGs-QWwAZckUbUC11UA:9
X-Proofpoint-Spam-Reason: safe

Add codec_info for a new variant of CS42L43. It can resue existing info
but needs a new part_id.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
No changes in v2, v3, v4, v5
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

