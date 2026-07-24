Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B92441F5F9
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888789; cv=fail; b=bKSl1fRYGNH6FzDC+9+7EeTKGcJPhhCuCYwEEyFOTzwswBnVjY2wNXI8gUaEu2TpgASc15yUNeYZLK4vJ+hhjTS4pS2+8GQnxjmEAXLKRssr61LdgqdR3M296J+r18/ctw5GbyD6WeSrdYWK7VNmk4eB2jb/weIWm4aGmDChJiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888789; c=relaxed/simple;
	bh=9CuEDlfmZwlyNA4BmuRql342a3on312sAxLy9fV72/M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PDTy186h41ileCMV79X9Pk1Z4InHl6PBoIoS/BZ4rruteDZLHfPqDOjC81K+zL+krKeaxICksXaqmh32r12M8ld/a/hcaYQA69HHGBmS9xYSFmFQBfrMc4pksfU9V4HcFN6MPibURKkRCRlbhMuWsMNVOAXoO7UEyqJp1t0FlgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gFKnHUjf; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UsdBQd4W; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gFKnHUjf";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UsdBQd4W"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66OAF0EK820951;
	Fri, 24 Jul 2026 05:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ziOAbSnKDDo9D
	hACMQdsAbPAxMrn1SfCSFxooPrxD3o=; b=gFKnHUjfZ5UlxPd3liLNONzfXIPDt
	xMN7wNCF74SreYo9kwBXc9JmRE5uUxldfAdGmd3ertLLqKu7K0+3EnESjXuu+FIJ
	oOSjT6+QJverEulDH9m86BaXZO8j45R0NeIfbceicDeg3FeMzgOPWRfTEkP76TgN
	EisidCixc/TqBqNmPHgmYvfTAaY6HyI3tkFNhzYfO8n08ta1V4g1qID+Qem2V4ZL
	LbKwq0S3RmXqlSMvcEGaJbu18+HtY5/yt15eFEX6EX1HOUWiOZm3pCQVbBP9minW
	xNahuAriRqBFl3XcaS7kFy0iLYcl4XA902oWJlBevAcq28ghSNWy0AoHw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fm4vw0dh3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:25:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9EApjeQNtYDAVxLcoIPW4mDDeRVOTWaunemXIsxAYeOKAAzJyblyOnUyQRzttyZ+bLBj9esZrIZ9M5rH5HodoW4TXQHB2fGFB9YNpxxfnd7ZKAYSZ+/Yy1enodmlzsP++X/7G51ofsqQWKfJ3nfKabotMlfRzXr4gTNbeK6JeN8Lfx4eNB+8ZE2qkU27YuiIYcpL4swmgJqdK2cWQ196ESs8k0ZstGVeEP1Rp9ptMWevy2Ax3laR4Wecptnp5J5EY7ByDEI/SV46tfQatL9pnsd1P5UkUdHbA4OD5tqZD+2qiFr0SEoi+oJAyaCThTcoDTigYlyxChi7rLDDoY4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziOAbSnKDDo9DhACMQdsAbPAxMrn1SfCSFxooPrxD3o=;
 b=llMmdOMoUGOG5bEdT5TyhsXi3eHE/Trt8NilljsVG4M9TJh4RcuO+zo8rpzcl9bYqIOa1iGiBdeiMbh5nDDayzFZqy1iCodg8d1HQ9TVD+s8GQrxYqVd8ORfN41RIHGz08mtBYJsPEIhDtK1oIIdcsTiL5gaUCr6nCOAve+WWwn76bsE87C/l2jHS6b+0xwgsWsUjB5yfzmrV8mpFAzsl1UXuN+8dnYCx99ziBj47fUftZd1LK131pNjf1I9tjWHPYOI6jdkHEYUi5GXXdPoBBArGOzOwLK6o2nEW6/AHAfz34LeLqE/isC0sbLfItwYazR6DIFxCr++ExAFy4uvGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziOAbSnKDDo9DhACMQdsAbPAxMrn1SfCSFxooPrxD3o=;
 b=UsdBQd4Wvy6xjg69k9zEFXPBSQ1ifXVG8wCHpOdaryBMKOvNGthqPf7oLYUt6gVy2dlDxQ2Et+8JuJVKPeoVw7MhxuZOrxetxEVSVhW6wUtBi4qPA7qaX8qvjjLyWE8or3a+sB2b6tmN2PPE4as6pagRrglRAW7eMGoO2PhhoBE=
Received: from CH0PR13CA0046.namprd13.prod.outlook.com (2603:10b6:610:b2::21)
 by CH3PR10MB7861.namprd10.prod.outlook.com (2603:10b6:610:1bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:25:55 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::30) by CH0PR13CA0046.outlook.office365.com
 (2603:10b6:610:b2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Fri, 24
 Jul 2026 10:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:25:51 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:25:51 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:25:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:25:50 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.253])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OAPkO93024147;
	Fri, 24 Jul 2026 05:25:47 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <13916275206@139.com>, <perex@perex.cz>, <lgirdwood@gmail.com>,
        <linux-sound@vger.kernel.org>, <baojun.xu@ti.com>, <k-lu@ti.com>,
        "Shenghao
 Ding" <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Optimize calibration to avoid full device reboot after calibration
Date: Fri, 24 Jul 2026 18:25:43 +0800
Message-ID: <20260724102543.2067-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CH3PR10MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bc7eee-0f8d-4d98-3274-08dee96defaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Q8TzQAofut76FC1z+1qY3aCB4SpX0R8MsbrZ2J+pOU62o2LKVzzE8n11xBlHM/9hRw7goK2C/ZN+liRQ1EX0D12mwA/OjC3Z83cyleMxzvEOkjNyb9m2V1d02pziJgTJiuxXfGzWernfTkPwMruP4ZAcAz9YfNAa0VymeyDCvK2BNg/1kBL4bviDMDtWRkpWrEqFM6bBXL10JyIvXdPENujPEWGlZsYyjsauBxXaXqTo51g7RR/+SuWq0BBbHJHfRBLFkXNP5K4oOLa+4re0IQH57v7zSN3LGH+JWzsjmXFGBhhG9Egk5EiNjxs7YnBd+T2p75OGocutx9yOcHBxvOPZD18nldmIUWNXECr5hczlKVyiweMvBxUnfD7uT5LUkw0URE7WsK9IfGA+3XaS+2UwMW4yi0O5dmrBYuvGw1UwYQrGdFKCzDkfql3TC6U9lo0nlL2lGQdynaRzarSrsnHefBOrZlFjsiTD5jqmFMHTMgG6txyqbzxvMWYvNxZZuoyuHY9wjhwp8E+MxZEkQ+FEkX3edUTXJM0FufBInj+wy2uYOhCbSfa3BCPw7Au0Rc2TJz6ODGViu/DZMg+wAo94bUvFEj+2JjL8RpnUO7jdputZ3+TS4Rsh3F7vMeReOJd36+QHGB+Mwt2slT0ePfCnnOORKAl90snGWGoCHFLs1GlPTroPk8Prk74YX77aWYO0+Fjh0rpBMf2eexqXkA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R516Hs6iSRgUSxs+1TKREZves7mPRFwPigDqOPu5E0dz1RtNWsW2zK/btps0rsi0WI0RJoljppvDOGeMOIFPOMNV7dd+pADeCQDcuBrXvm8wHZI272YY0W1niJHvKYdt/RNCynJcMUSPPqRPDeMmXR8Hv+mzizXU3/9Y9WBUlTBLVl4SN01+wMWsd7V7cPnfywEVy7yT2SeCutOpr47MjmlI9NtWNbTMs1iBrbvQqaTQIvpOqhZ8aX1DAJIVAsnaOWduYUPqbnGMHoiaY4pwVWtumZC1a3dPwInrCkU14HQa3L8tzWyxooxQQHcB2Ubg+YT8uhXs4WxK9BdkuHypzoU0L6WnldZJdIAUNygatiFtO4eLQGGgnDE8ICaTtdwmJAt/4PrYXXg024HeXoj0/eGCdGBCNAmvJUEUzOPklvTDf/w68hJJoHFj3r5Sr0Ha
X-Exchange-RoutingPolicyChecked:
	L8MRIDD35ZdrgnbWIQlr1SDC9oat5iZRwdOz3DJz/F4J047FZZz+/78MbIITakg0mTzvr5Jikn6hfyHfw0EKSd/KkPimGTCkOdgmIw0UHRervuyqayWd1+AnCnhztNEwFdXyMIT9BfFlDWaVE+PxrIQUrZeoVdMoERXynF/hpBVGmntcP3XIy51IE5kprnkoF2u0/lcOcrdPXSLcYLYMkPdnR8PfIoDsAwGh5IFWgo5zEORe5nQmzDEzsbV6tSB8uDf0YSJhDidyd0VfWbOciIdC7WndtlBNF2uKmLIvWi0JmSFdfDt0Q58Z7bNu8uwqliDhhG7qRG609j50qUQacw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:25:51.3853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bc7eee-0f8d-4d98-3274-08dee96defaa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7861
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NSBTYWx0ZWRfX2TsPj4FoPU7G
 88vYaMNnjU1xTJf5R+ZAfUG248IbCsgJ/R4KSGW9Rq3ZQymbLhMy9T1mgRqcWdAXTNd1/TtzQM1
 kyU8Y6WmY6sLkiEwrgraD/nvQXARquC0pT0QK0kAk3xgHTnoQTrMxq/VHOoBA6eZ8xCRmPqYDkD
 HGBCdHhHU02MbPRVq+gGBTSFN8yE92GqQjsbWb0uAEMCJOrzIJezxnvqCDN+rbikzz4FYGWheCv
 GeFfV5KYwNvXXhedKI7pSZZemiZXPipzZDTj0iymiFMNJ9192mcUiIDDYtu+vLARqEQqMhZ1mz4
 KJFDeqngLhbgb13BNnyl2gWO3k4YmXuexmKMe2XXKRGlvtwKTcwr7ZG0OURXtwRoie7v+K1f/x3
 FgLTh1rWuB48tCKls78+G4IYxAM15dZ4ZPbNe17RDjDNHYDBVEmK6ZvbR0/D4nVSQusteWBx1MK
 ibYUxb5AY/4leLFgl/w==
X-Proofpoint-GUID: rymahLez7YrqeBpM4_8n9mumsRQkQY-H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NSBTYWx0ZWRfX4AHvMPw/ubJk
 vReYS2dq9MsS/T9jIzHZnWUEQCy/PEPwQJFSvFUpKP79bSDF5EkYA5JDdjAKpBZuhTtgHJUVvPc
 wAFYxQGqd2HmUJ0mkCooiU4gRuB1J2U=
X-Proofpoint-ORIG-GUID: rymahLez7YrqeBpM4_8n9mumsRQkQY-H
X-Authority-Analysis: v=2.4 cv=feadDUQF c=1 sm=1 tr=0 ts=6a633db6 cx=c_pps
 a=iHXbSHwDNs+yH6wS+48/mw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=tWBmhoRdbulY_BrUF10A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240095

Some clients have specified a new requirement: complete device restarts
should be avoided after calibration. Only a hot boot of the Smart Audio
Amplifier is required.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..8eb9ead2951e 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -617,6 +617,7 @@ static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	int i;
 
 	guard(mutex)(&priv->codec_lock);
 	if (priv->chip_id == TAS2563)
@@ -624,6 +625,14 @@ static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	else
 		tas2781_calib_stop_put(priv);
 
+	/*
+	 * Set reloading-firmware flag after calibration, the flag will work
+	 * during next playback, then set to the program id after reloading
+	 * firmware.
+	 */
+	for (i = 0; i < priv->ndev; i++)
+		priv->tasdevice[i].cur_prog = -1;
+
 	return 1;
 }
 
-- 
2.43.0

