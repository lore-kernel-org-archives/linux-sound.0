Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9983C1C5F39
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756391589; cv=fail; b=GXr0SQXTYG6IJ3OLPYDPghCaJNBBxwU5/zQxhI/9ARwq+XWE2FnWg7X97opNPnrVp/nevadA6lhy/fznmtGhjHirZrrucuhQuQdLVjbVbRoWjj8tHsy/DwHpToe6c7szfrD5VgZKMXIWE8fBnZhd/lo0VIBqUXm/WayL/uBi4zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756391589; c=relaxed/simple;
	bh=ACMjIsWuPmiJwRlYND5PYiotTxKvVganNo61AKKGp4E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZabK1XXgSYekX1u4jnSmpqCARlyS8UTlmkgC0Rp0vaglO29MbeCz1Y8OQ/ZCEFNHW8bTxfN9QSa0iinPrmMenPds1XTBelFytgKl2y2RDq4wVzk6lr6g18jsijryue5dNUDMMfShB/63eaf2CFDEfmo0y3Zwz2C3Rafg5xv2WwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YS6pQ+Al; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YS6pQ+Al"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756391588; x=1787927588;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ACMjIsWuPmiJwRlYND5PYiotTxKvVganNo61AKKGp4E=;
  b=YS6pQ+Al/VLaVGw3aKsbk3JhFdSZoVbr3cLMqdMDwtcIEN9tSEClfJGw
   SSRC6aJSiUIz6HQRHZNO4NEup9snaEbEaEH+6LDc4Ndu7XJ3+7HyIWTlg
   3LGYbWrGgmFwkjQvA8BjcPDhrUfR3sB71rxR5iYJCoKnnh+1wqk9PAxX+
   TNIIzG4GHdlCorAvut5ulrV0JtXD0SkD5Z2LzwFyk2RQOUfC8CzzFvtFd
   ep1wocpEm6DA23wMI0oFlv9MnPNSNOt91W4kB3hKv+gPARumTp3xs+IJw
   Sx3aDMzG6u+cirTsXCDSbh9Wr5Hs87vES0kviAoI0837XBDJFxgqhXHqk
   Q==;
X-CSE-ConnectionGUID: +0xGa01kSquSC6Cmy3JB+w==
X-CSE-MsgGUID: Ubza0+i6QPahztCyNsJsQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69758487"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69758487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:33:08 -0700
X-CSE-ConnectionGUID: pOB5SftYTISjlphThbkRDg==
X-CSE-MsgGUID: YXdioNR1Q9ibHJ6givNurQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170302623"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:33:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 07:33:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 07:33:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 07:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwrzVdJJaOoZRwNiP7rSHAfWk3l8998Dd1/sGNstXyHAJFvhYxmHwnslAp/vFLqH5AnI7rilwqpptxbFu7EUridMskO6fUKJGH0B/cLKTssMAPjC4CU7kaw2yJhRfyBD4Z8LlUiEtV94pZaPGQ4xXrP62it6z7JhFEGHKJgOROwAelDzlGIUmq5J3Flcr8e8t2nn0y6I3LuIE6ANTLoyc48DhGM7cFSO+csvKlFIs8d0wAJJg+38U/sJcCubPpMtFZsL3l4gR1uC9jtTYQ8l/kb5IJyqqaG8wteRzUqoygJRMUK6oBIUXSX1cw2AMROcPk9X37eGE2XvEg0FWLZ8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/EIVnGp3/42+HzdwSz/Um6NfCUlfbDKhhCvvpZGmSI=;
 b=aspV7oHKd51qz3uQjTy6/ZQ6igf+qMp065zP1q/U7HoPva/EZXi+DEZW3/E6mABt3LILVP611TlO/Od7IBvaPiVatB2J/L/nqqiqrhe7x1xQWYDernP0FCKQmq2nRZ3OLyo1/f2ZqBvLGkHG0c5ynSKC6mMq+k+IZ74vtj71CObo9X3GcVgn9M4X/FgLdRH4MM16WQao21ws+fTUv4jv1+SsbABkLYug25ufMCasv2m9H9XrwUI5ivogc7+BhRH5wuiRLM9eNvhNUcLnhrZLA5bylklSbpWfEYtwJIYv8YVaGFr8zuhHG+Jcb7DWjXzszWKjQP8rwdXJIejXYPg0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SA3PR11MB7527.namprd11.prod.outlook.com (2603:10b6:806:314::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 14:32:59 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9052.014; Thu, 28 Aug 2025
 14:32:59 +0000
Message-ID: <2cc52df0-9970-4d8b-899b-fd784e2efbe3@intel.com>
Date: Thu, 28 Aug 2025 16:32:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: Avoid binding with SOF for SKL/KBL platforms
To: Takashi Iwai <tiwai@suse.de>
CC: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
References: <20250828141101.16294-1-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250828141101.16294-1-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0219.eurprd08.prod.outlook.com
 (2603:10a6:802:15::28) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SA3PR11MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbb8ded-c856-49e0-a43e-08dde63fc97e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXFhSkEyWXNZS3NiSTVsUENqSUQ4Vks1NDNXMklCeExCU1QwSkg4REpQRlhJ?=
 =?utf-8?B?N3hhblE3UVBmQUFZZkJGcWsvRy9kdG9MelBJNkRRWlRSQi9kSUo4azVYS2hO?=
 =?utf-8?B?eG5sWnBSSUV5Q0d3SmZWNmFScUpicGZFU01sakxwRUhUSEl6aHdOdnFFUEFN?=
 =?utf-8?B?OWFHNzg2b2psOEp4TkRlM211K01tdWxsNUhUK1I4eXBra29nV3Z2UkZXajJy?=
 =?utf-8?B?WGhma2FJaFBwS3ZPR205N2NCNlFTVStTVmlaMmVBY1dpQzhaVXhXTkxqcGpN?=
 =?utf-8?B?UHFQQU9naUZXQjQvS2Vvc2V0d2Z5VXZYYm9GOGkxTHdnT2s1cC9EUEl1QTZp?=
 =?utf-8?B?cENvR1RQQ0hvMnZSeHRrK0srSk4rUHdHREIrMEZsa1RXMTJGdHpxaEdnUm5J?=
 =?utf-8?B?ZGp5L2FybzhkbkNzZms1cU9jcFZOOVcwWW4yb1JYZHo4S2NHZSs3Q0ZNSlNQ?=
 =?utf-8?B?bEh4a3RzNVVWa0JqZUE1a0ZFMTFLQzhDM0ZLZnBwVGJMWnBFbllvVk5VNmox?=
 =?utf-8?B?QjVlRGJFclpHT0VWMnh0eWEwWEI5aDlaNWRoazNwTEQ5cWhhSGZ1NkRxTnpn?=
 =?utf-8?B?NTh3dkRaN0lSNVFNQithaXI0UDArdHhoaWxnaGJKWmM0ZGdidlc3eXAwdDNK?=
 =?utf-8?B?YXhVZkhWVWZLSjJnYkt2STZhWFRuM2JDSFZzcnN2ckx1VmZ2d09zbGpnZjhz?=
 =?utf-8?B?dHhaZGxUaDhVMmN5UmVxYS9xdHgyT2pnWUVaSURsckpySkF6ZkJRYXVUczhH?=
 =?utf-8?B?cHVsNHBlT1ZITENJVGl2OExHMnQzNlhPWEhGdk40QlhvRUVRc0IvNDNtTk5E?=
 =?utf-8?B?VGE2ekRZNXdJeCtRMmUxSGwxemhwTmk2d1pYRXVudVR2ZEIxVnBzQkgvRG5u?=
 =?utf-8?B?STNGMHFYLzliUmdWZGFWVUVhenExMmtuei9UVVFBRSt2ZGsrcnlRTXRhMG41?=
 =?utf-8?B?MytvWm1kb2FONjB0bm4wZ3hSNVJkbm81dDBTeCtpbzNycml1S1A5TkVXMXov?=
 =?utf-8?B?S0t2TmZyWXV1TlRXUm5QUlV4UnE5T2grME9VOFdUTm1JRG5qYk1ISmFBWGMw?=
 =?utf-8?B?WWs1T0VnVE1UZnk4Q2JSTzJzTkdlTUIyU1hDalpqRXhuc3dZcFVxRUxtZ0E4?=
 =?utf-8?B?T3B5OEdQbndialdZTlFkNmV0NitKUUQ5MEd0UU03WEIrS296YUFRUm05TVl6?=
 =?utf-8?B?Z1BLY3dJSUJGZC9tYkRvb3lQelV4cWllSFE4MjFVY3htbkFPWkNEaFZFVjU4?=
 =?utf-8?B?Y1hyTWhEYTJXTzNhRGxQR0U5dHhXSjNnQ3llRXkrbkV1MVExb3NHSCswSjhL?=
 =?utf-8?B?VVdoam42ZFVMR1NEa1lMN1YzZDgxZHd6UC9lSUx5c0ZXRHFqdkZqbzFENGNW?=
 =?utf-8?B?MWZVYlBqam9QY3FQbWNSa0lqVThXWHhLZlRWRkl1ZFR0TklOTUFsR1h6dVl3?=
 =?utf-8?B?cEsxSFVLcXgrWFpzTEluZmNQcFJyK01mbEVMelMrS292ODRPTCtFMkVaSmVj?=
 =?utf-8?B?ZEJFMnpmV3lYNmgvb3lCSG0zZmwvN3VGbUlvQ0NScm1SYksrQWV5OSsvTlhW?=
 =?utf-8?B?d2VkbkI2QkQ0VFg0S21QWklsWlFmQkVwb0hTVXd1Tk93bDJGcThMN2pNb2I0?=
 =?utf-8?B?RkxsbGU1MDJsRjMvQisvLzdBRWZxaFE1SWdtQi9nOVdzZUxGK1VaN2ovemhw?=
 =?utf-8?B?VXY4WFY1RERRdHV5cU5mSUFlLzBHcWxlS1pBZDV6K1IxSXlMdGRrVVdqbHRy?=
 =?utf-8?B?THdEVWlhc3pNQVJuTDlXWllIcXM5SUprbTRYc0Vrck5sUVhVSnhPbWYvQ2lM?=
 =?utf-8?B?NHBVa2c2bnJ3VDFVNjRXVytmNHFJKzNkR3NKTlJOVFcyMS9kL3BNbllYUkdr?=
 =?utf-8?B?VG5ja1Jaa0gvNmI2L2lEVmxpSlE1REJmWVQ2VHBZL055SlJadHhyN1cxK254?=
 =?utf-8?Q?UFjIckpdUzs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTFoZ2tFZ1Y2cUU3N29DNUZRNDB1UWUrTG0wc1oyZ0NRR1FpL3B3dGpVRzFt?=
 =?utf-8?B?eThDY1VPeFo4Z1hSdHI4a0ZidnRwYlc1dnRqMWRrZjc2eHV3TSs5Tm9oTGI5?=
 =?utf-8?B?eTlXWEx4blN4R0srMlZqc3JjbTVsT0xKOWNHMGZDaXBCL2srWDUraWxncU9l?=
 =?utf-8?B?L1ZWRFVpclJOVHlKcDhSRGxzRnFaazZnNVdRbWpvaHFmbTBpSTBOaXA5TGxz?=
 =?utf-8?B?c0pJTzVzZnN3QzBzd0tlSjcvWDVEb3NiSlNFbTB2WUhaSE1mcGtNUGtXR2dK?=
 =?utf-8?B?RFFjN3BmNURFWUhqcEFSMUd1bmxib0VsL0Z5YUFuRlVJczRUTHM1RHRYblhu?=
 =?utf-8?B?NVFjc1c3YUV5a0svUkl1MDM2TXlQNVVZK1hYUFNrUlBiSUpCZjQ5c1pXeEpq?=
 =?utf-8?B?LzdxTTZWelRJK094c0Y3WEhXWFUwU2VNVUxlQ3E3YytJN3kwOVRnb2wzdFNH?=
 =?utf-8?B?QjNFUkY5b1lpbU02MDdsajRHKzRtd0ZWR0ZpQjE2M3F4UVJtbjVDcmVtelpj?=
 =?utf-8?B?ZHp4MWNlWW9uMWJ5YWtadzFvNHhkSDMrTjhBcmZVZGk4Zlo1V0dkY0VnTVdy?=
 =?utf-8?B?cDUzRjBpZEJJbUw2WmxjTW1GcTdYSEZkVGJrZnBXeUJ5TDlKR000Y0o2NlpR?=
 =?utf-8?B?Uk1qbTJoV3RvU3FIRWhRTVFKYkdDZElway90MjArOWtkcDh5eTBnTGNqUHhq?=
 =?utf-8?B?a1Y3VVpkN1ZsVmlyL0c2NmFWUlIrU1p2YlhTOUNPdUxBY3UyeDFwWFo3MEwr?=
 =?utf-8?B?NFNHQUVuSEo5cWRia2h5dkFkNDBoOTMyK3NDREp6QkVVKzE2L0tJdnVGcWc4?=
 =?utf-8?B?c2IxMTBLQXdxSW1Bc095b0ZsTTVDMURSajkrYjZETHRVNmxxVTBxNFIwVk1p?=
 =?utf-8?B?WnFzMXk4OTBMYitJL1dFc2FlWm4zeUtBOFBxb0tIRDdLdWwvdko3UWhJeERL?=
 =?utf-8?B?VkxEdDVQRXFwMGNlU2VTdkp1YnZ6UDhLVVEvU0VmQXozUkJjakRxcGRzTnNv?=
 =?utf-8?B?Umt6SVRueFU2dE5tRzlCczFoM2NaK2dEM3ZPbElLT2lnM2NqL3E1TmVIc2Jj?=
 =?utf-8?B?dkdyeGx3WkhBalNRdlR3Q1VPR2p6NkNmbjN4bWJENUNzNmdabGtXUWtQK2hM?=
 =?utf-8?B?a3dtd3hEdDlWRDRQN3NrN3YvT3F3MzBBazNpRVUydCtqNThzaWNuOW4wcGhr?=
 =?utf-8?B?elRPNTFibC8zRkhyTHQxQUJzQnI4ZnpPWFdUVzhqckwyRVM4WkI3ZzBwUmlh?=
 =?utf-8?B?MW9PZDU3NXljalcwR3lzMFRhRnJOK1g2MnRxTitkRmxJWkQxV3lnMmNlK2NI?=
 =?utf-8?B?ckV0WHJQYkVwM3ZyV1dqWnFxRGFvcFpUODh1QlZoTDRxOVpjcTJyWUthOHl4?=
 =?utf-8?B?U3lRblJocWVWTU9mbUlFcU1mQy9FT1dpcUNkMGl6TWtSVGlwTXRlK205b0h5?=
 =?utf-8?B?bnJuN2I4OWcrZW1mZStuem11Y2J3aVBNa2NsQzA4ZlFpN2kvU2kzMVBJd2Jy?=
 =?utf-8?B?Nkw4NlNENVdLOHlJM21YVXB4RWROWCthRkQvT0wwK2k0Z28rbkkwRmJHeGxO?=
 =?utf-8?B?dUtWTFlPb2dVYVVabkt2SzBjZkFkUitUM3haVjR4VVZuT0RCQk9HU0NOT1Y4?=
 =?utf-8?B?dnB3bmdNTU5zQ292VmU3RXZCU2JIaGJFSUNnR3Q4ZUZMQSswVkdmTWM4djkv?=
 =?utf-8?B?RlhxNERFMzBaRmp3TFVHYzMyaTlZVHlmM3hWSWZQR3FiK21ZSURGcEJFenNp?=
 =?utf-8?B?YnhvUnlHUXBSaFNmV3h6ekQydmNvRm9rN05KbWpiWVMzTmVjeDhJTUlJRklF?=
 =?utf-8?B?UmV6K1lJbTZ5aU9xVnlhRVhMK1dQcncwOVROSURUVWNsSC9ETFJvb1dyVXNJ?=
 =?utf-8?B?WFIvR2VZUkRBU0RxamJWNUwwQlROM2hZby9GcTF6L2cva3M4RnVQUnAzSU53?=
 =?utf-8?B?VTUvYWh0OEdnb1p4WU5zWXhpNGNvVENOaDNLQlUvTFBRc0tuZXFDS3Bob3hr?=
 =?utf-8?B?aHVxSHY3U1lqcHJBT0gxTDZkZXBOQndhNFJ5d2c4L1pzNEQ3Z1Vmd1F2ME1l?=
 =?utf-8?B?V05yYk5UZkQrSGpEc25HSHlBUS9LUDJDdVdFN1E3UHl6aVZvMDgzQk9VVll3?=
 =?utf-8?B?YmorZjd2K2FKV3MzOEFhUUJ4MjROVEdZUFRhZ0RXMmVUamNOOGJySGxJR1dr?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbb8ded-c856-49e0-a43e-08dde63fc97e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 14:32:59.6695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vA6ih50JvfvIAqVIopaA3CqSQMihn3jsd/ntqEPpEhvqUDINHylCkMFMxmPLvr7SNjO9nfRIX112yy3ME371gsNkbeCdSy6ACjLL0PD4VT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7527
X-OriginatorOrg: intel.com

On 2025-08-28 4:11 PM, Takashi Iwai wrote:
> For Intel SKL and KBL platforms, it may be bound with one of three
> HD-audio drivers (AVS, SOF and legacy).  AVS is the preferred one when
> DMIC is detected, and that's how it's defined in the snd-intel-dspcfg
> config table.
> 
> But, when AVS driver is disabled (CONFIG_SND_SOC_INTEL_AVS=n), the
> device may be bound freely with either SOF or legacy driver.
> Before 6.17, the legacy driver took it primarily, but on 6.17, likely
> due to the recent code shuffling, SOF driver seems taking it at first,
> and fails to probe.  For avoiding the regression, we should enforce to
> bind those with the legacy HD-audio drvier when AVS is disabled.
> 
> This patch adds the extra two entries in intel-dspcfg table that are
> applied only when CONFIG_SND_SOC_INTEL_AVS=n, for binding with the
> legacy driver.
> 
> Note that there are entries for APL in that config table block, but
> APL may be supported by SOF for certain setups, so the choice can't be
> exclusive.  Hence this patch includes only SKL and KBL.
> 
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1248121
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/hda/core/intel-dsp-config.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
> index 00f184917623..c15284742899 100644
> --- a/sound/hda/core/intel-dsp-config.c
> +++ b/sound/hda/core/intel-dsp-config.c
> @@ -116,6 +116,13 @@ static const struct config_entry config_table[] = {
>   		.flags = FLAG_SST,
>   		.device = PCI_DEVICE_ID_INTEL_HDA_FCL,
>   	},
> +#else /* AVS disabled; force to legacy as SOF doesn't work for SKL or KBL */
> +	{
> +		.device = PCI_DEVICE_ID_INTEL_HDA_SKL_LP,
> +	},
> +	{
> +		.device = PCI_DEVICE_ID_INTEL_HDA_KBL_LP,
> +	},
>   #endif
>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>   	{

Thanks for assistance, Takashi, much appreciated. Given the explanation, 
I'm OK with including just SKL/KBL and skipping APL here.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
