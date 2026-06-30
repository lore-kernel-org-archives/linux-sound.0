Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E73F075E;
	Tue, 30 Jun 2026 10:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815714; cv=fail; b=ce5bR8uLsuUDEb/B5V+/z6yBaiyOx7/7xskrPLp+Ve9HznhtdsM8Qn+G1q0iMdWrtoheZmrbXZRt/A6VENwbXQhOnpUu4kOVUWSwe8yiJM6+wiIO6YprnlDh5xFfDYqmtsFuzRq4WcOT8jYrwwhLfIBoA5giUs0KWPWysob5rLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815714; c=relaxed/simple;
	bh=DVxudmRuD7EW85EzAweNn4ShRmpbERNDEBRyEohRptU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QxzW58T2exoShRNdzvmi5oHyRG5oM8IRpAZAfuIEUT2q/dLBxV6GcrAN/nSKjXv6TZDqX/8/Mj0l0tiO2nYawRhvoAMZcwg7oKaOM43mVz9xjiAk6SwHYqcdAcAG4oUyT9SuvQjiceKmeIwrM9w5QE66lKJd4r5MiKIZCk3LbVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0wySSDe; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0wySSDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782815713; x=1814351713;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DVxudmRuD7EW85EzAweNn4ShRmpbERNDEBRyEohRptU=;
  b=m0wySSDeW2p3ftzIZKlIUyeA+QsvSmsoxMOp0pemC3CAEPkGYpdHdU2k
   DsMucbSZCb2TtrriByjcoi6fsXsq1v/uEn/PJe65g0FEkd6aeuJ81ajaV
   jAO4ien1GIUAezQqHkgqQQl6eU7/OlWEGLC6nqi9PVXhZ4GW0fqwd90aX
   DPe5HLWcbwwZfkyskZWLzLyuoe28+bsQrxQ5eemLtQKv/+FBgDdp36cJH
   H8VikSKjxnFCUVvefd6xLWt67YOTdHcZjTBOXKHx9Yw2gFshxDB29cS+R
   S3BrA1NA3t2dz1A7cpGn3ti+m6NuD+Euzzp+imwEAH/dxhqgo/aGj5Rfy
   A==;
X-CSE-ConnectionGUID: gIgvkgohTCOn3lMFUmhOhA==
X-CSE-MsgGUID: mzkhqJF/Ts2luU9pKnVQ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82638532"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="82638532"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:35:12 -0700
X-CSE-ConnectionGUID: m1YnPKnjTASQcq/YJVlFGg==
X-CSE-MsgGUID: v1BnNJInSwinPBj3oXdXTA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:35:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 03:35:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 03:35:11 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 03:35:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NL+cqwhqwUzajeLdvFmwlB/PqdZtjWBk9hC2JtpifXdBOOvG3lqQ3qa8q1/PiwW/6m/SO7hArTCTX+FZi+UVT+VtmcjJ4knxZb3xrD7YsnJCCZlfgjmLCxKvMGqpSwK/Ry36LVQGwdnOXGoj0Qk6PC65mZQPRcEo12OKkA7GyfCKdkdlMiW0HCQEUZ2jKzNMyUrp1kCvoCkUJQRZSi8yKPYPPCR5tJDWRe3ptp1/IAS75oDehZ6u3oBsOKVYvvyJftEM5b9sPLN2O/fEZkKIAnBFOusEvK8JqRbQ/TkLdYTormuFG8HazsWMbZxiECCU5Hc/znQk1FVIjKD0ykJXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaRbJuL+nbxUZQDqvKWd1+Pi48vWFK4medz8IlLUs08=;
 b=eBdJ5HCAnEXNMCcXulyVRtac5iD+yd2FbxYf28/EHoha+EY/UIAhvhz5bCMjP4ZUx0kJFfX7EFzvhdjOeN4xwIYgLkGBKvfI+jbytwMO19u4wuCq38TkaB+Ds16/aHfw3LjA3Acln4X1SKbKxQoF5nFfs397lq1/GZX1Eti/yBX9aOdoN4i0JH2h5gUJY1tCAYeLU9PNPlpwSSd8PLIkcfJGqbIq8MNOqg5N8rdrQjpdkbrOgKyanCUx+GZaBHbB6stRIWk9d9W+IQKKmXgDeBLDJN4Jrqm9/VXMD46psLO8AMoJtFISQUzI1CmSVHdTrvFZ0+HFJ+W0cL3cWAW+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SN7PR11MB6799.namprd11.prod.outlook.com (2603:10b6:806:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:35:08 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:35:08 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>, "Richard
 Fitzgerald" <Richard.Fitzgerald@cirrus.com>
Subject: RE: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
Thread-Topic: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
Thread-Index: AQHdB9XrKSoHXknUiE2vwPpqgRAaB7ZW10YAgAAOA7A=
Date: Tue, 30 Jun 2026 10:35:07 +0000
Message-ID: <SJ2PR11MB842410EE22537B0673173EECFFF72@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
 <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
In-Reply-To: <11f8d158-9ddc-46fc-9cd5-11a696d3413f@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SN7PR11MB6799:EE_
x-ms-office365-filtering-correlation-id: 04cd82d8-81ac-4f12-a807-08ded6934171
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: 89pDzKeaYFavEALmU1t6OjnGCHEp75OYOVGPBa9/Zq2hmVKi2UCzv7/QG/fFoEdnYXFbSeemWR9cZ6mXC3FJU6NANkL4C40crQ/6IG/2f4SbeaCk28pVdpTW1aRxpXVU+tp1EjF0H0OKXcc7qc1cq7Afi/CQZbk2p5HhxONFJBAA1cIynKnSSasPyuSs+VVCsTzoC63mcy/dpc/RKdIRsU8fqUKv0N7qoDWmP2b0x1rxZ6in1JTQE6UTSUPygVzYFXxnBs1FeIpfxjgIjKAW0MFV3IcRGPXDXyLGSMjR0iw6w9oX7L0tWosFXfGBeQeS+cvuuVJXjXDWw9aMKRfqbvM2CgMN+be2CbbTxZ2kPzOnzXshfFpYyWAYLXe/eDC27AzV+8h63EHgaXiNsuiztJnwZP7IrNgcNdpvgBNGi1MpPn0aH33IqyDrSfDECCaTZTYNoGCQ9U9S1B1KeeWtFma/Isxhx5Z2SfSIqZ6ucL/hU3A6uIKvA3PWZBoRSNvGy2gIyxRFKabR/rKmsBwB2ceOrFYudUoLLl97OEIkxNA70K0kuS5nbJbk0ln9pHIVSvmkWlfIkhPVqfwkUhhpxkgtEc3OP3nit0qU68uWEPn5E9XsVrBtv0O47IhR9MnMNUFN0opLtZJzT8AQUEAm6w5c6lsek2Pm1ikx8mG3GwFSFk+pSrZ9la8mEqjEuP6eOlJpMhAVPRcwKHz2k5ZvhOoLoZCHWIuOE5OA/4cLpxw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qMKNpxjOsWmzH+SupvAulZmF+v71MjIB8+6gXw674sIU1O2kIhrNWB+lm4?=
 =?iso-8859-1?Q?GfxOaARu5mK2CBUibaR6XxTt3fF7Chu9a++gA7Xzf1CtnupD+cwiMif1tQ?=
 =?iso-8859-1?Q?MclVpSgcqSDV6aePdKNOVW3gyiCRuGEJpmVutqmXLmIij76MmpAFb9iV9D?=
 =?iso-8859-1?Q?UHWqKrG44s3WLa+nI5AegDI4N2BZopRNrOK+v7NorV+i0foDbpzcnwoLZ/?=
 =?iso-8859-1?Q?lHXr+680iMNJNwSwVMjFtwg3Lsna3StoKc1eK9ckixVUC89Drty6knlVW1?=
 =?iso-8859-1?Q?t9y5vWqcYaVImXOg+6IuI6GlIBhDpDI/ADanfsjkjpdJ3h91DaOXrA/COo?=
 =?iso-8859-1?Q?3pE5K9i1F1mT/0tAbkKjpP00YNxMSDDqYUoeIWd9h805fm/JAI1SV/w0rw?=
 =?iso-8859-1?Q?dh4a6D8wzkvLJBGc4yOlwvpEYRxMukpoG0Fe/9Qux+HjlDoe/eM2ZPBZl6?=
 =?iso-8859-1?Q?UcYth5PlEwrLgZHRN1lbEkWqj09EeXWTYCCHMgkWYwKb6Y03bc17GNCWLG?=
 =?iso-8859-1?Q?aMLu04QxImKUPA2pjH5mhfy7tExhaqckiWw9PjQgReNdskMlYvZ7I5TGLC?=
 =?iso-8859-1?Q?aJFMuuUi4zQlGfgukGphD6vRz0aa738nY30KjWVYtOB7X10hIFJx42sBQZ?=
 =?iso-8859-1?Q?OCyy2W6PayNv8unxAN+4w83U/IUtMIX9ane/XZgRgL7ADuXUloxTWzUKMO?=
 =?iso-8859-1?Q?nrzexrOMnN/nZzGO/fjiibwqGWWYliRjrR0DWGEMwiriVwZFnq2s5Fn4Ea?=
 =?iso-8859-1?Q?vYdfM7UtFghiVoeKxmvw/yxmJe5/Tejypds3LBYR3CgMbu3/NjPJrEHPeP?=
 =?iso-8859-1?Q?ekY3F0TmVExVvBAKgLoXjL9Uyoig96EfWGidAeexi613vuaIaFk6EEYuVR?=
 =?iso-8859-1?Q?sR0kO4SVeY4sXeFIW/02fGKJmw3rOg9LhxLQrujw0ZK+DezSdSnXWHC4C5?=
 =?iso-8859-1?Q?5vJE4ix44e7rxUm8OD5jaYbGYJVb+RJCJCG9dqaCn5Dyb1XkrDM+EPMoG2?=
 =?iso-8859-1?Q?/IDV24Z85tYZ2JOZjCXxQvITO0k3fXIElJWOSIxxHG0wlE9bWK/2dUuVW+?=
 =?iso-8859-1?Q?Iq+qVWwOX+TAyGyX32gGiDD2SAOvIg3ArvMltqchUSlotFAdXAgTfdv3A0?=
 =?iso-8859-1?Q?gegv2mqF1chH5L4GdDamcJc2RISPUKvnTHLzCub1HzzklBz4jKDjgBUnBk?=
 =?iso-8859-1?Q?RzcfR3GSx2kMiTLeGcyTIvyi5VQ7+7mNOnH1Wk/nipKk2rUpLv401k02k4?=
 =?iso-8859-1?Q?7E3vm+PYfM6dnm2bBfmtoGHgcMYaQW37YlXbyI3/TRnU0TyB+zKuXML2Mz?=
 =?iso-8859-1?Q?vppEvlbjRdCXjgtdymmxcIPLXm1F7GKIf3eD2pGFgV4v2+YpR2hNKzW3/H?=
 =?iso-8859-1?Q?b55br110HWKppROpYCAwuKYLYO/ALD68Ecw7u/zhlLI5nDtF0frmwe0YMn?=
 =?iso-8859-1?Q?b+6aVEf56ugBLS6n2DvXY2ow5Z/tj01QPfZtJtY0JwRXI7JXNF81w/0+eR?=
 =?iso-8859-1?Q?U5vsdWsiUV/mWe+VwMjRUh+7tP4sOivhJEe4McvBKmA7limxfanU8O2cwz?=
 =?iso-8859-1?Q?71afsdLpJaJC6GL7jkWfK+eA27fYneEbyjZ2hN33LpquBSc9YRWL9TlKSB?=
 =?iso-8859-1?Q?ou2hf/7fdlS7i/VX2Yggd7BfcGIDHqsBgJhM7DEKNR4f8a+9r6pfQaTYGa?=
 =?iso-8859-1?Q?xC6KkVOygvWwS2NYhIzimRClcX8VkFp3kb8wIFcGN3hn35jvjzYxwHApnk?=
 =?iso-8859-1?Q?abiarPIWrn/MrIXYaE0aYL13SXYJmmzuH61iwfPjcsFeUI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XeUWQCg4DaGm1Y0LctSMP2u3MFrb17ch25iG3I4Gtv4gJxZGE1l/DjsY/J7NWhh7WQf32k3xCZm+rRjQvSJGT4tAUWX4mBPs3NnzB4U1aIJv38K3auqaJPGi1IAP63s4fCaK9zWbmo1p4rbo6QoC3fHFkvJwiZFB2qoNuouE3+HX/pPttqDNAIISVG+beHpXglPDD4O0HF+D1rqUBzpoF1L7ARp4B0o6hjVioz4ZTDUCk6mKz1oNG8G0aGlhNOcTZNHpwYbExLyCBeHCp2YkU+l+1sAbuhaGt+kmuKBWbMLa6BlcMvC+53xcoOu+bMFZsBti0DTOeOtSv1dh2rQGlg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cd82d8-81ac-4f12-a807-08ded6934171
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 10:35:07.9199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwQ4+qyogEzQmJDFC7yAZN1cKb54Eqy6wZuqKPbjLgi8HOesr03NoMsUjsBo+xaXPw656xrgMO7hoN0d7ERwNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6799
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Sent: Tuesday, June 30, 2026 5:33 PM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>; linux-
> sound@vger.kernel.org; vkoul@kernel.org
> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org;
> peter.ujfalusi@linux.intel.com; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspe=
nd
>=20
> On 6/29/26 16:44, Bard Liao wrote:
> > There is no need to keep the SoundWire clock active in system suspend.
> >
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Reviewed-by: P=E9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> > ---
> >  drivers/soundwire/intel_auxdevice.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soundwire/intel_auxdevice.c
> b/drivers/soundwire/intel_auxdevice.c
> > index 0b8107bec9ab..10fd27f4fe39 100644
> > --- a/drivers/soundwire/intel_auxdevice.c
> > +++ b/drivers/soundwire/intel_auxdevice.c
> > @@ -669,7 +669,8 @@ static int __maybe_unused intel_suspend(struct
> device *dev)
> >  		return 0;
> >  	}
> >
> > -	ret =3D sdw_intel_stop_bus(sdw, false);
> > +	/* No need to keep the SoundWire clock active in system suspend */
> > +	ret =3D sdw_intel_stop_bus(sdw, true);
>=20
> erm, are you sure about this change?
>=20
> What this does is stop the SoundWire clock before entering system suspend=
.
> Is this needed? The whole point of system suspend is that the host will s=
top
> operating completely.

Yes, that's what we need. The purpose is to inform the Peripheral to go
into the deserved clock stop mode before system suspend.

> There is in theory no need to stop the clock because the clock restart ca=
pability
> will not be used.
> Think for example of jack detection, it's supported in pm_runtime suspend
> with the SoundWire interrupt capability, but not in system suspend.

An example that we need clock stop1 in system suspend is to keep the amp's
firmware in system suspend. In other words, we don't want to reload the
firmware after system resume

> By changing the clock-stop argument to true, you are requesting the clock
> stop mechanism to be enabled even though you don't need it.
>=20
> I do recall that in some generations it was actually not supported to tur=
n off
> power to the IP while the wake detector was enabled.
>=20
> >  	if (ret < 0) {
> >  		dev_err(dev, "%s: cannot stop bus: %d\n", __func__, ret);
> >  		return ret;

