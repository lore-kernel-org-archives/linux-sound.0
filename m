Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F63B19DB;
	Thu, 20 Aug 2026 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215192; cv=fail; b=cUAqNUI+1zwWbE0Pyajr4/Bj8x2qqONyhLmwNJ87IZROGxw6/wmd7JbNeb02O1gj49vCX5+OJzPp/cf7EWlerkrzN7qTSr+o9WHTiIJ4pFy/t2q8QbYhKxSbNCNuAkm55Fqgmbc356HeH1HXrow6Ol6/15EllLwsjMHW0C7bctQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215192; c=relaxed/simple;
	bh=5Fc6mtBs7m5y0soqNkhvFuSgJGIGQ9L09rbMjF3lbg8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c/MnZZQoDtZvO5RCU0HLAQ7GCdaTSHr365kJjSuT9EjIiO57kGGMMmyhngdoVCIn8jyAxA0U+kYFsZMfRBkNdTdiQw6MLPEUxk8zC7dYz1LIo+jpIIQVE0l1wCxwk+/G/chY6nDxFrxo7phomD/2uVUe0y7X5UkXpxcxSCHqHE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqUpcX87; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqUpcX87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787215191; x=1818751191;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5Fc6mtBs7m5y0soqNkhvFuSgJGIGQ9L09rbMjF3lbg8=;
  b=ZqUpcX87R36wsaQ3cYwG+8CvpOIvbAjny8Xc0/NaMa5JXs39ePhyOnsr
   X1XTk516LHqPq4UfAA8WLspyCeSqNCsqllYEK0i5KNdckM6FCOr6mJjkE
   9KWx54PMBHPOSC2WR5uACAFkRjU9lRMM8nQjv1MNi4Xd2x14cnDLO1ifd
   Zs4V1neDc7aRDIfToczNG7Er8e6RoC24I/98wjJnwQxaQWbz1RpU30Cqs
   pyJZiGZQyLSp4/1LcZVmrr7lCTZ65vSU10DibFDU7RRIAXYB57/78Jdgp
   Y4AtO+grGrDcqi3LCzxXPvVF9+yEKJDyp77DxDmQLRX0kXIbsuqIGFU7U
   A==;
X-CSE-ConnectionGUID: nrEL6oj8SpSi+mhdCtpdnA==
X-CSE-MsgGUID: 0Y2b4ks2RuapoV2eFhKbhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87758319"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87758319"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:39:51 -0700
X-CSE-ConnectionGUID: FW1eo9caSPSNNPbOkI2gVw==
X-CSE-MsgGUID: pZaEKNHJQ8WHAtvGOf2qcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="267868312"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 01:39:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:39:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 01:39:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 01:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbL8GKzb3+u+fuYf81jNzlEh9QGt4DJrcFSYZuWrUUE01+/w5j70sv1HDKIOLHQ1keZurGBgyx1dfbmZXl+NZv2yAB5EIsNVSBTgjTmlagupttukQWHsr5t2TLvUcR9rIqf3nq724GdEdIL06WgCnOz6ELMIn53OTjXVBycQYvNCjrI2FO63XoF+7os3IuK2iiNRqX8VsrDBCxhCOL5ueqfYXt6d5k9Xdyo1ZvaiT2AXuI1EYlT8ZdV2OsUXWj9HYewzNT0MoKASWr1v5GV653Jy+lXZQwV7pu7mJYf2apuyvEvdPjtpgwZoXnl4dOCnVbZgE+mVciMxFcZQ8cPpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mY3GcucpUA6giQJAXwW4zr1AHe5dos6FejXDYtMQoFY=;
 b=PpljmbJX87lnzIVIkBC6+50+372jFaAFrF8W7RP2XIA3uwi5GMiLDsyISaJkWAPv7g96Imsiu/ZCcB4mYrXuuVd3jCggkFW2DXjzevDORLc2TTM9r9nIBb96sjCE/L0TauVCFT0kz7OQCouqWyT2+4fOz+edvUWsdmbsqyziKaKai/CBkC7BjIkrjLCDR0r55LUckema6O2poAsVk1ZWg0k18P3tMIkl2gRZbIAvyAsNZw+sFchfYwnQyateqY+OsU612kIwlNtjt+SRXBdIwXVkrb95/o4og1F2icLo8rMV7yWq2qKd8wJmljyE5NN/QX0RJhhVMJNHAyUFjaoZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 08:39:45 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 08:39:45 +0000
Message-ID: <8feccd0b-a5d6-4834-b848-0206338b6b6a@intel.com>
Date: Thu, 20 Aug 2026 10:39:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: mediatek: mt6797: Drop redundant probe error
 messages
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
 <20260819101736.67632-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260819101736.67632-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P309CA0016.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::14) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: 522e92e7-e079-4c11-c386-08defe96961a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: ci4v5kMV8DPlFq1NAwGCFKso7Jes2XKDKuSz8+ROkWhlNkkEc9nt5380dqz2HNS3l6KlKmKxEs9GdMMUEoUDHZ70J5u5jzQxTs3DLVez2ICglracyRloXplsJuUX6woh+HvLYfx4EaWXe3s9yvpkCe1znd12MvodcU5GcBXdPPJH3DqhpKTUOCwcOHxXdqZLxDdQIBXaR6CjXucAZnMCLuO4mMPldvJo0gcNMTkF+nt0uDHr2tRw/m57vP48RjbpAOKsiabak8Cxm+CYE0sbs6B3nipGD0kgQ50o9VpPRRAy6U5h6P4UuOnDScdJ0/XxQOWXblJOxsvkRfrbx8gq8r0RoKoIu+Tw8oUfs9kYMRfRS7C8zwLPN5pGqU6jdWOk3Jj9q9egvnttZZ4xP4MRn+mLJzK49X6v0mNDA/jnzuG8jDo9sX+LNF6J0jluCBJjWiR2YHDq3DA7PPafJg5LDiTZ0+uUkDwFSUpgmSMySr1CF/nFN7yktQdd8hPe+3TFarudiigotYbR9U1zJlptrNXb3ZjdRvBd4O1N3nMeB31thhs8lI45gFBdoqYD72IEdCnjQ4qcGyrhAkO4SLv1G8xL6m1etVAXojIvOLlIatvjs8Ry+073sbBLqXT7MdJXgJF3vsfde6M2AJXFs6CeIo7oSdcuIDi7bnEu2OrtgH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTBKbUlRQ2dzM21reDdFbTV6ODRCYU5XL3AxNi9XMU9jRTVpVmhub3UrZWFp?=
 =?utf-8?B?UGNRWUtsVUJ3NjFORTBSUTJBbXVmVGNianZoUmpmcFVtcWpKRXlIelFBZ3FN?=
 =?utf-8?B?Nkdma0M1RVVNNzY1MkZraWJkVS9aTDE2bUJWdHR4NlVhY0d6S0RzdTQ3T25j?=
 =?utf-8?B?ZEtpTnAxeDJGZUorekFOckJ4SXUyNWNRRjFla2hzTnU4bTQ1di9KaTg1SzZI?=
 =?utf-8?B?c0hJazA3TThsV3BOQjhtV0o3bHVaNFBpQ1Mxd3NPN1Y2L2I2U0cyVmFKZk5G?=
 =?utf-8?B?Wm5OVGI1M01WZENQWUROUFpYdHFsSDdpSkdZSzBnY0xnOW1ObVZHV3hZd2d1?=
 =?utf-8?B?TS9rRG0rT0Rick04WS8rb2dUVU84QTVTZnpmb2Fab3FjRXU4RVYwSDRlYThi?=
 =?utf-8?B?YlV2U3lVRXJFZXZTZDhMaDBqWTNxWU9LQ3l5OHBWNCt1OTRxUUNzOGRxOVlp?=
 =?utf-8?B?V090MnlqcEZQOXBlb09EZ1IzZmVwY3I4Skt0U0pWeXlTbEIwZ0V3TU1XdWR1?=
 =?utf-8?B?dnhjQmVWbFU5NFBKSmdvRGRWcHRrUzlHK0hWUmVRYVVZbGczaGVSbkRET29C?=
 =?utf-8?B?V2VaSzRPZEY4V2dIcU9OaEwyWUxad2NtMTVvcFF6Vks3c01RSjZRSVBjRDc1?=
 =?utf-8?B?V2N3YjZZRWhvMFNGRFFQdzVFZUYvRWFUdlRCYnArb2pNTjVud3hCc1BnS0Vh?=
 =?utf-8?B?bU1IbmMrajNzTnludEttYlBKdlJZWnVsZURUbWRsNWhPRkl0bnAzbVFhNkt4?=
 =?utf-8?B?VW5WTE80OG1KaEdjTmVHNVg5cmtSdmNGS2xjZStXNGJTbGdzS1lKZmR1ZG51?=
 =?utf-8?B?TkRUS1hhdmtjb2RsSWZkRE1YcXhWZllEQmJNRlJna3ExZTI4ZHVGZk5lL00y?=
 =?utf-8?B?ekFFZ213cnpRUUdYcjR1cmtEM1VMcUhtNTJPck5UWHNJakFGYUorbXVvZW1s?=
 =?utf-8?B?eVNoQWs2YkVJV0xzaHJQSmpZQndDTmtNeHp1RGsxdVlyUTRpRXkzejBrUSs5?=
 =?utf-8?B?Mm5ldUNya1pjZWtadVBqNmZ1ZDBxUVNvcnZuVjdhZ0ZQYzF4SVdkSkhiRzNk?=
 =?utf-8?B?UWZuSFBtZTNJWlZhSVJXUUdBdmxoY3JBV0ZWNGhvODh4cEVuUTE4SHdBZysy?=
 =?utf-8?B?WG5iL0RaazNRTUNNTk9LVzZabklwNHRhVEhUem56V2duM2x1dWNiZFV6N0tY?=
 =?utf-8?B?VitJUGJxQTdod3kvc0JkUzdmTXdRRjB0UzVFRkE5bDVLMG41V0phbnpxQkRY?=
 =?utf-8?B?OVNCaUpiV0JpMktpa213MStERWpnK3QzNHRPSEVsRW1ZaUxnV2pMWnZHUG5q?=
 =?utf-8?B?Ym94blFLa2dEaHRTYndNUE1wa2FxcUlpd3F0WlVoenNaSE1HTVVXcHhHVGRG?=
 =?utf-8?B?RDBTZktWbUFBTExDa2txNXJBUFA1Rms2NXdOaFdlK1JRcTJrcjdKRGhYRXcx?=
 =?utf-8?B?OXA4RFVoKy94YzFVMHY2dUkzb3czRUdwZU42SGlpSGVkeWFjQ3FIVnByM3cw?=
 =?utf-8?B?MUFBYXFlTW11VlhUc1BzbzQ2SEs2dCtMRHdRQlo2K2FPM2RIRi9PU1plNWlB?=
 =?utf-8?B?SDBRZWFnWWZkbXVGN2Z5Tzd0ZVdJYTk1eGhxaGRzc1gyK3dnVnB0cFJwUER5?=
 =?utf-8?B?VXFlNTJHYXlXcHRNZHdxcmxvV1dick9iaVo2ZTRDamFGKzlEaWQwMkdGMzRZ?=
 =?utf-8?B?b2dFcEY2UXIyd3BESys3aktCWnJTUUdrOXJYK0dJU2dhUCt4ejgydkY3dmlZ?=
 =?utf-8?B?WkdWcXQyUllGQWhnMUtVd0VhMDNTNStTR09WQVFZTGJiR1FXbWVzbTJHeDI1?=
 =?utf-8?B?SmtYTW5GcG1lcFRGcGFPemxZQkVMKzM5bkQ0ZEdEZ0lHeTl2YXpGdTdOL0R5?=
 =?utf-8?B?aXErcEZjUWlTUzZVODRQRCtLOGFOeC9uRTAza3RJLzZCM3ZQbVlVMDVlZ1V6?=
 =?utf-8?B?OFphL2pXSmF0Z1FmZ0dNTXBWWEVnRURKcTgzd1RweUNHdFFCYTJrLzZ4OExB?=
 =?utf-8?B?Z0FUeE00dTA5cDdIRUg1S09NYkt1WVNpZzVwaWVUTjZBUWpqWVBYQW9YYWh3?=
 =?utf-8?B?MzVTV1FjRkU1eU5vYTcxcWo2TENhWDBYQnFrQUh1eTlZTkRYb3JTU2xZcmZs?=
 =?utf-8?B?UjRZUVJScC9jYWdpaWJPNEpRL1ZNR2M5dWc0VEtHQnc1QjR3QzJzT2RueWYw?=
 =?utf-8?B?YjlFL3g3bTNHV2Z4b04xSWpaY2VKNkZHNU1pNkM1RGNGNHZSSGNzOVNLZ3Jp?=
 =?utf-8?B?WHBIeGhSYTI2SXd1UXZPSHk0NkIycGJNRGJlU2NVN2FCTkJPd1hDRFE4WGs1?=
 =?utf-8?B?NTdRV3BEeFhFc0tkOEp3TWJUTnAwOFI1M2NVNEhENDRKVUVuVkZ4UT09?=
X-Exchange-RoutingPolicyChecked: VhyX9QsiNfFAyGoBMYHocUWhLm5kdzjwxccCozM1os+NVqsBUdiX3MDQc8cUf4fytPUS/Ek/rOtqqN71/HZqJaxFq7h9XJyk51lYyaGEa2yE9HbOip58zZMymRtpPCl5VahM1knO+W7vvA8flQwXue31tilaYmpRjeTS17RLH8NVf1c6ozkhvsN5YVEvVoCJRRtk+exFMRtnnmu/giAZQ97oTwVZC/sVbIjD0UXdgRSzTMiemM+VsShGFlvYAvraY5K3DCghf8v08vR5Q5wWlS2gagd0kW0vJ4D5WN8ld03PQetoIja6zplLVWPS32C4lZWlNT9FK675609YonCRDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 522e92e7-e079-4c11-c386-08defe96961a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:39:45.2057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VL4D91TrGPYwNGWnk7otJsf3eG8X8qtYIg+npu3ifagAbkM7R0Tkh5hpDDq9YjyTDZetDF2JJWEMh1S++9P5HOULB3gqz0qhR1hM1ZZvX4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
X-OriginatorOrg: intel.com

On 8/19/2026 12:17 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The errors handled here are already reported by the called functions,
> either directly or deeper in the call chain. Therefore, the additional
> dev_err() calls are redundant and can be removed.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
