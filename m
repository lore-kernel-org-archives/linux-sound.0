Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022135.outbound.protection.outlook.com [40.107.75.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BCE2E659
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 01:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750815144; cv=fail; b=gvEJgEQvC07obqTMYATe0X5fzIVRIy/IaHpz2FfICvVW/eZ8boKJXZ6RFtXLrlLZmm/HuZMImhzwc/bqNegrkj2TDNkLOkdnaPWLVs1yHyI5NE37W62MetdBlF6Rlq2lZV1WcaJFTD8SvWtKw9M/vIvoXkRVHMzOATPGfqzCHPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750815144; c=relaxed/simple;
	bh=PtnuUFA+k87Ue3b7cxpOsA82WmPIcZ1v3bgem4XUspc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qc6TtsXJaPXnsiOye2Cuf4Qrn4In0j2DDAc8o9K9DExU6qBq2/B3/GG8Bkcs2Kii6koIm8sazYRwVmDa7FY96UB5P4WcgDTgYt55i1vbLTcKpr3ie8r/IwnVztENSA7ztNkKp4BG4tfLweq1H7CEMUc1Nwajv2GZ4krpueHakis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SP2v4qCJI9rqB+j2H2rW1cvijEeQbmc1ihVr4Sp0vMyAMfcujLrQZvxToLnfaJBL4+1tsERRvd95dM4JTvQ3FLRIDZyPTmp5hOxeK9KLZffRJhBl/DfQcUfNecvGnxv6liy6qyl7+ol/ptvxpp6LSMA+TTiSky+v62bm1IkQARaQv69ZtoCg4cnzDDX1AkFgeRPXURTZwELmo0WGtl+NKG88JTKP7F4Y7cQCKYPgoYMd+416PMQ/nPPe+Pq5JEDpYgCIAE7XRjV384lDjp9wZjxSYNhkojSr3v8KJcXXfSAYZ8335Nsv1aEb2U2evI6w70gcFQkb5QyeXlvQ7bwV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9uqhM5pvg/obu45h6tDldxirTAnIsiXsk97fQlNtO0=;
 b=MJweoqVdGUerA6v0pbk3SXuFVKP0lRTXgsPEGbgQ4Y5QQaqIRJMQrSY33199lAdhpmGNKimYbPMIHIiQUT7YIUpeqBRSMVzSnblrEisS2Ay/8pb4HrP1LNrit29LI2q6iH6oGU0iXE+ZA88jJRNc0N9TUud2sGJsJubsJXIus7fUI1sR+Wx4baXsN3v63G+Xf4hLxGlU5BSaSZ7EFNJ4P6wG7p/tvjx42e3L8H5lP6968C52vfFV+hCUhFsmG4WyC8EmW4JBB9Rmjbw8srxN9geD9+kGZTqZqLjhyPDBRiFluVdZfknCmUy1rqgfTjE5h3NlrUXz3HfrS6Y5vKAVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by TY0PR06MB5731.apcprd06.prod.outlook.com (2603:1096:400:271::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 01:32:16 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 01:32:15 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Kailang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"chris.chiu@canonical.com" <chris.chiu@canonical.com>, Geans_chen
	<geans_chen@realsil.com.cn>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Topic: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Index: AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaA=
Date: Wed, 25 Jun 2025 01:32:15 +0000
Message-ID:
 <SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
 <87a562wqzu.wl-tiwai@suse.de> <431c41bd52224eb5ac341c9c24d52af1@realtek.com>
 <SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
In-Reply-To: <abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|TY0PR06MB5731:EE_
x-ms-office365-filtering-correlation-id: 0858f6ac-cd28-46f7-8a81-08ddb3881e1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?QiNA4qkrs5sWpClivvXQARwTiMNApvt5WYrwGKo8gfNeB7bA5sqERFcR/4Wa?=
 =?us-ascii?Q?WhrhYTDDbaKwlmS+O+K6g39mntRteiKHB7MHIXvp3UUDiN8/i8su2zeyY21/?=
 =?us-ascii?Q?59mA8PWfRVOOtfB/B+N+4HPF/a5Q/8ZZCPT/h5a+Yt1seocxkD69qTVSMEjU?=
 =?us-ascii?Q?7o2/csgpFHKwHNAZSuC42WjS5/mbPRWjrknTfYhbWwHgQoSjfeM6kC3PesbR?=
 =?us-ascii?Q?TYFyZ9tGx4r7uUgGIpaYAQgoC07iRtWzrRsUQ4OQsmKZ+YgbO9CB64/gdcKv?=
 =?us-ascii?Q?KcDKdy6GizetYo5D9D1xQzxel2j12UxLgFsPC5+rvuax+DHzzMB8R1/1qZtr?=
 =?us-ascii?Q?NtSykFlOul3OFmgXqm/5YG8o78N1nCaEdGiPH7HB6GmjpRD/jdfLlSMvkhms?=
 =?us-ascii?Q?n/wZZBSdjR4mtwvav6n+hiCHiYVvxFDriX+GfA3M06GEGXVfUxDGqubIf7kv?=
 =?us-ascii?Q?47x76dLk3dHtNt0fMeD7JEEua4F2lMb1Gx5F1lzolochVxINov3cIX5OqDNO?=
 =?us-ascii?Q?dikZCA5zB477x+oI8KECAyTNALtPw5rX8NlS18IdN8d7M4+GpwcYWfiJGBKh?=
 =?us-ascii?Q?PwNg93yTZxfkpEphWjmt5UqQbXer5HqQUbal/8m6XLkpdy+FF2vvxETudrOv?=
 =?us-ascii?Q?VLiKwq+BRhvCBFN055kFD7NMDlNaYTU9Qf0grqSTyT/DPclTe99BzJYS+pkm?=
 =?us-ascii?Q?CRfVqomCbVG2zqclAq0fh9t5i+UeRwjNyTKu969noJFcSwcYUbYxuDbb93a2?=
 =?us-ascii?Q?/16ep4ltJ5L8sNDnXzJPiPkdglVQ2pbNTHqvFvG/7FG+iWLJ29ftrUaC3JWi?=
 =?us-ascii?Q?p5LZzzy3RcJT0fjAuSUqEoyWgisF3QxGQYhD4gxjkv7oSAph2d+VMlSf0Q+m?=
 =?us-ascii?Q?LQTBNxxmV14CBElUr4IBbOTMxAO0pMQMksy2pZC8yYa+NUDGsqFw2GXKo2QM?=
 =?us-ascii?Q?Iqwe05a5wQk7OB8B7AhYW1EguiWZJOM658AA6FTMy3Tvcyv4FVHXZbX41i2d?=
 =?us-ascii?Q?shm8UG3RCs7YqnuiNczzQ+I9E+EH6bMvNrdB5lzExqwuj5IlcqGXleFT/kcG?=
 =?us-ascii?Q?Ft1rPkGirVS7FVbqGaSamZi4Za2gvBQqMvYu7p2xjKzYBZsnQ5e7gYXPooxX?=
 =?us-ascii?Q?3ivb0K38A41lx3e4Qb3uVxvMbQFWM4rRWKQeDzWTWt2U9W1z8Rjhz0nmvmIv?=
 =?us-ascii?Q?byfb6qHiIfCt1KhKsBeZWJm6V/B5QBesLwMoGpMlLwonfJ7WbrRUh88vy5GV?=
 =?us-ascii?Q?CHUXvlZ/RtMRbdBQg8MtES9vsOgpSm/UWjZkTMykv0xZ3NpOxcb9tXzlHjPv?=
 =?us-ascii?Q?ZQkUYVaLko5a+jzmQUqoFz6Cgjkb/Q7S9FBjOvaswWUEXNC5eDOatOhI+BBQ?=
 =?us-ascii?Q?eygxSm4eedNYl1sGhghg79GwPuNbu/I0tALKj0kygcvVcFoP/Jnd1O2hSW15?=
 =?us-ascii?Q?x0kwsyXlIOWjhopOF2iHU/Qlyci0Tdn4IC1VDl1tPOJCTMTORxH/aGk2ySAC?=
 =?us-ascii?Q?bHDI9lZYSj1ebh0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LSYeSKo9AfYJlO8lwq2+M2CdAiqQT1khGGKT3iVkBVsuUPH8y8l2wflCRxzM?=
 =?us-ascii?Q?SlofRhmZq6XWlhnrQPkHz31XhoQMg9+fQ+ijWaj382/NPqTOyXVEsBD2yukF?=
 =?us-ascii?Q?cRDNyGM9v7HLApmEfxjY9wdIh2rWdmJvMQmvSx+WCzS/7JaMsHxnSycYx5Ml?=
 =?us-ascii?Q?LMGaodp4EiBeWxxFLlUtfJGuYsKBAzkvWnSRDeAIU/PlwTGQQbfbCmnmCFnq?=
 =?us-ascii?Q?a1ykICFpJqJQ7NrUSgyw+m0uPJK4M27KRJw2sDIrMvXRv+y/rNcFlLVqS8cC?=
 =?us-ascii?Q?J8pOjn1Y0E1GPzIV3/DU1wwIyzpsCANZloOBSf7TJmhTUgmQrNuRE/waNSgL?=
 =?us-ascii?Q?Yp5PSr0k8JhESEnmAM8QYGYQe+IzgI+C9B1HUo/cOQum1zhClWvoHYClhjw8?=
 =?us-ascii?Q?sYS2xn9fq5Ng0w+0TgVR1TIB1K4K8BDWukSYdAW9kJgs1wvZ+vbBaJXRLdgU?=
 =?us-ascii?Q?73VyuJHtU095xlDXkYUsX9o9nWV3N+RF0773E+xHPfSmEqL7wilv6B7GxZoo?=
 =?us-ascii?Q?ZQ6i7Hm1N06eABJt+i3ZUn8YBjQhhDrOXWFFc/qCxn4//wBf6JqMNjyhvU2U?=
 =?us-ascii?Q?Q3zTBAjYXLzEKAe4VVEJsV+JoBCDG2KvYVR2x+sFMy1Kw0Ws9mvM/cIecwoI?=
 =?us-ascii?Q?tkxXs9l7h3L+8RtVEXvSwNPpA/t9KZXxGEU7U+s+AyRJKA8d+CVDBHcfBhy1?=
 =?us-ascii?Q?stEqUrK8VqBKkk3eQjYGIbNQyrzJ8LqashFkTv8hhy5MCtSh1gjTW6RfgoVt?=
 =?us-ascii?Q?p1NFUK79Uyp6ZieG6z52fF60E99u1//kJnmoR+QEFOPgLHdAqKJLp5qzSxU+?=
 =?us-ascii?Q?D/23yEiYCz/x1gzXC5sVuM14z20p3QNRi4OVwlIiHjF3R70jcTKAZ1zjAY7x?=
 =?us-ascii?Q?YrvZ2bVJWG6vp+l/W3iO/mkrITTP4WjGvyDcwcu0sGIkd5DP1c47LjRsDQW2?=
 =?us-ascii?Q?ja6WsYePgKj+fHympG2UKxr02HW4gsUwAHmz5IJNBpyRg7sn0Er0/lNTG7kc?=
 =?us-ascii?Q?ptptAbOBeoojAW8QQzN4gkx9Hz5E4zez5uznv6JrXSlQb+vp2RwVQA8dVW83?=
 =?us-ascii?Q?bXVOsVO8O+2v9sXyoaYNBQvinWIo47Dy6D/hOwLaSyZ9gVh6CtOK0wOmfH1H?=
 =?us-ascii?Q?CQg8jcFSumLNgZ2QlMRWLOV/XWsNxUATJZ+N62OkQz+/RCsOTND9jq1zAQYo?=
 =?us-ascii?Q?U+JDyg8N59NeO82Bw91MjZopBRQy46ECJesbLiK/F0NRs07i0IlK0bPqaj9X?=
 =?us-ascii?Q?XUzwSqHsEyuqpbccgjkjOdxY+pFPQwI2VenBiB/BW2CHQMuSYOYAEVUZqdp4?=
 =?us-ascii?Q?pjJbO0uULP3bCtwL4p6hqPtgf84TdEMJs8JX38G2dcaXFLeA3Tu1J5tmmIrD?=
 =?us-ascii?Q?lH7xN9S8J4kJWxHQ+DhhvMgIROgQ5TFgz70TeNbmzDX/xScgFvvLS0G0ZqJ5?=
 =?us-ascii?Q?x09wnGzbfXUhU79eSXDwaHGOdehBcFy/8oqpb+QQXNdbDNnNtsRLoSvjbk7N?=
 =?us-ascii?Q?7R/wuYW6/ajPJofuAQ+nMoLPmNJ39WK82sQ3mDfpr+UtV8x5/r+gngNoaerU?=
 =?us-ascii?Q?WdRC1N4Xn5W4c79alHPCl4xfcDHr287Nm2T58guf?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6278.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0858f6ac-cd28-46f7-8a81-08ddb3881e1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 01:32:15.7976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KukmjdlR0q6RVnc13B4sTJs9v4pf47kgO6Qf5P19qJMAS7eNhibL5dt+s/WEmPduvxEntdOmGX1igX/aVPg9sQV5rHzRS6R2D/ocABC7lSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5731

Hello Kailang

> -----Original Message-----
> From: Kailang <kailang@realtek.com>
> Sent: Tuesday, June 24, 2025 2:18 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; Takashi Iwai <tiwai@suse.de>
> Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>; cix-
> kernel-upstream <cix-kernel-upstream@cixtech.com>
> Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed=
 on
> alc256
>=20
>=20
> > > +             if (codec->core.vendor_id =3D=3D 0x10ec0256)
> > > +                     spec->en_3kpull_low =3D false;
>=20
> This usage will affect all ALC256.
>=20
> Codec: Realtek ALC256
> Address: 0
> AFG Function Id: 0x1 (unsol 1)
> Vendor Id: 0x10ec0256
> Subsystem Id: 0x10ec0256   =3D=3D>  Could you assign this to 0x10EC129E ?=
  This
> codec SSID was provide from our AE. It's verb table.
> Revision Id: 0x100002
> No Modem Function Group found
> Default PCM:
>=20
> We can check Subsystem Id to let spec->en_3kpull_low =3D false.

Did you find anything from the log? Is it a potential issue?

You mean re-generate the verb table with SSID equal 0x10EC129E? But from th=
e patch_realtek.c have not found any hook to fixup this SSID.
