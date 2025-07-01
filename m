Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022113.outbound.protection.outlook.com [40.107.75.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3DB1CAB3
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 03:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340528; cv=fail; b=lhfAMO5PzEEEqsZf+wkdWQND1jDYoFX3jdNdRdMER2a8WwyI9BSD0zsGO5ED2drJ8kJTaak4ToGNaoh7/xKIT5uLx8kyCb393rUZ5ei+IO9sv3D+nk3zmDt+Urigyz3rB5SU6wiSnrbl/2iB/CWomPPrOxFlHl5f3sd2f4o1K2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340528; c=relaxed/simple;
	bh=+PVwokvnGpjrqESDwP8n7HItwv5p5D96KrQmDe79Kpc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VGnwK+/C891YvWJd5XnWa9OYOakHUeJbP2T7P0ifeUagS54MrsqJBGha6bPMZMhcTKvXVohED7SY6DgfbvXb2F5WPOLtODhh4pIMtfFCP5hvOqnb65p/i5lHXbZl7dGu194SAg/mzxXFtAoKilgDEIyMviE7FaVS+ILZdbGTyMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tp3LEQ4ip1SxBJpMJAg9EQVWq4tOn5bZU9DPYF5Gqb/nWz3/Yeb4E6sG6hIc0g2nLGUHsIsyeW5OkNTlTMstnYO1o+EBKxCc0zjii/V0eO50FlYsZPG49yGBB0aThOajKCY0dJbnCKmGrUKw8l2QzWzjQnOZyQgwyuagcC5ZERHLYNu4C2ByrxRxr/u3ArgkHlHfrQ/7htC4RSFFeWqDpqLVD2ZLu45CBD580JBL96AuzyJbf2QGMU5UdKYwz3M8AMbW+L1BrILUwQbVFsmixZ2JPMaHHwod8sazR/j5biX+hrHfcrljOUM5EUAIsgL3rTr+BuhoFsYcZEH9mMAiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oNHtUAxKvk+DqsSaNCVKAa4u3EitMfyFGEjJk4j0zg=;
 b=Mw9dPLKfZejv+ZoMlzH26VDgsuVJeewOGmeS5SWfXSpkYvaqaPju/B4498DMtwP+lbvEKQAyi4ajt+X5NU3K+8gJyqE8UVRpS9zbR83YHpe4Sn0VI5Cr46VcQJj8Rh9IhOLP5QFOMaf3qsCCLm3Av0Mm5MNQsZkvW5elNo50uKQ+hr6aIx3qexdZyJQWNIiDkA3jlIU2tFS6h9OPXWGRW29GV63Gg+5YP6TulRCLxQYpKHv8q3aTPvE4ZJT+Nm6zDqe+QwopFxTdKajVQ8eX2dxmqLEyBShhNP3R0jJ2OmymaPF4vWCqFFuEvr1mDbPIJNA0MR8adYqFOZOVSxQIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by TYSPR06MB6364.apcprd06.prod.outlook.com (2603:1096:400:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 03:28:40 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 03:28:39 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Kailang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"chris.chiu@canonical.com" <chris.chiu@canonical.com>, Geans_chen
	<geans_chen@realsil.com.cn>
Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Topic: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Index:
 AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaCAABzZAIABmbuQgAAnGgCAB7AeMA==
Date: Tue, 1 Jul 2025 03:28:39 +0000
Message-ID:
 <SEYPR06MB62789527920A36FC01B665988241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
 <87a562wqzu.wl-tiwai@suse.de> <431c41bd52224eb5ac341c9c24d52af1@realtek.com>
 <SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
 <SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <5f2431ca8ef2453daa9da2034798e682@realtek.com>
 <SEYPR06MB62788CE70E017CB5FD7F5317827AA@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <a0d71d7f93a94800881c8c67c9e715f8@realtek.com>
In-Reply-To: <a0d71d7f93a94800881c8c67c9e715f8@realtek.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|TYSPR06MB6364:EE_
x-ms-office365-filtering-correlation-id: d1ffd9b5-036d-4947-eece-08ddb84f5f16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9Y+H3XsYoz4wofEJwo4RgTtYb8vrNhzlatHvYL12OhVl3zMDWyEWiYoCTNuD?=
 =?us-ascii?Q?tp3gpoqi/7XRqDFsqrpi2oCinMqltpS3JgkeqYP1E7Fsvh+MW+t7JheIqaKF?=
 =?us-ascii?Q?BMVKxqEe0LL5a0M2E18HFPVctHV2zV8YwcNy2u+RcfL/TAkqEmrjHi+GUDMt?=
 =?us-ascii?Q?4uB1du6nyRJNHlGg16WutQwdP0yoykizTXojLOKl5W6/AOg1kn5Sh6dJH0iO?=
 =?us-ascii?Q?MsQ6Pj7TXg9LGr8X5DhasIpunPVVrlbmNql/aXEUiZKJlO3cDOb80sWyIWS5?=
 =?us-ascii?Q?JEWiy8uLtBlIhLYGiUuN43m8dAv+AFoGVVM86NzfpHKR5t6WZlHZ/KU+VrcU?=
 =?us-ascii?Q?tS8NENsuhvfWi4uVyINWLUb8clXo0enE9Nqdskwn68HA0JkcsOWcjrTgYpjU?=
 =?us-ascii?Q?5UH7Mk2zWlzHV5N2yhyLY7v9JZbP7ybYxRFwF8RpJst4iphiNkm+48UscogT?=
 =?us-ascii?Q?31AZ5kjlxWFnSlCnPqsd+wpHmd+OfTIG9umW7fmLjGFkWEp5XUfhKgaTsv9v?=
 =?us-ascii?Q?WLxyKM/puyJH/L9j15r05IFJtaq6aFuFdbC9aKUtJOjlGc8kpQ6bAZu8s8K+?=
 =?us-ascii?Q?puLOA3eL7f3p+2fyz9bMEVmGMcvmRxIYC9u3udAulJHkOKBV2nMOavzc/8Ke?=
 =?us-ascii?Q?C0vfjvNS8EcPV0C6w7E5i5GQmVTuYME4VXSBLwBhInd1f6RsSyUSlaq7iHVv?=
 =?us-ascii?Q?qe/yCrJngqfbdVi6sXdnuC1XVYdoVeATCcfrWMVtbbBUMVuJDStgpoL90Ci8?=
 =?us-ascii?Q?V7FC2xT1z2i5m+fdigYhPGEXRWi/abIcVp/KnnKwM8KNHSoeh7joi4KaiJCE?=
 =?us-ascii?Q?8OwV0ZsA+zbIp1yiTRCiKZ7QrxXf3xFBAg7obxvGRd+T7rC6Pf47cAcc+uIT?=
 =?us-ascii?Q?Qu0gZ2h5K++RR3q7yilF+9XG0N2MZwoFF+kENaE7OxCFO0iIBTLEYMNNHMm0?=
 =?us-ascii?Q?lc3ScAhSMMKcKiIjR+fhm9iO8T2baihWdVEivU9tTb7LgauLuRuJL/AJVdII?=
 =?us-ascii?Q?AxGlj9x1Q8xjVLNnk9Pmxcakol4rqaNT+Gi5elQVzHp0AFNbkASF6P1YFla2?=
 =?us-ascii?Q?WIAux7avUiPvbT0P8YSbPQZalyo06zTn56e8T1GF8gslOzoL7Ykg5EggQspr?=
 =?us-ascii?Q?fLYpAYkYa1zJpYH+qhtIKMMqP0JUD9dlC3h1X5hw2qbsgz56DYBEH9L2bQ90?=
 =?us-ascii?Q?lIDDlnQUkDcpkSE8XWkvVWEmrqyT5tCF18Ha64DNc5W91b+vM2enkzsl8SVY?=
 =?us-ascii?Q?s5Fim0gX3Zoq669eRWKjaiXypciSURDoCkv90/v/JBH/J9OKfBpWMQxy+906?=
 =?us-ascii?Q?80wzeUiHd6zUUJ7khkLfwMxWVxwC/emN+C+irFXEjPdVXjjjffeYAa8Uowo7?=
 =?us-ascii?Q?rviYyRrK3Nh3hVtpId6EP2kbkOhobToTXw5PTv8ES2ebOgO7g1ydgqztMmow?=
 =?us-ascii?Q?cErmWw0P2/PTrNECWqGUZWXNBgTsDZW4/ZNlzS0Dfa1fWaE5jDDbHA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wR2cMuWFlVF70U7/jdNQ+TSmtPeSXw1Y7PD9/t6kG/rI9nNDIVj6xEO5XQ+j?=
 =?us-ascii?Q?3Ugay9+MKC5kNVsbFYG0kGpp4KoJJGKRBea1LuboNJLjasKwzTcqZkHgic5k?=
 =?us-ascii?Q?rpVos/kZJouyRIIWAEJmdwQaDMk6JjZ9gA4oMwK3JwAViapzGko9DREtgwF6?=
 =?us-ascii?Q?YqjhgGFiJ2PT31Z9Z90KvQO6eX8rdErbK9O6+UTMZnq59vI2/UzeE0v1ZSwU?=
 =?us-ascii?Q?dUQI9sMN4jFmGBqk00GfeaUhkYjRuWnWpXkJQZT9YdxZ0JtQXMijYvV7YvXV?=
 =?us-ascii?Q?ojUnpbcACE8+0jm/FZk/G1bBCiksoiz4/LXkNO+ugupaaiQ5Ro+dT9F346An?=
 =?us-ascii?Q?L0jgnYpq6uvaTO1KvkGlEPUfOMxcSuu/RjviU2lqa/0HdEwkpgugpKEdZH18?=
 =?us-ascii?Q?Jp40w2+T0C/OwU5JdXWEs/4/wSXELffWpiFU7aNuSAAfyhp2nNCqWBl2Akg9?=
 =?us-ascii?Q?1Yu8mSg4ghmadkt7LVt785VqDTj51AveT2k+/edjzBiahE10TGp4loTYfmPX?=
 =?us-ascii?Q?Y96NGU4L7KbEaMopHHwk2xefNPmAvPIzZl8PpvbYLy9wH9JR87qElkI5sGsH?=
 =?us-ascii?Q?u46Z/te3SQOmsjukSP5znKwPA5jdDPACqO2I40zGHOq+4ddrCxhUfxLhnge9?=
 =?us-ascii?Q?ENLEr96kCAbA4ET9aslNpqJ3LQEtv9pCURCrPT8wfPh0IIuzs9ivSkA1xzAL?=
 =?us-ascii?Q?CcD9olhCdf/ahQCu6e4DLZRxoxhA3GD5gyD16b6ZSXVczWQVvTw3ZK/GqpbQ?=
 =?us-ascii?Q?kYPqws3ptp3kZV9IgZ8OGkNVlNwAtAeuBKNfc5kK3KmMlNgfPnBFHMInsvow?=
 =?us-ascii?Q?0yGAz03VbI5UnUqlbHkLoYRBs4A3kS1GREcQ1wZ84FUdIhNnIF/yCMDqyXS/?=
 =?us-ascii?Q?cdhm4JKdFXBAjWviDayRbQxivoJ5VAKKZZzviHXOiFC+tfFVCh71wkply2uX?=
 =?us-ascii?Q?0KtXt5XS8LUz9En+LBdOcys5xMMnQhLe1JRaDOx7dRz3UHVIyrkC3Itvqnf7?=
 =?us-ascii?Q?Yy8o31XqTp0pCJ3vvpT/X2f9Cr9Gz3ejo32mBtFSXpjEv3yiji8AM84V+r4P?=
 =?us-ascii?Q?UQapQ1ynHORsuJkW4jcaEfF9N+5B+aFV4k3nbbjbWrQV9qXPziGz6W1wxDPQ?=
 =?us-ascii?Q?ouj8DxthSXMowBxpk4Vuljh55P0XJDax3FAPMTUbvALPUB0Enk+vB64b6CU8?=
 =?us-ascii?Q?pwMC6UwBI9Sh/d5r0Hi+/l41w3aFCvI1VQSScXzVt25Sd0pUpII+TW3mv97W?=
 =?us-ascii?Q?FhBQJNC663FAs6OoomMsS/CA4xyuCZsPLzTtECakF1bzqCgJidvSStftQWYc?=
 =?us-ascii?Q?iQSogscaJ68Eeti5s5kOtBX3slLUMyXASq/JK1GsCr+F27Q1HX0x+U+ov1MV?=
 =?us-ascii?Q?0PnBMnTfW2syygeNIgH/vWVGbGBOtokGdMgMvhEFNArYJD6vtxFsdyW7o4tJ?=
 =?us-ascii?Q?mxh0tLLCFpErRvLE/zrQQno6aURTfSUg+Kv5iGkdnNyz2Kv9aZBNbCqrjaTn?=
 =?us-ascii?Q?JAIcivfAAEarfB59K0TdkcU72o52i0egnKtxGQKSrLqotoZV42iqcPCzFpvV?=
 =?us-ascii?Q?U6+hGKLeRSj1DGdG6725DAVDRtB0xbfJoyeEyLas?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6278.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ffd9b5-036d-4947-eece-08ddb84f5f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 03:28:39.3219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPCmDYvBOZmKNB2NvhVTNXRQugP8LqcqRyECAUjICRHtQj0/XzDebpgNT1/jfmMzvIn3dA5HJ7uUnM2tIE9n8A0OJFY6oTwygYB+HGM12jY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6364


Hello Kailang,

I'd like to insert another question through this. That would be appreciated=
 if you could have a look.

After system boot, we can see the default mixer status as below:

root@cix-localhost:~# amixer -c 0 contents
numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D13,iface=3DCARD,name=3D'Mic Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D1
  : values=3Don
numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=3D87,step=3D0
  : values=3D60
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Don,on
numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=3D0
  : values=3D87,87
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D0
  : values=3D0,0
  | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Don,on
numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D63,step=3D0
  : values=3D39,39
  | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
  ; type=3DENUMERATED,access=3Drw------,values=3D1,items=3D2
  ; Item #0 'Disabled'
  ; Item #1 'Enabled'
  : values=3D1
numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D0
  : values=3D0,0
  | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Doff,off
numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=3D0
  : values=3D0,0
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
  ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D0,0
  | container
    | chmap-fixed=3DFL,FR
numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
  ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D0,0
  | container
    | chmap-fixed=3DFL,FR

It can auto switch 'Headphone Playback Switch'/'Headphone Playback Volume' =
and
'Speaker Playback Switch'/'Speaker Playback Volume', when I plugin the head=
set or not,
but I have not found the related logic, could you please help clarify a bit=
?

Joakim


> -----Original Message-----
> From: Kailang <kailang@realtek.com>
> Sent: Thursday, June 26, 2025 1:52 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; Takashi Iwai <tiwai@suse.de>
> Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>; cix-
> kernel-upstream <cix-kernel-upstream@cixtech.com>
> Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed=
 on
> alc256
>=20
> EXTERNAL EMAIL
>=20
> > -----Original Message-----
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> > Sent: Thursday, June 26, 2025 11:45 AM
> > To: Kailang <kailang@realtek.com>; Takashi Iwai <tiwai@suse.de>
> > Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>;
> > cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> > Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect
> > failed on
> > alc256
> >
> >
> > External mail : This email originated from outside the organization.
> > Do not reply, click links, or open attachments unless you recognize
> > the sender and know the content is safe.
> >
> >
> >
> > Hello Kailang,
> >
> > > -----Original Message-----
> > > From: Kailang <kailang@realtek.com>
> > > Sent: Wednesday, June 25, 2025 11:06 AM
> > > To: Joakim Zhang <joakim.zhang@cixtech.com>; Takashi Iwai
> > > <tiwai@suse.de>
> > > Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>;
> > > cix- kernel-upstream <cix-kernel-upstream@cixtech.com>
> > > Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect
> > > failed on
> > > alc256
> > >
> > >
> > > Maybe your platform need to set spec->en_3kpull_low to false.
> > > If spec->en_3kpull_low =3D false will help you to get MIC JD.
> >
> > Yes, but don't know what exact hardware design makes this difference,
> > do you know it?
>=20
> I don't know. But FT(Phytium) platform was disable runtime suspend, it
> doesn't have this issue.
> FT has not upstream his patch until now.
>=20
> >
> > Indeed, it's better to add a board fixup, please ignore this patch,
> > will upstream later after hda controller upstreamed.
> >
> > Joakim
> >
> >
> > This email (including its attachments) is intended only for the person
> > or entity to which it is addressed and may contain information that is
> > privileged, confidential or otherwise protected from disclosure.
> > Unauthorized use, dissemination, distribution or copying of this email
> > or the information herein or taking any action in reliance on the
> > contents of this email or the information herein, by anyone other than
> > the intended recipient, or an employee or agent responsible for
> > delivering the message to the intended recipient, is strictly
> > prohibited. If you are not the intended recipient, please do not read,
> > copy, use or disclose any part of this e-mail to others. Please notify
> > the sender immediately and permanently delete this e-mail and any
> > attachments if you received it in error. Internet communications
> > cannot be guaranteed to be timely, secure, error-free or virus-free. Th=
e
> sender does not accept liability for any errors or omissions.
