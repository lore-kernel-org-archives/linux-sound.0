Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028947F2D3
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714153; cv=fail; b=BQZzmuWiyfJ8bSMecKxgSQLh/mbmF12F0Ab4VbYN0jIYfydT5PKFGQvhWuVywX9UhrYH6DwGYRder5Zwl3qwexJRQGbAOLD5YQYxOF7nSulJYWJqiQrxoowGcua2c76lDh/G+4p4SUT4MaXjGRSZlXqLRTScLqE8hHRAyUqHMLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714153; c=relaxed/simple;
	bh=tlLYwgxDa9ZwxV+JemuQcHUa5PIfspjtlb4Lch1jRrs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HZac0/vCQvzEu+WwmIeAnoMZ4kulcR7E/4e9ss0KAtZDjBRz7Y6A4umSJwnZA/ClUBcb9TCamUfLNPP8QkYeMaaVx06zDSQsPJCBeGlMpc2bw9LoR4Voez2AuZKEpa1w1Sz7mWSiDcyy01R0WEEwUuNWpdE1HThzkDlNPfe74aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CX5JXB5T; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CX5JXB5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784714151; x=1816250151;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tlLYwgxDa9ZwxV+JemuQcHUa5PIfspjtlb4Lch1jRrs=;
  b=CX5JXB5TrbUQmZ06iwhzS8rAHwhXyMElTHfRv/6wDiVMZ7epQijdh7MN
   IRsjedMpdhtiFFE3JUGSnZ5gCAsp30ny3gfTgdZ+9a5kewDL+8yQyNUr6
   NlZXKC8G5kcmpFht8JjQcd9cRjLCWNoHMzZ9xhozR9fOUl+emR6WiubkV
   39HE22DeuEUVUqPsnvegmeMSn1T3IsP7hUgKdiTKsec2DdXohoZrL6D9j
   QSvCMP3905h720qMj1RcADjhK5MgEaPYSwdjSmfdveCcniXbc7Mb23pCY
   iXOQ79Jz2cZXAhgCf9dqGj9U5afeBOiHZKcE62I+UgDoifpgTKSI8hO1u
   A==;
X-CSE-ConnectionGUID: +H38TnF0RVW5HjHSGTZVaw==
X-CSE-MsgGUID: 8qgb/8ewTMqrX3bdeuVXwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="110888228"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="110888228"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 02:55:48 -0700
X-CSE-ConnectionGUID: EcacPInwT7yvmjwZ4EaB/w==
X-CSE-MsgGUID: ETz4MRicR6GnU5+by3ftFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="262980583"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 02:55:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 02:55:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 02:55:47 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 02:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewpNqPGAzdsPUQn7pbwmN+MV47TMsPoWn2PUqZqMZ4gPfpGdYc35d/8SSiUEkjRCfjbwitYV5nndI3O9GePPvk+byETUICBYHL+jWA4yC4QNJbIY09nzzCFz8VuJLQs8Jxwth+BTvl7EYhxZ3MTqfEZWdDWPlqCEgZ9PQbQubfyDtzJhEFAlxR8s9tVuYej+5jOfqvgS7yJJVi5hi6DvI0lPGXnyVbEIU9s1A3eKCvYRhqCzwn5d0H2CqD6NT6B9fLMggjHPFHTiBE7eM+o9LtwBGznFSqeRDF3ItDHN6Iy+OdOdg6SExF/G1YULgFVZfjI6vlfO085wz0yR7axXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9tJLYCR+9x8PO46nMlhZ2i4i10RzKGrHQAFoGC1uhA=;
 b=i9K7rj2kx8ssUu8q/mHeZtdbIjz5H4AU4YtYkQaHQNtHN0l71ykwtzpP+FiA11/732ENPnHK4p+DLTTFC7wml3jNj/bPMcccPC0QGqtFXg0C/GrLBm6DIZHZpEZo2oHEBCml20aoCtxwhHaAj8m1/bikcHG9sAgEdzy1UMF94GOM/1dadamvh0m/KJMY16F6pY5RcvHG3tH51qcZEaJqgBH8TvpSpurWqmKtf+R9ZsIO9olm70HUhXnxEPMjuQHMF6olZCBHyViDStcz4JdkU4m4vArtD2uZ+acCBbFA+qe8u4yziG1MGB3FPoXop31wsBtOZQXpd1m/WjGadSIiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:55:45 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 09:55:45 +0000
Message-ID: <ad75fc99-1932-4164-8363-7a0fbdef94ff@intel.com>
Date: Wed, 22 Jul 2026 11:55:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: intel: sof_sdw: use &pdev->dev instead of card->dev
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, "Kai
 Vehmanen" <kai.vehmanen@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>
References: <877bmpi02q.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <877bmpi02q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::40) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d63d7c-65bc-4924-e2f7-08dee7d765dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vJL8Kfjo4f2BRtxQORALD/V5A23uR8ko905XVcQUSa9Xwct+fFw4Gtl0km7KrxZI2JyVKNM+y83d9TBEFvTgliAIJrTuGWkRGTDPurLcCWkj9neBmIRz5K4Psz0TF67eanQOJfInnuiYyxhhWddkFXbhSK7ueSluYcxgNg/nyO8oOeyd2FniF7tUyhGXsc1YXwXBy6q/Yl5Wq3vZ6mvAfL5ukWTkRsq9ydvJsx8AQLS5z310jGeHsywloZ34IjfvMPwcmiz1G+G3caJKT4pbkLSxsXBal8kcO7h14s4zmNanUHDov+DUa2c94JeQ6Zb3iTvXY1g27Obfh+AslgL4CKuC7eApL4F0TNjy+B7EJfFCNmHBwmAvv7On+5YOhYyHvxUfaNe1Nb9heHNv1DJYKM9oSNOh6/7rOR0dTKf2uqjaksnoVtnaiuoH+zLNnuanLWaPD13l9rGomQUfJHXYkrmCxD4e1Hsx/9D7EkT5tMsUf2v1QuVRTQiwkx4NquiX7K22V2dsqkKNEFSgaagS3VpUqjYZe8n9D5edF0w+expPmuN7GvGqn+F6b/5e49woDp844qBqPTGdrMlZFCB4y3AgNX6jBJG6+rstOkDYVU1awOGpF1UWv8PeUQ4hmhc72VqWPyQxwlZJ9EQUnDqrcbQrIngBEAEHWVlwbnmrOGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjVVRDNJdjZuMWZpdjhRK1A4UUtHTnI5dHZBWjZqL2pnaUpHbWFaQmM1cFJ3?=
 =?utf-8?B?MEJiSnFUSFEwY1RxNXIyYVN4Zk1HMDZTZ0R2Z3NYYXdEVEVCVDR5V3drVS95?=
 =?utf-8?B?UW80cko2b09JOGZ2dXBJcnM0NXBJVFVxbU1RdlZ6SG9zOVJtODJlOHNjV25y?=
 =?utf-8?B?WUtwbXpNVWUzaGhhRXU4UHdhTzVMVjhQS2JzcW15d3h0VVdaWTdHN2RSZFgx?=
 =?utf-8?B?U25oYXd4TTdINjZXSHZ5MkMwcHZRQ1V2REhRMll0SDZwNDYwZDJEV2E0NWFx?=
 =?utf-8?B?M0Z5eFhMdTZNdnQyVTh0LzlPSHRrWDg2RUhjNEVQY3VRK3N5cVNyVkVibXY1?=
 =?utf-8?B?VW5kNkZoWTY0d0FYZW85RUhUWDNlSlorUkE5VUphSjZ4VjVGQVc4eTB3U2RM?=
 =?utf-8?B?bm5kZldiK3E4a3FNRHpxcmFiVXNpb1FNQnhta1BSSlFoSU10emNtSlBGNDNQ?=
 =?utf-8?B?NVVuQzUrUUEvT0RvdUlhTHpqc3g5SzZvd3Y5QWZUeE9qUWRod2xDbHpEanBx?=
 =?utf-8?B?ajloUThqOU1ONTJGSEhId1hRRHNrb0YwZmtscDVGUVkzdTBjTHQ3blpRNWk1?=
 =?utf-8?B?ZmNZTDN3SVhGVFhJd2ZmaVRMSHJaUUpWQjhYd2xwdjMrYzlEekYvR0FoMG83?=
 =?utf-8?B?VFY2U0xtcUxHRHk2aVU4UXpqNDQrS3VocjlXUGdZMmllU1dzT0h0TFZZMUFi?=
 =?utf-8?B?VFljeG5qSitHdkNOQ3laVmF2eFQ3NzFkN0xYUml1MFowNU8vYnQ0UEJQRW9E?=
 =?utf-8?B?ZjRWVjR6ZFFlU0hObnN4YWtLZ3ZuMU1xSGRjSnp5Vy9seDhuUnFweG1qVXhT?=
 =?utf-8?B?MTdnWUlCVCszbVhtRmxHbWpBejFLQlFkUXFLak52Nmgzb0IzbTdZNENScGpW?=
 =?utf-8?B?NFpLc2l1Rmo1OG43aW01WFk3OUZyQ3gxaFZVSGVsT2FQRm0yeXRmT2hGdlFD?=
 =?utf-8?B?RUlVNWhoN3JoV2k3RUdBZXNHQjdjWE9JbllFaWYrL0s0WVd3SG9vWGtmVkpS?=
 =?utf-8?B?OHBHYjlGdDNRRE0yNmFMUVNkL3RUQzUrNE16QlE5WVQrTjROVW1vdFRpUVQ5?=
 =?utf-8?B?NFd4THpYTkZiWVVUcjFVWHlBb3ZDb1BiaHlPdVpMbDljNGxjNkRpMU5NNUpU?=
 =?utf-8?B?VGY3Z1dWTWpGNlhVTVlEQTlXYmxUdjFtdFNpWEdKUmV0ZDREeFNwRDNyOGdW?=
 =?utf-8?B?VjlVWnZZUFppR1ZFMk1KWERVYVFGdFFiR2VndmdGcDAzbElWOXF3VmpLcTA5?=
 =?utf-8?B?a0ZLQ1pQUE15d2szVWcwVWNsTnhwMWlSVWFRTzYrNjQ3a0h4UzhPVUd2aXVS?=
 =?utf-8?B?bG5CNDhSblE5eEwvcXNMaEFDSFlsbm5ucFU5RmdIR0N1MlFobUZTb01uOWNa?=
 =?utf-8?B?QXRyNDBHbFNNRVVDU3NuK25yNDhnQnQ4THFrYkVrekhadE1DSzlLK0hHUGdz?=
 =?utf-8?B?QXpjSXh0SXN6RmJBalREVFZaNVpyRUVJVFM4U3M2S25DNWVoSjA1aXBROHBD?=
 =?utf-8?B?SzU2K21saTBNaWtOQXNQWlFtMXBFc0xLcGYybHdTcDJTUTdJZ0FiamxCRWN0?=
 =?utf-8?B?ZENaSUFHbTZaZkg2Ulpoa1lPamdwcDEyZnNHRGdwWERucnp3ZFdRdDNhVWUz?=
 =?utf-8?B?QWhIa2lQeGF0NERtdXIxZ3k0ZjRJWEdIU2xtU2lGRzVIVGFjOE1NNkVWRkRF?=
 =?utf-8?B?V0lSY0haVzQxd1NBNitaOHQxdENVbHkvZlNJOTZYMkxmSElueUVGdEI1dEtY?=
 =?utf-8?B?bXRvWjVjRmxJZ0s1Mzg2UVJmRUVBeEk1NllDOTkxaEJnUUhncHY1SlpaZVFK?=
 =?utf-8?B?MVdlSHpvM2lqYmdicmdYZFMxdlMrL3JtNGdoMnJZWlcrMWdBR0dZK0tRN015?=
 =?utf-8?B?TjJxeHo4djlTWll2Sm1nSzNIazY3eUJEcmxMK285cHlmbTZ2R2p2UDlCRW1x?=
 =?utf-8?B?b2FySytlR1dyL21RZUV0M1RSdGR5cWRtQlhpQkJFMnJDZXFxKytaUU9hOVFw?=
 =?utf-8?B?dEt5SXQ5VlVlQUVRM2hPaC9vUzVjMElGdlJZbG5iUTByVUs3clVuUTFBTU1G?=
 =?utf-8?B?aXFaczJUaXRJdmJzcDBPeGN1VlpRQkVLUGxFbk5jVFBHalN1c2tVUndiN0ZC?=
 =?utf-8?B?TlRndGM2YjhPQW9YUjBkQnJmVDd0Rks3Zkk4SkRnY2tKQWJHWk9kdXU1UVQv?=
 =?utf-8?B?R1EzcE5yV1crK3UyeVdLaytkSmQ0SUxXNHYxV1lNakw5c3pubmRUTm92SXR2?=
 =?utf-8?B?dVJFemgzd0tFNnNMTE5uWW5PdWhhanMxb3ZKTjFzb3U2dURPYkZzUGE3b2ZY?=
 =?utf-8?B?ckRBeTE3L1ZXVG1tYVlhZ3RLaFI3OUhzSGwvZm00QzNmOWNpTFkrclhXR25P?=
 =?utf-8?Q?koezzNvEuIql+Sqk=3D?=
X-Exchange-RoutingPolicyChecked: M8A1f8+OBj7OGRbMZB/5rqmvdtb0E+jleameS3InOPNpeO0kBGxI8m7SXIISgXQX48HkihZH1APXDnXLkuNBE5zr6nKwDVdpBRfNCFtx54A/0zoxlQZzSwO3APRygBFsmlP/hVvKMXedeBOZFUQJucNGNHPjVYMe+4Ngxux+y1/Ln3YTDibZJeB1UbGD1QIW39AhLuA1nznneFpWDm6UdwIfMGcywuzxtV8qEyXck1PT9HPMY7PmHULHJHiY/IykRNipxRPDk1CoucXIVfdJhcjOH35YAhwGUK67ej8XZb9PiebsfMvSEiI3jq8PTR4hiP6JMCRONwlc6xUlOMEMSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d63d7c-65bc-4924-e2f7-08dee7d765dc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:55:45.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffmmZlXMl0cmdZY2D/m1/II2RN1dvXrzmsmwG38fAvAbRiOzucLfLQd7zi9DEliFcOJ5Ubg4e6WBz+Wbr3fN+yx/FW9ByZ8kpXsbGDggllQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-OriginatorOrg: intel.com

On 7/21/2026 3:49 AM, Kuninori Morimoto wrote:
> sof_sdw.c will be updated when Card capsuling.
> To makes its review easy, use &pdev->dev instead of card->dev in mc_probe().
> There is no diff, because
> 
> 	static int mc_probe(...)
> 	{
> 		...
> 		card->dev = &pdev->dev;
> 		...
> 	}
> 
> No functional change, but is preparation for cleanup driver.
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
