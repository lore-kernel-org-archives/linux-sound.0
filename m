Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177F25228C
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390886; cv=fail; b=DkMSVx/nfryBeKLkka59JfPhmFE1heUxUo5CQnu8pB2HHHxuC9GjKOcmDmuMtgLS6LIU2v4b32XqC5Vv+CDTZYF1R+Z/WqiiWs2IITD1bfKQ23vxvyG7t7oVo0rmQRNUvjzFxnLYuTP6bRHGr9KGsKHcC6mUuok+6gLNwic7YAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390886; c=relaxed/simple;
	bh=fRNJmQBLxCwgTLqTgIreRgWDdAudJR4ARv0aSMu41/Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qTDHvqEfEEd/lgSNR7V9nAJeIgdsIozzkGLMbD0ZlpeggCG9NPbwwKIv+pYO/6BdrkPVOGaw+BwzjtRsM45tTa2swKXBtSk8bjmgU9NMSSG8hkTRDI8wZcfVIvr+NbQlrLrVF4Qf3kMrCSWn0BapM6qbvItfQMQMEnhcyoEYWg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkDBLdLp; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkDBLdLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780390886; x=1811926886;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fRNJmQBLxCwgTLqTgIreRgWDdAudJR4ARv0aSMu41/Y=;
  b=QkDBLdLpddNFPkMnP5CBe2/RWKg4WBOIKEeeEq6ngJL7aKH3nvUJee+9
   yAG83ZeiHfNWeYo8RHAUUOViJ0+v2if9URt077PL7ToUKVwM7sJsi1VXZ
   MCUeqyK3R7AaQFKWanVTyyTNvIvK3d6K8oHoQte8stG2r+EdXITzjYkwC
   QPI3kx9TGwY5xBta9Z6EI7NTYRpaN6KypHSU4N3+wpXMvsOKB9iAsK082
   3mbrLhyedFlsm8uUoV3Ga2j0plASE4IrDT3VYiWpjwt/xAvJ7lFmR7NKG
   BqxIO+VSX/3G0Q9e8psDV5JMlHQ+Pqyp+sKN5h0s4NX/BTiq6VsI9DH5X
   g==;
X-CSE-ConnectionGUID: nU78b6ZiQju8n2YSeuWC6g==
X-CSE-MsgGUID: 9JkRbZt0S8yRxMmNo4jg5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98589592"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="98589592"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:01:25 -0700
X-CSE-ConnectionGUID: hWMauNRMQtGxko0wHx3PaA==
X-CSE-MsgGUID: MbTVhZWsTmytm0Z74H5g7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="243681308"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:01:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 02:01:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 02:01:24 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 02:01:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D18W6nPIZLJV5FwXv68HopSBk0l06WpCCCuWiqtC1ykoc6P1lT/zPC1iMdgyTcHoANzp116fBJam1J0ZOHkXDjOSDP0gCs/Hr8P2SzhpbjDyRwyx7Amt8WdnmwIOTmkSHVyGx/qkiLCl0kuErL1ixq3WnzlyIsjY66UQWiz8SRoeAOylqJ6+F5579RPNAJX4OfsLl1ON8DLY/9iwEBW68ZNZY+iDX6IEvu7luXuqCscFrpdPwD8W5wwnrYD7xxvBl2QsfcXDo8i2U8NMFHxTH7zrjSRozLnC9HBiSLJ27ZsSF7JQEMMFJBkg5lvJhYga6b1sfeXQg7H0rKjU0chj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErUYJw+yIPNDxPjOLbGJ+Ltp/2ik+drnWqflBgT5Pz0=;
 b=lnISTD5H+D4S8OBQm1SiG0sHxpNrd/4FTTQmoh+XQKKXnhGRem0APAGoQqGMONoYlfJAxwQz/Oey1oNlkfafyepeSQVUI827O2GSFUDMUaQEyRzC36z5XqFB439PQCVycJ95Ne8byzD+8MSZ/oh5hUJjnl83O/EX0e7M4ulUwlMkf5AATh9Hg4UCT5Vr6xPUwvRmZ1mnyp7yWpJ+MiYcmuAD1Yb1gvTx1bUisp96tRh9CGrpV1+gKTCY0o3R8B0jWs3eFUL54LflklNuo2kp23L1XbzDvFE3S/d4enWP3/jS4PmcE6MCccarw3LWJjsWiSIQbB9k2CB71UbianNh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 2 Jun 2026
 09:01:16 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 09:01:16 +0000
Message-ID: <adc410ba-1f5f-4ab7-af4c-5a40b0ff8753@intel.com>
Date: Tue, 2 Jun 2026 11:01:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] ASoC: Intel: catpt: Remove unused WAVES controls
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-sound@vger.kernel.org>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-6-cezary.rojewski@intel.com>
 <ah6aPMMlOwCRHDkK@ashevche-desk.local>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ah6aPMMlOwCRHDkK@ashevche-desk.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0114.eurprd09.prod.outlook.com
 (2603:10a6:803:78::37) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8c03b9-3853-4158-0434-08dec085812a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 1ZmjUZzNSz2zca6eW7xzNbG24TbYi/p0vtVrYAa21YW2dLsyzxW9w7SkxTye312FZXqfMNe7dqC6CuCBnnc9PmvrUuace6mUbsirPDgzuLHoNYu4zqSe32VQ9HLr+jk02JXkP7+xNSI9UU95DIsgm8Yvg6YtEQfSesscJ7ahUPrcqheift4xKtHoxbS/Cww0IfCk9i9Zot0yWbzpIJpHqqdmzBjMBb96hZHXwTf6ug3zIyVsXLf+19iRskzZTYqX6BBoJ09RaLdeJALcPfLIp1FH22u0lFgH7GPc1a9D6CP2Zv+1+pdyMtnB8RnNKs7xXJdeNA4Vl6VKgIKPObhSL0VSHu6rtfNZG/QSerfoerYqGPxg4LFxn8XFVyJn8krncYHe2Ak8D9G5cccGthRkvaZJMgKXmbmtI8qaOuutYYYz9FGbZhpclFRWKECOHqcuACsj1v8T3NHYMiQ9AOAc2Ypcob4X52q/lSdIMLAOL9TuFKkM/flrGfs4Hu5KG82M6jykhpKDTwEKymi1UNoP5S5mYuEFW6X+n23dN+qUBLPiBrxMsulancwA5p8NlJH9NY9+hGTlO/t8trFYgynDjmwsaYvIMWevRYsagGcBOqVh6Qk9fKqnxFRjlBBHDqU9N7FxJ09OOakvmnaRh9TGMskz18t98rZgQrZLkFM3GsVf4J9UFYo9jc6TmFUgKC8e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWM3bGpoamtNSWNWcHNnZDk5b25KdHlUdVlSZzNYYkhka3BwNVFlSzhnLzNR?=
 =?utf-8?B?U3N6UVlrdm9CRytXWjY3OXRLV0xyREIwRE04VDhMcDA4bFFjVWZSLzJyemNV?=
 =?utf-8?B?UmNnZi9CQkNZT2szZjZza1VUcGU0VUFkNVFrT3hwVXFzWm5jbmJOYnZRKzgy?=
 =?utf-8?B?a2ZRRVBvbEZ0QnNjVjNqSkdzWG02RWE0a1lodmxhdG5oK0Z2dHRaUWdFK1Rh?=
 =?utf-8?B?T3NVNjRXc0hYc1RPTFpoaUxVaHBCZzJwcXorbkdwaFVsdU9kNXRSU0JEa3Ny?=
 =?utf-8?B?cmJVYm45RE9DR2xCSmxyb283VnhYQXpOVEoxOWtpZGhMMU51MVFFRk8vbTcw?=
 =?utf-8?B?ckh5SE5GWVFlRW51ZXZFMkpOeUx2cEMyM1YvOGhFWmg5QldxVVRYeHB5L3ov?=
 =?utf-8?B?V0oyNXZtYXdxQlhFVzQ3MWUrTHFPTmdONlg1TlpHWU9UbzViNWxrTHpFWEx2?=
 =?utf-8?B?OGQ0VG91Y1NoRmp5b0xjMzV0aWpRdE9SS0FGdVd1S0F0cHVQL0FGaVlXYmxy?=
 =?utf-8?B?K0ZxcEZldWxqT3lZclNuL3l2UnlqY0k0T1BLVmo0UytWQlV6MGl0U1h2elhV?=
 =?utf-8?B?V04vYk9BOWxSQXIwNEp0d0ZaNTJzNHljN2dobWRia2ltTkFhUEJMSFV5YW5B?=
 =?utf-8?B?eFAzTC9aOVNpNmMyNVh2SEFpYVhCNW1Yc2o5L1BBNDB6Skd4cVFZUTRzQmJJ?=
 =?utf-8?B?M081YXdGSHNXd3J1U1VrRzRaY2ZxLyszZDVZUzNDOTNzcTd5SW9haWxyMXhz?=
 =?utf-8?B?ZmoxSENrNWZvb3IrZnVuRmJidFpGSHEwNU4xaUxLbXFXMWdxMkZwaEF5Y2VR?=
 =?utf-8?B?RkpvNVN3bC9YQW4xZUt5KzVxSTA1TjliczZNTlV4L2N5NzZNd3E2dGN2bEFu?=
 =?utf-8?B?NUFDaWpJSmRZam9takpxQTMvV0JXTzlkQlZTOXh0VVo3bVJtRk41NzBXVXFn?=
 =?utf-8?B?OTkxV21CRTRLZXBFazZSbGpsUGE3SUxiWHhBNmpCYXN4K1lkdFI3L2ZiQnZK?=
 =?utf-8?B?RGppTVE2NnVpd1NPcHlsV2ZDMExKb1RiUzYzcEJvQkZ3dThIMjB3R3lxVS9q?=
 =?utf-8?B?Z296WWIyTnV3Ryt1dmM2eXFMK2Zud1VHMGVIbGlxS0ZOMTVNSmM1UWl5YURw?=
 =?utf-8?B?QWw2TzdCSko5ek40M0VmQ3dGdG1veWtJUVNEUERwZVY2dnVnYk1FQ2NJaEtk?=
 =?utf-8?B?TVAyUC8vcXU4bmpWWjFWczdHSlBUdWE3akhxRkI5L1VnOWJGWEFlZnZTMzNm?=
 =?utf-8?B?TlFzSWtBL1BUUS9HS0Z5MGtqY0piblBEa2FJU09mVWlPS3JtRHdiOHljMWpp?=
 =?utf-8?B?OHorT0FaUlRucmQvdWZtbWdsQTZGbXhQQUo5NHlSRkFCbXpBa3FocU85Tk5D?=
 =?utf-8?B?czZ2VkZGaGNjcEp1TVkvV1FXOUdYWkVDYmMzNk1VUklNdU56ZDlkQXpLWjVH?=
 =?utf-8?B?Nm1JOUhUUEw0WkN2QXRDYTV4aEFCNURtbjNLb1Ivd29BV3Zjc0xFRlZXYjNm?=
 =?utf-8?B?cmxwWHorSy9Nem9DUkpzODgwb25uSzRJYmFCTnZ6WmVBNDZSblJ3czNiNCsz?=
 =?utf-8?B?OEoxb3ROck92c1ZoVDkzcnRxVENBckUrNEN5RTIwdFhnRnFjRm1PQW4rWWlU?=
 =?utf-8?B?WWRUTHJEc0tUVElHSVNTS3RDMCtwQmo5eVViUDZmRWhYTld5YllDZ3l3VHZD?=
 =?utf-8?B?U2VyYmIwL3liNDFkUjV0ZkJvY0xPM0RacjQrcGZjYkhWckdmYU5yRlRKdFlX?=
 =?utf-8?B?WDFMZ2R2Ui9vVzh5RGQ3QWFySzY1S0orSHhsSWNhM1FwdmZ4ZjFhWlZPT2FM?=
 =?utf-8?B?N1IyeERsOTRHcW1OU3NTZjFyNmcwMVBXRkhUeXVJbkx4QnlvRXl2KzM2WDk1?=
 =?utf-8?B?OXlTLzlRT2dIQ01aSDFvQVRtdlRFRCsyMVUvcXVkSmRjTnJ6d0I0QVpHWlpQ?=
 =?utf-8?B?eEwwZXJDNUFXTnJURHRwajdBWTBoUlBXa0lUMFZoWHJneFRXcUsrUVdUMWNN?=
 =?utf-8?B?TlBYYUpWaFpZczEwWlpRckpiK1RqMjErLy9DL0dNQlA4c1R3aVVoRGdmOHla?=
 =?utf-8?B?SDY2WTZWbjdRbWQ0blpiRzVGLzNjMWZFUkNQT0oyRVg1Z2s5b284VEsvdDZW?=
 =?utf-8?B?SUpISG5XNzBIb2ZsUVFwUllMNzc4Rk4zOVFmZjNXVXkzZlo3eFdBRGhGNks4?=
 =?utf-8?B?YjJjYTZnamkrUjIvM3JOSWpZWC94VUJreHY5QTlCa1lIeDlwYUErVkRvUHF1?=
 =?utf-8?B?anBDeVN1UlhOSlFEc0puWlB2TUU1L0U3THdtL0pNMDRKN0wxQ1c0OVVPU0hJ?=
 =?utf-8?B?cERibnUrcFN5bG54VjloT3hhclJwV0xTemJFMzRsWlp4KzByT3lDa3ZxcU1E?=
 =?utf-8?Q?8ult+jDWa/VwG4E8=3D?=
X-Exchange-RoutingPolicyChecked: I7DltjlZIDmDm8lUdNctZqcocn17nOgHU2VggR9kJRnCwm6sFZcPS8kh/ZQ92Hc6en9UTKEzDdSI8ttHJwIhc7HH21GVRyWW5kt8/iHds1oQLgaHLEj/Dm5oVnj2iG/PA8m9JCb4mtzSCNjBK/+V6+YKSjklhwPSHKhbNEdka1y2tQq+EiTiNAUvwO6M6fD8objDiamumliz7PEto/BqVEsULPQOE0mH8uLTtJnU++hR//K2fgLiGHQHHms+3KmVhNq7FXY7nH9QbKUpxPnCGEK6qT9eFH7ug/j0d+rGAeQTieTy81/q/s104XhmaooxUFBQSChPGKWdEfnaq9Chcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8c03b9-3853-4158-0434-08dec085812a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:01:16.5638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VeYsDfeYUIfbq9AsSzcTThZPK+mlSXcRAo/1Mn5RqZu5KWyD7PSS9W3p0OsD+VpBS24NRdSABOwJ8D3NdxnbJJQqPvDmrToxYdqBsUHTFCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com

On 6/2/2026 10:54 AM, Andy Shevchenko wrote:
> On Mon, Jun 01, 2026 at 04:10:29PM +0200, Cezary Rojewski wrote:
>> Support for the WAVES module was not officially published. The kcontrols
>> are here to retain 1:1 uapi when transitioning from the haswell- to the
> 
> I'm not sure I got the 'haswell-' part, if it's a name of the driver, spell it
> fully. Otherwise it sounds like a codename, which spells Haswell.

Yes, the above refers to the haswell-driver, predecessor to the 
catpt-driver.  Ack, will reword.

>> catpt-driver. The catpt-driver is very stable and several years passed
>> with no WAVES users so it is save to remove the code.
> 

