Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2118.outbound.protection.outlook.com [40.107.220.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DF713C3C2
	for <linux-sound@vger.kernel.org>; Thu,  3 Oct 2024 11:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954091; cv=fail; b=MDRNGkYd2pjTDLfR0X2aUBR8zCRXUMSXLPmz+T+Sehe72efLnRWlvOLCzz6bDolGxPPXbrtszYWPMMgrj6qKQogQbBx1JoiXhVr9A7yIXMgajWqgw1KBCazltp9xyGPR1v+7Wdl2vqlIsnA8e4hQpCWCtZPVPYrgpIetByQ4pOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954091; c=relaxed/simple;
	bh=E24xPYbFxMgF/4DTlVk6ebTPYf9fAj30E9FSAqueNe4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Pe4lIIx9aY/ojpxXcR1lmMb+i6Eh0R/enKaoQIb17ls7Jtj5MCLAyRKJAjGUqduz2vhj6W9XaJRIhq90XwFOdX1PIivz2VjlM9AvZU2WTzc4AUv5yEwtHNwdfvr04W5r4M8I5qq97EveTz28RIvHPWbIJONQj2uvUiUIntuvrdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uc.cl; spf=pass smtp.mailfrom=uc.cl; dkim=pass (1024-bit key) header.d=uc.cl header.i=@uc.cl header.b=he6E5TZv; arc=fail smtp.client-ip=40.107.220.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uc.cl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uc.cl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uc.cl header.i=@uc.cl header.b="he6E5TZv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xA6aYUZqaPY2XBe29Z3DAsSI3fgkvVyIc4ygjrTJfpZUYpjtxAE5U58tMU1Fh4iadhAhvTU7NeqouW5FYULVDVtf6sWLTab1VNSUY/AC/MKbhwmXh7486f6q6inXHdT7XdENvjsvqtouk7Hzc9s7H7bITIoXy2dzL4jl4Zztbslqepv+CTecHJ8y7GVVGxxagdJqKnJnsFEqPE2/CoUBE/yAsw5UlYn/a6tpOwvuica/sft1Ie404Y70K8pOnhmZhbFJq0ZVm2avUTHDMq20dLCe1EM122v1ewNxNmUMFcc7/ISb0LvZqhehto+QBradacxIzJSjTzRGIOTprrWnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E24xPYbFxMgF/4DTlVk6ebTPYf9fAj30E9FSAqueNe4=;
 b=IcBGYu7WsFPJIoJ5f/rLi097d9mORBECPjIWf3BrLWsq72XyJ/fuifxWckMnrvvsY4ro6LtqgrgzIY6MvHo7oTpIrZ45w7Y0ip4CQYteThoNIFl/ldfLPDJ6BOB386snvf568ZMBXqGvgQgHQ1kOkb34ctL7dYxm8Bjv8aWVA4t9uF0bbJ4PO3YA4mgsm2iTVV4x4yfH7mV1PDblMtp+cwyXXHaMpk83gqnaAXL4qajgwU3S043INiPJ+yI2Qd6MsLPs9j3/GQiNSTp2+oGpuJzTegHpUIT7EJURL2LopcuHWc5WoJH8ua9MWzj7CNZT5IuTAgcuMNq8R2GZm5fd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=uc.cl; dmarc=pass action=none header.from=uc.cl; dkim=pass
 header.d=uc.cl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uc.cl; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E24xPYbFxMgF/4DTlVk6ebTPYf9fAj30E9FSAqueNe4=;
 b=he6E5TZvvGEt8P9ManV7pA++H/lwp3gr5hEXEqh3HFH1Wll8d1d3p+O8Au0hTFeg1qPn9XprYznIlXZOrkmmd5Fp8LCahIiI855hgC3kRq/5tPy3dAX+uoaJKb37jZ9iQ0zy0jqh+RzF0MHQeSlZ1R6bik1Q+f/JwtpOm33eIgU=
Received: from DM6PR11MB3066.namprd11.prod.outlook.com (2603:10b6:5:64::15) by
 DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Thu, 3 Oct 2024 11:14:40 +0000
Received: from DM6PR11MB3066.namprd11.prod.outlook.com
 ([fe80::34cc:4dd3:ec2c:6210]) by DM6PR11MB3066.namprd11.prod.outlook.com
 ([fe80::34cc:4dd3:ec2c:6210%7]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 11:14:40 +0000
From: Hans Peter Moller Ebner <hmoller@uc.cl>
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
CC: "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>
Subject: [PATCH] ALSA: line6: add hw monitor volume control to POD HD500X
Thread-Topic: [PATCH] ALSA: line6: add hw monitor volume control to POD HD500X
Thread-Index: AQHbFYTUvruJXtvTmkmOFiSm4vnDFw==
Date: Thu, 3 Oct 2024 11:14:39 +0000
Message-ID:
 <DM6PR11MB3066E77893D89953CE26E242B0712@DM6PR11MB3066.namprd11.prod.outlook.com>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=uc.cl;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3066:EE_|DS0PR11MB7557:EE_
x-ms-office365-filtering-correlation-id: 7482ada4-ac99-409c-8b73-08dce39c92f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ShgB27H02RFRMerle4XOGMaL5nGUCdPRvLqhVxmbCXHZEGvR42yMUcEJCW?=
 =?iso-8859-1?Q?VmuEnv+R6fvXfW/mYrH38n38NfW6oMJSc9rHrwRlBVaLTtBWXCjG1ImETi?=
 =?iso-8859-1?Q?5L7yG3440YQQQtZT35pmNHWfCbE5rcEBgagwgTFRoa4iRqPpVfZSlLxPut?=
 =?iso-8859-1?Q?QF/3LMqAhtZN85RMJO8y3MbVJDTQH0BN3egbuYTQTMloXXPWeblWOFOGdm?=
 =?iso-8859-1?Q?bQh0rX52QwIA5eiKAdPGlSBdVLh6AlWf3Y1G4vyEU/KDKPYsGNxfwARz7E?=
 =?iso-8859-1?Q?WmFox9nNkRaJDeFw0TPQz1FwY0AWhdAKPUW6nyB2BxapsjUx4K8yw7b0xJ?=
 =?iso-8859-1?Q?5Ufji+Z1HCKXqOmMf12aFK6yh3GlI64YZbmpPfX1n2/omJbEb8erZsfFc+?=
 =?iso-8859-1?Q?jbq/H0H+DNfwhpu4ADoyttHGJWLglmPO88fQVojOK5OXtAMt7MrhfG6Rdc?=
 =?iso-8859-1?Q?+jSuwByXtTOaCRJh0TvvY33CNd2koQcs3M1hYz9/YVg5BcO17MyDU8A3Xd?=
 =?iso-8859-1?Q?DTYXTV66VvYsPgRzioEyVLFUWdbZjeqKs/5/5R0b/8OfhqkIDyFGPegEJ6?=
 =?iso-8859-1?Q?+n62o58N6UM7V7gVZ5Fx+IWNGMBemwmouJNYGpaGAcCuSdMnm4/Jc9kGK8?=
 =?iso-8859-1?Q?dyz5A1l69v+gDQW4yQS/AQPpUZc+wx6/UoDSKXSox4TCzblvdNuL3EROdd?=
 =?iso-8859-1?Q?pPhWv+wcSDr4kkuspoEsa5OSHdUSAOy1/FpERu5uJU1dLYf8gVqFg9lTJG?=
 =?iso-8859-1?Q?kLlCySHVd+rKFfRtAHfRNCxwWNwzo9WJhpomxvgfxBhUio7zjVI41g2hLR?=
 =?iso-8859-1?Q?xD8wPFKuaEGNjQLDuuDa7+lhMtuhx41AGzgJqgmfboD0d+3tAYikxaHDRV?=
 =?iso-8859-1?Q?FAqDZQ59WP2mGj9jO+Go8bJvHqguI04US/IO+fb3BGuV1NNn/3PTyFSxCY?=
 =?iso-8859-1?Q?Nv9YlKUDaAYLKaAcxarKWOftIv3sIigZR49cZKMI1CKjnxpWMnLUt7kO7D?=
 =?iso-8859-1?Q?a026dq8Ha1w/8jKsaM/NH5yY90obkooP620BJX7gp16K3QFMNPKb1xKwsS?=
 =?iso-8859-1?Q?V7VxJlIzVfSLUe68j53cjMaBhFa31PJmx7pWUAEmFwm0vpHRCRdvoA4RCC?=
 =?iso-8859-1?Q?dM4V4wOeboWsmlwNo8i6mVpoXkLuO6g4OEvKCjX2Aqf7LadqyA2g8XNZW7?=
 =?iso-8859-1?Q?Yuh97LsIYwkQbC+8qDsRTojgn4wzY6BsPY9Qk1xKbsfXcuQTnoGBHz1gRt?=
 =?iso-8859-1?Q?worF6CidOOglNhhfhegTp6kLgy2hugqEDRaovBE9WLd1IBkrQXwuOOB/u9?=
 =?iso-8859-1?Q?TcjyuaaU14nm0oXL/Ma6DsJfRIIfA3bkfdwmIK/+v7nTRinu0P/hqYYAqj?=
 =?iso-8859-1?Q?4qqsYXVzchQ9r9XYbsSSCxFDLZARqgfA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3066.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6/0atIomwqfCzjSYlUsvIuYJ2eqfbJZ9G0SOWPJcZerV5mZkDt3o1Rld3j?=
 =?iso-8859-1?Q?eSQvRbmVthEjvJI7oQPNPVYJkqCGYixwmCd/7UmNPCRin+L82gV9lButky?=
 =?iso-8859-1?Q?gbcM7VXJrOqp7WIZZ/JsqKQ9eO1ct8MtZEcRmOPr/tmLSkOEQEG2qFMBAX?=
 =?iso-8859-1?Q?Zr0S+k11vJwD0WAxo43lJRE1bxUkn0LL/FtsFcAS7dfcN81IgTTgw0Wtqd?=
 =?iso-8859-1?Q?j3xnPcxhCakGvxxqr4A0ZRq6NheM2ATUiQiVqyEHIG+rZoGKVHRq6pXN5V?=
 =?iso-8859-1?Q?a09jqENx0F0O3nBV1Gb1lTlaRCEhjzvQIVfPs25DC2UfSBYtHTQKNML6rk?=
 =?iso-8859-1?Q?uklhW+GCjTNbOvC4Auj47pZfC/VO4z6g/atM7O9D44NcbTw+EjzvSJ0IiY?=
 =?iso-8859-1?Q?3ibklK0vjl7dNF1PmGSh6EJ3QZ+Jqe8TVgzKWUybBcOjJriykplPLLouK1?=
 =?iso-8859-1?Q?3TivrPv+gDTwRIZx9WKOZpmQ0yKFDdKSAGPhSEQd49pECo2NzsDR/1Uvkf?=
 =?iso-8859-1?Q?ST226AHXFdG0HiZ9VqFF+XPjuoTvw3sonjhAcd3RWYoHZZStsn8f8Z+v9X?=
 =?iso-8859-1?Q?buc6hhpePEFopO3ACk8Rzp2xjacKCuPZLtjtbq+Mje+fVo7ghrkC6+m8cI?=
 =?iso-8859-1?Q?n4qCEZ6nbkxu7JkfdZV4EbX8pnjaWv/4ZT40yu0ZgEGyfRcEueMUtiV0fv?=
 =?iso-8859-1?Q?xQXwa8qevLtseUMFDdpE2erwQ1+wlXKal4g85ikIQIE1LEDni6GCSrVl1T?=
 =?iso-8859-1?Q?z1xq0xW/GQBiBnRf7IEKa8fRvsQngyZ0dE8fwAw3o6Hcze+F6F0mIBekvb?=
 =?iso-8859-1?Q?HBhkW0/sqyzYSklImC1jXIqypY3Nj3XaGSdPqQPaE6bfXBUQ/KF95l4KIH?=
 =?iso-8859-1?Q?ROE4eNDs+eTQwL7sBxgRMyuzFoXi0tb4PC72CdP5SBg3LKuf/9XjMUQ4Ev?=
 =?iso-8859-1?Q?WzKDHLqzdfHGtVLw3kuvcMn7gXqO0FYuIAA/zoqUY9RwOXfLoUj5JpM4AL?=
 =?iso-8859-1?Q?aDDRIP/rTEG6ibiDPAGkKBY3O07u72gorRwSzMkg6BE6jJUTuIAEiSXXMP?=
 =?iso-8859-1?Q?sLvw9ueUUwP9mF6ZTgwt+lmm3V40EeXj2KdnoAtXWv3lBgSzU8K/jt29IM?=
 =?iso-8859-1?Q?AbXMsQEo9eSIL/w7zwBaGZrtvm+4TZ6WCm+p2gb7ztWW9Yc8DWqkBJ+NMK?=
 =?iso-8859-1?Q?XqdEVDBkAjQrpEhoiCqvt33NHPaIKUKB1IhUIato241SQ72DLdUZ70k4w0?=
 =?iso-8859-1?Q?soFpYS9CR20DlMPzs9+Zo5m+H1F7CfyZ1Nl/JrinzDfEtj92DGG/qDkLB/?=
 =?iso-8859-1?Q?hG/c0BviWq6VSZhuWsCpQHWTHfOes75GI6PHG/pnDO6GyiRULC+KwHOAT/?=
 =?iso-8859-1?Q?w6e+CmS0gQ7vij7yoenuRAJg/nQYmj/jmufBpjk/dT1VSgovDcD3vP0Ceq?=
 =?iso-8859-1?Q?+65NXA9qJHFTvhd+WOPQU/QbeKQEm/9p4+7GdkUv0Ab9bBkS0JSKuzp8Y4?=
 =?iso-8859-1?Q?WXsO2ZYR0Br9MRrEUWeGoBXofZ82P25f2UsoVIvc4HEDi7ihK30/0W10N3?=
 =?iso-8859-1?Q?MWB9buXktzefDIOPAT8I0Y3zJhHfT1dw9ZUEKOrGqTlFo7NVYg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: uc.cl
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3066.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7482ada4-ac99-409c-8b73-08dce39c92f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 11:14:39.9530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ff5d9fa-f83f-4ac1-a4d2-eb48ea0a00d2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JaFZraO6p+xki0lOqQMPsLFQrU/QHT2z3/TwT0G0qY0yIdUtJomAdMhCYo9s/h2s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557

Add hw monitor volume control for POD HD500X. This is done adding=0A=
LINE6_CAP_HWMON_CTL to the capabilities=0A=
=0A=
Signed-off-by: Hans P. Moller <hmoller@uc.cl>=0A=
---=0A=
=A0sound/usb/line6/podhd.c | 2 +-=0A=
=A01 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c=0A=
index ffd8c157a281..70de08635f54 100644=0A=
--- a/sound/usb/line6/podhd.c=0A=
+++ b/sound/usb/line6/podhd.c=0A=
@@ -507,7 +507,7 @@ static const struct line6_properties podhd_properties_t=
able[] =3D {=0A=
=A0 =A0 =A0 =A0[LINE6_PODHD500X] =3D {=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.id =3D "PODHD500X",=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D "POD HD500X",=0A=
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 .capabilities =A0 =3D LINE6_CAP_CONTROL=0A=
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .capabilities =A0 =3D LINE6_CAP_CONTROL | LIN=
E6_CAP_HWMON_CTL=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| LINE6_CAP_=
PCM | LINE6_CAP_HWMON,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.altsetting =3D 1,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ep_ctrl_r =3D 0x81,=0A=
--=0A=
2.43.0=0A=
