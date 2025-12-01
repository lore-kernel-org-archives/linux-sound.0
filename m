Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023142.outbound.protection.outlook.com [40.107.44.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3B13054E4;
	Mon,  1 Dec 2025 10:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586731; cv=fail; b=Q7Pw/SNfn6OeOhILl59JiISRVDPKcC+I7mEsB35PMTTsznE4UEd81fJP76Ul5ufPYuVRMFKHQiDOcKW1J0gwVEqSx3MEfAk5dnRE5Y8XY31DwNF3wNoZYrfB0ayhDMltolJwy0FMnGuOMIHn3DaFsU+xlJDui/lcssrCxgkwo4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586731; c=relaxed/simple;
	bh=0kpcZNkish8zW2MttbgZ+SumuScmkFcf6uZz4oYr/1E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sMy8VdsyiUZztdHDpv4drN9POYCbuyheES15zGAPYR/vB0uH4Eyminkid1Yu1xP0g42xEG1iCV+TC1YJ57meGeudl4Y7ap48rBy+jCwOQIGIjvJeRGB3EZ5eHlJhKxASqTJqrdlOeNdOGSpW8SOtJC/ag9rJxyU5JjQ4wsuCbO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5h+lwBGulMuf/IJkRCZDWXXkra24lnneB1W51epFY0GaDrsVBfKfkxCbmOeCr6Wx8PpyvIXR3kzDKvLYPs8rXT+DHVf5MkZoFcRjDtyyewn7oFcEcGQcywgs5iYJfKJ4dTajWF15miipmwpmcvWqalg0lbjfR8E2X8hd7ojX4zPijrl4wfAFmXxhAhA2mNXJ5U9xupQiOOThlJYIN5NTcChw8iomJGreTUmnEjXgwsrld4GqGggVUR9cHR+IZVLkv3aiVl6GH8aVKWKlZ7gIJAk6lUgADN00MP6LofVx82O7zXdY59xmSa9uyBXfi23aa25cMBHkaBaOI+gqcM+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af/ef/+em9AlxhDpBECQrumX/psDvqDXJ44M+pIrrMI=;
 b=oSJTv86ebTunSxlZinDTKYBybqdtQ+EuXcCZvb+qjlyzJ4tZ8KdUpaAZg96DTHbU0ixmvrTHlCY2XEjlbYU5t+dZVvBAn7Dks85Ju24oPb8G2KwsUoXmKzv7X5JeKRiqWayszJQvuYvrOQOODLZSaiuo2aWFl80RkeL+HbGlORYM8TczRj/Le61qOVGm6DEz8ndMxsVdenCU6gQvlXuAjiLDVLtRdiAJuxd/T+DHDEvCTV9P151pah/5rXQYXDxiTYym3MKLyg+O1J9EyZFy3OeioGloM6qIiGKFSWL9NORV6Z97WXoTVJCF/DYcJ4N8K1urIhvYIJO7sf4YrB2qQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by JH0PR06MB6940.apcprd06.prod.outlook.com (2603:1096:990:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:58:43 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 10:58:42 +0000
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
Thread-Index:
 AQHcSY3fXpnPYF79REi810Kk8OFzRrTcH74AgCpLopCAAhi+gIAED+iwgAAVUoCAACYE8A==
Date: Mon, 1 Dec 2025 10:58:42 +0000
Message-ID:
 <SEYPR06MB622681443555577CCEFD46BE82DBA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
	<20251030110928.1572703-3-joakim.zhang@cixtech.com>
	<87pla3joop.wl-tiwai@suse.de>
	<SEYPR06MB62269EEF81C53AC28278694982DFA@SEYPR06MB6226.apcprd06.prod.outlook.com>
	<87ecpi842g.wl-tiwai@suse.de>
	<SEYPR06MB62263D352405481E3046320782DBA@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <87cy4yd274.wl-tiwai@suse.de>
In-Reply-To: <87cy4yd274.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|JH0PR06MB6940:EE_
x-ms-office365-filtering-correlation-id: ab88627e-7202-4d50-86fb-08de30c89767
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?F+3dhfCEm5XaDBS6BnYwrKPjsE/CCAv2TvK7cFWGhUqU3w171AoSw+/QZhGS?=
 =?us-ascii?Q?/PzMuzu1RRJfFqMeRbsJQUzfnbq4n8op3L0iG5QS6RQ9cInda5Ohu/YV2wFy?=
 =?us-ascii?Q?w6ODKIGp4EaNj50XZoQx7fN1dSVlAdyb8sHQ/BIzqG1hIZ/+TFphTIRUZomE?=
 =?us-ascii?Q?VjMUYPgyq/aA/8L32e/TkBhU0syzvsHlolHVSqNy9YldRjzSq4tyRDF4UfzU?=
 =?us-ascii?Q?j3hGlyf7iL4dPJU/I+xM6bHIa3Q6i6GPGD+eFjU8F2msYPvg/4xR5N8xGD8M?=
 =?us-ascii?Q?czGWSJamf/oGr6TzQejQv7czayzE5Aw8qp8GFN/SBhThbYdDW55Vg+CuEPRi?=
 =?us-ascii?Q?XlZxvQAt2i1qgx7ixPGIiBD8Dd4083p7tGR54wDAoVYEYcq8DqSfn1R/U0Qn?=
 =?us-ascii?Q?0/gsoQbHcnIr6r0zjq2PvdHmnyownloWpt8LpabyuVyLyKSWiLp8jZeOjqmJ?=
 =?us-ascii?Q?eX2LPVCSh0wVZBzJOl7UU0GER4kYHEF5x7HPuEhR02S2HJm+8ppVKHofJftZ?=
 =?us-ascii?Q?lMPfaj+F+8yjpG4nkwTd6ZtLK7Q/meCnsCEv6HSl1OYhPa4LTbxLu9OKWA4s?=
 =?us-ascii?Q?J0NWmxdwiXdZ2ZLxfq70VulNl79hxye+rS+erb+48sAlLekC5VVx5odVsmC2?=
 =?us-ascii?Q?q5RUCLs1ZG0XgcVVq8n6w2QQUFO6pdqj9buIVQNH7/v6DqpVImK1uENgaA3u?=
 =?us-ascii?Q?QaJEhnB8zuIj7OgWQIy/Cv+w0Nl7FEL8emaFk2lIrg5KGNnMb7jXh+AFzc0T?=
 =?us-ascii?Q?baHLxOGRFttm/o6dhbAdt6hJE0rQeBkBeaCJPnZBMSzlvl0scse4InDpC8Ii?=
 =?us-ascii?Q?Oe1FHOVk+Qw1eCPfVD6PyGu9O3n1B00SZZ/kRxzl5B+csWjtprhoqeIdIknX?=
 =?us-ascii?Q?oUNXwxnifuvoxy6NoWLBLtS9i0Fg0LJONAaGjdcz2CloNEnKz0VjVhrjl18b?=
 =?us-ascii?Q?ItcMNLevDDNIc2Jj1Isayh2JdamPZ85yqPGOZi0tg2NNZiYAdERjUBqnmQGh?=
 =?us-ascii?Q?sdMzd2PbHq3yEP2HNDSKMHl2ts+0dd8zFnrSIvmTSU0TUopfz0AAXBytNNzY?=
 =?us-ascii?Q?WPvA3xJyOCz38UiDaNolS6vNfOgMDhIEC9xXgCxt6L4hEiA7mTfX8rZYhTf0?=
 =?us-ascii?Q?enWoNDfk5GCEMyF8b+0OCtTRpQOWeH6dWxU47pWVCFi3N/2XTM/TUe40cxYH?=
 =?us-ascii?Q?r30GKuFE4UmDEq8tdTipuJapO3TLZB0bw3k4B7vmPeJAckvV8Fq7ftpmTHXI?=
 =?us-ascii?Q?CulOYAIgzDX3ZuKGxc8oGytTYJKk74J5twgu0B2OQJC+Ib1nG9cVxyC0NUyK?=
 =?us-ascii?Q?jwDqBaxAaWMuijRNxUHXM5VE+Dt8UKMrEIqy7V9pVGBxZjU5L78o5Um5aydV?=
 =?us-ascii?Q?3MAF5E2/kxmyZevcG+NkwvSpw5VwA10uQaBf7lmQyG2L7BBf2+Te7dY7TASF?=
 =?us-ascii?Q?gYTV9FmCNOfnuRqPcELxB+mD/E5NOTgeHRW/qD+vsV1c4bQ66+YDkDWuYX2x?=
 =?us-ascii?Q?CjxQR/ml6by1Z/geIfSRzIbpec13noDpfONK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TxzZNI2BL6HEYqrMWCskRxismdJiAy/a55tdAQslnJwvov2mQ9/b5QtNqupP?=
 =?us-ascii?Q?aY4RUBMeyclK2v6SG5vwc9ZDwwcLoR8osul2BWdzpHdw3vb40l6PzITQRrSx?=
 =?us-ascii?Q?ksrnNj7nKJlSjKe3dO10FOt2GSCNuPkLTAn3Rglavxx6aJYYlEpkPIs/zrSo?=
 =?us-ascii?Q?lPpCIHaaskh+stYBruZcQElgidVnrzuS+vs51f88YtG78kXpLHk1f8IHu5vW?=
 =?us-ascii?Q?9rvpviGSVnOachPCpKPqsvsfF6d10jn3qG8ugzsLckPuavJB8Kizo0V7g5AQ?=
 =?us-ascii?Q?k414dQelroJLPP0BKoxivl+CdHW+tDeuo91nDiKIc3uLyXMAoA4j6ToZPOgs?=
 =?us-ascii?Q?pedSFIeLBCkvGwe5bGbipZ/aCSS8m8heJiiGOvkKa4fk3JxR7KIjfVt/4vJm?=
 =?us-ascii?Q?M/RcRDuTXY7PeS53VxmvyYi+mk17tk8Vqc6fKisDJaPiAfKANLEiI090FBoL?=
 =?us-ascii?Q?OvqeuttlEIsv804WUltD2YYtKH0jxPMGzHhPporfaa7NYh3oQe/OfCYEEBIG?=
 =?us-ascii?Q?LNyd/79FnIEOXbPgVf0mkepOQV8oXEbmrVpOEUB7PfNamK8aBn4plD3bRS9T?=
 =?us-ascii?Q?NI8P80O1o+8a8o9KUYU0NKYCw3ZOVT6hjKvEv5+YFI2J7AXwyEOY5jUDzBJb?=
 =?us-ascii?Q?dke1GNkc1mzbRPJnwgINuttn/ILKq2nR9fePoQeUDXZwhJ6R5JDekws2FSJo?=
 =?us-ascii?Q?xPlDM210P+DSFxuBE9XxvwcHMjcLAzwgXWNGMi1Qa3kk2YoEmZ3566zNVqBo?=
 =?us-ascii?Q?9cLn9TlilmxeopDdkoiZ7lVTKPE3ZuavywpkxlIXBGKqRBNTV4lVjVS1dUT0?=
 =?us-ascii?Q?lZkHbLT8gjEBe2lS9S0rFHOSm+I3uNpDZkT7utKmqSqZovf3lhPMIFkGcBD3?=
 =?us-ascii?Q?pAkowIobJYUIKV4X192Oe/bBO28EOVlb4YGGYhaKSTH3+jEuCcMUAvt2ecaB?=
 =?us-ascii?Q?tPnvH1Rx2RFAB4BPiur36ca0n5R2jTKIOfxpVWFX9Tq4vxwArvKSmggXrHAs?=
 =?us-ascii?Q?CLwthgx0TW7tRJzew6ieGEUpTHdwZnR2aALdQNm9ou9KkbRytgsNiwRUebFp?=
 =?us-ascii?Q?LSH0sTCRgGSY6FrA7TL+HMbBhKvnyo6WNpubx2vEY2FR7O4PQ+UeieJV7UEl?=
 =?us-ascii?Q?WMscPSL8jpAot3pJggFZgoYxKR6rUxAYgVCZFhzyVQi6/5f8eHgfAUlABpct?=
 =?us-ascii?Q?zPPiMmA0rPPN15ryXrO7xmX6DJLB+OT2eSW812cdQ2HzoJ7TiM9/pBZDmlqR?=
 =?us-ascii?Q?gya/Z6GNdXYZcrQA/DPcdW4uZ74e+hVoeEtwgIvXNQzp7w4M0Lf1ZP/ceFYy?=
 =?us-ascii?Q?av1zEchuLjQBwpm/4iSgI1jxUoz5kZy7/QrkWr0j69DFYdhTcryJPFrWYkzP?=
 =?us-ascii?Q?7jrNMcD5N+9UI6J4W76etL0TlWonvs3kM+jayFjlX+Pgx/HzMAsAFB47HUQm?=
 =?us-ascii?Q?WmBEh/mezCmV0YlsX6Zk3a2U3gVOhHBEyqw4GtMyswN1WKdNgPMVunwBqNfQ?=
 =?us-ascii?Q?eagdgaSGhIbvd8etyhIwMlUuMULF3v3+deG4ypbccKZDm+eTypN25Dfz2kFt?=
 =?us-ascii?Q?Fhw8vhibo82roPFImXlGWY+Z+tr3QryX6A3hTwvY?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ab88627e-7202-4d50-86fb-08de30c89767
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 10:58:42.3983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XUSmLbxcPQwoBSdYQGRd+LAdoVKx0U/xAfDn8JNOrcT5l7hf6BkBcZDP94dXwwZpdsMYAWRP8qZ5PIDjyCLev6hVe6tfB38WoyFzZ5F4gjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6940



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Monday, December 1, 2025 4:41 PM
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
> On Mon, 01 Dec 2025 09:14:57 +0100,
> Joakim  Zhang wrote:
> >
> >
> > Hello Takashi,
> >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Saturday, November 29, 2025 1:23 AM
> > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > Cc: Takashi Iwai <tiwai@suse.de>; lgirdwood@gmail.com;
> > > broonie@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> > > conor+dt@kernel.org; perex@perex.cz; tiwai@suse.com; linux-
> > > sound@vger.kernel.org; devicetree@vger.kernel.org;
> > > cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> > > Subject: Re: [PATCH V1 2/3] ALSA: hda: add bus callback for address
> > > translation
> > >
> > > EXTERNAL EMAIL
> > >
> > > CAUTION: Suspicious Email from unusual domain.
> > >
> > > On Thu, 27 Nov 2025 10:44:26 +0100,
> > > Joakim  Zhang wrote:
> > > >
> > > > [...]
> > > > > >  include/sound/hdaudio.h     |  3 +++
> > > > > >  sound/hda/core/controller.c | 25 +++++++++++++++++++------
> > > > > >  sound/hda/core/stream.c     | 17 ++++++++++++++---
> > > > > >  3 files changed, 36 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> > > > > > index 4e0c1d8af09f..61b41a014f4a 100644
> > > > > > --- a/include/sound/hdaudio.h
> > > > > > +++ b/include/sound/hdaudio.h
> > > > > > @@ -293,6 +293,9 @@ struct hdac_bus {
> > > > > >       const struct hdac_bus_ops *ops;
> > > > > >       const struct hdac_ext_bus_ops *ext_ops;
> > > > > >
> > > > > > +     /* address translation from host to hdac */
> > > > > > +     dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus,
> > > > > > + dma_addr_t addr);
> > > > >
> > > > > This should be rather added to hdac_bus_ops instead.
> > > > >
> > > > > Or, we can just add addr_offset field in hdac_bus instead of yet
> > > > > another callback.  Then the change would be simpler.
> > > > >
> > > >
> > > > Hello Takashi,
> > > >
> > > > Sorry for late updating since I am involving in other tasks recentl=
y.
> > > >
> > > > I tried to add addr_offset field in hdac_bus for the address
> > > > translation, but met the issue, e.g.
> > > > On our platform, if HOST address is 0xd0c09000, HDAC address is
> > > 0xd0c09000 - 0x90000000 =3D 0x40c09000.
> > > >
> > > > If we use the pattern, HOST_addr + addr_offset =3D HDAC_addr For
> > > > 64bit host, then addr_offset shound be 0x70000000,
> > > > 0xd0c09000+0x70000000=3D0x1_40c09000, it will update both lower
> > > > 0xd0c09000+32bit
> > > > and upper 32bit into hda registers. However, hda controller in our
> > > > audio subsystem can only support 32bit address, if hda  sending
> > > > address
> > > more than 32bit, it would not work.
> > >
> > > Hm, I don't understand.  It we define something like
> > >
> > >         dma_addr_t addr_offset;
> > >
> > > in hdac_bus, and the driver setting
> > >
> > >         bus->addr_offset =3D -0x90000000;
> > >
> > > then a calculation
> > >
> > >         dma_addr_t addr;
> > >
> > >         addr =3D bus->rb.addr + bus->addr_offset;
> > >
> > > will lead to the very same result as your callback, no?
> > > Or am I missing something?
> >
> > typedef u64 dma_addr_t;
> >
> > 1)
> > dma_addr_t a =3D 0xd0c09000;
> > dma_addr_t b =3D -0x90000000;
>=20
> You have to pass with ULL suffix as a 64bit value instead:
>   dma_addr_t b =3D -0x90000000ULL;

Thanks, it really should be like this. I update the v3, change to use the a=
ddr_offset, please have look.

Joakim
