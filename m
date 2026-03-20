Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2D382F2F;
	Fri, 20 Mar 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999629; cv=fail; b=G2nilRmqYvDpZ+iUg1v/A4wHJrmOqSL/l2f0zh40Maq/7Y+/1AyDGDiAaCTB7nZdruItvXAlXownipqdhkSBjOrIMNLxroX7PlF/IOjUXGdQ9nM9Atx0HXUcGaSCysNqMbP7WRYbsxYw36a6IMXZagI3nq8E1Ohpe80rZgi0RT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999629; c=relaxed/simple;
	bh=iAxN5nJOf4rLOsr4ypLNee2i9XQLwir2wo9ImzH7TEI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T/e85YYpMuNhCTRQOQSVyZDzw5WdIqG2YIHA3VYWs8wHq1E0MvHkThS1MVSfbotMyi7ywSF7rdwTlE/T+dxvX918QKLdG5OpU3dYZVSkfB+vWAGUg2/qGLBzAUWiSSjk9NUeLdSaAwzebG0yGRvzLIKmSr0Ab4wgbzO2dAxpKVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuq3+moi; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuq3+moi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773999628; x=1805535628;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iAxN5nJOf4rLOsr4ypLNee2i9XQLwir2wo9ImzH7TEI=;
  b=nuq3+moiCRbXQ5Wm1s/gNIIQ1Qop4FIsFFPGFyCrHiSnVxUZrIIWDWc9
   KQj03Mba0g69X7JNAQBtu3jRUXPoh3Ma2Z4DzfMwj6s2sofpr/pSopyla
   uIU/cOp7wZ6LZ0gDFgfBZBejzkBTNfs/ZgAOCGgk59+1wQGBicnYPd3Z+
   nI0t60fqjt2elI6Oi+LoSiPE9Ylw42OpcaOTaIhi5FFrAm7XXifSOKqGJ
   ZIj695WaIBq7r46TcYgbhEMnRv64gsQA6+4rGZ0F+xLaNhobT/yLrI4qf
   WAt2V9uxtZZMvTlofrPz2eIATA2b00rfAb5KQ9a00oZzlhb0WP9fp5Z0m
   A==;
X-CSE-ConnectionGUID: 6aLcY1SgTACpYgu54lDDKw==
X-CSE-MsgGUID: 3Y4StWmySyG7ludhiLflcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86444885"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86444885"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:40:27 -0700
X-CSE-ConnectionGUID: AFyLaGcJQ029rpAV661T3Q==
X-CSE-MsgGUID: hcvXHjjtQFK7kLZ9FS/L4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246262966"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:40:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:40:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 02:40:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:40:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbmZUc6tslpM5gz+gtllucK4aN9ttfdJeQDQi21iUC/j4FlICronR2XetvjMdhqmWA5V6CRYcJmuijasuZfMp+vkrok860wCaaqGevNfMGcQqtSNlpCIHN4lNtU7HK6JJEeItQE12cStNRk6/c67i2Ej1sGP8hXg/eIFvd29wsdf/EXmiuUErKHW8+XwzdelU5HGbmT1adCnlPedcuTLkBWuSEM0FC9Ar6631DmjB5wwilDemmlZc14JRWkZ0GZKvbUCI6bGKHuP1lqVzckH0DcmyLEt/TTMnl2lO1RTdZ5cmXGLXUxEgwNvHtvJ1SKK2SSWVUf7ypcCXd2iDJ/NaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZgy19GNfqF9vZBA3BYUM0M67a+e4HvX8wUVq2fT+DE=;
 b=VmZfYkD01vUPjJzzJjdfdoqHOfZ2OH2BOuSyixlCNp+/VbxWpxbfbsZNThWYBoUPkXM6emvjBFTwrr6qDBNBP37RIDEYogHC5rhXQLZ0OZowZaCt45KjGlXqH1pGd9IIlk7Naq2npEbGtqCbUwI6gtO+wxIwixu9uq7w7AjG2cn5x9o74fmBaLJnlK/gq73PYKm/YRMPU4CWzW2zXTnPwSqwcqj2sGx2bJlSWDZg9tY47ItouBNjn6WrFLdDboDGEvh0tabRVXRAx4C4WNBnBX4esZtn3dQ9r08BoiJQQymOuam9Chxw63tNdS3xlA6xDzAbSY/LodGwvG6Qvyw2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 09:40:18 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%6]) with mapi id 15.20.9745.012; Fri, 20 Mar 2026
 09:40:18 +0000
Message-ID: <d6e33ff2-bff0-4361-b0f1-3a46ef64d887@intel.com>
Date: Fri, 20 Mar 2026 10:40:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Dell Inspiron 3501 (Tiger Lake) - No analog audio output,
 only HDMI detected
To: Enrique Orozco <kikeoropad@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <CA+Q1o_9CgNNmRiF044ZPSVGnbDUHh-VhTKtc5pBDLYXJGw2GHA@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CA+Q1o_9CgNNmRiF044ZPSVGnbDUHh-VhTKtc5pBDLYXJGw2GHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0008.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::10) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 65566305-1b81-4e3f-84a2-08de8664b249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 33bONMBHpB7hpGxjNOJUHq1/W27ofuFRbbEoItP1ulPyJaimQXpY52NDJc+YvDh7i40Hc7FgRMDAkJI3p2DfvB7B+7I87Y2XN/YJHQqWKiymK/cMDmtWZrX+IXn6wEUxiozORsfAUzbMC2nYtZaQuTWp4E8VnNC+hmFJ/trzCu2zDJ5krwEj+hNVaMtCKcI8jCkKgOhUdyQzJ79LU+ZFhTdDEUZIuwN/PNN3hA+v6/rqquz2Tt/hHtHk/V31C2WwpCZlH90Zj617avQMRktbVItbS2+b9HG8WS2bFg471+ML5KUrW8wcPO26dBwqv97ooc4QZ6JduItloVNuzTZyAQnF687Qw6hlazgzCCYg+I79BbFFsImn+88PlrPAkepZXeLaSxp/E0+ymeG/wK2g//YHjMvDo+mC2/coz2htkuWLvjTH/HYBixLN8G/KiDUxX6nXkORle4xsTmeWp/uD3tJQudEpOWhroR4VdFjQzJRftZfpX+sgj6NC1SVa3KqcaL0t0SRinBV7DFP30NQwpQ4/9Dm3Prc2aV5xaRo25BfWptVTydg8mxl4XP+MdQPNN7cYbNe8tQEf6pN1q3kqEGh6tpSUQHhMEEQueyaYqVRYXX8r5qAQmd3eAKUssnLdUX8W+BtNEUyPb1+s2f25zY6coOpaofWseOIrvrp9pHPYVwiny3K/UDF0ETXLf+hQZvqd0VYm+2P8CBtQ247gyYBpUjfJ7WlLEJqV+b7O75s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWRTTm1tcEVYRHpLRHhnMS9QY1haanBrQ05rUW15Q1B6cWlWaVdBRUZZdG01?=
 =?utf-8?B?TjJXeC9iL1RISmkrdDhZdkJsSmM1SHVEYVVNeWd4TUNCa0ZtZEFERk5BNHc2?=
 =?utf-8?B?K2ZQTHhLRWc0WWVVZXlOaUFMV1hTa1lqNU5GdlNCYTRzcUY1VkJscjR1dWRT?=
 =?utf-8?B?OTFoVFlxcUdmbXVEN0JrU09iclRQamlLdUdiTzJyVG9LaFQvb3dmNTdYdmtZ?=
 =?utf-8?B?YTJ2Z21NU2RNdDNsQ3NGc1dBQ3NoSzNMZ3RETTdjeDhCQk1ocG44enBVYnZx?=
 =?utf-8?B?VEN3aDU3UFNkQjNJRXhNc3dvbWtIc1pHL09rcWRWSytKWVRDRU1aM29xeXov?=
 =?utf-8?B?UndkaW1vKzlmOHBJOFJua3dTVzZ0Q2tDQnVFc3BhSzF1dGZkUkFpTTA1WlRY?=
 =?utf-8?B?bGZuRnlhLy9IRnZrcmNvQjJWWTdrVVdMRW9FM1A4TFh0ajZWN04yT0FPYUpl?=
 =?utf-8?B?N0pmVVR0ZEdKYzY0Y0Yra2FWN091SmNua0V0Wk9xQmVFZjhvVlJhUER5YzVV?=
 =?utf-8?B?NDR5RjloTHpWMVlOWFNoNnVCcWJHSWlMUktHVm5KRWNZVW5YN1dTNHZvNTJX?=
 =?utf-8?B?ajJrcVBYKzBIeEw2am5oSlpEcVFQNHFqLzViaTRJTUVwdjFVbUlSK1RZaGhJ?=
 =?utf-8?B?TUxNTGNFMjdkNjNzaGtIMnJnNVRuSldtZjIyWitOTU1zUFlKeXVqdEJMdXpG?=
 =?utf-8?B?dDQ3bXNHbTdaVC8wbmxqOTJ4enBOcnAzZkk1T1BkTW9iUGhGd3p5cW5FRndC?=
 =?utf-8?B?K0dMeFQvY1YxSGh4bitpb2FOK3ZqaGdkWHJxUUpGZzAwdm9FUFhHT3NseTBE?=
 =?utf-8?B?RkNHY0REMUt3TU1IV01YUGkxN1hGWVAza25PUWY2UDdIYkN1V25BM2ovVlQ0?=
 =?utf-8?B?bTBDdjhIQnlIYjNjaVBZQ3pHZE1mR29JaFI2UEFXTmRoTk9MNGZUcUhtMjRE?=
 =?utf-8?B?Ujd4NFhpUzdpWUJVVThzSHNRaURkZGJkYklNOUNpY0FDR2lhUGhwR1J1dkVV?=
 =?utf-8?B?dXlNNkFGRmVxYldFR1RzS0JqcHMwK3lCMVNFRjBmNEliNERRanhvOGpQWWJh?=
 =?utf-8?B?bDZBOHBETzd2L2dtdFNydlpMb0g1aDMvWnhEQkEyUWhEdlVxR00wdHh6NWdU?=
 =?utf-8?B?R09wSXVJL0JEUzJ1emU3Tk16QVlwS28wOG12anV1cVVEKzFyRXdDVWlTVlVa?=
 =?utf-8?B?MDEyaEljdEV6NnpYV0lXbzMxZSsxVkRpZ3BuaXhyK1NIaFdiYjVydStaRE1H?=
 =?utf-8?B?VU9lOURkK2RCdkErVEVpL1c4VVNEMXhiV21xK29Ja2ZobUxJVGdFcjM5YWlw?=
 =?utf-8?B?WkhBdVZXNVd3VjBleTltekRwSEtPMUY4akdGaG56OWtjeURFa0U1OGYwTnll?=
 =?utf-8?B?K3VPSFRadkU5WVZBRmxlR0dyZG1KalVMdWd0ZGN1eUZDSW54Lyt4Rkx2ai9F?=
 =?utf-8?B?WjFWajVHMnJkdUlibGViWk5XNTNsREt6ekgzdzFXQlE2STIzeEFPMG9WaXdJ?=
 =?utf-8?B?N285R25rRFlnbDhiUmNRL1k3ZTJyTmhlQUtxL1EyNWxiQ0xrQm10SzBYeXhn?=
 =?utf-8?B?N2M5c0t2dlRnZUM2bTd0Tm5PdmF2Q2M3OW1FTG1IZjlicllER1IwVEE5blpL?=
 =?utf-8?B?NUtDQVJ6VU5vbk92NElhUGkxUFU4K25maGdKbkZnSUZaSlpoZDEySnppVDlz?=
 =?utf-8?B?S1Y4a0FPSW1uUy9GS2FGNDljTkhYa0pybllGcHNPbVhMZE5CRW1paUo1QmQ4?=
 =?utf-8?B?SzVzR1dwc2pZeERocFF6Y1dtSTZBRVhwL0NhOHptdUFmbHNZTFByNEN6cXdo?=
 =?utf-8?B?K0N4Ujl0MU1ONFpzSGFEQnNMOHVoU1ZhOFRMN3JFQ0x4NEtsWnZ5aERnbUhD?=
 =?utf-8?B?cTFwTGdGenZwMjRXU0lMOHA5QjdnL1pFUkJEN3JLWldiV0VpMndINzNMOXc3?=
 =?utf-8?B?VGJ3NUtQa01TbVA2clZMeFlyQTFQZCtFL3lkUmg1MS9DNk0xdWo5T0J6YStK?=
 =?utf-8?B?UVJObCtYak00a2RhK0FTdU12OE1OaCtjbUtGUEhJU1JLbytRZmNFclcwZVBT?=
 =?utf-8?B?VGVCYllKR2pDclBBcC9pZXdsWkdLZ2tvKy9QL0R2UjRJbElWVGgySklrUyt6?=
 =?utf-8?B?cGwyaHF4SWNYTExuWHE5bmN3ZWJHWEJreEc4bkRCL3NMRFRtMllBbGdyd3Np?=
 =?utf-8?B?QTFwOUQvb0JOdWhnS2MrSkxQd2FSQ3MycTIwMGhPU1Z5dEM0UGpKa2xXcnR6?=
 =?utf-8?B?d2ZKektLWEhJVWhrSDYvTnVTaVR6NWFkb1EyTGVUMGhMRmlJdXIrUnBKUmZr?=
 =?utf-8?B?TTErOWhsQlo2OGFLK0dYWnJURmxFQ1k4V1NMK0k3YW5INnRXUXpRSzZsWmJF?=
 =?utf-8?Q?Mtu5rleTZe5pWfgQ=3D?=
X-Exchange-RoutingPolicyChecked: DMaYg5plfOUR2IsmO2zOPSzAN3Rug9gqk+N4V1w/N8PTWKFKk00qz0TfOoQDqyisrjLzqfDOX1Zc69/+1DHRzS6CRpqMNcRMyA+IUoMfhU6WAyCY60uP5qY3KGMuU3BcDkjMQkSwI7vmmUTP3fyh5w1oO9Y1TbvP3sVAnxI6HZb+XUcCJomyrYhGk1xBgAMqT/Qy7e9N32Sbc0A302+MvUVsgkXjElnrQevYOTWaTZS3W64ROQ6wOQNrS8awmwrvWTlNkqKeXgBajivwZEJRhZPvHyjRp4q7s+Ll4oAEBOz0ERBgYQQnjtsXT6rqW3r4Wsi6AaywYxgRZfa5qFvisQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 65566305-1b81-4e3f-84a2-08de8664b249
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:40:18.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fFBHM/CRGPOB4D4FtE6WnPwNCjWhuvXuuevKrYY/QwWuYQgIHaInM5E/d2zzIm0ubmlghnnRtW9swx9/Jn2PNdZMQ6/PWDe0gdDJSF7wDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
X-OriginatorOrg: intel.com

On 2026-03-20 2:31 AM, Enrique Orozco wrote:
> Dear sound/ALSA maintainers,
> 
> I am reporting an issue with audio on a Dell Inspiron 3501 laptop. The
> system detects the Intel HDA controller but only HDMI outputs appear;
> the internal speakers and headphone jack are not detected at all.
> 
> System Information:
> - Laptop: Dell Inspiron 3501
> - Audio Controller: Intel Corporation Tiger Lake-LP Smart Sound Technology
>    Audio Controller [8086:a0c8] (rev 20)
> - Subsystem: Dell Device [1028:0a25]
> - Kernel: 6.18.12-1-MANJARO (also tested with 6.18.12)
> - Distribution: Manjaro (Arch-based)
> 
> Problem Description:
> After boot, only HDMI audio outputs are available. The internal speakers
> and headphone jack do not appear in ALSA or PulseAudio/PipeWire. The
> kernel detects the audio hardware but fails to initialize the analog
> codec.
> 
> Observations:
> 1. `aplay -l` shows only HDMI devices (devices 3,7,8,9)
> 2. No analog output device (device 0) appears
> 3. The codec detected is only "Intel Tigerlake HDMI" - no analog codec
> 4. The following error appears in dmesg:
>     `snd_soc_avs 0000:00:1f.3: core_mask 1 power off failed: -110`
> 5. Attempted various snd_hda_intel model parameters (dell-headset-multi,
>     dell-headset-dock, generic) with no success
> 6. Forcing legacy driver with `snd-intel-dspcfg dsp_driver=1` also
>     didn't help
> 
> Reproduction Steps:
> 1. Boot any recent Linux kernel (tested with 5.15.x and 6.18.x)
> 2. Check audio outputs with `aplay -l`
> 3. Observe only HDMI outputs are present
> 4. No sound from internal speakers or headphone jack
> 
> Expected Behavior:
> The system should detect and provide both analog output (internal
> speakers/headphone) and HDMI output.
> 
> Additional Information:
> - ALSA diagnostics:
> http://alsa-project.org/db/?f=8eb23206a6d8aa76d24136f224b1ad93dab53651


Hi Enrique,

Sorry to hear about the problems.  Your diagnostics seem to be devoid of 
dmesg, it would be vital to provide it.  You could also open a bugzilla 
and attach the logs there.

Now, this report seems a bit all over the place, mentioning all the 
sound drivers at once.  Let's start with context - their purpose:

- snd_hda_intel driver default for all general, non-DSP cases
- for TGL, snd_sof_xxx driver should probe by default for all DSP cases
- snd_soc_avs is utilized on designs older than TGL for all DSP cases

Your TGL of device ID=a0c8 points to PCI_DEVICE_ID_INTEL_HDA_TGL_LP 
(include/linux/pci_ids.h).  This means snd_sof_xxx should have probed 
first.  Frankly, there should be no attempts for snd_soc_avs unless a 
user forced the enumeration.  Such enumeration is destined to fail - not 
because of the driver, but because there is no firmware binary paired 
with it available on linux-firmware..

..unless one copies a binary from a Windows device.

Last but not least:
	`snd_soc_avs 0000:00:1f.3: core_mask 1 power off failed: -110`

While without the dmesg I cannot say for certain, failing such "basic" 
operation as power-off MASTER_CORE (mask 1) usually means that the 
laptop, despite being -LP, has AudioDSP functionality disabled in BIOS. 
Forced enumeration won't workaround that either.


Kind regards,
Czarek
