Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008B911CA0
	for <linux-sound@vger.kernel.org>; Fri,  3 Jan 2025 01:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735868437; cv=fail; b=pYTe273BmQdnaGBdhZvBg5R3wAKF5XcTlqsHQl6A0wBMo4f7axedPfSi5ppzwzaMLz7bu3uWUFxTxFYrzs8ou12N2qsipV9/MbTGP8IysAeTf+AX2933LSMEdhaWgvm2qUgv35daMr2Iy9QQIkVcX6W4fQMjBZG9G1POg+kel3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735868437; c=relaxed/simple;
	bh=QDkTFj49R5xG/Ahj1AT93QUtRf4cpkb9HCm2zC1K4VY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L88GMZWdGMCVaNw3yepff/aog3pDMhoPZQ+0ORYNcAI4a9AsrfD4E/vFZOMdKfKpGGzZ6W8C9qSknIvHqycJY0/kwQf1xMQEZK1zyGaY9N9beX4pTWb89Axa0HbXm7u+Gn8baejgDKfNVbR6Qu5M8gjuqK6/dBS7qaHqtYDYXHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sjgg+E+G; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sjgg+E+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735868436; x=1767404436;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QDkTFj49R5xG/Ahj1AT93QUtRf4cpkb9HCm2zC1K4VY=;
  b=Sjgg+E+GdyJK3Nz5F9ZTqFV5qNM7UniVzpLGH3Q/tEv0WyC3AUwOeI1S
   75WdFylLcbCldas5185cq3nrsgZSidEuWX/JzDSvqRBSwFotVa0dKoe/o
   nstGyFgCIiQwxQXl3HySE3+zEVfMZFayVDr696E1fsKDsbsk0RXPOaqJG
   UEv004Ga362xsj3y2nscrXpsWER7z4K4EeYLJraL5EFEjag3lTkxCZNJ9
   QQVlr9tr04SMLX9ScxrZhSz4EbiPm24nOHEvc8HZRUTibsJFIAQCM/4tH
   l+jeWFuySNxTpvGJTM6V5L23/xLWAf0GCxuapQIcCS8y0uiF93t8qmiS2
   Q==;
X-CSE-ConnectionGUID: +xFH+9acSLO3qyrttAqZWg==
X-CSE-MsgGUID: 38Y2oosNRhaJfvNN88iivw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="58584274"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="58584274"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 17:40:35 -0800
X-CSE-ConnectionGUID: S6AikgSDRtqdCMpHHqfLLQ==
X-CSE-MsgGUID: RYWpFYRQQV2l9oD47dCwYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105701246"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2025 17:40:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 17:40:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 17:40:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 17:40:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbDQf8RpXUXawBLwCZFWYYKx1zRujxS5LP7IilV0LEVupk2ntw5F/W5bjeMBdDMm9X/sTGSC6RzTxV/bMMinSEnZoki+Q3Q1CmhTJ1jIfCOkjLLdrA2Tmir/3lDE3d7OBs6OsUpdCZ8qtQLscxm04PH3zKyPr29zyXZkrlybMQ9E7yLi7hsahpnyXaQhtNp6sJG+5PkP6Gx/D6+mIXD4NbWTwsEgephqguWkiNWg6bLboPDWoyO4VnV/kbn9kZAfSkCqwKCJzIhDf+/pu0Cl4yW82VQRsiAHnZ5HpUpN64kvwThBM3ha7qvCY+rVOC/d1w+ROHtCNrTRix5GSbCbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDkTFj49R5xG/Ahj1AT93QUtRf4cpkb9HCm2zC1K4VY=;
 b=Tojg+ivLXaEroDfcwwLW2uROyeJNJsj2aUgrVKiY2L25low6v2cT2ybXL3K/aRDGwmQIcEQ7vfewPm9TGmN2xNiUmM9PjMKkq+fSfSQ9lLGr1Z/OOvsPCIFx9dECQZrWA9iKBK0KsfxL5jbCmvokM7naeTdLG08H4EqMNrMHmobvpunLNikiorjXrozEDYbUponLiwMcB+G/P1vvCdva35GXM4EweRAR7BuMHLafizT4KpL3fHF7/bPe98IDVcPYQo2z3gV4wT2n1xxH/be5uSxD9cKccNO0/IfJ2w0O6ShKotbzkKXCshmrmygqLHQs3DYDFN5bF1fdeM2ynSqe/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 01:39:56 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%5]) with mapi id 15.20.8314.011; Fri, 3 Jan 2025
 01:39:56 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
Thread-Topic: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
Thread-Index: AQHbXRKVa5Hvu2InnUa5mFZHeLdtILMEBXcAgAAnSvCAABbLUA==
Date: Fri, 3 Jan 2025 01:39:56 +0000
Message-ID: <SJ2PR11MB8424E5B23AF2CFDA5D4D8CDFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
 <20250102123335.256698-2-yung-chuan.liao@linux.intel.com>
 <ee83bf81-dc3f-4452-8ae3-4c4762ad7b86@linux.dev>
 <SJ2PR11MB8424334022EBCF6B4C375DCFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
In-Reply-To: <SJ2PR11MB8424334022EBCF6B4C375DCFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|CH3PR11MB8443:EE_
x-ms-office365-filtering-correlation-id: 6fcf3366-9db6-402e-a718-08dd2b978766
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dzc4KzNnWUs2ZUIyN2xILzArTUc2QnhGcXBQdXM1bGlYOHVQNmdwU251cjh4?=
 =?utf-8?B?MGcxcFIxMXViaU81UWdsbC84eVJUQnhTUGRIbzA2dmVTenhOY0ZYYk44cDJT?=
 =?utf-8?B?cHluN0FHQmt0ODdHUjlzYVJ2Y2NaSkdlVWM5UmlnRlRKdWxYd3dKcSt6WEhW?=
 =?utf-8?B?TXZpc0diSWxYaEt1b2RJanR0YzlvRU9mUFJsb0VtS2NtQXBhKzdicTREbnlE?=
 =?utf-8?B?ZzZIMExyOVJEemVMVXNzNk0rNi9YdFpWZlcxVi9JYnl6Vi9kK0xxalNuZjBN?=
 =?utf-8?B?TDVrdlFwM2VqWHZiUkpEN25yRVBFWlNLOGhsc3cxS0ZLZ1ROVHh0YVRHSW9S?=
 =?utf-8?B?bXhnNUEwZ3pBT1h0RkhDdWx0akZGRzFId296Qm9adU1wcnlzS09uV2lyTUtt?=
 =?utf-8?B?cEJBOGcxK0VDR2UxalNhclZ3REV6MWh5QUFxcWtXaTVIZEJqUWZmRDhoZVF4?=
 =?utf-8?B?TGtoaWlobmxRY1dmS1g4ekVIK1lkM0U2bERyZzNTSk1lRWZEdmdYaEtNdGtz?=
 =?utf-8?B?NnM1dWxHSnJJN1hiR29Uc2ZxRmEwa1orZStPc3pNY3Y1ZXdUNUdFWUhCYkFD?=
 =?utf-8?B?ek1ZZHFTOTVlTG9RRHh1TUdEK1hwbmUxaXNkWjNXSHRlNGZTcTFoc2I4eGFM?=
 =?utf-8?B?ZHFQKzBqWFIxZXJKRUVBaWNSOVhCWGtuWnNlSUMrV0F4aXlyVkhHeFJYRlZp?=
 =?utf-8?B?MXNjYTh2V01NTWNzYUgwaWJ4cmJqVnkrS0VsaHZyWllxNFQySFlsaTZNbzhI?=
 =?utf-8?B?TWNhWVRqYWpockxrdUN3c2tqRnNwOEV5QmRlV2pXTUdHUDZ4UUdjcHZBRGIx?=
 =?utf-8?B?bjRscUhMaFRQaktkRXhUY0ZwNHM1bG16RGlyZ0tRSVBEZmpQQk8vQ2JhaVdT?=
 =?utf-8?B?NmdmdEx0S1BpL0Jib0JhQWdMZzMvUURzVmdxS0laTE1hRmhKT09zUVQ1L205?=
 =?utf-8?B?aSttYnpqRlJvend0SlRlWkVmMXhOaE03MkRod0libEwxVGNNL2xDS0o2T2ZD?=
 =?utf-8?B?R1lzb3NIZVYyb01WWHJrY0NQK3B6bXk5WEc1M1Nnb0o3Rkc0WjY2eUdnM3FL?=
 =?utf-8?B?ZEpQQ0R3MmxYNzBLSmEvUnJERTB4bXllek5EeHZ0UUxUNFJIUW85WTJVUWhy?=
 =?utf-8?B?Zm5HQXhuMEhzNzY3eDlNckJMU1liSU9xNXJZV3l5bVpaTjdnQXJ4L2xZTi9z?=
 =?utf-8?B?ZHRUY0lhNno2T2RabWNtd3RhK0lYbytGR2d6aU1JSVg3RFlTc2R0dlFnYUZS?=
 =?utf-8?B?dExNY083c3Z6VjBteFUrV3BjSHFWS01SZndrM1hBYzZsZFgzQmhHbXBKQkFH?=
 =?utf-8?B?VkN3bTFvZE1ZR1JveEoxUlhKNE9LbG9Sd2R4M0xRU20rdGdvNnJMN056OVJX?=
 =?utf-8?B?S0xJd3A0b0I3RXJXU0lVZDFpbTJxR2NLTkJZSmplZ1lYTDUvbjFsU3lBSnlz?=
 =?utf-8?B?eDVWVkJzbWFKSjdwRmdNV2NqdVBuTWdJbnE5VE04eTdkcUhXSER6YkliVVR2?=
 =?utf-8?B?Z2ozYnpjQmMwN3Q0V2JMSFdvTTVRa2VTcFJUUFF2SUZDck1WUGlxT20rckM4?=
 =?utf-8?B?WThSMm9wZnh2WlEvTGx2SGJ5Q1pjZTRuRHRBVHlLY2xERFZISHBkaDhJWFdN?=
 =?utf-8?B?bjlZRkErblBnVkdpT2V3R1pTWkpyb2JLUTVKbTJBSzFSUVZqbDNZdDV3c0p0?=
 =?utf-8?B?ZVc5Z2IwNDBVT1ZBcUhPVHBTTDRRL3FNYVJ2b1Nhb0xUdDl1VWhJUjlyaFZF?=
 =?utf-8?B?akxwVkJjRm8vdXZaTzU3TnVQV0w4dFN3eVJGSzBZaXRVNmJwc2tnY3p6Lzhz?=
 =?utf-8?B?L1hBaFlHOFdvN1BjZG5XbGZ0Q0laMXhIT3R2WGhmTDV6TVNBYmxTUjJuN3lq?=
 =?utf-8?B?RGg0RDF5cVFBZThmZkhFT1lDMmhrWjlQeThGTCs3cGFKaEl5dHluT21yRUpr?=
 =?utf-8?Q?Lr1ytchFk5DVe68//F0WvFc8VMihmeiB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzdGbUxDSVlIVHFQQm9FRjF4elRrdDk3S0gzdEZnYi9aNHpaQnJTeU9MYTdP?=
 =?utf-8?B?dlFjWmdwZndsRDBoZjVaYm5CS25jdUdqdTJNLzVyRHd0Q0ZXK1FJNk02ek1X?=
 =?utf-8?B?MW1IODdnZDZ2V2liU3hta0U4SHkyUFRrcUVkbnI2OXdOVzB0cHZSYUlhYWJq?=
 =?utf-8?B?YmlwNUNjajZMbUFkc09ZTGl2NyttTEVFQnQ0THhnQnhJTDV0ZFhIM3FCYkJv?=
 =?utf-8?B?NVRxQ2FZcGRpdjh6RlFxSWJYQXdEV2prY0dGbmh1Q1JrNFM3T0tsa3pJRW1s?=
 =?utf-8?B?andUVkxYOXRNR0JvQVB0eFUxSW9BRjdaazU1SE9wK0pvVEpBbWJURkxvS1FK?=
 =?utf-8?B?RDhGNXF1R0FLM0RrVGVJUFJHc2hiMHY1SFBxaUF2TGIrZnc3MkpBSkQ5RHFF?=
 =?utf-8?B?dngrQTUrMkVSQzh3WUVrTEUzVzg0eUpWR1ZwN3VDY0t1Tm8wY1ZGVHFHV2dk?=
 =?utf-8?B?NDEzK2pndjhSNmlrWkNNVzk1b3VDRDJ0MVhQNFVhRm81WWRzVTN5S1NUNENB?=
 =?utf-8?B?ckUxVHU5WmNtVC90d0JUdmdQb0F5bEMxeGIrZktrczd1WkJObHkwMU5YcW9z?=
 =?utf-8?B?TFJwbFI4Rlkwbmp1amp1MlYxc1BQdXkwa1ljdGZ3YkhyTjRPUktadUJZd1Ay?=
 =?utf-8?B?WFdjb3NXTDVPdVBCcUlsYjZZTmE0SzJtdnlpbWIwYWdTaXBDSlZvaXQ5RC96?=
 =?utf-8?B?ZmtFczdDTHp0UXlScnZ0Z2oxdVV6MHAvQXJjekxDNW1SR3RZc25GU2lYRXVP?=
 =?utf-8?B?TnZ5RTI4L0toYjYvRmtySVZkOVcyVS9OSThDbzZqc1ErcUNnOWU5aDFWT0tV?=
 =?utf-8?B?SFdNeU1tQ2pUMHZwdVk2S3Nrc1FXM3poeUo0YkNjRWlZekkwVU9pTmpuRzJO?=
 =?utf-8?B?bEZWSVM0cXdKQndXYXZVMUwyWjMvTEcyekxyS01jU0JZd3JjSWFLTkZmZmJq?=
 =?utf-8?B?NEd5K0RUbWhsMVkvamRRdFcvRmVrNXlKcmwydElzZ25rekhWVnV3eTBkNllP?=
 =?utf-8?B?T2M5NlB6T2ZsYmo0UEdMSUpIeis0eENFUHVucDQwZEFQU0diYUlwSkNCbDMw?=
 =?utf-8?B?ZnBmMkxrcUZVN2MzcmJaM2g1dWhINVNiSmRoQ2xnQ21EdFd3WkpLNDBQZ3pD?=
 =?utf-8?B?eFp4ZE5VOXdSaGhMR3E0VUFCa0NKRG1td2YyQUN4eGkwR21WS0tlcEU2S2hQ?=
 =?utf-8?B?N1FDTkdNY05DaVlOLzl0YnN0TEMzQ3NUeWpFSEZZMEw0S3BaL0s5QXliWFNk?=
 =?utf-8?B?Ykw4cGtlRGVRRUJjUW5nNzBqcysxa1hKTG10Y3pucnBHSWo0WWt2Ync2bGh5?=
 =?utf-8?B?aW1KeU9uK2QzSmNYMGJOeFNpOXduVXBsOE9oN3V0TkJWcDZWbG9vdDZMNCtI?=
 =?utf-8?B?dXEveGRKc3BOZm1kQlNEb1lmZGx1a1ptak16K1U5VU01OTJxYU5RZnZCNHpn?=
 =?utf-8?B?cVFQajlyZ0pac1BwSDlranBtdW5PYVJsaURTRXV0YTk4WG9HMzhXbG44OUpi?=
 =?utf-8?B?d1ZnSzBwSTlrcXEzTjY5ZGZVRkxvV3BGaGNIN3BReGtVT0d6VGtyTmFPWHBn?=
 =?utf-8?B?NTJ0UDJ5eVlpZkZzUC9KZitQOHRTTXRLSW90SytRV0pPTXhTeDZ3Vzh3U3pQ?=
 =?utf-8?B?SS9ieURKOXhGTU4xN3Y2dUdtckkxai85cVViay9sT1hxQ0djdnNnQWZPOHhu?=
 =?utf-8?B?a3pXTlExNmRnYU9ScjhIZ0FaVk01bENGR2pUMWtzbDdUSGVzdEM1dVpMS3RB?=
 =?utf-8?B?My9XV3IyMWg2SGs3Y2xJTXVFaXF1NDFPYmVsNmcyRHJlOEVnVmYyZDIwei9x?=
 =?utf-8?B?eE9HbUgxbUlDS0g5N3JZTkdaZUxtWFVOaVdZSTIxL25HWVo4a1huVEZVcE9S?=
 =?utf-8?B?WnNCTTRvblFnN2M4YVNaTkZDVXRXRy81cWlJZWx4UHBuejY4QzdFZURJSk9o?=
 =?utf-8?B?K084WlB4MzkzaUVXTGFuUTBRUXplMGtOaGVEUFd3YkFRN0daWS9oK0FqRy94?=
 =?utf-8?B?aWZ3U2lpWEo3NnJIQSt0eHhlUVFyQTE4VmRtVzBpVTlRUURVQXVDSnEwVzdW?=
 =?utf-8?B?bzJzTXdQNm1MdDVsdmU4N3pHQU1rUGFZTzQ4OUxhaStCRDM0ZGF5MEt5OVRk?=
 =?utf-8?Q?9moU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcf3366-9db6-402e-a718-08dd2b978766
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 01:39:56.7996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8DtFsJThaNCoTr2qtHLeQH88/oj5Le5h0ktKt7POJkmiTUcwI2j5jZkBZo4F1zGMTnGb1n02sYiEnoc4B7HGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGlhbywgQmFyZA0KPiBT
ZW50OiBGcmlkYXksIEphbnVhcnkgMywgMjAyNSA4OjE3IEFNDQo+IFRvOiBQaWVycmUtTG91aXMg
Qm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguZGV2PjsgQmFyZCBMaWFvIDx5dW5n
LQ0KPiBjaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT47IGJyb29uaWVAa2VybmVsLm9yZzsgdGl3
YWlAc3VzZS5kZQ0KPiBDYzogbGludXgtc291bmRAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJFOiBbUEFUQ0ggMS8yXSBBU29DOiBJbnRlbDogc29mX3NkdzogRml4IERNSSBtYXRjaCBmb3Ig
TGVub3ZvIDgzTEMNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+IEZyb206IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51
eC5kZXY+DQo+ID4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDMsIDIwMjUgNTo0NyBBTQ0KPiA+IFRv
OiBCYXJkIExpYW8gPHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb20+OyBicm9vbmllQGtl
cm5lbC5vcmc7DQo+ID4gdGl3YWlAc3VzZS5kZQ0KPiA+IENjOiBsaW51eC1zb3VuZEB2Z2VyLmtl
cm5lbC5vcmc7IExpYW8sIEJhcmQgPGJhcmQubGlhb0BpbnRlbC5jb20+DQo+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCAxLzJdIEFTb0M6IEludGVsOiBzb2Zfc2R3OiBGaXggRE1JIG1hdGNoIGZvciBM
ZW5vdm8gODNMQw0KPiA+DQo+ID4NCj4gPg0KPiA+IE9uIDEvMi8yNSAwNjozMywgQmFyZCBMaWFv
IHdyb3RlOg0KPiA+ID4gRnJvbTogU2ltb24gVHJpbW1lciA8c2ltb250QG9wZW5zb3VyY2UuY2ly
cnVzLmNvbT4NCj4gPiA+DQo+ID4gPiBVcGRhdGUgdGhlIERNSSBtYXRjaCBmb3IgYSBMZW5vdm8g
bGFwdG9wIHRvIHRoZSBuZXcgRE1JIGlkZW50aWZpZXIuDQo+ID4gPg0KPiA+ID4gVGhpcyBsYXB0
b3Agc2hpcHMgd2l0aCBhIGRpZmZlcmVudCBETUkgaWRlbnRpZmllciB0byB3aGF0IHdhcyBleHBl
Y3RlZCwNCj4gPiA+IGFuZCBhbHNvIGhhcyB0aGUgRE1JQ3MgY29ubmVjdGVkIHRvIHRoZSBob3N0
IHJhdGhlciB0aGFuIHRoZSBjczQybDQzDQo+ID4gPiBjb2RlYy4NCj4gPg0KPiA+IElmIHRoZSBE
TUlDcyBhcmUgY29ubmVjdGVkIHRvIHRoZSBob3N0LCBpc24ndCB0aGVyZSBOSExUIGluZm9ybWF0
aW9uDQo+ID4gdGVsbGluZyB0aGUgT1MgaG93IG1hbnkgZG1pY3MgYXJlIGNvbm5lY3RlZD8gSWYg
eWVzLCB0aGVuIHRoZQ0KPiA+IG1hY2hpbmUtbGV2ZWwgRE1JIHF1aXJrIGlzbid0IHJlYWxseSBu
ZWVkZWQsIGFsbCB5b3Ugd291bGQgbmVlZCBpcyBhDQo+ID4gcnVsZSB0aGF0IHNldHMgaXQgdW5j
b25kaXRpb25hbGx5IHdoZW4gbWFjaC0+bWFjaF9wYXJhbXMuZG1pY19udW0gaXMNCj4gPiBub24t
emVybw0KPiANCj4gVGhhdCBpcyBhIGdvb2QgaWRlYS4gSG93ZXZlciwgd2UgYWxzbyB0ZXN0IHRo
ZSBjYXNlIHdoZXJlIHRoZSBQQ0ggRE1JQw0KPiBhbmQgU291bmRXaXJlIERNSUMgY29leGlzdCBp
biB0aGUgZGV2ZWxvcGluZyBzdGFnZS4gTWF5YmUgdXNlIGEgcXVpcmsNCj4gZm9yIHRoZSBkaWZm
ZXJlbnQgRE1JQyBjb2V4aXN0IGNhc2U/DQoNCk9uIHNlY29uZCB0aG91Z2h0LCB3ZSB3aWxsIGV2
ZW50dWFsbHkgY3JlYXRlIHRoZSBkYWkgbGlua3MgYnkgcmVhZGluZw0KdGhlIFNEQ0EgZnVuY3Rp
b25zIGFuZCByZW1vdmUgdGhvc2UgRE1JIHF1aXJrcy4gTm90IHN1cmUgaXMgaXQgd29ydGgNCnRv
IGNoYW5nZSBpdCBvciBldmVuIGFkZCBhIG5ldyBxdWlyayBqdXN0IGZvciB0ZW1wb3JhcnkgdXNl
ZD8NCg0KPiANCj4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gVHJpbW1lciA8c2ltb250
QG9wZW5zb3VyY2UuY2lycnVzLmNvbT4NCj4gPiA+IEZpeGVzOiA4M2MwNjJhZTgxZTggKCJBU29D
OiBJbnRlbDogc29mX3NkdzogQWRkIHF1aXJrcyBmb3Igc29tZSBuZXcNCj4gTGVub3ZvDQo+ID4g
bGFwdG9wcyIpDQo+ID4gPiBSZXZpZXdlZC1ieTogTGlhbSBHaXJkd29vZCA8bGlhbS5yLmdpcmR3
b29kQGludGVsLmNvbT4NCj4gPiA+IFJldmlld2VkLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFu
amFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFy
ZCBMaWFvIDx5dW5nLWNodWFuLmxpYW9AbGludXguaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiAgIHNvdW5kL3NvYy9pbnRlbC9ib2FyZHMvc29mX3Nkdy5jIHwgNCArKy0tDQo+ID4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+
ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvc29mX3Nkdy5jDQo+ID4gYi9z
b3VuZC9zb2MvaW50ZWwvYm9hcmRzL3NvZl9zZHcuYw0KPiA+ID4gaW5kZXggOWY3MjFiODhlNjA2
Li5kMDU0YmUzNjBkMjggMTAwNjQ0DQo+ID4gPiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRz
L3NvZl9zZHcuYw0KPiA+ID4gKysrIGIvc291bmQvc29jL2ludGVsL2JvYXJkcy9zb2Zfc2R3LmMN
Cj4gPiA+IEBAIC02MjAsOSArNjIwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVt
X2lkDQo+ID4gc29mX3Nkd19xdWlya190YWJsZVtdID0gew0KPiA+ID4gICAJCS5jYWxsYmFjayA9
IHNvZl9zZHdfcXVpcmtfY2IsDQo+ID4gPiAgIAkJLm1hdGNoZXMgPSB7DQo+ID4gPiAgIAkJCURN
SV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkxFTk9WTyIpLA0KPiA+ID4gLQkJCURNSV9FWEFDVF9N
QVRDSChETUlfUFJPRFVDVF9TS1UsICIzODMyIikNCj4gPiA+ICsJCQlETUlfTUFUQ0goRE1JX1BS
T0RVQ1RfTkFNRSwgIjgzTEMiKQ0KPiA+ID4gICAJCX0sDQo+ID4gPiAtCQkuZHJpdmVyX2RhdGEg
PSAodm9pZCAqKShTT0NfU0RXX1NJREVDQVJfQU1QUyksDQo+ID4gPiArCQkuZHJpdmVyX2RhdGEg
PSAodm9pZCAqKShTT0NfU0RXX1NJREVDQVJfQU1QUyB8DQo+ID4gU09DX1NEV19DT0RFQ19NSUMp
LA0KPiA+ID4gICAJfSwNCj4gPiA+ICAgCXsNCj4gPiA+ICAgCQkuY2FsbGJhY2sgPSBzb2Zfc2R3
X3F1aXJrX2NiLA0KDQo=
