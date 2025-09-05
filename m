Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBB436CDF6
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082724; cv=fail; b=WMEL2T+fGne3xVDzJQSwgciBUYVLmQN9ULycYMwBJyWO6aISpxILqAaPRCQP4n6Z9XQJIALma9WOs1olylM6YKMCpxt2tG9YQ1HEX3eFDOyM5E22i2pLhJBPu+EYuZlod5/p2pzPHtAS9qK8Vw0sg+jNPUiIU6y5PNJoHnrsQko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082724; c=relaxed/simple;
	bh=ievNrVzs5IYRI7oaG515RS77edIVmmjsVUX+lbnkbYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngBoxqqDaLyVnlNjb7pUmfJ/c70Rv2NfwzHn+/E15oefeKFm2RiXXIKw/mNWemwIrbxIytF++U+BRkblic1tjWEL8i0PXolTdYm72PvByGN1pIg9ZGfpDujCOwSt/aZM/dajmUKebQ5yW3+NzosVCzzqW1BYD3B6+fwfNgyRFpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Q03cKUha; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EqoHFRVS; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Q03cKUha";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EqoHFRVS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58549Fck1243755;
	Fri, 5 Sep 2025 09:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ur9iku9RtTgy8rcZtjR1aLWnmPczm0HXVDL8cTxlN1w=; b=
	Q03cKUhaHp24kgW+9vxhH/04X+EgGE81zouYrA26tMcPaT45h7mhN8hiD8vktDoW
	Xywq9OyRRZq13WklQ1ynRRUt/AjiYOfoQ2EYqBvabJXH+yCHH8pEm1wjnCPdPWZN
	IZqbl894+mYac63KHRS/BnMuww8DStuqdi+23WC+AVZ2PQq+eAI64rl0rsDbUcdK
	4R1r080LkqfblVxZXuXLk0l4u0POU8H8spTXqq3LMgMWpoA+uYpDj77D6huO+LsA
	WfOmAy/N4NL58tare7T1UaI7qjkJ3opb4UEGTSJFrNF1H4YV9Au9v5lj7DGbeFQM
	AwjsR9dOMLvP4+qfO3SC8Q==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10hn2201.outbound.protection.outlook.com [52.100.155.201])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsvk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lofdouv6wHRI06xPzAq7CazZP24uvD1dr0MrdGX8P+5uwrIC+9SlGOXCeavf++3NDYMqX+nVQrgJzvSo9v1otr1f89wHClIjIM+xkRJG/99jcIk0qPhrUEWQRnvDsPa7kg7+402qu1+QrQ0ipyD4nDNw4A+d6Q34mtSl0pg0TAQS6c7C1g6F4IRNRrXdP1UABN8G/VPVc8cR2ohddqQVR8VzQhhqBsh8TRn386Mng7yji/sTJ5gqZMWgn20zdsKzCr+3QKDGM0WWNdfkjPrIzCoEF0QGqqdhEJZKJfzBf/wxPNNBu2hCd4g9eQASCzef6gSxXBrqbohzm348A+ReGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ur9iku9RtTgy8rcZtjR1aLWnmPczm0HXVDL8cTxlN1w=;
 b=EnYFgoqLNpMdww8bB7fmUUwA1lfLVzPlTk9jMfaEv8LPYRvr1kOeXk9YrYlzj5S4mmCficL1t+49A0z/6VOrlBZLUX5S1yF4hv6zlyendbLSUoP+/q8+AgFPjSIsA0p1CYHahRY8JxJtUseBqNJ8RBQnajszD9eI7znXBFzrEQkegy335756AUu56dFHbxvspMcSvi0SFix5/A02JbE+k0Gh33t0T56ZnE7oZTaGGZ4Ue0nvjJpAYOG5bHu/NmXO4ANkY+eiNLw5Qtaz9RV/m9k7niXs0UKjnzN+D+oadsCjgLkdRCp+p3KwRttfLcK6xKzgKoAhfMsW7CfVve+jMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ur9iku9RtTgy8rcZtjR1aLWnmPczm0HXVDL8cTxlN1w=;
 b=EqoHFRVSF9O6mwvm9kBRg1/tKPRLmC50ljL6vgti4vfxlkHp7jxkfob0pWo2F5JUsT5Q+wMpTvQn+IBhzKXCveBX1i838bpBjKLsDSjI94fEG/zh3La0pUkJpK7+CGVq9P8GS9m0PW9dMHD4tFi/nnoY3gqPno6M8P0P+psIoWM=
Received: from DS7PR03CA0103.namprd03.prod.outlook.com (2603:10b6:5:3b7::18)
 by CH3PR19MB8164.namprd19.prod.outlook.com (2603:10b6:610:1a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 14:31:33 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::2d) by DS7PR03CA0103.outlook.office365.com
 (2603:10b6:5:3b7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Fri,
 5 Sep 2025 14:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6B9E40654F;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B1117820247;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 05/15] ASoC: SDCA: Update externally_requested flag to cover all requests
Date: Fri,  5 Sep 2025 15:31:13 +0100
Message-ID: <20250905143123.3038716-6-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|CH3PR19MB8164:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 74dbc77b-dd1e-479e-1c35-08ddec88e8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TyN7dv6UOYB3Js7NELAaU6OlHH8X/1Bfx4RpHQi7NRaO7BoMdN8ayDmCuJKI?=
 =?us-ascii?Q?0Xtai+javJIh9ylmKlO7CVgxiMUHFvIlopqZdd7s/6YkDfftC++Dp/WGH0LF?=
 =?us-ascii?Q?zR3HnAncP2kgyrLk5vnUUD1KQtC4eV2Ddu01F+wkPo0r7B0AvVxLpR1B30Sl?=
 =?us-ascii?Q?8U/Uern8/hURh0vvUbAvo+vxBlRjL5HysOsr/pr+lvtSihVlgSL8ryDkSs5s?=
 =?us-ascii?Q?v7mm1e/+nzQJ+gjkoe05HN/7BHqRt8EYx0SdpaHEmPKXcCvj65r3LeEve6lC?=
 =?us-ascii?Q?ICvchEOVviufzCjMP02jXFlcEt3XlGZI8h4pQI6UhpfQq/MZbcbvUL4rCwze?=
 =?us-ascii?Q?g2DJOocoaB37fGdTT9GDX3ySGjsE0U3LZs85D2K3ZU+VMyYKmrU+IekYonQ9?=
 =?us-ascii?Q?u6Tnh1SeBdHnbfjVYhT4pulpyRXJJ39ARyCp8tZOC1n9KblY4I2UzIZn/xUs?=
 =?us-ascii?Q?5aTbw7Uy//S13SOsDb5TCZOyHfXZk+LW1YQxYTwMBCv0rX0Q/GXMzH28f4u1?=
 =?us-ascii?Q?XzanhfzrtBVWkmRmQYZ6CL9BSyhdVvGj1c2BY/kxn6mIoWcWT/PKc6FDydHI?=
 =?us-ascii?Q?txAdti7ajFnb0cvztaE/GN+2u3jxEDjvlcz0VC25o5ojocrH7YLZi5YdO8EJ?=
 =?us-ascii?Q?sWxue9iSKuG9w/BjpMjDWmMn/9VO9d8mCxsWmGF7/wLqyaXkkoYiNtS0qguZ?=
 =?us-ascii?Q?yB6quEE4rca4P9AZOiI6k45sunbE1jMqtWTMqvY5LAy4pFvpgUt6tqjP2u8L?=
 =?us-ascii?Q?alXukfAQHAAfbtM6uCBqUs8cDzF5yBxOcb+FSc4MryyeBLg+ktbQ++icggIy?=
 =?us-ascii?Q?A3wTxzuQ5UUgprCAhW0pCNmzEJbPB86jQplT5VYfnx8Y5spwbwVYmID+32EY?=
 =?us-ascii?Q?UIcMc4e04mzmkmx3V0b9vZSw63oz17wFJuXwoQXRIbt+n4oGCOsBXtCZq/DE?=
 =?us-ascii?Q?5RrcO12Cq6PYe0FWfGRlMxSzSsgeAwDoTsWaYkFyD2R9cZEjEeyhNXua0d0a?=
 =?us-ascii?Q?NgLSUvBolrlyEL/QWC/1PhYWGeZzSq7ut9lHzDz1HZcbre+Ibrf8XoM4Ywbx?=
 =?us-ascii?Q?SHgDP5AOomwmMUr2ureF/fjx4ammkvW4V0y7CZ5PmcjQ4hNlWTF/LqNOshDC?=
 =?us-ascii?Q?nuXfoR5eSDIHXwlkfJMwoFoYaYIPlXb2BeRo5OsQ+ES1L9LG7+DE72FQk0qh?=
 =?us-ascii?Q?0rvtiodzC/D+gP7Wtelkcxm8Zea1D77R/2b62nElczNvQoo+U1GU3n1lzwI0?=
 =?us-ascii?Q?QSbzsPsLF5LV5P5P6ucgXBgugOW75Um6k90vzV7FM36BrxGkKGVjx0XYx0GB?=
 =?us-ascii?Q?rSjkCZwNLH5pkI4IlczxJKBjKqG+9kzCnMOddkigrhLLmXn+5xLgDum8FhCi?=
 =?us-ascii?Q?kL09nNZwGN3VObnf7MUrRv3wmN/MHq/p5fVktp49myDDDaLpz2KLZ/scpwBI?=
 =?us-ascii?Q?prcHr93ydoIo9iv9cFfV4+BsKa4KhQXSLpROqDNrAwFAyK2SAnfi3WaGnE6P?=
 =?us-ascii?Q?4G53Er7KSR2XC4/Kk2ALaUX67sOvGCYogId9?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:31.7203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74dbc77b-dd1e-479e-1c35-08ddec88e8ac
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8164
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfXyWLAHEhFlyqZ
 ijwpjUxzHiuq0jf+430JAGhrd7oo1aBR3xdoo+1J+6KlGZOtiGoMY9RdUnf+vY5SiYaAD3QP5Ch
 /YWW2KUenq0jp5EO6iALCHgSPEmvTtYJUjgT6FpdpHG9taij+qI3kFGqmIYMuAgFZHZ0uAKju9I
 lqaBGznE7WNsQWWRWeDZudw9+XDsi7JOLS+IHgfT1KrrifwJ39oxM1qOqtwX9bSzBtc6iujQw6L
 1V08B2+FTCV5z54djJKCwDpDP8PT5gimW1QxtI1PphU15gSqf0HdU1AF5XL7zhjbCohyipV4HRb
 trJXHoKij5rsgfIzeSDeYVcXKgLYHwnD/QUux5Er0xfoQRlFvrbC3o3haCQS3o=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf448 cx=c_pps
 a=lVp5ksprjV3gSwZ1O2CBXQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=n3emF70xWfdXXSmRECkA:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-GUID: FGF4yMAqo3H5KUl8UB04tu27PJ6Eulu_
X-Proofpoint-ORIG-GUID: FGF4yMAqo3H5KUl8UB04tu27PJ6Eulu_
X-Proofpoint-Spam-Reason: safe

Currently there is a flag to indicate if an IRQ has been requested by
something outside the SDCA core, such that the core can skip requesting
that IRQ. However, it is simpler and more useful to just note that the
IRQ has been requested. This will allow the core to also request IRQs in
multiple phases.

Rename the externally_requested flag to requested and set it every time
an IRQ is requested.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h  | 7 +++----
 sound/soc/sdca/sdca_interrupts.c | 8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index d652c6e94ddcb..e2c1337d24e0e 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -29,9 +29,8 @@ struct sdca_function_data;
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
  * @priv: Pointer to private data for use by the handler.
- * @externally_requested: Internal flag used to check if a client driver has
- * already requested the interrupt, for custom handling, allowing the core to
- * skip handling this interrupt.
+ * @requested: Internal flag used to check if a client driver has already
+ * requested the interrupt.
  */
 struct sdca_interrupt {
 	const char *name;
@@ -44,7 +43,7 @@ struct sdca_interrupt {
 
 	void *priv;
 
-	bool externally_requested;
+	bool requested;
 };
 
 /**
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 944d4713f56d9..140764931380f 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -262,6 +262,8 @@ static int sdca_irq_request_locked(struct device *dev,
 	if (ret)
 		return ret;
 
+	info->irqs[sdca_irq].requested = true;
+
 	dev_dbg(dev, "requested irq %d for %s\n", irq, name);
 
 	return 0;
@@ -301,8 +303,6 @@ int sdca_irq_request(struct device *dev, struct sdca_interrupt_info *info,
 		return ret;
 	}
 
-	info->irqs[sdca_irq].externally_requested = true;
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_request, "SND_SOC_SDCA");
@@ -379,9 +379,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 			interrupt = &info->irqs[irq];
 
-			if (interrupt->externally_requested) {
+			if (interrupt->requested) {
 				dev_dbg(dev,
-					"skipping irq %d, externally requested\n",
+					"skipping irq %d, already requested\n",
 					irq);
 				continue;
 			}
-- 
2.47.2

