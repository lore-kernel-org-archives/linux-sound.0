Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C65B377A9F;
	Mon, 27 Jul 2026 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143116; cv=fail; b=qwGjDefLcMPJAA4B9C3+X+UjIpSD5V24DJ3L5rJFMRaHvUsUbx3fOZ35+VdjkaQ+421Mo7w7cAiIiHdPupzQNtwI1mAlxdX7oDJl4x7UShKilWpNmeYaPSu41T2L/ITQge+l6A/6+mNgW1L1V+XvBVFmknPWZz2zJ5TdAxpc7iA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143116; c=relaxed/simple;
	bh=3M+7xHDTh+MwICo1bKtPRS95eQ9vayxR0CcQzQADRl8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RsLdwZwJFQYHhPkRP9gMGE8ApK7GVxWbrxaP7vVUeW/hW6EC/h4/uxenmiM8aoDJCAKrxZYoHShoYsFIUONnBJtt7CcJaRjPOu/bMCUVrtoxdg4Wk20Al/5ge2TDNasH916Cau2tl09e0RhWAVZZzJJvTJH4SuKnsmawzqLXIuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TnFMMyiq; arc=fail smtp.client-ip=52.101.85.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TnFMMyiq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKBZWmnVSstkPo30/gY441FiH/iFE2vF2/Gsd4NF9jFdFwPbDEoo4SYZ13W8WilwYj8SiuvStnCx81Iapq2dY261jk34jnoKqNs8QB3YrQfGSXVyKIyL7IgjjncwqOcwBNNrd6KWLL+upjl2MSU/00/mCyqml66F28pka+z2uZWt+BDDbh11TmRHgCrwUCq1i5pBMcleUkpjiYZY3QMsz21zfQK0AzK3aBwKer7UebfpfcWIvoofMxAjTnKeoZ9O5oEjbIimWlXLqMqlbQoDtowJ2XBGAwuvJkAzbctVu8L3M1h3Qwd4UKWv0N9SSldPVNuV5FRSNCIJTt+Or4gJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M+7xHDTh+MwICo1bKtPRS95eQ9vayxR0CcQzQADRl8=;
 b=eVUWUZ5zy9LUZ61CDgNuvNJSShKyofdLssJY3xRG+V+EgRPCTw/CWDeK/A/IMPBLyb12o6GHuaKCBIZMp46PnwejR/Wns0cEZM3h6CZAbq8IDODhi/AMt/m+QuIfUOAjf/ZiPG5H1adG3fm7Tmaq235ovqHgGKYTEJvFaDYUbxTOY0Aani+LT/u8FpQXLVk5kRbp0Hwke2zAdcdGMkFR5ekzab90U6tSikMZ4cW7Ms51CHPFa9JVtG3pLOshs2w9MHXRAWGNSgIxCs8cTOexaU2jYIhgOZLJvVLyzluIau/0NivSGMSbUhPkYw9YzFcj+U7Tq1yv15sLA+MZUB4GYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M+7xHDTh+MwICo1bKtPRS95eQ9vayxR0CcQzQADRl8=;
 b=TnFMMyiqb6mXc3fvWsj0tcbluimGqoATtvY5QNNB3WP9p8zVwWARS8XkG2R1Lq7F/mvKn5pOP9oIRKD468A7evDJEg0xZs8DAtqm4Mcj3+l0U+fJNO6Ea5cmHzc2SgxCaZtrbB+6DPq5N/nZs2UI2Ui/rDhiClghJQrloo4uiQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.13; Mon, 27 Jul 2026 09:05:12 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:05:12 +0000
Message-ID: <13a5a03d-8263-443b-a6ba-84d954549b2b@amd.com>
Date: Mon, 27 Jul 2026 14:34:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: tas2783-sdw: calibration firmware not re-downloaded after
 s2idle resume (AMD ACP SoundWire, ASUS ProArt PX13)
Content-Language: en-US
To: Andrey Golovko <andrey.golovko@gmail.com>,
 Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 broonie@kernel.org, lgirdwood@gmail.com, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 linux-kernel@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>
References: <c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech>
 <2d59f17b67d3886a3085f0da8c8850f3@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <2d59f17b67d3886a3085f0da8c8850f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::13) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6c9ea7-44aa-45de-7b18-08deebbe2a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|6133799003|11063799006|56012099006|5023799004|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LueJewoIcF+QXM/fLy3YMwlsKDtWvhWlULvsMxw9wYRhV7UAhqXsUfGFNERZGPpmgSeUWktE5qM/3fsq+VagVP8Geg6zxEoag+hQeS4AZ37e57rCJ8TZ69nqFveIDsbO9vLz7b1c0z9xU9lUO9dlmFi2RCcqZRo5rZDhslG6GIueJQjjOMWdsUdBkZHZKrrvLEGkRVW41UKjX53MK6NldiiuvRGYcdHw4IEWhpniiol+DOyRhdc/wzy0JJBu984DKXvlVgmNkKTncAFnX3JDhj2itv9fW5hVpdPsq13EM6oslrGY1NsxWasnJ5o2Bn2VGH0kE5Mc3ISoivIRjDL0hScBqWDvejRyiK1Po8gB2lvotieNwY9BkzEjQkAznU3w2tLTFGcxo0BATYWXxg2bN/5N9b4ptbN42+NM13JJl+wI/f0SV+IJCNejTnXh88WMazzUX+aZctf2xDhMri270bGcuXqBAlY0xaXN0AGUIvyRN7WWdr0+RfS3nHb+nrLaAW9KMAY3+j6yqJ2Pid+3A12mikNUaGa56nyp4fJY5qqlMsfrnhD68cJ0pHdhLWApyPQ+Kcx+JPGwzShIjp+N7r643Lg+gxdp4wT/46iEgiYyOAdS0CbGrBMRnG2gin+OfPMXvayc2GAd5+xzARzX/j8CWirZBifblJ+IJXgck2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(6133799003)(11063799006)(56012099006)(5023799004)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDNQYWlGUThDYjZ2aEVkWTl0Y0lzSitMam9jWWpScUZlREloWVpRTitXZmdG?=
 =?utf-8?B?Z2p0dXcwZ25FZlgrWmk0TEFmUUlleFlhVWpnSkhob1ZZRFpjMEsyMVlBK3Mv?=
 =?utf-8?B?VDFWdUErdytSeEVrSk1EVmdMOHY2UUs3RVUyckd4TWVLdE4wbloyYWhEYTNs?=
 =?utf-8?B?QnpQMXBZc3dFbkppUEMwRFE1Rm9FZG1heU9WUU9yWTU5QWp3V3dIVm9WSFVL?=
 =?utf-8?B?cVRSMUtuQ1hvdXBQamU5TTFxWEY1U1Y0cEdYd2hCa0NYTGJ2OUQxditXSFRH?=
 =?utf-8?B?YW9SRmpma2wrN1RYU3pwZi91Z1g3bmFUUktsb1d5cm5jRHpuYjJpb3lMVnFi?=
 =?utf-8?B?aTFySW82RGhRRDdKSDU0TFhjczlJdCtHakNTWURJZVBmSmpGTXFVMUV3Y1Ri?=
 =?utf-8?B?eDd1SElhSmNsb1ltNGl3QndMajdwMDRIZStEcmxzbVdVdERrWWkzS0J3NTVP?=
 =?utf-8?B?MHd0Z2xiRysvUEJBZW9TKzNTejNEVUk3YTRIZ3k3cEZpNUJNYnhEMFUwNlFt?=
 =?utf-8?B?aG4zOE1PUU02TFhXMU9jZW5Xb2xBR3Zpd3duNU5UMkVDS3dsdW1pMXVGTENr?=
 =?utf-8?B?NlFpWGlmdld3c3Vwc2hET2UvOFBNc3p6QldkYXAydDArMHh6Sk45a3F4cWZE?=
 =?utf-8?B?WjZick5GVkoyMVhFYVhPOHFmZGJjaVdPOGI3K1JGc3ZDeXFieWYyTWEyYjRU?=
 =?utf-8?B?SEhsR1JzM09FUDZsMFFkeFlUNmxrZ0M3VUlFTmZDVi90YzhhVHFBb1pHelpL?=
 =?utf-8?B?OTIvckNMRmhEUGpDWGtoTEd2OTFEejhqdVYyZG5VYkt0dG1ldUVMYjdXeGZJ?=
 =?utf-8?B?T29RTmtWVWVZdXU1MjMzbXY0K1VDWFVTQXR0V0J3Y2VleWZ0elF3eGNYSGFR?=
 =?utf-8?B?U2JqT3hVNkcxWXlvcGZncmUrc2NranB3b0JoUUludEx5dFZCYlVtV3pROGdY?=
 =?utf-8?B?dWwzNEtVVHVMNDZIRFlSNVNLZXBLMlBkVGl3bXBKTmtKRGlMbStOeUhlOGdi?=
 =?utf-8?B?dnFmMlFWYTJ6RVlia1BIUmJPdE5BSGRNMGpZNDlhcGgvQzZ6UDY4c2FmOU1o?=
 =?utf-8?B?NGUycDNSZmI2TzZ1bFJjMGlkRlFYZGxDQ0tUTHVqUFZ3OXFiVDZMNVBFbDBR?=
 =?utf-8?B?VElyWHdPS1p6SFFJTXdtTGtSOHo2UDNyTTZMaWc5K25FRW1VNlMzdjRCalZL?=
 =?utf-8?B?K3UwTjJweDB2M1BlWDBBeWNYZ3VrazZJT3ZCNldFMzVXT052cmt5d2NnZS9N?=
 =?utf-8?B?ZnQwc1ZSR1NUbTEzVWtTYXd0SElkcnp6dkxrOGdFMy9saHdUbGdDWVFZTzZD?=
 =?utf-8?B?NE5zZldlbldTdHEzZStpRURzclhsbjNhV3B4allIL3FXVXRQeXNKdXN1VjRC?=
 =?utf-8?B?dUVlLzl0TnNLZFZHQzc5VnBNd216ZW9ZT3d1aGJQdExtUE1NeW02Sk1NR1hL?=
 =?utf-8?B?ZzBJdGJnb3BQR0dtQ1hsSE10TU1aQzhaTlpaMnpJN0puMlg4NEw4dkZoc3Rm?=
 =?utf-8?B?cU1wY0RleG5HT3k1bFlhcmRsZlNweEpMS2kwQlhYR1BLdWQ3OHRJRngvNlh6?=
 =?utf-8?B?WUtibzB3ZXU2QnRxV2g4c3pXdUZIZHA5Ry9jelZ2alVWRjVHWkdUNW5FRFBI?=
 =?utf-8?B?K21yMEE4RjM2dTgzV1l1emNqaENHYnVZRHJHNEc4YzZsVVBOTnlDQjZPOEMx?=
 =?utf-8?B?RlVwZUxjSlQ3bU9DMVN4emhENjFzTDR0bjJGTHNyT2ZRZlBWQ3pRa0lERzM3?=
 =?utf-8?B?OGtyNlY1KzgvYXpNRUJwWXFCRjJqNUFIZVJ2VWZOaFdwbkxVS0JMNDNtaDJt?=
 =?utf-8?B?REtFSTYwWWxjd2ZkbStEeUx0a2tYMmRoL2NyWFdXMWpmYVUrWVp3SldaVkNm?=
 =?utf-8?B?bXNwSXFYak5QbVlmRGxwR0xQZEU2NFJCcVNRNzBJRENvZm1Tc21RbDlvZGlP?=
 =?utf-8?B?Q01YOFdUQlRwVVkyVEdVTFIzc3BYN0FESTFDTkI5TnFhMlp1bU9UUzEyMWwr?=
 =?utf-8?B?aVlML2lwdGtVbHdPcEtPcDVsTTlibStXYnQvMXVlTnVXMEtOR1VpTmI5M25W?=
 =?utf-8?B?Y2tid1BIZzQzcVhidkZrL0V5NS9aZ2x1WGpCMG9KNDA2ZkJtVkk5bXNwNWx2?=
 =?utf-8?B?VHB1K0tBQWRwZnhvenRpa1g4N0pZOEJsSkRlRzM4OHkrNTNEd2FzWTkvWmh6?=
 =?utf-8?B?YXNOTkJMdi90T0lsKzdzSFJhL3BkWEc2Nzg3VUFBUVkxWTZsNWdSQUNtQ0J1?=
 =?utf-8?B?KzNMRWVLSjFmaVlGMER3aXFUSXk0d0cwOVFGOUZrN2pwK1pNWStySTBITXJ0?=
 =?utf-8?B?SUhFS2xOU3Y5clZTTldwbFVzdWxBMWhCTVl2Z2QyV2d3V2FNTHRvQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6c9ea7-44aa-45de-7b18-08deebbe2a78
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:05:12.5285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VlATC+At99auzoxt7CcUH1z8RXLwY0Tp83BDNRnWmgyRKe6OYHIA+zl30xS+97k1N/Leay2GK9fymWXftgkUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772

On 27/07/26 13:43, Andrey Golovko wrote:
> oot cause #2: ACP SoundWire DMA config not reprogrammed on recovery
> --------------------------------------------------------------------
> Even with the cache fixed, sound only returns after the PCM is fully
> recreated (pactl profile off/on), not after a plain userspace resume.
> sound/soc/amd/ps/ps-sdw-dma.c advertises SNDRV_PCM_INFO_RESUME, so
> userspace issues TRIGGER_RESUME (or prepare without hw_params), while the
> ring-buffer registers (RINGBUFADDR/RINGBUFSIZE, watermark, IRQ masks) are
> only programmed in hw_params. The DMA is then started with unprogrammed
> registers: silence, followed by an XRUN. Intel does not set INFO_RESUME
> on SoundWire for exactly this reason.
>
> Dropping INFO_RESUME plus reprogramming the DMA config from .prepare
> still does not fully restore audio here, so something else is lost across
> the power gate on the ACP/manager side. I will post that part separately,
> with traces, addressed to the AMD folks - it does not belong in this
> codec thread.
++ 

@Andrey  Golovko: restoring the dma ring buffer reigsters, pte programming along
with
re-enabling irq mask will be done in acp70_restore_sdw_dma_config() function
which will
be invoked during resume sequence.

Could you please create Bugzilla ticket and attach dmesg logs?


