Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9147F2F8;
	Mon,  6 Jul 2026 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330974; cv=fail; b=V/ETGyMFX6vSXirvIBBqxR9Y7nZs0eAG6Be0pnIwAB6aq39ST2Jbzq1ul91OIo1D8GPm9yoWBIFLxnhpsIOm0+JeIeXjEVpysRJzKWUNHgTxs0e866JtjOJxLYVD5puVuKL3EgQBHXKWyq/waX+RtkH9BM/E3Crd55TB558ZWMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330974; c=relaxed/simple;
	bh=mSEi9qUaR+SrDPW6Crijlo7X+TDMovTv75gGky/OaTo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d0/pFYiiHo/Rk/Z/oSX5jV3Vp2IAcnVYgalXznc+g0sq3X7S3JqDWdxpNUvNr00bxZEYZLZ7u6mwB7mPyexKXb7trNTTzKBKfXIUZ1ycCy25L7yQvh35ao7z9OwL0zrYYGLwzdYjqLH4VEWIDgUbxDUSP+6XYLd7/2VVJ0JzrYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVt6ro9Y; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVt6ro9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783330972; x=1814866972;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mSEi9qUaR+SrDPW6Crijlo7X+TDMovTv75gGky/OaTo=;
  b=ZVt6ro9Yt8mQXL4V1xB7KhDCpAAtKISnZAVedM35dEsv891oh73PTvpP
   IwR/qLJES7zhwZ+9EW5xgYoU6wzZOR8w9PYXncme8ZE2/q4NyTLWBF5PI
   dT+GH43t8gMjxIqHmOEiwQL+bc1ZgrRy6IJ+dfrJStWoz4e2kP4SZSETq
   1ySYg1j5fvEEpx0IjuGSt629tAcZP6x42V6L1Eaj+io+OnPYxh5IuXXza
   5m/1xYu6fEzaXgub4yzZvJxd4VhlI8X1CYDPYIF44D8cYgP+P79JqHyC2
   iYtnYl9fC6edIWdeZX4Ro8+sSFsYaerBTPHPeMlw8bFw0Z9Ai93O6daJE
   w==;
X-CSE-ConnectionGUID: aj6jBBbyT7Oo+//Tr66HQg==
X-CSE-MsgGUID: LKmxAKGUQYuq8UZlgT00WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101507107"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="101507107"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:42:50 -0700
X-CSE-ConnectionGUID: uoY03lWERrKl9gI2vZ4Jow==
X-CSE-MsgGUID: C0hlJZkQQ/6rrNbAlXnphQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="252592336"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:42:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 02:42:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 02:42:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 02:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5NrNwKdINVtFGdkz0nX4xBUwfIAUMMUwq/5mkqFoPmTF7l7wpKUs6dvHoAu5IyPW3LsY1MwhMDcaX3BfuEzhn9JrYzgWcqX03o+6cjwgLj8tFzl+fMPZQCuX/Abvlc8cPJ50BaR8/woBF1Wkx414Q/kTmBNDdkh1yHTz5DAO77t9WUSVkTpvD2/cwGnXwYdD0K+FYPeznXUlIo7EmMP8OuykfMKpOnH3AdSRYGSu4IZ+tFDQG4od8G49lth6cPJdPneswBX7p6J2ywpi7CIdMe0Uy91OoSCdqQY/rqJymJ7SjVqROCtaD0QvIemNKvDbDawfnFDdOfMyQGkOjQ7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lY9mkrMOxaylastlttAb3v0YV3aOB641zOZukqyiM8=;
 b=SKrlWEQeh9Z5ewh8LV2ucQ5890WXvkLE5IGjN6/Wqz9ECwDxIQDkzjWltZsddwXZpViowmWIEf+JfqQlbGNuPn8qMtOHxMkRZUybJL39koJ1j5o5bYX5inLGZq8OqZjGoLpF1uueuzx7Fqh787jG1YizsEjRX2BMgJRy7kLa24CUX1izv/IwJKqr5e5VmA/MQpvo0p3o4PIMZ0omz6Mkj2NLNkJjxZuiUHHvr2ISfxmKYx8icdgSwqio1XJi6sEvGKoj/CbtDVGK5Ryd3et5xl6wR4ZwfdR55mhyx4nhyAkC1nlNlhcFTqJl+hchIIsduwOj8i1+Vz00rfy6x5Qj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 09:42:47 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 09:42:47 +0000
Message-ID: <703ea25d-6c74-495f-8d0b-e48e5868a96e@intel.com>
Date: Mon, 6 Jul 2026 11:42:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Return -ENODEV instead of -EFAULT on module-get
 failure
To: <phucduc.bui@gmail.com>
CC: Kees Cook <kees@kernel.org>, Dan Carpenter <error27@gmail.com>, Cen Zhang
	<zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>, Mehul Rao
	<mehulrao@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<cassiogabrielcontato@gmail.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260706084950.49331-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0034.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34d::10) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dce8dd5-0a4c-492c-9efa-08dedb42efaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /KNLNtbanMtEcaYEDDyaQKwuu5QKt/jE9TUHn+upB9YZQ/AdtkOAm8Cbeu0RQBJIUWUcPyw29nspgjgk/6qedefSNgJ1qjclRgTwOmdobOFxPPqefu+H8Ww9uW7Jp+YS5C+H7Sbru/9wX826jF8RakWjTrYcPgcISh3fqrmbPlpvB+Tl9PDrnLfCG2cMhU2wRXg9B1i4yegoFhjDjdWvxRyY5QJhvAYHyOJAXx1EGrlQaK4OimTt7phuVz9K/H6Rl+mt1lMv/e/2sAVtSYEZk33PfCKM3ScrGAkQQve/zRrYplZxY8xrBsx1cHK0g33ErNd13+uxBHEBquWPd8ZGDv/MeDAy7mEJtdQvWYbi6y2bnZkCVvkbMazANEiRkY+/0BBbgp9/eKCp1n/ucmZgUPOnhLXsJoNPqWCTh3IU7gf03jaE0UrjLFu+qJgfdm3j7WFKUx4zXaGnxWeAZkRLbcOmzm5MYQV4hvwOd+WCFn0eaO4FQ8UFozoMiiDcps7of7pIB/31Vx5u61spk3hbVZUHp366Kz5HmgOpNBmvKtieE6DNn4g25zqH4gC6Y4rwf+DNDVIlCAQb2XOF/T9IHeGQX78FKQJlXcbJ7pIeiRNLofIctxnFDYUtMnZyRAMVFuS1U7y/Dshln9WckP9XaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0cyUWpBNCtvZWlDSjk0REFrczNVTWhGbjM4NlNkaWFZTmtxbXNETE1WdjNN?=
 =?utf-8?B?U0pWcngzejl0U2E3Y3gxQlRKT3ZFUUMxRGhSa2VTOHZxRDl5NFR1OTRpd0hV?=
 =?utf-8?B?Qm8rUGx3a1NDRWJWQUI2V2xucFE2dVc2cjRLa2JDWVFvM2xJWFJuWHIySk9x?=
 =?utf-8?B?a040UmdQR3BVc3l0L3lxUkhheEhWTjcrWWVXbWpqZkZZSmkrQUhOWVRRZVds?=
 =?utf-8?B?MXNDYzlSU3lDTkpPbkFrN1BMSDNDaVltTzBXNFdxOWpGRWlQSHJBell5RStN?=
 =?utf-8?B?RWRsSFV5U2N1bG9PVGNnamcyMVFHZnVSMEd0RnNsMll4VmZxOUhyK0UxRG5n?=
 =?utf-8?B?UzVvdC9id2JoSXprM3lBWkswblhBdld4WGhzOTF2dWh4QmtHMGp2UEtCY0Qx?=
 =?utf-8?B?RnhveHJNSHczRTRHeHJXQUhTcjdTUTRsMHpZdVBnY3c2Q1Z5QnhSSVFVb2Rj?=
 =?utf-8?B?NGxIbFdKVSsxMzZWQ3RXbXdCNXV4Q1dNZk5LaGEzL3hvWFROWWVaSEZzOFBG?=
 =?utf-8?B?bm8zTkNUeFN1UFZCalp4UVVDZHBNOXd2c2ZRSkhmZXZHL2szbnJyelFJdkpl?=
 =?utf-8?B?NExkTENxWmFCZkVsZGxZZnZMUDRscTBpbHNsMDZqQlRxWVhyaWVReWFvb3ls?=
 =?utf-8?B?RkcrR0ZKUUFpSTFZSUxwZVFob09abXZYcURKS2VqQUdkWXZtbnY4S0J4VUVZ?=
 =?utf-8?B?YURMUWZzM1FYOVdTUTFLUS9XakcrVFVvdllFU1pyMjU1UFd0dXlHL3BmMCtp?=
 =?utf-8?B?QWZjRDJFUk9jUlU3ZC9iSVdtQ2ZvaURNNlVDWmJQMEhWd2xLOVhOdXB5b1lI?=
 =?utf-8?B?SjZzdytzTi91RDRaL2pZZy9XS3pmYXJ4eGJCaXc2Y281WVVzVHpjQ2JORDR5?=
 =?utf-8?B?MTB4SXhnMnVJWmVaazNqMWxpdDRvN05WaUY3M3Jka0VzT003RUJIYisvck1Z?=
 =?utf-8?B?Z0gyUFc0V0ZxMXg4NDgzNEEvSkQraW1IUXpYWXQ4OVFTV1RQMURuUmhHTzh0?=
 =?utf-8?B?QjZhSjYvVlZBampGREJNS09SS1daT0hFbnE5b0xmTWR3dVhHZy9lREFnZDdW?=
 =?utf-8?B?SFZtTGJFbzhUZmZXNmpSZnFUY2p3OXhIV2VJa0ZLVWd0dVFwamIwTEtOcnpy?=
 =?utf-8?B?NWo0RU0zYTBaNTdvSnhhay9lNWFmN21yMnRRMkdQNWh5b2YwME9iZHQ2V2Zm?=
 =?utf-8?B?WWcxcUJmek0xWUhpOFJZR3dHTCtHak1pSEVNREFmQTNjQjE3VjlEVk1FWmNJ?=
 =?utf-8?B?Sjl4UnQ5SUlRb3NIRGFQNXI4UkQwbCt4Q1JlNnpXY0JmZy9xcHdOeHlEc1FW?=
 =?utf-8?B?eFpTZmkyZGhDWndWaFJkTWE0OW5idEE4VXAxc29DOUZXbjgzR2ZpNE5IdCs4?=
 =?utf-8?B?TEp2Y0hZZFlraHNQWjdmdkhjMkF6b2VIL1B2bG96UFpMZ2t5ay9VQnZQcEc1?=
 =?utf-8?B?bXViaThBQ1BtbmdWeEoyK2RhVmhrRHpJUFNmaUgzYjdmWHplTHFFOU9nenBR?=
 =?utf-8?B?L0FjT0NnUS9LMEdJcWErai92NUFTdS90L3lMTGRsSzR0QTQ3NHlRUFcyemt0?=
 =?utf-8?B?Qll2V1hhcldVb2lYUXJuUkkvYkxMOXY4aTJuVVJZejhRcDVrRC9aRXRhV3Uv?=
 =?utf-8?B?eFdRU2FZeTZ4c2oxNGZUKy91c1dJRmdzODB4QVdJdGVVT0czV2dsWUxIZGZK?=
 =?utf-8?B?dm5xcTBMbVN0MFpKaFd3UU5PUmFMZTdPWSs4TGdVUk9ldzR3NmxLZkpLZDFv?=
 =?utf-8?B?bnJET0g5T0FQZmI1QVozWTJPSGVPRDFHbFY2eS9UMjVoU29adzB3NjcrK0tz?=
 =?utf-8?B?VXI3TDhlNmoyWi8zbkg4R1ZuZzFJWHJYVFBzakYwZjh3SnlrMGxOZmFDc0Iy?=
 =?utf-8?B?aVNLOXZnY1dzQnpSVUoxOHFhTjk1WUhOWEtTaWp4TkF5dzRybmw4bkxXMzFu?=
 =?utf-8?B?OUpRWGp0eU5HUVRveDR1RHA5eDNUUDhxK0lubDJuR05VZ3AwdGd6TEVHblZv?=
 =?utf-8?B?TS9ubmQ5YnBWU3hKNHZNeE5DS3Z3eHZLcjFoNDRiblQyTVVxTU5Zejd3enVC?=
 =?utf-8?B?Y1lSeUgxZ1ZYZnBHYXdJRWZhVEFTYnlybExrbVp3cXh3T1kvVm5ZQjNFR1Bn?=
 =?utf-8?B?Q0NwbHFJMnlwenh5S0Nhd1ZackJVRjJDN0JmS0tIR0h6REp0a0VNN0FFRWY1?=
 =?utf-8?B?V0pCamxxbkZkWGN4Sjc5RXBpVXN4OTcvQ3lWL21wRk4vWjFVUmJXMHZFLzVN?=
 =?utf-8?B?MERSSkZTYzJ2QVBhT0NnTk44VnRZVy9IMnVpKzlvQXFpWG1ZeWovYlJtUzlU?=
 =?utf-8?B?RTV5M1llL0VaRWpNaU01YUh2WWNSdDkxbHZVdUxRMnFIN3BYMFhOR2s3MjhM?=
 =?utf-8?Q?DvxzDPxaRGuLQxnw=3D?=
X-Exchange-RoutingPolicyChecked: AT5Zq/Zt2ZUbt8eto8+aEeZ4Hq1Bz0YtbyPCORE01ovYhjVDAc8zcEegijThimcV/orDdlAWCD66Yb35NYe27yJLgxXyHqItiADr7OB/oUdbYjB9lG0+vM4Z7kIfcna1mkry1IVCskm8VOHTMTTg60AB6S2r05nfGZA4WSzM+8DoYMIssLt9QbJg+mdq/ZsO9JwKIK/ciXSB872McF6X7X9twr11iCXJ5Nh99Y6lBZB4+kDzQK3XGYDHJAMQ9tXzA7dRzJ4WmpnXAnsxe8Ap6Sa0uMCCiciUMy+t8j762b3SWYJqRQTPoFkFicao5d45e/fs+xtPk3XvduMUoLiPeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dce8dd5-0a4c-492c-9efa-08dedb42efaf
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 09:42:47.0901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtmFpzwwBpANCOehw9o/phOB7lf0/YUK2xP9dJbVJlYb4W9mbHCdQr4JoyhoOIEnKWbeeePL4Qflr0cpy70pVuM6sF/2rgAZ8UpK7/ZSArA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
X-OriginatorOrg: intel.com

On 7/6/2026 10:49 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Several ALSA open/allocate paths call try_module_get() on the owning card
> module and return -EFAULT when it fails. However, try_module_get() fails
> when the module is no longer live (i.e. it is going away), meaning the
> device is no longer usable.
> This series updates only those paths, making the error code consistent
> with the existing "device unavailable" checks in the same functions.
> Other -EFAULT returns are left unchanged.
> No functional change is intended.
Changing a return code _is_ a functional change, so the last statement 
is bogus.

Now, there is a benefit of having a different error code in 
try_module_get() case: easier to find the offending bit when viewing 
logs.  All the functions in the area have rather low log-coverage so 
distinct error codes help.

Regardless, as you mentioned, -EFAULT isn't exactly the right return 
code either so the direction of the patchset is good.
