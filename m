Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E0831715C;
	Fri, 17 Apr 2026 04:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776398992; cv=fail; b=gNkvh1icMhgaCG521vjQVGGCnaQSkP0LhLIktlJrhU0BViqvbP0vbtB8lY0HOBpszh1UBXjJeAo4T5imVdBG9o3YS06mnmyg2F1YbYQbKnX3HtVHcIVjWz7vxP4eewQ46eHINnxMz71TCC6mL7F35mfl21y2TGo17g8AhAXv+l4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776398992; c=relaxed/simple;
	bh=HbjKw6CaT17MUdvKTiY4TzmHSFtGs6fD6FdsDaPKHs4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eYYTqTbkeNiP+iRu2WBjuwM4eHVpcf/tOsrd8/Dsxtv5gyFqPUKFX2cHK/qs9U7ym1rv9sYv5C0urzFYeodcpGIoMPuN4YHfv8Bxe8Qwe1ZsBQY82mCQeAtCr7dDIozeWAH0U/cyYHu8UtwcMDmsym9cgzje45g/7JcDX7l9cKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pHAc+87H; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pHAc+87H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IA8ksvBRWE5DlS4cIkzWjbcTuD0mv/V/Z4FlmFw465pKStrgE4G/MxTVAXPeS6W3HMNKe+bJkcdCCujpiVb0Kz1udmlKKLAX5ocHl8vO3VVDl+U66wuO9pR4tayNFNT9G9TEX/EiOV8w7lVR46CtesjeaFBfEkKAEwotKABXbeyyn0XBMgYhLFLv+lqLJwS6ur3wb/u3i7K1aR/DqkQOQMpEThLB/uGwmbuDRw0Tq7NOG9PLZSGIimHe0HUJSzQ34kH7VC+yiiFgItYOYUaNtGMJQohu0ilqJQ8/4v52ACNGktlWjqRwuvLpp80dXjPQ0Ev1BLow9LHSl7l9qcYptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbjKw6CaT17MUdvKTiY4TzmHSFtGs6fD6FdsDaPKHs4=;
 b=f9s8ymU3+nGkaWU45EfbvamYraRcArQM3VAtyyv/uP/DXndQ7HiVys7iE0HDU8SFNZQoxxJFYJxP8QxIAnR0MtJ3jJEmNf8Xcr84FDYrj4QAonwbUW772iGOYJqtDUcub/LmEZ3g5Sr6hhn1xK3LDivy0FaH2Rs9RDcw3J5fNqsVRqX5Z6fCPh7Ii/TzIL89Kx6XxqoY0z+mWQWUBqPxFvGsN4NqcSb14VjphIpTEhZDwKCwg7H6TgvXsaeB20EtimEhwQh5mJRwgDLrRFMcFOwCyjnb7yR7INgAqRTRqFGFSiLr2SOxPbCN2YksaT582hxqyIGn1FzdpF+mWdpRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbjKw6CaT17MUdvKTiY4TzmHSFtGs6fD6FdsDaPKHs4=;
 b=pHAc+87HdjeA+3iGno4pctapZEH+ZUEDJiV8OnafUGL+zAquJi9UG8vmtOnLc+HC9gl9a8jJx3/4HZUDXdNNV6ZyYPGOxXhpMH/qrfkty3kO1wrbgqPcG7o3G/UOfpNeBadm+v/W1dl/erggj1SlI769mldnoW4ArjzuQB8waSI=
Received: from BY5PR17CA0023.namprd17.prod.outlook.com (2603:10b6:a03:1b8::36)
 by SJ0PR10MB5859.namprd10.prod.outlook.com (2603:10b6:a03:3ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.49; Fri, 17 Apr
 2026 04:09:46 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::c7) by BY5PR17CA0023.outlook.office365.com
 (2603:10b6:a03:1b8::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 04:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 04:09:46 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 23:09:46 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 23:09:45 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Thu, 16 Apr 2026 23:09:45 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "ckeepax@opensource.cirrus.com"
	<ckeepax@opensource.cirrus.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>, "Xu, Baojun"
	<baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>, "Kasargod,
 Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha" <v-hampiholi@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH v8 1/3] ASoC: tac5xx2-sdw: add soundwire
 based codec driver
Thread-Topic: [EXTERNAL] Re: [PATCH v8 1/3] ASoC: tac5xx2-sdw: add soundwire
 based codec driver
Thread-Index: AQHcyPQnXSI7n/AsiUyj3YlPwPLsarXeyv0AgAPVEzA=
Date: Fri, 17 Apr 2026 04:09:45 +0000
Message-ID: <b86dab1cf42d4238afd96c1d56757054@ti.com>
References: <20260410141251.5563-1-niranjan.hy@ti.com>
 <b1970c45-0dd5-476e-88e6-a5eb1b7ee10b@linux.dev>
In-Reply-To: <b1970c45-0dd5-476e-88e6-a5eb1b7ee10b@linux.dev>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|SJ0PR10MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 018db48a-4f76-4320-ec1a-08de9c372989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	72u7jRTam+kC+WYd2YGgACFiZPEPHuyuQlQYJ8khn645cBYo/vdDSWUiWID/cTqHps6EPbxYEUVNP6Rt9EUPMWFsJPLDwzQNeZlIIKTsO4PF64kRrYik4tjmsXY2VIUFFFgbcuQ6f8q/JBcTXv8gqroOGkOaQaD/zO56zeQfo+Qw5apNAATT3oUNzS/N4e2S7ts9/mU/PbVS+zB67FFA0cDUunFjmd+0cbg9e0wOsBZAloSnVjfGB4HRrrD3noXiDCEXAaaFNufizZIW5Zt9YXBpUa9b8j7/cBWSwlyRtLK2qMgiB7Ec8AF8TxJhxx7j0yqMiVm74hiFZMj4NXVg5OsWX4TYvhe4fqrYQn70eYFJv0oVmpJbn7OCW4e+oVj3SwuNCq/yS5qrOjqUOXvrallsou8zsMI5MZpINq7Wr8zM1YJuVbUv1YN12ITZ/6K5Mr77T75t4KoKA9DoBfh6/GaRdv+vVj6/oL0LRz9+mBYIe9c8EKDbMEWMUAH7o+ywSO89GrUHMFol6d9y87JCsMRYtvhayh7fEB/4b0isOUqhDIk7fQNQa3T8UqUiTYrt2BYHoQSCfSbGPH/6rUarEGdNNCNug0BC4zl6Kj7bwLdkzKw2uPJYNXvgNGoRT169IeQYuviNFlNx08F8F1XMRA2KM1/JkGRrX+0rTV8JN+4hEQyaGeVKqvmnJ78NRTlaE1mJmHJsex0qGGkna3hkAILm0fwhW7l3wkq6taJJTswSq7COqU0LnbKSoHxTiNnEX7oZ0fKpx8ukZ9T7qr6Piw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YoWlqlBMKyq6obYwvKKqANiJ9dY7iK5FMS8/+afrD7JAV/yMiZd8rZCu91fUS1KHq6YztmK3zV93iAGEKpKOap3O9aegp5LgpVnkVv40FYIS0QaJmK7nuPmt82jsFx2DoF6GNQC1pgf+6rT0Lcj3+PqNPkAjCSihVIbUsS72qm+tMhlFhnT99rb37HQMKbKh6OTWU8TXvQvcvnczlaKrn06eJPpWswiUKGMO77xp923+q44Lsuk7VpJRQ8ZaN7VmMKwoIF3lKNCrm9rBSuYqQreY+yiQ2KrhdQklrY96WQQorPmU/qJj58kB/EkTfAJE8q8yCkaY4JgSjzWfYPL3VVVsr8/+3+G8DOBB17O9xrqHJbF2VVOuX+y1fHwYgqLKHeFoVxYyEHVmYiY/lgnxDgdf6ZxNBAaiKFEujnusnQX9alo3KA/dB1UwJxCcQTbu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 04:09:46.5914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 018db48a-4f76-4320-ec1a-08de9c372989
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5859

PiBPbiAxNzoxOC0yMDI2MDQxNCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjggMS8zXSBBU29DOiB0YWM1eHgyLXNkdzogYWRkIHNvdW5kd2lyZSBi
YXNlZCBjb2RlYyBkcml2ZXINCj4gDQo+ID4gK3N0YXRpYyBpbnQgdGFjX3Nkd19od19wYXJhbXMo
c3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sDQo+ID4gKwkJCSAgICAgc3RydWN0
IHNuZF9wY21faHdfcGFyYW1zICpwYXJhbXMsDQo+ID4gKwkJCSAgICAgc3RydWN0IHNuZF9zb2Nf
ZGFpICpkYWkpDQoNCj4gPiArDQo+ID4gKwltdXRleF9sb2NrKCZ0YWNfZGV2LT5wZGVfbG9jayk7
DQo+ID4gKwlyZWdtYXBfd3JpdGUodGFjX2Rldi0+cmVnbWFwLCBTRFdfU0RDQV9DVEwoZnVuY3Rp
b25faWQsDQo+IHBkZV9lbnRpdHksDQo+ID4gKwkJCQkJCSAgIFRBQ19TRENBX1JFUVVFU1RFRF9Q
UywNCj4gMCksDQo+ID4gKwkJICAgICAweDAzKTsNCj4gPiArCW11dGV4X3VubG9jaygmdGFjX2Rl
di0+cGRlX2xvY2spOw0KPiANCj4gSSB0aGluayBJIHByb3ZpZGVkIHRoZSBmZWVkYmFjayBzZXZl
cmFsIHRpbWVzIHRoYXQgdGhlICJTRENBIHdheSIgaXMgdG8gd3JpdGUNCj4gUkVRVUVTVEVEX1BT
IGJ1dCB0aGVuIHdhaXQgZm9yIEFDVFVBTF9QUyB0byByZWZsZWN0IHRoZSBpbnRlbmRlZCBwb3dl
cg0KPiBzdGF0ZS4NCj4gSWYgdGhpcyBpcyBub3QgcmVxdWlyZWQgZm9yIHRoZXNlIGRldmljZXMs
IHlvdSBhYnNvbHV0ZWx5IHdhbnQgdG8gY29tbWVudCBvbg0KPiB0aGlzIG5vbi1zdGFuZGFyZCBk
ZXZpY2Utc3BlY2lmaWMgc2VxdWVuY2VzLg0KPiANCj4gRWRpdDogeW91IGhhdmUgYSBsb29wIHRv
IHdhaXQgb24gQUNUVUFMX1BTIGJlbG93IHdoZW4geW91IHdyaXRlDQo+IFJFUVVFU1RFRF9QUyBh
IHNlY29uZCB0aW1lLg0KPiBUaGlzIGRvZXMgcmVxdWlyZSBtb3JlIGNvbW1lbnRzIG9yIGEgY29k
ZSBzaW1wbGlmaWNhdGlvbi4uLg0KDQpUaGlzIGlzIHRvIGVuc3VyZSBEMywgc28gdGhhdCBvdGhl
ciB3cml0ZXMgd2lsbCBoYXBwZW4gd2l0aCBkZXZpY2UgcG93ZXJlZCBkb3duIC4uLg0KDQo+ID4g
Kw0KPiA+ICsJZ3VhcmQobXV0ZXgpKCZ0YWNfZGV2LT5wZGVfbG9jayk7DQo+ID4gKwlyZXQgPSBy
ZWdtYXBfd3JpdGUodGFjX2Rldi0+cmVnbWFwLA0KPiA+ICsJCQkgICBTRFdfU0RDQV9DVEwoZnVu
Y3Rpb25faWQsIHBkZV9lbnRpdHksDQo+ID4gKwkJCQkJVEFDX1NEQ0FfUkVRVUVTVEVEX1BTLCAw
KSwgMCk7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X2Vycih0YWNfZGV2LT5kZXYsICJm
YWlsZWQgdG8gc2V0IFBTIHRvIDA6ICVkXG4iLCByZXQpOw0KPiA+ICsJCXJldHVybiByZXQ7DQo+
ID4gKwl9DQo+IA0KPiBodW1tLCB3aHkgZG8geW91IG5lZWQgdG8gd3JpdGUgUkVRVUVTVEVEX1BT
IGFnYWluPw0KDQouLi4gYW5kIHRoaXMgaXMgRDMgLT4gRDAgdHJhbnNpdGlvbi4gSSB3aWxsIHNl
ZSBpZiBJIGNhbiBpbXByb3ZlIHRoaXMgbG9naWMgaW4gdGhlIG5leHQgcGF0Y2guICBUaGFua3Mg
DQoNClJlZ2FyZHMNCk5pcmFuamFuDQo=
