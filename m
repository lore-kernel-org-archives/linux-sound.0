Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310533B94B;
	Thu, 26 Feb 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109685; cv=fail; b=P0EwSbpJ0tPVU53ayRI+7IrK5Sa3B9TXSCXr0TY+hEvCFfD4w13p4V3Att0p5xuRvs5CG9+lLUKyHPTpcTXqLfin3SqIbrV3D3JhxZGvSWKFZILgfCwW0OyaeRD0/fzGC3YRCBa7l9wdHodEeuUZv1o6CoclC6oQGPsGjNOG6Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109685; c=relaxed/simple;
	bh=1FutGSY8Aahm2O7wXRvP32j/NTJzqmyEjxwQbllOSgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i+HBtX7+2tFnxtyIaHC81spdxtDXeitiGWzlIfrH9CYtU+5JsgnDwdZOJQNBovm1I6sAXl4NisGeKxCsG6XK+3ouYJQx5gSE10E9F6irPS0xDYeMx616RYzq8C1MUVH5cQtrgoMMz7jG/z1St+bMZbVbCRzHoZTMIGK9tbnn03Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XcIGwq2j; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QFbyrhMb; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XcIGwq2j";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QFbyrhMb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QCQKkn1246240;
	Thu, 26 Feb 2026 06:41:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=idkgMgmZcZOuTpeo
	nLDsqlr4rl6bJ38cqYTOJOtxzgM=; b=XcIGwq2jMmgl8Hq/R5FdenNxjZqqAKiB
	MijpN6pvFJRIUdoQjnAuE7yYwr3dn1FaHhHqiy3fV8G6f5dMh4kNXcwDkfUv5aWm
	TpLM3p8FyVHBWfqSyO4uJ8hV2utCIQsbCxc90XXY40/HCMHthyUMzPk67rde9aaE
	DzVDbWbGgnMBJeSahKnqpaKiHlWdWFOqCGvIAJ5rnYq/zQV/0+ulzmmgKGK/N6gV
	K5y5cacsY6hvX1Oaiitz7AGhEj632SxjAmsjMI6Oni5Hx/+2AXSB5kzDos98378H
	Xp0oHLgxd3+aCWn9domgC6QxUXMJ/r3vFjIx7F8fO0M0KBgf1SwgZQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020137.outbound.protection.outlook.com [40.93.198.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j5uyd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:41:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex6cca4KhbHmOjCjg2MXQnbwgG8UDZA7m0eC+uNeD/ocmJbJ9Rwm4P8x6eI4Sx/VBXAsa9nYBE5faqJ34PYeQOi0HNYkARYcatAhPXAQqPtILi6gLnRIywLlgQ2jvyd4GY6qUl3k+Kbi6U53nTJcQeZ3M4JF00Qn3qsY+KX6zeE3QxUUYuGI4UzMeWRjty3+NI111dL4TMpqQTGA/4uhMIYX5ftItfvB0Bae+eMV754BKHprDwNPDnth99GDn6GmqYPcGDVqs020KDIYDyiyZmg1cGppcb+7ZftEs2vzye1XC6//fBYgN0DWpUbEaZ56ybbr9YoJCclQkMVJy6Gmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idkgMgmZcZOuTpeonLDsqlr4rl6bJ38cqYTOJOtxzgM=;
 b=EjplnpsemrXByigZpGZZCp0qjHvwDyJ8eAETy3A82h1eSFIzz6fHtYxkVTg+34tHwN9aqUg6XuPDdcrIXc6hGtBtabVSq6qFErO6kVHV0aXeE02Yh1eTsWkzhJt64pM8v88miFitMg6+gwaBw/HV0CPgavB7fdBEuOZ1mylCitKG7FafghlMaJvRsvV2vK4H4PvrvB3ej3wZtsGu0xcog6IDtG/fdS7cpejM146IC/4VQEx2ODobThUaDiCzQMH3GCJ/nQpEDSGqHIHrqu0UyXmvlLo5XD0hSs2H9clXrPkuw96dXONYacV7zB6HZnXyZVRTqseZXWpy4b0dF6ddSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idkgMgmZcZOuTpeonLDsqlr4rl6bJ38cqYTOJOtxzgM=;
 b=QFbyrhMbliTftqQm/UGd/UTT93FleGNjxySfwmgAd8E0mcBVDcwS5Zz019ifKyqMVvXWqqdinpmlL5Yxio6WncekkQnuTM3ZJYU6g/R+2noN5i04sh3DrsYCRlJxuJAvG1OuXfSTQ+YHmY4K8Rto//Fmth0fGpngUb+ojAA8PZs=
Received: from MN2PR20CA0066.namprd20.prod.outlook.com (2603:10b6:208:235::35)
 by SAWPR19MB997276.namprd19.prod.outlook.com (2603:10b6:806:4e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 12:41:18 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::17) by MN2PR20CA0066.outlook.office365.com
 (2603:10b6:208:235::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 12:41:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 12:41:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DB2F5406541;
	Thu, 26 Feb 2026 12:41:15 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CD46B82024B;
	Thu, 26 Feb 2026 12:41:15 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda: cs35l56: Remove unnecessary struct cs_dsp_client_ops
Date: Thu, 26 Feb 2026 12:41:15 +0000
Message-ID: <20260226124115.1811187-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|SAWPR19MB997276:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0536c928-8bd5-46a1-6900-08de753455ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	joxc1spa1fppdNkWwONczsG8fr4+4P/xA2p+SqQ/k3a11C/19eo/ZlH4Wab/fg11z7FcaiTXSvqNt+DpDrXIU90Emv1Eh8ahQThrLXbCfcVOaVqiezaBRF0aJuqXwRWqOhC9tjz69ezAGwAkWtliYHEffbBOWr2EnmJiPYELYijU1NN7zfKtxUIhbGxt++uGSgljYpqMq8hLEL+G/NyAeRdn1PfJkvQKodF6uCFyqAbPjX+AAy9AzcLKvVZIlaZVtLX6QxTrZYzMDk/mlENgbpKkpDBFN4jDpDqJuBwI0ikJ30iPeXBQlkPdaRkXka4oRQImqjkdVx/SAiJdDdbvdQ8LZuCbQ3XQ6WstCdKYNBzsNvseLcuMcdCPIBF6H/Iv//7MJCQ4ryHMiZioGAkYbp3G0WBZOP2S3AkzbO8Ob+vwrxh1wPmZ+stLG+1qPR0hdSyvIoV1n6svfqjIkpKkPpNzkeEJr6Dwn5OlcfEqPHDdFMoOWURF0DpmX/OsTNJ+V6AEnfttwjhJ84nsBdhPpJg61riXGDm/9ae3bz3RHMSO1IsJevRUJ48PI6KfuXojHVGx8YlY4tkj521nokAWRVDWitJM+ZI3gN1yFdjyo2p+IfZkCaSWC+j0tq1Q9RB2HKTo+9k6p8pJvAbixvC58WYKJlv5U+mgnqlKvWc6qY7NVsy3T8WpnExCaeyPK98+ewKNnhIi52eNmOjyeRQsASzEq0h+0nCOTITNiQTDaJZdZUr7pH+RrQI/ixgteSvZC37gFkn21aem3GE53EqHy6LEMEQj156LKrUhugRM71e4sZaeHHbTUGfUeYiqgi8cMzpG78kxzSRQm/TVIzq8Zw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GPltGId8lLU62ryUgL9OTmyUAVlwKfbyR4PsMZWzYhKj5og/DDGW1SvBjafv72UM1hk8gzVUSDSujMBlkoxNk2dX9K9VfGbOjQanRkv//F+q8XNkfruzPC4GqNPbUkifkYoUtvzQc0mtBIYLBdOjyPSAtsUfZ6xNqxg31jdml6uS3YBl+rTRWCIuW8IYJqaNj3HA1k/IREGQiSWrObD52QsvFwYMYam3VZDxGF+6Auv6R+IFQSwJPLOjUdjDVtmOxK18dxqA5sryoSqvFf1G+RYLWnhZRDXmIEgO1uGNrzbHQ17sCOzkkrCIjDbSFSsfSPD3QXW6o8PKv6o5BvP6TGdXZh04cdngv/L3xd4QAXvVLjFS4azVe70WOewn+oHLxngU7yZTpwM5+RGRtHPImaDTzgQBrDCAIfKRGkG5UX/c2yWvnoMCuVaPSiWLd2eR
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 12:41:16.7379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0536c928-8bd5-46a1-6900-08de753455ae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR19MB997276
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDExNSBTYWx0ZWRfX5Ph4VDXuXf4P
 h4HKZtBXxr1kyegXC6P5pMy91A7xVN3lKf6ntR3GpyHxfaHUuSLN+h3W6VOICT6TSvsT6QvY917
 8Cw5MLpWSZNSObEHAgIcKyNRxaMJWGHtgt65oM4JKR//EorOzOCiXLJGadqR1tsn9hrJBUHcKh+
 hBXE3hfyKBYKSFOTpnoajsHybfw9sSRBcyod73A3CIZpRGt1ubzj+VAYOMPw0ECsB5wlBjYfzlI
 TSjw+F+9xXdLYuNXHNNQcXONhBn2vAMfn1vVg9U1mQryD9jLrr1sRX7k5Y4gpVcNavvLW+ofGWN
 54kCUjuOZJ4m3JMqa6moIilgJI2oxPJw77N9OuyHB/vyQU31o+YoviUV6LJoq/MursPEGzPiiCy
 dJsG4eBjiTpVm+pY/yS+eD9MeWlFLPEOcC0NlHt6LYLoPs/yRPSr7DBLZudKJa2wmqY24iZX0gy
 tDPKCsOAXXK+ZK415Fg==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=69a03f72 cx=c_pps
 a=DOH98rxGboc8Nzjd8cL+oA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=ooAEsoHMzOuQzOQMEgUA:9
X-Proofpoint-GUID: zicxn9V5Oq-E0-mMrYSzRBJRor-cayH7
X-Proofpoint-ORIG-GUID: zicxn9V5Oq-E0-mMrYSzRBJRor-cayH7
X-Proofpoint-Spam-Reason: safe

Since commit af37511305c0 ("firmware: cs_dsp: Don't require client to
provide a struct cs_dsp_client_ops") the client doesn't have to provide
a struct cs_dsp_client_ops. So remove the dummy cs_dsp_client_ops.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index eb66827eabf8..1ace4beef508 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -403,10 +403,6 @@ static void cs35l56_hda_remove_controls(struct cs35l56_hda *cs35l56)
 	snd_ctl_remove(cs35l56->codec->card, cs35l56->volume_ctl);
 }
 
-static const struct cs_dsp_client_ops cs35l56_hda_client_ops = {
-	/* cs_dsp requires the client to provide this even if it is empty */
-};
-
 static int cs35l56_hda_request_firmware_file(struct cs35l56_hda *cs35l56,
 					     const struct firmware **firmware, char **filename,
 					     const char *base_name, const char *system_name,
@@ -1149,7 +1145,6 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 	cs35l56->base.cal_index = cs35l56->index;
 
 	cs35l56_init_cs_dsp(&cs35l56->base, &cs35l56->cs_dsp);
-	cs35l56->cs_dsp.client_ops = &cs35l56_hda_client_ops;
 
 	if (cs35l56->base.reset_gpio) {
 		dev_dbg(cs35l56->base.dev, "Hard reset\n");
-- 
2.47.3

