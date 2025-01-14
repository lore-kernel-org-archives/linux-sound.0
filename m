Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2135.outbound.protection.outlook.com [40.107.255.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CBC1E2309;
	Tue, 14 Jan 2025 12:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858053; cv=fail; b=KY0vgShI5GmXb+dnjuUZ4ozZw40k10ktglg6IFSjo5ofqTwQt8NAV4yY/li7emdW0UlxfhXAX3ztZUJcbdcYP2g5XXqL26nHRhRbKawazyoyaP1QYZ4L+zoQgQPI9bI64EDj+xwlRbFxD1SqTz8umQi9tSnLDw1TKFqYCt0LwDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858053; c=relaxed/simple;
	bh=41nAKTtp3Q8F4Bk7NefzcKFa4MwR54y+SMeTRVg+nOw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f46JtDrsYKP/rAO9rVBTwiamDVpmNciOMwpBcBly7kaPbekltFko9OJkxaYZH303LGLoZ3uMyJn98Dw9/GwU7Rum0F66SHofSq1VOJ+qs98oV6GFiwGCK6r0Y4xyi+AnemuJBstXXIG2ybqyX3y1fiGk6IPtzvsQTQhaO55rkXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=lZfxJiXX; arc=fail smtp.client-ip=40.107.255.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="lZfxJiXX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTVM89lzbklTL1w34FXejvn7PXA+ZIAVhbZsiy2wyh2Vw/Wl5yYOOQdoross4hUIod/fs1Ea4a3RmDNPFub2F963BWEd+6049ZVIH3OGsDuxhPcpLYVWjAnXCVuRwIbIp35jp1B0vW0jcKOe1yLRqB4z77a8fDusglNP+XaDxQpY4MJ/ufQtSgcwSRCnzNGf5m5h8nGy8+d/FFfFj7rQy99cuWuxs2+lnFoLOv2DOW9qP33jxJjxTHrZ/VZlO1f1gw9Mc7hmWKjZaiUL+AryBe5rHjc6S8IeJ5aRjtBLDDlX3Ex6FdjdBu3+7twtPI1EFGMrVdMq4/vOB39/rkukag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0UnBuu5tbLzKBjfvj9Rw9+wboJ9D8xHA/PnFgFTkgo=;
 b=TyDEO9mvMViz1xXhiMvysEqiZXKyJKUBnxGn2fq5wQXH1ZO0p78jfolrQ59qlnEYsuJQ9qAYaygDXoahU80djRtgZfJo8aa3UXVYNTjxLZ/oGRnkFWBVbDEOqTAgY7pz7/puqhO4psAnpSGyHQHKXO5uERHN7ln+AzxC9sn/zPLxPEOG3R9qMSWm/WV/sFYpDGfojvzrVfUU1QjvWjjYoN1bN1cJfhUjXFDMoNdTSQSRhk9mMcBXE+IFNvwbmphFq0Y3xC0VbSnrHwRkJf/2XwObyx8X9lwn4SM4zYGgDnYjjpRXLPrZ0XdWQsWRQwwa6eYKuMBOz+BSemvbyLnvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0UnBuu5tbLzKBjfvj9Rw9+wboJ9D8xHA/PnFgFTkgo=;
 b=lZfxJiXXXPKaj3/3obl/3I4EpPvIYoz057rLG0yHopMbbcDk5SKiPgs2dzX7Skq3mevKUpaeWfNgSFLBGWcws//K+DUULhoky2blVzKfoJSQOa+PtY6fn8UIYTqiEdeYQ+sAcHH/+7oBjaZthpsVdgn65Wk1NDZ7sXTSVXuNJdj+fbYrySk0SJ+q+NMhRu0RfAN8xymUhIFVJqN8yDYnDtWRroFBl+essto5UdhuCQ0qp10bj9Eawt2MNkhZu9Kj5Zz9aAy7Od7bXPb2jtwDdZmn9KcI90i8F6RBD9mRtEmAOWiTXwNTeIQRfRX5Ga74rwxC33O5eOmpLLTkYOBT4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by TYZPR03MB7518.apcprd03.prod.outlook.com (2603:1096:400:419::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 12:34:05 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 12:34:05 +0000
Message-ID: <0e8b78c1-5c56-40e7-a2d8-41a7f49d52bc@amlogic.com>
Date: Tue, 14 Jan 2025 20:34:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: Add Amlogic S4 Audio
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
 <20250113-audio_drvier-v1-3-8c14770f38a0@amlogic.com>
 <1jldve939f.fsf@starbuckisacylon.baylibre.com>
 <813e2564-8c4c-4adb-8184-ab88156e3e4c@amlogic.com>
 <1jmsft7ihz.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jmsft7ihz.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|TYZPR03MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: b21f9f4a-a0e0-48aa-12d4-08dd3497bbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWVBQThiNUtnYWhKUzhIZDB6bldzUHl3SHdEWldKdFVJYWtXSzlqWFR4ZDV4?=
 =?utf-8?B?Mk9zeU1uRHBrb2czdFRkWjl0aVJJRmxJQ0lJNVU3SFpiOHZaOVpoQmJRd0FZ?=
 =?utf-8?B?NkFOdkhQTzZJeFZIWlUrbC9odUZHcXZhSmpleHl3bEJtZEVOVmJhVm5yaWVp?=
 =?utf-8?B?TlN0OC85eFZWYXpaaVgxeFl5Qnc5aWFseXZrYzZUVXBXanZGNVlOVk1GSWtl?=
 =?utf-8?B?aHRGUThnN29kWGVsUFB3ZWQrdTc5ZkR4RmtYblFnWGk3R3pmZGZ5blFzdVli?=
 =?utf-8?B?eHJyNVNzeFRsYkI0MzhwTlk4R3RQL2xYUkpBY2grL05yOHVwTW9LSjhOaElM?=
 =?utf-8?B?RzhTN2h2SUlkd0k0V1lNOEJSK2FXSm1Xbjd1VkNNMlBJVlo2bjRUV3lSR3VY?=
 =?utf-8?B?OWIyNVI3b1dUZ01CUTl1Z0hOUnVqenlnNzhnSWpKcld4YTBONHd6elFqakZQ?=
 =?utf-8?B?eWZCTlRhL2JPUGZGTE9FTmtGaWs2YWQ0WWd5YXo0YVJnM1Zyb204NzNIMUVP?=
 =?utf-8?B?SW1MMmhENmNhb3NrRW5JUUc2UUZLT3JEZVdNdzBmSjhMOGk2OXdvTlUzaFpM?=
 =?utf-8?B?cmtPTDJRdWNVZzhTRHVBN0dtV3cwSDNva3pVZlVhc0g3NlhTRGtONS95Tk0r?=
 =?utf-8?B?dVdTRGd1dmVXWDU2SDhGVENmQ2F6MWN1d1B2bERGQTBCR25FZHVNUTN1c2NN?=
 =?utf-8?B?aEpNclNuai9CVzNNMWRzbUpSOWVHWUt5MUsxTGVzdlJzQzVldXZPMzNKTFRq?=
 =?utf-8?B?SWg0OVZvZDJkVmdHWGN3SFpJZEhnYTEyeHVqcHRzRlA1WFRxK2c2VVFpSGxh?=
 =?utf-8?B?d05zYWI2R0VWb1N6b2pEUDhZYjlsNzg0bTlQekpSU09RUlJ1eW41VGhndHF2?=
 =?utf-8?B?TUcrRmRwdDlkWk81VkVqWEpSMG9aY3dYYjNPMmgxdENmbFZKb0QwNXpPTGNN?=
 =?utf-8?B?VVhET2g3MUk0VXNCc2o0c2ZJaHNTTGdKSi8wcGFoemE5d2hJTEx6N1NMaVNn?=
 =?utf-8?B?eGZsQlAzemZ3aVUraFRLdk5rSmNZYThBNGp4U1RXWXl3UGJGM1FwV1EvUElG?=
 =?utf-8?B?NFlMQ2UxRXprNmgwY1BWMmplZGhVYWI4bVdwOEZXaC9GdlBsYlBsOXQwM0pz?=
 =?utf-8?B?M2pFclB6c1RVempHQTNyZHBKWUw2YnRHUWR1aXQ2Q1MvUkRoMVFRVWt6cEVR?=
 =?utf-8?B?dEJ5NWY0dVlmUzZrNWpuMEkvVFNzVGN3N1ZrYjk5c2FzQmVJbzZQazhMWmdp?=
 =?utf-8?B?ckkzVzJIWGhYOWVRdE5hWE0rdk51UklHZ1dMRVF4eWZNbWR5YVZjclJTTEtN?=
 =?utf-8?B?MHZ5Sm1OVEZNbVY1aGNRc29SVDZmWENtQ1pDLzZ3MnJDS2xIRS9WOUdCVHVm?=
 =?utf-8?B?cm9sNHQ2ZXU1QXJTMjlkK3gybUNaYitLamRRb0tBa2FqSUFqaDA4djh0dU15?=
 =?utf-8?B?aVQzN3MvNW00UjZ3THZqbU5zNCtBSjI2Qjl4c1V5ZWpwdmlveTJzdmlxWWFT?=
 =?utf-8?B?VXI5V25vTUtYYzFxeTdLTnEzaTI2T0VpaHJKdmtLcFh2SC9lOFhFRGpZZ01D?=
 =?utf-8?B?bUYrUi83S0VCMmFvMkg3Qm54cE91ZnN3aUR2RFM3bGY5Y3Vya1ZSQ3F0dVhw?=
 =?utf-8?B?cGorR0dWZE16Z2VrOWZFeWYrR2JkbnBuYTNFZkVtTUFLY0F2VUc4Q3JURHZC?=
 =?utf-8?B?dExwUjJ6OFY3ZVFPRFJ5aEpxK3gzS1I2YVJVN05Lem0rSjkvWUh6ZWxodElD?=
 =?utf-8?B?eU1ZOEJWOUdsQVB5TnBoaytqSyszWmdlT2lFdkdHYko1d3hjeVhLU3JaS21J?=
 =?utf-8?B?ZkZaUmlnUURQejA5SjFMQVMxblY5ZmFpZjhIR3dvSDJ3M2xqV2hhZjFHT21a?=
 =?utf-8?Q?3bGzLssRf2L+F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2p6ZlRLYTJML1JmYVJEamRaNTh3K29hM1UyYWJBWjJQclZNc2xMaHdqdWU1?=
 =?utf-8?B?Ti9qQ1RnSHo3YjdxRDJ4cmZ1SWg2UlB3U0FuemRlWENHU2RVdDBCNGhvVkc0?=
 =?utf-8?B?V2RuVlJlOC9RWEgwdlJ5QTNhVVg4emk3dkc4ditkWVNNeEZ4bUhrc2VpSXF6?=
 =?utf-8?B?KzZPY1RXbmZIV3JadndaalZSNFFRaldFcDh1dGdwTTZTbUw3YmQ2bEwvVUdC?=
 =?utf-8?B?VHk5T0NPK0ZsbnMrUVd2VnlZZTZOblVkR01ZMlRUM0RrVlZrNDMvUXU5U2Rv?=
 =?utf-8?B?aEhQNmRsQ3lDcEV0T3FIbFZSVFlpL2RTVzhaZlVxSG5wSVA1Y29CQ0YxK0E5?=
 =?utf-8?B?akhOaUFtK2QzS3lTbWxhZXdMTFUvY3BJMnRWNFN4ZWQ2c1EveG1McmpacWV6?=
 =?utf-8?B?cExqZkxkZ0xudUtETHdXaFZzZU0vYURSTWpZb0lSV0RFYWZObzZuWXhxMmx5?=
 =?utf-8?B?RXFpdTlrb1JiVVcwQzZOQ1BzYkFIWXh6NWx2MjhUa2hIUzV0MC9hWmNGNlEw?=
 =?utf-8?B?TVp6eEdtVlJveFQ5MzFYU0ZNY21Dai9VOGpzbUtmUWFKTHBEMTN2cTZKZ1Ri?=
 =?utf-8?B?dFU0YkxtRURSdHJsZVJGMUdvb1BiSlFwNG12ZDJUU1g4NkFQSXNiSkVDbzZQ?=
 =?utf-8?B?RjNsUHdscEpjbG1zV1ZJNnV6TGRUY2h5SFlkSmJRNjVKUkhzRzhGaXFiTFZk?=
 =?utf-8?B?RjRtVlB3aFZHdVJCYUFtVVd4ejR4UE55RjlNNFBqM0lzbFBveUVtUFlkbG9s?=
 =?utf-8?B?SkhOdWppZ3grRFEwSmgvMDRPMm9TeDlmMk5USkJ2Q0RLQ1ZXbmd3NlpRSU05?=
 =?utf-8?B?Y09rZzFTdFB6VG1KTFhyQWQzZTFFeHk4bkpQZmhmRFBMMVBhbUhQbGFkbGNN?=
 =?utf-8?B?Z1lrbzZuMGljcnZQelI4dGxYVTlDTGZXdEh5SEExNElrMWVvQjhKVDZ4YlB3?=
 =?utf-8?B?YTU0dWRuWnN6b1orSzJhazFNZC9HWUNEcndka2ErQmdHMFZqUW5HSFFwMDRW?=
 =?utf-8?B?ZUloQ3B6L29TV2RSaWd3Y2duNzNGOVU4WmY1L3Y4Y29YcUQvTEJnUHoxd3VY?=
 =?utf-8?B?dnhKMDlqTURiRVFhcXBUQ01QS3NkVWdjWWpkaDcrVzBzVWsyQXVuTFRZRjNN?=
 =?utf-8?B?RS9PcnlnV3RwVHZwSFBDM0lzMXpkaGRNVmlGemxkeXhCLzNobDVDZFRtTTVP?=
 =?utf-8?B?R1NVTllEMXhRMkpxV1NCUmtHUmpaQldlV0tDSHM5eE1Nb0YrT0FJcnl2ZHkr?=
 =?utf-8?B?Y3ZTblh6cnpOWVF1emFJS0k3UkdNQ3hRWG9hZnB5c0dJQkFTUWVxZndNY2ZM?=
 =?utf-8?B?MFFSTmUzMUJYNkFIcURnakRkdUhGL3FBT05UVEg4VE81emVDQ04wa29yVjdK?=
 =?utf-8?B?SXNYTW13Q2Jka2krQTM5VWNncDdwTVpYMnNxcVZTRFFSbEYzeDc3bUdEcVNP?=
 =?utf-8?B?R0FkTnVvbmFrLy9VbmtxNGFreUV1ei9kVmNDblVZZFhRWk45VHZpdkc5aTlo?=
 =?utf-8?B?QW4rL2RXTEtmTlJSL0x1OVMwWjJGSmpHL1M5TVgxY3RnUlE2U0hqMGhDaG02?=
 =?utf-8?B?cnY5Q2Y4Wi80elI1MkpUcU1vYk11Q3RUb3M1czZZYjBzZ1dBSkZGWGhOZ3c4?=
 =?utf-8?B?NzgzdElDNC8yTzJ5T203M3JlcVJNUHdFVm1GUnk0NmdOTExoTDVrYlZqdEtv?=
 =?utf-8?B?NDZOdHpnVHRLVEk0YUJ4U2laTkJtTWtFMko2aGJURmJuMGlmTldmNFZiVHlv?=
 =?utf-8?B?QXVNTW94NTBYR1RabzRmNThscEZKdDZiWnBxNE02YUdKekV2ZHRXMWd3aW13?=
 =?utf-8?B?S3BiS09qMGVtKzFDaks4ZWtBRHFNcG8vMTlmcGxqVUkzZmdZU0ZhcEZrL0t1?=
 =?utf-8?B?ZXJ1aXdENU41eEI1K3JFK0hzWWJ6OStZSklmNWIyeWFOTEdKalNacXRpbGhy?=
 =?utf-8?B?QXR6cUFTVVM5UDBSL0t3WlEreE4zTzI3NEVVVGI5QnZsQmJBenljTVNBTWQ4?=
 =?utf-8?B?akNHZDRabDdZUDdicHFxSUZjcTlWMkFGRlBwTXk4djlkNmVsR0NhM3ZZMXJL?=
 =?utf-8?B?WkJPM1o2THgzcG9wWi9yZ2xydlRieWdDN0lRYlJhT2NvZ1VsVDdkZzlqMUda?=
 =?utf-8?B?UTR0NzRpWHhDcjhvbFQ5UTdDVm0wYUh0dDdzY0ZidjJ1MU5URGlUOGp6b1VL?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21f9f4a-a0e0-48aa-12d4-08dd3497bbbb
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 12:34:05.3082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDLRqT1JjmDGuGwgVXNAm87SLYoz5AI9aBOzPc9HFcaUp0RPFGRjbdojAGucJY082jmbE7fKvXnc14U+EQYexhB649Fllzae2UWsabzDERg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7518


在 2025/1/14 19:16, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On Tue 14 Jan 2025 at 16:52, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>
>> 在 2025/1/13 22:50, Jerome Brunet 写道:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>>>
>>>> From: jiebing chen <jiebing.chen@amlogic.com>
>>>>
>>>> Add basic audio driver support for the Amlogic S4 based Amlogic
>>>> AQ222 board.
>>>>
>>>> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
>>>> ---
>>>>    .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 ++++++++++++
>>>>    arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 ++++++++++++++++++++-
>>>>    2 files changed, 610 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>> index 6730c44642d2910d42ec0c4adf49fefc3514dbec..32f50a5b860435d50d9c5528b43422b705b20130 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>>>                regulator-always-on;
>>>>         };
>>>>
>>>> +     vcc5v_reg: regulator-vcc-5v {
>>>> +             compatible = "regulator-fixed";
>>>> +             vin-supply = <&main_12v>;
>>>> +             regulator-name = "VCC5V";
>>>> +             regulator-min-microvolt = <5000000>;
>>>> +             regulator-max-microvolt = <5000000>;
>>>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>>>> +             startup-delay-us = <7000>;
>>>> +             enable-active-high;
>>>> +             regulator-boot-on;
>>>> +             regulator-always-on;
>>>> +     };
>>>> +
>>>>         /* SY8120B1ABC DC/DC Regulator. */
>>>>         vddcpu: regulator-vddcpu {
>>>>                 compatible = "pwm-regulator";
>>>> @@ -129,6 +142,219 @@ vddcpu: regulator-vddcpu {
>>>>                                 <699000 98>,
>>>>                                 <689000 100>;
>>>>         };
>>>> +     dmics: audio-codec-1 {
>>>> +             compatible = "dmic-codec";
>>>> +             #sound-dai-cells = <0>;
>>>> +             num-channels = <2>;
>>>> +             wakeup-delay-ms = <50>;
>>>> +             sound-name-prefix = "MIC";
>>>> +     };
>>>> +
>>>> +     dioo2133: audio-amplifier-0 {
>>>> +             compatible = "simple-audio-amplifier";
>>>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>>>> +             VCC-supply = <&vcc5v_reg>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "10U2";
>>>> +     };
>>>> +
>>>> +     spdif_dir: audio-spdif-in {
>>>> +             compatible = "linux,spdif-dir";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "DIR";
>>>> +     };
>>>> +
>>>> +     spdif_dit: audio-spdif-out {
>>>> +             compatible = "linux,spdif-dit";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "DIT";
>>>> +     };
>>>> +
>>>> +     sound {
>>>> +             compatible = "amlogic,axg-sound-card";
>>>> +             model = "aq222";
>>>> +             audio-widgets = "Line", "Lineout";
>>>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>>>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>>>> +                              <&tdmin_lb>, <&dioo2133>, <&tdmout_pad>, <&toacodec>;
>>>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>>>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>>>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>>>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>>>> +                             "TDMA_OUT SEL",   "TDM_A Playback",
>>>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>>>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>>>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>>>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>>>> +                             "TDMB_OUT SEL",   "TDM_B Playback",
>>>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>>>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>>>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>>>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>>>> +                             "TDMC_OUT SEL",   "TDM_C Playback",
>>>> +                             "TOACODEC TDMA", "TDM_A Playback",
>>>> +                             "TOACODEC TDMB", "TDM_B Playback",
>>>> +                             "TOACODEC TDMC", "TDM_C Playback",
>>>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>>>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>>>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>>>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>>>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>>>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>>>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>>>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>>>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>>>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>>>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>>>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>>>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>>>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>>>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>>>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>>>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>>>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>>>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>>>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>>>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>>>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>>>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>>>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>>>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>>>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>>>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>>>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>>>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>>>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>>>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>>>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>>>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>>>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>>>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>>>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>>>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>>>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>>>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>>>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>>>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>>>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>>>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>>>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>>>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>>>> +                             "10U2 INL", "ACODEC LOLP",
>>>> +                             "10U2 INR", "ACODEC LORP",
>>>> +                             "Lineout", "10U2 OUTL",
>>>> +                             "Lineout", "10U2 OUTR";
>>>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>>>> +                               <&clkc_pll CLKID_MPLL2>,
>>>> +                               <&clkc_pll CLKID_MPLL0>,
>>>> +                               <&clkc_pll CLKID_MPLL1>;
>>>> +             assigned-clock-rates = <491520000>,
>>>> +                                    <294912000>,
>>>> +                                    <270950400>,
>>>> +                                    <393216000>;
>>> Why do you need 4 base rates ? Which rate family does each provide ?
>> hifipll 49152000, mpll2 294912000 mpll0 270950400, mpll1 393216000, the
>> accuracy of hifipll
>>
>> is relatively high, for tdm/pdm/spdif 16/48/96/192k we can use it. if the
>> tdm and spdif work on
> It is fine to use the HiFi. I'm glad this clock finally got fixed
>
>> the same time, for example ,tdm 48k. spdif 44.1k, we can't use the same
>> pll, so spdif need use the mpll 0
>>
>> other pll , only set a default value, at the latest chip, we remove all
>> mpll for hardware, only two hifipll
> I'm not sure you understand how this works.
> There is 3 families of audio rate: 48kHz, 44.1kHz and 32kHz
>
> Each family needs a PLL assigned, so you need 3, not 4, unless there is
> another specific rate family you want to support. If that's the case,
> document it.
>
> Setting the rate of the PLL should follow this principle:
> * Family rate
>    - multiplied by (32 x 24): to accomodate different sample sizes
>    - multiplied by 2 until you reach the maximum rate of selected PLLs
>      This allows to support rates such 192k or even 768k
>
> 491520000 is not dividable by 3, it won't allow 24 bits words. It is a
> poor choice.
>
> Have a look at the s400 for an example using the HiFi PLL. The axg was
> restricted to a 68 PLL multiplier but the S4 is not so you should be
> able to use a higher base rate (4 718 592 000 Hz), providing better
> accuracy in the end

for new soc audio ip, the hardware will not support the 24bit(include 
g12a, sm1,axg)

SNDRV_PCM_FMTBIT_S24_3LE, 24 bit in memory

>>>> +
>>>> +             dai-link-0 {
>>>> +                     sound-dai = <&frddr_a>;
>>>> +             };
>>>> +
>>>> +             dai-link-1 {
>>>> +                     sound-dai = <&frddr_b>;
>>>> +             };
>>>> +
>>>> +             dai-link-2 {
>>>> +                     sound-dai = <&frddr_c>;
>>>> +             };
>>>> +
>>>> +             dai-link-3 {
>>>> +                     sound-dai = <&toddr_a>;
>>>> +             };
>>>> +
>>>> +             dai-link-4 {
>>>> +                     sound-dai = <&toddr_b>;
>>>> +             };
>>>> +
>>>> +             dai-link-5 {
>>>> +                     sound-dai = <&toddr_c>;
>>>> +             };
>>>> +
>>>> +             /* Connected to the WIFI/BT chip */
>>>> +             dai-link-6 {
>>>> +                     sound-dai = <&tdmif_a>;
>>>> +                     dai-format = "dsp_a";
>>>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>>>> +                     mclk-fs = <256>;
>>>> +                     codec-0 {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* Connected to the onboard AD82584F DAC */
>>>> +             dai-link-7 {
>>>> +                     sound-dai = <&tdmif_b>;
>>>> +                     dai-format = "i2s";
>>>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>>>> +                     mclk-fs = <256>;
>>>> +
>>>> +                     codec-0 {
>>>> +                             sound-dai = <&acodec>;
>>>> +                     };
>>>> +
>>>> +                     codec-1 {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* 8ch HDMI interface */
>>>> +             dai-link-8 {
>>>> +                     sound-dai = <&tdmif_c>;
>>>> +                     dai-format = "i2s";
>>>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>>>> +                     dai-tdm-slot-tx-mask-1 = <1 1>;
>>>> +                     dai-tdm-slot-tx-mask-2 = <1 1>;
>>>> +                     dai-tdm-slot-tx-mask-3 = <1 1>;
>>>> +                     mclk-fs = <256>;
>>>> +
>>>> +                     codec-0 {
>>>> +                             sound-dai = <&acodec>;
>>>> +                     };
>>>> +
>>>> +                     codec-1 {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* spdif hdmi and coax output */
>>>> +             dai-link-9 {
>>>> +                     sound-dai = <&spdifout_a>;
>>>> +
>>>> +                     codec-0 {
>>>> +                             sound-dai = <&spdif_dit>;
>>>> +                     };
>>>> +
>>>> +                     codec-1 {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* spdif hdmi interface */
>>>> +             dai-link-10 {
>>>> +                     sound-dai = <&spdifout_b>;
>>>> +
>>>> +                     codec {
>>>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* spdif coax input */
>>>> +             dai-link-11 {
>>>> +                     sound-dai = <&spdifin>;
>>>> +
>>>> +                     codec {
>>>> +                             sound-dai = <&spdif_dir>;
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>>    };
>>>>
>>>>    &pwm_ef {
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> index 957577d986c0675a503115e1ccbc4387c2051620..87a00ace23131e31822bb43fbe956b8abcbaef40 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> @@ -11,7 +11,11 @@
>>>>    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>>    #include <dt-bindings/power/meson-s4-power.h>
>>>>    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>>>> -
>>>> +#include <dt-bindings/clock/axg-audio-clkc.h>
>>>> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>>>> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
>>>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>>>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>>>    / {
>>>>         cpus {
>>>>                 #address-cells = <2>;
>>>> @@ -46,6 +50,42 @@ cpu3: cpu@3 {
>>>>                 };
>>>>         };
>>>>
>>>> +     tdmif_a: audio-controller-0 {
>>>> +             compatible = "amlogic,axg-tdm-iface";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TDM_A";
>>>> +             clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
>>>> +             clock-names = "mclk", "sclk", "lrclk";
>>>> +             assigned-clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK_SEL>;
>>>> +             assigned-clock-parents = <&clkc_pll CLKID_HIFI_PLL>;
>>> Based on clock provider used, I doubt this is of any use.
>> if not set the mclk parent. we dump clk_summary, the default parent is mpll
>> 0
>>
>> we tend  to use hifipll
> Have you really tested this ? Master clocks do reparent to the appropriate PLL
> depending on the rate required, this is how it has always worked.

you are right, when boot up kernel, it is default, but when aplay

it auto switch the hifipll, it is a good skill, thanks

>>>> +     };
>>>> +
>>>> +     tdmif_b: audio-controller-1 {
>>>> +             compatible = "amlogic,axg-tdm-iface";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TDM_B";
>>>> +             clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_B_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
>>>> +             clock-names = "mclk", "sclk", "lrclk";
>>>> +             assigned-clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK_SEL>;
>>>> +             assigned-clock-parents = <&clkc_pll CLKID_HIFI_PLL>;
>>>> +     };
>>>> +
>>>> +     tdmif_c: audio-controller-2 {
>>>> +             compatible = "amlogic,axg-tdm-iface";
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "TDM_C";
>>>> +             clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_C_SCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
>>>> +             clock-names = "mclk", "sclk", "lrclk";
>>>> +             assigned-clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK_SEL>;
>>>> +             assigned-clock-parents = <&clkc_pll CLKID_HIFI_PLL>;
>>>> +     };
>>>> +
>>>>         timer {
>>>>                 compatible = "arm,armv8-timer";
>>>>                 interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>>>> @@ -850,3 +890,346 @@ emmc: mmc@fe08c000 {
>>>>                 };
>>>>         };
>>>>    };
>>>> +
>>>> +&apb4 {
>>>> +     audio: bus@330000 {
>>>> +             compatible = "simple-bus";
>>>> +             reg = <0x0 0x330000 0x0 0x1000>;
>>>> +             #address-cells = <2>;
>>>> +             #size-cells = <2>;
>>>> +             ranges = <0x0 0x0 0x0 0x330000 0x0 0x1000>;
>>>> +
>>>> +             clkc_audio: clock-controller@0 {
>>>> +                     compatible = "amlogic,sm1-audio-clkc";
>>> I suspect the DT folks would like having SoC specific compatible in
>>> addition to the fall back. In that case, I think that would be wise. I
>>> doubt the compatibility will hold in the long run.
>>>
>>> Same goes for the other HW components.
>> you are right, for s4 , some clock is different, we will add the
>> "amlogic,s4-audio-clkc"
>>
>> this is a base clk for tdm
>>
>>>> +                     reg = <0x0 0x0 0x0 0xb4>;
>>>> +                     #clock-cells = <1>;
>>>> +                     #reset-cells = <1>;
>>>> +                     power-domains = <&pwrc PWRC_S4_AUDIO_ID>;
>>>> +                     clocks = <&clkc_periphs CLKID_AUDIO>,
>>>> +                              <&clkc_pll CLKID_MPLL0>,
>>>> +                              <&clkc_pll CLKID_MPLL1>,
>>>> +                              <&clkc_pll CLKID_MPLL2>,
>>>> +                              <&clkc_pll CLKID_MPLL3>,
>>>> +                              <&clkc_pll CLKID_HIFI_PLL>,
>>>> +                              <&clkc_pll CLKID_FCLK_DIV3>,
>>>> +                              <&clkc_pll CLKID_FCLK_DIV4>,
>>>> +                              <&clkc_pll CLKID_FCLK_DIV5>;
>>>> +                     clock-names = "pclk",
>>>> +                                   "mst_in0",
>>>> +                                   "mst_in1",
>>>> +                                   "mst_in2",
>>>> +                                   "mst_in3",
>>>> +                                   "mst_in4",
>>>> +                                   "mst_in5",
>>>> +                                   "mst_in6",
>>>> +                                   "mst_in7";
>>>> +
>>>> +                     resets = <&reset RESET_AUDIO>;
>>>> +             };
>>>> +
>>>> +             toddr_a: audio-controller@100 {
>>>> +                     compatible = "amlogic,sm1-toddr",
>>>> +                                  "amlogic,axg-toddr";
>>>> +                     reg = <0x0 0x100 0x0 0x2c>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "TODDR_A";
>>>> +                     interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
>>>> +                     resets = <&arb AXG_ARB_TODDR_A>,
>>>> +                              <&clkc_audio AUD_RESET_TODDR_A>;
>>>> +                     reset-names = "arb", "rst";
>>>> +                     amlogic,fifo-depth = <8192>;
>>>> +             };
>>>> +
>>>> +             toddr_b: audio-controller@140 {
>>>> +                     compatible = "amlogic,sm1-toddr",
>>>> +                                  "amlogic,axg-toddr";
>>>> +                     reg = <0x0 0x140 0x0 0x2c>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "TODDR_B";
>>>> +                     interrupts = <GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
>>>> +                     resets = <&arb AXG_ARB_TODDR_B>,
>>>> +                              <&clkc_audio AUD_RESET_TODDR_B>;
>>>> +                     reset-names = "arb", "rst";
>>>> +                     amlogic,fifo-depth = <256>;
>>>> +             };
>>>> +
>>>> +             toddr_c: audio-controller@180 {
>>>> +                     compatible = "amlogic,sm1-toddr",
>>>> +                                  "amlogic,axg-toddr";
>>>> +                     reg = <0x0 0x180 0x0 0x2c>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "TODDR_C";
>>>> +                     interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
>>>> +                     resets = <&arb AXG_ARB_TODDR_C>,
>>>> +                              <&clkc_audio AUD_RESET_TODDR_C>;
>>>> +                     reset-names = "arb", "rst";
>>>> +                     amlogic,fifo-depth = <256>;
>>>> +             };
>>>> +
>>>> +             frddr_a: audio-controller@1c0 {
>>>> +                     compatible = "amlogic,sm1-frddr",
>>>> +                                  "amlogic,axg-frddr";
>>>> +                     reg = <0x0 0x1c0 0x0 0x2c>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "FRDDR_A";
>>>> +                     interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
>>>> +                     resets = <&arb AXG_ARB_FRDDR_A>,
>>>> +                              <&clkc_audio AUD_RESET_FRDDR_A>;
>>>> +                     reset-names = "arb", "rst";
>>>> +                     amlogic,fifo-depth = <512>;
>>>> +             };
>>>> +
>>>> +             frddr_b: audio-controller@200 {
>>>> +                     compatible = "amlogic,sm1-frddr",
>>>> +                                  "amlogic,axg-frddr";
>>>> +                     reg = <0x0 0x200 0x0 0x2c>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "FRDDR_B";
>>>> +                     interrupts = <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
>>>> +                     resets = <&arb AXG_ARB_FRDDR_B>,
>>>> +                              <&clkc_audio AUD_RESET_FRDDR_B>;
>>>> +                     reset-names = "arb", "rst";
>>>> +                     amlogic,fifo-depth = <256>;
>>>> +             };
>>>> +
>>>> +             frddr_c: audio-controller@240 {
>>>> +                     compatible = "amlogic,sm1-frddr",
>>>> +                                  "amlogic,axg-frddr";
>>>> +                     reg = <0x0 0x240 0x0 0x2c>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "FRDDR_C";
>>>> +                     interrupts = <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
>>>> +                     resets = <&arb AXG_ARB_FRDDR_C>,
>>>> +                              <&clkc_audio AUD_RESET_FRDDR_C>;
>>>> +                     reset-names = "arb", "rst";
>>>> +                     amlogic,fifo-depth = <256>;
>>>> +             };
>>>> +
>>>> +             arb: reset-controller@280 {
>>>> +                     compatible = "amlogic,meson-sm1-audio-arb";
>>>> +                     reg = <0x0 0x280 0x0 0x4>;
>>>> +                     #reset-cells = <1>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
>>>> +             };
>>>> +
>>>> +             tdmin_a: audio-controller@300 {
>>>> +                     compatible = "amlogic,sm1-tdmin",
>>>> +                                  "amlogic,axg-tdmin";
>>>> +                     reg = <0x0 0x300 0x0 0x40>;
>>>> +                     sound-name-prefix = "TDMIN_A";
>>>> +                     resets = <&clkc_audio AUD_RESET_TDMIN_A>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
>>>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                                   "lrclk", "lrclk_sel";
>>>> +             };
>>>> +
>>>> +             tdmin_b: audio-controller@340 {
>>>> +                     compatible = "amlogic,sm1-tdmin",
>>>> +                                  "amlogic,axg-tdmin";
>>>> +                     reg = <0x0 0x340 0x0 0x40>;
>>>> +                     sound-name-prefix = "TDMIN_B";
>>>> +                     resets = <&clkc_audio AUD_RESET_TDMIN_B>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
>>>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                                   "lrclk", "lrclk_sel";
>>>> +             };
>>>> +
>>>> +             tdmin_c: audio-controller@380 {
>>>> +                     compatible = "amlogic,sm1-tdmin",
>>>> +                                  "amlogic,axg-tdmin";
>>>> +                     reg = <0x0 0x380 0x0 0x40>;
>>>> +                     sound-name-prefix = "TDMIN_C";
>>>> +                     resets = <&clkc_audio AUD_RESET_TDMIN_C>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TDMIN_C>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
>>>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                                   "lrclk", "lrclk_sel";
>>>> +             };
>>>> +
>>>> +             tdmin_lb: audio-controller@3c0 {
>>>> +                     compatible = "amlogic,sm1-tdmin",
>>>> +                                  "amlogic,axg-tdmin";
>>>> +                     reg = <0x0 0x3c0 0x0 0x40>;
>>>> +                     sound-name-prefix = "TDMIN_LB";
>>>> +                     resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
>>>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                                   "lrclk", "lrclk_sel";
>>>> +             };
>>>> +
>>>> +             spdifin: audio-controller@400 {
>>>> +                     compatible = "amlogic,g12a-spdifin",
>>>> +                                  "amlogic,axg-spdifin";
>>>> +                     reg = <0x0 0x400 0x0 0x30>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "SPDIFIN";
>>>> +                     interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
>>>> +                     <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>>>> +                     clock-names = "pclk", "refclk";
>>>> +                     resets = <&clkc_audio AUD_RESET_SPDIFIN>;
>>>> +             };
>>>> +
>>>> +             spdifout_a: audio-controller@480 {
>>>> +                     compatible = "amlogic,g12a-spdifout",
>>>> +                                  "amlogic,axg-spdifout";
>>>> +                     reg = <0x0 0x480 0x0 0x50>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "SPDIFOUT_A";
>>>> +                     clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
>>>> +                     <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>>>> +                     clock-names = "pclk", "mclk";
>>>> +                     resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
>>>> +             };
>>>> +
>>>> +             tdmout_a: audio-controller@500 {
>>>> +                     compatible = "amlogic,sm1-tdmout";
>>>> +                     reg = <0x0 0x500 0x0 0x40>;
>>>> +                     sound-name-prefix = "TDMOUT_A";
>>>> +                     resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
>>>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                                   "lrclk", "lrclk_sel";
>>>> +             };
>>>> +
>>>> +             tdmout_b: audio-controller@540 {
>>>> +                     compatible = "amlogic,sm1-tdmout";
>>>> +                     reg = <0x0 0x540 0x0 0x40>;
>>>> +                     sound-name-prefix = "TDMOUT_B";
>>>> +                     resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
>>>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                                   "lrclk", "lrclk_sel";
>>>> +             };
>>>> +
>>>> +             tdmout_c: audio-controller@580 {
>>>> +                     compatible = "amlogic,sm1-tdmout";
>>>> +                     reg = <0x0 0x580 0x0 0x40>;
>>>> +                     sound-name-prefix = "TDMOUT_C";
>>>> +                     resets = <&clkc_audio AUD_RESET_TDMOUT_C>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TDMOUT_C>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
>>>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
>>>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>>>> +                                   "lrclk", "lrclk_sel";
>>>> +             };
>>>> +
>>>> +             spdifout_b: audio-controller@680 {
>>>> +                     compatible = "amlogic,g12a-spdifout",
>>>> +                                  "amlogic,axg-spdifout";
>>>> +                     reg = <0x0 0x680 0x0 0x50>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "SPDIFOUT_B";
>>>> +                     clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>>>> +                              <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>>>> +                     clock-names = "pclk", "mclk";
>>>> +                     resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>>>> +             };
>>>> +
>>>> +             toacodec: audio-controller@740 {
>>>> +                     compatible = "amlogic,s4-tocodec";
>>>> +                     reg = <0x0 0x740 0x0 0x4>;
>>>> +                     sound-name-prefix = "TOACODEC";
>>>> +                     resets = <&clkc_audio AUD_RESET_TOACODEC>;
>>>> +             };
>>>> +
>>>> +             tohdmitx: audio-controller@744 {
>>>> +                     compatible = "amlogic,sm1-tohdmitx",
>>>> +                                  "amlogic,g12a-tohdmitx";
>>>> +                     reg = <0x0 0x744 0x0 0x4>;
>>>> +                     #sound-dai-cells = <1>;
>>>> +                     sound-name-prefix = "TOHDMITX";
>>>> +                     resets = <&clkc_audio AUD_RESET_TOHDMITX>;
>>>> +             };
>>>> +
>>>> +             toddr_d: audio-controller@840 {
>>>> +                     compatible = "amlogic,sm1-toddr",
>>>> +                                  "amlogic,axg-toddr";
>>>> +                     reg = <0x0 0x840 0x0 0x2c>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "TODDR_D";
>>>> +                     interrupts = <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_TODDR_D>;
>>>> +                     resets = <&arb AXG_ARB_TODDR_D>,
>>>> +                              <&clkc_audio AUD_RESET_TODDR_D>;
>>>> +                     reset-names = "arb", "rst";
>>>> +                     amlogic,fifo-depth = <256>;
>>>> +             };
>>>> +
>>>> +             frddr_d: audio-controller@880 {
>>>> +                      compatible = "amlogic,sm1-frddr",
>>>> +                                   "amlogic,axg-frddr";
>>>> +                     reg = <0x0 0x880 0x0 0x2c>;
>>>> +                     #sound-dai-cells = <0>;
>>>> +                     sound-name-prefix = "FRDDR_D";
>>>> +                     interrupts = <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
>>>> +                     clocks = <&clkc_audio AUD_CLKID_FRDDR_D>;
>>>> +                     resets = <&arb AXG_ARB_FRDDR_D>,
>>>> +                              <&clkc_audio AUD_RESET_FRDDR_D>;
>>>> +                     reset-names = "arb", "rst";
>>>> +                     amlogic,fifo-depth = <256>;
>>>> +             };
>>>> +
>>>> +             tdmout_pad: audio-controller@E58 {
>>>> +                     compatible = "amlogic,s4-tdmout-pad";
>>>> +                     reg = <0x0 0xe58 0x0 0x28>;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     pdm: audio-controller@331000 {
>>>> +             compatible = "amlogic,sm1-pdm",
>>>> +                          "amlogic,axg-pdm";
>>>> +             reg = <0x0 0x331000 0x0 0x34>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "PDM";
>>>> +             clocks = <&clkc_audio AUD_CLKID_PDM>,
>>>> +                      <&clkc_audio AUD_CLKID_PDM_DCLK>,
>>>> +                      <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
>>>> +             clock-names = "pclk", "dclk", "sysclk";
>>>> +             resets = <&clkc_audio AUD_RESET_PDM>;
>>>> +             assigned-clocks = <&clkc_audio AUD_CLKID_PDM_DCLK_SEL>,
>>>> +                               <&clkc_audio AUD_CLKID_PDM_SYSCLK_SEL>;
>>>> +             assigned-clock-parents = <&clkc_pll CLKID_HIFI_PLL>,<&clkc_pll CLKID_HIFI_PLL>;
>>>> +     };
>>>> +      acodec: audio-controller@1A000 {
>>>> +             compatible = "amlogic,t9015";
>>>> +             reg = <0x0 0x1A000 0x0 0x14>;
>>>> +             #sound-dai-cells = <0>;
>>>> +             sound-name-prefix = "ACODEC";
>>>> +             clocks = <&clkc_periphs CLKID_ACODEC>;
>>>> +             clock-names = "pclk";
>>>> +             resets = <&reset RESET_ACODEC>;
>>>> +     };
>>>> +
>>>> +};
>>> --
>>> Jerome
> --
> Jerome
