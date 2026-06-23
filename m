Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013017.outbound.protection.outlook.com [40.93.196.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F961F3B85;
	Tue, 23 Jun 2026 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225366; cv=fail; b=O0Bb3a5i6hSk5wd0WU23cvNiSz5OSVQuQDl2vTsckAdHnIDVBTafn+lb3myef2smK66fNmKXrGmVWzxo4FxqN8oh9SmrMInnWJd5/Aiwu+Odor5sS5Le6LjM8w5JVZWg1QP0sv3S9kfpSiI2dEf28xZRZf8YeQV+C8eAABIU7d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225366; c=relaxed/simple;
	bh=7sjjmq70Wp3DKrxxiyyireHtoqkDYJX1vrMQlSr3BXg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I0dhqNNXsPhkMq7eWVjkLzT6epIotrIZqab7jev8v3OfeP7p8GtijLJObc25LvB1gSrWTWMwWjpBaYO8wR3qQf45RsFpQ3NiAeV/IdcCLNzva5FMIBAYER5y4gVpxdskYg0pyb/MnLvWy96ufyJBJ+JgwQ6DwJjk8AwuEV61FYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vytzprxR; arc=fail smtp.client-ip=40.93.196.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vytzprxR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6UcxnslyKshcgxTVCEu2GNHXJ3R4nvlz4GvuzOOkAodZ5leGlcLttuQFRU3SPcK+HxbOpRqe5qL+gxXRhEwXvxgE1E/MegoURo49fC7bUtO7zO6P73yeb6HJ2hkitDwR+hLT8QWXpaXi9ZqEroxxeyEYrU861CYytAexkKxh4W3e36b8aftAGa45xr4dEE4XG62iMUK3XWUWX/E8F7ZF6ssZ9eIIMrzKeanYjgy+dqoCx/+mz0nAe7X3nbXLptCLVN9ZKfi2J+pwjeA3co2EqrVszdLASH/O4dt27np8pfKXUcqm7R9qecIFu7XZe0uR4OldJxGgKHwkxK7anUvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KX8UBh2Bsp0jFEpuJHGJV+Qb4ZKUjgX0OoIQudrI57s=;
 b=HcG/k9UZYugBVjEzSg9pvPPCKfPoYWW4YP/JD06SnOih0YXIqj92f/UFZmsTdlFZ2U571NXeHoJ5mzAAwtqSevpHuHvmOQquXk8X6XtBRhFQHYW5bYzSjAIo4/LE5yfiPddQpunlgeFPLylQxHgNwC3Zz3RopJRCrI2IPFHNOl1uRYV297M4S08zwHbDiDOzA2EaDK0IocoIUc6aFlFLA7lvfHC3aACtFg4GQchEzu/4TaTqsGGrSEQ6ca0YHkOWYVKqKMGXxGr2i9eVHSP6m+ixv9fbTj2GKicfUFC/o/nO4TVJSZ2CQCVB2jd7X7ecgzSz4oGb0x4OTVRZofJJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KX8UBh2Bsp0jFEpuJHGJV+Qb4ZKUjgX0OoIQudrI57s=;
 b=vytzprxR9/+15/n/daWF/zw4JD/UY5Qy/mC3IwZL/shbM+9Qc1jmOV1TsK3Qby7NhoVuuF9mIbLziBHGhofd6iye2bJW+Pu/IC3yTxJRoI3zTAhlY0r6NRGmmvvDjpsqtjoBZvx9lRR3ZU+gPiWcPZHl6qtRdJsZl7rjw851SZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS4PR12MB9610.namprd12.prod.outlook.com (2603:10b6:8:277::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Tue, 23 Jun 2026 14:36:01 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0139.011; Tue, 23 Jun 2026
 14:36:01 +0000
Message-ID: <fbaae15c-f3f7-4125-96aa-41b6bb4f174b@amd.com>
Date: Tue, 23 Jun 2026 20:05:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] soundwire: amd: report clock-stop exit failures
Content-Language: en-US
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mastan Katragadda <Mastan.Katragadda@amd.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>
References: <20260623140315.78919-1-pengpeng@iscas.ac.cn>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260623140315.78919-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::10) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS4PR12MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: ba47d67e-e9f9-493c-b41b-08ded134bf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	TeMWWi16oy2Puu5HLbbNfI5bcPxp4026rpVo7dzGBG/vWg+9KNfBeksHTTFMNu21HKGBhK/VIO2U37BOLQfu3gaYbTJtj8JctTNkpPgYAv5wGs7thRVPSKGT6YuWXNrboN1O6Y84CpguWdlU2xEpep6orrkwrDtqo5LTdCLBZQE33Gkv+8ygL5Ih8nRDYg9yrTw3cnDWVeX3qfx0owLTkERqy11LRA0Um+sGstep0jlVLjARcgwzSJswuR2WVP/dEWhUJtVbmqUQnLfWMZpOw6L7dCx+Avyf1QwXMoUwb+E1J7va3fOmHoW2j9GmJ2X7vTiwmEPjfVl+wDZht+Jjlxgeys7C/IMPNgwHylEEUti42DBft3zey15r7XIjF2tsHY9XMCFgd2Hvi6Nu/1XZRiNOvYICrPmV17PD1U73xkIWqxgusclqon70cJsVClaTB+jBhjaf63E1cPijVGjRSeATvTGTHoqT76vD8KI7s5ZoAkPLtLsTSGiTMJwB62pQYmzU8lNKuB07Idir1Dn4qaE234WopdOjnVdebOW4hma+/eSYLK2w7sFC2LNTz+PQhCtA/qEnc85hZIKjPov3JOwKtZIbNsxVW1rO3C4evWORAaiJfcB1uIeHa8WTw86u5Oy53ZAoVyUmKjd7BUg4mZbUgDPKlmk7qNZpBzfZqMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG93Qy9vRmFkUHcyZ21QQTBjYXBJNzUyQ1BSMVErQ05RUlV6RXhyVS9zQnIr?=
 =?utf-8?B?dkdsV3RWUHlPVHRzc1NLWGxLYXUrZzFXTHR2MGhTbE00ZFlJNmU0aUZGYXpW?=
 =?utf-8?B?YXFCelZZK0k3S2w1RGZqOUdhb0tDTG9PU0UvSytjZCtTTndXQUs4cjExSUhG?=
 =?utf-8?B?cnJzaVBpYzR6aFFNRUxzdXpzTHVFZHBUdGY2OFlZL212M0pDMG5yRXhLMm5S?=
 =?utf-8?B?Ry9IVlBwZE5hSFFPZkJwV01wL2QrdU4yRTN2OFVvTlhYSi9kd0lVY0F6UjlF?=
 =?utf-8?B?YjBkYVRvWHpwTXIzQnhtdWNmVjJPSGduT01VR2s3R3ZpUVFjTGhldHp4dFFC?=
 =?utf-8?B?NFVWOEUwVW9XMUcwOGNZc3NTK1JFVzZSdUhCcUFIQVpNd2ZYdkRPMjMxWFdB?=
 =?utf-8?B?NHdGeW5mVkp2K3c1S2JTZ3NNdGVnNVNmRjRNRlhoVW5KMm52V3BFU29vZzRR?=
 =?utf-8?B?WTBTQ3pHUWNDZFlVTDlsMk95RWd1UWNpNk4xbzM3ZmxOemM3b0J5Y1FlQXZ1?=
 =?utf-8?B?ZXV6UzkxaDhiU3VnNE5xNzRMNXdnTXRrMTNVZUpXdmNVN0RxYm05QkRNNzBn?=
 =?utf-8?B?Z1FpNmlqZmRMU3V0dEJsTmZXSk5xZ3VIcUk3bGlVY3JOemM2Zyt4REduRzQr?=
 =?utf-8?B?cTBQaytLTTJUWHhtNE9KMmwrVEVTNGI3K3BIaUl2cE5HSVh0eXZzZVRVdjM4?=
 =?utf-8?B?WmsxRklpSU9aYUo3dFhmNkdJdWJKVkpiVXBJeVp5aHBLdk1zZUZYbzg0NkZP?=
 =?utf-8?B?aHFwNHVvY1B0a1BSc3NESzBKdzV4QkxUTVp5dStEY29vY0x6RXB6L0tFa0Jx?=
 =?utf-8?B?YkZXTmZ2QmxZczB5cnUyemUxMkVnTk5GVzVkbC9US3Jua3N6aEtyd05ZbnFs?=
 =?utf-8?B?UGRGTUR0WDlkaXZiUUhEYjAwdXZLQkNvM0RKZStGOVhhZ0ZRTUhMYjFkSG40?=
 =?utf-8?B?SHJmK2gxTnEybVNVa2lkK2Q1bjVxWnM4RTRxalF1YkFyRk1ETkdENmlITmxp?=
 =?utf-8?B?SERBbHhoeVFYZlptYTJoUnBVZDFnczBid2ZxcEFYS2ZraHhzVzY4aW1xRWw0?=
 =?utf-8?B?bS9mb1IxQjRVOTNIUENmM3hzZy9UbjRZNTRUUC9ydUplQjI3R08zODdOZ1Ew?=
 =?utf-8?B?YjZvOTBlOVZIcm4rL0FuN2hwS0c4U0FQQ2R1RlRUSWRoNEdXMUtZME5RZkhi?=
 =?utf-8?B?cTJJTzBOQWVSdTFxdmNaWTdleTY2akdTVHhhclJZSzRGRWVMRE5FY2t0M2Zy?=
 =?utf-8?B?ZmQvYmVnL21BRzJPQVlNREtqUUw4Q1BzY0M3MUxWb1ZNWTRSV011WjBqdkR1?=
 =?utf-8?B?UVF0SnZnTitMbEI1SFVFNU1rNFlidVNuSnFxWmVYYVFNdE9lbW4vMjFsUTlq?=
 =?utf-8?B?QzRFQVlwWFp3WUl2NFpqcHRFOU92bEE1TXZ6c2orZEV2VTF6VWxLODVkT2tD?=
 =?utf-8?B?TVhRWVQ4UEpIVWJUUlRpMGtBUUdyaDhWeEg4c25RSE9OU2p4Tm5QV3BlR0pP?=
 =?utf-8?B?WFdNT1hGWnM2SnlxWkppajN2Q3dRUWVhTEJnUjc4QVhRLzA4clFRMWxsSFh2?=
 =?utf-8?B?VTVmWmVacU9WK2dmL2FoNjNhc1l2cEJ5T2RUL0tub0Uvbm10ZXRZYzU5RWE0?=
 =?utf-8?B?N2ZzM0JOV3NqaFRpd0VJZHAzbm5xR1JieUNYODFwS1ovSml3TXdTaEsxeFp1?=
 =?utf-8?B?TkFWR1p6NGd2aVc1a0h4LzJXNG8xMW9mT01mNS9BUytNU1NOUjBjTWp3Rlhx?=
 =?utf-8?B?ZVVRSHlLZ0NQdjVsc254MUV3QUNwL0srV0I0SFJ3Z2NwdU1STDVYSGNySTBF?=
 =?utf-8?B?ZW5SNmdwMDI2ZmlNbkVXR0E1T1ZuMUVQbC9nREZFWWhtS3dnc3IzTFd2SVNB?=
 =?utf-8?B?cHVoT0RTUGpNVTVSRGh4KytqR2xXWG1paGxWcEYzTlh2ZXRtaGZWT2NoRVE0?=
 =?utf-8?B?TmM2UzFZRUZjR2RvelltZzNWMTNPVmZyQU1CZlEzUVBzRzBLSkt1Vnh0eHAv?=
 =?utf-8?B?Y2duL25Mem5QK3FGRERpaFhoMUtEV0kvaXg2Z2N5S3EwOXNwN1BpQnJnalFl?=
 =?utf-8?B?aGJxNWxPaktuTVo4OUFmLy9hRFhhU05NazZyWWREMzBZTWJXZldEc2FJeE8r?=
 =?utf-8?B?VFk4bXNvNlFYd1o5SnpqVnEwTTVxV3dhcFViZUNKb0dEdGRLN1FpMExBWUlm?=
 =?utf-8?B?WmFBTGRxVXFNTlZwWFNFQ2hHWktGWFB2aUpoSmxrU3hIclNhRHVWdVJDc2J6?=
 =?utf-8?B?S1pteFZCZDZaY3hyNW91Qk4xMXl5R3QzaE8za2wrczVBeDcyWEk1cjZMYU9a?=
 =?utf-8?B?ZTN5OFdrNHM5RW1ybXN0ODVUWDIwaktEamxKR2pEMG9oRGZ5andTUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba47d67e-e9f9-493c-b41b-08ded134bf05
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:36:01.0827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcpHLC7m2zeHNHE6yfqUYh3rCZZ2V4iZwzrAqZU8yEcX7Ve6THR5NLCHov84d+4T5dp7o2M4X+RUNz9pEfTpfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9610

On 23/06/26 19:33, Pengpeng Hou wrote:
> [You don't often get email from pengpeng@iscas.ac.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> amd_sdw_clock_stop_exit() requests SoundWire clock-stop exit and waits
> for AMD_SDW_CLK_RESUME_DONE, but timeout handling only leaves
> clk_stopped set and returns 0. It also logs sdw_bus_exit_clk_stop()
> failures without propagating them.
>
> Return the hardware wait error and the bus clock-stop-exit error so
> runtime resume does not report success while the manager remains in
> clock-stop state.
>
> This is sent as RFC because clock-stop exit is part of AMD SoundWire
> runtime/system PM recovery and the expected timeout policy needs
> maintainer confirmation before changing the resume return value.
>
> Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/soundwire/amd_manager.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index a3316efdf..7d82fad0d 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1206,18 +1206,20 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
>                 ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
>                                          (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
>                                          AMD_SDW_TIMEOUT);
> -               if (val & AMD_SDW_CLK_RESUME_DONE) {
> -                       writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
> -                       ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
> -                       if (ret < 0)
> -                               dev_err(amd_manager->dev, "bus failed to exit clock stop %d\n",
> -                                       ret);
> -                       amd_manager->clk_stopped = false;
> +               if (ret) {
> +                       dev_err(amd_manager->dev, "SDW%x clock stop exit failed\n",
> +                               amd_manager->instance);
> +                       return ret;
>                 }
> -       }
> -       if (amd_manager->clk_stopped) {
> -               dev_err(amd_manager->dev, "SDW%x clock stop exit failed\n", amd_manager->instance);
> -               return 0;
> +
> +               writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
> +               ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
> +               if (ret < 0) {
> +                       dev_err(amd_manager->dev, "bus failed to exit clock stop %d\n",
> +                               ret);
> +                       return ret;
> +               }
> +               amd_manager->clk_stopped = false;

Thanks for the RFC.

The patch correctly points out two real problems in the helper today:

A CLK_RESUME_DONE timeout is logged, but the function still returns success.
clk_stopped can be cleared even when sdw_bus_exit_clk_stop() fails.
That said, on these platforms, returning 0 after a clock-stop-exit
failure was deliberate. The intent was to avoid failing manager PM
callbacks when ACP_SW_CLK_RESUME_CTRL is slow to report AMD_SDW_CLK_RESUME_DONE,
which we have seen during ACP6.3/7.x bring-up.
Because amd_resume_runtime() already propagates errors from
clock_stop_exit(), changing this helper to return -ETIMEDOUT would cause
runtime and system resume to fail on these variants, instead of
continuing with the rest of the resume sequence.

Earlier, Bossart suggested to try recovering the bus in case of failures
instead of propagating the errors to the PM framework.
This was marked as ToDo.

If we want better visibility without changing PM semantics,
improved logging on timeout while keeping return 0 may be enough.
One related note: under AMD_SDW_POWER_OFF_MODE, amd_resume_runtime()
has another CLK_RESUME_CTRL poll with the same timeout-handling pattern.

-
Vijendar



>         }
>         dev_dbg(amd_manager->dev, "SDW%x clock stop exit successful\n", amd_manager->instance);
>         return 0;
> --
> 2.50.1 (Apple Git-155)
>

