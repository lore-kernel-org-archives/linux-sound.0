Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB83ED12D
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206767; cv=fail; b=BMGKjxdlmEAMzIZlWb+y4XSp/YMVrYc5pinsT6IzNz9/85bq00giIamA/knpWFCWaERHRDT46Y7KKHYSEH745b4rbvB+vIKDIx74U3lfbjJsfh5jrUvwweZXJcq59ZXPtRcLIXIxVoDtS+Uwy5hG1us8g0bUgep7AdfSU8nH7Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206767; c=relaxed/simple;
	bh=Kws5zyEbjAoJC1a4ArpUtH0lZgzYxvwnwr209C1r/E0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pSTyJqG0ivRcImxBabH2XMcejo9eJm1pYURP46K44Cu7Od+PI2vQP1JJNuYT/4SVXk7y1JUlLWdDwbJvK14z/FEBaPvUbkBQCYug3QuFqi9QraoL9mK7jS4yGcCJRkKuDzFaU9PxfXPkNmRfI6LxnAaDfvjopZ1yO8VKNBA8mCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvh553r+; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvh553r+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770206766; x=1801742766;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Kws5zyEbjAoJC1a4ArpUtH0lZgzYxvwnwr209C1r/E0=;
  b=dvh553r+xqzk6BW5rgf4CkQaPzBiIS6YAAjdp5m6UmYeRI1HkhOrpkqZ
   bf1+Za2zIHjKQzVq+KrAosnahEd9q/JyqdY3tkB5gEp8DetJNEzBbbImN
   pv8A3XpGA/CnTq5bEzkXcIDUgBa5lkELAvkB/2osOk85glExXb4Dc1N2n
   Ht12et4qTBHu17J9SlEiS4R0AYdfr75+6lCvs9zNtv/qgLTPoXQWq8Kcp
   8PYUZ+q5aVjrwnYc9UTahF16Rhx3sA8TmydnnGWWnA5PjsjbpSWwXp7hx
   ow+oBWYqeYGcyWrcVZWkZsEgFLpOGk6mDVJaXFHJASwD9vN7Zwrvyx0hz
   g==;
X-CSE-ConnectionGUID: p56agr0MT26GT3SpjDNEDw==
X-CSE-MsgGUID: YxQOZLFiTUO5OJHM62Np/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75012448"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75012448"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 04:06:05 -0800
X-CSE-ConnectionGUID: AjEMnzYzSnibptq1x1nsaw==
X-CSE-MsgGUID: TU3A9d4AQgKmK7k5QyUJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209514879"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 04:06:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 04:06:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 04:06:04 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 04:05:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdxRn4hNtagdphIg8LLaLgX2i4Nq48NYbqvi0j3IYICWYp0DZe6dwewz2P0+QBvTZwPFB3OQtYDgSiyXAZRFRf1bPry1CcB7GgU3DnToNR5ymW9if026sYWo9yjMSWduyzrhshG8sY5vmLAl2ECid0NUpOO0tQIe4dhus52s4GUAS8l+mIlk2aXZueA4xEqt+9TgpAwBAh+p6L4f4w11aSqJwBCJSsfR3pH5v87rj2r0RBK61c/ym6eSZDWxo4r4r9h19wV7MTxEkQsuqR4e1pphzUB3UORjNNnJtP9b8n04jIJOE8rPK3z+9RvWv7JV4Y70k3d7AzJdXdvo/CldhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kws5zyEbjAoJC1a4ArpUtH0lZgzYxvwnwr209C1r/E0=;
 b=Qu3drRSScr2aaCsk2ZZ68RGwssIl0vBt1jfXbMNH0dUllzsMrs3kbuIxfZrVWwj4GK79TF3CaAhuq2JLHqonn6ZhBXzaA4251r+0P2SE3DRWkK9c4Oez+TjTi7w9YBSTiN2ilzql8IR3m1vTcLAEpiQCl+vnk6t487NzFs9tLPHbX3u5yLe3xq7J9bunppds/X7WAqF3NqY0rzQZxo9gW35OUUxS8vLaopy1VI1aJXK0PmNz/NtaZ7ilPsyw5NMwLjjx6qJfhT9nsInFGHt41wtmV9ZbtGebMEPrJn7wG3/T0qoUrYS+mtZXfsIwC8kenyNfVbwhCoVe6rGbxzafVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 12:05:26 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 12:05:25 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>
Subject: RE: [PATCH 0/3]ASoC: SOF: Intel: reserve link DMA for sdw bpt stream
Thread-Topic: [PATCH 0/3]ASoC: SOF: Intel: reserve link DMA for sdw bpt stream
Thread-Index: AQHclQH65RbtLzyJtUSX7rTzHMDdj7Vw9K8AgAF4YCA=
Date: Wed, 4 Feb 2026 12:05:25 +0000
Message-ID: <SJ2PR11MB84241F343A5DB83E63E269C9FF98A@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
 <c5ce3d0b-ea28-405d-b705-f9494f25dfcc@linux.dev>
In-Reply-To: <c5ce3d0b-ea28-405d-b705-f9494f25dfcc@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SA0PR11MB4543:EE_
x-ms-office365-filtering-correlation-id: 15fd53e9-b8f0-4dff-a078-08de63e5ae7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?R1YzRU5zem85OWJ3blNnQzFkVlhVbzV5S1l6aHlXMjdqY2hCYll5Um40SktR?=
 =?utf-8?B?bHVIdUdMVFNuMStyYkpXYzN0a3paQzFWVDlFdVJhNkRLRDI4YjZrc3FJK1Ns?=
 =?utf-8?B?cm9wK0VPYXJFWG9Zbk0xK0dXdlZ6eHRjUHBFRmxxQXhYZ2x6cU9KYW1idXlj?=
 =?utf-8?B?KzRXU0wreDhZZEFFTERUZ01LM0t2bWozV1JmdDdKb3ZLdnB3V3BwdXBiVXBR?=
 =?utf-8?B?VkY4UlVwSEJpWWcvemYxYllXOVB3bWl4SUZmd0NuNEJPK1YrRTlSMVpMTkk4?=
 =?utf-8?B?ZEo2OXU1ZG5QbkdWR0VpUldXdWVwMENWTVVFeE1tMkxYaElnRlk5OFJPbU5U?=
 =?utf-8?B?V2xjMzhxRkxwRmE3TGxiZTMvb25oeFdNUlZQZWlYUlJCZmdpU2tkVFN4L1p6?=
 =?utf-8?B?M1RvL2pUUyt0Y1lhWFhFVHBBRGZqR0tXQVozWW85WWNxWE1aQjRqaFUwMlgw?=
 =?utf-8?B?dG1ycm0xU3N5bDB5Z0pkTHA3dEZjdkgrbVZ5ZFFaWFJvZ2xhWFRORkhYb0JB?=
 =?utf-8?B?M0l5YUxnZ3BjQWpHRnJ4NzhTNnZJTWpMTVMwZ3dtYjJrMWRiVXEvQ0Z1bDBo?=
 =?utf-8?B?VFdxU29WMkFpZGw0Z21iNjhXNWdmQnRjUVhGOVlRN1RnbWJhTzltYjYwMklr?=
 =?utf-8?B?dnp2NkxCaGN1NU9oaFBBNXNHL0U1YUxhWTc1aDQ2a0pGUDBkOU1XRUREbEFi?=
 =?utf-8?B?eElUbHQ1SE1TRjB5MGR2NUFNa3NXWURxSGVwaE5JaHlCVzErakpSdHdQR2FM?=
 =?utf-8?B?dkhibU5CWloxYzBabEYrK0JGbkIvRFhzZWpua1FOa0t6NndSWUlNaHJQQ3l0?=
 =?utf-8?B?N2p1VFZkL0lWUnZxU0FISFA3STJVSlJPN0tJQ3BaeGFBRlNCK1k3dzhSMHdV?=
 =?utf-8?B?NGswWHpYMCtDVU4wa0RhTXVzc0dtanVZUXM0UTBPYVh6TEcyUlpHRHBnUVNv?=
 =?utf-8?B?THpWMlg0ajNWQUgxOGNEMGJUSlNBcXRuNml5S1VBNld6empBWk56VWp6RlVs?=
 =?utf-8?B?MjlsS1FyV0ZZZU8vVHlTbnB4Q3NOTkFIa1BGNmFDdTN6N2w3OFU0RnRjQ3cz?=
 =?utf-8?B?Ui81N084SVFyc1RHQ2RJdlNCS1lQZVV0WE1KT1lRdTZNRDJXKzEybWY3Z25u?=
 =?utf-8?B?WTZITXlNOUZWcFpaTWpjY0NzeC8raVBZNDU4WFB5c28wcm52Nm92L2gzRGZD?=
 =?utf-8?B?dFFsN1A2N3V1dDRTdzhXNnNTeTBDekpPNlRxUnhPeXdtOGZaM3FFdnkrOEwz?=
 =?utf-8?B?Wm54Ylg2UUpIdkZwbGJDS29vUXBoY3VmeU9kR2xPWS8xV3J0cWZMRWQ2SFFI?=
 =?utf-8?B?OXRVbys5RmJMN1VVMGczU3RhbEpMWmMxVjdrZGpTazRUMnlxQW5GNlBiY2Iz?=
 =?utf-8?B?SHI5c0tjemYyQ1c1U01UdkpXM2xoZEJTdlB3SkxxUkFIclptL1ZvZG1veTBL?=
 =?utf-8?B?R0pMSEZ3TGdHNkFBYUtjR2RkZjl0UnU2WDJRcUJXZUoxTmd5UTNWQ1FHRWU5?=
 =?utf-8?B?Um9DaHBUSWNkRXFmcVBlMzlLSDh3dG9VekZNVGhyMjU1aUh4TmwrQ0lpLzFa?=
 =?utf-8?B?TnU1eUcyaDdPWWxubnExM3Bhbmo2d1dyd3U4cCtiWVpVYU1qTDltYUY5bXBJ?=
 =?utf-8?B?cWlVWlp2RHpUK1lBbXhjYXpDQlZndWp1N2p5a2MrZ0lFL2cvNjNwbHdTa1c2?=
 =?utf-8?B?bHBUekxqaWV5c2dJVmxuQ2l1cjBzd1hhVmpLbGtyeEM4N0Y4Z3laRUlHQVVN?=
 =?utf-8?B?ekF0WDllbzBBMG8zTjR0NHpFRkRvdXJORzc1THI2K0tGaHhuUlhQTlpDbzB3?=
 =?utf-8?B?MER3RndpRzNrbkF5dXEvbkI3R0pxNkI3TlJRZ051RVNwQ0d0R0cvTitib3lE?=
 =?utf-8?B?YmlMR25wRUpIZElYeU1ZeGQ0NFJpUTJoanhpU3pVd3JwNGt6VHIyaXFEanlM?=
 =?utf-8?B?MUExUkZMbnhycm1LSXR6bGk2K0VZdGhKb1RNQ0FqTk1saUxOWC8wMHF3dWlp?=
 =?utf-8?B?ODVEMUJxUGdrcmp4cVJOM0JqbVM3dWNPY3RwcUgzR0VDM3hqakVKSWtxd2Yy?=
 =?utf-8?B?ZWxzM0U1bkZQZnFyZ2lISW1MYzh5TXpsOVQ1WVVyL0Q4Z01Ba3VhZUh0QkZ1?=
 =?utf-8?B?cHRCYzc1TDZ2QVBzQXV5dHNncXFqYmtqYWRKd3dSZkdibVVZVGNaTVpSbW9o?=
 =?utf-8?Q?oRJtO3SQY3FPAo1E/2H30Iw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2o0OUlRNW9BRlU2M3pRZTVseVNidEY0U3p5S0N5VTloZkFVcm5nb3NFeTYz?=
 =?utf-8?B?QURzRDhPYmVIOXZGWnhpWmpWaGkrckU3Y3dZY2wyc2R6b2pWOUMrUXA4Ni9s?=
 =?utf-8?B?Mk1ZTFBhaTZLM1NSbTRncHcwT1Vhbmk0dk1DbktLOTViWUw0R0tQTlJlc0RU?=
 =?utf-8?B?c2lLd0k1R09TaWxZMWMyVlRQWHhDS0VPMG8wZ2E0NjkxbG41cXExTG0vcXRk?=
 =?utf-8?B?a1RCc21CU2l0dzdCblN6RmNONzlzenFncWg3WFlFUGI1cnorb2hrNWVUaXFq?=
 =?utf-8?B?ekhqSFN3bGNlQlg2aDZ2ZzdXSk1rUC9mSE15YUNScjhzbzkybnljT1FIbzBm?=
 =?utf-8?B?T3krQTN0ODZqOGZ6ZW8xWDFmTmIwYlF4bThBMTA5YXM2Mk5wRjU5cEF3TVEr?=
 =?utf-8?B?NGZub2xOdFVlcXFFdi93YWpVWjBiRitneWRrZGRNV3FWOUMvbVdMY3o3dW82?=
 =?utf-8?B?S0g2Q2hHaDd5U0JrOER4akxKQjA3MGVCakZSVDJid0Y3TGpSbXloZklLS0lL?=
 =?utf-8?B?dTRsSzF2NnZPbXVvRFExV1VlYi9NTkNCdE9haC9DemI0bDVpT1ZmMXF1bUhH?=
 =?utf-8?B?STRLajBxUEtFeU5RVWtmT3FYV3M4VlpHWmJRKzY1aStQUEJvMlBQcnZVZTlj?=
 =?utf-8?B?MnA1OSttVFhOY2V1S1JWOWNjcXF2K1p6NEluMXFOclh6R05RSXdReUt3VEFS?=
 =?utf-8?B?MkdzdE5kcVpDSG5RYkJ1UWJKcUE1bUpFYUdyNlk4MFVtNGNnWnNoY2ZmaHRq?=
 =?utf-8?B?NGhFcGRielBHSDlpRUN0Mkp1cy8ycE9tTjB0RVNzYzdYaXRPdGVIbVpjRE1p?=
 =?utf-8?B?OWZwZEdXc0orOEtsaFVzaExuMFN1T1ZkMUd4dlhzVDljbzBWc1hkMTBLNWNm?=
 =?utf-8?B?R2hqRXluUlNiNUlmSGFEOU5LaDJYcStOdytEU25MMDFLN0pNemZuYWVHTHNl?=
 =?utf-8?B?OXI3b2svZ0xSYmNVWGZjSGhDaytqcHBvVjRIZXptRTZpUnFOek9SY3dOWlVE?=
 =?utf-8?B?b29mV2tJZEEvL1Y4RmVGbHhrRTZqcDE1YVV4L2FPUUFkYTZ3N0JiUTNENGNl?=
 =?utf-8?B?WmF2SDE5Ung3dVc0LzFza0hFZFNUYmJBamg2RkxWYndyL3FJUFZtTTNZWGwv?=
 =?utf-8?B?R1RuT1dnMUpRMjNxbXFuL2RPQ2twa2M2NFZ6TE0xckw0dWFFWUl6R3Q0T3Yv?=
 =?utf-8?B?YlkrcjNKR1dlRHlydnpNc1hwSU5nYlFRRDRzUjIrdVZScHdKd1loNU1VWTVL?=
 =?utf-8?B?cXlicjVuZytBc3FzOTNCMjlhQ1g1dnpwYUxmQTI2T3huZjBuc3hmbzh4alFw?=
 =?utf-8?B?Q0s4am82bkhOc1BORGQvVnZoQmJMZHFjVVZUSFNIWFQ2M2t4NDlnSmkxakk1?=
 =?utf-8?B?aUNmTmdJMjRlckxBRVo2LzhMQW03dXBCYmpKNHZ4N2hqcDliSkNRWFB3NEd5?=
 =?utf-8?B?VUJzSWNsNDZ0NXhacWthSUd1T3dyaWNVWGE0VUxXTTFCOUsrSlFlbVBNOEZi?=
 =?utf-8?B?dWRjb21yN1FYOHk0SlNmemt6dm9odUFLSi9WaEJ0cE9jNlNyMjVJWEFCZ2Ex?=
 =?utf-8?B?dlplR0ZISjJIeEFNTmIrSUphVjdKNXJhL3dxb0FwRnJpQjNXOXAvQWc5ZW05?=
 =?utf-8?B?SlYrVUh0MW1PbDc5cThXUE9jWlRJQW9HcDdFK3ZYbmd2U1I4TzVOTXNIb3Zr?=
 =?utf-8?B?RXphLzhRa3dIM04vaFBlUzJuYmxFTzIwdFRZMUdxNXZBZ0gwR0hVVFp2cysz?=
 =?utf-8?B?Ym45aHNtVWlodWxKUUNiUWMzaXZ0dUtLUWFmd1ppTVNYVlZSb0lBQlBDV2VC?=
 =?utf-8?B?VFhaMDcxT21ndFF4ckFFN1dtVy9pT1VxaWZsSG1BZGF5VVlBKzMya1lsMEt5?=
 =?utf-8?B?QW5GSmFxL0wvcUE2Z2ZZU0NPZ3F3QXlTRUxYdVkzZDFUaUwwOEh5SDZQRE9M?=
 =?utf-8?B?L0dBSmFVR3lKdmpGcUZETk1IYk51NkJ2RlExanNvNkZMcGNueVFHY1A5RGVo?=
 =?utf-8?B?R1Z2cnZFRG9vc2VUWHBWci9iL2lCZ2pkb2V6UlhlWkVDSGRadTVBcU0wNXE1?=
 =?utf-8?B?SFkwZyt2Z1VIR1d5YXo3SzFZc2MrWTRqb25EVjNrSUpkWFBGYTljalcxS1kz?=
 =?utf-8?B?RnVTQ3dtdWJqRTNzK1o4ZC9FTkZaai9vcHlqejQ0MWdPMlVUY2FjdXRxaVc2?=
 =?utf-8?B?MW9ZL3VCZDBRNFY5UTJZbzhhS2ZJbjFJTGZBWmJIMW1RK0FKclEwNEZqYW1n?=
 =?utf-8?B?YjZvQ0hmc01zWGptQThWMUc3aWVRajhPbEsvdlMzdWs3Z2lBTTZRaHd4UGhh?=
 =?utf-8?Q?8NPHa6zGSasgx+D+KS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fd53e9-b8f0-4dff-a078-08de63e5ae7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 12:05:25.8824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Px9x0bFwWbZY2jtnr1DzTik/Kc3VXKpk2xvZRhJyxX1Ha9QQBiDDcLxl5wTEBFc1Glg47c4an6alnW6oPl5Jjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogVHVlc2RheSwg
RmVicnVhcnkgMywgMjAyNiA5OjE3IFBNDQo+IFRvOiBCYXJkIExpYW8gPHl1bmctY2h1YW4ubGlh
b0BsaW51eC5pbnRlbC5jb20+OyBicm9vbmllQGtlcm5lbC5vcmc7DQo+IHRpd2FpQHN1c2UuZGUN
Cj4gQ2M6IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsgTGlhbywgQmFyZCA8YmFyZC5saWFv
QGludGVsLmNvbT47DQo+IHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbTsgcmFuamFuaS5z
cmlkaGFyYW5AbGludXguaW50ZWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8zXUFTb0M6
IFNPRjogSW50ZWw6IHJlc2VydmUgbGluayBETUEgZm9yIHNkdyBicHQNCj4gc3RyZWFtDQo+IA0K
PiBPbiAyLzMvMjYgMTI6NDAsIEJhcmQgTGlhbyB3cm90ZToNCj4gPiBDdXJyZW50bHksIGhkYV9z
ZHdfYnB0X2RtYV9wcmVwYXJlKCkgZ2V0IGEgSERBIHN0cmVhbSBhbmQgdXNlIHRoZSBsaW5rDQo+
ID4gRE1BIGJ1dCBkb2Vzbid0IHJlc2VydmUgaXQuIEl0IHdvcmtzIGZpbmUgYmVjYXVzZSB3ZSBh
c3N1bWUgdGhlDQo+ID4gU3dvdW5kV2lyZSBCUFQgd2lsbCBub3QgcnVuIHdpdGggYXVkaW8gc3Ry
ZWFtcyBzaW11bHRhbmVvdXNseS4gQ3JlYXRlDQo+ID4gYW5kIHVzZSB0aGUgbmV3IGhlbHBlcnMg
dG8gcmVzZXJ2ZSB0aGUgbGluayBETUEgYW5kIGFsbG93IHJ1bm5pbmcgQlBUDQo+ID4gYW5kIGF1
ZGlvIHN0cmVhbSBzaW11bHRhbmVvdXNseS4NCj4gPg0KPiA+IEJhcmQgTGlhbyAoMyk6DQo+ID4g
ICBBU29DOiBTT0Y6IEludGVsOiBhZGQgaGRhX2RzcF9zdHJlYW1fcGFpcl9nZXQvcHV0IGhlbHBl
cnMNCj4gPiAgIEFTb0M6IFNPRjogSW50ZWw6IGFkZCBoZGFfZG1hX3ByZXBhcmUvY2xlYW51cCBo
ZWxwZXJzDQo+ID4gICBBU29DOiBTT0Y6IEludGVsOiBoZGEtc2R3LWJwdDogc3VwcG9ydCBzaW11
bHRhbmVvdXMgYXVkaW8gYW5kIEJQVA0KPiA+ICAgICBzdHJlYW1zDQo+IA0KPiBGb3IgdGhlIHJl
Y29yZCB0aGlzIHNvbHV0aW9uIGhhcyB0d28gaXNzdWVzIG5vdCBkb2N1bWVudGVkIGluIGFueSBj
b21taXQNCj4gbWVzc2FnZS4NCj4gDQo+IGEpIHRoaXMgd2lsbCBub3Qgd29yayBpbiAnZHNwbGVz
cycgbW9kZSwgd2hlcmUgdGhlIGxpbmsgRE1BIGlzIG5vdCBlbmFibGVkLg0KPiBUaGF0J3MgcHJv
YmFibHkgZmluZSBnaXZlbiB0aGF0IG5vIG9uZSB1c2VkIHRoYXQgbW9kZSBpbiBwcm9kdWN0aW9u
LCBidXQNCj4gdGhhdCdzIGEgc29mdHdhcmUgcmVzdHJpY3Rpb24gdGhhdCB5b3Ugd2lsbCBub3Qg
YmUgYWJsZSB0byB1bmRvLg0KPiANCj4gYikgdGhpcyByYWlzZSB0aGUgcXVlc3Rpb24gb2YgaG93
IGJhbmR3aWR0aCB3aWxsIGJlIG1hbmFnZWQuIFRoZSBwcmVtaXNlIG9mDQo+IEJQVCBpcyB0aGF0
IGl0IHVzZXMgYWxsIHRoZSBidXMgYmFuZHdpZHRoIHRvIGd1YXJhbnRlZSBwcmVkaWN0YWJsZSBm
aXJtd2FyZQ0KPiBkb3dubG9hZCB0aW1lcy4gSWYgdGhlIGF2YWlsYWJsZSBiYW5kd2lkdGggaXMg
cmVzdHJpY3RlZCBieSBvdGhlciBhdWRpbw0KPiBzdHJlYW1zLCB0aGVuIG1lY2hhbmljYWxseSB0
aGUgc3RhcnR1cCBsYXRlbmN5IHdpbGwgYmUgaW5jcmVhc2VkIGFuZCB2YXJ5IC0gb3INCj4geW91
IHdpbGwgaGF2ZSB0byBydW4gdGhlIGJ1cyBhdCBhIGhpZ2hlciBmcmVxdWVuY3kgdG8gcHJvdmlz
aW9uIGVub3VnaA0KPiBiYW5kd2lkdGggZm9yIEJQVCBidXQgdGhhdCBtZWFucyBoaWdoZXIgcG93
ZXIgY29uc3VtcHRpb24uIE9yIHlvdSB3aWxsDQo+IGhhdmUgdG8gY2hhbmdlIHRoZSBidXMgY2xv
Y2sgZHluYW1pY2FsbHkgd2hpY2ggaXMgcG9zc2libGUgYXQgdGhlIGhhcmR3YXJlDQo+IGxldmVs
IGZvciBTRENBIHBhcnRzIGJ1dCBub3QgbGVnYWN5IG9uZXMuDQo+IA0KPiBJIGFtIG5vdCBnb2lu
ZyB0byBsYXkgb24gdGhlIHRyYWNrcyBmb3IgdGhpcyBsb3ctbGV2ZWwgc2V0IG9mIGNoYW5nZXMs
IGJ1dCB5b3UnbGwNCj4gaGF2ZSB0byBhZGRyZXNzIHRoZSBiKSBvcGVucyBmb3IgZnV0dXJlIGNv
bnRyaWJ1dGlvbnMuDQoNClRoYW5rcyBQaWVycmUgZm9yIHJlbWluZGluZyBtZS4gSSB3aWxsIGFs
d2F5cyB1c2UgdGhlIGhpZ2hlc3QgZnJlcXVlbmN5DQp3aGVuIGEgQlBUIHN0cmVhbSBpcyBydW5u
aW5nLiBBbmQgSSB3aWxsIHJlc2VydmUgYSBmZXcgY29sdW1ucyBmb3IgdGhlDQphdWRpbyBzdHJl
YW1zLiBJdCB3aWxsIGluZGVlZCByZWR1Y2UgdGhlIEJQVCBiYW5kd2lkdGgsIGJ1dCBpdCBzZWVt
cyBiZQ0KYSBuZWNlc3NhcnkgZmVhdHVyZS4NCg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBpZXJyZS1M
b3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5kZXY+DQo+IA0KPiA+ICBz
b3VuZC9zb2Mvc29mL2ludGVsL2hkYS1sb2FkZXIuYyAgfCAgOTQgKy0tLS0tLS0tLS0tLS0tLS0t
DQo+ID4gIHNvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLXNkdy1icHQuYyB8ICAgNSArLQ0KPiA+ICBz
b3VuZC9zb2Mvc29mL2ludGVsL2hkYS1zdHJlYW0uYyAgfCAxNTcNCj4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystDQo+ID4gIHNvdW5kL3NvYy9zb2YvaW50ZWwvaGRhLmggICAgICAgICB8
ICAxMSArKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNzEgaW5zZXJ0aW9ucygrKSwgOTYgZGVs
ZXRpb25zKC0pDQo+ID4NCg0K
