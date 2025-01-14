Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020137.outbound.protection.outlook.com [52.101.128.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE7B236A8B;
	Tue, 14 Jan 2025 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858516; cv=fail; b=bbNlQHmPsgqsci0pDXjstsKf6H1qrW4DJG3+ms7iDn9Xo3wJx672n7iXA5yNAovhQeBIJoc9J0FVPWhK1uWQDkmUlnpa2ycKeXBZnNqmBattu4NJbKOXTOZiZojD+Z+cuuFF8z68mvhIA5AT1bcCq3P9imXDjok9BdqiaTD56GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858516; c=relaxed/simple;
	bh=ss9ZMGlUHLtOyMlPSefAbzigVrapWtqeIUuNUDjPz1E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A1GMMwvW668gL4i/QEWlyuEdmJDfblGPm3oOmBWdNXCqUoBjMfw0ZJI9MfZUAzZ0oGdSdY8jaJR2jcpHd1zUgi842TqDfONaKzWNx977PQYvUNLz3L0uME60rfdHlOdqT4sBzglhwGrSi7mBom9oqpEDKkBmUCNySwHcon4rRxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=nKab9X28; arc=fail smtp.client-ip=52.101.128.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="nKab9X28"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKREVpWlMmubI/LSzBx9QkPeW3UViRRUNpYO843C2Q8ya2heKGdG2nVG4Yi78aHoCLUDyI+fv69hFesZQqy1bKtDGVp6MneHnp/SNKodEsH/z68Unz6oi2Mgax9mW4/qCFKZkdUYYHfSSshXZVY9k6ZMcd1zJFKR38LGdK1k2KGsTiwXVMsbyjM6KYQhw42swYS9KTknjk/kliLO6qIKgT1LCGB4HItYhuXCZ0Yv+sDTih1lXz0Gu6ol77sOAv10QPfIh/ufPcA/PnotZn3L7nkWsQnITm3dqf7B1dJtob2/8IO6N1jaB2jF3RB6sAFl73GeGlul26uJxSBIpboN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6M+Aq3iD1iSZwtU7ci0QHqNGElyK7JiLBPkduGAzfw=;
 b=OTZISEWn6mPK0i5VNN621JLcrcPSHxiqKVk3NEJZXEOZ9RUV3WUAvnY7G8H4FIXkM/eGvHkM1ace1z7ZOZMVREL6ya2PkTx5SMedQ+agQMqjVLVCu/hhofnvG5AZzknn85CYSzV0ovUmJFnbgVo8ukIEHvx8xPj0KSYku+55f1hE//vLUoH24J6B5Dc9y8d8nCqVgC9TlCcL4ZhFKOEa9LiLjGwa2rn19Zaul9kn3ek9ZZrV9nBsxrnUcnEgz2c0iKXmL0BP8NRtRYmN+64Huh6ROjPJlUBNAj+2i8T1EVAyN4NZASXzgwMGQLC6WwDf6DXMRr2CFQuzghj3hHKm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6M+Aq3iD1iSZwtU7ci0QHqNGElyK7JiLBPkduGAzfw=;
 b=nKab9X285hh3e87prpOmniOL2n4dSuhSVgo+L/RE6Qe6PrFS5Gzb54GjRaZvm008axmvDwaUsbDSrqOCRDT2VC+u0H6HbcdnBPRi4rSoeYAvmi+EGH4q7U2Mj8G482aza0kzhM8IqNbNvEqroYwXADGcaMpEzF6zfQicioRlUCkUWpSi/zu9TJVxgmBHJvuWzQxmwJSmR6KxS31u6mSvJrEofG1TKeMVuWz5IHEeKjYS9mDtXnN1EIxSWa/1o7GtkWpnE0Pym5KPmzG/80vXOXR9XcOTDRzAnQe5UPQgAMzKq5O5auYPgC9DW0mfMmiRhs8KmB/ogTDZj89b0Sk9kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SI6PR03MB8707.apcprd03.prod.outlook.com (2603:1096:4:253::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 12:41:50 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 12:41:50 +0000
Message-ID: <31ce586b-a7d9-4f69-8ca4-4f98cfbeee1d@amlogic.com>
Date: Tue, 14 Jan 2025 20:41:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
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
 <1jh6617hwf.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jh6617hwf.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SI6PR03MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b4172e-79ec-4530-1837-08dd3498d128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWQ2OTM3LzNmU0xPUHNHZ0VRTUhDMlQxUXhWRkNqNzhlbTlLWTZXM3NBYnJN?=
 =?utf-8?B?MWZpN3dkbDhyN1BLWHlKQ28rZERncXFYZ3dCS3FTN1grOXp6VWtObC91bUV3?=
 =?utf-8?B?M3BNbkRSN0FDZXBiQm9PTUJueDR6NWYwOEs3SVdBa0dEbll3NzBkSGRVV1Bi?=
 =?utf-8?B?MXNaWm1CaDFrbDJlelkvVHMyVVd0dGV1cjNsbEpzdmJyUlpsNmEzeWlXREE4?=
 =?utf-8?B?TS9BZS9CWVhrYzFyU1hSOUUrQXNxUjN3dHNBUjRUeEluQXNUTW8xbW9PSVFN?=
 =?utf-8?B?SjVyekxrTmUrcU1abFBuRjdyRWtGVndjN1pieGdJdUZmYkhvQVhyREkyREYw?=
 =?utf-8?B?M0NRU2FYdTRYODdRcUkrbCtEVmVWWkFPWFljaTZmNm5ZazJabWVVNWhOQW9X?=
 =?utf-8?B?QUVocUpua1NXS1R0Z0FsS3hKUGNDbzd2MnQzb0Yxb3M5cHNtMlR6eHlheTdp?=
 =?utf-8?B?bnI0Tnc2UjNhVVBXb2NzZFV4Qlg4clpyT0xWQUpjNXVHVzFYK1p5SHU2SFRn?=
 =?utf-8?B?MmljYWZjd0JCZDNJTHFVZGpzb1BySTZlY0ZsNlBzeXJuVDBic0FYOVZteTdG?=
 =?utf-8?B?RjFuUERISERCdnVnMjRBT3l3NHZabkM0ajBmbytoUVlXUnZTOGFkalpOWGEy?=
 =?utf-8?B?Z3lQQjhqbHlGYmlnWW1iejlOYjBoay9FZUtDdUpxbVhxUEZ2UHhDUzFaRkxH?=
 =?utf-8?B?ZVUzY3pvK1dRWHZsYkRrbzhPU2NpQ255MjYwYmdlK3crQkR2cERGRFZMYklM?=
 =?utf-8?B?ZThZQW5QSHFpd00zaEcxN21pZGtGQkJnRDhieVpVQWE2UFdDWG1lR295SCt3?=
 =?utf-8?B?aWhmdHIrNjFBYjl6bTEvUXkzSlJ3NXcxd041M3hCcTQ5K2ZlSWhqV0xCQW1n?=
 =?utf-8?B?dzV5VENoN0x5WEVUYjJOcE16YytPKzNMS0xIS2QxMDJqL0ZXWVVacnBQdG11?=
 =?utf-8?B?Zy9pbmQ0OWZRb2dVV3NLV09XYkl5Y3lEQU9UdE5mMWtNSm5wNVFyTTZqWWdZ?=
 =?utf-8?B?cTdES3B6QVppVzNiQTVWanUyNGlqNjliTlRDWFp6MXhFRkQzUHhnUlpSb1FZ?=
 =?utf-8?B?WDluV0dWdnFnTXREM2NHM0xOajdOcjRGbm5ieGRMamdyeU1Qdys0dXFzN3BY?=
 =?utf-8?B?SE9MZHBRU2ZBOWwzZXRCT2c4ajBaVEx1bm9uVXFXZkI4clZuZk1DdVdGYzhW?=
 =?utf-8?B?SzBOanpWR2VrTEJrVVRDVFowT3pCUkt3MWtENnFHSzh4c09WekY3OG1QakVX?=
 =?utf-8?B?am1ZdTlhQStGemtlQTUyeVE3TGNMTDlsUUU3RUorSHVrM1VuNC9zbzB3cVNL?=
 =?utf-8?B?Wmord3pRN3R3MXhJTllNbC9DOVQ4cUlWeWZKS04wampNMXcxckJTODE5L0ky?=
 =?utf-8?B?U0lySjFLQ3BlMzBicFpjaXBiZUpxaHNQZnMxdUN1YWJiTUFLQjkrTG5iNWpl?=
 =?utf-8?B?eXgzajNOM3Y1TWJzRThuNW5zdFBYSkhGbmVMTEhNeUx1SXQwNE1FSlp6RDhU?=
 =?utf-8?B?bjVadHVTaDE4TkFjZTB4c3UrRXpNQ0ZBWndBM0tuM2lzcXZ1amxXWURDQWg0?=
 =?utf-8?B?RlhBeXZUbjhWbWoxRW1RcWR1ZTFpZXloRU9vc1F0RWFZNUlaMElRcEl6aDJT?=
 =?utf-8?B?bHNJTmVhSFJsUW43STYvbWhhU0lXZGRJZ0UwaTZWd0FMN01Bc094U0p6UDVx?=
 =?utf-8?B?V0RmZ0tDZm5VNmJVU2RET0RFcjY4MFA1U2F2Qnk2NDJMTmRXRFNSc0c2UGsy?=
 =?utf-8?B?aTI3aDVTN1N3ZW1kNEduOFh4UzdSTmpqL2hLandXTTU0UE56d1ZsMDZUTVFC?=
 =?utf-8?B?bFdwOTVPRFF3V2tqa0d1Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUltU2hGZjVqa2dTcEtaVEFiRHNXVUdlNTRYbkRxV1hKRmkzV1J6d0RrRHhY?=
 =?utf-8?B?R00vK2pNcmFpTFVYbVJCZGNHa2RXR2Zodi9ERVJIQUY1NUNZSE5tbWRoSHFC?=
 =?utf-8?B?Z1g0cGh0YU12Qk1pWlpaUFA3VlZob3BoY2lwamI1V0lCNnZoNjdHQUV6Q3BZ?=
 =?utf-8?B?Vyt1WUdkNGxXU1RLbWtvMlFxK1ZrbkkrSERrblZQTXo0VXpBMUVCNkV2VEFN?=
 =?utf-8?B?TmYzTEVBbk9VKzdqeXhNVEc3cXc1bjlTbHkxSllMVVIrNEtwT1k0TVhGSDBv?=
 =?utf-8?B?YkhOdjdpcW9ycmpoTzB2dzRpc3VoMDBPQVhCbWcyZkVIa2xZUHUvcWVnbC9C?=
 =?utf-8?B?QkRoVFplM211QzdZc1BKWDBHdTdFbG8xMEd3TWRnUVArNkd5MG9KZHhOQkVj?=
 =?utf-8?B?bVZha1dHU3VZM0JBSFhrWVlkdzhjUU51ZWdjd3hVWXBXWE1ocEQvdEJmMnl0?=
 =?utf-8?B?K295MXMzSFltazdhYi94K29WOEJVc1dMR0N6ZWthMk53elM3N3hEUFpZK2RE?=
 =?utf-8?B?R0k4aE1tMlFVTnUvWG83d29oNEN4K3doamw5RnMySWhvb1NEd2NrSmg3ZGNo?=
 =?utf-8?B?dk5MYTkvb29NcHJhdkI3UDZSL2k2bDJPOEVaZEtUNEc2WVlJYnRqb0k0SjE1?=
 =?utf-8?B?emhaNTBVbUk2Y0xwdmlKVlZ3UXVEZHltWGNESHZxVHpiK05Rbnp5RldiWmw1?=
 =?utf-8?B?c0hSY2t2ZjYwbzMwcDZGby9HVUtxMXpZbXJ4eGVLV0VSTEpsV2FrWnlacHZy?=
 =?utf-8?B?QWUzSnlNVEhDZnppVUczNWtkUlJXNU10MnR4dzAwRDVVQmF3ZGFSSUNiSGpQ?=
 =?utf-8?B?TnJVYklHVUs5QnpoMjlEZkhBWEkvZE15cWtmN2hZWm5hWGgwci9aVmZDa21E?=
 =?utf-8?B?R3ZuWmRPWWhqVEpvQ1lJME1Zck1nTDh1MWRSYStNZlpGMWswWHNVR1drTXIy?=
 =?utf-8?B?Y1FJSWNzUzJNdEFXNnVWN0dWa1Q3VnZPZmpnTWd2eHZFUEZLeEdSaTM2d0Fp?=
 =?utf-8?B?QlQ2UUNidm5WTTZ2VVRMRkRtZkk4am1iYjRhU1k2Z3ZEWGx2RXFmZjQwZkpx?=
 =?utf-8?B?Tmt2aHo1dlkva09UWUNpdzlXeTBHeVlGdmZPam00U1RiWHhYKzBpZ3BxSFd5?=
 =?utf-8?B?MnVXUW11ejRISy80cEUzcE51SlBEMU9NQTNZbW9mVXRTK25ZK01naU1xL251?=
 =?utf-8?B?VzlIMXFRT05KemR6VzZrakhacTZXU01qRjR3Y09NekVKbnpuYjRoQTZWN2V0?=
 =?utf-8?B?TWpnOXU0UVBGblY5NXloaVA5aW9BVzBWM1lWbmx6OFZRVTJPemF6dmgwc3px?=
 =?utf-8?B?MHF0RVdsOGxUL2hIRFgyUXhIcXRXTFJTZ0ZnUDZrd3pKcGF3MGtnY2dFVENm?=
 =?utf-8?B?YXRFQzN3eXZxdHVyMlFPUWFPN25JR05LMUJmOEQ3aEMzd3pPYVBxYjBqV2dF?=
 =?utf-8?B?ME9oc1YxTWxHcDFDQy9CQXJtNDdGVE9GMkFRVHozNzNBMUNmcjFtOGtTdW1a?=
 =?utf-8?B?N3pwMk5sdWVxeVliaWtwUm5aMS9UaVpHOWtMZzhlNWRaRUtMYkpTNjN0enVB?=
 =?utf-8?B?WHRyUDdsNW8xSFpGMy9jMmxoM1B5YVNxUlRDamQ5TEdTdnF3M2MwNVZ0R2pG?=
 =?utf-8?B?Y3FKMGV2TTRGbVNHeEw1azNxRWYyME8xaTFQaXpaYkc5MExJWUpqNVhXMjlF?=
 =?utf-8?B?VDVIVEd6aW9qRTB1VWgydzFLbzNscGM1SHRaMlJqWHJFMzgvbG1FOHVQR25R?=
 =?utf-8?B?M0xmSVBOUklHRlJtRjZYbVlZajdsaXBwTFY2ZHZRWE9JRFh5NUtkTUpkdi9S?=
 =?utf-8?B?d1g2aTZ6cm92NDBCd2JMOG5GV3hqdllta21taHNiclRta2N2RDBZZUJRMWZk?=
 =?utf-8?B?OHk1dW1USVZNRDdmL0VSQkpKV1RIcFBjM3Y0RitHbmdqYklpc1hFTkE2WlFG?=
 =?utf-8?B?ZVVFVHJuR3lCRXVhaitqUmFvSlpnZVJuaUxnZm54N1pUVHArbnZZanpEQWxu?=
 =?utf-8?B?azc1YmpzOEtkbklsMTN1TTRreS9mLzFqZ1VtYzIwZVgwS3dyUFpuQVN0NFhJ?=
 =?utf-8?B?aG5Gd3hHd01sZ3ZNdXRqZVdLdzY3SVFZMGg2K1Y5QkNuMTMzTmlCTUtDOVRZ?=
 =?utf-8?B?bmJNOCt3MWY1SVNhMDkwTG5HSTNGODdXWU5uV0RaK21vQm9Vbk5MVXJXdVNJ?=
 =?utf-8?B?cEE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b4172e-79ec-4530-1837-08dd3498d128
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 12:41:50.7004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rC64f7SNku7Jc+RSqW9tHVxcA29FdSHtQbktpihh0CVJ2EYHJfAF/YPoXnu3hy5KOj5JaWSENirF2n5MexFoB2ie80hVHPqZV1ASOp24eEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8707


在 2025/1/14 19:29, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On Tue 14 Jan 2025 at 16:16, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>
>>>> +static const char * const s4_tdmout_sel_texts[] = {
>>>> +     "TDM_D0", "TDM_D1", "TDM_D2", "TDM_D3", "TDM_D4", "TDM_D5", "TDM_D6", "TDM_D7",
>>>> +     "TDM_D8", "TDM_D9", "TDM_D10", "TDM_D11", "TDM_D12", "TDM_D13", "TDM_D14", "TDM_D15",
>>>> +     "TDM_D16", "TDM_D17", "TDM_D18", "TDM_D19", "TDM_D20", "TDM_D21", "TDM_D22", "TDM_D23",
>>>> +     "TDM_D24", "TDM_D25", "TDM_D26", "TDM_D27", "TDM_D28", "TDM_D29", "TDM_D30", "TDM_D31"
>>>> +};
>>> This thing does not belong in ASoC. This is clearly yet another layer of
>>> pinctrl. Please deal with it there.
>> Thanks for your suggestion, add audio pinctrl driver to control the which tdm_dx pin can map the which tdm lane_x
>> for example
>>        tdm_d6_pin {
>>                mux {
>>                        groups = "tdm_d6";
>>                        function = "tdmoutb_lane0";
>>                };
>>        }
>> tdm_d6 pin map the tdmoutb lane 0, right ?
> possibly
>
>>>> +
>>>> +static const struct soc_enum tdmout_sel_enum =
>>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tdmout_sel_texts),
>>>> +                     s4_tdmout_sel_texts);
>>>> +
> [...]
>
>>>> diff --git a/sound/soc/meson/s4-tocodec-control.c b/sound/soc/meson/s4-tocodec-control.c
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..e5d824fae0eba545d38dc36e2566e7cee590e7f5
>>>> --- /dev/null
>>>> +++ b/sound/soc/meson/s4-tocodec-control.c
>>> There is already a to-acodec driver a not reason has been provided as to why a
>>> completly new driver is required.
>>>
>>> Please have look at the existing driver and do try to use it.
>>> If you need to do things so differently, clear justification are necessary.
>> for g12a-toacodec.c, we find the tocodec clock source can't get the clock
>> id from the tdm Be device,
> This is clearly documented limitation of the current to-acodec driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/meson/g12a-toacodec.c?h=v6.13-rc7#n91
>
> While it is a limitation, it is a manageable one considering the amount
> of master clocks available and the fact the master should be manually
> assinged to the output pad, which you did not do.
>
> See the u200:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts?h=v6.13-rc7#n569
>
> You are more than welcome to help fix this limitation in the current
> driver but just adding a fork is not OK
>
> I would suggest to start with what is currently available and move on to
> fixing this as a 2nd step, if you want to.
>
>> and set it by the kcontrol from user,  For different soc chips, The
>> kcontrol value maybe different, The kcontrol configuration doesn't look
>> very friendly for user
>>
>> so we use dapm route path to manage it,
>> fe(fddr)->be(tdm)->(tocodec)->(codec),  and use the aux-devs to register,
>> and sound card only include the
>>
>> sound-dai = <&tdmif_a>
>>
>> codec-0 {
>>                  sound-dai = <&acodec>;
>>   };
>>
>> and not include
>>
>> codec-1 {
>>                  sound-dai = <&toacodec>;
>>   };
>>
>> when tdm work, only connect the tocodec path
>>
>>   "TDM_A Playback" ->"TOACODEC TDMA"->"TOACODEC INPUT SRC"
>>
>> iterate it find the be device ,and get the struct axg_tdm_stream, so we can
>> get the tdm clock id
>>
>> Take into account behavioral differences, we add new tocodec driver
>> for s4
> Still not seeing sufficient reason to make another driver.
it is a good idea, i will add the change for s4 base on g12a-toacodec.c
>
>>>> @@ -0,0 +1,376 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2023 Amlogic, Inc. All rights reserved
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +#include <linux/of_platform.h>
>>>> +#include <linux/regmap.h>
>>>> +#include <sound/soc.h>
>>>> +#include <sound/soc-dai.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/kernel.h>
>>>> +#include<linux/kstrtox.h>
>>>> +#include <linux/clk-provider.h>
>>>> +#include <linux/reset.h>
>>>> +#include "axg-tdm.h"
>>>> +
>>>> +#define TOACODEC_CTRL0                       0x0
>>>> +
>>>> +#define CTRL0_ENABLE_SHIFT           31
>>>> +#define CTRL0_BCLK_ENABLE_SHIFT              30
>>>> +#define CTRL0_MCLK_ENABLE_SHIFT              29
>>>> +#define CTRL0_BLK_CAP_INV_SHIFT              9
>>>> +
>>>> +#define TDM_IFACE 0
>>>> +#define TDM_A_PAD 0
>>>> +#define TDM_B_PAD 1
>>>> +#define TDM_C_PAD 2
>>>> +
>>>> +struct toacodec {
>>>> +     struct regmap_field *field_dat_sel;
>>>> +     struct regmap_field *field_lrclk_sel;
>>>> +     struct regmap_field *field_bclk_sel;
>>>> +     struct regmap_field *field_mclk_sel;
>>>> +};
>>>> +
>>>> +struct toacodec_match_data {
>>>> +     const struct snd_soc_component_driver *component_drv;
>>>> +     const struct reg_field field_dat_sel;
>>>> +     const struct reg_field field_lrclk_sel;
>>>> +     const struct reg_field field_bclk_sel;
>>>> +     const struct reg_field field_mclk_sel;
>>>> +};
>>>> +
>>>> +static const struct regmap_config tocodec_regmap_cfg = {
>>>> +     .reg_bits       = 32,
>>>> +     .val_bits       = 32,
>>>> +     .reg_stride     = 4,
>>>> +     .max_register   = 0x1,
>>>> +};
>>>> +
>>>> +#define S4_LANE_OFFSET 8
>>>> +
>>>> +static const char * const s4_tocodec_lane_sel_texts[] = {
>>>> +     "Lane0", "Lane1", "Lane2", "Lane3", "Lane4", "Lane5", "Lane6", "Lane7"
>>>> +};
>>>> +
>>>> +static const struct soc_enum s4_tocodec_lane_sel_enum =
>>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tocodec_lane_sel_texts),
>>>> +                     s4_tocodec_lane_sel_texts);
>>>> +
>>>> +static const struct snd_kcontrol_new s4_tocodec_lane_sel =
>>>> +     SOC_DAPM_ENUM("TOCODEC LANE SEL", s4_tocodec_lane_sel_enum);
>>>> +
>>>> +static const char * const s4_tocodec_src_sel_texts[] = {
>>>> +     "TDMA", "TDMB", "TDMC"
>>>> +};
>>>> +
>>>> +static const struct soc_enum s4_tocodec_src_sel_enum =
>>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tocodec_src_sel_texts),
>>>> +                     s4_tocodec_src_sel_texts);
>>>> +
>>>> +static const struct snd_kcontrol_new s4_tocodec_src_sel =
>>>> +     SOC_DAPM_ENUM("TOCODEC SEL", s4_tocodec_src_sel_enum);
>>>> +
>>>> +static const struct snd_kcontrol_new s4_toacodec_out_enable =
>>>> +     SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>>>> +                                 CTRL0_ENABLE_SHIFT, 1, 0);
>>>> +
>>>> +static struct snd_soc_dai *tocodec_tdm_get_ahead_be(struct snd_soc_dapm_widget *w)
>>>> +{
>>>> +     struct snd_soc_dapm_path *p;
>>>> +     struct snd_soc_dai *be;
>>>> +
>>>> +     snd_soc_dapm_widget_for_each_source_path(w, p) {
>>>> +             if (!p->connect)
>>>> +                     continue;
>>>> +             if (p->source->id == snd_soc_dapm_dai_in)
>>>> +                     return (struct snd_soc_dai *)p->source->priv;
>>>> +             be = tocodec_tdm_get_ahead_be(p->source);
>>>> +             if (be && be->id == TDM_IFACE)
>>>> +                     return be;
>>>> +     }
>>>> +     return NULL;
>>>> +}
>>>> +
>>>> +static unsigned int aml_simple_strtoull(const char *cp)
>>>> +{
>>>> +     unsigned int result = 0;
>>>> +     unsigned int value = 0;
>>>> +     unsigned int len = strlen(cp);
>>>> +
>>>> +     while (len != 0) {
>>>> +             len--;
>>>> +             value = isdigit(*cp);
>>>> +             if (value) {
>>>> +                     value = *cp - '0';
>>>> +             } else {
>>>> +                     cp++;
>>>> +                     continue;
>>>> +             }
>>>> +             cp++;
>>>> +             result = result * 10 + value;
>>>> +     }
>>>> +     return result;
>>>> +}
>>>> +
>>>> +static int aml_get_clk_id(const char *name)
>>>> +{
>>>> +     int clk_id = 0;
>>>> +
>>>> +     if (strstr(name, "mst_a"))
>>>> +             clk_id = 0;
>>>> +     else if (strstr(name, "mst_b"))
>>>> +             clk_id = 1;
>>>> +     else if (strstr(name, "mst_c"))
>>>> +             clk_id = 2;
>>>> +     else if (strstr(name, "mst_d"))
>>>> +             clk_id = 3;
>>>> +     else if (strstr(name, "mst_e"))
>>>> +             clk_id = 4;
>>>> +     else if (strstr(name, "mst_f"))
>>>> +             clk_id = 5;
>>>> +
>>>> +     return clk_id;
>>>> +}
>>>> +
>>>> +static int aml_tocodec_sel_set(struct snd_soc_dapm_widget *w)
>>>> +{
>>>> +     struct snd_soc_dai *be;
>>>> +     struct axg_tdm_stream *stream;
>>>> +     struct axg_tdm_iface *iface;
>>>> +     struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>>>> +     struct toacodec *priv = snd_soc_component_get_drvdata(component);
>>>> +     unsigned int tdm_id = TDM_A_PAD;
>>>> +     const char *dai_widget_name;
>>>> +     struct snd_soc_dapm_path *p;
>>>> +     unsigned int lane = 0;
>>>> +     unsigned int val = 0;
>>>> +     struct clk *sclk, *mclk;
>>>> +     char *clk_name;
>>>> +     int mclk_id, sclk_id;
>>>> +
>>>> +     be = tocodec_tdm_get_ahead_be(w);
>>>> +     if (!be) {
>>>> +             dev_err(component->dev, "%s not find the be\n", __func__);
>>>> +             return -EINVAL;
>>>> +     }
>>>> +     stream = snd_soc_dai_dma_data_get_playback(be);
>>>> +     if (!stream) {
>>>> +             dev_err(component->dev, "%s not find the stream\n", __func__);
>>>> +             return -EINVAL;
>>>> +     }
>>>> +     /*we like to use dai id, but it is fixed val*/
>>>> +     dai_widget_name = be->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;
>>>> +     if (strstr(dai_widget_name, "TDM_A"))
>>>> +             tdm_id = TDM_A_PAD;
>>>> +     else if (strstr(dai_widget_name, "TDM_B"))
>>>> +             tdm_id = TDM_B_PAD;
>>>> +     else if (strstr(dai_widget_name, "TDM_C"))
>>>> +             tdm_id = TDM_C_PAD;
>>>> +     snd_soc_dapm_widget_for_each_source_path(w, p) {
>>>> +             if (p->connect && p->name) {
>>>> +                     lane = aml_simple_strtoull(p->name);
>>>> +                     val = lane + tdm_id * S4_LANE_OFFSET;
>>>> +                     regmap_field_write(priv->field_dat_sel, val);
>>>> +             }
>>>> +     }
>>>> +     iface = stream->iface;
>>>> +     mclk = iface->mclk;
>>>> +     sclk = iface->sclk;
>>>> +     mclk_id = aml_get_clk_id(__clk_get_name(mclk));
>>>> +     sclk_id = aml_get_clk_id(__clk_get_name(sclk));
>>>> +     regmap_field_write(priv->field_mclk_sel, mclk_id);
>>>> +     regmap_field_write(priv->field_bclk_sel, sclk_id);
>>>> +     regmap_field_write(priv->field_lrclk_sel, sclk_id);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int tocodec_sel_event(struct snd_soc_dapm_widget *w,
>>>> +                          struct snd_kcontrol *control,
>>>> +                          int event)
>>>> +{
>>>> +     struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>>>> +     int ret = 0;
>>>> +
>>>> +     switch (event) {
>>>> +     case SND_SOC_DAPM_PRE_PMU:
>>>> +             ret = aml_tocodec_sel_set(w);
>>>> +             break;
>>>> +
>>>> +     case SND_SOC_DAPM_PRE_PMD:
>>>> +             break;
>>>> +
>>>> +     default:
>>>> +             dev_err(component->dev, "Unexpected event %d\n", event);
>>>> +             return -EINVAL;
>>>> +     }
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static int tocodec_clk_enable(struct snd_soc_dapm_widget *w,
>>>> +                           struct snd_kcontrol *control,
>>>> +                           int event)
>>>> +{
>>>> +     int ret = 0;
>>>> +     unsigned int mask = 0, val = 0;
>>>> +     struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>>>> +
>>>> +     snd_soc_component_update_bits(component, TOACODEC_CTRL0,
>>>> +                                   1 << CTRL0_BLK_CAP_INV_SHIFT, 1 << CTRL0_BLK_CAP_INV_SHIFT);
>>>> +     switch (event) {
>>>> +     case SND_SOC_DAPM_PRE_PMU:
>>>> +             mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
>>>> +             val = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
>>>> +             snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);
>>>> +             break;
>>>> +     case SND_SOC_DAPM_PRE_PMD:
>>>> +             mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
>>>> +             val = 0 << CTRL0_MCLK_ENABLE_SHIFT | 0 << CTRL0_BCLK_ENABLE_SHIFT;
>>>> +             snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);
>>>> +             break;
>>>> +     default:
>>>> +             dev_err(component->dev, "Unexpected event %d\n", event);
>>>> +             return -EINVAL;
>>>> +     }
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
>>>> +     SND_SOC_DAPM_MUX_E("Lane SRC", SND_SOC_NOPM, 0, 0,
>>>> +                        &s4_tocodec_lane_sel, tocodec_sel_event,
>>>> +                        (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
>>>> +     SND_SOC_DAPM_MUX("INPUT SRC", SND_SOC_NOPM, 0, 0, &s4_tocodec_src_sel),
>>>> +     SND_SOC_DAPM_SWITCH_E("OUT EN", SND_SOC_NOPM, 0, 0,
>>>> +                           &s4_toacodec_out_enable, tocodec_clk_enable,
>>>> +                             (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
>>>> +     SND_SOC_DAPM_AIF_IN("TDMA", NULL, 0, SND_SOC_NOPM, 0, 0),
>>>> +     SND_SOC_DAPM_AIF_IN("TDMB", NULL, 0, SND_SOC_NOPM, 0, 0),
>>>> +     SND_SOC_DAPM_AIF_IN("TDMC", NULL, 0, SND_SOC_NOPM, 0, 0),
>>>> +     SND_SOC_DAPM_OUT_DRV("Lane0", SND_SOC_NOPM, 0, 0, NULL, 0),
>>>> +     SND_SOC_DAPM_OUT_DRV("Lane1", SND_SOC_NOPM, 0, 0, NULL, 0),
>>>> +     SND_SOC_DAPM_OUT_DRV("Lane2", SND_SOC_NOPM, 0, 0, NULL, 0),
>>>> +     SND_SOC_DAPM_OUT_DRV("Lane3", SND_SOC_NOPM, 0, 0, NULL, 0),
>>>> +     SND_SOC_DAPM_OUT_DRV("Lane4", SND_SOC_NOPM, 0, 0, NULL, 0),
>>>> +     SND_SOC_DAPM_OUT_DRV("Lane5", SND_SOC_NOPM, 0, 0, NULL, 0),
>>>> +     SND_SOC_DAPM_OUT_DRV("Lane6", SND_SOC_NOPM, 0, 0, NULL, 0),
>>>> +     SND_SOC_DAPM_OUT_DRV("Lane7", SND_SOC_NOPM, 0, 0, NULL, 0),
>>>> +     SND_SOC_DAPM_OUTPUT("TDM_TO_ACODEC"),
>>>> +};
>>>> +
>>>> +static const struct snd_soc_dapm_route s4_tocodec_dapm_routes[] = {
>>>> +     { "INPUT SRC", "TDMA", "TDMA"},
>>>> +     { "INPUT SRC", "TDMB", "TDMB"},
>>>> +     { "INPUT SRC", "TDMC", "TDMC"},
>>>> +     { "Lane0", NULL, "INPUT SRC" },
>>>> +     { "Lane1", NULL, "INPUT SRC"},
>>>> +     { "Lane2", NULL, "INPUT SRC"},
>>>> +     { "Lane3", NULL, "INPUT SRC"},
>>>> +     { "Lane4", NULL, "INPUT SRC"},
>>>> +     { "Lane5", NULL, "INPUT SRC"},
>>>> +     { "Lane6", NULL, "INPUT SRC"},
>>>> +     { "Lane7", NULL, "INPUT SRC"},
>>>> +     { "Lane SRC", "Lane0", "Lane0"},
>>>> +     { "Lane SRC", "Lane1", "Lane1"},
>>>> +     { "Lane SRC", "Lane2", "Lane2"},
>>>> +     { "Lane SRC", "Lane3", "Lane3"},
>>>> +     { "Lane SRC", "Lane4", "Lane4"},
>>>> +     { "Lane SRC", "Lane5", "Lane5"},
>>>> +     { "Lane SRC", "Lane6", "Lane6"},
>>>> +     { "Lane SRC", "Lane7", "Lane7"},
>>>> +     { "OUT EN", "Switch", "Lane SRC"},
>>>> +     { "TDM_TO_ACODEC", NULL, "OUT EN"},
>>>> +
>>>> +};
>>>> +
>>>> +static const struct snd_soc_component_driver s4_tocodec_component_drv = {
>>>> +     .dapm_widgets           = s4_toacodec_widgets,
>>>> +     .num_dapm_widgets       = ARRAY_SIZE(s4_toacodec_widgets),
>>>> +     .dapm_routes            = s4_tocodec_dapm_routes,
>>>> +     .num_dapm_routes        = ARRAY_SIZE(s4_tocodec_dapm_routes),
>>>> +};
>>>> +
>>>> +static const struct toacodec_match_data s4_toacodec_match_data = {
>>>> +     .component_drv  = &s4_tocodec_component_drv,
>>>> +     .field_dat_sel  = REG_FIELD(TOACODEC_CTRL0, 16, 20),
>>>> +     .field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
>>>> +     .field_bclk_sel = REG_FIELD(TOACODEC_CTRL0, 4, 6),
>>>> +     .field_mclk_sel = REG_FIELD(TOACODEC_CTRL0, 0, 2),
>>>> +};
>>>> +
>>>> +static const struct of_device_id s4_tocodec_of_match[] = {
>>>> +     {
>>>> +             .compatible = "amlogic,s4-tocodec",
>>>> +             .data = &s4_toacodec_match_data,
>>>> +     }, {}
>>>> +};
>>>> +
>>>> +MODULE_DEVICE_TABLE(of, s4_tocodec_of_match);
>>>> +
>>>> +static int tocodec_probe(struct platform_device *pdev)
>>>> +{
>>>> +     const struct toacodec_match_data *data;
>>>> +     struct device *dev = &pdev->dev;
>>>> +     struct toacodec *priv;
>>>> +     void __iomem *regs;
>>>> +     struct regmap *map;
>>>> +     int ret;
>>>> +
>>>> +     data = device_get_match_data(dev);
>>>> +     if (!data)
>>>> +             return dev_err_probe(dev, -ENODEV, "failed to match device\n");
>>>> +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>> +     if (!priv)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     platform_set_drvdata(pdev, priv);
>>>> +
>>>> +     ret = device_reset(dev);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     regs = devm_platform_ioremap_resource(pdev, 0);
>>>> +     if (IS_ERR(regs))
>>>> +             return PTR_ERR(regs);
>>>> +
>>>> +     map = devm_regmap_init_mmio(dev, regs, &tocodec_regmap_cfg);
>>>> +     if (IS_ERR(map))
>>>> +             return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap\n");
>>>> +
>>>> +     priv->field_dat_sel = devm_regmap_field_alloc(dev, map, data->field_dat_sel);
>>>> +     if (IS_ERR(priv->field_dat_sel))
>>>> +             return PTR_ERR(priv->field_dat_sel);
>>>> +
>>>> +     priv->field_lrclk_sel = devm_regmap_field_alloc(dev, map, data->field_lrclk_sel);
>>>> +     if (IS_ERR(priv->field_lrclk_sel))
>>>> +             return PTR_ERR(priv->field_lrclk_sel);
>>>> +
>>>> +     priv->field_bclk_sel = devm_regmap_field_alloc(dev, map, data->field_bclk_sel);
>>>> +     if (IS_ERR(priv->field_bclk_sel))
>>>> +             return PTR_ERR(priv->field_bclk_sel);
>>>> +
>>>> +     priv->field_mclk_sel = devm_regmap_field_alloc(dev, map, data->field_mclk_sel);
>>>> +     if (IS_ERR(priv->field_mclk_sel))
>>>> +             return PTR_ERR(priv->field_mclk_sel);
>>>> +
>>>> +     return devm_snd_soc_register_component(dev,
>>>> +                     data->component_drv, NULL, 0);
>>>> +}
>>>> +
>>>> +static struct platform_driver tocodec_pdrv = {
>>>> +     .probe = tocodec_probe,
>>>> +     .driver = {
>>>> +             .name = "s4-tocodec",
>>>> +             .of_match_table = s4_tocodec_of_match,
>>>> +     },
>>>> +};
>>>> +
>>>> +module_platform_driver(tocodec_pdrv);
>>>> +
>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>> index 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e03d953586648 100644
>>>> --- a/sound/soc/meson/t9015.c
>>>> +++ b/sound/soc/meson/t9015.c
>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai = {
>>>>                 .channels_min = 1,
>>>>                 .channels_max = 2,
>>>>                 .rates = SNDRV_PCM_RATE_8000_96000,
>>>> -             .formats = (SNDRV_PCM_FMTBIT_S8 |
>>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>>> -                         SNDRV_PCM_FMTBIT_S24_LE),
>>>> +             .formats = (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE),
>>> Again, mixed up changes with zero justification.
>>>
>>> This drops S8 and S16 format support for the existing SoCs (such as GXL)
>>> which is known to work and add S32 support on an HW documented as 24bits
>>> only. Can you explain ?
>>>
>>>>         },
>>>>         .ops = &t9015_dai_ops,
>>>>    };
>>> --
>>> Jerome
> --
> Jerome
