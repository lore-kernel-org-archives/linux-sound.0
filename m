Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010007.outbound.protection.outlook.com [52.101.56.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB7C8CE;
	Fri, 13 Feb 2026 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770953109; cv=fail; b=tlkG4P6ry/+O7u2zSP090XYz4vhvGMnNg5lx2bz/O+5KM9Vv0UeoNXIm1WR6tCNboGM1Iqx+73bb3ng7PTjYNrO2V8ojukXv15HdxACBLj5xxZ5A8WfaocGoH+6RjuDgVE6VqIxPd/1HuqtVN9dCL3kj4eG+/Kv0HHhJxG28vAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770953109; c=relaxed/simple;
	bh=o5fmcD/KDAbCDloxfgGnsXrCKR9pq7oJ9Irh6+WRpFY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mubXHe/GIV9YZ8v/dcnRCh9a5PiCVDPK83Hp+1Suf6jp7aHRQ06cpvAVxHf7cKF/IGdFgEYcy9wMm9nxHNvCh1Y4C5hgam5LzoiMhXWxngFwSRi2fhYZFXMFVno24RgnaTI/CZdZHx9Pm5vHbhPMVpokPL3IcXNDq/QlC0cay+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L5zPghCF; arc=fail smtp.client-ip=52.101.56.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L5zPghCF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BljNjgVJ9tOMWa5xQLnEee7dBr+D6bc7yEPd4rkhuV8BNL3wp9DY/a4H3p9UiAFrUg1V4wzMpJOaBpHPlH2NGlU4/PRXuXt/ktVzY+XCSjtIgeBOHlSEkSLSZXO5SCA7FXizixVyeTu6zfYsi15IBDyjWFm1hFDmigE5W/SfTXB/ieNUHpZ+BinFqXqWq9Oen/N7ERzqaY6yApED8+FzAoIUCp7M7WJMd0yOjxsR0T0BGoh8rtrIS6vA/UwRqCxDvggHIL/zYIGDEs5q0w96ph3gXpyHFYCu1HzUdiu6C48MwEpSCc/TyQ4V3whslKfbd1jFzVqmP425uksYNb0B3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+E9Ed3wvysU2CvH1t303uo9MRP5tiFj+KuQq7Pm5wQ=;
 b=XlmJREe9iikXUq3uEn5htuhLLczPrF9jFLl2aLDXaEIPY+FAteGOZ0PixvYR/Dh6v//QJviePkwBTtrf38i3anFpSk8td7SiXRvkQ3ZH1+tdmKpApuYHWKedt4CnAi79dj2kyBTKD/QR+gogelYeQdVrIiN+wt/rEZarTmFoOdD+veyuKDcW7V6M0mIU9utxTv2fAS6kD5ZI0vazdboLHMlPsyCOzQ9CVnA5xnpvKBQUVsw/0KAakhlyh9GbE9cA0P6jZaBRAen04XkGdUdP7tUnrFYQtDBjEjrua6rS9WDJtOqN4AX8HLauRwM8i338xAHl/Wlr/sK6AQ4FE7PM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+E9Ed3wvysU2CvH1t303uo9MRP5tiFj+KuQq7Pm5wQ=;
 b=L5zPghCFmLJPsCTnHlJnDBNypJbe7LaYm7/n/bSL6C7aNAP+Hn4x5ZIgU7R9iN4Q5+sVwhLsLLtc+BgXFmAmWCIgB2BttEdqE3enFIWIqV+eYDpWwb1uPhr1RV2bp83D21JlOTKnpY+yuEg2LbkQWJetFrUOd8CdssUYHKm4KUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6034.namprd12.prod.outlook.com (2603:10b6:930:2e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 03:25:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 03:25:05 +0000
Message-ID: <fc1fcbfd-e68b-4f19-bbf1-3bb17c1d9c27@amd.com>
Date: Thu, 12 Feb 2026 21:25:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: Add DMIC support for the AMD RPL platform
To: Mingyou Chen <qby140326@gmail.com>, vijendar.mukunda@amd.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213004246.16615-1-qby140326@gmail.com>
 <20260213004246.16615-2-qby140326@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260213004246.16615-2-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0292.namprd03.prod.outlook.com
 (2603:10b6:610:e6::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 225b3fbc-f0ca-4b21-591d-08de6aaf7b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDF1cGxtL1pudHpuV1RjNWpXMG5DS0FlTXc0ZFQvM09vcFpGYy81N3pmNVUy?=
 =?utf-8?B?b1lxbkpRVm1NWHFzVzlLWUtLWHZWMkhXeC9lWkx6ZzErRzVuaGVUMHp2ZVg4?=
 =?utf-8?B?UXp6QWlZQjRsZmFyR0FxRGlrWDFIT3U3cnR2TTJPU3hiT1lndGYyYmNRU3Jh?=
 =?utf-8?B?TkdvQ2Z6TFY4ZTdEQjh1cGptTFptSktDZEx5L3FpMlJaUGQzWC80TVpaWG9Y?=
 =?utf-8?B?cUR6Ri9ubmFHS3pSNnJObG0wSE9DRGVTZmVnTy8wYnYrQ2ZIV1MyL2cxVUZK?=
 =?utf-8?B?QThMZFkxR3hWVVlzdnllTnBwRXlKdE5Xb3J6RFlIbnBaVzJFUXNzN1VJd1RB?=
 =?utf-8?B?UWxoMzIzYWJoaG9IdGFnMURyZTZjUTdXWDNIUDBpNW1lRm5ybjNRZkk5Y3Vk?=
 =?utf-8?B?TWc0UTFjWnZXRG95N2JLQjliMnBmSWJLL1ZwVEhxbitvTHlxTVptbGNwbEh4?=
 =?utf-8?B?RmlHcHB3UXZhbGJ3M2FyaTNHQjAvSTBOZHdja3hKcUZQSXFUSklvcFZ2SWpU?=
 =?utf-8?B?MVJzajlFLzBlOEc2MHdGa3Rpb2h3eGdZQ3gvSDE5VDl5NGxSeVB2WW1rN3Z5?=
 =?utf-8?B?dFdyYUJiK0lYRmhMYWh5SDN4bXR5eDVCbFFieGdsMDdkY1FCY1RTaEtwVTY2?=
 =?utf-8?B?ZTJGRWdYWHFPeVdpTXI0bmM2dlRtQzk3RVJwNjhWSGdtb1RYUGFkOFRNcVRR?=
 =?utf-8?B?NzBCVTlPTUVqOGtSdnA2b1BoUWZnWW8vc0w1ZThDZzFwT3Rtdk1tZWxreWdC?=
 =?utf-8?B?cEVyckwrVlBmQzJYcTdCMk5WWTdRUG16M2QyNEJ5QzJvZnBFVUJhMkdHMER4?=
 =?utf-8?B?MjJiWE4xUlREL0VyOGRMdDQ2Z2JOdlZ1SjVXemx2QmM1UGhEUy9zaytSMkdX?=
 =?utf-8?B?QnA4VXFaM2F5UzJXMllHbHI3a3Ezc1RFVHZKblNzOEMvLzZEdHR6SkZvMm5E?=
 =?utf-8?B?WWp1VCsxU25MVmhTbzBPaGpyUzlheHRka3VDYjQ3R3c0RlNhdldCcTdiSy9t?=
 =?utf-8?B?ZCtQdFFPdUJ6WVd1YlJhelFkamZKcTlJaVVub2tYVXdOWjZmUXdVZlFOeGJV?=
 =?utf-8?B?em50b3ZacHNna0ZtVzg0N0FzRDEzdnNYNzJQZ0M2Y2ZwMUlmWHZnRUdWbDVH?=
 =?utf-8?B?dmZaMzFiWE9sTlR4Q0NzVUtEZzJhTER2SERFRm9ZVlFDUnNFUzFFb2lFWjBT?=
 =?utf-8?B?NUdoL2N1d0NTRWJDb1VkZ0xhcVhDZjUyRUhmUlV4bXdGWDNucEJvTUp3UnVq?=
 =?utf-8?B?RE8wQk5zTFRiK04vNWFWKzVTdE9CYmdaRUNoUCtDWU9pTzZiMEJxVEk3UWNP?=
 =?utf-8?B?Mm42TTNxZEtQdjlvS2dKZ3FPWk5hcWRiZUNzUXNkczQzUFNYNGtJYnJ0RG85?=
 =?utf-8?B?Q2o0TGR2Zk1YdTRnMFFQVjFRYkc0SlowS1dMUzhXL1BSZDVxUHIvbGpzRFFK?=
 =?utf-8?B?UWhuQkFCZFFmUUh1c01URnFWb2dSd3V3dTgxVmtGU1AwNnoxa09OSERuUk0x?=
 =?utf-8?B?SGJCTTlBc1hiNndEeHJuR0dCejNNN3ZXdjl6QTV2a2p3cEJIM3drWURRU1hz?=
 =?utf-8?B?UFljS2FJM3RmZ2ZzQ09RWGFpMGZoZjd2bTVOL1pxbDRwQlVHeWJGVEdoekRp?=
 =?utf-8?B?WncxejFvd2dIRUNURmd3LzFZSU1lZnpoVU50K3d1U05YSXJHV3JNV1FIcUxi?=
 =?utf-8?B?R0MxVE5nOUdBR0MvWU92VzNsUXQ5T0F3VGZKR1A0a2w1WGwvdjd0RWdlbTBy?=
 =?utf-8?B?RnZTeW1xekdKNk1VeEdCMTZzb2pUVU1WRjgwQ0szTWljNDYyZFNHV0ZFQ2hY?=
 =?utf-8?B?SnozeFNmWHo3R0FJQ3NUTUZ6cmVHK1MvYm1ORSsxQjJEVkczMnJLU3pVQmR6?=
 =?utf-8?B?ZVVhWW9TMVJOR3U3OXgwaXQweUpScnlwQjl4RHF6QTljODIzcU5WbG1XUnd3?=
 =?utf-8?B?ejc2QnJROFF5UjAzUTJka2Y1eWNhWGxNSElSQmtOdnF4K25zQXZqZzVoNHNl?=
 =?utf-8?B?NTBkTUI3WEJydGU4VUdsMGR6dHVaRTVkRTN5T3ZCUVI4cEdjN3hXUWpDbnRB?=
 =?utf-8?B?L1BGcCtOSk9ZcWtHNmlGaXBhQ0s5OWdrRUttQVVnTVYya0c2Mi9VQVFrajl6?=
 =?utf-8?Q?Le74=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uis0OERJVXo4eEVVYzJldnNFbDZOUXcyRGxER2xOY2hoVzJVQnQ1MWNnWTJP?=
 =?utf-8?B?SUxhNmZpeUl6SUVJQ2dMOGJRWW8vbC9Sc0lEclM4QmdrWG81VkZ1YzRyVlMr?=
 =?utf-8?B?dDRiZnJRYnFwNlF4L25PcWk4YjFkSGNTQ0VWUkZOS2tNY0ltTlZtMjZVeTc5?=
 =?utf-8?B?c3FjeTNnYkx1YXR2YVBMNGdLS2hQTXViRXIrcklxbCtSQkpaU1JNVWJWczR0?=
 =?utf-8?B?ck5XbkhtcE4xWTgwU1VEQWJKSVNVM1o3TklCSGp4Ri9HUXhUZEFpR3lyWTIv?=
 =?utf-8?B?RUdzSEpHWkQ1YzVob0hiMDRSd2txT0ZoNGdjbWFramltVi96dnQwWEU5OUNw?=
 =?utf-8?B?MS9lRk5uTFRMK3FORzdZUGJieWVVZ01pdmZDdWtQQUQ3ME1lV2xNSlRZVE9C?=
 =?utf-8?B?WVk0amIvT3RwVTF5eWZ1R3grS2w1c0NualYwdkt2UzEwYUJoeU15eDBVY1d5?=
 =?utf-8?B?LzYwNERDR0VCc2RwcHZCdGtsd0N2cGpFMjBpSUUrTUQ3RFZKWEtmSE9YNytj?=
 =?utf-8?B?SDFmVGVTZGhNMHdjeUFweUU4a1J2akluSGswTW03Y1pMTWp0eVo5SEwwcjVW?=
 =?utf-8?B?cUY2RnJYTkowRUtEY3dkeTRrUUxBME1pUURPU1piTUdpelV2UFNwcThQbUJl?=
 =?utf-8?B?ajRMTlhBZ0ZFWVVpTGtMdHVpMElPTnpvUmlMOTNadjFGK3g1OGxaYmpQQmxa?=
 =?utf-8?B?eGhYdmJhdG4yOXNtZ3VDVFdzZ1ZMS1k3YWd5YnpFN1plRS9aOURIWUhRd2oy?=
 =?utf-8?B?QUwrVDhRQnpQVHJMTDFwaW5DNUI0R0FSaU1qcWlmcmpGKzhWMStETmtJMEwx?=
 =?utf-8?B?WVIwL2lndFFxUGp2Sk8ra1NqUS9QeU1RZGg4Ky9YWXhtRGVGVUVZVFJpWnFS?=
 =?utf-8?B?clo4YnRIQzIwZkczbTdhZ2lXelFxRmU5QTFQUnFOcU1LeHZHaTF1ZUdXdDdD?=
 =?utf-8?B?c3Z2bCtjZ0swM1NLQ0dlQ1lPbjhvNThCQlNKNGw3eVhZVWI5VFVwUVI1SVY1?=
 =?utf-8?B?aEcrSHF0YmRjSkZBUU9kUFZuNmkxYW1RTGVUKzhLMW0yU0hMekpIWXIwRXhu?=
 =?utf-8?B?NWc2bFo1TWEyNE43d1BGeFBUVkU0Tzd5dDk3WlBPRGZGZjRtUkxiNzNPZUNq?=
 =?utf-8?B?Z0pEb2M3SkRoSWZtaTlhU0pGQndQZzd3bzZ1aVFYT29QMlZyNUxmekxVR3Vx?=
 =?utf-8?B?WFpSTStONHkxRTB3QVlJMnA3TTNubDAxRjVnREZKQkNwNmlYa1RCZFVyZzNM?=
 =?utf-8?B?QjR2ejlRSDJMcVF2MUZJbDN5V3Q4UkhYbmFDQkNEUFhITUxOeGxCaFE2ZHZ2?=
 =?utf-8?B?aVB6MzFhaDhYUWlGVFU1Tm43R3lYUEtxaFdONENjZnUwVkRnUlB3ZjAzQUJj?=
 =?utf-8?B?YTV3QStNSEJEMm1haW1ZMXJWTVE3enhYNFl6SC9IbFNhMHhDRHdWU2p5eThw?=
 =?utf-8?B?bWpCeTFxTVRtQkI1RU4vK1l1Q1VhUEI3QmlZQ0JqMm5EaWhuZ1d3WXh4MEFh?=
 =?utf-8?B?bjBDWklMY2ZneEk3djR0ZTQ1WUpyZ1BGMDY0eFhCNVFwNFpHSnJHOFFzRy9L?=
 =?utf-8?B?YmExTU5PdDZMSHhYSUhVUjZEYU45ems5Q3F2ZjYrNVZrWDJVVGJBNzdvcHIr?=
 =?utf-8?B?NXpUNUdBKzJPeUhQOGZzRTY4TWNFKzFRSytNUjI1NVl1dnZsS2dCQnNPdCtw?=
 =?utf-8?B?d1hiNHBObEtid0NnU3kvTXVuSG1CME5zR2Q4ak93WFFaeHZKbXpwQ0E3MHI4?=
 =?utf-8?B?d20vejkwQk1FWUVJeUdjWlVBMnFGN2Q4SXZnV1I5dmQzSEhPN05EZ1F1NUtL?=
 =?utf-8?B?UkMvQ2RoaExVd3Q4bm1KVjVkalhtdjI3QTN3V2FxbHZ3U3R0QUViWU1xazVQ?=
 =?utf-8?B?Rk9jQkV5SHNwK2lvU0xCeHRsUTUyemdyWExNTUt4U2JienRwUitQZVJxZWtN?=
 =?utf-8?B?VjdjdDcwK2ZWZ0lINnhwMFpsSXlwVW1sNDhqcUZNOVBoWDZZZGlLRlROc2tB?=
 =?utf-8?B?Y1FoT3BRWkVrc2lVNVRucEpjdy9mYjJLRmdGc0xGZ2FqZnZnYWVPcVpKNlFv?=
 =?utf-8?B?Mituald0dUVFV08vTGswV1pLQVlZQjZqQVB0ZjdkWEFpbWpsS1h1b1lSejk1?=
 =?utf-8?B?dmtuWVRVWHRDWFJsMnFPYzYxd200S1pjaXRnanIvL0l2dDBuUXVhSHZXdXJh?=
 =?utf-8?B?TW5uZHY4R2cwNXJYbkxKcHpxOGplNWhJVGxEbWRucXkrRThUOU9IeXNLQnpM?=
 =?utf-8?B?ZHdyL1dGY2JFUHFTQy8zaGVqM1U5U1hKWTYvbm41bjlIQ01qZlhhQWYrQlVG?=
 =?utf-8?B?R2d2V0VZb1V5VzJ6YUk1MnR6Tm5xU1FFTW9MWVJVc0ZYRjJ4UGRGQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225b3fbc-f0ca-4b21-591d-08de6aaf7b01
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 03:25:05.0671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGyhnRS5sfhFg6FtTEoK7de9iZmvenZzpyJMhvtfjPAlJg7dpNE5Oi96DVf0EU/IYjSl7/WVZ1cALsPvr7+EGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6034



On 2/12/2026 6:42 PM, Mingyou Chen wrote:
> Add RPL rev 0x62 check and reverse ACP CONFIG PIN 10 to 14 for RPL
> platform

I think you have a typo here, which really confused me for a while.  You 
meant to say "reserve" but you typed "reverse".

> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>   sound/soc/amd/yc/pci-acp6x.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
> index 1140ed1cbb3d..53c1910a8838 100644
> --- a/sound/soc/amd/yc/pci-acp6x.c
> +++ b/sound/soc/amd/yc/pci-acp6x.c
> @@ -163,6 +163,7 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>   	switch (pci->revision) {
>   	case 0x60:
>   	case 0x6f:
> +	case 0x62: /* RPL */
>   		break;
>   	default:
>   		dev_dbg(&pci->dev, "acp6x pci device not found\n");
> @@ -208,6 +209,17 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>   	case ACP_CONFIG_15:
>   		dev_info(&pci->dev, "Audio Mode %d\n", val);
>   		break;
> +	/* PIN 10 to 14 is reversed for RPL */

This comment is in the incorrect location (and also has a typo).

I feel it should come right before this line so it's obvious that when 
on the RPL platform you handle the special case.

if (pci->revision == 0x62)

> +	case ACP_CONFIG_10:
> +	case ACP_CONFIG_11:
> +	case ACP_CONFIG_12:
> +	case ACP_CONFIG_13:
> +	case ACP_CONFIG_14:
> +		if (pci->revision == 0x62) {
> +			dev_info(&pci->dev, "RPL Audio Mode %d\n", val);
> +			break;
> +		}
> +		fallthrough;
>   	default:
>   		adata->res = devm_kzalloc(&pci->dev,
>   					  sizeof(struct resource),

