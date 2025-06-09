Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A05D253956
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472810; cv=fail; b=pBPsTKw2yMLSlgG7iVD9ME95qiyV7Mn6dMS1XVU21VeTjj4sTidPW1C7FXPgsjdz/QToJongI/8d+YCrdE2pMpbEkD+vxy1TqDNWu3t94dw1o0lUdwRpalDSqtIu7lpJaakHSbYEYFyPpONj1whdCFn8p06kak8xbhlmwhEdSws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472810; c=relaxed/simple;
	bh=g3iT4bnTlXot7J6x7y40fRziCqVtby+3GJquXTDaXwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F2ih1/RKtcApMdSeHX5KzGtOkBlTSIjrsABPd/tH0xjJP1PHggWZpHZMPhOEvKKYoGB/a9WAQqJw1xMVILtqblr8wKy+1THJYI7TzXN3fqgBduLVLdMY3TNuz0P4EqyCkdrFwq2CqViLhLyCP+h4qo5aoNFlO14MJ+4deX7+IP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jYRbCsNv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MRTpyVE0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jYRbCsNv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MRTpyVE0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BiJuY024626;
	Mon, 9 Jun 2025 07:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=a50bcfZoPAUdfm/rEI1rmPe7RYWMaB82IDn0nCZ8wb4=; b=
	jYRbCsNvqk0q1kIRP+zt6OS3Rw/Ks4xwyOkRx14Nfe/pNcrqQaMzvFXZsscCMY9j
	vKyINEQvijd14ARYNwGXspYX5LovFqcn1u/Trzro9t/7xfy4Y1dJsgg89GD18HK/
	aiWUtaUtBgOCTI2rX1sDx1hbReLy6TF0JSqZSJ0ltfMingdeFplOwJOEqcwQ9aW0
	hgRHxXdllPP8bhDcNyptuy9YyqSgD1hXzK2AOg7aY8ZI0BGaZhacEzyGDzpXZ6do
	m4xj6xf8vOiAOB/WJQ0Xt2UstLwU0+Gu9RYVKWlwwpgre140PnKbRQAX7KMH7zKB
	5TjumuqgOX490FZbGmOHAw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2224.outbound.protection.outlook.com [52.100.166.224])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 474yktheqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 07:39:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIpsxa0ZGxGRo7dyDFtCguVwEABvhUrYXmlXwPE/UBi6KZZx6LfQkH7UI63iCJI7lQGmE6OLnRSRgyo5Q7f/CSvjZ7OBQRO7DQ9SQ4pmkbGMN/47rmIPLzTPe4vn/Tyg2K+UnlLMbkynjJVecdCMMf50pyTJk8MoVtUnPp5jyhJzbyXojPeulYUSLibM20XJcPi6qkfhGEPPbrFYDpiZQRSRJepdPKHq62Bgyse+jBziH6nti0hOn6EoZBc8yrR6uM4uaH74TFL9Tf1HhicGNz+Snt5qvV2fmIUoOHUXkj9qmyHTQ28bQIrMaNABXmRIdiQjUAt/LCPvxZNDJya8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a50bcfZoPAUdfm/rEI1rmPe7RYWMaB82IDn0nCZ8wb4=;
 b=J9ck7fAltGJkVxm8qfvf7R9KfQSEEzRFXBY3AWS6AVhGBv2Bqsrt28uvJchVerKWnHZZnKSIq0xfgr9rmsuZbwa28pFNr1du1QEa0QTxKm5i7vUjU4vQ0O1OcCQDsI4JReO9xud8IX7keDfBRFR9h0w60U3gX8wUNdyeJ0sFyoBQ5Q5lXvKPQZ83Ry1RWTzFNQQ+AuzPmr2J2PAMCifXoHl8OT/kO+5nklKYE++ocKWsQR4iRsrtmMYzlZhgyuXuuGjhH3LBQl9OegyowlSz9sYfyo8OU5zkeJe9vS0QEz6ntmIf8cuKUtEjub2fGGT0k1P3lBKInEWuiFHmp/TOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a50bcfZoPAUdfm/rEI1rmPe7RYWMaB82IDn0nCZ8wb4=;
 b=MRTpyVE0/ZNolZXYxDnhWND2/jKBRHxOvADy6jJV6/qhjFH5ogKy4hRvt3WjN085dAYabkRIF+gPLooaARFsqOyaRlq7ZLEQkuWzUH5iF/+CkegQjqUGL2+shSliGEpNLkMWsAxEAwoiOuOl/CWwhwMq4NOilUgAd6Py3wbqNqQ=
Received: from SJ0PR13CA0140.namprd13.prod.outlook.com (2603:10b6:a03:2c6::25)
 by PH7PR19MB7074.namprd19.prod.outlook.com (2603:10b6:510:209::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Mon, 9 Jun
 2025 12:39:43 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::65) by SJ0PR13CA0140.outlook.office365.com
 (2603:10b6:a03:2c6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.10 via Frontend Transport; Mon,
 9 Jun 2025 12:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:39:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A076B406545;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6DB02820259;
	Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/7] ASoC: SDCA: Add missing default in switch in entity_pde_event()
Date: Mon,  9 Jun 2025 13:39:31 +0100
Message-Id: <20250609123936.292827-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
References: <20250609123936.292827-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|PH7PR19MB7074:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f8b2a76-c478-4e5a-67de-08dda752b58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|34020700016|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Z4aia1pwNkvz78/Kmq/38GExHxCFGKbtbwPSJwBEdyiCe+wfvgtLsyU4QoO?=
 =?us-ascii?Q?GzMAUdtNjyOu5JiZgUg7m6nnIMOQwlg+Nv2bL8dlPJIj1L7byi4lydDy1Web?=
 =?us-ascii?Q?CVlUWF6ZjqKFxk0VALVDnjUFuWFPNEZjMGZIiYV5yKTdZ37cukGwvF1Y8hhk?=
 =?us-ascii?Q?8HA1qK0PqmgUgw8tMFKJu0CJh84eqCJ0Cl74nSu8bKJ7PmgGOACoBc33ZWWY?=
 =?us-ascii?Q?B02sV3pSPwDj4nKvk9SJKSznBv6OvESuQLJ6nQrbwHaDJgLTlSGpseIxg65f?=
 =?us-ascii?Q?umn30DpXr4wdTStyCB1fTGmUstNDx+PZFzurREp6aVzJSijXi/7L0vIPZfeg?=
 =?us-ascii?Q?eF9yjMriWW2LgIRRSUmFh7Qa+mKaSxhZxXXgMnPxliQux6EfCgpBVju4CEtF?=
 =?us-ascii?Q?dOGkAXOKXf/OznUAfUhALBlo/cXvacYO0hWbMKLUxnQPICvw/T3lCaPB1azu?=
 =?us-ascii?Q?4fulxtUTrOLtdh6KxgeSbekzc4qh5GqrBmdJ+OACqgJPMiOGRUsIGnlq9e8x?=
 =?us-ascii?Q?TIk9Xkg2cAzg/Ce7q/IvZ0HogC8cO6dj/Xh8dCKnZnl+C0aUQpxun9OhIS0r?=
 =?us-ascii?Q?5yKghZ5YrlDhMBVsp43lwUt2QebQiLuQko2T56+wNT79IBIJDFciReRcG0EX?=
 =?us-ascii?Q?TGlU+4d3tj6jewX+kFpvp+Ud+joLfS5PW9FQKjAVi+WsNWmreeQuimhhwG7z?=
 =?us-ascii?Q?AkkUSBrwcfUFL9zm5x8+WWZWp8x7C0kcZwIMUDTQsjtDmPmiXTJUnDpqqGlL?=
 =?us-ascii?Q?a9O/4eVCaOBbvGDA3EC6pTctI0eAGxtkWigDCV1RDZn6wvX64Sb3g6jwwJTF?=
 =?us-ascii?Q?DIkbq2IIb5POj6S54WEOrsMVjDJ+McfDKH4i/+4iphI5o3DypTI3IJ6rnDPM?=
 =?us-ascii?Q?F12v0P+FYTXLpv5A026kb1Tw9VRQTaKEiz4/bo1TxZUHl4ers2Mii36x7TMD?=
 =?us-ascii?Q?mL6wXWK+w4KdSSAasdoD0IsznrWf7xB2cJAYck9nae5B2GBHgOOKczlU0yYY?=
 =?us-ascii?Q?Mz9cFYrj+tmpgf28ijXLsLH0e7IvDRrOG5FtcDvyZPiehvgzE+lMdRcUR8XP?=
 =?us-ascii?Q?deV+X6NCMEEvd2wfl9goyv+VkOVnN2IcZVUg7JzuywvIhFHV21Vvtpa8aJ8r?=
 =?us-ascii?Q?OD6wy04d4RoXQFwMT+AVkPVn0/2uNfw6P2/ofUvuHtH9RCMZMZvH0hAMc1Tr?=
 =?us-ascii?Q?QC6zyscI2zHlIuT1aDRE7rwuzMIDRKCK0uroncSyMvxA8JFfA+91Hv2S6eVy?=
 =?us-ascii?Q?MoALQfXNzCFg6yOV1hZbWUizmTQUR2LO1RXnZGgnKBXriHUCBgdmYmS21/EI?=
 =?us-ascii?Q?kjKSD0r8TcNFtAy73uP6unV+9NQGG42N6S4p1XVh3CGO9EmrCKiB/h6SdZEy?=
 =?us-ascii?Q?KQkUQNTPl92d7/P0Xep/2nMUniVwMcZO8UX1Yw8/MXhz1wb6vKZ7ugcfN1iz?=
 =?us-ascii?Q?OrxUogigjZCmo9HNouZdSTg5ZGl/XROaxuBy+KDn3bwKVeyWwzec93Sf/1Yg?=
 =?us-ascii?Q?ofS2+v3WPf9JD6DWxk4R8WA37Ox/qlyBEHCH?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34020700016)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:39:42.8549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8b2a76-c478-4e5a-67de-08dda752b58c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7074
X-Proofpoint-ORIG-GUID: 9ud9eU1ODcJSJXtR8KroqolsXFjn24gV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NCBTYWx0ZWRfX7AIm02oGdIsh +itAOeZmRvkSUZU1XYjoRU/1UO+ZEGjaJwIwZGOXhhCzsS70e6OeNPP5VIhzJ8yYOIDiuZccNVh qQr3ZdcTzVC4gxE1tNfCtO2gyCZ9s4I0s5tSkCaQalTX08qMwyF6PxodMCCc5mrTv2Wif1/8pdK
 5UQRx3l6+Pf6HrSucfOAwQGwVHTco3wgrIHmljEHbd7kyNR5nTLx4QcXd6LZoIFygJNEoWswp2l cbdkNenYMAQPUp58EMl1TOUYXKjVO5UWnU3DIPmUonMul//ZJzdgX2+G/0yZhBvpeVVTi+U2/jm OmMfRnPy7LFoFaeombklQGULF30iU2Yyf69K0iqp6vyybKhOzTTAL+iFG0PryOeihu+X3UiINQU
 /aabSA7PLZxuEc0oCIZ63FLljJUGdA3PPu5t2y5g5dUqDjy2jDsF5rVfWdk4lISQchwaVPz8
X-Proofpoint-GUID: 9ud9eU1ODcJSJXtR8KroqolsXFjn24gV
X-Authority-Analysis: v=2.4 cv=TobmhCXh c=1 sm=1 tr=0 ts=6846d614 cx=c_pps a=E2u7IoMyB+9ous+9OvcVXA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=ZBGwOkXtnfsepqz8Bp8A:9 a=zZCYzV9kfG8A:10 a=cvBusfyB2V15izCimMoJ:22 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Reason: safe

The current code should be safe as the PDE widget only registers for the
two events handled in the switch statement. However, it is causing a
smatch warning and also is a little fragile to future code changes, add
a default case to avoid the warning and make the code more robust.

Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 7bc8f6069f3d4..e96e696cb1079 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -397,6 +397,8 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		from = widget->off_val;
 		to = widget->on_val;
 		break;
+	default:
+		return 0;
 	}
 
 	for (i = 0; i < entity->pde.num_max_delay; i++) {
-- 
2.39.5

