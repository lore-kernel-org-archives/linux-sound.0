Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734FD1E7C01
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773353; cv=fail; b=D5Ufc5APB/oEgGCbRFttpZt7o2Pjtrwi4vdcgMeysAVqRTUC6ZJ6ThTG9dGjjVRUOrHohocZZ+6RfVn+osKc0BedOgp8gn5eqfuniXVv0H9hbN2QW4tW3HoGVRpRTuUUB4P6zaU3pxW6xBk+2/5eHmg+aTaD7lW1rvZbiLP4D3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773353; c=relaxed/simple;
	bh=gsPwap4ZOxJHLyDwa8SDQJngw/7iHCgBxqYDf3j+bjU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qUdMKQKWJRNGwXLjmNCTFXWx3OFqlQ9mgM7Uc/fMCo80ldGvoAAsFNpvXsUGGFovHjkWsx/0L7ABxF+UzjXh+P9HvicGbFJhmHTD24BsvuL0xoPxijZk11ZXVg9LNnqyKfMY3M3QvZESwpatprEVFNIeYKDARoSVfhKrPIXLR08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJGJevIQ; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJGJevIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743773352; x=1775309352;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gsPwap4ZOxJHLyDwa8SDQJngw/7iHCgBxqYDf3j+bjU=;
  b=XJGJevIQlvKz/CuwNv0IzFs3/k/cpMPYAuygh8ybuqyp2Mxq6X7wDY9Y
   d2TEg+ELTFl8OgJQVotJavYYWyGbw1G6M8P4+Xtr1/8ZVorNZOQwBk/xd
   Y5qZbAwN9vm9KQg39oKRBtIkF9rNeYXXs1yL8UMPjSLdBqO7kT3l73+87
   NF+zJIwDLr0s7uMN5viaTcx24SVw3DXwDXs3XaG4WfwRd/RXsqKL29yIE
   qcNd7kLANczQbiG2FOgc3ZL3N7pqhz0o/mQwuWgcDPcbOCuwXP1azmhOf
   pZMVjCtS0M7bs13GPwaX6LdaHHo7xHj8mR2Dqm3TXIZ3OqcIsNAEhJPCQ
   A==;
X-CSE-ConnectionGUID: qXmDKDkXSiKmf8C5wg9oPQ==
X-CSE-MsgGUID: LC0LLG+1RdWYhp7QLeyaAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="56582684"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="56582684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:29:09 -0700
X-CSE-ConnectionGUID: rLeOlIrKReuCKG2sYwcWXQ==
X-CSE-MsgGUID: DX9D7Z5DTLaEuvUbUN9fvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132018940"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:29:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Apr 2025 06:29:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 06:29:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 06:29:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gc/Hltj7+W/lOGcKEEiBPgRoeDXuGEtzOLaHN13dbWKopvO70Yp+BsF2UQdRTXD6hNOw7o/7vmPegJVtVpUMOdnmnTzOS4ApQx/F9w9q20pouqxUgpQ8/LI9Zddy5wtL6iQx7GcLN4dXGZFw/gLligrERhjy7EBCz4a5mmHK0ptj5CtgvlvLBPtsaGmlOJsbpOrqkoNybSO9kIcITR/isEmi3vEHKi9yzlh8MOIQ4jvl99MHvuXXuFkdp9kgjxCXrkhQh8fViJIQqWOjvRPrpeOjkvOjkJ3EHn/C3TC8SuncTPtNFE7HeiGm7ftF1i+XH64EoLe32W7C40MCb18eqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsPwap4ZOxJHLyDwa8SDQJngw/7iHCgBxqYDf3j+bjU=;
 b=Q9fTYj31HcStD5CELuttzQApjKIFxycgEzlsTuuRvzjDnR7LSZy1rQ0GJfQUqyO9mAwSQJ2qtDBlM942pJoiMlgTe1oTAXT1+K+sG7ojoFZ2WYBj1T8shTd+5pWofCFVf9bWn3uXHh0ATdACUbXilk5nlm9+MnK8eTjPRmvieM4Yq3kO3mUW2fTfyYEtF9peq8Gq/EnUXIOCVBZevUVBgs80yzuo9tIb+qrqdXw3WFULirH6UZwrYcYyRYq9qSY/HB7N2RhOoEM/9UVoO+IP3kQByD7rfbNefLjkOKKhnPzrjiJKUJOAl6kxg9NQAYEZ8fUnHWZRcX6hcld81RmGlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Fri, 4 Apr
 2025 13:28:36 +0000
Received: from SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200]) by SJ0PR11MB5792.namprd11.prod.outlook.com
 ([fe80::2e4c:49ee:6f37:d200%4]) with mapi id 15.20.8534.045; Fri, 4 Apr 2025
 13:28:36 +0000
From: "Girdwood, Liam R" <liam.r.girdwood@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
	"tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL platforms
Thread-Topic: [PATCH 00/12] ASoC: Intel: avs: Add support for MTL-FCL
 platforms
Thread-Index: AQHbpV/FHTEbCMdxQUKL9OqqNoE6irOTdgIAgAAE54CAAAVDgA==
Date: Fri, 4 Apr 2025 13:28:36 +0000
Message-ID: <b8fa998839daa544acf868e6260fce59f863cf5d.camel@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
	 <ce71ea6903d05c3b5312c9f534d83478e488729e.camel@intel.com>
	 <abe40ed3-49fd-49d2-bb5f-42481898ecd4@intel.com>
In-Reply-To: <abe40ed3-49fd-49d2-bb5f-42481898ecd4@intel.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.2-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5792:EE_|PH8PR11MB7023:EE_
x-ms-office365-filtering-correlation-id: d3eb59ff-99a5-4ec5-bf66-08dd737c9a84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SGlSZ0tma1NUSWd5SGYwWm5GdmtMUVR4NllTL0RjVEtUWEpzUU8ydzhNRlR0?=
 =?utf-8?B?alVrTXNrUjhlTWlDZzdhS2JlSWdRd2xFVytDbWhtWUFqZWlBNHNYM1EwRE93?=
 =?utf-8?B?RTBVWFluaUZ5Q2E5UzEvQ0kwWC9pbjBDMzlCTXNoZHFic0d6a2Z2VTJtdTNW?=
 =?utf-8?B?Y2dyaFRQT1JLVFpqYXgyZG5zWWFzYTZRcGtaUXRYakc4SkFiMnBPaFplRkd2?=
 =?utf-8?B?MmN1ejYxTGxBY0d4RTVmWHNsZDY2YVNGeHJPNXdsZmtvN3FRRU5oUGc3bWd0?=
 =?utf-8?B?SmlsSVZFU2VSZ2NQVGw1SGQ0RFAxWEt4L29VSzdjSDZVRmR2aGowWjhMM0s3?=
 =?utf-8?B?SmkxMjdpUWVXbkdidVN2M08ySi9hMG9DYVVSdUVXRjRCcnZnMG9RbWErYlJI?=
 =?utf-8?B?dU5zQ3J6dXNJdStHYUFDQk15WWNQd3pCUFVTamxRVTg5TzZFSlFVSUE2elc1?=
 =?utf-8?B?RGRCSVB3a2kwNkVoa0x5NzdvZlZROGdiRFRaako1bDZTUXNjZE9FenFzWDcz?=
 =?utf-8?B?L1BZL2tkby9KLy9RTjBqZHFKSUJHa2lKL1pqOVlBcXE4U2VLZExCdjR3MGx1?=
 =?utf-8?B?RkVFdWk0YWI4RnJ0RlRhUlV4YVB3MTAvKzE5MzdnWXhKR0VSbDRqTXlzNTl5?=
 =?utf-8?B?RWFTazlQekpOa1U1TTZEMFVzd1lWT05QdXJOSjBkZGpzNVB6bVZ6OGJCV2Jk?=
 =?utf-8?B?aWp0NWd1TVU3OW8yTnkxR2IzMFFkbVhyaENoUGZZcTlHSWVaSldVaUdyVDF2?=
 =?utf-8?B?ZzlhK0p3YmY3TzJFcE4rcytNa21HY3JGQS8vTDMwbTduLzVBQTdPTmtLME1G?=
 =?utf-8?B?bzA5dVYxeXlyQ0F2MHJQMkh0Mlg2VkJhTjJ1bDd6QnZhblZyQkNGQlp0TVY4?=
 =?utf-8?B?bHlHRENEMG4zaHkvaHZlQXhyeXFpeml4VWN1L3I5RHFIWWxqdmFtUE95c3lC?=
 =?utf-8?B?Uk9uZUlSYUlzRlFGMFFEb3ZUYk5ES3IxeG9LdFMyQTM2MUk5ZG50bk9XaFdq?=
 =?utf-8?B?QzZDYWhxOXVtaHpVZkpiaXk5VkJ3OVRRd0krNDZKTXFKZkF1OTFLck56b29t?=
 =?utf-8?B?a1BSZmlIeWFXbmtIWnR3bURLNWgrTzlvK0dnREQ2czd4VkpsL3hva0VVTzZW?=
 =?utf-8?B?SWl3d3lWYkpWdTl3UU9TeXFqdkxVOCtVR295NnQ1Ry92U3Nyai9VRGZGeGdw?=
 =?utf-8?B?eVdGaWpRZm5Mbmt3ckcwS1F4M2V2eGFvNEV2cWhNQklmRE9RRXVodjRvVU11?=
 =?utf-8?B?MFRHTmJSSlFiNzBDMHRZdS9JR1lyTFZndDNiQWFIVFh4ck83emUrbVk1MDAv?=
 =?utf-8?B?bU5xMFoxeFlDbEliMGdEMmZGREpjWFFmYXA2ZTIvU3pZNmxZcnZEcy9IakNJ?=
 =?utf-8?B?N0swcGdwaUs4UnRNNWFDenp6RXNDNXNrbkZxeWorMk9jZHliSUNKWnllTk53?=
 =?utf-8?B?V2xnYi92QUhxcWdhYUdSUWgrT01DRFl2U0dneFY3c1YrZmRyTktUM3VFVE5K?=
 =?utf-8?B?ekJ4Qk02T3B4SU9oSEVXS0g4cFAyUmtTYWFPN05lMTR2RDRzQmE3TURCQ2tv?=
 =?utf-8?B?dmNXZ1J0bnBKOGxpQmFac3NkeG1kSnk1KzNSdmFwYlpickpWQ2RFdy9ESzZ5?=
 =?utf-8?B?YWxQOU0xVmxmQllPRlNzSzhjd1VwTC9pdmhnMFh3M1FneGhaQW0vWlhZWkFK?=
 =?utf-8?B?eGRJWjVNQ2tlQWVaOW1sNFUwK0lCN1RuSTJSRDZRMUZUc0lhMTVaZzNmV3Az?=
 =?utf-8?B?dWZhZTQ2NzBWYlpZU0ZFdnJ2dy81NVRIMmxRUGdLUTViNkQyMXBKcjBUVmRY?=
 =?utf-8?B?NVoxWTI1MDJGcDRCQ1BIOEl3UzdEVzB5eHJFaUdZUWFHTzFEcVFHK1FXT2xL?=
 =?utf-8?B?NEx4SzlhY2pVQ3BQVUtpYTc3VENRSDB1Z0FMZzl2V3ZoMVRLZEczU1Y3MTdS?=
 =?utf-8?Q?yvr4KpVelT03ZeQq+YfXa2ZuVlUuqbBi?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5792.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHlkQ2N2c3pFc2xYdTNZWHNGQ2tQRHRLaW85T3lJK3JOOW5MQ1NtVERMWkhU?=
 =?utf-8?B?czZiQUJSSFJUbVUvdk9nYkZ2SzI0dEJSa2lXaTkwVnJza1NEaExFaGJjRk5V?=
 =?utf-8?B?aFFIVDlQRitwcFQ0QjlhRlJPdURuZERCOWNNWlhyMUJUQ3ovb080OWUzTWxJ?=
 =?utf-8?B?OS8wbzFmWG1qck5RY3RJQmhaN0JhaGtmcnAxZlZlZnM5NmJIUnpYVmo1Z0xi?=
 =?utf-8?B?ZVlGcnRUbEUvUTJURlpETmxVUUkydXJMcVRONWluYjhDNTNRdkdTakRtYUtD?=
 =?utf-8?B?TFlGNDN3UllXZHFNcVJRRi9oOVdhV1ZOdVNqb04wcEl4NnA5NnFwdHMxZUQ2?=
 =?utf-8?B?YUpJVWJQL1ZlTTlkemY4R3N3RGd4R25Fb2g2R05rQlhKTUZaV2VWckNMb21H?=
 =?utf-8?B?b3VKSG94SVF1ZzkrSDdSN2prZUd0MmtiL3BqZGhIYWNIRGp6QkpMcmdQSjdH?=
 =?utf-8?B?WVNpQittc1UzSjgzaEFJbkdaUmM0UUZEN0VJMDVucDBnWVdRNVU2SDJzeWw5?=
 =?utf-8?B?TG13SmtlcDlPOWRDM1pvK1p4Z3lzQnpzZHdWaDNlNWZpY05oU01aWEJ1ekhT?=
 =?utf-8?B?ZDNFMGVSUldNcG93ZUVmVWF3dkxqckRKZ3BiWXZMTm04NWh4WEM1NG9aRU01?=
 =?utf-8?B?bU40emNyNzhSYTVqdytNeWpDdlV4R1dSa0w3OW1EdnZzb0thQzJGUmhoSzJy?=
 =?utf-8?B?U2JZM2p0WWREamFSczNISmZNZEd6YzRQUEQraVFGdzZoblh1ZTRFVmxCalI4?=
 =?utf-8?B?bzlranliL0YxOXdDcEpLUDR3aFh6eDFndHgrUDV6WEJOM2FOdTd3YzRPbU41?=
 =?utf-8?B?bncreDVpOWNaelQrLzlxZ0dqenpmZWIvc0ROS0hhUHVSQmlqcjdOSFRYbkU1?=
 =?utf-8?B?VWVaK0x0Sk5MVHV2NGRoNk9GY3pUMDArZ0M5bDNaNjZIK2hvMXFqNHJMZ3A3?=
 =?utf-8?B?K3MvVHZkSmhUNnMrZ2RJb3Y0Y1JaN2tNaTA4cTR6YTZwWE1SSnk0bXhPbkQ0?=
 =?utf-8?B?RUYzblZUVzhVaEd1WFV0RFZoZTQvNlRweFJqei96NkVuS29UclBYa3pyRUY1?=
 =?utf-8?B?MURuL0NWUDEvMFY4VWlPbDdvUFpzTkR1cW5jN2lJb0MyQlphalVQTi9CRnFl?=
 =?utf-8?B?MzcxVXdycE14UUw5WVNDaklFOW40Z2toa21hcWFXNFRFdjNvYnF0eVpqbnhv?=
 =?utf-8?B?SU1rTUhTNFZIRnFsem8wbGUvcll3V3dSQXRZaTdOamdSQkJwUks5bGtXWUYw?=
 =?utf-8?B?bk5nclkxeUVXTTkrYVVVL0ZMY1RocTcrY3dVWUczdXJudC93U1I1dXFIc0V4?=
 =?utf-8?B?U1FkdXlvZE1FczZQbTRIblJ0a3oxUUp6TlVWRUNuRVVMRmNPVm5KblN0bm5o?=
 =?utf-8?B?MlAvcUlTdkpuNUtWNklieG0xSTlEWG5iUWtRSHRjZG1rYjZ3Wm9TUGs4ZUcy?=
 =?utf-8?B?cU1tR255dEY4RWFNK0x6UXhLWHhBc2FXQmtPaUtXSG1CVUk1VVBiRmdhOUlj?=
 =?utf-8?B?WGxlUUpQVnY2bGRCcjNtcDFIbWlLRFdySkJLNWgzQU5PNXl1NnVyakt2M05x?=
 =?utf-8?B?b211RUdOSk4reERXNTF0MTZ2L3o3c1NPa0ZLSGhGMFd1YS9MKzRHWkZNdWVn?=
 =?utf-8?B?blpZYmRZb1l5cjBKZUFFcmxvTE9jR0E2aXpyeUIwRXFxeS9IbHYySENvemlU?=
 =?utf-8?B?UUVVbFFmZStidUphVG9oYWxzL0tuZU9XVnJCbWI2b3o0TzVORGRxdlZxTWI1?=
 =?utf-8?B?RGJZRk4xZ096UVhPUW5scXk0cGY3bHhwdDF6Tno5OFYrdkVJTzVRVUNxc1hJ?=
 =?utf-8?B?UGNlQnV2bmVxaFIrSHFhT2U3UGZwcHRzeUV0SGhSRGl6aEpKejQweHZYeGJ1?=
 =?utf-8?B?SDA4SnVOZ1YwZzRNaUluL2U2ZSs1VlMzaGwwd3FQU2hMWWhod3B5S2locUxk?=
 =?utf-8?B?MmliMEQ2ditoQVZXUUNMeU4wSGpacDFlcy8zMEorK0hQeXEybnVTVjd0Qlcx?=
 =?utf-8?B?RUs5U20vd2xTSzhUQlhKaW5IcW1SVzRHRVhZdkloSnlpOEF2UThtTDZkOU4y?=
 =?utf-8?B?RkhKOTlEdEo0Wm5KMkEzSFpyRStRMyt4R1RVbVlNczBWTE5URWIyMkhDNnNP?=
 =?utf-8?B?UTE2RTFaOGtMRngyd2diTUFuNEozNWc1d2JSa1JqdmpwNVJ2UVJXUGI5NFRU?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82A6C7CB30AD6E41853D7EABD04057B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3eb59ff-99a5-4ec5-bf66-08dd737c9a84
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 13:28:36.1492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysV6ev8xspcVv4GnwKw9Bw0T7S0vA3t0th6FzfLF7Ab7pTZ7qJHzR+6A9+dPpE3sz7mLQmQhblAiwSP8DiajmK4K0vAiYagOjosVbbo7HjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA0LTA0IGF0IDE1OjA5ICswMjAwLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6
DQo+IE9uIDIwMjUtMDQtMDQgMjo1MiBQTSwgR2lyZHdvb2QsIExpYW0gUiB3cm90ZToNCj4gPiBP
biBGcmksIDIwMjUtMDQtMDQgYXQgMTE6NDkgKzAyMDAsIENlemFyeSBSb2pld3NraSB3cm90ZToN
Cj4gPiA+IENlemFyeSBSb2pld3NraSAoMTEpOg0KPiA+ID4gwqDCoCBBTFNBOiBoZGE6IEFsbG93
IHRvIGZldGNoIGhsaW5rIGJ5IElEDQo+ID4gPiDCoMKgIEFTb0M6IEludGVsOiBhdnM6IElnbm9y
ZSBWZW5kb3Itc3BhY2UgbWFuaXB1bGF0aW9uIGZvciBBQ0UNCj4gPiA+IMKgwqAgQVNvQzogSW50
ZWw6IGF2czogUmVhZCBIVyBjYXBhYmlsaXRpZXMgd2hlbiBwb3NzaWJsZQ0KPiA+ID4gwqDCoCBB
U29DOiBJbnRlbDogYXZzOiBSZWxvY2F0ZSBEU1Agc3RhdHVzIHJlZ2lzdGVycw0KPiA+ID4gwqDC
oCBBU29DOiBJbnRlbDogYXZzOiBNVEwtYmFzZWQgcGxhdGZvcm1zIHN1cHBvcnQNCj4gPiA+IMKg
wqAgQVNvQzogSW50ZWw6IGF2czogTE5MLWJhc2VkIHBsYXRmb3JtcyBzdXBwb3J0DQo+ID4gPiDC
oMKgIEFTb0M6IEludGVsOiBhdnM6IFBUTC1iYXNlZCBwbGF0Zm9ybXMgc3VwcG9ydA0KPiA+ID4g
wqDCoCBBU29DOiBJbnRlbDogYXZzOiBQQ00gb3BlcmF0aW9ucyBmb3IgTE5MLWJhc2VkIHBsYXRm
b3Jtcw0KPiA+ID4gDQo+ID4gU29ycnkgLSBBVlMgaXMgbm90IG9mZmljaWFsbHkgc3VwcG9ydGVk
IGZvciBNVEwsIExOTCBhbmQgUFRMIG9uDQo+ID4gTGludXguDQo+ID4gDQo+ID4gTkFLLg0KPiAN
Cj4gDQo+IEZDTCBpcyBhIFBUTC1BLCBQVEwtYmFzZWQgcGxhdGZvcm0uIFRoZSBkcml2ZXIgaXMg
b2ZmaWNpYWxseQ0KPiBzdXBwb3J0ZWQgDQo+IG9uIHRoZSBBQ0UgYXJjaGl0ZWN0dXJlIHdpdGgg
Y2xpZW50cyB1dGlsaXppbmcgaXQgb24gZGlzdHJpYnV0aW9ucw0KPiBzdWNoIA0KPiBhcyBBbmRy
b2lkIGFuZCBZb2N0by4gQXMgc29mdHdhcmUgbmVlZHMgbGl0dGxlIHRvIG5vIGNoYW5nZXMgdG8g
Y292ZXINCj4gUFRMIGFsb25lIGl0IGlzIHByZWZlcmFibGUgdG8gaGF2ZSBjbGVhciBkaXZpc2lv
bjogYWNlMS4wIDwtIGFjZTIuMA0KPiA8LSANCj4gYWNlMy4wLiBUaGUgY29kZSBpcyBtYWludGFp
bmFibGUgYW5kIHJlYWRhYmxlIHRoaXMgd2F5Lg0KDQpObyBhcmd1bWVudCB3aXRoIEZDTCBvciBh
bnkgbm9uIGNsaWVudCBkZXZpY2VzLg0KDQpJZiB5b3UgZG8gbmVlZCB0byBzdXBwb3J0IElQIHZl
cnNpb25zLCB0aGVuIHVzZSB0aGUgY29ycmVjdCBub24gY2xpZW50DQpwcm9kdWN0IG5hbWUgYW5k
IFBDSSBJRHMuIERvbid0IGNvbmZ1c2UgdXNlcnMgYW5kIGNsYWltIGNsaWVudCBkZXZpY2UNCm5h
bWVzIG9yIElEcyB0aGF0IHlvdSBoYXZlIG5vIHdheSB0byBzdXBwb3J0LiANCg0KPiANCj4gQW5k
IHRoZW4gd2UgaGF2ZSB2YWxpZGF0aW9uIHBvaW50LiBpbnRlbC1kc3AtY29uZmlnIHJlbWFpbnMg
aW50YWN0DQo+IChubyANCj4gc2VsZWN0aW9uIGNoYW5nZXMgZm9yIE1UTC9MTkwpIGJ1dCBzdGls
bCBsZWF2ZXMgd2luZG93IGZvciB0aGUgDQo+IEFWUy12YWxpZGF0aW9uIHRvIGhhdmUgaGlnaCBj
b2RlIGNvdmVyYWdlLg0KDQpTbyB0aGlzIGlzIGZvciBpbnRlcm5hbCBJUCB0ZXN0aW5nIHJlYXNv
bnMgYW5kIGl0cyBiZXN0IHRvIGNhcnJ5IHRoZXNlDQpvdXQgb2YgdHJlZSBsaWtlIGV2ZXJ5b25l
IGVsc2UgZG9lcy4gDQoNCj4gDQo+IFVubGVzcyB5b3UgY2FuIGJyaW5nIHRlY2huaWNhbCBhcmd1
bWVudHMsICdOQUsnIGRvZXMgbm90IGFwcGx5LiBUaGUgDQo+IHJlcXVpcmVtZW50cyBmb3IgdGhl
IHByb2plY3Qgc3RhdGUgY2xlYXJseSAtIHVwc3RyZWFtIHRoZSBjb2RlIGZvcg0KPiB0aGUgDQo+
IGFyY2hpdGVjdHVyZXMgd2UgZG8gc3VwcG9ydC4NCj4gDQoNClNvcnJ5LCB3ZSBoYXZlIG5vdCBl
dmVuIGNyb3NzZWQgdGhlIHRocmVzaG9sZCBmb3IgYSB0ZWNobmljYWwgYXJndW1lbnQsDQp0aGlz
IGlzIGFuIHVuc3VwcG9ydGVkIGRyaXZlciBhbmQgYW4gdW5zdXBwb3J0ZWQgRlcgZm9yIHRoZXNl
IGRldmljZXMNCm9uIExpbnV4LiBQZXJpb2QuwqANCg0KVGhlIFNPRiBGVyBhbmQgZHJpdmVyIGlz
IHRoZSBzdXBwb3J0ZWQgZHJpdmVyIGFuZCBGVyBmb3IgdGhlc2UgZGV2aWNlcw0Kb24gTGludXgu
DQoNClBsZWFzZSBkbyBwb2ludCBtZSBpbnRlcm5hbGx5IHRvIHdoZXJlIEFWUyBpcyBwbGFuIG9m
IHJlY29yZCBmb3IgTGludXgNCmNsaWVudCBNVEwsIExOTCBhbmQgUFRMIGFuZCBJIHdpbGwgYXBw
cm92ZS4gDQogDQpUaGFua3MNCg0KTGlhbQ0KPiANCj4gS2luZCByZWdhcmRzLA0KPiBDemFyZWsN
Cg0K
