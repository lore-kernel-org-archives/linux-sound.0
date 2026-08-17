Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE8B314A90;
	Mon, 17 Aug 2026 04:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941745; cv=fail; b=STUnXbekfcibBAjypug+XCvW5jsRzMj+4hWVTeb+/+PGqBI5nmWXV+aunUK45o7EdbZIWD1k19AvJu4P8/YVrUSQ6h3/hUhQVf+txfh5Zob21YOjUMHA2t9sT4X03ctWYybWDyA6gqgZ2+kD9c8CiRRiYb9MEMaFHYQ1iZZq5WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941745; c=relaxed/simple;
	bh=JhydLB63VJUkd0cPRDNKWw1GbVT2zOh9bK1u+HGJ+GA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JGUMl/7igNF6MgYjFViC7IDGUJc6Iq2kp/ZIIQPZuZ8ncW/wY6ZgUopf6N7JpI/1hLiiADYBVxzKIyv9VQWvgpjBiqDbuiYTZ29HMytgnXLcjPi3erIFDpynYc835HtLvsLV/9WjMBiBcS5hoodnYvTK4vcjbSqgLY19jE2+dXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTJPlQoX; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTJPlQoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786941743; x=1818477743;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JhydLB63VJUkd0cPRDNKWw1GbVT2zOh9bK1u+HGJ+GA=;
  b=aTJPlQoXEqhw3uTGvFfv9nu4Ie2gHYUjt0WNqUiP8bPzMtJRfXmPoSrO
   /Y65eFpeTy+Hczp2qv/KrmD4/3bU8CFMrjb/Q7X54f7aBqHUMsujLkXeE
   6RgW95PyEVyL5qGlkiyOe36Jk/IMHwR6YuZPRntTGAHbAUu6IGNK8Yl5H
   3gKUfPejv0/erHH98nQa4VofvtJq4AOLPRqoW808RXO+iPe4UmHAamtEf
   ZjDaJg0uUUBvKbFD2GWFqhm4JoXtmw9Msabde/eQlEmcNx8D1Xx0tvnof
   sUJ0wfCZ+u2TdO7IznBe7mynG8ntyUBdF0hYNeCKAB2WcE1TwG9VBbSlC
   Q==;
X-CSE-ConnectionGUID: L1ZU21shR6ysU5kcz+JVqw==
X-CSE-MsgGUID: LenTAx4ARQGQiJ5WVDKSzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87170256"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87170256"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 21:42:23 -0700
X-CSE-ConnectionGUID: rccnBcIgQtmxFE7nEdWS/g==
X-CSE-MsgGUID: 0rV/t/KiQ02yp1wxLvC82g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="268653087"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 21:42:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 16 Aug 2026 21:42:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 16 Aug 2026 21:42:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 16 Aug 2026 21:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2Ay3M8XxE4Ky44vSuRgKvJvW3Ii5NMQLe+NbrVhY3KnKtwqOresGQeeD9OHkAScwUKLaZyjYE6a8K0vOjcl7ib5Q0uWROon80Bpr5Bwr8m0/bT/Vx1WnBkWi+kCGHo6/Wl0U2vqo+AsqKQy8UR0D5qQumaxN3YIxChocMa0EQ8P+nTD686Ir+P2Xm4jEHvG3qc2kvwSKNesuCLoWaunaB3yyz/bIVTq+bIAhhZzEazj9/K1huxXui4yQXW8Jhona8LdpSeW/WQ4scy/mGiEIGJf3y0kKj4ppQjQb+iD/tm4wxXVppm5ky3mJF4e+r0N2Svw98+RqJZpa9Ci0QVlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAgGO26qj7db/IlaN4fFdkwn1L66BX3jTRuJblW5kp4=;
 b=KnepXr9UHhpePd707FTr1mPjz7ulFRgzjFSFZPXepKEAwKWPP6Msyh128MFenOOIQWWWMD/8HtZWlIiCGf659Bz2F7JcrDuN8XFceAC+nAY5ZsOBSPCf1DTce/xZMGRnabMWbJpR4dUTiC10MYEQ4bVQr4RwdQKR2YICEazRERE+A93sZ3ITfOGHBrvuiW2UZtm13tiJkjTywj2tKZOkf4FLXMFH8Qbs7d/ab5H40l5cYb6NMlwRCuLlyQb9Ggh3AOKXpVVYW4j8iGjBxVCuxr4NUA4ekzGQm/nelo5UhaBVz2NHunD87RQiYqC140nROqgKfqGD2JHdocHR5GmSnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 04:42:18 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 04:42:18 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Sataporn <excursively@gmail.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Ujfalusi,
 Peter" <peter.ujfalusi@intel.com>
Subject: RE: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add
 rt721_l3_rt1320_l3
Thread-Topic: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add
 rt721_l3_rt1320_l3
Thread-Index: AQHdLOPkMPnnfHwB+EK1+E9lJTbqqrahqTnw
Date: Mon, 17 Aug 2026 04:42:18 +0000
Message-ID: <SJ2PR11MB8424EA2C7382EBE3D914FA05FFA72@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260815182747.8913-1-excursively@gmail.com>
In-Reply-To: <20260815182747.8913-1-excursively@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DS0PR11MB7649:EE_
x-ms-office365-filtering-correlation-id: ededc462-b321-4e10-7667-08defc19eb38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|6133799003|10067099003|11063799006|5023799004|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: UKLugB9WhECnNSfPpBDirJnX+PNNejoXQEAfzKjFCQacu6fgJ5SFF/znsLo39XNJcYlx/BZThcWe7eYN0TN/NVQAjzdJt9/ac0wMHf3xaXuaRgwQ5g7fCrHIHBefrQ3dxhSbMUNU8r5JrhAddoCm4R9tUu0e8rKobiPtaVpRlI+OURghqvaU4/HwRaELN/rRJOThtlHh+hzWCVUrLGuhZTQdMkbV5EzGbqFj7vkbsiyh9w//4xxdqhpApTHWHHJ/bXP9LgbrharxDVI0u4/b244bvccd0uZ2Slple7A6R/lpFb302ZBZmQKcgvzVQ/czn7eyLoJo+D0YDce7IWslm8hTocb5Qu0hZozJ7R8qu9qR/5POfk25ZKFyho3yIGOiYDI0imXTQOcbjnPNjjC5gFzn/jZIdGjikrFgzMpZ/EP0oh0adYQbHORjOY3rawzGpt8x2OINjrVQf/kLfCcV0u+AyO97T/pe9zJmdaNAHj9mWLmQiP2To7QvYbNZ5uGZ9GTwPcAJJo48ZIw0Wdf72dPLHWg07bEcMXWB6XpR9T04soUp3wFY5SfmJpFqlLQcTsM9RR4nh8rNbKCMzXLe2ygorf/2Qq7yonxNJmzZ3XXLeJFNASG+9MHVKgf3LWHeq63EnHDuHSbCPskwHxd0LXj1wJSdlDNKwfDFG8CNKZI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yoSCDdyQd9/4UFa1mAH6LeBXvPGIwVlYwa14a85zXKmNS46xWDtHgonYArxR?=
 =?us-ascii?Q?gQPj4exk4LbYSZ00TN9OWBugaZxZgVmlLkXl3e3Fm1zmJrSXCk5JoQhTikDZ?=
 =?us-ascii?Q?A356BKexYErAfj6ZeTa2RUsyTZVB75xiN/k/K72Y/Cki6vRgZj3wJwW65rwJ?=
 =?us-ascii?Q?dBLA+75PqVNp8HSVbC4/JBiNzHyUH0kt2A5PpzvweFc9UDgeSWomrG0WGgvX?=
 =?us-ascii?Q?aFFm6JSXQxhQc1oiSsM+kZJAQpfj1z1j0jw63CvG5bs2dcgSZUfN8zy9jzCR?=
 =?us-ascii?Q?lfqrmoOt8bW0NMvd73loczK5w5MCE8dFPcNBDAaI1JMxapXU/bmZ5eVFkkIb?=
 =?us-ascii?Q?BcWeX+9Wb+HTOMSReS3rrEbtEWIQi8L9p0Q88p3QkbyO4kA7eYx5cZxR8SsB?=
 =?us-ascii?Q?txu3JIxmG4BaEBhPV15UW5PVkeUu2XDB7XIiEv3M4N8VjJg+BWWI84ChmOhL?=
 =?us-ascii?Q?gk4jiAj9qaxNyx+2MGSeZWQlnTA6cukoDQHs1tHQWpQlbbar1sH47KrKeSAf?=
 =?us-ascii?Q?Nz9M8Didzcv4JJXuwO+lgSgGwFvHW0pWthgL69K1YHJXeFhKqKQhpvUFO/bn?=
 =?us-ascii?Q?tCAskt4Ms3NBP0JFqVGT+RfZ59t5yDdqtW52IIzg3NyjIjDlTlBKEWS2Tdws?=
 =?us-ascii?Q?8hjFaUlXNO8QWGBbrPElOjZrfdPuKmRlhQ+cDbJLHmCbjVXOoP/m9sdzqJk9?=
 =?us-ascii?Q?oQOhDZdbwkXZGGzjU5vIuf2sMMao/7/x2KUT3sX+NtFTu+4JJo7Xu6FwqniE?=
 =?us-ascii?Q?0gfsmssOsBguJloF50525Co0VO9qztgmfPhWX0lDqq8bB0E+MLe6eoLHb+M2?=
 =?us-ascii?Q?UzAGmE0RBDf2VXfXp7yImeBiEhIleLRt6RE5AuOM7B0IvJ4QVHOivQMtKPeF?=
 =?us-ascii?Q?IrWdz4BvfzMbo7s/eNL0SMdGCj8UHKFkydPhsnBaEu0gCqwp0P1EUs2jetKP?=
 =?us-ascii?Q?oC+zRBh1n/7l8B1B1H9IzF0b1iLwmgbXzB2W1XfHR8JdDPWcH55nrDVlhNjS?=
 =?us-ascii?Q?PZT2Nwskkkq15w/2qzQkAY/EXSXaqI+3SLdxOkvxue6STdcyoIf3hPwTJdfh?=
 =?us-ascii?Q?MQjuHIDsMB2k09IHjqQUzW4pSREkU1b4NQvDp7qZXWYUy+4LH/E4cVoF+7D5?=
 =?us-ascii?Q?HVdVRVPampMxAzKBVyeO+czeWb+Rmqvxd+GDwJQzLKDa1uv4Q7NDaTOZ3Wry?=
 =?us-ascii?Q?QvDY5oIYVKYGxd/G6iWrybwzS5TFLrJ7ZNyl1jQkIfZXT92ejwvRNlV+HeSC?=
 =?us-ascii?Q?qzgak1D8Hk11q/3qNQIDAxHR9xuo36TUqb58Lpp7sBq8NrQWCEuLF3K2XZ+v?=
 =?us-ascii?Q?QoULFZx5KkDqNZxmZHdCAOGE3XHUcGojeX6q9suVsd/hLKqPMssShORyiYwJ?=
 =?us-ascii?Q?DNboOhT6IZjpgv24PhTTBhv2QafLijNWUYfGyq9arBieDpqHMtW+ay6yt6AW?=
 =?us-ascii?Q?YMuWHGjsszbugAGQTfjO/qbGag7+UqoYZPBTmbzDiYw47K7IeXKoPkx9LA8F?=
 =?us-ascii?Q?fwbulJyLbqd8idNPkaypdfpVpZ/OgJxdQaPaCvgESdzRPZ/q6YheF2SL5hnb?=
 =?us-ascii?Q?2hx8c0xtphgMcYk+MRIvuRumwxxgMQ0bNkbu3wjTWCXaDf6Y8j9y/V4zfiMp?=
 =?us-ascii?Q?aFpRb6ydoezU7Krky/b31hxbpxZSsUf3fGf+puvuE2YbIP5qW+eQFA/xTN4Y?=
 =?us-ascii?Q?KSoHX5eqov5hk5A1uVJMXpMTir2pv+t4Pxhw+Bn5bCLo0Upq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q7c8fKceO2IHBO+/HwT5dz1gzn9Kn7qP+UJzaPIuQWydeQzrQUYqCC0g9iAomRytSOAqlPmZQkJ6EFY6t6tBPWQCgBwlJhu3kpTLlAwJFech5plGBbyuUTcGuDCnQqBD2dihHL1TF0LlmL5aOeCeGiw5nMJpKu6HMwryNKPTGqoQh5wUDmTym/cLpA4McbZArul63Kl8GY/uicctsU9FNJ/XblkGKXcMzyTDQK32Gy8cbO9BWWe07rECkhChlCvxx+14Oj27WwNF7QVKpg46/gcEvHmiFzneTepL3WML/0RtcbidLb7hivpc0IyKF70bW/9sW+ntDYzc93uH9LpFqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ededc462-b321-4e10-7667-08defc19eb38
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 04:42:18.3532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZFzKLKrwOlqsaqaUZRbfwwagThGd0q2ZEc5FHDb+vkiC6t5uIZw09FLS0z4J2v4cQ+HCYYpcapASS8AbvVoyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Sataporn <excursively@gmail.com>
> Sent: Sunday, August 16, 2026 2:28 AM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>; Pierre-Louis Bossart <pi=
erre-
> louis.bossart@linux.dev>; Peter Ujfalusi <peter.ujfalusi@linux.intel.com>=
;
> Mark Brown <broonie@kernel.org>; linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; Sataporn <excursively@gmail.com>
> Subject: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add
> rt721_l3_rt1320_l3
>=20
> The Lenovo Yoga Slim 7i 14IPH11 (DMI product 83QM) drives four speakers
> from two amplifiers on SoundWire link 3:
>=20
>   sdw:0:3:025d:0721:01     RT721, CompanionAmp function only
>   sdw:0:3:025d:1320:01     RT1320, SmartAmp function
>=20
> This chassis has no headset jack, and the microphones are the PCH DMIC
> array, so no jack or mic function is described for either peripheral.
>=20
> The Panther Lake match table has no RT721 entry at all: the RT1320 is
> described on links 1, 2 and 3, but only ever paired with RT712, RT713
> or RT722. This layout therefore matches nothing and the driver falls
> back to the default SoundWire machine with function topologies.
>=20
> That fallback misbehaves here, because the firmware also declares a
> peripheral that is not fitted:
>=20
>   sdw:0:3:025d:0722:01     RT722, never attaches, reported UNATTACHED
>=20
> Its ACPI device (SWD0, _ADR 0x000330025D072201, in SSDT "LENOVO CB-
> 01")
> has no _STA method, so it is enumerated unconditionally on every SKU
> sharing this mainboard (LNVNB161216), which also ships in CS42L43 and
> RT722 variants. It carries UAJ, SmartMic, HID and SmartAmp functions,
> which appear to describe a sibling SKU that has a headset jack. The
> default machine driver selects it for the jack, microphone and speaker
> functions:
>=20
>   Components : ... cfg-amp:3 ... spk:rt721 rt1320 rt722 hs:rt722 mic:rt72=
2
>=20
> and every stream then fails when its ports are programmed:
>=20
>   rt722-sdca sdw:0:3:025d:0722:01: DPN_PortCtrl register write failed for=
 port
> 1
>   soundwire sdw-master-0-3: Program transport params failed: -61
>   soundwire sdw-master-0-3: Program params failed: -61
>   SDW3-Playback-SimpleJack: ASoC error (-61): at snd_soc_link_prepare()
>=20

Can you add the SKU to drivers/soundwire/dmi-quirks.c?
Like 4dab2b904414 ("soundwire: dmi-quirks: Disable ghost Realtek devices ")

> Speakers and microphones are silent; only HDMI works.
>=20
> Add an entry describing the two amplifiers. They share aggregation
> group 1, following the existing rt712_vb_l3_rt1320_l3 entry: with
> separate groups each device asks for a DAI link named
> "SDW3-Playback-SmartAmp" and the second registration fails with
> -EEXIST.
>=20
> The RT721 needs its own speaker endpoint rather than spk_l_endpoint,
> because the endpoint number indexes the codec DAI array and the RT721
> exposes its amplifier as endpoint 1: endpoint 0 is the jack, so
> reusing spk_l_endpoint creates a jack DAI link and no amplifier at
> all.
>=20
> No monolithic topology exists for this combination, so sof_tplg_filename
> is set to the "dummy" name that hda_sdw_machine_select() already uses for
> the default machine. Without it, load_topology() runs with no_fallback
> clear, and sof_sdw_get_tplg_files() abandons the function topologies
> entirely on reaching the SSP2-BT link, which has no separate topology
> yet:
>=20
>   sof_sdw sof_sdw: dai_link SSP2-BT id 8
>   sof_sdw sof_sdw: dai_link SSP2-BT is not supported by separated tplg ye=
t
>=20
> falling back to a monolithic file that does not exist. Marking the
> absence of a fallback lets that link be skipped instead, and keeps BT
> offload enabled.

Can you check if c8f3c9fa75ff ("ASoC: soc-acpi / SOF: Add best_effort
flag to get_function_tplg_files op ") is in your kernel?
In theory, it will skip the BT link and will load other function
topologies.

>=20
> snd_soc_acpi_sdw_link_slaves_found() only requires the peripherals named
> in the table to be present, so the unfitted RT722 does not prevent the
> match. An explicit entry stops the machine driver selecting it, without
> needing a quirk for the firmware bug itself.
>=20
> Signed-off-by: Sataporn <excursively@gmail.com>
> ---
> alsa-info with this patch applied:
> https://alsa-
> project.org/db/?f=3D8b9e4c24389cc520c77b3ece54edcbfbb50d07c6
>=20
> diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> index f7694b2..c3ce060 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
> @@ -92,6 +92,18 @@ static const struct snd_soc_acpi_endpoint
> spk_r_endpoint =3D {
>  	.group_id =3D 1,
>  };
>=20
> +/*
> + * The RT721 exposes its amplifier as endpoint 1; endpoint 0 is the jack=
 and
> + * endpoint 2 the DMIC array, neither of which is wired up on boards tha=
t use
> + * the codec as a speaker amplifier only.
> + */
> +static const struct snd_soc_acpi_endpoint rt721_spk_l_endpoint =3D {
> +	.num =3D 1,
> +	.aggregated =3D 1,
> +	.group_position =3D 0,
> +	.group_id =3D 1,
> +};
> +
>  static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] =3D {
>  	/* Jack Endpoint */
>  	{
> @@ -211,6 +223,15 @@ static const struct snd_soc_acpi_adr_device
> rt712_vb_3_group1_adr[] =3D {
>  	}
>  };
>=20
> +static const struct snd_soc_acpi_adr_device rt721_3_group1_adr[] =3D {
> +	{
> +		.adr =3D 0x000330025D072101ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &rt721_spk_l_endpoint,
> +		.name_prefix =3D "rt721"
> +	}
> +};
> +
>  static const struct snd_soc_acpi_adr_device rt713_vb_2_adr[] =3D {
>  	{
>  		.adr =3D 0x000230025d071301ull,
> @@ -437,6 +458,20 @@ static const struct snd_soc_acpi_link_adr
> ptl_sdw_rt712_vb_l3_rt1320_l3[] =3D {
>  	{}
>  };
>=20
> +static const struct snd_soc_acpi_link_adr ptl_sdw_rt721_l3_rt1320_l3[] =
=3D {
> +	{
> +		.mask =3D BIT(3),
> +		.num_adr =3D ARRAY_SIZE(rt721_3_group1_adr),
> +		.adr_d =3D rt721_3_group1_adr,
> +	},
> +	{
> +		.mask =3D BIT(3),
> +		.num_adr =3D ARRAY_SIZE(rt1320_3_group1_adr),
> +		.adr_d =3D rt1320_3_group1_adr,
> +	},
> +	{}
> +};
> +
>  /* this table is used when there is no I2S codec present */
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] =3D {
>  /* Order Priority: mockup > most links > most bit link-mask > alphabetic=
al */
> @@ -531,6 +566,19 @@ struct snd_soc_acpi_mach
> snd_soc_acpi_intel_ptl_sdw_machines[] =3D {
>  		.sof_tplg_filename =3D "sof-ptl-rt712-l3-rt1320-l3.tplg",
>  		.get_function_tplg_files =3D sof_sdw_get_tplg_files,
>  	},
> +	{
> +		.link_mask =3D BIT(3),
> +		.links =3D ptl_sdw_rt721_l3_rt1320_l3,
> +		.drv_name =3D "sof_sdw",
> +		/*
> +		 * No monolithic topology exists for this combination; the
> +		 * "dummy" name marks that, so the function topologies are
> +		 * used and functions without one are skipped rather than
> +		 * failing the card.
> +		 */
> +		.sof_tplg_filename =3D "sof-ptl-dummy.tplg",
> +		.get_function_tplg_files =3D sof_sdw_get_tplg_files,
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
> --
> 2.43.0
>=20
> --
> 2.51.0

