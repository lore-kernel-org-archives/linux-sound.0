Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010006.outbound.protection.outlook.com [52.103.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D620C8F4A;
	Tue,  3 Feb 2026 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077529; cv=fail; b=ka/c9DI4l/HxSXQeI+2qgpAXeaDDZY/jyarcJ4utFXzIE+tHuH5lOkciM4Wg+j0C7kwjdUH6KC9SFG3dhzbTcN/zYJZScE7sxGj9X1l1zTaOv4J05Qky4ljC/GXmZluNMDIbJOXt+SmK1nB8Us4nFJQ5VKWkTHlkkRJj4fQnTaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077529; c=relaxed/simple;
	bh=sZgFMALbRrq8Y5lm7zfjDyHKtMtEMcN/j0b9X4WCX6E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FaXPzPQ7X2J85CnIR93u+HwN6YT6mEGex2iCXHYc1SX8KLD+MaL5q+hMuCBNqMe/YDX30LuOiR9kYffd5CJuYWpnoid1Hnok+9GvPrCokg+waoIeIAM4vBR9Sa/wT58Dfjj61n357Vyz9Zod0tezaftXwJdXbD9kXpOn8ezKBK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lCMag0HD; arc=fail smtp.client-ip=52.103.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lCMag0HD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVKiQ1ccBdIdM0fIgXIpksZEd2G/QwFvXlcsVgAUF269og1lxogOutrCjVECuPszpxYO7GbBCrmVgOkhTKjQKnRIrcwaDyomSCz6dBXRYqB8QGnEVU2Sd/pRzZG9NtbueuMcim1GO0jBX/VtG82EQ2BPtV0ZL/5uFCzt1IeA5XrzGZh6p0SDwKkO1D5V2jHPVlUOQmxwqdZOmNM/IEmlKMU/OW+zafkpCUGntyuSi37r5wSrfVGz3o0j1aXDeptDIvBnynn4l3GMQNXRVEqFuNEWxU4F3XuOdHsKJbvzN7W/s29JvBIMpbyZ0SPE/sxtC6/iQVIfB7dlvMdbTNiasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LPlX3DcaZ3eHv1+F3mAoSHvactF4qUHtGetRO9ElPM=;
 b=QU66857ycoIbhXf6Akuq0ozo3zuQFvFhVfleJIwB3Z0TO7hg47410LDc/oUmA121bu19NxZ2WUwXW3rE5DTx6l3f6DBwVdIet7FVW1bEEnslmryFU6nTdCD9KRRyV1wioRJJK5UyPrPP9GK52/3aDQtLaqzw1yi09fzGZFqPLpcj8LwEY8icpVstaWKlWbu84lfo12pAzV4lW6Wx6+cXpgYiJ5HzLtY0FVgIc6vqDO80gqHoeFQmoSoUxum9y2m5yzJCrlX4ztFFk6mjdApLK1o1dy+7MK/Lhr+fY1HvD9fQ2fLLL/NomaYPQRFCGRUBkCfd7/2EIMOLDc6eW5m8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LPlX3DcaZ3eHv1+F3mAoSHvactF4qUHtGetRO9ElPM=;
 b=lCMag0HDVFKsG5BogkRB7Ck8U9/Q0+EsoBxK1wLWXzxEqqEL0CYbvFrrlr94P7wR3TcXIOL8vqSwGUnNLg9sfOs3ZhuSpKwx7jRw14C/Otp7u4OABnI5dFtA+V9CeDEr+5x/tzJxtN1TG/6tiysqmSwhCZNtijwHLYNJ43PyMGPxU7HXfmAVV+MAMBleD5eng1kvn/ewkunAweXdL8UKqHQWYtQoWyXOcxb6TH096QhXufkpuTBkpR49KkEVyMIsiKtd5XRab9faigbcQWv6yjCywtZzV9iU9M3mnX7cPWsWSW8hCJUTRe0DWuGkK/+LAg5un/8TcmEup0pZQN78Kg==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN3PR01MB7896.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:91::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:12:01 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 00:12:01 +0000
Message-ID:
 <MA5PR01MB12500FB2BC37E21E7763DB5BFFE9BA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 3 Feb 2026 08:11:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: sophgo: fix 64-bit division build failure
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 "Anton D. Stavinskii" <stavinsky@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260202095323.1233553-1-arnd@kernel.org>
 <177007251272.963821.10295988533387990164.b4-ty@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <177007251272.963821.10295988533387990164.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:3:17::26) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <64f4d1a8-801e-4cec-b0da-b9c05c169a87@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN3PR01MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e080f2-d488-49aa-7e25-08de62b8da70
X-MS-Exchange-SLBlob-MailProps:
	RlF2DIMZ1qUDiUrRDWdcIAv30B9TdfbxJpDXVcFSB7ssT0rplzY85ZgHwelJ+pooNoKOHENBusBt7SMpehM4llbt7l5gLTcVMOyQiiDGkAAWkTLol3nWVYhyxR/E2RTb2eXS+9CWk3YU+xRo8CKPXfpq+xmJWQsSVxeFl9SU06+wk/hAzgmVYI+Mt0jRMUMbkiOLa1oLnK2hpN8L0FFa1iwTfU/VpXcyHV3nWayiLC5xROSpjraakTYOF7ROuJlBBewTN5I5rts9NVTWgLUIWQE/pdSpqnWnu50qmKOqKeMl3XKrCt7YYSvCNmaO671GAtvkJoHQSvIaJh9Hr/SdAX7WK60A5eBsEXQ4IayaqXSvTmD82cWetIqGlthnwuz2gF6VprKDmSnqnVOV/0NlLNh5mgWQKDcgmTI5PPaTPOTChSpTt2GDxlC8mkt9XRWjfFPOO3jUZ0g/RAdhX47spXbgj3Ppj6St5MimJevWqqXHO8JwV+qrWoFMrSWNX/asBo/3eW8ZEniJT0a3Ys6jv6ilKW5syQzbdKRCEnj6H53e3FBmYn5zWXLHoUnL7s5+GxBoatY9Hqjw/WZegZEydk/Hrrsjm9629muq0AC7C4uO1fSKQW3oMy95Zc43NY7r+E3cYML1Aq7dy9SfbMJHn31Q+LVgxKGiJ0yKTe6vZtKtt9kfFhIFFKicPs3yj7JToho9kmjLw/QlQ8/yfMXIweozRFjo0b6h6A14lTAc2NKra02sbnZS/Rv+Y5TVMYaJbFed6Fw/pmzP1w3PyOqMTcGzRdUSIJELPBAjaCuZsiRRJyV2jAHvuIHvtssL+qZIRZL3s4KrZoNluaZiTcptf7zGwroKRsfd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|461199028|8060799015|19110799012|15080799012|23021999003|5072599009|1602099012|40105399003|53005399003|4302099013|3412199025|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnBoQmxzRzkzMEloOUxERVEzRm83dXE1TjZZb2VGdm9BYXRsQkxkMUh4Qm1J?=
 =?utf-8?B?bmFrVGF5NkJ4NEgwU01qVFZDc2wyK2VOQmhLeXRNalA5ckVZTmNHSUl3ZWN5?=
 =?utf-8?B?MUJSTCtSZU5lNWVLODhkWlY3ZHFjRVFoWmlDYmoveDFuU0VmaktENmdZWmtt?=
 =?utf-8?B?dUtiQ1ZhbFcvTFRabFNjZmdqSnVNRjVIazJvcWpYbndjb0NMdjIvS3laTlpU?=
 =?utf-8?B?TkV0SStNOXpnNzBwb2M5THdTWXg2ODh0VG9LVC9BOXBOMWNzemVVUzVSdm8v?=
 =?utf-8?B?VjNTMzI3VHBNUVd6S3lCMVNUWjFzZi9CRTBteCt2bG92eWxtU21KSHFlTTZR?=
 =?utf-8?B?UWhWT3lqSjFNdk9keG40S0JkWVkyVGRPY2pMY0tXbEFlYlJOdWszTmdzN1ZS?=
 =?utf-8?B?SkpIdE9wK1lORE4xSmhpUldRZ0dZczNqRUZ2ei9MejNyQjl1QzhBcGJneUJJ?=
 =?utf-8?B?ZDBndHVVQnRqSVRmQ3dmaEQ2OEhENVJGSWgzMjh5c2VVRy9qbU93cUhiOThj?=
 =?utf-8?B?UDczQlEwTXJIeUJ3eGdzYWF2RXVZOGpGYUVQRkhKV2ZqekJUTHNnVXRma0pF?=
 =?utf-8?B?alQvMjdZNzNMc24xTG4wV1ZRM25CeGpmeXJYR2RNSG91RzQzUHhMQ2orMlpq?=
 =?utf-8?B?U2FFdmJYeDRVUDA0dUpWQlgwTDBzOU5nS2laTW5ZTnBrcmNtWmUxTWgwMG10?=
 =?utf-8?B?ekw5dkR6UVZMeDdFR2FBZFk1cWwyME5RV2NNWk9WZlBkTkpucUFVaVdDdkJm?=
 =?utf-8?B?b29XMTZ0SHpCV2R4UEMzd081eEpoUzhqY0VQNFRVT3FEcjRmWlRENGxWeEY0?=
 =?utf-8?B?VVh3cWE5QlNYK3Vyck9TMXRlVS9pRnNoWld5K1lhNmRMb1hEdWJRVFhBNVFB?=
 =?utf-8?B?MWNTZG1sMlQzYVAvSUpHRU4xdVFuaHhEU1FXRFErNTVTU1VGV3NCaHYxbG5B?=
 =?utf-8?B?R2pmaFJmRlU5Qjk4aGVnNkNUelZsZjV3UGVJK21wNlNBQlc5cWxUMlpZOGRZ?=
 =?utf-8?B?anlUcHRrV1pBb0dZL21GYjI3VFF2UUh0RStGd2NockMzWHJWcW4zVkdDQ2Mw?=
 =?utf-8?B?aVZkUXNjeEVQUG5NZnl3MGVsMXJBYXVTSmM2ak05c2RQdDNSRzJWTFJqSTJl?=
 =?utf-8?B?eGxlK24wa2lMUVB1UEswNGI5QWI5amRMa0QrUytUbHQrWitaNmcrRm9rTU13?=
 =?utf-8?B?ZkRDVUlhT09TQjk5VHYvMUNvekQrTmM4K3dYaW9zaGRCck5kYmdTNDNuTTRa?=
 =?utf-8?B?cDFIQ1ZjKzBVTFBleTlud1FXU1NBUGM2b3UrUWdmTExyMjd0MWR4MkNZc0d5?=
 =?utf-8?B?R1hxNVN3QjNaS3pGejI3clpSTnhwaC9RSWRVSU5XTlpLTGk1clR6eDVTbE9B?=
 =?utf-8?B?ZmV4WGZrQk5rMkZyc3ovMlJNMlRRc1BmRUc4OElmV2FNNW1UVnNkRFpZbkY4?=
 =?utf-8?B?UzNMc0tmWUVSZ0ZsWUlMWi9TZlM5SHdpTmM2ZXRYV3k5SzQ2T28xem9JSVRa?=
 =?utf-8?B?ME96dXdibEZBdHJHVnd4bmZiZFRVdGJkeEdMbXdmQzY0QmZPb1JjaHBxNDM1?=
 =?utf-8?B?Z0c4RGQ2OEs3SjRScmxmcS9OaTRlQTJnMTl1QWREUmh3REE0aE1lUisyZGJX?=
 =?utf-8?B?V3Frc21Kak1QN1ppemJucitZTUFZT3BFV05iNSt6blRKS2s4VStDdFF2VFds?=
 =?utf-8?B?Y3lTVkViQyszWlBDaEgzKzUrTzBqNjlGQWJ1ZTZTVjNCTWY3VEFWOHI0ZkJp?=
 =?utf-8?B?bmUwTTNJUXBBUUI4WFMrczVrWUYyRW5YNXorYTY1RjdOenRXUXFmcW1DZHl5?=
 =?utf-8?B?cStJODVmZzIrd1htd21JZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUliT3drTHRXSVIvYXI1Qnk5RHJJb1Q1SXBoVkgrWDMvYjBVNVUwbFByNldi?=
 =?utf-8?B?L0dhVkV1MGZsdVBhczZMMVpNcUdFRTZxcDh0OUFSQlZpMVhwY2dvVGsyZ1VE?=
 =?utf-8?B?L2xjdS9QYmJzMGZMejcxMU1lYmhtK3VSbUw4bHR3dlpBOVU3NGM4cjA4c2dr?=
 =?utf-8?B?VWxWWW4vT3ZvdkxpemhCQzJlR0tSVjczcWVUU2RwSUtQbG5uK2xUd0lFc005?=
 =?utf-8?B?RG5jejErTW1MRkwvc2tpWnlRZy9pU2h1OTNSSmZaSmdNbHlQV2FqVVAweVkw?=
 =?utf-8?B?eGlyUlRjZVlYZ1pOTTJmanRsaFVBbDY2cmVMdDgwaEdJYUxlanB6NFFxVlBW?=
 =?utf-8?B?R05obkoxODBMcDVldkVGcFJNWmRqeHpxOWdZOERYUkFWUGxnZDJibmtYTlh0?=
 =?utf-8?B?dTEzcU5OQjFBZGpRcVBrYXp0UDd5NDVoY1BaYWszRXVyY1RpTVJTTXVpV0xM?=
 =?utf-8?B?bnlWcnA0UHFsVGdiYyszYVNXQ1hCbng1RW91MFkwNk9kazcyT3BlMXUrRWtt?=
 =?utf-8?B?c1F6VTRVZGdLMWlWTEJsWHpTTk15QlZQZlc2dzJtMUZFZi9YMk1BU2VDOHJU?=
 =?utf-8?B?TVJNak1LOXhNdkhWdnRpZVlQZnR0QVJLUnNRdVl4Q0NZUEtsUkx2blhNVkJN?=
 =?utf-8?B?ZHd4RldzczJoRGN0M3d0YzhrRmdJM2FDSlFQdS9vVllkMko5eHZTOXk4TUhM?=
 =?utf-8?B?QVlvQVNHQVdsZEhMM1BlbEtqQkhES2RKbjJObUFGclYzeGtkU21BQk94aytw?=
 =?utf-8?B?dXhpeU1qclVHNWxMYmFLN3B6ZjcvMHRlZEk5VWRKT0laOHZEeDF4NXFhYzFt?=
 =?utf-8?B?djIyQytkdnBqSUNjYTlUMHIvOVJxNkhrSVZlM01GS1pkb0dXQWx1VlkzaDR4?=
 =?utf-8?B?UGFqZUxBMVhYS1FqeDZkcFlRVEJQV1BlMFA5WWVMWFY3aXNpQ3BEcnpCd2JN?=
 =?utf-8?B?SU10Z3ExaEJoU2VZalgyeHNXNUFaYWczcVpIVjgxdUVrN3VmdEVqL1ZGYStk?=
 =?utf-8?B?TjVPejJHTUhFQ2MybDJqODZMT2xNVkM5M1M4TGtXSUpSQ1lGeTZjSnBTdGkz?=
 =?utf-8?B?RCtCR2l6MFllOWQ1NXdpdWRPL3dHMEVEMDlpVXg3R3BnZENNbGw1TGJzSnVX?=
 =?utf-8?B?RkZqSEtreTUrcUNrdkFtZWRyZnl6eEtwMUltWmtqMVlWYS90a1NrSkovUitY?=
 =?utf-8?B?aCtiVWh0U2Y2eHAzMWlOOWxzZUZRelZjVkhaYnB4Yis1RVpMZmZNTCtBSmJ1?=
 =?utf-8?B?UHJBdnVxUURrckZBblNFbjB4M0dLU0lTSE1OK0pkeTBuTjVtMDZUdk1oWGd2?=
 =?utf-8?B?Q3lVUW1Eb0ZTamkzcFNteUpETXhUUWYyYllBN3p5MWE5eThIZ3V3VnU0dFg3?=
 =?utf-8?B?WE1OZUw5aGtsQnRLcWNmSm95MVEvQ2lvWlp5ZFR4am9Id0lVYUd5RUsrQnNW?=
 =?utf-8?B?QVZLRXBUdjFVaGhIM29jZHZia3VMTFIySHNESnJBK0J0V2d6bElKUCtWMUho?=
 =?utf-8?B?YytpSVkrM0NTbFZZYUN2bTZNRi9GM1NMMk1vMlI3cys4VlVqL2VzSkpMS3JH?=
 =?utf-8?B?UlZuMXdKWmdaNHhoYWd1ZHpKK1ZmTDlxU1p0R0JFTHRIaitDQjJnM0RQZm9a?=
 =?utf-8?B?aUFHZE94aXZ5clN6dXdjWDBlVGl6N1lYSnJqZzZJS2ZYZzY4WVZOamVaaTJt?=
 =?utf-8?B?d2hRZnJrRVZWUzNSUHM5SU13NDVOWWt3T3JEWFJ1VTNYQk0wWU9FV2F3VXBx?=
 =?utf-8?B?RkNMQlNKekxpbFRyVElTU1VRZSs3WTlMN2Q2Vm55clRJTncza0ZJMGdySVVL?=
 =?utf-8?B?dnlCekV3c2ptMkQ1VG9FSnhZUm9DREs0TytseURodU9RN2g1MWpOTU0xNVlK?=
 =?utf-8?B?OFpsTjdxZTZQNmVCU3Qydm5Td2pNMzJmVHUrci94cEs1OUorWWZkYW1OOU04?=
 =?utf-8?Q?16Cip1dq9ifS8a1m4LY+U8bRq+JDimwg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e080f2-d488-49aa-7e25-08de62b8da70
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:12:01.6397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7896


On 2/3/2026 6:48 AM, Mark Brown wrote:
> On Mon, 02 Feb 2026 10:53:14 +0100, Arnd Bergmann wrote:
>> cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which
>> is rather inefficient on 32-bit systems, and using the plain division
>> causes a build failure as a result:
>>
>> ERROR: modpost: "__aeabi_uldivmod" [sound/soc/sophgo/cv1800b-sound-adc.ko] undefined!
>>
>> Consolidate those into a single division using the div_u64() macro.
>>
>> [...]
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/1] ASoC: sophgo: fix 64-bit division build failure
>        commit: cad9720dd7e4dcdaec8e854fb2c1d1d45fd6dbad
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
Hi, Mark,

I noticed Arnd sent v2 for this patch, please see 
https://lore.kernel.org/sophgo/20260202215956.2127414-1-arnd@kernel.org/.

Chen


