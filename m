Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D63E171C;
	Wed, 12 Aug 2026 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527340; cv=fail; b=iqHfkk+WBnwHMqIupwWF+zCdBzkhW8PSiexj3vb8g+SWrjruhaPa8s+lMlfm3WwFEZVCSRr7pQeH4S0nFXz1dQRhrh0OrT6ZpRMczG6VGuE1B0/DWvkgaZdL0ocL9/8olCMX3jKGcS/Y9s1Ae4z6CqTRDuVEVj1fEp7HzFLYNAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527340; c=relaxed/simple;
	bh=F6fNcRYMSWGVUPtsxMlTTbG5a+tQpHqRp2xvEYjlYkM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hTRiCV0x+26QLTn13dpzR8BXVzWaejWi4xe7HK6NlRz+haNtcWr5myw1fLolc7oOOpPT/t8Uw8ph7WSjZc8ikJRO2urnU4hOkyb6tMiCerMUNvnX1YJJc00UiOWQCxd1jAob6aljBOS1VvQhgUOzGbFMjKc647OmmPLKV8mOCUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmpt0vmi; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmpt0vmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786527339; x=1818063339;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F6fNcRYMSWGVUPtsxMlTTbG5a+tQpHqRp2xvEYjlYkM=;
  b=Cmpt0vmiCMN1ACn4QqJoPx6kKFbZPObGgxFy3ythoPXwEFnR4XZaPy/U
   RCnjwEUKeI1vfOC+/Q0glzwY5Iakn4hRqbhtkhechyl1beOmSa/vzjH3A
   zewqYEAnHVKD+R8dxTXR0iuL17x7lxu76qCJ9IYaNReVAWH6fQ9alKn3x
   aRwUduyDCq0+Mpx8kHqvxMF5pExkoOJcLK+ohkj+OvJ2yxEHAfhGsDMvB
   o8zH1J8GOGUYzuRqIFHDn2w693EyrkInoCKcEEaMaQ0p3DxLIhzd7bcHp
   vgIjpKew9tfQeGCoTTHe2CTRd52Wz1SGN2tYrnxsqOWhRYBUpC7gJF15P
   w==;
X-CSE-ConnectionGUID: 5D7Zu6J+Q4KUJEcQpgT0oQ==
X-CSE-MsgGUID: bZ6jsq9aQXay7t4FvLaIhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86032556"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86032556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:35:29 -0700
X-CSE-ConnectionGUID: X+oqlv9EQ2qFnU+U7txRpg==
X-CSE-MsgGUID: U96gAtsRQauN879Ykvy+ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="293533228"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:35:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:35:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 02:35:28 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEWMFRtSIDS9EOwZ+zHbkytLUOuNBI/HbyR6THvO73Cg6MW/s/KQZ3hU1klTcKwe1JWC7B7V4tKtRfMtMaIdBxXNMY6QiNMUm267km7dBctt3dp1qHiZCj0qsWjBVOcQyNQY6jpvRgiXJ+f5fknEsMGSq7S8OuCFhU70BttSrRaTPUwrIfCWgI2MYuQ4LPQ/3Kowl4hO/LoEBPcvuOlGq8uES4Eva2Whtmv8Qu/sJsz7GPC4nO9nGKFvMM3eF090+ywe1EbBl+XFHMXP6WqICjI8NFBm1flL9lfBW8RO5L/kcstJ6LR6dO2S4bCDsB+S/fINAuQTwvhvRISk5aVjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXs6zBXNRlIBcdk2cN4xqzqN0Q+aJIGFxmiJj/JAzBo=;
 b=Ys6+XFCeUZP2SndjERhPqaObS9R2MHtA7H53Gu9BLN96pAjWudBPjiIPBz4skrzclVs45HjOD4XHFkKyDVIIawwvpzJal6+55FkoJMzwELkwLKZ3oOo21+g7c9c9fXkwOAEQxzNmD8ydv2J9cBRUigDrIX38IDtUnVLlpldgX1ulid013aoyHgddc5PVm9STx9+ynGTyLAKAnZ7mW0GchU/fWmzTQC9fg9sGT7KyQC/3h/jdGiv8VN+EVTBQ1QsFgkyZnOXbbEn4Jn/ZDjt32AV6BKA/Q9DJT0EduBjUTW4FrHUPcj5EM0k2kHTYMVTdebgCTaYqcPefYo7OpE1spA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by MW6PR11MB8337.namprd11.prod.outlook.com (2603:10b6:303:248::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 09:35:26 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 09:35:25 +0000
Message-ID: <6e28bde9-b43c-48ef-9449-27e5b3213220@intel.com>
Date: Wed, 12 Aug 2026 11:35:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] ASoC: samsung: Improve probe error handling
To: <phucduc.bui@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
	"Mark Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
References: <20260812085133.29658-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260812085133.29658-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008A3.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::654) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|MW6PR11MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: ceed3b31-8a20-4f52-5c08-08def85509ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|10067099003|56012099006|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: dDGxDqG8n2WJio9gvLh9nK6o4hOyqpwDYB+TmMmnqzsxea5ntZOh5rC+OXvbFj6LJ/Y/fvXTjlYjfgVF36Ar1pplO+e0fpl8PbTFNo3vN+mXjCsrbZdsVqgVHjmpLzz9Nx3AppnEY/3juRhfvTTVBIC5DEWJ+76jn2NVZReYYE1p7VQ/MaRi5wxSSvcqzEcn+RlMHGOhJxUUZusb4HjdiII5wVuCYTsiMIqomXDYDX6C9N/hEPlVboapvNJ0fDYayN0p54ruaxHo2oAfeTj3EUfgv2hw7NBX7qBU0v11RVnNsxl4uRFC68VfzY/6UrY9YIK/0VVD5rOn6Nf5zaBhCXEVLgxUoedLIcACqi/Got6gMZV476iQ4315OjR2RFQKFnesVMwyeoTeWHTAEA5LdoLkFbinnBsR4RKhsBRs2+bPmwe3ijh5mC00v9gWWuH+6cJjL159dmLDBnxBe7b7nOLQnSjU5H/boY8jdz4y+Z4B8X521QiWlfocrNLqVh21Ht8SyI9/gj1R7w1cHfUMkOgwqnRKEWvWUbRVjwCuLYFduZECE7NUyh/iq5TIOLIGpvghwiADZ3BpBKXIkgyqU3p+BLUgz5HBM6v023UEF9TLHNJ5PpUJrBLqrMrGJN9R76STzi+EFdNTLOGB6kWm3hxVq+dL2xJxMcyY/g0CcsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUFNWlRPa1hOa0UrU0Rtc1B1VXVhL2JXb1UrS0xqU3dQczRpWlZUb01EV25W?=
 =?utf-8?B?MytCYmIwOElYMkRXc3pEWXNPaENIYnVWZVJtTG9ZUmhoLzJoQWpTQzA4dzQz?=
 =?utf-8?B?eUxMdndMcXB6eTc1dGF2dkFGeFpLcWdKcmI1REdVeURjU0E1MndQalFYSzcr?=
 =?utf-8?B?UjlzTXRzUEFJL01iMFY1YVF5SkxGd0t2NGg2QUdIcHdqRVBVdkJyMWI2M2Rt?=
 =?utf-8?B?VHl4WkJxNjcrRWxnUGdHZXdUQ2YvQzZSZmhiaE9TSzU2d1NRNGdmVWhUNVZX?=
 =?utf-8?B?UGFMMDZTZ3JGQjFTYWZReFRhc2NudW91eUxqYUpiYWZvZXhNTG52ZmQ1RThj?=
 =?utf-8?B?dWM3ZVp1LzBFcHNCUmQ4RTdJdFdYNXJyQjk0RnpMczVOcys1NzhHY0hCcFd4?=
 =?utf-8?B?bkpFWVJwTEpGVytyRm9Bdm1OQVpzYWd3UHF3U3N1UnZmMkR0UW9ZQTh4bTYx?=
 =?utf-8?B?RmlqaysvN040a2lsSGhyaS9VaGtnTkdObGsybzIwMGdxeUtmK2xYdnkrekRq?=
 =?utf-8?B?MFRoNVh6bUhzYXRHY29nb3ZPdk81VHJKdWRwWW5Cb0g4ZG9OUGtVcy9Jek9E?=
 =?utf-8?B?VEdyQjM0eWxZU0JiMG03Um50TWtOaExlRHhiSmFBY3BKTmZadWNFYmRRODVm?=
 =?utf-8?B?aENkUVpyNUo0d0VVWHhRYlhTTHExMFZzb2MybXduRHNpWHEvTmk1Z1VQRU9j?=
 =?utf-8?B?MnZmRjU3K2JURWY4UFZmdU92R25YMms1ZUpZVitUT3ZEMGN4WFVlWlFOb1lL?=
 =?utf-8?B?WlJLbW9WNkNxbSsrREVKODE0WlgwOUptZ1Irb0ZQOStqdmZXRGpIVHRiTFo3?=
 =?utf-8?B?cytqaUQ1bXFBcjEyMlRHejhiMWZCYU04RUs0ZnpMdHo2M0JMZ3VIazZzRnUw?=
 =?utf-8?B?M1loSm1sZ0ZwTmszK1gySCtHdkFFKzQzTGQvNnI0WWJEOC9wODk1K1lxZ2wx?=
 =?utf-8?B?TU52L0RkVzJLZEdvajNCeFhJaTNrQlA4RW56eTRsNlM3MlZ3OG0wZzVlejJ1?=
 =?utf-8?B?dmg5RCtGZXI3WndSYmt4Umk0UG9SYlVMN3p6bzBaWnd0dDBrckhiWXJ3Zmdt?=
 =?utf-8?B?NDdYT0hJOGVIVFZpdEVrYnJDVWU0LzB2d0QxVnVINzJHdmJOMG5PTC9HQnBB?=
 =?utf-8?B?R0NPTmw4VUVGc2RHY1krRWpJQWlJT0ZvNWY0eU54Z3cvaFQvQTdqZG5OcVIz?=
 =?utf-8?B?YVJYOTZBdU5UQ0plSExYY09JdEEvOGtoN1gyQ21WZWs5SlF1d0p3QnlNSGli?=
 =?utf-8?B?THFvNDBiMVNBNG5YTGJhbUpUbzZmRDUwcEIrLzFnakg1UWlqQkVGUEt4L09I?=
 =?utf-8?B?T09EZGNGZEEyM0lPSXVJemYzZ2VhQ3grTkI0YnFvNVpsWFdRWlNhSzlheWZj?=
 =?utf-8?B?bDFrSnh0QTlDR1lMQlBmNWx5MG0wWGxpTXVLcW1IaHYzbVd2V0E4VzdFVUxI?=
 =?utf-8?B?T0dHM0UyWE1QSzcwOUxWYVorTDlQMGszR3E5amZZdGc3UHA0OFJjU3kyT3VW?=
 =?utf-8?B?cGtTT1dXcEdtd1ROQlJFcFJla0NERDBvQndrc1FHalZFQVhnWEl3TTlkb1VZ?=
 =?utf-8?B?K29tbEN0bzlpdTRHWkZ5V0FaZGExanAweGIwMEJRU3hQTlJwSXRDT2dDWmJZ?=
 =?utf-8?B?ZlNtTy9NYkNPZnA0MHhBL2c0RWkvUEV3UHV0MkRIMEhGcTlpK2kyMnd5L2Nq?=
 =?utf-8?B?YjBwblhZdWlBNEpzeWNJMWlSMWQyRVd3Z3pKZ21kejBod09vT212STN4VStn?=
 =?utf-8?B?SFhjTmN6K0NacHVwV0JLdmhwM1pwdER0STJFeWlpbzF4Y1JlUTVHaldpZG50?=
 =?utf-8?B?d0hWMzllb1E4YmJNMmIzMVlNTzIvOVFrRmNlWW5mQXkzTnBvaHZvZWYycGt0?=
 =?utf-8?B?T1hvbU5YWmxEaUhYSUUrVGxTRVFMYlEwanFSSFk0bXpOd3VJM1pxdjIrS2Ev?=
 =?utf-8?B?Rll5djl6UFF5NHZqbFpORDEzTk5LdUE3Mmc5bjloVWpCVld4dG5PMUhkc2FN?=
 =?utf-8?B?RXhFUWZTQUc3SVRGRW9FbW9hRWFiWEIvcDY5RkpzY1BVSWlJYTRPOTdqMmRO?=
 =?utf-8?B?NmZucTAxYkh4aEdVS2ovL25kTTVnTGdqUmhCN1lteEhtNlRtalo5UlFURU1q?=
 =?utf-8?B?TnpMZEVpd2NMdHY3VmZ0bUhLRG13VzdydythdW5UbXlRUTlmbzdSN1ErbnYz?=
 =?utf-8?B?VElINGY4czBvL2lMQVBFT0x1VEtEUlBUemxvQUJISUVzdGtvTWcyOGx5aU9z?=
 =?utf-8?B?SXJERC84Z0picnI5Nm5JKzdXeC9kK0ZCcmpmMHc2L2UzQVUrWVljVWxtMnRQ?=
 =?utf-8?B?VEZZR0JGZUZZc21TVG1keG5wdWMxRy9ZK2p1S3hvSDQ4NVB0OFhjWlBTYWhY?=
 =?utf-8?Q?UD8xGXnGr06jVpdk=3D?=
X-Exchange-RoutingPolicyChecked: NIjAkow2ZTUiGJdczOKk14/VFfUckz12YySzVvW0LpqaiQlQ3xsPw++TKYYiexuTaaVSvLmwucvZrQ+HYjgpX5KU817Idjm9eSO1WmwMvj8m3sqyLfvWTUTrcXGEtyuGPMnNebrpXQ6cR1FbsWPw7WNwwMGTke4ONp2k+tONUr/Q30cYxR21pGeahbPcauwKViQMtV3hD/+J44hk3gdZskqEPZ9uKNTXxBsH/Ry93TBxux0pTOF79nv5SI1628yJ/5soLn0W14Cw41k/o5YcYGGTOR3cVyZM7Nupl43436/ng2ONvbQM3J+8ESzDvPc7/vEQllWoCC80tDLVlwbUNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ceed3b31-8a20-4f52-5c08-08def85509ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 09:35:25.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+otePEkjAP89iKIu6Ev3yvJq76d4NIPXMmXNELwFOw4Of6Virndcr8ainVT1EENUf7SVcfDREtnX76whukIOlXs4xBgvbJth46rmvelJ54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8337
X-OriginatorOrg: intel.com

On 8/12/2026 10:51 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series improves probe error handling in several Samsung ASoC
> drivers.
> 
> Preserve the original error code from gpiod_to_irq() and use
> dev_err_probe() where appropriate. Also remove redundant probe error
> messages where the called functions already report the error.
> 
> Compile-tested only.
> 
> Changes in v2:
>   - Add Cezary Rojewski's Reviewed-by tag.
>   - Update the commit message.
Thank you for the update, LGTM:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
