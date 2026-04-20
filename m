Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952A2032D;
	Mon, 20 Apr 2026 01:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776646986; cv=fail; b=VIbPMdN//yqBRcMIOKWF8QDJk+Czg3kNj8+SyiXHt7FsN58iPIIlk1o4ScsvGvkVhb/SVk6bzoJu8n63zzWt3NBFMErCu4f4uUUzNa75E2onEklFpMlxOLQXhA090U89Vg53OwOhcBFxCNzhpbmmWk6C87RTSFERRsWpwOeWl5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776646986; c=relaxed/simple;
	bh=Bef/LjNZL1yo1v98KN8Nlemy2JEawCgW3b75PTqwLfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DXmjPU+Qwvdcgwizz2CuEsWCF5K45WRmhMbSiNIdYzIKucwKeahfMw/17TIAWR5hjSTFF18Cg+3cjFnYb4WSP0Gw9pBMmaekJpJBYyHWBxb7AL1zW88A59F39WvCtyOmF7kdzTc3/BpI2OIQC4KTWNmHUDrGD9+tEsOMybny6DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dENf+zvI; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dENf+zvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776646984; x=1808182984;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Bef/LjNZL1yo1v98KN8Nlemy2JEawCgW3b75PTqwLfI=;
  b=dENf+zvIysTHtEFPHMn9OCxFQnw/sbJEMpzFa4FZiRAUdSIpXF7NvKnM
   2DTVAO6J1fJ+O/U3X0MVkRXiaHehC72zUxJCmSO33HtEaCWacGP7ayhRj
   rbhTffqGmRVU/VHSQKjwDEH63EV5X9A6ZLel9P9yLYv8TFrLaqRQHfqZ+
   z++aXHmgZv6nLLtmVLO0Wiaah7JHvjgFKoQjPeOqGrxDL+VXaSbdxFenW
   ibUlqpqrsvDQQ5GVkfl2UTNfHc1ULY914LuDfOotm2N4c6PrOXOGUxIBL
   TMD1wblCi0Gt2F1nxHV/YdgRmlntSwZA6tFe5bpBdBjYlIy6nFmkbi72q
   w==;
X-CSE-ConnectionGUID: jgdsG3CJRhifjRDyEbfbng==
X-CSE-MsgGUID: il59dzP6SoaFEo4kMzp1hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89026178"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="89026178"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 18:03:04 -0700
X-CSE-ConnectionGUID: 2+cTIO8mSKeGzHjJuHj5dA==
X-CSE-MsgGUID: kPjFQ7ALQC+z7rZCUmgHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="230711334"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 18:03:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 18:03:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 19 Apr 2026 18:03:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 19 Apr 2026 18:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrZbHKP1HaXXnd/2yiWDgoGfm8wd8Mr5nWxKR1ZbIHyxDlw7hHU4CK/ixbBVZdhErS/wzqiEqeBKUGUt4PM1WT1t2ny9/AweGYWR9Y40Rg2nr3vQNcXf7PIJLsW4RzuePp/PNyY5XTYYLTWu8Tgf6xbTkpVyo7m11RhbZH1QEzr1eSJTczv1fGr5vXsqjlSY4klBlznw8G3EEhv+MTc0GP6z1wTW2GDq2JMo6eSwWblybZFg9rZTcndZxuuUd/ly5iWbnjr3krUKW7uwc1JU2Ka+yU+90dN1uFqYqshH2t5RpI91lyrLs1Rc/9dWniyFsNx/CDrF9ryeweYptXz0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ffpPZgEntMcsZ9y7h01Sr2f9F/uCf2MB/HY6S8DnlU=;
 b=RaON5jUpuHnITJK3cEiu0eS+d5ocZ35EPREHBUfkj/bwGuHA0Z4vsDycMWmOhV99nKNk8Y3M8CeCYhV1J/qLaIEEw+SQpQSq0nMNG7du8YcSqpOImFBl8Pr6bHGSc6+nECfer2JE8bjqvMd29pzUHSOXbxJ80BeXUaJjC43+SjHXg2X0K30uTRvnOCTqPZvJ10H+61OhIRfwpijn3lx2cy0a2oDSfgGJDB6CSoZj8mmlbvrVV9lI9SHMEEr+mVrre2wVvakHT7UrvhpNyqb1XZAoqBs65UjtnqwpnKPFKkXgLuGd0JLLz7gJJ1nerOX96xXNpiCRPhSQD+D7/qOyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by IA0PR11MB8400.namprd11.prod.outlook.com (2603:10b6:208:482::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 01:02:57 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.20.9846.012; Mon, 20 Apr 2026
 01:02:57 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>
Subject: RE: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to be
 combined
Thread-Topic: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to
 be combined
Thread-Index: AQHcznmIRDELfv34b0e/Q2Yv77wkVbXnJbRw
Date: Mon, 20 Apr 2026 01:02:57 +0000
Message-ID: <SJ2PR11MB8424B7A5723032E66C4B0A49FF2F2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260417144529.2385360-1-mstrozek@opensource.cirrus.com>
In-Reply-To: <20260417144529.2385360-1-mstrozek@opensource.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|IA0PR11MB8400:EE_
x-ms-office365-filtering-correlation-id: eb01e00f-fc16-4349-75d8-08de9e788faa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 0O0JkNBCacOKUYD9jiKKAA6ND1tYnQPJcOefY3nWWRZguxt6DV4SRbihJPBA5qi/gA78paTL4J7RA00XrTupEMGZ6rfyDCPJOx2XQrTk7jrxk0dcutbdTmkjwiIKg2K8k1xRz9Kx9IubHruIsDtgqpfPfjrzZmrojK9SBr6yHnp5M03n6n5J4eAtMCZfhILxqJEUB35p90/aeOME15RQruWxUdagX2WfLy1lnwCVv/GXmzMrVS/6fC8OAHzIx4OexlKxhES1shQuM/SNqnYC1q/1pND/5FOz7H63fjl+0bBYvrYE9SF2vNufDALOSzb7pENXl/6omSKk9iSbCWGpUIZzTEcVD7Z51AICuJ+6ugIj+5cvzOsI8QzGegoZUBkqONRE1+MsLhMKmQhuw6qCImdOZz/47asJxTagLdqwN6KOmzxVfAw8n/il6vOBRPDcSV/vfikcfZaIRk1XC8GGvhv60PQnqAVt3/GuegnQIZTmLuKLukmqQ6XTbs3OLwRfkfgNg6neSPk7NwTLRQvBDkgiGco6urrcSXdcXFEbIyRH+UojMZ26v3Cc20Lvyr3tOPxjAmbm0BSgtlzKoIKEhUcAcBpDOYUPvuclefYiNVubcl4IvfMMAKyYGQ7F6w7MrfO7nGl9Yq1ZksK4sJBXS5w8NCMsNAH1JDtvEB2My6ibAGDkefxbGJUZWd4du75+K7KKHvvHPZjhTthvrPkWCysoPTd4OAAkl86FL9bjFXfshYs3O4A4ddaXnQfbwXTFK6cVx79SqaOR6wdJm3Q2NZ5Zh6qNcTEchw4IwmDtuHBrkIUiiqkxwEiWooDtRmOp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hc49WgGySksBJuWt8fLViufxPVv6wcdCUMNI7AfRy2ciPVu80A1Lvuyq9Z6+?=
 =?us-ascii?Q?s0Tz8OTpipfSt3eEhP1h5Ahkx0TGBy4K94OJFzAyhxc6qo+dxUAgzIP9j/vw?=
 =?us-ascii?Q?yfMRiRKFHXSVSo7OtpvdjVHQq6OhFqUOvT70hc/Iosmv42hDrPv7GZysyvZM?=
 =?us-ascii?Q?HnvYCd/nbIxceNzQtZilVzY7YNB5YmBfUIeIWsBOQURim+n7BiMvmd8mQK0q?=
 =?us-ascii?Q?MnS/n2AzBjAeNDmW5Dj8/IOjr7J1bomgtQXDVWAiz4NxzBCy1yLZAxqDXoxS?=
 =?us-ascii?Q?w1+o74p4+Vi4TqTYrPVRrkah2Aj7nId4D4laIs7sGVppdw3CqUfdwTTmzdsa?=
 =?us-ascii?Q?Vot9n1i3OhTQy+LnCzKjL1p/45BW1hoPrbsk/rXC76psWHgPwaEOH8N1FGff?=
 =?us-ascii?Q?7jH9HKg2XZCCpUcEFAnz8dv+aMjLVfdZEDBUdoATaRNoQaXtmodm61GonHGs?=
 =?us-ascii?Q?jS4GHPzX8vYWOV2bse2THukfh4N/6f7bCMHEVKRqB5xObh9YDs0cBbntDlPV?=
 =?us-ascii?Q?i/G7I2lMDykab2iWrwNWnJgSn6LoIyTW+wiC/tmPz+srW/aOa7ntdvWABV4+?=
 =?us-ascii?Q?XwuJHAZTtIhzeW6/X4gTn1TsZ9KuxbqGYCJO8MHvvHH1xYHdtDmEiXsZplBz?=
 =?us-ascii?Q?YUyw3EY61py5O+mf+bjguA6a9EX2BSVA+bHRkUt/x2opm4FC/y2DRxtrTrkq?=
 =?us-ascii?Q?j33oJeixjavu0qYxaw7hVKFB8t3pyn2b6mqPDs2UtR+RY8kd39IODvqf1bMW?=
 =?us-ascii?Q?0JwYcZ6Wi1Rjg9ZXUu00MaLCVn0gKxBwLVWDvvN19hRbV8Q9sX+XCoSwC1GD?=
 =?us-ascii?Q?7J5Znk1EgIDzTQzQq2H3gMG5DdJW2IQBgXnCK9SpF25VrWcxRcjBIgFmbnXA?=
 =?us-ascii?Q?tMbuZqDJRRMCDb9pTV0fhBXF6pI+oTJy988gULLN69Pa4fJGespUJ9gatKkk?=
 =?us-ascii?Q?saYfOZy2H60bgwwo6oB5N0s1rHqo6RP+sC7FlmA2F6AO45yJefTercbdjtFH?=
 =?us-ascii?Q?3h489vISuuM7ZSFoXHTSgAVhmt6z3eofxAQhO7PJfr3TutO7CoY5U0oJyjdW?=
 =?us-ascii?Q?1d7fUrpGusvCy5/w+SRPbdXy6kdJWrt48KRFKDpjMzclXytKIj7LOJnMgSbn?=
 =?us-ascii?Q?CSpkaUgDpxb3BTJMspD1HxVT/+rNduqHGudtqELkOTCZjhKuEaxrPV7yMC15?=
 =?us-ascii?Q?gNVJ4xtKFBPAMW7KQQfQi3ufyKUtLG34kPIuhZeuLwcWcoR8/St5wvkrYSfu?=
 =?us-ascii?Q?qDFC3INB32OK0FmY5GdoLWdH3ONvPPBn8wzBshohYaqtubgPJgAMGx1yjwKK?=
 =?us-ascii?Q?IDiYbXA33DPHAxM6QfCiGpKfJhfVz4+vhHWFWSRipUY03Kje3vi/WgthbhDo?=
 =?us-ascii?Q?HdFKhNOnMlXhZNW1beDzGMcKuOjXr7Lz8j2OjRJKg1SU5cIZT3lA2o7bADmp?=
 =?us-ascii?Q?AmBE7J9/g/2XBXo3ZcKC+Zo5ePxR0SEiRk8C+gLQE3GzWBAX+jzvZ4LzPQSk?=
 =?us-ascii?Q?bweDMxVm6WiRifcEZpLBrC3GtJecQ9mz5fGxGma/jsuueTwqWcXxxHhUcAhf?=
 =?us-ascii?Q?iCPXtBkcciYpOudYfDdmGqscNElWx27+aGyjlkRjMVwR9tAp7RsgMnR/m3j7?=
 =?us-ascii?Q?s4s9MCDD3ynp6U/8xSjZ78sP3qSTPT0dcf9HmA6ipHFuX5l3z5jG4rSRd2le?=
 =?us-ascii?Q?FyQWp67z1IKX++lJzZe/MZzYlx6u/laWnC6CVQlNtakZp+kL6al4mOwOnPAU?=
 =?us-ascii?Q?w2RsbJKgug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UCuYvNDoBQONLSdPUDgmnro+3Zg684TzKpzKGvFaFbdlgrJkWKxdiRZnW3egZ3Rp7o+vPOPha/HEWdtTZG48Vola0DJmR65X0pMTbUvJde0wsuzlrk/qy72oXH3gOjVUVavqDmJz9r61yhYDou9aX/TAUFg5ykWMP3F81l8w8T9FShSw1MLrx+HunRO225XO3uFo9ql/ykqdcRELXj6LCIbiWNzZsqf88nKAvxslpF08wkak7UrfkNRC4DDetYbRnY1GNDwPBZo7twEHQ/sFD0a492cF5nqp1HuMCIbp/pmv6EvmSoLczJ+8TNcbsxlipSQ0OierPQGQhaacSBfVKQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb01e00f-fc16-4349-75d8-08de9e788faa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 01:02:57.6288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnvRmKYKogki8jTObNeroogR2wU3+SbMz2K7ng4H1+oirw11Pchn9rAEQ4TKY8hQdEbcQuNUSwgV4NWtOrG9MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8400
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Maciej Strozek <mstrozek@opensource.cirrus.com>
> Sent: Friday, April 17, 2026 10:45 PM
> To: Mark Brown <broonie@kernel.org>; Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>; Bard Liao <yung-
> chuan.liao@linux.intel.com>; linux-kernel@vger.kernel.org; linux-
> sound@vger.kernel.org; patches@opensource.cirrus.com; Maciej Strozek
> <mstrozek@opensource.cirrus.com>
> Subject: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to b=
e
> combined
>=20
> Move handling of cs42l43-spk component string into SOF mechanism [1]
> which will allow it to be aggregated with other speakers.
> Likewise handle the cs35l56-bridge special case which should not be
> combined to keep compatibility with UCM.
>=20
> Link: https://github.com/thesofproject/linux/pull/5445 [1]
> Link: https://github.com/alsa-project/alsa-ucm-conf/pull/747
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

> ---
>  sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c |  6 ------
>  sound/soc/sdw_utils/soc_sdw_cs42l43.c        | 10 ----------
>  sound/soc/sdw_utils/soc_sdw_utils.c          | 20 ++++++++++++++++----
>  3 files changed, 16 insertions(+), 20 deletions(-)
>=20
> diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> index 2a7109d53cbe3..e0e32a279787c 100644
> --- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> +++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
> @@ -40,12 +40,6 @@ static int asoc_sdw_bridge_cs35l56_asp_init(struct
> snd_soc_pcm_runtime *rtd)
>  	struct snd_soc_dai *codec_dai;
>  	struct snd_soc_dai *cpu_dai;
>=20
> -	card->components =3D devm_kasprintf(card->dev, GFP_KERNEL,
> -					  "%s spk:cs35l56-bridge",
> -					  card->components);
> -	if (!card->components)
> -		return -ENOMEM;
> -
>  	ret =3D snd_soc_dapm_new_controls(dapm, bridge_widgets,
>  					ARRAY_SIZE(bridge_widgets));
>  	if (ret) {
> diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> index 4a451b9d4f137..66aa9958ad184 100644
> --- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> +++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
> @@ -110,18 +110,8 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct
> snd_soc_pcm_runtime *rtd, struct snd_so
>  	struct snd_soc_component *component =3D snd_soc_rtd_to_codec(rtd,
> 0)->component;
>  	struct snd_soc_card *card =3D rtd->card;
>  	struct snd_soc_dapm_context *dapm =3D
> snd_soc_card_to_dapm(card);
> -	struct asoc_sdw_mc_private *ctx =3D snd_soc_card_get_drvdata(card);
>  	int ret;
>=20
> -	if (!(ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS)) {
> -		/* Will be set by the bridge code in this case */
> -		card->components =3D devm_kasprintf(card->dev, GFP_KERNEL,
> -						  "%s spk:cs42l43-spk",
> -						  card->components);
> -		if (!card->components)
> -			return -ENOMEM;
> -	}
> -
>  	ret =3D snd_soc_limit_volume(card, "cs42l43 Speaker Digital Volume",
>  				   CS42L43_SPK_VOLUME_0DB);
>  	if (ret)
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c
> b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 2807f536eef0c..1637cc3f3d598 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -758,6 +758,7 @@ struct asoc_sdw_codec_info codec_info_list[] =3D {
>  			{
>  				.direction =3D {true, false},
>  				.codec_name =3D "cs42l43-codec",
> +				.component_name =3D "cs42l43-spk",
>  				.dai_name =3D "cs42l43-dp6",
>  				.dai_type =3D SOC_SDW_DAI_TYPE_AMP,
>  				.dailink =3D {SOC_SDW_AMP_OUT_DAI_ID,
> SOC_SDW_UNUSED_DAI_ID},
> @@ -1104,6 +1105,7 @@ static int
> asoc_sdw_find_codec_info_dai_index(const struct asoc_sdw_codec_info *
>  int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_card *card =3D rtd->card;
> +	struct asoc_sdw_mc_private *ctx =3D snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dapm_context *dapm =3D
> snd_soc_card_to_dapm(card);
>  	struct asoc_sdw_codec_info *codec_info;
>  	struct snd_soc_dai *dai;
> @@ -1179,16 +1181,26 @@ int asoc_sdw_rtd_init(struct
> snd_soc_pcm_runtime *rtd)
>  		/* Generate the spk component string for card->components
> string */
>  		if (codec_info->dais[dai_index].dai_type =3D=3D
> SOC_SDW_DAI_TYPE_AMP &&
>  		    codec_info->dais[dai_index].component_name) {
> +			const char *component;
> +
> +			/*
> +			 * For the special case of cs42l43 with sidecar amps,
> use only
> +			 * "cs35l56-bridge" as the component name in card-
> >components
> +			 */
> +			if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS &&
> +			    !strcmp(codec_info-
> >dais[dai_index].component_name, "cs42l43-spk"))
> +				component =3D "cs35l56-bridge";
> +			else
> +				component =3D codec_info-
> >dais[dai_index].component_name;
> +
>  			if (strlen (spk_components) =3D=3D 0)
>  				spk_components =3D
> -					devm_kasprintf(card->dev,
> GFP_KERNEL, "%s",
> -						       codec_info-
> >dais[dai_index].component_name);
> +					devm_kasprintf(card->dev,
> GFP_KERNEL, "%s", component);
>  			else
>  				/* Append component name to
> spk_components */
>  				spk_components =3D
>  					devm_kasprintf(card->dev,
> GFP_KERNEL,
> -						       "%s+%s",
> spk_components,
> -						       codec_info-
> >dais[dai_index].component_name);
> +						       "%s+%s",
> spk_components, component);
>  		}
>=20
>  		codec_info->dais[dai_index].rtd_init_done =3D true;
> --
> 2.47.3
>=20

