Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D991D63F0;
	Wed, 22 Apr 2026 01:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820653; cv=fail; b=KffcGfab6gnoxJvZ9mWCSQe81Bk75/qp+jmp4ncexhbnIXax9eNaGLLN+gDFtxKTvjSFrd51dHTVlugaI1CImFTlybZE3GhN5Al9WNMNR6JS6SSqFl4c1w/1iuan3iDhLsDYRhm7mkhy0PM4J/vXTPDVsGN9bHsPh1xHrbl8feU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820653; c=relaxed/simple;
	bh=vcLf2IE5PKbFacQhLqKhNVRbQtpJEqWR9t1LP4z4RQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zg9TqjChUX4rXc2gIYubBQzxu1nw7dHpN5N7bOOGjTdtGQhQJ0E5tqPB7butCxOmB3LFBNq332lLcHMBjYDeIW/xrIm8R1gFi/JXXZMHMfMjG8UJa+NSsLe2KkMt9DZhgPiezCGgXuZHlal0fEL6iqXMToGwAEtSFWws/3lYD0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rk3VmNDM; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rk3VmNDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776820652; x=1808356652;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vcLf2IE5PKbFacQhLqKhNVRbQtpJEqWR9t1LP4z4RQc=;
  b=Rk3VmNDMRgq9Uu3wKl6ab+G3c3/H7RroFiT1jbRN8n+yHPL4WDgA0rbp
   TAWqeDt7jXdkOF/AOcA77leyr6GaTOjJBrpCZ1Vuwpd7uIxFfPT8L8b2m
   Y/4Va/OMqWedQNKpE+cprf7LcwjOIpSHzJG3q1wOclTZdGk9d1kUHsel3
   7/6JTM4P1n7iAbbemf616hlY6tst4crIgXwnqD1paSoqSOnbRa7PpPwEt
   M3uteGyUcjiAShPF0tYN9S2Db6ullXjl7MxuupxfHrhF3tMcCJeTHo4WV
   +BQ8Db9KWMkUxlJ34t5TqfvXqFJncXhpztc67STT9sRYmzXPwH6WrqKSP
   w==;
X-CSE-ConnectionGUID: f4OyQSbOTpCRf/QB6jtOHA==
X-CSE-MsgGUID: DBQ4Wl9eRVekLZritBkQzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77680770"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77680770"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:17:32 -0700
X-CSE-ConnectionGUID: nqJBX74IQ96L5XLBtlftnA==
X-CSE-MsgGUID: kEp5pEAtSECZSER2hWTKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="231315663"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:17:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 18:17:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 18:17:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 18:17:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtAs0B63UMpEhK6BfQEjJAQ6+qaDOvdgGNrC62hDTQ4ZqnfdvgTzg0wi/KYwNjH8yarROnNGrZ2mhyHxX2YiWZR4kMi4WOkvxOnO+M1Ogv/SKlblFpIzBXC60EVT/Hkt/roY+DkPjFNkPSY9zc5iax2A/hsEhbjmf0Od15F/Ve0/KiYmibdfnzXJA9XoFaoRSNepS5yduCBBCea0W16zfMoY/vKxw7T9qrJHcnelx6lCvpMWuf105+H6H76Vd3wN0inn87xbStIq3gM3is28Wnbo96NXwBNKdXot6NK5kE5ejLwFdccB6eqjjUPQCuVDE0GVkX7JQ7SJNSk6StryFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcLf2IE5PKbFacQhLqKhNVRbQtpJEqWR9t1LP4z4RQc=;
 b=ibp3qf6Hsh6zx6kVI+aKz5S7xawizZllcu9+MkkdwTKWMrKoAXL0lURjPwjzeVtslgNUNAsu67RAJeupCFzCiYbTTlZGwXgWQ++rWiTcprm1qGF2mvNdxlw1Iy8x6o3fCRqh45vDLhz+83JXFAvMCLtOzo7qO85DmXToGsFYu8USVqrqv7il+jnMtJFfwLukl7aBAeRFlaWernKf2FlKdH4EmmxiFvpvuLSj8SaedLqpNwN4eSF14knresbzphQcNM1E9U2UBEFdMDI3vbmHhZSNTVMjDDJmWNCzdK7vbXtLb4dNYipP2hmJ8EBW1CAykrjkcrgSq9B/AnFMU7lMBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 01:17:27 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 01:17:26 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH 2/2] soundwire: record Peripheral scale_index
Thread-Topic: [PATCH 2/2] soundwire: record Peripheral scale_index
Thread-Index: AQHcvExzTHgxVasB90GnJJKme0ztiLXqcj/w
Date: Wed, 22 Apr 2026 01:17:26 +0000
Message-ID: <SJ2PR11MB8424027CB4355B9B11BDAC82FF2D2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260325114156.1028118-1-yung-chuan.liao@linux.intel.com>
 <20260325114156.1028118-3-yung-chuan.liao@linux.intel.com>
In-Reply-To: <20260325114156.1028118-3-yung-chuan.liao@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|BL3PR11MB6340:EE_
x-ms-office365-filtering-correlation-id: 9094fa29-acfa-4411-8e61-08dea00cea80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: C7jy3cVHutEfi/TjFVBZrfaeUt6IyHLy5iNpAfm2opx3MqNojy5CWsKTyUyctSRZGZ2dwvhsD0N7bWBVPTp+IpLxASoP2YqG3NJ9uWImdJqyBY9NHELVrprfI0Ji32nXARZS2ad7Yee1J0envaw0is2ZPgNd82F2OGQNcJUCvEEm3tdq64lN1eGIWn2zarNIKuALQEog28W4aHn7c52UDXI3vcq1/g0B3p/VYnQuX6tH/VBbUlMQVgPJSF5RxBgRmXMk/tnBrMCOtaik6lAhrgfhAq3YAQ6ImP9IokKFLk6EPHQq0FT8nosh3eUquI3KtXNh00yFSBPVZ1CxwfTOseNKcraJM7ZKjz/cHt4JAQHV7UKZLipfvtetJsransuUjQ7VRgvV4vfxWf15KO9Msau+nNK360f5iDI4yjq3E6jj+0pxzthyE9FR55VrtL2d1LeIBhGiRF5Dsmfszb03TLaWLGxxfWgbyyJMQifjO7nXrWebz5/FmBIOF54eQAUtNuVw67AE3aHILT5B7tPMU+UguagwWMJapOi92O047uBfvK4GVkZT+3jeS3UN5VaLknDZUXEt9zXewt0u3MgQeUDB5bpWaNr5y80CmY0hYutj1FUt7Pz3NeC5OImGY1pt9HbpILsT5QkcXTZFoTT5hA/m2aai7HwCydBksVXBlMW1chYJFr9TAf1Th+znzrnH5XSWOOqHoxudNPgi7gypfrgJb81SSG3g5jC9Ox/84AwWQUXBYuCm0p8D1SsPKVtuNMDVt2fwNQ44vd67lDXM9edzRyi+L1GnME1JIXmJuGU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cE5weWZMWDZxUXZqNWoyYXV2Y0s0WVUzSSt2dVBmT2U0bU1ZM0J0eEpaT0ht?=
 =?utf-8?B?d0habE5OMk5SVkVWNHR6eFhLVXN6cE9nUWdOZkFIR0Fnc1JlbFZYTmJReFZK?=
 =?utf-8?B?STIzK3NtSS85eFZmS0lyd0JIa1F6TlA3aE9lUlVDVUNGdyt0M3N4QXFWT3Fp?=
 =?utf-8?B?THJDam1RWndtZTJ6d24yL25OejJ3RWljY0JDdllvS2tDOUhQcGtRaUcxZVkx?=
 =?utf-8?B?RDUvM2tzaU91SW0vaFlCVWwyQjdNemZnblZhNWpxRGlhai83Ty9scWFaeTAx?=
 =?utf-8?B?K1NxN2gweFlidnhZNWpvQW84UG4zZVlhQUJkM1FCNjJkcmpxeld2ZzlxME1x?=
 =?utf-8?B?cUFEUDIxSVN4OUVTaDVaZm04b2NSdk1ZVlFJQll6Wm56YWdIUk9qUERsSjVI?=
 =?utf-8?B?R2xuM202WDJyQnVkZnZ0aGxORHl0aTBPTlRtRHNJT2lYUGNrRFJkWUtHcFI3?=
 =?utf-8?B?dUQvR1ZjSHJocm9URDFPelVkayt3SUIyc1hZdEJKV1YrdHY0N2ZoakRwMXkv?=
 =?utf-8?B?Y2pNcCtRSjNQcVFUa2FyMC9PbUV1Z1g1bVplVW5tZ3RtdFdTdVFGNGg0aWQr?=
 =?utf-8?B?TGprOWR1S1J2cVMvWkphTG12Ny8wTWUvenV4NE91ajhKYjNPYWpYVS9TdERS?=
 =?utf-8?B?NFM2TXByT2FIcFhDM3dFWU02S2lBSHBIS3V6LzVaNndHNERBKzlvaUlOblh5?=
 =?utf-8?B?b28vTjRad212a0ZyT3FQK2RXK0xBdVYydFpUTGwvbnVoOURWSnRkTVdxQWVO?=
 =?utf-8?B?eWg2UkxHbUtITHQ0S2RJL0pDVHNjK1RpS29nVWU2NVVtd2pUZ3lzNENSM0VW?=
 =?utf-8?B?bjJEM3hTSVBITCthQm9naS9RcVRJaXhoMVVKdjBBUXZ1eTc1ZUFNN1JTNWdI?=
 =?utf-8?B?cG1sWTBXVDRha3hGRTFWUmpZWjVtb2ZrcEdleXJnRFg1cHNlWlc2OG9VdS9R?=
 =?utf-8?B?MHBmUklsTzdBK2YxTU9VL0VOOGxNVE4wZG5BVkFRZFkwWFIzb0J3RGxvWW1x?=
 =?utf-8?B?cHlRa2I1QzlMZ1VudVkvT0szSjg0a2hhazJXR1ZyaGM4VTdOcDNKVStHK0p0?=
 =?utf-8?B?L1BObFpiUkpyQ0UyUVpKZmFPa3FFZE9HNFlYUTlpbU5LTVJtSXplbklxWDhq?=
 =?utf-8?B?cHVpQWorSmw5Q2NUQ08wTkRlb3pkQVprbi9oaWhrOHJKL2dGbU9UWlBqQ1h0?=
 =?utf-8?B?QjFBMjFJcW4zOTZ6a1g0Qy82MDF5TmlxcVhiVU1sTVYrZ1JuSEJZbFh3L05N?=
 =?utf-8?B?TlJwRTUrd0N4ZWlGYklxdFhjSnpvd211SzZML0ZPSzhTQU9qVGN0TU5SR1Uz?=
 =?utf-8?B?SElmQVE1Ri94QkN5NDhhSDN5YzVKTDNFandWZGpnNFZZTkdkUFJ0Nm1SUkFh?=
 =?utf-8?B?WmE1bGhqKzJRSExUKzJPK1pDbXVIeFIreko1YkMwZWVzREFPb1dWVTFsSXJX?=
 =?utf-8?B?OHRDZDBMeU5sVFIyMVJQbnFFRmUrZTFjczBxN0VzUDZpcERtSGp4NXA5TmhW?=
 =?utf-8?B?dW8rTnFYa3ZCN1g2YlRkSTZHdWFzVTMwRFN6ZlQybzBhaHpFZjAvdEJsclU3?=
 =?utf-8?B?NklCS2dmN2xEa0R3MFB3Vm9sY1NkSzg0emlyZ2dGdjN0YUxaRXJNVmV2UXp4?=
 =?utf-8?B?Tmo5cndoY1JIMnVHYzRWNDhnbVRQZ0pPcGlkV0s4MEl0L20rK3o4Q3RJVGtR?=
 =?utf-8?B?UWF4Y0VKcWlBeUZjN0wrdHlTSWdONXZJNnFRVzRQb1dkVy9TV3Y4cWd3MGdT?=
 =?utf-8?B?eEI5VWRVUXpmODJWRXFZcDRrQUtsaXE0Z2NYUFh0MTFISDFwWDJORnA0OHVz?=
 =?utf-8?B?ZkNVQWg0Rkt3ZFN1Y09MSVV2VWRBV3lsSUljU0VNWWt6bmpYcURvbUVQdkMz?=
 =?utf-8?B?cU1INmJxTnZCcnQ1Y2doWGlielBka01XUHBybG1TaDB4OWkrTDZzSXgzSnc2?=
 =?utf-8?B?dGhyWUoreWVFRFpKWmNCMWd2aHNwOGVzdTdoREx1RkEyVGs3SnhCeGdzYzUx?=
 =?utf-8?B?Y1l2MlViMkVoSWZJOGptandsdXBybVVIWFVjTGVCU2NSaytnaDVRMlkvSk02?=
 =?utf-8?B?SnNDVnlQTmdBMVhSMnJPYmozOWFyRlE0czFhMGNVeklxenFCc3p6VWdHV0I0?=
 =?utf-8?B?K3JEazNrTkFRelRadDFxS1RSdkJDdDd2MmdKbi9wckxvNStDWC8ydlJyN2FZ?=
 =?utf-8?B?RnNVOXpHVVFrVndtRVo3Kzd6aThyQTduUWlRQmMwU092QTdteXRZTXE0Z0J0?=
 =?utf-8?B?bWdTQ3FQME9Wa0hSM21KSEZsZlNRYWFVbXd6alpkUktpWGgrZHRQa1JqdFd2?=
 =?utf-8?B?bllXU2tDL3QxcWJxQk45bDBicDFlOXFjUFJ1ZGhJMWVMa25TSXhaQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mdTDe3xzEZee8m3BQ+rEu1tUDDmPNqnlTWTtasRBh6YTkV/mKeG5uOdjuAOQ7dUh6KfrCg+Qhb1n0KuE3kzgW51M2UxS3hpIgPCEJCw5De/P5snAn82VrqFU91bKllH7ro3S0eabuy6S/2SoBRGHdHxiG2qjCjfx4tPhAjg67XcqYnzcp2U29F+RCKWSL+ps/eSJL9JCsj8Pu6uI6F83MMJ+OAW4CzvMDZcwDOrIDeyu5BVMj4wlS8w+rjsZX2japm4e1p/f3of2jzsDjkHu0rChxdZE421CTHdDH/NhDYaKgQxfHd98w9TVNIjaANh/5qtVDNV8hKro91kvOhqV2g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9094fa29-acfa-4411-8e61-08dea00cea80
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 01:17:26.7328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9KxtImnK58vpeXVMZtZp9Cf9Pz4L2qllttQz2Sz20KTwFQr9LADcqXjtQ4GuJ48Li7UBvNYvLmaAjw3qh8DAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFyZCBMaWFvIDx5dW5n
LWNodWFuLmxpYW9AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDI1
LCAyMDI2IDc6NDIgUE0NCj4gVG86IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsgdmtvdWxA
a2VybmVsLm9yZw0KPiBDYzogdmlub2Qua291bEBsaW5hcm8ub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBwaWVycmUtDQo+IGxvdWlzLmJvc3NhcnRAbGludXguZGV2OyBwZXRlci51
amZhbHVzaUBsaW51eC5pbnRlbC5jb207IExpYW8sIEJhcmQNCj4gPGJhcmQubGlhb0BpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIHNvdW5kd2lyZTogcmVjb3JkIFBlcmlwaGVyYWwg
c2NhbGVfaW5kZXgNCj4gDQo+IEN1cnJlbnRseSwgd2UgcHJvZ3JhbSBidXMgY2xvY2sgc2NhbGUg
aW5kZXggdW5jb25kaXRpb25hbGx5LiBJdCBpcyBub3QNCj4gbmVjZXNzYXJ5IGlmIHRoZSBuZXcg
aW5kZXggaXMgdGhlIHNhbWUgYXMgdGhlIGN1cnJlbnQgb25lLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQmFyZCBMaWFvIDx5dW5nLWNodWFuLmxpYW9AbGludXguaW50ZWwuY29tPg0KPiBSZXZpZXdl
ZC1ieTogU2ltb24gVHJpbW1lciA8c2ltb250QG9wZW5zb3VyY2UuY2lycnVzLmNvbT4NCj4gUmV2
aWV3ZWQtYnk6IFDDqXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lAbGludXguaW50ZWwuY29t
Pg0KPiBSZXZpZXdlZC1ieTogUmFuamFuaSBTcmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxp
bnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3NvdW5kd2lyZS9idXMuYyAgICAgICB8
IDEgKw0KPiAgZHJpdmVycy9zb3VuZHdpcmUvc3RyZWFtLmMgICAgfCA0ICsrKysNCj4gIGluY2x1
ZGUvbGludXgvc291bmR3aXJlL3Nkdy5oIHwgMiArKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvdW5kd2lyZS9idXMuYyBi
L2RyaXZlcnMvc291bmR3aXJlL2J1cy5jDQo+IGluZGV4IGZlNTMxNmQ5M2ZlZi4uYWNlY2JkY2Y1
MmVjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9idXMuYw0KPiArKysgYi9kcml2
ZXJzL3NvdW5kd2lyZS9idXMuYw0KPiBAQCAtMTQxMSw2ICsxNDExLDcgQEAgc3RhdGljIGludCBz
ZHdfc2xhdmVfc2V0X2ZyZXF1ZW5jeShzdHJ1Y3QNCj4gc2R3X3NsYXZlICpzbGF2ZSkNCj4gIAkJ
ZGV2X2Vycigmc2xhdmUtPmRldiwNCj4gIAkJCSJTRFdfU0NQX0JVU0NMT0NLX1NDQUxFX0IxIHdy
aXRlIGZhaWxlZDolZFxuIiwNCj4gcmV0KTsNCj4gDQo+ICsJc2xhdmUtPnNjYWxlX2luZGV4ID0g
c2NhbGVfaW5kZXg7DQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3NvdW5kd2lyZS9zdHJlYW0uYyBiL2RyaXZlcnMvc291bmR3aXJlL3N0cmVhbS5jDQo+
IGluZGV4IDBiOTYyNjgzODAyOC4uYTZmMDI1NWMxYzI1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3NvdW5kd2lyZS9zdHJlYW0uYw0KPiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9zdHJlYW0uYw0K
PiBAQCAtNjk3LDYgKzY5Nyw5IEBAIHN0YXRpYyBpbnQgc2R3X3Byb2dyYW1fcGFyYW1zKHN0cnVj
dCBzZHdfYnVzDQo+ICpidXMsIGJvb2wgcHJlcGFyZSkNCj4gIAkJaWYgKHNjYWxlX2luZGV4IDwg
MCkNCj4gIAkJCXJldHVybiBzY2FsZV9pbmRleDsNCj4gDQo+ICsJCWlmIChzY2FsZV9pbmRleCA9
PSBzbGF2ZS0+c2NhbGVfaW5kZXgpDQo+ICsJCQljb250aW51ZTsNCj4gKw0KPiAgCQkvKiBTa2lw
IHRoZSB1bmF0dGFjaGVkIFBlcmlwaGVyYWxzICovDQo+ICAJCWlmICghY29tcGxldGlvbl9kb25l
KCZzbGF2ZS0+ZW51bWVyYXRpb25fY29tcGxldGUpKSB7DQo+ICAJCQlkZXZfd2Fybigmc2xhdmUt
PmRldiwNCj4gQEAgLTcwOSw2ICs3MTIsNyBAQCBzdGF0aWMgaW50IHNkd19wcm9ncmFtX3BhcmFt
cyhzdHJ1Y3Qgc2R3X2J1cw0KPiAqYnVzLCBib29sIHByZXBhcmUpDQo+ICAJCQlkZXZfZXJyKCZz
bGF2ZS0+ZGV2LCAiU0RXX1NDUF9CVVNDTE9DS19TQ0FMRQ0KPiByZWdpc3RlciB3cml0ZSBmYWls
ZWRcbiIpOw0KPiAgCQkJcmV0dXJuIHJldDsNCj4gIAkJfQ0KPiArCQlzbGF2ZS0+c2NhbGVfaW5k
ZXggPSBzY2FsZV9pbmRleDsNCj4gIAl9DQo+IA0KPiAgbWFuYWdlcl9ydW50aW1lOg0KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb3VuZHdpcmUvc2R3LmggYi9pbmNsdWRlL2xpbnV4L3Nv
dW5kd2lyZS9zZHcuaA0KPiBpbmRleCA2MTQ3ZWIxZmIyMTAuLjA4NDUxODJmNzVmOSAxMDA2NDQN
Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb3VuZHdpcmUvc2R3LmgNCj4gKysrIGIvaW5jbHVkZS9s
aW51eC9zb3VuZHdpcmUvc2R3LmgNCj4gQEAgLTY2MSw2ICs2NjEsNyBAQCBzdHJ1Y3Qgc2R3X3Ns
YXZlX29wcyB7DQo+ICAgKiBwcm90b2NvbCBmb3IgU291bmRXaXJlIG1vY2t1cCBkZXZpY2VzDQo+
ICAgKiBAc2R3X2Rldl9sb2NrOiBtdXRleCB1c2VkIHRvIHByb3RlY3QgY2FsbGJhY2tzL3JlbW92
ZSByYWNlcw0KPiAgICogQHNkY2FfZGF0YTogc3RydWN0dXJlIGNvbnRhaW5pbmcgYWxsIGRldmlj
ZSBkYXRhIGZvciBTRENBIGhlbHBlcnMNCj4gKyAqIEBzY2FsZV9pbmRleDogY3VycmVudCBidXMg
Y2xvY2sgc2NhbGluZyBpbmRleA0KPiAgICovDQo+ICBzdHJ1Y3Qgc2R3X3NsYXZlIHsNCj4gIAlz
dHJ1Y3Qgc2R3X3NsYXZlX2lkIGlkOw0KPiBAQCAtNjg2LDYgKzY4Nyw3IEBAIHN0cnVjdCBzZHdf
c2xhdmUgew0KPiAgCWJvb2wgaXNfbW9ja3VwX2RldmljZTsNCj4gIAlzdHJ1Y3QgbXV0ZXggc2R3
X2Rldl9sb2NrOyAvKiBwcm90ZWN0IGNhbGxiYWNrcy9yZW1vdmUgcmFjZXMgKi8NCj4gIAlzdHJ1
Y3Qgc2RjYV9kZXZpY2VfZGF0YSBzZGNhX2RhdGE7DQo+ICsJdW5zaWduZWQgaW50IHNjYWxlX2lu
ZGV4Ow0KDQpXZSBuZWVkIHRvIHN0b3JlIHRoZSBzY2FsZSBpbmRleCBmb3IgYm90aCBiYW5rcy4N
CldpbGwgdXBkYXRlIGluIHYyLg0KDQo+ICB9Ow0KPiANCj4gICNkZWZpbmUgZGV2X3RvX3Nkd19k
ZXYoX2RldikgY29udGFpbmVyX29mKF9kZXYsIHN0cnVjdCBzZHdfc2xhdmUsIGRldikNCj4gLS0N
Cj4gMi40My4wDQoNCg==
