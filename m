Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AAB3DEFEC;
	Thu,  9 Apr 2026 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746020; cv=fail; b=LxE4EDzZdUsy1T/+hrYK6i36XV8mZgP04AwKomEJ+FxxWPM3WxlrmsNRqCXOEwOxqpBuWcLFNiokwzEnPLyu1pZ/cZLWq+HKKPVubh1mXPebsgUnI+CC6MERgoM3n7uowUYw1/guHRRII+Nh0BrJh/igRikZZ56QdmmdUOOn7mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746020; c=relaxed/simple;
	bh=l8FDFH2wpkkonba4Ara5MZZWrTlkCKDMPTnmXrEKGTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qGDvo4GOjxxzIt4MBl8gtdZf2buRk9Wlxww8+OZc0BubvPCQKrrwofrP3HuH50nQjZZwit0uGaqOhb78us6/L+qyUsuWVChg650v1dFK7+vgdz7hkh8fy3TqC1Ln85GVAVZnQNj2HLgKnJ1AEFTC5kRdCMpn1COy/pk5kGf3JqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GRb2ZFQ5; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GRb2ZFQ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoWeCUIPbB4Jh5NzF8Pclxr5h4diVNHKcQHzntckhXbq18Z040l2obnvCJw78jebE9or5cvc3GRdyEahbvtpboIj2qzt+fXJyC6Ki6M8XUu3QtRH4vopYqztnJA99R8UXM8AuQFjC/ahcnPXGvODysvFq+JAQcKLuMhzzLCGFD0v4MZu7ysA5m8Mpp0Dxr1MaiHYQVV1/Gh4biel1CDzZJIY0CPDEiO7mUpb7QX3fID3uSVLiSQxwvtGgFL+isUdPOMAAwKfc/GE9UhbHv2fKf8xNsUePkrTYyZusL+Avj20iCTLFSrI5R718f+eRFXfD6TF+scTCOpIZ3+Jrm93Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8FDFH2wpkkonba4Ara5MZZWrTlkCKDMPTnmXrEKGTI=;
 b=Tw5yPx9Orir+8lG0OzOkTZspDUY6INr+PIERZiBOKDcMI4QA0vz+9Uonz17FYT5oNmFmHaEHQDcRWNBeNXW3jWaJpMIl0krD9DJD1pyCw3RFex6bdMG1b6DwIRf/rO6ZJ1y7BTccZnS3wpI3WhFwxATr6uhFnCUYO0JYOWxDa1l3ymqf+siE32az+zduAwiFDWruiFHr7Qpccwv9emZ1oTA12dOGXmqGzPw0IhsIlZU86krRMQvZEYsrcd7t8ENzhE2i1rx3yIhX6KyG7i5Ptzvu7KhH8fBxkkXXiwFl5GxgZkTGRhEpjoTXkE1GTZKLYice4X0TaGj+11ZXceLwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8FDFH2wpkkonba4Ara5MZZWrTlkCKDMPTnmXrEKGTI=;
 b=GRb2ZFQ5TBEttadd8XToX8Xh2BqcX5y/hCgEj4VD4QHbjXM0CcPqCB7YmHHeAoDbnHRgfJks2WtlBFvXZa86xxpdmM/8uRRgAFT+GaQ9Ipusuv1LE2AG2nrApGc40af69mogUJD25XhQdGf6QtiS5LUcaUB1JSkwT5qj55fMi8c=
Received: from BN0PR08CA0015.namprd08.prod.outlook.com (2603:10b6:408:142::31)
 by IA3PR10MB8733.namprd10.prod.outlook.com (2603:10b6:208:574::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 14:46:42 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:142:cafe::f) by BN0PR08CA0015.outlook.office365.com
 (2603:10b6:408:142::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 14:46:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 14:46:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 09:46:41 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 09:46:41 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Thu, 9 Apr 2026 09:46:41 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Xu,
 Baojun" <baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
	"Kasargod, Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>
Subject: RE: [PATCH v6 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Topic: [PATCH v6 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Index: AQHcx4j/qY1bn/PmDka84dWEJ/+mSbXWzZKA
Date: Thu, 9 Apr 2026 14:46:41 +0000
Message-ID: <2dce534e5d8d46a7b090b1ecc9195d8d@ti.com>
References: <20260408185212.4605-1-niranjan.hy@ti.com>
In-Reply-To: <20260408185212.4605-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|IA3PR10MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 7098aae8-b373-4110-a3fc-08de9646d078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|82310400026|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yhXoEAuvZMLV0/KdOJZQUto2KPKMqL5nw/jwWta+Edgmas4ddI+x3jMGGcqZwTgjMdnhABTMo9Dy07ClJogHZtKo+VJMBEZu+gQXExb+sharu4PHkmSH5NFtk0/ZPLgpJDeeQ6H4Y9doax46xtQUDX40NusAQRbIxI2yZdTr5EuRCZFlXGnTRjXoSh7FPTbqvM2qUm/T+mxfSsXFweqb1s/fd6/DlEdyWP//kVhqemfYk3WLViXuqL94Nnagcb30HpIV9OPUQ3j4Byz/sW7hPhYjSZQ8PfCaMmQ5bQn6jfkSQFcaYKtSi9MZNIgBETbgF4ScTt8ZNn3DNs22TfX7lIyDALg1opmXM9pL5Apw+tt6ntqKKMrcJyufQ0Qe6QypZRb14vJHVRPXjhte8tiNXmu8gIc1UxmP5YiEHAlQEnt1+Vji8T/ibf8IszBEGDwoPWht/EmpkcNnx9uJrTOIXnHUdNQyHsk+LLSi3di4DddXeXJv+HIcJtjmUiQasUU/tBGVOrAB0JaQl6otXg/QLDhNdNnbPdRxjm2jPL+8+PO8603eYe7VQ4eeneS6O9Zxbk6c2Q+J7jgiZMxVfHmAjbezlEQ7wFUifrN1oFbg7XDAtwUanqbbUpgMB0ZR34bqqmbEEjChQslzVPT9xuJk5LQrDGkCQV44su5CAUxulLiUMyw6mzJCVRlJV8L9ngdRQSF1MmGSWOjfFe+SwGSS6ZNJ4k0e9VsAUemjI0MeXHg8DguXwtDU3LlIkZ/xxw909+ZVVhw3FtBVeGfFzGFJKQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jFgux54j7QtMA39N0haFYBT6bOMucmfDV7m3AcpX9CwVLY/XZsaanNgTlm6oUudLm7p9C6WsOe5YXLONpu5zuJlBu49Fes5KWodD/iG97/gmM0/w/Udcs2oTqf3F5bt4O28tb6Nh8GFCLEW/meGcx47uNt1z5WJJGlRB5ApDToVsbaGdPca/GcobZ0Ds6yMRy4N+88I6hg7JnJHmf85EuOxsq7qfESkyMDqfaMvKVEKVAJtcui2Ml6vhjq8UTkWuL7BoKFqbz6PdwuviShpASmuXUt2kCqSRXFlIHCXMEtXtaIQN/Oz9ofMsJlrYwDvzf533ikwrzwsJwjTS/jbtpDlgrmpod3ktVc1mc1rwHOoC3m5r1LnETf/sFk8f6PSjjNdLr9jcc3zDF4gJKSjVI358mXuIrS7BtzC7lw+y4xj8WUUgu06zSRQXkTyF/t8Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 14:46:42.1388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7098aae8-b373-4110-a3fc-08de9646d078
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8733

PiBPbiAwMDoyMi0yMDI2MDQwOSwgSG9sYWx1IFlvZ2VuZHJhLCBOaXJhbmphbiB3cm90ZToNCj4g
U3ViamVjdDogW1BBVENIIHY2IDEvM10gQVNvQzogdGFjNXh4Mi1zZHc6IGFkZCBzb3VuZHdpcmUg
YmFzZWQgY29kZWMgZHJpdmVyDQo+DQo+ICsJc3RydWN0IG11dGV4IHVhal9sb2NrOw0KPiArCXN0
cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ICsJYm9vbCBo
d19pbml0Ow0KPiArCWJvb2wgZmlyc3RfaHdfaW5pdDsNCj4gKwl1MzIgcGFydF9pZDsNCj4gKwl1
bnNpZ25lZCBpbnQgY3gxMV92YWx1ZTsNCg0KSSB3aWxsIHJlbW92ZSBjeDExX3ZhbHVlIGFuZCBz
ZW5kIHVwZGF0ZWQgdmVyc2lvbi4gDQoNCj4gKw0KPiArCQlpZiAodGFjX2Rldi0+Y3gxMV92YWx1
ZSkgew0KPiArCQkJcmV0ID0gcmVnbWFwX3dyaXRlKHRhY19kZXYtPnJlZ21hcCwNCj4gKwkJCQkJ
ICAgU0RXX1NEQ0FfQ1RMKGZ1bmN0aW9uX2lkLA0KLi4uDQo+ICsJCQkJCXNhbXBsZV9yYXRlX2lk
eCk7DQo+ICsJCX0gZWxzZSB7DQo+ICsJCQlyZXQgPSByZWdtYXBfd3JpdGUodGFjX2Rldi0+cmVn
bWFwLA0KPiArCQkJCQkgICBTRFdfU0RDQV9DVEwoZnVuY3Rpb25faWQsDQouLi4NCj4gKwkJCQkJ
c2FtcGxlX3JhdGVfaWR4KTsNCg0KSSB3aWxsIHJlbW92ZSBlbHNlIHBhcnQgaW4gbmV4dCBwYXRj
aC4gDQoNCk5pcmFuamFuDQo=
