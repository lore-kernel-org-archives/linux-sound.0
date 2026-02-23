Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF2358D3D;
	Mon, 23 Feb 2026 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858988; cv=fail; b=LyYsaQj1ZW947A2uJ1PiixiW9+DpjcmPDkD37zlgViHpXMGT7D5pexo/TzC+j6h1uiB5v+1CKFAR+5YmOG0jRzl+//ppbxRAod2poQfMeYrH1Tb+67XS1a6k8aEajl6n8hBrgj/4697EEqCloFR9OJn6XJ0T9rFTO1Q20z1LHQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858988; c=relaxed/simple;
	bh=d5inGpQkWAAlS8+8EWHIUeLwccsgrtn2rkovknTSBSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=glf3LEMSAtszy2szVyUeGIbXtap4GCZbPBAWD9lydeno8b+JEsWHdNyhdi86N0jVKLAsy2HcbdJV7d7Nq4nlxk9mxQJtTbbQdEc1vR2sMJTjHS5I6a/XwB4vGKcFN7wPIrGTBY+yF98P93eiouZukbDBelp3d+IaePC43tDFkmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GkBVvfcX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PxcdJwXo; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GkBVvfcX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PxcdJwXo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5K98M1041203;
	Mon, 23 Feb 2026 09:03:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gzkil6uEsBJ1cUx0X7MEXySOsr6kVl2Z3/g/A1W9W3U=; b=
	GkBVvfcXh/UefXT9cTS5YX21Ju2xTKDtFIarrqmkdrBNw6qxVssPi8j/hoe3P/o5
	X4/UXwXIYmakoRNaEkhC3Q7Ibvs/qoPEOjUUu9gt2owim2Gw5BBbh6m/HcENUg50
	/1VagR/OXgH2vLh1dWdsyp11umwapeRFy2zYyZFhER637BOoqRXyvJ8Et8/RZ3ox
	UTBcPeEwQ4bzJ3sFpcoZP0Tw69JDs3MfWWGmgl9ufPcoaz5XRHJ9lDpX2STXrm7+
	bwmlSSaUU18R9ZQoUawP3KqS5Hpum1r5MORjdLHBzSqYBYGyJXcuZ90JqSKlZblu
	AT2NFDwGu5BDmvfpOG1WcA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020083.outbound.protection.outlook.com [52.101.193.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019mxy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:03:05 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJ5bRQsG54rxpnR86Ph1VBjPAN+OO3Tjjci9EYhf/mFRrqJdauWZAxHaHM9bpWVgk8uTtItAYGLv7Mas7nRyvrfVyjSQvWs5EtNf1kONezOMgrjfMB5/M2zUboO+wJIaiqla+csTt9El5KEV7j1kbXlhbz5TRtQA90J0XVep80brOJLNocTobY46mHKk38pZRIbQMr2FDapIG4VYjGJ4sSdO0ISjkm2TT4fAiLZE8U03KvlKvdLH0PePDJm5BpOnorut0V18G/7id0+Ebs56FZ7xXT+0LYLeHOzqIRDneMhujxd/fgG51kxeMGK5Yzm63BVpVv4Q5//M1Iae7hj0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzkil6uEsBJ1cUx0X7MEXySOsr6kVl2Z3/g/A1W9W3U=;
 b=co/Z7itWIRa6XkuhLDSp2aXhqyfSlaVeezIVijBR7vqKaxyT0+mKePGXRIHpqAXf9ZK0xoBiw5e59M5XtLzaVSHiTWF5rYvFr9lHJKCMSaFAN6bzDZHTaquXNcdZVwIiC2Us3vCoP+bb4Me5RA22hdFrygNkCD6U/V/phn1fROmepE/IBLoufkEFcW+wor1g7+krEF4U1ajhhmTLdOEcSsKVc7fiNe1z7CI78pWF3K6h/AnG9GXZ3CuAWBmtOUKDkUKYcmVK9jmKjRh5n5gVhgckEIq/IaQRs1BSFDsUm0NktdFzeAMYzfd/APG61a14QRw9Y3cmwPGb05J7Vt1YvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzkil6uEsBJ1cUx0X7MEXySOsr6kVl2Z3/g/A1W9W3U=;
 b=PxcdJwXosaMKnetp3nCdFx5Qg5p8ndwVQ/BRNeJ0sxNiDlB1V1G0ewQfoPUZ/djmyqdp3weDBnQRQ4QWVzuyeYQmekaB9GUIx25hMR8COt00uSDz9Rlt51og+pP0MV8nIFI7s514efTrxfDYrbZzDUA8djJAWwwDZcIgOGu1pUE=
Received: from MN2PR14CA0023.namprd14.prod.outlook.com (2603:10b6:208:23e::28)
 by BL3PR19MB6442.namprd19.prod.outlook.com (2603:10b6:208:3b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 15:02:59 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::2) by MN2PR14CA0023.outlook.office365.com
 (2603:10b6:208:23e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 15:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 15:02:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ACAB6406544;
	Mon, 23 Feb 2026 15:02:56 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9A48F82024B;
	Mon, 23 Feb 2026 15:02:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: SDCA: Add CS47L47 to class driver
Date: Mon, 23 Feb 2026 15:02:56 +0000
Message-ID: <20260223150256.326143-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223150256.326143-1-rf@opensource.cirrus.com>
References: <20260223150256.326143-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|BL3PR19MB6442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 13a9c6cb-c487-43f8-af86-08de72eca14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oHBpPb1fVCiOwLUGu4PnQALuthCfzC10bAyNoi0NIuj4MXS9zQgrDYcoZjl0?=
 =?us-ascii?Q?VS/V5O02HueosTAsuzNF5lyogEY0kqw2AlSL+M+p+8PYZ7MPj1IG95W4WMdQ?=
 =?us-ascii?Q?3EO+s7/kGPUuwNnvafDyT0N7Eok7AFOm7QLQKKIgSx+bNIu+9iJWzBatKOjL?=
 =?us-ascii?Q?F6vVo2cWBKEDQsoN/+oR6y90lFCY4E2LXRI0PVOW+hfXfugArMWmknv/EfA9?=
 =?us-ascii?Q?BUItI71y5zcUHZCMEJukLxbiv+qFS6N0TFgSXCjv/6aZQHhGDQ2BMjqMk8rN?=
 =?us-ascii?Q?FMD1/+IzFCH6NSHWBtpEh1g8LFwRTzkvdGpLJunrCn7wlX2g2o0jAZJBTDY5?=
 =?us-ascii?Q?Hvdw1jAwFhkUNRNwBOrhlUXtdCTcWQVJOQ2iympNUr/nqmVrgvqSLqgO423X?=
 =?us-ascii?Q?srBkMzcrckEtpHYqUERF98mdaIRORwCg2wTATH/EjH+Y6xUZ1t7nbByxebdQ?=
 =?us-ascii?Q?T0XgJL3t3ZHJKijYzN73MK1nfUhGw/nJYa/f20GTCtXpkFtdl4CkxqMBDOS9?=
 =?us-ascii?Q?tDVSs0YSKT/IIIwoN+HmP6H45ZenhwrwQheqGigRF3R8Dw8vlH8VhoZJ0NAr?=
 =?us-ascii?Q?AStS7XhclIUFhf68EdJGOtaWUBzotK6MnPOFtqjhix8J89GiQxXhiZlsqRNo?=
 =?us-ascii?Q?v61hANcRLXPXc+PRiq+2NvUJgIbkOD8Kllj0UE+oY9g2Fx+ZbdsQxCgJxgdM?=
 =?us-ascii?Q?rK2EAXPtLGcVAkg6lvC95dnCx4Z8DBp46LtWnyucbN1Hwunhl2kbALAQ6JzL?=
 =?us-ascii?Q?VyAFAM8U0zlCH5p7YguFA4vkqRmQygutd5t6iXRYDdroZpIv29mTquMSmFnR?=
 =?us-ascii?Q?0LIX3Shz4RKWXJpC5p/UpZB6oO7fRhss5+MHOAfrtshOdaCb6T36S8D3rGJC?=
 =?us-ascii?Q?CFHaDcXEBo6JGITjRcnwpwLbHnFQ7+td1BqyN161nLT9o6LgvE8dsAomIh76?=
 =?us-ascii?Q?np3s+wyBlBd6VukbajvO6iclZDmBdzN9vF3DtYqFpQlhDAEoPMFImbJCihUT?=
 =?us-ascii?Q?t40kc7yKypLLcZUW/udKGAu0nFHjrlTwtO7RtubWj3KoFxdmfuA0oVrPMakz?=
 =?us-ascii?Q?LSXyl2CcBLCAc0tYolCBJnQbCAiLAHbqfyMEq3eNBwF9pjKFWOJ+Ff2aIEs7?=
 =?us-ascii?Q?Tf+q5sTMohqX3loWhZy7xGr8er+KnduIeWb52eR2qe8YOSVL4uWVQMQX8RWw?=
 =?us-ascii?Q?MO7H/+SbwvGpWbv50T8MUevV91i8+44meP4G84OMIBFsTVmRJ+z6ocWKbtTJ?=
 =?us-ascii?Q?vQdWNXRE79HPtmENdHDO+U+HanQwwHJfFFrGrRVDRKQ0hM2lJ5gATzK0bN1H?=
 =?us-ascii?Q?z/tYLvsKix1BQP6Iqjv57JZ6ghWqlaOjvby9BVi8zfE00uOwy7rHOJQmXk2u?=
 =?us-ascii?Q?ExloN3kG4nerqF2EXU+VlOWXr5c+j9Z6qCvtCKTZm+eVHX8PZ/dYAOW9ZoaJ?=
 =?us-ascii?Q?/AiiqYwpXNG4NIXAzBmUMserZ6VaqavY49G8t1ktLp+BMwWueihBqhqB1TAf?=
 =?us-ascii?Q?JG6dZX7BrX+1B2LBJUI1JVgYXtIvhAzMk3cjwSEO3tjDt58L7eqF8wbweVjc?=
 =?us-ascii?Q?+gbBXXp/pBGp+QqXSfU5yaYOnC3sMymaMTQVi3JyuFWYrBobixDWrFOa1xmw?=
 =?us-ascii?Q?sdbx8IhacIY5UBYIAesJAVsX4r/jAO6tgzzfCSWr/tZ8jywOiFVm32qw49Nk?=
 =?us-ascii?Q?MU6XRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L/9uJHx6ICXbKWE9yvw41IvdyYM5Kwym1RIdRGLWS3Tqg8lyKWwoGKbxqawGf/N6EujsNzMbOuMMvljvMb9bqfwztJ9hnD69Z7W4lT4C7j3uCdTimsLc7ibIuwxGNjjg7bTezRU0QDm0HaP2SrbqzjtwE1WVgJvBSop/iteZfSILQ+erFWxk1RRqQt8bKV0csedsYitIsu5tkd2VeAdUqVJzMujtiUvK6yXbbX1kbuYOhUwcl2N3RSXj4WM1u9Im6GTO++ISIFDb28SxBYKZaHUpMuM0GkP59fqHcmGc8W2HkW3kGqqmzQf7RDM2HrhbEs54qnM118SFUk8c1lu40+icX27e6qY3NpTKxifhtTjPl4aQcEob71vZuyBEdoYxaYSR1PSX93+s++lrSZMzASEsen3xx/qrvEQ8HDIaCsu/87rmLbnw3ZV9pXHD1pdI
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:02:57.5069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a9c6cb-c487-43f8-af86-08de72eca14b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB6442
X-Proofpoint-ORIG-GUID: ACueee3eMb9Vl4mnZynUlsZZVE6bGJnR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyOCBTYWx0ZWRfX3Us6NuG7mBbY
 3yJmmEr+zAK5lpElUVGRINCKxHmPtPtK7IEatfzkVi3h0oQnSPrQWt7J6iF1aLI/plKQg3hQgXf
 5bsS4QyjwIBUAo48ASpuAcKo94Wkv8OOh+Rx6FDS9LsNoggQoxmSK2DYP8QFsXFFkMFMB25774K
 VIyhcVA0Yey97Zh5xyRdt9c2b8pP/WXHyBqIsII6LS3Oqu8Qpc69chptDlLax2Bw6YeqCGBlWkV
 HYslrdQE9JTeAUv1KWU6zyFMiFurVi0TlXd4z5r6TzG8efQgprijCyWu2qS7iQJgU5W6FS4voZY
 ZCHYpANZ9F6SYynBjJeHc1A6/Th6jX6+Ohbu3q1dRh44d68VA/cUXddW0tDWkEVn0qhF5M/0egL
 F5u4qSxfECoU3fBnQzzT577CXTaRZ6vjwpZkULGcGCHtF3Zpdb7t0gq1HojCU2VPuhqrCo794vL
 GBTjpL9/nfZWWiwkBZQ==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c6c29 cx=c_pps
 a=Z408G3IxvFbrXbiWnw16Dg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=mudPQ26boYxGW969GCIA:9
X-Proofpoint-GUID: ACueee3eMb9Vl4mnZynUlsZZVE6bGJnR
X-Proofpoint-Spam-Reason: safe

Add the SoundWire ID for CS47L47 to the class driver.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 918b638acb577..55c33ff63ca21 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -317,6 +317,7 @@ static const struct dev_pm_ops class_pm_ops = {
 
 static const struct sdw_device_id class_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4747, 0),
 	{}
 };
 MODULE_DEVICE_TABLE(sdw, class_sdw_id);
-- 
2.47.3

