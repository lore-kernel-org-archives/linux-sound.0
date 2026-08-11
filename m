Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0BB32143D;
	Tue, 11 Aug 2026 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786458086; cv=fail; b=Ksw4p6z8R1guVUkuudr4YLMN9j4+BCukuQSqzgtisD+IvUtOaRZSf2uSsBJoA7kmsZ4Z0z/0wMG8RmadB/Hs0Imem5JX+TO7WjoRWvI//xEXLsOipEy/26ES5Vrs3rKjE+Xl/hdj0rCAt7ryu3bdTBL92BSsIMxlVIrjVmpSOXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786458086; c=relaxed/simple;
	bh=WYNrNKXvz26Blv0p9Hk9ebrSLvvii2HBPv2dU3CWocE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ma+YRsRQ4urrw0f0ZR9A5NO5WtCrJ6MLRhZ2t1NPnzxrW8p6B60Fk+0A8yfNYTC0v0+IklrXRXmdmYTqPLKmVRUCwdJY7Eex2C/d/SIGg50LFkg0UHjdbemXO9PhKozJ8IpVnlDNNZKqroCp/mXurCAxDMo2n7WlNrIBiy0qp0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g3cT0H2U; arc=fail smtp.client-ip=52.101.43.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g3cT0H2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrPKhuEAE84f1jeP4x7NKApThwsEaNNG6xWy/lY2sA/5ctJZRH39VqZSYCOlvBLpfnzxyE/zoTOVqCJoLWhpvSjvWiVy3OWaVEvctCLPw/SwI3s9vc/DjJAi/dOvwzOfh83rKOBwiQcpGmjV7ZIK1D7yPh19r8Nk9c247GNlaqp7lblBUFMWX5+9PIc0BMs2Fw6pvvduzNfpvXA8zyfytqKAVTQm7UNdru2+3m1PXINJc6w+Z1HMNSB33cpqi87zbkjBXEPQ7Bgjm05kTqXZX174k8bLfSL7f10VtPW3m0kJ7I0nFcRwonQaLeZ/W4UR9mVb+tOuJzWKI8XmCxH/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrjR1p5e94lLQchbplo3R4YiG1V4Oqp6E/dcH6AIDOg=;
 b=gd5mhEmUIDIu1JM8xetInT9GXkaQn4QZ66lgQq2VNiqdpBG2G+RVD/SCOtgubBajSE4xPY8u2ohoh2Yt6gMaDFKcmzSyFI9HKOdZyNincYCNc6INVkEaLtrRqnrQE3xnW+6W8+8LpQs2o3hwfUT4uoxkgpDNNEaE9AtZP9G0ZNo04djAc8oyR4DAvJbrAz7GSLJEw5Vj2HjRBxUTP2KoUeOsKP8pwY2ytYpZYONkIQjsSio9yqOe38mZtSY04Huos1fvghg1HS8Q/1IaH2FsdSuJRYijdI8VP/Vc3C4hC91OgCsjCb/b2fz4UbkI/2D/MRXGLTVIdEN2MiKxvfhd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrjR1p5e94lLQchbplo3R4YiG1V4Oqp6E/dcH6AIDOg=;
 b=g3cT0H2U+Hme5Zntkb+WFo47jcLAzO65povrePpKs5MY9UCFZYnRAu4ZfD3JCtpMbyHLoN5WimKOZoybwmWgLJIPLly/BAr8KClqJjsWFEMWtJoN5/OuUqxNrcEQKb6vJv/KnPF24aeh7xJzno9LIWUq0a8h4mdDd+Wy0++nLiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 14:21:21 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 14:21:21 +0000
Message-ID: <7468b060-161b-4489-b876-4448bdeaf184@amd.com>
Date: Tue, 11 Aug 2026 16:21:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: clear stream pointers on
 close
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Dhanunjanrao, Katta" <katta.dhanunjanrao@amd.com>
References: <20260807002056.42953-1-rosenp@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260807002056.42953-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH3P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1e7::27) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 6758e248-e3cc-4d34-22bc-08def7b3d0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	3KDAkIibK3RZaftr7D/c5BJXdyiJfWA7j3jHLtZBHqI1o2m0OpQ4PcVaLxy394/xZ1lg5Z3+FddLaQoDxPfFHPG0byYxT8dynzPiJzU2y4t1OWGJ2/pN4/vkWe9GCjzxW9GZvLIksinGiIWJOvY9h0lCpSlBLxtYyA6TGkBo63ReXwq8U/f1gg43anVaTQzTXyc4hjDE0QXtGl5ZWBsUnQFFRR82upr34yFzRfXYyh5rTadPT+8lLzv+S7w0U5GMlnOs9IsG52RO/U0qRPcspgWNZ6H7P0DsGI95Jn5jWvtPqSyhixQx9CN8OSIHJsvnItoLM+9zLwDMIkCfA++N/Vcdy5lIyUK68aPmHj/UZLtm+fBHWFkY9yvLxLrq8zWY1yYJ9nS0oINnWp06BuvPuZSVF+sCmt5IWAXSJdfZvip1sCki+kzTUmDNIwPhf6vgJ289AO/FidEoVxc0TgZRGDPdp8OSIIx4ZDNf1M13yz9oQS8EzyUCmFVwMnOzHPVGcMES1u1pCe0FAEKtusAUjrE1Dv9SM3HK2Qf8eiWV0a5FtlgbRfKMYfgY8cInqPKAA+kFQr7gbcoHanhy4Q4r6Af8BJeC8Q3qj0CmDhC5aw4zWtN7vsUPoBGWz+vpF7CCBLYMMNEB0wetCuOb6Fmg24QwqF2+0XgegtYbkhc+4Ec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3EwbnpheWR0QlVyWGFGUlZaRElFTm8zTHEwSU1mVTJWYmhhTGdxYjVORmNV?=
 =?utf-8?B?ZEhnRzhxM2VDS2lmTDV6R1lQK0x2VDZqU29ocWtoU0NBZlBhd1lWRlgwSVkz?=
 =?utf-8?B?SUkwVkZnRmhUMGdwbVlGZlZiMzJ3dVlKajhNaDVpVnhTNUhyc2c1U3g5blNS?=
 =?utf-8?B?WW5jN21PODl5ZDJQYkZJSTk5dWF5a3dBenVHN1UxMmpuZkYyNmFhdCtSelh6?=
 =?utf-8?B?aTdGUDNyT09WTDVMajFMV1lLQ1pUT1FTSWRjN0pSc2FiK21OZG5xOXVJRGJK?=
 =?utf-8?B?cGpRK0ZyRUF2Ukk1TDI4UWZGQ2xScHN2VEV3L0NTZlV3c01mVk0reHhPT3pX?=
 =?utf-8?B?UzNRdVdUaG5pOVZUWmNrMFZMb2VoRjZKaThvTmQrT3VTQjNMekVvVSsxbG10?=
 =?utf-8?B?RUJVbHFpVVIzYy8ycEJWbWZVWWplS1oyTmUvWE8vMmc4NFFJQXNySnhTNzVM?=
 =?utf-8?B?d0NRVVdMUW0veDBUdnpKZ2lGZkJyaUgxQlVBb2YveVlLcUdTdnJ3ZWlqZEly?=
 =?utf-8?B?aHhFdFQ1SkgrdERudFFZdFliSjhVdHRPVDBXdVJVLzYwRE0vWFNjbVVQa1Zt?=
 =?utf-8?B?YzJ2dGRGZ0REMDVNKzA0d1RkcUxJS3ljMXRTVFhIb3lIeDUvWTFhb1VDbUZ1?=
 =?utf-8?B?UUpnQnhaVWFOMVFSVWZNZVF2NThYbkhnUnMwMGI0THl2WjhJc2NJYVI4a0N1?=
 =?utf-8?B?TEtWdFNyZEtXNENzOFFIUWJPaWJQeWg1THoreHdYMXJ1SUJLUjllL2IvdVFn?=
 =?utf-8?B?bjJna2UxK09TRlU3QlpTd2g1aG54YlhVOGtNZ29EQXJ2UFdma2pVL0RObzZm?=
 =?utf-8?B?a1BQdUVWRXpPZllSQ0F4V24wZ3RxOFJwcHRkeTlFd3FZM1RUR0pqVER1a25I?=
 =?utf-8?B?OVdGQnI2L3UyOEY0M2FpN3N6U0RjajE2d0Fwb2gzeXRpRU9TMFFLdlA4L2JZ?=
 =?utf-8?B?SjBxNlFQL0NZU0R3M0Jja1pOdWRvVExldU1GMGswdEsyZi9KNFl5d1g0M0Zk?=
 =?utf-8?B?Q09sTTVFaVNuZFRGaDJUS3NHODB3Y0Q2RUJWWTdteXo0eGM1RFlSdUlOaHp0?=
 =?utf-8?B?blIzOHFGbWozSlBjN2J1R3V1dUp1Mlo1ell6WVVVanVvUDJLeUJBV2VSbTBx?=
 =?utf-8?B?SllqdGNQVmtwU0N6dUFFNDBTd0Z2aXExem1naFFxckRybHZoTndOTWpZVEJI?=
 =?utf-8?B?akNCMWhQbzRLaXJKRnJ5enRBTTIwOURPV3pBNUVUNzBIUjBkN0hydXk3VU0x?=
 =?utf-8?B?ZTNuVVRIL24xYUZERkxmU1BxN3BBcWxOQ01HaXlvZm1JaXhKUG9IK0M2VEVQ?=
 =?utf-8?B?NnVFSU9TZmNwczhRWEJrUWFJWWZDb3VLUGJZRkJEWWpxeG9iWDgyU3NNbkcy?=
 =?utf-8?B?eXQ2N21QenpNWXQyeGdmSHBFa0ZtTno1bEhJM2ROZUdGaGx3czJUc0dmbXZp?=
 =?utf-8?B?UGIrVkVhVmpob3VlQTRSYkZoSFlCZjlNd2ZSM0QydFo2MnF2cnh6UmRQb2cv?=
 =?utf-8?B?Y1JsMisveEpsVHBQdUlQM2grQXVpS2k2cEdOTWtHY0ZmeEhYMk9uaHNxZUl6?=
 =?utf-8?B?ekt0MDdFb2U3cDVmZm53S2g4ek9JL1lCdWw3WDRDQkhBYnBNbWtuS3dkY2lN?=
 =?utf-8?B?RFFETEROeUdxZGIyUkxXTm5HaytOWlJzSDEzM3JIVnJYK0hkUWFUaXpDdkVu?=
 =?utf-8?B?MU1FeEZvTEpqdzd1cUdJcTQzYXU3WjZVNjlZdjZ6eWphcS9HeDlGZXJnUklO?=
 =?utf-8?B?ejlRMFExd0U4ZS83R0liYWI5ZnRFQWk0ZTIrWWl3WHAza1hMRE4ydm10dWs1?=
 =?utf-8?B?UTBlb21pOEE0cUNDMUZSMm12LzI5MWw5T3d5Vlg3YXNnWFVrNUxhcjBoY0Jv?=
 =?utf-8?B?SEJMb2xlK2Fia3AyRjRnR1NxZ2I4VUZKRnVaS1VGbVNUZ0EzR2xrRmtrZ3Zw?=
 =?utf-8?B?WWlDTE5KV2lqaDN4Mm5pUFEwOHdyNGsrK09HQVE4RE9idjNvRUJuWWNFSHBP?=
 =?utf-8?B?UGNrelJKK0huTFNJd05wVjNUY0JHVysvZGJhYzlpZHpoODJSbWNDRHB3S2k2?=
 =?utf-8?B?M041dnhINGM5Q3dCd0dRMmVLaFg3QnE1ZFVzWE9SanZZZU1VT1hmblpjSU1D?=
 =?utf-8?B?ZnBCUEZETXRVcVVtaThzMDNYNmRnMFYxam5NSG5zM2hRZmhLTS9wSmhjbDhq?=
 =?utf-8?B?STVkNnpWTVNhMXNnWUxETEk2bU1NWkRFc3MxaktXcGg5a3E0ZU1SeGJQWkZa?=
 =?utf-8?B?R0IzVEg0WWIyMFRoUTBrWFk4dmhuTFY0S0FWRXI3MjRzcjhIdGQwZENyNWdY?=
 =?utf-8?B?TXExVFRKSWhsa2ZpNDQwVWRtVUx1R3p5aGVmdUxrRi8ySnBnb0RlZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6758e248-e3cc-4d34-22bc-08def7b3d0e3
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 14:21:20.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqQUyn4Yn/5hktPr4AD5YQCc8T/NWDPNNVCaTnRk8ea8DBz660SD2cEyThS3R9Sx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645



On 8/7/26 02:20, Rosen Penev wrote:
> xlnx_formatter_pcm_close() never clears adata->play_stream or
> adata->capture_stream, and on reset failure it also skips
> xlnx_formatter_disable_irqs(), leaving the hardware IOC interrupts
> enabled while ALSA tears the stream down.  A subsequent interrupt then
> dereferences the dangling substream pointer and calls
> snd_pcm_period_elapsed() on a closed stream whose runtime has already
> been freed, causing a WARN_ON or crash.  Since the IRQ is never
> disabled, this repeats on every interrupt.
> 
> Disable the IRQs before resetting the formatter, and clear the stream
> pointers in close so the IRQ handlers' NULL checks catch straggler
> interrupts.  Do the cleanup even when the reset fails.
> 
> Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   sound/soc/xilinx/xlnx_formatter_pcm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index 7eba3a0205f1..e1d2f1cadf8d 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -421,15 +421,19 @@ static int xlnx_formatter_pcm_close(struct snd_soc_component *component,
>   	int ret;
>   	struct xlnx_pcm_stream_param *stream_data =
>   			substream->runtime->private_data;
> +	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
> +
> +	xlnx_formatter_disable_irqs(stream_data->mmio, substream->stream);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		adata->play_stream = NULL;
> +	else
> +		adata->capture_stream = NULL;
>   
>   	ret = xlnx_formatter_pcm_reset(stream_data->mmio);
> -	if (ret) {
> +	if (ret)
>   		dev_err(component->dev, "audio formatter reset failed\n");
> -		goto err_reset;
> -	}
> -	xlnx_formatter_disable_irqs(stream_data->mmio, substream->stream);
>   
> -err_reset:
>   	kfree(stream_data);
>   	return 0;
>   }

I am not convinced that this is correct. Based on
https://docs.amd.com/r/en-US/pg330-audio-formatter/S2MM-Control-Register-0x10

when you trigger reset (bit 1)
"After completion of a soft reset, all registers and bits are in the Reset State."

Default value for BIT 13 (AUD_CTRL_IOC_IRQ_MASK) is 1.
It means after your change interrupt on completion is enabled not disabled.

Katta: Can you please confirm it?

Rosen: Did you test this on HW?

Thanks,
Michal

