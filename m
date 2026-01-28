Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA94221F1C;
	Wed, 28 Jan 2026 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589396; cv=fail; b=VJ6kk2Vjc8hC4OzYdCrWLOILllYyrcPySjbCvSVa1Uu4/gqJkUcJ5hYSgPeDyYFRvPrz9XogbVEnVPfwFEDzTFqKpaGWdsv/cTp0ZyFteQHcbp9e0zEY8cXZtS/kuzXp2IXGdB0Mc9G2/bHY4OzE1Hc2GL8Q+LoAdUeyS+l9WUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589396; c=relaxed/simple;
	bh=EDJp0ywMkXoDmBp68Po7Ojp1mqcaGIFmSYte1fnQJYg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aNjt34JcGAY1LkrSbx9PNk7SQHIuw+5YimV84RJd5J8sMNwV2Fh583oXyLk+7joxkqtzbjn/6C8D9gugSlaHKeEP+qZvZcVup2Fo8/KV1oaitk/KgchvGoV85hYO8kn6h531VhFyENX+pgWsLLgv8l70A+9IhYmWM7rAfogV4g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UPzwKt19; arc=fail smtp.client-ip=52.101.52.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UPzwKt19"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE05As/44vGYYyQpi09NA7nuCwU9OmFl34RCJAwwV5MXuNqs5LGBaYIexrTN/ARm9Xh+hn5vlvLZUWZDV9F9u4pAX19AwyOgQ/aUa9lkJpmwQzsMho2lVAcaQC8iYBtGvRSoOtfqt7tM8xhWqVmaYinlItTiBoMA3QmdtVEuKVfN+8DUXeKPt/IRe8DAxBlKWqYAphQfg5oC1jN4UFjYCj1ZFGnty9ChALiPS1idoqc7MeGnZ8QPnJL3fQPAb4r5pKOUMFFkceEH/I/KJajNvuxM6OAooSoSYr/+O3GEpzTmamairh7o+5P89SRt2dJZBf+ibd9ETyoUcGubQTCOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgHYv/hw5oOXOA0PYjexK51RCiWIpj5gKhhtDP699/M=;
 b=ujy3bKDT2vmFZ/VMptvl/HQVL2Xy9FmWqKKKQNwqznhGWlTMluqGQ+KfJHhC7pvAAdgh2oyQXvUBnR7ucDWuH/Yfm9BgELt11cLdnYx0qfKmAagbSGeTZMRkx2SPCIMXqb0fDl+Z5dBt/d1I8wfCISVumd8aCl9M7cjGf8tvazyi0XxSTcNQNss2/PBG9Zt8u7Rtgenkcmyz8OhGl+FHc3gZVOzeMbF86gsrcvyit/dVyeD8WeIXvIWyVGtP9ZtSo0kjuktVKJT7ItGg6jMJvYKLtCZGgF5Q2BaFvxbyVozZp/VVlpOwzM7M963H0byyTk4px7gC0nqO1Y75AmZ+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgHYv/hw5oOXOA0PYjexK51RCiWIpj5gKhhtDP699/M=;
 b=UPzwKt196dI/6dWANs1i5sbWQ8SrG4nx5zZN2PRyEGVEQ6+hJU99UKoibgXpsU/fi+LfG5GgdaXnSN3DhVWfCSGBv4HK2nQNpWpA9SBi+RQA64HUVxkyQKBlb92Iv4lMmFT3fSN+e9lS3WaigG01r5aBHXbeih/mhGIOthM1X+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.16; Wed, 28 Jan 2026 08:36:31 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 08:36:31 +0000
Message-ID: <e80cdb17-c656-49aa-bc33-2a4352291067@amd.com>
Date: Wed, 28 Jan 2026 14:06:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] soundwire: amd: add clock init control function
To: Vinod Koul <vkoul@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260123111233.3649153-1-Vijendar.Mukunda@amd.com>
 <20260123111233.3649153-2-Vijendar.Mukunda@amd.com> <aXnJbqm6NNETpnWZ@vaman>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <aXnJbqm6NNETpnWZ@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CYYPR12MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: aa31bb6c-fc46-4b86-9d09-08de5e48567b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXNlWitCMUVjZDBBSGFSMU9WL2lBbmJ1Zm50KzExR21RKzFaT3NWVEpzVnZM?=
 =?utf-8?B?bitMZ21tdFRvQllOSndhTTRPYytMOGhkY054NHBQVWFvc3Nscm81R0o0WXpY?=
 =?utf-8?B?NW1hNmY3WU1Yc1ltS2ZhUnN2S0NPVk9CQ3crNUl0MnE4QldpaGRHa3JjVVI0?=
 =?utf-8?B?cVNzR0lCQ1VWQ2NKczRpNW1pL0MvOHlSR2pFTytaR1VwdGlrMmtyd25saUJ6?=
 =?utf-8?B?ZGdOcmY0V1VlKzhJRGVsNGtoVHBaeGVrTUJPdTYwOHNjVWVTNC91d2JlMEU2?=
 =?utf-8?B?cFZjd1lJK21VQWVHWENrMUtDakM4QVRiL0VCL3I2ZXBrTThuTVk4ZjVVY3h5?=
 =?utf-8?B?Y0VUTDFMak9SbVZqVVZTRS9VNUxSRFdzMmlsMlVWaUkyZFduMUhqS2xwUEI0?=
 =?utf-8?B?RGZlNWNPR00zbTFvN3BrOE5vdEF1bGQ1QWpueWdPbGplWlorQWhuanhucDRV?=
 =?utf-8?B?QjBwZDFXZWhOQVlBVlVvN0ZvalV6YjBxeWl2MFpuUnVGK2JtQ2JPT2lrZkFF?=
 =?utf-8?B?U0pLOG1VVUQyNlorQTJ3dTh3dnhuYUszMS95SExWSmVCenpCY2NqdUhWcGhV?=
 =?utf-8?B?UWRLeUpHa0J2OGtiWUk2SlFTOCtXMllFS3JnWW9JMHpBWGxPN2F2UE1zTkJJ?=
 =?utf-8?B?b2RtejdHbG5rUWw1QXpQTUxIU3dRNkg2Rmx3TDdabkpnNzFScklDNjRLeG5a?=
 =?utf-8?B?SzlidHA0azRvaFlXdkx3VkZrSWNWS1M0eUVnWXc1M1F3VVBrUENyMFJuZjdl?=
 =?utf-8?B?T2pQZ0RyRERraWNSM1RPTXdVM1Y5ZkxUYkFjQnc2MzJCR1V0MFZrUDVrM2VK?=
 =?utf-8?B?dE5BSGRkblNtZmZrRjd5NHFGZnJuSkNTU2E1ZXFWOHFNSldyL0ZPRlB6RzNp?=
 =?utf-8?B?WE51RHpxVVhvTVNIWUVxZFZiVm52OWR2a0MxQkhNNWJtYmczS01DSmx5T1Jz?=
 =?utf-8?B?bUZRR0NpSTBxR1pCM2hHdGpIMCt2azlHd05FZEFyMUpCRzZqbW9KcVNBRGxp?=
 =?utf-8?B?VHFUZmZqbEkzaVArL2s5M1dhVDJNUW9kK2YvTmUwclFZTm0zaUpTZWgxQUZJ?=
 =?utf-8?B?OTdZRFlaSXhtdXNFQVQ5YitVMWpFcWlTVVBTU25ta2ZwY2FYMTRvRkZVeFhZ?=
 =?utf-8?B?bmpnaVp5VzFxTjBjUjRUc1Vmc3ZCejR5a3pzWW1mbmJvVWtSOVNyeDBheS9q?=
 =?utf-8?B?ZVF1VWcvSzluWk5saytBcm1jV21ncC8yTmwwNzh2SXhSTHZkeUxtMXVjVjh6?=
 =?utf-8?B?QWVXTDlWaTVBQklQc2FiQlMvc0I4OVpnTEJydFRZeHdrOGVhVHdaVGdkZmcx?=
 =?utf-8?B?OXdUZzhpaFZaYTJkeDNNTnBPdm5qWEZMZ0dlTkRCNlhvaU1IZzFxOU1veTcw?=
 =?utf-8?B?K0JlUm4vVVBJbUhZSzhrR2tyTktmTjN2aWw1enhZNHNyVUdyb2hwaWVvTlJk?=
 =?utf-8?B?WlNJV3p6Y0NkUm5aNjJMTnZuK0JCM3diZXhIcCtHTTBaY3UxdXdmUXNXVkpG?=
 =?utf-8?B?MTE5cUUyQXFIbE4ycEJiNUwzTTJqNDlidGlvNkUrR2lEaDgzMXc1OHVkUGV4?=
 =?utf-8?B?TkowaDdnMm9vVzd2VFJEVjllT2NGVW11N2RpQTNnYk9GbzhoaWc2ejdBd2Nn?=
 =?utf-8?B?eVl0OWhxaXp4YTBjM0xEdXVGdHNtUTk4SjI4MjZtcVBtL3BRSzl1czA5a0xS?=
 =?utf-8?B?RUV2NDBRc29ySUNiSDlsSDZxMm1NRFhEQkpsY1B1eksydWRDbHZQQThNNXFL?=
 =?utf-8?B?RWgzckd5UTI5QXM5OEFaejJXWlNuclpnRzJaVmFnUUZuUHlyN0JnTlVUQm9B?=
 =?utf-8?B?dm95aE11b0xneW5iMWFzeEZrWjdIL1hpaDZpbUlaZzg4Q1dVY1VsUmhZQUlz?=
 =?utf-8?B?dFdxK1JpYkp0M0MrZnBkWVNPenJkMHhwUVJrakJRV2lkNU02WGRhS002b0NX?=
 =?utf-8?B?S01HWjFpQ29zdmkwdzZJcUxlWVZxM1dTSGxIcXN0K1BzRzVNNzBuYWgzNTZJ?=
 =?utf-8?B?Um5FMEpOMEMvZW92VUxvWXFNL2NlMnYzZ0djQUUxbnV1TS9qL0hBNVpobi9C?=
 =?utf-8?B?RGtpSDVCNlAvTGxVK2Myc3RrUU1Tc09LMVlkUThVZ2FJcDEvRUJGeklZN21Y?=
 =?utf-8?Q?nIaE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTBVdGxoSU5ua2Z0NG5FaU9EOU9CTDdnd0FyRXg2ZjhwM1hXanI3dGtqc1NR?=
 =?utf-8?B?bC82eTVWTnBSNTdrdTdHMEFBYVVZOUV6cGszUVhpR3VIWWxwTDlCaTdsVnd1?=
 =?utf-8?B?dWFnU09QcmNmaENWK0RzT05PUGJxbXJFbGZxZ1h3dVkrejBoTmFVdkZHdzBQ?=
 =?utf-8?B?QzZ0bzJ1OVVKMjdDRDNkWSttZ05QUCtJdFdGS29rSTBka2xDd0N0S0N3ZmNr?=
 =?utf-8?B?UHBMTDFPazZwU2I0QjhUbVdnTWZ0elRjL2h5Um1sVVVucGJ3MmdURUNyQkJL?=
 =?utf-8?B?Rk5LL1ZHd1VCOWJkWjFBdmFubnBSV3g0S0daZE56NWZUS1pFcml5bDdSZjRV?=
 =?utf-8?B?OHFUL0pEbmRJVkpRYitkUlJlN29yS2hiUnVUN0UvNWlIZU9DZFUxbldiaXRU?=
 =?utf-8?B?cWdtdHZWOVdObllZcUkrNjBiNHN5dDVJckRqZlI0YmUxY1NoQmZoVFd1MWRm?=
 =?utf-8?B?b1lycDBQdXRPNG4wSEF4S1VVdmNIV3VlekJTaEZJWjdGanRjWjJ5dDdxT2gy?=
 =?utf-8?B?cS9WSlFKS2RaZm1XQVFJU0xKS0VndEhYRlhtNGIzbmk1NkNmL1lVUlFjajJn?=
 =?utf-8?B?b3ZpdDBOUnFGeU5Sd3g1L3ZLSVFXZmtEY1NDbTVTbmZMK3oyU2ZXSXJON0dT?=
 =?utf-8?B?dzZwUWRpMmFVUTdVR0IrcndWdGZST3ZyL0ZJQUV1dkUwZ3Q1cXJSSTBzQm5p?=
 =?utf-8?B?RzdROWVvZSt5NTc5QldCZ2NDcFo0VC9nM1ZHb25LRkNQbDdEU3d2NTBWajBW?=
 =?utf-8?B?c3lqckFoOTBjZEQ2TFliUWp0VndWaElscFVoeE41OW5UYWY2MUZHWmVEY3dq?=
 =?utf-8?B?bW9kS0tyVnJqazhQQlpYVkNia3hlb3Z2OEJVckFoblA5Wm1tTytRSThjalM0?=
 =?utf-8?B?WHdSK053ZmJPZ3EzUmRFVGNOZW5LaHJmWi9VZ2xzV2c4KzJhbWdOTWtnK2RE?=
 =?utf-8?B?L0NMeUl6U2RLU3VxaFloeUJtZm1vSDZ4QXFuV0dYVlpQWVg0Vkd5bHJhcTNB?=
 =?utf-8?B?L2ROcTBPN1ZHZGR0N3VrMTRhR0J6UUlTeEVjdWQrRGltaGdoMFM2SmcwTFJi?=
 =?utf-8?B?QjNSNklUMzhDdnRZL2xvT0tRVmtnRW9GTm1rc0VPTlQxWUZkQ0k0TjdoTDRG?=
 =?utf-8?B?akw1cE5IeHpKdHBKbkJ0ZGtLQkdlT2JNNW16ajUzcU4weXlPTzVQN2Jlbk8y?=
 =?utf-8?B?QnR3NTA2S0piT0tzQmFBTE15bHJsV1VpSW14eWhXTWtwREJnd1VqdldFc0Y4?=
 =?utf-8?B?N2lsRUcwa2FrZTNJS0VTZ3hZai9oOThrdEJUT09wNHdGTFg0Q1k4VlBWZ2RW?=
 =?utf-8?B?TzB3NG9rcWp1bnBod2d1cFFKY3V2bVFhNVUzODNiNEREWEh2d3ZPSjRiOFBo?=
 =?utf-8?B?bVl5aWNlREsyL0RLMEVVWnRBeE9IL3hnZjZNY3Fxc3doSWdDNDFLcXRPTkYz?=
 =?utf-8?B?VmpMZE1qcXlsUnZwN0xpTUNqSlZIYWNxSnFwV2ZuNXE4eGIxTThHcnlSVHJH?=
 =?utf-8?B?QUpQQ3loelZSTVBMaXFaeGRRK3BKeXVFZ2lOVkdYM1ZSL3RGNEp0OFJmbnZh?=
 =?utf-8?B?TTluMHhUUGNyQjc5dGZKTmRtZW9nRHlUM1lmTE1LQUFXTjczclVYUnZzNnVn?=
 =?utf-8?B?TTgzazNkdk0vOExmVFBoNmZ6UXhJcHRLMHBYSGZhdGxKazhVbHlVdzZsQmc2?=
 =?utf-8?B?dnVuWXFJayt5L2Z5elM4NjhJSDVLYnRHMW9vTjFaeWY4LzN4TUlabzlzYkRY?=
 =?utf-8?B?RTZFL3VmNFIwelN0cm11Q1dOOXdxZEVqWVFENTc0ZEI2REd4cEdwdnJkZTdE?=
 =?utf-8?B?SGtwdWUvVUtJKzhPTTBoM1NkOVRzS2VQVm8zWDIxS2pEV2dubjlLSnppVlMz?=
 =?utf-8?B?Qkg2SGM5aUhIVFRIL3VFN1NxQVlMSkNKczVVcmFMNTh2U2d2c3l2ZFNISnM1?=
 =?utf-8?B?ZThHSElHdjdlWmxIc0s4UEhPNVVwZ0NIQXQrdHVGRHpaMkNsbmtHMXRFaEt4?=
 =?utf-8?B?WmY2a3NQME5nK1h0UEorajYzd1BGbHJPZ1VSNVBRR20zbFZscDZaK2tjSmdC?=
 =?utf-8?B?YTVVMjdXYlllM0FVVDA0a2U4clRMeFV6bTFWSXgyaVlUcGpBMFluaFNId01k?=
 =?utf-8?B?azdJaEliM1FQbERxOVp2SmRSK0tBQUhEOEhscGFlVUFLdDBQbEVnZGFQOStG?=
 =?utf-8?B?SHc2bFBJaStQM3l3U1FFU1gvczlPblNiMVoxVWdQb1ZOWFJ1QmRoaXpjTXYx?=
 =?utf-8?B?OGFtWVh4UEhvMy9VcUp3aEZTWXZkWWd6VW15eE9ZVTJWSnJuU2xHZmlwZFlY?=
 =?utf-8?B?R2NnejZFcHZvMEROQmNpOTdiRnh3RTQxT1JQYy9KREtSekhrOFhJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa31bb6c-fc46-4b86-9d09-08de5e48567b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:36:31.6078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhk80RXSXfqEJ+yNtKCfXtOQRP1Q8diEcO6ynMh1UvomHR9Rsw122L8jAPS7muyHHGoyByX0Qot+CMAXM29wOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924



On 1/28/26 14:01, Vinod Koul wrote:
> On 23-01-26, 16:41, Vijendar Mukunda wrote:
>> Add generic SoundWire clock initialization sequence to support
>> different SoundWire bus clock frequencies for ACP6.3/7.0/7.1/7.2
>> platforms and remove hard coding initializations for 12Mhz bus
>> clock frequency.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   drivers/soundwire/amd_manager.c | 56 ++++++++++++++++++++++++++++-----
>>   drivers/soundwire/amd_manager.h |  4 ---
>>   2 files changed, 49 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 5fd311ee4107..ee3c37a5a48b 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -27,6 +27,49 @@
>>   
>>   #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
>>   
>> +static int amd_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
>> +{
>> +	struct sdw_bus *bus = &amd_manager->bus;
>> +	struct sdw_master_prop *prop = &bus->prop;
>> +	u32 val;
>> +	int divider;
>> +
>> +	dev_dbg(amd_manager->dev, "mclk %d max %d row %d col %d frame_rate:%d\n",
>> +		prop->mclk_freq, prop->max_clk_freq, prop->default_row,
>> +		prop->default_col, prop->default_frame_rate);
>> +
>> +	if (!prop->default_frame_rate || !prop->default_row) {
>> +		dev_err(amd_manager->dev, "Default frame_rate %d or row %d is invalid\n",
>> +			prop->default_frame_rate, prop->default_row);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Set clock divider */
>> +	dev_dbg(amd_manager->dev, "bus params curr_dr_freq: %d\n",
>> +		bus->params.curr_dr_freq);
>> +	divider = (prop->mclk_freq / bus->params.curr_dr_freq);
>> +
>> +	writel(divider, amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
>> +	val = readl(amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
>> +	dev_dbg(amd_manager->dev, "ACP_SW_CLK_FREQUENCY_CTRL:0x%x\n", val);
>> +
>> +	/* Set frame shape base on the actual bus frequency. */
>> +	prop->default_col = bus->params.curr_dr_freq /
>> +			    prop->default_frame_rate / prop->default_row;
>> +
>> +	dev_dbg(amd_manager->dev, "default_frame_rate:%d default_row: %d default_col: %d\n",
>> +		prop->default_frame_rate, prop->default_row, prop->default_col);
>> +	amd_manager->cols_index = sdw_find_col_index(prop->default_col);
>> +	amd_manager->rows_index = sdw_find_row_index(prop->default_row);
>> +	bus->params.col = prop->default_col;
>> +	bus->params.row = prop->default_row;
>> +	dev_dbg(amd_manager->dev, "rows_index: %d cols_index: %d\n",
>> +		amd_manager->rows_index, amd_manager->cols_index);
>> +	dev_dbg(amd_manager->dev, "params.col:0x%x params.row:0x%x\n",
>> +		bus->params.col, bus->params.row);
> Too many debug statements in this. These are good for initial debug and
> bringup but very noisy in real production. I would add the applied
> parameters for logging
Will drop these debug logs and re-spin the patch series.
>
>> +	return 0;
>> +}
>> +
>>   static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
>>   {
>>   	u32 val;
>> @@ -961,6 +1004,9 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
>>   
>>   	prop = &amd_manager->bus.prop;
>>   	if (!prop->hw_disabled) {
>> +		ret = amd_sdw_clk_init_ctrl(amd_manager);
>> +		if (ret)
>> +			return ret;
>>   		ret = amd_init_sdw_manager(amd_manager);
>>   		if (ret)
>>   			return ret;
>> @@ -985,7 +1031,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>>   	struct resource *res;
>>   	struct device *dev = &pdev->dev;
>>   	struct sdw_master_prop *prop;
>> -	struct sdw_bus_params *params;
>>   	struct amd_sdw_manager *amd_manager;
>>   	int ret;
>>   
>> @@ -1049,14 +1094,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>>   		return -EINVAL;
>>   	}
>>   
>> -	params = &amd_manager->bus.params;
>> -
>> -	params->col = AMD_SDW_DEFAULT_COLUMNS;
>> -	params->row = AMD_SDW_DEFAULT_ROWS;
>>   	prop = &amd_manager->bus.prop;
>> -	prop->clk_freq = &amd_sdw_freq_tbl[0];
>>   	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
>> -	prop->max_clk_freq = AMD_SDW_DEFAULT_CLK_FREQ;
>>   
>>   	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
>>   	if (ret) {
>> @@ -1348,6 +1387,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>>   			}
>>   		}
>>   		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
>> +		ret = amd_sdw_clk_init_ctrl(amd_manager);
>> +		if (ret)
>> +			return ret;
>>   		amd_init_sdw_manager(amd_manager);
>>   		amd_enable_sdw_interrupts(amd_manager);
>>   		ret = amd_enable_sdw_manager(amd_manager);
>> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
>> index 6cc916b0c820..88cf8a426a0c 100644
>> --- a/drivers/soundwire/amd_manager.h
>> +++ b/drivers/soundwire/amd_manager.h
>> @@ -203,10 +203,6 @@
>>   #define AMD_SDW_DEVICE_STATE_D3				3
>>   #define ACP_PME_EN					0x0001400
>>   
>> -static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
>> -	AMD_SDW_DEFAULT_CLK_FREQ,
>> -};
>> -
>>   struct sdw_manager_dp_reg {
>>   	u32 frame_fmt_reg;
>>   	u32 sample_int_reg;
>> -- 
>> 2.45.2

