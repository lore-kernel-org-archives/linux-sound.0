Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022082.outbound.protection.outlook.com [40.107.75.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296B82E3B0D;
	Mon,  1 Dec 2025 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764576906; cv=fail; b=sTUkbLkk3c3FykUD37fNao9UmlQ9LYoPW7uIoANl9VV5COS92N+fosp0s8rOIMNr8anNgvfl8QzYm5703hKxnVwKbh9shvpX3vftZ0ezYE1aBvz0qWCj6AJY3kV8qa4GOsZSuCJD7DJ2v2qdYfdJDhvYicq3MKAlUq0pR46wE9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764576906; c=relaxed/simple;
	bh=obtsKhbnTuoBSMk5foxADL2eYryVeGFTIOANxhCA2Pk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hn88gG320wcwRHHDfBZnbYhvdoHbzW23emsSAZrihpsds/FTGSITHeaWhUPUigOiQkkZeMhXe+cEdM4u1CJnSN6UFnCze5h/6WBvI8YNWxvAuQQDXXh4Em9jJhdRjY+hR/Q5HzESLh2+YCpvk1pduXaflyGKyNt+ot0DwNB0e5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMJ+yETMSvXBgvjWcd5xg6UkU2kV8NNL9yMhqygYSib+K8md7m7uJa4ztdXlIKSnbBCQB9doM3794M9w9Hq3xvJ1jnCnxcKC8dYkVlNAwLDWuJ/+sarLKYV6Bpdt1m3G7cy9qO4PVz7upkeYwHW1o7SDjKY0XPYsiyc8G5p8E0m7Msv6tIVRWmf2DYOa5gGMWBE5oGx5IRPeqiC7nThPVnXKPdCj+ojQUDkhM6EdS0SOpOVtbUh6ob8tFVAhjXG8F5elT6Q3n/tJA5kiSe8XLiwtgD11NyMLxLkNBYuXxkFWS+Ml36k5eymk+wpKphk/IZaRkk9ZdSUeGMkuMer/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgrJJ8g0uvte2NhJbsXHW81ERyyusDp5Xhh/y7LPG1Y=;
 b=eJiP3C5sp2B3PADX8RyEVwAxAgYdvNNfiv28zs7z5OyF5TG3bUwfZ1cjSDBIQgRILJotpEy9w1MgIDU29fc5zA5gDsVAnG6k4HDzneDC21BCX6UJcXGKudE4SeWEwy5Swpbwe+WY8s672QAzQ+rQ11rXXHTeY1ViyeG/B4jEmzyUlASP0qVEE+PogCo5B89fh53QWcaI7ius5Xux+R54XyyObruydgkWoHr/ZXTguB84jta3ppMFP34wAu3dXEERcEPZCCW3FVgSL4sDgmTRfiRv1h/eO4sNDuQ7tQVxikpN4r4KjnNnQoWno77P7F5LAJzFfHP4UbTOSOqfJRRKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TYZPR06MB6639.apcprd06.prod.outlook.com (2603:1096:400:45b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Mon, 1 Dec
 2025 08:14:57 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 08:14:57 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH V1 2/3] ALSA: hda: add bus callback for address
 translation
Thread-Topic: [PATCH V1 2/3] ALSA: hda: add bus callback for address
 translation
Thread-Index: AQHcSY3fXpnPYF79REi810Kk8OFzRrTcH74AgCpLopCAAhi+gIAED+iw
Date: Mon, 1 Dec 2025 08:14:57 +0000
Message-ID:
 <SEYPR06MB62263D352405481E3046320782DBA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
	<20251030110928.1572703-3-joakim.zhang@cixtech.com>
	<87pla3joop.wl-tiwai@suse.de>
	<SEYPR06MB62269EEF81C53AC28278694982DFA@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <87ecpi842g.wl-tiwai@suse.de>
In-Reply-To: <87ecpi842g.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TYZPR06MB6639:EE_
x-ms-office365-filtering-correlation-id: 56a9b1de-243a-4a7e-3ef0-08de30b1b72c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DQpwi3LaCdKbCkJiZbKlP5KYhqkBGXKdYWQpyOxJGgoQK8+iQfXGOpSy/aN2?=
 =?us-ascii?Q?V2KASNJujle/zjI7wNzrRoD24ym6ftbpXymESSQlivRIRbGFp7KaCrOg3yLu?=
 =?us-ascii?Q?gQLLH/d97TYE0+Pxu16PLlPeNGRHKRTzegN7rTeC2lL6LtDAsd9I8rRgPw5t?=
 =?us-ascii?Q?a90PsNEA5oI8qWZ0amVuhjBFrxza+sl2cBU1O26wz0w7qT+TMkyYFN8+EyPU?=
 =?us-ascii?Q?sLOJFJV5t2F3dQ8Py4M0/pQt3b7GO6LPzGptCA9CHnUnT5JrUEac5hqFPh/V?=
 =?us-ascii?Q?tUZScM8AT/ZEBRtqyc4Mgv0Rys6So5As3jvdrR5EMdM5SwixkwfbpO+8Rl/9?=
 =?us-ascii?Q?Jeqt+0oVAPbK39VEMYHSJStfEafY7dq74AhLbFICSVpGahX2SECLODQ65nol?=
 =?us-ascii?Q?4sNH74jbomKGkyzZ3kUwDimLJQW4eYaQ2u3ZQjHbEAREvX67P4mefxFcT6xA?=
 =?us-ascii?Q?6sG4ETw730rZsRT5PQbCyJDA4YY/5M6lfFGyAEsRmQ3PJnTvHRWzQmwD1y1X?=
 =?us-ascii?Q?k4ZbbaVBp87JHR93gQFVvZ2xs43ZoS6YluQhfC3jO0axsoUN+01AP+hZ73hY?=
 =?us-ascii?Q?WVgf+ZbmjFsnP3gGS2Cokw3TUtRL+uARsnlMShXi0axbW3iWFwufPFlhuB4i?=
 =?us-ascii?Q?7ORDPaua/J6ZtgL2wByk1vYqdzRoZKma5iOU58juaEvI6c8sC3t+HNJGD5Pj?=
 =?us-ascii?Q?keANpRkkjmHNn0kg8T3I7dPTZyezoo8fjjj2VBuaQqHJbFU4f79+0xXc6CvE?=
 =?us-ascii?Q?YcwZfmTZ0k1KRmxD8RAmy3errJsKXXBjefkbmMK9BeCsXRUDTGoeNhSElgQg?=
 =?us-ascii?Q?DQJBVFSWplnGUS6MOuXYQ1l0K4e6fpv+GuSkihow/k+6LtVas/oxiFHqXUJd?=
 =?us-ascii?Q?nlaY9kUHnJsKMqdNJY68+0BKpUTMVNi8xiGBGxVB5o8XVQjQfcp8n7vql7tw?=
 =?us-ascii?Q?xSsZP49oTv+yGn1m1xWDdzqTVUWpTFRvXvAnNbqs7wi/0MgSyXU/a6ZlhAMn?=
 =?us-ascii?Q?WQzYTWnUqdXW9mU86bo5H2h7nrcvBJRZlacDy9QOkEV4soRyhpsUi7a/S5oF?=
 =?us-ascii?Q?auHsfjlxCRgFXuRsdk03n3uapLXB8boezz3/P8f0sUPq/CY/NJcdrfZCCEhu?=
 =?us-ascii?Q?HiboOVrpJYlbVBPqCl/6O3MKYYHFCGuWx/UTtu+qW0nU03z+VSgSCUDBPeAM?=
 =?us-ascii?Q?o1R1EPc6QR/DVEYqF51orjrlzuhAjk7Uccu87mF1f68vgizALnJWuvnK3Fjr?=
 =?us-ascii?Q?etBqvSMwb+gEsAECJtkMlxli1mQwINel7KNV6XpUnR3uT4iaWCv8AVsZtx0V?=
 =?us-ascii?Q?fq3/SmKdylFPgy514LnBEA3fst9MgjGcnR6ApT6ZUXBZSLuYj95DRKm66e3w?=
 =?us-ascii?Q?HZpHuVExTpfqDh2xA2c+j7BtzoQfxJuOtovVO4JllVgsU34Uew9qaWmwzq5c?=
 =?us-ascii?Q?VYPgn2eBaeldh60rAojwwLB5+fxCRyb3TTyl5bsRxoByVyBByMyrmjXC6O4H?=
 =?us-ascii?Q?vHDnpbYi7uV5jH2Hlr66oaitKNl6Zuit6lVU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?M9RbsjY28jDBSXcR8W7j5YqaHIWKpnwwsa6gZ7SEqAbssF89cos06z5ZkuDS?=
 =?us-ascii?Q?p1lLvyb9y+igleqeSLVjFPnXUCzDm1mka1tqK8XYezCBev8xzKGYqEjiBfUY?=
 =?us-ascii?Q?t0jt3ZzDwZuKf9kiHMj7AzpqJmqgB9eMboLMUFiQeYXqYZ5N1eDDQNOhhEJg?=
 =?us-ascii?Q?OnzXH1mL5nKoHethLesI1i80CTf/dQm41uJ1nmJfDwSkUiGUkSxNapLvBvny?=
 =?us-ascii?Q?o7kjk5/H6jSpc3TNxFgYEzlZDF024riuRyamJ1EUYRAfsPLWPwYaPp8Chf8/?=
 =?us-ascii?Q?+/K0fSHlnqJNePlqk4ujIv7k9L/Z+fgfmg6qV3ibDcik0GbWwWXMjQkUmHrZ?=
 =?us-ascii?Q?SSgyqV0+5sa/QyiocoRj2mSK2PAqaqQ4IskZK8UUngfLxAN2oG9hACIb0+j6?=
 =?us-ascii?Q?Bxua/FNuvlNRhHi6WkBWabgjZSDtvK415p76Ss7itjNKKuCn1P7wJUTtyGJB?=
 =?us-ascii?Q?6SeYnHPua6W9A0C202EUT8dogXPtG2Mel1ZWCdNr+R0OW+x8ZU5VDQEUGNWw?=
 =?us-ascii?Q?3ZnI4KkVYqlMAyi+TIzAryb5Mh1iQ0Xyfk7UxU1VCjgzSAO45ctaIyydb165?=
 =?us-ascii?Q?5b10K2xi0Lwsst9c9Mst93LGGkA13/CVAc81dcpYVWmSv0lGk6zQblQd4b1J?=
 =?us-ascii?Q?i14Hv/VET9iYi8S1+snZLh7ZHYuAM2mAy8LR/da76FJ2OURYzfd4zmTfGjGX?=
 =?us-ascii?Q?fv8iC4OEr/1m7Mqze+hVk0sh/mkQcKy+TBbrUxpGVLE5ahshAUBo4DX4Bmzp?=
 =?us-ascii?Q?AkWKg66M/FY4vgxvJP+VgvuCxXyHnM2H5b1IJrGMHcbBOiwv1V7k9lfvXspu?=
 =?us-ascii?Q?8kfC6UEymG5fBA8fSu1qIOgpwyKeTLfglQ20IFfjNmFAvc0y4f0e8S2EEae+?=
 =?us-ascii?Q?ZmM+bGTO+SV38+KpsZwnKidpbOY2AQt5ZmfBb7fxx8EcEPYihM9O0b0b8Q5x?=
 =?us-ascii?Q?iQ4JUc9U+C5L9+y30TxCjmXqNtMyAXHUDQ8jvh7nDHYZfqqAvA1FFvrp+Z3y?=
 =?us-ascii?Q?UhjE/rMS2WKa4JN4O+7JMVeFjpVyNEqJn5Zi5YdA4rMfs/7eVV7gbCeaFWt3?=
 =?us-ascii?Q?RRWSkaj4rFb/74o9RdQNb3GE0z7KzZImn46HqZn0veNEy4ZPTKakqBQ9YR8C?=
 =?us-ascii?Q?Mbl4t1GiUDHNLYbv7BeUS2tH89z0vaC3OdkLzWii+asJft23cPZBvUbC2hIL?=
 =?us-ascii?Q?wSEC5Pb7QmI0OP8/0rlPLMhEqO/ikA0XzzIZQoXzqQy4FpOHJ9m4pFIsiQux?=
 =?us-ascii?Q?vvR9N1QSBIOZe4lW5aNugv7zOwt72HjvPIqohuHv8Q8LbI13541i0hSeVgoz?=
 =?us-ascii?Q?GBnUuHImtTr/wVrmoro05i5wBfANLdvUJXo4zfK5uzEC02F1iLy6Zb0xVDJ6?=
 =?us-ascii?Q?Dl/5bsPUjweZjmu4r8HxMJ8jXHw9hfzPBJCBAZ1qdtv2Oh7TsUgqr0TkTxTy?=
 =?us-ascii?Q?+pru1jyt8GgLSwwk9DuRPw3+PDjRo9fHCUhJWmBuSbIRND421CRTvCHRUlNe?=
 =?us-ascii?Q?7KZOWcjkygAC78gxRLuQlVePI1ZFTW6hxvZxMJwBYui8OA/ZhALw+OH6+HIp?=
 =?us-ascii?Q?/7DI3Ix503KfHHsrAd7TROH4suBjtDte8GgDUXF8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a9b1de-243a-4a7e-3ef0-08de30b1b72c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 08:14:57.3114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOrP6/uxXwLHQnOyaST9fmoBJ7IAzBpDiv8XNyzc2ZfM+N5SX96PQf8ZaZtkuS9nS2l9qCtMB341lO8aB3QzieQ0wGL94k8pJi4NiKdWCAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6639


Hello Takashi,

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Saturday, November 29, 2025 1:23 AM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: Takashi Iwai <tiwai@suse.de>; lgirdwood@gmail.com;
> broonie@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; perex@perex.cz; tiwai@suse.com; linux-
> sound@vger.kernel.org; devicetree@vger.kernel.org; cix-kernel-upstream
> <cix-kernel-upstream@cixtech.com>
> Subject: Re: [PATCH V1 2/3] ALSA: hda: add bus callback for address
> translation
>=20
> EXTERNAL EMAIL
>=20
> CAUTION: Suspicious Email from unusual domain.
>=20
> On Thu, 27 Nov 2025 10:44:26 +0100,
> Joakim  Zhang wrote:
> >
> > [...]
> > > >  include/sound/hdaudio.h     |  3 +++
> > > >  sound/hda/core/controller.c | 25 +++++++++++++++++++------
> > > >  sound/hda/core/stream.c     | 17 ++++++++++++++---
> > > >  3 files changed, 36 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> > > > index 4e0c1d8af09f..61b41a014f4a 100644
> > > > --- a/include/sound/hdaudio.h
> > > > +++ b/include/sound/hdaudio.h
> > > > @@ -293,6 +293,9 @@ struct hdac_bus {
> > > >       const struct hdac_bus_ops *ops;
> > > >       const struct hdac_ext_bus_ops *ext_ops;
> > > >
> > > > +     /* address translation from host to hdac */
> > > > +     dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus,
> > > > + dma_addr_t addr);
> > >
> > > This should be rather added to hdac_bus_ops instead.
> > >
> > > Or, we can just add addr_offset field in hdac_bus instead of yet
> > > another callback.  Then the change would be simpler.
> > >
> >
> > Hello Takashi,
> >
> > Sorry for late updating since I am involving in other tasks recently.
> >
> > I tried to add addr_offset field in hdac_bus for the address
> > translation, but met the issue, e.g.
> > On our platform, if HOST address is 0xd0c09000, HDAC address is
> 0xd0c09000 - 0x90000000 =3D 0x40c09000.
> >
> > If we use the pattern, HOST_addr + addr_offset =3D HDAC_addr For 64bit
> > host, then addr_offset shound be 0x70000000,
> > 0xd0c09000+0x70000000=3D0x1_40c09000, it will update both lower 32bit
> > and upper 32bit into hda registers. However, hda controller in our
> > audio subsystem can only support 32bit address, if hda  sending address
> more than 32bit, it would not work.
>=20
> Hm, I don't understand.  It we define something like
>=20
>         dma_addr_t addr_offset;
>=20
> in hdac_bus, and the driver setting
>=20
>         bus->addr_offset =3D -0x90000000;
>=20
> then a calculation
>=20
>         dma_addr_t addr;
>=20
>         addr =3D bus->rb.addr + bus->addr_offset;
>=20
> will lead to the very same result as your callback, no?
> Or am I missing something?

typedef u64 dma_addr_t;

1)
dma_addr_t a =3D 0xd0c09000;
dma_addr_t b =3D -0x90000000;
dma_addr_t c;

c =3D a + b =3D 0x140c09000;

2)
dma_addr_t a =3D 0xd0c09000;
dma_addr_t b =3D 0x90000000;
dma_addr_t c;

c =3D a - b =3D 0x40c09000;

The results are different, 0x140c09000 vs 0x40c09000

As I mentioned, our audio subsystem cannot accept which upper 32bit is not =
zero.=20

Is there any misunderstanding here?

