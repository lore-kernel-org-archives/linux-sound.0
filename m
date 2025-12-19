Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06131B819;
	Fri, 19 Dec 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139352; cv=fail; b=WjoBcjGdzn6xfgJrrm+HI5nkzx2lNhqU0xi5ahmZbyiXJmiJipVrdT9aZXBmWHsjpbqavOF0LOlSPWbG45hYVwRshiR709rL4Eq42ee/t07O34AvRmqkTi0HlMLKuCMRVvq6hhkYnI646y/D8SwOs4QGudD+T9Ip1xSAHHadWN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139352; c=relaxed/simple;
	bh=IAYi63zig7zcTKEIlM/fKrqbv0OMPMK+dB1E+y/jZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLZ+oYB+4pw4YytBe1N8R2LgWrPciLRzuLBPTPafsEcf9yYRQxOGxuJ8wia/ZsrfQaIyeOUIPQ+8F7wVNha8eHCkzoonr3JEDzeM5cW7OiDiBYLYHVM6ZOEBrT2jLbPSZWshjG+zTaDuflu7JPsGx7lJv6mHAZ8tr4YefEf83Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pv58FtWg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uLIxyo2s; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pv58FtWg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uLIxyo2s"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ8LSb01649602;
	Fri, 19 Dec 2025 04:03:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nlZDZruxIJ61DKv9tQW0pLq69kUhecYY9mM7SNVSgpg=; b=
	Pv58FtWgNVrjWYOieV3icd4OCIE9KlNzTsRPn5hy9h19aEd26j5K5/tbrrxnZyyM
	m77O5fUBQrRide4YOySEXVx+jFR0O90GjYACwZoAne+4evHxZ5oJr8aARKA+lbuQ
	iwh5MJHlURGqRUUUV424qwX5rlhgZQUXsExjppV0ygonXVT2htQ3iCNwVYVfdunF
	7m2IpEPh2wMo1AYD4ulsggOdOS05fbaI27vo+cXwTJsR5G7uWBuQHqZ6RDkP3VBC
	2Q7/KdzqTZhzzBBMzITtnop1dlnIFAAXgYFvvFf2M1xzWPr6/KZbTXRcGlLFxvk0
	StMIc7JjdnmVs1LbFlRUug==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022138.outbound.protection.outlook.com [40.93.195.138])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b4r40gp3k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 04:03:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCrnngqhy5Tz5M5yx+P6advuYoIAteAoZ8ix90A5sKXCe3Kras/gEavpvLqWObmrlPxXXk1xGikS0Xi51pA9UGLHxQNAxlgG5dv9MaKd/P5mU0TwEhbJ4hxr7jN62ro++iYflKiIdMO5EFzPseeLF+/LUJe352DP6PUsGGR0k2MAOOSb+jfgFonYBSzLvpeq/FScHbfzUdZvcSBzLyriX5LbcyRjCeNLY9n2peyX3uRzJa7B1IYzToJ247sQk7Ze07CzTlgT+Z7mGW/HGCsbHgF1xVnZ2dCU0vbwfUWK97rhHVHFT8tNgKFO1Xr1zU98BesynYw+1yZG3+RqrZ5jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlZDZruxIJ61DKv9tQW0pLq69kUhecYY9mM7SNVSgpg=;
 b=vI8qr9RFGRqVHOQRD4lSrKYL5A6tgSmnkk6cBGDU/3Nr0bkGOijcnqE68wbblpi0eNLMRur+uu25MYQBTBd48YV1kvdB9nLxrD1+nOEyl0yfPnSnTHFZ8NacCejrk5v3ddnOkII01HxdRQjZLvke/f26vJSZJyXKUMj3QJw2F1phGV+2V+eHM/9SKws1JXYdixS0ue6P3NgSQGXsW83Vyh25TUgUc8RRG1loVWMoxTHjWAECOA8RBE6Bb4PhurpKbVe/Bc0F4qAajgXPxMp6MPnX/+BWO2tspyKjhAjevo5mbNec9kQ7pStRg8EqGBQ8rvP/7+4jqeswM/Ohu1LVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlZDZruxIJ61DKv9tQW0pLq69kUhecYY9mM7SNVSgpg=;
 b=uLIxyo2sTZM6ZsmxK8Yhdtxxf2lJg7F/jp9En0C/MXXdjYEvfZ20rWXz4kC89sqrZqA9rUbINskbFia0Gfh1wOH0mJd+aCMRwHWg/otHDPk0W2mjKAWzn7o3iUKGR8XJuWW2fXw5KiPwMjwFFe5N7o10tKdqMO56ib3cf2Cvl8g=
Received: from CH2PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:59::13)
 by PH7PR19MB6876.namprd19.prod.outlook.com (2603:10b6:510:1ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 10:03:02 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::1) by CH2PR03CA0003.outlook.office365.com
 (2603:10b6:610:59::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 10:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 10:03:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 12CCC406542;
	Fri, 19 Dec 2025 10:03:00 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D4D5E820259;
	Fri, 19 Dec 2025 10:02:59 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 2/3] mfd: cs42l43: Add support for the B variant
Date: Fri, 19 Dec 2025 10:01:54 +0000
Message-ID: <20251219100235.1247053-3-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
References: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|PH7PR19MB6876:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4535647c-1218-4f06-9420-08de3ee5cb55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EQ/4n+3OcF6QRHwCY8AhiyP4IV9rfenOFmYPDPa3Mo0owfP343ShjH373gQ1?=
 =?us-ascii?Q?MrP+eamcx8gjmRXBJ5g8d/Uf2XZgZKjr1A5M1Q1sgUFY1SGPGAsERho4qAWB?=
 =?us-ascii?Q?eEOV1pjWspM/SIOiPoXGnTqlBmSQyhBnDupmpRp12pCPuqZ5rUdbR3JxZziE?=
 =?us-ascii?Q?FimCV2D1rofy4xIcctdoVZBF6OivYi4joj22j2iS/R7uYrHK13dmkF6OazgN?=
 =?us-ascii?Q?lnmJ5zqzWQuwJlNDlr9g34Fq46ythW3gBOFJrk0caXRxGtobpWJyBGMCJFaY?=
 =?us-ascii?Q?gPc1lgL1hcHT08MhqNqxOvb8LiKnPKO+cV33GKzgNfxhMRjnce6iN77BSJrp?=
 =?us-ascii?Q?zPROdngGwHsHhqgU6OMC8h+zNFAndGX1QGfQi8gurAKZt0OYGC1bB4wShqZc?=
 =?us-ascii?Q?gvHpMG67iJaWkzs/Fnr2EyBt8ig/r4taQezwaVDYYIWeqPEFJJnFR7BII4li?=
 =?us-ascii?Q?DAbykMRzSqZEKZzviW4hozSOvmRBn+udZn8ayjMQD4bJREmqS18927pKCFFA?=
 =?us-ascii?Q?8Oe8yMjgtyODseemYO86a/YeedkwHL2Cl5DVzThZcZZUcRiG0ITMZRNIy7NQ?=
 =?us-ascii?Q?d7QPqB2nJakJjRue32dKL1GqQGaQYw2T3MYxOoOZ+0/vN1IQehKZzocH4iLQ?=
 =?us-ascii?Q?/LnhkGrIa6J+Tt9TJiToZwDcLlHm3KNFcNSloLhSV++d4K4O2gbxd9tBPdal?=
 =?us-ascii?Q?QdLSGS57jxQc8REfUejk+rgvHEJahz1cENA1N3BI5gYkGqc6NClRdC99roxn?=
 =?us-ascii?Q?N0VZrFyDfGLkSYIZjUl3hc6k6piSJ8zq1FEvNYyiP7Mc3T3+NqoJy5zg23td?=
 =?us-ascii?Q?r3Ve97FXzu85FUO41YSGRf2oO4aUqnh7c17I62HWWwVVJLxB+/SGsQwGYbdD?=
 =?us-ascii?Q?gp5tCkRjm8+SFemgaYh8z65m8AQw8qy29/huODskKlZPQntBspw+ktgUQB9W?=
 =?us-ascii?Q?/RQvRO05VOQwWoCq6V41RRw7HbVJqgvXCUjKOTLr/9NmOTae8zDLYIVhhf3k?=
 =?us-ascii?Q?Lq0OfhBrE4dy0EazJvwP0LBQYOMccAyZEuvE9TW60gXQf/iFHCxtjXRF9fFz?=
 =?us-ascii?Q?sRL6JONVlSmTr4aIxWRghY0WTWLlTx46N0pF/9WSO6aY+BZ9izinfgv9R3fX?=
 =?us-ascii?Q?mk0gq7XwaDtUWkHMRbOrwxEPw9j6kK52jBJtRdBHJRroxq4HDDSG3CeE5o70?=
 =?us-ascii?Q?Deh6CrmzdyyK5wh4so2rNUn+GUMNOt093q2dDsxhxddWjwMCt9ykRaAR2U1S?=
 =?us-ascii?Q?ceZHDL+I3d66cFiQjn4VRIGci0sGp0z1DLSY8rlwKhJRRX2x74bNf/3fYVmd?=
 =?us-ascii?Q?sCTavBYiyQBl8ciqW7eciJqaPcIDzb0xsrbtQSvx9+Q/rD+tCGJPkEokgTF6?=
 =?us-ascii?Q?1zkcK8n0ZVvyPTt06z+AxFyLPdRK1C6A1QXEMbTjhmjh9ihBe2PP4LCU7lJB?=
 =?us-ascii?Q?tDFhPpS/ooTf+dnBhNJnNYuWHp5yc9VSxd9PcWFdIjniKWjclWUg+pR6HoBH?=
 =?us-ascii?Q?VXq2HdKFq8HbhfBLanD3ThiVbuwoRuPTUwXuHK3SKSQuFIeinhuY1jxcD+5u?=
 =?us-ascii?Q?6TauXf5/ON6/DnrUKI4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 10:03:01.0329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4535647c-1218-4f06-9420-08de3ee5cb55
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6876
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX1GdZ/dP9QGW7
 zvNC3E3+WBDfidzXA+Ftgf12P/dWTrqBzyS054/7bOamilbQSN8Dt/EB8eDvVLEvowxZjZaSGdT
 9BA+wgVx7pPyx7HMuAazRY0H7/x0S/BKSl0fB/DrdiwOYa6a/AyP2hSlRMXuizTAdqv2phjmF2P
 la4IZwkbNJ4E1MiHAMCRsu+aXDxCt34KIjt12v20eUEI6meBa9CFgqeY0dxwunGLHQuLPQS/HsS
 7Y0BHVPNii2S0y+SUzKGkNXX23OOfrApQA4ceZ9xmnHAV4Jybih8T3W8UAL65U48ISNIuzgEJhR
 gowKX5fXXLqdaBS72Yh0s0pk3QefBUtKA7NYBfbh+HnrBaEw/NJXDS2ugL5FbGj7CZKxgRHg9QH
 zaKTJReMWoyUn5HvFONyxpwjuJ+6mTp5RIimiblkULm5dKywfy6YWMfAPcQmiIGyNaRJ9VekR4i
 5bHMwsHfX8OWTCqIdKA==
X-Authority-Analysis: v=2.4 cv=K7Mv3iWI c=1 sm=1 tr=0 ts=694522db cx=c_pps
 a=ZVJWEtTsqHd5Y1/ROadkLg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=PQrJEabezKl9mVMsQngA:9
X-Proofpoint-GUID: ux9Udbd_9JEAUfhm1YywwmjySOQ3Elrj
X-Proofpoint-ORIG-GUID: ux9Udbd_9JEAUfhm1YywwmjySOQ3Elrj
X-Proofpoint-Spam-Reason: safe

Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
the same driver.

Changes in CS42L43 driver specific for CS42L43B:
- Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
- Decimators 3 and 4 are connected to PDM1
- Added Decimator 5 and 6 for PDM2
- Supports SoundWire Clock Gearing
- Updated ROM requiring no patching
- Reduced RAM space
- Each ISRC has 4 decimators now

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-sdw.c        |  2 +
 drivers/mfd/cs42l43.c            | 70 ++++++++++++++++++++++++-----
 drivers/mfd/cs42l43.h            |  2 +-
 include/linux/mfd/cs42l43-regs.h | 76 ++++++++++++++++++++++++++++++++
 include/linux/mfd/cs42l43.h      |  1 +
 5 files changed, 138 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 023f7e1a30f8c..c09713fa2a218 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -178,6 +178,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 
 	cs42l43->dev = dev;
 	cs42l43->sdw = sdw;
+	cs42l43->is_b_variant = !!id->driver_data;
 
 	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -189,6 +190,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 
 static const struct sdw_device_id cs42l43_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4243, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, 1),
 	{}
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 107cfb983fec4..38a4d46cc9680 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -115,9 +115,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_DECIM_HPF_WNF_CTRL2,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL3,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL4,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL5,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL6,			0x00000001 },
 	{ CS42L43_DMIC_PDM_CTRL,			0x00000000 },
 	{ CS42L43_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
 	{ CS42L43_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH5_CH6,		0x20122012 },
 	{ CS42L43_INTP_VOLUME_CTRL1,			0x00000180 },
 	{ CS42L43_INTP_VOLUME_CTRL2,			0x00000180 },
 	{ CS42L43_AMP1_2_VOL_RAMP,			0x00000022 },
@@ -155,8 +160,12 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH4_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH4_INPUT,			0x00000000 },
 	{ CS42L43_ASRC_INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT3_INPUT1,			0x00000000 },
@@ -169,10 +178,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ISRC1INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
@@ -269,6 +282,8 @@ EXPORT_SYMBOL_NS_GPL(cs42l43_reg_default, "MFD_CS42L43");
 
 bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 {
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CS42L43_DEVID:
 	case CS42L43_REVID:
@@ -292,7 +307,6 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_ADC_B_CTRL1 ...  CS42L43_ADC_B_CTRL2:
 	case CS42L43_DECIM_HPF_WNF_CTRL1 ... CS42L43_DECIM_HPF_WNF_CTRL4:
 	case CS42L43_DMIC_PDM_CTRL:
-	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
 	case CS42L43_INTP_VOLUME_CTRL1 ... CS42L43_INTP_VOLUME_CTRL2:
 	case CS42L43_AMP1_2_VOL_RAMP:
 	case CS42L43_ASP_CTRL:
@@ -387,8 +401,16 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_BOOT_CONTROL:
 	case CS42L43_BLOCK_EN:
 	case CS42L43_SHUTTER_CONTROL:
-	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
+	case CS42L43B_MCU_SW_REV ... CS42L43B_MCU_RAM_MAX:
 		return true;
+	case CS42L43_MCU_SW_REV ... CS42L43B_MCU_SW_REV - 1:
+	case CS42L43B_MCU_RAM_MAX + 1 ... CS42L43_MCU_RAM_MAX:
+	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
+		return !cs42l43->is_b_variant;
+	case CS42L43B_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43B_DECIM_HPF_WNF_CTRL6:
+	case CS42L43B_SWIRE_DP3_CH3_INPUT ... CS42L43B_SWIRE_DP4_CH4_INPUT:
+	case CS42L43B_ISRC1DEC3_INPUT1 ... CS42L43B_ISRC2DEC4_INPUT1:
+		return cs42l43->is_b_variant;
 	default:
 		return false;
 	}
@@ -597,15 +619,22 @@ static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
 {
 	unsigned int need_reg = CS42L43_NEED_CONFIGS;
+	unsigned int boot_reg;
 	unsigned int val;
 	int ret;
 
-	if (shadow)
-		need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+	if (cs42l43->is_b_variant) {
+		need_reg = CS42L43B_NEED_CONFIGS;
+		boot_reg = CS42L43B_BOOT_STATUS;
+	} else {
+		if (shadow)
+			need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+		boot_reg = CS42L43_BOOT_STATUS;
+	}
 
 	regmap_write(cs42l43->regmap, need_reg, 0);
 
-	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
+	ret = regmap_read_poll_timeout(cs42l43->regmap, boot_reg,
 				       val, (val == CS42L43_MCU_BOOT_STAGE3),
 				       CS42L43_MCU_POLL_US, CS42L43_MCU_CMD_TIMEOUT_US);
 	if (ret) {
@@ -644,13 +673,20 @@ static int cs42l43_mcu_stage_3_2(struct cs42l43 *cs42l43)
  */
 static int cs42l43_mcu_disable(struct cs42l43 *cs42l43)
 {
-	unsigned int val;
+	unsigned int val, cfg_reg, ctrl_reg;
 	int ret;
 
-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG,
-		     CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION,
-		     CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+	if (cs42l43->is_b_variant) {
+		cfg_reg = CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+	} else {
+		cfg_reg = CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+	}
+
+	regmap_write(cs42l43->regmap, cfg_reg, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
+	regmap_write(cs42l43->regmap, ctrl_reg, CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, CS42L43_CONTROL_IND_MASK);
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, 0);
 
@@ -740,18 +776,27 @@ static int cs42l43_mcu_update_step(struct cs42l43 *cs42l43)
 {
 	unsigned int mcu_rev, bios_rev, boot_status, secure_cfg;
 	bool patched, shadow;
+	int boot_status_reg, mcu_sw_rev_reg;
 	int ret;
 
+	if (cs42l43->is_b_variant) {
+		boot_status_reg = CS42L43B_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43B_MCU_SW_REV;
+	} else {
+		boot_status_reg = CS42L43_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43_MCU_SW_REV;
+	}
+
 	/* Clear any stale software interrupt bits. */
 	regmap_read(cs42l43->regmap, CS42L43_SOFT_INT, &mcu_rev);
 
-	ret = regmap_read(cs42l43->regmap, CS42L43_BOOT_STATUS, &boot_status);
+	ret = regmap_read(cs42l43->regmap, boot_status_reg, &boot_status);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read boot status: %d\n", ret);
 		return ret;
 	}
 
-	ret = regmap_read(cs42l43->regmap, CS42L43_MCU_SW_REV, &mcu_rev);
+	ret = regmap_read(cs42l43->regmap, mcu_sw_rev_reg, &mcu_rev);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read firmware revision: %d\n", ret);
 		return ret;
@@ -918,6 +963,7 @@ static void cs42l43_boot_work(struct work_struct *work)
 
 	switch (devid) {
 	case CS42L43_DEVID_VAL:
+	case CS42L43B_DEVID_VAL:
 		break;
 	default:
 		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index f3da783930f53..a0068f6572e2c 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -9,7 +9,7 @@
 #ifndef CS42L43_CORE_INT_H
 #define CS42L43_CORE_INT_H
 
-#define CS42L43_N_DEFAULTS 176
+#define CS42L43_N_DEFAULTS 189
 
 struct dev_pm_ops;
 struct device;
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index c39a49269cb7d..68831f113589d 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1181,4 +1181,80 @@
 /* CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG */
 #define CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL		0xF05AA50F
 
+/* CS42L43B VARIANT REGISTERS */
+#define CS42L43B_DEVID_VAL					0x0042A43B
+
+#define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
+#define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
+
+#define CS42L43B_DECIM_VOL_CTRL_CH5_CH6				0x00008290
+#define CS42L43B_DECIM_VOL_CTRL_UPDATE				0x0000829C
+
+#define CS42L43B_DECIM_HPF_WNF_CTRL5				0x000082A0
+#define CS42L43B_DECIM_HPF_WNF_CTRL6				0x000082A4
+
+#define CS42L43B_SWIRE_DP3_CH3_INPUT				0x0000C320
+#define CS42L43B_SWIRE_DP3_CH4_INPUT				0x0000C330
+#define CS42L43B_SWIRE_DP4_CH3_INPUT				0x0000C340
+#define CS42L43B_SWIRE_DP4_CH4_INPUT				0x0000C350
+
+#define CS42L43B_ISRC1DEC3_INPUT1				0x0000C780
+#define CS42L43B_ISRC1DEC4_INPUT1				0x0000C790
+#define CS42L43B_ISRC2DEC3_INPUT1				0x0000C7A0
+#define CS42L43B_ISRC2DEC4_INPUT1				0x0000C7B0
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_SW_REV					0x00117314
+#define CS42L43B_PATCH_START_ADDR				0x00117318
+#define CS42L43B_CONFIG_SELECTION				0x0011731C
+#define CS42L43B_NEED_CONFIGS					0x00117320
+#define CS42L43B_BOOT_STATUS					0x00117330
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_RAM_MAX					0x00117FFF
+
+/* CS42L43B_DECIM_DECIM_VOL_CTRL_CH5_CH6 */
+#define CS42L43B_DECIM6_MUTE_MASK				0x80000000
+#define CS42L43B_DECIM6_MUTE_SHIFT				31
+#define CS42L43B_DECIM6_VOL_MASK				0x3FC00000
+#define CS42L43B_DECIM6_VOL_SHIFT				22
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK		0x00380000
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT		19
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_MASK		0x00070000
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT		16
+#define CS42L43B_DECIM5_MUTE_MASK				0x00008000
+#define CS42L43B_DECIM5_MUTE_SHIFT				15
+#define CS42L43B_DECIM5_VOL_MASK				0x00003FC0
+#define CS42L43B_DECIM5_VOL_SHIFT				6
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK		0x00000038
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT		3
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_MASK		0x00000007
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT		0
+
+/* CS42L43B_DECIM_VOL_CTRL_UPDATE */
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_MASK			0x00000800
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_SHIFT			11
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_MASK			0x00000100
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_SHIFT			8
+#define CS42L43B_DECIM4_VOL_UPDATE_MASK				0x00000020
+#define CS42L43B_DECIM4_VOL_UPDATE_SHIFT			5
+
+/* CS42L43_ISRC1_CTRL..CS42L43_ISRC2_CTRL */
+#define CS42L43B_ISRC_DEC4_EN_MASK				0x00000008
+#define CS42L43B_ISRC_DEC4_EN_SHIFT				3
+#define CS42L43B_ISRC_DEC4_EN_WIDTH				1
+#define CS42L43B_ISRC_DEC3_EN_MASK				0x00000004
+#define CS42L43B_ISRC_DEC3_EN_SHIFT				2
+#define CS42L43B_ISRC_DEC3_EN_WIDTH				1
+
 #endif /* CS42L43_CORE_REGS_H */
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index 2239d8585e785..78af989feca48 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -98,6 +98,7 @@ struct cs42l43 {
 	bool sdw_pll_active;
 	bool attached;
 	bool hw_lock;
+	bool is_b_variant;
 };
 
 #endif /* CS42L43_CORE_EXT_H */
-- 
2.47.3

