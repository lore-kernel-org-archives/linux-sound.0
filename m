Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E71F09B3;
	Mon, 23 Feb 2026 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862804; cv=fail; b=eEXLHRDwpD9h39JDdkJphCNwuWPfYDs1wEXSHeBOZGrcqn32bVV0TKBEyAJccroPrNcNfWW52UcdvRAd1GTMzG+vAfTrs0fTPNMswhYyZ6Os029qxr7zZXq5ztRPkvrwogV9Fd6DQ/JmOTGqrXdKRBwUlo6nk1XAETGjWqexvVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862804; c=relaxed/simple;
	bh=bkzmzrd5Oe7A72a+qZJ9HDtuNfZAoeV1Kz/XVxT/zlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJ7rNvluZ0FfCeUuG4yKnRQ58im1HGCiRCyLzaBAV7X3VXgub6ckA2y/DXXuNR4DHsMX73tfeqxQYkyhlQTuz8wr8rttD7E9bWkyiFV7Z1DVoFpL9HHNV18CaRl4iCmLqcoNkghg+ztzKg9WXoOZ24HI2RSJzj+h/wzCm9H7sCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U75Lpn8g; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=E3c6rPba; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U75Lpn8g";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="E3c6rPba"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NF9Ssc1991961;
	Mon, 23 Feb 2026 10:06:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TC1ogmsrhMbfRwPG6I9PCfc/VYOm6XyFz62MJrOX9zM=; b=
	U75Lpn8gxXYTrBUUzAO8tqB0dVyqVdXt/C2/HUbVqd7cSbgu9TQ1myvgkCLi4T2E
	xFgZZ5DzCraPORQMQjfz9YHkAHX9h3fbCznCuT3sL8PKjwcA/NayjKP7YoLPKAR/
	yDlIOpH6lR3smN/70WRUhmcyY5hQE0dtpTAlCSHQKeLxm8r3dE5prhnQWh6DyU/5
	vpen8Lkkvt4rC+Ahzs+q7gzvhpj3djVM+ciKzEGAo2On5muPcwsGPZ3JeDrbDRYs
	uvfdX5t9mPRgOZGmPBxjD9wlkJ+DlGbECNg4pcmaZ4vSqiyySCM1jItffS1pT6YE
	/RZP6xYd6i1Os2xxw9q6uw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021119.outbound.protection.outlook.com [52.101.52.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019r01-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPv3NL1RC7NyPd9cbDvPU+LH/Sonl2c2sGZv6CwfFkfj8O+q7195b8EA9qHph/fbCBiqs9mv3R1h+fyrvOEGmQymOS3rmjlydGWCmVuaWCOsKXqxSa11gqxfDhETaswajcjedzemSa2WFMFy01EEaJmUQsAdwZy6HEtKuwiPQQqXMYnkoh8n9Q9pmASmTF5VHlGAzc2fP4A6E0psNCYdwjNi0Ed/D5djPSryZjVUVhdpUfi1uoIyvBicmxIZVhSul4nT0QpguljBBiXtD6Vk/Dpkf7Vvy53N3C0hyqYQK290NbBSSmrZbsSUrIjND7p5I6iopI/Wu31zMBf4k9j8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC1ogmsrhMbfRwPG6I9PCfc/VYOm6XyFz62MJrOX9zM=;
 b=koS5CixLeqHugIkTkt7wijLxJfDyGXgrtVTx6w053p7iliA3oPtGX1JA086dYFe5lwTS/v3MSXQ3CSKwxTjAHsGVseNXg5PrNAfcx8hW9MTv8WvIK79HU2rJYtQneTNt/TCNN/pBft0pop56pJ4jpanDOs5EOMHnqjHZOYNy9nQQYsZ1hmotCrA/RiOmdAlciFAfBhHUfqns+BTsOgjvj90HuzqxEwdB0k6jrFXREFxjJP5A8fLBdGcdvCC80AMlnh4NpPqE4Po4SkJX14cWZ1q27RJcvuHupvRHm8fEawkWzl2wWvscp0bujA+FvYeiRFG0iTl7D91j5GT1AJmFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC1ogmsrhMbfRwPG6I9PCfc/VYOm6XyFz62MJrOX9zM=;
 b=E3c6rPbaxsm8wLNlj0E/mnVTP2w8zafGGQWH4v3nX3S87yjIDbZNnybagufwr3uAz7Lld95H5hGm3regRPcYUXhEF2ZchoCQj0Rbge9bLjkaa+7InA17XZpZSlxUO2EcfBxjjwBmlO15oNTVZ0WNChjeBwgoeaECqQOS2W+T/Qo=
Received: from SJ0PR13CA0188.namprd13.prod.outlook.com (2603:10b6:a03:2c3::13)
 by SA3PR19MB9552.namprd19.prod.outlook.com (2603:10b6:806:496::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:06:38 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::df) by SJ0PR13CA0188.outlook.office365.com
 (2603:10b6:a03:2c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 16:06:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3DBBB406545;
	Mon, 23 Feb 2026 16:06:35 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 17BA082024B;
	Mon, 23 Feb 2026 16:06:35 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 3/3] ASoC: cs35l41: Hibernate wm_adsp on runtime suspend
Date: Mon, 23 Feb 2026 16:05:32 +0000
Message-ID: <20260223160614.754934-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
References: <20260223160614.754934-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|SA3PR19MB9552:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2597be4-1ddb-4db4-35a8-08de72f585f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cdGzVyYwjgTnr5IKsj5bYELBFRHI3sz3/JfAMuogK/XWPJurTSA4p0RKIPSw?=
 =?us-ascii?Q?CqHoLf6GyGtdik5WSmuEu9tBI7U+Le+jUAstPXLSAMxhBmTuLFXXfq6GCGe7?=
 =?us-ascii?Q?QujCs4HvhjAYwX1HoeRnCq3zgvUFBfxML0rA0fBbOvTAHHRCCqCzATw2l+na?=
 =?us-ascii?Q?AUj3nnD/J3Kh5H8m6V0QOC/dPZnumlK+nF4UAPyMeTK8hBARn1pzn7uuo/5Z?=
 =?us-ascii?Q?XJU1yU24fkFHmSBbCBTYItPEeRBdmgKShkXBFszyzUQ6Vi21U4tF4E4j4egD?=
 =?us-ascii?Q?e3tnDEnaPBYbs9SvLTDTzgsx7/s74pREl6lG/9v8vMWMkGWp72XAdjOpof1s?=
 =?us-ascii?Q?bczrODVvMoP9mxAg/loJ5ogim4pnjN8el+DZHWMp+bQrFUQlqnJ4QRtjbMHx?=
 =?us-ascii?Q?2UDCc4He/hFN0q/IwPfC85F3nMWFI9Ze+RF4ipTXuyrkUs+aHX1vwviDKEwY?=
 =?us-ascii?Q?wFsiJTLXBcrT0gO90PQzuUpo7XUJG9uQEogooLyDu9htiUPoc/MHJfv7cw0u?=
 =?us-ascii?Q?D+D0mE/l7kjvq/AcYNWRpWFbjs27/7eBgT1f8yAJYAHkbTckSgktpwAIVGqp?=
 =?us-ascii?Q?3cTd9geTle18P3lwFjUEq9OudxMR/A0V0YWzJrhUQ09vmV0BsMGHmeCP6LpD?=
 =?us-ascii?Q?kV/q8eyPDt25umQABDRuDyzE04HXBVJtW3SL7LRkXMFUvjihy8jVZmEjsZts?=
 =?us-ascii?Q?+80NFo4Nk8pETdInJNTggpbUNcJ+R7pTk/x9ngzvugo0qM/OKHZZNPUlhfJB?=
 =?us-ascii?Q?gQVVHkpxT/qcKUblGxMEPCbB/57W6VF4HaaooVw7oBAlqkNGmN3KF7hVBR3V?=
 =?us-ascii?Q?EZ3SOYyDSJ/5GtH1lx5ffVEsDVCH1VNrAvjhQd5NymkuT/mNdvvZm78iEtgP?=
 =?us-ascii?Q?8ujUBWDd0rRZisUDjdIbSbXBO3aZ6c1YQqFQ/iENFe/5mDyt4YDg0fhqEpIY?=
 =?us-ascii?Q?n06FZdGsSeXdBmHEVB5NitEvYJBEaIb4lC5YdU0ASH5P4dYIa+YU2xbMlW26?=
 =?us-ascii?Q?vTWZZMc4ykvA9aHO1TaPZ4DYM+0X29xJZ0uXWY1VVi1HUdKyn3ZlRV5ycrrb?=
 =?us-ascii?Q?DhzRvs01E+fZt6FrrIch+UzWLtnCamOGpoR64wEu/DVuI7jubnjxuGc1F1nw?=
 =?us-ascii?Q?MMgEHJvXtivBgs5FItOAKLOukqCHHBaMuXzuAkZKG9+NF9vcSEoNC0oG0p/J?=
 =?us-ascii?Q?E/0Qarmf34Nnfg2k8Izwtahp7V1g/MJaiYdMKROX4GyMO/lx19yszKdSDbsy?=
 =?us-ascii?Q?QqNHVgcmsQTyT0uClR0prkV1kGNneyCHnII2WXq9lk6IK0C9aLMWDdW95iYB?=
 =?us-ascii?Q?zXIWLuyCLt0x3RBj6GyvHWM7mCLADMIEc97MB6e0q2nor+4Gs/uC3CVhOMoH?=
 =?us-ascii?Q?c2c6DfvMd6pLStnWa1LkINTgHfTlLwgawgGW0njoPI5T51BcmqxwQcxxtNuA?=
 =?us-ascii?Q?Jhxqr3UfSZMmyB+7Nnh0v1LoirDQZkrrFkSLHWJH9KuQBFZISyftS9EjOnAV?=
 =?us-ascii?Q?GUJZBlGNQJC9yXyOgZgda5p+I3O2bodEldToe4WbG3eSerRCsGrvIrqWbnGC?=
 =?us-ascii?Q?9oZbhAiH27JDp5aRgEReLIyZXkj2hntVueKkHS7d4GXODME6NS9430lzjTe5?=
 =?us-ascii?Q?h4GJaHdZFH++TQihMif8HIqSB7Gw9hAHR6H3vn7hqX7qqQle/7RaP+nUgYDK?=
 =?us-ascii?Q?pQdBZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hFybME7MquKV37Ug4bnwy7wbKpCfSC+nX8pHn7qThsZykXHaGj8BoOZiZmP+L87RexEqZ2h5ZjSB0fLDKaLjF5+NBRf0VO6D5mLzB4gtst2UIzOuaqFbujbM3drNyRXTlYKBNwu1HubXSY6TFr1UhHBUnychdT8qM3/bBIlTwl6VCmwm9tP6jhWq0VM1rX7A15mNFOpqzeKU1NLLxnQmPMCr6oU118SE/7dDqC8al1LAe/9GGRIGJ4AOdQ9K9Fsefz1glKx2ZbC9qXjg68e8scOlXUbK8PLJlHZFcR1c0X65sSDcrcsCOovhkdX3BEKOuPlVkVPlXMvTLA7LxTqAtxwWTz/v+osWa2gRC0kplWHgoVc6yebLd+5qU4sNXI1QFryEHyTtkWiwYSWZ+GSp5tENCqIB9kQ3xyZ5E8BGtvvrad5vq+k1erip1Q4r6WlM
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:06:36.9923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2597be4-1ddb-4db4-35a8-08de72f585f5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9552
X-Proofpoint-ORIG-GUID: KcLrF1h5kwQLH4Ja_U0Xtz3ebri567wo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzOCBTYWx0ZWRfX6B81abzcBEa1
 E82SZ3lYWFeA90lqaZx6YDkM5nHu3QkDazkpBX8GAfAyCSV7smexB3fO9A+jfLiKZhNHTr6c+Nl
 QLWaRrLqws2+f+R3JctUodU21il4BZOmg55KQypo1tBbvlWrSvMnWqDF2i51bA323SKURfk/4nt
 WLVcclOUAGBcUBxbjpvBEGecfcWTLXaSFA/FvHQ0LoOqFU0h42KtH2AXenfkcb1MCno5jczkA8m
 1kN4Ds/Yit/tiO/wsce84YVmjnQMJTivWpdYa4Z5K4/0wZ+RN1zVoqTCyt27BPTM34OhMbPf99/
 wGBTzSH1aQ1uxgLenPu/+Ek3vaJtXmDLl06w9YS28/gJUIIGXMYHE9RPEvsz9d9eXXU6tDxbpqU
 yV3kNJtXKKQNvyIguFwyvGI4+21BpxkboyC6i1qcXTKGOwc7opSsnCevFKAWW1RpTc6179slSuF
 AaXl68S7TfWQEpkxY/w==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c7b10 cx=c_pps
 a=Sttmeoj8PKbKCQDeSgXeRg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=mmtDOMPXX2ZRX6g6iDEA:9
X-Proofpoint-GUID: KcLrF1h5kwQLH4Ja_U0Xtz3ebri567wo
X-Proofpoint-Spam-Reason: safe

When the CS35L41 driver suspends, it is put into hibernation, and
the regmap goes into cache_only, but the firmware is still running, and
wm_adsp is not stopped. If userspace attempts to read a firmware
control, it will perform a regmap_raw_read() and this will produce an
error in the kernel log. To prevent spurious errors, put the DSP into
hibernation which prevents access to the hardware for the ALSA
controls.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index ee56dfceedeb..b2a076706c79 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1404,6 +1404,7 @@ static int cs35l41_runtime_suspend(struct device *dev)
 	if (!cs35l41->dsp.preloaded || !cs35l41->dsp.cs_dsp.running)
 		return 0;
 
+	wm_adsp_hibernate(&cs35l41->dsp, true);
 	cs35l41_enter_hibernate(dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type);
 
 	regcache_cache_only(cs35l41->regmap, true);
@@ -1432,10 +1433,14 @@ static int cs35l41_runtime_resume(struct device *dev)
 	cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
 	ret = regcache_sync(cs35l41->regmap);
 	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+
+	wm_adsp_hibernate(&cs35l41->dsp, false);
+
 	if (ret) {
 		dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
 		return ret;
 	}
+
 	cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, &cs35l41->hw_cfg);
 
 	return 0;
-- 
2.43.0

