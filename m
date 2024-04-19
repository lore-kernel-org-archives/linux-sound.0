Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E164D110
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713541317; cv=fail; b=tOTLIm38lZ1z7aj+OL/VPk/OhEzNhib7sWcW4f4kS6ma4UkhlOCYi08/rMjVEiPND2C0UW5TD5TeuFdV08q1c+aH1szyOSksgPpRUW5KwQApRa0KcGe5Yxw+oCpybIvoDYswoAPZbxmYA2OwlHQk5jAbj6k6tsOqPYkrmz3PFu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713541317; c=relaxed/simple;
	bh=7L5nv3HCaQmvqVAJVpTG3K3xR1Z71BP3kF9Kj6F8+2c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a3awFRXy/Cu4oBrGVVCYHSj66AZ3WNnE/0SLRc1aYoTfq/AvmJ9hRd/yTq65AENut6UGdRXfqC5COf/8qubuB/Ihm0U4uIhUH8IUiu8ok4H5f9GthVMIZj/a2eicoVs4Ke3ifuSXUeG6IUWtgphn+8OFQNqRRD43gbAR0ewM4vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iwoM99TT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KRMdMQsN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iwoM99TT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KRMdMQsN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43J8LVU1007283;
	Fri, 19 Apr 2024 10:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=7L5nv3HCaQmvqVAJVpTG3K3xR1Z71BP3kF9Kj6F8+
	2c=; b=iwoM99TTDCovpx+ZT4mg7XjOtB7STKz550GGhqBeBme/eIPFq+8cnQmJO
	Vxd0UGkC4meErP0gaTj2zc6CMYCC6ljBe+xu9St7RY1njkNl2FToMhtU2SanGtA5
	iWMLTc08xE2BNBFIuKWzXnB4dfAyROhXNl2mDc4nQcsElkDbpLvNjPq5vxY8kAhV
	FufBaKj1RO8d/8xylLdX9RbwRhiiF5NNAZBt6NexsU/RLwB1w991D0r2ZClQWCUO
	ytx/fD3dqQOBiSho7qsWjyujH+2qKvrm5nmtdsvmPt+Hi1w23JgqpMdKx0UEvW8Y
	bZM7kMVn+SE5vYpP0mMQZsgV8GPiw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xfpfhwycs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 10:41:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rvdktl0U1sTzwlTHlkRoElcrgrJsZqjum4d92jrtURb9T4ieRuchGW5AtMftoMfasZLNAJEuUjBlCUcNe6p6WRsEP+mQeiDjGyVf+D4mepCAnDC3zdwbtwgEjH2QvzWGjTbIRHoAQ73O/PzYhXoP+cN0onW/WmylwrMpB4dHErT91OThENig1JhrhoO5pamK7dCIRIIwDPWABT0+STEIeSjx4yPaxI9Era/GVvyIWdK+HAzatMZ/mgfMr3jNx8boZDmNGHmaHDeRB6PVdkBnG7nvkWIJdKbXNRuXutWfqGBk+ZQz+Z68SNwfgDStwOyQK67cnIPdrX60Ws24bCgZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L5nv3HCaQmvqVAJVpTG3K3xR1Z71BP3kF9Kj6F8+2c=;
 b=mt2Bycx4gMI5Jx6p8j4Z113zGJAU9QmfQKQllq6egxkf8WluhiTtssuDyzeLxFHZ/d6ZYKpXkY3aUgC1hc5JV53EA4kSqFKzS02F8EAlSIhfMSaVuzCMc4qjKJeKn4D6SzAHTEcw7itaQVJ4vdG54vXrHfELkzUnEX2KZGSJSaiVmkVUy9ohlu21JCyzPuaqBcTC5u1Fkd2ly0WAMBH1S5Jt0XKLBA569KGsuAyXv1pWf9ngGzc+euwdNHiNzU1R1SS57I4bP6xk8EKUEL+4StihY4v1pHVPFpa0/g7ToWY70+rAsiQ7hqTe5ZaW4Ea9fXVcTzF9syd/PnTUsMqgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L5nv3HCaQmvqVAJVpTG3K3xR1Z71BP3kF9Kj6F8+2c=;
 b=KRMdMQsNZ3Hr9gSglH+GEPGFyojk56NanzAQF9ZZffwnNocTONoNn2ueTrHXTQSGaZ/TOgEpkHiQZZYp7b8uzvEcFm+4okzEIXwxVAjKG/aLmTngSNQL7tEz9ApRb8rQ8jF+WWEzKBCjBMCYQtDUOxTCnvWFonEZPYx3R6HIHNs=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 SA1PR19MB6790.namprd19.prod.outlook.com (2603:10b6:806:24d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 15:41:38 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a%2]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 15:41:38 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: Mark Brown <broonie@kernel.org>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>,
        "open
 list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
        "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Thread-Topic: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Thread-Index: 
 AQHaicoHNR0TZU5ElUi1zSJTLRH+QrFk3KaAgAYE9YCAABxTAIABgLkAgAHiFwCAAT6ogIAALRqA
Date: Fri, 19 Apr 2024 15:41:38 +0000
Message-ID: <B44AF515-8BDF-47C1-88AA-6F71C6AE2970@cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
 <20240416123541.GW2399047@google.com>
 <F90648F7-BE0B-47DB-89C4-A8C91CD65D59@cirrus.com>
 <20240417131402.GZ2399047@google.com>
 <9F7C82D1-1622-4FD8-9987-30236122E852@cirrus.com>
 <20240419130001.GA109991@google.com>
In-Reply-To: <20240419130001.GA109991@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|SA1PR19MB6790:EE_
x-ms-office365-filtering-correlation-id: 15f7f15c-5596-4cd8-593f-08dc608733c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rNi06yaMCCBzo2JOv4eJ1yYXXPSPPGLwYujjfEuvEmSigT2h4UkNNXQFJUkCriRf4BDDFAUR00Sdo7m6RzZSYHKolZXInBCxFlWOo1dd+3x6Mprf/noihljgT9Ytwduok1cXzkghDudSEUg6klyb8eq381pvo8Oc9dqZQ/xPBpzgPsVMiYzx+5KBFiwOsXhkTqlk3P7oSFfp3d4Rtcx/N7PenrVGfeNhZ7i4zQxNxwnRn69Qanh936D8LILmArN+cgTlpHmOkQOeCqwuwEJBSjlC4uzfa6rmZ4BxBHAe+/AhQGGNsOHslRnESFcsn9T8d68tPr5XgtXJLmZ8VuMC8Reh6m+RSN3d3Py4dHAVn0wIqn5JJXZLb87BvTfhrxV4+lWjPNJNmFiJBH/NagVj6sdPo+2NAfhRAfgWX4AJAjjj4JtmR3ezp/Z7Yb4xFbNx5P2sn4l6Ekv8H2OlU23HGUZ15X2ucEHc3fHRxv/Dwz7BMKfNgJXRInEBOo7j8a6UgfxCa7CjGL3mEnsJgvRIArxeIzlpRI1HuNCOdO9NjgF/Clv89BZjpEzK7QTZy5UqqvYi/N2/EMPc1iKs08Mfu9mFtx/gbfv5iWz/WEwJyTbIik6ZEzHQsb/WKI1g3mRKP0zTcVZmwfgnVrNVORZBr5XoX2E34sZ6jIk241keLaFHt/gG8sGCA0JcWzUQ2JPQG9HMOtLSeT7CKV/KLG65xby4BfazxMYj0/LWCptnuCU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bDI2bjFKV3pjUU5Rdk1aMkpkV3BTbGJReGNXbUpjVGV0VTlMdnFaRHArTU9R?=
 =?utf-8?B?VXJkczdWaEg0bzZnZHlWcmlOVWhKclJLcndPU3FsTHRMb3pRdjVjOWpqTFhH?=
 =?utf-8?B?RTBwQy8zWTIvNzQzTGkxVjVFL29uaE1aTzNTSjk4SWc0ZUZnUUNpTnVZTFYw?=
 =?utf-8?B?eU5rWVhiUXNYRmlSWUVHbTdhVTZZQUVoTFFvaU9EeEhJOWpXQmZWeEYvTTlq?=
 =?utf-8?B?OUs0S2IxVkdqWEM5eDFUV0U2T09KR2o0Z3BPOExhaUduY3JPMVc0SlQxdUl4?=
 =?utf-8?B?SGZ0TVhvUS9wTjU3MEVDWUtDZWpzajI1cGJhbGtRazRhNTdtblZvYUtwWEZi?=
 =?utf-8?B?T0FXWWNndGhsTWFNb3YxWmd3Zjc5dTcwKzVCSUw4NktZQ0RxV1FCeDNneXE3?=
 =?utf-8?B?Y2ZxcnhoSFZlUnhHTDhxNmJvQXN5TnpTRlJiTmZqMVN3ZWhPeVlkb1R2M05j?=
 =?utf-8?B?RVUveEpxWkdDeGcvV1N2N2NxRzNVWXdRUEhyR2hFSDlpanI0K2JUUTBCN2Mr?=
 =?utf-8?B?d1k1cm1LQzdCakIrNyszT1V1VHYzQjNzZU40NVEwb2c5UlVFSnVlSzNRbE5W?=
 =?utf-8?B?N2Fyb3Z5T3lORkQ2Mit4aXU2Nis0MXdCcDg2OTgyS29PRSttdkovVHNRdFZU?=
 =?utf-8?B?dEtIT0hyQzBZSFhIRlFlTDFodUhZUFBPK3lDUWhXQjNNTW1LSHh3SXhqd2M4?=
 =?utf-8?B?WGpiV05aWXFFdUJteXVtTGRuNjM3QnJ3c1pFelpMejhSQzF0UjZSMVhjOXMz?=
 =?utf-8?B?Ykc3VFlnRzl6MFBJY1I4UHBYSWRtKzg0YzhzeTVGMEdiTGZxMU1GK0Ryandl?=
 =?utf-8?B?UTN6Mlc5WjJOUmNqTkllejkzWjU2VUpwY0ZjMVN4ZE1qa0hJczdCcUswQWxP?=
 =?utf-8?B?Z1ZFdVRzaE80dWxDTkJHeFFaci9xT3J6eUxXMHl3ZmJDZUs3UGZhNGVjdjRS?=
 =?utf-8?B?VXFLek56NGV2OWFHMDBsVDVDTlRITE9Jc3JOR01FTmJ0RUxiT09yeGJQTWR5?=
 =?utf-8?B?WUxVV3dGYzl0aU9ldThyQ1ZtRGMxa0RtNE5NdVVwek9VK2wySjFta3ZCTmJF?=
 =?utf-8?B?dW5qSWVkUW1TZGp3dzhOb1QzVXc0eVNtMEdpNWYvbnh2WlBqRWtuVm9OSVUv?=
 =?utf-8?B?Mlg5OFE3aFZSUXk1ZXZSY0FFK3o1RUdqSkFrWkVGR3dZTHlJVG82NVVqQXFR?=
 =?utf-8?B?bjdkTTF6ZUExNDkza0w4TlhhUWttczZhR21Zc21JNVlWdEtLMEtTQ1NqcUZj?=
 =?utf-8?B?bHl4a3ZwSlBYZ3B4RVRZajZoQUsrOWxBMGtFNzBSZThJV21DNEdpMWdldlF2?=
 =?utf-8?B?UjFTVExTamRidnVyZEszMUdnTDRGTThDWkk3Rm8rRkRNd2liUXdnbStnREtw?=
 =?utf-8?B?U24zVGd5bG5GQjVnWFF6bDJ4cjcyTms4aVNEOVo2dnF1Q0U1anNrVnZmKytT?=
 =?utf-8?B?cEFJY251eGpIZkQ1VTF3V3dCSEVKQy9aQmFoS0hucUprdk9rNWw2RHRGTmxn?=
 =?utf-8?B?NmVWZStxQ01BZWFYNVZiU3NUWUJOTzJiUWxEWkc2ZldNLzNyVlRYWURCV2VI?=
 =?utf-8?B?L2tVbVpOQTVsZFFWSzBUdWVHR3dvUHJZc1pmRFhsS2loQmhZR3hDTEpJVXVx?=
 =?utf-8?B?VzJGODJ5MXhTNk1ocDcwcWsrMkpTRy95TzQvQ0EwOGpBa3pqb1lSdW1sTDJ4?=
 =?utf-8?B?NFhxUUxIR3V0amRoMUlDeGFxdnVIMEtSc1VjbzhrZFZnTUNUMUkxV0VTNlFq?=
 =?utf-8?B?Wmd0eW5Ocy9GcjF4Vk1aWHZUY0xxc2dGTVJaMHZrYW9hYVZDc20yVDFmb0sz?=
 =?utf-8?B?SVZsUEFNaXkwYUNVcG1LbTVZai81QkpEVnBvTTAzMFhrN1FWelFRT3ZtSjBy?=
 =?utf-8?B?U3F6RWl4dXNZS3NJSkxjMmptanJoU0NOdzJkNi9rK0lpeURFWGVqK3hKUDM0?=
 =?utf-8?B?SDdub0ZXYVZ5QnlDU1oxSUF4dXM1bXBoQ01LN0lZQ1o3dVczNDFRU3V5ak5T?=
 =?utf-8?B?V01ib0NHNGhlSGdRZ0o2M2J6OWhWQ3htV2RpL0k2VzNiWkxnK1lWaTFMODhB?=
 =?utf-8?B?YW8xbVNodEx4U0s0aEtOOVdpNktETGZYV0tWTGpVUkxNVlNnR3pOUExPK3gw?=
 =?utf-8?B?cnN1dHdtc2dsK1NYZVpOWVpEcXFlNmhkK29BRnVJUFFiTmJVUlBkNUYrY2Vl?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <405CC40082518F4CA19823BBDF3AA6FF@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB5688.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f7f15c-5596-4cd8-593f-08dc608733c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 15:41:38.4594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/lay7z7cCjgatyGqWz2eh5BiOZsU4dEU1I9Pj3kJzzwyHUwoLp0OzMca2fSomkYG1gqw86am5xpqwgQNRSX5UcmFjca+6kKMUjNFvU0rlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6790
X-Proofpoint-ORIG-GUID: 9WtM_HT68_8GOGzuCunkJwAZktHXnnnz
X-Proofpoint-GUID: 9WtM_HT68_8GOGzuCunkJwAZktHXnnnz
X-Proofpoint-Spam-Reason: safe

DQoNCj4gT24gQXByIDE5LCAyMDI0LCBhdCA4OjAw4oCvQU0sIExlZSBKb25lcyA8bGVlQGtlcm5l
bC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAxOCBBcHIgMjAyNCwgSmFtZXMgT2dsZXRyZWUg
d3JvdGU6DQo+IA0KPj4gSGkgTGVlLA0KPj4gDQo+Pj4gT24gQXByIDE3LCAyMDI0LCBhdCA4OjE0
4oCvQU0sIExlZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFR1
ZSwgMTYgQXByIDIwMjQsIEphbWVzIE9nbGV0cmVlIHdyb3RlOg0KPj4+IA0KPj4+Pj4gT24gQXBy
IDE2LCAyMDI0LCBhdCA3OjM14oCvQU0sIExlZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+IHdyb3Rl
Og0KPj4+Pj4gDQo+Pj4+PiBPbiBGcmksIDEyIEFwciAyMDI0LCBKYW1lcyBPZ2xldHJlZSB3cm90
ZToNCj4+Pj4+PiBBbGwgZmVlZGJhY2sgdG8gZGF0ZSBoYXMgYmVlbiBhZGRyZXNzZWQNCj4+Pj4+
IA0KPj4+Pj4gVGhlcmUgYXJlIHN0aWxsIE1GRCByZXZpZXcgY29tbWVudHMgbGVmdCBvdXRzdGFu
ZGluZy4NCj4+Pj4gDQo+Pj4+IEhpIExlZSwNCj4+Pj4gDQo+Pj4+IEFzIGJlc3QgYXMgSSBjYW4g
dGVsbCwgdGhlIG9ubHkgcmV2aWV3IGNvbW1lbnQgaW4gdjEwIGlzIGZyb20geW91LA0KPj4+PiBz
YXlpbmcgdGhhdCB0aGUgTUZEIHBhcnQgbG9va3Mgb2theS4gVGhlbiBpbiB0aGlzIHJlc2VudCBz
ZXJpZXMsIHlvdQ0KPj4+PiBjb21tZW50ZWQgdGhhdCB0aGUgTUZEIHBhcnQgaGFkIG5vdCBiZWVu
IHVwZGF0ZWQuIEluZGVlZCwgdGhpcyBpcw0KPj4+PiBiZWNhdXNlIHRoZXJlIHdlcmUgbm8gY29t
bWVudHMgdG8gYWRkcmVzcy4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSQ0KPj4+PiBpbnRlcnByZXRl
ZCB5b3VyIGNvbW1lbnQgaW5jb3JyZWN0bHkuDQo+Pj4+IA0KPj4+PiBJIGhhdmUgYWxzbyBnb25l
IGJhY2sgb3ZlciB2OCBhbmQgdjkgbG9va2luZyBmb3Igb3V0c3RhbmRpbmcNCj4+Pj4gY29tbWVu
dHMsIGFuZCBhbGwgb2YgdGhlIHJldmlldyBjb21tZW50cyBhcHBlYXIgdG8gYmUgYXBwbGllZC4N
Cj4+Pj4gV291bGQgeW91IGtpbmRseSBsaW5rIG1lIHRvIHRoZSBlbWFpbCB3aXRoIHRoZSBtaXNz
aW5nIHJldmlldw0KPj4+PiBjb21tZW50cyBpZiBJIGFtIG1pc3Rha2VuPw0KPj4+IA0KPj4+IEF0
IHRoZSB2ZXJ5IGxlYXN0LCB5b3Ugc3RpbGwgaGF2ZSB0aGlzIGluIGhlcmU6DQo+Pj4gDQo+Pj4g
ICAvKiBJZiB3cml0ZSBuZXZlciBvY2N1cnJlZCwgZG9uJ3QgYm90aGVyIHBvbGxpbmcgZm9yIEFD
SyAqLw0KPj4+IA0KPj4+IEFmdGVyIHJlYWxpc2luZyB0aGF0IEknZCBjb21tZW50ZWQgb24gdGhp
cyBiZWZvcmUsIEkgc3RvcHBlZCB0aGUNCj4+PiByZS1yZXZpZXcuDQo+PiANCj4+IEl0IGxvb2tz
IGxpa2UgSSB0b29rIHNvbWUgbGliZXJ0aWVzIGhlcmUgd2l0aG91dCBjb21tdW5pY2F0aW5nIHRo
ZW0sDQo+PiBzbyBteSBzaW5jZXJlIGFwb2xvZ2llcy4NCj4+IA0KPj4gSW4gVjggdGhlIGxpbmUg
d2FzOg0KPj4gDQo+PiAiSWYgd2UgbmV2ZXIgd3JvdGUsIGRvbid0IGJvdGhlciBjaGVja2luZyBm
b3IgQUNL4oCdDQo+PiANCj4+IEluIHRoYXQgcmV2aWV3LCB5b3UgcHJvdmlkZWQgYW4gaW1wcm92
ZWQgcGhyYXNpbmc6DQo+PiANCj4+ICJJZiB0aGUgd3JpdGUgbmV2ZXIgdG9vayBwbGFjZSwgbm8g
bmVlZCB0byBjaGVjayBmb3IgdGhlIEFDS+KAnQ0KPj4gDQo+PiBNeSB0YWtlYXdheSBmcm9tIHlv
dXIgcGhyYXNpbmcgd2FzIHRoYXQgdGhlIHVzZSBvZiB0aGUgZmlyc3QtcGVyc29uDQo+PiBwcm9u
b3VuIOKAnHdlIiB3YXMgaW1wcm9wZXIuIFNvIEkgcmV3cm90ZSBpdCBpbiB0aGUgdGhpcmQtcGVy
c29uLCBidXQNCj4+IHN0aWxsIGluIG15IG93biB3b3JkcywgcmVzdWx0aW5nIGluIGl0cyBjdXJy
ZW50IGZvcm06DQo+PiANCj4+ICJJZiB3cml0ZSBuZXZlciBvY2N1cnJlZCwgZG9uJ3QgYm90aGVy
IHBvbGxpbmcgZm9yIEFDS+KAnQ0KPj4gDQo+PiBJcyBpdCB0aGF0IHRoZSBwaHJhc2Ug4oCcZG9u
4oCZdCBib3RoZXLigJ0gaXMgdG9vIGlkaW9tYXRpYz8gSWYgc28gSSB3aWxsIGFwcGx5DQo+PiB5
b3VyIHBocmFzaW5nIHZlcmJhdGltIGluIFYxMS4NCj4gDQo+IFllcywgaXQncyBhIHByZXR0eSBi
b3RoZXJzb21lIHBocmFzZS4gOikNCg0KQWNrIQ0KDQpCZXN0LA0KSmFtZXMNCg0KDQo=
