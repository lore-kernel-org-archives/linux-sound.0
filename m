Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA98F1F03DE
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 02:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783476193; cv=fail; b=XbE98fFmVl9esPafdtHtJwboTHvboa+O96UeEfLCQX40WlJ7MMuafPYNRWTXOk8N5fDDjZzuBlXfMTaawsHpDdms7ME5+qZtcWsc25DLjUkNMLct5MPw3xXv8AuFGAa+sjUCkvUvVt8x5ilpWVuMZwrhpvY7gv5Lxc0xwIU+ZfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783476193; c=relaxed/simple;
	bh=3jIGWa4wR1mcSMeLvKBHV2pk2IH6YBDszBIRHjoUPcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RkehLP//Cmk9ya66UDqQOApKBL2HUKBgzgeA265MF3Yl6A3Qp2+YNojbkuhkdwxfLADsrZVMF1e4h+4SIh7G3+YG3QdhzhgEZ28FCol556vJMdtG6dNKSkNQkfmxT0aIZYx+k/m/R3g1ixkzJTSlBG/koLmfqcGn7ZPPyXGjJ7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGPIZQSe; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGPIZQSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783476192; x=1815012192;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3jIGWa4wR1mcSMeLvKBHV2pk2IH6YBDszBIRHjoUPcA=;
  b=mGPIZQSeCu8UpM0Dc03f/boaWeGtXhsc7La1/EKyzzg9FWFATFruYVLX
   wL25oD9KDAz3WuwvRCtBcSR2eqGW+AXWobOXDTj4sU91bWA5CY9nC9waE
   17DFsIDpR9yafP1Kxxmn5hxWTmQINeAmz5F7NKk0bb8sGkq2HxJ3khI2L
   lUfksbDG9si6xNYzRUwCD2gw/3vjX6vFhXuH7G/XbS9PG0EaZWjQplUBn
   aNiRt2G2hZr0EhC/bjdvLQeDw03Rxh3R0pEyQLEbSRgmBrzi3jj7a4J1s
   PjeKaaki7VuzrDDoIVyNeKcgBlkOIWA1iFF33OxL8YbFllnC2ijDt6hDo
   w==;
X-CSE-ConnectionGUID: v7e5ZTDoRi6vQrONlBXl9A==
X-CSE-MsgGUID: b0JzIrw1TOuZ1/vcayjk/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84228520"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84228520"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 19:03:12 -0700
X-CSE-ConnectionGUID: gl+Fmuo2Squ12Utcpid/jA==
X-CSE-MsgGUID: DALa70uvT+OCEFBwyqgOjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="247773329"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 19:03:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 19:03:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 19:03:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 19:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX3FR/IrKVtna4m1fEpl/r36SxLZA4hcTkm8hOyjPiiZIGZVqCUFkYCyQF+WQnaHOmbRlpkHXe9S4xpyG6XZzC6kOqGZEOiVWsCzAOvmzbeo8jMqbLM5j3th2LFWTqZNkKdv41wUIR7kfGNjTfBKjBZSbLyW4wYmcOBbxj7CUPhNroZXX4sBqWFZfFSOls9dbK0XXySOZQ3HU6EytpWkLa6FuLi1cZAb6N1SBlAfv7aXhe0nRxslCpnneLtS84GgS4Z8rG5Re1wFwYBb4dhLuxfv24zNEAWsVQu8nbHcGoaX8FXDHgUnMUEDpU4yqkpo1CrthMbChdLr8nI3ynhTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yy2DAScpsS5gwydJPZaeYFey8fLcJiBTBCKB5K4MOeI=;
 b=KkXDZvtK0ihCTSNtMQ0sOzPj5A4lXdmT3eOTFosMGC1OWMsRl1i8z7G9AlFjzcBdC8stcb2hWLqMqg2P0CtezQwVTal5D9AkptHY5Mg6mkJX1mk00dwiWIo2ESjWTrrVYjR4IQ/BzUdDeeHwvmblywFEoxxP4hz4C9/XM6SJyFKpgU31YBug4kaiHYbwXXS2sBGCTicsr/iSkR2YRtKcmdJc/WLnivde9wEWneLw2uLmjEv2VBXW0xKZNseIbFI8B4jYsTL+WMQM0UQua+0j0/IuPa/Ks6ZZluhf9qzePFXLZ13iS7FW8JxVuY1ITvKo5nBdbhRX43AQ7PqxSrrPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SAVPR11MB9574.namprd11.prod.outlook.com (2603:10b6:806:4e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Wed, 8 Jul
 2026 02:03:02 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 02:03:02 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>
CC: "tiwai@suse.de" <tiwai@suse.de>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH 2/2] ASoC: SOF: Intel: Disable SPIB in both direction
Thread-Topic: [PATCH 2/2] ASoC: SOF: Intel: Disable SPIB in both direction
Thread-Index: AQHdDhNWo3MZdFmJpk+nrAcpAFtuxLZitVoAgAAp64A=
Date: Wed, 8 Jul 2026 02:03:01 +0000
Message-ID: <SJ2PR11MB842470BD31B9F63DFDF43C9AFFFF2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260707131945.3641663-1-yung-chuan.liao@linux.intel.com>
 <20260707131945.3641663-3-yung-chuan.liao@linux.intel.com>
 <a8bace18-e805-4102-a744-0d3be38290e7@sirena.org.uk>
In-Reply-To: <a8bace18-e805-4102-a744-0d3be38290e7@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SAVPR11MB9574:EE_
x-ms-office365-filtering-correlation-id: b59bb73a-c8a1-463b-4189-08dedc950aa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|4143699003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: eLcLxr14A/aDn05VU9ub7rCY6GC9vo9KFdY7/Yp1XNH5mJ/W0UO5DxYgLWY/sCauJhLsuI0B80AtT3j1M/fTU9z7MZn/2b6W6plX3sTx+Mv2+oYOtVYvvrGmGcSoiUCm9kAFfKeaK0SeGPvTwB2rIhA9vbg0dqK1iS+scarCkMnlnC4aNppwzDMOoirHxUDczy4fS/H2zXOfylZh8ShaX5B5L+UbDkbVbL7dG5t/Fa+G4LpYkv3dM9Nmf9CT2V7MPIKI+b7O1cqee3dZTSgEph7lYMKTmyZ4xe7s5lGwT36gDGrjgDlk7RDQa/SoqNr6O3yrzO68gDKrVMcjzkuG0uou+stKP3e6oKnOyDOXufUh+6ptdKuRq1rWCjMWmDjvM4tIO/g3GqSSBqQKaDjZYKmPTUiiIsCwnOznYgnVIo/idKJGPA2UWOS1dYXjHlSMXBvfeFYMH+gG1OtLLnGP3C2Q5WSPRB9fcRh+FIaYPlKcwLlES/L67Mcc9lS7X6kOARLMYDb6d7pxU8HjKOAOjEOdtvSAfhRqijzIvZCUNc7LGqW66dgRVripJai36V9tLukG6rCdLEVzzQ+c5huKWT2oVin/TAZSriXi8H4EIqrZBXsMNZJBdPKRxF9VsPVyDjfH9rJUKiUnBb4k3mFH7O3x/QXCaFAoI1DzzqVGOg8vL054FR8FrkFU09wyfnZrJtOPQ9r4qD7a7ZcAnScEMvGmmDxkN+p0yZ9bv8Twe3A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(4143699003)(18002099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eGNX9oaAKG4pTk+sBFwFPLZ9T/Ul0kv/S9UOXqWc+eBHc3HYDUYPxVohhXnN?=
 =?us-ascii?Q?PxSX80tMhKWfq6QMy5M54McQsf9b1aCJsM3JaNsJSTc0U4BYUd1y3iPsApK5?=
 =?us-ascii?Q?EMp+5AiDAL2sbTCEwTVW8orW0mgIpbikoHyPLiH3PZfzoz06fv58RtRPog8y?=
 =?us-ascii?Q?C88LwV5WFBLu5molsdHeEjrACTzKBxg/cNH/dOjrF1VzHTn3q3J7UrJ+Vong?=
 =?us-ascii?Q?OigPdBDN7xCHF/GRAPW3pdQo2UqJrjAbNu02SXLEXIGsd+YsWee/M04tbMs5?=
 =?us-ascii?Q?XN3OLQChUOfkp22klz4vIg2Lc70q/ieMJg9riTBEG2nqU56cS0YEPjWR5PYb?=
 =?us-ascii?Q?Xw3blncTKcgUJGSM3thPLqH0H1BBYyQCWIvGxVQUviCMSn+s72CmEckm5eKm?=
 =?us-ascii?Q?0ipMimm9QHG4wl0Fhjai8xcitzV2smetWCnnUbigOQ9suOAgBDHdZ9HNFJDE?=
 =?us-ascii?Q?lOjB/NrnD/qDTsnYnpXgg4tanSgirHknkMYWJixR9iDRE8pnbjx+l/a6Lr0E?=
 =?us-ascii?Q?X0AD0eq3AVBibxQh6rLQby6sk94aWqWt0gMdTqG5xzn5he8Nin08d0jmxIuL?=
 =?us-ascii?Q?58b/rcP36Vs8XfCmUNTUYUNixaqmKQ7DUtma+ccBTlmPn1BQSfDdc/MGmZNR?=
 =?us-ascii?Q?sKNgiQ98RhAJb+a5JQxtCzkKb1jXEXBumWl2W6s9aeXt7i35lB05koroUazm?=
 =?us-ascii?Q?rWibgMbexMzb5+vwQ4kbiSqmPlFTE0WmK1+3pBnrK0IUKbVQs43BBrK8yJgK?=
 =?us-ascii?Q?nxi3J3qGPfopB2ILj1PEyBxB0hDFOg+SSFJsOHGynVy5YQp9UGPr8boEs69k?=
 =?us-ascii?Q?CzI+KnQQeWjhoCVcB7BzH1VDn/IzdqXjO4s9PGMuKOE5rqpodZooV7DJ8c1G?=
 =?us-ascii?Q?FHboiMfkEHb4NfaxFDmEtrNr/k0O2h/Prz4zK7Bz+L9t3eKIpLFcg2yEzr/M?=
 =?us-ascii?Q?0eT1whh6uLT3xoioBNi9SI9Bt38XI+rUP2bxW5gp07OfEym3yxodxpTQClGA?=
 =?us-ascii?Q?mC+RcJ+L7swQ0E7RGYP+206C9Tg+TzpAjr5ZD0xVub8pvhc5aWp39i70JsDB?=
 =?us-ascii?Q?8JZ958/ttTE+J5IvK3yjHiX4HB3ELJLCMkf2qrK3ObPHejMUlLFiXjmp3qBE?=
 =?us-ascii?Q?mUAQ10hQLaJ2VsRvNNCt3vnEMgGnPvwlceteI1G0pwL1olgq0ITLF6TvLYlQ?=
 =?us-ascii?Q?H3q0ENC6bLsUW0PvYgVZgy3SSDCWNoekmdNgHT40Di7xTYcYoJVJ7kiL763z?=
 =?us-ascii?Q?nN/otXSyeY6IcaZ8IdlyWZJLJxNDUc+jrOoCbdML4aalDxp12t8Csi4M4vKk?=
 =?us-ascii?Q?9WdHLJjcQsyKdN07zUcQffXyqAhuxYXsb4oxzlh+5ijmZ5LsidhgNWrgimay?=
 =?us-ascii?Q?DSMcbC+l8Y/XUNzBkk0quKeSA5KaVODKywn6gXVDvp8ptusijKm1XsB1RcPz?=
 =?us-ascii?Q?FQwLOG4Kg7HIv/ZBwyVfly/nrjweUAs1GctVcHDgmwgUbV1l/vX1iOGfqxZ4?=
 =?us-ascii?Q?dfLqtxnCEQ0wQvBEakaCW4R9bbE5BNnaWp2QoSp5OiGFwy+ba5AuFbGAjX7T?=
 =?us-ascii?Q?Bxr2NCiK427bJbj2FwOL+XQPCLuPL1DJcdjKERE81E3Kxu/6xnpcG311GV5p?=
 =?us-ascii?Q?ob+qS27ftXmDxPRL+O99UPSY7c99aGjMM9LIgttWwUn8NutGFQfEu0Rrg0Pv?=
 =?us-ascii?Q?QKOMFMqCbegBLSn6b0luyOfuhVFarHIgwh227MDrMC6OSO7lmQtpQPBzjvd7?=
 =?us-ascii?Q?lPGvDisVHw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oNefvAZoOVpnhtliF/3z8z6WkS1B4MxNQ8CIQ0ljd4lbaXnw+9zidE0uqqNZMhZelebnktoMn1lVq3emT9JULaiL3b2ex6C50OwjoeB74LTRWnS9cYu44G24L57RQ5IZin4g5Pgkfeq54CHqc32WOgIYSlqUZxUKLms8SKIj+z3mVOjJVgwDHTDI13yReHGVm7fhQReuIz30DG5Ed1y2fSBMqPRpgb2ZWT+JbnJdIGPXMH1/AeQQpOphP1ntsn9ECGIsPvaDJQ/b8KpvkV43vt/JspUTJxWqJvVjg4KZr03aMFaW9WRgX/WImjcqPSLmEzUihGTVekLpjxY0benqWw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59bb73a-c8a1-463b-4189-08dedc950aa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 02:03:01.9455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8CxwUaZcKDrxKFt9e0ez/V7sL8e/eEGDeLuMdNRjMd5FbPFpoiBiK2RSVifHC/5QVb5mfTd4FwL461Ykh6iuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9574
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Wednesday, July 8, 2026 7:32 AM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: tiwai@suse.de; linux-sound@vger.kernel.org; Liao, Bard
> <bard.liao@intel.com>; peter.ujfalusi@linux.intel.com
> Subject: Re: [PATCH 2/2] ASoC: SOF: Intel: Disable SPIB in both direction
>=20
> On Tue, Jul 07, 2026 at 09:19:45PM +0800, Bard Liao wrote:
> > SPIB was enabled in hda_data_stream_prepare() if is_iccmax =3D false.
> > We should disable it in hda_data_stream_cleanup().
>=20
> > -	if (hstream->direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> > -		ret =3D hda_dsp_stream_spib_config(sdev, hext_stream,
> HDA_DSP_SPIB_DISABLE, 0);
> > -	else
> > +	ret =3D hda_dsp_stream_spib_config(sdev, hext_stream,
> HDA_DSP_SPIB_DISABLE, 0);
> > +
> > +	if (hstream->direction =3D=3D SNDRV_PCM_STREAM_CAPTURE)
>=20
> This doesn't check if is_icccmax is true but upgrades any error from the
> teardown to be propagated to the caller - should we either pay less
> attention to the error or have a check to see if the cleanup is needed?

Thanks Mark for the review. I will fix it in v2.
