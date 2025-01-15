Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021132.outbound.protection.outlook.com [52.101.129.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C725322DFA7;
	Wed, 15 Jan 2025 02:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736909790; cv=fail; b=H6BKsWrRRTuxX1hVmIDtKdPIFehxWJgXmvxnZ8y3BYiITdp00mIKDCB+ALQIdktNGNom3+LBZDeNJzCmmslx9RvhU/LX+DX2RhyidA4LSOyaP3m6PqHwHdWxQDypJrpoTpggH9Pke0O8G/wwU8a8jjTGFCyWVtoSY9G4FFrvc+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736909790; c=relaxed/simple;
	bh=eeLYClg5bqB4hyFfBBPFs3Qz9A1Q7XpZ7dXcNnoemBs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=erZwWOnXaCGBdNKFj08aurMPS+m63P6yoCMhZtIKYV6pz8oroIFAukCmYSgIGjzt24rIyyHZEDM+UzrP0phcSs4M0Sm3qWTMSTKsuRvWEpjHaif5NLEAgMnjSOWuPEZnRm9ryJjS1mnljTfbizWEYSLqGnYWosIIEvVpOjxY3r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=aiawVVm5; arc=fail smtp.client-ip=52.101.129.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="aiawVVm5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlUxADU71d3XUgLv57OLaOjvqEY+3WnFb8tCtA4KBX76x5HmITPxertiWJ09hDQKtOMDwfhpvZw4ScLjNUa6n6vSEmmyY8Ful3RYYXWNj9b+LkUnuE5NTIPSoOazGsc+VZOsyxfzyLjXm/GIxlLK65knp3BaH0JeybMQ/B4Cb57OogHKz9kstIxfXSV2Nz5X0AU5E57ZDZvdXB/NKquy4lfjb+J9uWjPRchXO8jFLysTKF6eUM9F5f2TmMaUakiODv5+GWXAuQp7zFYG7Fxw/bEBQZKmLQDyddtcwLShzd87wWyK02yDhzPLsUt9xFmZp1dmHpkqmv9l+br1E9A1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4REsXvx44bpWisazXvCYeiEnCc7jXtV18i6b9FM6tg=;
 b=iyUuDsRoQA2bSV8h7o8d5XqPzZo6UPag/gzNghisChYkpYmerXBmShQho49+wKTRQqu51pnUN7Ll25bJ5PgFaK3uQb5wlexSFN50GasOvzPTyEsGhTfHUGroj1geum+wbGPMWPx/Lun9ae/iDuv8fIcq4fINRae64Wev/7OGbfNGgHX8ywBLoRX5fVhLRZ0pDE4W/BOfYWUIV/ghqE/Xpo8qMPeuBM+HoU1iJwPaVjDmALPDKUFM8ndYDo5rsMC2mRG3MIimnV4AvegLn3G4znc9KJu3lvFI3kNTXLGeKvOZ4MkcQgvPWnW+77zcRFHVXbSj073O/WvFSpkzrnSvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4REsXvx44bpWisazXvCYeiEnCc7jXtV18i6b9FM6tg=;
 b=aiawVVm5F8xtHSbbIsStE9jicbMav7t49klom/MjSzCgKZja7ZgZcfazYVhq3SniOkNQ/mSigKHSdvKrN06xgliZ5OjFRiSQBJSNLDcYWFP3BHxsYpA7nNkPEDlQsH61iJIS7zo23IK8CX/3P/DtdxbIW6Eu/meBtJ6G2HVU8uAtF2WwpFKhJs7NueG0SsKbb/N5sJLTqAa1Kuvbk0BYNMYi5NdeamsEID8F9V9s1afLA6LlPaelHl1gUUZ4x63k9NISrdfD/j6ncCf0IFPEkggXBbm9fL/PM2H/tbY2Gp1Kh0lexypGsUPsbJInsQpaksv0Uop0W4GYUnbzURk19A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEZPR03MB8444.apcprd03.prod.outlook.com (2603:1096:101:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Wed, 15 Jan
 2025 02:56:22 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 02:56:22 +0000
Message-ID: <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
Date: Wed, 15 Jan 2025 10:56:17 +0800
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
 <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
 <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
From: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEZPR03MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f5e2ca-caf2-45d3-2b6d-08dd35103131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cm1MR2RYNmtmMk96NWRCQXB0dGJFanEzZk92Nm9teHRiSVBGcXZDOXBiZ3Bj?=
 =?utf-8?B?T1NXYVhrdytUNWNRN2VELzlOSFFSTnZ3T0RWWEtpOGp0UEQvS3JZR0h6eHgz?=
 =?utf-8?B?WWJIVE9kT3JlU01yWVhKMjUxUEdHSTdTU2E2aUdWS0FHd1VueCtJZkwzYVc3?=
 =?utf-8?B?RkVFSDlpTVVuZ0lLdFdqL2syRGNkWlVGR0E1NWNUZDJCdkVMR3NCOTRYSXIw?=
 =?utf-8?B?TERXS3dBeWtWQWtFUGxCNGpncVdyTEF4SWdmOE0xem5NWWdXMDhPd1dTZlBM?=
 =?utf-8?B?U2cyWFJqODRsTmQ4RGVoMFNDd2Y5eTNhMWhNMEgxTmZaMTA3bi9haGtxcmdS?=
 =?utf-8?B?Y0E3L21ONVhpT1FkL2NCME9WcC9wSjNMZ2hLczlIdGpUYldmWDNhNFhpcFVp?=
 =?utf-8?B?NUl2ZytNK0w2Ry9CV3czZ0xNakpoQmo5Nk5ySHIrU2RJK1oreC9waTFmTVdQ?=
 =?utf-8?B?VmFCenU0Z1N2ZzV5TXpzQmpDMVNWb2FXS0RYOHJEL0tQMFdzQXdzODYwenox?=
 =?utf-8?B?b1FvMmgzQlc3dG1WTFdqNXRGV0JvcnFzRUMrUEkyUzhDYTlkMEFzMlo5Um1i?=
 =?utf-8?B?RDV4dEJLb3gzTDdxSjZrc3hKL1hiTVk2Q1ZLRXNieDl3MmR5RjE3dWtldjRE?=
 =?utf-8?B?dWdLcjJTVGxHdFp1WlZLVUZOR09oYU8xa0dUSkpzc2xpYlk5dkV2TzV0YUdX?=
 =?utf-8?B?TGh2Z3haS0Zoa2M3NEZFMUdRbXVid0s1N2lsQUszNks5ZnRvOE03WDhHcHpH?=
 =?utf-8?B?S3pONkxRSTFPR084RU5JUHo5UWN2RDBMQUtrSnhTcE40QVJWYThRdXo0bmI5?=
 =?utf-8?B?UE9BRUtmMUdhTmpOYmtNWUZTQlJJMnJOM1dYUmVWYUUrbU16MTRMWmpNdEZs?=
 =?utf-8?B?WHY4SWF4TDMweExiVWxzYzlLc1NyaWRwWWZzckZrM1VVUjBIT3k4SDFRUlNi?=
 =?utf-8?B?Y1ZQOVRkNUJRU1czZWhPRlJBLzRrVWNuS0xNY3NLUGV1KzI3eGFQeFAxMk5p?=
 =?utf-8?B?cHZac29JV0dkQk5MNGJaMUJMK3NlU1VlQ1YrRjRZSWZ5eEdwT2NIRnlBdDEz?=
 =?utf-8?B?VnBDMk9tMVMyaWJSZUxQcGduKzlZSVJieWQ1ejhkY2ZwZm9ZWVNxNXBQcnZG?=
 =?utf-8?B?ZnVtR2hhL0RzN3ZMcFNpZTZ1YXVKbTdXbnBjMkduRE1xaFh1eTJ4MFNjbmlq?=
 =?utf-8?B?ME50VkJjbzh5ZE5wWklLSXZhTXVzWURRTExLSXk5NDg1dGJESzdSYjRQR2E3?=
 =?utf-8?B?RmNwZTU1cURIVGFtVG9LWmI2Ly9OWFc5eEh1R2Y5ZWZmKzErTXROVDJldUE5?=
 =?utf-8?B?NmJWMWMxc1Ezd1g1ZkpadGtEZ1FJWWpVTFk0Q21JZkhoV1krNUIzMWd2UjU3?=
 =?utf-8?B?N3pqZkpPbGxVckYwV1hPWThDdzhuZUhDZlJJOVNlYXU4dG5RaU1UZjJDQVdm?=
 =?utf-8?B?d2NFSVRsdFlLN3J0YkxVMU1qYWxUZW0zRk8zZVZXang3VHBwT1N1ZTNXeGxJ?=
 =?utf-8?B?MGtUOTNrS2RvZUkwZU9wVE9oMjlaejR4YUo4L3R5SEVtV21Demo5NFlKUGhI?=
 =?utf-8?B?RWdMS0RxY3RhblQ0NkxDRUpGaTZtWHZjVWhDdXZkVm02Um03TlpVajcwc0x0?=
 =?utf-8?B?YkZqS05KejJ4ZVd4THNWTk4wVklGMHdpMVRiOEE4TzJJTXRVMnhEb29JSWdC?=
 =?utf-8?B?M05CSEdtNUsvZzFzMFFNc3NwRTZUMkRrZzArWkp6V3czc2xTcVhLTU40c3lY?=
 =?utf-8?B?bFpHN2RJNUpndTFJbUF5KytCOTYwOFpJaENoZDRBRjJ6aU51UEJWTHAySEQ5?=
 =?utf-8?B?bXVTY3FBYjF2NkpXdkI4azgvQ3RNZEdYRDBrTjV0NjFOREc2OTU1TVppL0wx?=
 =?utf-8?Q?bR0ITiRcCSZbU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MStiMEZ5MlByS2tqU0EybXBjeEZQUXBZQ2tBdDh5NFdwdlVlQU1qb1I2UTRu?=
 =?utf-8?B?Rk1YRkxhL0pBYk9NUlFsNnNWOHp3T012aUNPaVpmcEppRnBwSGdWcjNOSi9a?=
 =?utf-8?B?bXJjdUFzdFJ5NmQxb2dBRmtFODdtUTBBem1XdlBldWNSalUxZEJzTnpPSVV6?=
 =?utf-8?B?M040RnQ0bWVPSXZkVEI5aWNWOFl6ZGpoUUd4eDh2a2F4OGlTRzZxYXlmRXJx?=
 =?utf-8?B?OVVmdlljRkdDVzhNc3JSby95Ry85WHg4eDdxOFowVS9ReTBwR2h1TlNlUFcx?=
 =?utf-8?B?R29JaWwzK3ljQVo4Z3RHTFBpSUZCUytzRmswbnM5M2R4TUNJeE8yQ0ZLaU8v?=
 =?utf-8?B?MHV6U054cU1SZ0xWSmllWXdDaWpVdjVOaytzR2hOSjdZcTJLQlZXeW9Sekpv?=
 =?utf-8?B?SlY0N0FzT3RhYnozRmYyS3MwQmgyelY5QVBLSzRFeWVCTTZJT0pZTXlxRFF2?=
 =?utf-8?B?Zm1vRlMxbkI3eUJnT25qcHJjT240YWZHTk9nemdhMDNVNXZKYks0K01OKzht?=
 =?utf-8?B?MUpjZ0s2d2c2cnlyaGxsTjFLM3BsOFgrbitheUQzUXdYdVJ6b3JjYTRxR1dj?=
 =?utf-8?B?RDYwaXpiQmx6cmNBT2U5aWxaQnlsSDdOVVNyZVp6TEthQTVTME1vNTk5QUpZ?=
 =?utf-8?B?aXlWUTVPeFNNNkNmZWM4MDl5bmpjeXNPQ2QyUmZtQUZVRlhqRW1kSTg3SGds?=
 =?utf-8?B?Ly9nbkFJL212aFE4eUl4d1V6SnVWdW5hcDZPV2QrK2d5OEpyMkRCRW5tZXFo?=
 =?utf-8?B?SWlKYytaajY2azgvYi9oU09PaDNvZnVZNW5TSDZqRVRYM2h1SUJMdGJsalYw?=
 =?utf-8?B?WHJVQktCZm5GQVo4Tmh5UUY2WEFIVERxcTQzdUFxTDJNa0VpSWR2dTArUEpO?=
 =?utf-8?B?R2VSY3NTWTZpYUZCMTczV0FOMTUrT1h4TDlLeDgzWlRvbk9jSmhIaGw1U2pS?=
 =?utf-8?B?R3pIZ3dHeHROeUkrNStsL3ZQYjhQMEYwT2R0T01YcTJlWUVQWjMzd2FkTEY5?=
 =?utf-8?B?Y3F6RWR3K3lIcTNjejU5aitkdi9yRW9TRERkUERVbWwvSXpwMFZNUlRMb2cv?=
 =?utf-8?B?MFRXUEJLQmhKZEtSa3VGcmJrMXNmNUpPYW00bFRsMFVwMUtmblY3MzNzVjkv?=
 =?utf-8?B?SE1NdDlBc2JRZ0M5c0pnNWg0Wi9XTlNuMGZZVWNwSDRVQjFvTTRDYytydkpt?=
 =?utf-8?B?eVE2RGp6Y3grcHJGbE5oS2t6N2F5c1dYNFNPUmxSK2lNUFE5cGt6SEg5cGJr?=
 =?utf-8?B?UndmY3oyUXdlMVA4Mi9pbkdoS1B2ZWF6RzExeGpzQmFqTFNZdHJmeEtTeWIx?=
 =?utf-8?B?K09FN0dhNWJUN0xXMXdBRWxVTEV0Q3dpcUI5TG93ZEFvRU41cGFSZnVIRk5C?=
 =?utf-8?B?ZXdKdGZScEg0TXBPZTRTS1VjdXVIaUVJUU1SYkdFSXFQYjBUWURiNDBoQVNs?=
 =?utf-8?B?ZG4wbUVUdHpWNWVlZDdEU2ptZi9EcnRpWjlKbDMxRlRkSTJhTG9ycXNUQisz?=
 =?utf-8?B?ZHdsazRoWEtFa1haUk9NdUc3dlViZzVLTTZHaFRSOFhCd3g5MnZERkp4ZGJM?=
 =?utf-8?B?SUtFY0xHQURVZmtLcnlJZnJGSVlVY1JocnBnSzhtdi9qTmpVZU9lRVpUUks5?=
 =?utf-8?B?RnBzaWFUYVVMNDR3ZlZNcnp4aXQxL0Q0Uzhlb2dSMTF2N1EzRHl3em5wOEtV?=
 =?utf-8?B?UncwcVE0VVU5UXFBYVBvbmRXTDJxcnVyUTh2VCtIekdWSDFqL0dDVXF1YWFX?=
 =?utf-8?B?bjBGc3l5dXBHUWl2eDYrVnJTdGplWHFaSi96UCsvRzBxcXhzSkUxVlBZWjRx?=
 =?utf-8?B?dXRDUnc3em9yNlYxRDVZSW03eDVVVzVYSSs2NXM0NUtlZUcxNTRVd3o5ZEQ0?=
 =?utf-8?B?ZUxWWDNlMUwvdHg0TFB1QWpaRG52NlZtUjlqa3h4ZHoraHdVbzVXMk9ybm03?=
 =?utf-8?B?WWkvdGIyV0JBc0plb1pxS0JWVE9UdFp0NllXb2tsVWtVK3BmdGcvY1hkVmt2?=
 =?utf-8?B?Q2RvWWRHR3RKUm4zZVBid01udEZ5WHB3cWp5Y3pKL2hPZjdmTUY0MDBiYURJ?=
 =?utf-8?B?dzBLSFFxQmVlZ1J2MEhGUlNKb09pTldQNEtOSjhiOE1Xa3l2VnZwVUw3dzhh?=
 =?utf-8?B?enJUWFdLNElOT1hmcldjQytvaExHZ05TcGFQdTdscVV0VW42UTJTeEErNndJ?=
 =?utf-8?B?MkE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f5e2ca-caf2-45d3-2b6d-08dd35103131
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 02:56:21.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqgtBe/mXyhGH2k9x7SXH85Ggz80CoBdGQrx0SBd28MexWrnyoYqvWO6IJpnVIMTPXRZGy6tktXh3Mh7LDiIMJG8qtcdC9tHEFQyr9ZHPfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8444


在 2025/1/14 22:05, Jerome Brunet 写道:
> [ EXTERNAL EMAIL ]
>
> On Tue 14 Jan 2025 at 19:20, Jiebing Chen <jiebing.chen@amlogic.com> wrote:
>
>>>>> +
>>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>>> +MODULE_LICENSE("GPL");
>>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>>> index
>>>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e03d953586648
>>>>> 100644
>>>>> --- a/sound/soc/meson/t9015.c
>>>>> +++ b/sound/soc/meson/t9015.c
>>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai = {
>>>>>                 .channels_min = 1,
>>>>>                 .channels_max = 2,
>>>>>                 .rates = SNDRV_PCM_RATE_8000_96000,
>>>>> -             .formats = (SNDRV_PCM_FMTBIT_S8 |
>>>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>>>> -                         SNDRV_PCM_FMTBIT_S24_LE),
>>>>> +             .formats = (SNDRV_PCM_FMTBIT_S16_LE |
>>>>> SNDRV_PCM_FMTBIT_S32_LE),
>>>> Again, mixed up changes with zero justification.
>>>>
>>>> This drops S8 and S16 format support for the existing SoCs (such as GXL)
>>>> which is known to work and add S32 support on an HW documented as 24bits
>>>> only. Can you explain ?
>> for g12a, sm1 etc, it is use new audio ip, GXL is old ip,
> If there are chips difference we did not know about, then you should
> introduce those difference, without breaking existing support -
> including for GXL, which is what you did IIUC.
>
>> the new ip not support 24 bit,
> Are sure about that ? that code has been there for a while.
>
> If sm1 does not support SNDRV_PCM_FMTBIT_S24_LE, you should a fix up patch for
> that, with the proper "Fixes:" tag, how to reproduce the problem and
> explaining the fix.

maybe there are some gap , we support SNDRV_PCM_FMTBIT_S24, not support the

SNDRV_PCM_FMTBIT_S24_3LE,  for SNDRV_PCM_FMTBIT_S24

it is  Signed, 24-bit (32-bit in memory), little endian , the audio dma 
busrt is 64bit

it can get the full data. we send the 32 bit data  mclk = 32bit* 48k 
*4,  use the clk to send

the  SNDRV_PCM_FMTBIT_S24,   the hadware always send the 32bit data

so, i think we only add the SNDRV_PCM_FMTBIT_S32 base on it

we think the 24 bit is the SNDRV_PCM_FMTBIT_S24_3LE, it is 24bit in memroy,

due to the dma busrt 64 bit limit, it can't align the sample bit, if it 
is 24 bit

so the clock configure can't 24bit clock, by the way, We discuss 
internally for gxl,

it also support the SNDRV_PCM_FMTBIT_S32


>
>> usually support 16/32 bit for new audio ip , for SNDRV_PCM_FMTBIT_S24_LE,
>> it width =24, phy =32
> Yes physical of SNDRV_PCM_FMTBIT_S24_LE, so most chip supporting 32 bits
> width would support this S24_LE, unless there is something odd.
>
>> it was  treated as 32 bit to send for tdm, so we can only add the S32LE
>> base on it , right ?
> You are asking me ? How am I suppose to know ?
>
>> but if the gxl not support the 32bit
> I don't see a problem with a DAC taking input on 32bits physical
> interface and ignoring some bit on processing.
>
> If that's not the case, please send a proper fix change with some explanation
>
>> we need add new snd_soc_dai_driver t9015_dai_s4 ?
>>
> If I understood correctly format depends on the chip and needs to
> adjusted including for sm1.
>
>>>>>         },
>>>>>         .ops = &t9015_dai_ops,
>>>>>    };
>>>> -- Jerome
> --
> Jerome
