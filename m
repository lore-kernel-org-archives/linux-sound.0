Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB043BB689;
	Mon,  1 Jun 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324126; cv=fail; b=EDH5IzGe2pjUkiGosuS3m3x3FhpYVgunSNjsW8Hdwgj+aam55Gw/d4vduOiccY2/8duNNh6MRKLpwX7c/5r7JEBrtnpASMz/v202Q7e1237wknX9KRlyaPHIpbTJi4uajXMCpa/GGj5Spe5MDVGfAombAyQMMZ+f+Ig0Sp3lrSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324126; c=relaxed/simple;
	bh=L3VkRSOIu8ymHrAUOZU+FUbKwDR/VNKM//n873yBJTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MAi/AG44ZvYu3O95HYt6BNVG59TXnzIzdxRGOKLfF65jlOSSu8NhvUjrFwc8wPLZsIwIHwml26IXaWXfBg+GJrgd/CB2eATk78EjZEu+OOHL5lgAbP6JfctJf6uGzl6B37hkzydU9+57RskmOW7oveqpBtjSRIh5Eg11ifOp78E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p8b6k6cU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=r8OByXg7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p8b6k6cU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="r8OByXg7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651D3kUQ257676;
	Mon, 1 Jun 2026 09:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=nxN5oL8yujSFwUpY
	opfYIoHEtogGA9Cozf9JsC0yRB8=; b=p8b6k6cUVwqTHipBP8ezEkie6c2aGGTR
	KntIphe4L32yF0nzO83LnHYvDSxQhB+SBWhAYb0FbMsoY7nd72jQRfDvBroF6Kh2
	PcGVYB+YH8EmoG4T0rOuuot4092eQBDQzgRmb1ED9IxgPOVPP+TtNZFj9e407Qap
	qqptJ+/aECkr65EwJxEeiQOx70vE2kusEtphfeSe9N73SOOncAoEvxGlBSsD64HN
	YyyYk/0/abYd363XKRy8IJJN5eU6zdiUtQnj8f3mfaumBqsuG2WNpfuy2iV+8lMt
	DIVcpiLsLVQ9FUIAT++XUOP88huuug+LwEwQ3hvL7Uwsx9Jf6ZRwDA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021077.outbound.protection.outlook.com [52.101.57.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa12m0j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 09:28:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTUEhCjVGeNlxTPAH78csF72e4hEjJuDyUELPnwWTswQ5poGvqYbe5Or/1OHthzMlcyutuG8/EvjHnA7/fH4dxNE333Ge7LXW9uvqapt2uIubY6n+1i9hbb3loJr7wQsN+2lMkQFQ+CoRCgjPG5gaiAEMdEm5fv+zOZONH0I4C09p4lLLb/hIlbr0tWVHFipKq3h0T8KiywxdGWKwRJxCXDozhyPJoz6wcjIyqYu6qrscU5b8EYu3LvszLx3zn7qM3nYpGEe0RXiiEHVKJVaFJyl17lrOst2jucYoOZKdtDNxokyu6pqRo9XuKbFbro+msj/jbgy124vXwhD3lSwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxN5oL8yujSFwUpYopfYIoHEtogGA9Cozf9JsC0yRB8=;
 b=NN6sEJeW1FI6Zl88eXW0Dg93txqFp0eCkqO013N693aGM2e+5ErBVailqXF1Qe97X4pecyH2IT3RRAJMNNDwHw30+NxRT80ZFOqLaI8njUrCCC1G2ZCzrx1mmYnfZsFTlLXJ6C1Vjtw8FwfQEYG6UHypNNhftrK4mM91d/CnBAqUwVZ22hGp8eCy2WIttB71iHEs0vS8VKb+Kg5L0DFI1wj36EUt7/uWqVXLiP+DyPV4gL91oHUrqoR6EqtRCDgH1UyyBkJJl+yCot8gOGQXwVdTyv0dIPzUKWqWQSKfrDPZs6NNdeAeBDWsrWUR6iqKEqef5UbQdedBiSoOeYRcIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxN5oL8yujSFwUpYopfYIoHEtogGA9Cozf9JsC0yRB8=;
 b=r8OByXg7O9F5zbypUTwTqBqToDzAVdMbHV/jmZAymUkceMJClAT5kSvKS+d6v8nPmnDgX/2+3n+g3LzgzQhAbPKX46hBfVLWfM4ToViCnGQso2Ri5VciTY+SmpYpsWaDSNEGmYP1hIqgVQCWhjff7cAUD/KVqfp47JQmv8VWdts=
Received: from IA1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::15)
 by PH0PR19MB997232.namprd19.prod.outlook.com (2603:10b6:510:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 14:28:37 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:461:cafe::22) by IA1P220CA0001.outlook.office365.com
 (2603:10b6:208:461::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 14:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Mon, 1 Jun 2026 14:28:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 26790406540;
	Mon,  1 Jun 2026 14:28:36 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0525E820244;
	Mon,  1 Jun 2026 14:28:36 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: soc-core: Create device_link to ensure correct suspend order
Date: Mon,  1 Jun 2026 15:28:35 +0100
Message-ID: <20260601142835.282301-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|PH0PR19MB997232:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b70c2def-6b39-4b4a-fd93-08debfea11a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|16102099003|18002099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	Iy2DPt7R+NertHTDISEgl5qitvIYLwQDiUROxDjw1Vxvp3poLHG/D4yrt+v8IfJU0LtENFVCmynlgtusVUW4vwiJ2/cHggTx0oUOyO8n4c0+AODXXc6TN4Eu5QHrfueEvR9ZFwBBWTVIWwPwFLoDrjv0T0/Y4sTTuVM3GQm3hPvf1jF1tuFOV/5qq90Y2GK8Cw3iT1J4uPGmWr6cmVU7tN50fXPkTWDtDjDQ0F1pV5sCXBx1Xgn5Nw3rDRtqi4vmncBirI63r2n45cb1Z7XUXsvMz6oIjW61CuzSONdXNoVm7+H2mj+PnLiBoKl4Bq0t1A5x5Bp2IqmPVGkhmExhVbg1utNbq1C2/g+7Nl9VBR90EM7vkBxAuT7SCbZVl/CwEQB8VBgOqPzQM9OxVkwWKkiQEdEi8eHZyHVv4ry/ke5EvB3TKJjdxDvhnWS4LRx3sR4xi/5n/SmzP54Zl7Kmu88bb538ddQwXjDEpgsNDEXsuR/31/JwYGNfK3NMOmFGO/0ccvBYlkgBpz+9W+Qbz9XnYIeclWwHbbg3gJJuxfkuibHyH8Q9cwYs8cIGUgrr3Xz2LlV6uxSjCvbt2wTmKbnjo1oRViuWJzQ4g0h1yHPJIHu+RM+G5muPJyZnFAXs+omYgebTonEuCRLiYebHMMm1oRP10QAsyEAdrycQ4Th9eCGezaQ7r4dURIBM1sU1oryOPD3UnxTNDoV00mEpXbcCTaqPE90Lh15JxQf2M1Q=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(16102099003)(18002099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H22maTAWyoK/de4cFr278n9Tyk/WF9P7HVhJIYgzIVawUZbUzBhB+qDuq4uW5jHa4r8Nj7c8bjNrLshVMogmIiXnUZASEN8ttr2xkh+bTTN/vqE68HOZLRJ2hq0PRIyAOc92u4UIBPyFvufMdQk/1pWeloqpb47BV8qpKndgrCTQZ352haZdgF6CDhKU3CWei1BiBTSb7nFiQ7udXN5+qTVuFnYUvML0O4W33wk1s+nsPhx18WqeA3Hr/xmUhCvyb0cXrH5BjrF/3QGOYRj7FrQQ/3gAkWMoOPst8N0cQyLM4H0P7U8Dl1l2DW9yVa9L5kSuJVFnuM/t23XfFV2GoE+QYsLTYbq5aXp0t+chamdlKEUPcfppIOqh8REfgdsDsl05gKf8PD53Xmnw/5AaPb+FddRLkpyOgD5/lWJw/cMUWXlRpWwoQ8HSs4GocvKJ
X-Exchange-RoutingPolicyChecked:
	KTCiKq3lNFSP9AcdBs8etKhoXk7BKsRhQts3N66stRx/ajUz1D01ZLmmkFoIqHhbUuIBbVGhxrLGfYo0d1bWkhVHVu3zmZMW5/9ksszL6FmqAutlY9oh25ylaJQ6zQPMK7B33IJ+m4SMsv+eJso3eX49Pc1F4sxn7SYQ8OfE12jmwoYD0AkomZ3WrVjl2Jr6y49lnUHkXcDR/HjNdzbnda9lZSvNmzc956ub9u+0XcaUBs0Sp7IUCB6Fgc/sRhEHrGi5cOrtwzPI6O0PoAJjxC/Vs21uzv/kQ5csxfQdPyP3z5vz+tLv1ZHuRUCOza890UCG4x1G/jkSI4WTXOyN+Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:28:37.0143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70c2def-6b39-4b4a-fd93-08debfea11a1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB997232
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a1d971a cx=c_pps
 a=BLvYkjn5u0YClySNKAgoiw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=fqeKqeLoY-IcY4EypFwA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-GUID: 9MWz9uvbKp-LcKnN8nHGjqndttiPZpmt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE0NSBTYWx0ZWRfXyyceRKoNlOmv
 4/3LPmzHjSk6mOm11ubYdw0CgnIUqkrVlqazl3y5TOMZTjOVT9y7XF6wTWUpPm+ejfgYW2CyAGN
 xStVzpOiyS1vlt81pco7XO5Syap8P+JM8nRXwz4M3cfVkw1juCGyW41pKFZ4NahdM5eqnxIh53A
 WLQpvRWfIasGWNyVGVvCTY24zfyGDJCEMjjrEELUU2YByB4Lv8F7Hxa7LyoJJEYH7iMT61/XOrE
 AoHervGNCy794S2MFMx/bPMNCEPtijmf7k4+XFlIXz7L3FL6SOjRBgQ8qmNmZ7m2lf5g/8l6/lP
 ZKHF4E8jHefXWUNWPWVAT8Un69Z42hfMNyyTzTghDZK8oVrROKg3QX6sll9Prp8su/rH5oarHtp
 fCKbXdMU8lH5Vd5w0nIFp63tS6oV2dCH0Kv9iRH4U9ufU3g2DBXN/Tbhzh6146/sdNtbD+EtmAF
 ZBvA16r05Sw0rBbqYlw==
X-Proofpoint-ORIG-GUID: 9MWz9uvbKp-LcKnN8nHGjqndttiPZpmt
X-Proofpoint-Spam-Reason: safe

In snd_soc_bind_card() create a device_link from card to all components
to ensure correct order of system_suspend. The card is the consumer and
the components are the supplier, so that the card will system_suspend
before any of the components.

The PM core will normally system_suspend drivers in the opposite order
that they registered. This ensures children are suspended before their
parents, for example users of a bus driver should suspend before the bus
driver suspends.

For ASoC, snd_soc_suspend() shuts down any active audio, which requires
that the components are still able to communicate with their hardware.
Previously there was nothing to ensure this ordering, because there is
(usually) no relationship between a machine driver and component drivers.
If the machine driver registered before the codec drivers, the codec
drivers would be suspended before the machine driver snd_soc_suspend()
runs, so that ASoC is attempting to stop audio on a driver that has
already suspended.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Mark,
I think it would be ok to put this into -next and let it get some wider
testing before it goes into 7.1 or older.

 sound/soc/soc-core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c0599031a3e4..1820143a144a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2297,6 +2297,21 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		if (!snd_soc_component_active(component))
 			pinctrl_pm_select_sleep_state(component->dev);
 
+	/*
+	 * Add device_link from card to component so that system_suspend
+	 * will be done in the correct order. The card must suspend first
+	 * to stop audio activity before the components suspend.
+	 */
+	for_each_card_components(card, component) {
+		if (!device_link_add(card->dev, component->dev,
+				     DL_FLAG_AUTOREMOVE_CONSUMER)) {
+			dev_warn(card->dev, "Failed to create device link to %s\n",
+				 dev_name(component->dev));
+			ret = -EINVAL;
+			goto probe_end;
+		}
+	}
+
 probe_end:
 	if (ret < 0)
 		soc_cleanup_card_resources(card);
-- 
2.47.3

