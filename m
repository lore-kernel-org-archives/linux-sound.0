Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021079.outbound.protection.outlook.com [40.107.42.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B91362
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 00:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765600; cv=fail; b=To1xg6aHF8MA6xnWCbt9g4j01ZDfwkehBu58GHPRZbvigYwR8UIsajLmPO0UUehen+UZk+ZxkuOiM0XzmeypPvh71mixZyMNDh7dFHAhBOfVDJnyab8JZrFJtcsXWYiOPfL4Hrc3cW6WY/H1PX9SG+mgeH6ODWTZugMbStm3ieU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765600; c=relaxed/simple;
	bh=u6RJyPRaNa0/Hq9GW0qzRJxyEmjZRspPNnFIa4YhYTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gg26kHbzDwjr6vUA86FquQDfAPYRtVMIfeE8qjPWLg59HNsbnDqlJRPj113/8TUPmHfMBFFtBJ2Faoa06n1ACXI6E4tqGiXow6CMcZVF26VfawAwI0ZdbkrQ7aWXORmvoHRLkdwqIy+xkFl3nvLGFq02dPApn6fQRVjgvV1Vx5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com; spf=pass smtp.mailfrom=irondevice.com; arc=fail smtp.client-ip=40.107.42.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y53foYGujvMHZ0P4oz1UkWCfmZW036/XGIauWx2SMv0UbMZZw221hao2y3bMpYgiwBQzO5AxUkv/Qmd2lhcTVUNQDs8FyGBHQaZuutS6KdMAKvZ28r2oxpm2rkrLzxBrvzmjNJqsUBJmY5/7wY6qh4vL19WWGxZqWj02JGJDOMHR8Fi0lQAsPcacAsJj3Xc1mxxru/PyBbEEz62LMA+VfcRiuNpwrtlAnrgzjkyfZFqZJaSHq19bPyejURoO96q1bVAIhD1ULyOuUrlHor57tvn7BPEagAnkMRNimt/JBtytwnHzDf7r4SfUwoPDYVWbxppc5gQHauMQ83j4x6rQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CldjaKsd9f+YQnUwTF/cg1WPt77EwmN3hJ57kcJrIDU=;
 b=fJFFZpIl3xr5mTKO6A3So0LIKPTzWehKyL4mcOlYTc255psTzXugpxsFDUJhcjvtTsNOmmVt/OkrRMyC9rJXTZbeGOXMI+qFb2YhsrM3WdGko7H3OqFPMH1CZzLs71w3O3/jn5xxg49Bw4I4BozLiDXDxnHvqygh0Bfz40XBgQO7FG5c9W7EV0j0/tPv5JqCIGj1CW4H4U/sQpuJilly4mSEDuUxVt06SwT0y+ZiEZFtyctjQq4cdMtQtTOky/1A8ftYR/r1nNLNSDkV80PjovG6qI0lzQAbsGGRTLbR2KE5sKoPQ6cWdUYztvp8rh3kbY4u7n0559Nq/E0fIUxINg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE2P216MB1554.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:13:15 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%4]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 00:13:15 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Topic: [PATCH v3 2/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Index: AQHbLouL2+/MqzUHxUKyUndLgrXD9LKmuk8ggABtXQCAAKofUA==
Date: Tue, 5 Nov 2024 00:13:15 +0000
Message-ID:
 <SL2P216MB233729EDE4CD19BF6092E8488C522@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20241104-irondevice-sma1307-v3-0-4bbe79895f54@irondevice.com>
 <20241104-irondevice-sma1307-v3-2-4bbe79895f54@irondevice.com>
 <SL2P216MB2337F87E4E884158CCE77DA38C512@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <45c69c35-cc52-4fa2-9212-821a7f841b61@sirena.org.uk>
In-Reply-To: <45c69c35-cc52-4fa2-9212-821a7f841b61@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SE2P216MB1554:EE_
x-ms-office365-filtering-correlation-id: 0f462ad6-7c6a-458f-676c-08dcfd2ea4cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fXKIHjHBqHGsmbvEHckRMWSZp2JM8hJV2aDiKOw1nEeHPkmVKzrCDn3zE9UA?=
 =?us-ascii?Q?js+e2hC8+7k7snW6eWrhdE2re8XznPQ7YnOEXDVNu9CrKU2czcYaCu+3X+yN?=
 =?us-ascii?Q?kWRd5oK80NRDomzk7A0QMRhx9MFzhFDbrr5QExughMFeIyMLbpHVKkCbF3aN?=
 =?us-ascii?Q?MHJeRGIe8q3k6+giUVrDHk+sjaI6dQYy6iHIeBWtih8CMSC/jhehYmaI7Q5L?=
 =?us-ascii?Q?imiohAJN0uB0Qx0NACN9wtg2YkqbWSiZ0e/Dq8RWY78BfUZnfgIiptUEezIb?=
 =?us-ascii?Q?TbZzCiGTqdB/9Hx1STTorF+/tW+qHRN9Uz3OAbdvqPybUh6tpBgDBjzHx2Qp?=
 =?us-ascii?Q?QMXzx0BG9Yg29a4vWlkQbmw+N8aSk8D5z1OahXFnNYd8DX0YDMO0JDCynsj3?=
 =?us-ascii?Q?MFoXivNfpiwHyv7cTBLMKR1bDb/dZ0ECRPhQufwbSrJducVkvqPSBAXKsaIB?=
 =?us-ascii?Q?eOspnCkQjuBwzF94Na2sS0y98KRLBcjoWauFbor362LAxQcyPvaSY416RY76?=
 =?us-ascii?Q?8NJVugSAy3SjLQ2la5W9ObHRTsWVqijV5Y0LTdGEVYnJq0P2Ig3wDFkf6pXe?=
 =?us-ascii?Q?oCsV2oiZDwK6bcfsuSlGRG+rOXxtEQa87bfsEJkjUSLYHoMh8ZFmX7WzrhuS?=
 =?us-ascii?Q?POwjk90EDh0lPgvvmPPxtuLlmY1dZs5CK2FOMJcjAY8xPDOaBbdlnhvXAIkz?=
 =?us-ascii?Q?ezudzh5+Yg2TlEo6aFDnNEokn2pJdKu+JXSTtp7N65J0PTyFFW57rAqj3AaT?=
 =?us-ascii?Q?ZnnGU8O7wXad9UXOyAxfsZlKLrvGhijaUE47Bv2Gf1H8fHTooDnt8zIvTLI6?=
 =?us-ascii?Q?lbrt9jeXKVC+nNAsphRbWjt+tAhGkOGxhy+1FRDA6k+WD2KAWvRD7tx+BIct?=
 =?us-ascii?Q?b3RbzPTYWIA+ZSYK6g9n71F3hgAewinpvEKqFSO03+dpcJ8jljuhgwLz1g1L?=
 =?us-ascii?Q?KQeGY2HcV7M1WvYe7eUNWSTAc53rS0OnDNDkcgrJGQwFLascFq2utd/raErM?=
 =?us-ascii?Q?aVQ3J8CHaSczdX5npP5oInpExwDjoEE0z7KK3N4csfXrhwemH+QrEOxzNMe3?=
 =?us-ascii?Q?8Yb/19/hyKn7V2n05rQE4griS1nvXQCcWrHbhfzAp8tAC0q+NGP1L8aG//W3?=
 =?us-ascii?Q?CfPP0JqIuU52qdJKvjZHQtbXo2R4dsF10Y2vMaj7492NFCHKpPwY4BE/kRYS?=
 =?us-ascii?Q?S2DD8SxKAFEkQcQ8mpMfQfO29Zh7v6/SPEaVXo3n9unlbkm01m//roF4Yh7U?=
 =?us-ascii?Q?JIPPlkLcEHY0DbnuJxNUVhv/rXccZQV2oFFZLRK7vzr5JAvcqOMxd1w6nbs1?=
 =?us-ascii?Q?vrqhp778z80Jt5VtwotCLlAuXJLeye43rHYeHdktr4dR5k7TB2tQWu5YD6QI?=
 =?us-ascii?Q?TZDRqdxz97IijWWkhANHwW6grGIh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8a4Sfadpo8y/j+hqigcXOe1S9NULNLMdB9Edq9HPTAvKyvjFgkSdP27kzvP1?=
 =?us-ascii?Q?9+ERaqIhfEm/palCIf/ErJ/vlSHhITMex+BdxzRHyIZymScevfl47G41NBwn?=
 =?us-ascii?Q?cUR9QzbKKHNFRRIkUypLF5cwShVL/EcbLII64R11p2SkGWJRKIwT/usBQXd7?=
 =?us-ascii?Q?9ds1qfzirqFujOS6micXIKL6NCtb488/cFFonmsJ2Ud3HBkz58qk3yUnVgd6?=
 =?us-ascii?Q?uCxuAmgT+KnCPcFLJj/2sIdxQSWolD3XVwjPa8Dx4mnDMRRwfgqTCyLBGJhI?=
 =?us-ascii?Q?a+Q9rMVTJKmxw1/iOtohML1EJKyAJWGVBU59GzU6v7eUrYz4aPNT5aNrz2kk?=
 =?us-ascii?Q?IlaQUn0pMras9g3QHs6AIDWodC0L4doLN1n1uMCrmp6MZNlQf4hwG9ECE7aL?=
 =?us-ascii?Q?S6FWDB0MmWj9OIl23YM9HRdkk5Nbz2XZbU95XOZt98Q1u8oatuN0tR7mG+Yd?=
 =?us-ascii?Q?10WK81Ch3DP/BtihpW8vfDCnMEcROzdI+NplrhbRWTcxTtnLxoUcTENecRAc?=
 =?us-ascii?Q?YbymhPCxm4vTqGnX1Z0vyM9RN15172BVrBRZBSjPMHPU8MCXQ+XH+/dMR0tz?=
 =?us-ascii?Q?0lXIH50w0Q1BCyYFnuTehJpzImRE+oyjEhQ+SY6snUwsoarF0wtpHEY2KMOH?=
 =?us-ascii?Q?aasrUvLVYMNf2ygljeLhgQDHLx2JwuSUeCd7Cpdy2rDXLG7b3V2KW6vvmmpf?=
 =?us-ascii?Q?sMpzfmsGuhv0i9DAxnrU3+Q0IGWWyMVJBrxnShpebbovZjd+0VbQn+pOI4Pl?=
 =?us-ascii?Q?gFq3wY8T5jm83k80Jo61wBkpYZzC0dZbFz0sGnzjq+WaEoR+hL021vfqM6kP?=
 =?us-ascii?Q?xPKi54m0k5auyzo9vnhtf5PH79kDk/ylfss1oIkINI2auXuVu+5tN6COMVQ+?=
 =?us-ascii?Q?qqrk/ARkWULcN8IFA0KafnlwDQvrt9ERFPcCrKAOwt7IOxpxJk4o/WElhmfU?=
 =?us-ascii?Q?EAZnS6HozNHvjqZfkNAx3lUdg11DDnSstiR5l7Kj8nzrgREpX1Wu1XMCIik+?=
 =?us-ascii?Q?CctrAJFN821OLGSRg391Ta52BJt5H1XA6C5XK1aKc+W3r6+MnpTBj8uD/nTs?=
 =?us-ascii?Q?e2kWhzaqDhol4uZF9z2XqY/EuNnm8VDmBlXQHFQ3M/Arc0DJsf4+NMXcRuB+?=
 =?us-ascii?Q?3oA4I8XzPoCPtrQEU4qhthlZWi/mzfE2rarCEYIYnHgo9L5d53MikDlNvn4z?=
 =?us-ascii?Q?9UBilMbcVvNXCR1+wI/a1kYqmm36LyhDfRuvTJxZhg/zM/9j6ZHfcEwgE95r?=
 =?us-ascii?Q?oVDFjenlECrTJ6cHFmFq7KvsrHYyQz+3LFseuxl6XfwP4Vcb3F9Eg8Pfnqra?=
 =?us-ascii?Q?sNvfBXZ5VXBlYxA61TONFw4rH/SBsZX4USpoRbxEbYrBShKmRvHgSPlr73xg?=
 =?us-ascii?Q?9XEtIMFrnZl4f4Uie+jQdGIdwyjishJ8qv9hkVr4m2pB6vsobP+NlJdJJewU?=
 =?us-ascii?Q?QqiCHibbEY1HIzGzKD5cI06MHx2B6vYG60wawbYV39Efwhq+qwhofs5mN4eT?=
 =?us-ascii?Q?zyHCrvIekz2bZtCS9wh0blzZ0pZWuuunN8mBedG5b3vfkXMaeChgzcbCpL3j?=
 =?us-ascii?Q?eDZz4gT7da4pn3c0jrGXJXkvvWk/K1fBEl+zsBVt?=
Content-Type: multipart/mixed;
	boundary="_002_SL2P216MB233729EDE4CD19BF6092E8488C522SL2P216MB2337KORP_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f462ad6-7c6a-458f-676c-08dcfd2ea4cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 00:13:15.4696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2anYqOj5X9ojlDqO927x+lVN4zB9JYcSIWOkD70KVWh+S6r5TrEMa3KsjO4Kj7mk4KOtKdjDlYHn/OcegX4aUHIw9d2XVQX4gkzE6fGSkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1554

--_002_SL2P216MB233729EDE4CD19BF6092E8488C522SL2P216MB2337KORP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=20
> On Mon, Nov 04, 2024 at 07:33:50AM +0000, Ki-Seok Jo wrote:
> >
> > The Iron Device SMA1307 is a boosted digital speaker amplifier
> >
> > v2 -> v3
> > 	- Use BIT() macro
> > 	- Changed the value in sizeof
>=20
> The changelog should go after the --- so the tools automatically drop it.
>=20
> > ---
> >  To                         |    0
>=20
> This looks like it got in by mistake.  Other than that things look good, =
I've
> fixed this up manually.

Thank you so much. I appreciate it, and I apologize for missing that.
I'm glad there are no other issues.
I will revise the DT-Binding section and send it again.



--_002_SL2P216MB233729EDE4CD19BF6092E8488C522SL2P216MB2337KORP_
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: signature.asc
Content-Disposition: attachment; filename="signature.asc"; size=499;
	creation-date="Tue, 05 Nov 2024 00:13:15 GMT";
	modification-date="Tue, 05 Nov 2024 00:13:15 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBQUJDZ0FkRmlFRXJlWm9xbWRY
R0xXZjRwL3FKTmFMY2wxVWg5QUZBbWNvMUVrQUNna1FKTmFMY2wxVQ0KaDlBeTdnZjhEZHR4TFlW
QnFSTnB3UU9VLzJIa3BBKzhaMDg4T0tHMUJkdld2L2ZNcUJySkhXcUE4dTlIcC94Ug0KSDUwNTNK
QlZHbnl1cm5yaTRQLzBCOWp2dEVnMEVWdTI3bE56Sjl0UmRxekdKVyswUWhpL0wyNURNTVNmNG85
eQ0KK0RmWmZRUHE3R3pFSk9EWHd3WE4zRlRPTCt4Z05uK0YzMDU0WWg2N1pwNmphZ2xPb3h6bHEx
eFJYU2dPWDZsLw0KWCt1SW1yTVpYQmN6K3JKUm1pYjVpbFdudnN0dkhrNFVJVjNQY2JzbGFybC84
ZVlKOUJ6bk1xV0pscFkyZWgwUQ0KZi9NUUtwc2UzK2hlMnRPNWd0WGowaFBreU1xR3krWXM5b1hj
TGpPQzVkc2dVWTFoemlXcnNIMFFDODJQQkp3Nw0KUjU0Y254Q1FDRWpHbDhPRWkvZzJUNXJyVDNK
NW9RPT0NCj1UbHZxDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

--_002_SL2P216MB233729EDE4CD19BF6092E8488C522SL2P216MB2337KORP_--
