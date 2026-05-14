Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565C38A725;
	Thu, 14 May 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755327; cv=fail; b=iSA8KDiG2RlUAtAbVymbVgPABDhsHzxvBIOoNA/VlEvFzVsf7FOBykfH7goM0XCqKIZDoaLBdQF+RXNFiEDAXGiOKLMWKBGL5zGZ0BOh5tOnlBxrfl+EE9G86ROIOHVI+BmAr/77l5AxyBNDNgUvedsKnm0kjsb2dJ1CtxDfSx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755327; c=relaxed/simple;
	bh=vdZRb6zccbzUC0jFDhpe9neUF4BuFF+VHi91uW/flZ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BSzMnupd6i3uW9CxJwQQfJNAEVqCW3LygOA9E+lpQ8/1TIrQce6kvcpHn1qFM/I7maFz8RL37/uB49YORahyeT9P+70MS63HspkILvYCPTOB2fIJCMMNC+5QZpFB41SEGB/RgIk6uMpuJQr2cgS0f7cZccLbar6RMo4TNbaUrYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vxrpL4/o; arc=fail smtp.client-ip=52.101.57.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vxrpL4/o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH0HxnVgfZuGVQ+gtlRVu35ctxmHDKgMUUnLx8XwN5P6/RyxXtdA6+Y/ciwjL9KRKSX1d3RbmM3yzyLzLKWL7lJHjQPmY67YI3GEvpZTA1/CiacxNX9gkdg7wb7XXBtOxJNgC0nQg4J8v6BE44rvucumS4vaarY+LqyzyxThgnqRYaEqXSlX/t2O+HyG7PLFwnajrEyv2cxuoyr/xbxGXDOhxmw929QoH91h6/ktFZgfC/DuJ3VLDqIsxqkvqRr4BgvazfUTFnVE8+xQ4iXgYOLsAVmuETk2bQsg9NpHa58gk1gSGrBABIVNKnqB2pz4tyDfXythmkjXF98va7czgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdZRb6zccbzUC0jFDhpe9neUF4BuFF+VHi91uW/flZ0=;
 b=yzjerLjBVj3T0e2nM9Ne5VxFq2x2vg8VoIhVjEbyr/n/UswOA2xs8o9x/Lcn08Emj2vcGRpn92+nA3WDpWSgDSqRY8a7Q60VUQdJUeVinRon4ZZeHxeZrIOcFgNrC4JDoc7DNGJluE8zSw1swO0x6JGbSktkbfDuSxrOrB7oD2YxpOZ2Q4jzIdmjo6s2zlKsyrslZY8oHytp9EE///EKzHvqG6loRqxSQPr0Cof38SiIALGp5f35sF2wu18iPYTJx+d2P5ZcgaBqiuUqBwyX4q1Tf57Eu9HZXxf7XYX+eM3sNyyRht81nfTZZIKtPF/bspAGjSfkf9HsQ/e+u1je1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=opensource.cirrus.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdZRb6zccbzUC0jFDhpe9neUF4BuFF+VHi91uW/flZ0=;
 b=vxrpL4/ossxWE/2yEBuQOgrvH6EacF2Ayco5vQ7WhmBHF9NnHssVRmBU6hsRIW2zdc68mz+ZNsttHGpgsiWT5+vZKCVY9bZGVXdJrDvff6Se/drWOdt8UPugged+QWoHg4f2mVN5IDsS0eCs/mrmP/GP8sKI9XJtVxmmBEddHQA=
Received: from PH7P220CA0060.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::29)
 by SJ1PR10MB5931.namprd10.prod.outlook.com (2603:10b6:a03:48a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 10:42:02 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::eb) by PH7P220CA0060.outlook.office365.com
 (2603:10b6:510:32b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 10:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 10:42:02 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 05:41:52 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 05:41:52 -0500
Received: from DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf]) by
 DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf%14]) with mapi id
 15.02.2562.037; Thu, 14 May 2026 05:41:52 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Ding,
 Shenghao" <shenghao-ding@ti.com>, "Lu, Kevin" <kevin-lu@ti.com>, "Xu, Baojun"
	<baojun.xu@ti.com>, "Wang, Sen" <sen@ti.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>
Subject: RE: [PATCH] ASoC: tac5xx2-sdw: Use new SoundWire enumeration helper
Thread-Topic: [PATCH] ASoC: tac5xx2-sdw: Use new SoundWire enumeration helper
Thread-Index: AQHc445GDS1RCnyVf0C/4DgM3K096w==
Date: Thu, 14 May 2026 10:41:52 +0000
Message-ID: <642b1d1ee98c463192f2304a564d5a3f@ti.com>
References: <20260514083358.2559733-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20260514083358.2559733-1-ckeepax@opensource.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SJ1PR10MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d102b6-3e28-46ff-4681-08deb1a56eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Vo77WGT78YKgLBdbjIDtalpL32HLzdixcr2GGj2QPxqvtSmNL3Ss2GU5jxpoj5l68mgLljGSFHii8Fh8BCmTQvJnhZCTPljja+uiNxgZZlmuPFj25BgoyX3HyJk0cazef5BWqffhYaF7kqP/qgvbxF8GCCvexFnyl2Mg9KJ6AfPcJZ0EcQJClrtSj2sIGqAvAc7glqm35yz8rZ0VuB6m87LiYgYY1tP9YTK62/AF9DRIKnriPjW7olX6kSnzID7qmRelqTVseVbQYGZcXnhRHQ+zZpLJH2DDqlvgS1pre899sfPRC1q/ZEDlrrXidNdvUO4ug6bsTv7b3194tvsyeflHAQfCdJVG/3ILN8QVVvWnojdv9nbiPP1fFHte5VMQiqDBTTbASXfghl6mOW9+bjpbpV50IwEcDiLeFivQfynRZSMDjkbjGyRUQ6GD4O8eRyJrF2Nda2HL818IPnpkqRFNXEMNmgpBfwdANwWp4B7qq/Um1fztV5JDFMTXyHYCE6LwkifZ0raUNUmNuMzfNkSG67SO144XZaX/iYgr6rGmDWsS6v/ef0yItoMXfOJBadpueq7LQ/yH1UcBikjWsokOXij6sH+tRzNc/7rCqXrbAEh5Rn2TrvkLK2AClbk/QXTHMTobYu9DtDhnQfbcUxm4eSDz3V+4+cUEkJvASuOSGN63RO/XctvpfuipNzwPQqqvSMkXB0clNxZj+by0QpU+qIHlyRvZrSQg/1Ky+TA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(3023799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5h6CgN/QXttZa/zjhb+1hWnp+hUVpX3VrrbvFo4SJbzexC7Fr50i6sQrAy+q7IxkuVYcxmcwjxdAfCxGwGP1m+foOF5U2dis1zAV6sxahm0NTgYJMMEJr0ovKCPW5EE2hTbHhYXyE7FB+J21xdU5TQi1j2bV8lQexyAjLGs5qDdUrNF3yRtchKe4EIFI2doDb4kMmFH8ot4u6gt/3wh0s8ferr3ZzBZe805dbaozW+tinJERO5xyRwKTodiYyLqW1PGBZQ7v2aLyodsIKVHWahkqrNLh1esR11ois2ymIT20s/QCZGeFlMGfe6KYuUtvJcaAB58fA6JW+j5fyVb09fyt16carA6GA0rTRB55JLa6GjaPsAMFABeT1RkLs7vmu3kqjowzuo/2y9PU7VEZUMWWGNU/bLgouuM6fEAtrSTPKvpCVJHSnHfJi2cyBd/P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 10:42:02.1120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d102b6-3e28-46ff-4681-08deb1a56eee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5931

PiBPbiAxNDowNC0yMDI2MDUxNCwgQ2hhcmxlcyBLZWVwYXggd3JvdGU6DQo+IFN1YmplY3Q6IFtQ
QVRDSF0gQVNvQzogdGFjNXh4Mi1zZHc6IFVzZSBuZXcgU291bmRXaXJlIGVudW1lcmF0aW9uIGhl
bHBlcg0KPiANCj4gVXBkYXRlIHRoZSBkcml2ZXIgdG8gdXNlIHRoZSBuZXcgY29yZSBoZWxwZXIg
dGhhdCB3YWl0cyBmb3IgdGhlIGRldmljZQ0KPiB0byBlbnVtZXJhdGUgb24gU291bmRXaXJlIGFu
ZCBiZSBpbml0aWFsaXNlZCBieSB0aGUgU291bmRXaXJlIGNvcmUuDQo+IA0KPiBTdWdnZXN0ZWQt
Ynk6IE5pcmFuamFuIEggWSA8bmlyYW5qYW4uaHlAdGkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBD
aGFybGVzIEtlZXBheCA8Y2tlZXBheEBvcGVuc291cmNlLmNpcnJ1cy5jb20+DQo+IC0tLQ0KPiAN
Cj4gQWRkIHRoZSBtaXNzaW5nIHVwZGF0ZSB0aGF0IHdhcyBwb2ludGVkIG91dCBieSBOaXJhbmph
bi4NCj4gDQpUaGFua3MgQ2hhcmxlcyEgSSd2ZSB0ZXN0ZWQgdGhpcyB2ZXJzaW9uLiBXb3JrcyBh
cyBleHBlY3RlZC4NCg0KVGVzdGVkLWJ5OiBOaXJhbmphbiBIIFkgPG5pcmFuamFuLmh5QHRpLmNv
bT4NCg==
