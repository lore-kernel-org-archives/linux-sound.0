Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023095.outbound.protection.outlook.com [52.101.127.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0C2D6604;
	Thu, 27 Nov 2025 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236675; cv=fail; b=CklzA/++6989Iu0wvwxF8GmSaTltadaIwoidxGSXVxP8KoKGv0BkmGw8UE9C5n3XKzAn20ODilGUjsJ0pjq/M1vodtDjcAssmExJ/9l6xrSjwz0BPmsaeZ7J/cjTY7q52Ct0y2917Bewva22lhTxgj9sS0VDFqQ3vLjZBFI62eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236675; c=relaxed/simple;
	bh=W5Q/O3SSFZgX9SDFeqlppKeUcyMlBPZ/nI82MJq+R5s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IVoZoaZAAe91JsCEGp+5NJp6CUfEjsFV2bkBbeThUZRFu4Zu41E17XrbVBBIfxyWspaefeG7iUOkUs+LkYFWW1ra7z2M2qVAaNZf23RNZEap8FMHm1GC1LrQdcPOsAf3vbuc45TaD7/D7eHBmvpXmzkW66QlQYFMpvzt2ukPlZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgmjg17bP71ACsyb0dutb96v+7MVzlbGsWG9YAIEtUfw3yq+SEwZhFJCargMszVji8slyTowEheBxqI+C+AB6yPwB9qp4pwplIj/+4vmdc7GMCnQkd96DZbuVGGGGt8TYUk78GTipmEdgJ/jNcyJAHcokm6qvp92nCAO9cbnrg8D7uvIldeXffdHaupQykPTb6m941mDU0h7MO7UlB7tbQEqSGEc+o8DxstKGClI0PHTjyl089/YeYtNpMADsburT9MfB23iFbtVIaDcIIygx1eE65l3JHoqGuggXGIJZtgL4BB+8p+BE57KtHRVCkOjx20czQ8dJnzWWXLonAaehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFxjTuohTnNSrFB6H2rD4ZJ+Vfv2YIOr860QM5TXVFk=;
 b=Ma+8Z77I9i2cxLc5RIyl6P74Bo4nv4vEDFU+KCtEg/Pt/Mb1vTMaBsrbxOzoVOBnKeMxTJF7e1B+ySjnUKfK1yVaHU2sUfLAKzZo66qG+QfkXDVPuBARf2UAKpziSB0a7ozEjMRQbH2r46x2HzTXDxakbEBatev6pCvUMdU0/+ryBm2UPP/8oFISSSghU4BMcb/q53lsbv/Ti4v72/RGc6TzdO5oEAnKgHKy/z+a8ApuLIAlut+tWR6xBxbCZXkQJQdn3Oz4tQju81L7sVOKByI+cPP19iDxgjAe4YvLn8rJVmkrj/enHtmql90hKDNisf90WbAMshnKRUaGiOv3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEZPR06MB7238.apcprd06.prod.outlook.com (2603:1096:101:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 09:44:27 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 09:44:26 +0000
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
Thread-Index: AQHcSY3fXpnPYF79REi810Kk8OFzRrTcH74AgCpLopA=
Date: Thu, 27 Nov 2025 09:44:26 +0000
Message-ID:
 <SEYPR06MB62269EEF81C53AC28278694982DFA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
	<20251030110928.1572703-3-joakim.zhang@cixtech.com>
 <87pla3joop.wl-tiwai@suse.de>
In-Reply-To: <87pla3joop.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEZPR06MB7238:EE_
x-ms-office365-filtering-correlation-id: 740ca047-5491-4c41-8c5b-08de2d998dc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LPrG7JC/YSmXom2YpCbc8RTFtjrGKS72t2fAN+5g2rpKFMsh8juuj+5Y/Kam?=
 =?us-ascii?Q?PnSNCKxw1thj9MreKrJ7AsE3UhQa3sUjjmMVhVPsuQM6iSpenG+YSpAJ1yCZ?=
 =?us-ascii?Q?t4CN9GVxKikMzNRJgxvAG6GuNIkuIICj06CEqHrlKlRjvEpQjO+70uyKMIRP?=
 =?us-ascii?Q?YBjAeJ5uvhvp65H/Lo1svbzrpnETOCU81Z462ZAVguLh4X6nEppe7VAoIvTF?=
 =?us-ascii?Q?L6BFXKgkZceuhwGEqUygl2XgVc2bfxtPg0junUr5ykObmazokxdy1pXEjvDE?=
 =?us-ascii?Q?nCZoWQtTaP7aYMHl5Zh4QImwaroBaDGphjmLo4xmO7bv+lsPI1iiP8QZ9EOf?=
 =?us-ascii?Q?arS/JmU3sFgPAFDonFJ10a0kK3+yHOTkPPZDxVScBmWJIkOcIuLlNITgGNsr?=
 =?us-ascii?Q?hlqjhesSarP+8+QaXoX58kWtRibnSU0F/tM4A4Kik9lZHcTH1v8pKRuDFwVn?=
 =?us-ascii?Q?ObB9mNo2XWWyNDofpIEUicbJM4qLF1pIuUfej0SEukcSkBTqol5/u88LfrFn?=
 =?us-ascii?Q?nDaBMmXbp0BRT9+8sQ/peCmY/6uv25mc5ucg0RKDMfp1tT9bKGFsw8VUocRs?=
 =?us-ascii?Q?ZuaWmmsSt/pPLQI4DKF3imyBENbVF0nTQD7R2DUNLz88/GtLoN1DRweJh3Fs?=
 =?us-ascii?Q?ZocbcQBe+J5VcQmuzIWR04qMpgToqKmOaNg9bKmNen2gi6HorB3ep1vb1FHl?=
 =?us-ascii?Q?zg3rAEOJt1Z3cufqunD156WD/jCCHtA5fyO/Sep2zh6JuWdmy7hxyu8N6G4t?=
 =?us-ascii?Q?LA97C2GKCCNEYlfHPpDjGDZj/hwQuU3zDTTkXdxcmawiXabrM/5iSJpsIl6e?=
 =?us-ascii?Q?8p8r77709+kU3YoE+i7mpz1a8bdpJ+8o0y/JFtufKbRALfq3mgDJG9L9qDCV?=
 =?us-ascii?Q?gp3AQJCqb4srbHjGZZmZPeOHI2prBDJfXsSQRpP+DbOatEaNjXvsmUfZ8ZxY?=
 =?us-ascii?Q?N3014AIQVeZ9RbHQ/+Cm6KfOTxFnJVDOwRObT4mXvJcbagFjGsg07svVZOO0?=
 =?us-ascii?Q?ojt2kzmBGMaP34pa8vwuSdeQkwPgrVlqAd9Qm5Xri7CfUmnX33pPGk9Es/l5?=
 =?us-ascii?Q?JiNoUfhI0It5FAxtaUPqLo5yS9x0+Gsfqcd4VlS3y2DBfgJrfJigoIll2q0x?=
 =?us-ascii?Q?hTJyoJ0dM9zwHrpyK6a548VVabSOseh0jfW2ApKFZacBYSx575aG/9v+6MGG?=
 =?us-ascii?Q?vDLrxiy+VqiJ5iH8BmaFZfZdyPL8UqnpoSJmKSLCLmsrDJTvuv9uWmOVrzLy?=
 =?us-ascii?Q?mwlFl6ANoH5o3nTLNfMc3UhtwtsiOKEes2G+fH3bxbCW9hPneToEReFWXJQM?=
 =?us-ascii?Q?iPLHXFbfwwHSj2fhLMQjzLObb3KQ86SqSrKg+qTksFQbhW8pQl1cJ/7zfp+V?=
 =?us-ascii?Q?8BydgKpm3UOtm+Y7C8NXkgaG9E0d4VpiWfjYMKxxIkwn1eL020wX58e05CsQ?=
 =?us-ascii?Q?8w/jEeQpXfdQptMoltqyfR2pGBjepbyKoPXfeHiFPmTAIx+l/X0seg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?luRVuXmBksWgRHTmAoGgx9CCSgvm3vgzSJUqn3n9KnBul07Jt7PSp6Ruvw0i?=
 =?us-ascii?Q?7HSHgzxf4MsADH1jCoex3sI8Jh3P7pCOaUcqzImWiM37A9JRo2tqAz4E7jqp?=
 =?us-ascii?Q?ieSjaRKH7NetH15suVKGz0QXRaY3SKci9rsV4bbfnry3b/PdTEQnVsDCWLs9?=
 =?us-ascii?Q?3S1JR8HSjm/cmFMHUIWL8Qun07/0wHQvYNm5TO7rsZ5FJ6M+H82mOmMA5k31?=
 =?us-ascii?Q?henamG+5ismoYuNSP4la0VPo7Yzgric6GSPuDM0dB5HBKQgyQBPiNtN3qEWt?=
 =?us-ascii?Q?Z81Fxm3phRP4TJWqR0W3wk5UiHIVzpfQC3yjqwkYmIzhnZFK42fS4McZ8Kh1?=
 =?us-ascii?Q?xgVnocVYcNL6j07VGDKko5swfmsgHJbomEkALbWf1xpt1p6Nsux98kpaT8re?=
 =?us-ascii?Q?kvM2GyWnx+xuIZ3RXHsa3S8EAoMYATJnGOK6ZWyjZzBPaQOHhUoZhJ/F9Gy3?=
 =?us-ascii?Q?m3rtrqB6THm6ZDsqK8lttQjjWyMpLhGEpad2qVjWsrdEOHDV/Qub0cWYNvkO?=
 =?us-ascii?Q?bIhkDZPYQULz5n3iBb1mclgVKSv9iMFI6CGme6JBpJYTyf+6VeK7CtV8y/R3?=
 =?us-ascii?Q?FLs09u/WbMlLhEJo59oCcu3ANMWbssf05nKJjbzBy39qw8LJDCMG1qELbYrT?=
 =?us-ascii?Q?ISBfGSuKFgPzAQQYhjMSR24n8EihSTXVhoXK0uS6F3P1R8aPYEw+KXf6DjPM?=
 =?us-ascii?Q?kQo/vfDr/m+kM6QEvMuIlQMNx0pCMutq4qHYUM7S56kQ4Bk5Jxg5eu77jtg6?=
 =?us-ascii?Q?vOan3DPe6WrLq0tZhvP6bTh/Vs9/p4mfIMgdNZZsli28/Sht2+7l9gPnsXmS?=
 =?us-ascii?Q?GFeayCPROQdCvld0nA6ic5qFTIZT7NAS+BeJGmYTCCtalrkSgD13NyY6QhvN?=
 =?us-ascii?Q?RX1SG99WPEfy5xAzlpmG+JrnzCL3VG1G03LEinfXkYfqNkgdv8iaYilFJFks?=
 =?us-ascii?Q?olcBjBVboKeWLah5vaRHjgix0V6IThL/rq/yeEyqCGLly5ady0gusA0vGqZE?=
 =?us-ascii?Q?MSeJRDj0qUoL8yz/lqLs9wgCIx3uuk8ufAId5DfrMkNn0tWM/KEAu122Zcgo?=
 =?us-ascii?Q?vknCe7bNhgGmb7+M2AWgvtjrosJpVsLlxc7G9u1M87kyW+1xuIt10rvrWf1F?=
 =?us-ascii?Q?Rnxaj1ZwBe3nCCnm9oRNXuhoFe3p8eWI4i7xi/h3xBMPwciKoFk6G93AsiLn?=
 =?us-ascii?Q?3AXgy78dcr1Bi8m8XR9FGcdEevoREhiWuYbBrXwMyY9QUBT/ugYQ4AhlDBDc?=
 =?us-ascii?Q?O/ivFBGDFE4WW2fqjV8QkzZGAMyTUTBSWbezTngdvOEI4lrkQZaU+vKyZcur?=
 =?us-ascii?Q?Y78Wv1ymGPBPWE5Be3AEoKTnYwTgtfMn4ccbcsFsxyFsiY4b0vR3TtIxIHCq?=
 =?us-ascii?Q?mxx0RjLjhcR0MOujGHimOpjazdcBN2JZjOUUL591g7YEBvrEsL0Q5z+3TYAw?=
 =?us-ascii?Q?NC9sKXkxaofVDYuFjYPRCQkhrlkTax+cQN2rMg3o8Rvil6g8jQr0s+8OD71D?=
 =?us-ascii?Q?ZeTdmvBwWbaTSii4/oiA9mZIo7ZWdWemd0Ipy4A8qDH4ZWjI1xoNcEMrTENm?=
 =?us-ascii?Q?AMkEJRbvLsp8FyusGK9x01hQpBBesbItxEI3dqZo?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 740ca047-5491-4c41-8c5b-08de2d998dc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 09:44:26.3963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRbmfH2iewl3wXJWP3VpRSyUUsqDZS1A2qJY4qqWwz+1u4Pg64V95rX/Kq3SmCq0XMscUc74DkPH8xv/YWkHAcbaSpRbvlfffV4CvrUBwIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7238

[...]
> >  include/sound/hdaudio.h     |  3 +++
> >  sound/hda/core/controller.c | 25 +++++++++++++++++++------
> >  sound/hda/core/stream.c     | 17 ++++++++++++++---
> >  3 files changed, 36 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h index
> > 4e0c1d8af09f..61b41a014f4a 100644
> > --- a/include/sound/hdaudio.h
> > +++ b/include/sound/hdaudio.h
> > @@ -293,6 +293,9 @@ struct hdac_bus {
> >       const struct hdac_bus_ops *ops;
> >       const struct hdac_ext_bus_ops *ext_ops;
> >
> > +     /* address translation from host to hdac */
> > +     dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus, dma_addr_t
> > + addr);
>=20
> This should be rather added to hdac_bus_ops instead.
>=20
> Or, we can just add addr_offset field in hdac_bus instead of yet another
> callback.  Then the change would be simpler.
>=20

Hello Takashi,

Sorry for late updating since I am involving in other tasks recently.

I tried to add addr_offset field in hdac_bus for the address translation, b=
ut met the issue,
e.g.
On our platform, if HOST address is 0xd0c09000, HDAC address is 0xd0c09000 =
- 0x90000000 =3D 0x40c09000.

If we use the pattern, HOST_addr + addr_offset =3D HDAC_addr
For 64bit host,
then addr_offset shound be 0x70000000, 0xd0c09000+0x70000000=3D0x1_40c09000=
, it will update both lower 32bit and
upper 32bit into hda registers. However, hda controller in our audio subsys=
tem can only support 32bit address, if hda
 sending address more than 32bit, it would not work.

I cook a patch to add a callback in hdac_bus_ops, this seems to be more fle=
xible, please help have a look to see if this can be accepted? Thanks.
https://lore.kernel.org/linux-sound/20251127094301.4107982-1-joakim.zhang@c=
ixtech.com/T/#t

