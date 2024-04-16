Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32FE12CDB2
	for <linux-sound@vger.kernel.org>; Tue, 16 Apr 2024 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277190; cv=fail; b=HSkGkMcN5JVdV+LpuIScn5k8pWMw302tRbiNsFQdUZ6GP5rwl4dxW+qDFG2Em62YiCRYx5hQ37iw8MLt7VsyENoJ/ktKlb2OE6Sz6/bF04X7QBwBJLLsreeLpgzGefADN8xvnEIys0BB6WGfB7jPRumakuJPoyZyTGoTO3qBD1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277190; c=relaxed/simple;
	bh=jlGua6xQwQ7EXOETR1pFa7it+eU/wZtH+wSD7i9Uv7o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=un5XSiRio/LJdMhikf9oGE3QjZPjFc5bEM3DH+fRa3YfdBitz+z/OhEy0yNltoZ+qbF2GS80gfdbNoO1kgHleU4dYaO57dVGj4+qsY2Usw4sFAtCXGDQ6k4kBPui0AuKSVczLMwW7ryBT4xEizdyH6Jo1GhjdNOzG/TLWV++M1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kR6MSUKT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CTYNIPmo; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kR6MSUKT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CTYNIPmo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G5uYbX005067;
	Tue, 16 Apr 2024 09:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=jlGua6xQwQ7EXOETR1pFa7it+eU/wZtH+wSD7i9Uv
	7o=; b=kR6MSUKTITL/s3YXhKqdxUVn8TsmZwae6wARNuJnZ3Wp/4aqRWAtdQjC7
	xyi2o4nhrkJ7IVPi0sInRwW8qZLYYhO7Kdm6PAJAMbnx5MP2I9kmk0CzrgU1pii4
	QRQg8moImCVSzE7SEvJ39cYUJaU7Z6akgUkcZ/4MEYBRMQf9omcLbQoEPomrEw6z
	8OdWt/DCMZqwopzhH2MLwcmvz3WhEYvSjnRa0ebNAx1o2Qu3kTnEWKjAfl+PII7e
	PtXwNvOZvf9rzUU9D7w34Zkqf/qCpjxEwj3XA2UqteWyaWs8xQVS0VHWD9pYKdGt
	bWbiLWXPj2k5aR1q6O+BOPvbwVr1A==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xfpfhtna6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 09:19:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp4V1a96BM+ym+Y1TqdsUMLGzriT0y9kvszjdusu5S8d6Gujmg8Hhjimoic8TcCAHOfiNJkK3wBMD7h8bfqR7dAPttMSsli0oQNF5NgK5JQvzhcAgI1sQQ+dWxaEnKnOgEVeT8SxuJp1zHcNfEiwhZk8t07C6L6pGCXuFufTyhqFwi2ZxKxc1oRPq3gU1ROP2gfzTPtEE9rQ1giFcOxko+OI+1DhO2AqFNPqewI3iipTb2ZM8IHowI0zH7v6Yo+ZuSc4HiatCcSoemoUaMgnHjGnzgKZ5NQCqJ/p9U9WzNwGlzFWijiwvKoOeSax2SEVfeRAvnHDqEAs2a+JR2HRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlGua6xQwQ7EXOETR1pFa7it+eU/wZtH+wSD7i9Uv7o=;
 b=KZl+eIUZISPXHLz7yUudjjETtw4kK/MSA7kRJIDH8CZZaldCSfsCrvyrZppPva/nNGzKfUnUEOBqMKfT4j9KYWlGXE3gFd5cZ/X2FdE7N+GarBcecfi/VSz1WBs1B+x6bijdQYeEYqmB1STvp3mkReW3hjMEYFgD10V2HqfhQKOK8vFuw8D+7Au8QpNCvlHJlPtq1OWoJJm81Uwja+zTlKyOaRjQToJjDJ/SkqF8CiYtECX7yO8d20wF82AyiASEmYsgD4pIe7FwXB/sAbuI7OwB/UNLP2/9cQP5jCur9cSHszr/pH5n52RLOuMYmQMtbE1ibEDxgGj/97d5YFtzZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlGua6xQwQ7EXOETR1pFa7it+eU/wZtH+wSD7i9Uv7o=;
 b=CTYNIPmo2G/aREzIPAe99ZTKkG8okAPL/vp7Y5/brkRz0mCEZYBcQxX8rLzZqReb2/h7si8A6o63W2Yb97ZOGjEvogHP3PoLfEDFdzS32Zwk0hugyJi0eW1VxxctJXtqzNsFq4YsH2V4OZLm+Xdjkfd5zFHx2HAYC9//8sfo7wk=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 PH7PR19MB5798.namprd19.prod.outlook.com (2603:10b6:510:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 14:19:26 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a%2]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 14:19:26 +0000
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
Thread-Index: AQHaicoHNR0TZU5ElUi1zSJTLRH+QrFk3KaAgAKPU4CAA5KRgA==
Date: Tue, 16 Apr 2024 14:19:26 +0000
Message-ID: <16D7B274-B5E1-4546-95F4-75D6BCDD0507@cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
 <ZhuJsc5YaM+Hk7es@finisterre.sirena.org.uk>
In-Reply-To: <ZhuJsc5YaM+Hk7es@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|PH7PR19MB5798:EE_
x-ms-office365-filtering-correlation-id: 77e8a4a7-7fe0-4cbf-9a23-08dc5e2038c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zncLL6VkosJTG/wvZvvMs+LuF/8fdUEpk+y3RGXvj2BMpCvpKCfxB1NPXfgdtUiphvkAbyxi1ARCnRW/oObDPPxER+VXE3hptUHGEQ15NUEBDWV+DW50zkNMxN128lBh8B34BriHvzf20r5M1sqmR9+xXCE/ynd/vppZ9X2BXRB13xCzD02QPb8Dt9nTL+EfdVLJKX/KYu55q6kw4r4QLMKbt0/C1kPJhIfq6OmuHm+u14x0vx2LtTycMcpuLOUqlEiSVHG8W+1gXTdeCnkv7enZWnIN48h/P4okkcvC1AYPaQ7esMx6wtp9RcjEUQ9Bl5UMiDlh17OCk5r2Eq0xYb+8U7xQJ6EiJpX8nfEd4AM9bCtMLbFlwkC9L/P0uIykujxh+Yj4/4Y0QXKlfj/OVCHNo+HvJ/pAkolbYvFmMuhTxzhMt793JFSVhLXM+19NNwrgO6IXYbQqyWTQDu9yJtHgwZux76q+eFLi1ueWcrTlT0oO3ucSl32eGbS+f3iZn5A6ipyvRCZthn1bfHwVxg9u60i24FAytxUPxgxMitYLfwOZpuh7t7eJSGGXyOBS0H7kTPNt/IojpJge6zT1nD+C4SeZKVnI2HAhGtr+oRD/lM/9kTf+jpLxh77rUKR98nHu5K0g3AfsCxKSTTpvw56c1zZDaHSg1Jcuqzzfa2I2GXbjg924YKushKfhrw6Y6SIQYx+XI2FatF/y9FhF2j+3mSn9vPr48OBIxFIa8UI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OWxlUUZFZ0JNRmFVNnFubnZDMWhDaXJnbk9POVdhSS9ZRzY1YklHZ1pwekZY?=
 =?utf-8?B?a25SMWd6bUtIOTZDS1NQaHl0ZDNGOEFpcEpqYVJMUmgxZ25KTHFpNVBSd25k?=
 =?utf-8?B?WHVBYmF6RHRXaEtPMHBOZTBPS3NmQ0Ixcm1hOVJXNWdsMWZMU1dOeUFZYUtE?=
 =?utf-8?B?cUFIb3ZMSU1FUENUMXduU2FwNk5sZ0ZLNm04dVBjWURHNnV5cFVPOC91YWFQ?=
 =?utf-8?B?WDBaVE9WRS9ZdFhWS2puMmpDMmNsRzJRL2psNnNLczB4cGFaWTh2b0lQekNr?=
 =?utf-8?B?dDREeWpxdHhtYTVId3BXRWp6ZlNiU29MQXhjR3hyN001dXlMN0JOaG1jQjN0?=
 =?utf-8?B?Vk1SZEdoNHFhcTF0ZjAxTEEwRHB0Z3BwbnZIWXozemxoSzJVNVdOdGZ2Q2Jv?=
 =?utf-8?B?bjJvUkc3a0N2NG9zcmJyYTJDd0tIQzZKNTQ5S2FKdSsxTFI4U2lYTTF3aDdX?=
 =?utf-8?B?cmpqRGNxcTlneTl0UUJLNVF5TzIrTFJENEVKYTNib2VBaHZOajNMNnE3aysw?=
 =?utf-8?B?TEtsTExsQW1MYVJjNnhFai84cUttVEViRFRsditDMjNPS0pqZVBtemwvN2pz?=
 =?utf-8?B?SDZnbVdpTEgrbnVUTUErTEZuSjI1QnVUSy9MRmlJZW1qcitFSU4zd1FWZGVo?=
 =?utf-8?B?MW9jclJkbVRFWm4zbjJLeWdlZXhqWWtqYWVpZlFGcVlGOG54VUIyRGxRUFll?=
 =?utf-8?B?V0FIMFlNbWxwemtkTWdWQ2JFd0V3cUlhQkF5ZEZlQnFwUjRXTWU2M1hYSTdL?=
 =?utf-8?B?UXhTUG41T3V6anpwTlpnWTd5SUxGZHlyOUxsdytXK3VNYU9FVDVwMDVwSGVp?=
 =?utf-8?B?TkNsc1pmUDMyRCsveUgvQVR0d2JXVEgrK2ZicE5oY3VLUm5maWhvWEFFcUw5?=
 =?utf-8?B?THVqUnd0QVFiem1ud25INDY1TlljeTJ4bXo4UWQ3b3lVcGt5bEU1N1c1d0tY?=
 =?utf-8?B?ZkdmRUVGcWh3NDJub0pJNVNBbXFzTzJzeDJUaHJrQXhLN1JCRXltakdQZzBL?=
 =?utf-8?B?clhvdi8rUVVjVHIwbDVtSFVPODZuMVVyK3phOXhkeENOZmZxT2plbE83Rko4?=
 =?utf-8?B?WWlHSHl4TXB3eU9HYjl4OWd3NTBBayt6cHZHQStjWkp4Y0M1WTlURW8zSVJj?=
 =?utf-8?B?aUFIL1h6Z2VMenQyejhjNk1qY2VNVFBOcXNXU1BGOTlWQXBYMTN3RS80OWs3?=
 =?utf-8?B?dEZ2T3lSZWtXV0ZmTHExNFlXMG5VUzJxaGQ3NDFRMXlES2tEMDdzc0o1Wkl0?=
 =?utf-8?B?a0w4MVVqcGMxZ0ZCQWFpRmhQa3R0ajEwYzcwOGs0OWltdkZoSDVpQ3RjQ2xQ?=
 =?utf-8?B?cUwvVUk0Y0U1QW1IZlRwY2RQZXZyVG5TR1FHR1BrRjBSQy9CdGMwWHZucXF1?=
 =?utf-8?B?ZDdWTEdNaFdDckh5VzR5eVcxQ01tTjgyNVd4aHVOMHNSN3JXcFNWQnNqbENX?=
 =?utf-8?B?Y1pwMVFvdXp0bkpDUlZBUERORUp4ZDZFdU85cjUwaWxYcmZpeFFDSEhmdnhi?=
 =?utf-8?B?OE80bDI0UWpxaGFuKzNoSVprUzc2b0NLc2hLVXN2NmF4M2gwdXAweGRuN2pW?=
 =?utf-8?B?R1hFcXY1RVRTSks4VkJIM0k4Y3ZiOTNsWUNFb3N2d1Y1SFV5N0tNMjBxdm5p?=
 =?utf-8?B?TFNmc3FDUmttK3QvZ3MyK3Q4VlhlU1Qyd2ZqcGkrN0tYVW8zRUxSQTN5a2JY?=
 =?utf-8?B?WFcxa0RmYUNWL3F0TFlNQXVRV0pkOTVhZ3dtbUFRS25KOWtKVmluMDBVWGhz?=
 =?utf-8?B?blJtS24rSjRGLzBrL1ZzMjJPU3o2K1BWWlBNQlIrZHVVTDNrb0NFQ1RSQ0dm?=
 =?utf-8?B?cVk3YUpYSnNROEVRTXdoT2YzdGVYc0JIQUMxbVZzNkM3MWRzNSt3QU5UMG1X?=
 =?utf-8?B?QXZOY09OTnpWd1NlK3YwWkhwNnZqVXJpd1czOVFUYlp3anVEejdSQ0ZpWFJS?=
 =?utf-8?B?aE5pN2pzQXQ4a053amRLTmg1dWQ4dmhreFpSd2RYb1orRUZ6TWpoWDJoOEsw?=
 =?utf-8?B?ZlRlamVMRVhzMWs5NDJJVTNpZXNzQmlKTDV2dGI0Q1ZzbWJHNkMzdG9acm4w?=
 =?utf-8?B?d0tOTkdyNDZhY0xVSXZWZFBxSFBxSU5KRVVwYmJWSmF1QlpuTzFDbkY5aFoy?=
 =?utf-8?B?WnJZR2ZONmZuUk1JRzE4SnBRVUcxU1VSMWsvYldpNTdTZmhKazVYSHdyMEFp?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9930C09376FE2F48BDE795176B01458B@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 77e8a4a7-7fe0-4cbf-9a23-08dc5e2038c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 14:19:26.3655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEM3YNgjuuGc0bVqix2tOTXySqpltoNrtuibGCphVhtQi6/Oa24AiwWuhpMNPLHitmCAJjvIwTNiX/oZEEWrhIY/qQT6fvhweCBuDY+sELU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5798
X-Proofpoint-ORIG-GUID: Nf4dm6eIWoHL0lNMdMnO29Zd8qv9cTXl
X-Proofpoint-GUID: Nf4dm6eIWoHL0lNMdMnO29Zd8qv9cTXl
X-Proofpoint-Spam-Reason: safe

DQoNCj4gT24gQXByIDE0LCAyMDI0LCBhdCAyOjQ14oCvQU0sIE1hcmsgQnJvd24gPGJyb29uaWVA
a2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEFwciAxMiwgMjAyNCBhdCAwNDo0MDoz
NFBNICswMDAwLCBKYW1lcyBPZ2xldHJlZSB3cm90ZToNCj4+IEhpIE1hcmssDQo+PiANCj4+IEFs
bCBmZWVkYmFjayB0byBkYXRlIGhhcyBiZWVuIGFkZHJlc3NlZCwgYW5kIHJldmlld3MgaGF2ZSBk
aWVkIGRvd24uIElzIHRoZXJlDQo+PiBzb21ldGhpbmcgbW9yZSB5b3XigJlkIGxpa2UgdG8gc2Vl
IGhlcmUgb3IgZGlzY3VzcyBiZWZvcmUgY29uc2lkZXJpbmcgQUNLJ2luZyB0aGlzPw0KPj4gSXQg
d2lsbCBiZSBnb2luZyBpbiB0aGUgTUZEIHRyZWUuDQo+IA0KPiBQbGVhc2UgZG9uJ3QgdG9wIHBv
c3QsIHJlcGx5IGluIGxpbmUgd2l0aCBuZWVkZWQgY29udGV4dC4gIFRoaXMgYWxsb3dzDQo+IHJl
YWRlcnMgdG8gcmVhZGlseSBmb2xsb3cgdGhlIGZsb3cgb2YgY29udmVyc2F0aW9uIGFuZCB1bmRl
cnN0YW5kIHdoYXQNCj4geW91IGFyZSB0YWxraW5nIGFib3V0IGFuZCBhbHNvIGhlbHBzIGVuc3Vy
ZSB0aGF0IGV2ZXJ5dGhpbmcgaW4gdGhlDQo+IGRpc2N1c3Npb24gaXMgYmVpbmcgYWRkcmVzc2Vk
Lg0KPiANCj4gUGxlYXNlIGRvbid0IHNlbmQgY29udGVudCBmcmVlIHBpbmdzIGFuZCBwbGVhc2Ug
YWxsb3cgYSByZWFzb25hYmxlIHRpbWUNCj4gZm9yIHJldmlldy4gIFBlb3BsZSBnZXQgYnVzeSwg
Z28gb24gaG9saWRheSwgYXR0ZW5kIGNvbmZlcmVuY2VzIGFuZCBzbyANCj4gb24gc28gdW5sZXNz
IHRoZXJlIGlzIHNvbWUgcmVhc29uIGZvciB1cmdlbmN5IChsaWtlIGNyaXRpY2FsIGJ1ZyBmaXhl
cykNCj4gcGxlYXNlIGFsbG93IGF0IGxlYXN0IGEgY291cGxlIG9mIHdlZWtzIGZvciByZXZpZXcu
ICBJZiB0aGVyZSBoYXZlIGJlZW4NCj4gcmV2aWV3IGNvbW1lbnRzIHRoZW4gcGVvcGxlIG1heSBi
ZSB3YWl0aW5nIGZvciB0aG9zZSB0byBiZSBhZGRyZXNzZWQuDQo+IA0KPiBTZW5kaW5nIGNvbnRl
bnQgZnJlZSBwaW5ncyBhZGRzIHRvIHRoZSBtYWlsIHZvbHVtZSAoaWYgdGhleSBhcmUgc2VlbiBh
dA0KPiBhbGwpIHdoaWNoIGlzIG9mdGVuIHRoZSBwcm9ibGVtIGFuZCBzaW5jZSB0aGV5IGNhbid0
IGJlIHJldmlld2VkDQo+IGRpcmVjdGx5IGlmIHNvbWV0aGluZyBoYXMgZ29uZSB3cm9uZyB5b3Un
bGwgaGF2ZSB0byByZXNlbmQgdGhlIHBhdGNoZXMNCj4gYW55d2F5LCBzbyBzZW5kaW5nIGFnYWlu
IGlzIGdlbmVyYWxseSBhIGJldHRlciBhcHByb2FjaCB0aG91Z2ggdGhlcmUgYXJlDQo+IHNvbWUg
b3RoZXIgbWFpbnRhaW5lcnMgd2hvIGxpa2UgdGhlbSAtIGlmIGluIGRvdWJ0IGxvb2sgYXQgaG93
IHBhdGNoZXMNCj4gZm9yIHRoZSBzdWJzeXN0ZW0gYXJlIG5vcm1hbGx5IGhhbmRsZWQuDQoNCkhp
IE1hcmssDQoNClRoaXMgd2FzIHB1cmUgaWdub3JhbmNlIG9uIG15IHBhcnQuIEluIHRoZSBmdXR1
cmUgSSB3aWxsIHJlcGx5IGluIGxpbmUgd2l0aA0KY29udGV4dC4gVGhhbmsgeW91IGZvciB0aGUg
ZmVlZGJhY2suDQoNCkJlc3QsDQpKYW1lcw==
