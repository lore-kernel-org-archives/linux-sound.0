Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CC51F1534;
	Wed,  5 Aug 2026 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892387; cv=fail; b=VuNoI5sJyMsMIhvLTKMQhrmbHJtbvJeZaFYhic4ztjVi49vw6Kuy4KpNsE+St2AZ2RAiNSsHCBkCdGQW+sthjzXY4Cijz0D3zktFqgPXTYzaNjNn3LI4bpZfz9/RXlmtiRfwUgDbZmJ9DEvbPTDScSke6mWj/PF6JN4BJ3EMS+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892387; c=relaxed/simple;
	bh=69x9rvEJHS3zQE+WZ0VnptkFEPovyR9nryWgrEziv6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hxPODEYI5cEkjqsBU3wy+vRmK66dRLZiBL2VdQp981QMCjIAwXpQH6MxBK4Skxc71J22daN+QYZ00FVBaNfHL3UnnGEmItusTZuDYil1mP5vSBsASKqbdeLmZpSXOsy8Zm4kDJunZZ+yBhqGwZCeRCl8GS4yHu6xvADV7snK3Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCtpxsXn; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCtpxsXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785892385; x=1817428385;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=69x9rvEJHS3zQE+WZ0VnptkFEPovyR9nryWgrEziv6c=;
  b=FCtpxsXnxTd2hwXqCTYfuXxD4JGsfnytIu4KuQSCmC8vfWPZH1F025dw
   h8QEoLdd5scvtI8ocJ0WgnkdHUMmQRvFEdngYnk7c7oxgRVJM+WRYv/Sx
   lqhOCLXSz8la0Y2iH2a9pZvwWNfSHHYWYmIdzwbtcmZl2CGuGwoq/dopG
   X0Pb7U7fvAq7cVEh9FdmmgQB9d+o+LOazEd98bNrfQzm8TjAsKUBRxS6/
   LpkYKvthZHvRG45QW8BmXkbGgpN/tlo24QkIiCmJLgKq7bhm/y5ogZdEA
   DN787JSpfA2ErCr7MgM3LYg0lyqc111uP1eDOPLpQx/3egELxP7OFmhXT
   w==;
X-CSE-ConnectionGUID: RpOEk7/HQxqs7cTKJnHLTg==
X-CSE-MsgGUID: nBJza/OCQv2CxPNcvhSC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="88981022"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="88981022"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:13:04 -0700
X-CSE-ConnectionGUID: R+LLp2g4RTil77XgKIpoOg==
X-CSE-MsgGUID: 170Iv41+Tt2mfgh5kT7g0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="286306707"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:13:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:13:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 18:13:03 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 18:13:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYdBcQcWhqMoMQ/WX+h0SdmbzglsjF1qNBksuWrRI+aYQKNUJYP8hc7622a5jhANQQDBv4lvrDUnHWXdowNbF+RwHDOKZVcIfrVwwYYkQzTWV4X5bnyRqc+V7c4Y4L4BzYji2nfXBwzCvVZAtUo2GCjgSlWOr2ZWRnOwEc884KR6KAvefpa3+HLBvfaCZAZAjUG4TtP02x1xca1NjQhpfl52KFzSIZ78JBkB/cyK5eo6JT8StaI0DHaO3fpRyszIzhji5kSjw1xdKwGVJswYGfeoX8YHba4djMrwlIfKEkf6Lg42QMhnvCbnMKLFbTWm5gaz5fTbtWsfaog2Igvoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69x9rvEJHS3zQE+WZ0VnptkFEPovyR9nryWgrEziv6c=;
 b=VOPNn6kUsU7ui1U1OZeoHX7Ryy2ZDJVbAh67ntiRC2Rq5C6HHYck53FuO4nRkEuwrHO6xq9UrSYey12WylNdetgVvwHshtOhbDmwJJdhQxZYPPJHhQhaG3uiPMi5FgzfnR7RyXRLfuubkB61GrCwGirg9F4tmD+MJRGAyaFs6ief4+DtIDB4X1eGCASZTcDDakKKAcSP+Ke4hCaOBs9PWAkztFaPzYjfD/52Zrcfvuh5s2nmNmoc+nIkE4YwlULsvVDh3gZB8iIkbSa8QvxTImnoCm8xzt2a9oiwx6/iLnqFcD+Cz6ImpNQP8VAFcBN5k5PSfxzxyLi1mUoz3pLRhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SA1PR11MB7700.namprd11.prod.outlook.com (2603:10b6:806:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 01:12:55 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 01:12:55 +0000
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
Subject: RE: [PATCH 2/3] ASoC: sdw_utils: skip endpoints of a peripheral that
 is not on the bus
Thread-Topic: [PATCH 2/3] ASoC: sdw_utils: skip endpoints of a peripheral that
 is not on the bus
Thread-Index: AQHdJGUoCBZXVNqOiEu9pzUA52bbwraOoJ+g
Date: Wed, 5 Aug 2026 01:12:55 +0000
Message-ID: <SJ2PR11MB84240C52AC5C4DB36B92AACCFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260804225853.31585-1-lsa.uz@pm.me>
 <20260804225853.31585-3-lsa.uz@pm.me>
In-Reply-To: <20260804225853.31585-3-lsa.uz@pm.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SA1PR11MB7700:EE_
x-ms-office365-filtering-correlation-id: 7cd1ee78-a9b0-469c-7a91-08def28eae36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|11063799006|5023799004|4143699003|3023799007|38070700021|6133799003|10067099003|56012099006|921020;
x-microsoft-antispam-message-info: nhtC4RDew6gmOz+gyHGLus1nAgUP6yF3ToYpPMJN9usD5sY6DWMSHdpdnZweOR04py3ZPocs/0+8dcjdAeUCq1c4o2nsjnsDDHd6d4RASwje2mIlpnTXT/qBXNuhc0vUrTTQ+cfO0ziT/ZUyvmpu/rltabOk0YUuJ6Nt41G/2ZkNLwO8fMuk/ZoPWVqO4Q64d1BoWTTd1AbUMOzZLUbK0aQ5w7HpciL5L8wTdaHDEGohIOgry//bJllgaT3+l8ZMrdeYr4bIw0xT+nR/6g7hIeBDNJWwDz736b6WiZbNNFgQRkMse1WLDpoPQbIl2hSp4raDWHHK1x1tcKVV8s2M69wVf/5QI1TOgrRhQShXoVWjfJkb0nR7aE63wEvC9HddQM86b+HzMDzz7fcAR2b9Km6UqE/XHA6ePkLPgMN1RPNUfnB9F8qu57Zy6vFSnHZ2GwNJ3m9z498Tgr7KHN22Tj9bwK/PqPC/nmQjsQUxaU/5KMhIpgitbI8a74Agb7tbCmaqU/HtBhH1Ah2mXh1CzAwEAFcSiipVs5iHqJGp6JrunskXtwCYEkAp/EVygvaETrbQT+UoJj8Rw2YVGu3HqKjThn1XLSbzpvQOIwKYqLWco0yUiQCq2NUKosBZuBYDyuSojCR4PeJR4nyPfS3krItYAHccQ+lwkXTRx1WzcciqBBYqD1tPYojDnbxzzFDxeyXxFmyrqGRPLPMF6zJZTLzpLIltkV3LTXdKg2FKxAeR3bPwfEN25ezfHJtOQXAb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(3023799007)(38070700021)(6133799003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkVxdXBvWEttVE5xQVRabElnWXRwUUdhN1J6QUdqWlh1bXN4Ny9HeWhuU0lE?=
 =?utf-8?B?WlZTRTFRT2hyenU1NHVHdFpvUTA4ZDdiTDZNbVpxbTkxYk9SZ0taSVdiS0l2?=
 =?utf-8?B?KyszclVvMzZMZkVFU2xTT2dVc1dDZWVCamZvdGRFdEdRU2RCVmphM3U2aWgy?=
 =?utf-8?B?eldJeUFlSDlZckdSTEc5RnUzZjE4WFhzcjBPMWpONHZRQkY2NGtCMTlGdVNk?=
 =?utf-8?B?VmlqcEJsRVhUL2pvajBkZkYzU3NlSVZNOWVoZ0pwdUZSbjBtQXB4OXhnNlg0?=
 =?utf-8?B?MWsvWE9EQWxuUktEQzRRcjV0VVFtVDdzbDY0UU1qV1NSU3dWUXdNZitwMzdT?=
 =?utf-8?B?c2V3TlhLa01ESEd5YVFjUmI2K0dRdDZqTDVack83VmNsb0hBWFpGUW5iWWVD?=
 =?utf-8?B?aEdWdy9oYXovZ1I4TklmRllmS2VoSjE2ZnBQTlJGNmlQSjRIaDJrNzcvNWR4?=
 =?utf-8?B?UUpyNmVOTmpwOGVOZUNIYWNmMERSMkJoTUd1eDJTOFk0bWNkRzc0YVZ2RjB1?=
 =?utf-8?B?UGJtMDJia2dlMjExV2tUQ09BYzU5UFQyalRZeVlJWDhVNyt3SDUzTVRMZ2RY?=
 =?utf-8?B?RkQ3NWVXM0diWUhDM3FLVXRicmpySmlmNmdjL1pDZ1NnWnhEa08vc2Y4Mnlk?=
 =?utf-8?B?TUsrY2laUFJ4YllmeXlnNGxZUE54RTV1eEZyQ3R5dExTc3JIMDVMOXkybjUv?=
 =?utf-8?B?OXZUSTBwdld3SGhRanh5OTZpTFJBRHJId2xCaUx0L2NBWkUxUGZ0dUl2Um56?=
 =?utf-8?B?RFNrbVVydkNLSHY1WENCWjNPQlBkL09KeU1hQjZFSU5pcDQ0UXpSR2QvZmVp?=
 =?utf-8?B?Szg0RmM4RzVPbFkyYTcvOUdjWlhQNS8yRElnbEtqWGxDRTFkMEZrUzVGSmV3?=
 =?utf-8?B?WUJMUmk3MmxwbEFSd2N1enZNLzNkZVlZZ1V3dlQyekNoT0FuSzZlalpCZWNK?=
 =?utf-8?B?VEZQMzEzL3R3eTUwT0FSRTdwYkRHbVM5cmZPd1pWUzFCeUI4WnZCNnFQZC83?=
 =?utf-8?B?Vmlwdld6ZzNQQkpoYUJUby9JMXRCVjUxcVdjL3RTdzBhQ2cyUkdNMlNxbUVy?=
 =?utf-8?B?NlRURjV6eXljaVkyRGpkL2dJcUlpTjJGbXRsMk1VQUlDU1RoZWxaeWdhZFJE?=
 =?utf-8?B?VUpMTEZSb2E1bld1Y3h5MGJyNlZIRDh2NjJFSHhZU1FCSHpOc0E1UVY2STVh?=
 =?utf-8?B?RnFZNDN5Z1lJWTViV0wxVC9QYVd1cUgwWXU1anEvYzJ6TXNvSVFLbGJERy9Z?=
 =?utf-8?B?czNLditVNXJxWll0UHZDZEJ6RG1GS2wvZFRWd3lGZ3lkLzN2MHFqUmIrUEg2?=
 =?utf-8?B?aVhya1dsSkVrSDF5RjU5K2VlaStaUjhJaXhadWo5aHV1MVJheUI4OWFlSEN1?=
 =?utf-8?B?Qlk0S1lNSC95amREUStQQ1Z6M1hxY3hhYXdrUVRkeU5ueDEvQnhkcy9oOWcx?=
 =?utf-8?B?Tk9peW5MOGpiMzJlRjdnb0NNNWtMa3dWRWh2TGNGM0NxaDllLzJrOVUvNmpR?=
 =?utf-8?B?QTR6NlBiOVBseU1EN0x1ZVBHZWxLYWtORWRHTHk3STZud3Y0TUkzS1NtMXlC?=
 =?utf-8?B?cHgrNE4rVkhmYVFMMWs5eUxUNGl1MzI3VnRQMkRkNDJscHI1Kzh4ZlpPSmo0?=
 =?utf-8?B?VDNtT2Zrbi9ET0c0RXNqRkNXYzJ2bGIyNGJmdlJrMDVOeFduWDFTOVFxNWtw?=
 =?utf-8?B?RGNpeHI0RTZSZWR6d1ErNnpYNDFzWmtGazAyK0MzNGowRHpHVkt2YXpJREc3?=
 =?utf-8?B?YWdHcTZnUko1dnphR01QcDYvcWdyQ0o4SkE5RmFaaDFZWEIzSmdtYmwxYmw3?=
 =?utf-8?B?ZmltSGh1WEcvMGhiaFk5WnUzV2ZBV3FxZUlPek1TUi9nQnI0VW1rMnY2ODl6?=
 =?utf-8?B?TFp2RENjbzhVYjdXdzhlN2JZRTNYTVdRR0JuSHBNMmFEQmJjTnEzaWpNRWVr?=
 =?utf-8?B?QzdhNWVnRG16STZhTkw2c3VkbDNrRStJY2VYSlNtVTk5N21MQ3RiZW5IWDVp?=
 =?utf-8?B?SGFUa3RIRkZRczI3OFVYQXNUeXhCdEczdFZlNkU4YUVjdGRMTXNGMlIxT0NR?=
 =?utf-8?B?TWsxVlNaT3ppRXNIL21YYm1rT3VPblhlbm1wS2Q1bXdJMFRnb2Vod3VmK3pt?=
 =?utf-8?B?Si9HR1RGL1NIc2wwNzZUeEVqYWZoWmJSV21DT0NGN1dhdzh2S1VkdHhOank1?=
 =?utf-8?B?TG9rUHBVVmNTTW14d0paVTQyUnJFa0loZEtYRW9qNnRudmErdWRIL3N6UERs?=
 =?utf-8?B?Z3d5QXJzcEc4dmpMdm9pYUdwTUxEWjJ4V1h4NGhacms1WnpGYTB4VWZUWHlG?=
 =?utf-8?Q?qabHag3x7Xxvkt3cax?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: laTfylHgpiHYPu0CQN+UFknMXBbqCf52F3YurKSSJdAo4Bx7ChP78q8baMPTL3HAp/HwASlXDU4NozlNdNTkuMEKX4EQCzoY3biuX9iDD0P420q53WTZzOlslL2dy6abQhNMJE2YrxU39ARS+MaFBLsHDQHb9u04fxPmlKJfNPMtKHs3rMSrBzb5qh4eyQ0xN6Ppvu6nh1GsMqTjOtFN6KJoU5Af1Hul0xvspRD9+6LTsVIeXDfNDBAMDyRbX/XdeaefOVcZw3XYcXEwSxjLZL36TsE4TCozdsrLBtGJkwM5cXsAiXAfQZbUqEDE+ccx9kvtom8fLqwvNh2dCvqRSg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd1ee78-a9b0-469c-7a91-08def28eae36
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 01:12:55.5207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wXfZquepvsgCQLi+M/S8C/OqbTX4ZwqiwNctsf6M6AymeXNirZb/8E29oMNS+vfiwq+TYdT5hEXF2htQL3HXow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7700
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
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggMi8zXSBBU29DOiBzZHdfdXRpbHM6IHNr
aXAgZW5kcG9pbnRzIG9mIGEgcGVyaXBoZXJhbCB0aGF0IGlzDQo+IG5vdCBvbiB0aGUgYnVzDQo+
IA0KPiBhc29jX3Nkd19wYXJzZV9zZHdfZW5kcG9pbnRzKCkgYnVpbGRzIERBSSBsaW5rcyBmb3Ig
ZXZlcnkgZW5kcG9pbnQgb2YNCj4gZXZlcnkgX0FEUiBlbnRyeSB0aGUgZmlybXdhcmUgZGVjbGFy
ZXMuIElmIGEgZGVjbGFyZWQgcGVyaXBoZXJhbCBuZXZlcg0KPiBlbnVtZXJhdGVzLCBpdHMgbGlu
a3MgYXJlIHN0aWxsIGNyZWF0ZWQgYW5kIGxhdGVyIGZhaWwgdG8gcHJlcGFyZSwgd2hpY2gNCj4g
dGFrZXMgdGhlIHdob2xlIGxpbmsgZG93biByYXRoZXIgdGhhbiBkZWdyYWRpbmcgaXQ6DQo+IA0K
PiAgIHNvZl9zZHcgc29mX3NkdzogQVNvQzogZXJyb3IgYXQgc25kX3NvY19saW5rX3N0YXJ0dXAg
b24NCj4gICAgIFNEVzAtUGxheWJhY2stU21hcnRBbXA6IC02MQ0KPiANCj4gVGhlIE1pY3Jvc29m
dCBTdXJmYWNlIFBybyAxMSAoSW50ZWwpIGRlY2xhcmVzIG9uZSBwaHlzaWNhbCBSVDEzMjAgdHdp
Y2UsDQo+IGFzIHR3byBfQURSIGVudHJpZXMgb24gbGluayAwIGRpZmZlcmluZyBvbmx5IGluIFNE
Q0EgY2xhc3MgaWQ6DQo+IA0KPiAgIFNXUkEgIF9BRFIgMHgwMDAwMzAwMjVEMTMyMDAwICAgY2xh
c3MgMA0KPiAgIFNXUkIgIF9BRFIgMHgwMDAwMzAwMjVEMTMyMDAxICAgY2xhc3MgMQ0KPiANCj4g
U2FtZSBsaW5rLCBzYW1lIG1hbnVmYWN0dXJlciwgcGFydCBhbmQgdmVyc2lvbiwgc2FtZSB1bmlx
dWUgaWQgMC4gVGhlDQo+IHBhcnQgcmVwb3J0cyBjbGFzcyAxLCBzbyBvbmx5IFNXUkIgZW51bWVy
YXRlcy4gU1dSQSBpcyBhIHBoYW50b20gYW5kDQo+IHN0YXlzIFVOQVRUQUNIRUQgYWNyb3NzIGV2
ZXJ5IGJvb3QgYW5kIGV2ZXJ5IGZpcm13YXJlIHZlcnNpb24gdGVzdGVkLA0KPiBpbmNsdWRpbmcg
dGhlIE5vdmVtYmVyIDIwMjUgYnVuZGxlLg0KDQpXaHkgbm90IGp1c3QgcmVtb3ZlIFNXUkEgZnJv
bSB0aGUgQklPUz8NCg0KPiANCj4gVGhlIGV4aXN0aW5nIGlzX3NkY2FfZW5kcG9pbnRfcHJlc2Vu
dCgpIGNoZWNrIGNhbm5vdCBmaWx0ZXIgaXQgb3V0Lg0KPiBTZXR0aW5nIGFzaWRlIHRoYXQgaXQg
aXMgZ2F0ZWQgb24gYSBub24temVybyBjbGFzcyBpZCBhbmQgdGhlIHBoYW50b20gaXMNCj4gdGhl
IGNsYXNzLTAgZW50cnksIHRoZSBkZWVwZXIgcHJvYmxlbSBpcyB0aGF0IHRoZSBCSU9TIGRlc2Ny
aWJlcyBib3RoDQo+IGVudHJpZXMgaWRlbnRpY2FsbHk6IGVhY2ggZGVjbGFyZXMgdGhlIHNhbWUg
dHdvIFNEQ0EgZnVuY3Rpb25zLCBzbyB0aGUNCj4gY2hlY2sgbWF0Y2hlcyBmb3IgZWl0aGVyLiBC
dXMgcHJlc2VuY2UgaXMgd2hhdCBkaXN0aW5ndWlzaGVzIHRoZW0sIHNvDQo+IHRlc3QgdGhhdC4N
Cj4gDQo+IFRoZSBjaGVjayBpcyBieSBuYXR1cmUgYSBydW50aW1lIG9uZSwgYW5kIGl0cyBjb3Jy
ZWN0bmVzcyBkZXBlbmRzIG9uIHRoZQ0KPiBwZXJpcGhlcmFsIGhhdmluZyBlbnVtZXJhdGVkIGJ5
IHRoZSB0aW1lIHRoZSBjYXJkIHByb2Jlcy4gVGhhdCBob2xkcw0KPiBoZXJlOiB0aGUgcmVhbCBk
ZXZpY2UgaXMgQXR0YWNoZWQgYW5kIHRoZSBwaGFudG9tIGhhcyBubyBkZXZpY2UgbnVtYmVyDQo+
IGF0IGFsbCB3aGVuZXZlciB0aGlzIHJ1bnMuIEl0IGlzIGEgd2Vha2VyIHByb3BlcnR5IHRoYW4g
dGhlIHN1cnJvdW5kaW5nDQo+IEJJT1MtZHJpdmVuIGNoZWNrcywgYW5kIGEgc3VnZ2VzdGlvbiBm
b3Igc29tZXRoaW5nIHN0cm9uZ2VyIHdvdWxkIGJlDQo+IHdlbGNvbWUsIGJ1dCB0aGUgZmlybXdh
cmUgb2ZmZXJzIG5vdGhpbmcgZWxzZSB0byBrZXkgb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBT
ZXJnZXkgTGViZWRldiA8bHNhLnV6QHBtLm1lPg0KPiAtLS0NCj4gIHNvdW5kL3NvYy9zZHdfdXRp
bHMvc29jX3Nkd191dGlscy5jIHwgNDYNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL3Nkd191dGlscy9zb2Nfc2R3X3V0aWxzLmMNCj4gYi9zb3VuZC9zb2Mvc2R3X3V0
aWxzL3NvY19zZHdfdXRpbHMuYw0KPiBpbmRleCBkOGRiOGZjNTMuLjEyY2E0YmRkNCAxMDA2NDQN
Cj4gLS0tIGEvc291bmQvc29jL3Nkd191dGlscy9zb2Nfc2R3X3V0aWxzLmMNCj4gKysrIGIvc291
bmQvc29jL3Nkd191dGlscy9zb2Nfc2R3X3V0aWxzLmMNCj4gQEAgLTE5MDksNiArMTkwOSw0NiBA
QCBpbnQgYXNvY19zZHdfZ2V0X2RhaV90eXBlKHUzMiB0eXBlKQ0KPiAgfQ0KPiAgRVhQT1JUX1NZ
TUJPTF9OUyhhc29jX3Nkd19nZXRfZGFpX3R5cGUsICJTTkRfU09DX1NEV19VVElMUyIpOw0KPiAN
Cj4gKy8qDQo+ICsgKiBTb21lIGZpcm13YXJlIGRlc2NyaWJlcyBvbmUgcGh5c2ljYWwgcGVyaXBo
ZXJhbCB3aXRoIHR3byBfQURSIGVudHJpZXMNCj4gdGhhdA0KPiArICogZGlmZmVyIG9ubHkgaW4g
U0RDQSBjbGFzcyBpZCwgb24gdGhlIHNhbWUgbGluayBhbmQgd2l0aCB0aGUgc2FtZSB1bmlxdWUg
aWQuDQo+ICsgKiBPbmx5IHRoZSBlbnRyeSB3aG9zZSBjbGFzcyBpZCBtYXRjaGVzIHRoZSBwYXJ0
IGV2ZXIgZW51bWVyYXRlczsgdGhlIG90aGVyDQo+IGlzDQo+ICsgKiBhIHBoYW50b20uIEJ1aWxk
aW5nIERBSSBsaW5rcyBmb3IgaXQgZmFpbHMgdGhlIHdob2xlIGxpbmsgcmF0aGVyIHRoYW4NCj4g
KyAqIGRlZ3JhZGluZyBpdCwgc28gdGhlIGVuZHBvaW50cyBoYXZlIHRvIGJlIHNraXBwZWQuDQo+
ICsgKg0KPiArICogVGhpcyBjYW5ub3QgYmUgZGVjaWRlZCBmcm9tIHRoZSBCSU9TIGRlc2NyaXB0
aW9uOiBvbiB0aGUgbWFjaGluZSB0aGF0DQo+ICsgKiBwcm9tcHRlZCB0aGlzLCBib3RoIGVudHJp
ZXMgZGVjbGFyZSBhbiBpZGVudGljYWwgc2V0IG9mIFNEQ0EgZnVuY3Rpb25zLCBzbw0KPiArICog
aXNfc2RjYV9lbmRwb2ludF9wcmVzZW50KCkgYmVsb3cgbWF0Y2hlcyBmb3IgZWl0aGVyLiBCdXMg
cHJlc2VuY2UgaXMgdGhlDQo+IG9ubHkNCj4gKyAqIHRoaW5nIHRoYXQgZGlzdGluZ3Vpc2hlcyB0
aGVtLg0KPiArICovDQo+ICtzdGF0aWMgYm9vbCBpc19wZXJpcGhlcmFsX2F0dGFjaGVkKHN0cnVj
dCBkZXZpY2UgKmRldiwNCj4gKwkJCQkgICBjb25zdCBzdHJ1Y3Qgc25kX3NvY19hY3BpX2xpbmtf
YWRyDQo+ICphZHJfbGluaywNCj4gKwkJCQkgICBpbnQgYWRyX2luZGV4KQ0KPiArew0KPiArCWNv
bnN0IGNoYXIgKnNkd19jb2RlY19uYW1lOw0KPiArCXN0cnVjdCBkZXZpY2UgKnNkd19kZXY7DQo+
ICsJc3RydWN0IHNkd19zbGF2ZSAqc2xhdmU7DQo+ICsJYm9vbCBhdHRhY2hlZDsNCj4gKw0KPiAr
CXNkd19jb2RlY19uYW1lID0gX2Fzb2Nfc2R3X2dldF9jb2RlY19uYW1lKGRldiwgYWRyX2xpbmss
DQo+IGFkcl9pbmRleCk7DQo+ICsJaWYgKCFzZHdfY29kZWNfbmFtZSkNCj4gKwkJcmV0dXJuIHRy
dWU7DQo+ICsNCj4gKwlzZHdfZGV2ID0gYnVzX2ZpbmRfZGV2aWNlX2J5X25hbWUoJnNkd19idXNf
dHlwZSwgTlVMTCwNCj4gc2R3X2NvZGVjX25hbWUpOw0KPiArCWlmICghc2R3X2RldikNCj4gKwkJ
cmV0dXJuIHRydWU7DQo+ICsNCj4gKwlzbGF2ZSA9IGRldl90b19zZHdfZGV2KHNkd19kZXYpOw0K
PiArCWF0dGFjaGVkID0gc2xhdmUtPnN0YXR1cyAhPSBTRFdfU0xBVkVfVU5BVFRBQ0hFRDsNCg0K
VGhlIHN0YXR1cyBqdXN0IG1lYW5zIHRoZSBjdXJyZW50IHN0YXRlLiBBIFBlcmlwaGVyYWwgYWth
IFNsYXZlIG9uIHRoZQ0KYnVzIGNvdWxkIGJlIGF0dGFjaGVkIG9yIHVuYXR0YWNoZWQuIFdlIGNh
bid0IHVzZSB0aGUgc2xhdmUtPnN0YXR1cyB0bw0KZGV0ZXJtaW5lIHdoZXRoZXIgYSBQZXJpcGhl
cmFsIGlzIHBoeXNpY2FsbHkgb24gdGhlIGJ1cyBvciBub3QuDQpDaGVja2luZyBzbGF2ZS0+ZGV2
X251bV9zdGlja3kgbWF5IHdvcmsuIEhvd2V2ZXIsIHRoZXJlIGlzIGEgdGltaW5nDQppc3N1ZSB0
aGF0IHRoZSBQZXJpcGhlcmFsIGNvdWxkIGJlIGF0dGFjaGVkIGFmdGVyIHRoZSBjaGVjay4NCg0K
PiArCWlmICghYXR0YWNoZWQpDQo+ICsJCWRldl9kYmcoZGV2LCAiJXMgbm90IHByZXNlbnQgb24g
dGhlIGJ1cywgc2tpcHBpbmcgaXRzDQo+IGVuZHBvaW50c1xuIiwNCj4gKwkJCXNkd19jb2RlY19u
YW1lKTsNCj4gKw0KPiArCXB1dF9kZXZpY2Uoc2R3X2Rldik7DQo+ICsNCj4gKwlyZXR1cm4gYXR0
YWNoZWQ7DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICogaXNfc2RjYV9lbmRwb2ludF9wcmVzZW50
IC0gQ2hlY2sgaWYgYW4gU0RDQSBlbmRwb2ludCBpcyBwcmVzZW50IG9uIHRoZQ0KPiBTRFcgcGVy
aXBoZXJhbA0KPiAgICogQGRldjogRGV2aWNlIHBvaW50ZXINCj4gQEAgLTIwNjUsNiArMjEwNSwx
MiBAQCBpbnQgYXNvY19zZHdfcGFyc2Vfc2R3X2VuZHBvaW50cyhzdHJ1Y3QNCj4gc25kX3NvY19j
YXJkICpjYXJkLA0KPiAgCQkJCWRhaV9pbmZvID0gJmNvZGVjX2luZm8tPmRhaXNbYWRyX2VuZC0+
bnVtXTsNCj4gIAkJCQlzb2NfZGFpID0gYXNvY19zZHdfZmluZF9kYWlsaW5rKHNvY19kYWlzLA0K
PiBhZHJfZW5kKTsNCj4gDQo+ICsJCQkJLyogc2tpcCBhIHBlcmlwaGVyYWwgdGhhdCBpcyBub3Qg
b24gdGhlIGJ1cyBhdCBhbGwNCj4gKi8NCj4gKwkJCQlpZiAoIWlzX3BlcmlwaGVyYWxfYXR0YWNo
ZWQoZGV2LCBhZHJfbGluaywgaSkpIHsNCj4gKwkJCQkJKCpudW1fZGV2cyktLTsNCj4gKwkJCQkJ
Y29udGludWU7DQo+ICsJCQkJfQ0KPiArDQo+ICAJCQkJLyoNCj4gIAkJCQkgKiBxdWlyayBzaG91
bGQgaGF2ZSBoaWdoZXIgcHJpb3JpdHkgdGhhbiB0aGUNCj4gc2RjYSBwcm9wZXJ0aWVzDQo+ICAJ
CQkJICogaW4gdGhlIEJJT1MuIFdlIGNhbid0IGFsd2F5cyBjaGVjayB0aGUgREFJDQo+IHF1aXJr
IGJlY2F1c2Ugd2UNCj4gLS0NCj4gMi41MC4xIChBcHBsZSBHaXQtMTU1KQ0KPiANCj4gDQoNCg==
