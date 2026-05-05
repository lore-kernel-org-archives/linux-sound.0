Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFAD4949FF;
	Tue,  5 May 2026 16:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999732; cv=fail; b=i/heOEpwgwU7rBY/7vYAteA1Wgq8X6uW0dDdhOeW+z+KmvPqcnn1U+l4R7KEMM84olrmykSmpkr3DvXHTGzRbr6JFQcKMORtlSR2A+B6WZ2GylUMDuqae9UYYaOjCrj7dHKPw8LT+p78n4D9UMJXA40mSajj+WkSKpL6VEwtH9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999732; c=relaxed/simple;
	bh=BwfCDo3ULdWC66hHLwpcop/lk+evfB/RkgIPiRYfkgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T5tWgmFHzIkrZR6NU+qPCnG5rh3o6M8D7yPRnD1znGyS1If2Bo+u57b9YHmmCQo1FBYlIg3QDLzSiRjJ6mkMPmEP/8enrG0xsX17caU2EohahyhzLIzCpVB4My/jEgKrld9pnQ+qq77aMCc0vEnLfoCbau1hzQSJ+JpvTE7kRh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DvBF22k4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=G2Fx4HWb; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DvBF22k4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="G2Fx4HWb"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454rf3i1749983;
	Tue, 5 May 2026 11:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wjxydB6TL7CxrOZhXkMa8SsrLqduhdeJxRbTM0gNDTk=; b=
	DvBF22k4w2n0429p20S49YsieSMScVBdFZmfJNA3qbDUAwiioYaZWHz5aZ9wWqlJ
	QwKaxW87cjXaqmfP/BPGGbZVQekCMndlydZWaExtQbW9C1YPmHa9+HOkw4qrWoM6
	zFeDnx9Gia87H7LAXtT7hGWi2K3wiOEm1Aej2rmfSbCjlK70fueiLfVPr76rxvZ7
	JC5R3J7C5fAvr5Va5R5P1RkdhA4FlpJyUqiPq5/vFVneA7+Z18zJC49dCU8pcM5z
	r4ttzetwVN6Y3MUyx9laNgiJCQRhi7Mzo+qyBt5823B/AsilUjz38y6rN/dfEJDL
	XbyJTCwVwAIcDILFRO3qTQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022135.outbound.protection.outlook.com [40.107.209.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uvpb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsTWwQg3Zb5wmJlye8l81iih8x5qK6ygufc5noqu/xCvTOcsBJtaMc4oA5UVz/6+EGcvnTTkhWLLltTmo7MXN9ewxJ0LLQUw12toPClB8kn3wBbChIMVfZx7QJV9mK0EEBRJLlQtlfQDV7sEFlBMuMNa7kqtrZ+6mxzQuyjGfklazrJcklrgF85XMnlZVUAO61nu3gbpvswV2ZCx8/Oe9KX4wKI51WPjoqi1o+hjzSp7QzIKPKvtj9hibMSg9+3WKuegLixFQGJPA38FoHnk8aoOSDveqtMC4VkQnB6Of2cG1bfR0YdUhQqD4uv4oyzzj7kbUmhcXky3HkHlQPVWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjxydB6TL7CxrOZhXkMa8SsrLqduhdeJxRbTM0gNDTk=;
 b=OvMlQ1nqIs/1Hl3H1qHDcfu4Kwov48F5Bhf81bk7Mg5qQ8+j8om9O1wFA/sc8+l7wFWGZDRPgB8CjFDftmBPe/c00o/zDp1MyXk7v4N/EdgDbdV3qqHj7vOqD5UFcoQyOYHP0QoKshrFMzy8UqgD1/bupLs411qUpwhDwNSNWhO7+gxMO5SgNqTmmifNIYnXYnB4YKBRoUkqN08ylT/jVBPHm/wNuEcJ1ICls1kvWqUF9/cGsVah7mcaWQUDDc9KBYDKZO0NUazkpo8xZA5cu9WBYbADLJ9Qbjtcvrc9DPjkFR+ZJsWrRC+gwLegahZ5nSIo377engopecFQ1VSCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjxydB6TL7CxrOZhXkMa8SsrLqduhdeJxRbTM0gNDTk=;
 b=G2Fx4HWb6vIvbDSMuKfSv4j1dPARLd51UixFMtXH3DgVYMcn050vmLlCualUBcDCePBvzGXqdybCj7wGbHMAjkWRf/kN9e+jRfB2EpPd333T8FJsSSx8RgGxjirDXoWvIF71prbBgt/KNkrmk9dPfjIRpCzKqmdLJIf+z660fcA=
Received: from DM6PR02CA0081.namprd02.prod.outlook.com (2603:10b6:5:1f4::22)
 by LV0PR19MB9264.namprd19.prod.outlook.com (2603:10b6:408:327::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 16:48:15 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::c6) by DM6PR02CA0081.outlook.office365.com
 (2603:10b6:5:1f4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:48:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51EAB406563;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 27752822554;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 15/17] ASoC: rt1320: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:48:05 +0100
Message-ID: <20260505164807.4108684-16-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|LV0PR19MB9264:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a3668295-6dce-4c7e-67e3-08deaac61a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|82310400026|36860700016|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hC1Kfh94sgowCeMrCi3HLadqdtx1f2DKHQnm/kY/JgAOhmi7cuRIQyDAarSUtk4VxH7x8tDapdOD1qPYRNghNqb7biuhpnFPQSOIPIG+Kz1RTq143Y1Nl1i7cislCzMmyB6ApjDz+9teoAtWGUFL67G6M8m68HqcmBH/KwImD03m//Hq/VGzUX7itwpJ0u8XHnEytZpIoEkVOwujvxc5/fbANLeo9Odefs6BGr961kcoqqyxIqhdzeJ/R3Fw8B8rjhRhG+pxMribRI80pXGEZaP2W7sof/fBcmgJVAg8Rq8CnV3C6y4ggwU2QmvcHc5kn2B0iVDhkj+5OVRNP3l6Aflh5VinC7sjZBBHrKA+AF0PdeTVHCzfuxXqIybFaaZ1aqU1lgSTu1M55eAbO8USM0WI5V9S+g/28HZ1KiwYm9cAxd7vTI/Eyf/ZjmWsOBFTj5rh9R8cEBATTBvds/K30oXiuyQQVuapKzshHQYbJmkUE9lCqfoNkOiaZMWuBwZ3RsHVe8AjJyi5gzErBHi0D/LiYoO9SpR8OWm4qDH2xOCDRSrBLOLQcHHzAJ7/LkH4lWH5HyM5x4lToQlBr7XukSrLSMorbYkoCwCpAA0IlF52wBJJfYLyaDniwArBbwCAlzUrAVrbxKG2Vqq5X2zDG2aBSQKqPDDDtvxyXqyLFRc3PDcpuy+IyyPJuk6eoAy1nOBDSCKQvyhmgciiY1SRz+BSTPaumBQtb1DczVTQgAY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(82310400026)(36860700016)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bwuh9oe1FCbz66CItC0rcdkPRvfCzWqNdUH/CvUgd9C2ZpMHnVl0Kxz6iRSbKvZadhgki5j1PdPDUdye+X5bkmXn6IGGbFtvfCDiTUVynuXAiqQoCG9OT/O5aeb8FU/9rd6ugG/6VmTf1fUJ9vRsRpcebk3CCqMWxap0+wjCX4GILicQUcereT8iHiLeLMprRSteSyl66pdpnQLioEX8l4gpve1XowsP107q06fGJzcvob+TLGct8p7OPkZohvawXb+Q6FkHL960ZYw4wyNPBcBMcgax9KCUymB8iqmQmB2NTPqjw7lx4SaRaLo0NpD/iaDS0lmDL2KSqNhjRnJM+6nD2OND1HG3+qNEO1takMS+W0Swy41FO6nEp+LuJiQeQQ39SbfNr93cyk0k01o6GXHDT9fDp62rqHWS1qc4w8rsYW09e0Yab+kpJaTpp0YO
X-Exchange-RoutingPolicyChecked:
	MS+8ey1O3tiGCkO+q1bJc4opQRW8y+t1Yv1hGuKpNlQyDWu0VoY2cZEnCWSzCBTMyl0gEQperNHuzH55kqmXGX5smtO1Ql8CVJCLPLn8wtcSP2DXakUb974eKkpYgQFHO5G8GrXB7yBqPAaNmSBhxGjZuphSbLC4i1ZPVGDL+X0yC1A2JuW9DGtWlOuPv+Z6gTH3eB4iMDDou9o7CiBkcvz8lsnqVVEVPSDNsvdo6eNv0pzgwu8dGqREODsYI0vZ+S4wPrzEwC5+Bp5XRiWj6sJZ1HEih0/YRyR+XefFdSuEgaKEkxqqQOyLdQT3AYUl24LBrhG1welI/ErEIN7JrQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:15.2014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3668295-6dce-4c7e-67e3-08deaac61a4e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9264
X-Proofpoint-ORIG-GUID: LILCFLoAYLk5ZO1d9BvzKejv9M7kOR5l
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa1f52 cx=c_pps
 a=q+vF2XfoPfIv7kJI7N+yTg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfXzco3YhsbPawc
 /20L5fbBL8/M1Hky4yRStPVtUIgf96RMlT2++ukudONeS0IwG4pEP98KiW7E7DcRJLcd7CcdVtZ
 Iu0qVctCqHLxHa8TCg9zl1wpPzazycfyjOP06z2ghgfXOZFhWTmneuq9VKoYTIicZWwhVQLR8Km
 WF4vsHmzPk3dttLW/O1Clq8RWQw69HGIPskNohJDEUzWvdmS09oH9vIi/Hdrao1+53y8F5gRM+7
 Le2ujIBTLTLYFy6Qulrep+vPXBn9xV6EH7glBgCcvBGRpSu4qdhBMn4cxnayAlpSE21GrT6iUzB
 Yzi8ZpHChyV+5o/zZA5vMuf/DWE+XlvYUjy221eZdgXUa0TrRMERdJoz15sPbRiGwalF4ITaSvL
 ILMIirYh8dM8drazhllI50socvoLzc7AkaGxXOMX+mhiAAqGrWjuXp/hFbx9VTqXi+mki2ytd2I
 zJPSWcbfhJutm1wQAew==
X-Proofpoint-GUID: LILCFLoAYLk5ZO1d9BvzKejv9M7kOR5l
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1320-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 192faa431b5e9..13493b85f3c95 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -3053,23 +3053,15 @@ static int rt1320_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1320->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1320_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1320_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1320->regmap, false);
 	regcache_sync(rt1320->regmap);
 	regcache_cache_only(rt1320->mbq_regmap, false);
-- 
2.47.3

