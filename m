Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022125.outbound.protection.outlook.com [52.101.126.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5226A1DD
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359259; cv=fail; b=OuQVEQyRuCIv6aqLOX9QnNE+Aczxhwc5YmlKAHaEvRIdPsgk88MPNa4CLlo4zG2hgruRwfy2TTzI5UgDd0z8ucY0aBTYExsp5GG2D/++PYTKJ2tqJvmbXY+LIyMNXVVrvBkCUh/LXDauiP9EMt40ZpTrrrxgnun0/ytY1TmTHfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359259; c=relaxed/simple;
	bh=jl9A9AQYfMFcFsB9o2QpaQK2RUChmo8ryC0D4Z+v0OI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q5HT63ubpF+YpeAQX2rAK3Xa6xmiwTQW7+4udGWHZfCYzuo7dj7tzVaEnxNhnc5tOpeuf5gwstmZSTQn6Rtw4QIz6AfDx5HSJ0FmODJwxMdnzdHxyTD1qxBkGxerVDKLIPZ/3LMdJX2SkdVS2VwSpMpAWQokxGQXMbd8MEk6ip8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOCJ//v6KnhEA2YNkmA6Qr4rOiZqZTom1nO0ywMmRRfGTQYyrNN1tarEo7Q3AZWS9eatXR7I1SWnStDYcERKJVhkfiarydR599LnH2ch3SbewsuJbgv/yFvknJs6/88CelAIx1LDhwfAw6+EV7FDKinS0Qw/pQWmKrjpuniQztcdoLdyYaJWhMSXAq7rlfZAbBfelAMVAWRMnQAcSk50x+e4KXTAZJY9E6KmLmz7BInPJdJoy/ZtbBf1zFbh8cwow9EPmZPZefWtQ7bxv4jl9+0VgpgzhJCBHqEUcbse29IIHgeV7uwBOM9jrQik23z1x7ALR+DRapTsiIxqsaGGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nd/oPYy7CoxW5g0ocAY1jb8MTRCDulq0qdQTf7pjsUM=;
 b=UalQhkdwchn2g7Dw/6nxfGdZBNB1KcPgOoHs+skARBIzQasfqa1eWoZFIlZZxXCsTQoSQLbDEQnGuT/L0M3oIIBry4J6mFr+UzLOjQY4Unsjn2b8OixMEWSHhhJ9CPvRUgeNnUAlLY35zzBRID2Ioa0j80lH+Rvbzim59ZtqVFE9O1LQbE1TTiY4ExWATSwv8CTKMZ6ltvc2mzz43yLC2NMVpvMWMeSr+0gCf04IkJaiCNCmFmnEpZpleYZciBEEz1HQHu0GfaDjdISebnOZjarSKhs1s3F0WyqUHA65VVeyAWW4R6SaTMbrVgg/kLFBWM3oU8q9VNZLI2vKks7Vxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by KL1PR0601MB5839.apcprd06.prod.outlook.com (2603:1096:820:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 08:40:51 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 08:40:51 +0000
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
 AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaCAABzZAIABmbuQgAAnGgCAB7AeMIAAK3iAgAAHvGCAAAaLgIAAAOtAgAABUgCAAB1NwA==
Date: Tue, 1 Jul 2025 08:40:51 +0000
Message-ID:
 <SEYPR06MB62781EDBF735E177B909053B8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
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
In-Reply-To: <874ivwe75h.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|KL1PR0601MB5839:EE_
x-ms-office365-filtering-correlation-id: aaf138f0-4c4d-4b24-0920-08ddb87afc48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iPSbOq/EhyFxPipvWXba3GfTwongRZ1/LXPLBfORt359pIOifZbEojmi/EVE?=
 =?us-ascii?Q?Yqlnj1zNLScAxyghQjefU/8Iy80WlhpUkRuyrz2P5k/rnztW+020fw9WtHCU?=
 =?us-ascii?Q?5BlqQEFRNA0a++fZiKxbFEw/ye67FOv7F5oCs6mCsnPbzYnzWeSRlg29M07r?=
 =?us-ascii?Q?17B3Xwq/43+n9GKzlzyE7uE+isxNAt5TrQsLzcHYP6GCn/7xRz3ojTscIIc0?=
 =?us-ascii?Q?e/28oNSPAIAfM3oCu7F0vH6gDAlVSasxrgG3g7deb5btldOztIzhuCC24C3a?=
 =?us-ascii?Q?toAI/u80ebyhhEOjW+6xNWVK08lPmdMcoqtVt6F8HaIRjRZU9QbrUHoPcV4Q?=
 =?us-ascii?Q?peCiiFcNnpPR8RcLuItNMe0+8gYnmFy4/T6CqhAb8MDbU28jtrwlPHDA1LeG?=
 =?us-ascii?Q?rS6cYqvL9HxKlVWPOXuwaQeK7Yna729uX37YR+XgtjGQYP4f13Uz2DKhs1cS?=
 =?us-ascii?Q?ylo0NTq2FDPFGo8+g9zNX40C1P5ixtH3cqYjWb2LxiJBs2EeX58v0DbaHnmP?=
 =?us-ascii?Q?9p6HS89NLvk4INBgUZA36WwbOMA9DWe9ArVOnHU9OW0vStaBP5Sa0vcLG/3K?=
 =?us-ascii?Q?PysRjCFw6reXVNh1EBiUSJWWhM7yCpijWPMtwvWsB7xUsmOlH1G8v5QTMtUg?=
 =?us-ascii?Q?fCbXuoKj7cnMpDypQFAWmR99gJDMmfVyB/EC9QA++IuqHcvbiPr5gQeknQG4?=
 =?us-ascii?Q?c9Nn89OGuHGiAbB8rWjTDRn59pcF/qc4p5nuyOHM/W3eUjMRvN+7W+kN2bI/?=
 =?us-ascii?Q?nrSuDYDwDu11sUvfAXErD5ZEmZ7Le3uQpw03xDgrupJxQASnzbhFXLiNggVI?=
 =?us-ascii?Q?c5zW7GunjID5Ay5M9I7th2ZGi3gqqCYsDVBabTDKVNJfvgACc2d4eQ6HTrjT?=
 =?us-ascii?Q?5ft+L4RHK2mhbkghPvdwKyefeX6UzHTzQ8zg/798Pi3HUWjRkfWig1aOybXP?=
 =?us-ascii?Q?bjjbjZCNGW6Xwf25oDiU9E8sYVsCx0gr3MkKXrXU+lPklL6noUfPHM6CqaVK?=
 =?us-ascii?Q?U9ooQH7YysR4H+gghNzAF+7Uk4T8W+Id3Wrh/qsoDKhVlaRv9lNTRtnKRNQT?=
 =?us-ascii?Q?oQUceCtEH4dhetmnmJjjylwHeeFv/CrOPkUeqXnlakNNXNOZ9aYlO/7Behoa?=
 =?us-ascii?Q?l9zGvtpHOuZv0aYvlLZR7wIa7rDvyVXfT5Hb+cdOJHL34AOMQHLcsoPhYP00?=
 =?us-ascii?Q?GCvhyM/hfKYIgZniJEChaeklvdkrgANZDGHwowCTn3GSgvBpLX3FmE2c39I6?=
 =?us-ascii?Q?aT3tuNE4qgFR6IMu1WAaOZqR8p/JYXprDH4xEQfHJ5bD0FFmOOTK1xcGs4xv?=
 =?us-ascii?Q?dWKzyXjqN0fVt+oIV1AhwvD0DrGiGXTvXc+LactUUJLvzpsOXtdGe6a62tFL?=
 =?us-ascii?Q?hx/Fy9RLQsTNFCGUmzUiP2P4wrQEnjwtpcK4tT7QpBQPeNWR3XmCz+k2HgOx?=
 =?us-ascii?Q?vtImlglb3+cRLOE50tzH8xsIDUQrIkeVWy+1vAaWWyVtjUs3+Q+v5w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LAxzIQio3OMvCcLqG1HG/FuunVOncdHqYHZcOHznNmvhj1gRlJ+eOQ5Mf3EO?=
 =?us-ascii?Q?S50EKqU90pVNcUeGjzuJWEdDAWzDbPm84kSk2Jcmjhx8l3E9hn8KAsMqQsmY?=
 =?us-ascii?Q?v99xo+FnWT4qAnNBp+Lh/5yZHaY+V6D7h2emM0VhvI5QykYYRzcw5MdyLVQv?=
 =?us-ascii?Q?arwsgD98DF87LzJM4UNYDrrALVRqKAkXe7hWywtQqf9LDMMJy+tWZauyNhy1?=
 =?us-ascii?Q?/51p3JRl1xY8+CBFRT4r0S+QdvNXjFhurkTqBBPLUaHBY7BS6WmU18woLTWh?=
 =?us-ascii?Q?UueSwIi1jTqDUVRSUZdsGhiDFYPtL+r+OwugsfzUz9hsMverqLJRX2sZnRBq?=
 =?us-ascii?Q?Cuu3ZXeX9WWnRmKDp3LIdjAGbhKxwsGX3zSTV+TAP9/vBm9q2kJdyZMOxIxo?=
 =?us-ascii?Q?7F9f9GsllKA++GrNKmzXOMal8P7jP9aPrMTnbWIDucCz2TLUAuh1emznNxj2?=
 =?us-ascii?Q?YgRFxolS/7Pi3IblJyHx7KzfQQo2HdUG4/9ZCc4yNH+qRtC2Uf4Vp3nbfO0O?=
 =?us-ascii?Q?RHB2fUZeTsGbzr74pxLxj5boTp/8mGPQxLxK3VaFzXHCE9+GNdWgvqs5coDp?=
 =?us-ascii?Q?g3B50xlyciRG7sU0EOeHjwR6Rta9hHhMNX38BSIg8IWvumMXzdU+oSUad4fJ?=
 =?us-ascii?Q?AcV7WsjXC6fjHgoT9sAgH6hNb9nyB2v3GHmbL9h3zLZM456//x0n3g9SzPlh?=
 =?us-ascii?Q?S9vUB7KMmQftZrXGNlJ/6P8rbnTZ2cP6rDCfv8ghWtgUDkAGzpfxgYn8ZpE4?=
 =?us-ascii?Q?+sBNWDu7LyOrKjC1sGessd5c5UdBlnxDkgXQdHmRzQ9TNujOU/Ei/AU7IifQ?=
 =?us-ascii?Q?RF1bmx1zGYe+nsiRvyF3XZBlnVGWqt7BeQTX8x/E7OC6i+bjTfYE5z3Wq+g5?=
 =?us-ascii?Q?vXtS/8/BbYZVH/npehRs7t5HWZwhu7OJG7ZVPZyCSFvHzNtwy0W+i2WMkQfj?=
 =?us-ascii?Q?9AEQA17oPI0dzr58wG8bFwXAnd/5vDVEZyvrtOPqoB1EgBOsE+HxhO0ms1tQ?=
 =?us-ascii?Q?ZiJUkPGR2k+NAGM/ZoC5Fvptrtha55dVfWFLyKJiNE1XugMG+8/BGJsUWKr+?=
 =?us-ascii?Q?5hF+wQLUWTClOOzADHtAoUf3HhsxwFooql+wY7110JdXmxdoshSojubQxh1R?=
 =?us-ascii?Q?vNuROhymcJJgePpNCnz1EIhC2XR9SdJzw4YB1nhOEBK60qoZV6KoqUd4EJDg?=
 =?us-ascii?Q?Na9E9mLvQfMGCt7jEBuiPPpArC33y/LrDvVZ7B7JB0eMOmhc5sx96oF517HF?=
 =?us-ascii?Q?GNPZrSriKL35j7YPQvI9zAdC5+ER7Xk63iYXgUOhvnGVunZueqLCP2o4jo3l?=
 =?us-ascii?Q?wAw1stp0fKVCOp1BrnBgQV+5oE8WxvzAkEiX2XbbUzjrvVMg8BRY+d/6nkEy?=
 =?us-ascii?Q?QHcK5v9mu2Rz6BUeOnZyZS+x0xUmdLN4vBqJSAwVs/Bv5rKhfrv96z5HJpuN?=
 =?us-ascii?Q?/0+G7dPeXKZFMZLgsN/f6fHoFxAPWA3V8HxprUxnvDG6mCZ+IKq0GktD5zX8?=
 =?us-ascii?Q?ZZn1PZURCGv2aR88Q/yIsZ2f26d7hSr7b60uloaiyCjzplV93POpwKToOP1o?=
 =?us-ascii?Q?C6XqfFHvb54cAjT6/TBxTgnCsHl50QE2fvdQJhn7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf138f0-4c4d-4b24-0920-08ddb87afc48
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:40:51.4150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCtx6189v6Ag3d74deTV0Go89thsg7e8Wjn77kYkGKO1mSYaLt1AXs0l47qZhNyHqWxnxKD0KhXQQZS2UvSwH4UJaTdAyE1IKMePYBwi2eU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5839


Hello,

> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Tuesday, July 1, 2025 2:43 PM
> > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> > > perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>
> > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect
> > > failed on
> > > alc256
> > >
> > > EXTERNAL EMAIL
> > >
> > > CAUTION: Suspicious Email from unusual domain.
> > >
> > > On Tue, 01 Jul 2025 08:35:05 +0200,
> > > Joakim  Zhang wrote:
> > > >
> > > >
> > > > Hello Takashi,
> > > >
> > > > Thanks a lot for your help.
> > > >
> > > > > > Hello Kailang,
> > > > > >
> > > > > > I'd like to insert another question through this. That would
> > > > > > be appreciated if
> > > > > you could have a look.
> > > > > >
> > > > > > After system boot, we can see the default mixer status as below=
:
> > > > > >
> > > > > > root@cix-localhost:~# amixer -c 0 contents
> > > > > > numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
> > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > >   : values=3Don
> > > > > > numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
> > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > >   : values=3Don
> > > > > > numid=3D13,iface=3DCARD,name=3D'Mic Jack'
> > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > >   : values=3Don
> > > > > > numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
> > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > >   : values=3Don
> > > > > > numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch'
> > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D1
> > > > > >   : values=3Don
> > > > > > numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume'
> > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=3D8=
7,step=3D0
> > > > > >   : values=3D60
> > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Switch'
> > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > >   : values=3Don,on
> > > > > > numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volume'
> > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D8=
7,step=3D0
> > > > > >   : values=3D87,87
> > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
> > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3=
,step=3D0
> > > > > >   : values=3D0,0
> > > > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > > > numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
> > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > >   : values=3Don,on
> > > > > > numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
> > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D6=
3,step=3D0
> > > > > >   : values=3D39,39
> > > > > >   | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
> > > > > > numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
> > > > > >   ; type=3DENUMERATED,access=3Drw------,values=3D1,items=3D2
> > > > > >   ; Item #0 'Disabled'
> > > > > >   ; Item #1 'Enabled'
> > > > > >   : values=3D1
> > > > > > numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volume'
> > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3=
,step=3D0
> > > > > >   : values=3D0,0
> > > > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > > > numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch'
> > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > >   : values=3Doff,off
> > > > > > numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume'
> > > > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D8=
7,step=3D0
> > > > > >   : values=3D0,0
> > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
> > > > > >   ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D3=
6,step=3D0
> > > > > >   : values=3D0,0
> > > > > >   | container
> > > > > >     | chmap-fixed=3DFL,FR
> > > > > > numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
> > > > > >   ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D3=
6,step=3D0
> > > > > >   : values=3D0,0
> > > > > >   | container
> > > > > >     | chmap-fixed=3DFL,FR
> > > > > >
> > > > > > It can auto switch 'Headphone Playback Switch'/'Headphone
> > > > > > Playback Volume' and 'Speaker Playback Switch'/'Speaker
> > > > > > Playback Volume', when I plugin the headset or not, but I have
> > > > > > not found the related logic, could you
> > > > > please help clarify a bit?
> > > > >
> > > > > Isn't it "Auto-Mute Mode"?  If it's set, the speaker is muted
> > > > > automatically when the headphone/headset jack is plugged by the
> > > > > kernel
> > > driver itself.
> > > >
> > > > What strange is 'Auto-Mute Mode' would be disabled after headset
> > > plugin/out several times, don' t know the reason....
> > >
> > > "Auto-Mute Mode" is a software switch, and it means some program
> > > must have turned it off explicitly.  e.g. the sound server like
> > > pulseaudio or pipewire disables it.
> > >
> > > > However, it seems that speaker and headphone/headset still can
> > > > auto
> > > switch. Please see below mixer status.
> > >
> > > Usually pulseaudio/pipewire takes over and does the switching.
> >
> > OK, I see, I will dig into it, could you please tell me is there any ot=
her software
> switches in the mixers?
>=20
> Any mixer program can change...  But basically the auto-mute is a task of=
 the
> sound daemon.

I disable both pulseaudio and pipewire from the Debian, and enable the auto=
-mute, when the headset plugin but the switch not set correctly.
'Headphone Playback Switch'/'Headphone Playback Volume' not set, but 'Speak=
er Playback Switch'/'Speaker Playback Volume' enabled.
Are there any other possible reasons?



root@cix-localhost:~# amixer -c 0 contents
numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D13,iface=3DCARD,name=3D'Mic Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D1
  : values=3Don
numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=3D87,step=3D0
  : values=3D60
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Doff,off
numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=3D0
  : values=3D0,0
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D0
  : values=3D0,0
  | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Don,on
numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D63,step=3D0
  : values=3D39,39
  | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
  ; type=3DENUMERATED,access=3Drw------,values=3D1,items=3D2
  ; Item #0 'Disabled'
  ; Item #1 'Enabled'
  : values=3D1
numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D0
  : values=3D0,0
  | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Don,on
numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=3D0
  : values=3D87,87
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
  ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D0,0
  | container
    | chmap-fixed=3DFL,FR
numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
  ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D0,0
  | container
    | chmap-fixed=3DFL,FR
