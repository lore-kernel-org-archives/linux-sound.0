Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1523816E
	for <linux-sound@vger.kernel.org>; Mon, 14 Jul 2025 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484136; cv=fail; b=iJKDkkk1zEPuK8JIQH9/tniEpXKQ/uB26eZ5pmppKOw5ACxOqo9P0o8fugKb4ElG78paKmxMVTRHwxZobAAjJyS/lerDnrRw9Fa6dQYKvBo0s8qPfsIOwlIHjnL56sC5Kf7CyaadfyuIWgm2RrhT4ASW7dgIljdMtpSHsL6M4Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484136; c=relaxed/simple;
	bh=s6fWJcy3rRrz7fI9Bzk/E50Axr/icwCeM2PmBOupAoQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MhU6SDJR5saCqQi8yDKTGvUZfM5G46yJ3a0Z6xEJUmy1XIfJT9c3xEA0og9ZkiSKVUb1S4Aac5kUH4e5tXLvpVheRxeTuCw+ug8wzRQPCgPXJ54nB+KamrWqzr/wdRMpsUBnnXtfMaEhCfDwOIjrnL5N6jjkyBPsLxuRTkvp+T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiEzPYgi; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiEzPYgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752484135; x=1784020135;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s6fWJcy3rRrz7fI9Bzk/E50Axr/icwCeM2PmBOupAoQ=;
  b=FiEzPYgiM63RDurntqFR2sfIJYQb+OllSkXCEowNAt6erm/i0KtNafmn
   JAeiC0JgoiApPV6OaxPbZDHHnjTJR3cELKWmefbstbsR6gUzEKJS9VUBG
   il616u127kSbHh6ffPDjbjUTDTZnHAxkoFw0YyM9GCvcgWWMwnOMRF0Nc
   C4LQbm3bFPJro58mZ8mQNuER7NDDH2SFIoUEeQli9O+nqBrChiFE5qOAK
   xpQlyJb3CSXEVJtlrDEPaVOqh+sPvEb1iQYyJ43pvHyAzxKJwPz32AJA9
   1Lu3RAhdKH9GbMaHjof+7lFiaf3YghKGMSb3d3io5qr4IWztUILFFZ8Wl
   w==;
X-CSE-ConnectionGUID: TNt697OhQHm87N32G5y3ag==
X-CSE-MsgGUID: vdgDc9cTSfmH49v/VGd88Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58332525"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="58332525"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 02:08:43 -0700
X-CSE-ConnectionGUID: BccY62r9RuKzG50bINHasw==
X-CSE-MsgGUID: Jzev8BQfSZahuq40Yk71Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="162549392"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 02:08:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:08:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 02:08:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 02:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c04tPBCRRkKR4WBMnqV5kBDv4LWIVJCP98AahH/yZofe9lEvOp1WQnqGO9zBot4YJNz/RIyDVmXXLOXTp4RAoBgj8JZM5rg2Vt2GR/GjpTR9a1slLZFvZZCbb3jODexE+KG96Rbub04SrgilZZC7g19Byw4BdU5IvvQws5uZn+GzjKi8HDRDs8E0Z52M8x+yHb07pu1/HnHnvQpog7O+POSri1r/TzdCK/cYNCwxOap84Csf+brxo4Nm/R5imuCvVx8dej+8n8rOw0JioVTKfQXwVQMQ3U1mIR5ttrfpgNvPQPuzVBOpk4z1Rub/XlKBWySWxJzs4p8bM/7ZI8aXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEklfviSuO4/n8qXWMbr39HriY2jeSatKX/I26xPOxU=;
 b=rmSZP/rIRpAmGTDXWw2t25O3f9t5rKqBnJSywzmZzaadUicHalMCCVxUswflpXptPZ+mCiKRG0mTDhMlE6V8Ir9xK/ZJclF7hrsofhuRy2puOLdqyKVkGV+psoDUtYb5l6f1IfHc3whoVEz9MD593DlNHz2NWtqXgrCgwTmbk6n+lv8sgggt0ao1CGOTa91S3lnHw5DNiKF/nMQhTssegxr6xYCCGvuMBoGd+UuPIbNYVnS452CyzjNIHK3d2KP8Yaqtt6trHQleqjO1HrUfQYMZQ1j88xdU5GdN9SxuGaMLpoFcn0XzPnhfQcwSSLmny1GoZ2FKUXleDyey2mQR6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 14 Jul
 2025 09:08:08 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.027; Mon, 14 Jul 2025
 09:08:07 +0000
Message-ID: <b10d1812-85cb-4958-a493-185701dcdd0d@intel.com>
Date: Mon, 14 Jul 2025 11:08:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/27] ALSA: hda: Move codec drivers into sound/hda/codecs
 directory
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-sound@vger.kernel.org>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Kailang <kailang@realtek.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <patches@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>, bo liu <bo.liu@senarytech.com>
References: <20250709160434.1859-1-tiwai@suse.de>
 <20250709160434.1859-7-tiwai@suse.de>
 <b6ecdfd3-f5c0-4ca1-b38d-e16dc5ca2855@intel.com>
 <87h5zfqh1k.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87h5zfqh1k.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0076.eurprd04.prod.outlook.com
 (2603:10a6:802:2::47) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: f79483a4-874b-4f38-e923-08ddc2b5f2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjlHTnhFY0pUOURweVk1WEhjYWJrRTNQWUMxbFAvQVVZSTk3clBwWkU1T2Jt?=
 =?utf-8?B?MWg0RjJZUmM4Z2cvM2VBLzFVQUdRVXE5SjU0T3EreGlDY2ZGbFdidlovdXBa?=
 =?utf-8?B?YkVkZzdQMHprMnVrTzRuNUNFNmFib0VUSlZmWUYySjRJbk41NncvUmx0emVv?=
 =?utf-8?B?Qy9DN0k5WWtEUkZSSjRMRi9IdjkxRVUrYTVuNTJWci9ZWndnTG1UcVhMYkI5?=
 =?utf-8?B?bHl2ZlY2SVB4R2F1aklmc0ZYcVo5SW5pTVRNUXdqc0xyMVh0STEyNi91bTEx?=
 =?utf-8?B?UzdtaW1FN0lxMmUyRDkxMjZ0UGRKdng2cDYwdSthWmRzVEVYeU9uV0F5SHRR?=
 =?utf-8?B?QXY4cFh2Sjgvb3lBSkdkYWRmQTlLQkZnRjVHT2orWURvSndVOUcya0hVSW1t?=
 =?utf-8?B?WXlYaWRFcW11bWtjMHBMTmV5cHMxSXl0YXk2QjMyalQ3THhrc09kMm9rYU9o?=
 =?utf-8?B?WHJOZ0RtQzAxVHhSdVBzaWIzdmF0Q1d0UkQrU0Z3RVg2dXRmU2I2enUrL2Q4?=
 =?utf-8?B?R0V1aVNvd05KOGtzOUc0Wjk3S0dXbTcxeGRoMXB5dVk5ZnJFeHFiL2laZUZi?=
 =?utf-8?B?YTlsbjhrTUFmR3ZXS0Fkb2dSbHorc3MzTk1iQ0FOckN1cUoydTcrbm1oZVdr?=
 =?utf-8?B?eTRDMjFvbEtVNE1qVlMwcU8rTUYrQzFRVkRqTldJNFEyWGF6WFhWZk5Uem1C?=
 =?utf-8?B?TnlIRG11VnJSdG5rNUlZeGFyME5UNGVhcmhSV3hTcU5hUDg3Ti93REt2TjBE?=
 =?utf-8?B?SlJuQnZPb0JTSzRyL2diYkRieTlZKysyQU10Vm04NzhXeEtYL0hJalUvcXZU?=
 =?utf-8?B?UFB4dlhPengzTkNBdmJwSHVzZnJtWVZJWTBpUm5sQ3ZDRkxxaXZuVmRJWTI4?=
 =?utf-8?B?RGJYZk15TENvZXNmRWZmZnc4VnVzbDdEaUYyanpqK3I0ZzF4OWYxMXV5T3E3?=
 =?utf-8?B?TGp0ZkZjWnB5L3kzYjlUSE51MGhBaDRWUldXVVovaGVCZDN0VS9XV3VmRXN3?=
 =?utf-8?B?bGRTMitiY000N2JqdFg2SUtMMTVSdEJOOXJWRGJtZ2NiV01abjlFMHZMbEda?=
 =?utf-8?B?V0ZoSjlMQTA2N3dpTjAxMHlNRFNkdkc5bmdiYWc0ak1mZ25aaXl3bEVkT2Jr?=
 =?utf-8?B?MFJJZVNob04yWnA1bEZSYmFCamxHQ0FvL0pFT2pMWHBtU0E4alJFeU1qZVph?=
 =?utf-8?B?TW5EMlUzQzhQMTBGK2xHSUhOM0NTNXI2ZzNDUnFWbzd2cVJBTGFBbXdGUW1o?=
 =?utf-8?B?TldwZS9pRTQrS1htS0FKdkxZTW9yQmRZWnNxU0NFVSsvcFNhRkFYajB3MmJR?=
 =?utf-8?B?bHNVRXZ1cVFLR0Jza0MzUzJ6SXUweGlkVis0R0lsbW9vYmY4UGYwTk1MYVR4?=
 =?utf-8?B?Mmo2QS8zc0lMbnQzbzNQYncwMGNvZytOcFZOTi8xOUcrUEorbTZaY2VEZ3d0?=
 =?utf-8?B?TGxHT1lGbkhHVVp4akZKaHJZM0h6RFhLVlFlSUFFVXJiRnBzRDh5L1AzamN5?=
 =?utf-8?B?ZCtMT0Z0ZVZ6aDhETi9BeFphU2NXV3d1SzNXMzNpaVJWUm5vNFlUQ0R4R3Jp?=
 =?utf-8?B?UkhxSTM2ZnhhTEFHZGlDZzRybDlCcWFuNmpjYUgwdzVnYUZVRDkrNUsrY2wz?=
 =?utf-8?B?b0xIcm1RcllWa2FNdTl0R2psbVlYSGkvb05pdmh3WmY4cjMrUEhGWW0yQkYz?=
 =?utf-8?B?WGkraUVOU2wyRGk1RFpXYjZiSURrVU5ZNVNML05ub1VqZXNmbUNCRXhYZ1BO?=
 =?utf-8?B?aTVzaDRUQmdpWUxhUCtnOXZDd2MyQldYdW94ZDBmSjlWVDZ3TWZKWC9Zc3ZH?=
 =?utf-8?B?VTl3c1JnbWlCVEhxR0REK2RBbGZSTEg1MGpndGp1bkNtajhUN3Y3djdubzJW?=
 =?utf-8?B?eXlya29hd0V0VGlZdDhZMmp4bkNCTlAzS3pGbEpiVk1SQmI1SHJBd1ZBRExM?=
 =?utf-8?Q?a9MaXnrs8Ho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUVsSUR2YTVhbFc1eElkcFpMT1h2V3dsUmJ3dGlnZFovbnFlQ2tady9pekI2?=
 =?utf-8?B?UVZtaEZ4YU0yQkp0YTlkRTFWemVWeHI5Mis3NkJhaEdLdlpIWkdHRENXVVVD?=
 =?utf-8?B?TDNsbjhQVVpxMmlwM1FZeXRpN04ySkJBSzlydHN2SytNRG16Q3FCQjBUYWpD?=
 =?utf-8?B?akxlaTdneEJ4YnJGc3Rxbkh1d1NBQWVJdjRadXdLMTFBT3pzM2xpVURLRnQy?=
 =?utf-8?B?QUdrbm1xcVdYUm11ZXE3UTg5RDJVNUZuOVEydENtMGV4UXdRSUtOZmhXNWEr?=
 =?utf-8?B?RFZBck5sYi9DalFsRk1HeDVOZXU3eHkxeFNVeitLckNORnh3My9RcUFhMWdL?=
 =?utf-8?B?ZEVONkRqRlpWOGlMYUxTdVlVYVNGTnFpSHp5Vm5JL3htNkpmQnZSNkFQdmxn?=
 =?utf-8?B?S1hNb1NXK0pnR3NzUDdYQm9OYllsMXJzWVlmTytrZ1M1dUNDak5lRjZiRmRv?=
 =?utf-8?B?SDdUMVVYb1grWkVpdmk4RlhudWhrQzhINWEzbTZMaGI3OE1oNTBWSzJJYXBk?=
 =?utf-8?B?eUc0MXQzeDJsYTJmbHIrMHRLOVl5ajA1YzFicmpMc3JrbTBTbUFJbVpuaVkr?=
 =?utf-8?B?MUxXUXcxUnovWkNXWmtNcEtmVStXWW5tWlVLQUR0MXp0TG4xejFGdG9hODNh?=
 =?utf-8?B?YjZqWGZHQmlWUHJQakZrZlQ4ODhlVFArNloySmc5ZlRYdlFCS0tBN2o1VGRw?=
 =?utf-8?B?T3dGdnI0bEg3dys4MFZiYUtNclE0ekN5K2QwU0luZmhITVNLeHdscGN0a3Bv?=
 =?utf-8?B?b0wyQ0lhSlN2eG9WRUpYZjhGZTZraTFWbjRaOEVmVVBObWRoalEyLzkvS0tL?=
 =?utf-8?B?ZWczSEpxc1dad0hwZ0IwWEh1K0wvOXpISEczQXo4dWRGR0dsckVqbDJ0Nk9C?=
 =?utf-8?B?WmxZTGNwZG5nam9ac25PS3JzMWV4S1N4UHNEMUhFQ2thRTdscnUxTCtlVUZO?=
 =?utf-8?B?aHZiRlplQ3QxRktDOVNPUHZMWEY1eDNIUkFDR2t2NEg4QUxHVjZlVGRiUTlF?=
 =?utf-8?B?dllDM0ZWK3RDRkV6UlNNcG5lYVRtUXYzMTU0dkhBZGVISC9PZEtaRitHQXFD?=
 =?utf-8?B?S05Mb3JwWkl2NVZIWnNCUC9EVjA1cVAxMk5UVXNQSUxpTzQ5Sk5IeG9SVFJv?=
 =?utf-8?B?NS9qMDFwcDZPdFFidkU4WUsxS3FnRnpxTEExL0pkbG1XVmx3RXBZMXNUSnkv?=
 =?utf-8?B?NkFSY3dod2hmaWhYVC90Q0hMRzNHNGJObGFMSHNkVm1XRGZhQlJ1bUtQU2pT?=
 =?utf-8?B?bGhiZWdDUk1hSFZieWZ0R3FlUGxDQWNPdGJQaGNTd2NycmV3SkQwRzB0WHhN?=
 =?utf-8?B?RW85MGp0Y2VoR1NHZ0FpUkp5VDN1L0VsNmhvTXU5R2t3T210QTVMbHV5S2lO?=
 =?utf-8?B?WVpzbFhrVXE1TC8vcnVtVWV3cUdIS095TTR2Z25MZk1RYkRPdGh1a3FCMEhV?=
 =?utf-8?B?aEcrTW9xKytTTklLWXl2Mm03YUJoWHB4aHpXdExYOS9WSlNnMkJ6NmltRnB0?=
 =?utf-8?B?SlRFM3ZlZm00dmNaemVpNjlia25uNkExN0dkUk04RStmeFRRNEh2cXJaaFFr?=
 =?utf-8?B?RUFKcFJMT0N2RW1IMzlCMmRGQjdhU2F0cUdBNTlaK3k0a0p4eWRwb0FVcGxD?=
 =?utf-8?B?SElQUkt3dExpN3dQUlNHYThScmdiNU1renY0UEQxaFVTcUpRZTh3cnlZQWlQ?=
 =?utf-8?B?Njk1L3ZnN2FYeG1rY1p0WVhHU2k4STduSDZ0Uk5Qc2QrZUFuRmI3V0UycWtt?=
 =?utf-8?B?UkRiZUNWMUN4bVNPa0taQWllUmpaN045bE9IeWVsbWtYeEJqV1orN3RFUzRE?=
 =?utf-8?B?MTcyYzNHU3lZRDhyNVFYelFDckpMeUhabU1SVnMvSURYWGlKTzQwZ3psUnpl?=
 =?utf-8?B?UXRTbDEvMTJrZ0M2WU8zY0U0ZFdqTTdtN1ZHejhWOUlhYmJlSjNZVlhhUUE2?=
 =?utf-8?B?YnovZ0xnNkRGUXorZzFOays5TlpyckZOaWtxN1EvZXpwLzRkYmtIdHkwMVZh?=
 =?utf-8?B?clIwc0ozVVR3Mzl4bHZsWTkrRERBczJTenJOTW5lWFZHVFoyVks0RFF2LzZ0?=
 =?utf-8?B?Qk1tbGlXWThoNnBrUzhrRG5HMUQxNFFVYTJneHR1c0pIditvVUFlNWxQbjJZ?=
 =?utf-8?B?WENRUWduYUlIdEVYdG83WWhWU2c5QTQ5UnpkOXBQNjZObmpHSm5jUkVVM0Zy?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f79483a4-874b-4f38-e923-08ddc2b5f2d5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:08:07.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFMJqd3ivdW77wCIHZ9rkn19UnYd9cRLOaPifUXpa8oVMYdpNau8M0djW7kxlq/fyUatCtSC2YlPSY5CJPEGbQXFgdZXN22iS8ra+yNPqD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
X-OriginatorOrg: intel.com

On 2025-07-14 11:04 AM, Takashi Iwai wrote:
> On Mon, 14 Jul 2025 10:57:59 +0200,
> Cezary Rojewski wrote:
>>
>> On 2025-07-09 6:04 PM, Takashi Iwai wrote:
>>> Now move the all remaining codec drivers from sound/pci/hda to
>>> sound/hda/codecs subdirectory.  Some drivers are put under the further
>>> vendor subdirectory, and the vendor helper code (*_helper.c) are put
>>> under helpers subdirectory.  Also the sub-codec drivers are moved under
>>> a different subdirectory, sound/hda/codecs/sub-codecs, for
>>> distinguishing from the main HD-audio codec drivers.
>>>
>>> The prefix patch_ and hda_ as well as the suffix _helper are dropped
>>> from file names as they are mostly superfluous.
>>>
>>> No functional changes but just file path shuffling.
>>>
>>
>> Path: codecs/side-codecs/ looks wierd. My suggestion is to avoid the
>> repeat and stay with codecs/side/.
> 
> Sorry, too late, I already merged the stuff.  (And IMO codecs/side
> doesn't sound intuitive.)
> 
> Since the directory names are more or less understandable, and Cirrus
> people seem OK with it, so let's leave as is.

Oh, didn't notice. The series is large and I wasn't expecting it to get 
merged that quickly.

Guess no point in reviewing the rest then, thanks for the information!

>>
>> In regard to 'helpers', I believe some of these .c files could be
>> converted to headers and lie in sound/hda/quirks/ directory. These are
>> more of a platform-level files, not sound/hda/codecs/ per-se.
>>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>> ---
>>>    sound/hda/Kconfig                             |   1 +
>>>    sound/hda/Makefile                            |   1 +
>>>    sound/{pci/hda => hda/codecs}/Kconfig         | 158 +-----------------
>>>    sound/hda/codecs/Makefile                     |  31 ++++
>>>    .../patch_analog.c => hda/codecs/analog.c}    |   2 +-
>>>    .../patch_ca0110.c => hda/codecs/ca0110.c}    |   2 +-
>>>    .../patch_ca0132.c => hda/codecs/ca0132.c}    |   2 +-
>>>    sound/{pci/hda => hda/codecs}/ca0132_regs.h   |   0
>>>    sound/hda/codecs/cirrus/Kconfig               |  21 +++
>>>    sound/hda/codecs/cirrus/Makefile              |   8 +
>>>    .../codecs/cirrus/cirrus.c}                   |   2 +-
>>>    .../codecs/cirrus/cs8409-tables.c}            |   4 +-
>>>    .../codecs/cirrus/cs8409.c}                   |   2 +-
>>>    .../codecs/cirrus/cs8409.h}                   |   2 +-
>>>    .../patch_cmedia.c => hda/codecs/cmedia.c}    |   2 +-
>>>    .../codecs/conexant.c}                        |   6 +-
>>>    .../hda_generic.c => hda/codecs/generic.c}    |   2 +-
>>>    .../hda_generic.h => hda/codecs/generic.h}    |   0
>>>    sound/hda/codecs/hdmi/Makefile                |   6 +
>>>    .../hda/hda_eld.c => hda/codecs/hdmi/eld.c}   |   0
>>>    .../patch_hdmi.c => hda/codecs/hdmi/hdmi.c}   |   2 +-
>>>    .../codecs/helpers/hp_x360.c}                 |   0
>>>    .../codecs/helpers/ideapad_hotkey_led.c}      |   0
>>>    .../codecs/helpers/ideapad_s740.c}            |   0
>>>    .../codecs/helpers/thinkpad.c}                |   0
>>>    .../patch_realtek.c => hda/codecs/realtek.c}  |  12 +-
>>>    .../codecs/senarytech.c}                      |   4 +-
>>>    .../patch_si3054.c => hda/codecs/si3054.c}    |   0
>>>    sound/hda/codecs/side-codecs/Kconfig          | 128 ++++++++++++++
>>>    sound/hda/codecs/side-codecs/Makefile         |  28 ++++
>>>    .../codecs/side-codecs}/cirrus_scodec.c       |   0
>>>    .../codecs/side-codecs}/cirrus_scodec.h       |   0
>>>    .../codecs/side-codecs}/cirrus_scodec_test.c  |   0
>>>    .../codecs/side-codecs}/cs35l41_hda.c         |   2 +-
>>>    .../codecs/side-codecs}/cs35l41_hda.h         |   0
>>>    .../codecs/side-codecs}/cs35l41_hda_i2c.c     |   0
>>>    .../side-codecs}/cs35l41_hda_property.c       |   0
>>>    .../side-codecs}/cs35l41_hda_property.h       |   0
>>>    .../codecs/side-codecs}/cs35l41_hda_spi.c     |   0
>>>    .../codecs/side-codecs}/cs35l56_hda.c         |   2 +-
>>>    .../codecs/side-codecs}/cs35l56_hda.h         |   0
>>>    .../codecs/side-codecs}/cs35l56_hda_i2c.c     |   0
>>>    .../codecs/side-codecs}/cs35l56_hda_spi.c     |   0
>>>    .../codecs/side-codecs}/hda_component.c       |   0
>>>    .../codecs/side-codecs}/hda_component.h       |   0
>>>    .../codecs/side-codecs}/tas2781_hda.c         |   0
>>>    .../codecs/side-codecs}/tas2781_hda.h         |   0
>>>    .../codecs/side-codecs}/tas2781_hda_i2c.c     |   2 +-
>>>    .../codecs/side-codecs}/tas2781_hda_spi.c     |   2 +-
>>>    .../codecs/sigmatel.c}                        |   4 +-
>>>    .../{pci/hda/patch_via.c => hda/codecs/via.c} |   2 +-
>>>    sound/pci/Kconfig                             |   2 -
>>>    sound/pci/Makefile                            |   1 -
>>>    sound/pci/hda/Makefile                        |  61 -------
>>>    54 files changed, 257 insertions(+), 247 deletions(-)
>>>    rename sound/{pci/hda => hda/codecs}/Kconfig (55%)
>>>    create mode 100644 sound/hda/codecs/Makefile
>>>    rename sound/{pci/hda/patch_analog.c => hda/codecs/analog.c} (99%)
>>>    rename sound/{pci/hda/patch_ca0110.c => hda/codecs/ca0110.c} (98%)
>>>    rename sound/{pci/hda/patch_ca0132.c => hda/codecs/ca0132.c} (99%)
>>>    rename sound/{pci/hda => hda/codecs}/ca0132_regs.h (100%)
>>>    create mode 100644 sound/hda/codecs/cirrus/Kconfig
>>>    create mode 100644 sound/hda/codecs/cirrus/Makefile
>>>    rename sound/{pci/hda/patch_cirrus.c => hda/codecs/cirrus/cirrus.c} (99%)
>>>    rename sound/{pci/hda/patch_cs8409-tables.c => hda/codecs/cirrus/cs8409-tables.c} (99%)
>>>    rename sound/{pci/hda/patch_cs8409.c => hda/codecs/cirrus/cs8409.c} (99%)
>>>    rename sound/{pci/hda/patch_cs8409.h => hda/codecs/cirrus/cs8409.h} (99%)
>>>    rename sound/{pci/hda/patch_cmedia.c => hda/codecs/cmedia.c} (99%)
>>>    rename sound/{pci/hda/patch_conexant.c => hda/codecs/conexant.c} (99%)
>>>    rename sound/{pci/hda/hda_generic.c => hda/codecs/generic.c} (99%)
>>>    rename sound/{pci/hda/hda_generic.h => hda/codecs/generic.h} (100%)
>>>    create mode 100644 sound/hda/codecs/hdmi/Makefile
>>>    rename sound/{pci/hda/hda_eld.c => hda/codecs/hdmi/eld.c} (100%)
>>>    rename sound/{pci/hda/patch_hdmi.c => hda/codecs/hdmi/hdmi.c} (99%)
>>>    rename sound/{pci/hda/hp_x360_helper.c => hda/codecs/helpers/hp_x360.c} (100%)
>>>    rename sound/{pci/hda/ideapad_hotkey_led_helper.c => hda/codecs/helpers/ideapad_hotkey_led.c} (100%)
>>>    rename sound/{pci/hda/ideapad_s740_helper.c => hda/codecs/helpers/ideapad_s740.c} (100%)
>>>    rename sound/{pci/hda/thinkpad_helper.c => hda/codecs/helpers/thinkpad.c} (100%)
>>>    rename sound/{pci/hda/patch_realtek.c => hda/codecs/realtek.c} (99%)
>>>    rename sound/{pci/hda/patch_senarytech.c => hda/codecs/senarytech.c} (98%)
>>>    rename sound/{pci/hda/patch_si3054.c => hda/codecs/si3054.c} (100%)
>>>    create mode 100644 sound/hda/codecs/side-codecs/Kconfig
>>>    create mode 100644 sound/hda/codecs/side-codecs/Makefile
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec.h (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cirrus_scodec_test.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda.c (99%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda.h (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_i2c.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_property.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_property.h (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l41_hda_spi.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda.c (99%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda.h (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda_i2c.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/cs35l56_hda_spi.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/hda_component.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/hda_component.h (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda.c (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda.h (100%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda_i2c.c (99%)
>>>    rename sound/{pci/hda => hda/codecs/side-codecs}/tas2781_hda_spi.c (99%)
>>>    rename sound/{pci/hda/patch_sigmatel.c => hda/codecs/sigmatel.c} (99%)
>>>    rename sound/{pci/hda/patch_via.c => hda/codecs/via.c} (99%)
>>>    delete mode 100644 sound/pci/hda/Makefile

