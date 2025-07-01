Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022095.outbound.protection.outlook.com [52.101.126.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F10270576
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365680; cv=fail; b=kB0PZiJsgiBp6h/Xd7c+BHu1jBGLmZPi7ajFqNL6UH6BX6Dkhqt4Cbnvy4Oc70bTn0f5XMmOZW0hdzhxA0hh5FGS5pyejRCFr6Tb4mfVsQmYBJjJO1dsDkRNKVPsttV6Ey1xXQiuwcSJy4xYMziXe5E8H70Cc2xpC48ZVliLs5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365680; c=relaxed/simple;
	bh=RJkQSxKsC3QWOuP+NvWhT0gkhMO30hGtRAvioO8SJ7I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JRDl4XbgokuvN/p1WbRu0aVPLQiw3WiA4SjdbuWnFrvAYnq38e+04WuYU+G/ZHGUiae43e8+rBev5kEtUn5VXJnSMicuYIjRfNqt1Gge4XPFPXeEm+Pd6ibAs/cWV/rTKEHyfM/C7vLEAIssHLP3CVLghAAGpZyJIMR5goYobDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZW4EKFQAFNxFWo7GhgDAF74/0xcGOOAak1joIyODOnvihHhGTk+rcRoOyn6izkxaJ7KQAFIIBOD9VLnUQoZPfJxLkslu3U11VnUcI5qI2O7ZmYJpmEM/47sh6YOpKlGNn3bHVAwN/wfkZmep9T/BLV2k01wKGlHC6KuBCqWIQGHryEj44/3y0osthSPnvOcwBhPghXv94xAu55756jfU5LWyibEiLo4xzo+CSdMLMh+6D7jHzNfDbMcpYFO5mhp6EpcnRnmlDK5XO48oO5hm3pGz6wT636PyPERxawNMeYTsJ4NRcVtYEdD03vK3WidFxGACZQ0Q5gm46Pf6BOjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaQc521OPz3wlFW8KS+iHxi350glVcHQ5Iaor1aP0KE=;
 b=Pl9rlneG6bwYea/g//5JlB9KgZ5DqTPuq2aRaKmR8e/hjfHnVmxEdJS+GxTF/wuZsk4JEVd/yYJRfuFMh570ao+SAtx3UMBTaAQaa/jbATZWAJdX3c21DCTpEF8gsFx9nX13T56Nwf9F6ESo2qj/u+f4qjRALSSqgMh0eHGeUSPMiG28PvHlmnT04dzNhHJl5jrvxKzN5MC8LpO3mH3OiLYQi8KDUS+VOhvRaUBWG4GomdkgnlDQ9DoAp5ax5iMo3i5iQ5cqA4zpSb9wYBvChKS/VLt8KKjyihiuh3DPMNVSMY5blcL3tirZRxDnzRydhVBXUyc6YZNjmLFp7RF0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by SEZPR06MB6301.apcprd06.prod.outlook.com (2603:1096:101:10e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 10:27:53 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 10:27:53 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Kailang <kailang@realtek.com>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "chris.chiu@canonical.com"
	<chris.chiu@canonical.com>, Geans_chen <geans_chen@realsil.com.cn>
Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Topic: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Index:
 AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaCAABzZAIABmbuQgAAnGgCAB7AeMIAAK3iAgAAHvGCAAAaLgIAAAOtAgAABUgCAAB1NwIAACu6AgAATzaA=
Date: Tue, 1 Jul 2025 10:27:52 +0000
Message-ID:
 <SEYPR06MB6278A4E87874B8B894A1DAD48241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
	<87a562wqzu.wl-tiwai@suse.de>	<431c41bd52224eb5ac341c9c24d52af1@realtek.com>
	<SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
	<SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<5f2431ca8ef2453daa9da2034798e682@realtek.com>
	<SEYPR06MB62788CE70E017CB5FD7F5317827AA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<a0d71d7f93a94800881c8c67c9e715f8@realtek.com>
	<SEYPR06MB62789527920A36FC01B665988241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<87cyake9w0.wl-tiwai@suse.de>
	<SEYPR06MB6278B60285176A9B98ECB65F8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<877c0se7iu.wl-tiwai@suse.de>
	<SEYPR06MB6278B9C65FA98E18C87EDC1A8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<874ivwe75h.wl-tiwai@suse.de>
	<SEYPR06MB62781EDBF735E177B909053B8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <87y0t8clx2.wl-tiwai@suse.de>
In-Reply-To: <87y0t8clx2.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|SEZPR06MB6301:EE_
x-ms-office365-filtering-correlation-id: e9973b2a-759c-4df0-73e7-08ddb889efe1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GfEmzW4fG7R3ucjfFnfGAKOniK9gRTNIi0nndNQCcQMQfnx1LADF/umOi9Uw?=
 =?us-ascii?Q?NGPbHwFA47wNNewXoouUqRJBrgTDqedEbj2A+Y4oOuO9S3U24Ir9NaCHEXKW?=
 =?us-ascii?Q?ZEo12Ck0XkMAsDBl3n4d18v10/padAWLuJS+66aJZX+0ZXIssS/JlyQPIJde?=
 =?us-ascii?Q?ozcdObcy1jNvMK6y3elWDISv6qrKPJS4kiftmhIKa0Nf9wWsAvXFtTQlQKMB?=
 =?us-ascii?Q?msrCuymPacybxgW46lngsRnVMoQsAUrOTPV7AIcKBLc5GuN5BkJkG8IV/pEr?=
 =?us-ascii?Q?SHRDyTw9b/woL4L/KMr/lwcP3EwZBfjobLqZkbT1HLbH6EbbZ6JFZblgxdDw?=
 =?us-ascii?Q?UedQT8D40ayrgBI0LO9kNFRzV4IFqveleLiLPOFxlZcirDAqc2Asaq/DSgcB?=
 =?us-ascii?Q?HP1mDMIZFFJy2fkM4l6GujSZ2NXTwORvA5VN/l7qLoV5K56OpK75d/a8Mhxv?=
 =?us-ascii?Q?OR3igYFzO5Nk+DLOQKoXe3JdWPA9uIJr/mgJxEfKba+cpVB53jbDrYrYqdXt?=
 =?us-ascii?Q?OwFrOZd41qHKLr6mXcubbXBoGgCYt9hcuvYk9pxw2k8m7uXZq4v7t7Mv1uPe?=
 =?us-ascii?Q?WETpKlAwWrnhwiE4i+vJ9Xw7Ky6n0mWXKU87QkdiGtrJ6JPnVi15YaYfaKzO?=
 =?us-ascii?Q?MdZ5W1r8VZn1+g/nYg5qunowOur8bMHI/Xlb2pCMGzwsM6Jdr8u53rXH8KaZ?=
 =?us-ascii?Q?c5n7lZhol4WYZHz1yHDuRAVl1oW87+6SEVjEvUQioRQl6U1PDDGJPMsgKJqV?=
 =?us-ascii?Q?7doP8oi/a/n7YMzakSiWzGHdVT3q8/fNYKCBhbzFwzsaW92evPc2T9HaceBp?=
 =?us-ascii?Q?fA80LQaoM4d5jOvAzBNWhUq+pyMhScvRzF/9x+ZGOlShg75tJgbz6KUNY3++?=
 =?us-ascii?Q?NKX10FMKwil5sDtXQg+XpLWsToTdRdVnwwRl2qflNJXQaDpRyK4qROus2Mi6?=
 =?us-ascii?Q?vX+wgI7DnqwkOpWNQdRz1xUh80MnnUC19DxGNe3hip7P6Em5VGbEYcBantmc?=
 =?us-ascii?Q?hqhmH+m4ZEdoWbGSTjYo+zLntzBWjUp7/2giqHE+LMVmM7ddoLPgpKc8Pbuw?=
 =?us-ascii?Q?l9LMeFxNN6XRCV6pkK97uBqf3zVdBIcVsrc/uTl+5zVYUIE0Q3WYY5HpYAIu?=
 =?us-ascii?Q?HsUSDnHMy1lt/qSiVVt7RwkfqLekygzbm2J42KvRqlBowrRH4PoV3x/D3Img?=
 =?us-ascii?Q?8Pxko1N3M0vZ/UVJb6FSeVwMUzTk0HdIc+HjOCEAdsrf67n65zNLM3q0VIyd?=
 =?us-ascii?Q?6cqTnNuGCX8RFyOpdKjxJudtMPAtcDV0JhWZBr5frayHSqh9/BuUIGynjiII?=
 =?us-ascii?Q?88DToGt5frao6WCMjrn1cOHfPC775ydd/8BEC9Fh4sOAW84zoR4SXVkE3vs1?=
 =?us-ascii?Q?Hlrmzd5phM021PEN6p320HJMvIf/merhQ7hItvPrNSIG+DIjrWOj+jfnbJ6d?=
 =?us-ascii?Q?hfcWtj5fsqYjh3GRSjgLw5t2MNhxUm2eSTL0mbmV0HJmskWo5H5uDA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KOz1OrtolSsqL9vCGTVKDdG0m1sHIQ63ADbReA99cAqNhDlSUEo22Nsk1L4z?=
 =?us-ascii?Q?OEZYOyV3x1Z2Vb2yPZJAh/SoDZ6ogeDv1gUY8OgLTtvwLZCrdmWABXp50nEi?=
 =?us-ascii?Q?N0WXmDeN1B7lslgJbw+scSo5GuDtM6mr83NyNFmDI+uY9GpKhLcDDErGrPTY?=
 =?us-ascii?Q?9k883bZHPxOQ1+CkSjoStvGJ3hP72rU6yIOS6nThRJBMTpJRGJZsUeHGb0qT?=
 =?us-ascii?Q?CeM2nY/4DbehOTkMRHREEK4jwDYeh4NhrLSGzKC0mvAvHRTKwLt2gm3jLWO8?=
 =?us-ascii?Q?M9WoNLRsDSuxlzzXv33rbacbrIoJHu1qX+cMJKuTwmUHsSHnAufm7utVvGRX?=
 =?us-ascii?Q?hbXx9EKgVIncHdW08e4VJz4UZSpf48gZJPWiK41hND6gAGbGqqMSi/KgXQpX?=
 =?us-ascii?Q?Eergey7Pg2txUWoDmDGCp36tRmxFfb6wDpBxduBRoBv2TJRm+ZUn8BR1QU1u?=
 =?us-ascii?Q?hR6XsE76Y//XfBgg4PYyILtCuq7lPDwhPcwJZpHh3Vw1cmrcppceefGNbOLK?=
 =?us-ascii?Q?k0eT+LT+3ErZ1hSITLKGjIwzqO9dDZ1/BMb2adcO0oIsfUZ+33+h4/zKrx+X?=
 =?us-ascii?Q?xbwJvFA+fkOTciD3pFiRCcPvzE4q+gqfxoIo3Y2CMxRnbScS5Wm7UtnOlq1R?=
 =?us-ascii?Q?AinE9srqAwtkf1O1rMKfp4bqJXxjMafxwV7D77nwzB1lLu1zmLzLwNWvAD3n?=
 =?us-ascii?Q?wfGVc8KPw1LO/C+AYBWVJFFkXhxHIEpoNXLjZDndee0VeV8uDmIhsKSFUu4K?=
 =?us-ascii?Q?nwX1n2RnefjkggK+bZKUi1QBDMwYxSkX8Ka9tUQu0INsKKRS2B7G2Wx15agc?=
 =?us-ascii?Q?KSi/rAF61CL8blgXBBXUNGDvrAhKkc0gOhgO5R7fXDe7YxZVkboNEEapAfq9?=
 =?us-ascii?Q?2HKB4durVvrzXX0pB2k4DYJkoUc3djUwX0Rr3vMoiusnX/nxeK7IlyDdLXUu?=
 =?us-ascii?Q?6BpV3HYN5qC26C+wQnrq7jOr2QsW6UlsuB2htltskp31nlppu74RodoAp2fv?=
 =?us-ascii?Q?lNQz3Az9gJhKofkqxuzfkqf2cRcTMaIh9ZAKBLTDfPM1RPsoSI/UGi5PSFef?=
 =?us-ascii?Q?H/kc3fp6PZ6vKeK8GU5vl+V1+dIlamj0NtUlWxzIiqkL8aumCO94LbexHFQk?=
 =?us-ascii?Q?u10YCyFuABQomMhvAfdYZ4P0HfLTn5y0AE/6k45ReOa3YG8Hc2z4U+6+E5ev?=
 =?us-ascii?Q?FJdDjHTkbgFNd5Vyvh/wAbVdFaUIXH7HTI/+50YhryKdYj4A1cAG6ft2ApyM?=
 =?us-ascii?Q?9D+ldWTCzVN66KRawurHuZKDWebJ0XMVvA3TU95hWMjt+skezYar7DUcbKgg?=
 =?us-ascii?Q?MeBWjM8Sw3ZvUe7tnWpjQbE+qi37TwZbAjI7zgTjwrbMrdL3Y3+yCzFBY+Od?=
 =?us-ascii?Q?2dFhAWqkdq3fw9ERiZQkaD6xSxA1CTnyTGT9VqExXe1MivTdmGH77rVS9qEA?=
 =?us-ascii?Q?2UA/7fdPmV6s03ZC6SSfisuOWyEnQw6a6eBkeCdpLj5gZsdl0/MgkCOXgN2B?=
 =?us-ascii?Q?eKdzxwGy4o3+1gd3FiqpiWMjPkKWkQz8CEb9C3C8lmW9oqPHNnVv9hfsTHgs?=
 =?us-ascii?Q?mP7K1aDmFMx9SGShw3iWQGengKtigg5vqlUeKqDE?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e9973b2a-759c-4df0-73e7-08ddb889efe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 10:27:53.0778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vsz1sjUfNlV1jTHSr/4WscXRv7SrwVPV+CRlr3PtfEcX7AVQ/SGrgOsgt+8CtgDcD6MIB/YKBsB6by9atrQ67sqVlBV6srMeVEvzrMZ4ADs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6301



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, July 1, 2025 5:15 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>
> Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed=
 on
> alc256
>=20
> EXTERNAL EMAIL
>=20
> CAUTION: Suspicious Email from unusual domain.
>=20
> On Tue, 01 Jul 2025 10:40:51 +0200,
> Joakim  Zhang wrote:
> >
> >
> > Hello,
> >
> > > > > -----Original Message-----
> > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > Sent: Tuesday, July 1, 2025 2:43 PM
> > > > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> > > > > perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > > > > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>
> > > > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack
> > > > > detect failed on
> > > > > alc256
> > > > >
> > > > > EXTERNAL EMAIL
> > > > >
> > > > > CAUTION: Suspicious Email from unusual domain.
> > > > >
> > > > > On Tue, 01 Jul 2025 08:35:05 +0200, Joakim  Zhang wrote:
> > > > > >
> > > > > >
> > > > > > Hello Takashi,
> > > > > >
> > > > > > Thanks a lot for your help.
> > > > > >
> > > > > > > > Hello Kailang,
> > > > > > > >
> > > > > > > > I'd like to insert another question through this. That
> > > > > > > > would be appreciated if
> > > > > > > you could have a look.
> > > > > > > >
> > > > > > > > After system boot, we can see the default mixer status as b=
elow:
> > > > > > > >
> > > > > > > > root@cix-localhost:~# amixer -c 0 contents
> > > > > > > > numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
> > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > >   : values=3Don
> > > > > > > > numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
> > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > >   : values=3Don
> > > > > > > > numid=3D13,iface=3DCARD,name=3D'Mic Jack'
> > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > >   : values=3Don
> > > > > > > > numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
> > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > >   : values=3Don
> > > > > > > > numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch'
> > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D1
> > > > > > > >   : values=3Don
> > > > > > > > numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume'
> > > > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=
=3D87,step=3D0
> > > > > > > >   : values=3D60
> > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Switch'
> > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > >   : values=3Don,on
> > > > > > > > numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volume'
> > > > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=
=3D87,step=3D0
> > > > > > > >   : values=3D87,87
> > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
> > > > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=
=3D3,step=3D0
> > > > > > > >   : values=3D0,0
> > > > > > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > > > > > numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
> > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > >   : values=3Don,on
> > > > > > > > numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
> > > > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=
=3D63,step=3D0
> > > > > > > >   : values=3D39,39
> > > > > > > >   | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
> > > > > > > >   ; type=3DENUMERATED,access=3Drw------,values=3D1,items=3D=
2
> > > > > > > >   ; Item #0 'Disabled'
> > > > > > > >   ; Item #1 'Enabled'
> > > > > > > >   : values=3D1
> > > > > > > > numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volume'
> > > > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=
=3D3,step=3D0
> > > > > > > >   : values=3D0,0
> > > > > > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > > > > > numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch'
> > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > >   : values=3Doff,off
> > > > > > > > numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume'
> > > > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=
=3D87,step=3D0
> > > > > > > >   : values=3D0,0
> > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
> > > > > > > >   ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=
=3D36,step=3D0
> > > > > > > >   : values=3D0,0
> > > > > > > >   | container
> > > > > > > >     | chmap-fixed=3DFL,FR
> > > > > > > > numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
> > > > > > > >   ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=
=3D36,step=3D0
> > > > > > > >   : values=3D0,0
> > > > > > > >   | container
> > > > > > > >     | chmap-fixed=3DFL,FR
> > > > > > > >
> > > > > > > > It can auto switch 'Headphone Playback Switch'/'Headphone
> > > > > > > > Playback Volume' and 'Speaker Playback Switch'/'Speaker
> > > > > > > > Playback Volume', when I plugin the headset or not, but I
> > > > > > > > have not found the related logic, could you
> > > > > > > please help clarify a bit?
> > > > > > >
> > > > > > > Isn't it "Auto-Mute Mode"?  If it's set, the speaker is
> > > > > > > muted automatically when the headphone/headset jack is
> > > > > > > plugged by the kernel
> > > > > driver itself.
> > > > > >
> > > > > > What strange is 'Auto-Mute Mode' would be disabled after
> > > > > > headset
> > > > > plugin/out several times, don' t know the reason....
> > > > >
> > > > > "Auto-Mute Mode" is a software switch, and it means some program
> > > > > must have turned it off explicitly.  e.g. the sound server like
> > > > > pulseaudio or pipewire disables it.
> > > > >
> > > > > > However, it seems that speaker and headphone/headset still can
> > > > > > auto
> > > > > switch. Please see below mixer status.
> > > > >
> > > > > Usually pulseaudio/pipewire takes over and does the switching.
> > > >
> > > > OK, I see, I will dig into it, could you please tell me is there
> > > > any other software
> > > switches in the mixers?
> > >
> > > Any mixer program can change...  But basically the auto-mute is a
> > > task of the sound daemon.
> >
> > I disable both pulseaudio and pipewire from the Debian, and enable the
> auto-mute, when the headset plugin but the switch not set correctly.
> > 'Headphone Playback Switch'/'Headphone Playback Volume' not set, but
> 'Speaker Playback Switch'/'Speaker Playback Volume' enabled.
> > Are there any other possible reasons?
>=20
> The auto-mute doesn't change the mixer state.  It switches internally, ei=
ther by
> adjusting the pin control or the amp.

OK, is that means all mixers setting should done by users based on Jack sta=
tus?

Joakim
