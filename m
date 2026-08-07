Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373AD42FCB7;
	Fri,  7 Aug 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107577; cv=fail; b=g+kaQTcHaC3rdCyEzKB/jm5xdSYHCdmonO+BeC4xWidTCBipZYWMrvwH3pR3VAOGqud+W2RJYYby2558qlrpSjuvEahPO828DBHT8nKTqBdGPSqp9XVMcvNPD5qJkw2OlFQVOwpnaA6dlHGdP/HsXheQ2Nz7/IY0uvdxOqKoMbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107577; c=relaxed/simple;
	bh=6ku8XnAK/E3lxHhxu77/1ddBjYoTj3TTa5y1LSSilIE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dTs3ULyzJYozgEwhn94fKhWUTC9k87sMAqiTjnKpoXsJ0niqzQo0GEFzGS60vm0zOFLuxhwPOe6JCqBE+kUoMVM+e44GgAxamz+LYnpxnnL4Tc4Zy58KON2Pgd11GJ4F4RqSXU29eXDCUVatQQRpstDpDe5ydhTEV+EmGgsidAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mWrVdalX; arc=fail smtp.client-ip=40.107.208.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mWrVdalX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wirKW4mTSN+nTJNbreHt+mRVqfv1qLDk1CMzeTcvvEIsORgYD+u3V8NwI/7nEyVnWgIIthmId3ShhgZPDgz8zldGDaYbdLr7yXFCYG8aKBLqpxi9hRWFGrIAm0od8EECnma5EpM5RwBxo96UFB1dsAsd9+OXhW/FdW/3S7giKavxbHxyz10L3J+nUHnnL+kkrKLDsrkvThD53lxKjxQKkBFzJN9MRYw1mgAsGJR87+LNl1imM4hauzK/BZCY7eD/o6zoMf4+JHEArQNhXXnc29esp8sDTpZHe3wFPeWhgmrunAvDO2MWUfi4BCQcp1zsgt9rmg1pPLfOo+X1XCTuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j29baiLq1p+y9jPTKGPueGjtU4tpK1Pwti6XhDI0jeE=;
 b=fcMNIuSguYQauniIw58uRYPE+Oi+VMVCJPH03nhXtA0P82pKLaDUVzlheT3D7nyJLkLVoKc6r8YRdC9OC1hH7Zv9gFwpeaPJlkgFwfnQK4F6Q8fOGziLuc7arrjVZUF9cibFL0FLy54ty+cpObUEJhHOrY4bMwZ+GgBHa8+bsxIJeyvbbqwQCLOsKf2xBj/Gk02Et3OjhxmI02309I25CpJqr25RdJKh9G7wRVrMOtEAUqxo0iyRCsvc3hP1VeWx0bdlGixf/2U26td13aPaGZ/gHdNfTIOTIsmBPck8k+4g1IqYWltvu5/wpH4zvugOxky7vm/jhKs7df5R+v1ZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j29baiLq1p+y9jPTKGPueGjtU4tpK1Pwti6XhDI0jeE=;
 b=mWrVdalXHBmb/slbqEepIlOoAiaIgNSAr51337ZKgEwudS7MsxT87aoiGJDKzQzENaRMUpwiQ8pvjGngzzjpgTozLXcOnTlbonD7PoMvbXTsICLMMz7NltzaTnmMXahJ5yvEJ7OceU9s8mKa4VRRrl/qrfpCQBk2SeWW7BsuETg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.19; Fri, 7 Aug 2026 12:59:20 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 12:59:20 +0000
Message-ID: <8463e770-9573-49e0-b51d-6b9fa264ae88@amd.com>
Date: Fri, 7 Aug 2026 18:28:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: return irq error directly
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260807012408.55272-1-rosenp@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260807012408.55272-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS7PR12MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aea3f50-9ca2-44a3-0dcc-08def483b1e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O9WScOB4zKv4VEr9zR2QIa3WVD/SyHsyRwWRdZVGNT50ZKP1o2s0skkEKZyatKIz7e7avJa8CxAXwL7bFJQiih9SXCFxWT7PGGoXXPINBdj+AogovLgOuO4iFVxw/WRMwouYw4jdXBJhCFbovroX3LdWK8y/Nf+FHXzchK5LGVbegMZum0yFcYJ/2P2Ljw2yJe2NJiTHkjui1KD4hW2l9vvzdltGYMPTK3vUC6JutME4HSnAReuMCfuBUKK7+kh3sxrU2y+H3vdbKS6xSVl5XfvyGsXF7UOtx9J9XSRhyWI6ANr+JPWT7vFaE26WeXN4YZFoUOW4AWRB8Oq+PrghATTdbdWyAkmIVOFuHpDKvMNMdEp2B9yvnlQdUDa6tkM3IBszm70hgG+OAAozLSGpeiVdEJVlEc+YHyED8k3Bx4b5/EtRAT2EF6l0gsmWYn5mxUgbdZRSKjrs/UGFFH1L1f16uomtxyPo1eYT7osWAyEPFf9J4GoEfzGEqLo7rby+ydCx+w5u1wmCskag4PJ15h8Kh2QFVSfMygn+X2IxHJVxQkAdh+gEFPRHycwy8/Xle5VL8uXLrLl1LIGKNnOUpu8dB/aGwG5+Q186qsiGLJeW7ObAOriemKQTup9UVJ5PrgGX0o0BvcdVqQo6D8W682Nc++CFXctcjr5KcVvvjSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHpoS0QxUDZwaVd6ZGU2WDlOR0gvRFloRmxXcDZrV2ZNZWlRMk5NbXg2aldk?=
 =?utf-8?B?SnpPQlVKSHhKcW5WNTd3Qnhyb3MzQWtJTEorbFZSb0JaNHNPVi9ScllIOW44?=
 =?utf-8?B?VWFYQVRqaHRwYVd3QzE3cm4rL2VoUnBWUkhpOEszYmVWRURrVkZxZ3BQVHk1?=
 =?utf-8?B?dHdabE16Zi90SDgrWDZVTDhVa1B2dEN5QUVQYklNUGJ2Mks0LzZYNnNGTlc3?=
 =?utf-8?B?UVhTK1NUSk0zUVMwVVJKaFZ0cDhESWdCVmt2UWM2ODFYNTkrd3hmVXI2ZHVn?=
 =?utf-8?B?cnk4VlYzSlJoL0tjdDdXVG5nanhDcFNzNnJISmJPMHl1OG00T2txLzNZbWRh?=
 =?utf-8?B?QWIxRU5qTXBMK1A0azVsSFdOdHVwOU5LOEJTTmhDdUQxYVRHQk1KSFZsN2JZ?=
 =?utf-8?B?ZkZpajRrZUFsTjFqdXllZE5GN240NXB0ZXl4c3dyZTJDb2ZiYTFNKytWQzRk?=
 =?utf-8?B?ekhQTHBFOUdaVDZ5QTQwL00xNncwMThHcEFWdzFHZzJrRkIvNmtBRE9XQXZr?=
 =?utf-8?B?TXFUWFIyWk9EbEJFSnJiVXhRS3NBSG1XdU8xVEJvQUFPOUtMa0FaemFQRHBY?=
 =?utf-8?B?cHp2Zm8yVnl4YzE2b0NwRjVnZkZmUkFFdk9GSmhqdGpkdVpKMlR2LzRnR01C?=
 =?utf-8?B?dWRCUHRJcENQaW9LSHNIcS82cnVTR1k5VXJZc3NaQzFSN1dZK08yT1JpS2xz?=
 =?utf-8?B?T3hxSjMrdjdXVlp5c0lIV2FHNHdGTVhpWk85OXVub0RvUytnMkFzRTkwZGp6?=
 =?utf-8?B?ZlZGRzY5THNGbHlsQXJ6bElpVlFCcEpPT1dSM01tdFF5WWhURnd4aWpTaDBE?=
 =?utf-8?B?clBGOGpxeWVvQnoxY202ZUdybmFPNlFpRW1XODRsRzJFcUhBTUg1MVdKNGhJ?=
 =?utf-8?B?SVg3aHFGN3NPRkIyTGVGb1RxK3R5RERQRDkyZkhIdjVCYWhRWGxxeFZFb3Yv?=
 =?utf-8?B?Rk1kV05LQlRQcGg5WnhRZ0JoWVlXRGU3L1lxRG1Hc1ZGU2JteCtFZkY2a3lW?=
 =?utf-8?B?bWllV2xCbGxORHRCSlJyc0dHTUtJa2Y5Z09hdWVMQmRkSG44VytQeGtnN0JO?=
 =?utf-8?B?NmpreUJvT2U2ek9BeUZkZDdjSG0vZDJpU0xtTHZSTHo1SkxmalBGbnpBMjlY?=
 =?utf-8?B?NVBwRzFkRnh0Q3hQcDNyUXliU2I1aGhvSU52ZFBXKzdTTGRMRk9sYTBINTg0?=
 =?utf-8?B?TkVNdHJ4dGN3cElEeGNNL09uUE82U2grV3ViVzg5bXNkWEVNekhNMlBNRmNG?=
 =?utf-8?B?RkVKUXFWNTNMdHN6b1AxRjlaYTQ5cDZwdXVyMnEwRmljcXoyTklYbURUaHdo?=
 =?utf-8?B?R25vaWVpeU5QK0djNFlCSmNIWExJOEFZUlJFV1R3MlQ4cVFNT3hZTG43SFY0?=
 =?utf-8?B?b3JRMm1IZ3J4dmxZbmJaQkYzL29BOXVZcWxiTUk0cEhMLzN4eUR1ZHNjQWJQ?=
 =?utf-8?B?MXd2Vnhpd0hiaWlZNkczN0FjYXlHQmd6MVNXemhKbmJCREdySzJLbzk4WHRU?=
 =?utf-8?B?RnZFK3kraDNxbHRMK1pGRy9ieUpCNEw5ZmlFTXNrNm5abi9LclVYT2Y2cThR?=
 =?utf-8?B?ZVFKeTU3Y3JjZTl4V256MU9lN3ZBNHZxS3dtZnlDbnJKU2NZb051Njgya3VW?=
 =?utf-8?B?Q0NING9XVTh5dWd6bytzeVM5elZFMU1FRk4yeGJsSGZVQUR0YmNGSzd0UDAw?=
 =?utf-8?B?OGkrK3NFOXFTU3czQ0tmYkM5MkN1LytFQS9vMVFtZ2d1QVZ5QVo3RDk4TkJ3?=
 =?utf-8?B?VnlUR0R3QjlRb2hsVzVYalVwdVRYcDM4aVp3WkxGNERwWENsQ3NBZFJkMERr?=
 =?utf-8?B?V09RNU00Zm9wc2Mvbk1SdzJJMC9QRlBMVFNhbTBVMWlRYVBFNCtSZ2FPd2NW?=
 =?utf-8?B?T2pmT0xaNVNUbTVjOFI5NjQ3bkhHTDVJOWxGY08vdlh6RjFWWCtKN2FhZ1Z3?=
 =?utf-8?B?d2k0SHlKRUpKUGw2OG1qSjR0TzUxTjRvV1lZcGNOci9Nb0o0cDZKTDg2MjZq?=
 =?utf-8?B?cFJFcldNWDE4THNUOGo5MFN3cXEzblllcWZ5bnl6SkpTT1NDZkZIZjRBa3or?=
 =?utf-8?B?MDhPT09KUlNpQ2h3cWZrN214VW9XQWFnZi9vdldjNFZBSFVYYkNHM0FsMWNN?=
 =?utf-8?B?ZGhocGtpOVBBL1dBWjc1RTMyaE9rZmtSUWcwaE9FS2NkeXVGUFFmdzhWOUVK?=
 =?utf-8?B?UUI3MHc0bWRsd0N0QWVkRUwwRzg3NjBnMzZXNDdmS1lZK0MrRDdtN2ZoczJ1?=
 =?utf-8?B?cmlwT0tDMXNRdTdOc1Y0azJOWllRd2s2K3lxdzdqNTFLb3RyQWp1cVI2STAy?=
 =?utf-8?B?RGF1dHprSC9UZHRxUS9Ed001SHM4TXkwSXhkSU13QTlDRStKYlFIQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aea3f50-9ca2-44a3-0dcc-08def483b1e9
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:59:19.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BK/c1m0YSaN4w8kDVkCjsBwCzEMxhc/hApZo5UfXpIqrAX5q4X6j8JVEmqkxq/O1DcafGMWGSdh86x7NhwnbmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527



On 8/7/26 06:54, Rosen Penev wrote:
> platform_get_irq() returns multiple error codes. Return the irq directly
> instead of just -ENODEV.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/acp-pcm-dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
> index baf4b41e54df..e99588458ed8 100644
> --- a/sound/soc/amd/acp-pcm-dma.c
> +++ b/sound/soc/amd/acp-pcm-dma.c
> @@ -1292,7 +1292,7 @@ static int acp_audio_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
> -		return -ENODEV;
> +		return irq;
>   
>   	status = devm_request_irq(&pdev->dev, irq, dma_irq_handler,
>   				  0, "ACP_IRQ", &pdev->dev);

