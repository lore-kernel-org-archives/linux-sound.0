Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2111.outbound.protection.outlook.com [40.107.223.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E9ECA6B
	for <linux-sound@vger.kernel.org>; Sat, 17 May 2025 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488530; cv=fail; b=AgiEAlxFI1IqmSGJSpTaUZ/Higyrvo9T1s9v2c6WOuI9lgOGm063jI1fk0I5tILiyxtaIs6HKXwPqZRVyxheCeK2vGCXQBS/TSpGcJGDSrHKAvELpHfOVPbXpij9PSLkAOABLsyGG0xfRhbM+mfp4KjZUs5fuLLA5B42iF6Vy0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488530; c=relaxed/simple;
	bh=dk8xyb2ii/7UMD6dwYHXLobL9gRapfDOh+1aNUG9nZw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j2MWKF1BjY3FDOe4eN6bRRM201ye0P1E+WSBystbxyzKfjzCs6pmbosDYHAUB4hLlY9ArwXamPPTx0zA3eOB17j9a7SipT8MboMLcOSrIo7ZLQzDXOlWDSs8q6iC2LUE05b3tKpiiD28E6Jag3O9zfNmU2LFW9A0Yz6IJ6RE2LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palmerwirelessmedtech.com; spf=pass smtp.mailfrom=palmerwirelessmedtech.com; dkim=pass (1024-bit key) header.d=palmerwirelessmedtechcom.onmicrosoft.com header.i=@palmerwirelessmedtechcom.onmicrosoft.com header.b=CyX2DyUR; arc=fail smtp.client-ip=40.107.223.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palmerwirelessmedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=palmerwirelessmedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=palmerwirelessmedtechcom.onmicrosoft.com header.i=@palmerwirelessmedtechcom.onmicrosoft.com header.b="CyX2DyUR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XD4sqQum49ms1yy0Tsh+4BnC8Pqe/3qXFFVpXnALmZ9leoA64yOnwbcAhsERgv826fH7/gh2PWeH0KafOHy7innVE2PdOmZ2iaV9+w3H8gVy9pjkeloKFL5AJ13c+nZeXlQL55zuMY4cIHk3BVgCPKS/ZYm6Ttr00QDsWb20uKi/xdcjIzoQpGTTHkb+Ua4uvz9bXEMUuT8W9gwIVnZQADvlgLp2h3Xg0kXCJXVe2PhwRDQ+UYSKbab5NPHhq8vWu0WZVhYqgDoIocD/9Akr2+OMC9ky/5ihCG+ooAld44KRzMZ3kL/cPHmIWEY1bk50dNZc1yTIJUa/fzMVohlsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWzeGIZSG5WBeGXfl5AE8aayHwuph3G0AMAn5OVhRDg=;
 b=bsaOPhbhoJVMQNwFvMRKxDegJoJwxmNSzgv0SPrP4JWSDrL50NIjrfXX30wU9mNogDJlgpF0N+0ffiGe3TincG1JXWUBn4SGLNBv0yYCsyMqGqi5fE+MxCKXaZL19qKsiHwNhzTcusEw2iXk82kVh7ZVsL+9lpSqFtM8lQxAevaXWbfTwzQmfOo+UwjnOamR01Lslp5HGzcJDtARDaYNCBK/p8X1f1ZB/QeOAPaxUID4ONJUKamIPACSn5Twj56AOsR7mXHrPGSAZD3OhFkVnyybFg1Zbj8Rqi2caweXce4YOop7jbxIK5aHhC+Qu7CXJ9hasQ0Q6ejDoJeGUE4B6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=palmerwirelessmedtech.com; dmarc=pass action=none
 header.from=palmerwirelessmedtech.com; dkim=pass
 header.d=palmerwirelessmedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=palmerwirelessmedtechcom.onmicrosoft.com;
 s=selector2-palmerwirelessmedtechcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWzeGIZSG5WBeGXfl5AE8aayHwuph3G0AMAn5OVhRDg=;
 b=CyX2DyURp26hOydaD1XpBmboQ8KWQBfZG9iSSlj1hsLJ3/FBi9n97iGvXc/ePTVwwsrRTGNH3oI6/mXGS+rURvUGLARbcdjSRDhq6IWqwvKFiI6jLJsbWDO4rLpxL03gl1ujVcARzKZhzOwDBkvcEQuw4SjdJIQJTNkF55ZXhqM=
Received: from IA1PR15MB6008.namprd15.prod.outlook.com (2603:10b6:208:456::5)
 by PH0PR15MB4944.namprd15.prod.outlook.com (2603:10b6:510:c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 13:28:44 +0000
Received: from IA1PR15MB6008.namprd15.prod.outlook.com
 ([fe80::a280:9c40:1079:167e]) by IA1PR15MB6008.namprd15.prod.outlook.com
 ([fe80::a280:9c40:1079:167e%6]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 13:28:44 +0000
From: Steve Broshar <steve@palmerwirelessmedtech.com>
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: FW: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
Thread-Topic: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
Thread-Index: AdvGm2GwhjF7ALRDTa6EaezGwRm8LgAk++bg
Date: Sat, 17 May 2025 13:28:43 +0000
Message-ID:
 <IA1PR15MB600841973B3E258AD09E727FB592A@IA1PR15MB6008.namprd15.prod.outlook.com>
References:
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
In-Reply-To:
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=palmerwirelessmedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR15MB6008:EE_|PH0PR15MB4944:EE_
x-ms-office365-filtering-correlation-id: b4c97924-1fe1-4f2c-c8a7-08dd9546bee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?n0iewGQrgWqFJ52C2FvPjeNMS4hJNWZfxyNJK3zaHD9lX7U2l2gDAs9o7tAk?=
 =?us-ascii?Q?zAhDmoQRor2aLN1IwpdvXYZeEJzznNa7sh8+r+ESP1cb5jJcI//3H5MAqR9h?=
 =?us-ascii?Q?yjXra8vgdSw/Enz8SXO2jfhAlAp3voHvAzWoOAA7lPZ2WfvCAwLiLMuzU4lM?=
 =?us-ascii?Q?7OdNbAvVCnzXesComP83eElOtAolyB9HUAD11I1kF9tfoEvpAuTj6VmTzFTq?=
 =?us-ascii?Q?OjkIbpwYs17DhdLc0zML5l2CXfEp/UNDu1lXxX/uCC6nAaNFXp29DL/8rXTo?=
 =?us-ascii?Q?YstlocWQ1PdWA53SKZMqV6Piju/eMlT37TcS5GbykfeiVVpqFr/2PaZeOuq8?=
 =?us-ascii?Q?EVg/2XoqvrMhHqLYqSKEuWnCwNNX+sHj05AFhOPbGDdKQSV8MqJMW285C7cS?=
 =?us-ascii?Q?9KCtdbat+SW3HZsuPS2b5GjSl3avlc7UCxQ0L0K8r8CCV+a5diR3V/z8AbIR?=
 =?us-ascii?Q?vjBpQw2U93FZ0t0aa8Z8x7LEdmXST0205ADGuZhJ+9bgxEe2ixucccUYNHFZ?=
 =?us-ascii?Q?UWeiUfiAvn3AFUZE2/Ck6ejFbsULyxxc+7IrRGcfLqEZAWwoj7vfKEuwZiT8?=
 =?us-ascii?Q?QvGazYBYm0syrkzvfMi4kEoyngMyjJAN+Pk1gnrfbRspec/6dOGjQABZc8xs?=
 =?us-ascii?Q?jLRLpzEy7jY6jcZwvH3Bz5gwW1nhXFp8uUBGSr1i1PzLpg1W01iHTmLH+a+e?=
 =?us-ascii?Q?Vel9Cov+1tRqvp2+fj1XwScghJTVE6aVlIM7M2HL3Ympq7gdls4HwUqgtpvt?=
 =?us-ascii?Q?jouytwtEPJ5tGQ5H1bCpUQIDaOEZflaA6rfSUxzj61q5SbzdBeGDjV3GFCSB?=
 =?us-ascii?Q?XWSQI+rZxjFiP2RwlDALhm3shMMjZ6zlrIL+LgNw2s2D2UMg2Ou+rbHGp59o?=
 =?us-ascii?Q?gTJShmQLoBEhBfKtcAeCtu476lG86BP0o6bRnDYxu1TZRzo97BnpqKA6jS4c?=
 =?us-ascii?Q?LKRrmHpiFkhEqp6sR+vOZtDKxs4d2v2R2yGj6OheFW9VjEXmNmpiUQz80lrp?=
 =?us-ascii?Q?rNnhkAO8C+XBANqZHjJnJyUtmyOnYbtFtltZsB2n/HPIIhaZI8TUxEDk9kVe?=
 =?us-ascii?Q?mBHpAIO30YwGPycWhEUgVA012ETu2iF4iHYHb8W/G+XughRjwPZSMfTqS2+1?=
 =?us-ascii?Q?hWZifUbRSLlfKOeyPOYpwTJiQhHJrNzgP2iEZ3Z9pGtLum7b/bQRmerZBqUh?=
 =?us-ascii?Q?akgUNYr76FtiM/1jrh0eCtVLNfP9QjwQLBX3QXDR6qLCKuAzfiIB0MHHxVWs?=
 =?us-ascii?Q?BNUPq9D9+5UFLUjIbKJgw/lcsuA4VwF4Z0b16vJkeR/ar+YhXMyhAH4oPUtm?=
 =?us-ascii?Q?l/7A3FMNwj3LKAZqx8W0mQ44GAIzOvTBDJ5lb5r9JChuZr1bfK9pbbccUG5/?=
 =?us-ascii?Q?4w5E5FSV2K0bkAOZ+ZcNWqvW07MrsJeQ8btIuYGQPt9Upz+j2SzBBtl9ip/q?=
 =?us-ascii?Q?7dvmiKVV209Qv7xmfJobuLx+dE5Nt/e10fWCSzaIm+/wWoZFlMImMQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR15MB6008.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?D63FTNi8Wj2TY2ez/zU7r8EwfAxOjObFWGsJbSAbeu1AI+hOmuCUYUm9ax1M?=
 =?us-ascii?Q?tH78iQ0jLGcgtjjy1mnsEmp+gt3tkaj8i+i7OEqJPgydOG41W3LO/lhmtjrX?=
 =?us-ascii?Q?zP22Sja2JJOwXXyzoiPKJ5bz776rSW8yzGUB/n99WwxQPPvO4M8tqviUY7l7?=
 =?us-ascii?Q?CMQn3KkOgQdHPXgG54v6PycPMgfukj3n1u7fq0G/v1ONZ2D6M/ZKJZNLH2LI?=
 =?us-ascii?Q?quD2ImOUbUCH3op0eq6IOdp1+2sOTCPKg9OAwmijkQJeR4/mKo+vhk3jEPyh?=
 =?us-ascii?Q?2gzK6s23PdYmpc4RKqydhwTB7f7Fmmx3x//whV2CsdTKZlyiw7Xz/C7BYa5T?=
 =?us-ascii?Q?i3+Ux4waxHQB8seGkgmJPV5KPaQQWwZDGWE0A4j95vMnjWEwu4ZEt9JLmX9N?=
 =?us-ascii?Q?PTZM8SGzgV7wMIdbA1cO8mQ7KwXaHqeIz1oqBKQez55K+rG97ic2CjMhjMhR?=
 =?us-ascii?Q?1XCqE1BhuXI3XiFO8W1h8BhCUdIBuDhd9WBbMHdLn8L65MKz+bSe2isXLvDg?=
 =?us-ascii?Q?UjdZeMpy/mobokjzTRV7LREfa8Gj+8HLm74iZuBnjtOV4Gt98bOpQoeGLFah?=
 =?us-ascii?Q?57cBXE9zyRHG/a9sMOmoej92xfQDg8Ik5rRFQhDtU0agmX3fMcpuSg3TT8Jv?=
 =?us-ascii?Q?c3KCcQcP8RoirR/n/HlhkqmdHiRFIdrvQtEOq0t/kLYY1hT34N9wDG6MA1ui?=
 =?us-ascii?Q?OJceG8z90VFVQhR54gX8YuuPrBiC9RhPFriPcWtoVSNZEj5T3+LTTc4rbmlv?=
 =?us-ascii?Q?y2OMsgNq4lduaxX+yJZSKWmZQ7GSm1eyDPCrgnQfARDg9XntzkUWK+qGVyym?=
 =?us-ascii?Q?7L40K3SgibCRJ/94aSwpMscPO5PacxSg4IwJk3mrzxTskdYRAUZitiRAxGk+?=
 =?us-ascii?Q?Xjj88qRLsldZ/0cokFMyHwrDbZsSNBhOKVyk6YPGWg9h8tcZueH2pwQqrH/q?=
 =?us-ascii?Q?dkHbLP9tBzKXg7biOGe8nZ9qG7unXrdYvYOZHyrg1e/ZsEoftDr+DE6BCqsr?=
 =?us-ascii?Q?+tky/Qb8R+noAgKhkZPZNXDiKf+flsj2FIuHYLcVWR1x05KP7UhWMXq4sR4v?=
 =?us-ascii?Q?HZEpj5RIq7/Yb5cHIVXbf3iW7ky+W7DODGa+MWFNRQm3WtBDbpWVoUHVRdpY?=
 =?us-ascii?Q?ia2h1nrjJYjU5lwphbtqU9lRWn7OLlJKHPX16afhLJsm/tRu4Lrcr0pH5tr9?=
 =?us-ascii?Q?fB8ZffA/MRXai95kw+qIcLlE/uZhDxfLhdj1I9ZNida3bck27wKN3iveMvFy?=
 =?us-ascii?Q?KLa4f2zNBhrQTMeVWE6yNA/bg1RxoZ3ITqhzCsU72H/dF1SBNaA34aPJxOLd?=
 =?us-ascii?Q?EUu7+aV1hF+YjQQS2neL5GWVwM2tv/mpQlgx/BYGQmZSurPIvY5/GeAX9UVe?=
 =?us-ascii?Q?WuOtugz34juP4DcLtasFfou/W8OLPJ24CD5dzyyl7YcPHMukrQtVJJKtAenz?=
 =?us-ascii?Q?TI/cc4VRe9AWBW4YUwJIjBHwDrj1XGdofEKheMkoclgDD7ipYdMevc1VWHj+?=
 =?us-ascii?Q?6I8RWiFytnorV5wW+ozDP5ZP7YuyfV+fzo6m2USdEGV/R3Jcgwvh92/1WAFd?=
 =?us-ascii?Q?eJ43UxM+eMBJnSrm2xWozTYU5zCK7/zH227cWcwI3OjZTKwVGGS+SJ7Ywpru?=
 =?us-ascii?Q?AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: palmerwirelessmedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR15MB6008.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c97924-1fe1-4f2c-c8a7-08dd9546bee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2025 13:28:43.9050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 18187d5c-662c-4549-a9f0-3065d494b8dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTlDwOqiOR50Z5Wrc8MoECUzq/lrhYDNWcwH8k2rYloApvmKhVXwp+NlL8WwUNL0GgfRwzAhj2KJhd137ptplAPhwFS6f24+RmbqG25mUfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4944

+linux-sound@vger.kernel.org - IDK which mailing list is most appropriate a=
nd received no reply via alsa-devel@alsa-project.org

-----Original Message-----
From: Steve Broshar <steve@palmerwirelessmedtech.com>=20
Sent: Friday, May 16, 2025 2:50 PM
To: lars@metafoo.de; alsa-devel@alsa-project.org
Subject: Request for help: How to upgrade a sound driver from kernel 4.14 t=
o 6.6

I have an audio driver/module that builds for kernel 4.14, but not for 6.6 =
due to changes in the kernel API.I find that API types (structs) and functi=
ons have been removed or changed, but IDK how to modify my code to use the =
updated API. Further, some of the changes seem less than clean. For example=
, in a couple places struct fields have been removed, but comments that use=
d to precede the fields are still there such the comments are clearly no lo=
nger relevant and are therefore confusing. I have to wonder how many commen=
ts are out-of-date.

My ask is for help fixing my code. I don't expect you to fix directly, but =
I need to know how to go about figuring out how to fix it. What changed in =
the API? Is there an upgrade guide/info?=20

I am going to include more than a little info. I realize that it might be o=
verwhelming. But, I fear that I try to reduce the info too much it will not=
 convey the relevant context.

I'll start with my analysis of my compiler errors that I get.=20
	Seems that the struct snd_soc_codec and struct snd_soc_codec_driver were r=
emoved.
	Seems that snd_soc_register_codec() and snd_soc_unregister_codec() were re=
moved.
What replaces these things? What do I need to change to accommodate the rem=
oval of these?

FYI, here are my compiler errors:

<build-errors>
$ make -C ../../.. M=3D$PWD
make: Entering directory '/home/steve/code/compton-kernel'
  CC [M]  /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_=
i2s.o
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:110:=
38: warning: 'struct snd_soc_codec' declared inside parameter list will not=
 be visible outside of this definition or declaration
  110 | static int codec_driver_probe(struct snd_soc_codec *codec)
      |                                      ^~~~~~~~~~~~~
In file included from ./include/linux/device.h:15,
                 from ./include/linux/platform_device.h:13,
                 from ./include/linux/of_device.h:5,
                 from /home/steve/code/compton-kernel/drivers/compton/dep-i=
mx8-i2s/dep_i2s.c:7:
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In =
function 'codec_driver_probe':
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:112:=
19: error: invalid use of undefined type 'struct snd_soc_codec'
  112 |     dev_info(codec->dev, "Entered %s", __func__);
      |                   ^~
./include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_prin=
tk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                  =
     \
      |                         ^~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:112:=
5: note: in expansion of macro 'dev_info'
  112 |     dev_info(codec->dev, "Entered %s", __func__);
      |     ^~~~~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: At =
top level:
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:116:=
21: error: variable 'codec_driver' has initializer but incomplete type
  116 | static const struct snd_soc_codec_driver codec_driver =3D {
      |                     ^~~~~~~~~~~~~~~~~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:=
6: error: 'const struct snd_soc_codec_driver' has no member named 'probe'
  117 |     .probe =3D codec_driver_probe,
      |      ^~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:=
14: warning: excess elements in struct initializer
  117 |     .probe =3D codec_driver_probe,
      |              ^~~~~~~~~~~~~~~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:=
14: note: (near initialization for 'codec_driver')
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
6: error: 'const struct snd_soc_codec_driver' has no member named 'componen=
t_driver'
  118 |     .component_driver =3D {
      |      ^~~~~~~~~~~~~~~~
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
25: error: extra brace group at end of initializer
  118 |     .component_driver =3D {
      |                         ^
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
25: note: (near initialization for 'codec_driver')
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
25: warning: excess elements in struct initializer
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:=
25: note: (near initialization for 'codec_driver')
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In =
function 'platform_driver_probe_':
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:153:=
12: error: implicit declaration of function 'snd_soc_register_codec'; did y=
ou mean 'snd_soc_register_dai'? [-Werror=3Dimplicit-function-declaration]
  153 |     stat =3D snd_soc_register_codec(&pdev->dev, &codec_driver, &dai=
_driver, 1);
      |            ^~~~~~~~~~~~~~~~~~~~~~
      |            snd_soc_register_dai
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In =
function 'platform_driver_remove':
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:166:=
5: error: implicit declaration of function 'snd_soc_unregister_codec'; did =
you mean 'snd_soc_unregister_dai'? [-Werror=3Dimplicit-function-declaration=
]
  166 |     snd_soc_unregister_codec(&pdev->dev);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
      |     snd_soc_unregister_dai
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: At =
top level:
/home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:116:=
42: error: storage size of 'codec_driver' isn't known
  116 | static const struct snd_soc_codec_driver codec_driver =3D {
      |                                          ^~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [scripts/Makefile.build:243: /home/steve/code/compton-kernel/d=
rivers/compton/dep-imx8-i2s/dep_i2s.o] Error 1
make[1]: *** [/home/steve/code/compton-kernel/Makefile:1921: /home/steve/co=
de/compton-kernel/drivers/compton/dep-imx8-i2s] Error 2
make: *** [Makefile:234: __sub-make] Error 2
make: Leaving directory '/home/steve/code/compton-kernel'
</build-errors>

My code (for 4.14 kernel)
---------------------------------
Here's my driver code. The macro INCLUDE_PROBLEMATIC_CODE is used around ea=
ch chuck that fails to compile. If not defined, the code does compile, but =
of course is missing important parts.

<my-code>
#define INCLUDE_PROBLEMATIC_CODE
/*
 * Audindate Dante Embedded Platform (DEP) I2S Codec (ALSA SoC) driver; Lin=
ux module
 * Supports sample rates, bit depths and TDM modes for Dante devices.
 */
#include <linux/module.h>
#include <linux/of_device.h>
#include <linux/clk.h>
#include <sound/soc.h>
#include <sound/pcm.h>
#include <linux/printk.h>

#define DEP_I2S_PCM_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 | \
                       SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 | \
                       SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000)
#define DEP_I2S_PCM_FORMATS (   SNDRV_PCM_FMTBIT_S16_LE |  \
                                SNDRV_PCM_FMTBIT_S24_LE | \
                                SNDRV_PCM_FMTBIT_S32_LE )

// for future use
struct instance_state {
    unsigned int dummy_holder;
};

static const struct snd_soc_dapm_widget widgets[] =3D {
    SND_SOC_DAPM_DAC("DAC", "Playback", SND_SOC_NOPM, 0, 0),
    SND_SOC_DAPM_ADC("ADC", "Capture", SND_SOC_NOPM, 0, 0),
    SND_SOC_DAPM_OUTPUT("LINEVOUT"),
    SND_SOC_DAPM_INPUT("LINEVIN"),
};

static const struct snd_soc_dapm_route routes[] =3D {
	{ "LINEVOUT", NULL, "DAC" },
	{ "ADC", NULL, "LINEVIN" },
};

static int set_fmt(struct snd_soc_dai *dai, unsigned int fmt) {
    switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
        case SND_SOC_DAIFMT_I2S:
            // supported
            break;
        case SND_SOC_DAIFMT_LEFT_J:
            // supported
            break;
        default:
            // all other formats unsupported
            dev_err(dai->dev, "Invalid DAI format: DEP I2S only supports le=
ft justified and I2S, got 0x%04X", fmt);
            return -EINVAL;
    }

    switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
        // codec as bit master and frame master (or external clock generato=
r)
        // note that jumpers on DEP-EVK-IMX8 must be set correctly
        case SND_SOC_DAIFMT_CBM_CFM:
            // supported
            break;
        // codec as bit slave and frame slave (ie clocks driven from SOC)
        case SND_SOC_DAIFMT_CBS_CFS:
            // supported
            break;
        default:
            // all others unsupported
            dev_err(dai->dev, "Invalid DAI format: DEP I2S only supports CO=
DEC as bit and frame clock master, got 0x%04X", fmt);
            return -EINVAL;
    }

    switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
        default:
            // support bit and frame inversion
            break;
    }

    dev_info(dai->dev, "Set fmt to %u", fmt);
    return 0;
}

static struct snd_soc_dai_ops dep_i2s_dai_ops =3D {
    .set_fmt =3D set_fmt,
    // add mute here
};

struct snd_soc_dai_driver dai_driver =3D {
    .name =3D "dep-i2s",
    .playback =3D {
        .stream_name =3D "Playback",
        .channels_min =3D 1,
        .channels_max =3D 16,
        .rate_min =3D 44100,
        .rate_max =3D 192000,
        .rates =3D DEP_I2S_PCM_RATES,
        .formats =3D DEP_I2S_PCM_FORMATS,
    },
    .capture =3D {
        .stream_name =3D "Capture",
        .channels_min =3D 1,
        .channels_max =3D 16,
        .rate_min =3D 44100,
        .rate_max =3D 192000,
        .rates =3D DEP_I2S_PCM_RATES,
        .formats =3D DEP_I2S_PCM_FORMATS,
    },
    .ops =3D &dep_i2s_dai_ops,
    .symmetric_rate =3D 1,
};

#ifdef INCLUDE_PROBLEMATIC_CODE

// Dummy probe
static int codec_driver_probe(struct snd_soc_codec *codec) {
    dev_info(codec->dev, "Entered %s", __func__);
	return 0;
}

static const struct snd_soc_codec_driver codec_driver =3D {
    .probe =3D codec_driver_probe,
    .component_driver =3D {
		.dapm_widgets		=3D widgets,
		.num_dapm_widgets	=3D ARRAY_SIZE(widgets),
		.dapm_routes		=3D routes,
		.num_dapm_routes	=3D ARRAY_SIZE(routes),
	},
};

#endif

#if defined(CONFIG_OF)
static const struct of_device_id match_table[] =3D {
    {.compatible =3D "audinate,dep_i2s"},
    {}
};
MODULE_DEVICE_TABLE(of, match_table);
#endif

static int platform_driver_probe_(struct platform_device *pdev) {
    dev_info(&pdev->dev, "Entered %s", __func__);

    int stat =3D 0;

    struct instance_state *instance_state =3D devm_kzalloc(&pdev->dev, size=
of(struct instance_state), GFP_KERNEL);
    if (instance_state =3D=3D NULL) {
        return -ENOMEM;
    }

    platform_set_drvdata(pdev, instance_state);
   =20
    dev_info(&pdev->dev, "Codec probe pt 2");

#ifdef INCLUDE_PROBLEMATIC_CODE
    // 1 =3D=3D number of DAIs, might need to be 2 for dual direction, or f=
or 2* sai?
    stat =3D snd_soc_register_codec(&pdev->dev, &codec_driver, &dai_driver,=
 1);
    if (stat < 0) {
        dev_err(&pdev->dev, "Failed to register codec: %d", stat);
    }
#endif

    return stat;
}

static int platform_driver_remove(struct platform_device *pdev) {
    dev_info(&pdev->dev, "Entered %s", __func__); #ifdef INCLUDE_PROBLEMATI=
C_CODE
    snd_soc_unregister_codec(&pdev->dev);
#endif
    return 0;
}

static struct platform_driver platform_driver =3D {
    .probe      =3D platform_driver_probe_,
    .remove     =3D platform_driver_remove,
    .driver     =3D {
        .name   =3D "dep-i2s-codec",
        .of_match_table =3D of_match_ptr(match_table),
    },
};

module_platform_driver(platform_driver);

MODULE_DESCRIPTION("Audinate DEP generic I2S ASoC codec"); MODULE_AUTHOR("J=
ames Stuart <opensource@audinate.com>"); MODULE_ALIAS("platform:dep-i2s-cod=
ec");
MODULE_LICENSE("GPL");
</my-code>

Steve Broshar
Palmer Wireless Medtech

