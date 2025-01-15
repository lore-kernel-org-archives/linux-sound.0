Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023077.outbound.protection.outlook.com [40.107.44.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEF22F3AF;
	Wed, 15 Jan 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736935026; cv=fail; b=eZAaeul6HA2LIb5v5JJ7rD+h2A6g8ZjhOSIKOGwwIsG79eGhvhNaJkPGcxHEXYdFaJAh9LZb6EGF3oCbtR0HOVRd9c5v3HcCvsLWgbXdEik/Y3rpH/Baj0iBkAmDp0c7XtIgACyIoV6CFdLX2LcYuF++EiwgVFtMgkgfOZSlXHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736935026; c=relaxed/simple;
	bh=Z08OlI2c0u9dMp4s6qXnwT7JyODE5HZSA1CKKJzYrac=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WTwLS77PB9fNFicjB/UruEAJg99cyn/SWBav9rQ1A7EwL9/geIdqUcGdrPwrnWv2g7PdWihPj+Tx8VUWvasc7M6IVpgypdPHLht8M4ue78daT2iw3z7snznaHKjBq/i8IiSr1WpurFUOG13JKymRIaVN2AcwAuwEPZuzBrxkLbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=OlhJ9ERT; arc=fail smtp.client-ip=40.107.44.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="OlhJ9ERT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaGS0KOba4aIz2BJy+phs6qmUGlgbBY9HynqVkFL2M+SJOgAFSAr7wp8Kb5FG8Sej2FNHwE7PNUIvqQYPRArjk0agd9IHZhkqWyGvkQeIEO2uz+CATIqRKX5gP7dwALddEILEXV5cMs7E97okJOBZGKlsT6j3LPI66hI0CSQ9ajX4VPYTDYALktNENG7DqTtYSAe/iTp9W9ytI06IfLEPPkz91unuorZsisvLNcRk9yrwSErPHdBiKmMsSPOejfMX3eOmbA8Ohb+NsEzIawuZ1PHdg0Zd1CIueauvnuB2xXv3dfCLKz4R1mWlDcR0FELyDCEs+vUvE308e30lZaNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEcS5THoSC8QPG0F4vSstZ5G0V8fYnnTgZOzDeqFLJg=;
 b=hG0hHzDAtNZd+FhcNwf3kjzAGO4e0n6g5p7E7Jlu/H7aqiSKfoTh3QSfFJ8pe6BBuAzsuBIxzq7XZeQt9HSIxaCc0vZBqO8XjIaerjX6CPTPYd59G5tfLTW1wpWwFtkfxp2XokHLRk82jNMQuupg/1wiN4q4luJFhhTrP8eRhISLjAtAyzGYU7DLV4CUusqxtuFj2AmfPGBHi+EpfqDhVsSMfZ7/o2l23ZPlQZEwF/bo2nBYlk7lmhZZPXKo5Ajdyfy3zO0p9PVT+d17Zyn7r5EHs+EuI+NQ9SVASTJoz8BVjLQHqfqiImHur9LIrSpsdwCNFXkXkNcfIEpR4mpJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEcS5THoSC8QPG0F4vSstZ5G0V8fYnnTgZOzDeqFLJg=;
 b=OlhJ9ERTmnLNdyGLSG0OjwEqhaw18GyuLNXjuT4gaUqGqsRzpp9zrc3Cmj1/yOQ1vp9lFVsk8VkABWZJGd6eISCHCNhgscd4UxeioBktSQl75V0byIqAvxwKv0o9eGhuuwEwGJ2SlYvmdVj2JZK8mlM/ntNEY8EbjDuG6DTgujjZsEIJUkYmsrsJ1em5ouU7vZgkt8+FCL3sM3TswHeJY5KB9+UYzQAgSzXmPGU918BzDjek4NTb0fP6Nx4N1pmMcmZagLdKVAmDCN7F2y3Og2P+XKNC4dauy3h/jgSpTOji74fOlRIeLDDV1uVMwwPwU9IYNYGmlCdmNoujH6iKrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by KL1PR03MB8195.apcprd03.prod.outlook.com (2603:1096:820:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 09:56:58 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 09:56:58 +0000
Message-ID: <550e0461-b564-496c-8fa9-78b2cbe9ba71@amlogic.com>
Date: Wed, 15 Jan 2025 17:56:54 +0800
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
 <0e8b78c1-5c56-40e7-a2d8-41a7f49d52bc@amlogic.com>
 <1j34hl7a8b.fsf@starbuckisacylon.baylibre.com>
 <40aca60e-92e7-4344-8f7d-f62a61dd1898@amlogic.com>
 <83a93dfc-2fcd-4166-98ed-e0491645f4e5@amlogic.com>
 <1jldvc5uwh.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1jldvc5uwh.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|KL1PR03MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 2276da6f-8eb4-4496-7a5d-08dd354af335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWF1RGZSbVg4aS8xekhGbktsekNkZHJkamxsVFNGVDRUWE12eXpjdTRNMi9Y?=
 =?utf-8?B?UXZ6N281VllUMDU0SFB1ZnBkUG1nWGZhR2hkWFJOTFA0SU5hN0x2cm5QZnRH?=
 =?utf-8?B?ejJyNXJWZzUzZ2ZwWmo0QStOYm45U3poeXlMTUgvNkFhaTJLckEyWmNaWnhL?=
 =?utf-8?B?Tll3eWxHeFhEbE9NV3ZKMmpDMmF4RXY3MmVJcGUxbGw4YzdVNmk2TlFEZWlL?=
 =?utf-8?B?S0M5NGRSRTRmejlrY042L2tOYS94WDVwWHlDZENhZWt2UE9nbzFPWmcxczlo?=
 =?utf-8?B?Vk5MVXNpZjkweVdMbUlxcGtXVXM4ckQ2QnVPYlB2TnVEaEtKRmMvWXltbmx0?=
 =?utf-8?B?UURkSWorUXErR1NqeGVOeldsSWhGM0xhVlUzcnlQMWh5VFZCWDd1UWl6Mmcv?=
 =?utf-8?B?cGY2MVJ1UE91UXJTWG9QeHlDNEJWdVZ6M0gxd1lPdzFwS3cvOUZrYk0yem96?=
 =?utf-8?B?Zno0czFaL3lyUVVMRExLc3R0QU5DREoyd3JKQnF5RUNIVWd0eTlwRFpJYUxI?=
 =?utf-8?B?R3dIWHEzczMvREZtZi9lOTlOc0w2eS8xczh5dmsxWHRZbHFxSHV3Y3ppUjhY?=
 =?utf-8?B?Wll5empIMlA0YWxzYTh3Qm15SEdDZmFkREN6bCtLQURGbXVCS2RINk5uQnda?=
 =?utf-8?B?UG5GR0MvUHZEWlBieXNjY1hUSUI2eGRpZEF1aXcxZGZPNFVXSDk0KzExQWEy?=
 =?utf-8?B?ZU9OOWVTSjJKSDY0VDVhQ3NzWmRjbUF1QlZQS3VXOUxmbGx1WlBnWFlsN1Bw?=
 =?utf-8?B?Zi9JVDVIbUpreU1IUXlVanRHL1dhU1M5SzRkbVIxWmk3cG9yYlcwVEowMG93?=
 =?utf-8?B?YnhSYlMxazhZUUNLNWZpMXNVYlVZeHVFeWdBTjFZWEU0VVplZjd0ZTNlMlI0?=
 =?utf-8?B?U0ZMZUFSQTBkbnIyMUp2UWthcGQyYWNhMjZpcnhwTGxVTitNYjFxSFFZVkZK?=
 =?utf-8?B?RkFUalVNOC96UXRGaWV1enNrcHNSNW1VWUlpOGhFT3ZTeVhsZkhUWnVCWlc5?=
 =?utf-8?B?SVo3TFNEUE1ZbkFXMDBxY0s4eVJTNFhXUklnVzB0ZENrMjI2c3ptTi85Q3NY?=
 =?utf-8?B?aWJ1K0hONU8zdERPd0psaVZZQVA4VSszdm10MmR6Mm5IVkJBZXhCMGRvRkZx?=
 =?utf-8?B?TmpOMkFRNEVPRTF6SEFKMExDK1BoUE1IdFlSUmsyTVVEWlFNT0VkWVZWSlBP?=
 =?utf-8?B?dmJHQk5tZnAvcDNLUU85djVwTVo0MzFWMVdDOGpkQWR3dnhXWitWUEdpcmky?=
 =?utf-8?B?aFhkOUtPa0REQ3ZzV1JUUlFOREdWZzB4aEY2LzIzMnBUb0tmU1IxRExiM2dO?=
 =?utf-8?B?bE9qT0ozMlFsVFZsVU9JZnFMaHBqdTVxS29oZDAwVzN2Und1Y20zTjkvTVFm?=
 =?utf-8?B?NHlwWFgwTElEZHBPZHVZV3cxWjBraFBrUlJqRWpHU3NWS2dhMXpoV3F5WHBS?=
 =?utf-8?B?WEIwSUhjUExiZ29NSnlvU3lOcmo4d2hVcTBTVUpGL1ZMdkN5dERyZU9UbUJB?=
 =?utf-8?B?cloxZWRxU0xTTk95MnRmZkpTay9WMnFJRVhhZ24vREQ1OU1meTlFNytYZnNI?=
 =?utf-8?B?ODlPU0RoSjJrSWx6cnpBT1VueEx0VGdMVFpRR3RmNGZETFU4U0c2aG42eTZm?=
 =?utf-8?B?ZEp0eisvM3VISldyNGtMNzRqNzBhK21EOGRxcVRZSUFtNVZpdnBzMDlGLzds?=
 =?utf-8?B?eXJvV3c0R1JTMkhTOUdhOFF5S1JGaUQ5U2N4WmFWeFZMTjhhQWJ0SDBnNGxZ?=
 =?utf-8?B?Ym4xWkZJc2VHRnE3eEtkMm9pQk1pNTZoZkZXUkRobUNiSFZSMXo5aFllRHM4?=
 =?utf-8?B?T1RpSzI0ZkxITmJHRmhabCt1cTRLQW9JRkRvRDEvbm80clNSRWszZUFSaVBq?=
 =?utf-8?Q?zpmdVi31xB4+k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmlENXZRZWs3NzlXUzZneEhIMVFHY096dWdCRURpNjYvdWZ0ektQTklxb1Uz?=
 =?utf-8?B?MHFWTnNZaDVqTjlKYUNmVXZBM1FiNzNWbmdiQ01XU0xQelo1ZHFjN05Nek53?=
 =?utf-8?B?RXZlYmw2eEFVQVRHeGRqNk5BTSs3R0VCOHlkQi92NlVsYVN5emN5VUFHempq?=
 =?utf-8?B?YzJxMlIwd0s3RERwQit3VWdGeUwvOUNWY2UySE05WEJON08wTGJzazhFajJ3?=
 =?utf-8?B?Q2lIUnB2YlNpN0ZNcjQvWDRqVDZKenpuTlFtVWhnNWZuSnI3YWgxOUVlYW8r?=
 =?utf-8?B?NGNEcVpnSHBnK0dTalBmdnczNzJnZnljYVg4WVFaQUdIeDFIR3VHeWFYc3NX?=
 =?utf-8?B?b0gzNlpXWjgveVpJZnpOWmlYRE4rL1JqbVp6dGJZcXE2SUhIUzM4VStoSVJt?=
 =?utf-8?B?dnREbVd6RU9xdnkwdHgxUWRUNnFhc2lQMElKMWsyVHQycy8rK2xTM3Q3Ky9z?=
 =?utf-8?B?UnpHTEJuMS9VRHl5OHZ3V1VoRUY2UWxBUE9uN2h6b1VmQWE2dDU1TGtaTzZM?=
 =?utf-8?B?TUNxWU5qckRFS1k0TmxISVA5OUpKSDUwQkJTK3hlMi82NnU1bDNLTU9jTGJj?=
 =?utf-8?B?elBWSFB4ZUsrNGNUZGJiSS90aHpXbWJybnFrQzcyUjFSb2gzbjBaaGZNRWQz?=
 =?utf-8?B?bEdsRUF4bUdhNWl1eVN0MUl6MzVHd2ZsUEo3N1E1Y1hETUh6bWxhV2JzMHh6?=
 =?utf-8?B?SzBHa0h0V25OR3g1b0gyLzJBOW1KWi9nOHZEUVZlQ3ExZ2JWWS9yaW5PNzdW?=
 =?utf-8?B?azdSRlFiYzhBTUYvWndvUjByc0J5WlhMNlJIS3hUcUkrM25XbTNRVU55cDgv?=
 =?utf-8?B?WC9KSGxhZDhiR2FhUTVDOHR5eTh3L05hQWZBZ2pFQURxNSs5SURBQjQxcG5r?=
 =?utf-8?B?dmZURFU2UndQd2pNUFZoL2RJQ1pIS2hLSE4xMVU0VFExa0pOT2d3NENaT2Jl?=
 =?utf-8?B?M29UcHA4RU1VSytJU2djeUZDODI5WVJ0K0Z3V2t0OGc5NGlRMyswUC9rbGRK?=
 =?utf-8?B?NzIrNmw4M29mZWxsbHRPLzI1ZHo3WjVKN21ZV296aW1kRDMzbDRXU0YvMFZU?=
 =?utf-8?B?ejduM25tY1YvZFNKbE91QXlBVSt4b0pwTyt3RHpPMWRsa05lcXBtS0JjakxL?=
 =?utf-8?B?MFB2SUxMWHE1WE5vRVRjU1pIaml1TEVEdjAwVVR4R2g3YmQ0MnJFTHg1R0dS?=
 =?utf-8?B?N3NTQ2p1VHdCVjhBY2kyeWN3OG40RDQ4cVFPRXBkeVBxMnMxNDZEQUtXSyto?=
 =?utf-8?B?K0tORTBqS3kzc3N6S1JsbUtaQkU3bmlmN1o1bDBzczg4UW1ab2JUZWt1ZzJ6?=
 =?utf-8?B?NHlmdEVoak1aUGtmRGx4b3Zuc3paaXl6UFZEUVNtVjk0Tm9WYnAyMU9JTDRu?=
 =?utf-8?B?VzhZYityZmg2R3lGeXJsd0RZUTlpR3h5Nml0YVZqMmxnTWxpWFBqVG5VcmJF?=
 =?utf-8?B?aXczbHh0V1F0bG5WaWFGN1h5OXhHNVlFbHBzTkxEbzY5VmluQWVxSGgxckMv?=
 =?utf-8?B?c0RUcGJBVURHUkpKSUMyVjFwbm1wVGZBV0FyT2lML1QvQXU0MVdJTmxhWkhi?=
 =?utf-8?B?ZDBwZ2F5KzBFaVRWb09pSDFWL3drMUtXWnpacGdKR00yem56ZXJzdFdwMVNs?=
 =?utf-8?B?YTZMTkc2V3IxZTc2Z0ZFQmowenEvQmRod25nOFUwSWNDOWhvMmIwb3AxNWtD?=
 =?utf-8?B?ZmU1OFNuZ1Nsa2p2STMrRXZEaUMwc28zcjU0WGNUUzUwQzJQNW9SSzBiWTJC?=
 =?utf-8?B?NEc1Ly9ZR2NtZitOd0RyVjJsd1dYNnY2SmUrMFBURndmcmdRTS8xQ3V2a2l4?=
 =?utf-8?B?OE5nN3UwQjllaG92NFZpSitKZUZmdkE4MHBHeWVQQUh2N0RpTVJqVWEzeGgr?=
 =?utf-8?B?RHZqcXI3OTMwc0RvMmlRN0xqNTNCZ3lldklBQnY5dnRraXp4U2lxWnRRRk9J?=
 =?utf-8?B?RFh6S29GYS8wYXVweDR0eVZVQW1mWUpDanVDeGNXZFB6NXNmQndOeVJkTlBK?=
 =?utf-8?B?dHZSZmw3VEVFWThzL3ZPM09RbW5WNzJZN0pxemU0RmZRSEhjR3h5eVM0QkNi?=
 =?utf-8?B?SVJMQU9WK3NvdjBlblhmc2lRdDZxVVJ3dVRhZFpFbHlhaVViQmVKckxGckQ2?=
 =?utf-8?B?Qm1UaUxkdTdvb2pvWVJxNVZDUEwrSnBZblNNZWZqL1JYbk1lY3ZwSHJjd0lX?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2276da6f-8eb4-4496-7a5d-08dd354af335
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:56:58.2822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpbKwsRKKwK4y83RX83n5kObvEmSCGf/Pzwsd+sDGlphCnYb5Vlp8VSh+cUAKSNQUfIP2gs9qhRBakkRTp/bEyDGeHjPh/xmFajFLG5vvSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8195


在 2025/1/15 16:43, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On Wed 15 Jan 2025 at 14:16, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>
>> 在 2025/1/15 11:38, Jiebing Chen 写道:
>>> 在 2025/1/14 22:15, Jerome Brunet 写道:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On Tue 14 Jan 2025 at 20:34, Jiebing Chen <jiebing.chen@amlogic.com>
>>>> wrote:
>>>>
>>>>> 在 2025/1/14 19:16, Jerome Brunet 写道:
>>>>>> [ EXTERNAL EMAIL ]
>>>>>>
>>>>>> On Tue 14 Jan 2025 at 16:52, Jiebing Chen <jiebing.chen@amlogic.com>
>>>>>> wrote:
>>>>>>
>>>>>>> 在 2025/1/13 22:50, Jerome Brunet 写道:
>>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>>>
>>>>>>>> On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay
>>>>>>>> <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:
>>>>>>>>
>>>>>>>>> From: jiebing chen <jiebing.chen@amlogic.com>
>>>>>>>>>
>>>>>>>>> Add basic audio driver support for the Amlogic S4 based Amlogic
>>>>>>>>> AQ222 board.
>>>>>>>>>
>>>>>>>>> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
>>>>>>>>> ---
>>>>>>>>>      .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 226
>>>>>>>>> ++++++++++++
>>>>>>>>>      arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 385
>>>>>>>>> ++++++++++++++++++++-
>>>>>>>>>      2 files changed, 610 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>> b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>>>>> index
>>>>>>>>> 6730c44642d2910d42ec0c4adf49fefc3514dbec..32f50a5b860435d50d9c5528b43422b705b20130
>>>>>>>>> 100644
>>>>>>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>>>>>>>> @@ -75,6 +75,19 @@ vddio_ao1v8: regulator-vddio-ao1v8 {
>>>>>>>>>                  regulator-always-on;
>>>>>>>>>           };
>>>>>>>>>
>>>>>>>>> +     vcc5v_reg: regulator-vcc-5v {
>>>>>>>>> +             compatible = "regulator-fixed";
>>>>>>>>> +             vin-supply = <&main_12v>;
>>>>>>>>> +             regulator-name = "VCC5V";
>>>>>>>>> +             regulator-min-microvolt = <5000000>;
>>>>>>>>> +             regulator-max-microvolt = <5000000>;
>>>>>>>>> +             gpio = <&gpio GPIOH_7 GPIO_ACTIVE_HIGH>;
>>>>>>>>> +             startup-delay-us = <7000>;
>>>>>>>>> +             enable-active-high;
>>>>>>>>> +             regulator-boot-on;
>>>>>>>>> +             regulator-always-on;
>>>>>>>>> +     };
>>>>>>>>> +
>>>>>>>>>           /* SY8120B1ABC DC/DC Regulator. */
>>>>>>>>>           vddcpu: regulator-vddcpu {
>>>>>>>>>                   compatible = "pwm-regulator";
>>>>>>>>> @@ -129,6 +142,219 @@ vddcpu: regulator-vddcpu {
>>>>>>>>>                                   <699000 98>,
>>>>>>>>>                                   <689000 100>;
>>>>>>>>>           };
>>>>>>>>> +     dmics: audio-codec-1 {
>>>>>>>>> +             compatible = "dmic-codec";
>>>>>>>>> +             #sound-dai-cells = <0>;
>>>>>>>>> +             num-channels = <2>;
>>>>>>>>> +             wakeup-delay-ms = <50>;
>>>>>>>>> +             sound-name-prefix = "MIC";
>>>>>>>>> +     };
>>>>>>>>> +
>>>>>>>>> +     dioo2133: audio-amplifier-0 {
>>>>>>>>> +             compatible = "simple-audio-amplifier";
>>>>>>>>> +             enable-gpios = <&gpio GPIOH_8 GPIO_ACTIVE_HIGH>;
>>>>>>>>> +             VCC-supply = <&vcc5v_reg>;
>>>>>>>>> +             #sound-dai-cells = <0>;
>>>>>>>>> +             sound-name-prefix = "10U2";
>>>>>>>>> +     };
>>>>>>>>> +
>>>>>>>>> +     spdif_dir: audio-spdif-in {
>>>>>>>>> +             compatible = "linux,spdif-dir";
>>>>>>>>> +             #sound-dai-cells = <0>;
>>>>>>>>> +             sound-name-prefix = "DIR";
>>>>>>>>> +     };
>>>>>>>>> +
>>>>>>>>> +     spdif_dit: audio-spdif-out {
>>>>>>>>> +             compatible = "linux,spdif-dit";
>>>>>>>>> +             #sound-dai-cells = <0>;
>>>>>>>>> +             sound-name-prefix = "DIT";
>>>>>>>>> +     };
>>>>>>>>> +
>>>>>>>>> +     sound {
>>>>>>>>> +             compatible = "amlogic,axg-sound-card";
>>>>>>>>> +             model = "aq222";
>>>>>>>>> +             audio-widgets = "Line", "Lineout";
>>>>>>>>> +             audio-aux-devs = <&tdmout_a>, <&tdmout_b>,
>>>>>>>>> <&tdmout_c>,
>>>>>>>>> +                              <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>>>>>>>>> +                              <&tdmin_lb>, <&dioo2133>,
>>>>>>>>> <&tdmout_pad>, <&toacodec>;
>>>>>>>>> +             audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
>>>>>>>>> +                             "TDMOUT_A IN 1", "FRDDR_B OUT 0",
>>>>>>>>> +                             "TDMOUT_A IN 2", "FRDDR_C OUT 0",
>>>>>>>>> +                             "TDM_A Playback", "TDMOUT_A OUT",
>>>>>>>>> +                             "TDMA_OUT SEL",   "TDM_A Playback",
>>>>>>>>> +                             "TDMOUT_B IN 0", "FRDDR_A OUT 1",
>>>>>>>>> +                             "TDMOUT_B IN 1", "FRDDR_B OUT 1",
>>>>>>>>> +                             "TDMOUT_B IN 2", "FRDDR_C OUT 1",
>>>>>>>>> +                             "TDM_B Playback", "TDMOUT_B OUT",
>>>>>>>>> +                             "TDMB_OUT SEL",   "TDM_B Playback",
>>>>>>>>> +                             "TDMOUT_C IN 0", "FRDDR_A OUT 2",
>>>>>>>>> +                             "TDMOUT_C IN 1", "FRDDR_B OUT 2",
>>>>>>>>> +                             "TDMOUT_C IN 2", "FRDDR_C OUT 2",
>>>>>>>>> +                             "TDM_C Playback", "TDMOUT_C OUT",
>>>>>>>>> +                             "TDMC_OUT SEL",   "TDM_C Playback",
>>>>>>>>> +                             "TOACODEC TDMA", "TDM_A Playback",
>>>>>>>>> +                             "TOACODEC TDMB", "TDM_B Playback",
>>>>>>>>> +                             "TOACODEC TDMC", "TDM_C Playback",
>>>>>>>>> +                             "SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
>>>>>>>>> +                             "SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>>>>>>>>> +                             "SPDIFOUT_A IN 2", "FRDDR_C OUT 3",
>>>>>>>>> +                             "SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
>>>>>>>>> +                             "SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
>>>>>>>>> +                             "SPDIFOUT_B IN 2", "FRDDR_C OUT 4",
>>>>>>>>> +                             "TDMIN_A IN 0", "TDM_A Capture",
>>>>>>>>> +                             "TDMIN_A IN 1", "TDM_B Capture",
>>>>>>>>> +                             "TDMIN_A IN 2", "TDM_C Capture",
>>>>>>>>> +                             "TDMIN_A IN 3", "TDM_A Loopback",
>>>>>>>>> +                             "TDMIN_A IN 4", "TDM_B Loopback",
>>>>>>>>> +                             "TDMIN_A IN 5", "TDM_C Loopback",
>>>>>>>>> +                             "TDMIN_B IN 0", "TDM_A Capture",
>>>>>>>>> +                             "TDMIN_B IN 1", "TDM_B Capture",
>>>>>>>>> +                             "TDMIN_B IN 2", "TDM_C Capture",
>>>>>>>>> +                             "TDMIN_B IN 3", "TDM_A Loopback",
>>>>>>>>> +                             "TDMIN_B IN 4", "TDM_B Loopback",
>>>>>>>>> +                             "TDMIN_B IN 5", "TDM_C Loopback",
>>>>>>>>> +                             "TDMIN_C IN 0", "TDM_A Capture",
>>>>>>>>> +                             "TDMIN_C IN 1", "TDM_B Capture",
>>>>>>>>> +                             "TDMIN_C IN 2", "TDM_C Capture",
>>>>>>>>> +                             "TDMIN_C IN 3", "TDM_A Loopback",
>>>>>>>>> +                             "TDMIN_C IN 4", "TDM_B Loopback",
>>>>>>>>> +                             "TDMIN_C IN 5", "TDM_C Loopback",
>>>>>>>>> +                             "TDMIN_LB IN 3", "TDM_A Capture",
>>>>>>>>> +                             "TDMIN_LB IN 4", "TDM_B Capture",
>>>>>>>>> +                             "TDMIN_LB IN 5", "TDM_C Capture",
>>>>>>>>> +                             "TDMIN_LB IN 0", "TDM_A Loopback",
>>>>>>>>> +                             "TDMIN_LB IN 1", "TDM_B Loopback",
>>>>>>>>> +                             "TDMIN_LB IN 2", "TDM_C Loopback",
>>>>>>>>> +                             "TODDR_A IN 0", "TDMIN_A OUT",
>>>>>>>>> +                             "TODDR_B IN 0", "TDMIN_A OUT",
>>>>>>>>> +                             "TODDR_C IN 0", "TDMIN_A OUT",
>>>>>>>>> +                             "TODDR_A IN 1", "TDMIN_B OUT",
>>>>>>>>> +                             "TODDR_B IN 1", "TDMIN_B OUT",
>>>>>>>>> +                             "TODDR_C IN 1", "TDMIN_B OUT",
>>>>>>>>> +                             "TODDR_A IN 2", "TDMIN_C OUT",
>>>>>>>>> +                             "TODDR_B IN 2", "TDMIN_C OUT",
>>>>>>>>> +                             "TODDR_C IN 2", "TDMIN_C OUT",
>>>>>>>>> +                             "TODDR_A IN 3", "SPDIFIN Capture",
>>>>>>>>> +                             "TODDR_B IN 3", "SPDIFIN Capture",
>>>>>>>>> +                             "TODDR_C IN 3", "SPDIFIN Capture",
>>>>>>>>> +                             "TODDR_A IN 6", "TDMIN_LB OUT",
>>>>>>>>> +                             "TODDR_B IN 6", "TDMIN_LB OUT",
>>>>>>>>> +                             "TODDR_C IN 6", "TDMIN_LB OUT",
>>>>>>>>> +                             "10U2 INL", "ACODEC LOLP",
>>>>>>>>> +                             "10U2 INR", "ACODEC LORP",
>>>>>>>>> +                             "Lineout", "10U2 OUTL",
>>>>>>>>> +                             "Lineout", "10U2 OUTR";
>>>>>>>>> +             assigned-clocks = <&clkc_pll CLKID_HIFI_PLL>,
>>>>>>>>> +                               <&clkc_pll CLKID_MPLL2>,
>>>>>>>>> +                               <&clkc_pll CLKID_MPLL0>,
>>>>>>>>> +                               <&clkc_pll CLKID_MPLL1>;
>>>>>>>>> +             assigned-clock-rates = <491520000>,
>>>>>>>>> + <294912000>,
>>>>>>>>> + <270950400>,
>>>>>>>>> + <393216000>;
>>>>>>>> Why do you need 4 base rates ? Which rate family does each provide ?
>>>>>>> hifipll 49152000, mpll2 294912000 mpll0 270950400, mpll1 393216000,
>>>>>>> the
>>>>>>> accuracy of hifipll
>>>>>>>
>>>>>>> is relatively high, for tdm/pdm/spdif 16/48/96/192k we can use it. if
>>>>>>> the
>>>>>>> tdm and spdif work on
>>>>>> It is fine to use the HiFi. I'm glad this clock finally got fixed
>>>>>>
>>>>>>> the same time, for example ,tdm 48k. spdif 44.1k, we can't use the
>>>>>>> same
>>>>>>> pll, so spdif need use the mpll 0
>>>>>>>
>>>>>>> other pll , only set a default value, at the latest chip, we remove
>>>>>>> all
>>>>>>> mpll for hardware, only two hifipll
>>>>>> I'm not sure you understand how this works.
>>>>>> There is 3 families of audio rate: 48kHz, 44.1kHz and 32kHz
>>>>>>
>>>>>> Each family needs a PLL assigned, so you need 3, not 4, unless there
>>>>>> is
>>>>>> another specific rate family you want to support. If that's the case,
>>>>>> document it.
>>>>>>
>>>>>> Setting the rate of the PLL should follow this principle:
>>>>>> * Family rate
>>>>>>      - multiplied by (32 x 24): to accomodate different sample sizes
>>>>>>      - multiplied by 2 until you reach the maximum rate of selected
>>>>>> PLLs
>>>>>>        This allows to support rates such 192k or even 768k
>>>>>>
>>>>>> 491520000 is not dividable by 3, it won't allow 24 bits words. It is a
>>>>>> poor choice.
>>>>>>
>>>>>> Have a look at the s400 for an example using the HiFi PLL. The axg was
>>>>>> restricted to a 68 PLL multiplier but the S4 is not so you should be
>>>>>> able to use a higher base rate (4 718 592 000 Hz), providing better
>>>>>> accuracy in the end
>>>>> for new soc audio ip, the hardware will not support the 24bit(include
>>>>> g12a,
>>>>> sm1,axg)
>>>> That may be what you chose to support in your BSP but that not how it
>>>> works in mainline. 24bits slot width is supported and has been tested on
>>>> axg, g12 and sm1. This is not going away.
>>>>
>>>> I would find extremely odd that 24 bits slot width is not supported on
>>>> s4,
>>>> but as long you document this, it is fine by me.
>>> i understand your meaning, you sad we configure the slot width 24bit for
>>> tdmout control
>>>
>>> if the format the SNDRV_PCM_FMTBIT_S24,  it send the 24bit data, for the
>>> format, and send the 24bit clock
>>>
>>> if tdmout control can cut out [24:0] from the fddr, maybe your right, we
>>> can send the 24 bit accoring to the slot width
>>>
>>> but it can't confirm by us, we are worried that there may be potential
>>> risks, so we don't use it thay way
>>>
>>> so this why i sad can't support the 24bit slot clock, 16/32 sample bit is
>>> fully validated
>>>
>>>
>> i did some tests for the S24_LE format use the tdm base drvier
>>
>> aplay -f S24_LE test.pcm -r48000 -c2
>>
>>   # cat /proc/asound/card0/pcm0p/sub0/hw_params
>> access: RW_INTERLEAVED
>> format: S24_LE
>> subformat: STD
>> channels: 2
>> rate: 48000 (48000/1)
>> period_size: 6000
>> buffer_size: 24000
>>
>> we dump the mclk
>>
>> aud_mst_a_mclk       2       2        0        12288000 0          0
>> 50000      Y audio-controller-0              mclk
>>
>> according to the base driver
>>
>> in the api axg_tdm_set_tdm_slots function
>> switch (slot_width) {
>>      case 0:
>>          slot_width = 32;
> 32 bits is the default slot width if none is specified, yes. So ?
>
>>          fallthrough;
>>          ...
>>
>> if dts not configure "dai-tdm-slot-width"
>>
>> it use the 32 bit slot width
>>
>> the api -> axg_tdm_iface_set_sclk
>>
>> srate = iface->slots * iface->slot_width * params_rate(params);
>>
>> set mclk rate
>>
>> we dump tdmout control register
>>
>> # devmem 0xfe330500
>> 0xB001003F
>>
>> it set 32bit slot width to send
>>
>> the base driver is the smae behavior that we wound expect,
> The driver set a slot width of 32 bits because you did choose any and
> then behave as it should.
>
> I don't get your point here or what such test is supposed to show.
>
> You did not test 24bits slot width at all.

we focus on why hifipll set 49152000 for S24_LE format, why not to  set 
the slot width = 24

we consider that 24-bit probably hasn't done a lot of testing, suggest  
slot width =32

tdmout cut out fddr[23:0], set slot width = 24, fddr msb = 23

we can support it, but can't sure the tdmout 24bit function can work for 
long time

it need to test for many time , so we just think it can send 24bit with 
8 bit zero for data lane,

if must be send 24 bit data with zero data

we need support the 24 bit clock pll

24 *32* 2 * 768k  = 1179.648M

4 718 592 000 Hz you suggested maybe is out of range hififpll

i think the 1179.648M is more suitable, Do you think so?

if you agree, we ask clk owner to add it




>
>>
>>>>> SNDRV_PCM_FMTBIT_S24_3LE, 24 bit in memory
>>>> I think you are mixing up slot width and memory representation
>>>>
> --
> Jerome
