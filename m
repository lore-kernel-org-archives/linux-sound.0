Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD531280D;
	Wed,  5 Aug 2026 01:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892925; cv=fail; b=QPlxHb47nj6UBbaOk9G80bnA+W83AosOBbzLt7y3bJNX6Y56l6WHKCIt3ZtQ3BNbGqoCYUojrHWB0JXSSuoND6yq3jwYo5ahAOD4brpkQiPtzgPw5MSmrXiKaCaqQAl9hXe6lv1Kr96j6gtuLVE6wUa2euOnKmVKa/NB9FiTMGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892925; c=relaxed/simple;
	bh=5WFAMaimrLp740Vo86VEwWJJPxBXgUt5mrQonutEz6Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=orgHvvG6yWISUa+K3BvWoMn3L2baEuGzi78HlaIIg0dZNdLazfK+UgqbaDms27LbsB1Hb5nAuV/1cVXxiV6LQ46piryqfVHxZXxzHtmgouGRshfN6hk5elQOgkpH9cMxFeIMrtoH6f0FAWnJfdvvnTEKxEiLyo2SSgD826OeCPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuEYio/x; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuEYio/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785892923; x=1817428923;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5WFAMaimrLp740Vo86VEwWJJPxBXgUt5mrQonutEz6Q=;
  b=TuEYio/xfAW2uTI/qY4FgeQw4fplXrAuZyB6DukzChm+P+ysqvtQLi86
   FrNfuemwXEBl9S9u2JCnHuXj6UpxcwiVh0QnIuHr4e3KRF2BuFRJoRa/+
   0vGfK7q8ONqXdqwdYysTo5NwMDXYmYfZo5QWpc0uz7gsH1m3pc8UQSyUm
   vhZ/EPFozIi+LpinC5NEvftXZkFcwDF5XnfhqWS8SiSWoBxsu2bwEEPJK
   koLkebAiAQKPXjCeuw2aGJIbDfw1MCEA0ts2Ov8C7fi0z6rcddcSLTeGb
   3doWDTP4IWESARHvVpH0MZ2jUBw4iKk/hinooCQ1VZsLLJ+KO7Smc/RZQ
   w==;
X-CSE-ConnectionGUID: EdEBw1VnSeiA+25NVPyxwg==
X-CSE-MsgGUID: jEhYI9OuQnOkTNlrerNYOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="85435765"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="85435765"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:22:01 -0700
X-CSE-ConnectionGUID: 4Buhn7AfSpKG8Iy5S6HjFA==
X-CSE-MsgGUID: 25JbVrJVRhSro12bVB0udw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="263648746"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:22:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:22:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 18:22:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:22:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywbm0gn4W+bawJ9Apy3XsMUnIbcTcVtV1KGuw98Geznfh+xZjgj56mgdIbCfSTu6AR6EUEIYJIJ4xPuR44sReyB/dVt2sa03Ph9vveUgBJEubtewTjvJ8MdWuZsBIt7z657ciwV268SbfwAE/4Hw09qUL0BQKLU3fqPcWQ579T9tyu+4bV5kM6frBQLUuM9CEM0uAHOoCT/oZGXqDn6qr7ivigcPJHHHGbqXq7fAQT886JuHI68o0CsSt0+Kc1Mwa1Xjd/AumvFcy4TJm1B13EU+BRUAMBWiazHunCETdOvsDws0w5S7t4nny6YDA1hT6xnaq9/eFXBPssUVSLnFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WFAMaimrLp740Vo86VEwWJJPxBXgUt5mrQonutEz6Q=;
 b=P4N+xhEJ4FTpSkF49BI4vK3P3D7lwNYq6zZJX513ScgPXU6d6BrMr/uoBAhcsLRAncle3xbT6JYO2eZw4Kpo9uCNUGKl2RZRV5qh/2oV66b/0am7/TFRP3tG8AOWrMTpv9uUPftHlanXlcEFEVyIES3tbJu3o1z/gq5oiVbIgbkmi23FR80K+jv4ezjFP63SC9+iZHJDmbKzr8vfCKlInojjf2s+xgEA9d1Zm4hddyJU+aHapF0kTB4K623mMsE8mlZGvjvMAiQwu5aFQRG0MolvCboKRS97+cd5iFguJiNyaFC4lWOZyngLNTGDLlhUkFQyTfvJPFrEXFQYYSFGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 01:21:57 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 01:21:57 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Daniel Baluta <daniel.baluta@nxp.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"sound-open-firmware@alsa-project.org"
	<sound-open-firmware@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] ASoC: SOF: Intel: hda: duplicate _ADR entries share
 one amp index
Thread-Topic: [PATCH 3/3] ASoC: SOF: Intel: hda: duplicate _ADR entries share
 one amp index
Thread-Index: AQHdJGUttSkd+cex2UuzG/I3aKi4TbaOqCRg
Date: Wed, 5 Aug 2026 01:21:57 +0000
Message-ID: <SJ2PR11MB842442415FD961269F0D43DBFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260804225853.31585-1-lsa.uz@pm.me>
 <20260804225853.31585-4-lsa.uz@pm.me>
In-Reply-To: <20260804225853.31585-4-lsa.uz@pm.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SJ0PR11MB4814:EE_
x-ms-office365-filtering-correlation-id: 1ff735e0-4981-431a-aba9-08def28ff143
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|38070700021|921020|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: DVlZ3jSvqf9ymb/MIJ/KfPILkghdxYyVG5W3WAH8yLNwaS7pu5h8qV52Nj1+gl/Umjc8iln9LMh9WfV0xxJAAEY5caRADGB0x2hbDao/CB56kM10nZP23uKgFR9MTUIK1DIQEdSF5dcie4LPC2fjHb5vFQsuAT5rZabZSdxWgGOc9T2g8n+sWdtyswmtI3H5+cMPkFcPOwm9VYXh/mZzyVC4/I+N6hQvG6IIHk0hycM59jJ3jWP/darnheXN4LJQ5RIwg13+daVJLjt+dTf1j72zIboPXdusfZ0Fd1ku7p2mnilKiMR2rLcAdXf4GoFue8ELKSao3U2y6HtxX4CAxk1DdLmMnKot7PYM2XfJTQE1dIRQFFVLoNf/NateZM8kTnTHatvVcjBU31ZluZRrCeMsuHI/C6668oDlcJiPCe/N+w+loOUWL0jfOuGOUMst3/gVHKTnZ+O3iSk+zFJpfCNZZ5ZVSNZ/Pq0uz4IrgE1Qu6NpvIX/Sh4WL6HpF2LwpK7gc9eF3TliNX1RsxbXLt6G0lJn7xIkEyZpP7PeDjARfyvDzFl5+3JOEvczon2C5zhnEG6shlvZ13Tdf8zkaL7204jU3hun0y6qzHWeOA0+k4FG5++071VMFCIOn+Jpj/UVYcDdpNZ6WVletqSzrj4/hpiGb1L5egsr0+mLjp8d8lF9r4YB8tsFAN1ZIfYrrWuU16IhQy5BOoxNDlfIcZWWfBk15V3gkk8EOmUi+ezxVTSPS727wHQ5oGpk/Nxr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(38070700021)(921020)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NURPMTltMWNWbDZGTkhleGZlbjFyb2xCL1hLZVdIMXFXOUpKMWxMTC9BbTkr?=
 =?utf-8?B?Z3dsS1YyUFJzVlBiaVFRQXYrWCtqM1lOOTdON2RFNEtuaWhGSXJIenRJbmJM?=
 =?utf-8?B?LzBjYzNLMUlXTUhMS0NOTktCMDZIQWhrczkxZXQ4UFJpbC9sUmdub21VQm1Q?=
 =?utf-8?B?YUo4Y3hyOWxEdml6VHRqelpMQ1lja2ZXSzA3ZW9jOHd1SGIxWHQxRUpyTnFo?=
 =?utf-8?B?a1FIWEIxTHQ2VEh1Yk4vaEFVZmlHV3JQTVNnWEIweENDakZwM3lWS0ZLSWtE?=
 =?utf-8?B?UVV3YUtjSVh5QnZVdXdITTBvNG5XYXd4QzIreTRCTXhvdE9SaytEa1laY2VL?=
 =?utf-8?B?UGdrNFhteW02enk0UkRZWFJ0L1JYZWYrbHp4VzBOMFRZWXBLb1FBM2t0dkU3?=
 =?utf-8?B?RVNscGh6QlNpZWZwWC9HdU9wWm51d1ErTDNkYXB0NEtST1NEYW05S29BSHYz?=
 =?utf-8?B?cXI4dWlWS0ZGZXFCbURxVjcrZlIyMWZhd1RubkIwaU4rYVlnSHRDVjJGS1Vw?=
 =?utf-8?B?anZkSnpGUVIwOUZ0MVZyMHltK3dtMURKMXhoMEEvUlNDTnFSN0p4T2VkbnpN?=
 =?utf-8?B?U2RjeDBEMmttYnhBdE1UZHdpM0FnMFR0dmVHYmpBS3R5elVEVzlpTHZBSzhB?=
 =?utf-8?B?a0hzL3RXdjUyRGFhMDFlY21CZE5lUmpHNllmOUJxejhma3hhSkxqMmc5N04z?=
 =?utf-8?B?ekFDYk1VUjFnRHd6eHZITUg3M29lZm1vYkkvK29BYmN2U3RLSWFjQWUrV2tC?=
 =?utf-8?B?UUdwT1JzZnJkUVBPTGtVbDRBT2V1K3N4REZWNDFTVUFQeW4xdmIxOVVoSjBu?=
 =?utf-8?B?TDcxNFROSEVoUE9WZDh3eHJ5TTNrY1hrKzFaaG5vaEdIbzFoYTZYZjl0UTU2?=
 =?utf-8?B?RlNxaU43eTNBVytJYldrbnplTXBvTHNNemRvU21wOE1YOUY2MS9pRVVYV0w3?=
 =?utf-8?B?RmZEK1JCZVRDNDlSVHNQUmV3QmZaYzRXRmV4V08vNTloVFljTUM3TDhSZURP?=
 =?utf-8?B?QWJRdG1NK1BvVXlBS1kybXVGY3BueUJnMVdwZHpCU2ZLS3JjUTJYTnBkOWFU?=
 =?utf-8?B?bHh1TjNlbEt2UEZqck5DYm9mTWZ3ak5xS0JpeUdRVitxdXFRTEZDZzlGY2sx?=
 =?utf-8?B?RkhlVDBlcC9PRHJxdnkzMm96Q2ZOMnVPczd0Ym9WWWZ3NCsvU1JXbytLMlQy?=
 =?utf-8?B?c1Zpd2FlbzBuZ2hyU0RvQnJGNE1rZE1pZlpsSWRVa1dGcWk4RnBOK0JnQkNa?=
 =?utf-8?B?Nk15SHB1RTZFT09JbUlWQWROb1hSanE2UkpocjBlenlQMkM5Q3NFOWR5RC9t?=
 =?utf-8?B?QkI4TE1pajEwVTFiSTYyamVrc3N5QTFOdWJvT3BSMUdTNW1Fc1ZzUmg4cEdy?=
 =?utf-8?B?aTdTOTU4ZXlabnpHQlViRnM5MVZudTl0Qkl1c3A4TmpsR1lxQjVpLzVITEc3?=
 =?utf-8?B?NzVEWmlIUVVobjBid1FTTjF0ajJMdnVuUnZhbExRMzBNdmtxV2VJcTlhWGhU?=
 =?utf-8?B?bU0rWnZEK1dtd0NFWHVway9kbTRESmw4ZURqdm13VStpWHdibXJQeXkxTXBk?=
 =?utf-8?B?SzNneEwrcUtLblNoUXF5RjFzYkhkbFVuRkNHY3hWR21GaEN5L1g2dWtFclFV?=
 =?utf-8?B?UDNDcUJPMEpWand1bDJQNFhvZU5jaXhjWFltazI4WUI0ZWR4MmpwOGNoUmF0?=
 =?utf-8?B?UjNqbDFobjR6dmpKSjM1SE56TXZXa3dzY1VnOU41Umc5ZWlFOGtCTC9PdENJ?=
 =?utf-8?B?dXE4OWpSblRWSWlBZU9DNHo5UGdScUhDMzhUd2Q4djNGNEFtR2NLUmNENDMw?=
 =?utf-8?B?MTd4c3VZdDliNDl0K2FDQkdJK29JUkJCbXhsU3E1cXdzbXJyQyt2SWg4cUNL?=
 =?utf-8?B?eUxyVmU1am9FRG9pUHkwcUd3TWllVFlLcllRL0F2bW9sZ0hKVjVSTnROcmJU?=
 =?utf-8?B?QlliVUt3L0MrUHRKWDFIbE05c3VsWUdaOVdXVWkyU0QyNDNoRURxVWZ0QVBI?=
 =?utf-8?B?RGx2WkZQdm42L3gzd1NsOTJGcTFwMytVK292S05ERXd1OGpHQmU5eGE2SzZm?=
 =?utf-8?B?NUpJQUxiUklpVHNNcVhieXg5ZCtucFZrZUgxcVI4ZktNTzI0dnBnRVJCNGwy?=
 =?utf-8?B?RnMyZTFmYlMrOXRhc0kwYkdVRXY2SGFKMFpjRzYvV3VpaU04WkhXVXViaTdN?=
 =?utf-8?B?TFhBd0RHa3AraUFySXdyQ3I3ZTRwQjBXN3hTSHI1Yy9zTWdaU3p0dWI1U0cw?=
 =?utf-8?B?MnpKc0tRbGJ5WGR2Mjl5cndmaW5YZHBuSHEvTEZBM1UxY0V0TFlWYkFtOGVO?=
 =?utf-8?Q?nSB+XVgppdD8dkb1Zs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AunQZIYtzhB/uQu8Uj1C68VCPnUsBvaemF7vekW26cJ7+CFY9Z6HWxwPSQry1zl+GqtVdHQDSyUDwtiEr7G2hFdxnKOmuvWsPjcVRQoz63w9AVxVLbA5itx0LapyZixD3vu41n7ysi/Bfa+wzLcvVjNmcPUY3lm7Lc7pnFoO/tWbzSqcdG+7bJrYPikIRbG0RkyUsEvzkT4TP9htTRuz9n+/es0aHc1IPPMKbpDw5axoI7WOdQ2Tuw+6DafgxURi4MZPjUObdjv2AV86jAfQJg0zCA9krBGD30AbgwqXVKUZYEA36R97+/LK3t9xRMkpBPS7f3xLsOJOyig3C0o2Tg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff735e0-4981-431a-aba9-08def28ff143
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 01:21:57.4652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1T/cGS+XtDt6OODMx9AiWZxOnefzIMfpKm40Z7X8DEAk8j/aaI3AvzlXXKrCn1BbXkV3vNkAtZ6RgXiJYLWE3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VyZ2V5IExlYmVkZXYg
PGxzYS51ekBwbS5tZT4NCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgNSwgMjAyNiA3OjAwIEFN
DQo+IFRvOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+OyBMaWFtIEdpcmR3b29kDQo+
IDxsZ2lyZHdvb2RAZ21haWwuY29tPjsgSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej47
IFRha2FzaGkgSXdhaQ0KPiA8dGl3YWlAc3VzZS5jb20+OyBPZGVyIENoaW91IDxvZGVyX2NoaW91
QHJlYWx0ZWsuY29tPjsgQmFyZCBMaWFvIDx5dW5nLQ0KPiBjaHVhbi5saWFvQGxpbnV4LmludGVs
LmNvbT47IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUBsaW51eC5pbnRlbC5jb20+Ow0K
PiBLYWkgVmVobWFuZW4gPGthaS52ZWhtYW5lbkBsaW51eC5pbnRlbC5jb20+OyBSYW5qYW5pIFNy
aWRoYXJhbg0KPiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPjsgUGllcnJlLUxv
dWlzIEJvc3NhcnQgPHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5kZXY+OyBEYW5pZWwg
QmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+OyBWaWplbmRhcg0KPiBNdWt1bmRhIDxWaWpl
bmRhci5NdWt1bmRhQGFtZC5jb20+DQo+IENjOiBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7
IHNvdW5kLW9wZW4tZmlybXdhcmVAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggMy8zXSBBU29DOiBTT0Y6IEludGVsOiBo
ZGE6IGR1cGxpY2F0ZSBfQURSIGVudHJpZXMgc2hhcmUgb25lDQo+IGFtcCBpbmRleA0KPiANCj4g
ZmluZF9hY3BpX2Fkcl9kZXZpY2UoKSBhc3NpZ25zIGVhY2ggYW1wbGlmaWVyIGEgbmFtZSBwcmVm
aXggY2FycnlpbmcgYW4NCj4gaW5kZXggKCJydDEzMjAtMSIsICJydDEzMjAtMiIsIG9yIExlZnQv
UmlnaHQpIGFuZCBhZHZhbmNlcyB0aGF0IGluZGV4DQo+IG9uY2UgcGVyIF9BRFIgZW50cnkuIEZp
cm13YXJlIHRoYXQgZGVzY3JpYmVzIG9uZSBwaHlzaWNhbCBwYXJ0IHdpdGggdHdvDQo+IF9BRFIg
ZW50cmllcyB0aGVyZWZvcmUgY29uc3VtZXMgdHdvIGluZGljZXMgZm9yIG9uZSBkZXZpY2UuDQo+
IA0KPiBUaGUgTWljcm9zb2Z0IFN1cmZhY2UgUHJvIDExIChJbnRlbCkgZG9lcyBleGFjdGx5IHRo
YXQuIExpbmsgMCBjYXJyaWVzOg0KPiANCj4gICBTV1JBICBfQURSIDB4MDAwMDMwMDI1RDEzMjAw
MCAgIFNEQ0EgY2xhc3MgMA0KPiAgIFNXUkIgIF9BRFIgMHgwMDAwMzAwMjVEMTMyMDAxICAgU0RD
QSBjbGFzcyAxDQo+IA0KPiBpZGVudGljYWwgYnV0IGZvciB0aGUgY2xhc3MgaWQ6IHNhbWUgbGlu
aywgc2FtZSBtYW51ZmFjdHVyZXIsIHBhcnQgYW5kDQo+IHZlcnNpb24sIHNhbWUgdW5pcXVlIGlk
IDAuIFRoZSBwYXJ0IHJlcG9ydHMgY2xhc3MgMSwgc28gU1dSQiBpcyB0aGUgb25lDQo+IHRoYXQg
ZW51bWVyYXRlcyBhbmQgU1dSQSBuZXZlciBhdHRhY2hlcyBvbiBhbnkgYm9vdCBvciBmaXJtd2Fy
ZSB2ZXJzaW9uDQo+IHRlc3RlZC4NCj4gDQo+IEJvdGggc3RpbGwgcmVhY2ggdGhpcyBmdW5jdGlv
biwgc28gU1dSQSB0YWtlcyBpbmRleCAxIGFuZCB0aGUgcmVhbA0KPiBhbXBsaWZpZXIgaXMgbmFt
ZWQgInJ0MTMyMC0yIi4gSXRzIGNvbnRyb2xzIGFwcGVhciBhcyAicnQxMzIwLTIgT1QyMyBML1IN
Cj4gU3dpdGNoIi4gVGhlIHN0b2NrIHNvZi1zb3VuZHdpcmUgVUNNIHByb2ZpbGUgZXhwZWN0cyB0
aGUgZmlyc3QNCj4gYW1wbGlmaWVyLCBzbyBpdCBlbmFibGVzIHN3aXRjaGVzIG9uIGEgZGV2aWNl
IHRoYXQgaXMgbm90IHByZXNlbnQsIGFuZA0KPiB0aGUgc3BlYWtlcnMgc3RheSBzaWxlbnQgd2hp
bGUgZXZlcnl0aGluZyBlbHNlIHJlcG9ydHMgc3VjY2Vzcy4NCj4gDQo+IENvbXBhcmUgZW50cmll
cyB0aGF0IGRpZmZlciBvbmx5IGluIGNsYXNzIGlkIGFuZCBnaXZlIHRoZSBsYXRlciBvbmUgdGhl
DQo+IGVhcmxpZXIgb25lJ3MgbmFtZSBwcmVmaXgsIGp1bXBpbmcgcGFzdCB0aGUgYW1wbGlmaWVy
LWluZGV4IGluY3JlbWVudCBzbw0KPiBhIHJlcGVhdGVkIGRlc2NyaXB0aW9uIGNvbnN1bWVzIG9u
ZSBpbmRleCByYXRoZXIgdGhhbiBzZXZlcmFsLg0KPiANCj4gVGVzdGluZyB0aGUgcGVyaXBoZXJh
bCdzIGF0dGFjaCBzdGF0dXMgaW5zdGVhZCBkb2VzIG5vdCB3b3JrIGhlcmUsIGFuZA0KPiB3YXMg
dHJpZWQ6IGF0IG1hY2hpbmUtc2VsZWN0IHRpbWUgbmVpdGhlciBlbnRyeSBoYXMgYXR0YWNoZWQg
eWV0LCBzbyBhDQo+IHN0YXR1cyB0ZXN0IGZpbmRzIGJvdGggdW5hdHRhY2hlZCwgbm8gYW1wbGlm
aWVyIGlzIG1hdGNoZWQgYXQgYWxsLCBhbmQNCj4gdGhlIGNhcmQgZmFsbHMgYmFjayB0byB0aGUg
SERNSS1vbmx5IEhEQSBtYWNoaW5lIGRyaXZlci4gQ29tcGFyaW5nDQo+IGFkZHJlc3NlcyBuZWVk
cyBubyBydW50aW1lIHN0YXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IExlYmVkZXYg
PGxzYS51ekBwbS5tZT4NCj4gLS0tDQo+ICBzb3VuZC9zb2Mvc29mL2ludGVsL2hkYS5jIHwgMTYg
KysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL2ludGVsL2hkYS5jIGIvc291bmQvc29jL3Nv
Zi9pbnRlbC9oZGEuYw0KPiBpbmRleCA0ZGJiYTkxODYuLjFkNjBhOGNhYSAxMDA2NDQNCj4gLS0t
IGEvc291bmQvc29jL3NvZi9pbnRlbC9oZGEuYw0KPiArKysgYi9zb3VuZC9zb2Mvc29mL2ludGVs
L2hkYS5jDQo+IEBAIC0xMjQ1LDYgKzEyNDUsMjIgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2Fj
cGlfYWRyX2RldmljZQ0KPiAqZmluZF9hY3BpX2Fkcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2
LA0KPiAgCQkJKCh1NjQpKHNkd19kZXZpY2UtPmlkLnNkd192ZXJzaW9uICYgMHhGKSA8PCA0NCkg
fA0KPiAgCQkJKCh1NjQpKHNkd19kZXZpY2UtPmJ1cy0+bGlua19pZCAmIDB4RikgPDwgNDgpOw0K
PiANCj4gKwkvKg0KPiArCSAqIEZpcm13YXJlIG1heSBkZXNjcmliZSBhIHNpbmdsZSBwaHlzaWNh
bCBwYXJ0IHdpdGggbW9yZSB0aGFuIG9uZQ0KPiBfQURSDQo+ICsJICogZW50cnksIGRpZmZlcmlu
ZyBvbmx5IGluIFNEQ0EgY2xhc3MgaWQuIFRob3NlIGVudHJpZXMgYXJlIHRoZSBzYW1lDQo+ICsJ
ICogZGV2aWNlOiB0aGV5IG11c3Qgc2hhcmUgYSBuYW1lIHByZWZpeCwgYW5kIG9ubHkgdGhlIGZp
cnN0IG9mIHRoZW0NCj4gbWF5DQo+ICsJICogY29uc3VtZSBhbiBhbXAgaW5kZXguIE90aGVyd2lz
ZSB0aGUgcGFydCB0aGF0IGFjdHVhbGx5DQo+IGVudW1lcmF0ZXMgaXMNCj4gKwkgKiBuYW1lZCBh
cyB0aG91Z2ggaXQgd2VyZSB0aGUgc2Vjb25kIGFtcGxpZmllciwgYW5kIFVDTSBwcm9maWxlcw0K
PiArCSAqIHdyaXR0ZW4gZm9yIHRoZSBmaXJzdCBvbmUgYWRkcmVzcyBhIGRldmljZSB0aGF0IGlz
IG5vdCB0aGVyZS4NCj4gKwkgKi8NCg0KTm90IHN1cmUgaWYgaXQgaXMgdHJ1ZS4gQUZBSUssIFJl
YWx0ZWsgaGFzIGEgZmV3IGNvZGVjcyB3aXRoIHRoZSBzYW1lDQpwYXJ0IElEIGFuZCBkaWZmZXJl
bnQgY2xhc3MgSUQgYW5kIHRoZXkgYXJlIGRpZmZlcmVudCBjb2RlY3MuDQpJbiBvdGhlciB3b3Jk
cywgSUlVQywgcnQxMzIwIGNsYXNzIDAgYW5kIDEgYXJlIDIgZGlmZmVyZW50IGNvZGVjcy4NCg0K
PiArCWZvciAoaiA9IDA7IGogPCBpbmRleDsgaisrKSB7DQo+ICsJCWlmICgoYWRyX2RldltqXS5h
ZHIgJiB+U0RXX0NMQVNTX0lEX01BU0spID09DQo+ICsJCSAgICAoYWRyX2RldltpbmRleF0uYWRy
ICYgflNEV19DTEFTU19JRF9NQVNLKSkgew0KPiArCQkJYWRyX2RldltpbmRleF0ubmFtZV9wcmVm
aXggPQ0KPiBhZHJfZGV2W2pdLm5hbWVfcHJlZml4Ow0KPiArCQkJZ290byBkb25lX25hbWVfcHJl
Zml4Ow0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICAJaWYgKCFjb2RlY19pbmZvX2xpc3RbaV0uaXNf
YW1wKSB7DQo+ICAJCS8qIEZvciBub24tYW1wIGNvZGVjcywgZ2V0IG5hbWVfcHJlZml4IGZyb20N
Cj4gY29kZWNfaW5mb19saXN0W10gKi8NCj4gIAkJYWRyX2RldltpbmRleF0ubmFtZV9wcmVmaXgg
PSBkZXZtX2thc3ByaW50ZihkZXYsDQo+IEdGUF9LRVJORUwsICIlcyIsIG5hbWVfcHJlZml4KTsN
Cj4gLS0NCj4gMi41MC4xIChBcHBsZSBHaXQtMTU1KQ0KPiANCj4gDQoNCg==
