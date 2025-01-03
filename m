Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7359A47
	for <linux-sound@vger.kernel.org>; Fri,  3 Jan 2025 00:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735863426; cv=fail; b=toiKSKiF1amCPIN0pOleJTzlI6yxPGKbnsrY4wpmxY/lTBvi96g/8U5+c7gT/u82zTybgAJ9dqzYi4k9woV4FiGmgHDgPFlJLpnvGbgm5zVPtZ0MA/lX/X9btoCGkkUSg9ogF7GaW7gHIGb+lBB1OqATSlS+gtAUizhXYa9uXF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735863426; c=relaxed/simple;
	bh=bpZlwDD2qCQlAYVqzOEcOnPiwo9z6y4E8IytLQ+bUW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pWTuCGQUWnxty+wc7F0LGYSzUCA+/SFrgI8Iqc9S6KCV4h7AV8olQPB1uJl7VNwCK2JbEb1xLlDtW8lsXs5aWX+sobUkgcYLw9Szs0NzGUE75p+S9flA4QljivsRSPAeqlH3hZNWBhRoDmdB347TbZDYHhVjHHnEgK1/jXq45mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asgNq3oz; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asgNq3oz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735863425; x=1767399425;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bpZlwDD2qCQlAYVqzOEcOnPiwo9z6y4E8IytLQ+bUW4=;
  b=asgNq3oznfogPqEphs59/oyBtHjU0QYuhQRZKoDcRlSYGIh80CQr7qVt
   dNUQyNXRqqbTQKLoR6+O/opaQi8kMSCi25w+lQKpqakS7ON8r0FenG57T
   WfEAtShKcAn073OANZu6UJDeCucUrcak2B2Byjq19RjnXth4hQYt8T9bY
   j0+h/fRayRyCtSRpRs5I7dqg46bDPez21kkwv6ewbyRYpq5w/Zf4X7U6m
   lZUNLiIUE7TIRiqfYKV5jBQXYKBz4CV6RF4oXzOqku+xxLOebseUcSM/i
   eCMU6/LpkikQGq4SBeco07TEoGKhocbSH5uqlpkLZGN8kWcKDX0MSsfaY
   g==;
X-CSE-ConnectionGUID: fpJdGEV3Q+aLhez+q/AuYQ==
X-CSE-MsgGUID: H9jJpl2eRqWG8Asfl9TS7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53656322"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="53656322"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 16:17:04 -0800
X-CSE-ConnectionGUID: oGOLgkw4SmSABW2LvDFrwg==
X-CSE-MsgGUID: hcy1s02eTfuCa5YfKq1A8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106683882"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2025 16:17:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 16:17:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 16:17:03 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 16:17:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyuZt2mGQzQT1IHsqJNsuGPzmCaIurzUVW3n4RjOkqF/4ue26VKJWLfP+uQ2IyWFBnjm4605svaVkNpcZCBmSMxsBf54P5GqUKQ2O4GhGYwYhYz8n0gG86PzIwzjFYz5EJPzpLX4R80WpT5Fb6zSOMnrqkBtCt+/puZRmPMHjjdqYARJcP+RPxAS91KmxyOgeNdKbKfmHmABCE/gHuxT5r+ELOYMql5KlvKd8W9OaNJ8l+zWoCfPeIPPWuy9DiuTE+tZqSX4AKId7S7fT9ADFHof+csxTyAuvTbd0U3Fj+YXMqyP2pbIqxVpBDW9ai8j0lmleQsZwYVhdzVjccajCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpZlwDD2qCQlAYVqzOEcOnPiwo9z6y4E8IytLQ+bUW4=;
 b=jaVCfcgGySMbHFzK1rAPrWR26x6CLsVCS6mJZF4JdG73lwcKWndlcb42E9NxiNiOPDg2aEbYZ18L3z4al4I1HMm6TmcIKVULjhzsX5IjYrg9EdQj5AFVjN3Rt6hGRePpXXsekxgtgf2zVsoq6wwAbuR0VQrpMqb9KrYp5i4+DDjkADAK0BGPU57S/H5bPQWl1H18b/quu1XzsrNSOjhgfZTZuEG+NZXwbFKv53Yvee3ImJGwxt07a9pkGkSO4dWsw1EwFnT/p6Damx23EDFeKjJENuVz6w1t/LMy5UM/S6pKpOkAn3bxKeG/Q9r3wbZYpxLd8Ryrdrc/FSQT7vIGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 00:16:56 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%5]) with mapi id 15.20.8314.011; Fri, 3 Jan 2025
 00:16:56 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
Thread-Topic: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
Thread-Index: AQHbXRKVa5Hvu2InnUa5mFZHeLdtILMEBXcAgAAnSvA=
Date: Fri, 3 Jan 2025 00:16:56 +0000
Message-ID: <SJ2PR11MB8424334022EBCF6B4C375DCFFF152@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20250102123335.256698-1-yung-chuan.liao@linux.intel.com>
 <20250102123335.256698-2-yung-chuan.liao@linux.intel.com>
 <ee83bf81-dc3f-4452-8ae3-4c4762ad7b86@linux.dev>
In-Reply-To: <ee83bf81-dc3f-4452-8ae3-4c4762ad7b86@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|MW3PR11MB4537:EE_
x-ms-office365-filtering-correlation-id: 7b60e636-afcc-4248-7f20-08dd2b8beee5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dUhtMG45MFFTcHhXWmZQcWc1SG9QSDRlemVmTXVkaXlWZWg0Z0F2T1RXYmlj?=
 =?utf-8?B?WTNwYTdyT1dTRUVDOElFemxCUklLSE1McUFaWkg5U1FqSDR6NHJNVDlkKys4?=
 =?utf-8?B?VGdoUTlTYmhoc3I5SEEzM3VNVjhRcFhWYXFQWGdQRGdZdzlSdHJ4bnRtL0lI?=
 =?utf-8?B?SGZSb0FXbFU0b0lBT2dpMmtOKy9pNEN4R21IcUhKT2o4dDdlZG5peEFXZ3Fh?=
 =?utf-8?B?UUx4UDMzdWdFaWRXcW1ySDZqb1FYZkZZVVF3WjJnTzh2ZXBuRk5ycVJBcEVO?=
 =?utf-8?B?QlVBR2w4cFNqMlhCelhPUXhvZjE2VzV6UUVmRkpvQ0xPU3FmV25maDV3bGNh?=
 =?utf-8?B?MnZlTmNEQUl5ZFZFaEFwTk9Za245V3BWQjRNdmFGdGovTUhhV1pjaVVoaUha?=
 =?utf-8?B?RVpDNXhKbkR3RG9wMUxxZXNDT212WUNhTFA4S1dXVE1UTXVFdGlNRDlPWmhT?=
 =?utf-8?B?NnladjUySTFsdjdibzRsYVZGYUhrTlB5WVZXTnR1QW8zZG5PM2dldVV5WWhx?=
 =?utf-8?B?RTJKNWFLeFcvUXVwZ0E5d0Rla25VRDdVN05kRU1zVnNEWHJPOHhqaFNIUUNt?=
 =?utf-8?B?YVg2dEttUUtxSXNmNXV1MWN4SllzMjVrejcweHB1b29JeCtnVFJiZE5XY1Z3?=
 =?utf-8?B?VjBMZFJzbU9wbU5tTDBHNlFuckVSR0JTejlUbThLYTFLM1VhWmpXRlJFS0gw?=
 =?utf-8?B?TFo2NGVXNzBWUG0yZ3JEd2ppM0x0RUd1dTJMUjRSc1hjYzE1TGZRdzZmbjRM?=
 =?utf-8?B?cGkzeDNzVDNpZXRaOHYzeGxCdEQvYmhyMW8vTG92RFVYS25yMGMzdjJtODBy?=
 =?utf-8?B?OU92SXdPS3lOVXh4S2E0SWdqQ0VVL0U1L1RDaGdHYzJ3SEs2WWI5d0dvS2Rz?=
 =?utf-8?B?SXJqWFhmbkxwc2NVYVRwWk4yVUhkR0d3K0IzTjNYVVJXcThRa1dpbzIvcGh4?=
 =?utf-8?B?Nlg4T1dGZkp4TjlnSjJPN2NKcGs3eVlmVmJ0UTVQcThUbnBYN3czdHhOWXB3?=
 =?utf-8?B?YjVHMVRoOEJuMityWm52aHVrendEcnFNRnJwV1B0ZlBTTTRwNVRFb3BiK3Zu?=
 =?utf-8?B?MHQ4R2pHSmZJcEdsTGtZemtRZHBkMk9SajFtTzhSNSs3TEp1NHd3aEhaajd4?=
 =?utf-8?B?OFk2ZFh6Tm8zanA5b05icEhQS1lIWFpKajBPeWppRzdOSjJZUEdiZGFadjRr?=
 =?utf-8?B?STZCSW1JeVdaOUhTS2M2SFVhQUJXeHFpQjB5OEJxbGNXSGZ2M2ttYnE0Mkh1?=
 =?utf-8?B?eHVrbVFsNjYzWGtQY1k1RlpjUTk0TEgwRWxaem5hYnVJRDhOcDRpNUtIUDNZ?=
 =?utf-8?B?TUthcWhEQ1ZQQVB1UTNoWTU0bndhRWNla2J3bFR0SVFOTlIxMkJyNWhNMUlI?=
 =?utf-8?B?VHVWUGcxL3BhUmEvc3puY1kzVlBUdHdHcTNVV1VHdFJheFFJNWtwMlNzVlMz?=
 =?utf-8?B?WjFkcGZ4OUZHWEt3WHlxRDQ5djFNSlRxclVEeWlXNExHYXIxTThsOEx1TXVv?=
 =?utf-8?B?WFBMMitoak90M0hYbVozU2FlZ3I0OUZ2UVRWNVdIRWl1NVpDRGRKQlJKNUJk?=
 =?utf-8?B?WmFxNFpXZEt4VXB6cVYzWlcxYnJVZlpKaUJZa2pnZ3pidzNBNGJvd1dyMTJI?=
 =?utf-8?B?MWg5eHFMWlFVditBZUx4TFpXa0pnQisrNHVmMGFSc0dqUGlsTGhyNTU4L2t3?=
 =?utf-8?B?NTY4QjRJY1dwWEd4azhmVGN1dHdvRzh0MVFUQTQ2bngwajZvY2c4OEtINmdh?=
 =?utf-8?B?YjUvUm9DWEg1bHlmMmNqK3RGa1l5Qzh0TUt6TC95WFU2d3dxb2M3SmdBOHA0?=
 =?utf-8?B?aU1UQkljU0xCVHI5SEpUUm5WYVRFc3d5a0JscnBjK3cxVThWQW9yZnZIL290?=
 =?utf-8?B?Vm1lUUhPUTUvYUxmSTNKbUlBNlBoOTF1dEwxSTkvUEh0MG84WW1saW1IMVdq?=
 =?utf-8?Q?z0RORLr4itAMVUJyoG2RAvQC4YPHJhAG?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkREQ2xLd3JIdzNyT0lwL1JNbWhoUFdMSzNwV2hSanhtN3BsTmhEdUxQeE8r?=
 =?utf-8?B?dkZxaWx4N3VvUVVOZXJrWXR0dUJmVzNJRWkxSXZBUDZyalQrQ1V5dVk4M003?=
 =?utf-8?B?YWFRMTRyMWpvcGtTZlQvQkRkWXBLN0lCYStiZXJ4bmdwVE9NS3VCSUl2Zlo0?=
 =?utf-8?B?dVZkVVNMT0YwMWtmUkhGcUV4a2RSNW9uWG0vbXZGTmpGUUlNOTNRd29OeENQ?=
 =?utf-8?B?T0xaWWsyUEZEM3hxTnRlY3VDWTNNbHBQeHJ0d01mQ1FKTFZYUjZKSDAwbzZh?=
 =?utf-8?B?bWViQjhNM0tRSTBqR0VxaklxRlNyMDZhbUszL2xMMXFkcENyMUZBNXd1eXNK?=
 =?utf-8?B?NUxsS2J3djUvK25VNk5TTFhDbDNXRnN6R0Y2dHk5WWJXSzJmVSs2WnlsTllH?=
 =?utf-8?B?QUJrWW8wbzhlelhCRXpIUjl3Z1ZNTmI1R3BKL3lyVGpNUVNGeTg2dU9jYzE3?=
 =?utf-8?B?MS8vai9nZVJBeWtkT1V3dTkzLzZFVUhwVU44Y0EvaVovOVVobThvUHlqUlpR?=
 =?utf-8?B?SmhEQlE0Y2NIRnl4VHRtTWxnZFNjNGxWTm5IWHF0eWJZZXBtQzdkYWJYNFNE?=
 =?utf-8?B?cSs0bHRXcXJlVkxTRUNoVWFRKzhDSVArZEZQUTBrNldYSzJTUFB0ZDUrem4y?=
 =?utf-8?B?VVJZb0x5cEZBTW1RS1ZoaVBNN2JvcHZhWitQVFJlNGQyYkNEakZDeENDZGlU?=
 =?utf-8?B?d2pnSStpTnlocGJlOGhDdXdtODlhYVZzN2FTTGVXcEZxbk9IczZxNEYwZUU2?=
 =?utf-8?B?emhkMUJ2WE13M3F3V0k5OFExMzJka1pITUpLb21PZ1orS1VmNVFwY1h4U042?=
 =?utf-8?B?SFRWU2w2ek5xL1FrQ0Jjc1JXaGdZd3I5NlRSYnBCaUtFQ1ZJTkwzcHZ5MW5H?=
 =?utf-8?B?Q0lNTmJGUEdkcU5INXdmaWVid1Z6Mm1VdWRqNDZFQ2Zkc2djZlVESUhid0Nx?=
 =?utf-8?B?L3JTY05GQTNzQ09rRnRKaXJ2SDhEamVjR2trcm8xRlZ4dGVxODk4OUdSZEU0?=
 =?utf-8?B?SkljM2NvKzZMRWM2YjMvV0dmTEE4dXRtcFFvS2dLK25nSXJ1eS9MbE1NT2Yv?=
 =?utf-8?B?eWdmN2p1bDlzS2xTL2NjUzJsTkRMV0t4QzVCbVRTcnhVaGE5VXhzRmRhbDBv?=
 =?utf-8?B?L1FmcldJN3c2UUNVQU9lNGFmRzErS3FMQ3ZIVDRGaW0xZWRKR3cxVFVuUmpB?=
 =?utf-8?B?TEhpSHczWDhPZUJWVjVuTnZhVDVKdklDcnpHOGVQTWt2Wnl4TVl0eXFIV282?=
 =?utf-8?B?WUM2ak4yT1haZktHMHhyK21wV0s0bnlYcmlBTmxJN0Nzd3J1eU81Q1pWVSs2?=
 =?utf-8?B?dG1JQjBqUHJESldSMlB1alVCT3lpdjdXLzM0c0FmRDlnNTNNREZVWU14ZjU2?=
 =?utf-8?B?MERvK0NrYXRweU1Mc0xxSkY2WE05TUcvOXFMY1d1L1VQMHdZdllueEk3V24x?=
 =?utf-8?B?ZVF4OW9VVzhhZzI0L0t0bWpNMjJMcWZkN2tDQkkxbDE0RVY0SUZSdHpiV2dM?=
 =?utf-8?B?QkRxTGdtalU3OHkzbHc4NmQ4THIyNTE2SzR0UUNyUUNWWHp1eHNMQlMrVURF?=
 =?utf-8?B?ZVQ2TG42RzVheUpHd0dsdkFFaWNWOW00dWw3MkRsVmN4RFMyY3F3d1V0UWtO?=
 =?utf-8?B?eTBQMW96TkUvQm1hUjY4SldVaG5leDdYb0hSOVVMOFNkQ1c1WGZGdyt2UjNh?=
 =?utf-8?B?TXRObGNiOWJVNGlGNkZxcU5YMnM3aDVyQ1hsS1crOGZQallKeHFLbjd1S0Np?=
 =?utf-8?B?OTdHWTc5ZVc1ZnYydEVvOUVGNHd5TWxrcEJzbEpENEhLUFhtMGppS2JtY28x?=
 =?utf-8?B?TFZ1bmlrYkxnQjExSkViWGpZblFEc1R2eWI2U2IzZVY4T2VhWnFKL0FaS1Jl?=
 =?utf-8?B?T3RHeVVvUUllc2REK3NINTErOW1vRkpOcFNUR3hsMXhiN2EvM1R5My9DRnBk?=
 =?utf-8?B?MnN4eHhTcmkxd2VVNmVpeHgyU3oxSHBkeEIzVWJLZitsOGVLWDBVUFN5TEZI?=
 =?utf-8?B?dVhycUFmSHlZSUdSOUZVVEY4VFpYZ3RkaWIyaXVORy9Bck5JcUU3blhGc2k0?=
 =?utf-8?B?N2FXY3dlRzN0SzI3OVFPMDV5NVZUSVJscmtiNk5nSVZoSHZOUDhlb3NCWDJX?=
 =?utf-8?Q?Burs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b60e636-afcc-4248-7f20-08dd2b8beee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 00:16:56.4606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwFQ6+MPNR00bEgI1J53c3+AH6aHz+yuzZZXtSM+Jggt9mGPlOS8DQYn1fJQsBxBqcV7L8oJ0ygQUKt1apLvfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogRnJpZGF5LCBK
YW51YXJ5IDMsIDIwMjUgNTo0NyBBTQ0KPiBUbzogQmFyZCBMaWFvIDx5dW5nLWNodWFuLmxpYW9A
bGludXguaW50ZWwuY29tPjsgYnJvb25pZUBrZXJuZWwub3JnOw0KPiB0aXdhaUBzdXNlLmRlDQo+
IENjOiBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7IExpYW8sIEJhcmQgPGJhcmQubGlhb0Bp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBBU29DOiBJbnRlbDogc29mX3Nk
dzogRml4IERNSSBtYXRjaCBmb3IgTGVub3ZvIDgzTEMNCj4gDQo+IA0KPiANCj4gT24gMS8yLzI1
IDA2OjMzLCBCYXJkIExpYW8gd3JvdGU6DQo+ID4gRnJvbTogU2ltb24gVHJpbW1lciA8c2ltb250
QG9wZW5zb3VyY2UuY2lycnVzLmNvbT4NCj4gPg0KPiA+IFVwZGF0ZSB0aGUgRE1JIG1hdGNoIGZv
ciBhIExlbm92byBsYXB0b3AgdG8gdGhlIG5ldyBETUkgaWRlbnRpZmllci4NCj4gPg0KPiA+IFRo
aXMgbGFwdG9wIHNoaXBzIHdpdGggYSBkaWZmZXJlbnQgRE1JIGlkZW50aWZpZXIgdG8gd2hhdCB3
YXMgZXhwZWN0ZWQsDQo+ID4gYW5kIGFsc28gaGFzIHRoZSBETUlDcyBjb25uZWN0ZWQgdG8gdGhl
IGhvc3QgcmF0aGVyIHRoYW4gdGhlIGNzNDJsNDMNCj4gPiBjb2RlYy4NCj4gDQo+IElmIHRoZSBE
TUlDcyBhcmUgY29ubmVjdGVkIHRvIHRoZSBob3N0LCBpc24ndCB0aGVyZSBOSExUIGluZm9ybWF0
aW9uDQo+IHRlbGxpbmcgdGhlIE9TIGhvdyBtYW55IGRtaWNzIGFyZSBjb25uZWN0ZWQ/IElmIHll
cywgdGhlbiB0aGUNCj4gbWFjaGluZS1sZXZlbCBETUkgcXVpcmsgaXNuJ3QgcmVhbGx5IG5lZWRl
ZCwgYWxsIHlvdSB3b3VsZCBuZWVkIGlzIGENCj4gcnVsZSB0aGF0IHNldHMgaXQgdW5jb25kaXRp
b25hbGx5IHdoZW4gbWFjaC0+bWFjaF9wYXJhbXMuZG1pY19udW0gaXMNCj4gbm9uLXplcm8NCg0K
VGhhdCBpcyBhIGdvb2QgaWRlYS4gSG93ZXZlciwgd2UgYWxzbyB0ZXN0IHRoZSBjYXNlIHdoZXJl
IHRoZSBQQ0ggRE1JQw0KYW5kIFNvdW5kV2lyZSBETUlDIGNvZXhpc3QgaW4gdGhlIGRldmVsb3Bp
bmcgc3RhZ2UuIE1heWJlIHVzZSBhIHF1aXJrDQpmb3IgdGhlIGRpZmZlcmVudCBETUlDIGNvZXhp
c3QgY2FzZT8NCg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBUcmltbWVyIDxzaW1vbnRA
b3BlbnNvdXJjZS5jaXJydXMuY29tPg0KPiA+IEZpeGVzOiA4M2MwNjJhZTgxZTggKCJBU29DOiBJ
bnRlbDogc29mX3NkdzogQWRkIHF1aXJrcyBmb3Igc29tZSBuZXcgTGVub3ZvDQo+IGxhcHRvcHMi
KQ0KPiA+IFJldmlld2VkLWJ5OiBMaWFtIEdpcmR3b29kIDxsaWFtLnIuZ2lyZHdvb2RAaW50ZWwu
Y29tPg0KPiA+IFJldmlld2VkLWJ5OiBSYW5qYW5pIFNyaWRoYXJhbiA8cmFuamFuaS5zcmlkaGFy
YW5AbGludXguaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcmQgTGlhbyA8eXVuZy1j
aHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHNvdW5kL3NvYy9pbnRl
bC9ib2FyZHMvc29mX3Nkdy5jIHwgNCArKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9pbnRlbC9ib2FyZHMvc29mX3Nkdy5jDQo+IGIvc291bmQvc29jL2ludGVsL2JvYXJkcy9zb2Zf
c2R3LmMNCj4gPiBpbmRleCA5ZjcyMWI4OGU2MDYuLmQwNTRiZTM2MGQyOCAxMDA2NDQNCj4gPiAt
LS0gYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL3NvZl9zZHcuYw0KPiA+ICsrKyBiL3NvdW5kL3Nv
Yy9pbnRlbC9ib2FyZHMvc29mX3Nkdy5jDQo+ID4gQEAgLTYyMCw5ICs2MjAsOSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQNCj4gc29mX3Nkd19xdWlya190YWJsZVtdID0gew0K
PiA+ICAgCQkuY2FsbGJhY2sgPSBzb2Zfc2R3X3F1aXJrX2NiLA0KPiA+ICAgCQkubWF0Y2hlcyA9
IHsNCj4gPiAgIAkJCURNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkxFTk9WTyIpLA0KPiA+IC0J
CQlETUlfRVhBQ1RfTUFUQ0goRE1JX1BST0RVQ1RfU0tVLCAiMzgzMiIpDQo+ID4gKwkJCURNSV9N
QVRDSChETUlfUFJPRFVDVF9OQU1FLCAiODNMQyIpDQo+ID4gICAJCX0sDQo+ID4gLQkJLmRyaXZl
cl9kYXRhID0gKHZvaWQgKikoU09DX1NEV19TSURFQ0FSX0FNUFMpLA0KPiA+ICsJCS5kcml2ZXJf
ZGF0YSA9ICh2b2lkICopKFNPQ19TRFdfU0lERUNBUl9BTVBTIHwNCj4gU09DX1NEV19DT0RFQ19N
SUMpLA0KPiA+ICAgCX0sDQo+ID4gICAJew0KPiA+ICAgCQkuY2FsbGJhY2sgPSBzb2Zfc2R3X3F1
aXJrX2NiLA0KDQo=
