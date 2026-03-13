Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B3436164D;
	Fri, 13 Mar 2026 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417308; cv=fail; b=Y5hAO1a4Y3WozmPo0shWPbMdgGPF2+pMGDsKCD2bk91KYj6jGXMUgugBEUwdFD3B12hXeZSGU4grDdsPtyl/gwcvh3KFvM8e15BXOLCU7gPwTMKkzIbNSmoVnpDMPIdHjobKuGCwCLNXACNxT/7yKtNQedx/g92sDhkocJNwt04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417308; c=relaxed/simple;
	bh=w4kvtq0A4ojDMtpwhDml3xr5WL2YoP68MnDCfZNYzBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HdcAqe2v+j76fhP0oO7fAfa7svJnbP0Un7iHhNAF9EII5CdTaWTkLCb/gQGvIuDhjEzt5fGGdSf6US0UVW21RFjd1KgFg5q6SXhWdgmRhYUMxNdCLMUElFUJpEMZztYPxfIVMP1S8FuUN6Q6ewDCDLNm+pgROvj9pSXHiBdC9q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S9WvLiIr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=B3eVQR5z; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S9WvLiIr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="B3eVQR5z"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7Y1EM4178471;
	Fri, 13 Mar 2026 10:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=y8zaZykKdaBGE9Pr
	Z/V4fvJRprVmkx4qd4szbVXhsE8=; b=S9WvLiIrGhuAhPb8NGP1c9PVvkJAxW2/
	y/L9grGHNLxM6Pnizem0XfycidjC/HN/Zqil9UFZc6WNgDVFwuiBTO5rcIXiRujY
	KDw+w2J5HSqHTtyi0Fs7iArndhlOVOC8njfTvbbPd5ozSaoVj2PfJmREjjJuG3XP
	HJghJ25tkfI7IxozKpmAt1Lly+9ewEatGsC23VckOxta2eY3oiELv878Sw+Y+qiy
	bMLg29/DlG5kHi4LzcZZ5y56pbXi0fRNaOLY7EjYX6T9PXYUj1lV0iRSSRseZUjk
	Z8K+3n/hI/hOfvFJPjfo+POe1wJ5MSxAJ7pafKBXNsr5O9/li9FFFQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020084.outbound.protection.outlook.com [52.101.56.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cuh7gjhhm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 10:54:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUmQq0yd7HN9NCU2q7Be8jXbl1I01Tzm98pZxM7yeZMW3pDKawISOpCj/+Z2eG8F+sH5QWXWzkCcBHrWKczQqYGAxJViGMP3IsHAyh/vdw9lrDv8nPuvYtclvzGC+r/EnzJrZgoV/UiuH4qrMwbn35Xlm5ODVXPdNljZn9PsoQSmUhgeofVRxsFHR7O1FtSq+wG7V+y+HqAmmn7ZkiGuoGYMSelWeT8vQnNAw6ztraX91NTiuCIzNTY2zfNaYh4ceu2+ABspTvJfZ2bXnS3hoim5CT8SUT/L+4rqR5AU9uNtas/neNeIV9bC5YFv1CGGtiPZDmuRoJw2Df9gqickbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8zaZykKdaBGE9PrZ/V4fvJRprVmkx4qd4szbVXhsE8=;
 b=IYkVGnpHWrh6+xP28wQYqepmaYa/JcI8YlUOCCRFgMvTdVJ0uITyENtnSIVs8Ckj23+IQ7m+D0m6G0RUvHoMDhmKGsqS9GRO/5m0sGzbP9wvexWCsnD83vsK8R0D38vMD8s1KjPkS611uthrnUHqaZ/L5aRuyaBzoVTNuGH2bjxPUYaRdXkjPKYMU/jfpA2mbtxrQst0N1ghvSTnpeM6a+wMfoS7glN8Hg4InOMSla//0FLK86IY+Yoa+PcAJ3iZricImOsLR+EA1QTYwZcCkOjHnChUrkwPwT5QEARvFZ59g/S03wl29iNkaTJ3IJ2UOLaIkGNfxR5iXNRUOt7yiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8zaZykKdaBGE9PrZ/V4fvJRprVmkx4qd4szbVXhsE8=;
 b=B3eVQR5zcLEwO0FEqhTTemiO3HxUv9JGzs83NzoSPS3fUd2WFT8Esyswyi7pt56ohDFTJwhmU4BjVwO63ZKFAa4ioRy+ma9YHWvpU2Nq8rck6DHr3zX8Xy4oT+WHYRHcFLFxtV4AAwSEAeq3DuBxGo82UxVahsUPWR8h8pnEXmc=
Received: from SA0PR11CA0142.namprd11.prod.outlook.com (2603:10b6:806:131::27)
 by SJ1PR19MB6332.namprd19.prod.outlook.com (2603:10b6:a03:455::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 15:54:37 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::e8) by SA0PR11CA0142.outlook.office365.com
 (2603:10b6:806:131::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 15:54:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 15:54:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B296B406542;
	Fri, 13 Mar 2026 15:54:35 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8ECFC82024B;
	Fri, 13 Mar 2026 15:54:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: intel_auxdevice: Add cs42l49 to wake_capable_list
Date: Fri, 13 Mar 2026 15:54:28 +0000
Message-ID: <20260313155428.1934196-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|SJ1PR19MB6332:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7e930c5b-310f-44f9-6253-08de8118d42e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|54012099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	An3d2i403PMpPIx45/7MJ36G5wgGC59HXM+XZqwe8HgrqcT39+MVhhGhHB2ISe9k8vEWXCrsMHdOpZqImdQvwrrzbOd/oRo2nEVHaXAXY0V6f7BFuv4GceJ5rjBy0q1aweaXOvg5YULbizNjSZh9lxaRLy2gpVriTT6cmMzZatu5+S4SsX3jg8jzR/ZI5ilRRtQ0J+GBqtt8EArQt5JbZBvIh/1ubVxcHNkRm+TFiieYknKOkam+rr3TdTfOutN7oxIttJc1iW6sHLscE4HQwHvMTX1ODoc+TFQ1fAk6SbYiAlplEJhpWOokulp2MMIedqJcuQcu8cibtem/TgaBGcoH3z8sCnuO4f8PaxIbKEDQA/XdSiTl1t4/G8EZSkNHpgo7fPr5HOOfwJKar9SpRKHF1teLhdfv/h0OIG+vO8hQeaY0/kMUV/0irK22qnfXgeI7mYZFXzKcO0m8CHxFEjX3/Vxtl+6NRz24aZldNOaFpv6Pun5vWKIvUOYYjvww+ZjFT5TLcwxgSL3/FnwCkm17L59zk1HHW0r2n2yYY7bpVZy1r9xDFdQAPE+cTnj9e1HmBq0axX7VYjmwgixgZUTxTouv99AI19fL+70ASxZajpOWvXjmhiWako6PTMjlNLRE3c6ERjxf9IXHz2cqqIYHAb/ni2efem08499U5VmEDykM6+AXxEOzLs2Am/JOLvKlTdPRvarIKHphBcUAFcNf77wyFVzxCe/bf7p24tPJwNmTCOICld9C3bcCDddTfCjCG2Pn1fShcd8XpjyGCw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(54012099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8tSrUZDjbhZIeG9BtsYrpxJIzQ+iaOjyjV708GqogGpWTFWL1mYMmYLd2iH7TpsPwWeumBXIf/RJCvJrb4qCIF0lE/+66ldbQeT1bzysPrIsJmMMGcnzVEj0JFxYYGybtr+zRChxkl9/v23+k6VhSFGUA37ZJKUTs8lVh5BFihsdayDg8vHWdNJSxyETRSOKJj5blEssNsI4ODMTXgrlFjpmN3UUaaBRzzE/DReHKGnXuS5R6EclCpgUiqQDLhijt1Ca8k3RkL7+Ho077eTrnpIK1Wg19XzLdR9F1v5tuprtWyvwNiKaCI9dADjuAcp7BwGX9QrB2zAjDQKqjVsu6nPIjEp7/ie57pwn2w8R6n6eaZhp5wm6ZtX8tzokN86mXdpZ9b00ZqhpRns+FD6cm0QoRCghXjMq3HRAHox+SZ2Hr+G6L5feFKVfv0c4vU4u
X-Exchange-RoutingPolicyChecked:
	qdRCADBo8yVPjgtRawUwUQOahwMoEUjaakCli9X1jr82gbRs6VYpElSTZ/1JcMl9Lq5LEUqnEHOsp5By5cDLTfPrXgnnDASySxvZQdZ87hQuGnZ9NBKuxMTr+q7gLRdZ2nvwlpfCA36dpNSmODgmtyHoD/AoKMrR4fHsvXNLDViI7JxvG1uckTmCPYg6YqzZA3rx/tReaTo+roj2ly8/4Swvczg2LjVynu9T/PlPv1NEFcBfG5sVHE/Z94XH7Fe86Mz/sbOCuwH+Sxl/xDme6EWoci7lkzNx3YK2iB/zlHwLDY8s2n9h0IqGxZExN+o6GbsMDnxn7ozJJ2nxPpMrgg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:54:36.9439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e930c5b-310f-44f9-6253-08de8118d42e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6332
X-Proofpoint-ORIG-GUID: l0971qVhHhP23SfSlX4ixSZdM6RMrKWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNiBTYWx0ZWRfX3Wvu4P9BxRJ+
 8fhTE1Ancrl6Zz1cqGNXvm3Bqjk22f3rmQwSUWUtTRmzAXKPDMw8PmMfT0PBi1kQNTkIk+hNEHn
 U14/iqm8Ct291zTauPvuxnfwNIImgQVaHB+js8mGb9HIfUOV9ZzKswqrlvRp3iizqaDp3FKKDn7
 JWyS2ZBgEoEANxuYKrt96CSTWuHLwzRisPhSuip0MscVA9swOcYr/x9sM/Xu5ytHYTEe0I/vBkZ
 9oPeyHUWocnKdjcn+cyaUkOnMXqJXhaoUcXUy2TgHrgrSP6N/rptONnUCBCauXqKqV1LX+XMC0V
 KSF/Z57cyHGuaDLrwtcj99AGEoW3kUqWE16QplYCx7MJt4NSD1ntVrpE24OPzcqH+WGek1npKm5
 ki2X5Cnz7IR8qAOcQY256/TrZrfJ/eNZVsfXR4YGAK8ZgaFbO/rknvBUSfxxelgWQMayKow1cky
 e1orZvTj0G4BSR1ro/g==
X-Authority-Analysis: v=2.4 cv=EP0LElZC c=1 sm=1 tr=0 ts=69b43342 cx=c_pps
 a=bDhTPyikPgEfglgx6EBqWw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=D9okmnvGtT3Wy238abIA:9
X-Proofpoint-GUID: l0971qVhHhP23SfSlX4ixSZdM6RMrKWT
X-Proofpoint-Spam-Reason: safe

The Cirrus Logic cs42l49 codec can generate Jack events so add it to
the wake-capable list.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 9b92ffdfc73b7..913e95207ee1a 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -53,6 +53,7 @@ struct wake_capable_part {
 static struct wake_capable_part wake_capable_list[] = {
 	{0x01fa, 0x4243},
 	{0x01fa, 0x4245},
+	{0x01fa, 0x4249},
 	{0x01fa, 0x4747},
 	{0x025d, 0x5682},
 	{0x025d, 0x700},
-- 
2.47.3

