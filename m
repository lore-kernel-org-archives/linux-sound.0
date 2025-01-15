Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020135.outbound.protection.outlook.com [52.101.128.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EE61E98F7;
	Wed, 15 Jan 2025 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941662; cv=fail; b=pUxnNaCrLTBQfXpP8cokNOxVnTUOtdiU5EhABCRwsgjapS+L9ebK7QW9RKWbRLLBwhcVFNAE9bh2Qoq9eGMC18UQ/qn4eDcV7YaMQypjeSphxZGQlWSIRBw/2wOSGPzYe3hgy1avziW0CM64yalYiyuz09l2B2ODqR9RL9nsJCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941662; c=relaxed/simple;
	bh=YbDRJYquThah9gNbkrG6w9pdrA4yaVOBjlgZCzuVXME=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JfrcykRuIufniRoc9sVDuyBU+Sa28d+eXBZoEJqPihrai/JjXoy88eXYBr1JI0nvB3APrpaceqwJLBJkEgrQZhxhtp13k6KUxOz8HbMLu64kSQagJxRe1dklYfHvYh4SemonU4X/SInybmGvo0b58ZmST7+/QZrosVgIF0kebmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=AH5RlOjr; arc=fail smtp.client-ip=52.101.128.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="AH5RlOjr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHcd2TDGYB6tK6vB3nuijlfm8zzkV+7O0iWpFl5vI2wNoRjl+c61glTrGf1lAOvykjMVyZYfH4C6YFpYdo9AHM0W7WGLrHFmtz50I4SgI1nafmYsEXiIhZrVElejEvSpYmcE7l60VxK4LV1kAp4uBqM3xUwMgZ0ROSYvNG7yHzQe85s2+F8m8Lhxyw5ENJYWyKDzwiFklExwfFBeWtQp4Bd7y+cHGAcPNhkfkltvcguyanPgc90vezbsuZR653t0phJ2Izq3EtTwRUM3dn52wUizgF6smud6djTdhqeQ581MQ/63aXNTdEj8EPBybW3gGH3kmpx4B3LLs6PS0xVxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uUbNfzpqxPt1PcWrOpI2ALqgDvkaqQWav9w9/zNJho=;
 b=YMvjsfUP7BrekJhh3QzqveySkI/4hewQppL1UORIG/wa+SOzfb2YXez+LD6Fz6eyGsZYg+lsheERITaUBSmy0WgEQoN7CYk6LftV9DQ7Z1rns53jBLAQQuTDC51dAMvqEy/oRCw7iYSoXI6GVbJHfHvXFf+sUNVva8QbwlvhuBI/FsSTWSpolA7H+bdeM65RzVHDCQ3oZ097W0SuLoIWFhPaFrI6hMDgmzuUfTpmGvJXq8qDmTxmdmLxb7Q4rGmkfTD/orKL9HgD0o370cCOjiKvB0DUo8bx54ME06er9zVXRYlnlp/Vqf7WCYi6btZnVo4UhnihQLXKQtXJjsEVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uUbNfzpqxPt1PcWrOpI2ALqgDvkaqQWav9w9/zNJho=;
 b=AH5RlOjr0UpADF2vubFDxS5ytAXlyNDjvbONcYDi0Om0Qxicb08R/ZeOmGrYssickKbMoAzm2zi9VZOYJ+tbKGRYNV3PkMoYPVYTiI9GeJqnFgmzUWAInf4nppUM9Zql12IOz+NFyxEQ5b8FU2Hf5C55EyPErghQfDahmoiVu2vPdl2qS72NZJBEjf3j3uzcJwN/UJ/fG3EY6K3MZemVmYL41nDiHH7M/pzXvqldH8WjQbFNYqsffzuYfXZKxF+pHl9p3vXY2Z+jGJZTx/kfhXFTqJXh10mk6iAtqE2L5XoOw4QygaHDOzxBRoHwyvZvSbip+blUwCSRTLiEUI1Lyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by TYZPR03MB8557.apcprd03.prod.outlook.com (2603:1096:405:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:47:36 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 11:47:36 +0000
Message-ID: <af4fde1c-281b-4826-a52c-a4e14727eb67@amlogic.com>
Date: Wed, 15 Jan 2025 19:47:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
From: Jiebing Chen <jiebing.chen@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
 <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
 <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
 <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
 <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
 <7cf4c53c-7cd2-402c-9e31-f85767ead932@amlogic.com>
In-Reply-To: <7cf4c53c-7cd2-402c-9e31-f85767ead932@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|TYZPR03MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 85984c00-af9b-4b4e-9e1e-08dd355a67ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW82aXl5WDlUM21GTWUwd0VTUHRwNjVJbmxqNzN6bnpQVHZyTyt3bms5TjRF?=
 =?utf-8?B?bjNCbTRhOUhpYlQ1VWQ2T0tqc1lQVThIVzNxUEs5OGFVY1RqRkVOMzVSdTFU?=
 =?utf-8?B?L0VVRmlxRlo4aDMzSldBeXVIcFZnSDcwMVgzd2I0MVhGNjFya0htQUZ0S0Rk?=
 =?utf-8?B?ZVFscytrRWNHRXR5ZkMvZGY1dVc5dzhqUVpFcGRVUWpvTWdVTzhIYStUSW00?=
 =?utf-8?B?S2xKSGxwdUFRRGhpZ01jTnpiV2Jjbklwbi9neWdGRk0vRTdMTlVFUlUwbmY2?=
 =?utf-8?B?MUpvY2MvSllnTDV2SC9mcnVLSTNFYzlmOTJTMFhsMmRkL3lSMGRWdnBZRUI2?=
 =?utf-8?B?OUFXaHNmQTlDbjFzN0JGU1NTTVR0TitRczBEdUxuR0N6RXZlZ1NVM0NLQ2FB?=
 =?utf-8?B?L0xGQ09rcVJhTjhvNTFxQXA1cHdmSEx4UXlXeHFJMk1ZR2dLdkNtN1hOanZv?=
 =?utf-8?B?VHRJRUJwNnZuT1FWY0NhNVMrUTV2SnVrcCswamVxZWdWVzBBU0FUcE5HUElF?=
 =?utf-8?B?bDdmVmYzdUdTSU1mbXF6cEJ3NHQzcHVXUjhPeWNNQkdPREZ3SmhZYWUrSlFC?=
 =?utf-8?B?QlRiZTd4amMwT2o1QXR0TVNqclVkNStzVS9pY3FaQ1d1WFNJYVBUZkFwYmtx?=
 =?utf-8?B?bWdKZlpOOCt5ek5vYnl1dGtZMVRENS9oSkhrNXNUaTd5YlRYbUQzSEZrMnhp?=
 =?utf-8?B?K09kNFI3Sk45WDBBSUR0ekJHQkZHcFRBN1BzZEFVQ1NqVTdpbWRWNTQ1QnFj?=
 =?utf-8?B?MHRoV0xOMXdUdXJ2Y3QvOHdQN3p1MS9INWhUQTA0Y1czYzMvTFlXMVhzM280?=
 =?utf-8?B?OTFaR0Nhc2orelJKUEZvcUxkVW5ZM2QwVzhLN1ZKZUlndmVZeXp1UmRFRk10?=
 =?utf-8?B?Vmx4RzF5amRaK1BWZWU3UGRBempweXB5Y05WbVpNOVhZOHZHaDRMT3lqNkFn?=
 =?utf-8?B?S2NiajdrUStRaldlWlZXU3RSZnBHeTFteXFDdjI3ZURkNjQ4ZnpmYklpQkww?=
 =?utf-8?B?dlp4Tk1zemtQZzZzOC9jOElYYktkd3BwOUdhMDRDVjBMZGF5cjcveDIyelVB?=
 =?utf-8?B?MXQ2MEhBQnlqOSs0b1dDT3pmd0Y0VWloYXpSbmRhMWZkdWVndVVTbE9JWkYx?=
 =?utf-8?B?UEJtL1BOaklFcnJjN3lFdlNScTBuQ0oyRkxWWlpLdmNJWGRBMFlxZTVQS1gz?=
 =?utf-8?B?dVNlYlI1c25MdDlRclJNWnlQdDU2MU54UWpyT2VkQXZjeWF1NW5yZ0FHNzJp?=
 =?utf-8?B?SjJTVmxRRWxDd2ZDRnBEL2YwMWhQMWt3YXZWUkFmSmlWaGxOWGZTbnExWFdq?=
 =?utf-8?B?amhmMUVaR3g0ZUlFRFUyWXd0TDVpM09WZXlmVnJZa08rb21CTVBjbDNxejNu?=
 =?utf-8?B?elR2TS9zRHp5eDEyUU5tRzBGQVp4bGZTZmo1cW1VOXAvcFV4Z3ZXS2UzVEp2?=
 =?utf-8?B?WDMxODRzbWFveDRtWUFiU0N6ZmdrNjEyTGFjOUJPaHNlUjg1MFI2b29NMUFU?=
 =?utf-8?B?SHQ3TUx1d09UencrLzdxZW9vMkhTSHJJLzJQQ3ZmdXNGY2VvaXBkbENNdEJy?=
 =?utf-8?B?VHl6b1U5VisxczkxQ2RjdGc4cmJHQUFSK1JUVGQ5bHE4VG9aUDVmRGtqUWdh?=
 =?utf-8?B?cmM4R1FFMW4wNTM4VzlxTDgrYVlUT0FkVU5vZEh3NDE5VkI1dXEvclBzSDdl?=
 =?utf-8?B?WndjdkFsYXRXMUFGeHNrSG5SaXloaDJ5NmZEbldjN080WElmY0ZrTTl0YUJJ?=
 =?utf-8?B?VjhZeW10YUMxTmpDU01NYTYwVVE1LzVZVW55WmtlNmh2ck9oU3UxNXQ2L2FG?=
 =?utf-8?B?bXpjOHZMMG9uS2h2NFRBMmh2WWRRTGxGMHNMOGlJRnNMd3JKKzg5cjZtMnNE?=
 =?utf-8?Q?gPJsf3iopCWYq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmQrVmpBU2hzRHNPK1U5clAwRDB6aUg3dkhjSG4wdHZvMWs4SlE4cms5Sjd6?=
 =?utf-8?B?TCtsMmJBZkNndDlZbm51bDhZcFdidXg0MFVkS0xFc0dHV2F2Q1hSRE9Vd1po?=
 =?utf-8?B?eUdLSXVnYXNSaE9KUUdiSWtmdGFBUFkyWXZKbjFDazBWcUlPY3RySFBoYm9W?=
 =?utf-8?B?Y1NyMUxqTTBOVktWYVRieVQyNTMxQ01TWi9YMHpyaFAzTTg0Rmx0SVNPYTA2?=
 =?utf-8?B?ZG5mVWlQUVdHYmppa1RrOCtiR3Y0YmxFa0xHK1R5aUNBbStJczhJYWtKamJM?=
 =?utf-8?B?WndkUEJKRzgwbklkaTFEQ2dpZnJodWtqaVNqSnZjQ29qcXpCSkNaVmpuSzF6?=
 =?utf-8?B?QVdyOXZRVXJRMkR0OXlYZnZPcXd1R2dSaEhOVU1oYzB0R1VnVEVLbzBacVFn?=
 =?utf-8?B?Z1ZvVmRNMnV4cjU0bzkwbWFrWVdTZnVtSUlCWHhPdFhWNGdEdy9qdDNjQlcz?=
 =?utf-8?B?WTVjd05aQkxUaU1WQklhUkljYk1ybEVrOEZBVUZRMjQvWWJEQW93YjYvQ0tT?=
 =?utf-8?B?MFhkTmwvLzV2cklodWVBSVlITjB2ZW5qRzdBWDJzYmZEV2w2TlowcnZVTUZv?=
 =?utf-8?B?WGl3UmYwYmVlS29XdmV0S0ovdkE2aGVta25IQlJMTTd1VVBpTmpGMnpobXJt?=
 =?utf-8?B?dmREczRHckdXdzd3bWFhMkkwZS9xaWk2eHgvNS9DZVBVMnU2U0V0MjRUR3gw?=
 =?utf-8?B?aUFzYTBvUmQvV0JEQy9ZZmFXcVR2UFRNbm1ydkJ2dzFuSE9QcUZ5QjdTU2la?=
 =?utf-8?B?VlRFTmwwTHZUQWllVWkwZStCMW1SaWU3enlZRVZFSUtHT2g5ZGtCYkZ2TmxT?=
 =?utf-8?B?VHN6eXlWMDRiRE1rd0ptaW1ranpPRUdQWG9paHExVkpKaXRaZG96M0pEZytB?=
 =?utf-8?B?eFFZTEtTYTV5TmRPOFN1eFVINUJaZTZ0WkcxQ2tvS0dDUGtkT3ZCeGZ4N0xC?=
 =?utf-8?B?eGh5RUhxMW04TzFyQUhEVjB0SG1nbzQyanAzNHl4L0c3Q0V6MjV6ODFVa1JS?=
 =?utf-8?B?L1pDaUc0M092b2ZTSWFsc0htV3NQdVdXaFg2b0ltZWdXdEEzNTRPYWVYRzYy?=
 =?utf-8?B?SGo1cFZKV2ZESVdEL3BjblN4QytKcWFiM2lFbFg1dVVSdjBZM0N2dDFLV3c2?=
 =?utf-8?B?QURjMnpiWm9NRzI2OWFzUDgzYzAxMzdlcWsyUmpLWndMVXEybGtnOXVPZWg3?=
 =?utf-8?B?ZXBWMkNnM0JjTFpWdUFzKzdtbGVKOVhGYnE3cWhVSU5yay9tdHJEWFFFTUVq?=
 =?utf-8?B?QXpBcmJSNlJDM3gzZkd0NEdNVDgxd2QyMnk2N0RyNUNYbU9yOEVKaVAxempW?=
 =?utf-8?B?cTlMeEpJV2MvZ28zUWpLSk93czNBb0RsU3I2MnFUUkJNek51S0Q0cGxsWDZW?=
 =?utf-8?B?Z2xCdGQrOWNMVDJHdWkrQkprVUg1T1l6ck5QS21WWXFsbXNiZHZxS0xicGpV?=
 =?utf-8?B?RFprOWZNRXNtQ1BjRFIrVmcyY1VKQ2J2bXNzd2N5RmFvR3dJcE5LeElnbXlr?=
 =?utf-8?B?eURSWlM2QzF4YitZVnBGMVRhU2ZFblViSHJYb1dvY29KUW1hVE5oczBoaW9Y?=
 =?utf-8?B?aUVFYjE4ODVtcGFpbjBDSTljMjd5bFVUMW85bXhXN2REUnRHQVhjTVF2NWc1?=
 =?utf-8?B?Y20vYWEreHc5WjJkVkZKSGxqNWltVzFSWlhvQTdqaEJHUXp5UmVsMEFBN1VE?=
 =?utf-8?B?UU5ZQy8rajRlQUN4NjBlNjA2SE02WjNzU3JwUVovYzFLUnVjZWtEZEZGSXlo?=
 =?utf-8?B?V2FGS2NJM3A0S0FEbWJ0TnFjcGxURytFeHdvVXVBZDMwdG04QS9FaHZ3Qno0?=
 =?utf-8?B?OEFnTVJYYVlJSVRoaDUxbDM2enBFdWxMSzhGSk96TnI2VjQwdXNyVllqR0xH?=
 =?utf-8?B?RktyMHI0SkowVTJrdHNmcm9LRklCcjI4SndJVTJyc3UyeUZZWUg0MHhDek9s?=
 =?utf-8?B?OW9DWHIvRTlnWmJVYnQzR2d5MDFUbHViaWNmTEVDQTVkK3lod01xcHg4bHVJ?=
 =?utf-8?B?SjBqWE1aZnlqRFdjcVcxTTJ6V0ZyVDJJbFFGM2lxSkQ3TmZESzhrTVZwaktI?=
 =?utf-8?B?Tk9SYXFIM1RXY2JIT21vT2gwMXNJcHBwSk9WVkdxaUtEQkNuTWJleHJ1TE1H?=
 =?utf-8?B?N0syZXRpUWsyTlVxcGxxVUxJRHZzemZsUU44SXV5anFIS1B6RnltSXprbkk3?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85984c00-af9b-4b4e-9e1e-08dd355a67ac
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:47:36.1291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7P3t6V7cSUgRJFMMYoOPdLIqtz/r7+rlN3UUvgqH9sARI61zv2ilm/bfdhB+DjJ+ku1Aa0eYnQjQltACIVk7Yan0F1KERkNshxTclPtbsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8557


在 2025/1/15 18:36, Jiebing Chen 写道:
>
> 在 2025/1/15 16:36, Jerome Brunet 写道:
>> [ EXTERNAL EMAIL ]
>>
>> On Wed 15 Jan 2025 at 10:56, Jiebing Chen <jiebing.chen@amlogic.com> 
>> wrote:
>>
>>> 在 2025/1/14 22:05, Jerome Brunet 写道:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On Tue 14 Jan 2025 at 19:20, Jiebing Chen 
>>>> <jiebing.chen@amlogic.com> wrote:
>>>>
>>>>>>>> +
>>>>>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>>>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>>>>>> +MODULE_LICENSE("GPL");
>>>>>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>>>>>> index
>>>>>>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e03d953586648 
>>>>>>>>
>>>>>>>> 100644
>>>>>>>> --- a/sound/soc/meson/t9015.c
>>>>>>>> +++ b/sound/soc/meson/t9015.c
>>>>>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai = {
>>>>>>>>                  .channels_min = 1,
>>>>>>>>                  .channels_max = 2,
>>>>>>>>                  .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>> -             .formats = (SNDRV_PCM_FMTBIT_S8 |
>>>>>>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>>>>>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>>>>>>> -                         SNDRV_PCM_FMTBIT_S24_LE),
>>>>>>>> +             .formats = (SNDRV_PCM_FMTBIT_S16_LE |
>>>>>>>> SNDRV_PCM_FMTBIT_S32_LE),
>>>>>>> Again, mixed up changes with zero justification.
>>>>>>>
>>>>>>> This drops S8 and S16 format support for the existing SoCs (such 
>>>>>>> as GXL)
>>>>>>> which is known to work and add S32 support on an HW documented 
>>>>>>> as 24bits
>>>>>>> only. Can you explain ?
>>>>> for g12a, sm1 etc, it is use new audio ip, GXL is old ip,
>>>> If there are chips difference we did not know about, then you should
>>>> introduce those difference, without breaking existing support -
>>>> including for GXL, which is what you did IIUC.
>>>>
>>>>> the new ip not support 24 bit,
>>>> Are sure about that ? that code has been there for a while.
>>>>
>>>> If sm1 does not support SNDRV_PCM_FMTBIT_S24_LE, you should a fix 
>>>> up patch for
>>>> that, with the proper "Fixes:" tag, how to reproduce the problem and
>>>> explaining the fix.
>>> maybe there are some gap , we support SNDRV_PCM_FMTBIT_S24, not 
>>> support the
>>>
>>> SNDRV_PCM_FMTBIT_S24_3LE,  for SNDRV_PCM_FMTBIT_S24
>>>
>>> it is  Signed, 24-bit (32-bit in memory), little endian , the audio dma
>>> busrt is 64bit
>> It makes absolutely no sense to discuss memory layout for the codec.
>>
>>> it can get the full data. we send the 32 bit data  mclk = 32bit* 48k 
>>> *4,
>>> use the clk to send
>>>
>>> the  SNDRV_PCM_FMTBIT_S24,   the hadware always send the 32bit data
>> No it does not. It send 24 bits of data over a 32 bits physical word 
>> with
>> 8 bits ignored.
>
> The original intention, we play 32bit data from tdmout, it play error, 
> so we add the s32_le
>
> for tdmouta ,it can bind Multiple codec, one codec is the internal codec,
>
> other is external codec, tdmout can send the data to internal codec 
> and external codec from the output pad
>
> for example, tdmout send 4 ch, 2 ch is send the internal codec, 2 ch 
> send the data pad
>
> it aplay error, due to the internal codec fomat parameter limiting 
> condition
>
> There is a contradiction here,  Considering our internal codec can 
> process this it, drop 8bit, 24bit valid
>
> therefore software can set s24_le/s32_le, still  work ok for hardware, 
> so Multiple ch can support for internal codec and external codec
>
>
add the s32_le format for the t9015.c,  it can resovle Multiple codec 
s32_le format case,  although hardware only process 24bit of 32bit, but 
it can't affect the acodec hardware work, it still work fine

usually we add the s32_le format support, if not allow to do it, think 
of it as a limitation, we can  remove 32bit test for it

>>
>>> so, i think we only add the SNDRV_PCM_FMTBIT_S32 base on it
>> That's wrong if the codec does not actually use the full 32bits ... and
>> I have clear indication that's what the codec is doing, on GXL at least.
>>
>>> we think the 24 bit is the SNDRV_PCM_FMTBIT_S24_3LE, it is 24bit in 
>>> memroy,
>>>
>>> due to the dma busrt 64 bit limit, it can't align the sample bit, if 
>>> it is
>>> 24 bit
>> Again, memory layout makes no sense here.
>>
>>> so the clock configure can't 24bit clock,
>> I disagree and this has been tested. If you have a test case showing
>> otherwise please share it.
>>
>>> by the way, We discuss internally for gxl,
>>>
>>> it also support the SNDRV_PCM_FMTBIT_S32
>>>
>> Does it really ? If it is just to ignore the 8bits LSB, that not a 
>> support.
>>
>>>>> usually support 16/32 bit for new audio ip , for 
>>>>> SNDRV_PCM_FMTBIT_S24_LE,
>>>>> it width =24, phy =32
>>>> Yes physical of SNDRV_PCM_FMTBIT_S24_LE, so most chip supporting 32 
>>>> bits
>>>> width would support this S24_LE, unless there is something odd.
>>>>
>>>>> it was  treated as 32 bit to send for tdm, so we can only add the 
>>>>> S32LE
>>>>> base on it , right ?
>>>> You are asking me ? How am I suppose to know ?
>>>>
>>>>> but if the gxl not support the 32bit
>>>> I don't see a problem with a DAC taking input on 32bits physical
>>>> interface and ignoring some bit on processing.
>>>>
>>>> If that's not the case, please send a proper fix change with some 
>>>> explanation
>>>>
>>>>> we need add new snd_soc_dai_driver t9015_dai_s4 ?
>>>>>
>>>> If I understood correctly format depends on the chip and needs to
>>>> adjusted including for sm1.
>>>>
>>>>>>>>          },
>>>>>>>>          .ops = &t9015_dai_ops,
>>>>>>>>     };
>>>>>>> -- Jerome
>>>> -- 
>>>> Jerome
>> -- 
>> Jerome
