Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDA537C916;
	Mon,  4 May 2026 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887359; cv=fail; b=mLD0HRPfjhWtwMAlzDhYQ5vheT3DnUn3FLkdfFzmi5EvctzxS0oAllzzi0rMKM6g9BT3MJm4ECvoFaX8eeNwv3+zYKdvFo53l9VRQwf58958sux5liw1wliHAaSjnoUQDfyn8atLHQs4DrzQ9PhMilgB2lsSQStt/8d2Sv3mX+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887359; c=relaxed/simple;
	bh=qmm7ryooCi89yS0vOrSKltuDOFRos4zAa16z+iC+3Ik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ox9swgK5m50SDcIjcaHcmphZFrnB/oPBEUx0z+VIF/mv5/7IYR8DprGR9o0hr8lKCTw406Z7njHxSj4+nXsIUlolagMGc5JU/3qDFUNqyDn+Co25E+aLbdNAeACgxEnXCVz8tb+qEV+WZPBkNLvZOspbGN3rbhRNYekIdA/GRE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HuLALhdL; arc=fail smtp.client-ip=52.101.56.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HuLALhdL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtEb3FarQ43qfZHSVnXTloQGWqPw05AzILdWSclFlvI4IdsJAaQk8z9nDv3NaWNil0Dh5OUs7UW6aV/QCwEweIw6zxKYzSghCX5SbgpLZ2voDRV3u0LaTrqYscAzApKxNEt/wB0kSLcNv7xrm6xr1SlREWUxUtASS/9zDBGfoayXIDXCg2WIewLYbrenyhMReJ41YfoeNlyH3iLKxALQ9OYITfmjJkcPB64H3FC8Tf5SUY7TUKvHJoSuPbJR/Kq56tJ2SoNLDiXPRuf54j8JeH1uXGidrUf98OVognNLi9d9Jybz817KHu/lMH9nYw1/yqqsE6qeOKzHmweVe9z3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmm7ryooCi89yS0vOrSKltuDOFRos4zAa16z+iC+3Ik=;
 b=B6E+yqJY2x4ff+hCwKSRTM/Mp+OKilYdU374xHeDxEjdtXqTIsR0EAIic9890XSMvmekrZuHcwSpB+677WhCLiGozPbynYJZA8zUKZHU4646iPj9WDnjusrbk2Z/CZH9YhWYx5W/YjlP4MTfqRpf3Gh/m4de+7SYJzhoYxu/DQxQyr1xs9ShRBYmuH+BVTAwsloWcLK7tHSFyNSxpwIfDjshe9nYVxki0aqvZklGjbo0rWbAXBTc0huQ3DNWJ+vYoZBQNE+QmQF5rzcjWcqkkn8hRpTdn9YdYhfHFTzjJ978IfsLuNtecWQ32Oma8zbHhUkYAHoAHUZwBrBL7qBJOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmm7ryooCi89yS0vOrSKltuDOFRos4zAa16z+iC+3Ik=;
 b=HuLALhdLAu0T9qhrzgQJ6V2tJh4byV/+4kQGWIMyVXm18LxKz7c09rquSvVYwnOWQZer0E4rwGeNOpug//Pqq1Ya5fWPa06z2MDkvBgy7UNyVjU7w1AOWdSIYeawEAEliautqV8HENb2oXwx6kJyqszEtVaQGu3I2OQFh0INS2A=
Received: from CY5PR22CA0007.namprd22.prod.outlook.com (2603:10b6:930:16::21)
 by SJ0PR10MB6326.namprd10.prod.outlook.com (2603:10b6:a03:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:35:54 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:930:16:cafe::69) by CY5PR22CA0007.outlook.office365.com
 (2603:10b6:930:16::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 09:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 09:35:54 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 04:35:52 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 04:35:52 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Mon, 4 May 2026 04:35:52 -0500
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
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>, "Xu, Baojun"
	<baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>, "Kasargod,
 Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v14 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Topic: [PATCH v14 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Index: AQHc26lltPwKee1ZSE2Ja/SvA2QmHA==
Date: Mon, 4 May 2026 09:35:51 +0000
Message-ID: <392b3f5d49ee4b0b928959a27a712363@ti.com>
References: <20260430144554.1335-1-niranjan.hy@ti.com>
 <20260430144554.1335-3-niranjan.hy@ti.com>
 <1ad635b4-4641-4244-b07b-26e414df79ec@linux.dev>
In-Reply-To: <1ad635b4-4641-4244-b07b-26e414df79ec@linux.dev>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|SJ0PR10MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db2f2de-6ec4-453f-1eb9-08dea9c089e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rwWLHIqCCMmsNwoJKK37e7RPyT/lo5rj78AsTUBQnP6S9Q+5Qh6EG0oR2af1T8CBY/TtNrUJZRhEuMgTONhaExPXbW27EsFiwAeQ1eHK69DggEd39fIUCJCUvLo+4sZ/fUOhAiBUHFEczrpCP5Xc8d9zLTX6mj0O12e0JsIr0ex7HIaV9zz88tzw7DlggjipgWrEkTgVAWPT0ertUK7ihQh9HYi+3wTKHmRJBFXcFADR/WUYgfK9ZwP9TZZjAK8D/Q26dj13e52bDoS5ifavVkYCQrKLzn8R0JvqdGNbO27AGMr7ZKs7ygQqn4goANM1UAZIiyFlxoC2f1ev6aQGDeXmU2ev5Ig7CYLnkeVjTVwZd0DQgVaoa3ZkxjKkZSddjMI4AAPaKgDU+naCCGUg84op8Qnuu5yM94SVzj8GzRtpcSJ1otU0o6ObOGyLcUeknPMMl4BXM7DERlk9GrWUyW/k7HQn+HhwRVo0NbHXeqZm7orrtwWIyHdOb0UOP9LP83h27IM1w0S2+/x+Zf0DCLJ7x0gsE5HYkMCDtrA0rwWyjMmKFxrNyirj+2OJU5va1DSgTdLaLziquj5rUZR4P6TMIU6+mXMfi0uMKN9rgwunbd2XcQC3XQlwFkSa/w2PVzuk5tbJ8ZXI6xPqk0f9pYVKyHpApugwCkBfn5mH597Rfi0hxd+8B04aUYN3yILB660YsLeZQylj1hzZwF6sUT0rxVOlHfBkE7MPIkqoN+Q=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gvKjqzN9Aq3ZkYkl6BaIj48rQkh8KvmFkFnGGTqoW67amnh77tJzT2NPNY6Bhgppj9rlpZpf3agoPKFhmqnvOulReHupC809dbEMRlv8W1MrAy/hcTa5ATur2KNSFdVK6NMHjKLmrjv7IQQFA1wv9eo8g/vx/TMRTKJvrUBY2PACWSXjtIh6TVZ6Pp7JQ+VLTFfAvwT3nusGoDUC7d+BfnV3BpZdyrBfwno2/kY8vC4wPgb0Ts2I3f4cn1NWVsi1UbgmnVhcSJoyClhFklsDAkYlE0qObOl8dLJizwNk+VQVab2r9UoGd51jJiWW7U1HUlOYrbVASMBAwtIzkzwSn6HGpUz2I+se0GLeiw+HU/6h7UmLm3BBQaC8e/VhDE57JzhNgQXP6Z8F6WQ6CKSIt0nmRLxWEJXN2ymWI7cCJ1nhAVsmxWPipg7GjvZzjp9Y
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 09:35:54.4161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db2f2de-6ec4-453f-1eb9-08dea9c089e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6326

PiBPbiAwMTo1NC0yMDI2MDUwMSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjE0IDIvNF0gQVNvQzogdGFjNXh4Mi1zZHc6IGFkZCBzb3VuZHdpcmUg
YmFzZWQgY29kZWMgZHJpdmVyDQo+IA0KPiA+ICtzdGF0aWMgczMyIHRhY19jb21wb25lbnRfcHJv
YmUoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpDQo+ID4gK3sNCj4gPiArCXN0
cnVjdCB0YWM1eHgyX3BydiAqdGFjX2RldiA9DQo+ID4gKwkJc25kX3NvY19jb21wb25lbnRfZ2V0
X2RydmRhdGEoY29tcG9uZW50KTsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IHRhY19kZXYt
PmRldjsNCj4gPiArCXN0cnVjdCBzZHdfc2xhdmUgKnNsYXZlID0gdGFjX2Rldi0+c2R3X3Blcmlw
aGVyYWw7DQo+ID4gKwl1bnNpZ25lZCBsb25nIHRpbWU7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsN
Cj4gPiArCS8qIFdhaXQgZm9yIFNvdW5kV2lyZSBodyBpbml0aWFsaXphdGlvbiB0byBjb21wbGV0
ZSAqLw0KPiA+ICsJdGltZSA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmc2xhdmUtPmlu
aXRpYWxpemF0aW9uX2NvbXBsZXRlLA0KPiA+ICsNCj4gbXNlY3NfdG9famlmZmllcyhUQUM1WFgy
X1BST0JFX1RJTUVPVVRfTVMpKTsNCj4gPiArCWlmICghdGltZSkgew0KPiA+ICsJCWRldl93YXJu
KGRldiwgIiVzOiBodyBpbml0aWFsaXphdGlvbiB0aW1lb3V0XG4iLCBfX2Z1bmNfXyk7DQo+ID4g
KwkJcmV0dXJuIC1FVElNRURPVVQ7DQo+ID4gKwl9DQo+IA0KPiBhcmUgeW91IHN1cmUgdGhpcyBp
cyBuZWVkZWQ/IE9yIGlmIHRoaXMgZXZlbiB3b3JrcywgaWYgdGhlIGNhcmQgY3JlYXRpb24gaGFw
cGVucw0KPiBhZnRlciB0aGUgYnVzIGdvZXMgdG8gY2xvY2stc3RvcCwgdGhlbiB5b3Ugd2lsbCBh
bHdheXMgdGltZW91dCBoZXJlLg0KPiANCj4gSWYgeW91IGxvb2sgYXQgY29tbWl0IDAxMWUzOTcg
IkFTb0M6IGNvZGVjczogc291bmR3aXJlOiBjYWxsDQo+IHBtX3J1bnRpbWVfcmVzdW1lKCkgaW4g
Y29tcG9uZW50IHByb2JlIiBpdCdzIHNpbXBsZXIgdG8gZm9yY2UgdGhlIGJ1cytjb2RlYw0KPiB0
byByZXN1bWUsIG5vPw0KDQpUaGFua3MuIEkgd2lsbCBhZG9wdCB0aGlzIGZpeCB3aGljaCB5b3Un
dmUgYWRkZWQgZm9yIG90aGVyIGRyaXZlcnMuDQoNCj4gDQo+ID4gKw0KPiA+ICsJaWYgKCF0YWNf
aGFzX3Vhal9zdXBwb3J0KHRhY19kZXYpKQ0KPiA+ICsJCWdvdG8gZG9uZV9jb21wX3Byb2JlOw0K
PiANCj4gSXMgdGhpcyByZWFsbHkgdGhlIGNhc2UgdGhhdCB5b3Ugb25seSBoYXZlIGNvbnRyb2xz
K3JvdXRlcyBmb3IgdGhlIFVBSiBmdW5jdGlvbj8NCg0KQXQgdGhpcyBwbGFjZSwgSSBkbyBub3Qg
c2VlIHByb2JsZW0uIEJ1dCwgaW50ZXJydXB0IGhhbmRsZXIgbmVlZHMgZml4IHRvIGhhbmRsZQ0K
aW50ZXJydXB0cyBvbmx5IHdoZW4gVUFKIGlzIHN1cHBvcnRlZC4gUmlnaHQgbm93IGl0IHJlYWRz
IHVhaiBpbnRlcnJ1cHRzIA0KcmVnYXJkbGVzcyBvZiB3aGV0aGVyIFVBSiBpcyBzdXBwb3J0ZWQg
b3Igbm90LiBJIHdpbGwgZml4IGl0DQoNCg0KPiArc3RhdGljIHMzMiB0YWM1eHgyX3NkY2FfZGV2
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICt7DQouLi4NCj4gPiArDQo+ID4gKwloYWRf
dW5hdHRhY2hlZCA9IHRydWU7DQo+ID4gKwl0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0
KCZzbGF2ZS0+aW5pdGlhbGl6YXRpb25fY29tcGxldGUsDQo+ID4gKw0KPiAJbXNlY3NfdG9famlm
ZmllcyhUQUM1WFgyX1BST0JFX1RJTUVPVVRfTVMpKTsNCj4gPiArCWlmICghdCkgew0KPiA+ICsJ
CWRldl9lcnIoJnNsYXZlLT5kZXYsICJyZXN1bWU6IGluaXRpYWxpemF0aW9uIHRpbWVkIG91dFxu
Iik7DQo+ID4gKwkJc2R3X3Nob3dfcGluZ19zdGF0dXMoc2xhdmUtPmJ1cywgdHJ1ZSk7DQo+ID4g
KwkJcmV0dXJuIC1FVElNRURPVVQ7DQo+ID4gKwl9DQo+ID4gKwlzbGF2ZS0+dW5hdHRhY2hfcmVx
dWVzdCA9IDA7DQo+ID4gKw0KLi4uDQo+ID4gKw0KPiA+ICtyZWdtYXBfc3luYzoNCj4gPiArCXJl
Z2NhY2hlX2NhY2hlX29ubHkodGFjX2Rldi0+cmVnbWFwLCBmYWxzZSk7DQo+ID4gKwlpZiAoIWhh
ZF91bmF0dGFjaGVkKSB7DQo+ID4gKwkJcmVnY2FjaGVfbWFya19kaXJ0eSh0YWNfZGV2LT5yZWdt
YXApOw0KPiA+ICsJCXJldCA9IHJlZ2NhY2hlX3N5bmModGFjX2Rldi0+cmVnbWFwKTsNCj4gPiAr
CQlpZiAocmV0IDwgMCkNCj4gPiArCQkJZGV2X3dhcm4oZGV2LCAiRmFpbGVkIHRvIHN5bmMgcmVn
Y2FjaGU6ICVkXG4iLCByZXQpOw0KPiA+ICsJfQ0KPiANCj4gY2FuIHlvdSBleHBsYWluIHdoeSB5
b3UgaGF2ZSB0aGlzIGV4dHJhIHRlc3Qgd2l0aCBoYWRfdW5hdHRhY2hlZCBhbmQgaWYgdGhpcyBp
cw0KPiByZWFsbHkgdXNlZnVsPw0KPiBJIGRvbid0IHJlY2FsbCBoYXZpbmcgc2VlbiB0aGlzIGJl
Zm9yZSBvbiBhbnkgb3RoZXIgZHJpdmVyLg0KDQpUaGlzIHdhcyBzdXBwb3NlZCB0byBiZSBhIHNt
YWxsIG9wdGltaXphdGlvbiwgYnV0IEkgcmVhbGl6ZWQgdGhhdCB0aGlzIHdpbGwgbGVhZCB0bw0K
YnVnIHRoYXQgcmVnY2FjaGUgbm90IGJlaW5nIGNhbGxlZCBpZiBkZXZpY2Ugd2FzIG5vdCBkZXRh
Y2hlZCBmb3IgdGhlIHN1c3BlbmQgLT4gcmVzdW1lIHNjZW5hcmlvLg0KSSB3aWxsIGRyb3AgdGhp
cyBjaGVjaw0KDQpSZWdhcmRzDQpOaXJhbmphbg0KDQoNCg==
