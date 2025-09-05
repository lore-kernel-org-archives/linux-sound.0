Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689383705A9
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082730; cv=fail; b=gUglsbpti5MJuUuUzdMF379Ovq/h3RM2LUCtBFjGr3Ke+JWCGhNzQ8xYf3AHWP/9BG4zYVHcrJU8N/yaluCkbNRhGcr2pBmX378MMp9bnA5hdgwYkucLLSvu/6UtEDz0hgQuJ5msIz5S1zvTMRR/DR1xdOaZdBYUK4DypAwexgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082730; c=relaxed/simple;
	bh=ZqgEqvSvgi87QsqJGH00oIl977cgcdBdxcWylHus2+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UX89HUHb3bM1KhPhR7f5mX8Zg3AxHZiGoBe32es+LeRMkfUqTIKDvAWR9Jiu4q8szQXv95HpIgYBuW3NgaD6bLzl4r2RMnHYgPokOEcMTH7rSY2Fpt2DMWfl4oHBioZ1l4qLw6UjhY0bmSeIlzp+64aATmpfvQm54fFWQJkyulc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iiDLBWec; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JpMJGtWk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iiDLBWec";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JpMJGtWk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5856KPYu1451153;
	Fri, 5 Sep 2025 09:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TTY7ytlcyAwdo8AW8klYcYZlXUX0l/RxySFExD/ZLsA=; b=
	iiDLBWeciDo03PFrMg89t1GxEebSbFMCIxi/JcAKEXdGFZJ6kplsRLZ1kifIf4aR
	ppqVwsE6LS1G9nwmF/eLI62ELlE7m1ysB8yCYmCkI+hPzihpy7Si2JE9lOnL2SCd
	dEloqDGLT1vySmK9kGbtF/tQQiM2Hf/OTz0E2hyZK+0lscdfj8csb/qJbQCZmOWb
	KJ7WRujStpPlZSVCA64mDsZHXyonsoRA4hjnVhvPp81NV0tlTWAqPko0Fy3n0Ltg
	lz9VFR/Hnddwzh4GJUs81yg2yea72VfQF3t0ST6xzfK6ElJh9XUg1327j+Jl2/BY
	9nqot1zzvirWb+vqQVD+lA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11hn2239.outbound.protection.outlook.com [52.100.171.239])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsvm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHcY9YVXuZDbx5v+HsZwXOk8PrYkimeN0XljvXi6OT8h4WyqHOVqpM7T/o4m9hg/5EvM0WgbsBpJl4Bp1Zm2VtLH5eMJypUj5o8ANiScAeIH0tfgCvRQRaokbuuKMaon2OlijTAAh11pZ8feHlUjh7RTFWmuyG8EfhMJNDGtaQRi3u2eAcl9Zp3sRUyKyodzBJv8vAnKirHCgWXXgd+KH0ZxFG9+7oNZz6+GMm4/md3PYZlnPyLFMnDJ+TpnFfa1kqY6R1vaSGnQO2QKYYMvrX8eOTigHjJZjpzpkgMR6MrYdjcsdI4XpS8qPZ6y/UXFR8wzTCik9VqGQe9N6rSTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTY7ytlcyAwdo8AW8klYcYZlXUX0l/RxySFExD/ZLsA=;
 b=EWajhdCnyArx8+eOwkGHv4/NWw8IaUOwODCKDxN92kBeVls4gUX8bBMq7vfJCKk/i35Gg4XZgphHWQeZ7euNUI77uIRzuP2gPAQYrBNOuNQxie258uJqVNW6FR54aVAL+tnZCQrR0Nzttd3+5qHd9w7hqSO3AKx6ies17OONhLv3VZh6d/FL20v3fZLP6xb2wxnCDqzdTERpqlpu2Rkon9YDCX/H++QEWeXLN3vdR8nKmIeh/WC6SD0OvSCcIaIDDaF1PngmkMN6oXMC+yirq0SjWirOZnbwjkD4NYn734NLKnC/CvRj6qoaeg6LeIiP3jAFLW2JYw98qyqST+vGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTY7ytlcyAwdo8AW8klYcYZlXUX0l/RxySFExD/ZLsA=;
 b=JpMJGtWkxkpGn+shMKTk/aNVGn3MlbjmcGv4uvL7/9LaUj9ajJAgmgWgdmbKkrMQLdGl0yoyu8rl6s4ONVNOw8bUkwjURayH4b6OjusP0oZVIkh7MP/UJYaKW4+R4+dxy0NgENqGFGHgjM64gO1ICWW+N6fgUDlhFW0LzycxhPQ=
Received: from SJ0PR05CA0157.namprd05.prod.outlook.com (2603:10b6:a03:339::12)
 by LV2PR19MB5815.namprd19.prod.outlook.com (2603:10b6:408:174::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 14:31:33 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:339:cafe::f8) by SJ0PR05CA0157.outlook.office365.com
 (2603:10b6:a03:339::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.6 via Frontend Transport; Fri, 5
 Sep 2025 14:31:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.0
 via Frontend Transport; Fri, 5 Sep 2025 14:31:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C9A07406558;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B596682025A;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 06/15] ASoC: SDCA: Factor out a helper to find SDCA IRQ data
Date: Fri,  5 Sep 2025 15:31:14 +0100
Message-ID: <20250905143123.3038716-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|LV2PR19MB5815:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6fb6d81-2c7d-42a6-0d8a-08ddec88e8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|376014|82310400026|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6AXayPGRn7P/6xxgn0DO64VtzEe+NAasJIGNHUE3zWuOs6A/rQ0+F+ekaep6?=
 =?us-ascii?Q?zs2CncWL7+UixjN5/bvn9BKrRFRPuVnP+sV5Jbs6hE9ErrRCHUjshQErvL66?=
 =?us-ascii?Q?wXBiy8YoGZ/NXk8Zqpao2ic+y7SYTi5baR46xd3c+gdWjeL2O58S8mo+s7b0?=
 =?us-ascii?Q?1NG4OFhlQCq0ywgva/0YL6f7THu9cR2cufcCh9e5Y88pEmn0EAxxflV5EYY+?=
 =?us-ascii?Q?OYzIqy7xp0zKnBu9Rx2+rbi+zkd2Jp8y4CWljmgzNFKUXrfIHqkDkJ9YMX7X?=
 =?us-ascii?Q?pa0fZEf0vYzDfh+/9rkahtr0jdARHyV+WZjp4m8YHpsNcb3/ZxFcB+O0yytQ?=
 =?us-ascii?Q?7l2hsulHPM7iHyLvP+UXPJ/zXQzBBaTKVjXqa7LM7PrWBdYy+WDaWynEO8fx?=
 =?us-ascii?Q?pr0fSrYhKARkD+XtukyJyeUzB/DfmertO1bJexi6Rv3DuZHk4qwcx4sAlX6m?=
 =?us-ascii?Q?ZGyy+KBJobYKu/McWQUNNuoXFw7Jv2RnQnrZDkgnOt13GOcPz7ek7W5g0TfQ?=
 =?us-ascii?Q?Wekq2bFDyUjcAnc7MsYuJxy0jFwI6FP/VA/YeD2raoT0T3Cly0cqKpxm0jmH?=
 =?us-ascii?Q?R8lpCZztrWXvfY/4ZmFVDzxAXdjlNGaf6aZNqkAtlwkUeja0K6YkQOvopgJz?=
 =?us-ascii?Q?dgYFmhspWjr0pgQb0WGZQP4MTM6K60bMe2eMDnjNgeegBZZzHC/MIkqD3xwS?=
 =?us-ascii?Q?E90vxAHmREOVxsSRiC2IkHgfaqQfF3rNl/GGGMMatcY6N6j2bMX4absQhOHC?=
 =?us-ascii?Q?YQ46vgvrU42HNQvF5Z9nJkwXLbNiYwqP8EDcm+9+8L+Mh1ofH4cGvkJadc2F?=
 =?us-ascii?Q?eStLl6O+frdjPviBvcMxanS0nmG8EjocjyX7Yg6MWMzEhuHg0NSJVXEjWS4b?=
 =?us-ascii?Q?zRiMg9StcYZenvE7E8riQohe3h+OhEdWXv8wLjU+W+pUv4to5YBhJptxiuGi?=
 =?us-ascii?Q?tI7bbcWOlTDXnwqwcHaWELJDZpZgztybmWmKE5oCer8C3N9zy15xR5SMvFAJ?=
 =?us-ascii?Q?lz7QGP37PL3xvET+JieefeBQzczYyYMmfELjavsfrG9cDApxeVEayV/Pfo8C?=
 =?us-ascii?Q?cz7j1d0A8oRnCXbqAj11nuWj2fYrBO1y+0ZlVoAz4ZCDRK1qq3Np5p4T7M+2?=
 =?us-ascii?Q?kQKNQmQ+ssU/ngO5V3SY27GkRZ2xpqh3mBTBZeM8Hfk3Zhu26pWcXFqVwvi5?=
 =?us-ascii?Q?GXQhgh/Fij6MERIwebuyDXcNM3p49VUYnFhVpCYUtzeyU4Txf8DmZFAP7jSC?=
 =?us-ascii?Q?JQhwE2n7qGLzMac0O52nSLskjeLIqOxzhogQSU91DqQtQmNmvaztauPl0rT0?=
 =?us-ascii?Q?LpnY0r8urtYa4et98xXSpO2G6ZmxFiAJ/iMa50Be5Varpgv46rP773eJIHag?=
 =?us-ascii?Q?+8edYmYTw2dbVzUD15bt7Orh03Qy7upjKjXcc+NPFtII9Y2PFjuzgBIOrl0Z?=
 =?us-ascii?Q?ATwPdmKr/86XWIf2zt9HxXKgHn64p9mteACHKG32drGaCk+6DVYcUp5hChtW?=
 =?us-ascii?Q?QjR0kgY1ywrvyXGaSXYmb/HGjLqgqZcdaXrB?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(376014)(82310400026)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:32.1147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fb6d81-2c7d-42a6-0d8a-08ddec88e8f4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5815
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfXyiuBs7kpWGEb
 eQf8CAlnuNYYRPQc9j52i3+6VtyhPTnwj2ZGEp5pwlWGBC7m+DtIdURbXTXtYTfIq4FcCKaJYQg
 9qO3KtHfwAn1UTtEdobKt/DnmOh/w1FcwUNKndgVhHq0OeSM5NorPg8GxxKDdeSfj0HA4rETpoq
 w4qZ9Laphl3oKkIWvo0BSVW6bRJkRp5oAmEvFlg3FhEB6Ksm5i5ISrL6bJeeKrer0xrJwkglBIO
 ryuubXRAkoSJhgG7Cc369ly7Q24MM38qQlzUwv3Wo8KEMRfwChtioxI6eS9enlLSQUNCSUX/O/m
 J9bHp4yiLApll5RWZEZDoLUbwlFCBOhfkMr5Cl0g+HN75O61ft+p1ZLVoiE1JQ=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf448 cx=c_pps
 a=FWsKckkcWXQuxd6BxW9eng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=PGrNOaqWq3pGZ8No2E4A:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: CAcNri2CwAerkIW7qCIZpuzIYauA5Y5F
X-Proofpoint-ORIG-GUID: CAcNri2CwAerkIW7qCIZpuzIYauA5Y5F
X-Proofpoint-Spam-Reason: safe

Add a helper function to locate the sdca_interrupt structure for a given
SDCA IRQ, this makes the code a little more readable and will facilitate
some additions in the future.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 36 +++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 140764931380f..a203cd2764ecc 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -341,6 +341,24 @@ int sdca_irq_data_populate(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_data_populate, "SND_SOC_SDCA");
 
+static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
+						 struct sdca_interrupt_info *info)
+{
+	if (irq == SDCA_NO_INTERRUPT) {
+		return NULL;
+	} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
+		dev_err(dev, "bad irq position: %d\n", irq);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (info->irqs[irq].requested) {
+		dev_dbg(dev, "skipping irq %d, already requested\n", irq);
+		return NULL;
+	}
+
+	return &info->irqs[irq];
+}
+
 /**
  * sdca_irq_populate - Request all the individual IRQs for an SDCA Function
  * @function: Pointer to the SDCA Function.
@@ -370,21 +388,11 @@ int sdca_irq_populate(struct sdca_function_data *function,
 			irq_handler_t handler;
 			int ret;
 
-			if (irq == SDCA_NO_INTERRUPT) {
-				continue;
-			} else if (irq < 0 || irq >= SDCA_MAX_INTERRUPTS) {
-				dev_err(dev, "bad irq position: %d\n", irq);
-				return -EINVAL;
-			}
-
-			interrupt = &info->irqs[irq];
-
-			if (interrupt->requested) {
-				dev_dbg(dev,
-					"skipping irq %d, already requested\n",
-					irq);
+			interrupt = get_interrupt_data(dev, irq, info);
+			if (IS_ERR(interrupt))
+				return PTR_ERR(interrupt);
+			else if (!interrupt)
 				continue;
-			}
 
 			ret = sdca_irq_data_populate(component, function, entity,
 						     control, interrupt);
-- 
2.47.2

