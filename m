Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692131;
	b=imT5mXmXDPlZ39f1L1OGKCHYXSKTdkZ+Y8DyxIp3UN2VqX6j4QDAbLvTQvFKP335wK5n
	 130etDlrtLNqd92qulwgDXJl3VL1Y4DtHCbpzDR4EybMWra+fZdXd7+yLnTvQ8qJzRycu
	 DY+4XtKG3x2VGd3syaDTlKMzjwLo96RNTefIg3Voc2JlO+2ciGfZnYySN/TTABrlTOeh+
	 kojrW53IGjVNY4GKVV+mIVxeNMsdZ9OdYFr9ldJviL8eUHW5Y/49umxHtjQ60O6YvFZAi
	 WuRvO8rDzUrcuiz8TwDhGB8I8/SJzRgzTf0C5ByTnYnjPdWdDoqQ68rjrb60gKNNF1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RXmP3nzpLOXtXIA7rVpFlTom+sLt7zQI44DfXB6HTfM=;
	b=OG+fOw+XBgFRMHPtMqBjIW5110Van2mDsAfCkLpSOohc868dnu+jZymWjki/+/v6u5Fw
	 kbjXEX+BpBgUX4NQq7Mk7kL640PKQuRw0DyVtcCqpahPzpEYQ+kDVjJUuiETfBfylEMQT
	 ua++pdlhrxM0txWCle/uPHbH/18wx1BQxv0gSeNEGfqve+FT1X/6fXu3VfDaATDtYKL7s
	 zH0EqT2UVBS7lMnLHo47hlbkEwFFCk47MyccaW+WQWHOXBhk8d2zP3WhFJMn4s2N3+R8i
	 1Y3jIbohD6qnh2Z7WKTOqUCE8m8eYp0Tun6ciOVIArRp4jv9LYwp5JvRKn//xGFUD3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=kJV3RhRy;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=i8IsaQhG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA391606A334;
	Thu, 26 Nov 2026 11:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA391606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=kJV3RhRy;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=i8IsaQhG
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAZPqg3759780;
	Thu, 26 Nov 2026 05:21:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=RXmP3nzpLOXtXIA7rVpFlTom+sLt7zQI44DfXB6HT
	fM=; b=kJV3RhRyvSpkOQXf1F/bK+h/gDd9gjLjz+/2TzDCZx/+cQkSMDyZM0JPM
	C3W6i/GkVCXhGI7ug8m/uN3QSHwStLqtCO7U05JWopSjCmLJePt9fm0aKkBYVo6c
	qfBTe/QeI4ACR2XGIYRd80knWr5CSItm2RUyEjWwXnIMdltYn97qWFUCQdBb4Oy/
	Az/0fcYAAY9CydMR4P684NGLbY+ja0447C5sNRs8SCRTtvIDU+kxcq4PQcatcFaB
	E7Ln0aLrC7+bNF91/Y+CFR94s6Vf4rVdvjaYY1ubOWKFWcGis0UP41imMXAiAg4r
	kwsAco5RMRZbEO+sa5JiZvru9emQw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j6hud0jch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 05:21:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyNSze3T9sorT8+SbkuLP7tBQEBPE7gMGcpLtRqbkYQOov2rkKDYg/TpNOE2Sl8JsJfrQ3/FfsYlAGKJwRlXZrcAGPvPZcB+4OpQolpR30C6ac7lXWnReaXupdn53MCQoZWYqQAB6DevMroO8CKykHXhioPLMFON90XhJyokwjUWz1kucrHiETYshkiZwPK5oPT9xNWCyXYqk1V6JiZbZ+u15Jbk399YOat6sY6WYohSOd1T0Rv1Mj9US5bgvt7L89elSuyb3lMcU7bq3xouQM3tIvAPmh2OFs+OcJKqh72W3o3Jw9C9Dml67We9v3GGCIbfRs9d3OuGvcum3XxLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXmP3nzpLOXtXIA7rVpFlTom+sLt7zQI44DfXB6HTfM=;
 b=ORbykVHBsQlmGcWW9xaNiaMjXy5uV9iR614TsUoCKr8v96OZzsfXEtzbHxE2a/LMVE+5qx/Q41wZTLJ+iXVVA8koAhJXOKwVLqW1fk7trpdzwJCxAEkkXVkA20JoreJcrNsjx0d1WuCysBfoFb4TPf3RFDhUhmCbnfr1OF2T+CJeCo8/ReZPCwCt5uQkksdXDrJoeJUMSECumtB99F/meMRvwGxY1w8tvBWG92qWl7FifW8pHH5nG3XplHHt7Pc1vFC1QcZYvdovAbah7X0W973OPeX50vZ2KZUPAGd2f371pL2nubuiK9eQ1BKEpSDN6yqQKP5mkakiJX+lK0pJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXmP3nzpLOXtXIA7rVpFlTom+sLt7zQI44DfXB6HTfM=;
 b=i8IsaQhGhFwmigB0hG14o6RA7eURSdoUv5q0UwHTFgjCu4t68vpRldFrAGE6FeufUJK7NCsKq8Ak7+FAMkLZYq2jKp4xlvVIDqIempQ5fbg6uBwY8P7YcuDVM9HbaPZS+p+5OnZF8h8LTP2wMKkW9A0a9+LNM0n5FLx+3e9cIxI=
Received: from SJ0PR03CA0202.namprd03.prod.outlook.com (2603:10b6:a03:2ef::27)
 by PH7PR10MB5816.namprd10.prod.outlook.com (2603:10b6:510:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 11:21:22 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::26) by SJ0PR03CA0202.outlook.office365.com
 (2603:10b6:a03:2ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Thu,
 26 Nov 2026 11:21:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 11:21:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:07 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 05:21:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 26 Nov 2026 05:21:07 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.250.64.62])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AQBKwHU1596498;
	Thu, 26 Nov 2026 05:21:03 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 2/5] ASoC: sdw_utils: add tac5272 support
Date: Thu, 26 Nov 2026 20:20:20 +0900
Message-ID: <20261126112023.29054-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20261126112023.29054-1-niranjan.hy@ti.com>
References: <20261126112023.29054-1-niranjan.hy@ti.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|PH7PR10MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: daa90bcf-7397-4e69-05bf-08df4baf661e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|23010399003|10067099003|56012099006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ap3gupbqvqGwF9XfGImwJSges1QRqZTjIbFv9s7qg1Lu3l5BF2swnHqEJnfUtTfBLSxJcZqYHzh/8fgQxptCMZj1HQ7uGZgob2d+5oF7EAWJh/BEda3i+2hiastYYnpw+IuRSWJ1ix3EvkxjNcdS07rs6K+waRSCuDI2PW+oPG3SzpbJqXuseSs84WaQHLL09XS7iwRWWEqklS6u3AA0u2l0f0O6fjoEwMd6G8PRRvUruFJqAHY5rMo7hw1yafHnruqOpkSL2/33TBBNnkJBc6OOPBbr1P1YFB50OwJHR+GFzkuBrjhyoYskIhJALbplI9onUVMO+MoiUIcqOazXwwjJ6dy4mC8buEglXjAqLd53rSmslrtd3HcKjdO1eVSQqdEu9eWkj8rEXahsD9idWVMQH2H0pocK8mdGOvFpIRtLBsM5kJdupxG0yNVTgPWqoxzJZodf+mk6gaXGSr4yxQI1pTwH5DJzn2839Z7/KgBFqfV5MBWBSWT3qAKkz5JkDaOHd16qrBiMdwu5WxIMT9yINrsJVvgxpZdRraeAJ4ZE0yECqfsZpzz+ohoDseU6AdpOXkZebNElYuwLkA/urOqE9erNQCPVj+r4vTEVycd0CD3z/VS3L8x2Gk/FVQ2Z/j2uSSvt2aLuWub1zG6XdISvX1oFM0x0WGpHf4dZ7HM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	npNVb6RHljA/h8aIv9arNVSSOrh7mdTPMx21fOsX2DBUnWdHCu/ViLGJTVLc866Kzep1x2qIpl9uJmTj6+sukaICFOlqB9d9FqSogzs7D2+3QpVFCKQoCQ4U3pXEwAGR5S/H3b0Cod0mK7keyBhT7G3pgtF1ktJGIvrQNNGFabi0Ml8n2b1cL6IWwBwWy2oXiUL2bu+O3sV9ui8hQXCK+2TiBBjAf1gWN226Yf23wmsGs6eld0FU4fGRtmIqSHa5vi8qSvDHtDKJXgaRyw7esoovk0utVx8oFMvBlo6UZdmVEpwtQ2BSdxuP2MRtHB0ZuKRZuwVKgbiz7CpfWFvxMr2Q2n6Q2J3NsgJEhx0lS3EA8MSpRtkMuhyPSAw/76KowoqUh3lw+6A4n7tYfJlgQ6BohOn3E7/Xhqe5mh28ol0mxfGwQLUwcMWcPGN75EIs
X-Exchange-RoutingPolicyChecked:
	WUl1Hm5wpJNNYQ6a32DD+QWnkJnc9bmhNRF4/72Z2/R1gMPtmCIQ2Mu41lU+elzXl+aJYuUom6zVzITRu7oNHzdo4cA+i7Af+psF6Me2jx9aUvM48GqnWH+t0EO07YTiOPvlm+5MpKGUf6kj6GkdsKfv6LApVflOa+kS2dxVaeEMEbVqb8tonVYjdSDwSCAkVUovuklQ3e+vzsDYUoCkNa3nHblhM4M0ezd2Puri+cFf7e5ssR1SnYJnQjzPSrMEasiAoUz9snbMsmcHKCZyaAVAGbuCZpL+TX3x23A25o7nzlGmz8ltxwqxW285FQEzLHj48GZ7/nTSL1oNzzZBDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:21:21.3252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa90bcf-7397-4e69-05bf-08df4baf661e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5816
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX1DXXHGA2Yb8v
 yYcNBQd6eCOXyJ924QyP0J80Spn6FUMoEyO8V8J0npvVcbaT2aq9W1kA3OJ9iZwYy5Wge6wpfMn
 MODxF6T8V0bxOfeVOiZyARVp2/1356I=
X-Proofpoint-GUID: 35ZGjYgxN0M5iVSnMgAjoJMHj0K5BlDz
X-Authority-Analysis: v=2.4 cv=a4KlZkSF c=1 sm=1 tr=0 ts=6b081636 cx=c_pps
 a=33ZETTsaPBFHggYVnTYjDg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=ZkW5XokrOS9FCDxmhxcA:9
X-Proofpoint-ORIG-GUID: 35ZGjYgxN0M5iVSnMgAjoJMHj0K5BlDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NCBTYWx0ZWRfX8hzsnT6BT3R9
 bR5NZlrZHq3kg0NrN99h/8yxEwrkfObFaVp5tvEkmz7fN0GBBnwFTYcXHLpzMmvCoIpBUfhVEvL
 jmeE/HLmzy+O9zWvOwqVzbgRK368qaXbmED56gzid/pjx+2Xy2zM9hY/HQ13H1XlgQEHspgxvyW
 nKAY/QMbJIkZ7FpIpGTE/lOUH2FkaGe1Z5LY76+MEn0xqe3Hf2Q/Lgl97jpqHVA28GGhOdS4p+b
 i3vKBsJevxXaESdAxsIFFmUr2K+QuPvOCFBI8AGVZeLLbIKbZ6fDJwd1Ji506KDxPfGQBE+LOPF
 8JjoXRsF7t+sVvE5nYQrN40wuFIOfElL77XeYDv2z3WZX4hK3zLPCLxfGVYi7XEL+a4X4aazQze
 +0VXWubI/bZJN6DWovXTTg+ZgT7l8WAbsROOh9fI3+/jImuhsrhda5iJKHi25KO66H36T6KSwgU
 FgdyiknWApwcOsTrrfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260044

 Update soundwire utils to support tac5272 which is
UAJ + DMIC variant with no speaker support.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
changes since v1:
* Added DMIC support to tac5272 machine driver entry
* link to v1: https://lore.kernel.org/linux-sound/20260908032757.389-2-niranjan.hy@ti.com/

 sound/soc/sdw_utils/soc_sdw_utils.c | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index b6acf7616..617ea88b3 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -81,6 +81,36 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 };
 
 struct asoc_sdw_codec_info codec_info_list[] = {
+	{
+		.vendor_id = 0x0102,
+		.part_id = 0x5272,
+		.name_prefix = "tac5272",
+		.dais = {
+			{
+				/* UAJ */
+				.direction = {true, true},
+				.dai_name = "tac5xx2-aif3",
+				.component_name = "tac5272",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+				.rtd_init = asoc_sdw_ti_sdca_jack_rtd_init,
+			},
+			{
+				/* mic (DMIC) */
+				.direction = {false, true},
+				.dai_name = "tac5xx2-aif2",
+				.component_name = "tac5272",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_ti_dmic_rtd_init,
+			},
+		},
+		.dai_num = 2,
+	},
 	{
 		.vendor_id = 0x0102,
 		.part_id = 0x5572,
-- 
2.34.1

