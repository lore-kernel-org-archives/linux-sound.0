Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC59D4F7970;
	Tue, 12 May 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580883; cv=fail; b=fweXABabJyPtAwnRc5j95TqnN2Fh8egHHs4ARNmRXlRhtCGmt37O8+vS9uhRwV/iXAOz0N7ACXwgeJufGZdKWqjk8GeO7CK44LFbN8RHZJVder50mF7WHftU0Q5454vQeSRCp2He6BBvoStIXNc0vZ5vOAmPtb5lVnUYHC1yCoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580883; c=relaxed/simple;
	bh=PuajoFaCUAfsbPVyioXSIb/O7dxS19f3eWEcu24R+OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XG2VfenC9WJ3xED1CbyCAe01u18BkU0LYOS6+TPywF5rwkCyF97qf75UBPKR10lLwWU89tuGQfB9Q1Zi4pQmP3oLEv74ko9nxuk6zYhqyvvG+XLQEM+K6uP1deY/JFPJEpPKBInYj4OjXGXRvLq/PmNEMEAz+e4Fpz2pWc3nJRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pR7i1sSk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DNmmwoqf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pR7i1sSk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DNmmwoqf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C59jm2818502;
	Tue, 12 May 2026 05:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5pVZtruIIRwIYBmAfM1/WscvWnph75Lz+0J9Pc/tqqY=; b=
	pR7i1sSktfILxahi7VSvpIAp7/FfG74a239rQNgpv3g5/c4XPxIQiDOBJM7Vnf1O
	e8/hWXO599b0e3ELtHDJotcxfWPe0xsHdOObX/V/Ysfl1ZfrsRCjSeqY4CxfgyNS
	bsoT1RN34ORiXivR7uE3GmE3fipuSQXIJlpnYXdVzuX0W9zSXYU8o5H9w6l+OTmE
	TNk3zZP51dp+/7mY9LbrfcPnc80LKpCY7FedlQlD58FJX8mrBYW6qwFcgmcwpyuC
	D2kovz3zeF0An/Icom4rsxvdbgr7n7nNvvu7c9s9set+IeGFI6uc6cXaRypKUpv/
	x2Enptyl2/5iru4yDs+Yvg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022083.outbound.protection.outlook.com [40.107.200.83])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqierCNyn2wMzTJiFVvEEhQqLUxk48i1NWhZGrwtT/IPmbtB4NpVm+Cmkb/knruMVgcqh+/WC9s16tfGau9qvGGDfajB7sxxSs8nvgnTB/0+up6/JdHsIUudLnDRDDUDtrvAt8qEoL8Hq6BQ422ljn+fH5dZGo62tB2QBFuXEvg0MxGvu7Ou+o/9gxPZjWGxFaqtYfM7EoSpwv/8Y0BzV3/VvsCtsd7zDbYOcKj3uhIdwd29srGl6if3lesOO0MLBHH++Yqwfuq5PJ4WpS7gYEDtyhcUq/gI1fA4X55V8rSswxANwWNjN7zOUFH6wvk8+MW610I8g+G12WiwEOkpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pVZtruIIRwIYBmAfM1/WscvWnph75Lz+0J9Pc/tqqY=;
 b=v69b7GIEwvavN+diMMEQ0l3v2UxLfKlOYaPa4Ax/Ic3LP6TDQ3tMFdjvim3kpErN7XA4HSqPAQIsfigR0tzm+txFPIDMu+hLL80uGxwp0wSZI83pDE1pusq1NlbRrHr+dY+KqajJoyQ65uogX+hAVtuzndyFFPAN9J3eIg86glU3J9V1mRJAbOMLUIJ0OyYDdIN28sSqddRdY8F6RR2D2Cdsu+wqQIaUmuBSOyx2gJAAK8QNqXMEq1Zz2UZMczsx9BL8yQ3LzKpt7tEhPf9K8WarR4R02TJKfBBq89EZACwah1yD+tCGs6L5QbJd4wgAf5dw21E5ge8pcheTbo5BZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pVZtruIIRwIYBmAfM1/WscvWnph75Lz+0J9Pc/tqqY=;
 b=DNmmwoqfBl6QTSfnM0h7o72YXkfcjn3zwhYwTi1C8smNI1DlTI7nSGx+xtqUzAD6auXyQ6fIl4vvlVabN5ErE202KjLlMcBAdtAPWpqdFfRUzw3jBxfCqG7VIP52VceiU8UFJYNGl+JDhS7lAmsrh+2CG+yscsFYLtTwiBK2FhA=
Received: from PH8P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::22)
 by IA1PR19MB6396.namprd19.prod.outlook.com (2603:10b6:208:3e4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Tue, 12 May
 2026 10:13:57 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:510:2d7:cafe::c) by PH8P222CA0006.outlook.office365.com
 (2603:10b6:510:2d7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1D45406564;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CEE5C822555;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 14/18] ASoC: rt1316: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:44 +0100
Message-ID: <20260512101348.1138044-15-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|IA1PR19MB6396:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dc61d526-a68d-4c02-2f11-08deb00f2d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|61400799027|36860700016|22082099003|18002099003|16102099003|11063799003|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yK1jjlfsvYxM8KjtIkLXHToPDtACWgmTXTGdQfLXJdAIVZe97tQ8s+iWeu4oiMneF5/KfSEMTerb1LlfUJeCi15S+rgEPE2OiI/BK0lrA18//TrXG1hcs51StIx9dnMNvgn9BxPxAqxGEgLyi+zKGDaR1mOxlUFq/SK8evjK59ipAJeFTSm6CK7/HWZ0WE3CdtjNq+U6V8SrVkO0xHXAA3AEiZNJZ/eQhLiZtG60ll36WcwsUVcRI29KA61Znan6DAZo+aP/2qeN9F+dLULxTjKcCw1z9wZmyApXAuFtKefOZTAELALaeTkJ1/9rv/oVGQk8eMsEtKcTf69gZy/WYTHe1IFBy0525xJvjPo7fk9KLQDAZkiGuB0wyYRaZnrdvUt0vAQkdTsV3U3ZfLvTdPihnbNeq2915GM+O5m35NvRHxRdVcvuK6dArSc1wftXwd+KXepeg+w1Ay+9MziezC7DPOYV5TtICG9Qq/wVMNj6fvGtaL2Ofq30Ee1w7xIBhKXqGXH4m1jJ8H9U9IQAyG3ckjxjzdJnpPX4BO51BNA8eSEhakdpxduF3Jqg/YoIpgU+44Vh2GRVZjZ7/DdXUG0RWhBUGpUegV7kM7NcPw1Su+7t4F0MsDbc/ssP3aFPKR4IPnB4r1hLdVaIT5bF6Aj4TmkqbSiRucx6XRuB2D2pqCmmiRsgR3Kdrjub9aPNsnu7TYKVI3fR+e+BgBloSGjr1epwLDti1y9A5iM9lZo=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(61400799027)(36860700016)(22082099003)(18002099003)(16102099003)(11063799003)(3023799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zf5X4xYEryW5fUeAdL6JxPKFe/5huFyYi72Sj1MACn/RjyOVaG9iSr7B17SnNdf9y42rzznWHZ2Eeyi+X1NJdqNb9C6ppcASOf34WNWQvCnhgxvQ5YMkq71IyXKLH3I529fQO1Yqym/rz59/2Q8EoAnJZq+1MylwvUWVID8+3VgJ1UEEQPBYeuMqs3e/ctFQND3HvIYIJMo4S9IVpoDHtSZAtlMe66HcNw7nsxSpz8AQoJzrEryWDhqrPx3PfDO26SfL2jwGNklkpQPFIwGACFIVjONJl6EkwzMEXk+z3PQNeLHbIdpbGYs6cu+O6gYV0OMGhDDZUfSujWC+HBjmoM/nF6jJdMUxZwcgbTxOF+oeog4MgfKBjVtT9qIJkGlcQNWbp7COUBTc5SsCHPovQs3E+L0SJF4quJ6IvJ/X47AoHrL7/K3xUM3ZDK64JErw
X-Exchange-RoutingPolicyChecked:
	c2XPfSugiOg1JlxrH1E4rquDeGUUWjbyUlrObNNqpxLIkUVKd7N+H2KJmqQqCEZgulFluKN1RuiyRXGpnsadvi1JOgjRlmVDwHYCkmBpYRPoVyiI9zXw0DjRMqC1yq9uj1Km8fbwOzvisaDFbI/TMbX7QfsmTwFrXepBAfSyLRoMawoXhzaOv2Au00BOC3z7kbugD7F9TjSg19iHkBOMeXUUqEqRjQZLdzk2UUrAb2AsHQuITro5nrpBUHYUsreqGTajt5JEzHNpv6oH6ACo+H3MehtL+9WIm7Fz7Uq0a+GTAJ0+7mte0ng05nSTGlg4i+shVhXS50TF2/p7dKwTrA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:56.1716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc61d526-a68d-4c02-2f11-08deb00f2d50
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6396
X-Proofpoint-ORIG-GUID: QfxALDxzqbh4fP5Tg5HBS_s1cHb5xNFd
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd6a cx=c_pps
 a=ZzZLShWY4Ra8+E12r48fxg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: QfxALDxzqbh4fP5Tg5HBS_s1cHb5xNFd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX9UIKEax0W+tC
 HICMNrQHfKFrJ3lxnvCYYtuNJRzjENxFIUQpLIe4dqFtipQlMcrzGGqr0w1dwjH6a9rBBGOcpz2
 5gQU2Md5Ie2XfLkHlPv+9YFc7RmS6ZAxhENYGX/ZG43LviTeiR+1UEiUm5lLARf7ZAG5TNGEgb/
 4VBE/C8I5wOuXQ2/Z/82/c+Oqfyt6OVH6UjfQ1BRG9qBYcZ3j1P4saiwwyCTmVZwHAfH7N05HZd
 OdGGu2jNLs0Ow+G0aZOPst31ODKGcoJ3s0LjIBXACdD+OP7z2ktLl4rBmJiQtFExN2grq+bbgCF
 AL2OkX5mJgLca784vDvFlkC01NlfHgLSkoHCr0XZBTSb23ANsXYv8cv7Em8UCKTXjnwFisAgUgs
 4FrAPqawqq2OO15uM6FMk2DNl9uDSkgnKPMgFhPCifu788WJwS3kFXxotRhWxaO4tjGOtTeIa40
 9xgwHxNaPVup2z8bhCw==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/rt1316-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 20fc1579eb9cf..1828fd9d5af6a 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -745,25 +745,15 @@ static int rt1316_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1316->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1316_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1316_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1316->regmap, false);
 	regcache_sync(rt1316->regmap);
 
-- 
2.47.3

