Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643D37EFFF;
	Tue, 23 Jun 2026 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223122; cv=fail; b=FB5P/yS0sFs/dZekQW3ySNummWKkrN//GPpn2KHzGc9V5Rtrww2VY66REHJG0BBY0pBhod8QaCOoo26MzgdMt7yZP6nwv9VHmTio4m6gI8PeOmGuu11+RJGRrxJAm4bMo188lIu5lXbkCCFuXCnjvwg87q2nrd3a8cq41Y4xZpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223122; c=relaxed/simple;
	bh=RcvxlUbyGEnU/oYDJ8q6U1qlLzpKt2DE/KY23pGEHXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r+emwPMmB14SdMDT2A7cnfGPKtWSzBq1ktRY8/iy+DSlPoceJ4K5NQj8Xl85O1wQWLqyR95Zr9JoQuONOxg4NhrDYrzTJ+ZQR8cn6J1Yq29UIX85+2+Ek08jIK7A8CnxvHNA+G+NBLXn5LWVR79D8ANG8+2MmTMR/M0tfz1p2Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QL3drgIj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Y+VvagdX; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QL3drgIj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Y+VvagdX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NCPjYX081152;
	Tue, 23 Jun 2026 08:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=f7RvRGM4RGNOCp9H
	uK6mLpWnfiaTFegP+eqXChY8we8=; b=QL3drgIjRew+7Ameo3FqMLeVBfQMHPhG
	Wb3pPzvKhh+Ek6vcS9bUhhGmmFXpgm3Tvl9aamVfG2IQWHwHx6hBCBqrWQGfdsRV
	8tkqo2M/d9rkAFx+sEcJUPojPfYXbwvy+NFi1CEpUjUrGA73yhHVp/9yVWZwZMY2
	FBz81igg80vuEaC+dyTuFzpqqm66ZBqOY9hhrP1CgI4TtulNJAUhnPBiFQWcf5UZ
	cbd5lwQeE0+lKqIgpc0WwAwSD9j4Uzn34YCiA0HLDoD4fHgX3hEgb2OK53xauS2Y
	tD0EvBsuT2tawxer8H4l3Ks9sk5DTDLCfPJgThpErWFuQUYa1leGDQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021104.outbound.protection.outlook.com [52.101.52.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x3euv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 08:58:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrOJKeDGQrNEQ7tODidvZVBtUdaLHqK1tSkJ5Te50AcA2sczkAaoE/C6nCqpuTiEZdpMHz3BdD7/7jW5q7mjV3E1L33RX+W2z4wbknWfZ1oe6aHPEE2bwku2+lK72LtWtDVRBCEiiozjLTdJrM70jFeAxa+BbZnrsYgceMgTuHLusgUoMh6I6ORmPJt26aYL4Luz0cAIQvTWe/vmjsCdj91pB71uICbwgSj+qvIkhj8+jKq9Udw75Z0G+45npFGG/z6LKskOuis8b56/jJzmdb96vxSKgmCbrOveo562aBsvr3zPe2QM/W4THMNVw3XjMFIYkdeexEgzIq2Ay+Qlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7RvRGM4RGNOCp9HuK6mLpWnfiaTFegP+eqXChY8we8=;
 b=Bcu9VtWlXNxWTTevz7b5KE2ea/Iq/MEc591KN1zxhkAtEcN+Rw1vmqvgoTsJOHleGtE5rKXimOLN6f/2OBlzhY+wL7iULNIDmi4NcvUfEfB8iaEgdILbhlybMAtd393uUjEN+jYK+mROkhdiqOaMIWAKbwUTnwiCLy/nwh6vDH5yh8x9Wn56ciM74AV7RpSiM75ZaOc1rANGWa2qzU2lSukuG+RdssOS5m2/cfVkCJXJKxgLn48tREuxbPnklb8hYM4JBat2P8MgRUJJGoo38Ph52RsKzn4uLZq7YiXK9PDbCNip+StDlqJTZn33T//FAoTcoV1XM2Jxg0IQKzqSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=broadcom.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7RvRGM4RGNOCp9HuK6mLpWnfiaTFegP+eqXChY8we8=;
 b=Y+VvagdXeRwWdSe8lrNC3I7nzuUkUOtRl1Mj29HECV9DGeor+h7yHlvXRZ8v2X8g4dHN37QW0Wz52pHA1aO25EVEa5Fz1Ii4i2tkT8EWs+Uj+IZ/26KxDWAbfVnyDivOu/osFaEEjTKBlCmPeNbgh+AmKJsEYvknxb6ugLdeQoo=
Received: from SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18)
 by SA1PR19MB5498.namprd19.prod.outlook.com (2603:10b6:806:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 13:58:23 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::81) by SN7PR18CA0026.outlook.office365.com
 (2603:10b6:806:f3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 13:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Tue, 23 Jun 2026 13:58:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C70A0406541;
	Tue, 23 Jun 2026 13:58:21 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ABDF182025A;
	Tue, 23 Jun 2026 13:58:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, m.szyprowski@samsung.com,
        mripard@kernel.org, dave.stevenson@raspberrypi.com,
        linux-rpi-kernel@lists.infradead.org, florian.fainelli@broadcom.com
Subject: [PATCH] ASoC: soc-core: Don't fail if device_link could not be created
Date: Tue, 23 Jun 2026 14:58:21 +0100
Message-ID: <20260623135821.4125543-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|SA1PR19MB5498:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1d3d59c2-ae48-494e-7484-08ded12f7d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|61400799027|7136999003|56012099006|11063799006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	pjZajmBpuo+Q3R56F6FDY8KesDEB7YERgSXsyUsqVDbm4u4bKvZcWrGUn0AqSlq+KbJnL+OoPREWVAzcFRxeD4B8+nNGPK6JFKepyCdwWU0s7dgALuG6ni8fLSMwwMBHGgQYs26aIpfHYXl0iAZ4lZ83axJfwbbLuVVEyxgUaNDVr6QGfZ07eUeeVoALxXuaJyjplOn4n3buaA6a+l2OfVe5p0ZkUWhdtLcsdouTlNtTC9DaqWXciEIYYUtJYDLgOFNaPlVrG+E0v3ZXORL7XE+em47cYP34hLKo8asH7dN6Tw/1sL5ctjnLeVoP20Iajqo0zvZRM5oJRgEEIcGXRr2NQcfzKwST21ZEBn7P+1lnrE+85wJeop9hOUBRQeLF0AUYCNU5dhaHXcBd4rosPaHO+ig1mViWzzkHe1ISZJYxZo0MuPGnDbEFBQFmAtY99nNpUzpxyj6BIIq30JKsFIIQ7oy3bzMUWDEtUBQLgJ7FVZt/UKrbO70g4UjP5D4JNG57x8YFjep8jkX1zw+CJtox3ao3Q4Q/ngwSeG2mP1YOIw9YY8T8Oft/mHFXO8K98ZrAlmRs1T6dCGsMWGtnLonpwhg+x7H8w1F1Bj4bP38G78giSlnQZB6V42/4yBlTRIBFNe/+erhXrsR2rS8uOzMPWlL6zwQltiEGAESQiAo6o+z4Et2kK84Boce7J/MNc3d6oyMYUakQlTyShd8zbQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(61400799027)(7136999003)(56012099006)(11063799006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OPzcThz0zv2UCwzEiuCUbmAIoDt+rqmfqR4XQKnfvCAbdy539WQQYoEOOi0p5Z0ivUG/vlUcYnB1paWU8H6ueuFjGS342+aLUrZbQ2oZYymrl1RQNq+n1DFHca4dCbx/o1Ez/o78EvIAii8y7OLDxpuwsM1Iano7i9Q8oSKG4K7W6pSf26ejx1veFyQicuczjDwDFA8aA84g09a/wBobXsBbiicv5e0MsFpISdbftFg5qB//U3jtu4GbgbxVWkXfcnGIOd938/ZeICKIL5yYR7ddVnKvmJgDQdJ90MTGuZmvqwRGN9EsXNyLIixavKeDaQQl5GcnD3WEJIUoTwhVOKJ957PQprGtVNw0WahuInPMV71XZmxS7hzrHsGQ6Sx0G12Ws406VMhzT7LiKF+UMxq4jt+R76v1f+F3+zX3iMOEGiwc1dWJW+K0ynOwM3Cc
X-Exchange-RoutingPolicyChecked:
	ifCIP+tfuwztMJ4g2eratvG1tU48JCYg6aevXcL93ti77IOpqDnI+nK1LdmEj7aLGd6/NroH1/dI0zXxQ1Fjpwe2bNQZtZbqiVBtXPrQBX8PlJNabPDDQRVbSgPVVW1E8Lo9NKYvV/cA/avX5CrZOB8xOO3s+4gmxqypobG61089bi5yDY+bSwdGBcWZUCL1aPHjp7s7War4D5/OEowmFvoJ9xJUSBhw5ruw7NQugaSdvDS5/uxO63hVJzy1bMjSEUZcBuucocMlhr+5l9mMD7iRtXXQdek713w6RJK9Euln7fYq8DSwzaD5+JVnYzPZJh6vm10upWu470UnmkgchA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:58:22.9180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3d59c2-ae48-494e-7484-08ded12f7d79
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5498
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a3a9107 cx=c_pps
 a=l/exgBlJIAx+5Sipbyuv7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=hD80L64hAAAA:8 a=Ec85s8B7YpnXUF10jvEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDExNSBTYWx0ZWRfX6b1sKyj6NrKH
 Wd3nFDWVeDW4qUJ1ZjpOMnPglXI5hi5KS8O6XHo0DXvjMaJ2IobdflNjfVyv9Yoi1hPtKUKzf5B
 OQ+So3hCUp69zZQhd9KKioSAowi7e8OoHZFNU2quXyFqjt3WWe9inDXFI2RfsxPAjAHBPA+zqri
 0BVTpOtXmz6RVeedij43YMco1DtsBbrkVHOy7ksjAhm9RoUHzvjTigqr9yVDQ1dkBf1Y/Xmx4vz
 cGfLXcyZyirtdkERUnPblEG52mjoTx+a2MfHaydURiRfuB0H3g4oZxYTp4nT6uT60LU89rZIDzd
 YesXK+40NwQn3DtxAeMeuQcF6KY5vrrxdHuqVg211pll5DmLF3TTAZRDjeLpMX2wZ5HREhZt1wz
 jggIulMB7rExteYKnVgoig3IUKIYTKNRG2ouwWmwJ8ebwyWY2m8aIfW3SM9i1zlMIxJMs114sOS
 WJ2prd0ACz1oLjO2Rig==
X-Proofpoint-ORIG-GUID: pPezew4Y5kl1huApcq6HoPmJGxwFtNRd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDExNSBTYWx0ZWRfX3wqUmWpphDCy
 IRcFB7uf7f6QxSW0XEvXu+Q35qXAbzWvu8YO93JPnvgk1XuSuwSJbXazwZyAP7GK3ltTTRLlba7
 BVzTsN7PAysqPFuYkmXSjriszMxHSaU=
X-Proofpoint-GUID: pPezew4Y5kl1huApcq6HoPmJGxwFtNRd
X-Proofpoint-Spam-Reason: safe

If device_link_add() fails in snd_soc_bind_card() just skip that
driver pair and carry on.

This means that ASoC must now keep track of which components it was
able to device_link to the card->dev. The new card_device_link member
of struct snd_soc_component is non-NULL if a device_link exists.

The intent of the device link is to ensure that the machine driver
system-suspends before the component drivers, to prevent ASoC
suspend attempting to reconfigure a driver that has already suspended.

It isn't possible to create this device link if the machine driver is
a parent of the component driver or already has a device_link in the
opposite direction. In this case skip the link. A warn is placed in
kernel log since this might indicate a genuine design problem with
those two drivers (this can be downgraded to dbg in future when
people are happy that all these special drivers correctly handle their
reversed shutdown order).

Fixes: 0f54ce994b23 ("ASoC: soc-core: Create device_link to ensure correct suspend order")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/linux-sound/61bd38e7-5eb9-4448-a93f-afa2ccbd1c9d@opensource.cirrus.com/T/#m496fe5a11b0a3649afd2e85da5e1cea82bb16d8a
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc-component.h |  4 ++++
 sound/soc/soc-core.c          | 35 +++++++++++++++--------------------
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 11bc9527653f..aa423865dbe7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -10,6 +10,8 @@
 
 #include <sound/soc.h>
 
+struct device_link;
+
 /*
  * Component probe and remove ordering levels for components with runtime
  * dependencies.
@@ -216,6 +218,8 @@ struct snd_soc_component {
 	struct list_head card_aux_list; /* for auxiliary bound components */
 	struct list_head card_list;
 
+	struct device_link *card_device_link;
+
 	const struct snd_soc_component_driver *driver;
 
 	struct list_head dai_list;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 86b6c752a56b..7817beea5b3b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1980,19 +1980,15 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	}
 }
 
-static void snd_soc_remove_device_links(struct snd_soc_card *card,
-					struct snd_soc_component *stop_at)
+static void snd_soc_remove_device_links(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 
 	for_each_card_components(card, component) {
-		if (card->dev == component->dev)
-			continue;
-
-		device_link_remove(card->dev, component->dev);
-
-		if (component == stop_at)
-			return;
+		if (component->card_device_link) {
+			device_link_del(component->card_device_link);
+			component->card_device_link = NULL;
+		}
 	}
 }
 
@@ -2001,7 +1997,7 @@ static void snd_soc_unbind_card(struct snd_soc_card *card)
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
 
-		snd_soc_remove_device_links(card, NULL);
+		snd_soc_remove_device_links(card);
 
 		soc_cleanup_card_resources(card);
 	}
@@ -2012,7 +2008,6 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_component *component;
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-	struct snd_soc_component *last_devlinked_component = NULL;
 	int ret;
 
 	snd_soc_card_mutex_lock_root(card);
@@ -2141,19 +2136,21 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	 * Add device_link from card to component so that system_suspend
 	 * will be done in the correct order. The card must suspend first
 	 * to stop audio activity before the components suspend.
+	 *
+	 * If a driver pair already have a link in the opposite direction
+	 * they must manage their own suspend order.
 	 */
 	for_each_card_components(card, component) {
 		if (card->dev == component->dev)
 			continue;
 
-		if (!device_link_add(card->dev, component->dev, DL_FLAG_STATELESS)) {
-			dev_warn(card->dev, "Failed to create device link to %s\n",
+		component->card_device_link = device_link_add(card->dev,
+							      component->dev,
+							      DL_FLAG_STATELESS);
+		if (!component->card_device_link) {
+			dev_warn(card->dev, "Could not create device link to %s\n",
 				 dev_name(component->dev));
-			ret = -EINVAL;
-			goto probe_end;
 		}
-
-		last_devlinked_component = component;
 	}
 
 	ret = snd_soc_card_late_probe(card);
@@ -2185,9 +2182,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 probe_end:
 	if (ret < 0) {
-		if (last_devlinked_component)
-			snd_soc_remove_device_links(card, last_devlinked_component);
-
+		snd_soc_remove_device_links(card);
 		soc_cleanup_card_resources(card);
 	}
 
-- 
2.47.3

