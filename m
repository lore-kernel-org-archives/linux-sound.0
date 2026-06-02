Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622FE3CEB9E;
	Tue,  2 Jun 2026 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394199; cv=fail; b=ELgsM5JFm3/3mLKSuJkvnULFaPXJ5KuLSoDsytxdwA2sQuQaJFK1VDFdGr3URFEj/Evt5iHxySpv+tPjMLGt5S3ohIBuVxI2PsqOsYIdpKDn2Xx1ABTjoCKQ/fA9hdaNQ4p16EaY1utMHvK/PAji7HVPGA3rZxUUoCpUWFcxQqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394199; c=relaxed/simple;
	bh=K/fFxsSZ7I53K7NMk52wlggX0a5T9XAirZPEgEsk2dc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ljVcLnBg8atykaRJ+5HASvqjNYB3QaOxIqvhvxNb2unXeIocBMzg8Y7zra4q9P0nRe3t2hINPywRcZsNibRPmEqSvzMD8UrXuAb62+Z1QU/0VV3VsfjG7OU8boXeLGIWA15hFNLnWe1L2Ftis6XEMYYx41hZWL7Zf8qDZ6OADIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PK8fIjM5; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PK8fIjM5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTszY4ZTHaaEt5aYqzC9th/nMrRWvtV1yDBsvT71Euv99e6fRg90sWGRYQOkExB6gCOWI+botqBFWgWdqGKc4mkS4VJoKHaPcI2mQmJjRnkWpuWoxzxmNeDn30TU1n5efA041K4GUR5eGWNIAeBZCXW2zJQuKoBDxFz9q0dD/gEk+ye7ONwPkAY5ws1GnObOIR4M3YPKvn67UAJd0EAIYuR4zFz207GFLSPb7goqancKrvyfGfspG+XL28YdK1X7jM2KoxvkubMJrkuoh24KFusglumFFzRCIEukSG1znvUu/B6QidoVaS8OuUHSqjAsmFE+XPRDGAzeQpH+GOwEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq2E9Wxq3aIFulz/7t511zU3CTMAhwZLBh0vcgR6iXs=;
 b=Fjs09O+2Cv5Kzx39jRaDGNf1fo2yqF09WX4JiIoKlPbHUYX0u1qGWCELqdo8r12JTQ3G/GUQXEzT7DMBkWRMiKw3OI4VNthFBWglLdTzjk5myF777nUrtjs53qitFytCJ01BL8JX25MnaCVN4T8FtxXOVzGGoCD7pATLvs/nH6QiFzx4GxQCGh3VP0MN2qZSAXWAc1fPqgWuBgOS82GPrHT+K6i7UJFMnp9372v8SKRSCxeg5K24kEbHT5+KR2FnOE4fCE1NNGXU/A4jiaPUmjUlBsLQyQkDH+bCMGfBW/o92KRi5FUhRt5zkWkfAkfnmTRAia+6r0ueF/IprbRT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq2E9Wxq3aIFulz/7t511zU3CTMAhwZLBh0vcgR6iXs=;
 b=PK8fIjM5jPU8N+NEveZBs+5mQoIna9vY1BHDSoB5QButjHY9FIGJz8JoHfkK7CQrdzVm68dL00I/uZXe3rU7LQyoZ5KptRMWwRYhj6YkR+KSFKPirMqjUHKSdo/A4Xsc6CQkHSh1pCzCFZN+UZbmYCG1m4EvD0pfQ2yD8l/DSU+SYbGRW8OEIRJ+Fmwd0TddJ+AtQmf6CbSTmVe77wyXmQHSCuM9E21jM9oeuvoaWSx7ne3/qTZQkMRLHnpkO80+9WsksnBfkxkc21TmkpyNEzLTAiFjm1BGE/yo9hz9PqCJ1PHpWcVZHfEykF9LDqlHZcczBRAn8dIZoQx8C6GWJA==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 09:56:35 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 09:56:34 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, "Chancel Liu (OSS)"
	<chancel.liu@oss.nxp.com>
CC: Mark Brown <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: RE: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Thread-Topic: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Thread-Index: AQHc8Z0AIGfcF6Fd3kykcLp7ctQtFbYp6xuAgADTwrCAADXVAIAAEjmw
Date: Tue, 2 Jun 2026 09:56:34 +0000
Message-ID:
 <AM9PR04MB835335465E6365FDADC1CE6AE3122@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
 <ea0e8942-75d6-4a02-8be8-cf0f7680f825@sirena.org.uk>
 <AM9PR04MB8353ED13E31C180953F8C9A8E3122@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <ah6X0vwXpayzcWXI@opensource.cirrus.com>
In-Reply-To: <ah6X0vwXpayzcWXI@opensource.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|AS8PR04MB7815:EE_
x-ms-office365-filtering-correlation-id: 5d53ccf4-8b11-41fb-64be-08dec08d3aea
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|38070700021|18002099003|3023799007|22082099003|56012099006|4143699003|6133799003|11063799006;
x-microsoft-antispam-message-info:
 aBXyDrn7nzA0vpQze2u6e+rRWeoZAwHOZvZke6MokqKBXbFeAlA+qos2KtLl40oLjrTMNlpW4IIq0qIua838nd8CDCigJwXkP+BMQcJUsScFuS69vbA3jBxl6Hf6u5IME0PLNMJwxYl8GQtQQI8E3poU8sHCCraESvOvI3mGYy5aAYYutoIA/NlnR7uAXKVJvmp50BOqsiZirXlytX814gNxCPeJM4skkAEbc4FCqsv6DW6UsHsXAnNt/GkAcRGpTngI8SYKvPjLrzyPZNMErOYvMQkMdjxnxEVon6OK+P/1Gq4oPLWKh5XfOJXC5nZcSy9JvqeNoxxCGM1KozUROTgK+gYK9VPnCbHV09KhfbYFb7j03ZUTdCgrfWFuAxjBIQ6ZM82+aeXh6tgINfL2NMdeuYviVtcC1pJjFjlSJLGTTryzZ0wiOvd3U5Xc4fA1+9N1eDfI8yVwqhBlFBv3Yk0CkSXOl8qVQ1in/BWDsi9e/Xhgj1Y+OPSVzH/O4kcAKoMUf8cG6VOzAbooRKOL22Pt9Cevy2YNjBsE2g52jWIti/WGCtgCCTU0YaMwIc2B5PpEHWIVD09mUmGQEd8ZZbpLe6a8bZXAMqMRr7nwtTowh6lB0P3mZq5x8pTMhi5LbJLqcokdB3vn+ZfsVgkkUn9pVMhYcle7Kc1KPKp6m7RWf1xQVncH7Sx1yO+bs5EQa5u+F/dFY6fI4ifdZA1eh7VGvltXJzJuFtozy8lVwHKbECtm+JHVuHp/NUqt7z84
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(38070700021)(18002099003)(3023799007)(22082099003)(56012099006)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CnA7dljA6K4M6UK4u/9fl3dT6xyR4QyNia2qOR9QzW4kpgTTD07nhXCarNif?=
 =?us-ascii?Q?YAi9JGv1Viv0Z6sCg+a7ILeycCY9B2nT4elMAM8Bp+aFzuloibDrR/bOkFjB?=
 =?us-ascii?Q?8l5XI9nmkDcgI/uOLjsvaPqWc/Cf9EigdD6aTC/DvD1Dr3G1qqthnCpf5h4J?=
 =?us-ascii?Q?zmwraHey+GB2rhKxOp0MPMn/tIPl5FWTzuovVJu0XVwmkNTUThnHLH7QAMz8?=
 =?us-ascii?Q?+LCQp8QemYUIwBHB2WPkCDoVt9wmqeHTS46lvLRNujC8y1ePh8a7mh/z4Bhk?=
 =?us-ascii?Q?Y2eB6t42ZSqbSFIDkBKMUY0SIH0po33TNAlEpgar/J3+mF348byaYzg1e2jR?=
 =?us-ascii?Q?CBqnICTzLm/eOHshiY1zGSZ8fOYekPWA/zaJrL6lpnqRHdVrfKYhfW4U0V7f?=
 =?us-ascii?Q?QTha0fJfT/pCOz8EXMqF31LFSg9FsSJKx2HK+KrduNrRD6d2BEdrMOzdkLEt?=
 =?us-ascii?Q?GRJXAytomo1pLokpNQzUTOhpyJTbE/pFLiSBcce3ZUwIQFzM8Bd1WSJFeySn?=
 =?us-ascii?Q?gcVIqpUL9E2OiZd48ThoqBzPsPp6XJ587yPvpUcjoHiAybzNKMDEuy5qgBa4?=
 =?us-ascii?Q?BJosKpMFd302Xzrfsq8OjB97LeaSCeHnWUVnpjCb56Tkjgd1+0aBezMWXgMI?=
 =?us-ascii?Q?pi39ZTgzK69SXG17qHTKC0ewRFJdvum/uWIah11ctx1QP51AfgYEvydL7h84?=
 =?us-ascii?Q?houCkxdyobisFeyREAFbbdjYSYMK6jzDxb9INsl0B9EjqTzY91RKb31P0dZy?=
 =?us-ascii?Q?8kAl8oHAPxr9YgDeu9AgSQRyDRCh6Itd8yUXGkSihD2RXjh2RyWOSDWRpoc3?=
 =?us-ascii?Q?bgL5+kNFvvOIwmp3QC+RRwqLBnXmhqX4ybvZJo9CUkOAnoIs//9xkoIPDfBC?=
 =?us-ascii?Q?Ked+2mgsalRGPBsjZigAsTnNTWSutoTvBvmw2w0syLsBWBWLNfAzuYXyyxYB?=
 =?us-ascii?Q?9W0DabdByB6NMVd991aOS5OM5DuPKW51zecS0AV3Sd7q+3gxdwgTUz5cCNX7?=
 =?us-ascii?Q?j1WM13lvgpJwv1rQjY99/9tlzcwspU30sLSRRzCS7rsIZlSkwXFfARdXMjrF?=
 =?us-ascii?Q?IQ/9uGV3nDq0swVUCEuY4rZkRX7q6Ho/lKIXDr0uX7+hhljBBAVtZk0Xyi08?=
 =?us-ascii?Q?YdWVBkWpXLO+/2HMdSte/3yGZLzE7Xrv+ngMS54wzxWhdCg/hpJi/r6B3co4?=
 =?us-ascii?Q?Mm/ddLnsCJN/CRSRYqU75lSmk/3Nw+7wBkwvk9H0+zg8pvD6zLBrVuZlJdqO?=
 =?us-ascii?Q?b4ciMiWPJ037CshbXzDXFwr9vbotohov3giWnogKKYnsB+7BFwUINCLSHLv9?=
 =?us-ascii?Q?9F/t0c349DMsmU+r3xVy3+/d5JMBfxv8cMFRglYnDOc4GIx+cu9Qu3pi0Zj3?=
 =?us-ascii?Q?vQTWDm1mLmnsqNhUsHd+asr/fe1ZC35azq6RF0qdl+cB6TUGtVR4qtdc7q5V?=
 =?us-ascii?Q?mO936DYO7jm2zourvHIN4jJg4iL3hFBjFt0TgLDWLlDTfUqB3YpTG58+/3yC?=
 =?us-ascii?Q?8LQ5/jwuOzIlcnHidD3BSH9erOj7qzpXi7aZeOcAvVLEM53tpNk0ekXzd1cq?=
 =?us-ascii?Q?yoxy3uAVi7J3eO+bNnJ+m4whxufK3YT6Me+O0YFYazm3vbm9jBY8LX+9mEFZ?=
 =?us-ascii?Q?JoAG5tuG+U065dY5OtDclMK1em7UTAgYt02JvHYDmwZZYhXJDRQiRcwIeVSy?=
 =?us-ascii?Q?TxSFYV7oppBuEa4Unkae35SxKv2IQEXNzUPW5ZRY3CYcqzeOWvj8hBvcNrzH?=
 =?us-ascii?Q?5+0zrcWtaA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d53ccf4-8b11-41fb-64be-08dec08d3aea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 09:56:34.4015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTHHJ/K9fgyhxv0P0vAo/+J3Minzkm4xiR0uuhCNTGa1ToDJi12lQOP9j5dRFUf5WrGd9cbLcZV8pT3/82Y8aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

> > > > The existing cs42xx8 driver only supported I2C control interface.
> > > > Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio
> CODEC.
> > >
> > > > + * The SPI frame is 3 bytes:
> > > > + *   Byte 0: chip address [7:1] =3D 1001111, bit[0] =3D R/W (0=3Dw=
rite,
> > > 1=3Dread)
> > > > + *           Write: 0x9E,  Read: 0x9F
> > > > + *   Byte 1: MAP - Memory Address Pointer
> > > > + *           bit[7] =3D INCR (auto-increment for burst), bits[6:0]=
 =3D
> > > address
> > >
> > > > + * We configure reg_bits=3D16 so that regmap treats the address
> > > > + field as
> > > 2 bytes
> > > > + * (big-endian). The chip address byte (0x9E/0x9F) is placed in
> > > > + the
> > > high byte
> > > > + * via write_flag_mask / read_flag_mask, and the MAP register
> > > > + address
> > > occupies
> > > > + * the low byte. This produces the correct 3-byte on-wire frame
> > > > + without
> > > any
> > > > + * custom bus implementation:
> > > > + *
> > > > + *   write: [0x9E, MAP_addr, data]
> > > > + *   read:  [0x9F, MAP_addr] -> [data]
> > >
> > > What about INCR?
> > >
> >
> > Indeed. This patch doesn't handle INCR. I'll enable INCR after
> > reworking on write_flag_mask/read_flag_mask.
> >
>=20
> I don't think the driver does anything that reads/writes more than a
> single register, so one could probably just set use_single_read/write and
> punt on handling INCR for now.
>

Even after enabling INCR, I found in my testing that the current
configuration still issues single-register writes during
regcache_sync(). So for this case, INCR is not actually exercised by
the current sync path.

Given that, I agree that it's better to keep this series focused on
single read/write accesses for now. If a path that performs true
bulk/raw multi-register accesses is added later, INCR support can be
introduced as a separate follow-up.

Regards,=20
Chancel Liu

> > > > +static const struct of_device_id cs42xx8_of_match[] =3D {  {
> > > > +.compatible =3D "cirrus,cs42448", .data =3D &cs42448_data, },  {
> > > > +.compatible =3D "cirrus,cs42888", .data =3D &cs42888_data, },  { /=
*
> > > > +sentinel */ } }; MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
> > >
> > > This should have an update to the bindings as well.
>=20
> Thanks sorry missed that.
>=20
> Thanks,
> Charles
