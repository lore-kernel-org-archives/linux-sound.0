Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609A38DC6F
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941328; cv=fail; b=sQE8kzn8K55NyStFZwUu/sOsvG+TTpEZaNIqbd36/BLJ2aaYzKEDeTeTGwU4K4J5iX4B4GG17SS5ekFgALPgg7GeBwfuzBWuxLXoAn2iQDhRHgukS4StEFch+ntHRPwmUQ6YtXRcFdb8Mf2Bq3j0Q1APL35QtOCKKlfWu0xyXr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941328; c=relaxed/simple;
	bh=u7QUim8YBk+USljSPVJlcbuGJ+YtHPuctaFh6PaojWE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mlmq65gNI0cj/MmS5jfTMO9yeEsdeaM6GxhIKowjiadl+XC7TivQEXmj6l26/qb8Zpg0ckn19DWFPE6k6fEpMLj3rFwO13ikRRGNiHVk1i+0H8f4meL8bPYcoquOAh2sBuJv5tMx7Mxz92zC3FSxKX6TM3Ei+qC+0sbNTctPPic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVvm8kgJ; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVvm8kgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785941327; x=1817477327;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u7QUim8YBk+USljSPVJlcbuGJ+YtHPuctaFh6PaojWE=;
  b=lVvm8kgJcrygmQrsJyX7/NPgOhOQDTrwfdCfQrrq0AtEhD7I++M6LFwD
   PDmPPVzyiUeFpubAtxfnFZn3Rx8kp8CtQF5j74hzW5ub5FDGpMA+WgiBG
   FZ5DwSKKYVMHTYNVQvF+dtwwlzZU1HPQdTemi+LFyxtx3epPmfi3hYNqv
   sEVBQnoCQlon6ADuwlfc7/CNdom0Ud/VyYCxYg9QEG/0Z6nzoD/k9qvEg
   uAxl8ROxwsno9cXRO6aB/EtZORq7RSbGS2DCzE3lS0GM0Xs3PDz8v2Rbn
   fXHJ/m8V2QmSkVfoSio06nORKjPXWL/bqpiDZYDntblLuOp8pSN5AiXsr
   A==;
X-CSE-ConnectionGUID: LfHBPLgJRF2FRaZ7g4wnwA==
X-CSE-MsgGUID: 0rtZRjrNS+SBLF0QvrMi6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90191412"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90191412"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 07:48:46 -0700
X-CSE-ConnectionGUID: i6D20bTkTtGYZyYmsazDOQ==
X-CSE-MsgGUID: XilYDhW8T2+tHxRABqyFlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257525420"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 07:48:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 07:48:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 07:48:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 07:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3nRoj5J/zzUWA1DBPR2N0s2vXJ4r6JNKPR+l6M8AjN6zVrSQJfbXeAt/XBaEvE0ADoHITTZqqBMSAY15q0dvgxB3x9FGuAxa30ukJ0aGRjkG6YrSv5Y5kpTIHxrkGXs5XsdWmVuqzaZRBbV1x2zBPOkHFMDuTBmhxjUAvtS6VgTGjHo8ckTSZcM2+HDa+jJPf8wRbVl3eQg5x7eorPL3Q37Sep+nd9foQTVp1PSWzcymvJRUXdLQ3qpc+MFVe8C0tB82qBh+I8BFmmuzHVxIAg1/xWiYoLDLzYg2ufFKuz/jUCLcoSbWB90NPVo8TK/aeBQhJ3F6KyyqUjdazeVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlpZegYj+ukxE+INfxC80K8LDsI175ARRoHbf7fPJbI=;
 b=flnsvhW4KBn33T9N9CTNQGUnoEZ7fit/BEW28/vhYYHC8QMs914WBxoBVNZfiQTcYwk/hdbOKTUa7AQluempiBp6qLj0ZkKX+FDb001bRvKEftEBMPovl6Pjfi/kwKPY+5oDCFwLx/+KFe0zt9QIkExkYkpfy/6tnmCdigiLQ47CquQ3aWjIHXL7U3R/zcp/Mew0eXNS/dB4R+Iu28LVY3tsEI7r2jtOuDKhUqQliYgwWokHAph1LsH2z+fb4jzH9qI13Xx0wIqf3rbZA8/t/35xUtukqvDkse8sqQ6/2YjX2ktrCPuovj8ZreTPStXP1vbY0Hh631ObFP2XAbs7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 14:48:40 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 14:48:39 +0000
Message-ID: <4eba5010-0c93-474a-81ca-57545ea545c5@intel.com>
Date: Wed, 5 Aug 2026 16:48:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/31] ASoC: Intel: avs: Use auto-cleanup for firmware
 loading
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-sound@vger.kernel.org>, Mark Brown <broonie@kernel.org>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-27-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260805135247.670693-27-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ea2721-b15f-4d44-652e-08def300a2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mja211fRXoGEJbSCP4hfF8WDNX6yjgn/viq95Mt123NjSMkpDW33AJHoPtpUkwdFRwmpMI2GFah08XT1u1VZxRi+MzHg4D4x3I9hgKZQIqPH9JDMrlWltCTGQpvYSAQUx4BwHv9j1DgNz1uGp7zIQPc72+8lhmOMOsGs4KkgSuQW5V7i20QGrvx9UNoaSAOC/dhfRyeztbaCh5GoYTj92oc5+sJSbN9v8uGziNE85SF3Zt1DaRQ0/i35FAyMaXqyAgIARAgFzGE+dx/e7nEuBH6BvMony0B76p7nx9lw1goAieT4sF/Je8oFXAn/h9XnCYMbS5WRdCwogqBlGmTAMeN+FOefcvdj8ikmhJJxE/V+vxyNY71yCvyObhQu/nkwwR6hxnA26tOE8rUCx1qU03Ocm51eAUClw4LV2uuiU2UpSQegP2s3KbWuNjh2PYxgjeRCzNCb+5lotgFYs/ya2beQaqtzCFBaO4PVchDHbUBSIm8+4hzFWzAdV+DzXmE05a9KdGXhZkw62ToHqeXcNX5Ra3IonFd1pC+SL6CgpPuPNmyS69sgQw5/5I1/XrZ3ifuGQTjRP13K5JZXLYsbR6cJ30J0rfr8VUZOiGUiG/oBiT3m/yeBG71j4U6K0dC5Tq/D9cRmnMaFki+9gCtoBnLAY94cyTO10L7ys5DMJQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDJZU0hHajQ5amVFbXpxTmZERUFPK0hJdjA2UHpNTTgrQjV2MEpYNFF1UGp3?=
 =?utf-8?B?QzBHcVlaN2x1cSttZU8rWnFjcFI4MlQyQ1R0dWxrTVRGYVQ3U3NFUEtsNlgw?=
 =?utf-8?B?VHd6eWUwaVJzSTl6Q1pia0twZm8yMERVbWxQY1k2b1VVOG9OdEVuak1kdHVS?=
 =?utf-8?B?Y2t3NGNDUUtCMlA3Q1c4QWQreXJLWnNRbmRxYXE5UllhOEFVN1FKa1pqVlhQ?=
 =?utf-8?B?aEdtSVBoTW9idWE1clRMejJOTUNnMHBXOWJuNWx0VFB0SjVxWEVURng3bEd3?=
 =?utf-8?B?bnhoZHgzNExjekxVYVB3QWJBVWo2VVpqWmpiYTNMb2FzWWY3UUZGTG91MnlW?=
 =?utf-8?B?RzZEMngyL0Y5RTAzWTcxQ3NXYTI4WHd1Nnh3eDRuVlMwNllmUk1BSUt5UGNl?=
 =?utf-8?B?b2ZVR3Q5MUszTEtUQVUxWGRET1IxT2k5d0daeWx6YUl4c29vSU5uR3hXTFp4?=
 =?utf-8?B?SXRybU14QlVkemI1VmsyWkRjeW85ZGtIL1AyMUVBekJiTlM4Mm5YS2YvZTk3?=
 =?utf-8?B?dFVpTHZ3ZzJFc2NtZnI0Q2NSRzNqMWJlTlRmTVNzNGNwQnRDQUZreVRUR2hz?=
 =?utf-8?B?TWpjS2tBVDR1N01BbmdzQW4yTXBUbmxCK2FqMVQ4VTBGU2xqOXBpTE44dDFx?=
 =?utf-8?B?YmFuRXlJNWgwTUVFS3F3WHpjeUxMYWdISjdFcDMxSmV5amZYSTRpbTZDSUov?=
 =?utf-8?B?Z1NlNDlVU21HbGhpQ2lKR25Rc0wrNU1VWlhLMGNRMkd0MmpjYXhKZkNUU25V?=
 =?utf-8?B?T1JWWWpJQzNESkNNOHh1ZittN3RkTmkyRSt2QVBxV21mUmEyeXNLTVVPa2Zn?=
 =?utf-8?B?UlI3V00vMmcxMzVBSm8vekFLckwvYTdBR01IRHFHRzloazZIU3oxVzUyV3g1?=
 =?utf-8?B?aFBCaDNLVUFsNFEvd2h6MDdvajU4NWFXbElOT3ZVVFowclU3ckNFYVJ1bFla?=
 =?utf-8?B?SXg0OVRtS1Rnc2drTGNRVVJEN2ZQcHZQOFlJVUFyN09hYnB1aStoRUE2LzA2?=
 =?utf-8?B?c0xGQXpWT1dxeWgzVUozQkFyR2hXd2dLL2hqM0UzMXZBTm9VdkgzcTBUSHJY?=
 =?utf-8?B?MzB2eW9BU3lqMWI4bE03Q3JZZ1cvL1ptY0FVazcvbXVyYUh2SDB2Nks3Z2Vj?=
 =?utf-8?B?emRNbkpMaEhSUkVNVlJQRUdqbkNjcFhOR25STHBORjM1bjJEbnBvcHpuY294?=
 =?utf-8?B?WG9mUDFlSmxTQ1BwNVR6azlkUHJTbGN4SktkRjl6SmphdU5zNk4zYlpGcTR5?=
 =?utf-8?B?bUprWW1UbFpsU1BsbWVyS2hLSVBLWUdMM3o3K1ZJUmY3TkM3QVZJZGZxV2RF?=
 =?utf-8?B?amE4ZFFydUF2dGxTcGY1c09NeExKT080ekxPNXRNbkdVVVpvS2s4L2EraXFl?=
 =?utf-8?B?c2RGNkZqRUlVTG1WTkcyYml2ZGc3U0FSclFSQjFzWk5Sd05pVGFDMmNmUlJy?=
 =?utf-8?B?RDdDQ2ZTRzdSREFGdzdHS0dxWmhza25JeE1SSytwaXE2MTh5UkY1bWdIL2dh?=
 =?utf-8?B?S2p0NVFOZURVdXNyamJCelpJbis3ZVZGQktaRlBNanF3SDZLM0VsQWk2R04w?=
 =?utf-8?B?TFJwY2VhQlZvYWFwRDNIdWRZMjlMNjhwbHUyWm1RNGxkWEdBQ2F5dUwrMU8w?=
 =?utf-8?B?M2YxSlV4aWNDUDhFRXVLc2srQUJNenpBMndLYmNoOUQwVlBZckNYa1JUc1dn?=
 =?utf-8?B?OHlGOHhXZFo4Wm9rSVF5enFWTGZrQzZpWE9YSXB3VmIwaVJzbElROWQrdldD?=
 =?utf-8?B?WnYxeXE3RVVYVHVtdVJtTTFVSFdyTmxTcjJXcHBub0NVbG85Mzg2dExpdUJD?=
 =?utf-8?B?UmlVR1hlUFR4SWJpRUZuSzZzb3RiQmkwVllIOHhNWTFYam93WmZrOGZMa0Ew?=
 =?utf-8?B?RDRUdVhJYWFQTFE0UGc2cjV4MjFjNlNzOURkVGFocldMdUw5S0pnUEtaNUtZ?=
 =?utf-8?B?TmFTSVB5a0JSalZZQUhYZkc0cHFLSTAyME9MdjRQdCt6dFVZMC9XcEZyOUhl?=
 =?utf-8?B?SThhaVpoRUIrWkNIYjRIM1JPeWJpa1NvdTd5d1VZWVlzaWEvUENSaEtFR2Vv?=
 =?utf-8?B?Zjdic0VXRUExMkxJMXNxN3p2anpZMVBVQ2UvcmlRcUhoVG9UU1JDNE9oVUVq?=
 =?utf-8?B?dUpIaEs0QWEySlo3VzVpUnd0cWE0Nkw4SmVYQzhvdE1IdjlRR21yNTFNelZ5?=
 =?utf-8?B?a3Fvd1ZHTUJ0Y2d6dUhINUtRaXNsQWdqSjFhQ3RTWXNMUmRwK0F6U3JIVER6?=
 =?utf-8?B?bjNKcHNQb1lwUlBUS3NlNFlGYTRjSG9ybS9UazB5b3VySmNoblIvZ0tUUlk0?=
 =?utf-8?B?MEs1dlhkcDBES1FoUGs5elFWcXF1elQ5bmZEZEhFUzk3MFEvUnRiZz09?=
X-Exchange-RoutingPolicyChecked: h/VQ03GDbr7yNpI9QyDZhQgDsLD5NipIgizzocwrk/cHocIeea76XuzqMyyWUumTvCLj14iXtArtARFKCH6THsBDpq7lzwMvcaKGDhfqC6T+WSJFINfK0EeCNU1KXZKRLfftSeBBbRGTRrQd9Cfdp+TYusCC6JFZn2ZVYTYnd/HYrtJ/xzNGnom7LSkLN/a5s13nCdfxHtkNIxusvRT+bGXDr+cKABLzlFGMNy64T5Xzoie0sAiYprfiaXDpJMCt1HZ+jWWDe+Q5TSqhfh7HdPdRqKaRNrRAWBIWUKBwJWULH5sOOjZiDylj1l/xwuhaHpDajrqIwzRk70eWFdjE9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ea2721-b15f-4d44-652e-08def300a2f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 14:48:39.8176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i33dl7STK1tadxP/sFw5qMFv6Y1O5LRufcVewaXFA3pLMpUqiJTaCokyCFtT/JY0rU2Uzs9XgXozzp4Bp1VbgD0DNxPb+zHtidTHpCp+e7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
X-OriginatorOrg: intel.com

On 8/5/2026 3:52 PM, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with __free(firmware)
> auto-cleanup.
> 
> Only the code refactoring, no functional changes.
> 
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
