Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010038.outbound.protection.outlook.com [52.101.193.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A628130F535;
	Thu, 26 Mar 2026 02:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774491886; cv=fail; b=iNazA/th+SOCVw/8YpJcDBKhdjzG7UesKJbKr5ZmVgyy5VfSwdhtiNFmumL6m3vLtciyqwSqpVoXqMlI9l6A43cIXppjJcMYodDmY+FYTdPhOzMZZtbMkyehJKV4usMHyl7nAskw8BAWARv6C1mRXs1TRO2PZ6knYwydXCmI5kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774491886; c=relaxed/simple;
	bh=9ZpWlHBMZZhj+vuPoWM91uS0XI5unuKpoV4qUV2ZVCA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bpmV2DcV7m/GykQCDMsQWqvHJT5kUrSRi9+1/Xc4Q8LU/EiLuyMfgMVMupmbkGPP6dZvo/0HNTWxkAXlJuvO3pHnnR/Y1wdKmPRDFujBAiNG0DCkvv+c63l37+gAo5LXRshF36X/OqF5ogelYmFCIBiO2MLT4lNjhRiWgxOH3nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o7ZMJ2oS; arc=fail smtp.client-ip=52.101.193.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o7ZMJ2oS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoqK/ZRa+JoOggm6pImApjj9MUMre2I1iMAth7OP0898oJ6KbyPQ5f+PdTSQMQ6JVHlK94DEkQAs1Mqy9qQ6uYZs/waF52v7P+/2zWNfbpInbl7U6+7OhJ3DE4cEzlmOD8SiZYwQAzWKQ+26L6UtBJzLRab/sGEuPSJ18zzqBsao2wkhSZe8a9pRzSt48FXk8t8lALlzCrzAm2QCZGLlfheo5VvGrnwJqHsU2poG7PwZsle178G1y8b/RcJun9Rw7Ec6L6np1SCEHaMg7wF1UFNJcL5AphrAXvYACNlATShGBO5kcu3b2Z8+OvjYLLrBmNNsQFqG6jEKb8bWISnFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZpWlHBMZZhj+vuPoWM91uS0XI5unuKpoV4qUV2ZVCA=;
 b=eiNn3gtxqMj3aJAGm3AgyUmwYBeAqbubZvwEUrwxfEP+7Ijh1RmOmt6BlzUqmDMuCqfQI/jQeUeLk0xGXJVx6UVMHYSb2ybVctXigf5RJHpC3UhiG+MxwfJqm/f4Ve1iAGgQhgRbcJ+gL6r7x7T/hgG82EY0vShIGw23zubcTWvO/w2mBKupJzJgY6vBH3nELHvShNwuWE+NmqW2OUl4Qs3LccMXn35VMnsl76h4TBcBwbRb6hYFwkN//MVrREjbKAvQ9kXR2WGyRaw3OmVpOesZ/jAf+F/VW0zLhrDuFg9+OuHyiOWAk5n1EqfS4iHwCULKes6De05jwNBZCP9b6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZpWlHBMZZhj+vuPoWM91uS0XI5unuKpoV4qUV2ZVCA=;
 b=o7ZMJ2oSIna1olbGppeLdoet7w91KnDeP1oTTWQJZl50G3YO9kVOdfj6YLwSkvVp9fhxYxkRqTnq+F0/tDyu3N4eOxeCZbaCvmBAfsvsQ+hfXDZFtQRObX/YiAZz9sYLJ4uZP8nLKkYsTz0nMqKi/RC1g3pfNdNld4xGzYhUI5M=
Received: from SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7)
 by SN7PR10MB7103.namprd10.prod.outlook.com (2603:10b6:806:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 02:24:40 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:330:cafe::60) by SJ0PR05CA0182.outlook.office365.com
 (2603:10b6:a03:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 02:24:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Thu, 26 Mar 2026 02:24:39 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 21:24:39 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 21:24:39 -0500
Received: from DLEE208.ent.ti.com ([fe80::eccb:3d12:9ac:a479]) by
 DLEE208.ent.ti.com ([fe80::eccb:3d12:9ac:a479%20]) with mapi id
 15.02.2562.020; Wed, 25 Mar 2026 21:24:38 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Xu, Baojun" <baojun.xu@ti.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>, "13916275206@139.com"
	<13916275206@139.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Thread-Topic: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Thread-Index: AQHcpvWtM+IwM+FmAUmJuO9Hs3DySrWWv+mAgAAB3ACAAAFxAIAEj1IAgAAJlQCAAAaZgIAAAZ+AgAAEvQCAAAbRAIAFzqUwgACDr4CAEJV9YIAAZ3OAgA2A7uA=
Date: Thu, 26 Mar 2026 02:24:38 +0000
Message-ID: <05aded25ddcd460fa246c36443be2694@ti.com>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>
 <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
 <9f861c7df09c4434a98a203ecff913bc@ti.com>
 <63b0f42e-56e8-474f-8805-4e01bb2f189e@kernel.org>
 <a7316acf9ba248f9ad1fab0313a95654@ti.com>
 <3cfa4036-e7a7-4cde-9dab-a171a63bdee3@kernel.org>
 <4865c7f626a340d7847354512367577e@ti.com>
 <596f90d0-8dbd-4afe-a722-bf2ba65e1776@kernel.org>
 <aaVcDvYvi28wFR2S@ashevche-desk.local>
 <c46a8bf5-7a6a-41a9-b18f-9a7ad7a60bb9@kernel.org>
 <3af19ebaf32d482ab5cf575b831b2d9d@ti.com>
 <f16d2a7f-04e2-4d99-9239-caca9fd1f7b5@kernel.org>
 <d8303fc67ae84232b4b6ff0ef8cad6f1@ti.com>
 <53379548-dcac-4724-8ec8-50ce07807cc4@kernel.org>
In-Reply-To: <53379548-dcac-4724-8ec8-50ce07807cc4@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hYmQ5MWFjZi1jMTZjLTQxY2QtYjViZS0wMzE0NDdhZGYy?=
 =?utf-8?B?ODRfQWN0aW9uSWQ9N2UyNGUyM2EtNmMwYi00Y2ZiLTg2YmMtYmNjZjYyZTQ3?=
 =?utf-8?B?ZTU1O01TSVBfTGFiZWxfYWJkOTFhY2YtYzE2Yy00MWNkLWI1YmUtMDMxNDQ3?=
 =?utf-8?B?YWRmMjg0X0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hYmQ5MWFjZi1jMTZj?=
 =?utf-8?B?LTQxY2QtYjViZS0wMzE0NDdhZGYyODRfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYWJkOTFhY2YtYzE2Yy00MWNkLWI1YmUtMDMxNDQ3YWRmMjg0X01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2FiZDkxYWNmLWMxNmMtNDFjZC1iNWJl?=
 =?utf-8?B?LTAzMTQ0N2FkZjI4NF9OYW1lPVRJIEluZm9ybWF0aW9uIOKAkyBTZWxlY3Rp?=
 =?utf-8?B?dmUgRGlzY2xvc3VyZTtNU0lQX0xhYmVsX2FiZDkxYWNmLWMxNmMtNDFjZC1i?=
 =?utf-8?B?NWJlLTAzMTQ0N2FkZjI4NF9TZXREYXRlPTIwMjYtMDMtMjZUMDI6MjI6MjNa?=
 =?utf-8?B?O01TSVBfTGFiZWxfYWJkOTFhY2YtYzE2Yy00MWNkLWI1YmUtMDMxNDQ3YWRm?=
 =?utf-8?B?Mjg0X1NpdGVJZD1lNWI0OTYzNC00NTBiLTQ3MDktOGFiYi0xZTJiMTliOTgy?=
 =?utf-8?B?Yjc7TVNJUF9MYWJlbF9hYmQ5MWFjZi1jMTZjLTQxY2QtYjViZS0wMzE0NDdh?=
 =?utf-8?B?ZGYyODRfVGFnPTEwLCAxLCAyLCAxOw==?=
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SN7PR10MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: ecdaaa0e-ea60-4a2f-5e39-08de8aded54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yk+QNWZCTU6nBlwP7elkZzYAa0bJKAMHthknh9lJVcmh8tYQUKr68vOODkg9ZUYG6gRZAO8Fr43E2st/f2JWXcIkFPKlZsLGfHmWhHR9QoHVxqTCjKkd+pMXfNZl4tK0B+GPOgQ5Zs1VYJTYiFNg6YbXEwmrkh7poNPgtHcvuTP9G3+Z9epU95/nEWGvv8C7m1evkxNZZLHUxBPqDJ1O/cgOxLY+0flTAgiSjB69CTaY+PFt5+0WzeDTp/faRmcc95BEt9A0dcSEKCVM8iK12ntk6UNQwZDog9bXUoPcuEMKKOqc+vJIPTsh2QyvU5O64xHcxaJyvQ/ikwlzIN2TaRFcioj2SDr6NpjeKJ5t/C45YIL3Ji0Zware7gh99SDFrYaReRPzinN9bR5Q14flZGnXbvbdioykbHWJ/50XLFepTxICHO/9aAwXFGvOnB1qLlc/IFo0yrPkfeABo8PrCicFhNF+W7aWrZtvW5bZ4oFeU5c4TNSwn9y5Mtx9kekGhIgyMiwzFvF6/vW3Bz6CY3tDaopLU3uJS8KLEh5bJ8jgHCw/YQdc3NXZbhA4kn5RY1/DawRjsWJtuQ8zsR2URKH9388zixzx1v/UuZGGGVSxfXPW6W5LmlShiLfg5/ehicsPAFguFH/XjUIHx3b3YHGZeyiXW9XdWy5BUv6jvsXGGwC1sdol5WUxj5zVR/+0SEhZzucBXBQb0JGeyGDkGW/MUT1VTZfXni8PQ/qyeXlCO09ini5Sap3S9UIkOeppqKLbxxkpwx2w4MmTF7EbxQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5Z0yhuVMUJBIuQgiyx38gjUQPIxYD6zoxrJVjYkxFaaSMxse3Y6xAERUHL4Dz4C/oy5V7fnOkylytFaO2wk8aIPaXEovYMrv/qhdyviZ+PDPpdySGKwlVmuPl66RmYsZBsEn0gHjxXtYPPZK2QzcflrxXrEy0FleA4fuwBuMIvUE14obsxdWoZJW9Z7NlBsPL1VHGDLD+/oWGFSFCeN6MpxA2u01rn0rzY+xQiuPnV4DyGm8FapAFK54ALTlWaLLwsugCRjOXl3crKQyM37JbjhnJsu2lW6UeEV0r8CTaauEkmr7wBdbq6QLt6qEcFioj7eyYWlhOXMLhX1ukxXJGUBdV2fKxOwtOY+RWGYC1mkYlaJrGku7oms+uNJsJt36JAUzEJrkTLm0z4epOcF/rJ7+iy5zDrMpqAv900pCnZp4YodO2KRm1h0ipLEf8JrL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 02:24:39.7945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecdaaa0e-ea60-4a2f-5e39-08de8aded54e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7103

SGkgS3J6aywNCj4gDQo+ID4gKHJhdGhlciB0aGFuIE9GX0lEKSB0byBvYnRhaW4gdGhlIGNoaXAg
bmFtZSBhbmQgY2hpcCBJRC4gVGhlIGNoaXAgSUQgaQ0KPiA+IHMgc3BlY2lmaWNhbGx5IHJlc2Vy
dmVkIGZvciBoYW5kbGluZyBleGNlcHRpb25hbCBjYXNlcywgZm9yIGV4YW1wbGUsDQo+ID4gdGhl
IHdvcmthcm91bmQgZm9yIHRoZSBUQVMyNzgx4oCZcyBsb3dlciBzcGVha2VyIGltcGVkYW5jZSBp
c3N1ZS4NCj4gPg0KPiA+IFNpbmNlIHRoZSA1OHh4IGZhbWlseSBsYWNrcyBhIGRlZGljYXRlZCBy
ZWdpc3RlciB0byBxdWVyeSB0aGUgY2hpcCBJRCwNCj4gPiBib3RoIHRoZSBzdXBwb3J0ZWQgY2hp
cCBJRCBhbmQgbmFtZSBhcmUgc3RvcmVkIGluIGlkX3RhYmxlLg0KPiA+ICBUaGlzIGFwcHJvYWNo
IGFsbG93cyBjb21wYXRpYmlsaXR5IHdpdGggYm90aCBEVC1iYXNlZCAoRGV2aWNlIFRyZWUpDQo+
ID4gYW5kIEFDUEktYmFzZWQgKEFkdmFuY2VkIENvbmZpZ3VyYXRpb24gYW5kIFBvd2VyIEludGVy
ZmFjZSkgZGV2aWNlLg0KPiA+DQo+ID4gCWlmIChBQ1BJX0hBTkRMRSgmaTJjLT5kZXYpKSB7DQo+
ID4gCQlhY3BpX2lkID0gYWNwaV9tYXRjaF9kZXZpY2UoaTJjLT5kZXYuZHJpdmVyLQ0KPiA+YWNw
aV9tYXRjaF90YWJsZSwNCj4gPiAJCQkJJmkyYy0+ZGV2KTsNCj4gPiAJCWlmICghYWNwaV9pZCkg
ew0KPiA+IAkJCWRldl9lcnIoJmkyYy0+ZGV2LCAiTm8gZHJpdmVyIGRhdGFcbiIpOw0KPiA+IAkJ
CXJldCA9IC1FSU5WQUw7DQo+ID4gCQkJZ290byBlcnI7DQo+ID4gCQl9DQo+ID4gCQl0YXNfcHJp
di0+Y2hpcF9pZCA9IGFjcGlfaWQtPmRyaXZlcl9kYXRhOw0KPiA+IAkJdGFzX3ByaXYtPmlzYWNw
aSA9IHRydWU7DQo+ID4gCX0gZWxzZSB7DQo+ID4gCQl0YXNfcHJpdi0+Y2hpcF9pZCA9ICh1aW50
cHRyX3QpaTJjX2dldF9tYXRjaF9kYXRhKGkyYyk7DQo+ID4gCQl0YXNfcHJpdi0+aXNhY3BpID0g
ZmFsc2U7DQo+ID4gCX0NCj4gDQo+IEkgZG8gbm90IHNlZSB0aGUgcG9pbnQgeW91IGFyZSBtYWtp
bmcuIEFsbCBsYXN0IHJlcGxpZXMgZmVsdCBvZmYgdG9waWMgdG8gbWUsIHNvDQo+IGp1c3QgdG8g
YmUgc3VyZSAtIGRvIHlvdSB1bmRlcnN0YW5kIGhvdyBpMmNfZ2V0X21hdGNoX2RhdGEoKSB3b3Jr
cz8gVGhhdCBpdA0KPiBjYWxscyBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSB3aGljaCB3aWxsIHJl
dHVybiB3aGF0Pw0KPiBXaGF0IGV4YWN0bHk/DQpJbiBteSB1bmRlcnN0YW5kaW5nLCBtYXkgSSBo
YXZlIGZvbGxvd2luZyBtb2RpZmljYXRpb24sIGFuZCBvbWl0IGlkX3RhYmxlIGFzc2lnbm1lbnQg
aW4gdGhlIGkyY19kcml2ZXIgc3RydWN0dXJlPw0Kc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgdGFzZGV2aWNlX29mX21hdGNoW10gPSB7DQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXMy
MDIwIiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzIwMjBdIH0sDQoJeyAuY29tcGF0aWJsZSA9
ICJ0aSx0YXMyMTE4IiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzIxMThdIH0sDQoJeyAuY29t
cGF0aWJsZSA9ICJ0aSx0YXMyMTIwIiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzIxMjBdIH0s
DQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXMyMzIwIiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RB
UzIzMjBdIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXMyNTYzIiwgLmRhdGEgPSAmdGFzZGV2
aWNlX2lkW1RBUzI1NjNdIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXMyNTY4IiwgLmRhdGEg
PSAmdGFzZGV2aWNlX2lkW1RBUzI1NjhdIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXMyNTcw
IiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzI1NzBdIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0
aSx0YXMyNTcyIiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzI1NzJdIH0sDQoJeyAuY29tcGF0
aWJsZSA9ICJ0aSx0YXMyNTc0IiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzI1NzRdIH0sDQoJ
eyAuY29tcGF0aWJsZSA9ICJ0aSx0YXMyNzgxIiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzI3
ODFdIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODAyIiwgLmRhdGEgPSAmdGFzZGV2aWNl
X2lkW1RBUzU4MDJdIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODA2bSIsIC5kYXRhID0g
JnRhc2RldmljZV9pZFtUQVM1ODA2TV0gfSwNCgl7IC5jb21wYXRpYmxlID0gInRpLHRhczU4MDZt
ZCIsIC5kYXRhID0gJnRhc2RldmljZV9pZFtUQVM1ODA2TURdIH0sDQoJeyAuY29tcGF0aWJsZSA9
ICJ0aSx0YXM1ODE1IiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzU4MTVdIH0sDQoJeyAuY29t
cGF0aWJsZSA9ICJ0aSx0YXM1ODIyIiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzU4MjJdIH0s
DQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODI1IiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RB
UzU4MjVdIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODI3IiwgLmRhdGEgPSAmdGFzZGV2
aWNlX2lkW1RBUzU4MjddIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODI4IiwgLmRhdGEg
PSAmdGFzZGV2aWNlX2lkW1RBUzU4MjhdIH0sDQoJeyAuY29tcGF0aWJsZSA9ICJ0aSx0YXM1ODMw
IiwgLmRhdGEgPSAmdGFzZGV2aWNlX2lkW1RBUzU4MzBdIH0sDQoJe30sDQp9Ow0KDQpzdGF0aWMg
Y29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkIHRhc2RldmljZV9hY3BpX21hdGNoW10gPSB7DQoJ
eyAiVFhOVzIwMjAiLCAmdGFzZGV2aWNlX2lkW1RBUzIwMjBdIH0sDQoJeyAiVFhOVzIxMTgiLCAm
dGFzZGV2aWNlX2lkW1RBUzIxMThdIH0sDQoJeyAiVFhOVzIxMjAiLCAmdGFzZGV2aWNlX2lkW1RB
UzIxMjBdIH0sDQoJeyAiVFhOVzIzMjAiLCAmdGFzZGV2aWNlX2lkW1RBUzIzMjBdIH0sDQoJeyAi
VFhOVzI1NjMiLCAmdGFzZGV2aWNlX2lkW1RBUzI1NjNdIH0sDQoJeyAiVFhOVzI1NjgiLCAmdGFz
ZGV2aWNlX2lkW1RBUzI1NjhdIH0sDQoJeyAiVFhOVzI1NzAiLCAmdGFzZGV2aWNlX2lkW1RBUzI1
NzBdIH0sDQoJeyAiVFhOVzI1NzIiLCAmdGFzZGV2aWNlX2lkW1RBUzI1NzJdIH0sDQoJeyAiVFhO
VzI1NzQiLCAmdGFzZGV2aWNlX2lkW1RBUzI1NzRdIH0sDQoJeyAiVFhOVzI3ODEiLCAmdGFzZGV2
aWNlX2lkW1RBUzI3ODFdIH0sDQoJeyAiVFhOVzU4MDIiLCAmdGFzZGV2aWNlX2lkW1RBUzU4MDJd
IH0sDQoJeyAiVFhOVzgwNk0iLCAmdGFzZGV2aWNlX2lkW1RBUzU4MDZNXSB9LA0KCXsgIlRYTlc4
MDZEIiwgJnRhc2RldmljZV9pZFtUQVM1ODA2TURdIH0sDQoJeyAiVFhOVzU4MTUiLCAmdGFzZGV2
aWNlX2lkW1RBUzU4MTVdIH0sDQoJeyAiVFhOVzU4MjIiLCAmdGFzZGV2aWNlX2lkW1RBUzU4MjJd
IH0sDQoJeyAiVFhOVzU4MjUiLCAmdGFzZGV2aWNlX2lkW1RBUzU4MjVdIH0sDQoJeyAiVFhOVzU4
MjciLCAmdGFzZGV2aWNlX2lkW1RBUzU4MjddIH0sDQoJeyAiVFhOVzU4MjgiLCAmdGFzZGV2aWNl
X2lkW1RBUzU4MjhdIH0sDQoJeyAiVFhOVzU4MzAiLCAmdGFzZGV2aWNlX2lkW1RBUzU4MzBdIH0s
DQoJe30sDQp9Ow0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
