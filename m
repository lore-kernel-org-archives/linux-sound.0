Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013085.outbound.protection.outlook.com [52.103.7.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9627E23AB81;
	Tue, 24 Feb 2026 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948689; cv=fail; b=DZNaHrOjIMjZVQMNlKw2KeUHj+FVP3n5opzmx3cdSAXJ115nbjG/T4vOGfgyus60fxz4CCXl7zaCXY/v5Xh1S+Ba7UayIIB4iqJexSUHVnqQfraNsIIWFW+v+m/PapekZJLo0pIUiXWNxZUbZS7pMtLyd/MLAK6ORpInrAOn1kA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948689; c=relaxed/simple;
	bh=qkrsMgzdiyfp2xYUuYeXl4oRha64i1KD2R7VtF3ohPI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KLcHRm5SM9R0xUl3q80//L4WYVmEixIm//qMMXWv41OkRBKxCyEBVI8AGOf6ZApKH6v3RqtzCDKL7yuFx1lczZattfBbSgHGvT97G5W9gE3QV8crRKGw8aiDFLI63eBqeDER7vRtdqsdzHZlZvTc/qDO1iQon8cubQI63WHDniw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=fHWkHqWG; arc=fail smtp.client-ip=52.103.7.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="fHWkHqWG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdOUJojz+vS0ff0KL4fI739eFzvAo479nEBUpJfjIPNDGysFAoXy778GVFwehvX7TOxIz4TwsiPdWPs3AjkIvK4O7x26Qtxv40KzwC7ASIgoxx7ojuHa0u/5FIUMWej8Z7wt2ueB0Lol2C19FJUN9b2KuRcU5bwi/e7oeDSl/fnjvrVdEummvsx1vIRx+p1Pdbqt2fpxjfzR16BDeSSwwGRLV/9H54Y1QBPeY8MEnMPsJjoQJAJygbhGFcXZgpddde3oE4SPA/kkDaIqLuhBnRZGKBedbzv1ZCJIV9FVBpcQS+qNolEvW7u4d68MF5hT98lBwzfqMxcRN/zmss/xVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bZ/Ba2aElBT5ggngcgMVqan75ZBr8YR4G1sMWJy3Z0=;
 b=KbVnGWXQX22cVR2WGUy0vpMToLGbQcEoXBNOku/LQ2hApAxCsqnhVsjukUQ6+Cs2sdM5/NnLpQgjT90RVsxUPD9BSv0EXDa6WLUyIYth3stuMEPMG8CAiT+X66yzCbT/5aUTUhOiGxIYCn5j1Z4QBZ/PNG4fUvc1Mvj6yg6ylPq3oPX740cJBoctoYPT98jSqwcqkyDSiZmvFToqI/shmr/MRdsvsFwf9CRx+BBn1mKNy0My2wBLQCCh32gy480mdhThQsczbxYfuzJMErZGFiXsia9t1pRYjSypWPMGJMI5JrB1YzJuDJlw/elaAlVU8HeGzpNraXJVFMAqcv5bDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bZ/Ba2aElBT5ggngcgMVqan75ZBr8YR4G1sMWJy3Z0=;
 b=fHWkHqWGlPAn8gwgxpz9uVGq8bCVsqlptVCUajm/TKbRf7pe5Y+TR1oEjVK0Cy763UiHBukYaxSA4KR/nn+mOBb18v9tHBJWlLM7203ImTuUGLUI/J9cAvgkpa9zEffbwpBwUidd8PyWZ0ZXBMX/CDqnh6T1r4qUkVd+BWaFAqtH8grr6vAhB+JKdDlPQPL87aXmoKRsmFIuXqpdNeQHOZRqcxy9gvtfzKUj1op/Elj6X84HWH1ziFZcd0kYSxhJEvmlq/D8RX4Rz/CQ37WEmBcA2xlHX6ciuPLPylI9JtT0uyRy/yFS2Qw1MT/yyZysi3aiWqgLMmplD2rt2JlWvw==
Received: from MN2PR07MB6511.namprd07.prod.outlook.com (2603:10b6:208:162::28)
 by BN8PR07MB7058.namprd07.prod.outlook.com (2603:10b6:408:d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Tue, 24 Feb
 2026 15:58:06 +0000
Received: from MN2PR07MB6511.namprd07.prod.outlook.com
 ([fe80::3c8b:5d2a:8a6b:880b]) by MN2PR07MB6511.namprd07.prod.outlook.com
 ([fe80::3c8b:5d2a:8a6b:880b%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:58:06 +0000
From: Jason Mo <NukaColaM@outlook.com>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, "qby140326@gmail.com"
	<qby140326@gmail.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "venkataprasad.potturu@amd.com"
	<venkataprasad.potturu@amd.com>, "Sunil-kumar.Dommati@amd.com"
	<Sunil-kumar.Dommati@amd.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: DMIC support on AMD RPL platform produces I/O error after quirk
 addition
Thread-Topic: DMIC support on AMD RPL platform produces I/O error after quirk
 addition
Thread-Index: AQHcoadzx+BgqblH7E2APTGZLoH1qbWRoG4AgABodis=
Date: Tue, 24 Feb 2026 15:58:06 +0000
Message-ID:
 <MN2PR07MB6511DB7132D1EB5A06C27C83A174A@MN2PR07MB6511.namprd07.prod.outlook.com>
References:
 <MN2PR07MB6511E6D445F37FAE817F5ADEA16BA@MN2PR07MB6511.namprd07.prod.outlook.com>
 <009d1f30-4e8b-43bc-8b4d-45d1b062366d@amd.com>
In-Reply-To: <009d1f30-4e8b-43bc-8b4d-45d1b062366d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR07MB6511:EE_|BN8PR07MB7058:EE_
x-ms-office365-filtering-correlation-id: 4d98c88a-69f1-4160-f028-08de73bd7fae
x-ms-exchange-slblob-mailprops:
 Z68gl6A5j29AnTtbLKjpqQ4tPEUmeMtbB9L1o8jSqLVQNRIZ+S4Jq52+quX7y7PGeKfCFaO3HeSnCA6nBJDnngJ2GG6FJmDNkzYWzpXCWnaiPYiIAT9E6S66KCJHzxjpESoqjEVSoJ/ow4OFGUN1AlDErjd2YuDoagxTBiEaNIfEwCWdoFK2eHxk1w3RkPd1vFy3f4tUYq+SSRkMToQXjKFVwO013tCSbAve/2zw9qbNkTLXIcWRh8lPAFFin/skNNTdsUXWUour9Ei0VGm0ANjKYMknTTQiCnJvzvNLMmsyVn53AEI40/VKiYiKvOVwzr0QLmVhHuO1XvuQQWQD7A8rt7XbLze8uRt+UT9DX4BiYmIDbuDpKIimQ62lWzHhfHYYKbQpu12q9YcwP2Ntb1zWp7kgLH/JwJu4v4cFYH87nv+u3OSfkffZ2peyYv4btSpY/hjffbFZ6FDX2ys52lR7g9mc4oiwhAvjaqAFqgkForJDymaniwj0smh1fgTno59JbLPohLq+m9HtW962Sx8b/Mt1lYiTOUPbEmFaAaHqylC2iNcwGk9AOjI7QMwEb8xsicgDqkZ7Q6hP5GRBEQcP7pXij+1JoggzP0pWP7QMo45/cUBM7yZgxHeNdFF5tsRT2zRo58Lpym6Owbg4jif2KFuT6HKP1qfFYt3tbzHoRzkZJJCGAIPyK1Ss+lzFDffwh5XlyRDFNhvyt4Ap2tnYvgO0VxLhoQyaDALhg0Pd1bp1P01tB+YuH3n5tUtA0CUtKnhnzahGYYJexErNiyarG+n4uS9pals43j4DIhXTRqdqqBPvf8BgT6n+whUE
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|12121999013|8062599012|8060799015|31061999003|461199028|15030799006|15080799012|1602099012|52005399003|40105399003|3430499032|4302099013|3412199025|440099028|10035399007|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?r8QRCCIuUs/gCtTN0TCpXxCUfyLcH6pQ/7kZn52NR223/QBQIIJmjhUN10?=
 =?iso-8859-1?Q?hxoa/yGFNo0deAvnTpQe+8eyKyVZMmndazJvpZVi3oDtmAAizQ2UDS9Obp?=
 =?iso-8859-1?Q?Y85v2MpWf90CWJmxJQowTjwUkKmXyTjXTH4Z1MKXj0VPhZaXa4n/2E+0wy?=
 =?iso-8859-1?Q?Sc1taGsRISHwKORBSFcDWlcu6hI9Bl8vt0xsN2rN6JKYIHoekjlwEMEri5?=
 =?iso-8859-1?Q?RbMeMq5eddtW1PKkXXc/aA8q157YeVa/6yhBkJ23k8oOnUR4JJB/LhTUS0?=
 =?iso-8859-1?Q?WCe8EMVq6EwZG3Igzz8BzT1GduZ4ZaOJ1Po7LUPuq+T6Kh25jKIoff237G?=
 =?iso-8859-1?Q?P12v502kSN/m1HxHfnXanjo4vVw5YksOJAALE8lZDaH7YKs9nUMn8whbZ/?=
 =?iso-8859-1?Q?n11jCtcVkEpJfa2VRpLtMSCg73lUIJ/f61fY1SaoiGxEHv9AKZZk/qKDm9?=
 =?iso-8859-1?Q?LevN98QUtO5smjXPcsLLbR8lMqI/YaZtC4RSe4fTZ6EkUHa17oac9xeyaN?=
 =?iso-8859-1?Q?Gxnco7fmU4dYO5mLPYxwiGPYuD7oxRlTakRf30mTr6QAJNmVhz8CPa2IGn?=
 =?iso-8859-1?Q?AQVeVnJb7Y3r1ALfc4GaRfs/D9x69zxbgtjmbUsjQtIVcUtJtBynVWxHgu?=
 =?iso-8859-1?Q?2kbesLXdfGLQobRzNhpF1bfF1SfHDwToUMCCGTdSMmSDVyFqxd1WrYLqgt?=
 =?iso-8859-1?Q?V7JP8RSeeoWopdQ8pQOLiMKR/eHpx35jDv5af/OdQz2ACwgwvPWVqwHIgW?=
 =?iso-8859-1?Q?zDMvkS66VvjX+EITmJKFqebXegf2tiZdtrzmxyRUQlqKHyuWXlTn3QE+Sq?=
 =?iso-8859-1?Q?Bvw8kHX+EK0rS0jUu05oaZ8bJjfdjQiQmXnXpBbgo9GPRft2APDSjl8yF7?=
 =?iso-8859-1?Q?nMpNDwhelvc01Vv4q5vYSRECvM70bH/m4/SYAm3ZcsPZ5vNi7RjXLmLch4?=
 =?iso-8859-1?Q?UXwiwgu0D/a8igoSkHcFSphNX63IIWLurj3JgOVECS3PCUEH0ikKwZwzCZ?=
 =?iso-8859-1?Q?meTFWHRR3fibMKrJ0WZI9SlQSX/jxTaNYmOsw22HgiHjNfKgt6vlZGnNfn?=
 =?iso-8859-1?Q?lbpmgxx5sd7OJPTPMxDUZSqn77X6TdlW5FszOsOkGoesmfa4xHJBnl8nj4?=
 =?iso-8859-1?Q?7qFa7I1n5s6WOOBJFiGY9H5EmTgu9NqBTUx0/jvfM+iNDY2n4S9QipZVEc?=
 =?iso-8859-1?Q?razdLsKLuYaeVxFhKMYftB+n3UFkiBCKkW7aILfOy8cdNncV26r3pxej8f?=
 =?iso-8859-1?Q?Fb9Fe1OKGwLjgZff4NM6DyJeCzCvnunRFj84FZJCJ+kMuu+cgMf2SOsfW2?=
 =?iso-8859-1?Q?QLQYPFWTIaTZPx1NzQPdx5Cxb4EJ+AFlkCjGAjWhjbutNaFw3AFiaz0IFp?=
 =?iso-8859-1?Q?8Fe5Qabkjx8jO6WXONy0fs63agG4U1Top63IjFAqxXetal70sJ7ArgRs2g?=
 =?iso-8859-1?Q?6NGByf0TRMFeyKps?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZvQjVfS/r8QVyqH30U62OWlNDzlJaEnUZkdlLaBZP9F3VSX+trnWaVvw1p?=
 =?iso-8859-1?Q?cpLWDmEDuhfil/tyAtvD2uj9si1oiPnPw5VTn9NOUEkrT2RJ9ZefsX67Ly?=
 =?iso-8859-1?Q?M7W1Ze/YgT9X3Zya5Zpru7NERh5mXQTszoHghEtQwaWGjUwTZ08S2pHrr3?=
 =?iso-8859-1?Q?HT0kxPQ/EN7n8KZbVPJd/3uIlnabH+MJrPhKnxfEVGfzRaRHEeUB7grBov?=
 =?iso-8859-1?Q?LYHzKp+wvxSYjEDy7Say16hXTvUUdSbYeeYDhhiuTNzl5O5mZ5CeG161Gj?=
 =?iso-8859-1?Q?8Oy/zHxjwpZs26cUIv/H2/ierOHgGkDErpUHUlwNeEMEVEQQGRYIMfq7KB?=
 =?iso-8859-1?Q?j2k6IIaUuCJegNvF6Xeo69A/mbnmOvQmxhIaiQjtC0ZaqccE4jkI7ORqIb?=
 =?iso-8859-1?Q?3fdJ846i6E5nnMMegdLZv3BIh11CsBtUHdAWjWLI1uLVSMYHY7W6yRvHyt?=
 =?iso-8859-1?Q?43qHa+sNQZl77JPD3exNdcoqjZ8AB5e4yfEM1DKwKVAPlaVNYrywJEwhqI?=
 =?iso-8859-1?Q?oTnG8GMssbU8fmj4mUrW9+hbqYO8T4LrcbTogNK5DDNhqGDrwZAJ3MMLxl?=
 =?iso-8859-1?Q?5kqlx1ZXyqG3JrP/xYH5ZvOe2Fjk7I0FBQd4B/5W++Sf2Xspx0sRKeFJP4?=
 =?iso-8859-1?Q?lZ54qKlnEl+rPK1ladF6hHoRtTIfHGRTt336OGPWVRSbAZp64rt0cijVKF?=
 =?iso-8859-1?Q?nylBBxu13O533C/OoVaOKR2XjwC9Jrmzso8COULbFJTL8KoUgQGKTNv6nX?=
 =?iso-8859-1?Q?Z+a+bTL1TI7fI6OwzEoN973Hvt1DRnWAaN3PoO5k5U4MtuMP2f5VWbOfoQ?=
 =?iso-8859-1?Q?7Wdv7rzLo5I6WSJP8eO9SVHo+kRAm+ZyzqRvGA2yORu2tC3IJIY6g7dIbj?=
 =?iso-8859-1?Q?uNd0H7C7mBmI2G9jXfa0uyBvb4ZVIOIoEX90IjK7Py0dUZg2xLz4Vidymq?=
 =?iso-8859-1?Q?YzMpB5sLyI5EMObOPSeIS/N+CjKN23MSyWqAzthahIAGnVLWRBDV/+qpYH?=
 =?iso-8859-1?Q?eWNltk2RRCCY/WwrdnkmdiWrRRM1FJV5k2OEiWwm95S4aeaCtQ9+ddY+JS?=
 =?iso-8859-1?Q?qOtAVOCtYW0tBpQ40iqlUV/9+T1zEuLgQiTtY0i1R2VSHCuqi9VbQPbJgX?=
 =?iso-8859-1?Q?V4fAm1WbUSrDOhCxEK2fkpsx2LPAfSEf9SOeM7xj6frwnvc4n+ujUjPhv+?=
 =?iso-8859-1?Q?sIludye0RH57Kyy8bpa25EcXeFrMgAX+N/VzIIfaERNyQHQvJ0siC9Cw+D?=
 =?iso-8859-1?Q?8qbCDi1699OF0d91ZaZUYUrcdj05Da9TrSJ0eyESXvLb40otOamWuBuZYM?=
 =?iso-8859-1?Q?DS9aR395YtSqHfFHeePvPOhSeO//sfOV425/XGHAo88Wazk3bvp/8KQD5L?=
 =?iso-8859-1?Q?Zon+/wdzHecYA47xCe7LytrX7O7SbMsZMY65VfmjAKgzJzwPzKqNM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d98c88a-69f1-4160-f028-08de73bd7fae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 15:58:06.0768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB7058

On 24/02/26 17:42, Mukunda,Vijendar <vijendar.mukunda@amd.com> wrote:=0A=
> Typically, I/O errors will be reported when DMA is not progressing.=0A=
> RPL based platforms are intended for desktop variants, and DMIC is not=0A=
> expected to be present on these platforms.  Before proceeding with furthe=
r=0A=
> debugging, we would like to double-check whether DMIC actually exists on =
this=0A=
> platform.=0A=
> Additionally, please log a kernel Bugzilla ticket and include detailed=0A=
> information such as=0A=
> Alsa info dump, lspci -vvv output, ACPI dump and dmidecode output. =0A=
=0A=
Hi Vijendar,=0A=
=0A=
Thanks for your reply. I have created a Bugzilla ticket for this issue =0A=
and attached all the requested logs (ALSA info, lspci, ACPI dump, and =0A=
dmidecode).=0A=
=0A=
You can find the ticket here: =0A=
https://bugzilla.kernel.org/show_bug.cgi?id=3D221132=0A=
=0A=
Please let me know if any further information is needed.=0A=
=0A=
Thanks,=0A=
Jason=
