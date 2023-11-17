Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18D1C072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 11:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjKQLpm (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 06:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjKQLpk (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 06:45:40 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57349CE
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 03:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700221537; x=1731757537;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4+go0Zwh1am39rwtjcinWgnzhWryecKOVZQ8tUcwnjU=;
  b=bEYNiTbH3RQJudNXBJ1cDr4poafSJ8kYOs5RuQhkNLMWiyXXIqpE/hwP
   A/sFnXUB5AB6gik1ighIdXX04eIUb8SfT7tj5O6b+PuJYHXnUnXSemX0K
   Zb/o/a7TMjaBTNBwWMXZPT5h2Xw/JtmsINrG9+c4hNDrZdIZtKtpcBZq4
   zLqAbO1jiSByr3YXOtlU0NpVQcuzb2tyeEtZpxLrq7YEe+ymzRH9jA/0M
   SJiC1+rEdRlEjnCQ8UXdS1VFp7iivT335Dr56FpXaqg3MVPOUA6PcdmdS
   gwObbp7e1GsmwZDWv6IWiJvHp1x3UyelEILfbUvHu6qWOfzFpUrmRMdI9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="390138501"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="390138501"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 03:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="800474533"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="800474533"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2023 03:45:36 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 03:45:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 03:45:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 03:45:36 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 03:45:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHyu4ZdeP0sIuPMZl0Eu6f3EH67IRPQzFPiYa5mgm/7qyqCyjESBXpKOaLqCRapNQ/JLcs2QXUENhO6O7byGxFrB1/ltfd55Xgdn4g4zWw+qgyg5CANfQILNyDyUdgS27TUPv0N0t3g2JrvacPucbyrlQ2xafcA3Ac00TsblLXBHwH/WwMtunpIJHkDg5GmSjOzv/kaWM6MHm4kF3xG82Ib5iNk+G0ePb9qfs/bR6jSfFLJJA2FqjmOuGTOgmSlleM3po57nCQaEMs5BqG4uDZ+Jz71x/AdXzUAKtEfVamI/JpqDfE9YpuyObPeqn2I50+rh/iF41uS9LTF4HKuEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpyHsAJUsjsr028jYJHvRX7WKqgfWmi7GejnOwPfDfc=;
 b=Cq4UIigMSmMGKocmdGyVd/a/GDFnExvT/AYi6i9KOkjcw29IRGKwBwHJT67gj9FUUDX0B9SyeHMfWwAsO655q4IGR5VQfWhzwHu5FBXp31ermhpqad1AaO9HeRVR4H6/uLUKFpTEyyfCOQogysRWcxbYfcjpTJOtbUc3W2ngCOz+MFfc0N+glmdNANlU6aicdbeAMVlkSXuHXtA76v+z/0FSbOExemshf8ckG2nk4PS0AZtDp4wAbhY6BC0OLLVgL12O509A3YA1qcS7hxX/urEuSly9qv2xTOQ9LnEMKNlt8K8lhDHPK3pDGBiTDawA1FuxqDei/u5bSaEv3SXiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 11:45:33 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::ecc0:2a4e:16c3:2019]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::ecc0:2a4e:16c3:2019%3]) with mapi id 15.20.6933.026; Fri, 17 Nov 2023
 11:45:33 +0000
Message-ID: <f1c256ba-8c9f-f140-c706-b4b2a717c61f@intel.com>
Date:   Fri, 17 Nov 2023 12:45:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 01/16] ALSA: pcm: Introduce MSBITS subformat interface
To:     Jaroslav Kysela <perex@perex.cz>, <broonie@kernel.org>,
        <tiwai@suse.com>
CC:     <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <amadeuszx.slawinski@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
 <20231116112255.1584795-2-cezary.rojewski@intel.com>
 <25101e2a-58d0-423e-9983-f5df5ba16466@perex.cz>
Content-Language: en-US
From:   Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <25101e2a-58d0-423e-9983-f5df5ba16466@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::6) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SN7PR11MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ae9f8a-bdb6-40db-5c95-08dbe762b509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: If3HMPt6s6n7wvMdVYJLVCnfp+FMFe4xVWCHmU3ES2Y0KDky6KL0+geexFHwjZUVupSUephgA0KKBaE0X7bVWaIXV0o4Wpwo7WNSlegvlrQXrDekRB8QjCT40ABVvZKWec59rlS2Jo4qbBx79vzoCqwcXtmUyxxYn3Z5sjjImWWompbsqKKWLpAl31SraQvRwVVbc2ax24LzU9xG+wsD+IABLAYMSiiCOTn5vslEcrg7KmmYRH9ESUYVPtpLbyxz0PpAUGJ3WDQuCUN1BhymvimFnPWv1yamN+7K3FREKcaZ/W0WcqRWC0ZB2MR7Ear3RXoimNA/fwMmOjxZU/zsdbGoLOYglVmY/Eefe5q3NwkJo3NWbwuxd4J8za43HJVh3/W351uzGgdDIM9PzyF0o2eKnDniNg9BrmTlkB1zSGWHirbPUv75XE97lYNJMI+OtC6Iwzj0sqxQjZ8gFz+ajxR5jZOE+FtTFOixXw6uPyWYovcHnkFYkEBIkCOjxjNopT60sgKyYGf+no534GwumjppYEADRfIz8Sl/hPjPrtJiZGjIfplc+CzoFfyTNOQ1GDk+eJmqsO1+/hwhX3Xw2Doyyn0JEpJnH1OouGDbLVKrxU1SAvayfIm4znrI+LHG8+J477WnGINXU5WuKuYWYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(41300700001)(44832011)(36756003)(4001150100001)(2906002)(5660300002)(86362001)(31696002)(2616005)(53546011)(26005)(6512007)(83380400001)(82960400001)(6666004)(6506007)(478600001)(6486002)(38100700002)(31686004)(316002)(4326008)(8676002)(8936002)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmo5Vld5bXU1U1NIb1E5djZRL3Juc3lTUGVEYWVpQjNkN1dMcU9uaHJ6U2tC?=
 =?utf-8?B?TkZVNEo4MGxFaGF0TWZad21sZHk2ZTExQ2NIN2JGU3UxbE05S3dBUkhLNzFl?=
 =?utf-8?B?eXZYWU5PRmpuVWNPUW52ZXFQOHBxWldJbkFpcEdjSFFwZTZWbzVFSzI3VWtU?=
 =?utf-8?B?enduQ3RLYWhDcG9wVlhNbTc3U280VmRqTkhDYS9vRG9UYVhDYUM0Y1ZOZWtM?=
 =?utf-8?B?cEFhZ2hGRWpQd1J6bzNvMlh0TjJOM2FVcU1aL2dHTllGMU5aME5rTVV4MlE1?=
 =?utf-8?B?a1dnU1RvK0Fkd2VWK3ZpQ3hiSkJUcU0waVMxTC9sYTY4eFhVTDd6Qi90ZFdj?=
 =?utf-8?B?Sm9CVDN0SjlpZEVlUEVLUzBaaFNiVGZuSXJHdm1OUnVKcjVlbFlOMXB3b0V3?=
 =?utf-8?B?RmgwYmMxQjMyaEdQNHlxVjM4NmV3VFZNYW8zUlE0eXhMV2szRTBKYXVxRk4v?=
 =?utf-8?B?ME5YaVFBRmJweXcwMVFWbVJsVzA3dU9relRsNXB5UVNyZGRVRVpXUm1LVDc2?=
 =?utf-8?B?RDRlNFRsSm5BOEQrOG1OYmxxRngvc0MvL0RzR3Q1MkcydkVsWm00N1JXeXJk?=
 =?utf-8?B?VmNVM2lObWtGTm16ZWpHSXpqdHgwOEFxKzBtSXYxb1ErWHNjL2tOUVl2VFlq?=
 =?utf-8?B?TktBU1lmZ2FEbG5CUXprN0RVeVNTZkcyUElTMS95TlpxVkd6ZUNzTXBEeml6?=
 =?utf-8?B?bk5GbTgyNjg4VEMvRkEzRUdnRUFrZ0FKRGZmZ1dNVmp5WnBYQ2szeC9Fc3pi?=
 =?utf-8?B?MGhKUityRnpkU1lGdHNCYjlzd0tIaGJSU0QyNmEvNWJIcktKRW5NWnRzaWdh?=
 =?utf-8?B?UGpFeXpMWWdmOVBsdnNXWGg2dENBQUtpWHEzY0pKdVVBMWFhZW9naGxiMXhu?=
 =?utf-8?B?UURidS93d09valdlZ1BxK1hwYUtmZ0pPb25Xdk1rQVovZHJUNitMT2tLSCto?=
 =?utf-8?B?RHdUWDJJRkorWUs1NjVDSm12ZXNqY1hsRnk1ZGh6NkpTU1lickJWTU5tVG0y?=
 =?utf-8?B?ZmRZR2JzUjJOQWRFOTBUUkhaU2ZjUGZZWEtURlZwbUZMSEtWNWJlRHlkSjd6?=
 =?utf-8?B?QTlxNHpQYTZReVNyNnpscVNILytHWWphNVhlSFJqTDJwSlhpdy9oU1JTWWJl?=
 =?utf-8?B?UlBkY3k5TVNsS2E1c1lyN0pzQW9keFJ4QWpNUDhuSEp0MEsrNHJGdGQ0bys3?=
 =?utf-8?B?dGIvZWdNdkNHKy8xV0RHWmY1cmpKQkV0VisrTUxaK0t3NDhYRjVPREdLRFNq?=
 =?utf-8?B?SksrUVRUK09vN0U0K3ErT2xWRWt5NVUxdzVmYXVhakhlMXhMNzIyK1BiUzU4?=
 =?utf-8?B?MXAzaTFqRVpHbVpjbFI0Y2Q1V2ZhUDNGWmcremJuNDlOY1A1cWNRTGtTdmMw?=
 =?utf-8?B?NWlmSWdrbDBPZkY4ZytxbzhaaW1WNzUzVzlIZ1lXREhGWmp0UDV6RXVtVWsw?=
 =?utf-8?B?ZytlK0gvZ3p5eDVRcFFBcVVubWVOTVBOSUE4TG0xcDFJOWpNSUwzS0dhQkRq?=
 =?utf-8?B?T2tVQ1orZDhTYTFtdGdZWkNaQTZIMGI4RmJVeTk2WTlVZy9tS3BSWjJLQlBz?=
 =?utf-8?B?VllYT1dIb0E1eHI5NjdpUWZJSFhnY2tjZGQ5TE40RE5tdzYxZUhLQ1dhcCtz?=
 =?utf-8?B?Q0dadFl0bm93MGhXOUQrRVk3QWI3Q3diTXRaOE9oN0lhbHEzeXhaS21ZVWZn?=
 =?utf-8?B?dXZva01HZ3hOejV3UGFJaHlGYytKZmVUdFkxT1NrU24vUlQ1MWQ3V0lXNjNv?=
 =?utf-8?B?Qm0vYnJtNmFJbmJIVUJSWGtGbXdnVEFzS2dYeEI1NjZoQ2tqdVVaeThjenEw?=
 =?utf-8?B?aWhtSUdpZlZHdjNCK2hmbUxLWUl4OG5VYk9aN0R6UjNTYmpLc3c1QkF5OGdu?=
 =?utf-8?B?L0M2WDRoeWVHWnhEZXpJakw4cDVOMC9rN1RiczF0cnB4Q1RDSG9aYVJIbDZE?=
 =?utf-8?B?YzJhNXpSNzM4MnhjaENuZGdZUnhkc3h1STZTQ210Nm5PWk5yTnc5KytHTHJY?=
 =?utf-8?B?YUNpdUlJOThDYlBkV3N3KzgrZXJ1Rmt0MENvbHNVN2gyOVpFOGlHUitJY1VV?=
 =?utf-8?B?NjhCM1MwaVpmK3M1WkNRclpZZzd2cHZ1amU5aVU2clVqNUxuWnk5Z2gwdzRi?=
 =?utf-8?B?Q3lnUTd2dE5OMGdpcGdxT0VQbTU0UHEyTzlXeXIvak1rdHdoQXBna3NPMDNQ?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ae9f8a-bdb6-40db-5c95-08dbe762b509
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 11:45:33.5640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHTs2vClgbdN7D52xylKbu/GFF+yX+6CYAU5zwJWw4+/zHZMn/LJu2gRt3j33dNtJ2F1upfopKZ+e2b4w+mkYPL9u71ehXs2cMpt8yApZtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On 2023-11-16 4:10 PM, Jaroslav Kysela wrote:
> On 16. 11. 23 12:22, Cezary Rojewski wrote:
>> From: Jaroslav Kysela <perex@perex.cz>
>>
>> Improve granularity of format selection for S32/U32 formats by adding
>> constants representing 20, 24 and MAX most significant bit >
>> The MAX means the maximum number of significant bits which can
>> the physical format hold. For 32-bit formats, MAX is related
>> to 32 bits. For 8-bit formats, MAX is related to 8 bits etc.
>>
>> The drivers may use snd_pcm_hw_constraint_subformats with
>> a simple format -> subformats table.
> 
> I am afraid, the above sentence is no more correct and the current code 
> does not follow my original idea. It's a bit step back to the initial 
> code. But I admit that from the API POV, it's workable now (with the 
> added refine mechanism for one format).

I'll update the commit message, indeed no longer up-to date. Will also 
try to explain the thought process which is currently missing, as you 
noted below.

> As noted several times, this is not my preferred implementation (I would 
> keep only the constraint function which will be called by drivers on 
> demand in the ALSA PCM core code). The latest proposed simplification 
> may be applied in the ASoC core (store S32_LE subformat mask in 
> snd_soc_pcm_runtime and install this intersected constraint for FE PCM - 
> user space). Something like ASoC core does for the msbits constraint.
> 
> If nobody else thinks that it's a good direction, please, add a note to 
> the comment that this implementation (extend snd_pcm_hardware structure) 
> is a compromise for the ASoC code with details.

I'd like to avoid complicating ASoC runtime structures as storing 
hw_params is not among their current task list, at least not currently.

But I'm open for any improvements in the future.

>> +        if (f == SNDRV_PCM_FORMAT_S32_LE)
> 
> Missing mask check: (f == SNDRV_PCM_FORMAT_S32_LE && *subformats)
> 
> Otherwise the MSBITS_MAX won't be set for S32_LE by default.

Ack.

>> +            m.bits[0] |= *subformats;
> 
>                  Jaroslav
> 
