Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCF52749CF;
	Thu, 16 Apr 2026 05:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776318822; cv=fail; b=NVuOPf5hKpElEUXUcYpaBnA3ijWOZva4Lz33eU5re4kqNVNGPbE8/j2AXtAOaBnyTGK+Rz++1bGsi6k3vhbZj5YSMevvbbr5G21iBOvKzSOsQhtN3y7iQ4MylXMvtpuVuuFR3mKLd+uErdw+sUwIIP5yo6/BQA1Lh7L9aBcNPPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776318822; c=relaxed/simple;
	bh=057OuDpabBZNhCslwTgZwhKks7Zxf2PAcBO6jWqE+k4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PpxemCunnx7XcVWqp1fOP/tZ6DnDEI4h5puvZCie1ehNM08TrAxH92FU8zdJHuMduYjqUXzXDp9nxpxSfszL7SlcKxcya5mWu0/KKUGKXIjDvtwkdhfXWsaWpM2wv3ToBr+d8/0FwNo+Z0YIk6/HRMOkIhGsfz5WLMclosS81Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tB2YEmtR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vzxBEt7T; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tB2YEmtR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vzxBEt7T"
X-UUID: 9954aef2395811f19a16598d5ca7f8ec-20260416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=057OuDpabBZNhCslwTgZwhKks7Zxf2PAcBO6jWqE+k4=;
	b=tB2YEmtRRTVmuDQ/3WVQPP2wOHD0CdgYik30xrRAGN0hBNwWqW09mP2H3arRm0SBw/47valjMOc1pIfFXat6GJhGfY2yQ2zRDZa5YNY7cwZmHrVrTgUqZ0dxFIXzweUa6MYdmCkKL1/MdBk8MoolV6HBSy7M/XCejnYAV4CmExY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a8a550e8-12d7-45da-bf29-49fdd423d6d3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3d37ed24-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9954aef2395811f19a16598d5ca7f8ec-20260416
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1828202270; Thu, 16 Apr 2026 13:53:31 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 13:53:30 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 13:53:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnrpWIO/WZ0n6ad4fApM7W/2POh3fDDSWxca0z+gJ/lDf6/kmeI68atfpfmjKgxaDBFYO5ibp8pcOWdbrMTI5xKctR0p2xyBjeKsUwtgujJj3wRmAI3vKYsa2B7DYP6D2eFZUsTzKFWW9NemRRZZf7qrC25yK0hrf+Gc0VGB5cOixlpFrD0RlT3m58BJwbUXMa5Q00ge3eLiuzESoOO4bAsvMrpcsX5kmTdNaPcHwJGg9EbNwXflst/aeXprUDGb+tnGO7COt2VS3hUaj084Jjv1MYlx1vqmHarltU49EfwgsHUEBZ+Pqk0JkhvMub5wgfsBFVtvoTiUjM3UWm0Tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=057OuDpabBZNhCslwTgZwhKks7Zxf2PAcBO6jWqE+k4=;
 b=FfHkXC3KAW1JMkhCYLKWctbSNqdifQ8HOoShFgxVbs72sFlMpVBlW2TdJbCx2Sd0DAtjeBg3DpIoiJbmN6yG0gKgca2pmfMntWknXSPDqm6nb+AYGSRYhA5KZRiCAIeOPRHjmGg5mCMtZmpDjaA17EMckNgj81DKgMkygszLRxBFw5mQGuqS+fNpNXG+oh7VNxPcjaetDmkOUnls5pHIHVHqzQWJYm2nu6ECY5kfelFgHEGL3Q7D9ZzYRO0WKXncaUdisTEY3Wa5ODW6ECf6Z8eLVCX/4hKEzSYh/TBP6O4FNZY2jZaxojmTw8Wen9aKDbbf0C/DDOUkZ1lBEozjBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=057OuDpabBZNhCslwTgZwhKks7Zxf2PAcBO6jWqE+k4=;
 b=vzxBEt7T6wMmacCbbTxY4h75FxClX2FRp0TUZZGmH62ocunJOjInXTQq8Nf2KGc6v1AhVaTEtQVar24AFRj27Dke7Vjo5VUE1fBRcyHfkPlvz8oea6PvzFAawRgRlynUwB6V8pNRAk741/m9glOBWICLmI3IKsLz9l/CR1qZFYk=
Received: from TYZPR03MB5343.apcprd03.prod.outlook.com (2603:1096:400:3c::8)
 by SEYPR03MB7358.apcprd03.prod.outlook.com (2603:1096:101:149::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 05:53:26 +0000
Received: from TYZPR03MB5343.apcprd03.prod.outlook.com
 ([fe80::1606:3964:3cfd:3e06]) by TYZPR03MB5343.apcprd03.prod.outlook.com
 ([fe80::1606:3964:3cfd:3e06%6]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 05:53:26 +0000
From: =?utf-8?B?Q3lyaWwgQ2hhbyAo6ZKe5oKmKQ==?= <Cyril.Chao@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
	<tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 08/10] ASoC: mediatek: mt8196: add platform driver
Thread-Topic: [PATCH v8 08/10] ASoC: mediatek: mt8196: add platform driver
Thread-Index: AQHcuzIoqAlqyruRMUKHYVIEOks4FLXNcAyAgBPkPAA=
Date: Thu, 16 Apr 2026 05:53:25 +0000
Message-ID: <da5752796e1774b6bbc24f5ef1ab2529e24a384f.camel@mediatek.com>
References: <20260324015719.17543-1-Cyril.Chao@mediatek.com>
	 <20260324015719.17543-9-Cyril.Chao@mediatek.com>
	 <892468cc-7eb4-411e-b91b-f14789d8da0c@sirena.org.uk>
In-Reply-To: <892468cc-7eb4-411e-b91b-f14789d8da0c@sirena.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5343:EE_|SEYPR03MB7358:EE_
x-ms-office365-filtering-correlation-id: cddb09d9-1ee4-4eea-4221-08de9b7c7a1b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|18096099003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: w4Ye5ncAAHlccLhp3tEBf6Kix6KJINvVa0uO2miDalQwy9hRqyKgVrYHmheeJ5SrWbXXmlHjDHhCNeS+j6sCkg3CSH8a7OdIG7IihxnNoMzoMRlWdNqmjhITkFCTqe9ojnFVBtkTyjT7jlIxAnKy8Odkf5WhOqowqD21Q/0vlxMPx21l/+h5JV5d/63W6kGFqgGVSNs9o3VEyfi69LRTzgpe7swVKLpdOGDburbDehv/64PKvl2YRPkFgmC6At8lGyOAOCKqXLWTRxVunNYflHWgLi4KcauwhkLT0ODZCetZnRSnkW9P1wTxJKINN76HqvslxstVe88yGrC4LtjdmFzUizVxw4F93VtzYAk2M69GuxZyR5RRlwMVj16Xq5TCyuGcErlEmX/Z168NTOa97vrLd2YRt9MxBuMbfo+9SGbUerbcAMXRlR5tjtr94YzYXdra2uUk4Aph9Gq8xH8WR8Qkiit97+cwNH3IqJn2e3oVYIkXT+TQFKok70PiVpJSv/cv0g+iAz+1VpZSILwsp2P1570yqh/YrR+BTpw31jnumidQ7rGKhltxYCAAdrRT5JvUQaFKBDpIRM6D0SuLb37O5QbmIDdfD14MsGCVsPQmXaFuWDF3QUxNb25P27usqnEwmBQV1RbDIatDVPiF5sNP3BHws8JDVaaPTayCpZRcUEXIcjB80rFg/bE0chb1NZS9X7o9uyntsZ+WqDdzZotY83O7FRj5odaRT7QyrEfM6TOIKGgM/cQQh8moVHTYBlqrF2OTYjC6nYv154F9pqW5imuo+kxi6nFD3F9y2uM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5343.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(18096099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THJyclhZc0lzOG5pSEFEU1lzdzR1dm9qcWlvRW1MZldtMklzQW1reFN0Wm5m?=
 =?utf-8?B?K3ZPYTF2S0t0NXFzTWVYY3VBYTdoMng1NzJHZVBkbVJ1S1NSdzBjemcyMFBL?=
 =?utf-8?B?M1VhcVcxTDE0S0d5UmhEQVdVdFFvb1lWcVlIQ1g1Y2FLdHNDSmduTUVtS09h?=
 =?utf-8?B?d01rTExVTlZrS3BFSms1aVA5OTNBalpMMkZEVmRUWDdqVGJKenFjeFpmUnNX?=
 =?utf-8?B?T05WUGVDRWI3MVRVeHZ0bERTcCs1dFpKT0Nsc3ZsMW5JVEl2WmFKK3RUWFVu?=
 =?utf-8?B?WTc1T09ncHpubk5kNUVyWnlJOUx6SWRldTFKSG12cVN0TTNiN1RZTVFFMXYr?=
 =?utf-8?B?T3pRNVBWV3dPTXBPNWI3TGpKRkgvZzRuazdtSFRaZDJYL0RIWFhSYTVleU13?=
 =?utf-8?B?Q1d5RGRVS3AzOWFNTDJIZjNwMkxHV2c5TDBmSjJQb3VMKzNmb3dhTnlZRW1S?=
 =?utf-8?B?Q2FrM3JVOFF0akJYbXNQcWd1clNka2dBMkNIcWdtYUxOcDRIZTdXYmFxTTZq?=
 =?utf-8?B?OVA5RUp5VWRNNlUyN0o1ZFY5bWtzdllVaE54Sk1OSVd2UThGcDN2TzhxVm5P?=
 =?utf-8?B?U0F5dVpNMkg4Wng0RFQ3MFBtcGFYTzIxQWVKRWdzNmtnNGZ3TTJKLzltQXVu?=
 =?utf-8?B?M0huMksrQkthYzJGNlZhUFVMOUlZNG9iSzN6T0RveXJtcXNPYmlWM0kra0RM?=
 =?utf-8?B?QUk3ZzB0Mk1lU3pMQmRjMXViOHkyRkk2UTU4Y1FIdGt4WU5DWmk1SS9reW5u?=
 =?utf-8?B?cGwwMkxPYkJVY21DcGdtRzNqVGg3Ui9Qd2lhV0hrYTZXd1p3ZWdqMWVROTJW?=
 =?utf-8?B?MUtyZGVkV0lQWW16K2ZsRjNsai80RXRZZzR0MitNcGdtUkwwMXNkaFdobzIz?=
 =?utf-8?B?RStCMS9uUXR4Yk5na3FhNFJRTk1KNFlIOExHNzBtWFh4UXBRbVN1cm1aZHIx?=
 =?utf-8?B?cnlZWW9GblZ4amJGZTlRQkU1UzJIdTM2US9rQ21WZWhJWGhJZk1WNm1acWcz?=
 =?utf-8?B?cmlYNWRrbzcyOXJEMWg5VVN5ekpOeDQrZnJOelhkY2hiZWltTGRmTmlyVEZQ?=
 =?utf-8?B?aU9VazZMc1BtNWV5czhzRlpReFY4eDVsRzJ4R3dvQ1FXRWw2Z3U0ajNFejJv?=
 =?utf-8?B?MWU0NTdDVzJlb0kzY2k4bzRJN0lPLzAweUYybFdpdlc5YmtlTk9Sbit4VC9C?=
 =?utf-8?B?eXgxMnlNZ25iVjZ1NWFVc0pRNExkYlRZanYyMWtWK0NJK1Z2VVZrTHljWFkx?=
 =?utf-8?B?bFFtRTZxU3BQQW9kL0pPdGpDdzJoNEZWRXRVbmtnZWN1U0oyZ3VUY1JpckR4?=
 =?utf-8?B?K21vUGFEd09uak5QQjd4QWhhdWY0NTBCL0VXaXRWSWt0MTBDRXdPdHFhdUlC?=
 =?utf-8?B?elExdmJNY1NzNXBxRk95NXI0L2N5TkM5K2tGSitDQXlzTGNlZ2E1V0N6MHMv?=
 =?utf-8?B?WU5Zd2RCK2xVZ3I3Snc0RVFRbHV5NGIrQjV0SGV0TFBBZFRqUUV4L3VManBO?=
 =?utf-8?B?M0dqUjlZcVZPTWRUR2VqK3FuZFhCWU5sY25kVHlsNUZvYXVZa0xXaEVBdW1L?=
 =?utf-8?B?d2pJMnRubXFNTWNMQU1ZWjlKejN2R0xKODJYU3NUbGViam9Lb3NpS0hmNlVL?=
 =?utf-8?B?anBUc2hqc0hLeFFFNDQxbWxMWHgyNk1hRjNIWHRMVm9jM0Rqd3R4VFdMRVJ3?=
 =?utf-8?B?MzFWRllqbXF4T1FtcEJZWDVMejNETElyM1pCSkVKUVMvd1RvYncwOHBCSll5?=
 =?utf-8?B?N20vRmM1NUt3d25xYW5IR0c2VDV3eHc5QUIwSWhZVGdHaTA0WXdmSmdFV25a?=
 =?utf-8?B?U010d29yOXJFZkVYNnJ1NFFDdzJWZlZGZnBOZmlWenBHVzJybWVrZkxtUm9W?=
 =?utf-8?B?VlVuSkdKZ1FsU3BuM0VrcHBBQ1B6bThrb243dUtFa0swUFNRbHdmcStHRUZ5?=
 =?utf-8?B?Y3NHQmZNWXVCUzJnM01Qa0ZkSTN1RUI1dWdRUVcrNWYzc2l6RzRJVGx2a09z?=
 =?utf-8?B?OFU0dzJVbFR4NFJ3OE9sKzBXY09UMXpROW42ZWdUaFhuZzNUcnA4VklwcjVk?=
 =?utf-8?B?YXg1MDFMdnRoQ3VFTklNdzVxNHBCTUtLUlhnVU9LOGxaQVorRmZKWlVnc2Jz?=
 =?utf-8?B?ZXRaV2NNUmhuQmowblJsQy9OaUhqNFIvajhaMHl6S2tGeXpqMGJHOEV1Y3V5?=
 =?utf-8?B?T2xZZXVzaVhSSGNReitDS05HTjI3TFFxbGtpR0xqMDlQb1BIeFdrVllKMXlL?=
 =?utf-8?B?STdwZXdMMUY5OVJnZDB6VVo3RHczTWQzQ2pldXNDbjR1SUtGaWUvQjdrT0k3?=
 =?utf-8?B?S2czSlZLYTVtc2VVN1QrTXJYQzVPdy9WdUhGdE8vUmpxb3hqM3RaQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5426F6D8A79E634D8A97FEB04BF1326A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lKroMDKnD1i+aQJNcfgU24AJostkW1XxlkuprCs3flHMJL6t6BUnIMlg54SMSnXF7RhlabfzwYJdm2QJ66StJb0xBH2z04w5zzIuZZmQ/QH5rJ5hjuqWFmgW/WldSYalLkWkr9G7CkN5Xv+MccLhEyT/KjmY5XTH/0nW09AapblmXKqfTQ5VQgyfzB44yjXjs4pHvh5AsEKkKas3gucvF5KrfWI2T3NWuL3OGjjTzsui7DKATn4dhDh6a43b3Tf4U1tDXJ+n1uGmOVt8Wx3ngntaDXH82wWUqnIkY8tgcn9kYV18B6XBRcIiG1t20AK5bjjvYMetTLnNhxRWKu7pCQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5343.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cddb09d9-1ee4-4eea-4221-08de9b7c7a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 05:53:25.9793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8acCWCJ4gtNgb0kmqwfT8xRJ6us4A6cRXdOmvRjCNhy9zRsusHJ700P3NTjtzicBAgID83MFvDU3nWOR53zIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7358
X-MTK: N

VGhhbmsgeW91IGZvciB5b3VyIGFzc2lzdGFuY2UgaW4gcmV2aWV3aW5nLiBDb3VsZCB5b3UgcGxl
YXNlIGFsc28NCnJldmlldyB0aGUgbW9kaWZpY2F0aW9ucyBpbiB0aGUgZGlmZj8gSWYgZXZlcnl0
aGluZyBpcyBva2F5LCBJIHdpbGwNCmluY2x1ZGUgdGhlbSBpbiB2OSBpbiB0aGUgbmV4dCB1cGRh
dGUuDQoNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTYvbXQ4MTk2LWFm
ZS1wY20uYw0KYi9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTk2L210ODE5Ni1hZmUtcGNtLmMNCmlu
ZGV4IDNkMzE3NGNkOGVmYi4uZmY3YWE4OWU0Nzc5IDEwMDY0NA0KLS0tIGEvc291bmQvc29jL21l
ZGlhdGVrL210ODE5Ni9tdDgxOTYtYWZlLXBjbS5jDQorKysgYi9zb3VuZC9zb2MvbWVkaWF0ZWsv
bXQ4MTk2L210ODE5Ni1hZmUtcGNtLmMNCkBAIC05MCw5ICs5MCwyMCBAQCBzdGF0aWMgaW50IG10
ODE5Nl9zZXRfY20oc3RydWN0IG10a19iYXNlX2FmZSAqYWZlLA0KaW50IGlkLA0KIAlzdHJ1Y3Qg
bXQ4MTk2X2FmZV9wcml2YXRlICphZmVfcHJpdiA9IGFmZS0+cGxhdGZvcm1fcHJpdjsNCiAJdW5z
aWduZWQgaW50IHJhdGUgPSBhZmVfcHJpdi0+Y21fcmF0ZVtpZF07DQogCXVuc2lnbmVkIGludCBy
YXRlX3ZhbCA9IG10ODE5Nl9yYXRlX3RyYW5zZm9ybShhZmUtPmRldiwgcmF0ZSk7DQotCXVuc2ln
bmVkIGludCB1cGRhdGVfdmFsID0gdXBkYXRlID8gKCgoKDI2MDAwMDAwIC8gcmF0ZSkgLSAxMCkg
Lw0KKGNoIC8gMikpIC0gMSkgOiAweDY0Ow0KKwl1bnNpZ25lZCBpbnQgY2hfcGFpciA9IGNoIC8g
MjsNCisJdW5zaWduZWQgaW50IHVwZGF0ZV92YWw7DQogCWludCByZWcgPSBBRkVfQ00wX0NPTjAg
KyAweDEwICogaWQ7DQogDQorCWlmICh1cGRhdGUpIHsNCisJCWlmIChjaF9wYWlyID09IDApIHsN
CisJCQlkZXZfZXJyKGFmZS0+ZGV2LCAiQ00lZDogaW52YWxpZCBjaGFubmVsIGNvdW50DQoldVxu
IiwgaWQsIGNoKTsNCisJCQlyZXR1cm4gLUVJTlZBTDsNCisJCX0NCisJCXVwZGF0ZV92YWwgPSAo
MjYwMDAwMDAgLyByYXRlIC0gMTApIC8gY2hfcGFpciAtIDE7DQorCX0gZWxzZSB7DQorCQl1cGRh
dGVfdmFsID0gMHg2NDsNCisJfQ0KKw0KIAlkZXZfZGJnKGFmZS0+ZGV2LCAiQ00lZCwgcmF0ZSAl
ZCwgdXBkYXRlICVkLCBzd2FwICVkLCBjaCAlZFxuIiwNCiAJCWlkLCByYXRlLCB1cGRhdGUsIHN3
YXAsIGNoKTsNCiANCkBAIC00NzEsNiArNDgyLDcgQEAgc3RhdGljIGludCB1bF9jbTBfZXZlbnQo
c3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQNCip3LA0KIAlzdHJ1Y3QgbXRrX2Jhc2VfYWZlICph
ZmUgPQ0Kc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY21wbnQpOw0KIAlzdHJ1Y3QgbXQ4
MTk2X2FmZV9wcml2YXRlICphZmVfcHJpdiA9IGFmZS0+cGxhdGZvcm1fcHJpdjsNCiAJdW5zaWdu
ZWQgaW50IGNoYW5uZWxzID0gYWZlX3ByaXYtPmNtX2NoYW5uZWxzOw0KKwlpbnQgcmV0Ow0KIA0K
IAlkZXZfZGJnKGFmZS0+ZGV2LCAiZXZlbnQgMHgleCwgbmFtZSAlcywgY2hhbm5lbHMgJXVcbiIs
DQogCQlldmVudCwgdy0+bmFtZSwgY2hhbm5lbHMpOw0KQEAgLTQ3OCw3ICs0OTAsOSBAQCBzdGF0
aWMgaW50IHVsX2NtMF9ldmVudChzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldA0KKncsDQogCXN3
aXRjaCAoZXZlbnQpIHsNCiAJY2FzZSBTTkRfU09DX0RBUE1fUFJFX1BNVToNCiAJCW10ODE5Nl9l
bmFibGVfY21fYnlwYXNzKGFmZSwgQ00wLCBmYWxzZSk7DQotCQltdDgxOTZfc2V0X2NtKGFmZSwg
Q00wLCB0cnVlLCBmYWxzZSwgY2hhbm5lbHMpOw0KKwkJcmV0ID0gbXQ4MTk2X3NldF9jbShhZmUs
IENNMCwgdHJ1ZSwgZmFsc2UsIGNoYW5uZWxzKTsNCisJCWlmIChyZXQpDQorCQkJcmV0dXJuIHJl
dDsNCiAJCXJlZ21hcF91cGRhdGVfYml0cyhhZmUtPnJlZ21hcCwgQVVESU9fVE9QX0NPTjAsDQog
CQkJCSAgIFBETl9DTTBfTUFTS19TRlQsIDAgPDwgUEROX0NNMF9TRlQpOw0KIAkJYnJlYWs7DQpA
QCAtNTAyLDYgKzUxNiw3IEBAIHN0YXRpYyBpbnQgdWxfY20xX2V2ZW50KHN0cnVjdCBzbmRfc29j
X2RhcG1fd2lkZ2V0DQoqdywNCiAJc3RydWN0IG10a19iYXNlX2FmZSAqYWZlID0NCnNuZF9zb2Nf
Y29tcG9uZW50X2dldF9kcnZkYXRhKGNtcG50KTsNCiAJc3RydWN0IG10ODE5Nl9hZmVfcHJpdmF0
ZSAqYWZlX3ByaXYgPSBhZmUtPnBsYXRmb3JtX3ByaXY7DQogCXVuc2lnbmVkIGludCBjaGFubmVs
cyA9IGFmZV9wcml2LT5jbV9jaGFubmVsczsNCisJaW50IHJldDsNCiANCiAJZGV2X2RiZyhhZmUt
PmRldiwgImV2ZW50IDB4JXgsIG5hbWUgJXMsIGNoYW5uZWxzICV1XG4iLA0KIAkJZXZlbnQsIHct
Pm5hbWUsIGNoYW5uZWxzKTsNCkBAIC01MDksNyArNTI0LDkgQEAgc3RhdGljIGludCB1bF9jbTFf
ZXZlbnQoc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQNCip3LA0KIAlzd2l0Y2ggKGV2ZW50KSB7
DQogCWNhc2UgU05EX1NPQ19EQVBNX1BSRV9QTVU6DQogCQltdDgxOTZfZW5hYmxlX2NtX2J5cGFz
cyhhZmUsIENNMSwgZmFsc2UpOw0KLQkJbXQ4MTk2X3NldF9jbShhZmUsIENNMSwgdHJ1ZSwgZmFs
c2UsIGNoYW5uZWxzKTsNCisJCXJldCA9IG10ODE5Nl9zZXRfY20oYWZlLCBDTTEsIHRydWUsIGZh
bHNlLCBjaGFubmVscyk7DQorCQlpZiAocmV0KQ0KKwkJCXJldHVybiByZXQ7DQogCQlyZWdtYXBf
dXBkYXRlX2JpdHMoYWZlLT5yZWdtYXAsIEFVRElPX1RPUF9DT04wLA0KIAkJCQkgICBQRE5fQ00x
X01BU0tfU0ZULCAwIDw8IFBETl9DTTFfU0ZUKTsNCiAJCWJyZWFrOw0KQEAgLTUzMyw2ICs1NTAs
NyBAQCBzdGF0aWMgaW50IHVsX2NtMl9ldmVudChzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldA0K
KncsDQogCXN0cnVjdCBtdGtfYmFzZV9hZmUgKmFmZSA9DQpzbmRfc29jX2NvbXBvbmVudF9nZXRf
ZHJ2ZGF0YShjbXBudCk7DQogCXN0cnVjdCBtdDgxOTZfYWZlX3ByaXZhdGUgKmFmZV9wcml2ID0g
YWZlLT5wbGF0Zm9ybV9wcml2Ow0KIAl1bnNpZ25lZCBpbnQgY2hhbm5lbHMgPSBhZmVfcHJpdi0+
Y21fY2hhbm5lbHM7DQorCWludCByZXQ7DQogDQogCWRldl9kYmcoYWZlLT5kZXYsICJldmVudCAw
eCV4LCBuYW1lICVzLCBjaGFubmVscyAldVxuIiwNCiAJCWV2ZW50LCB3LT5uYW1lLCBjaGFubmVs
cyk7DQpAQCAtNTQwLDcgKzU1OCw5IEBAIHN0YXRpYyBpbnQgdWxfY20yX2V2ZW50KHN0cnVjdCBz
bmRfc29jX2RhcG1fd2lkZ2V0DQoqdywNCiAJc3dpdGNoIChldmVudCkgew0KIAljYXNlIFNORF9T
T0NfREFQTV9QUkVfUE1VOg0KIAkJbXQ4MTk2X2VuYWJsZV9jbV9ieXBhc3MoYWZlLCBDTTIsIGZh
bHNlKTsNCi0JCW10ODE5Nl9zZXRfY20oYWZlLCBDTTIsIHRydWUsIGZhbHNlLCBjaGFubmVscyk7
DQorCQlyZXQgPSBtdDgxOTZfc2V0X2NtKGFmZSwgQ00yLCB0cnVlLCBmYWxzZSwgY2hhbm5lbHMp
Ow0KKwkJaWYgKHJldCkNCisJCQlyZXR1cm4gcmV0Ow0KIAkJcmVnbWFwX3VwZGF0ZV9iaXRzKGFm
ZS0+cmVnbWFwLCBBVURJT19UT1BfQ09OMCwNCiAJCQkJICAgUEROX0NNMl9NQVNLX1NGVCwgMCA8
PCBQRE5fQ00yX1NGVCk7DQogCQlicmVhazsNCg0KQmVzdCBSZWdhcmRzDQpDeXJpbCBDaGFvDQoN
Cg0KT24gRnJpLCAyMDI2LTA0LTAzIGF0IDE1OjA3ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0K
PiBPbiBUdWUsIE1hciAyNCwgMjAyNiBhdCAwOTo1Njo0OUFNICswODAwLCBDeXJpbCBDaGFvIHdy
b3RlOg0KPiANCj4gPiArc3RhdGljIGludCBtdDgxOTZfc2V0X2NtKHN0cnVjdCBtdGtfYmFzZV9h
ZmUgKmFmZSwgaW50IGlkLA0KPiA+ICsJCQkgYm9vbCB1cGRhdGUsIGJvb2wgc3dhcCwgdW5zaWdu
ZWQgaW50IGNoKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgbXQ4MTk2X2FmZV9wcml2YXRlICphZmVf
cHJpdiA9IGFmZS0+cGxhdGZvcm1fcHJpdjsNCj4gPiArCXVuc2lnbmVkIGludCByYXRlID0gYWZl
X3ByaXYtPmNtX3JhdGVbaWRdOw0KPiA+ICsJdW5zaWduZWQgaW50IHJhdGVfdmFsID0gbXQ4MTk2
X3JhdGVfdHJhbnNmb3JtKGFmZS0+ZGV2LCByYXRlKTsNCj4gPiArCXVuc2lnbmVkIGludCB1cGRh
dGVfdmFsID0gdXBkYXRlID8gKCgoKDI2MDAwMDAwIC8gcmF0ZSkgLSAxMCkgLw0KPiA+IChjaCAv
IDIpKSAtIDEpIDogMHg2NDsNCj4gPiArCWludCByZWcgPSBBRkVfQ00wX0NPTjAgKyAweDEwICog
aWQ7DQo+IA0KPiBUaGUgZHJpdmVyIGxvb2tzIGxpa2UgaXQgc3VwcG9ydHMgbW9ubyBzbyB3b24n
dCB0aGlzIHRyaWdnZXIgZGl2aWRlDQo+IGJ5DQo+IHplcm8/DQo+IA0KPiBBbHNvIHBsZWFzZSB3
cml0ZSBub3JtYWwgY29uZGl0aW9uYWwgc3RhdGVtZW50cywgaXQncyBtdWNoIG1vcmUNCj4gbGVp
Z2libGUuDQo=
