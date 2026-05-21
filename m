Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4F3803CB;
	Thu, 21 May 2026 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363734; cv=fail; b=s5xWZRA6kMgh+xl7wjM2YuM/BCb0VMQwfbl9XKizF+oomhiV7gDN1Su0n2CvhvrMgJBMoSwOL/qtS9gzYnVwG1Rxla3L8QVQSiWn2+9ZitFx++iTwqJ6efGV7qld7XcbGK+JqVn7jN+cRxRJ4PN5dntidPCHhQCiVqL0kbJtCkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363734; c=relaxed/simple;
	bh=kKnTxXz1vfr0NEqPm5jRVqYrI9Ed9etVrbxBnvEkZ7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rP8Ps1X+Qg7AGBiahLBM0TIu+TYiW0aMY9u+euX2w4H/gAkEN8cPa8TceLJuGZfME6VRLOCelosAXgDhD5mHiOKlcIGirnpzP1at7OejrLhcJc1hZW1wshXzTtFIPWX5j5TMK2/nZohFvBaFnf8Nz84PP1YkzWguQDGbwah6zK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r5MPfjFp; arc=fail smtp.client-ip=52.101.57.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r5MPfjFp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvpEEPyltY8nTW2sVTtybsJk5HJrE7AgeVuUKtD2AA+kjElf8tF38V7ThaptZ0D2rX4FBFA1vcYkanvd0UlDq/by+Djfv1CgUv+8w1Ji6EGugwzBqTMJ3Vzn92/YH8nvpD43zLUr4BfTatBn5/hD92xZg5iB1Q2rIVanLBZpPGpNhYZqM5XUZ7h7cat4cu5jqJJROCtwxD2qegVlSqvMxTTgaVBo0173xrnPIy8S26LJAGfujDtnnXFQlXt2CslETa5R+OTjC7vDqgyXTFsOpxYOAih0ESk3gpvAJqoGagFs6QXHFiVPJw37+Mgud4zxVwh4BnDn6GtOfDRKi4Aelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKnTxXz1vfr0NEqPm5jRVqYrI9Ed9etVrbxBnvEkZ7g=;
 b=IZ+eycrBuP5idwboD3nQf2HCoHZCBKUXLldGyMVzt+XKL0rzOiT1An+5aDg/xVROeOz5JCfp+p+NcZQI/p8bl9YRNj2xTX3waXaBIcSSQdo4M+gOxnnV9nk9gL0Nz9d8p5M0CDuCelZcXtMECFHndlQqCjakYsOqCJdtnvKmraBakn7lFje7adi6+mTLy8wr/BaIa1LOwSfhqmUVnWz/6KR8hJG7TmyaEqNNug5h9Q026quSmV9ztYiKJTz2iTL2frc4qJt7zlajdc+JsughnSzSow1YypSTFfwJeJhGVQIUHfgR1YeSrYQ3pj44Kn9kbdD3I2A0u8NsIflIQXCvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKnTxXz1vfr0NEqPm5jRVqYrI9Ed9etVrbxBnvEkZ7g=;
 b=r5MPfjFpeg0P7zeHyzMvV6qatW7JlrZB7WyCRL28Ar0xc7/J7DRspWNA440/exmlhlhk6Ie2YCv6reQ39vJphkDsSQdIUqw6QNZzsS5zimvfNvGBQIxeEXHjpsxnBBbilFndOp3N1Uu/LlVMfiS5H4dhhKPuDv5odCkHaimd/vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Thu, 21 May 2026 11:42:07 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 11:42:06 +0000
Message-ID: <fe98d961-c02c-4794-868e-7911991f7321@amd.com>
Date: Thu, 21 May 2026 17:11:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ASoC: amd: acp7x: add system and runtime PM ops
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
 <20260507181251.20594-6-Vijendar.Mukunda@amd.com>
 <905bfeff-ab78-4299-a2a4-45fb8f05e716@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <905bfeff-ab78-4299-a2a4-45fb8f05e716@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::15) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: e33b17e6-207d-412e-d97c-08deb72dfc49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|18002099003|56012099003|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	BM8PPM8skINskf63kgfNv/xMERDw5nvYQ4+p3gjlVUo5Z7IZ6G7rBxHMFrUnEgaBc3kw54zuXyTbbGTxaaVyut0zr8YcAVAZMdUkenV3wqcrllfTXCoxOiWDXrkc72bNZXxY0Y3YpSDyBKfBBDOALMcwbKABUfppN80tTQsLHbTd0VzTpYq1g78JLrgXKclN62j8XzRghJVz2ScGVfNvXfYePlf44MxlD9qC7y/nMX05FleZ6cKRFgQQoWscnA5bdoiY5kuRk1lkPFrNctz55qOpb682JD0gZdQBX6ldeU7DCShnUbSaaH00f3YxEcY4KbcSzYrFqNsB84eWRwqBsCc/KV2BO+aPDVfxaPWl3Gycr47CtX4N0j9RQx0+v6sRVHM2onGOqu7nxhe7i/jy2ZQ0iozs9x0awXBsXkSIWr/fEkGMzejmo2RgHSkWrWIbdTt6Ov3wXCAPBH5vAS8MDbaqkjwyUtrPoJJHSBzIEg0wp52fN7+CXJJzIj9yUzStUG3qBPQ4adK94HUJf5GQizPC6n2hbnMHMRdDg8dJ1C90ngU9wLm4GM9qPVvl8qXnucqqRpzmiUBzH10uZJfgl2ycDCXqbIJM+cHohZF/EkF4SI3RXZK36XnW2c9A7Keb6oeWPTVz+PkHH8eUlCAAmvM28i6NK+HzNj6qMfY9ibEJ5eHjRZhAHbiGhmybxSG4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(18002099003)(56012099003)(11063799006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THRRVURRUm9MM1l2Z1ZZM3lsclVUVlNtVlJhR1UzSm5wNXk0SkIzRm4zY2RH?=
 =?utf-8?B?MDJKUzlzdjNIZVhNeDRIMG5hT0NrQTdSekFqVGhqWXhDd0JWMjhHNSt5TmhZ?=
 =?utf-8?B?aUpoSzNLR1BEc3k4bDBNZmdZb0N0dlA5dm5hZ2FMQVpHajJrV3BPK3cySVZD?=
 =?utf-8?B?eHV0SCtyVHB0SS9CRk5HekQ4NFVaTlRvR1k4UEY1ZEx4UmltUVNuTGZneWpp?=
 =?utf-8?B?aHN1TlM5ditIWXFhTEx5ZVppdVBpLy9PU1JST1BrWWs2TU9mSno2YmUrbWsr?=
 =?utf-8?B?RmxKdTlUMGdHYVRWWWFlUXd0MHFQemo5bGxOQlhEdGIySnBDNEhKUW1IZzN2?=
 =?utf-8?B?S2hPZ1NYQXpCZStLZndzUm5NUUFHclBnM0hpa1JMMXhqRisxQ2wrdXN5cm1M?=
 =?utf-8?B?YmdQNENEL2RGaTdxYmRvS29yRS9lY3pjZ3BpSnZDVDR2cENlY1JkQy9sMEVp?=
 =?utf-8?B?SVJWaEUxTUt2TnAxa0dFOGdJd3BUSXNIU1lOUzlaOFk3ZlhFaUJWYi9GT3FE?=
 =?utf-8?B?SlcvTHphVmNrbFl1anArUENpd1NUTjZ0UkJrS2R2M0dRbi9semZFZ2g2VXJ4?=
 =?utf-8?B?WFhOM1AwTmE1czBxQndYaVFFWU9tZFpPL01iSHZ6YndQVG84UUMwcXprMlhU?=
 =?utf-8?B?N0NRQzBaRGVNTk5rZkEyZnpIUFJEQTdpTVcrMnVBejMvemY3bi8zcUQwbG5L?=
 =?utf-8?B?cUliUjN3bFhvcVdjZDVObXFoMzRwYmFuMnltdFJIQW02ZVFXeGhrQ3VPd1c5?=
 =?utf-8?B?alJaczU0aG1qMk9BZVpEdWFmZXI3bzV0QVBnZ3p5YjRBRU8ydzlsd0FRVWdv?=
 =?utf-8?B?TDNuUlFRTnFtQmkzN2RJa0hpRnhzU1RVeU5uVXpPRzFFd3crK3FYczNiMHlt?=
 =?utf-8?B?cUhFbDUreEl2VXdwWGorSzlVamlEU2lhdytONEZOelRJaGIvaDRWSHpRaUwv?=
 =?utf-8?B?ck5EM1dJRWpqSnd0R0NhYjBVM0tSVStWenoxV3A2emFzZ0NMMDVHZFM1b0I5?=
 =?utf-8?B?V0JleHEzaGszNStqNG5XUVZZZEtFeFEwS0NpSjdmWnRod1ZqUGVrUlV2RFhp?=
 =?utf-8?B?YytqWFJLSVRFeEZJZ1RVV1F2SGI3UldHUjJPNHROeWE1UkZOeGUyOHRwTTZM?=
 =?utf-8?B?TEVIL2JZNVNLZTUxbkgraGNpZWlaa1ZaS3g0d0dkcm0vUFhJR1ovWEV4QUpo?=
 =?utf-8?B?NnpLZnA4QjNaN1htS1N6SGc3UGRuOTc5QUVvNm0wMko5UVI5VzVZM0RVS3Mw?=
 =?utf-8?B?OUxDZ0wwbnJxbE44dGJsSU5jS2RWU1hjczdVMWlsQ01MWkNVZnRVcDFvM0dK?=
 =?utf-8?B?cXBvSUhsWCtxbDZ3ZGd5UndmbmVMbjdjc1lwWlpwaUo1elR4akxjcW50eHJz?=
 =?utf-8?B?TGUwK00wVW5Vam5ENDRIRGJ3VDBXbE1uYU0rME9tanpjU0hacUF4aGcxSDJR?=
 =?utf-8?B?MGI2Tmx5SzJSYkE4azgzbnNHa1Ftc3pvZllQYjQ5UlNDNE5tY0xwWi8waFRQ?=
 =?utf-8?B?MDZVRjFsaVkrUHMxN1UxbGU3NENxUUhoWk1UVWVKWTJ6RHJZM284azRsRVVi?=
 =?utf-8?B?d29wZW5Cc1pqREdNQ05MV2lRcmZ6dFNxT2dvaUcwQjk1VWtNdUlaQk5iUFBH?=
 =?utf-8?B?ZGRZRmpqdjQ1TTdrYWxlUDJOL0JtWXp4WFk5MTl4c1FCNU04ZFFVa29TNVhW?=
 =?utf-8?B?QThoQ013V1VPNUxZak4yZTdEWkxrUUdPamhKYmMwV0NjL1NXNDVadWw2L200?=
 =?utf-8?B?ZXpQTkY1SnBXSFlRc2VsMVRab01KY05nakJuaVNyWmxJZmpudnlWM2lpNU8x?=
 =?utf-8?B?a3VJNkxNUmRIcTZxeVZUNjZPaG0vZE15YjQwcFdXdTF6OS90TW42cVM0aG9i?=
 =?utf-8?B?VVl0WUN0VnAyUG5kd2hPWXF5b1I0aHZLVG1YaXF4YWNDc2pPTDZ2alZKUkY3?=
 =?utf-8?B?alk5blpJTGgrMDB6WUJqSHd2c3psT1ZpMEF3S2JDaHpqUGQyTzNBa3FLVzE4?=
 =?utf-8?B?Y0l5WlpIN1BZaVloY0VYQjdEZ0cycHc5SjhHeW52Y3RUMS9OUXNQYWdKWjVM?=
 =?utf-8?B?SVpHQ3BrcDVvTFl1VmFMK3lid0FkL2R4a2lHZGhQeUU2anFiYVRVTzhWeUtq?=
 =?utf-8?B?SjhWem80WGZtN1JDMit5RlBIem1LTXVQbGtxc1NJY1pPeDBXaEVGR1NzUm9t?=
 =?utf-8?B?ZUtLMlpBYlcwUDRIbE80cmlUZ25sNXVKcjRZRHUxY05Qc0ZaTGNBTjY0T1Ni?=
 =?utf-8?B?anNWWFFJZkVNb1dhN0ZNcTd2eDJ2c1gwdEJsWUhoNTFqc1BXVXh6VWI2bmR4?=
 =?utf-8?B?QmNCNjA4VzMvTm82QWYxMFlianU2UXNGOVREbEYxU2dhdzNkV2xBQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33b17e6-207d-412e-d97c-08deb72dfc49
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:42:06.8471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfA0kjwG9+kU4V4/UexI0IymriO77XWgl+O7t+UYd6RSK7Ezkv+Keq+hXfvgCVNGz2FWMl5cp5/LaT7WIoOXzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207

On 08/05/26 01:03, Mario Limonciello wrote:
>
>
> On 5/7/26 13:11, Vijendar Mukunda wrote:
>> Add ACP7.x PM callbacks and hook up system sleep and runtime PM ops for
>> the PCI driver.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   sound/soc/amd/acp7x/acp7x-common.c | 43 ++++++++++++++++++++++++++++++
>>   sound/soc/amd/acp7x/acp7x.h        |  3 +++
>>   sound/soc/amd/acp7x/pci-acp7x.c    | 31 +++++++++++++++++++++
>>   3 files changed, 77 insertions(+)
>>
>> diff --git a/sound/soc/amd/acp7x/acp7x-common.c
>> b/sound/soc/amd/acp7x/acp7x-common.c
>> index 68f9b47766c4..df94864a1693 100644
>> --- a/sound/soc/amd/acp7x/acp7x-common.c
>> +++ b/sound/soc/amd/acp7x/acp7x-common.c
>> @@ -75,8 +75,51 @@ static int acp7x_deinit(void __iomem *acp_base, struct
>> device *dev)
>>       return 0;
>>   }
>>   +static int __maybe_unused snd_acp7x_suspend(struct device *dev)
>> +{
>> +    struct acp7x_dev_data *adata;
>> +    int ret;
>> +
>> +    adata = dev_get_drvdata(dev);
>> +    ret = acp_hw_deinit(adata, dev);
>> +    if (ret)
>> +        dev_err(dev, "ACP de-init failed\n");
>> +    return ret;
>> +}
>> +
>> +static int __maybe_unused snd_acp7x_runtime_resume(struct device *dev)
>> +{
>> +    struct acp7x_dev_data *adata;
>> +    int ret;
>> +
>> +    adata = dev_get_drvdata(dev);
>> +    ret = acp_hw_init(adata, dev);
>> +    if (ret) {
>> +        dev_err(dev, "ACP init failed\n");
>> +        return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int __maybe_unused snd_acp7x_resume(struct device *dev)
>> +{
>> +    struct acp7x_dev_data *adata;
>> +    int ret;
>> +
>> +    adata = dev_get_drvdata(dev);
>> +    ret = acp_hw_init(adata, dev);
>> +    if (ret)
>> +        dev_err(dev, "ACP init failed\n");
>> +
>> +    return ret;
>> +}
>
> Both of snd_acp7x_runtime_resume and snd_acp7x_resume look identical. Will
> there be later code (when machine driver and IO enablement come) that makes
> them different? 

Yes, when IO enablement code is updated, both the functions are going to be
different.
We need to keep it separately.

>
> If not; then I think you can drop snd_acp7x_runtime_resume().
>
> If so; this makes sense to keep separately.
>
>> +
>>   void acp7x_hw_init_ops(struct acp_hw_ops *hw_ops)
>>   {
>>       hw_ops->acp_init = acp7x_init;
>>       hw_ops->acp_deinit = acp7x_deinit;
>> +    hw_ops->acp_suspend = snd_acp7x_suspend;
>> +    hw_ops->acp_resume = snd_acp7x_resume;
>> +    hw_ops->acp_suspend_runtime = snd_acp7x_suspend;
>> +    hw_ops->acp_resume_runtime = snd_acp7x_runtime_resume;
>>   }
>> diff --git a/sound/soc/amd/acp7x/acp7x.h b/sound/soc/amd/acp7x/acp7x.h
>> index d3a57705385a..ddb5eabf6828 100644
>> --- a/sound/soc/amd/acp7x/acp7x.h
>> +++ b/sound/soc/amd/acp7x/acp7x.h
>> @@ -33,6 +33,9 @@
>>   #define ACP7X_PGFSM_CNTL_POWER_ON_MASK        7
>>   #define ACP7X_PGFSM_STATUS_MASK            0x3F
>>   +/* time in ms for runtime suspend delay */
>> +#define ACP_SUSPEND_DELAY_MS            2000
>> +
>>   struct acp_hw_ops {
>>       int (*acp_init)(void __iomem *acp_base, struct device *dev);
>>       int (*acp_deinit)(void __iomem *acp_base, struct device *dev);
>> diff --git a/sound/soc/amd/acp7x/pci-acp7x.c b/sound/soc/amd/acp7x/pci-acp7x.c
>> index 237eb06e3cad..d29a149cf175 100644
>> --- a/sound/soc/amd/acp7x/pci-acp7x.c
>> +++ b/sound/soc/amd/acp7x/pci-acp7x.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/io.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>>   @@ -92,6 +93,11 @@ static int snd_acp7x_probe(struct pci_dev *pci,
>>       ret = acp_hw_init(adata, &pci->dev);
>>       if (ret)
>>           goto release_regions;
>> +
>> +    pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
>> +    pm_runtime_use_autosuspend(&pci->dev);
>> +    pm_runtime_put_noidle(&pci->dev);
>> +    pm_runtime_allow(&pci->dev);
>>       return 0;
>>     release_regions:
>> @@ -102,6 +108,26 @@ static int snd_acp7x_probe(struct pci_dev *pci,
>>       return ret;
>>   }
>>   +static int __maybe_unused snd_acp_suspend(struct device *dev)
>> +{
>> +    return acp_hw_suspend(dev);
>> +}
>> +
>> +static int __maybe_unused snd_acp_runtime_resume(struct device *dev)
>> +{
>> +    return acp_hw_runtime_resume(dev);
>> +}
>> +
>> +static int __maybe_unused snd_acp_resume(struct device *dev)
>> +{
>> +    return acp_hw_resume(dev);
>> +}
>> +
>> +static const struct dev_pm_ops acp7x_pm_ops = {
>> +    SET_RUNTIME_PM_OPS(snd_acp_suspend, snd_acp_runtime_resume, NULL)
>> +    SET_SYSTEM_SLEEP_PM_OPS(snd_acp_suspend, snd_acp_resume)
>> +};
>> +
>>   static void snd_acp7x_remove(struct pci_dev *pci)
>>   {
>>       struct acp7x_dev_data *adata;
>> @@ -111,6 +137,8 @@ static void snd_acp7x_remove(struct pci_dev *pci)
>>       ret = acp_hw_deinit(adata, &pci->dev);
>>       if (ret)
>>           dev_err(&pci->dev, "ACP de-init failed\n");
>> +    pm_runtime_forbid(&pci->dev);
>> +    pm_runtime_get_noresume(&pci->dev);
>>       pci_release_regions(pci);
>>       pci_disable_device(pci);
>>   }
>> @@ -128,6 +156,9 @@ static struct pci_driver acp7x_pci_driver  = {
>>       .id_table = snd_acp7x_ids,
>>       .probe = snd_acp7x_probe,
>>       .remove = snd_acp7x_remove,
>> +    .driver = {
>> +        .pm = &acp7x_pm_ops,
>> +    }
>>   };
>>     module_pci_driver(acp7x_pci_driver);
>

