Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795079258;
	b=PSfvxxRcRrIw6kw/SGEnshqA6etW5/GTHCN5vhh9EtUD5KTxacysfrQNLzBwHUNslF9y
	 Cw9xqlJ/PaZ+jEU7mR0hesmcMjZ48i5RTmtL4nF5kODvH/VCSqRQ4blXjT1nqWwY+b/cR
	 pv+kB0UXt+Zgv2bYWHkOf3pxJyCCvTMcXug42rWulsFfkv3i9vh+5gFMSXC+5xzbjnjZZ
	 F2XCsIzQfViHAOnXfmxBJZkr+y4yZsYUifN9hIJxdO837Rosz0fHe4w1fsSWZnK8hauNA
	 gR1kya2a5JF1JRSfGVHkKJj6DrEL9I1LBqcagHvgYoSI1MxC9IpBa/GlhtTNmCuW3wA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079258;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=thiTP6bKdLXHr2UUpvNos4kXK6SrEu9TRPrOMUaEdlA=;
	b=N1K0sBiCfx5l9dekkCc+UlBRuULqxFCxeUWuG9NtWRhzl3O7IXbRsMx8nMZFFMLGgYTo
	 RMgm2rQEfwigsQcl34sPSdbyxyFlXDdznmPbKrZ6R7s4HoWKAvpjFe8wkngi+fVZ9nnGE
	 Qa0JsJdUs3VhsLDXUKUnoqdbLDdoKo5CsUgSIEZB9ytAe4yEgKmz9cmDgUDzHtOH3cizu
	 gZ5fcEWYom7LtvDBxNmu/y2wlEpOQysZh908l1r5C6IwIIUztti1d5NK6kRd2e1ug/Nuj
	 XntlzMhYZza82lzc97EPmwQ9LzfqLsA8RTOmvfOwO+SjnwNpyKGRTGM4fmv/ns7M0XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aperio.ai;
	spf=pass smtp.mailfrom=aperio.ai;
	dkim=pass header.d=aperio.ai header.i=@aperio.ai header.a=rsa-sha256 header.s=selector2 header.b=l5uXTYIF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.142
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D2606A325
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 09:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3D2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aperio.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aperio.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aperio.ai header.i=@aperio.ai header.a=rsa-sha256 header.s=selector2 header.b=l5uXTYIF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HONGP+HewxuOPzqCCHtuDU4xjOiSf8SBd8qWNQqdsJKP9PV07jupbJVz5Qedc8cCmgNXuIuGPlKeEIUYb2Uqm1HmUx6xGamBaqsVXfCRb1YMnQDeplUPMXqRARn9WfhzkxmTZAKmfk0MgsIXFSVx0aWyi4Piat2A5ejHzN/dsAsJWhQ0wLLw/GzhtmWqo7Fhro3zEswRbOzZ3+tOmW6io5TiZHRS6bSlKtmMuvK+w2Ilw7ApBqRPoHxKSjnKG+w4fKD06oN/vMRXNH5PfNNBAwQ6dHCq9JB6GN4rfz836xVaORaB2tSGMiQnctoJ59Fo1lTeMZKzJ7yM2h4bN5NdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thiTP6bKdLXHr2UUpvNos4kXK6SrEu9TRPrOMUaEdlA=;
 b=LZpySBeqsX/5TCTFNOZQfId2bJ6wZvnTrBTb2l2qplJUz52C5Wr/t2dAn/PEs8JqJzYvkllC9Sya9E63mYwDexI4mAsQDbtcIsPmuEk4o9EEOfY5VumUDm/kLRsQ/KrDcESRZtLXq/bayVVLKc9fH356cTeHPjN/Ny3Kxhng99cIXvApqomuZAQF12fKObkroVs4ntZtSS1M/LuxlgBEJv4NpJ7xVEu8VwqEHX8Vmi472hiKndIXTCGyvDDiYqG1w/1Gs2vZZQAHbPM8PGQNTqRB9wy4cX+tnsLW1YmtHAIx+ElgQwVCx8WjZ31L20ZxUWmGDYtuQfT6w1gLIZvyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aperio.ai; dmarc=pass action=none header.from=aperio.ai;
 dkim=pass header.d=aperio.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aperio.ai;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thiTP6bKdLXHr2UUpvNos4kXK6SrEu9TRPrOMUaEdlA=;
 b=l5uXTYIFUc8edpqKeqBoblgJiB8NrrB2TeZk0NHtqSOfHP5rX3kEz4QJseDZYciZAz7Y70GAJ28xLCdnp5JJvMGlS8deI2WvsTc7f0cVWD7/FIMlQJxGNBEh4eSJpgtFA+kGmWwnuMDABeQNHLyaan9DhWhg2EwZw5q055KUUYEcQM8F47Qu1oEa0NOjY0v4eiXPEFy0vkAALtOaAUP9z92UpKG0lzbhuS16/LU5PcsBw5gsvHO7NDzn1FU0UN5EHXxv8lKnelZrwoNNrUiAXSWUaRPbuxQopY2o4psp9VWMJACMxGZGn4XEvkCn8xnD+SLy6h0ccVO668KQEYR9Vg==
Received: from AS2PR02MB10038.eurprd02.prod.outlook.com
 (2603:10a6:20b:596::17) by AM7PR02MB6323.eurprd02.prod.outlook.com
 (2603:10a6:20b:1bc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:07:34 +0000
Received: from AS2PR02MB10038.eurprd02.prod.outlook.com
 ([fe80::6d7c:ceae:bad9:76bb]) by AS2PR02MB10038.eurprd02.prod.outlook.com
 ([fe80::6d7c:ceae:bad9:76bb%7]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:07:33 +0000
From: Carmel Okun <Carmel@aperio.ai>
To: "shenghao-ding@ti.com" <shenghao-ding@ti.com>, "kevin-lu@ti.com"
	<kevin-lu@ti.com>, "baojun.xu@ti.com" <baojun.xu@ti.com>, "sen@ti.com"
	<sen@ti.com>
CC: "tiwai@suse.com" <tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: ALSA: hda/tas2781-spi: speakers silent after s2idle resume on HP
 EliteBook 8 G2i (8ED5), only a power-off recovers
Thread-Topic: ALSA: hda/tas2781-spi: speakers silent after s2idle resume on HP
 EliteBook 8 G2i (8ED5), only a power-off recovers
Thread-Index: AQHdeAUa3OgzNIYzik2ASMB5AlQLPA==
Date: Thu, 19 Nov 2026 09:07:33 +0000
Message-ID:
 <AS2PR02MB100381F36881B2AAD90C098F1C8792@AS2PR02MB10038.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aperio.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR02MB10038:EE_|AM7PR02MB6323:EE_
x-ms-office365-filtering-correlation-id: 698d8ba9-2010-4ec2-835a-08df461c8c69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|6049299003|1800799024|23010399003|366016|376014|261102123227099003|261022105027099003|261021121427099003|261022075727099003|261026121527099003|261028144727099003|5023799004|38070700021|261026140227099003|56012099006|10067099003|18002099003|6133799003|261009223027099003|4053099003;
x-microsoft-antispam-message-info:
 S51Gat6A2gVbXZeYllKX3yz4BU9IlpLm4hCab18CST1uK/4k5jXjPC8bU2ogEjOihWEo4NR1z/OpndlnvgsH1MEezxgG6T7IU3uHcA/RqrzI5P1dlHA/2xd6Xrnp/ExvkJE9R1NJtwLftNswp6SB8lyUwGjBFynBKI9LZWhIt1hZ75QvTEq6KcGEzuP92ZCYBYmwJm3Z3aEHOc2bYbsqhcAHpPjIlupboqLllejAtnQGsxTIuKduRvFfRmHboeolGJbddf+sZbLwn1S0Ml5PYLx3M3/se4Ww0bkcCsanlQcltRXtDZD0npcq3CUyvANBFgfHzDa56swZ0IjvVnpxd/QpYC9wCgg9kiCuoqujcdRnXUdq6yFB5AvJGiLBsDtODPZt1js+sZMrUViNlvv6Ybilard3KBfMwfdijLzVpqYHcgF398BRb9lYaXlyhNq9Fqe504/XHaBOOem1MF6kvE6uPJFP5Tfb+2CKb4ne4tyMpmotGEfqFfEulXIiQvcmdLF1ilZG+NqBdsA8/d+PLDh2MbxGBe8NhrTSRthylv5h2DvCKF1vnByri16xWcyBneKS5pvfaNTfe0v22HswKv5yVnXBVBpW7OnANb74LryhjXBcK72PrmeP0ScyVXbrR+D+HD1NsFcthxbZYUXEQ/xbyTzZoSIdyozurUJh28dTjH+/3xsY/+H837sXSPSyIlK2lqjbPbshVyq7dNgym6+iPaUke/gpO21ZrMfiZb0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR02MB10038.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(1800799024)(23010399003)(366016)(376014)(261102123227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261026121527099003)(261028144727099003)(5023799004)(38070700021)(261026140227099003)(56012099006)(10067099003)(18002099003)(6133799003)(261009223027099003)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OW2Fe+I8U0wzeizbNzKoX4qAvFwKh5N/GdBD1mBK049QXnN6lyv4h54zq8?=
 =?iso-8859-1?Q?GCOFs0I1V7VkdSZ4JRfCmRzLOKF+fbJ95ChcA0IhY57btL8WL8IpT5H2Sl?=
 =?iso-8859-1?Q?7KuazGOQgDOz3em56HAZjERiVIO0cyuk2HqTVppODKtyw8EHbRz/6KWPHP?=
 =?iso-8859-1?Q?ePyl7gz93RESsG/BxYfKF5KF0VmY0yEhmUR6Rzby7KTn9kSS8glHGYjrTN?=
 =?iso-8859-1?Q?x9WEpVs99oJvCReKIFQln9003qDqhqLTQfqFNobFjpdYapHkvGanZk94He?=
 =?iso-8859-1?Q?o1Al/osZkSP2BFAp+ISP25GFg6FyLJpYD3XH7gDKrXxsXRJxGDt0ml3SMJ?=
 =?iso-8859-1?Q?aNNgpSDaCib06J+3eMwFnc2NCoi4x4TSWeREUej/Wx6HZaWqrpMaeoMHnF?=
 =?iso-8859-1?Q?qptwyJQj4z0StVVBazF35GfK4YMhSr7i5eKFQWizmKd8fnfNjwl1LLMb9O?=
 =?iso-8859-1?Q?rB67gM7MgjHVqufgXxR7Ix+0McemGr3JMlxNl62BqUIUhHxjMJLRbLRGOI?=
 =?iso-8859-1?Q?1Li2xNYy6nQYl+gb6WJYajMfaeYhvyk/hoPJ/ZMwilsFlm7LHQxFNWDxUA?=
 =?iso-8859-1?Q?4g4xvx7Xfq1bbvJi1ofm50+x5HHlQUR1PG/wjQTaAir8XWIHQ6Jr7/kuvH?=
 =?iso-8859-1?Q?8cFSmzLEjK3bE9vl5agUzofbBG7D7Han+XvLIFalRnJ4sVF+mrCEQurIe7?=
 =?iso-8859-1?Q?Ipd10iM2bbBAkpT9sXAtEbHtVpo1ESXh8/hL2V0b2ADc0+VrXzMiwmB6BD?=
 =?iso-8859-1?Q?VhGmElody0pp34utjdU5ARyH/R7s960BrEjtJnZ/HrpCadJuEmxd8CKddH?=
 =?iso-8859-1?Q?MVFbpejzfHoddbSLf43Db3SvgGU4bhJxFmDaMmOLDmnnFHyg16i/bhNTsM?=
 =?iso-8859-1?Q?qmBxuVqkwPhiQPaZb3ZzL7TSWUlZ//a4h3MF1hTr331UnXSIAqX+LVpDfM?=
 =?iso-8859-1?Q?AHD1l3KPxr6kexcNMTsQTFnX1hpn5TrlQsX/GuaGYsleiEPnyF8Kd465xV?=
 =?iso-8859-1?Q?iu5QqLbt05U7PiXNCrmUqJd+ZgehFjy+0BpxTlBd2M0YQGp6ceuoV26CnB?=
 =?iso-8859-1?Q?CT5y8a7BQ8emVlfj+zePoCoyveCvUyyZ8NF9CkucDhGssRc64U0x+zk/Gx?=
 =?iso-8859-1?Q?ekFbKsg9FMvcXRkOOg0ihEf1a2/gSJAdg0pnEBm7VdPK6j1kPhq0FdUfrY?=
 =?iso-8859-1?Q?fvG+0HGn9G8vYHddIYM3RZqPhF23vPoiL2LvFJRQobLp3ebdDTazU9jpJC?=
 =?iso-8859-1?Q?V6bFPmFMQ0DoSYzH0UJilPsa5e8Aim2ruJ4Vv6UUjbjLe5TkgEFRo9faEK?=
 =?iso-8859-1?Q?bWRjPfVfVOWaf4O8gjUjjTwarn6743gQdEVuSz9eZdTQowcBemPTnyCfgf?=
 =?iso-8859-1?Q?zBzmrmBpjJyX36C091Vp6IDaKSHHLh69JGeLSeflVx0ncAkMACtMIqSNo5?=
 =?iso-8859-1?Q?wmR9QUruZLV99cBcuvtKsPkjwrHk8oVRGpYYDtLth/3QFwFhpH+L7SVxKS?=
 =?iso-8859-1?Q?qlSDjqJ9/yBMesTay9/LQRryfXvcW6IZsSBVd17aYDdLoCSr7eeNM0v3Fx?=
 =?iso-8859-1?Q?pQ3XUFFRrpgR2M2xlWuwTqk1Qn9G4lrGs50HksbH+dAlZ7Wul3UCF8y2bv?=
 =?iso-8859-1?Q?0vaNT4C0f/yv+Wt+2yCUG6RO4karPW8swh+H+XN22hs6B9j/A+zEGJiY7g?=
 =?iso-8859-1?Q?0qK5ZpqUlGb9hot/A83Hr0einE+QoitAIQVZpKHnVyz9HCX8GQYVF34C2k?=
 =?iso-8859-1?Q?NKAatYYRZqJ9qs56rnXOE3lNwQNXkcMpHBOXOylUybqWWt?=
Content-Type: multipart/mixed;
	boundary="_004_AS2PR02MB100381F36881B2AAD90C098F1C8792AS2PR02MB10038eu_"
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aperio.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB10038.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698d8ba9-2010-4ec2-835a-08df461c8c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 09:07:33.8559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f742f90a-70f1-4e0f-91dd-b800692cdf9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYNLYdkCNjJ1dX0WuqWS20zd4gcAMh5M76WBBemmiW3NByioiFNP8SjOFVUjZXwpVkPBddsFn/laVYHSbYdPow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6323

--_004_AS2PR02MB100381F36881B2AAD90C098F1C8792AS2PR02MB10038eu_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
On an HP EliteBook 8 G2i 14 (Panther Lake, SSID 103c:8ed5) the internal=0A=
speakers (2x TAS2781 on SPI, ACPI TXNW2781, side codec of ALC245) go=0A=
silent after a resume from s2idle. Nothing gets logged when it happens,=0A=
and only a full power-off brings them back. Headphones on the ALC245=0A=
jack still work while the speakers are silent.=0A=
=0A=
Hardware / software=0A=
  System:   HP EliteBook 8 G2i 14 inch Notebook Next Gen AI PC=0A=
            board 8ED5, SKU DP1A0ET#ABT=0A=
  BIOS:     Y70 Ver. 01.01.04 (02/06/2026)=0A=
  Audio:    Intel Core Ultra Series 3 HD Audio [8086:e428], SOF (sof-ptl,=
=0A=
            ADSPFW 2.14.1.1), Realtek ALC245 subsystem 0x103c8ed7=0A=
  Amps:     TXNW2781:00 -> spi0-TXNW2781:00-tas2781-hda.0 / .1=0A=
            firmware: TAS2XXX8ED5.bin (linux-firmware 20261019)=0A=
  Kernel:   Fedora 7.2.6-200.fc44 (when it failed), 7.3.4-200.fc44 shows th=
e=0A=
            same errors (see below)=0A=
  Userland: pipewire 1.6.9, wireplumber 0.5.17, alsa-ucm 1.2.16.1,=0A=
            alsa-sof-firmware 2025.12.2=0A=
=0A=
1) Errors on every boot and every playback, even when the speakers work=0A=
=0A=
At probe (both amps, every boot, 7.2.6 and 7.3.4):=0A=
  tas2781-hda spi0-TXNW2781:00-tas2781-hda.0: tasdevice_spi_dev_bulk_read, =
E=3D-18=0A=
  tas2781-hda spi0-TXNW2781:00-tas2781-hda.0: invalid RE from 1 =3D -18=0A=
  tas2781-hda spi0-TXNW2781:00-tas2781-hda.1: tasdevice_spi_dev_bulk_read, =
E=3D-18=0A=
  tas2781-hda spi0-TXNW2781:00-tas2781-hda.1: invalid RE from 0 =3D -18=0A=
=0A=
At the start of every playback:=0A=
  tas2781-hda spi0-TXNW2781:00-tas2781-hda.0: chn 1 r0_reg bulk_wr err =3D =
-18=0A=
  tas2781-hda spi0-TXNW2781:00-tas2781-hda.1: chn 0 r0_reg bulk_wr err =3D =
-18=0A=
(1202 of these in one 14-day uptime, 1026 in the uptime before that.)=0A=
=0A=
With dynamic debug enabled, one short playback also logs ~400 lines of=0A=
  tas2781-hda spi0-TXNW2781:00-tas2781-hda.0: Not error, tasdevice_spi_chan=
ge_chn_book ignore channel(1)=0A=
=0A=
So calibration (RE/r0) never gets applied on this machine. I don't know=0A=
whether that is related to (2), but it is the only error the driver logs.=
=0A=
=0A=
2) Speakers silent after resume=0A=
=0A=
Timeline from the failing boot (7.2.6, 14 days uptime, 23 s2idle cycles):=
=0A=
  2026-11-18T18:05:07 PM: suspend entry (s2idle)=0A=
  2026-11-19T08:57:25 PM: suspend exit=0A=
  -> speakers silent from then on. The only tas2781 lines are the usual=0A=
     "r0_reg bulk_wr err =3D -18". There is no other error.=0A=
=0A=
State while silent:=0A=
  - PipeWire default sink =3D Speaker, not muted, stream active; capturing =
the=0A=
    sink monitor shows real signal (peak about -13 dBFS)=0A=
  - Speaker-N Analog Volume =3D 0 (+11 dB), Digital Volume =3D 200 (0 dB)=
=0A=
  - Force Speaker-N FW Load =3D on (default)=0A=
  - Headphones on the ALC245 jack work=0A=
=0A=
What did NOT recover the speakers:=0A=
  - Switching the card profile off and back on (pactl set-card-profile ...=
=0A=
    off / HiFi). This starts a new stream, so with Force FW Load on the=0A=
    program/config should have been sent again.=0A=
=0A=
What did recover them:=0A=
  - Full power-off and cold boot. This happened twice: 2026-10-26 (after=0A=
    44 days uptime / 121 suspends) and 2026-11-19. I have not tested=0A=
    whether a warm reboot is enough.=0A=
=0A=
Questions=0A=
  - Are the -18 RE/r0 errors expected on this platform, or is calibration=
=0A=
    data missing (EFI variable, or a firmware issue)?=0A=
  - Is the amp re-initialized on s2idle resume on this SPI variant? Is=0A=
    there anything I should capture (dyndbg, register dump) the next=0A=
    time it goes silent?=0A=
=0A=
Attached: kernel log excerpts (tas2781-boot-7.3.4.txt,=0A=
resume-silent-7.2.6.txt) and dmi.txt.=0A=
=0A=
Thanks,=0A=
Carmel=

--_004_AS2PR02MB100381F36881B2AAD90C098F1C8792AS2PR02MB10038eu_
Content-Type: text/plain; name="tas2781-boot-7.3.4.txt"
Content-Description: tas2781-boot-7.3.4.txt
Content-Disposition: attachment; filename="tas2781-boot-7.3.4.txt"; size=8212;
	creation-date="Thu, 19 Nov 2026 09:07:12 GMT";
	modification-date="Thu, 19 Nov 2026 09:07:12 GMT"
Content-Transfer-Encoding: base64

MjAyNi0xMS0xOVQwOTo0OTo1MSswMjowMCBmZWRvcmEga2VybmVsOiBTZXJpYWwgYnVzIG11bHRp
IGluc3RhbnRpYXRlIHBzZXVkbyBkZXZpY2UgZHJpdmVyIFRYTlcyNzgxOjAwOiBJbnN0YW50aWF0
ZWQgMiBTUEkgZGV2aWNlcy4KMjAyNi0xMS0xOVQwOTo0OTo1MSswMjowMCBmZWRvcmEga2VybmVs
OiBzb2YtYXVkaW8tcGNpLWludGVsLXB0bCAwMDAwOjAwOjFmLjM6IERpZ2l0YWwgbWljcyBmb3Vu
ZCBvbiBTa3lsYWtlKyBwbGF0Zm9ybSwgdXNpbmcgU09GIGRyaXZlcgoyMDI2LTExLTE5VDA5OjQ5
OjUxKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHNvZi1hdWRpby1wY2ktaW50ZWwtcHRsIDAwMDA6MDA6
MWYuMzogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpCjIwMjYtMTEtMTlUMDk6NDk6NTEr
MDI6MDAgZmVkb3JhIGtlcm5lbDogc29mLWF1ZGlvLXBjaS1pbnRlbC1wdGwgMDAwMDowMDoxZi4z
OiBEU1AgZGV0ZWN0ZWQgd2l0aCBQQ0kgY2xhc3Mvc3ViY2xhc3MvcHJvZy1pZiAweDA0MDEwMAoy
MDI2LTExLTE5VDA5OjQ5OjUxKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHNvZi1hdWRpby1wY2ktaW50
ZWwtcHRsIDAwMDA6MDA6MWYuMzogYm91bmQgMDAwMDowMDowMi4wIChvcHMgaW50ZWxfYXVkaW9f
Y29tcG9uZW50X2JpbmRfb3BzIFt4ZV0pCjIwMjYtMTEtMTlUMDk6NDk6NTErMDI6MDAgZmVkb3Jh
IGtlcm5lbDogc29mLWF1ZGlvLXBjaS1pbnRlbC1wdGwgMDAwMDowMDoxZi4zOiB1c2UgbXNpIGlu
dGVycnVwdCBtb2RlCjIwMjYtMTEtMTlUMDk6NDk6NTErMDI6MDAgZmVkb3JhIGtlcm5lbDogc29m
LWF1ZGlvLXBjaS1pbnRlbC1wdGwgMDAwMDowMDoxZi4zOiBoZGEgY29kZWNzIGZvdW5kLCBtYXNr
IDUKMjAyNi0xMS0xOVQwOTo0OTo1MSswMjowMCBmZWRvcmEga2VybmVsOiBzb2YtYXVkaW8tcGNp
LWludGVsLXB0bCAwMDAwOjAwOjFmLjM6IHVzaW5nIEhEQSBtYWNoaW5lIGRyaXZlciBza2xfaGRh
X2RzcF9nZW5lcmljIG5vdwoyMDI2LTExLTE5VDA5OjQ5OjUxKzAyOjAwIGZlZG9yYSBrZXJuZWw6
IHNvZi1hdWRpby1wY2ktaW50ZWwtcHRsIDAwMDA6MDA6MWYuMzogTkhMVCBkZXZpY2UgQlQoMCkg
ZGV0ZWN0ZWQsIHNzcF9tYXNrIDB4NAoyMDI2LTExLTE5VDA5OjQ5OjUxKzAyOjAwIGZlZG9yYSBr
ZXJuZWw6IHNvZi1hdWRpby1wY2ktaW50ZWwtcHRsIDAwMDA6MDA6MWYuMzogQlQgbGluayBkZXRl
Y3RlZCBpbiBOSExUIHRhYmxlczogMHg0CjIwMjYtMTEtMTlUMDk6NDk6NTErMDI6MDAgZmVkb3Jh
IGtlcm5lbDogc29mLWF1ZGlvLXBjaS1pbnRlbC1wdGwgMDAwMDowMDoxZi4zOiBETUlDcyBkZXRl
Y3RlZCBpbiBOSExUIHRhYmxlczogMgoyMDI2LTExLTE5VDA5OjQ5OjUxKzAyOjAwIGZlZG9yYSBr
ZXJuZWw6IHNvZi1hdWRpby1wY2ktaW50ZWwtcHRsIDAwMDA6MDA6MWYuMzogRmlybXdhcmUgcGF0
aHMvZmlsZXMgZm9yIGlwYyB0eXBlIDE6CjIwMjYtMTEtMTlUMDk6NDk6NTErMDI6MDAgZmVkb3Jh
IGtlcm5lbDogc29mLWF1ZGlvLXBjaS1pbnRlbC1wdGwgMDAwMDowMDoxZi4zOiAgRmlybXdhcmUg
ZmlsZTogICAgIGludGVsL3NvZi1pcGM0L3B0bC9zb2YtcHRsLnJpCjIwMjYtMTEtMTlUMDk6NDk6
NTErMDI6MDAgZmVkb3JhIGtlcm5lbDogc29mLWF1ZGlvLXBjaS1pbnRlbC1wdGwgMDAwMDowMDox
Zi4zOiAgRmlybXdhcmUgbGliIHBhdGg6IGludGVsL3NvZi1pcGM0LWxpYi9wdGwKMjAyNi0xMS0x
OVQwOTo0OTo1MSswMjowMCBmZWRvcmEga2VybmVsOiBzb2YtYXVkaW8tcGNpLWludGVsLXB0bCAw
MDAwOjAwOjFmLjM6ICBUb3BvbG9neSBmaWxlOiAgICAgaW50ZWwvc29mLWlwYzQtdHBsZy9zb2Yt
aGRhLWdlbmVyaWMtMmNoLnRwbGcKMjAyNi0xMS0xOVQwOTo0OTo1MSswMjowMCBmZWRvcmEga2Vy
bmVsOiBzb2YtYXVkaW8tcGNpLWludGVsLXB0bCAwMDAwOjAwOjFmLjM6IExvYWRlZCBmaXJtd2Fy
ZSBsaWJyYXJ5OiBBRFNQRlcsIHZlcnNpb246IDIuMTQuMS4xCjIwMjYtMTEtMTlUMDk6NDk6NTIr
MDI6MDAgZmVkb3JhIGtlcm5lbDogc29mLWF1ZGlvLXBjaS1pbnRlbC1wdGwgMDAwMDowMDoxZi4z
OiBMb2FkZWQgZmlybXdhcmUgbGlicmFyeTogQURTUEZXLCB2ZXJzaW9uOiAyLjE0LjEuMQoyMDI2
LTExLTE5VDA5OjQ5OjUyKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHNvZi1hdWRpby1wY2ktaW50ZWwt
cHRsIDAwMDA6MDA6MWYuMzogQm9vdGVkIGZpcm13YXJlIHZlcnNpb246IDIuMTQuMS4xCjIwMjYt
MTEtMTlUMDk6NDk6NTIrMDI6MDAgZmVkb3JhIGtlcm5lbDogc29mLWF1ZGlvLXBjaS1pbnRlbC1w
dGwgMDAwMDowMDoxZi4zOiBsb2FkaW5nIHRvcG9sb2d5OiBpbnRlbC9zb2YtaXBjNC10cGxnL3Nv
Zi1oZGEtZ2VuZXJpYy0yY2gudHBsZwoyMDI2LTExLTE5VDA5OjQ5OjUyKzAyOjAwIGZlZG9yYSBr
ZXJuZWw6IHNvZi1hdWRpby1wY2ktaW50ZWwtcHRsIDAwMDA6MDA6MWYuMzogVG9wb2xvZ3k6IEFC
SSAzOjI5OjEgS2VybmVsIEFCSSAzOjIzOjEKMjAyNi0xMS0xOVQwOTo0OTo1MiswMjowMCBmZWRv
cmEga2VybmVsOiBzbmRfaGRhX2NvZGVjX2FsYzI2OSBlaGRhdWRpbzBEMDogQUxDMjQ1OiBwaWNr
ZWQgZml4dXAgIGZvciBQQ0kgU1NJRCAxMDNjOjhlZDUKMjAyNi0xMS0xOVQwOTo0OTo1MiswMjow
MCBmZWRvcmEga2VybmVsOiBzbmRfaGRhX2NvZGVjX2FsYzI2OSBlaGRhdWRpbzBEMDogYm91bmQg
c3BpMC1UWE5XMjc4MTowMC10YXMyNzgxLWhkYS4wIChvcHMgdGFzMjc4MV9oZGFfY29tcF9vcHMg
W3NuZF9oZGFfc2NvZGVjX3RhczI3ODFfc3BpXSkKMjAyNi0xMS0xOVQwOTo0OTo1MiswMjowMCBm
ZWRvcmEga2VybmVsOiBzbmRfaGRhX2NvZGVjX2FsYzI2OSBlaGRhdWRpbzBEMDogYm91bmQgc3Bp
MC1UWE5XMjc4MTowMC10YXMyNzgxLWhkYS4xIChvcHMgdGFzMjc4MV9oZGFfY29tcF9vcHMgW3Nu
ZF9oZGFfc2NvZGVjX3RhczI3ODFfc3BpXSkKMjAyNi0xMS0xOVQwOTo0OTo1MiswMjowMCBmZWRv
cmEga2VybmVsOiBzbmRfaGRhX2NvZGVjX2FsYzI2OSBlaGRhdWRpbzBEMDogYXV0b2NvbmZpZyBm
b3IgQUxDMjQ1OiBsaW5lX291dHM9MSAoMHgxNy8weDAvMHgwLzB4MC8weDApIHR5cGU6c3BlYWtl
cgoyMDI2LTExLTE5VDA5OjQ5OjUyKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHNuZF9oZGFfY29kZWNf
YWxjMjY5IGVoZGF1ZGlvMEQwOiAgICBzcGVha2VyX291dHM9MCAoMHgwLzB4MC8weDAvMHgwLzB4
MCkKMjAyNi0xMS0xOVQwOTo0OTo1MiswMjowMCBmZWRvcmEga2VybmVsOiBzbmRfaGRhX2NvZGVj
X2FsYzI2OSBlaGRhdWRpbzBEMDogICAgaHBfb3V0cz0xICgweDIxLzB4MC8weDAvMHgwLzB4MCkK
MjAyNi0xMS0xOVQwOTo0OTo1MiswMjowMCBmZWRvcmEga2VybmVsOiBzbmRfaGRhX2NvZGVjX2Fs
YzI2OSBlaGRhdWRpbzBEMDogICAgbW9ubzogbW9ub19vdXQ9MHgwCjIwMjYtMTEtMTlUMDk6NDk6
NTIrMDI6MDAgZmVkb3JhIGtlcm5lbDogc25kX2hkYV9jb2RlY19hbGMyNjkgZWhkYXVkaW8wRDA6
ICAgIGlucHV0czoKMjAyNi0xMS0xOVQwOTo0OTo1MiswMjowMCBmZWRvcmEga2VybmVsOiBzbmRf
aGRhX2NvZGVjX2FsYzI2OSBlaGRhdWRpbzBEMDogICAgICBNaWM9MHgxOQoyMDI2LTExLTE5VDA5
OjUwOjAxKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6MDAt
dGFzMjc4MS1oZGEuMDogdGFzZGV2aWNlX3NwaV9kZXZfYnVsa19yZWFkLCBFPS0xOAoyMDI2LTEx
LTE5VDA5OjUwOjAxKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3
ODE6MDAtdGFzMjc4MS1oZGEuMDogaW52YWxpZCBSRSBmcm9tIDEgPSAtMTgKMjAyNi0xMS0xOVQw
OTo1MDowMSswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAw
LXRhczI3ODEtaGRhLjE6IHRhc2RldmljZV9zcGlfZGV2X2J1bGtfcmVhZCwgRT0tMTgKMjAyNi0x
MS0xOVQwOTo1MDowMSswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcy
NzgxOjAwLXRhczI3ODEtaGRhLjE6IGludmFsaWQgUkUgZnJvbSAwID0gLTE4CjIwMjYtMTEtMTlU
MDk6NTA6MDErMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4MTow
MC10YXMyNzgxLWhkYS4wOiBjaG4gMSByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0xMS0x
OVQwOTo1MDowMiswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgx
OjAwLXRhczI3ODEtaGRhLjE6IGNobiAwIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2LTEx
LTE5VDA5OjUwOjAyKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3
ODE6MDAtdGFzMjc4MS1oZGEuMDogY2huIDEgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYt
MTEtMTlUMDk6NTA6MDIrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5X
Mjc4MTowMC10YXMyNzgxLWhkYS4xOiBjaG4gMCByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAy
Ni0xMS0xOVQwOTo1MDowMyswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRY
TlcyNzgxOjAwLXRhczI3ODEtaGRhLjA6IGNobiAxIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoy
MDI2LTExLTE5VDA5OjUwOjAzKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAt
VFhOVzI3ODE6MDAtdGFzMjc4MS1oZGEuMTogY2huIDAgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4
CjIwMjYtMTEtMTlUMDk6NTA6MDMrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3Bp
MC1UWE5XMjc4MTowMC10YXMyNzgxLWhkYS4wOiBjaG4gMSByMF9yZWcgYnVsa193ciBlcnIgPSAt
MTgKMjAyNi0xMS0xOVQwOTo1MDowNCswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBz
cGkwLVRYTlcyNzgxOjAwLXRhczI3ODEtaGRhLjE6IGNobiAwIHIwX3JlZyBidWxrX3dyIGVyciA9
IC0xOAoyMDI2LTExLTE5VDA5OjUwOjA0KzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRh
IHNwaTAtVFhOVzI3ODE6MDAtdGFzMjc4MS1oZGEuMDogY2huIDEgcjBfcmVnIGJ1bGtfd3IgZXJy
ID0gLTE4CjIwMjYtMTEtMTlUMDk6NTA6MDQrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1o
ZGEgc3BpMC1UWE5XMjc4MTowMC10YXMyNzgxLWhkYS4xOiBjaG4gMCByMF9yZWcgYnVsa193ciBl
cnIgPSAtMTgKMjAyNi0xMS0xOVQwOTo1MDowNCswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgx
LWhkYSBzcGkwLVRYTlcyNzgxOjAwLXRhczI3ODEtaGRhLjA6IGNobiAxIHIwX3JlZyBidWxrX3dy
IGVyciA9IC0xOAoyMDI2LTExLTE5VDA5OjUwOjA1KzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3
ODEtaGRhIHNwaTAtVFhOVzI3ODE6MDAtdGFzMjc4MS1oZGEuMTogY2huIDAgcjBfcmVnIGJ1bGtf
d3IgZXJyID0gLTE4CjIwMjYtMTEtMTlUMDk6NTA6MDkrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFz
Mjc4MS1oZGEgc3BpMC1UWE5XMjc4MTowMC10YXMyNzgxLWhkYS4wOiBjaG4gMSByMF9yZWcgYnVs
a193ciBlcnIgPSAtMTgKMjAyNi0xMS0xOVQwOTo1MDowOSswMjowMCBmZWRvcmEga2VybmVsOiB0
YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAwLXRhczI3ODEtaGRhLjE6IGNobiAwIHIwX3JlZyBi
dWxrX3dyIGVyciA9IC0xOAoyMDI2LTExLTE5VDA5OjUwOjEwKzAyOjAwIGZlZG9yYSBrZXJuZWw6
IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6MDAtdGFzMjc4MS1oZGEuMDogY2huIDEgcjBfcmVn
IGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYtMTEtMTlUMDk6NTA6MTArMDI6MDAgZmVkb3JhIGtlcm5l
bDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4MTowMC10YXMyNzgxLWhkYS4xOiBjaG4gMCByMF9y
ZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0xMS0xOVQwOTo1MDoxMCswMjowMCBmZWRvcmEga2Vy
bmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAwLXRhczI3ODEtaGRhLjA6IGNobiAxIHIw
X3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2LTExLTE5VDA5OjUwOjEwKzAyOjAwIGZlZG9yYSBr
ZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6MDAtdGFzMjc4MS1oZGEuMTogY2huIDAg
cjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYtMTEtMTlUMDk6NTA6MTErMDI6MDAgZmVkb3Jh
IGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4MTowMC10YXMyNzgxLWhkYS4wOiBjaG4g
MSByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0xMS0xOVQwOTo1MDoxMSswMjowMCBmZWRv
cmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAwLXRhczI3ODEtaGRhLjE6IGNo
biAwIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2LTExLTE5VDA5OjUwOjExKzAyOjAwIGZl
ZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6MDAtdGFzMjc4MS1oZGEuMDog
Y2huIDEgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYtMTEtMTlUMDk6NTA6MTIrMDI6MDAg
ZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4MTowMC10YXMyNzgxLWhkYS4x
OiBjaG4gMCByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0xMS0xOVQwOTo1MDoxMiswMjow
MCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAwLXRhczI3ODEtaGRh
LjA6IGNobiAxIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2LTExLTE5VDA5OjUwOjEyKzAy
OjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6MDAtdGFzMjc4MS1o
ZGEuMTogY2huIDAgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYtMTEtMTlUMDk6NTA6MTIr
MDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4MTowMC10YXMyNzgx
LWhkYS4wOiBjaG4gMSByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0xMS0xOVQwOTo1MDox
MyswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAwLXRhczI3
ODEtaGRhLjE6IGNobiAwIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2LTExLTE5VDA5OjUw
OjEzKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6MDAtdGFz
Mjc4MS1oZGEuMDogY2huIDEgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYtMTEtMTlUMDk6
NTA6MTMrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4MTowMC10
YXMyNzgxLWhkYS4xOiBjaG4gMCByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0xMS0xOVQw
OTo1ODo0NyswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAw
LXRhczI3ODEtaGRhLjA6IGNobiAxIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2LTExLTE5
VDA5OjU4OjQ3KzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6
MDAtdGFzMjc4MS1oZGEuMTogY2huIDAgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYtMTEt
MTlUMTA6MTE6NTgrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4
MTowMC10YXMyNzgxLWhkYS4wOiBjaG4gMSByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0x
MS0xOVQxMDoxMTo1OSswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcy
NzgxOjAwLXRhczI3ODEtaGRhLjE6IGNobiAwIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2
LTExLTE5VDEwOjE0OjE3KzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhO
VzI3ODE6MDAtdGFzMjc4MS1oZGEuMDogY2huIDEgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIw
MjYtMTEtMTlUMTA6MTQ6MTgrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1U
WE5XMjc4MTowMC10YXMyNzgxLWhkYS4xOiBjaG4gMCByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgK
MjAyNi0xMS0xOVQxMDoxNDo1MCswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkw
LVRYTlcyNzgxOjAwLXRhczI3ODEtaGRhLjA6IGNobiAxIHIwX3JlZyBidWxrX3dyIGVyciA9IC0x
OAoyMDI2LTExLTE5VDEwOjE0OjUwKzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNw
aTAtVFhOVzI3ODE6MDAtdGFzMjc4MS1oZGEuMTogY2huIDAgcjBfcmVnIGJ1bGtfd3IgZXJyID0g
LTE4Cg==

--_004_AS2PR02MB100381F36881B2AAD90C098F1C8792AS2PR02MB10038eu_
Content-Type: text/plain; name="resume-silent-7.2.6.txt"
Content-Description: resume-silent-7.2.6.txt
Content-Disposition: attachment; filename="resume-silent-7.2.6.txt";
	size=1942; creation-date="Thu, 19 Nov 2026 09:07:28 GMT";
	modification-date="Thu, 19 Nov 2026 09:07:28 GMT"
Content-Transfer-Encoding: base64

MjAyNi0xMS0xOFQxODowMDoxNCswMjowMCBmZWRvcmEga2VybmVsOiBQTTogc3VzcGVuZCBkZXZp
Y2VzIHRvb2sgMC4yNjEgc2Vjb25kcwoyMDI2LTExLTE4VDE4OjAwOjE0KzAyOjAwIGZlZG9yYSBr
ZXJuZWw6IFBNOiBzdXNwZW5kIGV4aXQKMjAyNi0xMS0xOFQxODowMTowMSswMjowMCBmZWRvcmEg
a2VybmVsOiBQTTogc3VzcGVuZCBlbnRyeSAoczJpZGxlKQoyMDI2LTExLTE4VDE4OjAxOjAzKzAy
OjAwIGZlZG9yYSBrZXJuZWw6IFBNOiBzdXNwZW5kIGRldmljZXMgdG9vayAwLjE3MyBzZWNvbmRz
CjIwMjYtMTEtMThUMTg6MDE6MDMrMDI6MDAgZmVkb3JhIGtlcm5lbDogUE06IHN1c3BlbmQgZXhp
dAoyMDI2LTExLTE4VDE4OjA1OjA3KzAyOjAwIGZlZG9yYSBrZXJuZWw6IFBNOiBzdXNwZW5kIGVu
dHJ5IChzMmlkbGUpCjIwMjYtMTEtMTlUMDg6NTc6MjUrMDI6MDAgZmVkb3JhIGtlcm5lbDogUE06
IHN1c3BlbmQgZGV2aWNlcyB0b29rIDAuMTc1IHNlY29uZHMKMjAyNi0xMS0xOVQwODo1NzoyNSsw
MjowMCBmZWRvcmEga2VybmVsOiBQTTogc3VzcGVuZCBleGl0CjIwMjYtMTEtMTlUMDg6NTg6MzEr
MDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4MTowMC10YXMyNzgx
LWhkYS4wOiBjaG4gMSByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0xMS0xOVQwODo1ODoz
MSswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAwLXRhczI3
ODEtaGRhLjE6IGNobiAwIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2LTExLTE5VDA5OjAy
OjI4KzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6MDAtdGFz
Mjc4MS1oZGEuMDogY2huIDEgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYtMTEtMTlUMDk6
MDI6MjgrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4MTowMC10
YXMyNzgxLWhkYS4xOiBjaG4gMCByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0xMS0xOVQw
OTowNTozNyswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcyNzgxOjAw
LXRhczI3ODEtaGRhLjA6IGNobiAxIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2LTExLTE5
VDA5OjA1OjM3KzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhOVzI3ODE6
MDAtdGFzMjc4MS1oZGEuMTogY2huIDAgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIwMjYtMTEt
MTlUMDk6MDU6MzcrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1UWE5XMjc4
MTowMC10YXMyNzgxLWhkYS4wOiBjaG4gMSByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgKMjAyNi0x
MS0xOVQwOTowNTozOCswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkwLVRYTlcy
NzgxOjAwLXRhczI3ODEtaGRhLjE6IGNobiAwIHIwX3JlZyBidWxrX3dyIGVyciA9IC0xOAoyMDI2
LTExLTE5VDA5OjA1OjM4KzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNwaTAtVFhO
VzI3ODE6MDAtdGFzMjc4MS1oZGEuMDogY2huIDEgcjBfcmVnIGJ1bGtfd3IgZXJyID0gLTE4CjIw
MjYtMTEtMTlUMDk6MDU6MzgrMDI6MDAgZmVkb3JhIGtlcm5lbDogdGFzMjc4MS1oZGEgc3BpMC1U
WE5XMjc4MTowMC10YXMyNzgxLWhkYS4xOiBjaG4gMCByMF9yZWcgYnVsa193ciBlcnIgPSAtMTgK
MjAyNi0xMS0xOVQwOTowNTozOCswMjowMCBmZWRvcmEga2VybmVsOiB0YXMyNzgxLWhkYSBzcGkw
LVRYTlcyNzgxOjAwLXRhczI3ODEtaGRhLjA6IGNobiAxIHIwX3JlZyBidWxrX3dyIGVyciA9IC0x
OAoyMDI2LTExLTE5VDA5OjA1OjM5KzAyOjAwIGZlZG9yYSBrZXJuZWw6IHRhczI3ODEtaGRhIHNw
aTAtVFhOVzI3ODE6MDAtdGFzMjc4MS1oZGEuMTogY2huIDAgcjBfcmVnIGJ1bGtfd3IgZXJyID0g
LTE4Cg==

--_004_AS2PR02MB100381F36881B2AAD90C098F1C8792AS2PR02MB10038eu_
Content-Type: text/plain; name="dmi.txt"
Content-Description: dmi.txt
Content-Disposition: attachment; filename="dmi.txt"; size=215;
	creation-date="Thu, 19 Nov 2026 09:07:31 GMT";
	modification-date="Thu, 19 Nov 2026 09:07:31 GMT"
Content-Transfer-Encoding: base64

CVZlcnNpb246IFk3MCBWZXIuIDAxLjAxLjA0CglSZWxlYXNlIERhdGU6IDAyLzA2LzIwMjYKCU1h
bnVmYWN0dXJlcjogSFAKCVByb2R1Y3QgTmFtZTogSFAgRWxpdGVCb29rIDggRzJpIDE0IGluY2gg
Tm90ZWJvb2sgTmV4dCBHZW4gQUkgUEMKCVZlcnNpb246IFNCS1BGVjMKCVNLVSBOdW1iZXI6IERQ
MUEwRVQjQUJUCglGYW1pbHk6IDEwM0NfNTMzNkFOIEhQIEVsaXRlQm9vawo=

--_004_AS2PR02MB100381F36881B2AAD90C098F1C8792AS2PR02MB10038eu_--
