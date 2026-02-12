Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2767654774;
	Thu, 12 Feb 2026 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913046; cv=fail; b=rxvMvf704cg/FAhtgnP4EtU2HFjEaLfNPjay2wAUrNGtacnY1KyuFYjGH7vjpvAi/iV7119RBQ/4uUEgHlZRm/kzRC01dH9WT310jAA1pruPnKC45WllorpFuzPaWFiJdnG6QiL+dfboto0mpPbV77azDEgLkv2LdlMpHcVCwXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913046; c=relaxed/simple;
	bh=TtQjYKI1soiAMvWSOBD/+SFAGfJCuLGRkwvnlZ4+oEI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SniBZYjy4OzBjMFnNpqMsaqHAekOBzLmYiiDwcIsjNxkr+xeZmgroG5Btc2cRHrQRePyLGA1Y84YUaqbiBzOkVefCxtOnvx0NhWoYoIwwDR4pbDQnxOJDo9mfuORJJ+tLjss4jeCM1JGOH+884juB1WV+kcNxpuiJRgC847JMCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DkN8aLJY; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DkN8aLJY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3Sjz15IdGHLJdcSk2V9Y7EDdCkMoalwXsXApq8FwVHDCbB72NfkzmmZj98IK0YbyN75qC89xpomWj9u3WEoAMkyQmXwPWgJeEfdTHUkQ4Dqlo5xJgMaxLCT1OO5W9bUuYzyl9Zlxip7OKbMDhqjTd//kTsYqG8Ntrgb8L/ISYiP6WpfWKarY+gb/6mHNqyoWhiJ3X8jYS7yUNWI3pZUEqHASBJYC8OJ+GeWeclzPB9kqF2V+BaLjwRKLL8fWGy4vgUQgZLb8TlkpgwqAy4izaFKiPallL8aye26xMnLd9BJh3UAoHcojaPwtnFpxBuQrU4LUm/Os95jD3t3QYvrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtQjYKI1soiAMvWSOBD/+SFAGfJCuLGRkwvnlZ4+oEI=;
 b=M5g/VCq3CHigaBZDdm9+94R3il8j2UlmWEJ4B3mxO3aFXkQwK5x71DTKSCGd0NvvxB09/h+mK1GhJxs0vDnucnIH1qSOFpsolxXGlTuKcx4t0RKQjEA6Mst9qfXyRvMlgyu6fMTczMTInKDyIPiIILjbudsYpqGVfBz0ajXRqzA/kyKlny6s2rIt5+TGG9UxhcfSrOoLmDgl+QqN+cb1Q7/r7f1s4xiWcjoCTQSAHrODGx91dHIu8VY1n9Xs73crPKnDWjH8PwTzn9suO5NDINgJ8owfJUR1+qFRdcRcpX+lQ4sC07Nv2LwnMsGekm38fAICotwcTESxh8Iu85hRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=opensource.cirrus.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtQjYKI1soiAMvWSOBD/+SFAGfJCuLGRkwvnlZ4+oEI=;
 b=DkN8aLJYuihTLM/6jpvzYCMtM17XVcd6bheRvq6gWVdKS6CY7G35CoVSE6Pi8SLmFrnxsbjFdpU4FzBwkRdguplkLqqwx+rq19G9xLuQjLXEtmiX5ysQQE4LELF2t5EUvk/W+A/9Yluhuj2FOfjLF7TRNeKRIWKaWW7agQJwkJ4=
Received: from DS7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::8) by
 IA0PR10MB7181.namprd10.prod.outlook.com (2603:10b6:208:400::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 12 Feb
 2026 16:17:19 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::6a) by DS7P222CA0016.outlook.office365.com
 (2603:10b6:8:2e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 16:17:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 16:17:19 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 10:17:09 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 10:17:09 -0600
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Thu, 12 Feb 2026 10:17:09 -0600
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
CC: "broonie@kernel.org" <broonie@kernel.org>, "ckeepax@opensource.cirrus.com"
	<ckeepax@opensource.cirrus.com>, "shumingf@realtek.com"
	<shumingf@realtek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "Ding, Shenghao"
	<shenghao-ding@ti.com>, "Xu, Baojun" <baojun.xu@ti.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kasargod,
 Sandeep" <sandeepk@ti.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1 RESEND] SoundWire: Allow Prepare command
 for Simplified_CP_SM
Thread-Topic: [EXTERNAL] Re: [PATCH v1 RESEND] SoundWire: Allow Prepare
 command for Simplified_CP_SM
Thread-Index: AQHcmn2OcKW+aGX7D0KL+1y6lTO6NLV8jjkAgAAHBgCAADHsgIAA7mUAgAGKLwA=
Date: Thu, 12 Feb 2026 16:17:09 +0000
Message-ID: <54a891e5ee36487d9b6665cd73a19af7@ti.com>
References: <20260209070905.10749-1-niranjan.hy@ti.com>
 <97872c17-73c9-4484-9f8e-373ed9a59a25@linux.dev>
 <87773927e37c4d70862c5f047431c7b0@ti.com>
 <e9e27355-a3d1-4ae2-aa6a-da47c6bced1f@linux.dev>
 <5066fa12-3ac1-4619-8fbe-62d61f9d446c@opensource.cirrus.com>
 <5c8a4d68-0f43-40d1-971f-7d1f4f55eb5c@linux.dev>
 <286c2158-5f53-42a2-a04d-e9bed3e7acf0@opensource.cirrus.com>
In-Reply-To: <286c2158-5f53-42a2-a04d-e9bed3e7acf0@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|IA0PR10MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 41512645-6beb-4ee9-de08-08de6a5231f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDI4MHcwbWhxRUlYb3BsNHNGNW43WHpVQUxudXBJbnJuVzZkQ0tNU1BJV05S?=
 =?utf-8?B?di9LVnlnSTI5WVJ2dTNLdmV4VHZ2VmYrTmd2ZHUrOHd3eENGSWVXR0hKQ21k?=
 =?utf-8?B?cDFjR28yd0FNRWtSeVFpcGNBWXQvVS9JY2ViamxVU0NiTzlZUWVhcDZHVytu?=
 =?utf-8?B?OHIzYSs5dmVrR1B0WDEzUzFzN2F5U1Z2bEk3cXlQeDVKQ1FkaHJKWUdPb1FE?=
 =?utf-8?B?b1FRSXpOMWlIY2t3cG9NLzJQdGkrcVRPTU5hd1BoRXlCSFhVa0RGTEMrNE5F?=
 =?utf-8?B?NGZPTEJHck5iUFpJOUlXMktlQlhuMnNWWUw3cmh3RHBlaHZMMXlLOFBPUmhn?=
 =?utf-8?B?Y2pLTlVNSjh4L2NiWWp4ZmU1LzIwS0JKM0Nxb3NJWHdyam9mSkVXRkFzdWhs?=
 =?utf-8?B?QlBnODJNZ2c3NUVaMFM1NEZoUnVuWjZhNTZ0bG1WTnhpUkYxbVJJdFYrb0No?=
 =?utf-8?B?bVFESXkzZURqa3J0dlBNd29xZVVQaWNJbCs2ZURKLzBRVXRDWS9TOUczZzRL?=
 =?utf-8?B?SXRtZmFUdE5RMTAzVHNSL1hMTW9wUTNaaXFHZUlFZEdDY1NuSEhXRjhjSm9Q?=
 =?utf-8?B?S1o3VzVLSlNieWN1RVJqd1dQTTRyRG1vc1lXMW1MVWxJSlZPQkpoMCtTRWh0?=
 =?utf-8?B?Nm04U3lCZzlhc2k5ZHhYMnRuM1RGUVlYUytXMlVkSVN5dU1OZVZmdDh4Qzcr?=
 =?utf-8?B?dlVWbjhqc1B6eVFLYjgrSllkMUI3d2tNOEo3QWZiU2RRR0IzY0hMUitkNXMz?=
 =?utf-8?B?UW5GY0VKYWdMSUNPeFh3cGpXYzZ6dGlDczcvS29MN1FmRERlMzdpOWJtcWM1?=
 =?utf-8?B?dkIvcE9mbVRlNUdIWTF2MEtZS0ZaQWh1RmZwaThTaHpqdDFoRVp4UG9PZHhK?=
 =?utf-8?B?WDl4eDFhVEVpSVZXNEFLUE14by9uYzJEa241cmlIaXpZSU5Ua0dxbWEwQktr?=
 =?utf-8?B?N3VwaE5zQ0tqYUVpM2pNczFoT3ZQS0pUK2szOEFHUjdtaWxQUEJBTVQwbEtB?=
 =?utf-8?B?aC9IZHJwaC9PYVlRTU51aE40NEMweFFzR2tqekgweGZRM01vMHlQV2xVaVUv?=
 =?utf-8?B?Wk85YmtzeVlLTWo3R2kreUZLcjlreEkrWEk1TEg2ZEVweXBKclR3SzRCS2hS?=
 =?utf-8?B?bmt2M1dQNFJVbTlBVUJtdGtraHdwMWFrR2orRDMxMEhmdlBkNlVoMW1SeXNy?=
 =?utf-8?B?NW43TkVSd3B1YnYyQWhiZWpmMFM4L2l5VWxUSWtXUWhkRVp6SDB2WVlOTzQx?=
 =?utf-8?B?Vk50UjhmMmh2V0pXSFh6bnNMTnlEZWQrRHFmR2piejRXaXlielZ5VVJXZFhX?=
 =?utf-8?B?akYvQ09hMHFiRjJlamFEVFluU3lRaHNQeW9vSTBBTCtYSWpIZDRqVGhzZEhu?=
 =?utf-8?B?Uk5VZ1cxdW5yWFpRTUZBaXR2N3hZelBpbWhxODBGUTZuOWRBelZNYWE3TzFW?=
 =?utf-8?B?Nm5XRkNWVVBIRWpPaDhJYlYvNWJiVU12aE1FR3lWcnNNUVh4aHduMDJvMnF5?=
 =?utf-8?B?Ky9HYmw1UmtGcWVRN0U1NDRyaHZaTTVVYUp2RGFWSjBXbExzSDJlZnB5aHd3?=
 =?utf-8?B?VkFOSFI2V3BhRlZEOUswb3pCbE9PNCtuaVErTDVOd25MMFF4azl0bC83UkxF?=
 =?utf-8?B?UTFkSWx1SE9YdFpUQ0RRRG5VQ0xDc3Q0ZlFzQnUxN1lNVUM2OXJOcnhLR1ZU?=
 =?utf-8?B?bVluUnN6RmduRkt1aW96dTBYaU5OcHcrblRDMzBNNGtOeFVjK1p3ZmJYbDVG?=
 =?utf-8?B?M0dob0IzaldDTzlNSzNPSnpCdXljZ0ZRZFJidzJvemQrVkhxWVk0WlJnRUhT?=
 =?utf-8?B?WTdCZ0VRQzNOakxNM3FUMThQOWpHd1JFVGdmTEdEVGo3TzRQcGZ0UHdDVSts?=
 =?utf-8?B?R3hKbm9xRlorQm1uR1k4L3ljZk5ZNDRkbVZXeStmZDVzYlBVeEwwRDZGNWh6?=
 =?utf-8?B?djN2REZGM0lJSDA3dXNIZWpCZGNIdzE5cXV0QldHclkvOFMzVk9tSkt3Y1VF?=
 =?utf-8?B?Y0RYaXJHUmt5THlCaVJrZWlMd0VuUnBGY0FHS1VUV0IrbjhsSEhUQy95d3NB?=
 =?utf-8?B?d1k3NmN1VnBlTFhWZFNHOXMzd2pNalF0OUFETVdwNllvSVh3bEJkUVBwc1ZK?=
 =?utf-8?B?MTFlUFNCTUJhRUgyYnJQa0RTNVdOYURjQ0tjQUZpQ0ltajZJSE1veUI1SE95?=
 =?utf-8?B?ekxjMG9QNlVHK1hrRW8xYXp6cDZ0L01jSXp3QTl6RHFJcGpBUXA0OElPSUtZ?=
 =?utf-8?B?ejdDMEIwakVVOWl2MGszTTZMeG5RPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eBtIu8og4uG1Y0LFiJ8q6TQ2TW3l9s/typ6mmMP0dmyh8Fbv9ueDl39oMtVhdVuLTI4BIIZJASOZtM0B+iHfADuBRdywupcoOtbTJ6DCiGC6SXmvNrXlaeuJUTpG+uGS3Ge4alxU4P1PlawbFLxwnVnSzy0MC2aZAgUT1+cnORkCaXGOxkeuU67KN2xmf5XWOBd0JLQtMDvnbTc8UVZMFHX8gyScQentriTqxgU3aifKt4KIGZ5ujnBcljWcOc4TmqElKYCZ8gyvrWm4UArqAhn5ZYQVAIR9vvhVVtoOPTWMAweJFWSlOC9x0/K8rxKY/efwcRdHdInX9DrzkPxYWKvHdI/TmhmCrdGxTWk9mMjCvHmaaWutgTdgIL5CuWgADTaX2Er8gzvHnlFg4lGyfIKCA1SJQK/g7j+mg3VQP5X1Rlihiii6EcNC8amD4vjd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:17:19.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41512645-6beb-4ee9-de08-08de6a5231f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7181

QXBvbG9naWVzIGZvciB0aGUgbGF0ZSByZXNwb25zZS4gDQo+IE9uIDIvMTAvMjYgMjI6MzQgUGll
cnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4gd3JvdGU6
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgUkVTRU5EXSBTb3VuZFdpcmU6IEFsbG93IFByZXBh
cmUgY29tbWFuZCBmb3IgU2ltcGxpZmllZF9DUF9TTQ0KPiANCj4gT24gMi8xMC8yNiAxMjrigIow
OCwgSG9sYWx1IFlvZ2VuZHJhLCBOaXJhbmphbiB3cm90ZTogPj4gT24gMi85LzI2IDIwOuKAijEz
LA0KPiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLuKAimJvc3NhcnRA4oCKbGlu
dXgu4oCKZGV2PiB3cm90ZTogDQo+IE9uIDIvMTAvMjYgMTI6MDgsIEhvbGFsdSBZb2dlbmRyYSwg
TmlyYW5qYW4gd3JvdGU6DQo+ID4+IE9uIDIvOS8yNiAyMDoxMywgUGllcnJlLUxvdWlzIEJvc3Nh
cnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4gd3JvdGU6DQo+ID4+IE9uIDIvOS8y
NiAwODrigIowOSwgTmlyYW5qYW4gSCBZIHdyb3RlOg0KDQo+IEFyZSB5b3UgcmVmZXJyaW5nIHRv
IHRoZSBEUE5fSW50U3RhdDo6UG9ydFJlYWR5IGJpdD8gSU9XIGRvIHRoZSBlcnJvcnMgZHVyaW5n
DQo+IHByZXBhcmUgaGFwcGVuIGJlY2F1c2UgdGhlIGludGVycnVwdCBpcyBub3QgZ2VuZXJhdGVk
Pw0KPiBJZiB0aGF0IGlzIHRoZSBjYXNlLCB0aGVuIHlvdSBzaG91bGQgYmUgYXdhcmUgb2YgdGhl
IHRocmVhZCAic291bmR3aXJlOg0KPiBzdHJlYW06IFByZXBhcmUgcG9ydHMgaW4gcGFyYWxsZWwg
dG8gcmVkdWNlIHN0cmVhbSBzdGFydCBsYXRlbmN5Iiwgd2hlcmUgaXQgd2FzDQo+IGFncmVlZCB0
aGF0IHRoZSB1c2Ugb2YgdGhlIFBvcnRSZWFkeSBpbnRlcnJ1cHQgaXMgYnJva2VuLiBXZSBkbyBu
ZWVkIHRvIG1vdmUNCj4gdG8gYSBkaWZmZXJlbnQgY29kZSB3aGVyZSB3ZSBoYXZlIGEgcG9sbGlu
ZyBsb29wIG9uIHRoZQ0KPiBEUE5fUHJlcGFyZVN0YXR1czo6Tm90RmluaXNoZWQgYml0cy4NCg0K
VGhhbmtzIGZvciB0aGUgaW5mby4NCg0KPiBTbyBpcyB0aGUgcHJvYmxlbSBpbiB0aGUgaW50ZXJy
dXB0IGdlbmVyYXRpb24sIG9yIGlzIHRoZSBwcm9ibGVtIHdpdGggdGhlICdOb3QNCj4gRmluaXNo
ZWQnIGJpdHM/DQpCb3RoLCB3aGlsZSB1c2luZyBGdWxsIENQX1NNIG9uIGEgc2ltcGxpZmllZCBD
UF9TTSBkZXZpY2U6DQoqIEZpcnN0IHByb2JsZW06IHRoZSBpbnRlcnJ1cHQgd2lsbCBub3QgZ2V0
IGdlbmVyYXRlZCBvbiBhIHNpbXBsZSBDUF9TTSBkZXZpY2UuDQoqIFNlY29uZCBwcm9ibGVtOiBl
dmVuIGFmdGVyIHRpbWVvdXQgd2FpdGluZyBmb3IgaW50ZXJydXB0IHdpdGggaHVnZSBkZWxheXMs
DQogIHdlIGNhbid0IHJlbHkgb24gJ05vdCBGaW5pc2hlZCcgYml0cywgY2F1c2luZyB0aW1lb3V0
IGVycm9ycy4NCiAgSW4gdGhlIGN1cnJlbnQgY29kZSBmb3IgZnVsbCBDUF9TTSwgJ05vdCBGaW5p
c2hlZCcgPSAwIGlzIGEgZ29vZCByZXNwb25zZSBldmVuDQogIHdpdGggdGltZW91dC4NCg0KPiBJ
ZiB0aGF0IHdvcmtzIHRoZW4gYW4gYWx0ZXJuYXRlIHNvbHV0aW9uIHRvIHRoaXMgcGF0Y2ggd291
bGQgYmUgdG8gcXVpcmsgYWxsIFRJDQo+IGRldmljZXMgdG8gdXNlIHRoZSByZWd1bGFyIHN0YXRl
IG1hY2hpbmUsIGFuZCB1c2UgdGhlIHBvbGxpbmcgbG9vcCBhcw0KPiBzdWdnZXN0ZWQgYnkgUmlj
aGFyZCBGaXR6Z2VyYWxkLg0KPiBJIHRoaW5rIGl0J3Mgd29ydGggZXhwbG9yaW5nIHdoYXQgaGFw
cGVucyBpZiB0aGUgUG9ydFJlYWR5IGludGVycnVwdCBpcyBub3QNCj4gdXNlZC4gSWYgdGhhdCdz
IGJyb2tlbiBhcyB3ZWxsLCB0aGVuIHlvdXIgc29sdXRpb24gd291bGQgd29yayBidXQgbmVlZHMN
Cj4gbW9yZS9iZXR0ZXIgY29tbWVudHMgaW5kZWVkLg0KQ3VycmVudGx5LCB3ZSBoYXZlIG9uZSBk
ZXZpY2Ugd2hpY2ggbmVlZHMgdGhpcyB3b3JrYXJvdW5kLg0KSW5pdGlhbGx5LCBpdCBsb29rZWQg
bGlrZSBhIGdlbmVyaWMgc29sdXRpb24gdG8gbWUuIEhvd2V2ZXIsIGlmIGl0IG1ha2VzIHNlbnNl
LA0KSSBjYW4gaW1wbGVtZW50IHNkd19zbGF2ZV9vcHMtPnBvcnRfcHJlcCB0byBtYWtlIGN1c3Rv
bSBjaGFuZ2VzDQpmb3IgdGhlIHJlcXVpcmVkIGRldmljZXMgb25seSwgaGFuZGxlIGFueSBlcnJv
cnMgYW5kIGRyb3AgdGhpcyBwYXRjaC4NClBsZWFzZSBzdWdnZXN0Lg0KDQpSZWdhcmRzDQpOaXJh
bmphbg0KDQo=
