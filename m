Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2136.outbound.protection.outlook.com [40.107.117.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B220F960;
	Tue, 14 Jan 2025 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736853612; cv=fail; b=ZunP+UhrrKSyBn0RTg6VdcY/GqWZ9V2SzIA1CIMccya97mxd6gYI8C4dDWNPos/OZVos2txyikET+oDQuAQ7JVT6nJdOhGMppCEngOwK624aBUZGqohcSt/+l/KPGv/KJ6gPfgSe09gQIgSUb3uFkopBgpyA+z4uGYy3UxD98q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736853612; c=relaxed/simple;
	bh=7xsKtczv0mMfTTJaCl7CA6rAywyEcFOMSv6MrRmQDzI=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fCYcwn/eJWQ5AbWkUnCOisBEMPg4ClHU4OVvFE0oXj6fKp0piONMOp8/VFo/ARdaUg3NI8HXON43/UInP16u0aZ/hNIPBbYV8CacMJrlAqQNkUmaRwEjpQCZoOPjGNVk2GGYMkd+hYe2sNQMVRPFt0lzgggSUSxtZXvxC4X55aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=szqd4TM0; arc=fail smtp.client-ip=40.107.117.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="szqd4TM0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Suc5pRj6JSMR2NdGhd0zYx2bE/S1dgT2eEGhdpg0ykZjt+kmemFnEDCaZhaTEMNYBFqJbEX0LqCfJtPovDRFwQpzeHA0XvfliZFjyPNof+thljJ1CgQmt2stXvpYyFt38+QCpWuCzQLHzXNPyESb70paBxr0n8RgloE+w48M0zTRng0EPt/dcHfZ2dObPgFGK1tXdQtWcFY3iRwcdmnpqyFT182V7MkZtLd8jq+nqtYwys1DcnmbsZlKwGvqX//B7gqg66xIvKgKH+umSTWqjwt7856C+gqRTFCYSEipmdRLplBagvNLk67IlEkIkDH2RB1FeOxmzzXKFtqo6QJTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR9PSIEClXFUh4k4bLWtR7fynvIZyNVokgCkYDn6+jo=;
 b=BzT3U9+h5TzYUM6xsbODh1nKcARDpzt1Iy0WhjQ76Fz2zRpkSyG7FmcQYxYG4JSuiSVGeS6CPab3f6fH+0FHK8yGuaPXsDG2OWCjB7r4uVg4yK7SYKq9XwTPS4IESjgjjwUfDoUzG/2Rz/410/WYiDjaLTZ4pvA02zlhlDuy4ZRaRi8kRhel+keX4cCEyQTGvKmfrmY2fc38ZtyLXd++MwTf3SRfXRhib5vgf/SehHHL4YFcy3MeggbcYyEU0hgysllgM5wVUY/vNAzcaG2eWYOpQyl3hSBgGjLYkdd0VYGlBaE1EDYNgiTuh0UfSwSoPv5hbkZP9YLRqaA4jZjSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR9PSIEClXFUh4k4bLWtR7fynvIZyNVokgCkYDn6+jo=;
 b=szqd4TM01YQdSfdsI5hxbQDx0cwezeEGfGMJKXLfAZoYalNTlAkApFfHOmMYWYNkdl6s/1EfC+Xj+mZL68zUc5YXlTGJdl8DvhBClC2mlW2qEByfCGKVqgO05qAYfi0C8tCqu/Lwymp0zl/GKuYiC+i1Yp5Rg2F/I2GKvekcELZuwBw6zfRL1uxaQRDjcBhvh2b2YYs0shR5+mBRs6XzIIuB/VOpw0EjAq6zzAGijqSNTwbansYThFR8lWS8yuCKRljQYHxBjTwvVk+olHK9YLHxrL7XqJzyYcyutkOjiNXbIA/M4om3hELbKiH9zmXvop8prpgWK9Hjnmblsey5dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by KL1PR03MB8495.apcprd03.prod.outlook.com (2603:1096:820:12f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 11:20:05 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:20:05 +0000
Message-ID: <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
Date: Tue, 14 Jan 2025 19:20:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
From: Jiebing Chen <jiebing.chen@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
 <20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
 <1jwmey9451.fsf@starbuckisacylon.baylibre.com>
 <e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
In-Reply-To: <e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0059.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::20) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|KL1PR03MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: c062279e-8cee-4264-445a-08dd348d655a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkRwd1JROUJNcnp1MVphQ3V6UkVwVDBreWRhc1J2aHhWUW5nVlg3Rllmbk1w?=
 =?utf-8?B?NTd0R3ZNWmpLWEUxblFmdWVqN1lhU0tLWGQ3SVBGMTh1elVRUklvcFV6Tk9M?=
 =?utf-8?B?K1JlZUlWNjE2a0kyWVdVV1FiS05uZHVOczB0VTM0ZlhhUU9HOTlWQ2dIZXhX?=
 =?utf-8?B?V0VtYXY4TTN0NFdTNTdzQ0c0OHVkQVQ4SkNMT2pINFZCTTNFWGV4azYrSVVH?=
 =?utf-8?B?ZEZMN3BTbXRQL1lKcHRDSm9hNzVTWEhpRkhPekRZMm03UU5ObVhVZ09zQk1L?=
 =?utf-8?B?cnVmaXFNVnRsTVk2WVJ4N0wrQndTbEoyMVIwSjhhb0tLZWpDbFNzR2c3ajk0?=
 =?utf-8?B?SUp6Wk4waEljZGc3NTNXZjFQSzBxNCtYSTRJM2NuVE0xcXNObTdXMTBBSTF0?=
 =?utf-8?B?MFJYN01XT0NlZHd1aVgxSkJ6dTViWm1NQ0Y5YU81SHhQVGtpM2E5VkdqNERC?=
 =?utf-8?B?Ym1wSGZKUkI3YWEyTDdCdktSd3IzdlRDZ3hTUlFlL2pNSkVFOTU5Sy9mVzZz?=
 =?utf-8?B?eDh2NitmZ0szdjVWUkV5b3JQVEhGUTBCVS9COThwc29FNDhCaWNBY3NjWWFi?=
 =?utf-8?B?RnBFaXQ5bWtmQUtrL2VGYkozMFJpM2FXMFRMZGMzWG50UDk4Mk1NSG1lSlV3?=
 =?utf-8?B?b2tOUkl6TzBQNW1CeXNUM2dPa21lQ1ZqMlA0QWZXZ0RhQW1oVnpKR0ZqeSt2?=
 =?utf-8?B?TDNlZVkzUHZyRitzQmtpbWtBdnMrOEpQZnBkcG9KNjJ4RjN5OVYvcHFQbkNS?=
 =?utf-8?B?RjZKVGF5SWF2aVhWM25nbDVYdS9WMlRBZmNsTXM2N1g0cEVEY0Y2Mlp3OWNz?=
 =?utf-8?B?Rzd0blFSV05lNzJacThZK0lHc2dSVkhwemdibVN5dWpjOTZUQUJ4UUoxRFNv?=
 =?utf-8?B?VXZHWHFaTGxjY1p2b0pERFRNaWtYRnptQUcyOG1jUzFDSUZ2c2FJeUI3UFNi?=
 =?utf-8?B?d1p0MXhtZVJ3TytTMVQ1SDFNd2tqM2hYMFZGbWluWXRSa21pUWpQdDBjVzVm?=
 =?utf-8?B?QTVIZGdCSGtrSXJueEFXWE9QNGtsMko4WW5VOEtYd1VBTlYrNVh1cCtRSFM2?=
 =?utf-8?B?Ykg0WXAvWi8yS3lPZHJXZnl1Q0UzblZXbkFGRGVWcnk3TjhscDdGeDlTbE1y?=
 =?utf-8?B?bjFha3JkZnhURytNZndFdmlkQjd3Rm92Ym5ESGF3SGFtZmM2MGYyN2g0M3dp?=
 =?utf-8?B?by9OVWxoTzV0alNJTzZJU3ptRmdvdFFaeWMzUWpoSzYwa0FyWnd6ZDI1UFI5?=
 =?utf-8?B?S2d3MHpQRXFjMXMrRm9EUk9uUnk5dWtXM1NVV3FsMWV5Mmpjb2ZOcjZSalZw?=
 =?utf-8?B?M1FQaWFWZ2JoVDZXaFdhdEN5OGI1ZUlGOGttdGVUTGtZeTlzVGtQVzZtYi9S?=
 =?utf-8?B?ZHRFRkRSU2RpSk1aMDhXckRaMDg5UWh6QTRBS295Mll1WVE0NVp6SzdvRWls?=
 =?utf-8?B?VWM4ZTZWZTdtTk9aeHJTSnRHZ1FzeTdjSU8zNitlYzM0a0pQTWhVY3hoQity?=
 =?utf-8?B?OFQ5M3d3NnB0VzFrNy8zZms1MzNkTGV2L0JhSlBGWE9WaTg0WHpOKzU5Q3Jw?=
 =?utf-8?B?eWFBNjBmWERtS29wY1hNM3hIbUZaeWZWWEVwNnlxWU9adXZZeVlPTG56ZUc3?=
 =?utf-8?B?UjZhdklwMFBqeXp2S3FuMkg4bU9FZGV6NzhFc00rZEIzcW0wQy9idlRoejhP?=
 =?utf-8?B?aDlqZk9jUGxIY1hvd0kyWkxuRzduc1lPUngxRDhzVmZ2NTdtUHJEaFp6Y3VS?=
 =?utf-8?B?SUlsTnZML1lJTnN4czdUQmlTQVRrOGltVlJCSVRSUmJXOUQ3N1VnZXlrY0tV?=
 =?utf-8?B?dnhNRlNNUmVpTTEwN2Z1VjhIcno3a3NzbDNsYTZmSTdiWlZ6aWNmeU00eU51?=
 =?utf-8?Q?Vx3dHYBWftg8Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHlWNjJUVzlSL0JHYlZCSlhhREhTSHV5SC9GUVRyb1hWaEJjNlNLeWJBVHZv?=
 =?utf-8?B?eEVHMEFpTVBGTW04RFJZdHZPOERHTmUrSnV1YWpTUUVESDE2MCtmOWJDR0xz?=
 =?utf-8?B?UEg4MXQ0ODkrQVMrZUNNZkQ2cjl4VzJCa2lDU24wZlF3UnE5TXlnckYxMXJF?=
 =?utf-8?B?TXFmMFQzK1dYMDBJMG1sQ2xTejBKVkhvd0NhcUxHdWhGR2Q0MFV0ejNSWjhr?=
 =?utf-8?B?Sll4d2Y5T1poajBBRjg3VmtsTDQycEdpcXV3YWxPdXp0Q2Q5MDdRamhGMWRD?=
 =?utf-8?B?cllyelZJZDJXcEs4MGpBQ3FGbVVTaldhUjVJZ2R0d3VrK2FGakhKRHp5OENZ?=
 =?utf-8?B?d3IwNmc3VERKZ2xEcXlqdzJ6ZkNvcW5EMEVTUTYwZjlaemZzN09OREZVVVFq?=
 =?utf-8?B?djBUVVdBSFlZOU1YVy9xSG9DQWg5NnBKT28xZmZTci9CNUdydm0waUZGWHor?=
 =?utf-8?B?R1E1ZTI5YXF6NUVXVlM5OXRNajIzd3Zod2VvalQySmt2YW1VT2lKZnlOb0h5?=
 =?utf-8?B?SDRLUDFiYUlXRk5YZlRWMlRKYUR5T2cvSDRKOWoxbUlzMFRxMHpQaUFYQjRi?=
 =?utf-8?B?Ums3U0xkcXE3ckdiMVdlSmpzUDBDc0ZZMktOcGpDc1BkQmVGR1RHeVV3K2ZF?=
 =?utf-8?B?N1o2QXk1Vys0em5LbmF4QTlUNnV3dkNYVHRkYjc1aXgvc2dZaGgzTTNtNGha?=
 =?utf-8?B?ZlB3TlhzdlcxSE9vWXV2U0thV3c2NFFvaTdNeUtRZDhzbFk2SXpRMW1wc3Vr?=
 =?utf-8?B?UStzQ2RveHlKcWg0c0NYQ0ZFc3ZKZnF6Tk1JaFJ6VWpGWExDWUd2TWZoNlN4?=
 =?utf-8?B?YjgvZHBUdTJGd2dRbnVoZFdEaVhlOTlIL1RTZ1FSRWRRTUNKdStjTDEvTlFJ?=
 =?utf-8?B?eVJaYUcwM1pHUXI4eGJFRFZWb0RDRXF5WkZ1RlZkMGE5SUhFNE1obDVrRW5J?=
 =?utf-8?B?RUNWMTA4cmg4Q3FYZFNrcDk1WktJUHBJSlFQR3NmUXlQSFdtQy83WFcySUN6?=
 =?utf-8?B?Sm1wYStOZlV3ZytVd3l5Vi9oTXZUMnBIdnBDVzkvWG4zYU5PdjJVWVFTdFEw?=
 =?utf-8?B?N2hUU0Q3RDVsKzNUaG1NNktlZGZzRkJOTVpHcldXbmFOMnpyakE5b2d5VG9m?=
 =?utf-8?B?RGtRdmhJYVFiek14RzBXTE14eHZwSDFNb1dmaG5yYzFxeUxSM092T1hwY1Bs?=
 =?utf-8?B?TnJmdzR2NVlRaktTTFAxM2FudGkzdXZvNjk1alFBemhFalUyK3J6ZlZyeE5z?=
 =?utf-8?B?RWdrUlRSMUVscEdBZVB4VXZteVIwQkp6cmxrNFlSU1dMZWozZE05VjNxNlFR?=
 =?utf-8?B?eU5mdHR2bkxvZUkxY0tVSk1QYlMrRE9WNkxVN3M3d1VXZUhZL3RCTkFPZUZi?=
 =?utf-8?B?ZE9KVHQ2M25BNzdNUEFKT0NjN2hiUVNPcnJHT09OQ25CSVRiYmd6M1lpL29H?=
 =?utf-8?B?clJZMEFFRWhZclRnWU44b3hpd2hXYlVvL2FJV1NmNHpzVUxaVVZMKzNUb0VV?=
 =?utf-8?B?dkhSY2VZRWd2M1JGb05EYkhMc3VYL0YwaGhkbmlxc1g5aTUwUElpcHAvREgy?=
 =?utf-8?B?d0Z4encybG00dmZCRldWNnFSc1FsOExSY2FoRnJuOTJsUm5TZHdkcXkxQUps?=
 =?utf-8?B?RXpFUUFxcklZOE1SZlNqeWVBbTZSOVFxTWJoRWIyTHBoUTNJd2IwRzZhN2xy?=
 =?utf-8?B?elkvQXh5aFNBRWpLclZGWW9mdEZkRGRDUlB3TW1rODAxOGQydEJSNGMvbUxG?=
 =?utf-8?B?anZQM0lQM2dnc2RJbTc4RVI0Z3BSWFdnU3llQUJrL0JYZWdJcGlxV0VhWjFC?=
 =?utf-8?B?Um5PMEpSY1hRTlRYTlU1VmpxMTBBem9zY0VudnpXZnhBZzlETU5UckJ2WFJ4?=
 =?utf-8?B?M3JKNVZZbDFmNDloQVptZmRqaDFRQWd4dTdrUDR0ZVFLQlhvSXM0M2pLa0xv?=
 =?utf-8?B?VkpUN216RHVzV2xDU1FROGNpNWVOVWp5Qkc5bi9Fc2gxQzBrNGF5MDdRRkFZ?=
 =?utf-8?B?Y0UxZWdOUHdkWVFLL3haN3BaR2xGVEEvVWVkZGpwSjlPeHVEdWZvb3BYWjhG?=
 =?utf-8?B?cFZtNGt0TUtYSHgwTXJJenk5TGp5TEU5VjNKdU9VNUhuTXZHZmxBQXkzem9k?=
 =?utf-8?B?TVl5dkNjQkFWTEZyK1A1Mms3MzBRdCsxNjRQLytmNTBTZ1pDd2g4T2NQOW1G?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c062279e-8cee-4264-445a-08dd348d655a
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 11:20:05.4274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL5+G0MVjtANcHts3+9mavQSKzLoEmFTmfYmnzfK+VuIenEw69ccPLYctoLnRIcnq0EH8U/YnyqlIScAEsWjjMRdW2mue1piyg7p2o5JGl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8495


在 2025/1/14 16:16, Jiebing Chen 写道:
>
> 在 2025/1/13 22:31, Jerome Brunet 写道:
>> [ EXTERNAL EMAIL ]
>>
>> On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay 
>> <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>>
>>> From: jiebing chen <jiebing.chen@amlogic.com>
>>>
>>> Add audio support for Amlogic S4.The audio output pad
>>> can be freelycombined with the output lane,and the tocodec
>>> control logic has been optimized.
>> The patch is a mixture of different HW modules.
>>
>> Each patch should have one clear purpose and, as such, deal with a
>> single HW module
>>
>>> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
>>> ---
>>>   sound/soc/meson/Kconfig              |  16 ++
>>>   sound/soc/meson/Makefile             |   6 +
>>>   sound/soc/meson/s4-pad-out-control.c | 372 
>>> ++++++++++++++++++++++++++++++++++
>>>   sound/soc/meson/s4-tocodec-control.c | 376 
>>> +++++++++++++++++++++++++++++++++++
>>>   sound/soc/meson/t9015.c              |   5 +-
>>>   5 files changed, 771 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
>>> index 
>>> 6458d5dc4902f665211bb9e4ae7d274e4bff2fdc..d01e284642fd987cf4bdf88e5bf5f7c9a241af59 
>>> 100644
>>> --- a/sound/soc/meson/Kconfig
>>> +++ b/sound/soc/meson/Kconfig
>>> @@ -69,6 +69,8 @@ config SND_MESON_AXG_SOUND_CARD
>>>        imply SND_MESON_AXG_SPDIFIN
>>>        imply SND_MESON_AXG_PDM
>>>        imply SND_MESON_G12A_TOACODEC
>>> +     imply SND_SOC_MESON_PAD_OUT
>>> +     imply SND_SOC_MESON_TOCODEC_CONTROL
>>>        imply SND_MESON_G12A_TOHDMITX if DRM_MESON_DW_HDMI
>>>        help
>>>          Select Y or M to add support for the AXG SoC sound card
>>> @@ -135,4 +137,18 @@ config SND_SOC_MESON_T9015
>>>        help
>>>          Say Y or M if you want to add support for the internal DAC 
>>> found
>>>          on GXL, G12 and SM1 SoC family.
>>> +
>>> +config SND_SOC_MESON_PAD_OUT
>>> +     tristate "Amlogic PAD OUT"
>>> +     select REGMAP_MMIO
>>> +     help
>>> +       Say Y or M if you want to add support for the S4 Audio 
>>> Output from
>>> +       the data Pad.
>>> +
>>> +config SND_SOC_MESON_TOCODEC_CONTROL
>>> +     tristate "Amlogic TOCODEC CONTROL"
>>> +     select REGMAP_MMIO
>>> +     help
>>> +      Say Y or M if you want to add support for the internal DAC 
>>> control
>>> +      on SM1 SoC family.
>>>   endmenu
>>> diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
>>> index 
>>> 24078e4396b02d545d8ba4bcb1632979001354e3..afbefcb1313670f9b1365e88b8eb1a0badd7dc1e 
>>> 100644
>>> --- a/sound/soc/meson/Makefile
>>> +++ b/sound/soc/meson/Makefile
>>> @@ -24,8 +24,11 @@ snd-soc-meson-codec-glue-y := meson-codec-glue.o
>>>   snd-soc-meson-gx-sound-card-y := gx-card.o
>>>   snd-soc-meson-g12a-toacodec-y := g12a-toacodec.o
>>>   snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
>>> +snd-soc-meson-s4-padout-objs := s4-pad-out-control.o
>>> +snd-soc-meson-s4-tocodec-control-objs := s4-tocodec-control.o
>>>   snd-soc-meson-t9015-y := t9015.o
>>>
>>> +
>>>   obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
>>>   obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
>>>   obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
>>> @@ -43,4 +46,7 @@ obj-$(CONFIG_SND_MESON_CODEC_GLUE) += 
>>> snd-soc-meson-codec-glue.o
>>>   obj-$(CONFIG_SND_MESON_GX_SOUND_CARD) += 
>>> snd-soc-meson-gx-sound-card.o
>>>   obj-$(CONFIG_SND_MESON_G12A_TOACODEC) += 
>>> snd-soc-meson-g12a-toacodec.o
>>>   obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += 
>>> snd-soc-meson-g12a-tohdmitx.o
>>> +obj-$(CONFIG_SND_SOC_MESON_PAD_OUT) += snd-soc-meson-s4-padout.o
>>> +obj-$(CONFIG_SND_SOC_MESON_TOCODEC_CONTROL) += 
>>> snd-soc-meson-s4-tocodec-control.o
>>>   obj-$(CONFIG_SND_SOC_MESON_T9015) += snd-soc-meson-t9015.o
>>> +
>>> diff --git a/sound/soc/meson/s4-pad-out-control.c 
>>> b/sound/soc/meson/s4-pad-out-control.c
>>> new file mode 100644
>>> index 
>>> 0000000000000000000000000000000000000000..a86dcf8a5995926f0ddf8d2911f42006daed0feb
>>> --- /dev/null
>>> +++ b/sound/soc/meson/s4-pad-out-control.c
>>> @@ -0,0 +1,372 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>> +/*
>>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/regmap.h>
>>> +#include <sound/soc.h>
>>> +#include <sound/soc-dai.h>
>>> +#include <linux/init.h>
>>> +#include <linux/kernel.h>
>>> +#include<linux/kstrtox.h>
>>> +
>>> +#include "axg-tdm.h"
>>> +
>>> +static const struct regmap_config tdmout_pad_regmap_cfg = {
>>> +     .reg_bits       = 32,
>>> +     .val_bits       = 32,
>>> +     .reg_stride     = 4,
>>> +     .max_register   = 0x28,
>>> +};
>>> +
>>> +#define TDM_IFACE 0
>>> +#define TDM_A_PAD 0
>>> +#define TDM_B_PAD 1
>>> +#define TDM_C_PAD 2
>>> +
>>> +#define EE_AUDIO_DAT_PAD_CTRL6 0x0
>>> +#define EE_AUDIO_DAT_PAD_CTRL7 0x4
>>> +#define EE_AUDIO_DAT_PAD_CTRL8 0x8
>>> +#define EE_AUDIO_DAT_PAD_CTRL9 0xc
>>> +#define EE_AUDIO_DAT_PAD_CTRLA 0x10
>>> +#define EE_AUDIO_DAT_PAD_CTRLB 0x14
>>> +#define EE_AUDIO_DAT_PAD_CTRLC 0x1c
>>> +#define EE_AUDIO_DAT_PAD_CTRLD 0x20
>>> +#define EE_AUDIO_DAT_PAD_CTRLE 0x24
>>> +#define EE_AUDIO_DAT_PAD_CTRLF 0x28
>>> +
>>> +#define REG_OFFSET 4
>>> +
>>> +static const char * const s4_tdmout_sel_texts[] = {
>>> +     "TDM_D0", "TDM_D1", "TDM_D2", "TDM_D3", "TDM_D4", "TDM_D5", 
>>> "TDM_D6", "TDM_D7",
>>> +     "TDM_D8", "TDM_D9", "TDM_D10", "TDM_D11", "TDM_D12", 
>>> "TDM_D13", "TDM_D14", "TDM_D15",
>>> +     "TDM_D16", "TDM_D17", "TDM_D18", "TDM_D19", "TDM_D20", 
>>> "TDM_D21", "TDM_D22", "TDM_D23",
>>> +     "TDM_D24", "TDM_D25", "TDM_D26", "TDM_D27", "TDM_D28", 
>>> "TDM_D29", "TDM_D30", "TDM_D31"
>>> +};
>> This thing does not belong in ASoC. This is clearly yet another layer of
>> pinctrl. Please deal with it there.
>
> Thanks for your suggestion, add audio pinctrl driver to control the 
> which tdm_dx pin can map the which tdm lane_x
> for example
>     tdm_d6_pin {
>         mux {
>             groups = "tdm_d6";
>             function = "tdmoutb_lane0";
>         };
>     }
> tdm_d6 pin map the tdmoutb lane 0, right ?
>
>>> +
>>> +static const struct soc_enum tdmout_sel_enum =
>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tdmout_sel_texts),
>>> +                     s4_tdmout_sel_texts);
>>> +
>>> +static struct snd_soc_dai *tdm_get_ahead_be(struct 
>>> snd_soc_dapm_widget *w)
>>> +{
>>> +     struct snd_soc_dapm_path *p;
>>> +     struct snd_soc_dai *be;
>>> +
>>> +     snd_soc_dapm_widget_for_each_source_path(w, p) {
>>> +             if (p->source->id == snd_soc_dapm_dai_in)
>>> +                     return (struct snd_soc_dai *)p->source->priv;
>>> +             be = tdm_get_ahead_be(p->source);
>>> +             if (be && be->id == TDM_IFACE)
>>> +                     return be;
>>> +     }
>>> +     return NULL;
>>> +}
>>> +
>>> +#define SND_SOC_DAPM_DEMUX_E(wname, wreg, wshift, winvert, 
>>> wcontrols, \
>>> +     wevent, wflags) \
>>> +((struct snd_soc_dapm_widget) { \
>>> +     .id = snd_soc_dapm_demux, .name = wname, \
>>> +     SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
>>> +     .kcontrol_news = wcontrols, .num_kcontrols = 1, \
>>> +     .event = wevent, .event_flags = wflags})
>>> +
>>> +static const struct snd_kcontrol_new tdmout_sel_demux[] = {
>>> +     SOC_DAPM_ENUM("TDMOUTA SEL", tdmout_sel_enum),
>>> +     SOC_DAPM_ENUM("TDMOUTB SEL", tdmout_sel_enum),
>>> +     SOC_DAPM_ENUM("TDMOUTC SEL", tdmout_sel_enum),
>>> +};
>>> +
>>> +static unsigned int aml_simple_strtoull(const char *cp)
>>> +{
>>> +     unsigned int result = 0;
>>> +     unsigned int value = 0;
>>> +     unsigned int len =  strlen(cp);
>>> +
>>> +     while (len != 0) {
>>> +             len--;
>>> +             value = isdigit(*cp);
>>> +             if (value) {
>>> +                     value = *cp - '0';
>>> +             } else {
>>> +                     cp++;
>>> +                     continue;
>>> +             }
>>> +             cp++;
>>> +             result = result * 10 + value;
>>> +     }
>>> +     return result;
>>> +}
>>> +
>>> +static int tdm_out_pad_set(struct snd_soc_dapm_widget *w)
>>> +{
>>> +     struct snd_soc_dai *be;
>>> +     struct axg_tdm_stream *stream;
>>> +     struct snd_soc_component *component = 
>>> snd_soc_dapm_to_component(w->dapm);
>>> +     unsigned int tdm_id = TDM_A_PAD;
>>> +     const char *dai_widget_name;
>>> +     struct snd_soc_dapm_path *p;
>>> +     unsigned int lane_num = 0;
>>> +     unsigned long pin = 0;
>>> +     unsigned int reg, mask, val = 0;
>>> +     int lane_cnt;
>>> +
>>> +     be = tdm_get_ahead_be(w);
>>> +     if (!be) {
>>> +             dev_err(component->dev, "%s not find the be\n", 
>>> __func__);
>>> +             return -EINVAL;
>>> +     }
>>> +     stream = snd_soc_dai_dma_data_get_playback(be);
>>> +     if (!stream) {
>>> +             dev_err(component->dev, "%s not find the stream\n", 
>>> __func__);
>>> +             return -EINVAL;
>>> +     }
>>> +     lane_cnt = (stream->channels - 1) / stream->iface->slots + 1;
>>> +     /*we like to use dai id, but it is fixed val*/
>>> +     dai_widget_name = 
>>> be->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;
>>> +     if (strstr(dai_widget_name, "TDM_A"))
>>> +             tdm_id = TDM_A_PAD;
>>> +     else if (strstr(dai_widget_name, "TDM_B"))
>>> +             tdm_id = TDM_B_PAD;
>>> +     else if (strstr(dai_widget_name, "TDM_C"))
>>> +             tdm_id = TDM_C_PAD;
>>> +     else
>>> +             dev_err(component->dev, "%s not find the be dai 
>>> widget\n", __func__);
>>> +     dev_dbg(component->dev, "tdm_id:%d, channel:%d, slot:%d\n",
>>> +             tdm_id, stream->channels, stream->iface->slots);
>>> +     snd_soc_dapm_widget_for_each_sink_path(w, p) {
>>> +             if (p->sink->id == snd_soc_dapm_output) {
>>> +                     if (p->connect) {
>>> +                             pin = aml_simple_strtoull(p->name);
>>> +                             reg = (pin / 4) * REG_OFFSET;
>>> +                             /*calculate mask pos */
>>> +                             mask = 0x1f << ((pin % 4) * 8);
>>> +                             val = tdm_id * 8 + lane_num;
>>> + snd_soc_component_update_bits(component, reg, mask, val);
>>> + snd_soc_component_update_bits(component, EE_AUDIO_DAT_PAD_CTRLF,
>>> + 0x1 << pin, 0 << pin);
>>> +                             lane_num++;
>>> +                             if (lane_num > lane_cnt - 1)
>>> +                                     break;
>>> +                     }
>>> +             }
>>> +     }
>>> +     return 0;
>>> +}
>>> +
>>> +static int tdmout_sel_pad_event(struct snd_soc_dapm_widget *w,
>>> +                             struct snd_kcontrol *control,
>>> +                             int event)
>>> +{
>>> +     int ret = 0;
>>> +     struct snd_soc_component *component = 
>>> snd_soc_dapm_to_component(w->dapm);
>>> +
>>> +     switch (event) {
>>> +     case SND_SOC_DAPM_PRE_PMU:
>>> +             tdm_out_pad_set(w);
>>> +             break;
>>> +
>>> +     case SND_SOC_DAPM_PRE_PMD:
>>> +             break;
>>> +
>>> +     default:
>>> +             dev_err(component->dev, "Unexpected event %d\n", event);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static const struct snd_soc_dapm_widget 
>>> s4_tdmout_pad_dapm_widgets[] = {
>>> +     SND_SOC_DAPM_DEMUX_E("TDMA_OUT SEL", SND_SOC_NOPM, 0, 0,
>>> +                          &tdmout_sel_demux[TDM_A_PAD], 
>>> tdmout_sel_pad_event,
>>> +                        (SND_SOC_DAPM_PRE_PMU | 
>>> SND_SOC_DAPM_PRE_PMD)),
>>> +     SND_SOC_DAPM_DEMUX_E("TDMB_OUT SEL", SND_SOC_NOPM, 0, 0,
>>> +                          &tdmout_sel_demux[TDM_B_PAD], 
>>> tdmout_sel_pad_event,
>>> +                        (SND_SOC_DAPM_PRE_PMU | 
>>> SND_SOC_DAPM_PRE_PMD)),
>>> +     SND_SOC_DAPM_DEMUX_E("TDMC_OUT SEL", SND_SOC_NOPM, 0, 0,
>>> +                          &tdmout_sel_demux[TDM_C_PAD], 
>>> tdmout_sel_pad_event,
>>> +                        (SND_SOC_DAPM_PRE_PMU | 
>>> SND_SOC_DAPM_PRE_PMD)),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D0"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D1"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D2"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D3"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D4"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D5"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D6"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D7"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D8"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D9"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D10"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D11"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D12"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D13"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D14"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D15"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D16"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D17"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D18"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D19"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D20"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D21"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D22"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D23"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D24"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D25"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D26"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D27"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D28"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D29"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D30"),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_D31"),
>>> +};
>>> +
>>> +static const struct snd_soc_dapm_route s4_tdmout_pad_dapm_routes[] = {
>>> +     { "TDM_D0", "TDM_D0", "TDMA_OUT SEL" },
>>> +     { "TDM_D1", "TDM_D1", "TDMA_OUT SEL" },
>>> +     { "TDM_D2", "TDM_D2", "TDMA_OUT SEL" },
>>> +     { "TDM_D3", "TDM_D3", "TDMA_OUT SEL" },
>>> +     { "TDM_D4", "TDM_D4", "TDMA_OUT SEL" },
>>> +     { "TDM_D5", "TDM_D5", "TDMA_OUT SEL" },
>>> +     { "TDM_D6", "TDM_D6", "TDMA_OUT SEL" },
>>> +     { "TDM_D7", "TDM_D7", "TDMA_OUT SEL" },
>>> +     { "TDM_D8", "TDM_D8", "TDMA_OUT SEL" },
>>> +     { "TDM_D9", "TDM_D9", "TDMA_OUT SEL" },
>>> +     { "TDM_D10", "TDM_D10", "TDMA_OUT SEL" },
>>> +     { "TDM_D11", "TDM_D11", "TDMA_OUT SEL" },
>>> +     { "TDM_D12", "TDM_D12", "TDMA_OUT SEL" },
>>> +     { "TDM_D13", "TDM_D13", "TDMA_OUT SEL" },
>>> +     { "TDM_D14", "TDM_D14", "TDMA_OUT SEL" },
>>> +     { "TDM_D15", "TDM_D15", "TDMA_OUT SEL" },
>>> +     { "TDM_D16", "TDM_D16", "TDMA_OUT SEL" },
>>> +     { "TDM_D17", "TDM_D17", "TDMA_OUT SEL" },
>>> +     { "TDM_D18", "TDM_D18", "TDMA_OUT SEL" },
>>> +     { "TDM_D19", "TDM_D19", "TDMA_OUT SEL" },
>>> +     { "TDM_D20", "TDM_D20", "TDMA_OUT SEL" },
>>> +     { "TDM_D21", "TDM_D21", "TDMA_OUT SEL" },
>>> +     { "TDM_D22", "TDM_D22", "TDMA_OUT SEL" },
>>> +     { "TDM_D23", "TDM_D23", "TDMA_OUT SEL" },
>>> +     { "TDM_D24", "TDM_D24", "TDMA_OUT SEL" },
>>> +     { "TDM_D25", "TDM_D25", "TDMA_OUT SEL" },
>>> +     { "TDM_D26", "TDM_D26", "TDMA_OUT SEL" },
>>> +     { "TDM_D27", "TDM_D27", "TDMA_OUT SEL" },
>>> +     { "TDM_D28", "TDM_D28", "TDMA_OUT SEL" },
>>> +     { "TDM_D29", "TDM_D29", "TDMA_OUT SEL" },
>>> +     { "TDM_D30", "TDM_D30", "TDMA_OUT SEL" },
>>> +     { "TDM_D31", "TDM_D31", "TDMA_OUT SEL" },
>>> +     { "TDM_D0", "TDM_D0", "TDMB_OUT SEL" },
>>> +     { "TDM_D1", "TDM_D1", "TDMB_OUT SEL" },
>>> +     { "TDM_D2", "TDM_D2", "TDMB_OUT SEL" },
>>> +     { "TDM_D3", "TDM_D3", "TDMB_OUT SEL" },
>>> +     { "TDM_D4", "TDM_D4", "TDMB_OUT SEL" },
>>> +     { "TDM_D5", "TDM_D5", "TDMB_OUT SEL" },
>>> +     { "TDM_D6", "TDM_D6", "TDMB_OUT SEL" },
>>> +     { "TDM_D7", "TDM_D7", "TDMB_OUT SEL" },
>>> +     { "TDM_D8", "TDM_D8", "TDMB_OUT SEL" },
>>> +     { "TDM_D9", "TDM_D9", "TDMB_OUT SEL" },
>>> +     { "TDM_D10", "TDM_D10", "TDMB_OUT SEL" },
>>> +     { "TDM_D11", "TDM_D11", "TDMB_OUT SEL" },
>>> +     { "TDM_D12", "TDM_D12", "TDMB_OUT SEL" },
>>> +     { "TDM_D13", "TDM_D13", "TDMB_OUT SEL" },
>>> +     { "TDM_D14", "TDM_D14", "TDMB_OUT SEL" },
>>> +     { "TDM_D15", "TDM_D15", "TDMB_OUT SEL" },
>>> +
>>> +     { "TDM_D16", "TDM_D16", "TDMB_OUT SEL" },
>>> +     { "TDM_D17", "TDM_D17", "TDMB_OUT SEL" },
>>> +     { "TDM_D18", "TDM_D18", "TDMB_OUT SEL" },
>>> +     { "TDM_D19", "TDM_D19", "TDMB_OUT SEL" },
>>> +     { "TDM_D20", "TDM_D20", "TDMB_OUT SEL" },
>>> +     { "TDM_D21", "TDM_D21", "TDMB_OUT SEL" },
>>> +     { "TDM_D22", "TDM_D22", "TDMB_OUT SEL" },
>>> +     { "TDM_D23", "TDM_D23", "TDMB_OUT SEL" },
>>> +     { "TDM_D24", "TDM_D24", "TDMB_OUT SEL" },
>>> +     { "TDM_D25", "TDM_D25", "TDMB_OUT SEL" },
>>> +     { "TDM_D26", "TDM_D26", "TDMB_OUT SEL" },
>>> +     { "TDM_D27", "TDM_D27", "TDMB_OUT SEL" },
>>> +     { "TDM_D28", "TDM_D28", "TDMB_OUT SEL" },
>>> +     { "TDM_D29", "TDM_D29", "TDMB_OUT SEL" },
>>> +     { "TDM_D30", "TDM_D30", "TDMB_OUT SEL" },
>>> +     { "TDM_D31", "TDM_D31", "TDMB_OUT SEL" },
>>> +     { "TDM_D0", "TDM_D0", "TDMC_OUT SEL" },
>>> +     { "TDM_D1", "TDM_D1", "TDMC_OUT SEL" },
>>> +     { "TDM_D2", "TDM_D2", "TDMC_OUT SEL" },
>>> +     { "TDM_D3", "TDM_D3", "TDMC_OUT SEL" },
>>> +     { "TDM_D4", "TDM_D4", "TDMC_OUT SEL" },
>>> +     { "TDM_D5", "TDM_D5", "TDMC_OUT SEL" },
>>> +     { "TDM_D6", "TDM_D6", "TDMC_OUT SEL" },
>>> +     { "TDM_D7", "TDM_D7", "TDMC_OUT SEL" },
>>> +     { "TDM_D8", "TDM_D8", "TDMC_OUT SEL" },
>>> +     { "TDM_D9", "TDM_D9", "TDMC_OUT SEL" },
>>> +     { "TDM_D10", "TDM_D10", "TDMC_OUT SEL" },
>>> +     { "TDM_D11", "TDM_D11", "TDMC_OUT SEL" },
>>> +     { "TDM_D12", "TDM_D12", "TDMC_OUT SEL" },
>>> +     { "TDM_D13", "TDM_D13", "TDMC_OUT SEL" },
>>> +     { "TDM_D14", "TDM_D14", "TDMC_OUT SEL" },
>>> +     { "TDM_D15", "TDM_D15", "TDMC_OUT SEL" },
>>> +     { "TDM_D16", "TDM_D16", "TDMC_OUT SEL" },
>>> +     { "TDM_D17", "TDM_D17", "TDMC_OUT SEL" },
>>> +     { "TDM_D18", "TDM_D18", "TDMC_OUT SEL" },
>>> +     { "TDM_D19", "TDM_D19", "TDMC_OUT SEL" },
>>> +     { "TDM_D20", "TDM_D20", "TDMC_OUT SEL" },
>>> +     { "TDM_D21", "TDM_D21", "TDMC_OUT SEL" },
>>> +     { "TDM_D22", "TDM_D22", "TDMC_OUT SEL" },
>>> +     { "TDM_D23", "TDM_D23", "TDMC_OUT SEL" },
>>> +     { "TDM_D24", "TDM_D24", "TDMC_OUT SEL" },
>>> +     { "TDM_D25", "TDM_D25", "TDMC_OUT SEL" },
>>> +     { "TDM_D26", "TDM_D26", "TDMC_OUT SEL" },
>>> +     { "TDM_D27", "TDM_D27", "TDMC_OUT SEL" },
>>> +     { "TDM_D28", "TDM_D28", "TDMC_OUT SEL" },
>>> +     { "TDM_D29", "TDM_D29", "TDMC_OUT SEL" },
>>> +     { "TDM_D30", "TDM_D30", "TDMC_OUT SEL" },
>>> +     { "TDM_D31", "TDM_D31", "TDMC_OUT SEL" },
>>> +};
>>> +
>>> +static const struct snd_soc_component_driver 
>>> s4_tdmout_pad_component_drv = {
>>> +     .dapm_widgets           = s4_tdmout_pad_dapm_widgets,
>>> +     .num_dapm_widgets       = ARRAY_SIZE(s4_tdmout_pad_dapm_widgets),
>>> +     .dapm_routes            = s4_tdmout_pad_dapm_routes,
>>> +     .num_dapm_routes        = ARRAY_SIZE(s4_tdmout_pad_dapm_routes),
>>> +
>>> +};
>>> +
>>> +static const struct of_device_id s4_tdmout_pad_of_match[] = {
>>> +     {
>>> +             .compatible = "amlogic,s4-tdmout-pad",
>>> +     }, {}
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, s4_tdmout_pad_of_match);
>>> +
>>> +static int tdm_pad_out_probe(struct platform_device *pdev)
>>> +{
>>> +     struct device *dev = &pdev->dev;
>>> +     struct regmap *map;
>>> +     void __iomem *regs;
>>> +
>>> +     regs = devm_platform_ioremap_resource(pdev, 0);
>>> +     if (IS_ERR(regs))
>>> +             return PTR_ERR(regs);
>>> +
>>> +     map = devm_regmap_init_mmio(dev, regs, &tdmout_pad_regmap_cfg);
>>> +     if (IS_ERR(map))
>>> +             return dev_err_probe(dev, PTR_ERR(map), "failed to 
>>> init regmap\n");
>>> +
>>> +     return devm_snd_soc_register_component(dev, 
>>> &s4_tdmout_pad_component_drv,
>>> +                                            NULL, 0);
>>> +}
>>> +
>>> +static struct platform_driver tdmout_pad_pdrv = {
>>> +     .probe = tdm_pad_out_probe,
>>> +     .driver = {
>>> +             .name = "s4-pad-out",
>>> +             .of_match_table = s4_tdmout_pad_of_match,
>>> +     },
>>> +};
>>> +
>>> +module_platform_driver(tdmout_pad_pdrv);
>>> +
>>> +MODULE_DESCRIPTION("Amlogic TDM PAD DRIVER");
>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/sound/soc/meson/s4-tocodec-control.c 
>>> b/sound/soc/meson/s4-tocodec-control.c
>>> new file mode 100644
>>> index 
>>> 0000000000000000000000000000000000000000..e5d824fae0eba545d38dc36e2566e7cee590e7f5
>>> --- /dev/null
>>> +++ b/sound/soc/meson/s4-tocodec-control.c
>> There is already a to-acodec driver a not reason has been provided as 
>> to why a
>> completly new driver is required.
>>
>> Please have look at the existing driver and do try to use it.
>> If you need to do things so differently, clear justification are 
>> necessary.
>
> for g12a-toacodec.c, we find the tocodec clock source can't get 
> the clock id from the tdm Be device,
>
> and set it by the kcontrol from user,  For different soc chips, The 
> kcontrol value maybe different, The kcontrol configuration doesn't 
> look very friendly for user
>
> so we use dapm route path to manage it, 
> fe(fddr)->be(tdm)->(tocodec)->(codec),  and use the aux-devs to 
> register,  and sound card only include the
>
> sound-dai = <&tdmif_a>
>
> codec-0 {
>                 sound-dai = <&acodec>;
>  };
>
> and not include
>
> codec-1 {
>                 sound-dai = <&toacodec>;
>  };
>
> when tdm work, only connect the tocodec path
>
>  "TDM_A Playback" ->"TOACODEC TDMA"->"TOACODEC INPUT SRC"
>
> iterate it find the be device ,and get the struct axg_tdm_stream, so 
> we can get the tdm clock id
>
> Take into account behavioral differences, we add new tocodec driver 
> for s4
>
>>> @@ -0,0 +1,376 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>> +/*
>>> + * Copyright (C) 2023 Amlogic, Inc. All rights reserved
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/regmap.h>
>>> +#include <sound/soc.h>
>>> +#include <sound/soc-dai.h>
>>> +#include <linux/init.h>
>>> +#include <linux/kernel.h>
>>> +#include<linux/kstrtox.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/reset.h>
>>> +#include "axg-tdm.h"
>>> +
>>> +#define TOACODEC_CTRL0                       0x0
>>> +
>>> +#define CTRL0_ENABLE_SHIFT           31
>>> +#define CTRL0_BCLK_ENABLE_SHIFT              30
>>> +#define CTRL0_MCLK_ENABLE_SHIFT              29
>>> +#define CTRL0_BLK_CAP_INV_SHIFT              9
>>> +
>>> +#define TDM_IFACE 0
>>> +#define TDM_A_PAD 0
>>> +#define TDM_B_PAD 1
>>> +#define TDM_C_PAD 2
>>> +
>>> +struct toacodec {
>>> +     struct regmap_field *field_dat_sel;
>>> +     struct regmap_field *field_lrclk_sel;
>>> +     struct regmap_field *field_bclk_sel;
>>> +     struct regmap_field *field_mclk_sel;
>>> +};
>>> +
>>> +struct toacodec_match_data {
>>> +     const struct snd_soc_component_driver *component_drv;
>>> +     const struct reg_field field_dat_sel;
>>> +     const struct reg_field field_lrclk_sel;
>>> +     const struct reg_field field_bclk_sel;
>>> +     const struct reg_field field_mclk_sel;
>>> +};
>>> +
>>> +static const struct regmap_config tocodec_regmap_cfg = {
>>> +     .reg_bits       = 32,
>>> +     .val_bits       = 32,
>>> +     .reg_stride     = 4,
>>> +     .max_register   = 0x1,
>>> +};
>>> +
>>> +#define S4_LANE_OFFSET 8
>>> +
>>> +static const char * const s4_tocodec_lane_sel_texts[] = {
>>> +     "Lane0", "Lane1", "Lane2", "Lane3", "Lane4", "Lane5", "Lane6", 
>>> "Lane7"
>>> +};
>>> +
>>> +static const struct soc_enum s4_tocodec_lane_sel_enum =
>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 
>>> ARRAY_SIZE(s4_tocodec_lane_sel_texts),
>>> +                     s4_tocodec_lane_sel_texts);
>>> +
>>> +static const struct snd_kcontrol_new s4_tocodec_lane_sel =
>>> +     SOC_DAPM_ENUM("TOCODEC LANE SEL", s4_tocodec_lane_sel_enum);
>>> +
>>> +static const char * const s4_tocodec_src_sel_texts[] = {
>>> +     "TDMA", "TDMB", "TDMC"
>>> +};
>>> +
>>> +static const struct soc_enum s4_tocodec_src_sel_enum =
>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 
>>> ARRAY_SIZE(s4_tocodec_src_sel_texts),
>>> +                     s4_tocodec_src_sel_texts);
>>> +
>>> +static const struct snd_kcontrol_new s4_tocodec_src_sel =
>>> +     SOC_DAPM_ENUM("TOCODEC SEL", s4_tocodec_src_sel_enum);
>>> +
>>> +static const struct snd_kcontrol_new s4_toacodec_out_enable =
>>> +     SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>>> +                                 CTRL0_ENABLE_SHIFT, 1, 0);
>>> +
>>> +static struct snd_soc_dai *tocodec_tdm_get_ahead_be(struct 
>>> snd_soc_dapm_widget *w)
>>> +{
>>> +     struct snd_soc_dapm_path *p;
>>> +     struct snd_soc_dai *be;
>>> +
>>> +     snd_soc_dapm_widget_for_each_source_path(w, p) {
>>> +             if (!p->connect)
>>> +                     continue;
>>> +             if (p->source->id == snd_soc_dapm_dai_in)
>>> +                     return (struct snd_soc_dai *)p->source->priv;
>>> +             be = tocodec_tdm_get_ahead_be(p->source);
>>> +             if (be && be->id == TDM_IFACE)
>>> +                     return be;
>>> +     }
>>> +     return NULL;
>>> +}
>>> +
>>> +static unsigned int aml_simple_strtoull(const char *cp)
>>> +{
>>> +     unsigned int result = 0;
>>> +     unsigned int value = 0;
>>> +     unsigned int len = strlen(cp);
>>> +
>>> +     while (len != 0) {
>>> +             len--;
>>> +             value = isdigit(*cp);
>>> +             if (value) {
>>> +                     value = *cp - '0';
>>> +             } else {
>>> +                     cp++;
>>> +                     continue;
>>> +             }
>>> +             cp++;
>>> +             result = result * 10 + value;
>>> +     }
>>> +     return result;
>>> +}
>>> +
>>> +static int aml_get_clk_id(const char *name)
>>> +{
>>> +     int clk_id = 0;
>>> +
>>> +     if (strstr(name, "mst_a"))
>>> +             clk_id = 0;
>>> +     else if (strstr(name, "mst_b"))
>>> +             clk_id = 1;
>>> +     else if (strstr(name, "mst_c"))
>>> +             clk_id = 2;
>>> +     else if (strstr(name, "mst_d"))
>>> +             clk_id = 3;
>>> +     else if (strstr(name, "mst_e"))
>>> +             clk_id = 4;
>>> +     else if (strstr(name, "mst_f"))
>>> +             clk_id = 5;
>>> +
>>> +     return clk_id;
>>> +}
>>> +
>>> +static int aml_tocodec_sel_set(struct snd_soc_dapm_widget *w)
>>> +{
>>> +     struct snd_soc_dai *be;
>>> +     struct axg_tdm_stream *stream;
>>> +     struct axg_tdm_iface *iface;
>>> +     struct snd_soc_component *component = 
>>> snd_soc_dapm_to_component(w->dapm);
>>> +     struct toacodec *priv = snd_soc_component_get_drvdata(component);
>>> +     unsigned int tdm_id = TDM_A_PAD;
>>> +     const char *dai_widget_name;
>>> +     struct snd_soc_dapm_path *p;
>>> +     unsigned int lane = 0;
>>> +     unsigned int val = 0;
>>> +     struct clk *sclk, *mclk;
>>> +     char *clk_name;
>>> +     int mclk_id, sclk_id;
>>> +
>>> +     be = tocodec_tdm_get_ahead_be(w);
>>> +     if (!be) {
>>> +             dev_err(component->dev, "%s not find the be\n", 
>>> __func__);
>>> +             return -EINVAL;
>>> +     }
>>> +     stream = snd_soc_dai_dma_data_get_playback(be);
>>> +     if (!stream) {
>>> +             dev_err(component->dev, "%s not find the stream\n", 
>>> __func__);
>>> +             return -EINVAL;
>>> +     }
>>> +     /*we like to use dai id, but it is fixed val*/
>>> +     dai_widget_name = 
>>> be->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;
>>> +     if (strstr(dai_widget_name, "TDM_A"))
>>> +             tdm_id = TDM_A_PAD;
>>> +     else if (strstr(dai_widget_name, "TDM_B"))
>>> +             tdm_id = TDM_B_PAD;
>>> +     else if (strstr(dai_widget_name, "TDM_C"))
>>> +             tdm_id = TDM_C_PAD;
>>> +     snd_soc_dapm_widget_for_each_source_path(w, p) {
>>> +             if (p->connect && p->name) {
>>> +                     lane = aml_simple_strtoull(p->name);
>>> +                     val = lane + tdm_id * S4_LANE_OFFSET;
>>> + regmap_field_write(priv->field_dat_sel, val);
>>> +             }
>>> +     }
>>> +     iface = stream->iface;
>>> +     mclk = iface->mclk;
>>> +     sclk = iface->sclk;
>>> +     mclk_id = aml_get_clk_id(__clk_get_name(mclk));
>>> +     sclk_id = aml_get_clk_id(__clk_get_name(sclk));
>>> +     regmap_field_write(priv->field_mclk_sel, mclk_id);
>>> +     regmap_field_write(priv->field_bclk_sel, sclk_id);
>>> +     regmap_field_write(priv->field_lrclk_sel, sclk_id);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int tocodec_sel_event(struct snd_soc_dapm_widget *w,
>>> +                          struct snd_kcontrol *control,
>>> +                          int event)
>>> +{
>>> +     struct snd_soc_component *component = 
>>> snd_soc_dapm_to_component(w->dapm);
>>> +     int ret = 0;
>>> +
>>> +     switch (event) {
>>> +     case SND_SOC_DAPM_PRE_PMU:
>>> +             ret = aml_tocodec_sel_set(w);
>>> +             break;
>>> +
>>> +     case SND_SOC_DAPM_PRE_PMD:
>>> +             break;
>>> +
>>> +     default:
>>> +             dev_err(component->dev, "Unexpected event %d\n", event);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int tocodec_clk_enable(struct snd_soc_dapm_widget *w,
>>> +                           struct snd_kcontrol *control,
>>> +                           int event)
>>> +{
>>> +     int ret = 0;
>>> +     unsigned int mask = 0, val = 0;
>>> +     struct snd_soc_component *component = 
>>> snd_soc_dapm_to_component(w->dapm);
>>> +
>>> +     snd_soc_component_update_bits(component, TOACODEC_CTRL0,
>>> +                                   1 << CTRL0_BLK_CAP_INV_SHIFT, 1 
>>> << CTRL0_BLK_CAP_INV_SHIFT);
>>> +     switch (event) {
>>> +     case SND_SOC_DAPM_PRE_PMU:
>>> +             mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << 
>>> CTRL0_BCLK_ENABLE_SHIFT;
>>> +             val = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << 
>>> CTRL0_BCLK_ENABLE_SHIFT;
>>> +             snd_soc_component_update_bits(component, 
>>> TOACODEC_CTRL0, mask, val);
>>> +             break;
>>> +     case SND_SOC_DAPM_PRE_PMD:
>>> +             mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << 
>>> CTRL0_BCLK_ENABLE_SHIFT;
>>> +             val = 0 << CTRL0_MCLK_ENABLE_SHIFT | 0 << 
>>> CTRL0_BCLK_ENABLE_SHIFT;
>>> +             snd_soc_component_update_bits(component, 
>>> TOACODEC_CTRL0, mask, val);
>>> +             break;
>>> +     default:
>>> +             dev_err(component->dev, "Unexpected event %d\n", event);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
>>> +     SND_SOC_DAPM_MUX_E("Lane SRC", SND_SOC_NOPM, 0, 0,
>>> +                        &s4_tocodec_lane_sel, tocodec_sel_event,
>>> +                        (SND_SOC_DAPM_PRE_PMU | 
>>> SND_SOC_DAPM_PRE_PMD)),
>>> +     SND_SOC_DAPM_MUX("INPUT SRC", SND_SOC_NOPM, 0, 0, 
>>> &s4_tocodec_src_sel),
>>> +     SND_SOC_DAPM_SWITCH_E("OUT EN", SND_SOC_NOPM, 0, 0,
>>> +                           &s4_toacodec_out_enable, 
>>> tocodec_clk_enable,
>>> +                             (SND_SOC_DAPM_PRE_PMU | 
>>> SND_SOC_DAPM_PRE_PMD)),
>>> +     SND_SOC_DAPM_AIF_IN("TDMA", NULL, 0, SND_SOC_NOPM, 0, 0),
>>> +     SND_SOC_DAPM_AIF_IN("TDMB", NULL, 0, SND_SOC_NOPM, 0, 0),
>>> +     SND_SOC_DAPM_AIF_IN("TDMC", NULL, 0, SND_SOC_NOPM, 0, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane0", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane1", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane2", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane3", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane4", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane5", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane6", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane7", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_TO_ACODEC"),
>>> +};
>>> +
>>> +static const struct snd_soc_dapm_route s4_tocodec_dapm_routes[] = {
>>> +     { "INPUT SRC", "TDMA", "TDMA"},
>>> +     { "INPUT SRC", "TDMB", "TDMB"},
>>> +     { "INPUT SRC", "TDMC", "TDMC"},
>>> +     { "Lane0", NULL, "INPUT SRC" },
>>> +     { "Lane1", NULL, "INPUT SRC"},
>>> +     { "Lane2", NULL, "INPUT SRC"},
>>> +     { "Lane3", NULL, "INPUT SRC"},
>>> +     { "Lane4", NULL, "INPUT SRC"},
>>> +     { "Lane5", NULL, "INPUT SRC"},
>>> +     { "Lane6", NULL, "INPUT SRC"},
>>> +     { "Lane7", NULL, "INPUT SRC"},
>>> +     { "Lane SRC", "Lane0", "Lane0"},
>>> +     { "Lane SRC", "Lane1", "Lane1"},
>>> +     { "Lane SRC", "Lane2", "Lane2"},
>>> +     { "Lane SRC", "Lane3", "Lane3"},
>>> +     { "Lane SRC", "Lane4", "Lane4"},
>>> +     { "Lane SRC", "Lane5", "Lane5"},
>>> +     { "Lane SRC", "Lane6", "Lane6"},
>>> +     { "Lane SRC", "Lane7", "Lane7"},
>>> +     { "OUT EN", "Switch", "Lane SRC"},
>>> +     { "TDM_TO_ACODEC", NULL, "OUT EN"},
>>> +
>>> +};
>>> +
>>> +static const struct snd_soc_component_driver 
>>> s4_tocodec_component_drv = {
>>> +     .dapm_widgets           = s4_toacodec_widgets,
>>> +     .num_dapm_widgets       = ARRAY_SIZE(s4_toacodec_widgets),
>>> +     .dapm_routes            = s4_tocodec_dapm_routes,
>>> +     .num_dapm_routes        = ARRAY_SIZE(s4_tocodec_dapm_routes),
>>> +};
>>> +
>>> +static const struct toacodec_match_data s4_toacodec_match_data = {
>>> +     .component_drv  = &s4_tocodec_component_drv,
>>> +     .field_dat_sel  = REG_FIELD(TOACODEC_CTRL0, 16, 20),
>>> +     .field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
>>> +     .field_bclk_sel = REG_FIELD(TOACODEC_CTRL0, 4, 6),
>>> +     .field_mclk_sel = REG_FIELD(TOACODEC_CTRL0, 0, 2),
>>> +};
>>> +
>>> +static const struct of_device_id s4_tocodec_of_match[] = {
>>> +     {
>>> +             .compatible = "amlogic,s4-tocodec",
>>> +             .data = &s4_toacodec_match_data,
>>> +     }, {}
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, s4_tocodec_of_match);
>>> +
>>> +static int tocodec_probe(struct platform_device *pdev)
>>> +{
>>> +     const struct toacodec_match_data *data;
>>> +     struct device *dev = &pdev->dev;
>>> +     struct toacodec *priv;
>>> +     void __iomem *regs;
>>> +     struct regmap *map;
>>> +     int ret;
>>> +
>>> +     data = device_get_match_data(dev);
>>> +     if (!data)
>>> +             return dev_err_probe(dev, -ENODEV, "failed to match 
>>> device\n");
>>> +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     platform_set_drvdata(pdev, priv);
>>> +
>>> +     ret = device_reset(dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     regs = devm_platform_ioremap_resource(pdev, 0);
>>> +     if (IS_ERR(regs))
>>> +             return PTR_ERR(regs);
>>> +
>>> +     map = devm_regmap_init_mmio(dev, regs, &tocodec_regmap_cfg);
>>> +     if (IS_ERR(map))
>>> +             return dev_err_probe(dev, PTR_ERR(map), "failed to 
>>> init regmap\n");
>>> +
>>> +     priv->field_dat_sel = devm_regmap_field_alloc(dev, map, 
>>> data->field_dat_sel);
>>> +     if (IS_ERR(priv->field_dat_sel))
>>> +             return PTR_ERR(priv->field_dat_sel);
>>> +
>>> +     priv->field_lrclk_sel = devm_regmap_field_alloc(dev, map, 
>>> data->field_lrclk_sel);
>>> +     if (IS_ERR(priv->field_lrclk_sel))
>>> +             return PTR_ERR(priv->field_lrclk_sel);
>>> +
>>> +     priv->field_bclk_sel = devm_regmap_field_alloc(dev, map, 
>>> data->field_bclk_sel);
>>> +     if (IS_ERR(priv->field_bclk_sel))
>>> +             return PTR_ERR(priv->field_bclk_sel);
>>> +
>>> +     priv->field_mclk_sel = devm_regmap_field_alloc(dev, map, 
>>> data->field_mclk_sel);
>>> +     if (IS_ERR(priv->field_mclk_sel))
>>> +             return PTR_ERR(priv->field_mclk_sel);
>>> +
>>> +     return devm_snd_soc_register_component(dev,
>>> +                     data->component_drv, NULL, 0);
>>> +}
>>> +
>>> +static struct platform_driver tocodec_pdrv = {
>>> +     .probe = tocodec_probe,
>>> +     .driver = {
>>> +             .name = "s4-tocodec",
>>> +             .of_match_table = s4_tocodec_of_match,
>>> +     },
>>> +};
>>> +
>>> +module_platform_driver(tocodec_pdrv);
>>> +
>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>> index 
>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e03d953586648 
>>> 100644
>>> --- a/sound/soc/meson/t9015.c
>>> +++ b/sound/soc/meson/t9015.c
>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai = {
>>>                .channels_min = 1,
>>>                .channels_max = 2,
>>>                .rates = SNDRV_PCM_RATE_8000_96000,
>>> -             .formats = (SNDRV_PCM_FMTBIT_S8 |
>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>> -                         SNDRV_PCM_FMTBIT_S24_LE),
>>> +             .formats = (SNDRV_PCM_FMTBIT_S16_LE | 
>>> SNDRV_PCM_FMTBIT_S32_LE),
>> Again, mixed up changes with zero justification.
>>
>> This drops S8 and S16 format support for the existing SoCs (such as GXL)
>> which is known to work and add S32 support on an HW documented as 24bits
>> only. Can you explain ?

for g12a, sm1 etc, it is use new audio ip, GXL is old ip, the new ip not 
support 24 bit,

usually support 16/32 bit for new audio ip , for 
SNDRV_PCM_FMTBIT_S24_LE, it width =24, phy =32

it was  treated as 32 bit to send for tdm, so we can only add the S32LE 
base on it , right ? but if the gxl not support the 32bit

we need add new snd_soc_dai_driver t9015_dai_s4 ?

>>
>>>        },
>>>        .ops = &t9015_dai_ops,
>>>   };
>> -- 
>> Jerome
