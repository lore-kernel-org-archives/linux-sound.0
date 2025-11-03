Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36553148BE
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182531; cv=fail; b=J7QgxgS3Bn1f6rU5/N2aEo7kbzrlT+fhgb4EJUGS0oer8ZoYSpm4xd9VakDEUPnh1Lbh1n5N3HwDxpDAK6SWLHa6puORkLm8cK6bbVxVMJ96CFtKoUCOnIp9qHao7u/ptDKGjCLnmfC3FnI+3+1yaIteFIf5Kpa6CQPfBuOoJtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182531; c=relaxed/simple;
	bh=pvRTo/btAS5oeC61OX0y7X04Gmw6UG4RKuHQoE6b/To=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DhrGFjzQ3/ZzV68cJfSUv4cqda0VaVu05F9cwrbHXdswx8ye4tQV17S5VgOCKyRajbLDoE45p+CUvU4dmxNVIDmhy1DttCdi80rPkvlrqRSDR3qYH6V3/8hQaPHLniDOYmL3PfS3kQati89IogihYLfUes57DAL3F4ZWbnp1Acw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NVsEVnUD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=feK6N+rJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NVsEVnUD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="feK6N+rJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A34R0aM2395635;
	Mon, 3 Nov 2025 09:08:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=moMjbAITjMWh5BCLj4/S4Bwg+ZAmoZOkMvJGXK0ORlY=; b=
	NVsEVnUDLLyHmWwTRHUQmaIQEa1g798d+WX1bsQNVopOKen/TMxePiQVOSgnAga6
	CBYuEgmOHsHDCSrHDQ3d4+vTCPn3T+tyozapzze4KWR555pp/drnhOYb4RP8HX9d
	RtiuS2a3WLcf1TlII+uyuGjBGaujxV69M8KM9kX1noigiZE5xu8aA4TGCW30cYRs
	wZvUOaacHYjWAlcLFs4Tp6hM1SGHeMAVGWgFA7ctHYqcs6nPR1nDgRqmh2Dk8duB
	56vxSzIMY+de/8es3oQfpx45ayvTRXxB/QoGgu6CDZOnQcLfXYAEVR4GUPsmEnX9
	tDXW3SPgbNdkEj1kWt6GSg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023120.outbound.protection.outlook.com [40.107.201.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a5fkwt69y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hq7eNX3VIE/d1/SSnHv4i8ORdqvx2W6zRh1dpFC5j1sddcU6PXEW5iYkN/lp4LRhfBvqrjeMva34EMPY2N3q4N8bpuuEq8YJkgT9zAu/D49T5+TqXEr1Ycvom6lxFYA11LMcXYYhm1AzKY9EZFRyDGs6vOnyRXZv8LdmieeoiBuaX1wb0+qhYmmDrL0qsy952kTJnvoIoBv/KSx+edLf3QULUTW5jPj0kHsWzqtYvxl/nFlcacpkDFDC04EtU2cf2De9jslvaW54es6sJC2/C2jaUx1wA0R8fuW9xFiNsvnfF7V4pT/qMhvHVujQOkz1Y3grYTSHWUoge7zmJ11ghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moMjbAITjMWh5BCLj4/S4Bwg+ZAmoZOkMvJGXK0ORlY=;
 b=r8NoHpy4dHHowYP4Rt3ISV6mIcdmzp1bZ6Wi/IC4nnf7DDsgfucfaVTCRtZZkTSL3cz+pIHNneClH9H/MxtCZwspA+4fSAtwGwSvMcDdk98mT7TX0KVzIlUGKNW53ghb/Qc2cThPggOW8T2T5oVM9TL0u0/QWSIEgRzQVya1GpMCOgKXLAXDmlm1Uwp2RH4wk0XXZOb2uJgUsglyJupDkG27HzK3VntpmKvz562D6XqILjqwQFhrGASxR99aqt6aYcfjh0H1PFiVmAUbLVx6uUi27oDlOaS8Popeq/CjgICU4pBqyNakfgHfKwHQgKEpcOlttlc2n8IoeFBdA5Au2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moMjbAITjMWh5BCLj4/S4Bwg+ZAmoZOkMvJGXK0ORlY=;
 b=feK6N+rJggd2Vx7NSxrjy6hBKAtwmgIoVJYKR51WSAaUgzEP0s6KYTJdn/lPstLmWOo2wRUA7k4OTPZkQVZc04mJJG0uMzKEa4rV+/RfaOWMmbHsn8a0XfDN6/6VNbdgcjY6IWUrCJH+A0qsFvwODtHtfchM3+zc7knyoxfoYq8=
Received: from BY3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:254::34)
 by DS4PR19MB9074.namprd19.prod.outlook.com (2603:10b6:8:2a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:08:21 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::c0) by BY3PR05CA0029.outlook.office365.com
 (2603:10b6:a03:254::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 15:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.0
 via Frontend Transport; Mon, 3 Nov 2025 15:08:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 37000406565;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9C7C6820258;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 07/13] ASoC: SDCA: Use helper macros for control identification
Date: Mon,  3 Nov 2025 15:08:02 +0000
Message-ID: <20251103150808.4015208-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|DS4PR19MB9074:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2077dfe9-f767-4ae5-96b3-08de1aead36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NPR6tr+uFUg9SOO91VLWsj9Xb25s8KR1MVRMvilL7OrKk2dvhIXS1sBx3SN9?=
 =?us-ascii?Q?qQItbs8+LaY5JraZHSaDOVTUBTe/gtCKFpkEReStQV3Ba+4t2OOdV3vHU5lX?=
 =?us-ascii?Q?t8/3b1vMHRRIfkb4Otnfx8xe+PgvNbvblKLDZB/KJt0Xhn+Q9mv1o0kY1l1M?=
 =?us-ascii?Q?d9m5TzeNHAzAyoiYNt/EBrELpnfhv3+hgSPUMnitXOox0mMqN/xlqmq+Yo/k?=
 =?us-ascii?Q?CYiW9vj7gTc2G0gpDCu4DrUH+6S/0rvhoHJ1skYyT7Aa+1ksU7u8tFrPQjBH?=
 =?us-ascii?Q?HHTii/UEiu3FFt4h6+GMfdofQwWHBxJd2p1BFUwIGin5j74E7Tf2vMJwi44o?=
 =?us-ascii?Q?KfsOpTsGBVEJ09AVMKV2V9sxLWNvqB/wQfrpgwmp/5GAPqN0e3L2DVgxogqW?=
 =?us-ascii?Q?9ZkTdaTmakIJZUhTfMpVpsdZK4QGKE12PahRS/w23NDX+9P27150y+PKaui3?=
 =?us-ascii?Q?ktcyGhGBO2r6sxwk+8N1q9xiWNWJBLA/zQEQuhGC6PopNXOS+hpBfaclpnJa?=
 =?us-ascii?Q?QuJKm3BmuLZcFUV5OEiw4JN6bXbYnx2ETPo9RBto51D2SDxlAxJ/cqqGENne?=
 =?us-ascii?Q?QelapKwhJ1g+Bv0ezpwAVtPcA+MUMJbYHnAoN7vEPg7rYYXJJGgnbyWhNKUv?=
 =?us-ascii?Q?KUgSyARdrvRPyR33p93XLB89Pg6B6Kb+2Jwy3EvVSdO47xgW3g/gTiXClx8W?=
 =?us-ascii?Q?wqC45xrU2mHOLfTuSy2fvhif2bFHinJuZm3OfV18qbcXBS1aWZ7aFrrOTnzL?=
 =?us-ascii?Q?UIUcqPE5SV8MY7EBUthcJc2v1b6AiAyG4X0sLjrna8zy9Jd8bRYKYmRgRMQT?=
 =?us-ascii?Q?rEBsjBOEjdmbqXDcCXC00XiHWtlf8OYB4mqoyZfSUCDzRnEh0YvoRZz/NyRt?=
 =?us-ascii?Q?TQcSLuxJTrfZ0ivQT8sgji10KVi75ipDXmGnua3mJK5sMuS8zlPMChpnUcvU?=
 =?us-ascii?Q?Nqycze6AZKXrGrkt/jHFGO/fj2zpWxNSqoOBY+YSYxjbB7PN50enRQUyLmHl?=
 =?us-ascii?Q?loo87QhLQ3AgzNyF0nBBno3GZfaithF7nyY6PfhS2j3hbF1lPEjeNbkwhrJv?=
 =?us-ascii?Q?tai/Rem+vvo43QD9U+ruAEJAakcYetHydzQ39NpXDqK+3aWR6/kEsBZ6TOe6?=
 =?us-ascii?Q?HRANYT7K3SVOkaZlXKd7KdphnYvOp+CHoYMtIbk8b/Y4Ka3Y7C4F5ddeK5fC?=
 =?us-ascii?Q?tIiWwzbRkNjtmbtq85nSRRia56nHYuHU1OfE3U8iBmtgAeVKW2MbZ8E4GUp+?=
 =?us-ascii?Q?Ac+NdQH+KjbsvsTrFzoMf9bij4ujGhW3qqJSqIT3ZfFPeORpxvSzmWm9wC3H?=
 =?us-ascii?Q?dhZfq92vmwD79ClCm6GxEM9PFXfj6VEH0B9lK5UFqK2y339np7U3X8HScA6+?=
 =?us-ascii?Q?elCMmejuPnJ3a+egby5XnX/1zG8aNYayPG6LuK+sTMQ8P3Vr2wnU9T3jCIIQ?=
 =?us-ascii?Q?fLcfgxa+uCd9wI8HkZp3aynGCLgT+JogZdyLL+Za8Eld0Z8J2J/cKXMPuGpg?=
 =?us-ascii?Q?+OuIPBzASZS/fGTb6AJo87nse9SFRE6TIet7Lt8eO+OzicgZBq+n3HqetrLf?=
 =?us-ascii?Q?w4Uyqfwn4vIaqliKHxA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:20.1813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2077dfe9-f767-4ae5-96b3-08de1aead36f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9074
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=6908c56c cx=c_pps
 a=l4k2vjVpr9fnFs3jNJfJ4g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=nQC4CdCC1Wy_cx0jZ8cA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: spqWgeaBr66ivsuha7oEZQ0JYvt4LOhu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX4uzdXppDzOVa
 wBNBM8XdMkUKhov/olUrmAA5x8ZTygaDY+pbvjvVbdvajGGMRaHrT5vhRUdMle3APQHl51v3nqr
 nZoZ9XwFsRz5MqNZjO/OT1WEfvdNc6Hz0UnxxgIrEMHZO/kpp0mYRt+Cle0olnfX3Hb37plC3zC
 7N2/FhA0DtLM8gfEpI1iPpn8c2vJuNWAnITxrpEzxJteLKt5ytL8fcIrvENUdyJmqrynx6PwQ2s
 H7dnev7vkdhtr75ibu0qRensk1qNKsutadmvmEeOSjwgD4BBxndtxJQF3q1Q9uaUcdpGhmXJcdh
 oDRc6/Ev51Sn3UKojTU44550yKjG7mRrXsC0mutAbyGWpDg3Ciw4JZ9SXWS1yVpTQ4ss1WYXWxC
 fu/EOHScaLSP2iNE0ANacLkkTJBh4A==
X-Proofpoint-GUID: spqWgeaBr66ivsuha7oEZQ0JYvt4LOhu
X-Proofpoint-Spam-Reason: safe

We have the SDCA_CTL_TYPE helper macros, we should use them when
identifying specific controls to simplify the code a little.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_interrupts.c | 36 +++++++++++++-------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index a18ec9dd3398b..8f6a2adfb6fbe 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -456,11 +456,8 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 			else if (!interrupt)
 				continue;
 
-			switch (entity->type) {
-			case SDCA_ENTITY_TYPE_XU:
-				if (control->sel != SDCA_CTL_XU_FDL_CURRENTOWNER)
-					break;
-
+			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
 				ret = sdca_irq_data_populate(dev, regmap, NULL,
 							     function, entity,
 							     control, interrupt);
@@ -534,27 +531,22 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 			handler = base_handler;
 
-			switch (entity->type) {
-			case SDCA_ENTITY_TYPE_ENTITY_0:
-				if (control->sel == SDCA_CTL_ENTITY_0_FUNCTION_STATUS)
-					handler = function_status_handler;
+			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
+				handler = function_status_handler;
 				break;
-			case SDCA_ENTITY_TYPE_GE:
-				if (control->sel == SDCA_CTL_GE_DETECTED_MODE)
-					handler = detected_mode_handler;
+			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+				handler = detected_mode_handler;
 				break;
-			case SDCA_ENTITY_TYPE_XU:
-				if (control->sel == SDCA_CTL_XU_FDL_CURRENTOWNER) {
-					ret = sdca_fdl_alloc_state(interrupt);
-					if (ret)
-						return ret;
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+				ret = sdca_fdl_alloc_state(interrupt);
+				if (ret)
+					return ret;
 
-					handler = fdl_owner_handler;
-				}
+				handler = fdl_owner_handler;
 				break;
-			case SDCA_ENTITY_TYPE_HIDE:
-				if (control->sel == SDCA_CTL_HIDE_HIDTX_CURRENTOWNER)
-					handler = hid_handler;
+			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				handler = hid_handler;
 				break;
 			default:
 				break;
-- 
2.47.3

