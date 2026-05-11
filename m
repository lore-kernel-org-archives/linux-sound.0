Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770953F0767;
	Mon, 11 May 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508678; cv=fail; b=a48ecq9ORW22dSX7ifkDgLT6Sb39I6kp+Z29/6u0kMAx+KKJKPgprHOB6+693Bj2ckwB/lNZ8DnL13c9H64IzWdA0tdC0ez1JkL8SOL7J/Mt6+w3aey15KLYYNK8g4nzbgfNBOoEh6mFTFL6NPQwd0WDcxLdFd7krYoqGEGM5y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508678; c=relaxed/simple;
	bh=GNR2G/QOZAYlVxf4PolOe7mUZ+uY/+7xNJ7j7v2+/cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W5GSSmglfffUEveOfJuh0QBMM2aFCApCd0/K3dnNz17QXGIyOettOdS4+DPztvST1wHvLyKE3775a8nYjdWLIq2q560l+NO5PM5BU4tNYEV1+EtTnec8uvvcQrC+Vihrwe027sYo6c3FCWgPITIBjHcEtliXsGtwsCKQ04IW5XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T5+aLLGY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HwDCIesa; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T5+aLLGY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HwDCIesa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5kk3M2665554;
	Mon, 11 May 2026 09:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aFQWxFlt0P5VU3AJkI+G/wecnzG8+OzUFrD5ttfp7E8=; b=
	T5+aLLGYXIaKC2yTAMTomp0KYlu2cfmcNB1u6WIrQGU0bBzplYNCWSRWQEVgkEzO
	mCLuF/uUAvyL2CsHcqMx3rOv3eQi76RBQ9zYb4axqP01kZGI6a5XFQytoe0Jmrn/
	LYTqmSG7JsVn5aTsbie6v6RvHJR3DUzBCaoHcAcl5dbXahP5JexHfaW/TxfQMAfR
	xXc7giKyGqIPQqPEuCH1w6eBwAKVPjN2bS90WdUwPifYgu98NlDmMdLNizfXe3ME
	WoLdw9f39j23XzFmFM6BnEmfesWsH1ZhrOBndaK/Zl1JMFaorhzXHTs+CurOmTva
	tzr+c5ENWqJtA2gQ9Cgs8Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020114.outbound.protection.outlook.com [52.101.85.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8fq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJTu7JWB1pyGZV4C+0xS/qVxZ213isA0BLWjSaJobpncLGt6rNZdiUwhOtUKZoku9oRNSLdS29Vyb+6N4/dsSV4NhNPlqf0OtLHIO0oPCTEmjj1TdnTpTd/IkNdzKm+wZBPIbmqpyo2KDhy1x4vx53BRjffe0htQWNqwFiWTHPIKKboE+wPw8RqAS5rBAynfEMaWbAPoeYE9FkzHxk5O8+vfxuPLlE8qqp7KEiZx6PLjDjs5PG5uB0yOxg2ae9057KxNO89F8CdDa5/rgG/GFuogEpo5n6feMnXaEgXtSbtwLwr13Lmz/22tS8wDS0dCmM+sP61ab7w4Y15nxEmqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFQWxFlt0P5VU3AJkI+G/wecnzG8+OzUFrD5ttfp7E8=;
 b=gMQkPVNLPR4AhAWn1euNEJF3AgNYC7hKkx3b4DMJfFmLK67W+7rDk8cIr0pLkN2/rD9aeJQ8e51alxkEzZ8ccI75Qq1MQ0C9FrPEraINEqwZDcHHIfxrOGssGwmIIKkkrGoX5FEuxrKi4RRovi4i3CDGK25LKRcyVMWohW5wGdJXys9zC7eMUxkZ9R1PK4iTx0LyOfL/aOLMlAnCcH4bGkIhdhaEerxVIayiCnjZRlq61xifj1vZcd6NRrQnupBGCedY5cB2o96CSEKmVLpcLhTHQqN8O9eH4OkuMp32HEbU4prpjHMs4V3dE8XB747JHry5eM1OFJ8qKIDs44n77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFQWxFlt0P5VU3AJkI+G/wecnzG8+OzUFrD5ttfp7E8=;
 b=HwDCIesahk5eIRfwB8bTkaoSCxcAbUiSXABrNyUWFLbsDP78VNmXpEh4rZpT5Ulhqp5bRVYW0qtYbSll2Z791+dW+z9uXtDqnB4Mw5bvtBJZFjKRytN6ZugQ9qXRpFkSc1Rl+8mbijvnguoL85GTmsB4qR75vvceMvgnlNQLLFk=
Received: from BL0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:91::32)
 by SJ1PR19MB6425.namprd19.prod.outlook.com (2603:10b6:a03:456::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:38 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::a3) by BL0PR05CA0022.outlook.office365.com
 (2603:10b6:208:91::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 14:10:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8E6EC40655C;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 50CB8822546;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 06/18] ASoC: rt700: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:17 +0100
Message-ID: <20260511141029.851125-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SJ1PR19MB6425:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3117c607-d887-4a57-a950-08deaf671322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|61400799027|18002099003|22082099003|16102099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	igmzBxKImbV3sJb4h5lfbxuYO3x6lbbsiHfX9QVzAaPk9HewjwQYZGmY70NZ3VhBCVEDcb8b1Cy4bF4d0yRrRvoGUXHNCjm6GUhyk6fSjPhOzv+VpObI61IP2mSWu3Hn5aheJTudGrrFhG+7I6SGmVdvjlUD0NZMlTtHexuologHiviGbvaisiW1g2Ca+nNJiFfCdWve1nNQ9ePjWU4+c7lyd8Ejykyw+Pqsg7iFc5reCCySk7gauuKBxhce78dPq+O7wSr2eyylMWxU2FI4c4D7F6DkMXU+XTNEvH20FKGpEdh21po6L7j1Lw0ymGWIkHduubYvTL/A2nEwhds6VseFhzEUN5Ow/xA5/HEkwM3CplTQ8UX3NLsTg35RtmP2sValDBDHnS/sbiKCxuVpEcvyrl1dWx/7gSAQg/J0FH9rYAgCxIQvOsp2avDzAPBBVT3bgQXIc5N8mwVHmjTh9pWx5fdZEAGBcs60QjUWgKPs+ApW5QpiesClcZwa1D0tPuxiJyABI5Rq1f/8mFytzQLK5lBdGnHT37D12zLKoLpTP/WABHydP1kMXXj9sP9GXFz3cqYbDQw7jtPAqK6zhUsVUlZX/a+e0oY1oFyCWBEr7g5pkyqQs/8wpqkVUSdCHsSM6NTww9U+MqpmDWR7+MKiRw8I/edIQvVAZYCY6+i8NstZgELLI7AQZtiJrKrdfPiAYaEBD/eXhIkgcojcSd6nOlsJ/iMLDfZ1L9IFqLA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(61400799027)(18002099003)(22082099003)(16102099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KkAKO/m7+AALNSgovex/PIyeHsyrt1OmXy3NSxT88dZDJBWxAkvAr3jsvDATGW19kstnB7LSgNVAuip65NzH1vQn5G+IhvlzJrzcz63UpXzr/hIVPtbVUlM9hywrjm6q4CNUpw/B4rIiN02+Ly1DUifqauI1z4DtzlL1Wm5k23PW7A0NiOpp7BSLwzXcyKyLTlJLTBmJz/wRiiK9CtF4qLWC4tMSpTO7fqhTLsUv9JnwKnORBv9oRaaJnqtFeWObuxtwZbeaTIphvDbYoBZETNWKAiTNDk9/rv2152i04oaODKuo2trt+iieP057TPil2IwcvudCMd9pTSALMxBiIpTOEf7eIXtNruHetzW3b8bNN1kJHtwJvTx3d5+3bGwQECL3u5cg6E5Gy8sALizPpudBhbo860fWrXbud/t//3f8YPufMH+nWq/CyrLggkCp
X-Exchange-RoutingPolicyChecked:
	jLkCm9wA4whOp1N/ZOKSL+L1mvFEZMfrSBJW0WevHGCFP7kSWETDCDUNY0zHv7ZdLGIaVeMl3P5JBaNfotXLUysIzjvqe/DnQJZC9Itgk5/77xDJYNR/pulZ6Ryg5IDWit9M9Ps1j2jWU4AALFvQtSd3HMnPCnu6uLg+3DOWH2QnxbHrlH6yVEV06oKZdINeKiQ0hXLXwAW5EMFqvqCM8HEnrgaFc/7fLvcUPpsBof3ZLoLBPWK999+aTcGM5AEiGoIoOVrPjNHxIz8d1+/tDGxjykrLsqAOOQy3l/DDajVH5FtJOL3S6SQWWOuiyewHck8Wi0/bZsIXiKsS8Nls7g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:36.8670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3117c607-d887-4a57-a950-08deaf671322
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6425
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e362 cx=c_pps
 a=0Uzpqe5Hikn09oORNzbshA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: Q93ujCg_qFCmKN-pnBxKOQUD1O3BTxSj
X-Proofpoint-ORIG-GUID: Q93ujCg_qFCmKN-pnBxKOQUD1O3BTxSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfXwU+N/1f8cAuh
 g2cAEJqaLVEVHx0gDiJeFcpnp0xU1B2pg/XV6iZcLZiIRmKDr7bz9+KFfGjxH8xE8S2bulJ/PoR
 nFDS9fqZJ12spXDbDifgAzKWn3z3JpA3lEvL9cRf7adEwGFuvP17ZwcCzvIZnOCHFsE5qLFx7Xm
 xnE8mwqLi9lnTaDhJTKEDh5ZXhXWdXkln8M5TImWwT5hDp8HzDSx/PDj8xcUSjvQrnLOLPTb11K
 VRfqNt/MIEQvYYNQ0bKYLaaV+C8k0QeEwTrQT9GLjKASIKHR1y6HEfAPi9w6w+qpKsWdaHlZeBC
 jzYSV2jxie1aMRLxUZOckfhzpU1mRURtuStNPHe2K8Gc/wyZqbsTF5YIdC6AoR0PYVbWao61h2Y
 H9X929U7QdUBwoCBWT3k1IlNBSh3vT8naAmBoXlIn8BtUDrnMOxlxHcGJLXNzR11SaSYUrBkgIM
 GcQ6K1xYYvfm2mH4pdQ==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/rt700-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 9ce36a66fae1d..30fcca210f051 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -522,25 +522,15 @@ static int rt700_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt700->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT700_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT700_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt700->regmap, false);
 	regcache_sync_region(rt700->regmap, 0x3000, 0x8fff);
 	regcache_sync_region(rt700->regmap, 0x752010, 0x75206b);
-- 
2.47.3

