Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4908397E77
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762959; cv=fail; b=SUyR2T+pB+zZN78VPXvjiqXQIHViL+js6ZvN1vWUS9WQYsC3veGQbfLUWrZ6NWbtS+udGQpuOiAQmjOiCnP2OoiSaGT6oY/dQyuYd5b99gMeyCh2uOyhLnNiK5LsuJPGvnzIRVzltGhH7lcpPdCOIBcJOwjIjksp1kFr/xJaaB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762959; c=relaxed/simple;
	bh=k4gOC4ASTRPnMTEjYvkW4fom3htqRa3EP52YwkNk+q4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hwECLZoQYeRvkWPFjRU2hoBHNPSwO45uRFT51gca/YwgxguqQZ7y1kA1DPOZQn2Cfs9YcdzyRpmVS2pos6/kmskE8rTvLDQKuPqPqAIt4gcaKAuwduMX9KWamf2ZUUSmWlz6foErCoYlpLFA80MyPFqHUa9sKQUyw7Oh+llSsEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtPqBNNb; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtPqBNNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776762958; x=1808298958;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k4gOC4ASTRPnMTEjYvkW4fom3htqRa3EP52YwkNk+q4=;
  b=MtPqBNNbJXh9OsNMYz56Gc42sB1XcQJnHH2V0hmfS0f0/Xv21XN/KHm2
   n71dkUdiS/4iSRTZQ0B5cfjm4cSD+xSJKl9AMuYKepJsBvbehOFenjdzJ
   zWkkShSZHtcgU8ZrrCNWSIU3+NajROtIqWTYyT8pfE7Fp3MALrIflInVb
   nw6zjnfz8H0NEaNIgcxnUto9FM6gnS8Y5QeNuLHZgoxvXSbazbBsp8SK2
   uUUuHKgsPaKeB3apfuNLDnekZ3XRhNfY6clovqG60IbNeZCHYGoDiHa1B
   22xczv8AU45OZ90eUlkCtRWq/KNxlxuXi2blL7C33liyCWX9Ud82E6Pxx
   w==;
X-CSE-ConnectionGUID: 2HlB0wLxT5GJsR67biPGLw==
X-CSE-MsgGUID: GwRuEi4CTX6Hc2bvXFzC3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88768739"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="88768739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:15:57 -0700
X-CSE-ConnectionGUID: PdBNXt4iQCaIu8jdIK1awQ==
X-CSE-MsgGUID: XKHkzbmMT6qCzjKP8tf1bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="236967311"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:15:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 02:15:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 02:15:56 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 02:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBZJKgJYYvPW8rmJkb2/qGjp9Xp34jKJbD9YcxY89ugiEXuynGgXshKepjCgEBFoHYLlvWglKaUjlE/ugsBO6goYrU7a0dXgKlDZy8dPF7d37zN26deeJEgay/FLwnMEGVUbdFFJaEpLHcAR5gaSYWghvmtEBxi6qEKMEhkL1FdUVm/MzVI+LzC8ZaBzp5Zg0TUMvghynUntC0u9e4iRAyMQBVAsTjqMPUa3vFyKWaEwxsPCd7oFfpCg6s9Uy1LKmtuSz3QOent1ADcOHE9ksMb76BN0PiKZ6l2iclb4CznpxKaVo1kTlibwDwRCjQ1LRvTR2buaXqkWnmZjWvzwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4gOC4ASTRPnMTEjYvkW4fom3htqRa3EP52YwkNk+q4=;
 b=HykwDAdecLsuDuaB57QC9b2QfwDZZt/DWUY/VYyM5qvlrQ8CAsJw0y4Qh3cVLxKf6iq+X6T/7lHF0PGRjyXhY7/1HpSHA+T2yb0McwlKPpbRe4AJ80Dua7njUDoF8T4wNnQ6S2ylWiy8EKAQYH4+SfefZ+CalWiXHpOoJKhZ1xNVw/2bXGZ1Q7Q1pdjhqKYE05uOgJnenHsyy6Y5kzCmxIIqbOfRot57pNhXvRNu0d7hcpSpwuFeHXuFkp7CGuMMgx9hpLRFuYYuVzMkF4PKmaG9uuWnOPDDuCxs+HYkKPgF7hmM5Par6ISRun5MFeuDyvgQjTlrMrpb7lNECFO2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by PH8PR11MB9855.namprd11.prod.outlook.com (2603:10b6:510:3c4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Tue, 21 Apr
 2026 09:15:55 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 09:15:55 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>
CC: "tiwai@suse.de" <tiwai@suse.de>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH v2 2/2] ASoC: SOF: topology: allow user to add topologies
Thread-Topic: [PATCH v2 2/2] ASoC: SOF: topology: allow user to add topologies
Thread-Index: AQHczWMUclydFA9PQUuKNBHVffe9mLXhcDwAgAfTxnA=
Date: Tue, 21 Apr 2026 09:15:54 +0000
Message-ID: <SJ2PR11MB8424E222A3D434E51263D4FCFF2C2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260416053552.3464661-1-yung-chuan.liao@linux.intel.com>
 <20260416053552.3464661-3-yung-chuan.liao@linux.intel.com>
 <aeCvTNeUh1DK68Q2@sirena.co.uk>
In-Reply-To: <aeCvTNeUh1DK68Q2@sirena.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|PH8PR11MB9855:EE_
x-ms-office365-filtering-correlation-id: 9bbf5edd-7765-4ead-fafc-08de9f869786
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: c6Cwt4w72U7BBxrLmlqClnORb+5Lupu1QxVGmXoeqHxsMj5ZlH7B9yzVosQn0KL9rNJxypUQzoXSfIAfbJ7tq+Q8tGL8xKsGJKUKgAivWP82yYV+LLIzSJLVMKUEdeLgHCLimtMAftDMHqkypl570x04BF1rA7S3FsD4PBzlymgmVy6eCLsdvoXsdmYQNjFLPx3sCnj6Q0670Z33+hemRUdBImw/Kug8Z8r6VBr1O+NdhbW8mQ+pRUqElyAb9N4djiTPgHEV+2HwLnI6GgAAHICFuqo9kD+6jhExfferNWhGD/zM2MnsUi0/RtxM+iek4aw5k61tvVE0Ay2IAJVny/oRmTYypiCI6ysxGzyQhzpbQrxh/4brM4gR6EuDMwwri9i310ybzfiSx+F+N7OqkkT0qhH0X3IUSnLy7u5RhFQaDIGMRS/6iGHe+1CZgd0na3lPKtWTyqakNjTiN1LrtGp2BSE+ty3JkBqWNKsrDVkDE3SKHTuJrgBtShWolEqkbfCUcpi/SG2TbDPPjX7tc1LuAMP/LbKXGeYZqqkr5QvD1n+kom8Bgr63IGaK7hNCtgklz1qflz/2outS9dnlTajjvPXYHIzyhH9rV9yOzPgQDGX7nt0NjxI3z/L8lBCm7WYpsEjS7c+rr1mfxGtILIjxNH/zQjP3DAimCL71ivbuURUV0Nmprw7abdvx2D7IvCU9oWFywMjDxcBGA6/iWGf79evdshf2v2/8wB+pRXECveD18/8YD6ZUtiBX6gry8mKyVpnBRM39I7Wi0XvFOfmjDvvga3ljm/gg3x0CFJM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DFWGoyAWXkfAJozSHY4n6MQLRqRhXMGxeyRsoQqSAybV5Wtm8Ao6JC4QjyNv?=
 =?us-ascii?Q?nMrVXDoyR1RPQ6OsoIpCtuR9tzrN48RQ8jFhGsbAyxz11Ju2IbIOfUO+J+CZ?=
 =?us-ascii?Q?Womy403P0Fh8sDRMKB7nLRrWV6g8Zo474LVTRhtyElcdwMr3AkpRvux4HwOB?=
 =?us-ascii?Q?usH6gerUxD5NjYX0ABiN5VmQszMYs/HSAgy9TY/EqIH04S1n2N3LPKApBwlV?=
 =?us-ascii?Q?OKMdywDGk80kASsS6SR69fkWf4TXzW4wZFXK10jYR4wQRkmB7TGW0JV67AOt?=
 =?us-ascii?Q?jpshzKtSAZF8tjptCU15gbbnbNGFyitsoeiugaJIk0FN3NmnuJgpIn4f1DlH?=
 =?us-ascii?Q?I8Qv+ONl/SscmPmRMZciPlmtjhPB8l3f9+ZC+xI+7BYTSW0IqeHq4BOGkVu+?=
 =?us-ascii?Q?24wTvllfPNHEkfMgjXR/HR9iK0xdQZCmTkddi6fD0ABxdgAcIHjak3mfY/QK?=
 =?us-ascii?Q?dOmrDheuyuQ1b5TjAtZF4z+XBf4ZQEYKaI1tKQrp5+cuOP5lVp9IycFnCwbV?=
 =?us-ascii?Q?aSbZKiRxXe4TpVig1nvOo8/o0/LK+8fJN/1kyDYmLDStU66NZhUOb0d7fDSc?=
 =?us-ascii?Q?m0YFX08S3BiMaTwTr9wVPL2krQX4iXI/j+wEvVKvSkIt6j/HMpS2ecdKf0HK?=
 =?us-ascii?Q?5y8f8feKjESpNi+lCQniXIPTD5MnOqJidDTFii9gKucrv4poWCfSUFSZ6uNA?=
 =?us-ascii?Q?rl0nE4qS5brjkElTJgHVxiWowc4yFp6tu6bkRPznzkDa7bGtQyk8656ndFkK?=
 =?us-ascii?Q?EOsgWKVo9UVtZCuXjzP2Ixj4ZoGkdflQtMtmXhCd4lCm1JTDlF0UDqP7sACQ?=
 =?us-ascii?Q?styGZLq9FXB29nZzvS8nPakeeybQ+owD2zocloJaRl0/raeNjhI/ercqPksL?=
 =?us-ascii?Q?z45hoBln0SiK+sJUhYplgYB4oOIqlp2iN7aLlB0lRtm8gSg8pu8wGl9tbKkE?=
 =?us-ascii?Q?CFyYhibl1O10Wc5eIEZB5lok7GWU9qHKQtF5HrBitFOYsRDztaAcFw2q/d1B?=
 =?us-ascii?Q?sY5HuILy/J+LFwNPVGZupELplmHA5kWuuRr691cHjYHfH/ZCR7VtnFU2E9Dz?=
 =?us-ascii?Q?Mj4r4NVRmvwr1CpNkcZmqQnrW5a4FtcIlZ7t62EVfy2Y7UqBaBA74mJCcKFY?=
 =?us-ascii?Q?V1RSRMWGIf0gHdE95ZTQ17aNGzmvAlcm6zM5SWXbI2E+P8kTmr0wCXheRcGM?=
 =?us-ascii?Q?rWu4cDIl9CnUwjHOigD4IMCwhiW6BLmZfEmvwDwEDWspmBBrQHCvXi7iSvy3?=
 =?us-ascii?Q?9558/J/1VocYi60jwjuPLVTSXQIJ6KhYzq6O04ljRjwVG2q7KGJ1o/iVLxVh?=
 =?us-ascii?Q?jwdipOd125Hd0WN82gIW7kyQ7LgTy4Wf3x3B9vN+DJZmx14M7gCqztqjSPES?=
 =?us-ascii?Q?aQikhL1FOhQ7kjBqaDrlkYvSmc2xLLthRbNpGNtbVzcbIqelylRmbIiYEoHb?=
 =?us-ascii?Q?y7IpFkE+Y9lPL1EAFucC3kvkBrhWVdd1VgEIrQ7u5XvnkY5HgW8SNVLSNv0f?=
 =?us-ascii?Q?sU1GB9c3huDSSbr4Uy8ybwET2FMoH+HG3RlbiX5rxBAW5pCrsm2InNBRyA5u?=
 =?us-ascii?Q?qWdljKJKVPvqQJofagfSnPbvX+8cVlhyp/13pzW4bqOQQ1AkfdzpcanQEi3O?=
 =?us-ascii?Q?GGi/DMOYZn2hx+98QFNLRy5SYQxmotg3MZNrBeV1MaBApfczaCOglu8tCYnp?=
 =?us-ascii?Q?GWOO6cvOzZ0uGpjLpZ5x+56HFYqNYsTrp1fZVTiWwIDHgcw8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UIg2OwnjuIxKVjHSW0hY5rtRr2Q9TJcygsSpf7Kql0DBRxut3FoQ/Hrg8HSWowmih+d1xAhTVxvYvxgNK6c8NatpiBG340s5SZPu0008Y+M3dekd+etYECU0kWpUZGc7zrDZw3L6nzyDqvbj1V0J8cb9YTeZz47ib9mJUUBaOy8XTt/Mp1OjXLT0SqZkPEcWcALqI/qox2tHYsIED52xugZits/nTP7zBTQpMa950OUKPMy1hmuFdwOH7Iz7nZ01F1cJ8Ivqw2oaDoHEyAp0pTlx6WGEMnW6fw28fsg+KkWA85XR5vLGFGCQuORcdLOesC6Ubv8427snBynQ/F3iiw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbf5edd-7765-4ead-fafc-08de9f869786
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 09:15:54.9465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipD6psR+CAR8CIi3XCnjVTj32NBjIHEZNQdJ8sn2uJpPEo5+wedtB8PDYMuuI7YqZIjf66LCFmzfGoD4WHMq1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9855
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, April 16, 2026 5:44 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: tiwai@suse.de; linux-sound@vger.kernel.org; pierre-
> louis.bossart@linux.dev; Liao, Bard <bard.liao@intel.com>;
> peter.ujfalusi@linux.intel.com
> Subject: Re: [PATCH v2 2/2] ASoC: SOF: topology: allow user to add topolo=
gies
>=20
> On Thu, Apr 16, 2026 at 01:35:52PM +0800, Bard Liao wrote:
>=20
> > +static char *feature_topologies[MAX_FEATURE_TPLG_COUNT];
> > +static int feature_tplg_cnt;
> > +module_param_array(feature_topologies, charp, &feature_tplg_cnt, 0444)=
;
> > +MODULE_PARM_DESC(index, "Topology list for virtual loop DAI link");
>=20
> The description here still references index not feature_topologies?

Sorry, I missed that. Fixed in v3.
