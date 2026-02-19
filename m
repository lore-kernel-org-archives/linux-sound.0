Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010046.outbound.protection.outlook.com [52.103.7.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5962FE074;
	Thu, 19 Feb 2026 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771510830; cv=fail; b=OlK+ybWRtZUnqz25GCLOA5H1hdBTDf+WpOBaK6JbdVe3cc2uSkC9rfNYVdSXXbivbCvX/tE46oUUCk4OUSarENAMNo7qRxm6s1E2ywhmfNQPtzoJWNSPiq/vFK1JTCfVrNoN7I5p9m77Klxx0UTF5w8A7cHT1pN6GSt0iJW35T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771510830; c=relaxed/simple;
	bh=0+tW5u5mBCdKg65gFnpZHkW9KjV8X5JUEa34q/f0fuM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CYVtR8KSY8Bio/FEsn0F/k5QdLpX+RAIFo1vMItl/sA493XbDrgrS7Ubk8YRTCXVoCMBOq8/XOfGiWHEDYYvFW4D+VN8VNWdkK/IdWJXkTIQD+XjG1j/c7w9KbbOiUotxx4zQeF8rrZDQVrNrWxpqh+CDDrU4woVEgugvjFkgaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mNMafclE; arc=fail smtp.client-ip=52.103.7.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mNMafclE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThDhTlwTOxLuw0FRewM0we0NawVOFcKxv3UqRWpOtO+97HVoCRwvJ6GEpqSEXdBaoTwf4po+mmsExIxG+u/xM7HBGoqGlpcGp5j6LP4TpDU0PboL0b7MYNazfNdwbsuMlAFrqlDZ9TYVv74AXvw39cLWiIKHIBuZ8xF54/EGbZpaE8PCUM2wG6GbZw8COinDnMJEbQVnI1dHY3Wc2WaArEXwQuH3R7Glon32aRKAgVAaxd6LWHXuZMfRQNpIr+mD0F7N4/1N6g3XGWCfFWeOb+U9n3gsBhXCcb/sewDyBtm8twt0/N0yeyD4mZvdVjYOEhZ8WcMiHVa4eFPa6Hvdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+tW5u5mBCdKg65gFnpZHkW9KjV8X5JUEa34q/f0fuM=;
 b=eejZUPFs2V/iCCI+e064vobOB/oRRiFi2TTCVO2zDdz1X00QRkhSa3LKkcY7ckgae7z0lrPxcUPoMsS5WyZsv1UhZCtyHzFbLDVGmNkxvZ0x19AJZ+YyOSfHjxoSbv/6QfGzE+GchLXUC42oOpLLcaYUesSNaG1xZcd+EwbXLsQYR7dxIf4dTpaDb/jYhWDZa0H5YRRVFxjuJV4tsVp8wGlAJRQvQte0uLvK7T9EXJ2z8NclSOQpCp12ydLrhYakkv/Wlpc0N1HUZu3oTtkj9BMlXKnIHvCj5sxrP6/qkcd3tuYtfk3MvQSZwDOqXGq9rNJrFLNc9eEZH62EaIdIBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+tW5u5mBCdKg65gFnpZHkW9KjV8X5JUEa34q/f0fuM=;
 b=mNMafclEXLP6dfQPHT2LmadPSaoYrwkdi07NDVXWH5ej0H2TIm0SVaBmjlWhssxhbTuLadXuYCS/M4k7QFsUl3Ml8CEjd+ZUXg7MxQQcg4l5y2MoxgoRDw7rVONJ2FDWhyFQLJVvhERihXld6Sos19WN8TN3bYoB5XvmJfKJGxlzVkYM5rP6zQhW0es2bUPAyOpV6BrZ/ZnCiSS2ZXcCxbkpMTjHhMVoPltVc1JNYyqnLlzDkOHP9O+3krCGTWsbrxRUgNsJXnjDdAfTR3MW2pn2i8yXLOaao/QIMSspZz1JQJUdS//ZNXlafEEVLeI0B19YSHHx1xyBoGKDWbnFBQ==
Received: from MN2PR07MB6511.namprd07.prod.outlook.com (2603:10b6:208:162::28)
 by MW4PR07MB9496.namprd07.prod.outlook.com (2603:10b6:303:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 14:20:26 +0000
Received: from MN2PR07MB6511.namprd07.prod.outlook.com
 ([fe80::3c8b:5d2a:8a6b:880b]) by MN2PR07MB6511.namprd07.prod.outlook.com
 ([fe80::3c8b:5d2a:8a6b:880b%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 14:20:26 +0000
From: Jason Mo <NukaColaM@outlook.com>
To: "qby140326@gmail.com" <qby140326@gmail.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "vijendar.mukunda@amd.com"
	<vijendar.mukunda@amd.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "venkataprasad.potturu@amd.com"
	<venkataprasad.potturu@amd.com>, "Sunil-kumar.Dommati@amd.com"
	<Sunil-kumar.Dommati@amd.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: DMIC support on AMD RPL platform produces I/O error after quirk
 addition
Thread-Topic: DMIC support on AMD RPL platform produces I/O error after quirk
 addition
Thread-Index: AQHcoadzx+BgqblH7E2APTGZLoH1qQ==
Date: Thu, 19 Feb 2026 14:20:25 +0000
Message-ID:
 <MN2PR07MB6511E6D445F37FAE817F5ADEA16BA@MN2PR07MB6511.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR07MB6511:EE_|MW4PR07MB9496:EE_
x-ms-office365-filtering-correlation-id: 69069a75-2d6a-4173-fc7b-08de6fc206b2
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|461199028|5062599005|12121999013|19110799012|15030799006|15080799012|8060799015|8062599012|1602099012|53005399003|40105399003|4302099013|440099028|3412199025|10035399007|3430499032|102099032|30101999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gTcidj1XhFwAkiGao0uvRZnIQrZrqp9wrnPKaJUNOuSoKwSWW+wZmZlgWz?=
 =?iso-8859-1?Q?fON9ZbfQRkPfnJdLt7dlSuEFfDtfzvMt+m83bdCsriR2w7WAKtGjK6FHPG?=
 =?iso-8859-1?Q?p9/Y4zXYW0/7QjkWODJGCyn+gfx1w14VPk8dMYT+AAfxD0Tq6fOPMjdf7V?=
 =?iso-8859-1?Q?F3ipCk0X31D4Ywv4sxqiOLRrzcUq3cxM5kqOEaIXhSfEVcXKeRdGienpRK?=
 =?iso-8859-1?Q?xwyjTgKShoR7fizPVnfN6UfZAk/npS3daC2zAB4Ghm2RfbOKdM2YW6kegM?=
 =?iso-8859-1?Q?zxLnJ+APMLQxj/zo17/aso8pZqDSY9Lvfe21i/sd+Uxwid16s2OoS+CSkH?=
 =?iso-8859-1?Q?/+nw/MTDv2qbxES5E/rUlj6GWBTN720EteDEc1GE9Lj4Gp+b8GB/wT5I63?=
 =?iso-8859-1?Q?opgDXzx+7WSk7rRWYaKJ7pA6e26ytkaJDiU2i2PUWeXs+arl/oN1NALihu?=
 =?iso-8859-1?Q?X+NnbeZp4z/68c7ZVyocMWUqjWbRK9L2Z5hkxywuV0k/bwCVBB/DnMiqsr?=
 =?iso-8859-1?Q?uYRjZyufjDJEJYG/yRTvJ0oqmNB5CmrcpNgg0IBBqMuG/10A4w1L4fQXHt?=
 =?iso-8859-1?Q?BJTJb25fEWpZjOEI0iwL6sDlQoF1sbKlvVWwggKPvncViCuLk3OcV1TZjn?=
 =?iso-8859-1?Q?P2aWLCCXgU/MjuSYdPZpjTQCWojBpH583lJ4aEeTm4Rpj6wb11KKXZvoil?=
 =?iso-8859-1?Q?5phkGIRwq01bjMqS2V8xBfC+gacI9EB/Ww6h3IGRlSn8E3QHFxLGnOHcxi?=
 =?iso-8859-1?Q?hbEvfi/2XHAnTjSfqGu5tHkT13S3juz+wQc19U9wFE2IUUDogaVYnpaVq+?=
 =?iso-8859-1?Q?Exq+nQiCajOpddw0qUjc0F7gNqWnX5/BrbYksOMC0PdOw1bhvySAmVz9hN?=
 =?iso-8859-1?Q?OcGzkcnMlgmGSYd/nIo7FNPTxnTA/pY3skaCTuYQQYRcjuuk+ldy/k1Rpl?=
 =?iso-8859-1?Q?nhXAibXT7oIc+hr6J9V74k1ENfB6gevVHzdC4dp+FlgYwtj7NfkOSJ3QET?=
 =?iso-8859-1?Q?IHvKDLYuspWJBHOusoQ6TSGX8XXz3CDL6mmbBmNdn9aGa9hqFHb81Otu29?=
 =?iso-8859-1?Q?mpbYGm7AHM5spgs19/59KlIas+RMnBDdWnyH3X6Oy0KZp2Cr0H3EZG8kdF?=
 =?iso-8859-1?Q?naNGk5cF0+nfPE4wspkWA4HApotz2MjcqeZKDKGIqbul0xO4CLbPEcenS2?=
 =?iso-8859-1?Q?iZsPy5GDViq93Z7hEbBBePUJ1MJOegZkDOpcPmqTqFc8/371JMo1rU2Osh?=
 =?iso-8859-1?Q?7/Cpmsk8wrN7Od9q/WGIZUd8mgVx3WUScwshVReX5F44ZQaTjBlvOdKVVN?=
 =?iso-8859-1?Q?sTMplCFoQY0ehjm/azZGcqFRE8AnaGXQBtA+mS7xkwCQyZWlNkPePaPNPP?=
 =?iso-8859-1?Q?QjqEErKw2RzbezxfAaeWAr35bypx49Ln2MDP+TgzgwERJem5owh7Sa8cdh?=
 =?iso-8859-1?Q?rScLKC9DE7818CUh?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GZM3KkJSppqrngm+LYT93tkHRo+WvOVagqBhdLVMCr7cFcGUoKs13DypTm?=
 =?iso-8859-1?Q?V0EiiYecL2kh4H0VGZZBe+8I7QEozSO390EXC+fUwxETaoJ04FEj1C4swU?=
 =?iso-8859-1?Q?AaKV0q+A/CrptHnDqSGprHfWIcIcY2oRcVanHQ5X2GNCeHRfSjqkxSdWDv?=
 =?iso-8859-1?Q?SmFjfSjnMAtGU18QzsEcW97SG6tMyxCvJTQkc4OinEoOZUFK9ro7YQF13s?=
 =?iso-8859-1?Q?ICgTKF/OmJpgOG598MQ/7cQp5CzFYofUWnmM8uK1P6JcLQ9klg3svRPodn?=
 =?iso-8859-1?Q?+dVHE73L3DEOxObDsrO9XIUX4hUA8pCiAHkwNX0ixa+wTP399HFpj6f8/v?=
 =?iso-8859-1?Q?JanjsTOflVNk3sWBXQ+sS5pHlpftXbWFMOrwWhyufEPPNgvRUuvmACltoF?=
 =?iso-8859-1?Q?deCUFwKFNzxOiqKmwLAohe9YfR3guhGvvarswR+IdeCxFVguUOco1SHIUC?=
 =?iso-8859-1?Q?ZkUN+loGin0sDTHqxRQc2AJQtaVmDKOiThKuOKGrKx6xRPKE4YIk4fO6Y2?=
 =?iso-8859-1?Q?pyUCeH10TwY9jpYOzW0fTLUCq7h0tEqyyIVD+TYZrzAlHrDzQHsfBBb+uU?=
 =?iso-8859-1?Q?h+CQkdAHRSWHkFULrnhSDkmPNhal+AxNJKdmN3YR9eIQzdKFksUB7gbcgj?=
 =?iso-8859-1?Q?oVRfI0uhH7huVVkzZRKm7PBRrK9nM67cIE5riS6J6SPagHujD8y7K0y6Pp?=
 =?iso-8859-1?Q?0xQRsYEc2n2prhkDg3DKGoHtkJM/aRdQxtqfQuGyv3Qk6rkSpOrqjpKZxv?=
 =?iso-8859-1?Q?SkOu+jag7zR3v83PRbbCrSzIoFfok+1VNCkLa1J3veM+0fUnyVNaehgovf?=
 =?iso-8859-1?Q?Q/Fgwf5mssusGcJ4nksM3zAKr/uy9YiWxbYb55R63g92y70Dti2/6s9Fxh?=
 =?iso-8859-1?Q?j9QWG6A+3n99OGv0o0WWn5b9oUkjIlLmfxskFp7lqli9mnZqgheuDkiJn5?=
 =?iso-8859-1?Q?sfJ9KnX0CPbry3NB8hndRow1drh0IbI204T5eqQIjiA/A2MSXi4tbUoJU/?=
 =?iso-8859-1?Q?MGeEqB9J9cMvplWTyIWQrB4xAOKA48deX5KR6PyVv4WpCk8MX6GQFBSBlX?=
 =?iso-8859-1?Q?yYmgjoOcRS3+V7mlPER7opkRN42FzD2Sw7rG7eXy01dMEaqlOeVxjLUY4c?=
 =?iso-8859-1?Q?zTp49KvwKMgRFqTIyymQo73xe9D1iqLOb/6hJfsyMrXnzRYfxW9cWXjhh/?=
 =?iso-8859-1?Q?wvlUTqlefhgSeO7TwS3MITUYh1okQ26Sc57OiQHe0nQTGNTFR2zQkYyxj2?=
 =?iso-8859-1?Q?HUIJ5d/f6iUZvvq7qWAYKovGgDvYByjP+K+8S2G8g8cnFlv0wT3KN+LjRp?=
 =?iso-8859-1?Q?gsfOnjUgtABC9Tt51TAxxn2YEUmGzB0LI2xL4SUcTUA4huLFCNwV57qJNU?=
 =?iso-8859-1?Q?2ZF4NrmXTGtA+j+GvyRuwmrSFlZd3YrvpEchBVw4b/9LRiYWG5dTs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR07MB6511.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 69069a75-2d6a-4173-fc7b-08de6fc206b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 14:20:25.9882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR07MB9496

Approximately one year ago, I raised a concern regarding the lack of DMIC s=
upport for AMD Raphael (RPL) platforms in the following thread:=0A=
https://lore.kernel.org/linux-sound/BY5PR07MB66126978095912E5D4A26E50A1802@=
BY5PR07MB6612.namprd07.prod.outlook.com/T/#u=0A=
=0A=
Recently, I noticed the patch series submitted at:=0A=
https://lore.kernel.org/linux-sound/20260213055904.110256-1-qby140326@gmail=
.com/T/#u=0A=
which adds initial DMIC support for these platforms. After applying the rel=
evant changes and adding my device to the quirk list, the DMIC capture devi=
ce is now correctly enumerated by the kernel.=0A=
=0A=
However, when attempting to record audio, the operation fails with an I/O e=
rror. Below are the reproduction steps and corresponding logs from a Gentoo=
 live environment:=0A=
=0A=
gentoo@livecd ~ $ arecord -l=0A=
**** List of CAPTURE Hardware Devices ****=0A=
card 2: Generic_1 [HD-Audio Generic], device 0: SN6140 Analog [SN6140 Analo=
g]=0A=
=A0 Subdevices: 1/1=0A=
=A0 Subdevice #0: subdevice #0=0A=
card 3: acp6x [acp6x], device 0: DMIC capture dmic-hifi-0 []=0A=
=A0 Subdevices: 1/1=0A=
=A0 Subdevice #0: subdevice #0=0A=
gentoo@livecd ~ $ arecord -D hw:3,0 -f S32_LE -r 48000 -c 2 -d 10 /tmp/test=
.wav=0A=
Recording WAVE '/tmp/test.wav' : Signed 32 bit Little Endian, Rate 48000 Hz=
, Stereo=0A=
arecord: pcm_read:2272: read error: Input/output error=0A=
gentoo@livecd ~ $=0A=
=0A=
The device node appears functional at the ALSA layer, but data transfer fai=
ls during capture. No obvious dmesg errors appear during device initializat=
ion beyond the I/O failure.=0A=
=0A=
Could you kindly advise whether further logs (e.g., ftrace, ACP debug regis=
ters) would be helpful for diagnosis?=0A=
I am happy to provide additional system information, test patches, or perfo=
rm targeted debugging as needed.=0A=
=0A=
thanks,=0A=
Jason Mo=
