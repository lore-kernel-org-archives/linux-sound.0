Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578814AEE2;
	Mon,  2 Feb 2026 05:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770009375; cv=fail; b=BToga/YL8/3zXmyl2trvwZO3lmNuuIzTRLNoyJ686ffImTqLz2PZKLEEf1kd/+lCMp2gOuyPdrAyUD5CiKww+887al0qXwC4579OH+io/uBtExNBBCY2WD2naThsUkayVKJ0o4ZUOUDE3QYajVD6oc+mzuqpFQT0WUpNss7cq1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770009375; c=relaxed/simple;
	bh=LWoB8s9BZ9I23CLudXwD3JucEAHCp3GquVDBS5ZzjI4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SCdUS0nm22RnRbkYMHIalQ+xBBCWEzUHW+5aovGUeM2rFsL9t3hde/JYYDw3hJE3OnpjD/2AhiJjhhJDLpwVfp/LeEPKA92wpjPFUh5wZW6/73nqCAtTEJGGhrXvTMccvRkMeu2SSznK5/DlBf0oBsvA5I2b4xg4erTisdeBmLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HJ/ItHkf; arc=fail smtp.client-ip=52.101.65.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HJ/ItHkf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heG6W3syL/OlYKI16DChCjhaxvedXpnsjgJS79mxA9eFKXEg10WQf2OjWpcYvWIg6r4bpH61fjevG29mJmI6jIg37oESL0r24M9tdqZ7oxFFm7wuMw7KJvO/5kt/beOeoOiyjE3iVFffF0h7u3l5Oh/NkcVT2XmWGjR1hWaUqoZ5naRA4iw5ZZkwi4+Swnb3aUjX0iA1l3wFNPbiuRyXS1s7TlN2ROOaco//UrzS2rAr+alh3sJVcaq4qO8N0nAqG0yx3Le+tQlknxKphBH2cI7wc2/Mu8Y6Pd8AA5H1Ppsfx4mTInU0D1H0tmUqucacL0lYR7OJ3W0+wpx3T2+NGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWoB8s9BZ9I23CLudXwD3JucEAHCp3GquVDBS5ZzjI4=;
 b=vylxAx8xpiEhqW1HIZFs2zbZhtNydBxNVqV93ovKvwRbZnTTo+Khqqn8rK8VzV8lG9nke5CL5pF/nvV/SuiV/FI2Xb67vcTJKy3QAgpPsdCKVuI5INo9WyaGWMIQuAdclBjkPQldlkZJyRQz2Rmwom4pTQklB4T+ZywZXxDHFlOwrJEDkCtn0rXSC0nG3/+A3J2KuoVuF8AQ8PjWqmXU+Sksej8/6SEAEu+WYv+ckFKb1nlj6jYNM6HXc1+lFScr0taqqZ+vKE4XQt3XtusrraMwHj8STitWacfKJha7KWXllnEp3ArhRaGQnhri5HGIqSsnsP+/z4ey2FJgHCB3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWoB8s9BZ9I23CLudXwD3JucEAHCp3GquVDBS5ZzjI4=;
 b=HJ/ItHkfa3+YySx2N8zeQbti6ECc/8Gb7DTMwRw3DHgGBulX2cPQlkN7IZXtsoUdQwRqkMoa1SNGpeLJSocn0miuyVj8+frXOYL4R0Wn+zpfeBWQ+TLy3QJlrz6WpW6iN5GSdnH1OcT0B65QQhPp9NEUYxFgydC2HhNiJelkrUehjaNglNcAyYrx6xeVu5fHkpsS3AaAFE6LjlTKyVIVTU15AlA3VBiCIxBn+AYlSk6N7Bt8o1soD6GDSqdOWaDeybyEuZu7W/gf5t8zmmt8W3c3w4oLTmq3rUsMbBGhp4459gWZyC0TdKNvjOFbrdtq9u2gaLXxv35JZUrwT6KPsg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7614.eurprd04.prod.outlook.com (2603:10a6:102:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Mon, 2 Feb
 2026 05:16:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Mon, 2 Feb 2026
 05:16:11 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
	<haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: RE: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Thread-Topic: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Thread-Index: AQHckSPrruPZ/RFukUestLaSvlvoN7Vu47hg
Date: Mon, 2 Feb 2026 05:16:11 +0000
Message-ID:
 <PAXPR04MB845926A386618396ED8F0405889AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260129133340.302446-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260129133340.302446-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA4PR04MB7614:EE_
x-ms-office365-filtering-correlation-id: 7ec5306c-f2eb-436e-a7ef-08de621a2e1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|38070700021|41080700001;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pzR8vj0ciSlGm1lW1tVdLgJxDRaTXKFP1Rej8Jty/TUbQWRhggVWZ/ZSBNCX?=
 =?us-ascii?Q?alrnvBYciXip55uUrLR9UN1FOwNljxHPIztIBqV3yUe4nsU/BYRu+WlZCkF8?=
 =?us-ascii?Q?7sNK1C23tfbydZkWL7rxSAuhmFndAKh51BYRobK+x52gMl6NoBu9caBIq6NL?=
 =?us-ascii?Q?6SwvtUNHtrdA9trTQk4U87zsSePPQf3VAHQ/s1F6hSu1JrTE8btbyLOoLZU7?=
 =?us-ascii?Q?BZMBGao+8+Iov8T+E2WwkVoFXXgRVKtkEv4zkA2I8oz7/4XdrKfJW2IemIM9?=
 =?us-ascii?Q?2LOoiXmRY07YEkY2TfQnA97KhfQnyFMvRIcnjOq7DwCFqEu2Jh1ShckALn9x?=
 =?us-ascii?Q?s6dlVeZ3xa9OText6c0y3oeMjL9pe2u6zT4M/89rPpfNofD7T8j2tt0xYvCN?=
 =?us-ascii?Q?gL0TdRzh7uiYKGJu48vR4q0GgYDmhrduDsHmYk+juRGRWlHHo7Xxi3ZTUMaY?=
 =?us-ascii?Q?WdynsqCOaHUJe6CQRqrScsUiANsrgL3ReCqH9uuY7ahCTu4sK00lgaGQzB+s?=
 =?us-ascii?Q?pvfzb0/t9QHQc9oj3LZrx1o8jDvpunXmTzDfnPVmJUGgaWUnlwZjRBO/xo6/?=
 =?us-ascii?Q?bn00XABe6gaew6RgtjjEY9yGevUfgKZHMG5M2V1/JNSYvZthw0KSluxq1Ygs?=
 =?us-ascii?Q?Q9h1mmDPj3hkfnvLZVe+E29Rbec4nxwXCIp89rrbHf8ElesLQcd42X5krKlm?=
 =?us-ascii?Q?QqoVHi0kyQR4Hxb9cKKSL+Wu6EX7Y1Qknxv3EZuovoE1zUbDOh+4a11eQ1bl?=
 =?us-ascii?Q?XMYdF4uf8IPY95SDWy2InGyBxuwRH6yDpfbN2FN6MVVv5ujlCgiWbcFgCEAC?=
 =?us-ascii?Q?HwuJeq3xCGFmSWDS1dB1IpaMr0214RB0cip/KWTTW41XINKodMOTWldgczP2?=
 =?us-ascii?Q?y8Z4aPMRKWh976LfmhXjqcBXeD/QiPV61cDGE2D7z9Awi+uZi2/lTGM4AyJ2?=
 =?us-ascii?Q?UMdlQ46yTExxMTAUI6hGQ9KtV/N58bh2G4Atmp4T988yT9A6ThdheWJkW0Pb?=
 =?us-ascii?Q?unWOJyKiosdwKyMaa/irdyaU5nQzxs+v1TrGeweM5A6Bgt97pVhXHEpwcJk2?=
 =?us-ascii?Q?iLyRLo2V8rlHcjmIMW85/36GUTJ12WyrRLB20dUCB9vwh3xNgKxmwKRmOz+8?=
 =?us-ascii?Q?VaoKY/AFO8LLTu1cEs0IhsfkvzG/9jVrifVbK/pT8lzNIcpVMoiupufIlfWi?=
 =?us-ascii?Q?b74R5CbLNCV5nzwpZS0F9ATRRPeICQryfSw37bIGuNwefxkB4xUTnippNt3j?=
 =?us-ascii?Q?C9wqK/dfgpusDu9/wNctiH0tNsNqc/sY91Wa2PS64BDymmGMdYAj37C2qErv?=
 =?us-ascii?Q?P7nQDqXsmdVuTVipgEAc/k5TpytLZXA+N/dONzAI01hKqhYrHq/zF/aUejgQ?=
 =?us-ascii?Q?SBUhssXLoXUrgAGYnT3PB3ClrdlUQPGaLkP1ngs2BW6k9PcA8nkJKZR2XhTr?=
 =?us-ascii?Q?EXPUMJOE/h6xFScwu0H9LB01Se2kigaVsNiMXsMJCcZ/am8++JKYxwIokhJ5?=
 =?us-ascii?Q?kcWbnOtGx2wCcLLR1kB2KnHrVfiAnpornw72O1iDig+ckFw8vaPEbhkxOu3W?=
 =?us-ascii?Q?lgT8HqFzCbvmRiaodTa1PDuNK947GDNU2v28nhkC0lo2o5JmHOx0BuK119zI?=
 =?us-ascii?Q?pRRUxHb3kCCQYL4jtSaoXqw+mYSfCoM13A8nyIO0b11BmdV60XbkUtyyqfc5?=
 =?us-ascii?Q?1lxubw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(38070700021)(41080700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UbwDecvtT78H9w6dLshn/ndcMweL1RmJ5d+AAvN82nS2o/Ai+ZNqpePf9U1c?=
 =?us-ascii?Q?m6NjONP6k/sq4yl514uyON/24awwlUC0z+Lsa5EHbmhoT567wwq+uUWyYqwK?=
 =?us-ascii?Q?bAK8lni3IZnYDEiq+q2EyCtCXCzUQBVS8a5Q+f6mptqtN0eahrNc3nPINYmG?=
 =?us-ascii?Q?rouWZkLEWAQKi04fZCgTVIUc/VEOaDRsNHd2svpW5k2VQw6kCCDkRawG+POx?=
 =?us-ascii?Q?dukb+EZwf1ZJZYIJQOoI2RFbqwvZSzTbV9Guda+vL04ciUcpHMZH20D7MkSZ?=
 =?us-ascii?Q?NtYX+Bo5yJyIpLLMe/Oyr870ABuYMU7zoYwc1wAwKfCmwEgKgHjBoitSn62E?=
 =?us-ascii?Q?l5jbomoZ2mOLIagnx5+7tONV0EiXDPeTnsN3iifoXHwtWWhGJfNDQlp2jFs5?=
 =?us-ascii?Q?wkjTqFzPhYizwf5nXqK5ZfwnV2FC7ZgKz3ZrIKTx0Iv8eEv2E2GVxYvJgmej?=
 =?us-ascii?Q?XVOIWbuwZuEQJx8+ZTJ3vNlaF2WqXFRVtccgch/35UhqQQzmGFCZSYli2cQy?=
 =?us-ascii?Q?JmqFevTvsBiw2fbktRvMYa0udTDvTswJrlcYHPbuAoJV7Dn74hRmQgVefDDd?=
 =?us-ascii?Q?Iqv5i+wFx8BpS4lpvq4JXAyaR+L7ZuOShFgcrOC9RX2dUX4ebaZc5+75Akwy?=
 =?us-ascii?Q?HFslCTFxxbdZ/pCQF3tIngEWBXxNx4rSpEEkF1h4duoLSx89Gw4GUgGqCeTF?=
 =?us-ascii?Q?oflb1UkGE/coZl/SoXsQCDYPq2PO8g0WOoCPgGiq8F0Raxhs7EypVb45KhQv?=
 =?us-ascii?Q?bGtdUemxGNruu1LOLto9qKr64OnjWrdkv7ag3MuVEK4i4bhWA8judETBc7ek?=
 =?us-ascii?Q?KuQ7Rp2aapksYoOtOMMgY/A3gGOCs8Ei02DGsBm0XZ3hJW0vmGKe8TJYXPWg?=
 =?us-ascii?Q?jAngrOkfHDPsqrrZDZXjwnW+DZ1+DKpTk3Eb2BNGPGUBAKbxclriktiML/k9?=
 =?us-ascii?Q?u5DX4R6xCdSdVC9Mw8CkFXbTRycYKvf9iJfoqAP25XYVaentBDCKi549g8Nm?=
 =?us-ascii?Q?ETkcY7g0MrFzrRKxL7iuq7qqGIDU6yhYIpCsG7IbaV0Upe9kxQOBnqHFE93e?=
 =?us-ascii?Q?T1U/1ZhMl4mLrLMDImPmyNV4VfXFjQ9tnSwQHinWfkCSEtPL3TsH1TsEYLYT?=
 =?us-ascii?Q?yafxHZo4DWfySY86yvktJx12svEqvBdHHqg/t2UaOt0UnHIyXNNfdDujWWxX?=
 =?us-ascii?Q?8QpW1jsUHJjJfYvscfa6skkF/7bn5ry0m0cX/ZsfIJxJOz1KPuBSA4llB8Xf?=
 =?us-ascii?Q?Ud6W2sOQeYiIOe10DZPCDR0I7hxNCs3/be+Ho+ZCbgyIZSctpzW07gtxUCLk?=
 =?us-ascii?Q?qUln1nNBx4+jQQ9gSaWvnnjrOc3mG8CiPUFmoUdxklE7bGr7qplZny8oWs3v?=
 =?us-ascii?Q?769Gb5ntJ03REF793NPPkyFoPZJKL8+toDtztaKxRWwaCzritmh1lpmRmolj?=
 =?us-ascii?Q?pbq7mxc5Nhb5CLQtctWOqUwbibcK7RC5RVzMjh77xfXQ4UOsPgxWTKj6IuYi?=
 =?us-ascii?Q?OPVdW+rcTHDaGK0kCVd7J4OZlZbykMyeIZdAZ5bGzbIwYbaw87ZPPrIJeINL?=
 =?us-ascii?Q?w9eAM2Urgr73EtcHvrhFl1ImZSjSyXOCYIJGkxqz/fy1rY/Zh1pcgu96oh4B?=
 =?us-ascii?Q?VtCYhVDtdiXw+IVBvsrcOP878lHlo5Ap0rieDB6mLCNHMWjogNvwNsYA46Kj?=
 =?us-ascii?Q?ZuH7pk1nnZIZ7GM8AwxPzgezWxbqj1PHxvVcGsd1f50r4lVz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec5306c-f2eb-436e-a7ef-08de621a2e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 05:16:11.5203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Msowxq5ZxlTa4bSHqGucclaYgYxBhUotLkAbaeuR83Z7LRfeh91+eNYBiiH8MEZMaP13k30t6jJtPPWO2TAwUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7614

> Subject: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use
> devm_gpiod_get_optional()
>=20
> No need to open code the devm_gpiod_get_optional() wrapper.
> Instead of checking for a certain error code, check for NULL.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
