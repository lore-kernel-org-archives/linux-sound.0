Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3C1A23B0
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736528250; cv=fail; b=AAezYtk7U7rDESiuS9knJQWEuaDwoGzoLP/siJovaRrU1VfpHIYtbDeq+8fZBNsmH4hWwgQwrmo9PUi/YaviJvUaYWYbQ01RtQ/sN378jdLieX2C9Z78tQ9RTFABRMODHtF6DCuz9AGoUQ/VKzx4tW9VfGg3jyDNK0jsElgF8gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736528250; c=relaxed/simple;
	bh=1h98PuJlo1Rdnk6ViLF7rZpm9X7wusYcryDtuVKBWrY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RaSTxzIPZUWJ5eGXa3FQlyGKTyl87X5UCqTtPziAKrHqd+G/XJ23MA6boGikoKZMA0wGNJBlz4/4NIiJMWu2CyxFK3r/lrgqf3QihJf5lxCCUMDOIqnnt5yc0wnIHhxZvc7Vlu6j9jsNAnDZdO6yvfkQ/go7OHwtxO9NX5tVhLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1c9VDuM; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1c9VDuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736528248; x=1768064248;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1h98PuJlo1Rdnk6ViLF7rZpm9X7wusYcryDtuVKBWrY=;
  b=F1c9VDuMhoQUIuKecFDUbj3McHo8YqBziPZzrXc+kwfU6Tijb5t9DbhP
   5UScp1tV5Ow+N2NKkpNkhU5B3Hu0qMUiKVwPHCbc9E3fMhMTERUrTCzO4
   98qFoJKgiO67QnDcs8zMp7f5hkWV+n67H+OAhbmMtvB1p/D5qTw5uMKeM
   tsEngWpS4cQPBh+B/e2P4I6/ELZX0Qx9yMNKdRk5gxZuJ+Lio2orWjk3v
   ywq/yyWgwNoGx35HjrRKFXyMjtBi8y0eQE3pd3dktcD5B9F1GmC9B5JCa
   6ETf05TxfXze9DIFnDTmgmFVPm0q348921V6K8WWTAS0uuOfyQn/x/Pfe
   w==;
X-CSE-ConnectionGUID: sc2YTaweQX+zeCyesqmdhA==
X-CSE-MsgGUID: YnEav7iFQOGA35849vPqPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47818762"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47818762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 08:57:26 -0800
X-CSE-ConnectionGUID: fuRzQh/TSE6dilmg2tJxyg==
X-CSE-MsgGUID: 47KFd8nfTSqIVYL3xwhCbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108883300"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jan 2025 08:57:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 08:57:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 08:57:26 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 08:57:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZfonPDTyxFk/vzXdPKDVjf9CdG7OkxUrB60h3kwwDzA2WCuRA1ol+CpmONPI2wjZB1LwH4mQxsMYIjTSGAO2w1cFyv2s7loJO8Kqz6fFbvRrKveyyCM/zWlt6BVatgQ7uI17JBqMbdaDQy6rjdfXKTk4CP5FVV6+EyL8sdUHiCsPVtL70el/qPRtzVKE+MQmsOO7vrIeSVrIwK7tzeA5tZafEiMV+Mbh7UxpwXn8Ng99nsmU0wyz7DYEPUqaQYaq9nDZXuUwBRVxdsY6yY2MqjFBdg0K6hTQpKQYcMaLhX2xAIAwqUaljlOm+I32oMhLAeZ/26OmcaexRCIC65oOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hq6tPT0TJJcOmLGyJZxfLAp8cU4/uzPguTaiYSw/Jx4=;
 b=iFGBu3odmhYuQXSGffyAHJqW/Dm9S1c2KvSD4v/tPWs9w7a+4gpaPhEOEzQsYNXifD+al1cnejA9yjki9qW4Ik5X3+sA/OC81wNAMRDxzALfcZN8XSlo1upCHZlEJoqst/aV/RemT9eSsU88rc8YpP0pspm8kxwfzCRaurxX8rxnnfVh5TFY5mD4QfAnHkODAYtApJ7ROHY6ZNAi2l/x3sL4k8tj9OyCtikzfRqw0CZkaGKFOux5WW0w4YWqntylKJOFK8d8uPgcZEANF1HLeTR1MddY/5X7kx85eZiOtEOiablA+0w6DGR1iAr59e0y3JbOBTohdsaPUP6V5sJ0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.13; Fri, 10 Jan 2025 16:57:23 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%5]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 16:57:23 +0000
Message-ID: <ea1144bc-ca6b-4fde-b829-1cfb55c8ba93@intel.com>
Date: Fri, 10 Jan 2025 17:57:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ALSA: hda: Transfer firmware in two chunks
To: Takashi Iwai <tiwai@suse.de>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>
References: <20250110113326.3809897-1-cezary.rojewski@intel.com>
 <20250110113326.3809897-3-cezary.rojewski@intel.com>
 <87zfjyty95.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87zfjyty95.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|LV3PR11MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 901263d6-2e3b-4ae1-6b7e-08dd3197dabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3plbHk5eHRkMG5ZWmFONm8rMmZRN1FSTG1MYllYcDMwUUpqWlRtTmtjM2Va?=
 =?utf-8?B?ZHRqYUR3R3FnREZFUkJXNG5jdEMvL3VzQ3NXQU11TUdDaExUUmdKQTFWekxJ?=
 =?utf-8?B?L29zOWUwMHFZSVJoM0hEZ1RWb3FDNGJsTnM1Z0daTm5qMG9hSTVLNGh4MU5Y?=
 =?utf-8?B?VzZmU0hjdnFyd2ExZFFqcDNuMDVmcGJMQzRIcEZ5SzNJRTBzR1A4OW1UK0Fw?=
 =?utf-8?B?TUZUeFUzbEdHRnhZRDV6N0lHR0hMWFhKMHlzRWt1N0taMTcrU1VSeG1halpN?=
 =?utf-8?B?MVdlS3Q1SklSNWhYbitYdmRtZVhpNUNyTDZ1blloMHE0YUVhT2s0Z0FMSTJm?=
 =?utf-8?B?NEgwZ09ZY0JNZkRKdmRTMmZrd0xRQ0VqNys4eWxNY1pCNVUvb05vcTlzeG15?=
 =?utf-8?B?d3hXR3hXZUp5N1dSWXBxQzRmcGxsNndyNzFmbytSTENPVEo3bFhKK2hMcmhB?=
 =?utf-8?B?RjlhN3BQMnpla0g3cktGbHMwZmlZcUEwRXFDRUQ0S1B4NVlTRWZrRlZaSjE2?=
 =?utf-8?B?RkQyMmkvMW12N1N6WTJlY2c0QWRVNyt6WmxuSFFhNEtEbTVwN1pUeURWdlJU?=
 =?utf-8?B?Yy9McjlYUG42VkZFUkFjK0tQQk1mOFJxRzhlT3hsMWRXSkhoSTUzeXJYdm54?=
 =?utf-8?B?eFRiRlRrYXBVZGJSZndlMDRlaFkrTUZidmhibGRxMVNTMy96RHQrTDRGUzhH?=
 =?utf-8?B?aEZaZkRjOFd2Z2lHd04xWWdRSDFGanB1WXdUaUhrNDE0b0srM2RHYS9IWjFz?=
 =?utf-8?B?VEI1SjBTQWg5YlE2U0ZBWUJSUmprYnppN1lTRlFhODltU0xrN3liSk41YzVQ?=
 =?utf-8?B?cG4vK0xrazJ1MWRLZkhZMHFJVEIzSGxJM3VrNC9kT2xDc2liMHdkUzFPWXhK?=
 =?utf-8?B?VkN0UTY5S2xsYTJGeTc5aVBkcmtvRUhCdVNCZ1A0VlcyMzJseXJOY00zSWJo?=
 =?utf-8?B?ckUwMU5KNy9zTTZMVWd3ZlhWbUVuUVFGcUdoeXhBNThIZDE5ZCtYaTRpMFdN?=
 =?utf-8?B?MXFEUWJlN2xuckQwbzNvQVVld09JK2NjeDg4N2pKbWdZREZVdC9SSXp2Q29B?=
 =?utf-8?B?RzhBaVRnb1p0QzdZWk1tTisyMWIwaWF5bCtVVG1XY2xjZUtxbmpiOGoyZmdM?=
 =?utf-8?B?OWRZUGQrQy9FQXI3ZDFJVTF1a2RWZkRTMkJkaUxYdHNQbjBzVWZSa3VYQjVW?=
 =?utf-8?B?SUd5V2IyR080a3ljV01FMCs1UTlIZW0vSEEvMjk1SnF1V3ZXeStNcFpUQXFv?=
 =?utf-8?B?SUp6enpZTnA4c3NKYXFLOWgzdHc5VlJzRjZsZS83UW5mQVpBMjEzSW96MmVJ?=
 =?utf-8?B?VjlNMUtVMzlYbWVkaStsV1JSK0tYZG9obDdNZ09zMTNFMnMwK1VVUk81R2JO?=
 =?utf-8?B?MUZlUHQ0aHNtYnQrTXJDbWx1NS9XNDBMb3FMdG82VWo3TDZwZlNBMHcxT3RC?=
 =?utf-8?B?UVZhSkluOU4wRVl3a2RuVThMejI2eXpFVjUyVDJMZG5kRER6TE1QR1p0SnB3?=
 =?utf-8?B?UDNaOU1rSTY5RnlWTnJ1K013clpFVTJLVi9pUnhuUlNkT1lDVXJLSm5TcWRH?=
 =?utf-8?B?U3pzWXVTWTlTUXR3UUpBQ2dCOCtGMXVuZ2ZMSFNSUDJ0S1gyaW1ta2JaMmZW?=
 =?utf-8?B?bFVoeit5NWhaVUozdEdRQ21iNlM1cTRFbG9RcHB6QXZxRHI0MmQrV0pYWFV1?=
 =?utf-8?B?aWxTNDdlRU5DUUVyaVhHWXYrS0dUOUxnQ0VaL1lZWjZvb3g2ZjNveGpqM0Vm?=
 =?utf-8?B?cHJxS0pFeEVSZDk5TVhOdlVzVllqcWZEWitIK28vWkxqQmEvWjFQMTdWbjMz?=
 =?utf-8?B?NFFDcnlJMjFhTWczS0xwNzBZanp0YWU2c29RQkhUOWhzNW5MTEwyc2t3dlRE?=
 =?utf-8?Q?Jmcb3SLlyr5lQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0NJN283N3p5OXZ0eVhhbHN4QmtHYkw1d01vdlQ3R1drQVRGRnNYWjlxaFZp?=
 =?utf-8?B?VG94SlNLT1V3MGlYYU1TY3NWb1RoSnMvbUpMUVdLbWkrSzRDU29MOERpd21P?=
 =?utf-8?B?N0g3N2U2TFhKdkpkYkRoTXVuVVhKczgrVUVoTXJuMFNmWGNBYXdRVy9aeUhP?=
 =?utf-8?B?RS8rakdyZmJrak1ndkI0Qkd5bEFhNGw4eXFtc3JPMUhMQUhkNUdjRFRraWVw?=
 =?utf-8?B?b0JrSGE2ek1QTTRYQm1ISGZVS1JwNHB0cW9tZTZKMjF4bGFXaExJNWRsTURY?=
 =?utf-8?B?ZEROaXFUczJvVFUxa3RqMFhJRHZkR2JQSFQyNjRzZkVLak00Y1NydjBiWFlW?=
 =?utf-8?B?aEsxeDUyQ1FTN2RwUmtZL25VVGhOOGhjWFBneEFrTXcvbDd1OE1ScllEVnR3?=
 =?utf-8?B?NlRxdVBRbVUyR3VUQWh0ek01SlVOM1hmbnRnS2pQY3VvYmxBaVQxRXBCWFMw?=
 =?utf-8?B?UnQxTGRMUE8vNEJSRWFxcDU0M1czL0FrK0hYNnVpa0ZTZzlKTUk0Z2d1b3dU?=
 =?utf-8?B?enNxeC8yMXFwZ2dxcldBT054MUZlcThtSWVSdGxDdGdLb0M0aGRNN3o4SGRC?=
 =?utf-8?B?ejBNU1gwUWhSejdidjJpUU9oaW1ZL25kMm5tSVJCYUk3R04xRlpUZlc2OVAx?=
 =?utf-8?B?YUR6T2ZsWnFKczBMb0dDT1hHTThQOUVIeUdKYlNDTDZNSWRGcDhYa3VNc3cz?=
 =?utf-8?B?R3JtcU1yMWw3TEw5TDBSV1lYcHRoZFhiUTRQWm9CT0N5ZFl0blF3WkdyRkZl?=
 =?utf-8?B?MlZwRjZZd3hid3lQMFBDUkdpL2NCUVNhM3BDUHVjeGEzcnkxQzdxbHByZWFr?=
 =?utf-8?B?d08rTVhDMzBsdUczUTNzN3B5L0M3YlBlNk5GNW4yNGsyY0s3U09SanI5c04r?=
 =?utf-8?B?b1hqUEFHZDFNYmFhVURJNUF0L3hFRnpLSDhlNkRURllhMm9SVFJzVDR4emdD?=
 =?utf-8?B?NlVFeFdWZUo0VzhXM1BadS9WYzU3YUZEY052MFJxTFl4ejFYUVVCTG1zMG9D?=
 =?utf-8?B?amN5TWkweTVYOU9tZ3E5cFVQd2F1N0NpQTFQUjFvNG4rRGcwMkJoZ0NBQmdT?=
 =?utf-8?B?NUtYV1JlTko2T3ZLYVBXK2M4cDdlZEtjZktpcDNCaitrSTdqMlY2b2RrVEt0?=
 =?utf-8?B?cVNsUHB6TXhHTFJvYnkxYXlyWTd4VTFFd3JocEhFRytYcU9oeUx3bUJtUUI4?=
 =?utf-8?B?ZmMwY0hJRHZUbGViZW5FSHdITkxIRGNrRkYvMFpzSlZKZDZwMTlEWEFKRXVq?=
 =?utf-8?B?WDNCR2xab1BSRlVNa210OHQ2RmRMOEtsWDVnaENvSC82bUg5MHYxWVE3UStM?=
 =?utf-8?B?K212NlZraVYrdHNJWlpqWWdWNzN2R0tNZXN2a3JFOEc3ODZVNFVMODdFYlZ2?=
 =?utf-8?B?WDVsdGoyWmMvUGpxMXRTdnlMbkc2UUx6MEJsTERycXNWQTd0YVJ3QVkwajRn?=
 =?utf-8?B?V21DUEtoVzhLQks3TGhtR2xBYWY1Mms3TUZNUVp1Tk9YYWVhd3E5ajBic0No?=
 =?utf-8?B?cjFEOUJuZmpPU3F6ajRJZDlaVU9pdk1NcHZhOVNjN3RjeVRzeDdXYktGaDJL?=
 =?utf-8?B?eHNRb0FIUHc3SStqcUZWeDVsS0szYTdsbVhlcnJIQ3F6NEIzL2huZkhVVFVW?=
 =?utf-8?B?QWhnRTk3YitUR2lvMEwyaVRHakN0blRsUnFmQXNyUjJNNWVCZTNOZUVUT3VB?=
 =?utf-8?B?em1GbnhZeDB3Z3dEMFErQ1VOTFhhQzUvcXY2RGtocDRlRlFGOGwxaW5EcDVH?=
 =?utf-8?B?NmtXaUtOZkZoTmFhMk1vRWxuV0hQWkg3SW9WUTdFWFU1VHUwMXgyT0gzYW02?=
 =?utf-8?B?ajdUNEdHOGQrWCtLWC9BTk1rVnZCUGdQU05LYXB5eDdhR0YzSVlPNUZEanZk?=
 =?utf-8?B?TUlLNW5Nc0lsdmRyMUJPVkRhMnQ2a1Qxa1lkMyswV2hNMURPbGVjaHVZYk16?=
 =?utf-8?B?Nng1MnBCSG9MQlBkWVNFSWxkZkJxQUR1aFl6RzVXeENFZGh4OGNTU2FGZTRQ?=
 =?utf-8?B?Slp3Y2Y1WGIxcmhiZDdDWFJKYU1ZY3hacVQ3cnlDRnk5OHhBNFA1Y1BMdXk4?=
 =?utf-8?B?cEZCZUFRTGhVWEp4NlBQVlZtbTkrQUtaL0hrejdHcXVPbDhqSktYM2pGSWRY?=
 =?utf-8?B?ZDRLYVdoSmJ4NzJlK3BxZ0hHNXJkWGdpVmJQY3RKN09QOGxQRjZ2M25TYXZ1?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 901263d6-2e3b-4ae1-6b7e-08dd3197dabf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 16:57:23.8603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yk4tlNBN6Qhl0uIk3OdH85FoUiM1yRC29ktzzrtA/s8QgJA9EHEnSwZs0m3sYfvHawG8AN/YLe17dGyfM4xiMATqeSUmRGPtnoVu6ks22No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
X-OriginatorOrg: intel.com

On 2025-01-10 5:44 PM, Takashi Iwai wrote:
> On Fri, 10 Jan 2025 12:33:26 +0100,
> Cezary Rojewski wrote:
>>
>> As per specification, SDxLVI shall be at least 1 i.e.: two chunks to
>> perform a valid transfer. This is true for the PCM transfer code but
>> not firmware-transfer one.
>>
>> Technical background:
>> - the LVI > 0 rule shall be obeyed in PCM transfer
>> - HW permits LVI == 0 when transfer is SW-controlled (SPIB)
>> - FW download is not a PCM transfer and is SW-controlled (SPIB)
>>
>> The above is the fundament which AudioDSP firmware loading functions
>> have been built upon and worked since 2016. The presented changes are to
>> align the loading flows and avoid rising more questions in the future.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/hda/hdac_stream.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
>> index 2670792f43b4..18d74a28a246 100644
>> --- a/sound/hda/hdac_stream.c
>> +++ b/sound/hda/hdac_stream.c
>> @@ -455,6 +455,7 @@ static int setup_bdle(struct hdac_bus *bus,
>>   		      struct hdac_stream *azx_dev, __le32 **bdlp,
>>   		      int ofs, int size, int with_ioc)
>>   {
>> +	u32 bdle_size = size / 2;
>>   	__le32 *bdl = *bdlp;
>>   
>>   	while (size > 0) {
>> @@ -469,7 +470,7 @@ static int setup_bdle(struct hdac_bus *bus,
>>   		bdl[0] = cpu_to_le32((u32)addr);
>>   		bdl[1] = cpu_to_le32(upper_32_bits(addr));
>>   		/* program the size field of the BDL entry */
>> -		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, size);
>> +		chunk = snd_sgbuf_get_chunk_size(dmab, ofs, bdle_size);
>>   		/* one BDLE cannot cross 4K boundary on CTHDA chips */
>>   		if (bus->align_bdle_4k) {
>>   			u32 remain = 0x1000 - (ofs & 0xfff);
> 
> I still think that it's not best place to change.
> 
> For PCM, this workaround isn't needed in most cases, because
> setup_bdle() is called per period, and periods_min = 2 for
> snd-hda-intel.  Doing extra splitting is superfluous for PCM.
> 
> That said, if we need a workaround of the split, it should be done
> conditionally for the firmware stream.

Somehow I did not understand your initial point. Now I do. Indeed, I 
should not have altered setup_bdle() in such fashion as it's used by 
_everyone_. Will review the change and come back with something better.

Kind regards,
Czarek
