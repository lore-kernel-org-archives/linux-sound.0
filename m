Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A80A3B6342
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418161; cv=fail; b=QE9JaHOECDXJ8vj0ablq7T1RWrXVQZz9ITYML3AUT3Z//x0DYxFKrRWkqb/GmnJXMOOrJ99W6srtLUetQ03qQI8V1nAHmIpvS9QXbnz8UjCmrfXOOIJipvW8r+R628zkrqsiJuhGEyaBXOab7s9egt5MXut56uUjzobeNaeBSao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418161; c=relaxed/simple;
	bh=1YHc3gUlvw7HzPOgyflh0nL0dTSMterhLzXC8FVGd20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqxSQTl7ES2tClglN18dZVfowDzz2CMDVWVEBk3BtrMQANkpvAlksHurbHn5/R8EJp83fMi12IL8O8E6qeUu3X9SGvHzsVq5zv6dZPmB0RHnV0FRrkByKG38F9229jusKXwkLNFvDp76B0GIh3ppjUeBwiRzc2eQVWl+dz43Z98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Dj1sLrMz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YYoZJWgq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Dj1sLrMz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YYoZJWgq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D58Ijh3937594;
	Fri, 13 Mar 2026 11:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jeY728vilogF3qYklFHdeNZuY2XkXAyhdkBIbtOxki8=; b=
	Dj1sLrMze9vMAukxRTn5z0CrIZyq6tOYOhZ65yN5j+O/WueQ1UzrSALqyiMBt86U
	Yt8KRCjER6qx3KCo79J7j/d/gW+WwY+oVj2t/CJlIGrwaM3BnlAsaIB/lKnW3NOb
	gCU9JKjL39vtVeTfBVEb6NDqGlJSGziwogqrUGgddri5DbMwcwWhZ5gOldDS3fy8
	3sjLPtEMKvrJkGihn+FoPu5hv12yLLnR4JuoSbnq8VqDr6Y1Ph/XJnU1AQWIIPjL
	cQi64QUFrur6uHBtkdeBU903fcXRPbRCJIvcjGY6oUQGU0DbqNxa0hcGtuARZkQl
	HToCelJl/eKXqWEv+qrlJQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020136.outbound.protection.outlook.com [40.93.198.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cuh7gjj3p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 11:09:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAuSiMtM7iAeBb24bcB7I4huHITFc1yOko710OzrNSRdxMg0c1dytpo/Cvpj/QQtJMsmvEvg7pM1j8orMKW4b84gKTCg5vAZgLLeNQ+H2G2wFvrGXJVT9fqit/lJG56tqqkwTuhZeqe5kaM84odpYMSgRNkMcXvcibWTgBP3QYiD+pLNMMPhs2G5oBSXeKVm6K+WOW3HhcPLu+0u9bvUd6v0PcQbJX3ZfrJ4mBS/1fqvTJy1q/eH7QLygs/qZLNxiPYSKTXr2RjvD/IWf+1ekQsL87eaYv+lVOuZRqq2NAtS3Fh7/LU61JyFX6hqvp+DtQ2XkNVy17nO0m9EQU4lkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeY728vilogF3qYklFHdeNZuY2XkXAyhdkBIbtOxki8=;
 b=xI7iTZLYCt57du6NbpsdCUqbaA4jf9veGgo6cDzCck19j+dgnIgb4j7Pkf9toUz2aLa4g/8cZSRePxeB4WjuK7dxEMQ3ewZruXGz4LStfihNDrJnsMngKmKMwN+c13JLXmRasHbyUsgCoUvP8rlz7GIJ4fsswcF8Fkbrs7SE4NA9GrZwOxyAvMIzNT0/p/E7aQqeZYV7dIIaUZ2jgXmHDymYvj4wfNwY/zzkawFt8GM2K57H/bg7svr4LB6Ph1hsrJwais6osRgLIVdSrWLp8Pg8+fM7r8ziB8UG5RbB2CeFQ7rTEpY8/halKKYEB6EBDTW1ngzwJpmvYVRt9LqS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeY728vilogF3qYklFHdeNZuY2XkXAyhdkBIbtOxki8=;
 b=YYoZJWgqc887cnTSDL1MoKyK1XcsXQ7RVqAAZadyPeRxPoRSNfFgrk4G30TmdaOfoDetiDL77/WTZ47r4fxATpRuPXJQ9NlNRH8jFbxQoxW7mDeSYvp1Ex1LySrAllL2xy0Taw3LNTGToz+b+k+G6OXIaPZk2nIe5IMTRI4SKZs=
Received: from SJ0PR05CA0142.namprd05.prod.outlook.com (2603:10b6:a03:33d::27)
 by SA0PR19MB4207.namprd19.prod.outlook.com (2603:10b6:806:82::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Fri, 13 Mar
 2026 16:09:04 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::b3) by SJ0PR05CA0142.outlook.office365.com
 (2603:10b6:a03:33d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.22 via Frontend Transport; Fri,
 13 Mar 2026 16:09:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 16:09:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3854A40654E;
	Fri, 13 Mar 2026 16:09:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 26D2A820257;
	Fri, 13 Mar 2026 16:09:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: SDCA: Add support for the Cirrus Logic cs42l49
Date: Fri, 13 Mar 2026 16:08:57 +0000
Message-ID: <20260313160858.2022849-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
References: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|SA0PR19MB4207:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2bcf283-2c13-4bfc-5031-08de811ad8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|16102099003|54012099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xqx0yy9GOEfmxXrVZQvoxmuvUqgKQGW+JWkPjyN6VScqkn7slOPf/lAdooYl6Yq9M8AFqDomOqbvGtgTvquSVBKslKsvxEtOA4wNDvad3FCKe3Zjs4VEvmSHHxumT6Fn7FwVrHUJk51ECwRGbj/bzOYg6iKUkLEeIgWkQhZKtQ5KhcB5toX0jk+d5aOIZWS8FXzapX7iV3EmisuYsFdLF7S7lzURZiFWNEiCf0Tb3h9JEnZsAeyLS0tC9eLoGQXtkcQ20fAOHILuG+lw2TJAZoqa8mfA6tyAk/M9fjkLw5GTbl6mz3N6XgMJiPVkYNov+oxqAlmIBt3ew0rUcOrROncnDfUq9fO20eTcusfqtUdlAvh+i3BVTJ/cT9BxmoDofLYnt5NuOsqG7gX79O5KZZltv5nNL9f0hx94yOReUiubfILuByiW9ZapIx7RW29M6eEI09ykWHpBpSUBZcxr3oSXCD9o0Xy90+PIJui/sn+hb22LjSKeARoStwhp1qMyGT4Qc3UfnGEXCjeqeav73ueJESLz5Q6TMuY1A/E3yuGvo/EYkdWaMmTO0HzsxvXPjhunLMLtYmvzXlGCAPsKVW2sAQBgBeNxnp4xpWrd0ZFZ9TJ00rTzIQpvygdhTxA4X5Rk5IDzO75dqAI7OTNJhlCl7ssYBS/RE5IpANebC6v8Z3jTw5AWI8zUWccjLuMeXL4kCdP6iyJ9B/Nf+fmfNbah+5bQxFFjf9HbmfLltf5fYCRVcTcOXWbqGFoW79/FxNELcI7FDmf0UYWx2alspA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(16102099003)(54012099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9mAi/jOnQmksW+1NRswu2vQ8o+KZJzP7VgV2H0PX/vPNf49+0dN3ko4yHq2jNkMkvDo0o5YanotRj+RmjZ8hhf0ueMtw3S9ZteCxBktazfRXMy3pVoycfWmQHMkgveIaQ1ynGqR9qlXYwMqcy1rO/xiNWIna/Nwl3OWhrEXcZXFpyvAnFdYEMTYX91KhdVeqL7L6mIdFBLFXIRfF/6HzKtltQ6CrFAYjW+2Nh0omPCxqlZO+mzXT5NE0vjIM23Iv79XdSJ7L8JeY3RApbg4NciNy+KNKmyRGvRnIGAc969PmQguEwMZQVL2gRf5LGsxNi1LNYEclGUukLtfTqxkZ8qr/83OKUGIjos4vLP+SS47e0+hb7atd+JB5kE0KY8O0MReo/MQ6z8t/Lw2JsViYlm2rxPWfrFIYvKMoeKGe07rPLnHBJmtpE3iN7UgkIAlj
X-Exchange-RoutingPolicyChecked:
	CNMKCucHxRc5OrQJo3kVm2O8RO7yRHaYWO580KSxDU6ZrHxCx1Ju1Ttqum4o6H8dGTWIkDWb3shsQTtEXHkBaGq6VThGIYo/pPgCp2cg+nBj5Jf9kj72h6/vsp2R54iITFmy3kkRXdQCqtTLxET+ozuBrCb5n9JIlBfqQunVhNH//xT7330U/61bFW4vJj4sQDFVGBnsNiuZ5o14NXnehXVffRxcU6CyxoEd/kOF0XNrUU9MrWG4ghIT9fcF2DQO+4Z4fBPiQ5LuEv42cMLI1yN5MYvzrCl5N3al+aroRHchvCNW+zcv1TyBwRZH+cXNDQJaZEBxHVPOWCgrQ7reow==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:09:03.5837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bcf283-2c13-4bfc-5031-08de811ad8c5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4207
X-Proofpoint-ORIG-GUID: eaGo70ZYLXhKp2pjyMGCCJdx7KUPHWmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfXyjQF7Zi1ACtk
 3A8YfMDamB5MPaLgN/QNXbG61GZJGLM+TZAy/yyv1JIiEG9eLNg7rbGYrCGtemYo2g8VUOQDCHt
 slnLkVlrCXvVuTf4JIylRu866ztrRa+BogTixPu1ASC6hb1ncs0jpqbPTOBIVe1E4qKRMcYbwJN
 bDSrpWvC1LFldaZ3YwcsY5eN3DAUl/vvcGEYR/gXmVBnW94C30LzREP6dRaUAKfA8NaWDNkyjvq
 PI+zcksS8pxmEj6/n1ucVXuWGC5YqPD+j+canQglSiES21Wu2CuU1CbwJLxz+d/JjAnQXG0kRrN
 3MC6oYaJjNSejJ+7D9Kdwllh7kCHgZtjXLz2FUilg5gE7i8zge0ktlCqgrG+w7WJnUgyM34Vu1Y
 PLvDWz1+56KkY5KGkVQhlW/45d4g4J2lTqQ6hd5vhkbHJiXPpeTjpXgDZOmBBY/bXQL5xQLqJ56
 OgtG5BfBqAHVKNX2MKw==
X-Authority-Analysis: v=2.4 cv=EP0LElZC c=1 sm=1 tr=0 ts=69b436a4 cx=c_pps
 a=N0p9dsNkTmNcAxi3Eyz8Mw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=HOnOMvm7sLRwy2XNLm4A:9
X-Proofpoint-GUID: eaGo70ZYLXhKp2pjyMGCCJdx7KUPHWmO
X-Proofpoint-Spam-Reason: safe

The cs42l49 is an audio codec with integrated MIPI SoundWire interface
(Version 1.2.1 compliant) with SDCA v1.0 support, I2C, and I2S/TDM
interfaces designed for portable applications.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 55c33ff63ca21..7af4e5d1b347f 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -317,6 +317,7 @@ static const struct dev_pm_ops class_pm_ops = {
 
 static const struct sdw_device_id class_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4245, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4249, 0),
 	SDW_SLAVE_ENTRY(0x01FA, 0x4747, 0),
 	{}
 };
-- 
2.47.3

