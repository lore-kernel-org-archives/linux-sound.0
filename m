Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9B2D5436;
	Tue, 21 Jul 2026 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644642; cv=fail; b=sYYUuMFZA7Rmd2niZyuHtM2zBz7NozsqmRXdvKb/D2Y1fA0HGuW0DPGk7DnrYVFM99vlL+pPN2tj+EW6MbMCDASyQPux3X1H24s68/0qYkya6gj8tRd65Wk/yLLWKUEM5irsXfnL5wQ5Osvag85SjNVy/JuY9EXu9krQgG2j368=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644642; c=relaxed/simple;
	bh=J0Ifai3qhtghdNPkc9e2kDGGl/Xdva05arMk3nQ8GOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srnowBhZ58sxLpDNPn7qsf9Fb8+M1nA+EZiemsSEx9QgWs2ouDsXKE3rrqA63+Wsw/TTHVkZZma0Y2ozN1QDlF2BZKS18WsJ98RK2r7aB7Y2J1ePxObwUleaZ3zblW/G4d643baSkBc1BkCh1hykbobXaWXK4Bs313tygj7+k8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XOUyigWC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kMudGcTo; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XOUyigWC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kMudGcTo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEbBgT669055;
	Tue, 21 Jul 2026 09:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0KJ1GKOsxTrFu3Fdm5LUx33ShFfvfawyLDlyCIoYkzM=; b=
	XOUyigWCCz0CJc8+mYTw4Rr/tyOUhnhcWI5nbDs9uPNLT2L9PN9FcEV9xlwPpg0C
	4JTnVAevkE2An9Eu5KiMdKRkmEtCEBH5j9WVrc7HPN5iJjYMzGPw+2TAGzU2fAhA
	ABB97phT5707VbPgsypZmoi3+eYSF1zFDEnAKZTLqP13vWbcWU1SNpHpDZo4HCjl
	KrY9stzr3h9+qwegVqjjB9dHtnI4rdlKy+fZr8hss/LH6QlnFWqGE9y6bQKfrM5o
	hS2bWVS0DewVS/7KtbvPFoaRliMVJFJs/GFsI8lEbkbuiCQVPEyVRDhXIlEOyC+r
	IIYL/OliMXrvctlBnIuWPQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020110.outbound.protection.outlook.com [52.101.201.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfc7ce-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 09:37:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnfTmrx+4meafPAhm4OBx5rDXGcdBqKUM0KzaIq0lategGKS+OsRMzOKwwtG1HbuliQwBRCM0jggUnY8WtdJ+Wek1v0I/oTkiw4m5gXn7D6AM6UzfHhVxTPrcYEzOKW3g8pZ7MC7wIZedVqoTq87fggMjI6PqQirlOKFqDLgldCDr2gcv8cOcW/+QD1SGSV3uRlEirytvTO7xNbOUSUhyRZKU/2XOhJnJ/VoV6Mv9eF7DSIqOQbRfQsunQju8eOWPH6jSnuTpZDOqlicBfrKAsEKG4zSk9kE6cHsMiP/vf5rNKYoEZCDfzIBWfXpGdqW7Wrr0bBEtyKhfqrryY08gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KJ1GKOsxTrFu3Fdm5LUx33ShFfvfawyLDlyCIoYkzM=;
 b=Sp1+BEkWfd9hoxoW0MGPb+jtSdD16L/Uyc3CJhhZWHk046ISw6RndhCn0abCkeorM7Mk2vWRpw3qlh7x6ej4WsOhbHopgZmQNDJNJoUXmg4rGMYH5i1rabZI7MEyVO/1Zi2ToVxMMwbyrdvcMm7rXbVGZTOGpe1O83rEL4ucuKDHTdbvgble9FnVohpyd/WWJ64hKiILyDRkvXDZ/wrZk5hbwwP0PTrHHxckoDES9PTz1FIlq9yAFrBP3rQ4Y4II2ptVA/d9X9eJ0ZU8eF1aMKbS92fe3eGcTVcyVQ/OxXkfTwFHlwsQwUWRnaXaw25/eO8QEY7XHdp3+veaUJI9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KJ1GKOsxTrFu3Fdm5LUx33ShFfvfawyLDlyCIoYkzM=;
 b=kMudGcTon43ZQPnU10Yu3VgwbntnUhZigz8zWTAwZ6OA/UMU1LLS0A8b/XgWhYoUU2E38ITHaIev7Lys93SuatwP/dDMKKCWXKOXNxJxyyTBKH+Gx0wy6AMk3+tbRN7yNIN3fsDk124IviswfPC8dPqSX5ORmdfw7lNlfwUICA4=
Received: from SJ0PR13CA0086.namprd13.prod.outlook.com (2603:10b6:a03:2c4::31)
 by MW4PR19MB5591.namprd19.prod.outlook.com (2603:10b6:303:16b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:36:42 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::c) by SJ0PR13CA0086.outlook.office365.com
 (2603:10b6:a03:2c4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 14:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 14:36:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E0E96406547;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BB792822552;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 5/7] ASoC: Add a component fixup_controls callback
Date: Tue, 21 Jul 2026 15:36:34 +0100
Message-ID: <20260721143636.361814-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
References: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|MW4PR19MB5591:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3a406016-729f-4135-c99f-08dee7357b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|30052699003|23010399003|61400799027|82310400026|36860700016|56012099006|11063799006|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FTrs9rzX6vNZ1dyuhzHnc/uttTC50e81rrmlAQwh6T5SYlW8P80YubY+zY/nclT1zrH4xOpGHFHbQsUVrgYPlW2vu+MQWH5/4d0W0UmssqbRryHggTtMQxSTjO5K+u2rh+6va4MBzAflMQVcvQnIDpFmEBRZb+THRhewM8O5J1+XvIQ5h0mGjNr3QVB22dMRX/bNJzop5rp9QP+a+IlIAIKGJ23VFIkDtu7/nsGQDm6OAIe9yRw9MkCh7K3A9ujD5r35Y9OITcRmNHqh4GVUNUWYcQGnn8pY5cNGtzy7JRoXTGI3TJZViVwcr943V+NPZNt2tonANpTDmA/wprZZ7lKzk66fVcDzQ4leWhq+C0+3UZ+SJ/1SLknK8+VoaQI8XTph3qBI+Mbugj3XMZ/TvRc+3IQbrQG8J6oaOyyc6cjP5Tu+x+roE+gkE7y4aeXy+VMM1L+1CNLegPT8mGxyyon8sCBe+ejhvmihk9xHvmC11kQPaq3/tcXlxavSWj6EnD3dP5AAqEEd3NY+ECP/S/0sbQgEpjZ6T9NpnXJvqyGtvvcjAFYLu+5KLTaZY90im7mAUVGDmnDiJxeJUFZOipEAfnqXripdr+IFKCAJdbqY/15btq1kIHJkYJSQtDLRqPE3qETH+It8JwGIionmL8k9aFDU4eRp/2ee5V7L35KAHgpYknN0SBP5RLz6Ll8vBLBfIgKR7kfUBbkMlhB7Gw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(30052699003)(23010399003)(61400799027)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L+WkY0o3byl/8KJfrAmF7tCBTBUO4hQJzdKGRGkqih/F+5nUIMRFwXnOUrmzb4MaK21Mjxrgu4yiiCLCc+oKQhk85iUDqgWiPYcTUmHvkuYNep8wCUy59u7eQ+wlrIAwzA6WaGwD2zos+kw4WfaKWhOcK93phIm2tDZoro8AC2Wc8tmLrdI5IZQiuQtfeN+RXOp+tlISWPX72fyzg8km6NgNTOqzvoua5im/j1FeCKXE2bxp1M5b4wJARYXlsWazd8hx/bLR49zWgq2yfBC1emsSc2qA42SabmcxL/s6qDAF90NRg2mJd7haRYV30rCSfdFtFobDnoGDufX8irUGSS5eGuhxSywaGU5A7+Kbxnik6Nn/f1nQUaotAvFt1cqITA4UjAoMQA39zCiJYSf9KA2stE0Pl1I5EHzyvI+5+Hx7czeehX2sFuV3mQRB4Wdb
X-Exchange-RoutingPolicyChecked:
	qWfoAnQzSxOyVzKApz7WwdiAlEMMsTXzurZ2P4yMVibEOkRGqXcMPpqzMKLGoabfIRNZeMf6UYPaUgRS5Os1V3A2+zdmTH8LeE5Dje06tQmd45+TuIAepvEtw4txMAChd0QQ+6kQ2hq7DgL1GooaHIn2pQqWGVEQkUZO3KJ+P1WCbCOsHrGlDcfsOxhv2TpczssVZ6MAM+PXOk0c8VeFDgxudbXE3PLcRnL6sc+Uf52VlF2ZCNprUYI5LzcoP1idCxQVaUBrZ4fGehKwhNROtPifcN8wTWrroOvaJ1UO3emyLjIY2KVIUkYnJp907d0A/xtClfRqS7T2Ps0OVhEjvw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:36:41.9803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a406016-729f-4135-c99f-08dee7357b6a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB5591
X-Proofpoint-ORIG-GUID: UWK_s4qObVoWNoGBz_59BArDNbKlc7XK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NCBTYWx0ZWRfX6Ne2upgoOVKv
 +ZgG+8Blaw0tH/D+85XPu/8xKm9v1dIOjLZ67Oop2o9SeBWgdr0+fPlTj5el9binV3PNSldkd/a
 IOUvwIVDIcY/p8o+x940LgPUR0rkX7Q=
X-Proofpoint-GUID: UWK_s4qObVoWNoGBz_59BArDNbKlc7XK
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5f8419 cx=c_pps
 a=FaoZe42t3hJ4J9xi/30H+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=z9ncmWt8M9pI67tEN-gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NCBTYWx0ZWRfX0e1nFDKOX/O9
 RDtELNw8yz5ae61M0AD6n/5uQjjbTFLoIGAlU7itZ08jV9d2U2WdFi1A9TkO7j6NINyIrEkCAvc
 mr3BeWOYgEME5V6xS60/APnFn+KHDoMPl1KkxEy4Yc/ZOkhQQRTq7G2/EKsMSR5RhY+yrMgAXol
 bdkbqFX1niWGPbDunSQ5TJv2vru8fcIRYQ2DG4MJokt5j9tZGyla4JcBcsWl8r3mwfH7mCdqa4X
 bg6N4WVUbSxya3Se48QS61gr6l+T/uuI0iRW2I6u/Ukqr91tR8sdFtbfviQGPoYWrs3fuDl7rVA
 8pPI3xsQ5Y4ilhkFpdByd5t3zzh2G/QMFNZ58AkgqbzFvSNgTrcIuf9Gk7a9mTd1EUMNhMal68C
 Ja9xwBs0OBajChpgNbVbinfpRX+P8XrrluOKrPl54wx0xwKdvL81aZBViPQ0am83NQZC1nONuML
 VkR3xVl1udXJLPfcydw==
X-Proofpoint-Spam-Reason: safe

A card level fixup_controls callback was added in:

commit df4d27b19b89 ("ASoC: Introduce 'fixup_controls' card method")

This allowed the machine driver to take actions after all the
card controls have been added. However, there are times when a
codec driver would also want to do things like obtain references
to controls for later use, which require all the controls to be
present. Add a component level fixup_controls callback, echoing
the card level option.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 10 ++++++++++
 sound/soc/soc-core.c          |  5 +++++
 3 files changed, 17 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index aa423865dbe7c..4b7d7954953db 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -78,6 +78,7 @@ struct snd_soc_component_driver {
 	unsigned int num_dapm_routes;
 
 	int (*probe)(struct snd_soc_component *component);
+	int (*fixup_controls)(struct snd_soc_component *component);
 	void (*remove)(struct snd_soc_component *component);
 	int (*suspend)(struct snd_soc_component *component);
 	int (*resume)(struct snd_soc_component *component);
@@ -380,6 +381,7 @@ void snd_soc_component_suspend(struct snd_soc_component *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
 int snd_soc_component_probe(struct snd_soc_component *component);
+int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 21492d15833f7..2ce24513fac5d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -310,6 +310,16 @@ int snd_soc_component_probe(struct snd_soc_component *component)
 	return soc_component_ret(component, ret);
 }
 
+int snd_soc_component_fixup_controls(struct snd_soc_component *component)
+{
+	int ret = 0;
+
+	if (component->driver->fixup_controls)
+		ret = component->driver->fixup_controls(component);
+
+	return soc_component_ret(component, ret);
+}
+
 void snd_soc_component_remove(struct snd_soc_component *component)
 {
 	if (component->driver->remove)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7817beea5b3bc..44f9bb4473f55 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2162,6 +2162,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		goto probe_end;
 
 	snd_soc_dapm_new_widgets(card);
+	for_each_card_components(card, component) {
+		ret = snd_soc_component_fixup_controls(component);
+		if (ret < 0)
+			goto probe_end;
+	}
 	snd_soc_card_fixup_controls(card);
 
 	ret = snd_card_register(card->snd_card);
-- 
2.47.3

