Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59553DB335
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782463053; cv=fail; b=u2mzF+7RydRjKsA1TxMp0UXrwTkgMeOAf0bILHBfJKtyyA9lcQIJZcmmz3B0MvrfpghVszZY0gjgGaNdwdttGNxiM4oJZQF4CRx23BlsUSlXrjIFVtfnTInlZmFqXl4dCkCtQ2v9PkKd7Nb8mIFOOEmTUtSrHILX2xkiRSA0sDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782463053; c=relaxed/simple;
	bh=GOjdpxd4yFgN6SAi2d39OeHCVqkReLdwaBgAAjkMA+4=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BItecqYERZNR36FzUEXC6wij1kDxqYkOLkUEK25nR/YMNfXLu6qQ/Q874rLk8r3T2oZc+XYxUkAs2z9mOgEUBu/kflfmrL4Hhl9m95cPciucixCrp2nWF8mBAWwrWgJMYxqv3FllHRH/swRSnhwFy/t+VzcaKl3NJBkgthrUATo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kApVoPLz; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kApVoPLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782463052; x=1813999052;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GOjdpxd4yFgN6SAi2d39OeHCVqkReLdwaBgAAjkMA+4=;
  b=kApVoPLzQd7Ui2VJMb65haZdhhDE8RiVhCYQcFRR6izHrjaD0kR7Br7e
   UD8BN4Fx3dkr8kRAhn4g0sTEYXIK2g/48+78EHX4r/Bo4wDsfnsETo11F
   NIRhXhYbghmZfF7b+82cv+Oe+sLT3qcbDYgVXeuuPAF0i7fk6gL7/A7eQ
   XF22dPaa3bVKprxJ/1sZ1b1zMxd8J0wPfbU9lVO7YYJLTrOvjbsuImVGw
   UjNJjN92y2pcOa6JRmmn+z2ehd249up409D+AtTdznEZavQ6ZVrcFfIRn
   FpDelUsFq2GB41Et81oxN/Po2cYbURQG7D3ujSSCcmgFdoYy3kjehHeL8
   A==;
X-CSE-ConnectionGUID: /1/ZVuGkSrCsM6aqwq99Zw==
X-CSE-MsgGUID: +gycZk/dRee+DIVL0mEpQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93843283"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="93843283"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:37:28 -0700
X-CSE-ConnectionGUID: 2gRzLQrhTkOhEarnsPqmGw==
X-CSE-MsgGUID: gJI74um4TFqY8WbCCICkKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="255268580"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 01:37:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:37:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 01:37:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:37:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IilG4SKBg4501KWj3Jab8pIfU8UMGKcLMzV9Fc1qCBoj7iqa+u1Bw1pPHC9q+3rUOYUEdpio5d+UJ63PWkzo/nFGdfNAxTcK542DHwQehyC20JG8uPqMHz9PX/DQWFlytJrFfXEQ17uw8m2/MkzjG/pstNG6cW16POLd3YNqRBe7sgqi5RpcGNOYWnK41STYnTzD19cxuApv9dG4aYu/um42j4OwNQtAt+55cvJDAgtRO8Bn3hreCYKPWZf8PGxKK8XgefsPIP2ATBE5kZyt1PEqigHhFz5qyQ3KU2XSlbwOjV8CILN55zkL37TtJReoYYk4bYBMRu1yXsTWwkmn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=havs7Kq8mSfgMFF+FnF+Ce1JO1JU/ev+Iw7nR0VQRp8=;
 b=Wg8i0fD5OEnWoYNJiz6OxyrrvWM0r2lnS0/YMRTQxdHQlqqdbvazSW3/kSWOKOoeMOLkOt5LlHlgNkLcdo91DTTqS01VyRTCYwVzMsM/AOyPoG3/hyz4FntkWRRal778LVL3YO2m7cGjdTfkh/yXSiiMoknvQiZu5bHzpcvwkSyiSXFSXxkxT1hutXNvQdk8C5O0DZYdBpvYCkN4fivEuNRHZGqyUJeO4A+ip06WqW84sq44DbwZfdYu4sK8srY/qoGAWGvJQxOE6y6JWf+nlkBycXZGGmaUJT3ojNyFE6NmwYWD/FwZu+JlPDEj0HVnmPG6g/2PFyKh2kYhg4O5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 08:37:17 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 08:37:17 +0000
Message-ID: <8f4c2253-e1a1-4ee2-8825-6290eb552e71@intel.com>
Date: Fri, 26 Jun 2026 10:37:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: sdw_utils: tidyup .count_sidecar
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87ldc1etyp.wl-kuninori.morimoto.gx@renesas.com>
 <87jyrlety1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
CC: Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai
	<tiwai@suse.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87jyrlety1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::16) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb40758-4cb5-4685-7bcf-08ded35e2179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +B7xHqa9SD1wae2NuY8WEC1JBT9BW+cl/GTZTePVHJNvLwrXph52sjK9u+7SvOfZzUU9Vm2i68G9SBoWcZ8PsNRdXGioX8Cr+1YIVfhd1LX+xxPTyQbmYjZUeQevLKuc7uNYeKTyWxQx4kkh7OoEEEblIXu9q7Aezfu/Lf/KibvVUisywi29ZH99JcnSGeWq9NEEjQ6ggittWhoxNoE+MO0oZsHt1ioNOhUJCSO0LnKweOhc9EggLamxQ32W/y/AsZhTEiyFWWVib4nj6r6q48lptUn/kb7CUosW5+XxcizxAdgAFsgDLsUU0Jdqzeas6JvPVYy7/lMovhNfewZjIQMfjAKnBUe8rKh3FQhmA+nypixH3SmqNyO/KNfwwgKwkdWCO8UApqNhc2x+WUT5TLJuVlUO1t8HsIT1jEo3P3VzW5RN76LIM9z9m7XCRJnuXDg6/aA8QyOiKcwjtBsIg+wV4WZO8jJ5FUSBNBsqF9cMulGGMJI7XBQNvmicBZcuhc0FRZu0Vq/teHVNkMF1TV/TWtmXwnxaFGWucwLTDN4qWZS/WNJuRbSlCQPNRIS88WN/G/kutn3VTFNMNIjCJ+TuLkr3UP/3C9mr9ifqRQshNW116H8oO7Qw/+ekCePI+NyJdX2wPUZ+AsXzAzIpWALchfl2YdadArtOTfT+38k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDNwQ2dQUEI4RFVFZmpqRXZLaktNc1Zqc3F4YjB5L2JWRyt0VU9vSGdIVTkz?=
 =?utf-8?B?d3pMMzZiK3VVYUkxcVpZU0YyN1ZQekluT3I0aGZqWE10MktEWjFaeFJ3RVN2?=
 =?utf-8?B?NDdZSVRkNktsTW5lUGpVYUlHSGw2OHVRS1FQMkwwN0pjS1NITGw2cExTNlpt?=
 =?utf-8?B?UVdaUXlFWTNsRTVKUDlkN2JGQSswUjF2MGtJbHZJTGxBUW5ZaVJQZmFTaXQy?=
 =?utf-8?B?S3RMVkJ6R0h1Y3djeWNWamZmVllNTk4zRUdGeWlRUHJhdG1DOHRoUGdpUS9K?=
 =?utf-8?B?cWtPSHBmWjJwTit1MUR2UnNTb1BIa0xyaDkzNFlZZ1pwTjhHS2FzK1dlck1X?=
 =?utf-8?B?TmpNT2dra2ZuZG5kUDZLQzY2VTNWTmlZOTNTbkxRTDZSSFZDZmpQU2I1eDJY?=
 =?utf-8?B?dTV3d2d1YyttMml1VzRoTC9BcnQzS3BZckN6b2I1L2x1MWNNNTZnbUxvU2ZB?=
 =?utf-8?B?R1JXWEVkU3h6OHFmbytTMGFXSzlEQVNqcGR6Tm80aDRIeTZCZk9sOVBwN0VD?=
 =?utf-8?B?dmo4MWxiQWV0cnl4cFpyZVpzMmc5OGJqM3JkdHhDYmZFd0pPSzNnRUxucU9N?=
 =?utf-8?B?RWNVSFVWNzdjL3VDY3AyRUZieVA5bDREM29Nc0YwbThPZ3FyYmFDbGRtVTY0?=
 =?utf-8?B?d0I2aDlwelNOYjhHMVRUWmwvemtOOWZFTUFIMGxqeUozc2U2MGZHcnlYRUlt?=
 =?utf-8?B?YTd5TDRlbGJLNk5oRWE2N29GaXZIT3hiWVF2VG42djlqVWZpejJENEpEYU4z?=
 =?utf-8?B?MjdITTN4TGZkSVpUUTJrQUhOaXkyM3crSmZFMkU5UjhCOHlLQ1d4VlhNTnRi?=
 =?utf-8?B?WWZrZmlxaVhzUVA0YlcvbEtVM25hNGJkL0xMakMrQlZtb3Zhd3lEc1VSaVJl?=
 =?utf-8?B?blNJUXFXK3JCaDNTQ24rbFQ1RkN6K0FReERtV3N0WmJ5bWlvUXNTbkJLSFFu?=
 =?utf-8?B?MHRjWFVvR3FqcCtFWElrTzk2RmxvRXllS2hkMXRxN2loenE3Q29Mc3JROUZ2?=
 =?utf-8?B?dHFlbUxHblB2MENlOENRY0RDQXpYTWpINjR5R2Q4RmtlSDJEMzVuY1lpRXRV?=
 =?utf-8?B?NU80QXd2bldvQ3JXWmhBZzRhaDEyS1R6bGZtMEpEMm9tblErUG9qd0syR3Yz?=
 =?utf-8?B?Slpxb2t3TmpkSGZweStUTWxvMkpMSU1DbHh4VHVJMTJIaUNGeGNFQjZrdENH?=
 =?utf-8?B?YTdQbVlsSDNlOFZVdWtRWk9jSUJWeGJoZ3BjUmhSY2JpMlQvOVFieEUyaEVm?=
 =?utf-8?B?NTBpVC9HVWdHQitpeVRUVkwvcjkvaWx1Y2llSU13SWY0QUFyZzNoNjRGOUNt?=
 =?utf-8?B?cThWbEFhVWxHQ2VKMHAvZHFacHlQL0k1Qi9rSUdSU0M3clZMdWxKM0gxbHR2?=
 =?utf-8?B?ckhCRjdYMW9aZ01FN1dUbmE5YmwzM2dqWTI0Qnkra3VSSEdqNWFRWEZLWmlX?=
 =?utf-8?B?U1E2WW5WVVgwK0YyYlE4WG5ZT0sxdnZHMG9ZTmNaNVdHM3VYRlBueTFaZjZn?=
 =?utf-8?B?VnlybFIwbGdSVXJzenRvWnYwdThkOHFQenc3VGVWbk9uV1dTb1FMb3VWQlBk?=
 =?utf-8?B?T0N1cDdPMERkc3VGcDV1YXNTSHNNOTh0MmppSmVoYm9PVXVzdzlzK28zNDZZ?=
 =?utf-8?B?Tk9RakxFZlRGM1VQajNFSnpWTHZnT3JyNmpiVXBEWDhWSHpaOVR2L1RPSXJB?=
 =?utf-8?B?SmNLNkNodkQrN1AxMWxGd2RjUnREVWNHWlpyQWVKek96OHE5T1A3R01Venhh?=
 =?utf-8?B?MEVETzZXUjdPcHBWdmZWV1JOdTRGYXZTWXB6T0tkVlNjU0NHZTNpQVRzcXBj?=
 =?utf-8?B?SWQ3TGQvMFpHRmVRZnJybU10b0E2aVpUbGN4TllNWHFXYWFadWJMZVFacll2?=
 =?utf-8?B?UFJDNHlEcjkySU50NE1rTnF2MUdZUXJ6bWVCckNVZk1hMmJiYVN4ZHNXTWdv?=
 =?utf-8?B?T0d3VXVrYnEyQWtEcWMyYVRwc1VicUxGakpKU3dFcVYvS2I4eURhaW9KS2RC?=
 =?utf-8?B?NEs5VEk2MHFCaFdNZTI5WTFBNnpBQks1dHBLR0ZPNmhxUGQwVllkOUg2SlQz?=
 =?utf-8?B?WkxXTk5XcWxaczN4UWZpUDk2bDdKQytvVnkxV3BjRGRwQVhaa2ttYmVEZm5x?=
 =?utf-8?B?YjZtSHJqSW5CQ1JVSXgyRFVnUjFLMmNWMktRekVGS3J1bnZHa1pabXB5U3hR?=
 =?utf-8?B?SzFBY2FvMUdhM1hZMER5djFuTlpYSTY0UFM1LzJidUE2N2RVNnNZTm5MS3Zi?=
 =?utf-8?B?UFRUbHQyRHBTdFNzcS9BSGZHQmdDWEtsbkljWkx0Rm1TYVZWeWlldjU1YnVk?=
 =?utf-8?B?cmZ5UzRNTXdreFBRb1FncmFvWHI1eWcrMDFGR1pXVFF6a0lsd1Mxdz09?=
X-Exchange-RoutingPolicyChecked: Nn2EakjdLWQepPvknHAsXXNzJPmXZBRiemum77BnZwik6tfxoDkkqU4hC8AAQAvJv+XhFB2zW+0fmGAbZ9KmbQoKzfEoH8iVWA00jZxQrR4Q2D4oGNFyiS0Lrhy1kkaMocXNnmyFyjpG1k+1qU7IJm/c8a4Rp/opodBpTWjybXZ3i/B0broPhlvAn/J94mArBn9EAjaWYtjD328S8Jz8AiJmrFxaA1hjrjnMjG4VAQtd0QN/ffKxekyvVljQfPn8wORl/YCS2i35UhI0+pjCDyskRzrmUkkzQmGFY5r59Zm2hR1rshZPfKBA+n99hPWFmMkIXCLZs7oUZTp8wK7/DQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb40758-4cb5-4685-7bcf-08ded35e2179
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:37:17.8235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdyuvNYt7hcQdDWdorYlxJTEMxXclaB2CJbCeBepYLJxkxAGM81c3aceMQJhFrrbEXMnAJYlrMRpVmMrg6M4K8voIp92Htb386KdCgv6Aps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
X-OriginatorOrg: intel.com

On 6/26/2026 7:45 AM, Kuninori Morimoto wrote:
> count_sidecar() is not using *card. Tidyup it.
> 
> Current code makes old style / new style conversion difficult.
> To make future conversions easier to understand, this patch clean up the
> code a little. but no functional change.

LGTM

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Sidenote: 'private' context within 'public' domain, meh.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   include/sound/soc_sdw_utils.h                | 28 ++++++++++----------
>   sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  4 +--
>   sound/soc/sdw_utils/soc_sdw_utils.c          |  2 +-
>   3 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
> index 79c21966220b2..443d63dc6ea37 100644
> --- a/include/sound/soc_sdw_utils.h
> +++ b/include/sound/soc_sdw_utils.h
> @@ -44,6 +44,18 @@
>   
>   struct asoc_sdw_codec_info;
>   
> +struct asoc_sdw_mc_private {
> +	struct snd_soc_card card;
> +	struct snd_soc_jack sdw_headset;
> +	struct device *headset_codec_dev; /* only one headset per card */
> +	struct device *amp_dev1, *amp_dev2;
> +	bool append_dai_type;
> +	bool ignore_internal_dmic;
> +	void *private;
> +	unsigned long mc_quirk;
> +	int codec_info_list_count;
> +};
> +
>   struct asoc_sdw_dai_info {
>   	const bool direction[2]; /* playback & capture support */
>   	const char *codec_name;
> @@ -88,25 +100,13 @@ struct asoc_sdw_codec_info {
>   
>   	int (*codec_card_late_probe)(struct snd_soc_card *card);
>   
> -	int  (*count_sidecar)(struct snd_soc_card *card,
> +	int  (*count_sidecar)(struct asoc_sdw_mc_private *ctx,
>   			      int *num_dais, int *num_devs);
>   	int  (*add_sidecar)(struct snd_soc_card *card,
>   			    struct snd_soc_dai_link **dai_links,
>   			    struct snd_soc_codec_conf **codec_conf);
>   };
>   
> -struct asoc_sdw_mc_private {
> -	struct snd_soc_card card;
> -	struct snd_soc_jack sdw_headset;
> -	struct device *headset_codec_dev; /* only one headset per card */
> -	struct device *amp_dev1, *amp_dev2;
> -	bool append_dai_type;
> -	bool ignore_internal_dmic;
> -	void *private;
> -	unsigned long mc_quirk;
> -	int codec_info_list_count;
> -};
> -
>   struct asoc_sdw_endpoint {
>   	struct list_head list;
>   
> @@ -235,7 +235,7 @@ int asoc_sdw_es9356_amp_init(struct snd_soc_card *card,
>   int asoc_sdw_es9356_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
>   
>   /* CS AMP support */
> -int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
> +int asoc_sdw_bridge_cs35l56_count_sidecar(struct asoc_sdw_mc_private *ctx,
>   					  int *num_dais, int *num_devs);
>   int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
>   					struct snd_soc_dai_link **dai_links,
> diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> index e0e32a279787c..129a437ae397e 100644
> --- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> +++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> @@ -99,11 +99,9 @@ static const struct snd_soc_dai_link bridge_dai_template = {
>   	SND_SOC_DAILINK_REG(asoc_sdw_bridge_dai),
>   };
>   
> -int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
> +int asoc_sdw_bridge_cs35l56_count_sidecar(struct asoc_sdw_mc_private *ctx,
>   					  int *num_dais, int *num_devs)
>   {
> -	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
> -
>   	if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS) {
>   		(*num_dais)++;
>   		(*num_devs) += ARRAY_SIZE(bridge_cs35l56_name_prefixes);
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
> index d8db8fc5313ee..073f3f9205a73 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -2045,7 +2045,7 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
>   			ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
>   
>   			if (codec_info->count_sidecar && codec_info->add_sidecar) {
> -				ret = codec_info->count_sidecar(card, &num_dais, num_devs);
> +				ret = codec_info->count_sidecar(ctx, &num_dais, num_devs);
>   				if (ret)
>   					return ret;
>   

