Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D42FFDCC;
	Sun,  5 Jul 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783255754; cv=fail; b=gabGrXkeGwYIRGVnsno5XtLB9Tvmee4Kos5ZnrQOFValWwrPnPcfz4PaXtUI2nAPho1ioOMhjtLKsW45wSpdCtOt4AVPT8HCzEh2i2LLhBkUMYISsvSNZoR2uoZNeQDH3z4BXFsjDwyCkLGckqBjM2JrkxW0DijhCHg5jkFUX8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783255754; c=relaxed/simple;
	bh=dEvjJ5aWe6nuRn3deBnWGhkHgetlhxhqVcWE+mvOMTE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pEiydMjgnsyzl8KuEtVGGJ+weEfz895f4jxAxnkVmJDADHErlRw3RxBYE8CH2xZyALA3JJBMqtfUQpdkMRMGiOeL3CBdDsOI/mdMLh0kQxPRQ8LMhcgZ9gkuqh9DqTqPRYzjF1OfgOc3ozk9KyTZDz++r86tqBAvEX6K9zGPZLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYFFAvLM; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYFFAvLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783255751; x=1814791751;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dEvjJ5aWe6nuRn3deBnWGhkHgetlhxhqVcWE+mvOMTE=;
  b=lYFFAvLMMrmPywTVuz/gOKrINWHKKtEBC1MpxO1WcO7b0oQJo+fEXJmP
   CtVXSyvT0UlJIvg2p3cx8F41Q+swVyxNVCns/h2iLboTsSfTsxKqnbqX1
   1c5QGgBqWkhmneuDCOzXIkObzQ3mNCLNMItfo3ZorSGNB1DdtuRqsQwmL
   5mVFq2RMiQWck19M1zMVMlK4JPStT1hEUqo1UmCvVv4wsd6ieF7VLQuYG
   Wa74PUV19XSeqCY++5neWKBHO2WbwdyOJemRVpiCCFnRbGkE3xS7FkI8d
   fG4NGxKdy89D+IpSubnZVcnYhgI5d5yOlglYNPW1JXFWESGOTuvJqYZOi
   g==;
X-CSE-ConnectionGUID: 9nL4b2QfSveBXPY8NNO9RA==
X-CSE-MsgGUID: BWfZ7zXyStOCINap1jhQfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94559561"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94559561"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 05:49:11 -0700
X-CSE-ConnectionGUID: W3Y92rv+RMGpykywzqQZlQ==
X-CSE-MsgGUID: Sa/QDTThTAmJDEpQ8uAFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="247093276"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 05:49:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 5 Jul 2026 05:49:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 5 Jul 2026 05:49:10 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 5 Jul 2026 05:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epGgOzhXForovL/Ros00YkYA2Fun0+VgT/mg3yD0hdlDhVd6YkoMAvHC1+EJA/4+Aj2aBi63FnHAnciyOwuAXP+l7bZlFQ9qj+ELfI6mJabTVUNV/5OkBms0FY8qCWZlguMTsf4X50cTncTBXmMacv7lRf8upssb1WJYl19oT27V4v7Lmvk0rClK4kdXfjkvhhh4ZXlAupxc2hFtlC2vuOxBF0jzMEH7lGpSFuHegeoUCKkLk/Q3bzIsbo7k0m5CTvbUoevsvUY/15OqhEVHsDzhLDtVsvAu93KRcekQqiicLlPhqkCiDvKcKKDQO8KhMFEhtVZVeopIc86O6VVJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIz6R35ROBkcqiwOLbbz8R4W9ibJKUz+9zDWAXCLxs8=;
 b=M7EcdcZhz/zkIRyTeanNEIUcvnFd7CDGlvTXGC6KAFyFedbowij6eDRw7VpEe7BJDqcI8KbYggGMSfaJPrIRcLKFxpW0eEylLv9uf0fSU1xs+xOWAS2RrpEQRoaXfyHhOq3H7fTq561Ig56eisTk5i4td/+fcK/iGeU19h6wiiT6m1yJy60AhueS3zzh4K1nljxZOyQ8eQMOQKwBSwnQEbd7nBmkXuWY6JDEfaCu9BY8Shvy3sgc7bwSD5KntpA2gUAkb4M4FoYVMD2cZkLhjK13JPJPgU6+OxPOrZuRBHIqlmBe8CEL62osRU8MwKU27hf2iJ/3CThekoUrQMYxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Sun, 5 Jul 2026
 12:49:05 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0181.008; Sun, 5 Jul 2026
 12:49:05 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Marco Griep <mail@marcogriep.de>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Charles
 Keepax" <ckeepax@opensource.cirrus.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ASoC: sdw_utils: Add RT721 speaker component tag
Thread-Topic: [PATCH] ASoC: sdw_utils: Add RT721 speaker component tag
Thread-Index: AQHdC7PvDxHJxu5jb0S4ty1Mn2qUJLZe4BmQ
Date: Sun, 5 Jul 2026 12:49:05 +0000
Message-ID: <SJ2PR11MB8424C0407CEC9D51F2C9EF5FFFF22@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <30dd273a.AVwAAJ-gc7kAAAAAAAAABGg7al0AAYKJ_u4AAAAAADQlJwBqSQHg@mailjet.com>
In-Reply-To: <30dd273a.AVwAAJ-gc7kAAAAAAAAABGg7al0AAYKJ_u4AAAAAADQlJwBqSQHg@mailjet.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|PH7PR11MB5958:EE_
x-ms-office365-filtering-correlation-id: eb8b1be1-4645-486a-1458-08deda93cc41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: QubK4G/QYPX9aql+WkYz8MXX7/yPwPVr6eWAWjvDoFF6aork6yxvTnNymOqlpwGCNLjJLdlbNcTo5urGrEOWN+KeVDXO9fJROCrrxJb5YpKsuY72vNGnz5gGi9B/bXAO7SOC4iDVqYwhErZGMIIhHpTEaCMxYTrjjvN2/PUUPJpUVKXpYBNchrzqkZ9grbyhJykW0QrE9skvLF3u8gdnmf3iGE3AXOiow5ntuHknIcFEkqdwlp4pkz1moqUVQjYbW9S1YP82iJ56+dDKp5Iw4WLGt8MZMn9PBI9Ki/n1jw+59jpgAULqNPzsWkKnkAvPwIyJhhbVqByJ3Ewfy6nBTduc608apKJSEmL/X/ludBjEbr9k0jcesDhF6UYDr9cmMZh4AW+TjeHr4+8yNoNcZ2i2nGEW06yE7kAh3C4AwUQ5oXS5AhqD/pRZaUiwYy5cwpdJ6idPFNhP2dyrooYaRvM93FIicnnZO8TLWVYlnvbOLxlP9UrUDyutOR5WKotBpvfuw5K9C+kqlX4lu13xQZwwILSipiESEfcuk1BRBm5O3EvTzhHtWPOKJKSq/dAB/W985xx3nv9QBedIe7h4t0uZU4PGc+rbjfVGBVCgg+K7/FtM9XV0B8HJncVChizyYo68x8z8z18ROt1ZOzDfqLMkfEL8JwJKnO8dt5yLxGlLlnZ6B90VrWrzL7LEZvPN0FXrWQ1Ti5nFpxkW2WgMyVU01k7DF8t3GVENx53k/V4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NBTMFi6EgWNT1zHaPoJvE+plk6YWga610R4RKf8YvFQvmlx6New5xYCbFJbY?=
 =?us-ascii?Q?Uubu0l88eH2OC4CD9WQEGeFRfcVrB9/cD7YvUj6ZMlcZkLf2Hpl6MfubeXTu?=
 =?us-ascii?Q?LxLpBNof/42g+LGi1pm3QcqMaAwmCMpmQOudxPQ6IGVEZaLwLsfYC43RQCku?=
 =?us-ascii?Q?MZiYwSGGj5dtH6zxVrThaoJOiXMH6HlS+np3TqnsiImJGnhuuI93c5rd15NC?=
 =?us-ascii?Q?reTn3SG7xqE8UBFGPccHBqCGzH7JfFgp90maMHv/8hYzdcodEdHmBfc8Jynj?=
 =?us-ascii?Q?rJ91DLZeyS0Fbo6my5foEBBwJBen4+pPrR2H5I6lVYw0juF0+OPrlSlRJm29?=
 =?us-ascii?Q?cuY37SWXU9baGkHRhq8tdTWtX46siJQA2xQXWF594eJKHwnlq/M4VUjcQ6jQ?=
 =?us-ascii?Q?FhU84gXgnFIixo1HTYeDntnYQifzM9oKTvxcRUmkti3J/PtkByKO/wiR+GNU?=
 =?us-ascii?Q?d/1CQtXQXXGopelMnAXPhw4M+UJ0e/C3TEpbqDpPJ4GGguheqeaLkfyv8tTh?=
 =?us-ascii?Q?DRuiMuBYnaQrI5dHL6ORLgwmSdiNXYkoDR7GF/fH+J7FWvq0O9vIMl0i8yC+?=
 =?us-ascii?Q?bukIU/44TK9yCrkPeaEzGOC5P3GA9fenyvmWfoBSwL8kKInijY6TP7C0FiPx?=
 =?us-ascii?Q?ZElNep03d398m18/ZHuXPPVfO+60ro09t26aGyDnfwU926mq4cWdTBW/wNoV?=
 =?us-ascii?Q?oU47FcDP48sI7EeqtiAV05eBLdIhalhV3VQ/X7bm6mJS7SVD0dkip5f3LRNn?=
 =?us-ascii?Q?hMgBle5s9SY18cKXcEymOZ2gWGxH0yDUTxBltTQuMprs+prjGkiOaHLHPu6S?=
 =?us-ascii?Q?NX/EGCOtxKaRuuAIK9306hWV/eKTRBbDjgCpaHh8gn9PT0lIqKGSkX3cO6f5?=
 =?us-ascii?Q?DkPjxinDwgZdV5YbH4f8TTRWUUAdx7fTmxsmspQQ8v6bv87isZQFJlp0re4+?=
 =?us-ascii?Q?aTPjA2eKvNYFFrzaRCOYlGW58MxaTrXnhFrznvMI273JBcvIL+CU4EViUD80?=
 =?us-ascii?Q?DANlkJdPPSdV9I5VBwajHHOSLMcBT699t3lyEHf5bHhSI4INjGrki67KV7te?=
 =?us-ascii?Q?X5Kt+tFs2sc9yCzdWu08UoTwrMMfy95ZiZFoPNtYll/UJALfY7ktWaFpSSgs?=
 =?us-ascii?Q?IWDCW/Ww+VODXwGtsyQnbCyQroKuOlqhECj6JYuVWfjCt2JFgK5X3G/abk6A?=
 =?us-ascii?Q?2SLNtyaDnu7YwnHdx4bDd5q/7mq5TM7lzSiYZm/wtJcBvPLLxv5+qsPBjtFJ?=
 =?us-ascii?Q?UG4Ju4NzXijxS6XJEsm/61JTeyhlo7V+vCl2EvOZmGab1cvHbYn1rtlbz1Qc?=
 =?us-ascii?Q?q4KkJM6RpiXnXt+IBG1yExUMz7FhhHCbsy6/dkxL2LMdxCAvxniIuM3VzJru?=
 =?us-ascii?Q?YHrcvqhPuNmu5nooZgr50VBgCW10GwGywBFEPFdBTEoqS/UFRH4Rlb61JUi7?=
 =?us-ascii?Q?dzOiUdccADqs7RAtn3sEcYWcKMGOyOkqb4FO80xfiN23407oIFWoKZfOsQS/?=
 =?us-ascii?Q?MkznjuMLZjiolOubhOgfFJxvB5oooCZVI/6Vp2icvaxXVWZiq6C7mHR5l7l9?=
 =?us-ascii?Q?XARTYE4u89XQitmVYxVJ4BgnxAzqk5eFi8Zl/duBTe1NVoTwM/Z4pZNZgPYe?=
 =?us-ascii?Q?Dijeuu9mP5x+J9wSRRwoGHeQxWMqq2oVpF4VAiQo3pWGMiCx/xLsTeBYrbFh?=
 =?us-ascii?Q?rz4lIVWYHdsf++1r/qnWKvJ0XC0DV85TudC+vi1K8aUKcNjR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: osDbd24lYoJEaR7yaOX965Co3+eQokwZ2fgKv0s8h2XEy/51PffXLgShu7jOM2VqEy3DtXD4OkonbyVWfA1X5ri+f30sEM39SNfak+1LVdo4j+IILKedRTzaHOLV1mAThMm9nd0lwkW+fwGe7P6Q750cLQyYUOfrv64auTMbBvFzkvvcn9wSfW0huDrRDYnjKaNLH4XrBZAzCVHTeDypJKdgy5lNaJmYTEpa0VuqFNQw2Hs6wawAXMhdEH76DZKa0GmGK0QqgznSDtvTWjavJ+lrLEwLW/5mrmywG2zRToSvVqjQe4o+fJ1wNtWduJEDJe1zv36IJuFLpXX3TmK5nw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8b1be1-4645-486a-1458-08deda93cc41
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2026 12:49:05.4950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZlm/0urpeIS74WyPQmRoTV+gFljw1yso04wiw6wSFxEwDlNwPgn7wk6cgd8OS4b1prrh4DFX+DQH6EUWf6OqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Marco Griep <mail@marcogriep.de>
> Sent: Saturday, July 4, 2026 8:51 PM
> To: Mark Brown <broonie@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Char=
les
> Keepax <ckeepax@opensource.cirrus.com>; Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com>; linux-sound@vger.kernel.org; linux-
> kernel@vger.kernel.org; Marco Griep <mail@marcogriep.de>
> Subject: [PATCH] ASoC: sdw_utils: Add RT721 speaker component tag
>=20
> The RT721 multifunction SDCA speaker helper adds the DAPM routes for
> its internal speaker path, but it does not add the corresponding
> spk:rt721 token to card->components.

.component_name =3D "rt721", is set in the rt721 codec info in
codec_info_list[]. And the "spk" tag will be added in the
asoc_sdw_rtd_init() function. Doesn't it work on your device?

>=20
> UCM uses that token to include the RT721 speaker device. Without it,
> systems with standalone RT721 expose the ALSA SmartAmp PCM but PipeWire
> only sees the headset devices.
>=20
> Append the speaker codec token from the RT721 multifunction SDCA speaker
> runtime init path so UCM can create the internal speaker route.
>=20
> Tested on an ASUS Vivobook S16 M3607GA with ACP70 SoundWire RT721-SDCA.
> With the standalone RT721 ACP70 machine entry, this makes the HiFi
> profile expose Speaker, Headphones, internal Mic and Headset devices.
>=20
> Signed-off-by: Marco Griep <mail@marcogriep.de>
> ---
>  sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
> b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
> index 5bf3627a97a0..e895397eefd6 100644
> --- a/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
> +++ b/sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c
> @@ -74,6 +74,12 @@ int asoc_sdw_rt_mf_sdca_spk_rtd_init(struct
> snd_soc_pcm_runtime *rtd, struct snd
>  		return -EINVAL;
>  	}
>=20
> +	card->components =3D devm_kasprintf(card->dev, GFP_KERNEL,
> +					  "%s spk:%s",
> +					  card->components, codec_name);
> +	if (!card->components)
> +		return -ENOMEM;
> +
>  	/* Add routes */
>  	ret =3D snd_soc_dapm_add_routes(dapm, route_map->route_map,
> route_map->route_size);
>  	if (ret)
>=20
> base-commit: 1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
> --
> 2.55.0
>=20

