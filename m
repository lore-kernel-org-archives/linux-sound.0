Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023077.outbound.protection.outlook.com [40.107.44.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0033B2AE68
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 06:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352542; cv=fail; b=Xk5b6MJ+Pgr5XpDAz8V1+V1KTIjxB51tR1MZZ0ZQRbkYXYfbrAcLky+sHIIpKBNJMJADrm6D1So50Ptg36sMcdQ64skLl1vJoD5dX4yIiZcZ/msK0YyBky2KGuhIdHqbfcGxT7MYNpMSOnJ+RujVMhmd7WQTClJRidXXZaSEfIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352542; c=relaxed/simple;
	bh=bF7Zbypkd/c9a8vCzOWL5m9VPM+4cilW8VJoDV89Kn0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TuVyzFGARg8htk5l+3oHnMnyqy2QKN27sp3cNCfG0VSSe+wpqvJryQNDwJmqvyq/X3x+MicqVSEraGPr2BUorTW7laUvLZ9HrV0jv9yDmdj7Vxj+ami5abA2rxnwSuU5tFN8b9i0rZVeTWJ748+M7vBVcBfugCm6JGySbyzTK2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iwn6mVudeQWt2hlkWnKGHLCwlju4aNkcfl7Gll9oMOYUuwTaKa90baBrJMXSc7/gTcbbGHHb8nZf+w8Og9Tmn7XsjCFuNbz3qTAkDnR/VGpAqzbTtxk7Ce+N38RtjFd23y9A1TlzW8ltxpc2XJwZcsHwquDeDJzoFYdREnD5Zs06yvhIHzHQoiGHHB2G3Se52vq3r/Sc5jy5Y6tgvtDkKzzetxZQNZi77tjxe08R6oNx5FPMwiOIG5ZPYvcPeUIYQqezX9zU8GXTdHEIv8O0/aRq4SRsK0mFfu4TFgULUhS8GLb5Ybg4Y87OTJGwFEaCdcm2qUi951CdH9923p/Dcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLflS/6Qga2xAHjEeIM0XnISe5t35oyFmw0L7LBumik=;
 b=MBQwOrvkrN9GAkGvP6lD+AwgVEreTiQHQMjpFjneaP8hnk/E/D5t4MV7jITQxU15LK6MQBTlcSpnuR7if4GR/NPfPKfk2qsnR+u7XRRi0VXctsQZn8IbCnZwhFMsN/dJPNH1pW+mgfYR6Ee2nJzHQELkJ367somsQqKAmKvhmVO4PiF1Ln66jSB2c9RCvcwpBYiHjfpp13MsKYhQoE58SCGui2AfYxnOrO+pn3WwbRVYoQV/qZVh+CnvuK+0GnAOg5Ft0l03pbUEwTzRJnT5FYD8+h7IoMcURU12bvu4QnDQKPuN+LjAoPzJKYyUaAobsLejOE9KuXLo/RC0CBwXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by PUZPR06MB6103.apcprd06.prod.outlook.com (2603:1096:301:111::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 06:48:56 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 06:48:56 +0000
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
 AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaCAABzZAIABmbuQgAAnGgCAB7AeMIAAK3iAgAAHvGCAAAaLgIAAAOtA
Date: Tue, 1 Jul 2025 06:48:56 +0000
Message-ID:
 <SEYPR06MB6278B9C65FA98E18C87EDC1A8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
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
In-Reply-To: <877c0se7iu.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|PUZPR06MB6103:EE_
x-ms-office365-filtering-correlation-id: 39562896-8f65-480a-5bc9-08ddb86b59c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1pIFwhGQlVDYqdgzNL16BHKL8cL4nLhUp59jpBg5JMgVf7dLOp/fwU6Y75x3?=
 =?us-ascii?Q?H2cjaDrgBLIIuDYwEI0WDJZg5TMHRfAMbaN3yaKzCTKBKZqlpeQHKlLRtNrq?=
 =?us-ascii?Q?esDJVapn7xy+kpVQA7mpZ1pNab83qljBmjObnJCkBzHa9M0raNtnQA9gzPIh?=
 =?us-ascii?Q?I/96Xw4evJU6cVhiqIVNmVk7nljHUCDbz9WSiJ7lMlQEFO8tG1Mq3nEi5VdS?=
 =?us-ascii?Q?4eIsmPb85bzfHqKYrocT9Y8h8e761W+0l76GsD98YYFQdAsMgDhvJsINmDUW?=
 =?us-ascii?Q?snWtuNCLKpG+UWrGmeE/oQ683zqn7lXLAGbp7XSUPz3924iqrkx1WP74uC56?=
 =?us-ascii?Q?502+UB5Fre+nC5Rt5SHo8u0Tot41W0VBls0Fgdj8vhZrh0C8o9s3aUC63qCB?=
 =?us-ascii?Q?u1KWNPilRvBOpatBsJGfIg+HkT7xQ/bn6FJk0nAMolHieNwN3cyapZSXXGOr?=
 =?us-ascii?Q?uZMG7gmrGDGLtoQe9wqxUbLvxpPBOTnZu16k5MUhbzPNqkjOyTzaS/oE1gKT?=
 =?us-ascii?Q?wmapm5Vy3opjBUCTCFDZNCjBtWQN4Zr0K/C/Ncf+xyinFfeNqkOSpk3QS9bV?=
 =?us-ascii?Q?ee6XTAei7ozxFaFG7hJ4BneQb9urFrcfaRBbNTUKpj7N2ELOcar8fs52504k?=
 =?us-ascii?Q?Xnin7q3URan57/shVCZoNYZfY39twjQRsS0sUhOQSn1oLuYdZ2bBTDDb7uWn?=
 =?us-ascii?Q?ZFiiuXbIKp0yj+GaYQlhh1FhFy9vvGIYdEDqFq5bLm3rU2OeqRHyc+WE7QkF?=
 =?us-ascii?Q?v2RFoRqDY58Z8QjMSEs7WYtfq6csbkYcqYEoUmUSgy/YBvS4Wabz0kwjNgfS?=
 =?us-ascii?Q?tRkJ4dT4XNt0py78MvQOMOhwvXAz9LjUbPcVhs7E3Wvr1kYDtVzt37kFFU5F?=
 =?us-ascii?Q?o0vm2iafANJb9gOwBCtufk0QDiRKwoAokfffyXr85DqBKZjoSpccDDH/UCGh?=
 =?us-ascii?Q?c90a/GGcKgNPuBBfT+tO/D9ryGH0yBVTzpvyd7QRKy6/VjnBDmwsfvDUv/za?=
 =?us-ascii?Q?IqrbZjMdmS5nfvkD8h7vRht6ACwkh1usvGrYMfksdR6Z+MelsTwcBNfAhunu?=
 =?us-ascii?Q?UghaLL+kZf6k8x+N7bjZylPZAv+ZbrpDPiEMPzQ4JHpDyUbpQ/6G5p9TCFZH?=
 =?us-ascii?Q?Z4eMdDC04dK42FP1xakgGR6QXL0oXsewVHkhK4BxPC0cSTYk946UkriqAyhJ?=
 =?us-ascii?Q?m8FgieO1aagXKWp0tWXGTheC9xJ/1fD4dqmm1BGAtCPQ5BMC4hDvqsfEE3Lq?=
 =?us-ascii?Q?6HFr1rNXtQM3B9bTdsUyAUZXZj70/NmD/1KN2fsd/Hjo0Eh/i80kKN1VMQrw?=
 =?us-ascii?Q?Zn4xjT1VhqDPSLkt+5bwg2jvKJp/ss9yJrkeWCHlKkd3FjRCPT+6YDG07rTi?=
 =?us-ascii?Q?vxPVPD+BzhlnExQblv2M9WDA+tuENJUmyJKQxmkNT7gGGjqDWGALj9Z2Ngqr?=
 =?us-ascii?Q?PtkssUrr75Smw5VlBFltK7EIPzKo7rIupGhniAheHXyP1fkR4Ovxkw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KqF4qlf6kh+HVW8lp56PGeTcTTKt5askLuX7j9staHqr6q+cI3a2z6+cg8TP?=
 =?us-ascii?Q?XH4u3cgBzaRmnsmv6/Vk+V3cscKzlqABn7SKVtQGGmObmJVH91WVr4ulS4gQ?=
 =?us-ascii?Q?9zl19npYXv3PAER4TuIxMMm00NY9mZPupsZan7kwyCYKJHDOWKDfyZvz/C/h?=
 =?us-ascii?Q?7dvKNsgpfSFD6iLkO80hDg2HPnFVolEL1qezUqQHkjzgbO0tTEhvz9ooxgYW?=
 =?us-ascii?Q?ORt3D03UsUCbxDOr0pgNCQUVNWc830QJ2yBPPlE3wPVpbsZQMzGBx2vvkW9g?=
 =?us-ascii?Q?ilnN3K8upgUyui5L9A6M/+Ri/zRCta8DATppTHh9J8WkjqDj3vkTzoJQAgcK?=
 =?us-ascii?Q?R+1ek7MMpJAenTNmMTgEclhDwKm9fv6PEv4wz2oIVBKNVXQLgBxDCkuaH/2G?=
 =?us-ascii?Q?8Ve9TzNfvmAret0fhb2mlzZNUQm/+BPU2wEKfEMaQIWKQro0MyXLo3+94CbJ?=
 =?us-ascii?Q?niQwPUdbP/DHlwg1qidtZYEEa6o+++adO4RrQb4bDeVab7Vjjx2zQKhIgNHg?=
 =?us-ascii?Q?peGnsD7dIYwZ2Nay+aDrLIxK5Ckj3hxbQPHLdAdwED1gFg5ka5+gMlRBflDb?=
 =?us-ascii?Q?Bs4z15TfJsI3BwIykNK1mfBecHhNrfsJeCQHK0Rz44kuuNtUh2rhUGJjUcJP?=
 =?us-ascii?Q?n7NE/FExEY48v3DYjZ5VE3TuNPUIsh/A9+Jshn64DQA2Tnr+ogWyvhgIR5qx?=
 =?us-ascii?Q?m6peCJW9w3WwUUE6wd0j+shJE/LXsFkDmA6/WSFtIUp1ys2jehDLvnU0Mqm0?=
 =?us-ascii?Q?cKlZnsY3jlcoSuF9Bk/ByuK6FSefNel3zeYVh3no8ZdXpIyyAELiiI/A/py/?=
 =?us-ascii?Q?7SVOC63+ho0tvDRF4o690BsVCGacsJpQsgynADf/UaWAGL+1Ht3LAqDzeK7H?=
 =?us-ascii?Q?F+sMP0j2f6QdNpvF/OuuLtwQ3GbF/R/Hxa45GY5KAfrEsHr0CfphWtx1x+Ir?=
 =?us-ascii?Q?0a/9dTAaKSJsrC7P1cA3cYilpVXf2+pQSUhJHZhNCG+C+ozcHKDTHveRslks?=
 =?us-ascii?Q?qS2UNI10YdxGMBL0Ihai6RFQ0+0FNOQRJ/8yY6jzNY1V0fQD+B+G+bWBZr1f?=
 =?us-ascii?Q?HssXMssoOg1Y4lAZi/usadw9yR6Lc6ZNDDvAU83oZmPBoVmG3TL3p6Cf6kLn?=
 =?us-ascii?Q?FhOvRXbrLEmYSTYLTnos4j5DkKtfUnHHma0siKIS25i0ZlB3HCLUNWpXco3q?=
 =?us-ascii?Q?4+FYzLRDWMZ02etiy201itHV79Q3VM/ZhUESGBdFXURIOyLc7xqRhtkw10Sf?=
 =?us-ascii?Q?gHd0EfW+SfYkkiMMXB/rLxK3uY6a9mChdhcj6PUoytGl842lbzxVGUpM4xr5?=
 =?us-ascii?Q?jJS+cyBQrB4oxkTY84SrCRg7v5NYopXq0IIBoN5LkkN0YHLmbps0j+eFV8eF?=
 =?us-ascii?Q?BtMahk9bCciCEulVN5ffXqb2i3MdDEZB5LO2/vs+juehsrU9mh4PztYiQsey?=
 =?us-ascii?Q?dVTo7e9Et3MJCFrUC//GqkPDk5eOzPAdmRuBiFkqOP3bfM3fhhUbGsYEB2CG?=
 =?us-ascii?Q?6pxxv1nl6+UGL2aCWVZxbK4Gzx9gfcST/OSy3y5ruQv39EL05vcsLeU4fZH4?=
 =?us-ascii?Q?TOyfrvEzcT2L+H+VTxrShevpik5LPV2jYubzAHsF?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 39562896-8f65-480a-5bc9-08ddb86b59c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 06:48:56.3279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zGaaNnbBJvv3tEpd+t53MiYvQiQe+NGjeZF6SpM4JNk89VsrbB92FWltAL8mZbe8XfQGW0qih6fkkM4AEMcSsH2xz+s3JhKB5IwRFOMiJbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6103

Thanks,

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, July 1, 2025 2:43 PM
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
> On Tue, 01 Jul 2025 08:35:05 +0200,
> Joakim  Zhang wrote:
> >
> >
> > Hello Takashi,
> >
> > Thanks a lot for your help.
> >
> > > > Hello Kailang,
> > > >
> > > > I'd like to insert another question through this. That would be
> > > > appreciated if
> > > you could have a look.
> > > >
> > > > After system boot, we can see the default mixer status as below:
> > > >
> > > > root@cix-localhost:~# amixer -c 0 contents
> > > > numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
> > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > >   : values=3Don
> > > > numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
> > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > >   : values=3Don
> > > > numid=3D13,iface=3DCARD,name=3D'Mic Jack'
> > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > >   : values=3Don
> > > > numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
> > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > >   : values=3Don
> > > > numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch'
> > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D1
> > > >   : values=3Don
> > > > numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume'
> > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=3D87,st=
ep=3D0
> > > >   : values=3D60
> > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Switch'
> > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > >   : values=3Don,on
> > > > numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volume'
> > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,st=
ep=3D0
> > > >   : values=3D87,87
> > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
> > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,ste=
p=3D0
> > > >   : values=3D0,0
> > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
> > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > >   : values=3Don,on
> > > > numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
> > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D63,st=
ep=3D0
> > > >   : values=3D39,39
> > > >   | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
> > > > numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
> > > >   ; type=3DENUMERATED,access=3Drw------,values=3D1,items=3D2
> > > >   ; Item #0 'Disabled'
> > > >   ; Item #1 'Enabled'
> > > >   : values=3D1
> > > > numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volume'
> > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,ste=
p=3D0
> > > >   : values=3D0,0
> > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch'
> > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > >   : values=3Doff,off
> > > > numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume'
> > > >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,st=
ep=3D0
> > > >   : values=3D0,0
> > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
> > > >   ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,st=
ep=3D0
> > > >   : values=3D0,0
> > > >   | container
> > > >     | chmap-fixed=3DFL,FR
> > > > numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
> > > >   ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,st=
ep=3D0
> > > >   : values=3D0,0
> > > >   | container
> > > >     | chmap-fixed=3DFL,FR
> > > >
> > > > It can auto switch 'Headphone Playback Switch'/'Headphone Playback
> > > > Volume' and 'Speaker Playback Switch'/'Speaker Playback Volume',
> > > > when I plugin the headset or not, but I have not found the related
> > > > logic, could you
> > > please help clarify a bit?
> > >
> > > Isn't it "Auto-Mute Mode"?  If it's set, the speaker is muted
> > > automatically when the headphone/headset jack is plugged by the kerne=
l
> driver itself.
> >
> > What strange is 'Auto-Mute Mode' would be disabled after headset
> plugin/out several times, don' t know the reason....
>=20
> "Auto-Mute Mode" is a software switch, and it means some program must
> have turned it off explicitly.  e.g. the sound server like pulseaudio or =
pipewire
> disables it.
>=20
> > However, it seems that speaker and headphone/headset still can auto
> switch. Please see below mixer status.
>=20
> Usually pulseaudio/pipewire takes over and does the switching.

OK, I see, I will dig into it, could you please tell me is there any other =
software switches in the mixers?

Joakim
