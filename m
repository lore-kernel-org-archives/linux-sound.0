Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894182D5436;
	Tue, 21 Jul 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644629; cv=fail; b=KeVnPDsqVBrvZkJzMcp9v7jP2ya/sf6S/n3X4LzHmf+SfC7JgOqi2WzUVBhb1TzFJPhwBcXyexMFyVw/qpHjmcuAySV3wd0mQrfd5+n0BUOVqxW8LWFq6yWALe8eVoTo4sxlzHQRP/0P3NlAg7VBTJOGdT5NjvH53Up+ldCadok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644629; c=relaxed/simple;
	bh=9zcpUT7eA6ON9TXtXO2UaBWU7HB8DkY7VwGnmsha1a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A69srgjyKxnFEBT3gIFBKT09FKBxsr+5krVUw2946pTxyP/mZ8VgiYjuHll/Gap+YayaBv8rmU1XsKoOBLEcDShZkPV7jw9lCTLSGOm98YvzpvRbV6L4sc6Z0z2odYFxNOMZeSLdLU1Kx1bpqe3HSDHBDcX6kISbIk9oyEdwh+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IhTZuTCk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Wrfc5u3y; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IhTZuTCk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Wrfc5u3y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L5J3dE1828547;
	Tue, 21 Jul 2026 09:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=URS9cDHxbGpO0+JwZ9wJr3El3ku8J+tz2OdUGKrq86s=; b=
	IhTZuTCkxFd4BTlfU0LaRThZEkg+WkrYSJ//PRCest1KSCa3mXWVdK/yzDFdFxKO
	HMZzsVMK0DaLpgYufr1r2QjNsD218Ov2g6pJKEJ0DxoahQXjZ11VUg94NKNK+emS
	WrWKGhDWnzSGPm8pRsrUiPMCSMga9QKlQtCqqDw/Mze2kyTe845YTRR5Hv4tkE+G
	yahNE3DHlmsWstwKkYLWQA7TzE+DQ8AKnkTUjRT4xr3Z+8stdaJ6pKiKXr9IW/RY
	uM4JdtEPidbrXQbecsAEYjMAIMOo50rpCjwJthJeV8n0uOcbH+P6n+7CvBQQQ0sX
	AYCQTTf1yUPMJnHkkILU4Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022112.outbound.protection.outlook.com [52.101.53.112])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vym7n4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 09:36:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChUFlFJe5S2RgHZY542TgXeBiDEXrxlISkw9tVVXA66vsQt22OLvsgJWg8zIoxtXsDsNA+mdDA9KzwMQLDhVoNqyIMZyp70wbrdYVh1trDFT82hRL+pDFgdJeX2yyYMqMMK18qPcCOlf6THVJp6vr8UctmhZxZ1HbXSer8Yil8hysLC2MqWCl6HWZ6n5ACf31LAdSM42RKeBx0Q7kiOJn8Rr/v2vFKLUk+pfgQUHFdLWJUrOUMJHDPPDT5E9ravMF2ZTFEpiFwjQyOT7kUtP7XU4dTGmrAs/sALPh1FC34maN2CYEdTwfvBJy42HDq6LO+H3JGB3Afhzo3UDsKPrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URS9cDHxbGpO0+JwZ9wJr3El3ku8J+tz2OdUGKrq86s=;
 b=DNIcymv3LKwiwswTwgzo1787w/3e4ASUIRL6DSTcnEZhmXrGT06fCnD6yLJtDNyLxwRBz6KX9xyKhFphky4JHCvXaAY7NvrDQrNRd936nfBdz5ChqoSq3mr7ksEcHhRRO47pZku2IaH+c/rCuj8p9H/20ofi2gf0mXI7uph9Ilf5s+paK4wV3epzldV2D8Z24wbc4jqwyMZdW0dyfjoBTI4m2OhLYmReZxVMtMHsbvZxzUhpoAxzdTor01Iy11NNgF19yJMFSSWGCnBZe92RzU2m2WIjQXR2hMF5Dwm9TVeuG5KZM3IKCuh9vdNTE58b+XrosV0ajOpQDWEt7+40tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URS9cDHxbGpO0+JwZ9wJr3El3ku8J+tz2OdUGKrq86s=;
 b=Wrfc5u3yM643lYJ1fyDs7kMoXSQBmcfpgd/keoOAis2VOz+2fYCPrcMLzHFQdid+qRuNAfcpEa34SPEJ7g7y0DQLT35qo3G+kJSP1iMlxJhc9oDF9/rFpYaI5LTX81jwAn0LBn4//Dhz0cOZn17ARudpRjFEjj80/aq4gtQGTIM=
Received: from CH2PR10CA0024.namprd10.prod.outlook.com (2603:10b6:610:4c::34)
 by PH8PR19MB6619.namprd19.prod.outlook.com (2603:10b6:510:1ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 14:36:44 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::5a) by CH2PR10CA0024.outlook.office365.com
 (2603:10b6:610:4c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 14:36:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 14:36:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E203D40654A;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B866E822550;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 4/7] ASoC: SDCA: Populate IRQ data earlier
Date: Tue, 21 Jul 2026 15:36:33 +0100
Message-ID: <20260721143636.361814-5-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|PH8PR19MB6619:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9665a9c9-e595-453f-e4d2-08dee7357c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|23010399003|376014|36860700016|10067099003|56012099006|11063799006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	iZ6d/1tUylk4G4K3IgtkLh6idT3YCAw8vrm7n4jwhDpBB86WHnHcgSDFLkF7OaCmhYd1GkHqkokNB5fUYbSr0GR06mXQTi+53JXTmy+B+72pryFBt8jp2JpHFwhrfXcDZakxs2kgEToSIOMloCOBI5spt7m1Gybg+UTCqDBa45u7+R/uUycBFV5ax62jHxZDA2Au0xum19VqkfDzsQNz9Glo1ZZ+MfoSNxN6ArhnXogryPmQqZ7x/Ee1R/f3PnfzPHccq+s8rpXAB+k2nhAioPKenARu3RzE64Ax5J9C8fVtfK6IX+Zxg0rrERUvp2rURs5mi0tXppEDaiP2XfjH+iThLW+kz7w9Oy67++dJp8tZiTbcDb6fg8n3JZJYB8GUJdZ/hYnqpm5nMVymnHuvq4XG8H8NYm8eQlwM//afrG9eO+/yyPXli6+JA1N14p/khMypqKfjMTOicuxUwwO632tpJNr5FWCWdMkXWfQTSSqgpDJqlj+p7YLpalXu5VC6nAvbdjqK+5HSTqjxEaCxOCzIcegIl7LUwov2jF48I0Lv0N7++COFNP101AQiooiqO2a6tM+izCi+gDo5RCzunOffguTL9lwTdY7y7E2zIqA3mab7Eopdw+qit4usJze9skVFq7r4C0Le9plHNht/XE+dIuAgsqUdFWUFWqjM0sDLYMaw8WVsl41LbddGQHr8m4gxmn4ZDaPSiTgAhW9/6g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(23010399003)(376014)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oPEzmK7y2Ewhg/WKal7RBf4EHxzHvJI2tQ1A3SBoXG8UBgd5u9OQgRcyIBpvzjB0u52oT1Em87jtROih5pGDHHIswcxcZn1YMLk5hLQ+e5y+jXHwpVa/qLzyKkw+/OpOWg0UTn9abww3hD0Nd0zah8bldG301RPZoLnl+48tz4uVaBN7zX6kfifz+G0BRPrJjhYrYjap8/nUV7pohqNbMy2kO5R5FnsmaDBnsMJ4BA1vG4C+87KlhclqX5bZr1tyjBYHQaA163IUDGhcwhPmH1CLcvAjDjmTccSNAY017vqM8Ozjc3iq11o0go54lGmB43WEuyFe6kLMMapwXFnIccH2f1H2pDyi+SSEC4Iybp6o9+/tGkxMnCm3wY1fFRUKvF/UeKNpeasf8z6TTT/6qDw2litF+Ol3jb3GbN+DK3z/kBqw8wx/75eQLsCIMP5S
X-Exchange-RoutingPolicyChecked:
	b4qnkWXu9wL+AYtYkz1Cc/0MwaIyzs/5oxuPv41VcdZUI3upf70ServWXNqppJFVpNRdmvYXQISAjrZl5kgaGn2EtBLKqZ1ZnzpX0Msccqgt5nacU+x09kQhHKI0AK7NbLMiGrPnabNlZTK9qcskm/azMxgx0/VZvNEM7DIp3GLkm10FbKltpxtVJtMoyjwRMSGgEco+I/hCTd4NoI0bChcFeWbwCuSbXVHmQRnWDgn0Um99LpRpfeulbyk6arIa1Sno8QIZ3raARNLXXJD4Dz3rpuu3DKdrkhtZF8Gqvv7SKFb6iRcUCcGoiRUuxQ07NhHcx99qh15GlCkGy8y1JA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:36:43.3743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9665a9c9-e595-453f-e4d2-08dee7357c37
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6619
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX84HgMl6PqDGB
 tWI8GE6/mX1CBJ02mNO3KtNYG7GYwj+4Y+FJzX39reE/lhcSGODEbezmIglIUkALdPBQpXYHWNT
 PXJTPNsNv3pZMM5pR/lZ2wZHdSGavgg=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a5f8402 cx=c_pps
 a=2hvfkwp4b152R1AolHnjyQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=HXU3PlZKHoDzXa_cyEQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX5MG79E/H01iW
 bKmuHuc1Ws3lImphrqFhcsm9H5xX+42WDU53TPzPUxQ6Z/8lsYxn7kvfwqhNMqh/aM5Q6Etuy4X
 1V3B8MUJ9hr9B6lfllmseqfJRBwzNJ49Oo+YpiqtaasUoFMI+GTLq97+8RSN0tGhc5Mpu9CuidV
 JuxZjbjY3TKE1w1Wacc9UftjEtecd4E5PSuleWgjYaGPAx3Co/ccyvcoUfMdpLfdRvpTUi7aVPQ
 c8KmADUVAnLFdjunj7BHRkxD3eaB9ps+1H5t2DTnYaLbINY1zcKLPeIrsVrsfGprqvjDDaYX9Jz
 IRLlKogJUnfF0J+a3A7pPZQLKx52jFh6zGr4GaIKlmC/x/ahKq+h85kP9VvSHYknDoehZ7nfP69
 JV1FvI9bmghYtiWahYvpUh58LOtQJq+LJjpwNnwqqiZ8f2lJyVMz9wgke8AY/EgGwNCT1dZbO9J
 1vAYfU+e29FTJjIvMOg==
X-Proofpoint-ORIG-GUID: cwOlGIzGV1-ydIAx4jGNNdzYR3EYciez
X-Proofpoint-GUID: cwOlGIzGV1-ydIAx4jGNNdzYR3EYciez
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

Changes since v3:
 - Updated some bits of kernel doc
 - Moved before fixup_controls in the chain

 include/sound/sdca_interrupts.h  |   2 +
 sound/soc/sdca/sdca_interrupts.c | 115 ++++++++++++-------------------
 2 files changed, 47 insertions(+), 70 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 8a44c19e917ce..3b30146e21db5 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -30,6 +30,7 @@ struct sdca_function_data;
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
+ * @handler: Handler function to be called for the IRQ.
  * @priv: Pointer to private data for use by the handler.
  * @free_priv: Pointer to a function that can be used to free the priv data.
  * @irq: IRQ number allocated to this interrupt, also used internally to track
@@ -46,6 +47,7 @@ struct sdca_interrupt {
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
 	struct sdca_control *control;
+	irq_handler_t handler;
 
 	void *priv;
 	void (*free_priv)(struct sdca_interrupt *interrupt);
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index cd2c5d49bb95b..6f0d8c0fe622d 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -421,7 +421,8 @@ static struct sdca_interrupt *get_interrupt_data(struct device *dev, int irq,
  *
  * This is intended to be used as part of the Function boot process. It
  * can be called before the soundcard is registered (ie. doesn't depend
- * on component) and will register the FDL interrupts.
+ * on component) and will populate all the required IRQ data, as well as
+ * registering the FDL interrupts to start booting the device.
  *
  * Return: Zero on success, and a negative error code on failure.
  */
@@ -448,24 +449,36 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 			else if (!interrupt)
 				continue;
 
+			ret = sdca_irq_data_populate(dev, regmap, NULL, function,
+						     entity, control, interrupt);
+			if (ret)
+				return ret;
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
+				interrupt->handler = detected_mode_handler;
+				interrupt->free_priv = sdca_jack_free_state;
+
+				ret = sdca_jack_alloc_state(interrupt);
 				if (ret)
 					return ret;
-
-				interrupt->early_request = true;
+				break;
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+				interrupt->handler = fdl_owner_handler;
 				interrupt->free_priv = sdca_fdl_free_state;
 
 				ret = sdca_fdl_alloc_state(interrupt);
 				if (ret)
 					return ret;
 
+				interrupt->early_request = true;
+
 				ret = sdca_irq_request_locked(dev, info, irq,
 							      interrupt->name,
-							      fdl_owner_handler,
+							      interrupt->handler,
 							      interrupt);
 				if (ret) {
 					dev_err(dev, "failed to request irq %s: %d\n",
@@ -473,7 +486,11 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 					return ret;
 				}
 				break;
+			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				interrupt->handler = hid_handler;
+				break;
 			default:
+				interrupt->handler = base_handler;
 				break;
 			}
 		}
@@ -498,70 +515,26 @@ int sdca_irq_populate(struct sdca_function_data *function,
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
-				interrupt->free_priv = sdca_jack_free_state;
-
-				ret = sdca_jack_alloc_state(interrupt);
-				if (ret)
-					return ret;
-
-				handler = detected_mode_handler;
-				break;
-			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
-				interrupt->free_priv = sdca_fdl_free_state;
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		struct sdca_interrupt *interrupt = &info->irqs[i];
+		int irq;
 
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
 
@@ -581,13 +554,15 @@ static void sdca_irq_cleanup_flags(struct device *dev,
 	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
 		struct sdca_interrupt *interrupt = &info->irqs[i];
 
-		if (interrupt->function != function || !interrupt->irq)
+		if (interrupt->function != function ||
+		    (interrupt->early_request && !late_cleanup))
 			continue;
 
-		if (interrupt->early_request && !late_cleanup)
-			continue;
+		if (interrupt->irq)
+			sdca_irq_free_locked(dev, info, i, interrupt->name, interrupt);
 
-		sdca_irq_free_locked(dev, info, i, interrupt->name, interrupt);
+		if (!late_cleanup)
+			continue;
 
 		if (interrupt->free_priv)
 			interrupt->free_priv(interrupt);
-- 
2.47.3

