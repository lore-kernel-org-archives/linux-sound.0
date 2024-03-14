Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4B56127
	for <linux-sound@vger.kernel.org>; Thu, 14 Mar 2024 05:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710393280; cv=fail; b=jjl9JI4S3htbru0CYnwn8xLxmlq6ket93VTmku89AGQWtRR2EP2+CfZZh/jtKsrflQCEuccbkN6cvbBNCDr9Vz8fNwBPLDHDFPvPUwPvWKE15vGfS8dnov6X9t/oOBZhFEKFsbfJmPCAFRJ1vaaB9FJ23sN8d1tiOT2tGi1MC4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710393280; c=relaxed/simple;
	bh=BRx3ot1IKfW+v6z2VaYLILOjPxwz6AbaxdNLhulsibo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f80H9MRV5e+dRE0O4tsQl3jhqEzKiSDQ2IsB+84BExCRxU9oTF8ZDytrdRY/5E4zGNJhvx/UawFyF6kgjWFHjyY4PMd37bt9m+CUwG0+KG4UNu6v7QK1t2dTCirF2/88j/EL6ODoMuCsi9PBnmyxJzZfOxyBKkablJb0mRqPhOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m1x9j44E; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m1x9j44E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmxY8dOD2CNexxb3j/hz97VUnbDcGHEdZsKUSZWU6tixysjqUj8G/PWGivww4L3KN476z6w72hJN2UBPiMXPSRPMDZICuyrRggsrLdsuCUj82H1dndPQIPxOggJaCC4rW6IGVVfKR0dpLjif4e0tk8+HhOXjyPnK9xpPOKyZMDXBcknvvJ4NwabKVzXvnYBjknoB1oLZUInBYpmKMVd1qHkzrp92GtHxUHuPZtNTxhbsC2G1Ujdlu0x4rDa5BjwkTAYyEyp66Xw9g16B+MxgbALFKW7aRZDnKS7bnD4Pusl2tvweQuo3AZnv78SaKYo9lhoXuzSsyW6j1jbYN4EIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqYZ9k6OTMNYfbhatEKU6u5oJToeGFZ/vNU+m43dAsA=;
 b=myL197KuYE6zwGtt9Cj3HVYcTKHmRA6Y26Z5TbcArLkptfdpVs+bMVbL8Va4iAixo7titioRKXqS1twcmuzQDzQjgM6RL5vn3JhymO7N5j+Dl1J7bALLUieeZEgWRQ/AMIUOfSYP/5iKHZX8jKRqDcEn+kk+w5UjVRYXBN5DwrVp2XSJGuiCyv8jwy8Hj9QWKxhbuIZ7c+/tJ60sDU/QOB64GOAeWgIJzLIJe98sIjHR0EjnnrT1WXZe4AwIfoXrNwkJCGs7c896C4Hu5EVM5HyC+a3TpyqdZpcHcxEzy0Y2aJETMh1EetPIK91UHg8JEKhqwiVxZhDM23hJxd37pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqYZ9k6OTMNYfbhatEKU6u5oJToeGFZ/vNU+m43dAsA=;
 b=m1x9j44E/dWLyKZmupGqOmY6pQra4kwCEDAfx8mgG5yJbgxpeLsRbOrfokwYqRUhtAjjwyPhwEw0NZF5DE/3dNgQdJMNzPsWKVprridbjyj0FkKSahVftnjEdSfvoRA+aC4CW8+ab2F3fiZfbEWqz8+dpJAYUdrHoN/dKiqQqLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 05:14:35 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 05:14:34 +0000
Message-ID: <2768b0a2-d228-4d26-90d2-b4f6d83cfb5d@amd.com>
Date: Thu, 14 Mar 2024 10:44:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] ASoC: amd: yc: Revert "Fix non-functional mic on
 Lenovo 21J2" and "add new YC platform variant (0x63) support"
Content-Language: en-US
To: Jiawei Wang <me@jwang.link>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, sashal@kernel.org,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <a127404b-a071-4917-8ddb-d7371c721827@sirena.org.uk>
 <20240313015853.3573242-1-me@jwang.link>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20240313015853.3573242-1-me@jwang.link>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::6) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: b39e246b-5277-4ba1-363e-08dc43e5a34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tuIKvfuIiDy81WmGc+kuQTfd3MXaB953VJ1LZFw6+NUuNgEJEI92HLZHCJOzGTiXizOmQeTJIJ7Jvd3rdIajpO2Rfjxvm2NIIMeeB3zYxdIW6pJNXfMPuQP1BlmfhC0iDYNv1mlV7LulKB0brTYPY8Ggs426oP4yBM6iiEryzFr7ADrO/B01agVXFjBKiCyWtIHqjfP+rl2skcgHdorYwsR45i91LTYz+KhSBAAOVwgnGyojMiMgZeEf9szwegh/Qz5WDsIkNLXpyFTZ/F1fzUoLkqRxTXJdSD4mTMfPjZ9Q+eSCtN/yrqoOyHJMF3GdGqipPan1pfOJKxRwmZPxEFlaevzuvqeydcZZU+ccO7VlPFfLCFqSqJ4D9VKXcZGTVG6Piwb5cekXnrf2s3DxpGPFNmnKZhFzPqkVN2EKsx9DMSG0DP2gAHwCrFbAlVDl/q4w8IFC+1s51U8OuT9xEV7ZcFNhzStcJso9O3elF/3zoIcr0aIH/YGDCgPO3Hxycthj1rivwSLuQekhni53Sl99IOC5sylVP3Okt5ojvjn0wUxueLrasZnCfsP9CePWvzBV8/vrNywz+wqf72xQGYr2LGBpj0RKnBPoLd11KLNJUBHU5GXN1fxHMSo5LHIs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmZXZytEeHBQelowMUNlNXR1OHZOby9pL1h2M3VNQ0VvOEdoSGo0SExQcUs4?=
 =?utf-8?B?eEJhczRjd3RhMDBCVklDdm1rTEdJVGtDQkFsaFF1MjB1a2ZtZjBOekNPdmRT?=
 =?utf-8?B?VHFzMmhpL1VXbkNieGcxcUF2bWlVbkxQc0tTTlpVaEl5b3B2cW1IalJycW1V?=
 =?utf-8?B?WDEwTkNFbnBpdEN6N1hBUGtWUkdFZVRSN251VG5EaVJnYU9scFd0UlROYmQr?=
 =?utf-8?B?U1ltMVplQnBEdEFXSzJHdDBPNkRZaDA1NkJHVWIwVW53Mnk2U3FFNUNLdE9O?=
 =?utf-8?B?aXgycGMyaVovWjZranZsZ3dtaUJ2UXlQUGgwemVKaGthZnIwWE90aEZSREk0?=
 =?utf-8?B?WHNXNlRWR0ttazlnY1N2S081NzhPZWFuN3hkMmlVV3JSUEpZVFpTK0hQWnE3?=
 =?utf-8?B?MEtSMm1oWXhqbk9vYUlJVXNIYzJLUU95MTErdFR2VHB6Qld2ZG5aT0hhNGpj?=
 =?utf-8?B?ZlFpZ1BGVjh1c082UHlBRWhrdGpKeWpoRWdrWWVRMmo0a3VqR2J4VTBaWUFi?=
 =?utf-8?B?LzN5NlplRkgrT0lSaHFwVnVkTHB3SDVGTTloTTVvV3RUc2ZFRXBFOEZEeHQ5?=
 =?utf-8?B?V0lkMVVSMjY0NnM1cGNvL2REREdtWmpsT3owZjBialRTTlBselhPaXp2eHE4?=
 =?utf-8?B?Q1l6ZnFwVDlVWUpuNlE4SDJwU2E4d0VxcjZwYnRacnFKdGZQcjFocDBXM0RW?=
 =?utf-8?B?U1UrU0MwWERHa2pZK05UaSsyRVE4T1Z1TzliMUdWTXVmcUsvT0pBRnBreHBW?=
 =?utf-8?B?Ly9DeEl1OCtHZXFNd3h0bWlmNG9vV3BOdFMxdkRLTTd0SVBrMUxqUjJkM2xR?=
 =?utf-8?B?QnpqQ20rYm01Z1dzSFovMVZUM0UwTXJyY0JQVVlxL09IMUhtUDQ3dzF3Mmxz?=
 =?utf-8?B?MFRqRCtjNURXc1BsL1gxNTRqc1VScXduVTVKYXdxUlBYaDBHNGtlUi9kWjdz?=
 =?utf-8?B?aU9zQVdnSUpWSlJDU3VFVUlla1dsRWRrMHVIT1lLT3hUeWFweDBRWEhNOXho?=
 =?utf-8?B?dDIrQjdmQm9JSFB3bjlrdmJIS3hmUXVzMU41N1Flek91cHFHcTE5SGM1eW5I?=
 =?utf-8?B?OWdqNGVOd2dxY0h1cFRzREM1bmNTUUZwMDFqalhiNmVtRDRRQTJzaUFFOTFj?=
 =?utf-8?B?S25teVp5RVJLTW5RY0hlQWxuSkN1M2RPcUpNakp1aVRMME5EUkRMbE9zVmpN?=
 =?utf-8?B?NzVCbG45ZkZVU0F1a1pwWmJ4UURQNVRQMkRVNHIrUDY2M05KY0t5UklISWxz?=
 =?utf-8?B?ZThYVmxVYWdtS2NHU2lDQXQ0dFlycHE3dkJoZlpMeTRESjlzRDJkd25McWNl?=
 =?utf-8?B?ZWNoYldRakJLZHNTWUpRblEvRWFTSzhSWTFYcmQvWlJxMkRWSFVvdVMxb2FI?=
 =?utf-8?B?T3pmdjhVNlVZeEpTY3V3R2Z1RmNnTWtkcjF4Ulc0L1g5S1VYWnRoQStFMEJM?=
 =?utf-8?B?Sk1UOHNIQlNHaVJVS1RmTFp2eHp2cmxqTWdoZ0h5b3RkSjljZTVVZ2srZy9B?=
 =?utf-8?B?OS9OcHBIN1dsVW9XSFRDZ1JRN1VSU09vMUxTUFVOK1FGblJpclF1Q3liOTRn?=
 =?utf-8?B?Y3N2bWFncXBYWEJuTnZ3bXBobm1DNzBDMkExRUN6MnMwWVU1eHQ0SjRtUS9m?=
 =?utf-8?B?bzhiVlRCRnc5Mlc1VysxUVk4WTFLWitrVnBtUURUN3BCVjZlaitTU2p1TmlJ?=
 =?utf-8?B?MGpsS3JGVllRWDFIL0Z5N0tZNE1NZVozdG1XdllPeVljdWkyVmtMUjV6TSsv?=
 =?utf-8?B?WTZCMjdvQzNJK1Zyb0VkYVpYTnFHcmpxK2dwbjh4UVBMamJ5TlhibzI2OGpC?=
 =?utf-8?B?ZFhpazgvVTg3RDlmazd6Sk5YM290eTZ6WVdGcVVPTlJ3UUtkUk16MGxtQ2th?=
 =?utf-8?B?Z2VHZXBzMXpGWmJYbmlHejJKMmJITGVnMngxaHcvQXNEREpHTUpVUXJ1dmFi?=
 =?utf-8?B?cUFyZWNObVpJZ3Vrb2o5SWNZOWdGb3VuLzRFRWhtdEdoT1hVK3p6TUlEZlR2?=
 =?utf-8?B?WXdrcVlVdzdjcVdiblVQdGJXZXlCdXZwNVBEMEFRUCtXQnNIZ3A4SW5hNEN5?=
 =?utf-8?B?UUpFVlkyUWdBR2huUUl3Z3Vpc00ybVAzUGMzbTRwdzFhS2ZnNWY0L0FRYnM2?=
 =?utf-8?Q?OWLIZdr91cIeiOHZcvCLG/FA9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39e246b-5277-4ba1-363e-08dc43e5a34d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 05:14:34.7157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVvOkr2gfoawo+cquAc/xitdgQ6KJt3uTI8byyqC3JIX+YFBfeYCD9xaincXhUZ19hZg/wWsBO8+ryicTRAA/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255

On 13/03/24 07:28, Jiawei Wang wrote:
> I would like to revert two of my previous commits after
> realizing they incorrectly enabled the Yellow Carp
> (YC) driver for Pink Sardine (PS) platforms.
>
> The first commit was reverted because it added a quirk entry
> that incorrectly enabled the YC driver for the Lenovo 21J2
> laptop, which is a PS platform.
>
> The second commit was reverted because it incorrectly enabled
> the YC driver for PS platforms.
>
> Thanks to Mukunda Vijendar [1] for pointing this out.
>
> Link: https://lore.kernel.org/linux-sound/023092e1-689c-4b00-b93f-4092c3724fb6@amd.com/ [1]
>
> v3 -> v2:
> - No changes to content.
> - Patches re-prepared using the broonie/sound.git tree's for-next branch.
> v2 -> v1:
> - No changes to content. Subject lines and commit messages were revised.
>
> On March 13, 2024 at 12:44 AM, Mark Brown wrote:
>> This still doesn't apply against my for-6.9 branch.
> I've updated the patch using your "for-next" tree.
>
> However, it can't be applied to the "for-6.9" branch,
> because the commits to be reverted are not present in "for-6.9".
> Below are their hashes:
> ed00a69  ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2
> 316a784  ASoC: amd: yc: add new YC platform variant (0x63) support
>
> On March 13, 2024 at 12:50 AM, Mukunda,Vijendar wrote:
>> You can prepare patch by cloning below git tree for-next branch.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
>>
>> while sending patches, please use --cc-cmd=./scripts/get_maintainer.pl along
>> with cc list.
> Thank you for your guidance. I have updated the patch using
> the "for-next" tree as suggested. Additionally, I've 
> incorporated the cc-cmd as per your instructions.

Hi Mark,

Could you please apply this patch series? Without these changes, functionality
is broken for Pink Sardine (PS) platform.

>
> Jiawei Wang (2):
>   ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
>   ASoC: amd: yc: Revert "add new YC platform variant (0x63) support"
>
>  sound/soc/amd/yc/acp6x-mach.c | 7 -------
>  sound/soc/amd/yc/pci-acp6x.c  | 1 -
>  2 files changed, 8 deletions(-)
>

