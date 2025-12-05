Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023081.outbound.protection.outlook.com [40.107.44.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17102E06ED;
	Fri,  5 Dec 2025 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764949577; cv=fail; b=q+DhowpxiaM4G1KHh8cW/ENncKugGWQG1qDhw/p8HLC4AfU33w7XPUCGlA216qs0xBNqEYUA5G1D3Qst4MokVUpH37nvNKmPuf8saJUDE/0A8b9xaYzudUjrZpOh4MUF2tkfbDS+NdYhzxYWYi1qAxNqLZ5t80nd6WpQ5n+Gdx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764949577; c=relaxed/simple;
	bh=f1Ll7abN6/dxR0JcSMnYsGI3T2fFNCniitEHkwxnauk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kBdmYtovTzYvSzDYi1KZQ0tfKddneuF2fqsigiuPtOSn3SXkvIh62aLSaRb60YNqSlF++HnnB/G1Xa0UVB2SVJsJH7Jw/0X6HiksC5KWJxwIe6fnLtO3wOI9zUIog5SOHydHyjWeLC7Bgy4aWHj8z+8TWxt2x3Ga1nr/f1Jq8NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDEzmgk/d6cLvKZ2bFn7YihY29k3kQRCTHYN+D34+soUMzRdF2z/m0RoJiRQlWI6xGjf1NpYQE0IfhKNqZ5r4toMileITnK53MJ10tghKiVL1hXsTkzR+3ErMANCW23NPB3TaCBMK5LLfu538SBAMGP3wjQDJT7V9fnUImEXBoNoFlIu2L+KIfETSTVy7dMtFJP0m/Xpd2f/8nfakFzSnxRCNuggDo/ZWlYwieIXIuxSPn7JWXqeNgtJdFoN+nnJcFTY14x8CjnI4lRZYobmGwTKab67x+NjHmI7jArsLohb57fYNo5Zn1IfTPYddyAzPKE//CyOpLQtRCRhHykawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKEAZzfcPbrXnvKmbFbZzZuH50vxSkfnA8t/ePRMlnk=;
 b=HrAXcyi/7rr8Sscn/l/rBki/sxdjtaS0WH7vS4VuH1pOKzG6e5oUMFds2GOxlnmJ47Vl8JxRgSd/EePu1+H50VRkzI2IWqs/27M0iJN89qxisIrq7Bl1ghjGFFcblg7rZWn75QJ4QWAbRfcJzEJsQShv1HJUw4ibWxTNFvqoaXls1A8nkAR7lMxfe5+D+vZ0P1P1/STEAuKDEwnlklFuYNzTZ1S1cdbwkfrfqNpdqCekd7BMt71tzR5dO/ezKK6gYghkRm/qciYNdVOfw72JfYPypXrwlLfDZWLK/gdsEOKxUT+8ad4olonHLzP/VSaRLX6knaiy/kDVC9fe0X39uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TYZPR06MB6261.apcprd06.prod.outlook.com (2603:1096:400:335::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 15:45:50 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 15:45:50 +0000
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
Subject: RE: [PATCH v5 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Thread-Topic: [PATCH v5 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Thread-Index: AQHcZdiiPNV9D2hOoUiu9F+fW5Ex1LUTG5iAgAATLrA=
Date: Fri, 5 Dec 2025 15:45:50 +0000
Message-ID:
 <SEYPR06MB6226C1FD56A14F4B0E23FD4A82A7A@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
 <87o6odvw5w.wl-tiwai@suse.de>
In-Reply-To: <87o6odvw5w.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TYZPR06MB6261:EE_
x-ms-office365-filtering-correlation-id: 9e122f28-2d4a-4242-bd15-08de34155ddd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PZaSfgldII0IWOyNhIfSGqAwxm/iaVKF5IV9dNIPIOJO8I/R3pT0RBaXRQ5b?=
 =?us-ascii?Q?gtVnwguU43Lg/dtYfKGzrB8BFrDRXz1NG5vuvSDiKyC61QD36o7m37YzwjJH?=
 =?us-ascii?Q?Gar8c1IvCd7rU+hDmN0/hfO9WRzD8//9dYewZ25CxVuqIaVB6WXWpW8whbCn?=
 =?us-ascii?Q?fd4ZYPd66LlL4pXP7LzHnevhQjt3N+henkVz5SzhnPj++NMjJTKx38xv/UEu?=
 =?us-ascii?Q?hBIuqv/Os1vwgjvxraFZjo8roCgg/ldKZ6T8y8MOWWpXPBCwZtYd5VhctGwE?=
 =?us-ascii?Q?LcqqVotBsRxMgDu6qhYcoCaCx1rD9YKCLFfkKHjIN0fu//AyzRpzIb6ScUK6?=
 =?us-ascii?Q?3kXRMzM0slQDkn86DCY0HOwOBRaZdedEAdNdjZGaPUWN9eRWX0dyA2Us3hVU?=
 =?us-ascii?Q?u3dPtv0BS7jOSiM/jcHk540lOuTym9jPXHhN3mgKNgWqdWY+CPoaAi0qVjg1?=
 =?us-ascii?Q?g+30VAccVoE5mlfMVI+IfhmFev8eVvs8io73VA5NkPxKzLulmH8Jiadgm0ge?=
 =?us-ascii?Q?HJigz4HHPLdc0MnpfkYUrH8QUzYN/jsRUq0f2qcGpgTfvcLIImbC158fPXwy?=
 =?us-ascii?Q?rEFEgtPJpgjEv5qlNFU9yGxCpCOaeXe/tYWshCexpPeFc9qkmQgPCmU6WY+L?=
 =?us-ascii?Q?kd7N3xztBxL5GUaCT+NTZPHGLNTKuLIhhe5rvF3vvN8xC5X2UciNhz23RVcP?=
 =?us-ascii?Q?94Lf+QysdYeVuEcivtpVmEZbd4KeNGl8k5Qt17S3dBL0lRVc9BfzbqS1v77J?=
 =?us-ascii?Q?sVzpyjIeVyZUMdzgO2Ko0c7Nx6l23lS0cfdG7xiJCxrI9TS7SvaR3V+Pl1Wf?=
 =?us-ascii?Q?rJHRFWKoMPuC5LxS6SzTd0bfq7lshyuRDUvtE5YEHY0wq9tck/GoFOwm6ITg?=
 =?us-ascii?Q?bjoru8ht72SEq0CNvt7Yq0euB/NJDjIO1FW0KgXVuAagE5I0RRKc/RUI/5WI?=
 =?us-ascii?Q?1IXCo5EiPFxOw484ta6flUY2BlfG5r378Qm6YsF05Pt9A7/M6VCz8lI0/3aM?=
 =?us-ascii?Q?txA7IkckILcWDM6PAGtBiHI/mI5CHJUFBI9ARcp1paZ/+7C1Hm9n82kYwUaI?=
 =?us-ascii?Q?fetXU6Kn9nQCxUFMYMfzJ7c190QUSxUDhYb/XiSIBMXKkvcCfkmuKppNJE8A?=
 =?us-ascii?Q?9Ti/fhns10W5z1aD/FWDArsYqaiPeP0lxKVMZcxp+w6wuBLdIxTxAacKbwvo?=
 =?us-ascii?Q?P0Rkv7NJCUr458K2FvTtw5upeAsQLZhnJkGZTX30XM/rrD1UGoFr7mroqjeG?=
 =?us-ascii?Q?XkPcnbz9tdrcn6w1rZumCU7MUMpRA8Hpf4mTezHvG8n38JjLVKCYdg8MU8tk?=
 =?us-ascii?Q?m3ikCYfBdvlkDRQYyUc+OMo/RRi8uBmr+3tma8o2nSBzDOgtE04H8Pw1+OuJ?=
 =?us-ascii?Q?rgSMXPBoDxPBBrkbGXYME+15zwOyK29HNcZS4pFAQDFW23mXp7XVnv+2BUZK?=
 =?us-ascii?Q?hllfKpEPJ9U3h5sPt0KO0LJflhRvTEpx0p/l2jDHU1oTogakdyfd8R0XJ8m0?=
 =?us-ascii?Q?r4zIap9hN2TjgzDZrCixgQkVdLKPR0f8bVXY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?A9Vk2R6lwxDw9bJSJDWXJC6SNo1u2OApmDx4rgX0pV4TdciSBA1w7fZsjpRT?=
 =?us-ascii?Q?OV4UQq0gByhq6Ux5thvijcv+gzGlcRLvbRDnLWz7ZrJOdOwHi5g5VSMXmjEu?=
 =?us-ascii?Q?ybMviUcb4iVZQb4PkXa8GwbSjsZzZcDYdHs/31OPzaZ1XzqfVnyB6BOwkbKz?=
 =?us-ascii?Q?XghaoDBSUv59rtQ8qgCTl+8Jwft5tzdEKjqqsrrByD5F2iysG4D79yWyrE5d?=
 =?us-ascii?Q?UljcyuYAXU+x22gl+n8VbqnLP9fNj4N5hE0UU7rm3nu6risOzt7+4WlWAtwi?=
 =?us-ascii?Q?QuD8pDoEJggWePwT9/p8EbNH8cW3OTtWMI688krVJd0qzjWecHvEL+PdMMVB?=
 =?us-ascii?Q?G8NtjZz5+fkUqwTxQJ16N+QVbp0E/uPXzc3Cm9yUNh+1ScvLrrqSQxiicA8B?=
 =?us-ascii?Q?bw47ikvnKjFOrRARqgqZTijApGLO2q7suvRGalDh0IsMF1Z+BHWk/nVbKMcj?=
 =?us-ascii?Q?l2Rl5HiJLUVFhaGkgYGLG9TeEb53TNM9aoSHsyMeFXDh8MckVrso+9NoqPJc?=
 =?us-ascii?Q?RfGM60d30VvODg/eJd848uNAyn8p7ilLwz7ynevyDnun94f86S1KIN1BsXyg?=
 =?us-ascii?Q?VjBDppfrRXBCb70sVfsoK56/OoO7U5zux5ARsK2QddCQOIk1/UC2WL+CtYtT?=
 =?us-ascii?Q?spsTJ/9JkpDYloc4OOm3pP+GM5Vd2yy1HyNhFGc9E3Dt69lo52SoUsKTN2BB?=
 =?us-ascii?Q?RuPQBjHH23Al76FMHaBtJ+E2NfMxpA6VK+nXVZF1ZArI112bcO9Uu1nR5qT4?=
 =?us-ascii?Q?X/+pC966qSzISCnx2ED/nlCWdSq3WtLLmyLXLzauHn9o0jd0GjjmaLfDjYwL?=
 =?us-ascii?Q?Yvh9YZ6Vs/7524xqJ+xYTMVSJ4wBeXC2cOENhpOZMn/HY+ibi1uZlW1w6hfC?=
 =?us-ascii?Q?w2ZtE156Zuo1SQVhrO4v6XHJXHe36I2/RQkFb2/B+NWquy2cSjMIygPV08xt?=
 =?us-ascii?Q?aqD8tHiaL5z1zDBKOK0pjVEUZ5HGDfFEt0XQ1qpBKIJxuqbYFLH2aIzcp0s7?=
 =?us-ascii?Q?SwJ27e51tj0ziku5M90bjL1PWCbNj7D+77/LlOYvY4Rd9so4ozApd79qbB8W?=
 =?us-ascii?Q?B1/KCDwyHV/TuhRXsk8OJ1cb3GD9/m+f6tz5HVI2xTe5q3TiIieZneDOO30W?=
 =?us-ascii?Q?S1KplRNCmYE0PSQh1IlOE8Fjqng+bX9y1/y36K1W+OVZgPpuPmL+oQxEo5yI?=
 =?us-ascii?Q?PTj2BBTht3BTful+k6TYGrWapIF/k72yHN9aAEe3Eu6aRZ4N/Wnf0q3bmeEN?=
 =?us-ascii?Q?hXQh8f5vYwYvN5/aCJzoPIM8qPrLqLn7SFwxbJ8ZIoQED9AQwrqWt2Wx3CPE?=
 =?us-ascii?Q?M2+tbYPIsqVBy5FAeYsOmNA9bEZDIUTNy3vOAPtYmAd77xWUXaDML3wQ+aDt?=
 =?us-ascii?Q?eboR8WHcviU/+UG9aiKwIA96opmlXP5TUEoXHBQ2Qvz9pEzY5ZA9QpixKVST?=
 =?us-ascii?Q?EYS6I1EvADh4/KbQ0BoGykjG8IpwSg236IWeknCvhIkrvyypjP3iiUmbSRRE?=
 =?us-ascii?Q?3jqkJ7Oz0GCedWjQUe3dvInpqrB0+bOawvNSFuNW7rCrXBHJMn72X/6MCqEL?=
 =?us-ascii?Q?POKg3FxTwcTZtQwb4UuKDkOO9KhNqvlMtd7ywh13kGQlcE3JWAsV4wLSxo4U?=
 =?us-ascii?Q?1dlWxmHTMyCi2kMYqj6oXrs5dvPkDpe/HeLb+FPo4Dvh?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e122f28-2d4a-4242-bd15-08de34155ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 15:45:50.6638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9yuKoHf3+rayViZHJ63SJkf8MpunQjRSDzgbkf3b+DMnN0zbBCqLqBw0KU/BI0D1+7WFNo1ox5+YQxN1b+tYtDeBerOZPXZtYFPjdvZRXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6261


Hi Takashi,

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, December 5, 2025 10:30 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: lgirdwood@gmail.com; broonie@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> tiwai@suse.com; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
> cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> Subject: Re: [PATCH v5 0/3] ALSA: hda: add CIX IPBLOQ HDA controller
> support
>=20
> EXTERNAL EMAIL
>=20
> CAUTION: Suspicious Email from unusual domain.
>=20
> On Fri, 05 Dec 2025 12:16:31 +0100,
> joakim.zhang@cixtech.com wrote:
> >
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add CIX IPBLOQ HDA controller support.
> >
> > ---
> > ChangeLogs:
> > v1->v2:
> >   - fix dt-binding issues
> >   - remove delayed work for probing
> >   - refine dma address traslation
> > v2->v3:
> >   - update dt-binding commit title and message
> >     - ASoC: dt-bindings: -> ALSA: hda: dt-bindings
> >     - use full sentences for commit message
> >   - rename cix,ipbloq-hda.yaml to cix,sky1-ipbloq-hda.yaml
> >   - update compatible cix,ipbloq-hda to cix,sky1-ipbloq-hda
> >   - "cix,model" to generic "model"
> >   - change the addr_host_to_hdac bus callback to addr_offset field
> > v3->v4:
> >   - describe more for both dt-binding and driver commit message
> >   - remove __maybe_unused for pm ops
> >   - fix robot compile warning for 32bit system
> >     - Forced type conversion for
> CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET
> > v4->v5:
> >   - rename "clock-names", "sysclk" "clk48m" -> "ipg" "per"
> >   - remove "reset-names" property
> >   - remove "model" property
> >   - additionalProperties: false -> unevaluatedProperties: false
> >   - update the dirver since "reset-names" removed
> >     - mostly is devm_reset_control_bulk_get_exclusive to
> devm_reset_control_get
> >
> > Joakim Zhang (3):
> >   ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
> >   ALSA: hda/core: add addr_offset field for bus address translation
> >   ALSA: hda: add CIX IPBLOQ HDA controller support
>=20
> Applied all three patches now.  Thanks.
>=20

Please wait a moment. I am so sorry that I just noticed I made an elementar=
y mistake when update from v4 to v5, an error return was missed when copyin=
g and pasting, sending the v6.

Joakim
