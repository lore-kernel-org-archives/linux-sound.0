Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022100.outbound.protection.outlook.com [40.107.75.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D34C3594A
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506773; cv=fail; b=lO2PdYwYB30SUdPjrOsuHR4up9bNiD30VccZ3+Yha8DbeBveHSkOOl79NGSg4MoevNFCmm9i3onJ+vRoEo2sH6OryOnNMOOyTPOi+coyNG+KxydX0jwS9OozaO2siPNbpXgypXUZe+AiCKoIr9F8NfG2snZrJdTgRJK1zweXC8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506773; c=relaxed/simple;
	bh=PjNJQ8w5J722BDe7lUtAya4Or4jjSCN8btlpshu4pJQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iyTqOyZkh6luMAcZJDdQLuGf+jrl603NBrOaTRS49QRt1qPer2BBR0jhchCs85Ca7RCsCl7U0k+9EbQNFADOlcNZ7OCVXd4UWdF/X0OXK4FGJnt4cFapQT396p9ztD5yCrTytUVl8rC9PGeItD7ybIDycJGkyPySEsKSAHJ9zI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g03y7EFQqZaW3hqgHW2Z8vs12VyC5AykhUCMrKsTYAjnFUa6854TSQRt3Hf151zRfbtWz9kijfGFRLvJu6kaJVt0/FTGBagN8SzrQrjsepm76S3m7NnKlxpERiSJn+1W2PmG0krZzStzqct0msGlTQitLbtP1w4YQI/H6yhRQC+6TgQ2Mfc5LbFpaZox/sySwlnVnqr/3slVjFqj4HpD7tgwfp20ekBX7yT+aN6wQFOF5gQM4YbZEs9VbO8AOInny8e9u2+Gj7qbWDa98EzGqY93+onaB/qNSg06s//uyA+55BwlEI70Tz1YUBdk7ZAygNfOBtcZcfUg6hrdakN4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kOMAwTFWN/9yw6fCEG9GIRt/y1bCP/R+1cSsv/hEiE=;
 b=MMRvqarV8V3SgPJ52Oef1lN6hzljvTn3cyl/x8QQoW8ddKp79jtGj9LnJTGfI+6Ql8IJ5S7+js9eijCvfKJux5S6NMhy9WhrVIa5gSznHsc7cyKoE7O4JXaFpvRopkTG3zaUrYnujLx2saBGt8jytLkaY04ffaCMypuk1D4ZyYeoLIb1gKlT0xLmW5Zj1rCG+GHx1dN8qGUUBsl8ejsMYUAPGVi5mTzc2nXkpv0JNzBiANaDMLqrcOi1qlZckT853qoNor98G2X2mkmwD9/mL+hGezOVF5kSb/retH5kpG0TmsunXwMOdCVOhAOp+is2CtmJ5HsVbfeurzea68hItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by SI2PR06MB4995.apcprd06.prod.outlook.com (2603:1096:4:1a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 01:39:25 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 01:39:25 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Kailang <kailang@realtek.com>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "chris.chiu@canonical.com"
	<chris.chiu@canonical.com>, Geans_chen <geans_chen@realsil.com.cn>
Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Topic: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Index:
 AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaCAABzZAIABmbuQgAAnGgCAB7AeMIAAK3iAgAAHvGCAAAaLgIAAAOtAgAABUgCAAB1NwIAACu6AgAATzaCAABVWgIAA6+cggADUkACAALgOYA==
Date: Thu, 3 Jul 2025 01:39:25 +0000
Message-ID:
 <SEYPR06MB62787987F06AC544F98D39A68243A@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
	<87a562wqzu.wl-tiwai@suse.de>	<431c41bd52224eb5ac341c9c24d52af1@realtek.com>
	<SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
	<SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<5f2431ca8ef2453daa9da2034798e682@realtek.com>
	<SEYPR06MB62788CE70E017CB5FD7F5317827AA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<a0d71d7f93a94800881c8c67c9e715f8@realtek.com>
	<SEYPR06MB62789527920A36FC01B665988241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<87cyake9w0.wl-tiwai@suse.de>
	<SEYPR06MB6278B60285176A9B98ECB65F8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<877c0se7iu.wl-tiwai@suse.de>
	<SEYPR06MB6278B9C65FA98E18C87EDC1A8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<874ivwe75h.wl-tiwai@suse.de>
	<SEYPR06MB62781EDBF735E177B909053B8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<87y0t8clx2.wl-tiwai@suse.de>
	<SEYPR06MB6278A4E87874B8B894A1DAD48241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<87tt3w6stw.wl-tiwai@suse.de>
	<SEYPR06MB627805243BFA48D81FD58B158240A@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <87pleivfb5.wl-tiwai@suse.de>
In-Reply-To: <87pleivfb5.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|SI2PR06MB4995:EE_
x-ms-office365-filtering-correlation-id: 80cadcbe-76fe-4fed-7a9c-08ddb9d2715d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CIfL85bda5k9Xfti6QLJDxg48XJRZdrBziCK0ddK7fZTXdmRwZ+i8KNSMUgG?=
 =?us-ascii?Q?Uxe8Xr+JUyy76vwbg6fr88Cp5yjgngeHjReiencNafalF5cDCV8TWn5JIy1C?=
 =?us-ascii?Q?FY6PoNMqZt2jB7T3HQvC2I8SZxvMxGfpUX1YNJ4CYmmvS0LhQqo8Htc6LFlh?=
 =?us-ascii?Q?L5sr09TpcULdRqg8sfrtzUVE7jjkEioPD2OZSKOUc467TtVmgLrF21ft8cAx?=
 =?us-ascii?Q?gAg7IGm4Pt5npYhll/yOyzYJ/U0ACbVUhF8EFUcp0IrxSwAed/folUiWfB3q?=
 =?us-ascii?Q?cRrR+UfmKnoEnrU5hNAA5G+bg8rI+cxju61DUoZhABtd3uFjsf2ovzcjDhNT?=
 =?us-ascii?Q?l8xGVfKFdgubtEjhbZUYREsFkqJZfm71bXZdvzqaH9KPu9XDTWnBEseKgsCh?=
 =?us-ascii?Q?SKiKJ4PcQi3/df3EnkhDtr0mndp9fzjqxEn6iJbPBIcB5+34nkH3StZP0oXB?=
 =?us-ascii?Q?vBJtqPSUPQU0IMQYxf9QSd1ZbE9qzr5KsrDYVtlZVNsTnmkh+vLXNRmg/AUG?=
 =?us-ascii?Q?NIWWel6S7sa0NAqAqxkzIDmei24zAio8n/e5F67aOHz1/T7RK/UoBBJDcNml?=
 =?us-ascii?Q?dsvtzBfd2reNBNgEnv8+bcCYPW+8FSSEl3dQisVSEVQM9kKHJskh/ZQHQcG1?=
 =?us-ascii?Q?1mg7R0KNyMEdWZ2li95LMIM4h5mb30UmbbItpZ2ZmSvwWdX4HA8YnBEai6OT?=
 =?us-ascii?Q?uqQQ4lyg6G59PszbKFHrYOePLzrWSBoSw6vhwjygOfeTPqkgGEGoMkcnSftn?=
 =?us-ascii?Q?98t3tFICVrxBlwf2WSSRMTDKdNl8DcPxiB3RBIyFro8uEXdLp0poQzECZGxM?=
 =?us-ascii?Q?ySb+2KCJNZvyl+LkP4fLO8WqroW0S4r6flB7aruYBXqGpYZZdL3v18ZMPXfW?=
 =?us-ascii?Q?6fsntOAoeuZYFQa++EM1BBPi4InnZkCl3kIvN6XB26rWd+W4zYCWX5ZtdT4y?=
 =?us-ascii?Q?q9psSLymy4xB2O4uWkQmMPG+0nSNfJ70p/rE4BZyrEDkTkrrQn+RbyhqVrhv?=
 =?us-ascii?Q?Vb5nIIQQMRFDbXBntGFsi8RpLYB/yTdrq2ztvNIKgqpoV0Dzu4HLaSFcDTG4?=
 =?us-ascii?Q?BNOvR62fecS25Nbo+GsV/7l+ffUL/dp/81geuueMSB1I42Vjzl8nhpgqLNBR?=
 =?us-ascii?Q?uUNjKLThmbwgN6ivCQVKCRa6t8hrHKJYqP48MNeIp8PLnd/e1KuSmRsNE3Es?=
 =?us-ascii?Q?PmmjISqoucm6E+r9LHkdB7hBGXTrNs3HQKuQNnu9nIuwHjwDgybzoHCQJJAR?=
 =?us-ascii?Q?jNpDlTezZM+IxW1nRA8gqrJhTGDPmOYvwADT/N9HX8NNZ5dyIdWj6EdHLuKn?=
 =?us-ascii?Q?E/T95Tkcj90hC4tBouRZbq9tUNEo89GAd9RfMVMipezzrwDOsQDWBqX1nMz0?=
 =?us-ascii?Q?1NISlvMCTYVyZddcEibzomA3U0Ns55cgx9JCWZj5HHcX4rofu0f+7t61WtNw?=
 =?us-ascii?Q?aYrIXA0zAnkfaPlhik4uI3B1v5v6w0Pn4Us1VyOorR63RgZZ/IRq1w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DOTrfbohUYmaAG+0vWkkcvM+WVcPpVaJwjao/4rF9NBuprylTUscJ2iUhn88?=
 =?us-ascii?Q?NNDDZxh9A6CbrE3ayoWM/BAHZ9Zbbrp7PSK+TjLWX36SlTtITJUKkFVmho7a?=
 =?us-ascii?Q?0FzIkIw5+fIcoUfkdQJ218+NvZu1FVBcUPEX0zf36ZC+7C3Bee3U3Au2J3NZ?=
 =?us-ascii?Q?ZM8T9g8TRIIHiffCz67yxrrHjYsB4ZIa2FW82P/JB1hAaLIVVRmqE/xm/0w5?=
 =?us-ascii?Q?q4ZRv1rXDixghvl4fbZwxwDMZEiwGRLmObL+vzgOqO+bSQlrAy7AK338P4R6?=
 =?us-ascii?Q?c2n2e1IcnaC7YJezfJx8dCQsh2LbubkSEQi0sPKptzIXKCKQm/iMr8jOXjVW?=
 =?us-ascii?Q?80PslxUVllDBMzhbkKHMdz4QiRrfBgPQC3uSpwkXYHCbuJCc7B61y52Not5z?=
 =?us-ascii?Q?w9Rd258v4Itgfq44cJynNgW8v06cvCYVTMSEbujDDdq9CHx2lx5982820H+i?=
 =?us-ascii?Q?AxSmHqBTq+/9wbxE5nWNfNAoHOC8+PoRlYxbEz8oY+U0QDSI2SE6f0SgKiPF?=
 =?us-ascii?Q?og4FkdeNd5qEftSrLZkSraFWqq/C/+HkCDJt+06y398AzsPl2CqDoXXlmMPR?=
 =?us-ascii?Q?NTJHgz4ajvssGufa41vTwT2nCZYOqsuvb6Q6QsvDcC+J3lVdhegC3JfwN86Y?=
 =?us-ascii?Q?vNMvdvRvjZkaYREcGs1Vy6rC8giPQpWZPGUI4eqS7fu91f360/0ruqjkcKqt?=
 =?us-ascii?Q?vyOJbnUpneBlO6p4JvMwt3e6Xple3sTj4bDDS0pwCCqmaZMlEvaSlWWGgn+i?=
 =?us-ascii?Q?280ORSpNAOlVT5bu6fTDrcfyPlMHr61mwFhXM3rCA6zPDQ8fCZs6yu/KfNms?=
 =?us-ascii?Q?lMukC00X00uC4R6ZshHztudzbRb59UOm0m6lh84eeku7hd6pgBzfdH+5Kip0?=
 =?us-ascii?Q?t5Fc5xJXdaKnCXB78cd24A6i6UV1oGkXvtjG7CIL8XypiPa2PCK172mQRk+q?=
 =?us-ascii?Q?ScXG2tCJS3olLM4peQUWT8oPmnAbWpgEXmN8//OCV19akvTFShOBnkCVgYMz?=
 =?us-ascii?Q?RbFFAbo3BpYinkUqFkPK3iHNh/7sM9AYH+WOXNpWjZ7e+mnn07wgR83hwz/h?=
 =?us-ascii?Q?vkJkqtOc2A5pv5Wiblllyuo4mhftfZVsg0Ya0LIe5vpfYTo2kCkuJSDZ09SI?=
 =?us-ascii?Q?4eTrtuKT4ubF9k/KcLFabKIAd97UZ0nZ8obvj+x8b0BVE4x5Ygo/ohwoqVjc?=
 =?us-ascii?Q?4yYnLGpuFgLHOY6e55q/AwjZKszyxEsd5Dja4ELQskB3xSGHQD64tR4vJO9P?=
 =?us-ascii?Q?r+XF21qIx2BW19DVVkTafZPt2Gj2LAEzC2Mum7bGYbwlyI4sDt9+/B0l60lT?=
 =?us-ascii?Q?FhZLGz3kNRcpu+c4dINkcTzIgg+WalZGFwq1m359hkB4iUx5n8CTeWwwptkG?=
 =?us-ascii?Q?R/4IxBpATyqsvHY1V3LByNTdXIPSE4WGgCRQNhCSqc0nvm9jQ2lUX8KrKNwU?=
 =?us-ascii?Q?YNy6+nvOyA4uqzdMxzVoKjGUBmcK9X2UC7HstqrP6iORPycmR+EYqNLg2tx5?=
 =?us-ascii?Q?C8Gvds3vfBETmQ51wkY0VrFZfnLkJU0ho0pitmRAfBKjJLKOQS8cqK9DVsrX?=
 =?us-ascii?Q?K9dSHF6s8mfExrKoYl3ybf2g6Fm+lLDZC50hNjxk?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cadcbe-76fe-4fed-7a9c-08ddb9d2715d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 01:39:25.2094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDkhqIGl9SbxxituvlBqu3M4t+0F1KBspFbZlkyVk1kj3FhdkrAqhdPT5+jusFryjZohVR091tkz6qzOoL87k2VgtfCyjGR9GTUd7ooLRk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4995


Hello,
=20
> On Wed, 02 Jul 2025 03:59:54 +0200,
> Joakim  Zhang wrote:
> >
> >
> > Hello,
> >
> > > > > -----Original Message-----
> > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > Sent: Tuesday, July 1, 2025 5:15 PM
> > > > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> > > > > perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > > > > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>
> > > > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack
> > > > > detect failed on
> > > > > alc256
> > > > >
> > > > > EXTERNAL EMAIL
> > > > >
> > > > > CAUTION: Suspicious Email from unusual domain.
> > > > >
> > > > > On Tue, 01 Jul 2025 10:40:51 +0200, Joakim  Zhang wrote:
> > > > > >
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > > > > > Sent: Tuesday, July 1, 2025 2:43 PM
> > > > > > > > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > > > > > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang
> > > > > > > > > <kailang@realtek.com>; perex@perex.cz; tiwai@suse.com;
> > > > > > > > > linux-sound@vger.kernel.org; chris.chiu@canonical.com;
> > > > > > > > > Geans_chen <geans_chen@realsil.com.cn>
> > > > > > > > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic
> > > > > > > > > jack detect failed on
> > > > > > > > > alc256
> > > > > > > > >
> > > > > > > > > EXTERNAL EMAIL
> > > > > > > > >
> > > > > > > > > CAUTION: Suspicious Email from unusual domain.
> > > > > > > > >
> > > > > > > > > On Tue, 01 Jul 2025 08:35:05 +0200, Joakim  Zhang wrote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Hello Takashi,
> > > > > > > > > >
> > > > > > > > > > Thanks a lot for your help.
> > > > > > > > > >
> > > > > > > > > > > > Hello Kailang,
> > > > > > > > > > > >
> > > > > > > > > > > > I'd like to insert another question through this.
> > > > > > > > > > > > That would be appreciated if
> > > > > > > > > > > you could have a look.
> > > > > > > > > > > >
> > > > > > > > > > > > After system boot, we can see the default mixer
> > > > > > > > > > > > status as
> > > below:
> > > > > > > > > > > >
> > > > > > > > > > > > root@cix-localhost:~# amixer -c 0 contents
> > > > > > > > > > > > numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
> > > > > > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > > > > > >   : values=3Don
> > > > > > > > > > > > numid=3D12,iface=3DCARD,name=3D'Internal Mic Phanto=
m Jack'
> > > > > > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > > > > > >   : values=3Don
> > > > > > > > > > > > numid=3D13,iface=3DCARD,name=3D'Mic Jack'
> > > > > > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > > > > > >   : values=3Don
> > > > > > > > > > > > numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jac=
k'
> > > > > > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > > > > > >   : values=3Don
> > > > > > > > > > > > numid=3D11,iface=3DMIXER,name=3D'Master Playback Sw=
itch'
> > > > > > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D1
> > > > > > > > > > > >   : values=3Don
> > > > > > > > > > > > numid=3D10,iface=3DMIXER,name=3D'Master Playback Vo=
lume'
> > > > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> > > ,values=3D1,min=3D0,max=3D87,step=3D0
> > > > > > > > > > > >   : values=3D60
> > > > > > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > > > > > numid=3D2,iface=3DMIXER,name=3D'Headphone Playback =
Switch'
> > > > > > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > > > > > >   : values=3Don,on
> > > > > > > > > > > > numid=3D1,iface=3DMIXER,name=3D'Headphone Playback =
Volume'
> > > > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> > > ,values=3D2,min=3D0,max=3D87,step=3D0
> > > > > > > > > > > >   : values=3D87,87
> > > > > > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > > > > > numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
> > > > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> > > ,values=3D2,min=3D0,max=3D3,step=3D0
> > > > > > > > > > > >   : values=3D0,0
> > > > > > > > > > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > > > > > > > > > numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
> > > > > > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > > > > > >   : values=3Don,on
> > > > > > > > > > > > numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
> > > > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> > > ,values=3D2,min=3D0,max=3D63,step=3D0
> > > > > > > > > > > >   : values=3D39,39
> > > > > > > > > > > >   | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > > > > > numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
> > > > > > > > > > > >   ; type=3DENUMERATED,access=3Drw------,values=3D1,=
items=3D2
> > > > > > > > > > > >   ; Item #0 'Disabled'
> > > > > > > > > > > >   ; Item #1 'Enabled'
> > > > > > > > > > > >   : values=3D1
> > > > > > > > > > > > numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost =
Volume'
> > > > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> > > ,values=3D2,min=3D0,max=3D3,step=3D0
> > > > > > > > > > > >   : values=3D0,0
> > > > > > > > > > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > > > > > > > > > numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Sw=
itch'
> > > > > > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > > > > > >   : values=3Doff,off
> > > > > > > > > > > > numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Vo=
lume'
> > > > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> > > ,values=3D2,min=3D0,max=3D87,step=3D0
> > > > > > > > > > > >   : values=3D0,0
> > > > > > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > > > > > numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
> > > > > > > > > > > >   ; type=3DINTEGER,access=3Dr----R--
> > > ,values=3D2,min=3D0,max=3D36,step=3D0
> > > > > > > > > > > >   : values=3D0,0
> > > > > > > > > > > >   | container
> > > > > > > > > > > >     | chmap-fixed=3DFL,FR
> > > > > > > > > > > > numid=3D16,iface=3DPCM,name=3D'Playback Channel Map=
'
> > > > > > > > > > > >   ; type=3DINTEGER,access=3Dr----R--
> > > ,values=3D2,min=3D0,max=3D36,step=3D0
> > > > > > > > > > > >   : values=3D0,0
> > > > > > > > > > > >   | container
> > > > > > > > > > > >     | chmap-fixed=3DFL,FR
> > > > > > > > > > > >
> > > > > > > > > > > > It can auto switch 'Headphone Playback
> > > > > > > > > > > > Switch'/'Headphone Playback Volume' and 'Speaker
> > > > > > > > > > > > Playback Switch'/'Speaker Playback Volume', when I
> > > > > > > > > > > > plugin the headset or not, but I have not found
> > > > > > > > > > > > the related logic, could you
> > > > > > > > > > > please help clarify a bit?
> > > > > > > > > > >
> > > > > > > > > > > Isn't it "Auto-Mute Mode"?  If it's set, the speaker
> > > > > > > > > > > is muted automatically when the headphone/headset
> > > > > > > > > > > jack is plugged by the kernel
> > > > > > > > > driver itself.
> > > > > > > > > >
> > > > > > > > > > What strange is 'Auto-Mute Mode' would be disabled
> > > > > > > > > > after headset
> > > > > > > > > plugin/out several times, don' t know the reason....
> > > > > > > > >
> > > > > > > > > "Auto-Mute Mode" is a software switch, and it means some
> > > > > > > > > program must have turned it off explicitly.  e.g. the
> > > > > > > > > sound server like pulseaudio or pipewire disables it.
> > > > > > > > >
> > > > > > > > > > However, it seems that speaker and headphone/headset
> > > > > > > > > > still can auto
> > > > > > > > > switch. Please see below mixer status.
> > > > > > > > >
> > > > > > > > > Usually pulseaudio/pipewire takes over and does the switc=
hing.
> > > > > > > >
> > > > > > > > OK, I see, I will dig into it, could you please tell me is
> > > > > > > > there any other software
> > > > > > > switches in the mixers?
> > > > > > >
> > > > > > > Any mixer program can change...  But basically the auto-mute
> > > > > > > is a task of the sound daemon.
> > > > > >
> > > > > > I disable both pulseaudio and pipewire from the Debian, and
> > > > > > enable the
> > > > > auto-mute, when the headset plugin but the switch not set correct=
ly.
> > > > > > 'Headphone Playback Switch'/'Headphone Playback Volume' not
> > > > > > set, but
> > > > > 'Speaker Playback Switch'/'Speaker Playback Volume' enabled.
> > > > > > Are there any other possible reasons?
> > > > >
> > > > > The auto-mute doesn't change the mixer state.  It switches
> > > > > internally, either by adjusting the pin control or the amp.
> > > >
> > > > OK, is that means all mixers setting should done by users based on
> > > > Jack
> > > status?
> > >
> > > The mixer settings are exposed to user-space and user-space programs
> > > can read or change them, sure.  But it's not clear what is your
> > > exact purpose or goal, so I can't answer much better than that.
> > >
> > > The auto-mute feature is implemented in the kernel driver level, so
> > > that the automatic muting via jack plug can work without the sound
> > > daemon.  The auto-muted state isn't exposed to user-space via ALSA
> > > control API (mixer elements), and it looks as  if it were muted by
> > > the hardware.  Actually there are hardware that do the auto-muting in=
 the
> hardware level, too.
> >
> > Takashi, thanks for your details, I think what I want to know is what d=
id in
> the kernel driver level for hp automute and mic autoswitch.
> >
> > I am looking the code, it seems only update the pins and not update the
> mixer, right? So when the headset plugin, it will auto mute hp and auto s=
witch
> to mic at the hardware level, users still need to update the mixer manual=
ly.
>=20
> Users don't need to update the mixer -- that's the whole point of the dri=
ver
> auto-mute stuff.  When plugged, the speaker gets muted, and the output is
> routed to the headphone jack with the formerly set headphone volume and
> switch.  Even if you change the speaker volume/switch, it has no effect a=
s long
> as the jack is plugged.  When unplugged, the headphone volume/switch can
> change but without any effect, too.

I have fully understood the auto-mute feature, one point you pointed out is=
 very crucial,
" When plugged, the speaker gets muted, and the output is routed to the hea=
dphone jack with the **formerly** set headphone volume and switch."

So, the volume and switch of the both headphone and switch should be **form=
erly** set by user via ALSA API when auto-mute enabled, I tested and work n=
ormally.

The problem that is bothering me now is, I cannot find which thread try to =
control the mixers(switch/volume of headphone/speaker, auto-mute mode etc) =
via ALSA API, running with debian os.=20
