Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F447D92B;
	Tue, 14 Jul 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038696; cv=fail; b=bGI68vI2pobnjOcXD14bnLPjsdfN6GSxnR1UEnhwaoEBNnkq307v0fnOb3yNcYNFQ0y/NyWIbQG9pz5d7MQYNbrAp+cdW1eRguILY6gFDE4YtlVdJ2CWUmlO1B+m6q6D8/wBcz9IAtm32dM0bUS5qnCCYyotvRmOaLmv2dQWwMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038696; c=relaxed/simple;
	bh=RoUgCqP08wCn6t3WenE6aHYtBphPxqiubECWb+hUQGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxAKdQDJCyDISlaDnlTub156nA8djhRbddaY7OpT0VOsDaWIpsfCPwjFXL2cehGT3TkMc5p4yYr4IZeNjwB7b0iyh2NxivmHqnulVD9eY7A8rdYuVXjP9a6ym0YiPT+5dwvctV/h0ZblE0Q/09J1XgjJgI6mXbN7qjJx5F0vSFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fuHNhi6u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ma4xXmrg; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fuHNhi6u";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ma4xXmrg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E4voeO2160427;
	Tue, 14 Jul 2026 09:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5slkEU6d5UXBvS/ViaGtFMIjK6bYQsiavHPvp5tzWoU=; b=
	fuHNhi6uvXpuPWHAWnYxp92c2jfYsbCRsPC07tgWk2w3BvbuFRd+xKsWhx8Im35a
	hVVffI7PHpXzkHCHYikcMG4kYxGtJyJvT1zGR3NOkHRve+90+F9hV5OEooDZy/rj
	F6vYGiWtl+eTv32W/0MNn5t7MuBrgf87GyGuZnI2xw1kZhDWoDVcNvi6RkNBHJAB
	LI4Q/rY4TXSyCaHVg5x0GEW4FuTwr6IvgqPszDNhIkoX2S6ugMypbSkcnpOnVeZ0
	hO1dLh/IQMkJD7As7UPKySSdAm1pvx5sq+lIh8Q20yeygMEXXFCgqe94XwH6HrE/
	wDfROCTGfnebuvq8/WFhlQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022086.outbound.protection.outlook.com [40.107.200.86])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vux90-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 09:18:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX5WAVC8aJYOiM+Ar0GZpmCr15JsqTnL7f8ah5Gq9YaLPdfmzK8UhuDUIlZK/q34+GTXzi7MUiCEJPvca1VwlhW50b7zS78Mjx3+TdKStmyAile7MJVjFv/OjZS+/m9HeFAf+Lr4Erd5zZN7tgUpdAC9ytiJ9PpRenhcYYnk8YV3DuFS2m84pTZLp4Y9vgVmYAoFQX3ENHwnDgG4YY4W+EqKitWWB5rUZPqhdubIkh1D9NvfFSmgNb3Xag6/dCp8lkDSzXw0epOcE3eMXFWCoD5zzKUxKfgaY4u/3QTMvqVY858Hk9LNLN/vPNOtijdgKTohZRI1QjNzPRUDfuCI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5slkEU6d5UXBvS/ViaGtFMIjK6bYQsiavHPvp5tzWoU=;
 b=uzK1axLet9DSeOnGypyN9T0wBgfTPbySWJhqHTspDSmNBiG7TIIP5X09SMeiCaTtEgPU98RttGEK9f4ZSEfS3UCtlYCB3FMpF86D+iQnQ18sSiScNHlvCtf9HbBc3jjKcY5rA/pPp+31cht7FKxChAAFaaeu9XXQwRKBF87Xl2586rYaik3db0TtXR1Q73P9amTNR7O154yhJS2S9HMdGwSN7R39kEvIjho00NBjSlu+KsTpmhK+T5l1OPnytkHUS8t53Ij3t9tCLUpn1Co2UYKR7iAi1j3cIcxpFJFcrUV1VidD1fvnYIHATGmkrGMvT00bFe11gKVFNC2LbV5oIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5slkEU6d5UXBvS/ViaGtFMIjK6bYQsiavHPvp5tzWoU=;
 b=Ma4xXmrgaTsav2E4UvMWAMqeN6PeJIN9HaX+V+f0BtgEF8XzP6SWPezTquBo9qGxXf59Z1YUPOfyr5FARkhNbIqS8iCIvUqOOagrwXbcB0L/Qo3bkpIMZBX8cZ8KAJFhBoaypsqE0n9HI4YqK/R2ztg0ulE7u30aE6yg69g8ah4=
Received: from DS1P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::10) by
 DM6PR19MB3801.namprd19.prod.outlook.com (2603:10b6:5:22b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.19; Tue, 14 Jul 2026 14:17:58 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:8:451:cafe::87) by DS1P221CA0013.outlook.office365.com
 (2603:10b6:8:451::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend
 Transport; Tue, 14 Jul 2026 14:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 14:17:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D9055406542;
	Tue, 14 Jul 2026 14:17:56 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BF54C822542;
	Tue, 14 Jul 2026 14:17:56 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: SDCA: Populate IRQ data earlier
Date: Tue, 14 Jul 2026 15:17:52 +0100
Message-ID: <20260714141753.897254-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714141753.897254-1-ckeepax@opensource.cirrus.com>
References: <20260714141753.897254-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DM6PR19MB3801:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 09fbdb56-5d99-4f90-0a0a-08dee1b2b481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|82310400026|36860700016|22082099003|16102099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	aDUBd/6esNrqBh3wqIZzZjAtPAiYb8epWAMxkpJ2kI8lPvxxf+ZMI5LwKm6FNDStOAIjlnwR1XeNbZKbGuuQzumagez43ltzJkArQ+mQj1xpAuf5Y0A1lb/C/SsuEXOR7JfRQf9Veqb4+GGACg0pqDHO/8uxFjBRUFnwzpHeR0DfHOS8O2GlUS7dEErBSDog7bidtfg2fwCFzocREH3rRqULSttGYas+IFiXTIdAZGmNl6vY8RAkQEQhujnsXof3yZPcFaodmZpuIgDHJDS/cHKXvCeV9QmQiszVsOvT1rORd4gpJZDE9DE+TntCfk7ZtLyxENEFhuEHrGvxCua1m7BwDA9veDa4lGHzx4IJyOv2NFdasZBqabRf8HPOr1Xx2NN/TC7vUAN/otq4AVxxNxzs1PIJI2hchDZ8HqRN6Bn+6gYDdTW8XfNZqcgOPqfWgC59QgylIeQFjZBwXlkm0jOqSxjHxox3t/3nv4voKQ12AYPy3G5m9sVCBeUK+q0hkcNFKiGFJPYhNO0aevg8+YDlOOfCfmpo8jUYUfXCQDECnwX+PcSiVmYCnjcmeTC8+3Fzg/NU2JGHr+WShyvRFpC+Gcvo8SmOQdSxI/g7s5jH2zI1/zpgyX7ZjICEA6cESWEOLtl9I3NnnNbrBaJZWZ/+o9aW86YwsUoXfeG8HZQ7K4whtszVuQyUiTGwrk+UMnnM/MIL+ma+aTGPPiyFyA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(22082099003)(16102099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qf8Ts6igZ65QPSUKuxsauEEhHsoLu+IXaUDy6JK7Q+8y4pI99XNPUkUZ1bJPUFtD0DCIpTdF8I/94WsCyuwde2I15WJjb67ceAIt4TuRqvttolcZzG6khWxxYM1Lzw7DAalE+XtMM+P2SITukzWK/3L8OPYSqFu8n2DLVUb/TgzwiB6DbT96rN9Qgn4TIT0EnxLB04w2VlMBvrzoWZG4BpLN3coKoo4GPP4qQ8kA9MFWO7cVSJ8qwch2+w5zZCjZk6A5x3zH3cXdgXVeept/5paJ4uFFcFDzKPcKzuGOOu2k5GXTgm+zp/KMtL2jUFqqISRuzcTlQbMvMk1lz+exECgx3dgehiQtBfyjL5qHCHP91+x6L7wRW+s8m8jrSB4Q+tJRpfzAW3nf2oQlKCTDpS95dIUG6DKd1qOzM84A7K13/ZCtmk4B7PpIb3EUjlpE
X-Exchange-RoutingPolicyChecked:
	Rz75hoDaIqzRzXAftQHieUh5V3u1gBJJzbL6XUUdsS0N7HDjHrRdVjA8Zb0k+PlFnsNOS/5fN1jFUOeU/yYd9+GVA+2nCLlavAmrZbH0xqf+zKeJcRwHLoNjPFniCx26x5kUenSPfVYx6upVQK7x7GvyzFuWjG6UxLbaRgpBj5BJKHvwlWbexJK7r9LL9EFCdGa0enZVBBWbT3bNrUNYhdNCFmVQo0RCO/GoeW+aZvZNHaBPYqIGgBp3CWbUNIGgnSx5/imEjuELue8QuKGTMCW1qFvXU415d7A57mO0YnYhrTzXzYZO83Xj0SxWDrJbdEATsPlzQ4B8KaGV/556qw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:17:57.9321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fbdb56-5d99-4f90-0a0a-08dee1b2b481
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3801
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a56451c cx=c_pps
 a=9PhP5jdPzEAvW1dfnTQ6sQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=WLWlQwCXayNZ2A3uxKcA:9
X-Proofpoint-ORIG-GUID: 0dYrLVCeUppqJCrGsPapo1luwEiShmeP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0OSBTYWx0ZWRfX3aCdoasy27p9
 T+RTX5d4O6zSm37wUXo0VoZshnjm7SUwJh6mYISg45q8xEY7awgBzMVeRnynnsEn4/DYl9XLi0Y
 PFNWBKlXqMNSHs842SpjnaPYamSME2o=
X-Proofpoint-GUID: 0dYrLVCeUppqJCrGsPapo1luwEiShmeP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0OSBTYWx0ZWRfX3s0MFv/cLn7F
 vYz5wf0XfW1vhO7IBSf0RPAcZqZ+OLz1YULDU1kMtnaOuL4VHwcPxwfuTEWCO61vkjZixwBgGGy
 UkZbc/PLUKH7PTJGMfpNxLvGLxjLZe4xfO5W/B2zrA5HiIc33xZzCuJJeCrFEVJ7Zp1OHWcNpSS
 bGyFstKh0VMJXA/hF/gSFkwl19iI1WfB08b8Pr6ef7j5a7RyWfIFQ55XJvxUOz8SQfcLEYDGpTN
 imrjoyi/FWSo5Kqof5aTXL0a95e7HAr7iNKx0k5dr8WPX0SF8WF0RaDCqsHdr0mN+x7cyrbdNUh
 qSucFvvhug12HsyIok7e1nDxdTtgMXujvbPYFdOh51kCpKd8m8y6pM80z0Tjs+LTcnj0bhPQuBv
 OKPZmJoUw6RwmqSboC3+ie02ClRL9kqddBKoigFY0CkGPk3ByX1UvD7f22wPGLBJjJ2+2mdz/GU
 de605VFVcWvMIyUlRvA==
X-Proofpoint-Spam-Reason: safe

Currently, the IRQ data (attached Entity/Control/etc) is populated
as the IRQ is requested. However, this can cause issues as
occasionally the setup process wants to access specifics of
an IRQ before the IRQ is actually enabled. To facilitate this
cache all the IRQ data during sdca_irq_populate_early() and make
sdca_irq_populate() simply request the outstanding IRQs. This
also has the advantage that sdca_irq_populate() can now just
iterate through the IRQ array which is much smaller/faster than
going through every Entity in the Function for Controls.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_interrupts.h  |  2 +
 sound/soc/sdca/sdca_interrupts.c | 94 ++++++++++++--------------------
 2 files changed, 37 insertions(+), 59 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index a515cc3df0971..20ff5eac34eaa 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -30,6 +30,7 @@ struct sdca_function_data;
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
+ * @handler: Handler function to be called for the IRQ.
  * @priv: Pointer to private data for use by the handler.
  * @irq: IRQ number allocated to this interrupt, also used internally to track
  * the IRQ being assigned.
@@ -44,6 +45,7 @@ struct sdca_interrupt {
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
 	struct sdca_control *control;
+	irq_handler_t handler;
 
 	void *priv;
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 4539a52a8e32b..9a44e0abb1cb8 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -448,21 +448,34 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 			else if (!interrupt)
 				continue;
 
+			ret = sdca_irq_data_populate(dev, regmap, NULL, function,
+						     entity, control, interrupt);
+			if (ret)
+				return ret;
+
+			interrupt->handler = base_handler;
+
 			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
-				ret = sdca_irq_data_populate(dev, regmap, NULL,
-							     function, entity,
-							     control, interrupt);
+			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
+				interrupt->handler = function_status_handler;
+				break;
+			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+				ret = sdca_jack_alloc_state(interrupt);
 				if (ret)
 					return ret;
 
+				interrupt->handler = detected_mode_handler;
+				break;
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
 				ret = sdca_fdl_alloc_state(interrupt);
 				if (ret)
 					return ret;
 
+				interrupt->handler = fdl_owner_handler;
+
 				ret = sdca_irq_request_locked(dev, info, irq,
 							      interrupt->name,
-							      fdl_owner_handler,
+							      interrupt->handler,
 							      interrupt);
 				if (ret) {
 					dev_err(dev, "failed to request irq %s: %d\n",
@@ -470,6 +483,9 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 					return ret;
 				}
 				break;
+			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				interrupt->handler = hid_handler;
+				break;
 			default:
 				break;
 			}
@@ -495,66 +511,26 @@ int sdca_irq_populate(struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info)
 {
 	struct device *dev = component->dev;
-	int i, j;
+	int i, ret;
 
 	guard(mutex)(&info->irq_lock);
 
-	for (i = 0; i < function->num_entities; i++) {
-		struct sdca_entity *entity = &function->entities[i];
-
-		for (j = 0; j < entity->num_controls; j++) {
-			struct sdca_control *control = &entity->controls[j];
-			int irq = control->interrupt_position;
-			struct sdca_interrupt *interrupt;
-			irq_handler_t handler;
-			int ret;
-
-			interrupt = get_interrupt_data(dev, irq, info);
-			if (IS_ERR(interrupt))
-				return PTR_ERR(interrupt);
-			else if (!interrupt)
-				continue;
-
-			ret = sdca_irq_data_populate(dev, NULL, component,
-						     function, entity, control,
-						     interrupt);
-			if (ret)
-				return ret;
-
-			handler = base_handler;
-
-			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
-				handler = function_status_handler;
-				break;
-			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
-				ret = sdca_jack_alloc_state(interrupt);
-				if (ret)
-					return ret;
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		struct sdca_interrupt *interrupt = &info->irqs[i];
+		int irq;
 
-				handler = detected_mode_handler;
-				break;
-			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
-				ret = sdca_fdl_alloc_state(interrupt);
-				if (ret)
-					return ret;
+		if (interrupt->function != function || interrupt->irq)
+			continue;
 
-				handler = fdl_owner_handler;
-				break;
-			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
-				handler = hid_handler;
-				break;
-			default:
-				break;
-			}
+		interrupt->component = component;
 
-			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
-						      handler, interrupt);
-			if (ret) {
-				dev_err(dev, "failed to request irq %s: %d\n",
-					interrupt->name, ret);
-				return ret;
-			}
+		irq = interrupt->control->interrupt_position;
+		ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
+					      interrupt->handler, interrupt);
+		if (ret) {
+			dev_err(dev, "failed to request irq %s: %d\n",
+				interrupt->name, ret);
+			return ret;
 		}
 	}
 
-- 
2.47.3

