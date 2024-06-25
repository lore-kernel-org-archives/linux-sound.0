Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4A1494A0
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719316262; cv=fail; b=VdG6VFK+hWTlNlUH/qSzq3G+d/H7bua9G7dyoqb5uigFxo3eg6WWKSzNfbz4CwxAssQdp2B6D2pHo/G57LDqIs/o660EB1vhMnQCSb3CiTJwA8IfsHJqU2td388Gec1fbjLZosgvQsVOTiq9PckLU6AUBvkRn2zTptLZjcc7Ua4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719316262; c=relaxed/simple;
	bh=lN4Trkr9LSt/6pp7szc8tvDDtKHnz39Rf+LtdayqA2s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fFzaqmWA+OGPzFvlyZBSORXKZgrvJG70QSFbCdqpDfzo8MAfT/bxUeXFIaZB9SZ9Pe1D/nIo2ZXiIlCl4jNm+V+AVuHgG2LR2oQhGn8lWMg/Rtz81h3GgEGPe9KqRUsCHRSVuX/MzP+DphryoRVsdbBs/jCU1S4EHJ1upqSdvP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1pD36KF; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1pD36KF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719316260; x=1750852260;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lN4Trkr9LSt/6pp7szc8tvDDtKHnz39Rf+LtdayqA2s=;
  b=m1pD36KFL7XW5pM4k+kJntJnhhIydwi/ooOAgtSQuT6qBHXnjfeh+zim
   LIauGw6v7WNuAZV9SAaJJCIE2sFX0jYouH3xU05ZlhcSfUi9WrXXVrvxZ
   fyeCR3pfaJpCAEVXsGq8taDYcMgOSzIPM+b1L+0xXV3MuGeJtfd4gqUka
   fEOONHec8g+HUcUbwfFnTqgs35BrO16w+oTRtHaVDDa2BGyXlZLyUkxDH
   CbVO2r6YCu2M6UO34EHj/TmJfrZgzBu2L+LGY0AzYQhNsZqcfKFIC7l+l
   HhWJdjwe6xxykHbrNLe1OGQsYUIizsmixXdXHu8juAqCB+W2xZpS0G9dK
   Q==;
X-CSE-ConnectionGUID: wAdxaK4sTp2YejaFhScT3g==
X-CSE-MsgGUID: O4fEswSBSEOFjaErF5kYZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="38840275"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="38840275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 04:50:58 -0700
X-CSE-ConnectionGUID: 0Y83FmJIRI+cYMp8IulIbg==
X-CSE-MsgGUID: 8wDMm/OVTtKEnJ2GOCuyug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="48614010"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jun 2024 04:50:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 04:50:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 04:50:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 04:50:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLI4pHx2KhuBhEohsCak7itYUzuj8sksn493Yc8I3P8brzU6oaIXHaaXSIoqDL2ftz7oe6qlZIdwSqX2m14Qf2Qw1eDNz/G4gf/UXkRUG8ELhOeuEQfayzCUmr2KEq/hC3x9mvggkcBEeEPArG7AqqZFHR7LvpQKdTeXEGgoIG8Pqxr/oQzXFU1F6EqcZmTME0hhiB05wIGXh1VaxUy25qEOFxShlFywCczorj36B5npEfvCurfm2+FSHm6eYO+9JS4xgmb+0170bseFpBlEEu6vGdPkVLjz33PtMFHeafkWYbkos2FmEY5gdRqlc+mg7cYGWX9tFz3cXBI5iAniuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KqW9gVyaQmSZnkb/M2fFyFDP6P1uYa4p87YtHVGf9w=;
 b=m7kkZHvCsLIROgcqHMrAThGsNy04c2Mv6cnlQFRt6nE7qELilvkaPywXIX4ny0xtRuqaMkIcNTQBLW0OtyShwbPNQmHv93GRXJehT1wtx9U3zk+DCM2t2lBdUckmCBKvNiSA1iJO/gnPaL4HA81Ia8nXpW+sHSQdYFSsDgeMPrEIcgANXxQndXxF+ZYAHmgSidbzvcXlThflBeLuHYSCHpjU106mjzUnITWVrxO2AMIcn6DYwzwNm5ihrclBpb00DHfqylxqdotwLKHfbDAPDLx/l3pIErSEpUADs3ldnCp6GuyxORdC+a7cY2QiPaT7UZYecxAD+4BOynKpW5SFYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 11:50:55 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 11:50:55 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: "shumingf@realtek.com" <shumingf@realtek.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"lars@metafoo.de" <lars@metafoo.de>, "flove@realtek.com" <flove@realtek.com>,
	"oder_chiou@realtek.com" <oder_chiou@realtek.com>, "jack.yu@realtek.com"
	<jack.yu@realtek.com>, "derek.fang@realtek.com" <derek.fang@realtek.com>,
	"Bossart, Pierre-louis" <pierre-louis.bossart@intel.com>
Subject: RE: [PATCH v2] ASoC: rt711-sdca: add GE selected mode control
Thread-Topic: [PATCH v2] ASoC: rt711-sdca: add GE selected mode control
Thread-Index: AQHaxtvEwrCksjOAuUK0xwllnhBEo7HYXdmQ
Date: Tue, 25 Jun 2024 11:50:55 +0000
Message-ID: <SJ2PR11MB84249A6453A820F787009134FFD52@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20240625084303.2273911-1-shumingf@realtek.com>
In-Reply-To: <20240625084303.2273911-1-shumingf@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|PH7PR11MB8059:EE_
x-ms-office365-filtering-correlation-id: 4ec4eafd-f59a-46cd-b65a-08dc950d1299
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|1800799021|376011|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?tAXqy93sAAIK/LsNq/grOUC7bq8i6w45T7GiOQLRqmGvYefYp6FuasRY6TN+?=
 =?us-ascii?Q?LMSaQ9IAEH8O0E08moLz86qP4szO5QYVNcA4V0ZKM6RHhO0VFmBeny23rd+1?=
 =?us-ascii?Q?Leu+/Cuez/gHrxGicNKMixllkXePtB6YYQBmnLbw+NSj6Pqqhl5ZLLI81C5u?=
 =?us-ascii?Q?XLpw0KxDxjsI3cHD6NkOUEow5eqenVCmj7d4nYBtltJyzIJTJToGngqGgrbZ?=
 =?us-ascii?Q?+i1fIojY/pnFe1+cIQUym8CSYKhXuCvJXh7lnBxWvWb5odibSSOTPo/qGS9h?=
 =?us-ascii?Q?lnsl47b+QZrcpDiem9SZAwpRvcTXyx8kfQ3qwLIRE0PFNnwQiNAx4zl6pRCK?=
 =?us-ascii?Q?3uH5ZWdr4YwClTI5aaxkQx7Mdkdiuwh+9iHrtGeor5135iG8HgYTmImEW9nO?=
 =?us-ascii?Q?AYekfMy9D4gqEf6UinnFBx0h8IT5ksjX1AuJAMsMaCpZEyggdH5jhhrcxCCg?=
 =?us-ascii?Q?yGBftV2t1fE1lJnHgzFgEBAmtjguf6yhznV/Ot4hPkkMPXUE+FKAINnTjrkW?=
 =?us-ascii?Q?f65TesODN4kd7RL+OelWaBDcC0pq1C6tmhgqfG4i7V0DjXvFEMSPTmhVufuu?=
 =?us-ascii?Q?raHD6/nYG4mlwOjKdk1Y0jxS+7CuKWGJUS5UXTSSmCLAskkhYeFvCfyBT6KV?=
 =?us-ascii?Q?SWuCXymaQDiWL1+eis7cM84qP4MepUb5/irx0E5SngtrHQ1e/i8JSBwoUODB?=
 =?us-ascii?Q?EaQkLyYT+hC3MgWxC5EtTNssoZWlTbJ2Q2RcSWd+thO20WSCv+XRs3j9/s4A?=
 =?us-ascii?Q?kOfikQcW8w5Taf93dEru7Y1LIbaudwuhDiSB7vvbVSPp9ib+koJAFfC9FZ9K?=
 =?us-ascii?Q?r5yAFfPhkL+cansh/w3L10Fi+E2UX1NTBk+ehDwPPQaDOaisnSWt9voEsZ1r?=
 =?us-ascii?Q?Qr6GPNnZKUpaikvQ+t27UYKAPYjfBg0N3slZyFAAyDFiR/8pKhHMm5es6Hno?=
 =?us-ascii?Q?phmJOo3NB0qCr5fK/w+aBxeOUBsXNt9ZTHf/i55zy0TLLF3CmjBCJ0D8imi4?=
 =?us-ascii?Q?pUXMrpBveR3ZSu13n/SR4T5u1Kwwl/Q+CUpJRJWvp9Nz1Q/0cg7I1Z3e05mz?=
 =?us-ascii?Q?9OrSppI0h8YfLr5kHth4wCdIb0i3jtd3nDIetFCWZ1mHtHiQbqOjDxOT3Nvu?=
 =?us-ascii?Q?b3MYcves5Cjud1D8Gb0DB8Mbfsepy+WZOGorJNnUVMyBTm+uy0DnyiAIs3pf?=
 =?us-ascii?Q?RF4IGdeT2mu8RKdK/0U42Ll/ZEZu0dkt9fD9ZLaGtW9oU1BM4gfAoVk/A18P?=
 =?us-ascii?Q?Mhx3GH0I3SidhiOM9F+6rE8fhHbITW9uXfkSE87Zaws/tlRjtpFupYPULyQM?=
 =?us-ascii?Q?GkbqBqUW49+JVwgW5yTsT3CDyVYDvdLlNQnLolRA3kWjJF+27MLwdrwgmHrn?=
 =?us-ascii?Q?IPQUPdw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5iyuem6QIbN/90QL7PQhVpb3DJQ3n2Lr07n082GDQ5ecfLc3s5JWyZAO6qty?=
 =?us-ascii?Q?lqfxDEfI6N+uD0Tf65sZkAzo6Hf3cJ+BHNcE3Eiq2poK9JnqscyIwCS+DSab?=
 =?us-ascii?Q?h79lnUnIpAy1pGOjFGGn1vnFZEWtqqIvtmCeGqnzrczrypTQyfY6CbHIns9z?=
 =?us-ascii?Q?okdPffOH4VSqBgPLuDi3ingffvQh+UtV0XNPD8/OfVBD9xLx/OWlSODZ139H?=
 =?us-ascii?Q?m+FkZ3SZBQtXNIoKdGG4kavZbSG+tg5Z1C2t28rI6KNTz+t8ylOsf9p+vulG?=
 =?us-ascii?Q?BfG9GKGMqujWdw5KnJxc+a9/D4Six02C001L4YAmcax99KNZ6yFB8euW1XhN?=
 =?us-ascii?Q?M+G9i9MsK9dJVB9DUyFksaN6suIef5OYMCvZV+oTbyu7mqU0EBOYam3e+9+W?=
 =?us-ascii?Q?YWSWJ8EVOWAwgb6qQVw/ttyTug3sI7v4ipcV7p0xaLhd9uLQiHpRuuAr1oiL?=
 =?us-ascii?Q?Xjgj0XFk/b3r9sJkxCmKuIQKs86vf+ENaoJJomgttwdfbv8yzxvSwFa0nf+g?=
 =?us-ascii?Q?f1HxF+9HrkUigdi61MBWDmvk7BgLIrd+THL9mvtuEefAqiKF6YaYzoD1ZOte?=
 =?us-ascii?Q?xao7ZXMDWyNPF//+2xVNhgjIfFT8r2RSkSRDJvWfIc69fKJc+cw9PG+cBZlR?=
 =?us-ascii?Q?ts+jGxeHbO/zueogbriUamx79USPSeIBb5zEvKTyddi134h41qMY5vPjo4gx?=
 =?us-ascii?Q?12inCab5VfqAAL477O/Q5lXaJbiV0fs3iLd8EKIXX1zhR8QA2cCd622jdUi6?=
 =?us-ascii?Q?rclJxRNTk14V09YMKwKLDvn8QfRkGB2S9yuQlTqwQO1/kMpt7He+WA1ln2Le?=
 =?us-ascii?Q?nIIWWpokVg8nX1pTY9HHguIwO+i0AE85g4HWLPEVYP6JAa+iLuXOP/DxdI/V?=
 =?us-ascii?Q?tw7pBE++uN48NckIQM6qr6bnkrj2dL/naDg5RU5DNiPV+W5b6ORM7rtnZrBa?=
 =?us-ascii?Q?ElneVZERElYOTuWLAbrPK44LiwaaeRa+QJg9+hiBjJ3Uow8qx3CsshECvces?=
 =?us-ascii?Q?1UZJRJBkaDo+5aUh5x10JJ1SBrYlcIMNzwfzP+zQYIGwU0oN0RYAQY2bjouU?=
 =?us-ascii?Q?mVi78E0Eg0Nb3wnObRwvfett3rj/rn0qiagzL6kZMWbI27bmWkCdSeRyNim2?=
 =?us-ascii?Q?hgmTd/tGYArxBwHJcVevdhzwxtzBiLOfiqQ/QpGjDZExP4MSqabe0OH8MuJU?=
 =?us-ascii?Q?U/Vj+MVT1Gf6awW6MG2A7DbjrbOi+HYkohs0eLawVuVEQ2d9OCT3vh7u/kd6?=
 =?us-ascii?Q?f4iZ9yUrv8O20dOSywXWbNIg3ENeYgrEvGr8p030gGkxbkL7uKBKcy7twvd0?=
 =?us-ascii?Q?Pk9bXIZkXRWbNHmPXhbwb1dVCC8EhrHymdOT8X9SzNjfn5CnflRRZbvhWAv/?=
 =?us-ascii?Q?Mupgo940MBB2NpfZOTNYCbAtUeYMMb1GdB3ivs0g7KQzq6JuItpvyECuxmqH?=
 =?us-ascii?Q?k3jIDImqjLVl3+EcnzPjbI48UI6RDVfmn8TNm2cx9bP8vN2i/CKf0UY+x+NS?=
 =?us-ascii?Q?OckhSjOZ1NxXzVjEMzCJTy1jRwE9SIlp92JK1gWYBURqiQi8Je7WPxqPlnj5?=
 =?us-ascii?Q?95sbW5Avp4zIeDt8rpg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec4eafd-f59a-46cd-b65a-08dc950d1299
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 11:50:55.8653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ytVs7Ex6PCDYrmgEmaXIFIBKxaYKB9cIbtOOOlUteN2HCmM1+IO+SV639rVHI37e6L9mnYPtXbej5BWn+eqTFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: shumingf@realtek.com <shumingf@realtek.com>
> Sent: Tuesday, June 25, 2024 4:43 PM
> To: broonie@kernel.org; lgirdwood@gmail.com
> Cc: linux-sound@vger.kernel.org; lars@metafoo.de; flove@realtek.com;
> oder_chiou@realtek.com; jack.yu@realtek.com; derek.fang@realtek.com;
> Bossart, Pierre-louis <pierre-louis.bossart@intel.com>; Liao, Bard
> <bard.liao@intel.com>; Shuming Fan <shumingf@realtek.com>
> Subject: [PATCH v2] ASoC: rt711-sdca: add GE selected mode control
>=20
> From: Shuming Fan <shumingf@realtek.com>
>=20
> The SDCA spec defines a 'selected_mode' control which can override
> the 'detected_mode' reported by hardware.
> This is useful for platform integration as well as in cases
> where the hardware(e.g. 3.5mm jack cable) is not able to accurately detec=
t the
> jack type.
>=20
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Tested-by: yung-chuan.liao@linux.intel.com

> ---
>  sound/soc/codecs/rt711-sdca.c | 72
> +++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/rt711-sdca.h |  1 +
>  2 files changed, 73 insertions(+)
>=20
> diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.=
c
> index 1e8dbfc3ecd9..dd6ccf17afd4 100644
> --- a/sound/soc/codecs/rt711-sdca.c
> +++ b/sound/soc/codecs/rt711-sdca.c
> @@ -81,6 +81,24 @@ static void rt711_sdca_reset(struct rt711_sdca_priv
> *rt711)
>  		RT711_HDA_LEGACY_RESET_CTL, 0x1, 0x1);
>  }
>=20
> +static void rt711_sdca_ge_force_jack_type(struct rt711_sdca_priv *rt711,
> unsigned int det_mode)
> +{
> +	switch (det_mode) {
> +	case 0x00:
> +		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG,
> RT711_COMBO_JACK_AUTO_CTL1, 0x8400, 0x0000);
> +		rt711_sdca_index_update_bits(rt711,
> RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x10, 0x00);
> +		break;
> +	case 0x03:
> +		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG,
> RT711_COMBO_JACK_AUTO_CTL1, 0x8400, 0x8000);
> +		rt711_sdca_index_update_bits(rt711,
> RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x17, 0x13);
> +		break;
> +	case 0x05:
> +		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG,
> RT711_COMBO_JACK_AUTO_CTL1, 0x8400, 0x8400);
> +		rt711_sdca_index_update_bits(rt711,
> RT711_VENDOR_HDA_CTL, RT711_PUSH_BTN_INT_CTL0, 0x17, 0x15);
> +		break;
> +	}
> +}
> +
>  static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
>  {
>  	unsigned int val, loop_rc =3D 0, loop_dc =3D 0;
> @@ -248,6 +266,8 @@ static int rt711_sdca_headset_detect(struct
> rt711_sdca_priv *rt711)
>  	unsigned int det_mode;
>  	int ret;
>=20
> +	rt711_sdca_ge_force_jack_type(rt711, rt711->ge_mode_override);
> +
>  	/* get detected_mode */
>  	ret =3D regmap_read(rt711->regmap,
>  		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC,
> RT711_SDCA_ENT_GE49, RT711_SDCA_CTL_DETECTED_MODE, 0),
> @@ -790,6 +810,56 @@ static int rt711_sdca_fu0f_capture_put(struct
> snd_kcontrol *kcontrol,
>  	return changed;
>  }
>=20
> +static int rt711_sdca_ge_select_get(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> +	struct snd_soc_component *component =3D
> snd_soc_kcontrol_component(kcontrol);
> +	struct rt711_sdca_priv *rt711 =3D
> snd_soc_component_get_drvdata(component);
> +	unsigned int val, item;
> +
> +	val =3D (rt711->ge_mode_override >> e->shift_l) & e->mask;
> +	item =3D snd_soc_enum_val_to_item(e, val);
> +	ucontrol->value.enumerated.item[0] =3D item;
> +	return 0;
> +}
> +
> +static int rt711_sdca_ge_select_put(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> +	unsigned int *item =3D ucontrol->value.enumerated.item;
> +	struct snd_soc_component *component =3D
> snd_soc_kcontrol_component(kcontrol);
> +	struct rt711_sdca_priv *rt711 =3D
> snd_soc_component_get_drvdata(component);
> +	unsigned int val, change =3D 0;
> +
> +	if (item[0] >=3D e->items)
> +		return -EINVAL;
> +
> +	val =3D snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
> +	if (rt711->ge_mode_override !=3D val) {
> +		rt711->ge_mode_override =3D val;
> +		change =3D 1;
> +	}
> +
> +	return change;
> +}
> +
> +static const char * const rt711_sdca_ge_select[] =3D {
> +	"Auto",
> +	"Headphone",
> +	"Headset",
> +};
> +
> +static int rt711_sdca_ge_select_values[] =3D {
> +	0,
> +	3,
> +	5,
> +};
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(rt711_sdca_ge_mode_enum,
> SND_SOC_NOPM,
> +	0, 0x7, rt711_sdca_ge_select, rt711_sdca_ge_select_values);
> +
>  static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
>  static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
>  static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
> @@ -824,6 +894,8 @@ static const struct snd_kcontrol_new
> rt711_sdca_snd_controls[] =3D {
>  		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY,
> RT711_SDCA_ENT_PLATFORM_FU15, RT711_SDCA_CTL_FU_CH_GAIN,
> CH_R),
>  		8, 3, 0,
>  		rt711_sdca_set_gain_get, rt711_sdca_set_gain_put,
> mic_vol_tlv),
> +	SOC_ENUM_EXT("GE49 Selected Mode",
> rt711_sdca_ge_mode_enum,
> +		rt711_sdca_ge_select_get, rt711_sdca_ge_select_put),
>  };
>=20
>  static int rt711_sdca_mux_get(struct snd_kcontrol *kcontrol,
> diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-
> sdca.h
> index 11d421e8ab2b..15263dcb0314 100644
> --- a/sound/soc/codecs/rt711-sdca.h
> +++ b/sound/soc/codecs/rt711-sdca.h
> @@ -33,6 +33,7 @@ struct  rt711_sdca_priv {
>  	int hw_ver;
>  	bool fu0f_dapm_mute, fu0f_mixer_l_mute, fu0f_mixer_r_mute;
>  	bool fu1e_dapm_mute, fu1e_mixer_l_mute, fu1e_mixer_r_mute;
> +	unsigned int ge_mode_override;
>  };
>=20
>  /* NID */
> --
> 2.34.1

