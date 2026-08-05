Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C9B4582EF;
	Wed,  5 Aug 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933752; cv=fail; b=R2tznKX+/IDm2ikz28NqG/+go85zmxvwfWvffvZqQ/stWIw3mduoDwHKydmDZkCovErwTqVJVqELh6IN8L2XgWRqwG4O43sP24TDeFywnbpo8vcw/GLjNCuH3q6TGxE1w3pADBZVsKqnZq5q9yQuhx/+koC7PQVz5D3FggXk6S0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933752; c=relaxed/simple;
	bh=DP+n9usiBXip5rVmhScm0KdfxHTtauFNDm805pI6y5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YuQ+om5/Qqw2ZHR0tepj7r1nJxr3v8TzQATs8AEI0Hykd8Ek40RKSfEuzOBbpsi6Qx7Hc/3A6iJxg6S3DROqnTPEkD9BSrePbossoBaiV94RmyDbt2kSGlAJC+WsAUIMOym5t0xZuVmumP8bUSx5YDTHJyHtVhbNtRUg6NCOoZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FTigfY7H; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qzROD3pE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FTigfY7H";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qzROD3pE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67558q6d2591634;
	Wed, 5 Aug 2026 07:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=m+gyEeEz69X0jwC97Q1n+yBolFz4Cz/T2S7wFf1J45A=; b=
	FTigfY7HCIZFMzLc8MybGRhlPLmPzyUlWQCEFJ2wr+Wwt0ASxxwi/tXDdmQiCh3q
	KAXfRlQ0AcWIkoYwp9zGbqjF67JN9EARO24T92v1qn9MV/ID+3BjJVV0XjMVYXMl
	ZMzeUHLg6/BogBFDTs/2zV/28GA3p5ukQ9snWbMN2kzrpPvi6zecrCxdcrxCMfnK
	JIsHDf6nhUxjfXe+RATnOBZ5v0dQCvPNrjoJOhddWSIfC0GvZifYNvWZv18ysTEs
	BbjL5SrbuJe1aF6x72jNqmXSk3r5CMNl/zgpzBMMpomjMQCUhTeJ0z8tllX2ZAdC
	YaGffXF6Sb+G8eSXuelqsg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020124.outbound.protection.outlook.com [52.101.193.124])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h5pe2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:42:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQ35LwQcZvpU8YdYzrErQsDyQ1GeJ5C3HfA/qZvQ8+g9pfjeGub5EaK1+aJhgJnh5iP/oWc0YCPYb/JkMeSsBrtbQ/5FT50fHfPs5yPfqWpjF/Ph9xuMaotnsUgMxFWPZUqSdtCDUzRpkCVKrrRV8RczMJ27vsOMrsGhikXljcH8VyLsPO9UVZA6CKT9WVWMgScibaIl4+/sM13Oq8/GqOGqKKJz0+CmopKBQsmlWD57/LEHCz/WD4QMpGpMVUcL3Day3xZHRv+PmVTtlq2jKjXUAZNQGcEXJ5wMsk+pDorjODx71UTbyDx1M2p8Yz3JciS3Hk5fcLW640btHelijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+gyEeEz69X0jwC97Q1n+yBolFz4Cz/T2S7wFf1J45A=;
 b=Uydlvln0j89P29INlM7HQtjdzfzQK82tJPs+LcdBiud+0UYJOVxCXC77Ma4XzoqDU3rUs/tIP5cGVGSAbRdXxhQPjm5cTS3X47xppSmJzkMqbs16bRinVERTZCfzFZWdcrOkKaVAmC9kiF1DmRkfNu3nkV0HMfOC4xzRBKhmbAYZ1lcI2qzMyuCSHSTt+wgCsxW9uSkWKTSDHHQrGDqRPZBGW9Wen7NFaHD05d8sbXajr+dH0X6WF4juCv9p32P81mRrsjIID3xl2wtw2KQZFW9vWL+J1WoyiK/coxicYCAFfQVwH1WyIeYVolYi8A0M6Ui+3oQ+YheXSxFxPjAZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+gyEeEz69X0jwC97Q1n+yBolFz4Cz/T2S7wFf1J45A=;
 b=qzROD3pEnyy99lb2kPpkA3rZj02qfFcuwR/nem8E7uAcg8ge3sg1hjom30IayOLI1u4nuY4QOjvPvnZ9vdzl1yBYqHljXYtpjpWT4IqO0UGbQiCp3FfFtBbg1a5UHI6Yayrodf2Bz8fIPe7FvHvDeQzT8GzjOLcUFpmL01Dp/6M=
Received: from CY5PR22CA0100.namprd22.prod.outlook.com (2603:10b6:930:65::28)
 by PH3PPFD6D301256.namprd19.prod.outlook.com (2603:10b6:518:1::c54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 12:42:12 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:65:cafe::54) by CY5PR22CA0100.outlook.office365.com
 (2603:10b6:930:65::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 12:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 12:42:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8AFA7406552;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7420A822544;
	Wed,  5 Aug 2026 12:42:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, niranjan.hy@ti.com,
        oder_chiou@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/8] ASoC: SDCA: Move HID registration to IRQ time
Date: Wed,  5 Aug 2026 13:42:00 +0100
Message-ID: <20260805124205.4152543-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
References: <20260805124205.4152543-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|PH3PPFD6D301256:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7207f022-ca92-4b78-0e77-08def2eef82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|61400799027|82310400026|6133799003|56012099006|10067099003|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xWIf5zGshy1VLuaqJY32visw73iWqVurUI9+NIL/Pp0C27umB5rm6VKMk/mFAwAWm03kPtqJ4SFx2DdP6+o5rFiIv+/7Tt8WWLegMHlTxYR1V4ULZ4mrbqaQH5GrS0Mh25pbHwTVwwRDcbm/CFM/WtukZYl9L8c6G65npy3Yebm777V7PAZ7jnkchuFZphivVGqaBlpWcwji0wosbEwAjMo43saLuDAGV2L0vcayMzJ/phPbeGQ/I8aTtG+/UIkp5CL6IVVERXm99u23lBBneAVd1s0KJs7fElRtqUuOHOwhVDBZ+arzISqrCDI2rtSmK8KASwKqK/qcnJERCMU1qdiZTGSvcY/KCPx2hUVsywUUT01RL21Sy8sWUOS8B5SDi/kYPGtSgqJZCorEhI/PGYIlkHNn649MlJf7LCf7GKly92xuPqBzFvQC3cNIJDaql+IGolGGBWKqvacJg0g1TzALFS8aUdCMR9IT+gsJ4mluIhuiaCUV9wqWUIa/AUROPTxN3mffhJoZWiXq6HeWIYwJuWDrHlMGrMClVkyVIFPkk7ZJtPEAzjDxLZRXctDDRlhxNSiP2k4XYxNiytcKrMd1yMSZvMCxJwChR2UO/NUSypSnETt2TbDfL4mzkD3jMFT5aEyGamwzcEebY2hHrvbhuWaNiImmRLkJjB+aXwzPYPoBG1flDO6mYPZGmCkN9R5XywHnNTKUjERiRUmVgQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(61400799027)(82310400026)(6133799003)(56012099006)(10067099003)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	77s/6uqXLCl/N/fd89cF1XLQ21yKXN7RcnfeqL6f53fsz6xYFi53iYK3mhOqKKouDG3I9zorDV/9EVTPrD0nQLuzqT2Ma14XSrr9wVQEs5V3R3FrLYn85t52RfmDpUAnldmzhfPkMFGudIHG28IUnzt1mzvQt9a/Uut9ji4tJWhDMCNo/q1GUSFmKEcJWJ37R7WQKqDfWWfAKu0oGRJ+djslAfC6WNAzlBTVAD/7X77uMHJNFr0pLGcJ58qhFwRSRDkBlw3m54/vKFUQVk6iJQZohSUONZXPbvN1MkgWpeyU0Qw1BqSfm0WiVfMY/MRfT8iaTy8tCk9hMT7lrQ03pg4EIIoP+by15XPt8eCMF3dzESNWo+5aVK+F8nKMbsDJC+uuzTRud7b+rLE1TsvGVtnK3+BPZgno8VeaTdiFrymyg7y5WZo2gBt+MH8qkj+e
X-Exchange-RoutingPolicyChecked:
	ENhCJe5VPJ1X3RzmmOwysdhrhMFvS7vvh3sdCxriXcr4dKUEak0/qXu0zbsz4tqC8rV/lGRC7wJzTUz05I/Z8pgdFvnxar8XxhPJ9z2lTyLmuxJQMd1ge8u5Cqbcn5GfBlazalWYeOIPlKqortQCaGqVyQlbWJZn2HhWvwCT8aLqBQTX1jIs8n+sRLR8s1TGa+HaQkV7dyj7M3BNHT+HYrLNMyRbiBQaHwAAT8EbR2NSj1e2O2MCPcMFiaBoOx/rUgIApNtGY5aHHrujeIJFJH/aF6mS27/eLiuaB9saAswW9yFQQ8rOj7+hCGVXtmsMlFo1RLuQQJ7LepbdZbMYuw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:42:11.0183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7207f022-ca92-4b78-0e77-08def2eef82e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6D301256
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a732fa9 cx=c_pps
 a=gCYXggIpC+w3u2dojYR5Vg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=wyvOC-j1VmNzcFmTlIYA:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: iwJNTFqxe2RrIhkt52z-6ysCbhxkjCH7
X-Proofpoint-ORIG-GUID: iwJNTFqxe2RrIhkt52z-6ysCbhxkjCH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX89ZaXj4lf6Bv
 RWhn/6z25t6z2qAfHnXOv33n5DiLseRIp2ILSpFSY7DpaztNQuLW/GmX0HG9qYNJl+oPxab3XXe
 xhXmOb02VHl6auLtsqpRK8gNCWYJg77LFFNqy+FmSvM7160uTIKJSiXCIOl2z7/lQnt0nX54VB6
 Xr4ZQVdwAETR0spfHxi3oj6Pvhei2dt6AP6GHynmrSNDr9xgACvBBMHDiz8+/W/NzUBv+ob4ZBa
 Ixd/c+rPB1Qq5fWYmMcjXiWxfTgrL88d2AbhHtes9wgJwx5u0IcyzaAd61ALVGPSpvLPeNxLi28
 vpejxQqioGNzc+16Q5MrH+O1xwJDgvSr4tJAtxMCbbGl92DFxloyK87SKZ/8jg9ENo92Qeuo4yP
 DxFYXPGQvyvM7U7oI9nuZtwFatVEgpd0AR43m6JtK42e35lqDIZFKI+/FXXCAR8Io0oA8nKZE5h
 F8a6TNW/SvBx6EHANpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMiBTYWx0ZWRfX+zQQRci6EuVl
 aDisqcE1QFnCKlzIFO9hV+mCg5enmh4xQkwt+KqEEk7z2NoqSRwPzEdNi/ZWmJA7b2LeDJw62LV
 RzJy78W7vmsId67YHclSmJVJ3SVfbtg=
X-Proofpoint-Spam-Reason: safe

Currently, the SDCA code registers the HID device whilst parsing
the DisCo information. This necessitates storing the HID device
in the DisCo structs, which are intended to only store the parsed
DisCo. Having the HID device registered so early in the process
also causes some issues with cleaning up.

Update the code to register the HID device as the IRQs are handled,
this alleviates the previous concerns and brings the support inline
with the other SDCA event handling.

As part of this move the naming for the SDCA HID is also updated,
it saves some complexity around the passing of the SoundWire device
to include this in this patch. Update to using the dev_name for
the phys, which is more consistent with other HID users, and use
the actual function name/address for the HID name itself.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h    |  2 --
 include/sound/sdca_hid.h         |  6 ++----
 sound/soc/codecs/rt766-sdca.c    | 22 +++++++++++++++++++---
 sound/soc/codecs/rt766-sdca.h    |  2 ++
 sound/soc/sdca/sdca_functions.c  | 24 ++++++------------------
 sound/soc/sdca/sdca_hid.c        | 21 ++++++++++-----------
 sound/soc/sdca/sdca_interrupts.c |  4 ++++
 7 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index fb931ae735a27..35799a9771454 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1116,7 +1116,6 @@ struct sdca_entity_ge {
 
 /**
  * struct sdca_entity_hide - information specific to HIDE Entities
- * @hid: HID device structure
  * @num_hidtx_ids: number of HIDTx Report ID
  * @num_hidrx_ids: number of HIDRx Report ID
  * @hidtx_ids: HIDTx Report ID
@@ -1131,7 +1130,6 @@ struct sdca_entity_ge {
  * @hid_desc: HID descriptor for the HIDE Entity
  */
 struct sdca_entity_hide {
-	struct hid_device *hid;
 	unsigned int *hidtx_ids;
 	unsigned int *hidrx_ids;
 	int num_hidtx_ids;
diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
index 18bebbe428c9f..83d1c7768133b 100644
--- a/include/sound/sdca_hid.h
+++ b/include/sound/sdca_hid.h
@@ -16,14 +16,12 @@ struct sdca_interrupt;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
 
-int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_entity *entity);
+int sdca_add_hid_device(struct sdca_interrupt *interrupt);
 int sdca_hid_process_report(struct sdca_interrupt *interrupt);
 
 #else
 
-static inline int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
-				      struct sdca_entity *entity)
+static inline int sdca_add_hid_device(struct sdca_interrupt *interrupt)
 {
 	return 0;
 }
diff --git a/sound/soc/codecs/rt766-sdca.c b/sound/soc/codecs/rt766-sdca.c
index 4c5acd950d70f..54ed0c42fba2f 100644
--- a/sound/soc/codecs/rt766-sdca.c
+++ b/sound/soc/codecs/rt766-sdca.c
@@ -22,6 +22,7 @@
 #include <sound/sdca.h>
 #include <sound/sdca_asoc.h>
 #include <sound/sdca_function.h>
+#include <sound/sdca_hid.h>
 #include <sound/sdca_regmap.h>
 #include <sound/sdca_interrupts.h>
 #include <linux/slab.h>
@@ -33,7 +34,6 @@
 static int rt766_sdca_btn_detect(struct sdca_interrupt *interrupt)
 {
 	struct rt766_sdca_priv *rt766 = interrupt->priv;
-	struct sdca_entity *ent_hid = interrupt->entity;
 	unsigned char *buf = NULL;
 	unsigned int offset, owner, length;
 	unsigned int det_mode, idx, val;
@@ -85,8 +85,8 @@ static int rt766_sdca_btn_detect(struct sdca_interrupt *interrupt)
 			buf[idx] = val & 0xff;
 		}
 
-		if (ent_hid)
-			hid_input_report(ent_hid->hide.hid, HID_INPUT_REPORT,
+		if (rt766->hid)
+			hid_input_report(rt766->hid, HID_INPUT_REPORT,
 				buf, length, 1);
 	}
 
@@ -191,6 +191,13 @@ static irqreturn_t rt766_sdca_irq_jd_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void rt766_sdca_destroy_hid_device(struct sdca_interrupt *interrupt)
+{
+	struct rt766_sdca_priv *rt766 = interrupt->priv;
+
+	hid_destroy_device(rt766->hid);
+}
+
 static int rt766_sdca_irq_ctl(struct rt766_sdca_priv *rt766,
 							  struct sdca_function_data *function,
 							  struct snd_soc_component *component,
@@ -231,6 +238,15 @@ static int rt766_sdca_irq_ctl(struct rt766_sdca_priv *rt766,
 				if (ret)
 					return ret;
 
+				if (handler == rt766_sdca_irq_btn_handler) {
+					ret = sdca_add_hid_device(interrupt);
+					if (ret)
+						return ret;
+
+					interrupt->free_priv = rt766_sdca_destroy_hid_device;
+					rt766->hid = interrupt->priv;
+				}
+
 				interrupt->priv = rt766;
 				ret = sdca_irq_request(dev, info, irq, interrupt->name,
 								handler, interrupt);
diff --git a/sound/soc/codecs/rt766-sdca.h b/sound/soc/codecs/rt766-sdca.h
index 5acdb83a42fb8..de4064007eb9b 100644
--- a/sound/soc/codecs/rt766-sdca.h
+++ b/sound/soc/codecs/rt766-sdca.h
@@ -8,6 +8,7 @@
 #ifndef __RT766_H__
 #define __RT766_H__
 
+#include <linux/hid.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
@@ -41,6 +42,7 @@ struct  rt766_sdca_priv {
 	struct sdca_function_data *sa_func_data;
 	struct sdca_function_data *hid_func_data;
 	struct sdca_interrupt_info *irq_info;
+	struct hid_device *hid;
 };
 
 /* vendor registers */
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index cdf1e68d60ac5..e9b449b670332 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -18,7 +18,6 @@
 #include <linux/types.h>
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
-#include <sound/sdca_hid.h>
 
 /*
  * Should be long enough to encompass all the MIPI DisCo properties.
@@ -1366,8 +1365,7 @@ static int find_sdca_entity_ge(struct device *dev,
 }
 
 static int
-find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
-		      struct fwnode_handle *function_node,
+find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 		      struct fwnode_handle *entity_node, struct sdca_entity *entity)
 {
 	struct sdca_entity_hide *hide = &entity->hide;
@@ -1440,13 +1438,6 @@ find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
 			hide->hid_report_desc = report_desc;
 			fwnode_property_read_u8_array(function_node, "mipi-sdca-report-descriptor",
 						      report_desc, nval);
-
-			/* add HID device */
-			ret = sdca_add_hid_device(dev, sdw, entity);
-			if (ret) {
-				dev_err(dev, "%pfwP: failed to add HID device: %d\n", entity_node, ret);
-				return ret;
-			}
 		}
 	}
 
@@ -1475,8 +1466,7 @@ static int find_sdca_entity_xu(struct device *dev,
 	return 0;
 }
 
-static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
-			    struct sdca_function_data *function,
+static int find_sdca_entity(struct device *dev, struct sdca_function_data *function,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
 			    struct sdca_entity *entity)
@@ -1528,8 +1518,7 @@ static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 		ret = find_sdca_entity_ge(dev, entity_node, entity);
 		break;
 	case SDCA_ENTITY_TYPE_HIDE:
-		ret = find_sdca_entity_hide(dev, sdw, function_node,
-					    entity_node, entity);
+		ret = find_sdca_entity_hide(dev, function_node, entity_node, entity);
 		break;
 	default:
 		break;
@@ -1544,8 +1533,7 @@ static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 	return 0;
 }
 
-static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
-			      struct fwnode_handle *function_node,
+static int find_sdca_entities(struct device *dev, struct fwnode_handle *function_node,
 			      struct sdca_function_data *function)
 {
 	struct sdca_entity *entities;
@@ -1596,7 +1584,7 @@ static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 			return -EINVAL;
 		}
 
-		ret = find_sdca_entity(dev, sdw, function, function_node,
+		ret = find_sdca_entity(dev, function, function_node,
 				       entity_node, &entities[i]);
 		fwnode_handle_put(entity_node);
 		if (ret)
@@ -2214,7 +2202,7 @@ int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 	if (ret)
 		return ret;
 
-	ret = find_sdca_entities(dev, sdw, node, function);
+	ret = find_sdca_entities(dev, node, function);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index abbd56a3d2971..ea511c6f9798e 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
@@ -85,10 +86,11 @@ static const struct hid_ll_driver sdw_hid_driver = {
 	.raw_request = sdwhid_raw_request,
 };
 
-int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
-			struct sdca_entity *entity)
+int sdca_add_hid_device(struct sdca_interrupt *interrupt)
 {
-	struct sdw_bus *bus = sdw->bus;
+	struct device *dev = interrupt->dev;
+	struct sdca_function_data *function = interrupt->function;
+	struct sdca_entity *entity = interrupt->entity;
 	struct hid_device *hid;
 	int ret;
 
@@ -102,12 +104,9 @@ int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
 	hid->bus = BUS_SDW;
 	hid->version = le16_to_cpu(entity->hide.hid_desc.bcdHID);
 
-	snprintf(hid->name, sizeof(hid->name),
-		 "HID sdw:%01x:%01x:%04x:%04x:%02x",
-		 bus->controller_id, bus->link_id, sdw->id.mfg_id,
-		 sdw->id.part_id, sdw->id.class_id);
-
-	snprintf(hid->phys, sizeof(hid->phys), "%s", dev->bus->name);
+	strscpy(hid->phys, dev_name(dev));
+	snprintf(hid->name, sizeof(hid->name), "SDCA %s:%02x",
+		 function->desc->name, function->desc->adr);
 
 	hid->driver_data = entity;
 
@@ -118,7 +117,7 @@ int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
 		return ret;
 	}
 
-	entity->hide.hid = hid;
+	interrupt->priv = hid;
 
 	return 0;
 }
@@ -133,7 +132,7 @@ EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA");
 int sdca_hid_process_report(struct sdca_interrupt *interrupt)
 {
 	struct device *dev = interrupt->dev;
-	struct hid_device *hid = interrupt->entity->hide.hid;
+	struct hid_device *hid = interrupt->priv;
 	void *val __free(kfree) = NULL;
 	int len, ret;
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 42fbd3af8a754..71037189a057c 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -487,6 +487,10 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 				}
 				break;
 			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				ret = sdca_add_hid_device(interrupt);
+				if (ret)
+					return ret;
+
 				interrupt->handler = hid_handler;
 				break;
 			default:
-- 
2.47.3

