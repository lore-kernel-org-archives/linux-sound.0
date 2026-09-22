Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB33F5BDE
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085502; cv=fail; b=T0wqp7h4TNWYBr2VTbzo35jEauyldIjDaGHBLMyacQRUXQH5WBR7HJKuevqmx1AleQYZH1yVWj2aoOW3l8nGKHuOVwhEPVTSqFGyvlPqL89heAFTIji614yjZbdco0swBqs80GalJNZH3ilqt6Iw09xYlwOSNeWIh/Q0uhubDzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085502; c=relaxed/simple;
	bh=rpib2mNoRVK/aue2LUpxbrxCQGhQuFUgsOqje8MH0GU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PFV3BNCLapqaXht5cW+ZlFZMY2ytmH5ymFAGp+jxYC1oazMMIk2ArsLqnrceiBFQDrI3TRw4o/BabFl8wO5dPTdS+b+PMPKrgG+B2YydKH/iVPuXKk0KLuB6cUApPbSsjUormpOdF/OmFW+81zMCea63hzj0PomSijynbZOoAOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhEHe5yE; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhEHe5yE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790085500; x=1821621500;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rpib2mNoRVK/aue2LUpxbrxCQGhQuFUgsOqje8MH0GU=;
  b=EhEHe5yEcvLNhzX3oFuVBVgWmMLS9IGz7XXOFCj2wjyBje3Wnnw5zmIy
   GvI78E0edDAXLSWp9HtjgsSygzYOoJuyw3eDhp6ddFPyPVktapBlDh9To
   DG4Ec8hu1JKXhztBLdhF12ganl+i5JA/oz3OE/lTrpB7U6nH9sRtGiTkU
   50l8RPnXqHM0h6Q9AIW04ByuWspVbeyYc0oAm8s6SdWyRI8sNzJ2m6lAF
   9gL/qZx2lpl6OiXCRBqkCD8/0elFfD9UZRqaCFtv7Q4SzVX0lWL2reqZX
   lA66gzy2k7U0QILaCOAPQqPzU60w3LLot7TlsB/rkIRpyA82Da0drwwod
   g==;
X-CSE-ConnectionGUID: ds6tBHKHSk+0do9zyrfSQA==
X-CSE-MsgGUID: rWW/BA0CSN+za/VlpMv5Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93193173"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="93193173"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 06:58:19 -0700
X-CSE-ConnectionGUID: IGvf9N5YRGaD3HrpIRsxbw==
X-CSE-MsgGUID: TG8ZagweSJmNM7jzBNOvZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4140996"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 06:58:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 06:58:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 06:58:18 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 06:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrEEg9z4v2LM52Cg246/S5e38LBSm4zDJFPJ7vMX5PNGr4bAv+pqJz8hLCyuJipBuHyAgyAg0XNNeXiz5xwTJgo+ZNFf3O8A2R2EXxEy0vJAq3ayV24lczAZXNtkBk7ljcTfqXV3Tvo7Wz19/rCkm45EQx7lmg9x1EaO3xenfxDOPd0EVEgoB06dnG85Akxw70tvo/7EYp2oKVnAzH61xOVWHSXD1GbRfT1WGzN1HFZi/aZffXRQUqD9IguXysfwwec/WEf1kQHbZsMFLNPHHyV7J0m0m47gecwJZ9sCkY+9ddAmWCj+mL8bQAkM+UZeoS36kmgAtG+O3Pp1ea7UtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pzZn6DpVb9mnZvLcppp15w/2BiaXiC3zyYiJTVGuNs=;
 b=EYjRRlNyay+594Lrf4RzLBefLvdzJgaJWVQYbIqlRR8VX+Ww+/6ZnBLSUzTVDmyOUmviYzsg6WT+KOf77pjcdAcgQvnWBNyToCi4FXjiAbAsaOfZki8wtzU1RWqgEi/C2JDryP9EdrOkucRJ3wWsniTUtNu+coqg1pvFgf3m0MvLeyvfsalHLrWaTOb0qP/qcpU7ZWLVOjP2q1HL5pncPTJmiASA59BdvIF3PIFGm5f6Nbc7hLvTJ6B7Vofy+FqfBGeY8Dtblt9m6RgXQUv6SkivuhnlKASs1SEAy+x/QXdU7t8MsSio0ENFMaMwMQTEkq7A6cd7sKEK4tGafKDbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by LV2PR11MB9597.namprd11.prod.outlook.com (2603:10b6:408:379::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 13:58:16 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 13:58:15 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>
CC: "tiwai@suse.de" <tiwai@suse.de>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH 5/7] ASoC: Intel: sof-function-topology-lib: add I2S
 support for sof_sdw_get_tplg_files
Thread-Topic: [PATCH 5/7] ASoC: Intel: sof-function-topology-lib: add I2S
 support for sof_sdw_get_tplg_files
Thread-Index: AQHdSnQS3IvyaZKbLE+KRdxST5YkPbbalMgAgAAJxoA=
Date: Tue, 22 Sep 2026 13:58:15 +0000
Message-ID: <SJ2PR11MB8424EC28B029E80E31C33B15FF832@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
 <20260922092316.2296039-6-yung-chuan.liao@linux.intel.com>
 <arKAIIkESvrODYQ3@sirena.co.uk>
In-Reply-To: <arKAIIkESvrODYQ3@sirena.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|LV2PR11MB9597:EE_
x-ms-office365-filtering-correlation-id: e1c4cf62-d2fb-4cf2-d869-08df18b18c92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|18002099003|22082099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info: LfdqinhpSYvTRhjR1phdzDPe48w3XxAY70aMj71RI1mvMbF+dUjhxwF1F7lmQzo0xA3q240Bf7ni7GcToYN/OY/M1fe4HalQ85XSOf3lImzNGy3OO/HZniY8vI5kEUTbYHS4VCZ7UKtqUU/TWKaymN07e9fkQ9hJdxdMcjdK/ED+ih1kH6XC70gkB28Stc6uCRDB0TtdtL0qoprxz8Gl+uwTD2EUKH2drp+Kb+xheux/RVPqTiRI42CP+tdchlerz3bUEK2IWqu7iBIot8cReRm/8E7kep+HgpDNneBzU1MWhKoDW4l7azN0O5RsIunkQnvutl3/4aNHYenlYVvvOJao1WHZyYJbQUmft37MsqGh52Jxr71mJcRLrV11wz877sOhogyoS4H90rY4hO1ELs7BmGgfWlG6gmnWqD8r7r180W5l8xSpOPeMDzEnFsswzU2yA/TDBxzpSzFuHla9jnQkWN4sa6WiBWPBODYh/AeNF7Ra8DXM1ih1EvJaxRKJ+OFiSfAVYY9Zjhj40UtqEiPuRCZpoUai9wcmjiTqkqh+Ew/BuhOrFMMSXvzKP0yyqQhuoCIS/HhgS2IsUIy5Of/zGzqM6Ama5RznuqO2dmyEgk4ffjbrL4zCjm5lwxV+uUMpNrqDtfHLmS0625GF4Sf4XkAUdFZWYsqSDS17/fvqj01wxMFbqC0VQ44VFWnpmkVnhHp8BZ0yf4MYRbMkF4XjviyaRw/8NCzrizk2KuQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R7C07AklDzOM3hmoOHqTiyz2PNUbYZleKiWdPL7TGpKfag3duDnxs8gJ8geL?=
 =?us-ascii?Q?fITc2Mxg+4xw88st+eBK9wnta7/PjciJkPVNdhJBs62ZMtoTdm5ETo7l0+Ge?=
 =?us-ascii?Q?DDCPEQ8yZPcThPNWRkojR78gJG+v7A3F4LQRcry/6OJ/Y14sSIj6HpkZ3nTL?=
 =?us-ascii?Q?FaFJWS8qvv0n6GNVzCmYjubmhw2Rcw9ArjiXxuIt9KJry5If4wTd+T1OfwZr?=
 =?us-ascii?Q?rNbffGtBbREn6z8wp6LQ9septRtlc8CY5YfTrv/CuqUI+wJrePpqylccqjrZ?=
 =?us-ascii?Q?RdlgSNyH1Wu6046S/58hpd8RXx9ZnmzVhZbn17yTjQSMKUILxBCIiZe/fl+d?=
 =?us-ascii?Q?9JKTpCjJszfPs6RLYaDXw9duyBf9H9iRo70+dHC/9E9JyFzNbBDElPpeJVvg?=
 =?us-ascii?Q?mR/nVVxPBrNeKrJxmpO66ya+RXM9xXCQbFIFpKRltIaZ9GGXHkb5vj306OLf?=
 =?us-ascii?Q?cT6N6diqRZ3wJdiT4z0j/TIskyzjP7fJqRvGTa7xvygspvJD15aOSyr/10wC?=
 =?us-ascii?Q?ssuPW4d3gK9H9NSU0/FUtIGZBipRfNfzNnSChr5V1p80QBEDb/B+6eas2L+h?=
 =?us-ascii?Q?9bUaHKvJo7JUmcQxEEQdWc1v1NYnBK76yXbFOukCEgw400xnkUKE7YBUdA9w?=
 =?us-ascii?Q?Qp+yBMJaNJzunhtO5hn8UyLlW7Yh7HtME1cVsORzjUARNa393IcckxwqnYpx?=
 =?us-ascii?Q?+uHyY7Fq8a/+eqhRhVd8vF5FYyFdRAJJeXEjTS58TcFk3rNLbh80X5QDjkA7?=
 =?us-ascii?Q?Qn1i6bfx890+CaWLTEN2HhctYEimMTrk/Yqqi8YL4Bo+TthIypAhETBMMcPM?=
 =?us-ascii?Q?0jITAD+4GtJR0wwRiAN9LglPN7e4rYCJxLnUmYPksWZx/KMtiP74hZgJkKPa?=
 =?us-ascii?Q?GZUBPYxYZJ9FpLrusf54Aqgc8HOsTXp9B/a/hb/hkCa79f2exW3Ea2wbfY29?=
 =?us-ascii?Q?URSYdV/MsaRLM7RNB4cHIpzKvxNDRXIeS6VgHkSm5Q3Cfv3c49BVdKkyb3PU?=
 =?us-ascii?Q?6clL99pleMiyk4+Hy4KR+Qz8ipiBekCRESRCORIRzGpe2rG61JyBM7GN5quS?=
 =?us-ascii?Q?iMTs2QVdxdcDE5J5scjwsAexbFAPdggNxOPdsQZRIjDUFsroZiQqeToyzQGU?=
 =?us-ascii?Q?IZ2LScVyFQcGmEH9SAAnSE/ksQc90QT3LGcAXAQ3+dxezQft5x2IapzOWgU7?=
 =?us-ascii?Q?/+tRLDWDzx2Z8lKLUf9fzN+8sSzoeKwpdqJpptgdnyyqcXl/kSeB2+Fcw7Ek?=
 =?us-ascii?Q?OsbDRqg9qK1nzFtZ0mej3s1nZhXD1Dd8lPb38C+ZYSMNL7oqaEjd9J2WHFvp?=
 =?us-ascii?Q?fPyvUSgDXQ20El2JVT+hwUmbSnEQA9cRfanPOSbEc9t3+2+ljEW43es8SFJF?=
 =?us-ascii?Q?CeF6MJdAjYbHMbqY5Sfq+VDB7Q9FJYMBietv+tlqLJVMG62B11HH3lVQ0/iW?=
 =?us-ascii?Q?KEYTOBoAt7PdcKUPgHKcBAtc6R4glPg1Vo9sCcAThC+JjGam13On5pHFZtXR?=
 =?us-ascii?Q?1/cCTD4A7oYnyFbs5RPXAVJnFdDF1esQg01OUQe7PjR3AU69JTMeJ0s0AOI2?=
 =?us-ascii?Q?2jI1XqxgP302ok3EIJtNrHLkp8Yw9BxR0E0DQycZMTDd7ypX13bJn5zVRyVD?=
 =?us-ascii?Q?wFpMxzllsfZah7Ng0uNu7kfHEp5OgsWLNBE5+chRqBOVYhs3etT0pP3nboON?=
 =?us-ascii?Q?gwMllg+Kk2AcOxnTfZPJ+CwQ+VwSXIgGhm/cQUQGFI9LLa6z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WysjlkGzRCJ9pVxDCuW2SZFtt2vQIvgrAJoGuErBd9VEOum/+E3k26aY9ckIfzoUcErcjiH+BjMzpfVhkS1xch/J0fnpxITUyheguwuU8caLuuoJNFrxGWD1nT77Rsbz3TyLvQ7x/LQbyRcimgYCUjduTMyvR0ifz4D6BS2UzD+wliRBPPtHp87na3SjyXZ1DLdURcG6H55gmN5cuAkYA4nqgdyX7L0LZS9Z5HJGtZnTchrGy0VcvSLLHPpWDXLbKUTIJi4nrSKUq6kC3+pFM01CoLUwqNvhG+rDwRla2XetifzMvf/pD/FScGC6LW9xWnNf1bD7dyK3H4ExwbUnIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c4cf62-d2fb-4cf2-d869-08df18b18c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 13:58:15.5981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNpZuGyTxf7pkTs91HbYZc7X71XN51Xp/2mynVDtBG6+020I4syrlZoNMilqII0uRUnafRqpnuPnj2iShxreTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9597
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, September 22, 2026 9:18 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: tiwai@suse.de; linux-sound@vger.kernel.org; Liao, Bard
> <bard.liao@intel.com>; peter.ujfalusi@linux.intel.com
> Subject: Re: [PATCH 5/7] ASoC: Intel: sof-function-topology-lib: add I2S =
support
> for sof_sdw_get_tplg_files
>=20
> On Tue, Sep 22, 2026 at 05:23:14PM +0800, Bard Liao wrote:
>=20
> > The Intel SOF SDW machine drive also supports I2S interface. Add relate=
d
> > supports for the sof_sdw_get_tplg_files() callback.
>=20
> > +static int get_ssp_tplg_dev(struct device *dev, struct snd_soc_dai_lin=
k
> *dai_link,
> > +			    u16 *hdmi_in_mask, int *tplg_dev, char
> **tplg_dev_name)
> > +{
> > +	unsigned int ssp_port;
> > +
> > +	if (sscanf(dai_link->name, "SSP%d", &ssp_port) !=3D 1) {
>=20
> Should be %u for unsigned, or a regular int for %d.

Will change to %u

>=20
> > +	if (strstr(dai_link->name, "Codec")) {
> > +		/*
> > +		 * Assume DAI link 0 is jack which is true in all existing
> > +		 * machine drivers
>=20
> How about sof_ssp_amp.c?

The DAI link 0 of sof_ssp_amp.c is HDMI and the amp DAI link id is 2.

>=20
> > +	} else if (strstr(dai_link->name, "HDMI")) {
> > +		*hdmi_in_mask |=3D BIT(ssp_port);
> > +		/* The number of HDMI in dai link is always 2 right now */
> > +		if (hweight16(*hdmi_in_mask) !=3D 2)
> > +			return -EINVAL;
> > +
> > +		*tplg_dev =3D TPLG_DEVICE_SSP_HDMI_IN;
> > +		*tplg_dev_name =3D devm_kasprintf(dev, GFP_KERNEL,
> > +						"ssp%x-hdmiin",
> *hdmi_in_mask);
>=20
> Not %d?

hdmi_in_mask is a mask that's why I use %x
