Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023073.outbound.protection.outlook.com [40.107.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49030284A40;
	Tue, 14 Jan 2025 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736844763; cv=fail; b=JNM3gxu7SfTVk0ZS6LPcY9GA2c3Z+P/Yp7HLuHnY0ELvmXrZG858KsBGEyMTJ0JuwzdwUo2WOipPk+UDc6W/YUR5aNY5xcwhBp0FOrL+shKk02Ur3zEOx1r60DQRTf2mvl8DlentjwemG48zxjcBSMVyXVkqJ3FypUlsTytLGMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736844763; c=relaxed/simple;
	bh=JGu9Ayj/6MxxWG51SNI6k+ShdZn7JGgcbNQy/Dk13y8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RFy9wyPOgB/itIZEYTUmNfPtp/3ZcGuiyLaF0nbbGOHopOWJqrb46Id0TMNrvIMRubUNG3/803LXkp+4yUNFxEMd+uf+gGG3ZMHw+n1ezDclhfiQX4gxTloHicCVFhsRLsGjsY+R8wWd0lcUnlsG8k5JBTJjs2GMjo1pLLUyC+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=OohKvgBq; arc=fail smtp.client-ip=40.107.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="OohKvgBq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QD4chn2jPUSKoQrJ/fSJIKBqDEd4KNeRLnhVx3mVEOovgI6ODsUExXffzKYgvRlG4aQXy6A8Q8ZQccD4lcmJX0AeJIZmKwNaZOPXP6H4mYkw4VF0Ncb/FxIQOxMJDLJtczH6h24btjRN11uMrddgid/Tcw2HizWWsz+Kzvt0ZVena0LkT5wfQ2rq05DBhkNVrNy/VpJreEyltebmy5ZPJVHsH6j7SC8XcT3QMmWBFIZG39OJ/kz0EV9qVNfr0UH9ILK/vgT2p/z0Bf9JIN8f4SE4cWUik4WsCvp7JnUvrt+Axr836w8RmT/aHzUg0ah+iik2FcDBmtOPstaqr5gRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94p/n80x6x87J5UX2shNYwfA6bADIvVuPHagiLjvDRM=;
 b=PE+RaB3TnzU7tp0xfU3ptBEQeAcgPla8isYahni+SCIsuka6rkKfzfcOwdNu3hV3N6aA+og8QzRP0orfwSzqwKc2Bgm+CND8ylUL8AkZ3XZzpwgb8NjpG3HoMcDTgcT4I9jaRljeY9RktkjQcs0XQWlF2iNnUK3L7AZger+GRUNQ6J/T/+9hlOglB23JsDY6M3QZ5OZcBQMOUyu3SxYLKyDpKmd3ykxaM6cc0i/3PvEcOAzVx9tGQkog/7LdxM7K5nc4mO8yTjT4nVI3s7bm6cxRsCc709Rpaq+Yj4GL7ehXk9oWOaVWXjZViG0uZTOZUjaW97uCCfoFfL85KHU90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94p/n80x6x87J5UX2shNYwfA6bADIvVuPHagiLjvDRM=;
 b=OohKvgBql5aUqI67nFaf4BwHAQrq5PfZ29JPviGOaPc4pt3m6aqgRqWYzCJRXBrEOEqX8IUP2GRTvdtL5LFKdKnw4vYTuAZC2KPqTAW/xWdgnytdfq519i0u9WtQr1nBh81uDFG7YAWqx32Kub3sBQGxiQyWQe5qtG8Ow3LdnQCwhPPmIhYEq922f3CX+D1luC+mmNu01oowGC2340eMV/ilpjpryqQRPFOEswud0Fq49hhULbwkWk013AXx6G+sgvV76282si1jSm1tHTuzf6hFG/jKW4Kwnja7Pl2WM4din4nLJoIT/QacTK9qyhW7qYzSIAiLaMaYC9HE6Enkng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEYPR03MB7118.apcprd03.prod.outlook.com (2603:1096:101:d3::12)
 by TYZPR03MB8092.apcprd03.prod.outlook.com (2603:1096:400:464::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 08:52:34 +0000
Received: from SEYPR03MB7118.apcprd03.prod.outlook.com
 ([fe80::b748:89c0:9b9c:64d3]) by SEYPR03MB7118.apcprd03.prod.outlook.com
 ([fe80::b748:89c0:9b9c:64d3%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 08:52:34 +0000
Message-ID: <813e2564-8c4c-4adb-8184-ab88156e3e4c@amlogic.com>
Date: Tue, 14 Jan 2025 16:52:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: Add Amlogic S4 Audio
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
 <20250113-audio_drvier-v1-3-8c14770f38a0@amlogic.com>
 <1jldve939f.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jldve939f.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR0401CA0034.apcprd04.prod.outlook.com
 (2603:1096:820:e::21) To SEYPR03MB7118.apcprd03.prod.outlook.com
 (2603:1096:101:d3::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR03MB7118:EE_|TYZPR03MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: c38576cd-fbb0-4827-b8d2-08dd3478c9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1NubEtFWCtpSWx1YkpZbTFiRTFWQXlmVWdOd1dBREFBbVZJVzhKSmhCMHY5?=
 =?utf-8?B?UTNLREdKUTNFRjBycE9LbjZwQXZrTXp0Zkw0bUNVYjFJL2JwSE5SNS93VHNU?=
 =?utf-8?B?VEdGNVRlR3NHS1BVSkppNlJMZ2NJZXhpVnh4MnMrT2VudWJCblJDbktmVnp5?=
 =?utf-8?B?THVDWHladjVTU1FmSjNlK0hsbEd3VWlnUVBtK1B3VW4xaXA5WHZ1bVoyVi9V?=
 =?utf-8?B?U1JEcHhHRWdjbkZBdVR3WHBOQkJ0MjNBbUw4S1BHZlNIdDFOdE5tVXdvM21m?=
 =?utf-8?B?RWhOT2E1K0hESzh0dlo5a1VtNlc0YzU3c2xXNG1hb0FWNUg0YzJ0cFB5V05p?=
 =?utf-8?B?SDgxM3AyT1hUbVQ5b2NTMk1lZVdzdm5KV1Jkbjl1aGRGaTNlNklzTGQ1anp5?=
 =?utf-8?B?VXhaOEVDZENFYjVvc21NZlBaSGl5SFNhOXNDclVoM20rMDdyTEd5cGRVT2Iv?=
 =?utf-8?B?a0Vra3NtbndyS3U0T0RMWlQ1YXVwVGdOdEN4VDN4TnQxencwdjMzWWVtNytU?=
 =?utf-8?B?dWRJWm1uRmlRMU5BSm9LV3E3eFlwZ1l3cGxZdlFaSmsyVy9kOWxKVGtUOThO?=
 =?utf-8?B?UEVUK2ErUk04WTNCdXBNbE02K2Fyb2kyNnpFaTFaNzcyZmJ1TDNhSjJFdUUy?=
 =?utf-8?B?ajlJSFk4UGNjdk9HLzM5Q0F6SjlMSVpIaWRKaU4zYXNZWCtrcVVJd2NsQ0U0?=
 =?utf-8?B?VXg4b25iakt2bWhud2hKbUQ5SnZxYU9lc0VrN2FCYXFCSGlITkFKU2lsc2Ur?=
 =?utf-8?B?dlZwQUVUTFFkU0U0UGU1cjJIOFFyTWxWSDNIOTc0WTVCdDM1Tk5OZ1RKbWY0?=
 =?utf-8?B?Z3FzQ3dIc3FaRVJtWGNvTFBmTmtGZVV3ekF1cDhTU3M5blVyOUdrbDJNczJL?=
 =?utf-8?B?T3RpU0IwdDRlOWhWcmhWK0VVbE5XYnlUVkZCVitidU0zSnhDeUJIMU44MWJT?=
 =?utf-8?B?TFFhejI1VWlkNDN5R0JlaHFUN3hGaGpJMzNBMk9PVG81TUp0NzJrc3czT3A5?=
 =?utf-8?B?d0QwZUtwd3Q1TXFQN0Y1T3hBb0hkZkx4dUI0dE5jUWJEeUZrdXFpcTJQVkY3?=
 =?utf-8?B?enRSV0wwbnkzWWxhUVVzUWlhd3EwYlVKN0FLeUc1RTlnYlRLT2g5MXZKTkFs?=
 =?utf-8?B?WWtKVStxcEN1YzBmSjdIUDRXbWNoZ3JGVnkwcGwxSjY1YkF2ZHRpSURWZTkz?=
 =?utf-8?B?bG1OSnRuTGlHaCtwb2R5aXV4M0VrdlZ5RGJEMzB0dGlKbFBuM3JPajRHamtX?=
 =?utf-8?B?UWFXNm5lTklDUW53eDVpUytwUHAyeU1JdmVZYXlnenpOMmwrMU0wQ2xsUUxT?=
 =?utf-8?B?WlN1N0pBWDJXWDdjY21NcDNGRHh4MHRxOUNJV2E3ZnBnUmQyZ3lxS0NnUk1V?=
 =?utf-8?B?WWZuWHNBcHJ4d3Jsa1JmbU1RZk9uZUVKaWJCcDF1S3U3TUd6Y0N2bWJrcW83?=
 =?utf-8?B?eXY5UEthTXlCbllyVjQyeDlVT0VDcXlJYkhvc2NOSXhHVkdDT25xL21ieDBX?=
 =?utf-8?B?c09iMjgrb05OZk5tWSsxWng2Y1NaVFAzczNGbVlKbTd0UzZ0c3QxY01ENUlM?=
 =?utf-8?B?Y1A1OEEvaUl3UFpUT25aY25qdEJhWUdFUDdPYVVWbkFpb2lKTGs4Z1Q2RStm?=
 =?utf-8?B?aWFyWm1UODhLY0FTRDhKSzQvMHJ3UGpMc0RGb2Nlb3liY2d2bEdrOG12TmdY?=
 =?utf-8?B?ZGY0c05xdU1ENUVZTUEzVGZBb3A4dDNTUVJ4UGgxdUdHQ2Jkb3ZWK3g2N3Ez?=
 =?utf-8?B?QTJHcFB0eXcvUnhDcmpwaEV3NDRyZDVOK0hKMGRvUFJGcEJOeG1OVVFLcWJk?=
 =?utf-8?B?UnZnNmp3SXFFTnAySEcxb3M3YUJqZHUrYXAzV01FMUtUcFNwdGc4VjVZQWhD?=
 =?utf-8?Q?Tn7j4xFMA6qBc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7118.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHdKYUl5MTRBRUZDNG9KdmJ2RFRnTEF2MEtZeVZlcEdLQ0lqS1lxQlhxai9K?=
 =?utf-8?B?NjVodWlMSHpNTGpCOFZ1Y3VZOWNHNXpaWE83Qml3N3JIcHY4YnVrNzdOMEk2?=
 =?utf-8?B?SDJ5azVhNGphTlhteUs0d0FVYmxPVy8wd0pNV281RzZwQ0xMREc0RVVHV3Vv?=
 =?utf-8?B?ZGpHdVYzTmVnSXp6b0RjRmlBbFpvWkVLWWRiTlRoNEtUZjduTndUckhaSHRI?=
 =?utf-8?B?SEJKVHZjdWFxd0RKV0lRRnI3RkRNL1RWY09WUkVyNEQ4SytwMXBpa20wZGdr?=
 =?utf-8?B?bmpva2x5NzloZFVON0NYSWRHM0N0THMzM2RqcVcvekNtWVRNZnRabG0vSUpz?=
 =?utf-8?B?by8rMGVPeVcrL2hDK2xaU2pBVmtvTzA3L2h3MkoxOUhYWDRmUWlHS2pzMlV5?=
 =?utf-8?B?TWVQUU0rZk1NQXF3Qmhvb0tWVE41MGlpRzBreG5LMmhMY0UrSEJzalVUMkhw?=
 =?utf-8?B?eURKSTFPUndDdFN3UE05YTk5citHTDNGcEYvemx3WTYwMWc2ZHY5WWw3MUZy?=
 =?utf-8?B?RjYra3NCb080cWNvTmtGUDZOY0NWbnZYL21HQXQvai96c1hsR0RvSm1sZWVC?=
 =?utf-8?B?M2dFN2RRTndXZGs2b09ramVuK3Q2RUdkTStsdEdvQmk0ejlqMkdRaStFUU1s?=
 =?utf-8?B?YWRlM1dtMFpFQWhkSXBUclpacHFGWmtFOExONEJXMCtMWE12aURFeG03TWdB?=
 =?utf-8?B?c2E2V3AvblVFRUhIS2pDbXZ5b0VVRHAxa0V1bWVNSjJHMHRPWGRVTzg4d1lv?=
 =?utf-8?B?YVc4bmFFL1dSRW51RFVCMUlyRVZoMVlMaXdCcUlPdHhicW9hUVZpMmtRWHBT?=
 =?utf-8?B?MHFkdExVc2UzWDJKRzNxZVpObDFLUjQ3Y3hEZmpIZm5ZUWJVV3hOdjRIcFFa?=
 =?utf-8?B?SnNGc0I3RzZRSWxIM2w5NGpkblZiMlJBdkZuYWVzUlUxcUdyYldWT2VLa2ZZ?=
 =?utf-8?B?Q2FVZzhlOGI1REhITEF3cE1LYzNzcWdLVWw4dlNkSUpFdkxtaERuclBtRVdV?=
 =?utf-8?B?SGtxK3I4OFlVMTRIbEF4N1E4UE4yaTBJRU4zVERDUGRET2FxbEhXdEp0TG1O?=
 =?utf-8?B?TGdmNHRISUc5RW9Pcm1JNVpvSnBERVhUZU9TM0NXTlM4YnVacGI4djdPWTFR?=
 =?utf-8?B?RERmTW1WNHBkWFdoY3dpTjhTelI1bW5OQkNVUEVweUd3WHlMVDQ2L0tMeG4w?=
 =?utf-8?B?dFlQWVpxUGdONkZRNnlsNVcwWU1qZjg3bmEwaDM1U3hWWERvQWkyRkdmSU11?=
 =?utf-8?B?UDJmWTNRdldiWS9PQldwQndZRmE2WEpxUW1DYlpPR3NVTWw4SXE3ajNWNCtX?=
 =?utf-8?B?TnZ2eWtIOW9SOWJLaWN2N0pheHppSW5pOVo1M05sNm4weFJmbnFGYkErZmtO?=
 =?utf-8?B?eE1yRXN6OWd0bzNuNzFHT2IydDQvMTE5MlFWcWNvZ0pvK3NBZVpTSnNJc1ZT?=
 =?utf-8?B?ZlJHU0w1b0FkenMyTUNmYkdlUVp4T2VjcC9JeS9XY2tSZmhoU0hBbHJRVGxl?=
 =?utf-8?B?K0t1Y1pFSFNHR3FaRHFvL3d0N0IvcGh5bzJNZUk3STdJZCtWd1JDdXlBczFC?=
 =?utf-8?B?V2NkZVBLVndMS3RKbjBBaHJwaEdLWEN2UmtVNDhRUTB4enF5OVBDM0FObmdK?=
 =?utf-8?B?NEl5emhueUZ5ZEI5RHRaREFHeCtpWmVlQ0lua05PZzdQaEl1a052VXoyeHFE?=
 =?utf-8?B?dmxuSnlMSVZvSEJ6N2lodGhFZ1BRbGdiN09SNzFOLzFLYy8wOEM2cEZmb2hJ?=
 =?utf-8?B?SVRPdnRxMm82VWJyYkU5TEl0SkZTTWM1MmNOdjd3Zk8vNENkY3dIUk90QUNU?=
 =?utf-8?B?L1JCWkJQdERwT2FGZkdlQ0pqaTUra1YxSVZQNkNhSUQvZmduOTRPMVB3ZGNz?=
 =?utf-8?B?Q0ZDTjV6MVBrREhVYUJGTjRTRDk3NWs0WGxMcU5KdVBXUit2aVc0NGU0RTQr?=
 =?utf-8?B?Q1dVMmJHOXVQT2NDUUx3YUdHRE40Y3QvL2lPNnk3WDFQM3d0L2s5MHhsa3Iy?=
 =?utf-8?B?U1ZndHgyZE44Mi9SNmtNTmc2RFpRZkd4UFNWMWI5RjFOMWpMS0pKbHp4WU1P?=
 =?utf-8?B?YjNINGZPdWtQV1l6aW9PTWdicDRkSzJ0ZzdKanIycjFuL2NKNWZUYnh1dXZn?=
 =?utf-8?B?RHV3RkJXUU5uVk9yK0IxSmFkaFlHcHR1WXpYYUpHMkI1d2NMM3JMS2hXWWJp?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38576cd-fbb0-4827-b8d2-08dd3478c9da
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7118.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 08:52:34.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzZ3PYkQCLQ8lA/RGi6BKUNiNkuER4Y3bXCumz/TztOt0CLUAYR4s1/IpT5nTubPeYrIdcvG6cERUdgCX7+AiY1YXiEz0/GP6J0YO6U/gkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8092


在 2025/1/13 22:50, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>
>> From: jiebing chen <jiebing.chen@amlogic.com>
>>
>> Add basic audio driver support for the Amlogic S4 based Amlogic
>> AQ222 board.
>>
>> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
>> ---
>>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 226 ++++++++++++
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 385 ++++++++++++++++++++-
>>   2 files changed, 610 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> index 6730c44642d2910d42ec0c4adf49fefc3514dbec..32f50a5b860435d50d9c5528b43422b705b20130 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>               regulator-always-on;
>>        };
>>
>> +     vcc5v_reg: regulator-vcc-5v {
>> +             compatible = "regulator-fixed";
>> +             vin-supply = <&main_12v>;
>> +             regulator-name = "VCC5V";
>> +             regulator-min-microvolt = <5000000>;
>> +             regulator-max-microvolt = <5000000>;
>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>> +             startup-delay-us = <7000>;
>> +             enable-active-high;
>> +             regulator-boot-on;
>> +             regulator-always-on;
>> +     };
>> +
>>        /* SY8120B1ABC DC/DC Regulator. */
>>        vddcpu: regulator-vddcpu {
>>                compatible = "pwm-regulator";
>> @@ -129,6 +142,219 @@ vddcpu: regulator-vddcpu {
>>                                <699000 98>,
>>                                <689000 100>;
>>        };
>> +     dmics: audio-codec-1 {
>> +             compatible = "dmic-codec";
>> +             #sound-dai-cells = <0>;
>> +             num-channels = <2>;
>> +             wakeup-delay-ms = <50>;
>> +             sound-name-prefix = "MIC";
>> +     };
>> +
>> +     dioo2133: audio-amplifier-0 {
>> +             compatible = "simple-audio-amplifier";
>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>> +             VCC-supply = <&vcc5v_reg>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "10U2";
>> +     };
>> +
>> +     spdif_dir: audio-spdif-in {
>> +             compatible = "linux,spdif-dir";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "DIR";
>> +     };
>> +
>> +     spdif_dit: audio-spdif-out {
>> +             compatible = "linux,spdif-dit";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "DIT";
>> +     };
>> +
>> +     sound {
>> +             compatible = "amlogic,axg-sound-card";
>> +             model = "aq222";
>> +             audio-widgets = "Line", "Lineout";
>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmout_c>,
>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>> +                              <&tdmin_lb>, <&dioo2133>, <&tdmout_pad>, <&toacodec>;
>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>> +                             "TDMA_OUT SEL",   "TDM_A Playback",
>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>> +                             "TDMB_OUT SEL",   "TDM_B Playback",
>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>> +                             "TDMC_OUT SEL",   "TDM_C Playback",
>> +                             "TOACODEC TDMA", "TDM_A Playback",
>> +                             "TOACODEC TDMB", "TDM_B Playback",
>> +                             "TOACODEC TDMC", "TDM_C Playback",
>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>> +                             "10U2 INL", "ACODEC LOLP",
>> +                             "10U2 INR", "ACODEC LORP",
>> +                             "Lineout", "10U2 OUTL",
>> +                             "Lineout", "10U2 OUTR";
>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>> +                               <&clkc_pll CLKID_MPLL2>,
>> +                               <&clkc_pll CLKID_MPLL0>,
>> +                               <&clkc_pll CLKID_MPLL1>;
>> +             assigned-clock-rates = <491520000>,
>> +                                    <294912000>,
>> +                                    <270950400>,
>> +                                    <393216000>;
> Why do you need 4 base rates ? Which rate family does each provide ?

hifipll 49152000, mpll2 294912000 mpll0 270950400, mpll1 393216000, the 
accuracy of hifipll

is relatively high, for tdm/pdm/spdif 16/48/96/192k we can use it. if 
the tdm and spdif work on

the same time, for example ,tdm 48k. spdif 44.1k, we can't use the same 
pll, so spdif need use the mpll 0

other pll , only set a default value, at the latest chip, we remove all 
mpll for hardware, only two hifipll

>> +
>> +             dai-link-0 {
>> +                     sound-dai = <&frddr_a>;
>> +             };
>> +
>> +             dai-link-1 {
>> +                     sound-dai = <&frddr_b>;
>> +             };
>> +
>> +             dai-link-2 {
>> +                     sound-dai = <&frddr_c>;
>> +             };
>> +
>> +             dai-link-3 {
>> +                     sound-dai = <&toddr_a>;
>> +             };
>> +
>> +             dai-link-4 {
>> +                     sound-dai = <&toddr_b>;
>> +             };
>> +
>> +             dai-link-5 {
>> +                     sound-dai = <&toddr_c>;
>> +             };
>> +
>> +             /* Connected to the WIFI/BT chip */
>> +             dai-link-6 {
>> +                     sound-dai = <&tdmif_a>;
>> +                     dai-format = "dsp_a";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     mclk-fs = <256>;
>> +                     codec-0 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
>> +                     };
>> +             };
>> +
>> +             /* Connected to the onboard AD82584F DAC */
>> +             dai-link-7 {
>> +                     sound-dai = <&tdmif_b>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     mclk-fs = <256>;
>> +
>> +                     codec-0 {
>> +                             sound-dai = <&acodec>;
>> +                     };
>> +
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
>> +                     };
>> +             };
>> +
>> +             /* 8ch HDMI interface */
>> +             dai-link-8 {
>> +                     sound-dai = <&tdmif_c>;
>> +                     dai-format = "i2s";
>> +                     dai-tdm-slot-tx-mask-0 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-1 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-2 = <1 1>;
>> +                     dai-tdm-slot-tx-mask-3 = <1 1>;
>> +                     mclk-fs = <256>;
>> +
>> +                     codec-0 {
>> +                             sound-dai = <&acodec>;
>> +                     };
>> +
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
>> +                     };
>> +             };
>> +
>> +             /* spdif hdmi and coax output */
>> +             dai-link-9 {
>> +                     sound-dai = <&spdifout_a>;
>> +
>> +                     codec-0 {
>> +                             sound-dai = <&spdif_dit>;
>> +                     };
>> +
>> +                     codec-1 {
>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
>> +                     };
>> +             };
>> +
>> +             /* spdif hdmi interface */
>> +             dai-link-10 {
>> +                     sound-dai = <&spdifout_b>;
>> +
>> +                     codec {
>> +                             sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
>> +                     };
>> +             };
>> +
>> +             /* spdif coax input */
>> +             dai-link-11 {
>> +                     sound-dai = <&spdifin>;
>> +
>> +                     codec {
>> +                             sound-dai = <&spdif_dir>;
>> +                     };
>> +             };
>> +     };
>> +
>>   };
>>
>>   &pwm_ef {
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> index 957577d986c0675a503115e1ccbc4387c2051620..87a00ace23131e31822bb43fbe956b8abcbaef40 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -11,7 +11,11 @@
>>   #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>   #include <dt-bindings/power/meson-s4-power.h>
>>   #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
>> -
>> +#include <dt-bindings/clock/axg-audio-clkc.h>
>> +#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
>> +#include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
>> +#include <dt-bindings/sound/meson-g12a-toacodec.h>
>> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>>   / {
>>        cpus {
>>                #address-cells = <2>;
>> @@ -46,6 +50,42 @@ cpu3: cpu@3 {
>>                };
>>        };
>>
>> +     tdmif_a: audio-controller-0 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_A";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_A_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
>> +             clock-names = "mclk", "sclk", "lrclk";
>> +             assigned-clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK_SEL>;
>> +             assigned-clock-parents = <&clkc_pll CLKID_HIFI_PLL>;
> Based on clock provider used, I doubt this is of any use.

if not set the mclk parent. we dump clk_summary, the default parent is 
mpll 0

we tend  to use hifipll

>
>> +     };
>> +
>> +     tdmif_b: audio-controller-1 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_B";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_B_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
>> +             clock-names = "mclk", "sclk", "lrclk";
>> +             assigned-clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK_SEL>;
>> +             assigned-clock-parents = <&clkc_pll CLKID_HIFI_PLL>;
>> +     };
>> +
>> +     tdmif_c: audio-controller-2 {
>> +             compatible = "amlogic,axg-tdm-iface";
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "TDM_C";
>> +             clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_C_SCLK>,
>> +                      <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
>> +             clock-names = "mclk", "sclk", "lrclk";
>> +             assigned-clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK_SEL>;
>> +             assigned-clock-parents = <&clkc_pll CLKID_HIFI_PLL>;
>> +     };
>> +
>>        timer {
>>                compatible = "arm,armv8-timer";
>>                interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> @@ -850,3 +890,346 @@ emmc: mmc@fe08c000 {
>>                };
>>        };
>>   };
>> +
>> +&apb4 {
>> +     audio: bus@330000 {
>> +             compatible = "simple-bus";
>> +             reg = <0x0 0x330000 0x0 0x1000>;
>> +             #address-cells = <2>;
>> +             #size-cells = <2>;
>> +             ranges = <0x0 0x0 0x0 0x330000 0x0 0x1000>;
>> +
>> +             clkc_audio: clock-controller@0 {
>> +                     compatible = "amlogic,sm1-audio-clkc";
> I suspect the DT folks would like having SoC specific compatible in
> addition to the fall back. In that case, I think that would be wise. I
> doubt the compatibility will hold in the long run.
>
> Same goes for the other HW components.

you are right, for s4 , some clock is different, we will add the 
"amlogic,s4-audio-clkc"

this is a base clk for tdm

>
>> +                     reg = <0x0 0x0 0x0 0xb4>;
>> +                     #clock-cells = <1>;
>> +                     #reset-cells = <1>;
>> +                     power-domains = <&pwrc PWRC_S4_AUDIO_ID>;
>> +                     clocks = <&clkc_periphs CLKID_AUDIO>,
>> +                              <&clkc_pll CLKID_MPLL0>,
>> +                              <&clkc_pll CLKID_MPLL1>,
>> +                              <&clkc_pll CLKID_MPLL2>,
>> +                              <&clkc_pll CLKID_MPLL3>,
>> +                              <&clkc_pll CLKID_HIFI_PLL>,
>> +                              <&clkc_pll CLKID_FCLK_DIV3>,
>> +                              <&clkc_pll CLKID_FCLK_DIV4>,
>> +                              <&clkc_pll CLKID_FCLK_DIV5>;
>> +                     clock-names = "pclk",
>> +                                   "mst_in0",
>> +                                   "mst_in1",
>> +                                   "mst_in2",
>> +                                   "mst_in3",
>> +                                   "mst_in4",
>> +                                   "mst_in5",
>> +                                   "mst_in6",
>> +                                   "mst_in7";
>> +
>> +                     resets = <&reset RESET_AUDIO>;
>> +             };
>> +
>> +             toddr_a: audio-controller@100 {
>> +                     compatible = "amlogic,sm1-toddr",
>> +                                  "amlogic,axg-toddr";
>> +                     reg = <0x0 0x100 0x0 0x2c>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "TODDR_A";
>> +                     interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
>> +                     resets = <&arb AXG_ARB_TODDR_A>,
>> +                              <&clkc_audio AUD_RESET_TODDR_A>;
>> +                     reset-names = "arb", "rst";
>> +                     amlogic,fifo-depth = <8192>;
>> +             };
>> +
>> +             toddr_b: audio-controller@140 {
>> +                     compatible = "amlogic,sm1-toddr",
>> +                                  "amlogic,axg-toddr";
>> +                     reg = <0x0 0x140 0x0 0x2c>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "TODDR_B";
>> +                     interrupts = <GIC_SPI 33 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
>> +                     resets = <&arb AXG_ARB_TODDR_B>,
>> +                              <&clkc_audio AUD_RESET_TODDR_B>;
>> +                     reset-names = "arb", "rst";
>> +                     amlogic,fifo-depth = <256>;
>> +             };
>> +
>> +             toddr_c: audio-controller@180 {
>> +                     compatible = "amlogic,sm1-toddr",
>> +                                  "amlogic,axg-toddr";
>> +                     reg = <0x0 0x180 0x0 0x2c>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "TODDR_C";
>> +                     interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
>> +                     resets = <&arb AXG_ARB_TODDR_C>,
>> +                              <&clkc_audio AUD_RESET_TODDR_C>;
>> +                     reset-names = "arb", "rst";
>> +                     amlogic,fifo-depth = <256>;
>> +             };
>> +
>> +             frddr_a: audio-controller@1c0 {
>> +                     compatible = "amlogic,sm1-frddr",
>> +                                  "amlogic,axg-frddr";
>> +                     reg = <0x0 0x1c0 0x0 0x2c>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "FRDDR_A";
>> +                     interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
>> +                     resets = <&arb AXG_ARB_FRDDR_A>,
>> +                              <&clkc_audio AUD_RESET_FRDDR_A>;
>> +                     reset-names = "arb", "rst";
>> +                     amlogic,fifo-depth = <512>;
>> +             };
>> +
>> +             frddr_b: audio-controller@200 {
>> +                     compatible = "amlogic,sm1-frddr",
>> +                                  "amlogic,axg-frddr";
>> +                     reg = <0x0 0x200 0x0 0x2c>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "FRDDR_B";
>> +                     interrupts = <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
>> +                     resets = <&arb AXG_ARB_FRDDR_B>,
>> +                              <&clkc_audio AUD_RESET_FRDDR_B>;
>> +                     reset-names = "arb", "rst";
>> +                     amlogic,fifo-depth = <256>;
>> +             };
>> +
>> +             frddr_c: audio-controller@240 {
>> +                     compatible = "amlogic,sm1-frddr",
>> +                                  "amlogic,axg-frddr";
>> +                     reg = <0x0 0x240 0x0 0x2c>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "FRDDR_C";
>> +                     interrupts = <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
>> +                     resets = <&arb AXG_ARB_FRDDR_C>,
>> +                              <&clkc_audio AUD_RESET_FRDDR_C>;
>> +                     reset-names = "arb", "rst";
>> +                     amlogic,fifo-depth = <256>;
>> +             };
>> +
>> +             arb: reset-controller@280 {
>> +                     compatible = "amlogic,meson-sm1-audio-arb";
>> +                     reg = <0x0 0x280 0x0 0x4>;
>> +                     #reset-cells = <1>;
>> +                     clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
>> +             };
>> +
>> +             tdmin_a: audio-controller@300 {
>> +                     compatible = "amlogic,sm1-tdmin",
>> +                                  "amlogic,axg-tdmin";
>> +                     reg = <0x0 0x300 0x0 0x40>;
>> +                     sound-name-prefix = "TDMIN_A";
>> +                     resets = <&clkc_audio AUD_RESET_TDMIN_A>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>> +                                   "lrclk", "lrclk_sel";
>> +             };
>> +
>> +             tdmin_b: audio-controller@340 {
>> +                     compatible = "amlogic,sm1-tdmin",
>> +                                  "amlogic,axg-tdmin";
>> +                     reg = <0x0 0x340 0x0 0x40>;
>> +                     sound-name-prefix = "TDMIN_B";
>> +                     resets = <&clkc_audio AUD_RESET_TDMIN_B>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>> +                                   "lrclk", "lrclk_sel";
>> +             };
>> +
>> +             tdmin_c: audio-controller@380 {
>> +                     compatible = "amlogic,sm1-tdmin",
>> +                                  "amlogic,axg-tdmin";
>> +                     reg = <0x0 0x380 0x0 0x40>;
>> +                     sound-name-prefix = "TDMIN_C";
>> +                     resets = <&clkc_audio AUD_RESET_TDMIN_C>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TDMIN_C>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>> +                                   "lrclk", "lrclk_sel";
>> +             };
>> +
>> +             tdmin_lb: audio-controller@3c0 {
>> +                     compatible = "amlogic,sm1-tdmin",
>> +                                  "amlogic,axg-tdmin";
>> +                     reg = <0x0 0x3c0 0x0 0x40>;
>> +                     sound-name-prefix = "TDMIN_LB";
>> +                     resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>> +                                   "lrclk", "lrclk_sel";
>> +             };
>> +
>> +             spdifin: audio-controller@400 {
>> +                     compatible = "amlogic,g12a-spdifin",
>> +                                  "amlogic,axg-spdifin";
>> +                     reg = <0x0 0x400 0x0 0x30>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "SPDIFIN";
>> +                     interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
>> +                     <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>> +                     clock-names = "pclk", "refclk";
>> +                     resets = <&clkc_audio AUD_RESET_SPDIFIN>;
>> +             };
>> +
>> +             spdifout_a: audio-controller@480 {
>> +                     compatible = "amlogic,g12a-spdifout",
>> +                                  "amlogic,axg-spdifout";
>> +                     reg = <0x0 0x480 0x0 0x50>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "SPDIFOUT_A";
>> +                     clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
>> +                     <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>> +                     clock-names = "pclk", "mclk";
>> +                     resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
>> +             };
>> +
>> +             tdmout_a: audio-controller@500 {
>> +                     compatible = "amlogic,sm1-tdmout";
>> +                     reg = <0x0 0x500 0x0 0x40>;
>> +                     sound-name-prefix = "TDMOUT_A";
>> +                     resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>> +                                   "lrclk", "lrclk_sel";
>> +             };
>> +
>> +             tdmout_b: audio-controller@540 {
>> +                     compatible = "amlogic,sm1-tdmout";
>> +                     reg = <0x0 0x540 0x0 0x40>;
>> +                     sound-name-prefix = "TDMOUT_B";
>> +                     resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>> +                                   "lrclk", "lrclk_sel";
>> +             };
>> +
>> +             tdmout_c: audio-controller@580 {
>> +                     compatible = "amlogic,sm1-tdmout";
>> +                     reg = <0x0 0x580 0x0 0x40>;
>> +                     sound-name-prefix = "TDMOUT_C";
>> +                     resets = <&clkc_audio AUD_RESET_TDMOUT_C>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TDMOUT_C>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
>> +                              <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
>> +                     clock-names = "pclk", "sclk", "sclk_sel",
>> +                                   "lrclk", "lrclk_sel";
>> +             };
>> +
>> +             spdifout_b: audio-controller@680 {
>> +                     compatible = "amlogic,g12a-spdifout",
>> +                                  "amlogic,axg-spdifout";
>> +                     reg = <0x0 0x680 0x0 0x50>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "SPDIFOUT_B";
>> +                     clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>> +                              <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>> +                     clock-names = "pclk", "mclk";
>> +                     resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>> +             };
>> +
>> +             toacodec: audio-controller@740 {
>> +                     compatible = "amlogic,s4-tocodec";
>> +                     reg = <0x0 0x740 0x0 0x4>;
>> +                     sound-name-prefix = "TOACODEC";
>> +                     resets = <&clkc_audio AUD_RESET_TOACODEC>;
>> +             };
>> +
>> +             tohdmitx: audio-controller@744 {
>> +                     compatible = "amlogic,sm1-tohdmitx",
>> +                                  "amlogic,g12a-tohdmitx";
>> +                     reg = <0x0 0x744 0x0 0x4>;
>> +                     #sound-dai-cells = <1>;
>> +                     sound-name-prefix = "TOHDMITX";
>> +                     resets = <&clkc_audio AUD_RESET_TOHDMITX>;
>> +             };
>> +
>> +             toddr_d: audio-controller@840 {
>> +                     compatible = "amlogic,sm1-toddr",
>> +                                  "amlogic,axg-toddr";
>> +                     reg = <0x0 0x840 0x0 0x2c>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "TODDR_D";
>> +                     interrupts = <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_TODDR_D>;
>> +                     resets = <&arb AXG_ARB_TODDR_D>,
>> +                              <&clkc_audio AUD_RESET_TODDR_D>;
>> +                     reset-names = "arb", "rst";
>> +                     amlogic,fifo-depth = <256>;
>> +             };
>> +
>> +             frddr_d: audio-controller@880 {
>> +                      compatible = "amlogic,sm1-frddr",
>> +                                   "amlogic,axg-frddr";
>> +                     reg = <0x0 0x880 0x0 0x2c>;
>> +                     #sound-dai-cells = <0>;
>> +                     sound-name-prefix = "FRDDR_D";
>> +                     interrupts = <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
>> +                     clocks = <&clkc_audio AUD_CLKID_FRDDR_D>;
>> +                     resets = <&arb AXG_ARB_FRDDR_D>,
>> +                              <&clkc_audio AUD_RESET_FRDDR_D>;
>> +                     reset-names = "arb", "rst";
>> +                     amlogic,fifo-depth = <256>;
>> +             };
>> +
>> +             tdmout_pad: audio-controller@E58 {
>> +                     compatible = "amlogic,s4-tdmout-pad";
>> +                     reg = <0x0 0xe58 0x0 0x28>;
>> +             };
>> +     };
>> +
>> +     pdm: audio-controller@331000 {
>> +             compatible = "amlogic,sm1-pdm",
>> +                          "amlogic,axg-pdm";
>> +             reg = <0x0 0x331000 0x0 0x34>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "PDM";
>> +             clocks = <&clkc_audio AUD_CLKID_PDM>,
>> +                      <&clkc_audio AUD_CLKID_PDM_DCLK>,
>> +                      <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
>> +             clock-names = "pclk", "dclk", "sysclk";
>> +             resets = <&clkc_audio AUD_RESET_PDM>;
>> +             assigned-clocks = <&clkc_audio AUD_CLKID_PDM_DCLK_SEL>,
>> +                               <&clkc_audio AUD_CLKID_PDM_SYSCLK_SEL>;
>> +             assigned-clock-parents = <&clkc_pll CLKID_HIFI_PLL>,<&clkc_pll CLKID_HIFI_PLL>;
>> +     };
>> +      acodec: audio-controller@1A000 {
>> +             compatible = "amlogic,t9015";
>> +             reg = <0x0 0x1A000 0x0 0x14>;
>> +             #sound-dai-cells = <0>;
>> +             sound-name-prefix = "ACODEC";
>> +             clocks = <&clkc_periphs CLKID_ACODEC>;
>> +             clock-names = "pclk";
>> +             resets = <&reset RESET_ACODEC>;
>> +     };
>> +
>> +};
> --
> Jerome
