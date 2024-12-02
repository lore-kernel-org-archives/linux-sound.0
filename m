Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020078.outbound.protection.outlook.com [52.101.191.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF5E1E105B
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 03:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733110118; cv=fail; b=EmyXyk9r+PCOxaEMGvW4RhDxCqKLGydttWzhgSeVhKvp82N407i1Nph7l9JU/S2bf/OoTCcnT9TAVZ2CcvvHe2LJ9JmizlBVt9skaJ65i6uInMbIWP19HwYD+Arb2ZzqwO/nwzV9kaLhRdsvFcG85xhyPVqCB7K0h9U+AMqY4jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733110118; c=relaxed/simple;
	bh=M2cpxsEyyI0YekzBJS+cOjexDDmx2nNNQwDNMs3Kpss=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EHICvtO2bEH9ka0sThLTYox13n3ZcHzMel6tAB/O25KfFeSkzYoZ/hN1kSzqCyTT3/hm5YxmWKO3ktFk9i5zzIEvAIESVMyYIy4sXlHnOeIC9+Mf/k0pHA6/Zlr/JqsvCGLXowVq5GW6xdfnbeeNGoeR7ClsnCjFXw+4ianUe5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.mcgill.ca; spf=pass smtp.mailfrom=mail.mcgill.ca; dkim=pass (1024-bit key) header.d=mail.mcgill.ca header.i=@mail.mcgill.ca header.b=NNAM8tKD; arc=fail smtp.client-ip=52.101.191.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.mcgill.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.mcgill.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.mcgill.ca header.i=@mail.mcgill.ca header.b="NNAM8tKD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzc4scQOnIOeoBBb97FuE+urpHUDuqwfRE9xFFFIUY8M7vqYikN/s6bASE8fikdRHJhguVXgypNkngj78cN6vrRuAgS332bNNTvw1mP5O3cFsoAD/ImAj2GgH+h8FwtLiYofNmQgKlfOeNbl/vDz/cgtok8RR6EF+gqMatvGsq6YnsgJ9mKjCv2u5JrXtcfAhj2EEpm3G75zmIh4brOZWNSY259Af7M1XMb66KWfS4Mq6W5dmS7DzTT+c3dicJodKNpHcsxtukCODOAKDm8FMiYOVVpQKpWEx0ijMvMwJTq0UJS8lz+8RySsOQ8X5OgLahRBI8Z4jjPOYL8bbLksow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggfQ6/zfhIiB2hRZiB6TqAv4vVtkDYPlTVlJ+6oP4hA=;
 b=ph4bSkV0LZ7z8WhmemtOHJJ2lidHmZr5gdhHiO8QFaK21CeBsir4zI30k6ALTNctaa9n+PeXDHJPRHF916S4IEObOJ9NalRpMXuA3Hi3cOUC9JEDxfP0fSt27SLks4bweRNtjuj0M//zSRsMp6nUIBmlDf7BoYkAO7q9Q79zF9sPUbRH3mFbiTDsWbuc2PHNyOcQKsQ+lXivjR7lTI94Eg8K5YI0/YOu1dZ8ECBpQVlp5hdkJv6WIENzRyHCY3kTLgf+QbNR/JeN29FLcdI30LPpuLPlfPmURvawP7Dl1FPM7mme3b8MlLJXO1W3oiuLkl8y8OwI894yNptoMP8Yng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.mcgill.ca; dmarc=pass action=none
 header.from=mail.mcgill.ca; dkim=pass header.d=mail.mcgill.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.mcgill.ca;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggfQ6/zfhIiB2hRZiB6TqAv4vVtkDYPlTVlJ+6oP4hA=;
 b=NNAM8tKDpWxRd8xOeeGe7dDouvbQUavw6edSvanjLLo5cJRzs4e7EhkO0swUwd54qXUeYlWftpCl89V9cZMfqHxn0RQ90kbxmJrxwLskA9vs68lQH075YdakLih0lzlUf44UPdl4oQS0/dELq8kEJwxXQ4yckMkyIkdlL0WHTNQ=
Received: from QB1PR01MB4004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:37::24)
 by YT4PR01MB9749.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 03:28:33 +0000
Received: from QB1PR01MB4004.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d002:d5b4:84b2:998b]) by QB1PR01MB4004.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d002:d5b4:84b2:998b%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 03:28:33 +0000
From: Sahas Leelodharry <sahas.leelodharry@mail.mcgill.ca>
To: "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: [PATCH] ALSA: hda/realtek: Add support for Samsung Galaxy Book3 360
 (NP730QFG)
Thread-Topic: [PATCH] ALSA: hda/realtek: Add support for Samsung Galaxy Book3
 360 (NP730QFG)
Thread-Index: AQHbRF3JWki/sO2KQ0Ca0S9qjhdDWg==
Date: Mon, 2 Dec 2024 03:28:33 +0000
Message-ID:
 <QB1PR01MB40047D4CC1282DB7F1333124CC352@QB1PR01MB4004.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.mcgill.ca;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: QB1PR01MB4004:EE_|YT4PR01MB9749:EE_
x-ms-office365-filtering-correlation-id: 234673f0-0f38-4230-e8f1-08dd1281664e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Sshg5VgVxdhSZld4Cj5lOu6zJZzvnijL0soV2e81ZvfXcs+ts0oGa99SDc?=
 =?iso-8859-1?Q?T6Sqo8YQuKd3X1qgccO/AbrrGGd62d+iCnvrXr0Wj7xiw/8RHUwsTICckb?=
 =?iso-8859-1?Q?TpKeQjTp+gZb1FlotOWH1lnEtHyH5AQrZ7r/Bb3/g9PftpwRQswRUX1F+n?=
 =?iso-8859-1?Q?Q+bpY3LyJe74RMeAMc1YfPLtrQY9v+D9oL+hwg4zvZBD4UBExrfA6Ixh4u?=
 =?iso-8859-1?Q?cwuNo3HjydGyOQck6MlcDciE/cBFV7u0niAueCHjYLVDjDZUCHBbPt1yoS?=
 =?iso-8859-1?Q?Bq31OFxTN+iYCtbl8IKqPJ3gxPWEswsYtHboc4d9narn3071eHhBJGEvpC?=
 =?iso-8859-1?Q?f7GlGZn8RFksCXf1xrRoGiGuyppcrE/bOfCidFXWlowGpw1n1TB9ilTxs0?=
 =?iso-8859-1?Q?zFx8wFNl2VBJ6Pe0PzNFflbY1IneFMzyWP7vq1Hj9GacSkmkZTt/uL34Qo?=
 =?iso-8859-1?Q?asW6gz4393UtIiFLhytb5Jym9r6LN2quXVzym2KK7fcbFu6yF3dxt1JTCk?=
 =?iso-8859-1?Q?WNkbSpcfbPCKSLBWEL4aJjLm99CToK18myvyEKWrSBlQkU7Bg/3ofLmmqC?=
 =?iso-8859-1?Q?5JLU+HDluCBpTeu9cZQscIzZV+OxB3QUtEL6mSHtjHQnWpK6N1D4pAlHAS?=
 =?iso-8859-1?Q?wpPJxaeh79QS0RdHAcAC5S4jA35K7Eat/zw00cF99UXSalr0BzBjGRKRuM?=
 =?iso-8859-1?Q?w9HlM6Fw/N89N3kHtkZiwXCawekAA4YplVzDGrpnzbyrtC3SlVOJIBi/eX?=
 =?iso-8859-1?Q?UFAkHrVYAHmxWfrZxKnSFHlHNIf8QufibvctE5tXiLa7TU4RVvzXPlrcKz?=
 =?iso-8859-1?Q?RZ5+MAP/y1wUmuB1GpUU1w2jHDaIq2XVKQ4pIL3kqc5LmLPbwNWdgWsXLa?=
 =?iso-8859-1?Q?G6D4Y4B/EtvZVDJmTJu4ZUW/z0U7qlgeWaJ/3c+xMZSJO+JgtA3WRoKYAh?=
 =?iso-8859-1?Q?PbjgZ5cxWyLmRLFCE5/a67o/5D2WUufbJ9pbEGPBMXvfV+ZhJnsr+ShPCV?=
 =?iso-8859-1?Q?9a+q/g7mo6HclP5ynUTx6c8DEX+TusThPuruS++I2sH2cm8EUZcA7LLL/h?=
 =?iso-8859-1?Q?nu1g/xn9uPGJCS02Hicb2/x7nV3vXNBNUYkn/lAT1pNCTiXxike3t3fntO?=
 =?iso-8859-1?Q?YmJUIcwCvKRfLovFk72TKYuh75MtyMRtbPQXyS0//5CvKfwACINn1NLx8p?=
 =?iso-8859-1?Q?WBje1r82Fj+3r29kziPizYuwiJ8IbjQN+/Pyo4ZAjdIH361rjAUVaB1uiU?=
 =?iso-8859-1?Q?Mcie9/TIU09hhugFPzt9TOoVdEt3Clm5RNu9REuCO2btSrkE6jPSwzfKLf?=
 =?iso-8859-1?Q?hPUtMsJ0Zri45h2tKecnCMOspaNnIMpSC4t3Xgxa7d6PdEoOw8z2x0KdM3?=
 =?iso-8859-1?Q?p7h/0lwFEWtbg/VZBVz16dU5yfBpn3REnSsDlNJU3Ie387Om+RcrtmfSSB?=
 =?iso-8859-1?Q?uqLhWL9LzCCGhAn7eqkChyMeiknfo1mJCWBFew=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:QB1PR01MB4004.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5i80a9KAAKbkzT+VCy16yrycyNaInToJydbMmW9sc51OAnTwyLatqTtqhb?=
 =?iso-8859-1?Q?LWU2VXYzKUJraCSpuIQWyJkyJtR9W6v/FFlMtZTgiqQsPsqimZzx5E6HW8?=
 =?iso-8859-1?Q?UOi5P48s46bK5XE3GOJdD6zFx3Hq0obqjxcM3BMdZHkP5n+GThRDMTAmPW?=
 =?iso-8859-1?Q?NGv0Q0U/7n5QLXOpISrGCynplrWtyM+e6Lr3ns92qmp3PlMKHmlvDfW/72?=
 =?iso-8859-1?Q?CyetWXVahB5FHWOFpo9mUXdD8+UmC8fOQi5mzds6HKGwzPZZzvjdD2ctKw?=
 =?iso-8859-1?Q?XI2Mc7kqDNtWm2HtLsgBKth4Cd4MRMaQbrqsj/bH4YIfTXX69zCxNew0do?=
 =?iso-8859-1?Q?swV6ZSWxG1IDdcvgIGR9swqO5SJVeknCPyvmtVj7MVEWK0tGZ1UtyBbfFS?=
 =?iso-8859-1?Q?gaR6x8SxmSdFwe6G4cRlBblF7C2DaVxxwJFsMWwAPST7hn82cm5U/JsPrt?=
 =?iso-8859-1?Q?+I5tIIrhPhz4UmfoqlfbAdhSlrfnJXP4io1azCY3gcLH4yZhXxYMBiMRTi?=
 =?iso-8859-1?Q?G5Tsn0qer+5jselNsDDeh8ww2NCGn5t5h74jPbv3pICh57wIeXmoMvJcoT?=
 =?iso-8859-1?Q?kVFgayK6yf9B9XfnoGjJzLTOSZ324eogc5n0W6+fJjZ3v02cVVa7wcl1dE?=
 =?iso-8859-1?Q?IYvpODBRXgectMZRQB7eyz29VDLmHM4vl6ekQxot1Fz2VZwpPvrvnVtZAn?=
 =?iso-8859-1?Q?FJFNv0iWoP2GscsRrrh4R6RtIeFS4OCOcSn7i2mBOREKJHkbkWUkqMTCPs?=
 =?iso-8859-1?Q?t5oLuUmGV1+rkGh92RdKFskKvScpG9WeUd/FG0I1g34vU8V1FGQGIMc9DN?=
 =?iso-8859-1?Q?2sJ+a9dqqcZoODPKqVEmUeERB/Zen+fFlTaJZFzA2e847Fo4i1KE/0zWnC?=
 =?iso-8859-1?Q?K9LmilEjGLd9VPHwYdcBSSjxnwAn+yLwAuPWHs0xQ3j+VRMXoQFMvviQl2?=
 =?iso-8859-1?Q?qttXqpFp/qRwSoydWIN2iZPqngdkXshAmOLI4Dj4RjNM3wvfwKAwlVpSP3?=
 =?iso-8859-1?Q?NIOfX6fCMWqFzHFayMZISJE4LAHq6ik2pP3fnlwOf8U5JOXgbJW+blmXSO?=
 =?iso-8859-1?Q?Od3/2zNlzrO/KmcRRRLwaS1OdbCN4b7MH/TmHGMmwyNER5WVkE7uW7/jJC?=
 =?iso-8859-1?Q?qJV1PYfQ7LY5T9YJf0YJnB2onRwf5QxxmhJAy5eR/2/Mtgi2ttt9fmjKKL?=
 =?iso-8859-1?Q?qWEcli7NPs5iDwy7dBYUecseIqu1RbF0ypulIsRQ3pV6ZdyaW0rnHBG0Ac?=
 =?iso-8859-1?Q?tVEViwde+Mle7KKY9JrgpSjYalgWVOSPxBT9OHpJnR99pty7BTTLemh5vw?=
 =?iso-8859-1?Q?p2vQF/QqJeTnUeW2qLpPtL6gIlxY44k04EMZH8qrT4HFnFZ9nsE3oD6OsK?=
 =?iso-8859-1?Q?KR832LHogxZ7G2wtkm3007tNhSb1TkrpwEyNSDJK0RJej00xGdhWqaNaQK?=
 =?iso-8859-1?Q?Jd+nKUicAAYxqbwPr2cIWQAyjdy+THQp4dsjdGnsjbYobFPIURiIWojdJz?=
 =?iso-8859-1?Q?oouIK6Wcz6eHkTFNiBnFHVs69O/dHAbQjPhtQD/YX5i0BdUN2odBfwffYV?=
 =?iso-8859-1?Q?Zpen89xVKXxsnjAZUUILi+HJVJmhdjkP7fRQzLCvrKvD1tqVF6UvtdqIJJ?=
 =?iso-8859-1?Q?hjorkqkH89R0BtY7zbsAzshVnmtIPb40SY+1Qr5k/IrXJ7yLc9jvirJQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mail.mcgill.ca
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: QB1PR01MB4004.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 234673f0-0f38-4230-e8f1-08dd1281664e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 03:28:33.2578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cd319671-52e7-4a68-afa9-fcf8f89f09ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xe4RalPx4w8MB4fhb0eD4UQJlrX6qIx7UIK9pipeoKqgaqy2xjBHRJHPNbE96UQ1hgzfW5vZCik1R4beC8uPSzggr+lxCFwfkFzYxEm2pptTb3D9xuKZW1oZCBJZM27R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB9749

Fixes the 3.5mm headphone jack on the Samsung Galaxy Book 3 360 NP730QFG la=
ptop.=0A=
Unlike the other Galaxy Book3 series devices, this device only needs the AL=
C298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET quirk. =0A=
Verified changes on the device and compared with codec state in Windows.=0A=
=0A=
Signed-off-by: Sahas Leelodharry <sahas.leelodharry@mail.mcgill.ca>=0A=
---=0A=
 sound/pci/hda/patch_realtek.c | 1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c=
=0A=
index 2bf5c512ebaf..b56cb6b24a4b 100644=0A=
--- a/sound/pci/hda/patch_realtek.c=0A=
+++ b/sound/pci/hda/patch_realtek.c=0A=
@@ -10679,6 +10679,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {=0A=
        SND_PCI_QUIRK(0x144d, 0xc868, "Samsung Galaxy Book2 Pro (NP930XED)"=
, ALC298_FIXUP_SAMSUNG_AMP),=0A=
        SND_PCI_QUIRK(0x144d, 0xc870, "Samsung Galaxy Book2 Pro (NP950XED)"=
, ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),=0A=
        SND_PCI_QUIRK(0x144d, 0xc872, "Samsung Galaxy Book2 Pro (NP950XEE)"=
, ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),=0A=
+       SND_PCI_QUIRK(0x144d, 0xca06, "Samsung Galaxy Book3 360 (NP730QFG)"=
, ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),=0A=
        SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)"=
, ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),=0A=
        SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960Q=
FG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),=0A=
        SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH=
)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),=0A=
--=0A=
2.47.1=
