Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010003.outbound.protection.outlook.com [52.103.20.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8919618C2C;
	Sun, 29 Mar 2026 01:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774748059; cv=fail; b=KOSOsgARGUCrPaLCRKfc9vtwJM++vC89qoL7YUbwdEPJCH6xiS1DFeABYsHqSOTt1A25AXGsS5/QBNMdaYKVgbgIIYbREYhBbmDef1BZzpQPNzQqmaGuepPtlIwH5L7Sj28pBAhap1rLi2Ke79sdxRiVvE8VvR6SO3SVs6N6k18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774748059; c=relaxed/simple;
	bh=OYB9ra0dUTV991yvgq2cbRkIw/RA5W+a6yI32InsZIc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Xt30JHH6Jsu1mIkch0fhZTa9dA7EMPZgGN/kW9MFC7uHHS5rgIedtmeIyLtttyDwnLs1EgJu1FyGPgbDAp/1PaiPgMnYPezProFeupyUGdHKNcLQy8X+v0w3Qp4vZ1GGDC7A0BfPazOyAzhOez6gK8GjRSMmVZL8JrclNaZftQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=sFdfTgsi; arc=fail smtp.client-ip=52.103.20.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="sFdfTgsi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy+bJh1ARIDfNqIRKGvFqnhjBKBrRN9wiZtEwDzzCwF47Ua2/dH4WvPA/lq7V7Qi3OVuHuKHqNvFCauD11oPHmesliFCHNj9r5VX03DzYc3chhtf3QXUrDXrwO5AZAAWSS3oPPjCVRzeBm5HbQT4uvdjGJv7XIBKM3GengeGRi71lV0aJOCEu87XdLmDRz8ovGWowpuSiy4DBY438zCb4k+M5iHLTVd7KaWVULY2C/B6lbNbLzZ4DR0ObJtgGZZU9AH80ZldEv0UnygDcBzftg6VgOUb2noTSpR/jRCkfGtYvKcyvCMuaG8+iAeKd60fJtvdJk4HM32M08LTyr9R9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDWTbGTYJWMpGCWUgHvHW1KSyh+jmqrQBWvpob7C1+k=;
 b=VPxjxWFnKxcm1nYBL2LJOSl+HD+a4UFL3viQSL3WUihfipJwFt//Al83YM7gadOWETb0GHY/De9AY5DErSwQLFS7zdjHSQt83XIKDr57pG0z31QFVLpuquEBPGLncAM7F97s0Wz0ZX8I8E+8fpyfgOQbZYi3fcC3H+i431NH8WAtET+x5T4I03rM5syaJHtXh9zUu7d0Hr4nCJyOL/BiSQ/r/rrD6Hf2jpVk7Bho7CQZKRgotRt6mzLPkk+ekIKz3c8UabHwt3y3+k3s+uJ4iy+UPiVAyM1/1hurLagBWBpEvr4L6gMCaza1fcNLKUPAi/TWSGgvf0T4dM3kGzmh8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDWTbGTYJWMpGCWUgHvHW1KSyh+jmqrQBWvpob7C1+k=;
 b=sFdfTgsi+p9acTXf6i90TFeIr5ONnj5pbs8uoqe6LUbXjTSJR7iBgBICSVVf0GQ3kS6acWfc56LEBJ6CcJMELdqVkLXJaa2KaBQqLPocFtY6T9jESerUB54t9tktTIEY7w9z9G8qi68v/WDg+qPj7Xa0+pdTgFmogv7xIKW/xVLQhIUxhBTCBOnSwajBuDrh+nb6eAcF990NWdrJB0HLVyert1ZukHE7S29+lw3dTED735wzCV19/blHWCm7PkNHhlTx+A8Z9hu5GfU+nP5Sk2NOdCemWls0JAzcNw7B8lxpFwGKnP9xD+ThspN3jd49J/nTHt42JqsD1HvGD78V0w==
Received: from PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:1b3::14)
 by DM8P223MB0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.27; Sun, 29 Mar 2026 01:34:16 +0000
Received: from PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM
 ([fe80::c8d2:d013:f3ea:a03e]) by PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM
 ([fe80::c8d2:d013:f3ea:a03e%6]) with mapi id 15.20.9745.025; Sun, 29 Mar 2026
 01:34:16 +0000
From: =?iso-8859-1?Q?Gilson_Marquato_J=FAnior?= <gilsonmandalogo@hotmail.com>
To: "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>
CC: "venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
Thread-Topic: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
Thread-Index: AQHcvxwREdil+NJ1g0qYzpmt4T8b4g==
Date: Sun, 29 Mar 2026 01:34:16 +0000
Message-ID:
 <PH7P223MB0552EDAF94ECC3D28F066E90B355A@PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM>
Accept-Language: pt-PT, pt-BR, en-US
Content-Language: pt-PT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7P223MB0552:EE_|DM8P223MB0030:EE_
x-ms-office365-filtering-correlation-id: 36192128-91a5-47e9-2416-08de8d334a8f
x-microsoft-antispam:
 BCL:0;ARA:14566002|25031999004|37011999003|19110799012|12121999013|8060799015|8062599012|51005399006|1474299035|15080799012|15030799006|461199028|31061999003|440099028|3412199025|102099032|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VwobINR6MGb/66BoPCo8ib5uDd3vtTYq0sN959mqQvKz7iafcxX7B9+80m?=
 =?iso-8859-1?Q?goJ3ckOmXPRlyVMsKRPHgOSGha6qRnEIz5/AN6eeGXM6bI2FGHBTP+aXQp?=
 =?iso-8859-1?Q?qfBhV+sJDAKF9yZka2I/4yt7R7uLivDWxSWYItGrnCJbost9TMfREOgHlo?=
 =?iso-8859-1?Q?fd8e5dF/U5YKFAMdfBnV6+DJxLKfO+7SLl1NbYr7ht3Lyb/F/LaBCKLPJ9?=
 =?iso-8859-1?Q?jwYzTMhwJ6eMMqtXWeWoHdJgI6hKqPLR/GhJaSLYtcxLFAN/D3Mx+8L2w+?=
 =?iso-8859-1?Q?yfj7bPYxZf5b1duzwXEUiqkOZuQYotDrp6q9wVyyHRpI0Gk9TPCIMN9wSP?=
 =?iso-8859-1?Q?//sWBWOQDtNF49Md4s8tWsWVKcrKGwjuwsSoPRWTQySLCV6lcQl6pDqiLC?=
 =?iso-8859-1?Q?uOHYwA6uIHkCg8RsP/tpHpDjD2iPajZotuf0thMocaYqhNk+/6ZDuM3kkD?=
 =?iso-8859-1?Q?i0l5eLskDcp1NGuP3a/XARZSUGJSkzJ65CBEj9Kye3VuReJQX2RTdYVDsR?=
 =?iso-8859-1?Q?/F20AkbcTnpuGQ7RwftpREqK+pjgIcJ0ucRa3dtHDZ95qC+g5hi/FyuFJT?=
 =?iso-8859-1?Q?eRJOc3ArX+rezOxqSRf+qdC62aJ2XxtU7kn2tytmwF4BP3zPnSpOJ+uBpg?=
 =?iso-8859-1?Q?Ygt0pu+DQRGMNxiCfMCPRt1VhkTBJIOqnrrVbVFUco/8iH8ICF0IRvOSWR?=
 =?iso-8859-1?Q?F6Ai9CxOlAmnJgI2oRDjmb2/4E064OcnsCbyOQ/UL56VuAQFUS/90mWZC5?=
 =?iso-8859-1?Q?AdoFnmHXYSZNhXY+OHb1Z2FUUM/5K5cbJP8vF5EuwQqiPkNOp+sHOxI3Eb?=
 =?iso-8859-1?Q?dK2fYJrno9HY3WcbRGmxY3kGcROv/NsEfroi4hfeK/OkoC8WHhxGfx1TP1?=
 =?iso-8859-1?Q?zDLmzkhAFFhY3KAjSY8aCNgE1Fdb6xot5hDOO6GvcQ9oVo/P+tdHIDZdq8?=
 =?iso-8859-1?Q?bGit9JgoL2JXJj97zJB9WFoUcFcQRvnqtLx0iXfLHqiDtBr42R6nOcNw3R?=
 =?iso-8859-1?Q?iBpjPtA0T1ZJlIX+3npf+dLJ/xgEvchBdTZ9f6IH1Wl38MaaRizXIicUdQ?=
 =?iso-8859-1?Q?mCnXH580JT2AjK3bmv5/61tAMyAnbdCGNA9J2MxXZcwI?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pPWbD7E4Z2iT+vSi8zGAhDcql5O4YP2gk1Ur6LG3Jo3ivsRn8q01nAqolx?=
 =?iso-8859-1?Q?EJlSW3fpN4Hsgxr8aqMpo4WqQGPE/0IRb+FCLDb6coTWFLA3xBFxNPjSmg?=
 =?iso-8859-1?Q?7F/U/5J/qbudhY4jxRLLKPDkZMdtFeECSK1KWHiIotAtrBEbkpYI5jnnM3?=
 =?iso-8859-1?Q?a7jXx5f2+/M1hQ/CGgQlmsDxRYaDXDuV4Hb9VDWG28i33PEesAdeU3yYEo?=
 =?iso-8859-1?Q?i7QNPRdPuyKpF3YbLx18P+Ng5CNR5rw3aknEvRa6r2dS81JAF8md0+C4Py?=
 =?iso-8859-1?Q?ciEQFl3bK3Ygd+pKGYJppmM45jGIvSemuIAlci3Xa3BMM0SJQjPEf/1jAl?=
 =?iso-8859-1?Q?pbRSYHfftkWp1j11OqQVDxseco3d4Ho3fXX3S/cJEualaxwCG2SepqNsNi?=
 =?iso-8859-1?Q?azomTWp+WnQMhd5VIxMP/mTVh5aqm/I21oVMtumvk5nbeTNWRMPBn6Ga31?=
 =?iso-8859-1?Q?8WAoXiqjG4YjlN0cMK14dlAcvjcjY1W2JJX72tkvWbKfoWh1okkojptUN0?=
 =?iso-8859-1?Q?DYVPmBHAPE/ZCMsw7+tO9+SV6bS//ssqx7Zgc+GGFvufbGXcUcXjTs2ATu?=
 =?iso-8859-1?Q?9/ojDXe8RWhBopVNTtBkjJSxbuEgnw5VbAcXLZC2oGjntTgJik1ac4fmjp?=
 =?iso-8859-1?Q?N+XMtmduAWulGw7s5Qunh1Lqb+8l8H5hWT9pkoRm7V5ik/Xfj2ckNAJ8aj?=
 =?iso-8859-1?Q?AZh3z3sSoKKMM5aCqj4BRyl6yC8Z81p/CMVB0cW2uqFTtpTCYsl96TEAh/?=
 =?iso-8859-1?Q?RaLguEnMDHunPu9MoYWaDj9AnXQ9+dP/YkzA25gs6L7gLZqmf8K4ny1UIY?=
 =?iso-8859-1?Q?sxYewZdQ6KlAt1TTRAvFiwpA+H/y3DyaawkoVHHyuR52VOha3CqB/buV1u?=
 =?iso-8859-1?Q?hY5jenZM+168o7Dsa9/tkF0hrM8tZzmDVlnTyQrQSRtYSQ/JmTjw8kVFIv?=
 =?iso-8859-1?Q?3ESUzl8/E9oK4mYpKdF/3vq7OsPUSxJ/R6rzzn69BHJyJsIRIKJ04dSSGg?=
 =?iso-8859-1?Q?EMfZe+wTd1gL6F+tYCxOP3ixqWvaApgPawHyKetSGE3ce/qUyOve8O6Km7?=
 =?iso-8859-1?Q?czF6cMw7eaMRPBmpHpzFZEV2U57qd9RhK1mCz82QOoLIHdx1FJmvauYK2H?=
 =?iso-8859-1?Q?BeY+VaTmB4SRoKhNZ/vZgTFSJZSBvfDjcwI6Y8iynMqOEmBRC9pG2y4XRI?=
 =?iso-8859-1?Q?23JjaZ/+c7JoxTuDg28qHFE6mQG2+Gxmvq3yIWfzHW4+6sillyBD7uKgq8?=
 =?iso-8859-1?Q?Mn9Ae/KicLg5GUws2JFUsjr+4mpZFnw4X6cbWlVct0hF/izHr9IsVybWEi?=
 =?iso-8859-1?Q?FGgnwUCT1y57ll4db3DgrUixSZjQc0SVyfirkRaelYkV/TYenRQ3b0vXB6?=
 =?iso-8859-1?Q?U+vacAZQgXDdJcRG8mxC+8hydKkgh8WSE5NymCvQ7KZ8fHPueaydUv/N74?=
 =?iso-8859-1?Q?mpjTacFLR4az1g68?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-583ad.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 36192128-91a5-47e9-2416-08de8d334a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2026 01:34:16.6706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P223MB0030

From 37071560173aadb81a52ae2ba1587b6581e1164c Mon Sep 17 00:00:00 2001=0A=
From: =3D?UTF-8?q?Gilson=3D20Marquato=3D20J=3DC3=3DBAnior?=3D=0A=
 <gilsonmandalogo@hotmail.com>=0A=
Date: Sun, 29 Mar 2026 00:22:03 +0000=0A=
Subject: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx=0A=
MIME-Version: 1.0=0A=
Content-Type: text/plain; charset=3DUTF-8=0A=
Content-Transfer-Encoding: 8bit=0A=
=0A=
The HP Laptop 15-fc0xxx (subsystem ID 0x103c8dc9) has an internal=0A=
DMIC connected to the AMD ACP6x audio coprocessor. Add a DMI quirk=0A=
entry so the internal microphone is properly detected on this model.=0A=
=0A=
Tested on HP Laptop 15-fc0237ns with Fedora 43 (kernel 6.19.9).=0A=
=0A=
Signed-off-by: Gilson Marquato J=FAnior <gilsonmandalogo@hotmail.com>=0A=
---=0A=
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++=0A=
 1 file changed, 7 insertions(+)=0A=
=0A=
diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c=
=0A=
index 6f1c105ca..4c0acdad1 100644=0A=
--- a/sound/soc/amd/yc/acp6x-mach.c=0A=
+++ b/sound/soc/amd/yc/acp6x-mach.c=0A=
@@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card =3D {=0A=
 };=0A=
 =0A=
 static const struct dmi_system_id yc_acp_quirk_table[] =3D {=0A=
+	{=0A=
+		.driver_data =3D &acp6x_card,=0A=
+		.matches =3D {=0A=
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),=0A=
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15-fc0xxx"),=0A=
+		}=0A=
+	},=0A=
 	{=0A=
 		.driver_data =3D &acp6x_card,=0A=
 		.matches =3D {=0A=
-- =0A=
2.53.0=0A=
=0A=
