Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBAE3E51D3;
	Tue, 21 Jul 2026 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644642; cv=fail; b=YsAJY4Uc4S5LxC25ZYpv73ho7rV48nnTupvXXlN4RRPQ+aPALMO23o+ifF7aUzwNVrZWsMrIKCE4u1uWiLkcazljvgIQkiFK0mL9x/hkFDbogRKruIr3yDhGLT0ZZH2bAyYAUsXfFqozqmnkBGh7PsvDS1GGxrqbHwGH62Uxgyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644642; c=relaxed/simple;
	bh=YeXBt0ZiS6G4r1845dRQdtspRBx3lc3q7L3qMRGS5zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tem2p2YrQ7B5/Wed30QPyMKmk5NoCDXf9vH3EDEIGB8kQ7bV/PAw2DGmEAAz/ylM5gYHjxh59DlvY1aHfSX3g9S2DoWi9mOF7bstLVB+Bq/vKkDJ+tfSYxWZkRl2GEq8E75dNHZxmfIHNlUazKFEASeMNRiQVeqEyYmcVXOy26s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GhWkJ4+R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HTXJGtAp; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GhWkJ4+R";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HTXJGtAp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEb6xx668630;
	Tue, 21 Jul 2026 09:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TGabG5n4BFQzSFv7nAT4MS8uuZgr4bOcZJnKyZRHhOk=; b=
	GhWkJ4+ROtM4IXO1eDJIdSy86/WiJIC7q3a4Thv9RdZqCJQY0ivJ6ZwvIJFU2r7L
	mc88fwr3yQrTiEIxCmlAPlBksTzeABNDfffy//lDsrLzAjK+Gd4BPd9TRPbM3vKc
	HMpJJyDqeQS0XQiF6CkPZAQMFT/WFO3dzDyXa36Vj+slh/0Dco+BfWh3cHQgDIDd
	i7HW7bbgifDcSrXoG2Iv0Dkiu8AltiGUPXwD3o/vQcTO8Z3MX+nRnhUeYrTZXdKk
	wueft0Wj8p6kraKp6GjiglA7voyuC6F9t+dbcN5b1Db6L8bY6l7dxcSW+NdbDDY+
	xOZ6IxkT9Mpfto5JKg2T/g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022080.outbound.protection.outlook.com [52.101.53.80])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfc7ca-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 09:37:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqAN1JnjVihoHwmx4F8s9dSgbAe5iq/XOrrfEf7CmhXt8qmc4UqhAm9IrM8Idqne0bTXdONy3kMuf5yadQpEoPTRdh218mfBRbz1Td9E0BKvJqlhX3cp6tn2k6zKx3X0EF/mR2CaqtmqkBDEjm3xZNFadhFF9U1udeFcRlxbbEryH+VTDzQ3IQmdb0N+oYAISQxrg3gY/7HX3mPO00YVHlS2VxUthnW419/maIEXx5Lw+1ms8kUKKaNvvg8aS0jByczAKEOlFvLc90ri6FXDBd4keKB2CeQjS9jloRN+vlg+Q4aqa1x2O8NVms1ehcG2AojqJiz/yCOEhdaQb+z9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGabG5n4BFQzSFv7nAT4MS8uuZgr4bOcZJnKyZRHhOk=;
 b=AqFawUTzW51tDCpFlSYZ8k6sg14q4U+i1w4ofdOcVLW1xS7ramhyeMU+JLU3iMc4eqD0sfI0kN1st4qSTq6ehA8ScTGrkaoXEsX+KABlCm5A2G/CipMTTv7yE+H/4qew8HPjc2ngAyXNWgSdFMDKbdblAY7hSFpapm88auz7c+xdKZzUUFdKvxnwR9mkRmrisuTv+WvHRQjn8NFkEnByveyWMIPHo+dGgUvfiIRpctwwc1dCr0PbsPYnh6edCCrj56yKO/0bkHu1wgDrkIayiNTJeqo6jGHkwwEgFYy7oYG/uSQTWZBNp9r77Ev9Kl0Zr1xeMEPabSsjYbJIzzKS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGabG5n4BFQzSFv7nAT4MS8uuZgr4bOcZJnKyZRHhOk=;
 b=HTXJGtApobmguib39jVxlQIIpmynV/UHu2SKkw8qzGIb2EuJpfLd4O7yg4tTo/vgNZrTk9MCLOt6Xa1BZhCfGssRngZg+xkGzYD4YUAnchBexd3HQPoD9Nhl8r8/T/0cXz2oSMdRPSrzUZ2MyafmTs+Eoy4A/V30MGSpjL2QgOw=
Received: from BN0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:e7::35)
 by CO1PR19MB5030.namprd19.prod.outlook.com (2603:10b6:303:d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:36:41 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::56) by BN0PR03CA0060.outlook.office365.com
 (2603:10b6:408:e7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 14:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 14:36:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D959A406542;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AF756822549;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 1/7] ASoC: SDCA: Rename sdca_irq_allocate() to include devm
Date: Tue, 21 Jul 2026 15:36:30 +0100
Message-ID: <20260721143636.361814-2-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|CO1PR19MB5030:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6a4984fe-2ff8-4279-cb04-08dee7357a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|61400799027|376014|56012099006|11063799006|10067099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d5w60LEySYULf5dorTjopb+R8HNx/gfm+0LuUFB9YoX1P7RnUNIbkUCJjcITCdzWpmkl7Z/cGXgQSk4cxWGvxy7QxF5ng8yWLitATA5hwZUNU5seOqc024b2NnjO99lv21p17o+7HPeudRiuR3VN7JwE9kHhLmZysSmf9tR5S1KtDuo/W8mfon2bNT4sI4XoWc66S3n570RztlaT4cMAx3ZN3GU/EcEzQ1AbRCBgpl2vah3NTpuoNXKXJN4Im/YgDuCZgOVrmoKNAFwQgUwZRxc80LbWrzAl60ZjBr+ml9KD8UwYX5VwK2eNi41wG8OPgfQph+OZyk8E76I4Z3NC5LlQjA8n0f8IaSWBFt457Em7Gr3hBE+KoBugMl3iCYx2MoeLxikR+kxu3MbtYhjjOY0uf6Nzm6cTamABRb3gRn1iclIlmXICLWMJgjG0tCF2FSPx2ZWkWz9gClpziCd+nTmDqXg3iafwOzqLnjByfvAy8sEr8GFPJmU+DRkuP9PBAAPToObo3qeUDDRPbdKDHoInbnfce2dqPJIov/sx2BzR5jUCmvy7jQPUXQeM8ygUZLYICVsyC6E5en3N3mC+GVLJkMtGiuI7n8vm0VzX+Uzq1ZPDu/+zHg88E3RRcPhvUBXooxraM4u9s8dQytGUU6qoFH14FQWzadOW7P+O7LxJU2yDZHeXSiHkf19iAFC3942/KLDHRHIQ6c7yVvFXVg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(61400799027)(376014)(56012099006)(11063799006)(10067099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GsuouC5RQu1MfCMX8gl2Pyyga8shMfaP1KC8AekDIVM9XSbuHEDp7BidfSWKnASW1R51xCKTWRB4N3A4h6xjOyk5pSDnS1ywedhzMsacEIVTV8jOtubUdr1wNeML6KLkaLGPAdfv5adXJWVvoDrW1gs9NrYEladjp/FeUMrXWwSX9wlWhVaZzBgE76p/hAbYAsYHaYJBoJ5kvfJOOZJ4Cyo4YymYAB4tES7a8HZbbPV+G8YX9dvPtzzE/9wKKc5Q++7ZLTqLdZ0zjdY7Fx2qBn62RjmAb9qIGT9VsQT5fmiHJPVVFa7Bs7v2HakDN9W1PeWBgqM4Bg/JFzkHUZh58luAHhiLCHHb5PwJd91659eSC+WVRAdFxztX7BWV8lHkL4bcY24R1k1erMLDCHaehdaoDgXg+h/fe5P7p5kigJjGX0D6Q5zJZ9/vH0XKarV/
X-Exchange-RoutingPolicyChecked:
	GhPX5xJ2gZQmioDQd3ylc+YVmpjvvfYkQQSgIcqZ9eLQMam4KyDF9v1n0F/tO59aSA13G4Ub3uqQCTG7yDlBubbssVJ+RVJZBB4ACgE8kycE1bgWEg1/gzfD5Zvzik3H8Dtr1bnzRYzhJbfbgf5urx47LVmu9xRgwNnQmhuHVKwqckdwIayPVqJiRKMZKMX20yBL6r6bqBYDP4ERcoSy1hbPrnlSOgg8Fxm7OdMRyYCBf6TAgKwK5t20czVwPNo2IoOf76ifsiOwToXLOBog0tE9jkKaWZkJ4NCXvIQdz6dltqjCdjidherBwJ0NZqRdgXrLMufghqYJp6P8wKQ3zw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:36:40.7511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4984fe-2ff8-4279-cb04-08dee7357a9d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5030
X-Proofpoint-ORIG-GUID: Gp5kanYpPKtJhOcbi_-Epuoy2KXx8Uzs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NCBTYWx0ZWRfXy1HXz025gxFH
 7pyAoIYpLRdsa+1EnEWiGLYOWucRfbSaJdvqNIvtMqgJikM4lTuu9WqJvvq4UPWsO6kCcE/BvNl
 BLn9Yo9B7SuFF4VBqgvx8N1/KQTTtLQ=
X-Proofpoint-GUID: Gp5kanYpPKtJhOcbi_-Epuoy2KXx8Uzs
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5f8417 cx=c_pps
 a=kZfhTMRA2IuZrtsc375NMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=2FUqhSEOnl-TlfCfRYUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NCBTYWx0ZWRfXzjbHE1MiHGPJ
 uYeg+b1FLRbtMvtYM9wcR4zF1nDcepVe35BZyVK1xfwDHsCa9SHgQJFx/UcXlVOtEj4mohTo8Ed
 GL8umEJANcWrqTw9TSVc5/L5mfzJpgy/gOkkKD0h2tt23Rd37im6KDuBedtog8/lFBNfjhe0UpB
 ZnSksYsu3moSgj8iIA0RflM6J59PYOQ6YUpoYuCNhEQdqmTDheasM1J+3MTV2uKhbILSVqdWva7
 qQMYSFfSR9Fi3Zq8Ppny5jVeZf70B1sP8ol7GwyqV8xUkDH2cSKDD+NPtmkA6sn8Xp9blfasITk
 1OwDBidVGXhvVLAPi815KrjXMMAZ19b22YP+rgcr5FNwvd6WPeR08emBJUi3nSzqfUlHpHw7wdD
 1AQlp2wmGc3HjRorD5rarw7SGOb0T0h++tHplSzNzMqsspbzWgmEnAitS+t4dEV4w3zSoisa1Jf
 MBb76M/UALBB9ef5UGg==
X-Proofpoint-Spam-Reason: safe

Make it more clear sdca_irq_allocate() uses devm allocations by adding
it into the name.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v3.

 include/sound/sdca_interrupts.h  | 5 +++--
 sound/soc/sdca/sdca_class.c      | 4 ++--
 sound/soc/sdca/sdca_interrupts.c | 8 ++++----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index a515cc3df0971..28fd44eb93343 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -86,8 +86,9 @@ int sdca_irq_populate(struct sdca_function_data *function,
 void sdca_irq_cleanup(struct device *dev,
 		      struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info);
-struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
-					      struct regmap *regmap, int irq);
+
+struct sdca_interrupt_info *devm_sdca_irq_allocate(struct device *dev,
+						   struct regmap *regmap, int irq);
 
 void sdca_irq_enable_early(struct sdca_function_data *function,
 			   struct sdca_interrupt_info *info);
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 8d7b007a068fd..d7444f442c71c 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -111,8 +111,8 @@ static void class_boot_work(struct work_struct *work)
 
 	regcache_cache_only(drv->dev_regmap, false);
 
-	drv->irq_info = sdca_irq_allocate(drv->dev, drv->dev_regmap,
-					  drv->sdw->irq);
+	drv->irq_info = devm_sdca_irq_allocate(drv->dev, drv->dev_regmap,
+					       drv->sdw->irq);
 	if (IS_ERR(drv->irq_info))
 		goto err;
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 4539a52a8e32b..1e4efc0609d93 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -592,7 +592,7 @@ void sdca_irq_cleanup(struct device *dev,
 EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup, "SND_SOC_SDCA");
 
 /**
- * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
+ * devm_sdca_irq_allocate - allocate an SDCA interrupt structure for a device
  * @sdev: Device pointer against which things should be allocated.
  * @regmap: regmap to be used for accessing the SDCA IRQ registers.
  * @irq: The interrupt number.
@@ -604,8 +604,8 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup, "SND_SOC_SDCA");
  * Return: A pointer to the allocated sdca_interrupt_info struct, or an
  * error code.
  */
-struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
-					      struct regmap *regmap, int irq)
+struct sdca_interrupt_info *devm_sdca_irq_allocate(struct device *sdev,
+						   struct regmap *regmap, int irq)
 {
 	struct sdca_interrupt_info *info;
 	int ret, i;
@@ -634,7 +634,7 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 
 	return info;
 }
-EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
+EXPORT_SYMBOL_NS_GPL(devm_sdca_irq_allocate, "SND_SOC_SDCA");
 
 static void irq_enable_flags(struct sdca_function_data *function,
 			     struct sdca_interrupt_info *info, bool early)
-- 
2.47.3

