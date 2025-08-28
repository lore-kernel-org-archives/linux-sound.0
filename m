Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazolkn19010016.outbound.protection.outlook.com [52.103.33.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4DB2116E9
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756409366; cv=fail; b=OxhJ0w8PSGlujwvtubBrbb8uk34E65+jffw9pTX43+eyO6Pxqj4UlWh0J9y4rGHCGgT+8LqGx/TQ9zyf1I46EkKHyxUP43r/i7vOtxQW64ce8nhNeSzyaQksgTC2WO8/jXKK75MiurxgNnGQuBsyYR2pr6MOdn88hfwIDpDLHio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756409366; c=relaxed/simple;
	bh=NBtfbictFxJczfgDgeQv3scEe+YqYoLT6svmU16VsXA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NeSSRAtDaCDjENFknwyY3E50K9gTKTGa8KjP0U0plVKq5ScP209pxLvL4Q18xb0uMrBWTcr8RVSulz5kDBwJU6ow4EEiCfCj6La7UII/fF+JLR3rjwe0VGJ19ogZlBSpiqnKu0B1gUaAX30DAO2b/z90qP/kBtMLETeij1OWP5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.fr; spf=pass smtp.mailfrom=hotmail.fr; dkim=pass (2048-bit key) header.d=HOTMAIL.FR header.i=@HOTMAIL.FR header.b=YJjGfqBa; arc=fail smtp.client-ip=52.103.33.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=HOTMAIL.FR header.i=@HOTMAIL.FR header.b="YJjGfqBa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s//+Dp864eWGD5bfxTKkvRwCdytCT0a/ZgrbtF3kZ2TrdAuf8eJzlD8LAmM3deLTVEZYpPsFfFlOTrcwmJ0GEqlIgMvdG5+UW1TT1jOskAd9Rs88BfwfK4myHmbkVukPVlCai+U6Z8JRXQysAy6wC/YwA9gUNjsSPDRHCgfAtFQh4QI3yyWxMKvrTjMm9g00wX+3uLUcH8vBYtihi4CDaStqAA9uHcHfkwYfFgc0LGGJQB/u4wlki9ayF4pnqMHuliSTrfjRBcFYwV6X6cDM7nZn8PnYibV3o/p77tZWUAZ3x8NVm1NOZAUKBX29mTcqlKYKiHQJn6Kv/3BZ4g0x4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBtfbictFxJczfgDgeQv3scEe+YqYoLT6svmU16VsXA=;
 b=r2c7aRV1Heb7MteyNMancwXaUbdC0GFb1ig3+ZXVP4Ss09Jocgedt6nnz52qh+S9SM9B3bMrnc70aJYJLLd08aOEUUdP1E8a+zSYxnELLSYJKZt+i3sElrbh5Q/Zo2eJVuyf1cUAKZKAMaxaXLeuNdTAT87d4Xwh+l5cN8u2aSCl3CsRQq4pBNKHELWwuI2C8BRmn9zElxzcOff0AJ4iIaxQyhF/tZcxtsP7mKXeCGYj1nF1cECkfhMfkxfdG0vZyCuUuAKRbW46xDKV7LQI8m9Nkl8kgDNXYILlSLOfXQTAprzAHNzviER3jhUK1GKG3Xc7QzH7B3Uz0QKuNbJF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HOTMAIL.FR;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBtfbictFxJczfgDgeQv3scEe+YqYoLT6svmU16VsXA=;
 b=YJjGfqBaBRdiQlMnHLUomaa1/77/wMDxCaECjGKkNI9kY3D1+ApL275kQuqQhR+yqsfc2jxHsuv0W5KYPezHTT2voojElzrgP4x8O4vWTIcaQ60lfxtMerNqQNi5zB+BOGRU/K7wOnGx9/lR74lHBeyKd5K1dyiys7hFlQ3t9Q6/qoObz6iSo7rw4hM3a1WD5juLBuHBbxmsYscWPBA5YhZoi5TKEDTDx5RmSIwm/MdvRYTCzWlCUXySJ31SbDfxylxu4qj1s+GJqOY/2+NrmYUgawG+/W/ujuPSf6lRusMQMGPf94Pvc7I5TPab9ikDv11NPua9HbwvaQz10r8NJw==
Received: from AM9PR02MB7252.eurprd02.prod.outlook.com (2603:10a6:20b:3ef::11)
 by VI1PR02MB10097.eurprd02.prod.outlook.com (2603:10a6:800:1c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Thu, 28 Aug
 2025 19:29:21 +0000
Received: from AM9PR02MB7252.eurprd02.prod.outlook.com
 ([fe80::c0bd:ea3a:d6f6:5b0b]) by AM9PR02MB7252.eurprd02.prod.outlook.com
 ([fe80::c0bd:ea3a:d6f6:5b0b%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 19:29:20 +0000
From: Yoan Molia <bostik91@hotmail.fr>
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Subscribe
Thread-Topic: Subscribe
Thread-Index: AQHcGFFAxYp2JIuozUOj/RgYI+fhsg==
Date: Thu, 28 Aug 2025 19:29:20 +0000
Message-ID:
 <AM9PR02MB7252DC33D85F2567D7536A12BA3BA@AM9PR02MB7252.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR02MB7252:EE_|VI1PR02MB10097:EE_
x-ms-office365-filtering-correlation-id: 938038eb-59b5-4320-42ce-08dde6692fed
x-ms-exchange-slblob-mailprops:
 pR6bHsz2grY+FSma4ZW4vINtDKtVDOOJsJ/dqrKlt2RbnYCc0AtJ/k5eaV0y9phiVXfgFMEIpmI8DCvji/QM12sp8wfh++37pPeGey9tNIt1o9B5PUhM6yzDAF1v3DEx0lMHR0Te+Gy6buUdrJ5CcTdiWmsZ6+EMwoSG2hXOqH4pcG/ZxYPFHyNgbJaCCGptcJeNL3qyId735SKsW4Aa53gtjCIU9Uj13aPwMIFqr2/rGuY9URItp/6GgGsWwvsWqy5Y9hKAqXL1NvIUO7cGO8vQfQMrExLlSgXGU39Onc6K55zv6N7CT7PGjhPcUl/5Vw8ER18nZMO8k5ACcmJXxvfnf17WRw5SgssuwgOAkNlnfjsMUzMeKg6qtyPDXpDoRQuDNeKkq9WEUt+Vdmk2l6lH5YYt2B7iP4ZufkGt9h3tJ/NQEC61QL10KjLkSPzulLoxuT36Burt0pct1ljwED+Cx1gb6Li551k2tToGkXVY0g4xO1fS+Itw1uJkT6lDfdWA1eQLZScp3XYQ5S8+askZz9RT6GiuWeZkzIpU410/84tukjKVNLnSG5OZ37g4
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|461199028|15080799012|15030799006|8062599012|19110799012|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 PvBhjcXmQQU0a5i3iF9T3J9tDOjCKzZrpV7khYfSYsksiH3UsMVcxzfvYzBzxv9pOqH1PBIreci+Ml8haRN53mCOt3Kj61wnPBe8CSfCYv3wHp+0dEUSTlCBKByTWbH8fZvYk0LPrzBzND4bHTYp7JrZkdcYX3nDqgtBJPFd43XsQr+cwvZjLEdetLIOvFKvQ28XMHJkEUgNk69kQPhJDYOkxP8+vVdrpxwM4dK79PcPxR7c3BQsEYaLUiXqmCO7h5HFVl6RVpYfBi2Uv5sF72e63evfdpn25VPP5ol6dJWGMMx4sIg1/DdMHGd1DPX8U/wKICYz4+wvkCUUTyDaxTanhDT4URpKrO06qarrJnaqNrBXPQBngI6qn6gaQ9yjXlGTS+AEg8H1IUVpWjpkLalvhCBD44cNCB+9ULuN3sMz1QJX03qdIMyCppwhRBtQGytn7D4iDj79WVp+Af56v/QoGKP9L3MrsxMNN4M/ief6kAlfXgzVOtWZ0ZjaUgd4dshry/1YWLYU9Adapl6cfp9fJUmNN5OUDZ7xGhpybJYW4oMhFx+zg9j6XVs7FTWWPJJTRjDIhAr9X9UwqRv5Ls06w2LGvzP2gHsuwYSid4iYg73hAPKqOREwQo7XS2tk8/DsXcMgKLx18sJD59ShSYgYmKKU0102qGoG1Kb3NZ5Pe3coNLx0IAJ4pUoKNu+KSZVVUxBskBQwnqQV9mn2qFEyFW9JpIj4rbTCpCSNndk8lo+ZL/s18oSkt8BCHgDw8UKRGBAlkACIn7PGobIkl+cGaIAtbHOSKosBXV3u7pVmNEr2PkPunM6YeDzou2HBP1b9jsHv9e2yQ3H+K9T6Q3qYacq7BlOGnQO/nFDxrspWkQjaj1O8SC0TOoeEbHg3Mra/Y19/g5jMR2fH8NgMJQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?P/dWnNH+kJ5lS/Vjv0rn2tFGlnqkN8o7YgElRXBAu5ulXsg0mB9PZQi1or?=
 =?iso-8859-1?Q?ByuK/K8nN6Oi7tF9zNTPDbw2lFCy/71QRdVqD7f9q7/jK22RMfLr/Rts7V?=
 =?iso-8859-1?Q?G+QeNzpC/a8qoZdjoCMjnZKntCaOxPFvyYSd8Dy/U3zEyRHJyiDaZ7zFcE?=
 =?iso-8859-1?Q?bnIwYI1W6d79uUzUVhPVlUz63l2BO4wSZTRg7ElFRYEDUJG3ZmoMwxC5cC?=
 =?iso-8859-1?Q?AXMdrMbotzECXnBTlOdHjDrDzmZEeTgNDOG9imfTi7CF36tkFWPUYTRBaE?=
 =?iso-8859-1?Q?+okCcfyQBSrSOPD6Ux09kyGLI9n2Ki7QYI3XtyiAkuxm86OanCtcZuHtGA?=
 =?iso-8859-1?Q?vnEMymyQiSLMVQJX5n87exZXNuOvwvAQsFHO1PgNsQ71ck4wtAdHuNTmz8?=
 =?iso-8859-1?Q?SlKACkjjasEnf1ujaWwbB3lAWCFusVxu0JcYYf3U9UB2RWzBhPGDTjuHZR?=
 =?iso-8859-1?Q?LAlYsvZeMIzDCRJ25/1q+OLgHD6QXbvVaHNEKlphLpZxLwsebhrwf4f1nI?=
 =?iso-8859-1?Q?8/Ed7DxSWRzfaIia1kn4h7ZWeKMmWCeKs8EYsZydvE64WgGrcozFaLLqhK?=
 =?iso-8859-1?Q?7OyWRW7ZLqBcRUNCrviUGNfJaD3NgrBAKp/tHRnE0833qAJP2qcUTplL8m?=
 =?iso-8859-1?Q?7w9xYXqCrtBd6S371ndABwISlczwmL4tAahei3El8d1I0KEiWcbEayB4k0?=
 =?iso-8859-1?Q?Ag5sV2Y0BCbCCiSM59542irXm07kZDL4C8ummmtzx6oFr12Wmi2UbXBkVK?=
 =?iso-8859-1?Q?eN5DHoAU4XPR1qRtk93LkmptFLmrjwfEJx/h5M5h2WKCGfgaH3JLx80sit?=
 =?iso-8859-1?Q?zlYeKNbEJXPbg+YdvjCa8GOMmyXSEyvWK3ESJMLbbLxyLwnKZF2z+0SRbV?=
 =?iso-8859-1?Q?V+N860bOz1FZpES0qxwWSASbAv+HaYRJbYkwHB0vYUGm+BcdkgAuYcJpET?=
 =?iso-8859-1?Q?4yDuSeobyTnvPzoQBDoevhKRF/CIWpEeh9mCH919PNpoXt9XcykMdWU8+v?=
 =?iso-8859-1?Q?QkBj43oJ+bsUnjwNRBjgZ0F8NAVMjV9hAkuPdBDgOgmhr5OnhEKsu684N1?=
 =?iso-8859-1?Q?2XKzS21RkYci8RlPPxCjuhEa4V1d2HVrT0bKZu3K5HuErafxnecjUgK+++?=
 =?iso-8859-1?Q?OQNzGbHJKxCCbSXC7u/ULdUEEX1bMXyp52RcuklMNWowEgU8wkIg5Qfq/a?=
 =?iso-8859-1?Q?BY9oD+oZuK98PLlW7/V4e65QZBCf5dhyQFABWpm3GEMLJ4K61m4EU7f0R1?=
 =?iso-8859-1?Q?Rbl3pKi+eUBFglEG4zh1KG/dqDWfjE4xj7KXbI5yBpHnjRVsWnoyjPhYFB?=
 =?iso-8859-1?Q?ni5P8IxmrsXUateaoiXgEKfyug=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-5faa0.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB7252.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 938038eb-59b5-4320-42ce-08dde6692fed
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 19:29:20.6177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB10097

subscribe=
