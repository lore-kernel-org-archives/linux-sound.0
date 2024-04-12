Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42012433BB
	for <linux-sound@vger.kernel.org>; Fri, 12 Apr 2024 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712940064; cv=fail; b=iiB/Y+qfqntS8Je/Uf38+MKW9Aj4/TZ4k/73n9KbHLNLa1RpACjmAdxplCjENpiQHFEwOnnAx4Q0hs4fyvW0bbjgDfxuJ5oedF2rXn95Qvlcztw0a/ur7RD9hcJL8nt/gtS6hFUflvFOFYBHe5EApjkQICWaF7fWJRzk0vzRDJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712940064; c=relaxed/simple;
	bh=umUiePm8I6RGf/XKC4vkMBsO7eHAgtOOKjfxPpM42Dw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LyHUqauzEl594fjdpA3YLDsaaV4/Cz9BuC8OIiEJgx4arj7J1obcdaK2+Iaa2oqKXZUEnQ4lHQ7HrZPmjUmEbf/AeCFyOk+pZsz/czJfnOK74AA81WyCzAWl1wBC1de0oplIeoIZ/qiemT3iWkbCERVW/mRiQnImYkfawycFysQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kGTjHgce; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=quBh86e7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kGTjHgce";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="quBh86e7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43C60vZ2020815;
	Fri, 12 Apr 2024 11:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=umUiePm8I6RGf/XKC4vkMBsO7eHAgtOOKjfxPpM42
	Dw=; b=kGTjHgce7SVaEjP6CwqR9M6D+vSRJFg1Cggx1IA6qnEATmgQyyeUQXd0v
	zYUXjUm9ltU4sFQpUY6bncIe3onytr5sbN3c3UyjX/TIWsHaCPHonc9WAY2E9jlQ
	SegcUyxOxVJn+AjSyqjEChrJB2A6sl+DVXC+lz0xWcV646MojDbkPOsaYsY/HpGG
	JopByHctIFdjodmQMBzUgki8xxP7RhWo+VvaP7hBmVpettts8+xR/VpIv/HVjgtN
	cjQNBvMi5TFdQaUdddjQ5/wiFfiE7hdS1OUvuU6IlDT/mpq0OWTSVUfPnSLlKzdq
	QJEHn/SlnQZnEEao7rQplIluLI+cA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxrfkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 11:40:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSn2WbxrKz+u/50p16Q8y9wdLEya423me3RQSnWzcgIqbQwoa3DZNSXhsUSgTgx5klhf9Ec2SedkeQ3vXsq3bCiRFLaOg6QDDlVB2E6KGxH0FMMa2ryFxFWQBeIdng07nXUeNQcwHxcE692Am51LzLH0MQQDVEPeCQFuzUb4HNJNc30NuEtvrxeKNSvQf7+nY/IQWrDkIXDn4vTpoO8nd7bUX7H/IGiPq+FXuBZiN4dA+s7hQ0i/zLjVus36tFiBcegRWZMhYOIicuLz4ScomXbHP7Zgz0lx/7IK1SYxD3ZZkaDtneX9ZqZaeKngvtF/U16bXRw13chCwxTHrzYfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umUiePm8I6RGf/XKC4vkMBsO7eHAgtOOKjfxPpM42Dw=;
 b=NXDwtiiqVuMZ5/bF+uw82IMp/vVqf4iCBdfl9XpDb9ZI2YCpKU/3Xtia/kIivaiuIqvqr0XFJzGWJvnLIV5Zw1/0Mm0RPoIBO8ojTZsSnsgGNW0yzGPQNeCgh8px9LdTOgs+D/lDc/6WC5juY/2XXOKXmC8MQwP9lPRFIo/KVDXthAyJsVAgxQMiY2B953/ZgR9V4olSrSrhNtI7hINJWUEccKjLy+EJ2s7jrU7sOtuSfYXuFW1MDFtdlfGWt+N/VY1QtYvxzSip5KR+lJ6reJW19HJxNHuStFYAA3BBMJb81XLf9ZSEi9oVFw28EgxnAXIS+n1wdFXCL+Bu8Ojfmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umUiePm8I6RGf/XKC4vkMBsO7eHAgtOOKjfxPpM42Dw=;
 b=quBh86e78h3bSn/RHJs+519gu/cnMLTBfD+HNKlORx9VKup7Oe4BeRFLshLs26uepmq56s046FZLeuHHudJo2ut42o0qssLz6ir64kFmoCtWG1wqyT1WkISWFT81LLB1zbnUCiADNVaDLpIA2e79kSxhCf1xbnnfSVmoJQl9+QI=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 LV2PR19MB5981.namprd19.prod.outlook.com (2603:10b6:408:171::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.55; Fri, 12 Apr 2024 16:40:34 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a%2]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 16:40:34 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
        Jeff LaBundy <jeff@labundy.com>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Thread-Topic: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Thread-Index: AQHaicoHNR0TZU5ElUi1zSJTLRH+QrFk3KaA
Date: Fri, 12 Apr 2024 16:40:34 +0000
Message-ID: <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
In-Reply-To: <20240408153214.42368-6-jogletre@opensource.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|LV2PR19MB5981:EE_
x-ms-office365-filtering-correlation-id: bda654c3-fc4e-44a8-6819-08dc5b0f4656
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yHQOobUkNZfPGh86sv2cYko2BOlUPwjjDMrzRU52sfxJFGit9edXMW7NHo059I6013ef/4rdh2vFlQvTQHh7QT53OVIYDJDLSaXImLsAD4sp2KfgZFnRGsAPd8F55+dlQSIV/547ySk2rBIF4J5A3xeSebJ2ebg+G3OFllRw1+SfohIV27T+CoG4NCX+9VWndpytq3JX7OcI1a6X8rYU63iYnrZOWnaov3zYyxUZomzY0spTbuE3E/I29oekhEiod3Nawr0CvXT2Y+aMDZJNfoLU+a1+VhbVqxbRiunl9VYYAVNG89sPC8AEt3a3HXZ/Umd+/1H/Is3ypF16XDXeAP6lfAH1kc63T5L5A+TtNbwtP2pg+9d4I8EqDh4R8TSomrXosk2XcDJw+64GHaqDwPGZKBEG8QR+cIwoLgLB94DSOcYqd6XuufD2CFUMQ81XDZsy7ExcyZcJdlgdkAxSWL4oJOiSEX5KQ9eXMMb1ZQL6jg/V5nw7Vxh5XcmaZkPLm7dP3J6PghYe6qfMd1XzJ5K6lVhKaFJDZx4wmk9QXposU944Md4Yliiir//12Uso+GTeUS5KZYJjyS+T+MHT88ZXp2bT63Y765m/o7Qlgst6gKkgnK6Wvhh55YpEPE2jcQ0nP/bbLxbbOb+JaDwBiIrbYy+iaUQ8Mdfpg41BQT4pSWACWj6S6yhD8wnKHYV8eNC65kbF5uK4bcc6QtF0ExiFn2W9cxxyNukUWN0Gvos=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tnpvc2FNajRPN2JaN1NQYVRtcUUzU0ZpNDdWeDR1aW9meWhTWGJjeUpYdGtL?=
 =?utf-8?B?NTdjT3Z2V1FNQjlyOVByb0NjWUg0elBrOEZFYnpJdzBVU0ZUREI0enFnOTNt?=
 =?utf-8?B?RmpCYXUzOVU4bEV5Q0xkQ2JjNTFDcFhrZWU0aUNUcmVNVUYzdlJJTDNvNldQ?=
 =?utf-8?B?dWM2MFg4VzdZSDBpdkl0MUFPd0F0czNVeTJId1hsODFKSG1SaklqRkdCeU40?=
 =?utf-8?B?dHRKajQvaDhKenA3Z05vTnozNlFBRHdtTmFOSjRyYzloUzFxRmhRcXc2bm1O?=
 =?utf-8?B?Vk8wNG5Sb2dVbzNWVk95TXJWalUwbVRydVRkczBpTHEwdEtHdWx5L3hKVVVT?=
 =?utf-8?B?bE9Gc3pIQmdNYnl2NmRiN2JnVy80ZTVZYzl4NmI4Uk04bXlEZkZIQnkya1Jv?=
 =?utf-8?B?ckxBSnhXeURwUWg1MUJZZ3F4SXA0L1FHT0ExSHFZWjR6SWFBQmF0LzA5MHRL?=
 =?utf-8?B?UGxwMGZsOUUvMXVDVE1kK2srQUlGRFdzWkM1S2VUR0NRZFNScVgxak54T1BD?=
 =?utf-8?B?YS8wbHhnY3VSTXcrQ0gzTE5PTUpIRnZ3ZHVPcE95WDRDMlR5N3ZRRW14cnZR?=
 =?utf-8?B?K1JraXQzZXYxU2JnV2Nvczgvc1kvRFk4UWx6ODlVVE11WjFZbzJNTWtkeGFJ?=
 =?utf-8?B?eE5Vc080SDFmMjJTUjN1Zkt0M011MG5SYldRaFZIdlVEdEwyWE1RS2N5aXU2?=
 =?utf-8?B?djBXS1BMQmIreXlROEJNRmtya1VueFg1d05WRlQvekJYVjN1SDRSVVZtTFFR?=
 =?utf-8?B?Y0hwVDlnblZ2aCttWjNqR0JGS3I1cjhwZ2Nmc2dpUDh6VGdwQzlnMWd4ek8r?=
 =?utf-8?B?UnVCSHZZTW1hSTNZWXVKY2lMb3NkTUFzdG10Sm1KM0Z5S2JiOTc3Z3BKQWtZ?=
 =?utf-8?B?a1BNR2RaVmgyMWI4VHlwcnR5b0tYQ3puNExLaHdwQlpYaXhrcmpnNE9aMTlt?=
 =?utf-8?B?ZElZeE13Y21mbHVHakk5ZUhXYW1IQmdGY1lOV01tTEJ3WVM0SHhuQThQdWhq?=
 =?utf-8?B?Qkd1UXNjZ3dPckhVcWYreWN6Y1Z0dE03RHFNam82VkhROGpQTWkwR1pCYTVL?=
 =?utf-8?B?amgyZUR6Y0o2T3FheEJEMm1QRVJqdmpodGRwRCtQWHZQYVpHNVRZYjBFd0hE?=
 =?utf-8?B?L28yZnRNQldsTVRNWWd5c2tmYk1nL0xTOWVoU3hTbVBYSUZyN3UvbWZ5Vjla?=
 =?utf-8?B?cjMvNnZsRDRBVWNwTndmQTFjdTY3QThoQzJVcXRMVXUzTklIMlBLbDFEOVJ0?=
 =?utf-8?B?WDhZWENqTHRFSzRsbzg0VGlvTDBsTExvUUM3TnU2dkZiazQrc0JpUUt4a0xN?=
 =?utf-8?B?YXI5cWs2TGlJVnVrZ1UvZ1JIUGVBaUxXd1Ixc2lPc1AweHUvUFA2aHFwZm5n?=
 =?utf-8?B?YzQ2QzFyNUtZbmNJalYxZXhvN0JUUnRxbHlKY3Vtb25PS08wV1NTWmFBSFBF?=
 =?utf-8?B?TDE3aGhoNG1JazhubzBaY3pmS05wTlBwS2dVUFRYMzUvUW9WMFlUR2dhYXc2?=
 =?utf-8?B?c3J0QkdhV3dyYnZ3L0VCdUwxQjRTVWxVQ3U2Qk5sOFdEUDdTREVka0tma0ph?=
 =?utf-8?B?WU15eHN0RS9aSmVnNTlnWXVZY2RIRkExTXZmUTJuR0ZQKzBzbXlqWFZuaUU0?=
 =?utf-8?B?UGh3RUd6MkMrZzQ3TEw0d0dWQmlEUWtnTDg4Mml2dU1ZRHFmelJnZDhjV0R5?=
 =?utf-8?B?UWF2NnQwdENJYkpjenJxSjBSMUFZQjFlbmVEQ2VOdEpVaHBsRGZKYkl5M1JW?=
 =?utf-8?B?ck5xSDFveTVzNmRyZVJiRGhuemxXKzkrV25VbkhPRU1wZ0ZkeHRMdEdHV05u?=
 =?utf-8?B?TWNkWmNlYVdyYWxyL1VrZGl0ZnBaOEI5UjNCZ1JwamFJL3hVRWE5SU9OUXhn?=
 =?utf-8?B?KzBnakd1Z3dxQ2JscHlqbEY2dFYvZ2tkWU4rejZzRlEvaVZaZ0xleTVoczJ0?=
 =?utf-8?B?L2trS2dhOCtJaEF3UTA5M0RjeFZVZGw2OXBsUFlWbjh6R1hmWXIrY3p0SlFQ?=
 =?utf-8?B?WjdNcVY0d2xad1Fia1RJWk03anBsbXVPWjJaL3lOellzeDRtM0hqM2hNNitv?=
 =?utf-8?B?R3dZeWVPRmpYbHhzeTRlUFhOTFhyNm9pVjhZV21SbjVjUDd5LzJndXJHRDZP?=
 =?utf-8?B?L1grK0NEUTNBZTJBUWpCdUFTUW82NXZMSUQrajhSU3dxbWN2Vi9ra1A5MUNh?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AC0C3F3EE0E4A4EA4D1435D2320F9D4@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bda654c3-fc4e-44a8-6819-08dc5b0f4656
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 16:40:34.2026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eY2mdYM1Wy+kek60csQXPH8q/fN0zoX7ER6BAH9RkiVwv8ZRViiv6AAg3+litG1WGMWUuTnxDJ/GTidFf/gtyh3xyx/nGAclOYPbPkQNpQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5981
X-Proofpoint-ORIG-GUID: 5hs76efLwahcn-ozLtCX6yDm-hJLRtZI
X-Proofpoint-GUID: 5hs76efLwahcn-ozLtCX6yDm-hJLRtZI
X-Proofpoint-Spam-Reason: safe

SGkgTWFyaywNCg0KQWxsIGZlZWRiYWNrIHRvIGRhdGUgaGFzIGJlZW4gYWRkcmVzc2VkLCBhbmQg
cmV2aWV3cyBoYXZlIGRpZWQgZG93bi4gSXMgdGhlcmUNCnNvbWV0aGluZyBtb3JlIHlvdeKAmWQg
bGlrZSB0byBzZWUgaGVyZSBvciBkaXNjdXNzIGJlZm9yZSBjb25zaWRlcmluZyBBQ0snaW5nIHRo
aXM/DQpJdCB3aWxsIGJlIGdvaW5nIGluIHRoZSBNRkQgdHJlZS4NCg0KQmVzdCwNCg0KSmFtZXMN
Cg==
