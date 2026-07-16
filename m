Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEDF3DDB04;
	Thu, 16 Jul 2026 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190433; cv=fail; b=NApLcQOrShVN/043EfDH9EUzKC5cpVd2tyJ5+KydtkRWENp87mJ3V2fENVQ9JQCVACSn3tm/p021TT1Oz2c2kZAzKc5uKUf1hNw6U3+/qMiF3LIGNItWx7aoyJ5bg+vOQZsiihivUY8mQFUhs9QB1WI89Gea498sZMmqgSLAmYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190433; c=relaxed/simple;
	bh=kJG0a0rE38csUPsKl3GS/oj3piOqgSZd2nKC9TFuCHU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kTyAqYTQ6COaWIWPaOaSVh1RDLHDF/haPAq3MctpJt68eNv0yWxPyzF8MqZnhlqnvaMaEHnzAr2mo9HYwItTBqGS3DkVrIPBUQLK4jFHZ12xcGduXtb3TGTFLly0XGi6SY5Ysf+DUsnWT3SSV7f+epVj+15gGwm6yHhBYCRKwFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abw3nSFI; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abw3nSFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784190431; x=1815726431;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kJG0a0rE38csUPsKl3GS/oj3piOqgSZd2nKC9TFuCHU=;
  b=abw3nSFImq1hwSiEbLLIHFWcs6FnGt0nn0cqAPLET2BRxI1vT7qF5ByR
   Vric9pj3hjLQFHfn+UKUTYbi3dn+HuPEKJWJUqZofvXZ/hQD/HFci2rXS
   m6z+68kyJN42hNjslcNbU8cLASGY5IYZWfmMPf95TZFMLKcEbB2aB/lLa
   oWvHEy0WMcai4I2LeUksGcEdN7/9+LQvLvXFFWsKEIJTGxkJ2V9rs+reB
   evS9wXWnCIx6Uh7GqQw8NnM7SksGI1599k46AdneEcNwoPTq3cRVl2xbe
   LgsXjGnG+t1Wj0Kw7g+DS7JxAsfsakaxptjreS9pot/7fjAaIQWNGFc2p
   g==;
X-CSE-ConnectionGUID: i41O71aKSEOoDJAC+csEDA==
X-CSE-MsgGUID: wlqnuFEqQZqJgtlou9qESg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96208279"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="96208279"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:27:08 -0700
X-CSE-ConnectionGUID: dMMLqf6GQkSgPwQV4i98Tw==
X-CSE-MsgGUID: yO8MDU+/ToWB31+Kfnix0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="280877476"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 01:27:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:27:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 01:27:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:27:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkbO4tlb7Zn8R95nUrr/6PBzX+eqIN+aUwjOmjVmgPDiaoeHIVStP16S+ynAgBSSnFadynmWzzEvM1Q7NGv4bugP8qjTgNO7iimtntI5vo5zhbWK4C6lVtX4Uya27TED4/b+bbsKRswpvzVH769+JH2qePDnp7WPBZ/+Y3MzdNPf0byJLCUzNpdxe43vlM0LfHv2pj5ltFsNybEYLb3Wpfoo2DLil4OShGFl//GyKQ585O0PbRrp7KP8VZnMOUNqG0iSJRFMmnUHFuVYxHEH5/inXFFSws7OpzTMnvYkvZ25AihNgzJbyBNfK1TD0YqN4LyNj6t+Eq7MFhblFiR6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL6OYFAJAsOT8u7hsHE3VsA9IKxRqSOTUL2qVuc2LqY=;
 b=BDSTvF7E/lRF+uzx6RjsdwGad+VCOdnY2I5bKz4FZRk2dOhXegPBaJQEHHbVAwCz0rNamTn5t07XfdMDTpbMXIGQwUSEvyjyIgIyqv36Qz+N9tbYFcOIYfEvQYqErxGz4gwDzXyhN5dbyJ5FglcvyBS7k9pNjLDqOc4Cbe5N1uwfY0taBBIv+IR71vi2Kjf47EG8VtSPrzHg581wz9ssShIhRbwoyaVYIZ3vYcgVaJbE5EKnIuBbjehUGDWge3iv6UkIqEqBo232phTvRSpascLahUiMDxNP5HwgldRivZlSsSRKtN+IapTCl+uebD+lFB0TPe037el0MKxDsw6Mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 08:27:04 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 08:27:04 +0000
Message-ID: <1bb894a5-1a47-4f30-94d1-52cf4a4c79e4@intel.com>
Date: Thu, 16 Jul 2026 10:26:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Pavilion x360
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20260716064916.540616-1-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260716064916.540616-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0029.eurprd02.prod.outlook.com
 (2603:10a6:803:14::42) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CH3PR11MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d144a15-4d4a-431c-c4b4-08dee3140455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: OG2nkUvkR4Yd28dUb6KV3fA17FbPnHZnFv96DcDokGQ4wdnd63uZdmulF5Hu3ZVGO9oYdY8wtvTEvWxheYTwcuPfUA3JiNh4uoO5iDcGVwO5bmiANb2cUZOOif4FbhFVC+AM+regRQQKIJAw4s9tELmMHf1YrG/PZFvnS58n4hljDUSmfwrqJXJngaUtXJb3p8e5hLy2ClLz+7J2JT19ac25bagO0ImWcBlY41KCfZHucq9yPmos5yWRDpxaan/4SaGYxU6K1Y77EK8TWAsD1kv5+RmBq+iVbZjQBjrs+LUipuusl1vcDu78gBo/z4udVLlv+HF5lX1w2fYNCEVnAVlkAopOnT4IkqmFIlfpntQvgYSXTR6ysYfHzREAv9nwtdEpUAMchVaXKNpkQQSrPEs4ykK7cx+PbbYkcJUajHdCatFMiL/ryItQE6qfnB1cliE8RQVWvga/RWhS3BOQ63P+izPavz/sMH8s/NFp6NE8HvZud19ZrXQKZe15PUfQiwSfMwAB9WadBrF5D+ujIfjeyvRS2NYr7B7UT//7E4k3PCEBa7UDoKWFKLUHlRDEPMpXYY7gUedSi2Szz4OXLBPvnuEvGQtD5e6eQkgfQIQIWIPoaR/yA548JXHv3gV5NDtAOoWJf8lbufMvQBpwmlpPUM4Ewmlva3tlYxLO/Ks=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXRNV0VWdTltamsyV25OMno0S1RHNnJhNTNyK3prdjhqSmZDZC9wbnJyQytV?=
 =?utf-8?B?TGx2Smd1dldZeHhjcTdsY0xySm5yTE53ZGpYZkx6SE95OTZJN0dkTmdIWWtl?=
 =?utf-8?B?bS83Q21Kamc1MzVBRWJQc08raGZDTTNPd0xhQTk0Y3NlWWRidnYwb2hvb2lS?=
 =?utf-8?B?S041QkFDWHhJS3ZFUTY0bW1KWk1XZ29KQWQ1N29XQkJOUk5jNmxWZkdnRmxI?=
 =?utf-8?B?UExza3laVFZHdDVSamhKa002dWVkT0hYZ3V6WFcwUkpuSUVydlkzZ2VPVk90?=
 =?utf-8?B?K2I3VWo2YnBPVUxjcmZlWGV1dEJQK1hKS2VOcWR4UEd4VE1INEJkZ2psYjZB?=
 =?utf-8?B?elBMVVNWeFJjaXFlMWJOY3ExVGpnWEU4MFJPcDFiU3VIRkcyMUtZcmlTcjFP?=
 =?utf-8?B?bzVKNjZvWUdhUlFYSzl2WlVNUlIwdmZiK0d6UWtZUnhzTnhrbUVYcFF2a2dY?=
 =?utf-8?B?bldCNkdTYzEzMUVsUmlTNzZXNUFkQUgwTlVERnI0NjRCbWV5MEFpd1o0QXZq?=
 =?utf-8?B?c1VMUVU4Zlk5R3k0cVBoUUowZitkQm1UdDZmNzNEKzZGb0M3eFEyL0Z6T3ZT?=
 =?utf-8?B?UWJ1NE9uRllpcHp3dGNnZGJWWmpUMGNJUytNWk5ReFovZGJ2L2tvYmkzNXlX?=
 =?utf-8?B?K2l0RmdOODk2VXFibkZ2ZXVuUDJJelhYOHVjY3J1eHNOK3hOOGZ4eUJzZlZJ?=
 =?utf-8?B?YnNQQk5EbzZ2V3F5QUJQeFZCOXQwZnlzcUVKYXVuQzJwWGZFcjNPNC80T1Vq?=
 =?utf-8?B?RXQ0Uldhc1FlWkF4UmxyTDNZR2ppSWlod25SL0VKWldZRW1nSmFqVU4zUUNM?=
 =?utf-8?B?d3p0dkovVFhtbitja0tsU1d0NnBzNlRMZVhsekFSek0xYThDM0pJak5rSExC?=
 =?utf-8?B?ZEV5b2tYQUNieWpTVkkwQ3RaY3FNSUhuOFA4dGdVYUJBV0thQzFJTExuOXZX?=
 =?utf-8?B?Nk5sNGF4QWZxaHZyTzVYaVZmNzlIZVduc1R0Z3lQdWp4Nnl6MWhLSE9sbnds?=
 =?utf-8?B?Vk42NHlsQ0tHSlZzWk9uV3ZaZU1LbGRmbVdxN01ZaEtTU1hWRTQ2cXl4Y2Uz?=
 =?utf-8?B?dzc3OFgxSEhTVC9lZUNxUkVISlFyZm1NcitTZUxVaEFTYjAyVjVrWWhhVjVQ?=
 =?utf-8?B?Mnp2N2g1R0lqcWJ3bW9Mci95c0dwWndGN3JqdXpSQm5FYk85QzM1MmpGeGVS?=
 =?utf-8?B?bGlZNHBWelVwYlJpTTFkdVJ5YVpoZlBBcUQ2UC91RElVbkZSM1JNdmVCYlJ4?=
 =?utf-8?B?T29vSytyVzI5NmNkK29QZjZ1SFM4RDB1VG03bFc0WWRRYjJlZEFEMFZMOHRL?=
 =?utf-8?B?RGt0WTBOWDZkeG01RGZUdXA0eVhCSzBucE1YU3ptNFp3NllFbzM0ME5iWmc0?=
 =?utf-8?B?YWk4RExPMU4xb1l2cER0YnVYS0RLSk9kM2VYZmtNZ3BwSFhBcVArdDZFSDVl?=
 =?utf-8?B?cHU4VXZDbDdOYWNSQmowNHNQL0ozKytOOVBUQ3lOWXpEdktsUVAyOEZjTE5s?=
 =?utf-8?B?dmZaUE1HTS9CZ21OdEd0ZGlGK1dDeWY5VHMwMUh4ZTUxYXd5cGc5Mmw0SUds?=
 =?utf-8?B?b0kxci82SytJZm5BN016MXQya21SODcvY1I3V2hXdXZ2ZDJPbnJYYlhmUWFW?=
 =?utf-8?B?TzJvaitCQStCcnZCNjV5SWNyZXROQ3RndlhjbXJ6ZzQ5bXlONjlNdnVBYml6?=
 =?utf-8?B?WUFIVlM3ZHpOWmNyVXVsYytFYWFsK2NVV2RmZ2FkTkpORUJSVy94ODFBMWY2?=
 =?utf-8?B?K2hXdGJkTlVxRlVwVkdOWkc1KzFKamlDL1RIQjVpMUhVLzluU1J3TjV3N1Vm?=
 =?utf-8?B?VDJpSWcyNXVUaWRXK0JnSGFEUnZ0bWlMV0hEWFEySnRGS2tucENzTUFQZWI3?=
 =?utf-8?B?bGNZdEVQTzJENWFlRVVQalY2U3ZwM3diZFJtOW5rQ1BLRURKeTFBU3E1L3l0?=
 =?utf-8?B?d3d1MkF1OXpzaTh0em5MRDlJOVZVb0RKRjJCOEtVVGZQT29GeXk4SkNCY2ZH?=
 =?utf-8?B?THNPNG9jbngvT29IRXlVV3BCZ2ZMZ2NoeFpNdFM2Y1JHV0I1RnpWQXNyb1BD?=
 =?utf-8?B?T3FkUEErQzJMVzRWVWw3emVKKzVld0FQbStIZ0VFaVgzTGZYeVA0OGRQVzB1?=
 =?utf-8?B?amNEZTJUUkNDSVdsTFhzV2xROGZXRVVqQkZ3UlNyZGY1THIwa3UvSnRTenE3?=
 =?utf-8?B?U2xqSmw5THNVZUJvQllDWFl0em9OMkJnVnRvQ3o3QzNrZE5JZmtRTGYvenpN?=
 =?utf-8?B?amF4SkJ1SU9laUtTOUk1V0psN2VGaXFnMlFWVVlJVytUSEZDYWVmb1V6V0pl?=
 =?utf-8?B?RkVsMXVaYmk4cXI1TmcyZWwycG5VWml2OUh2MmlDMFU4NmRSd3I0YnZ2ZTlp?=
 =?utf-8?Q?dpCmrFDROGCKkld8=3D?=
X-Exchange-RoutingPolicyChecked: Bojg6DCkd5Jf1+EIayLPQfdEcuf0pcW2RPMAr44o5CAXAV5/Te5q7m3EDx1PkvdJyVig/C95fVuA+LaboAJHwk5SoEYx0oU9RNB2aomwY5OeCG2Ru9u+8sP4rf2s/LiZRYmcLQINNGUw0skXk8xvy2W52bkBt1fj0EV/Gr9fM7iv1wuCWqUpiPGqQ9wo1GPCY98UR7RsHmO38QFJU3FDfFXU2yUxv5aD7hLey8BvjC6YoFaTihkgc2dXFpAdmsP9CKjzPPJOnjyNtXRyKVJiXzFUEZoQEDzUQJxGeBI3Cjba+FdzmIWBK6BIM17MR+xR8tTgV+bpMm+6I8fgVx5FfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d144a15-4d4a-431c-c4b4-08dee3140455
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:27:04.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYbEJkoHPJ3QmKkEL4jQCCHUbDr4Fsnd3aVbe9rplpatfJ5hEA1q536fJfrvtFUIEheinsaV5lduRQ0o7/8bPrgTZyLqVVnEaMf+aFDrANY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
X-OriginatorOrg: intel.com

On 7/16/2026 8:49 AM, Takashi Iwai wrote:
> HP Pavilion x360 sets a bogus PCI SSID (103c:0000), hence the driver
> picks up a wrong quirk entry, resulting in an almost silent output.
> And yet, the existing quirk for x390 doesn't seem sufficing, and we
> need the extra setup for the amp.
> 
> This patch adds the quirk entry for the codec SSID (103c:8486) to
> initialize the amp via COEF verbs and chains to the existing quirk for
> another x360 model to address the silent output.
LGTM

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
