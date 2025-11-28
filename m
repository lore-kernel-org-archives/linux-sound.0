Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022104.outbound.protection.outlook.com [40.107.75.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B430E0F3;
	Fri, 28 Nov 2025 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764336217; cv=fail; b=g0jdwvjJ2blmLE4Vq9xtwZ/m2OL5VYkZkPDMxiJMSj5RysCpXRFi3q7Oym2BdfkczHyk73M+3Tq21bRyI91+H7yUpgRYovnSZEswOCPqymiSQnddsJtCghiD7d7slHAc75IavGAh5R2HyxwN8GXuoyGyuZ99Y5/4M80CUQBCWm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764336217; c=relaxed/simple;
	bh=lRwsVy495Rf8DSuiKG5a567UCMwVPUk98Ded2A/jy2M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BbQEZSmMGrUXYuVndT0k8KSqMvbmuhwsYc2wbOY2Y+RrNzPv4p5SGz6+SFKaiNcSrxYV6N3H9QasrTtDvLrgIPlu6L3V7x6xD6Jkuf8lopoPhIoYJuF7LiqWcYLCPvSG9sII9J2mIw/O0VRMJLBLzPuMvBDwik9G6LBTPTKLW3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvMlHYjN1+nu9bOp1peK9rht+lHuYmhG5N+ZcXdN7bb8+PfT72fBHhj35QTEtuVMmmNV5sHvO+jn7+1aEE4TRuo33+DOW9KN4j14cVqAv4SwqY9g00zi5oMPX6CNaYwkQ1ootsT5W6dS/UFko2dnpcbU7dDZkXHwrf7dttFpJHjGxRfMrSi1qTuY4FYsqtt5jDU8DRwkHYxmL1xreTQ6jPJVOvdLZU7XnyNAyFHwynFVHCAXLjda+nxvPEhexw+NbppX0PqmPWz17A+bRBALqS3aDm6Uk7Z8tAn0x3c8HdplWEPZL7DazeLjyhBURqAGo8CoU0eOBETNkjnVInezZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACFKg9Rc6uSqjUMeZ4gij+6YzlWHE71VCMqFtim+B8g=;
 b=UhhRSEanjLjAuoz2K5f+7aYexAKbSbKbCTBd1lgzQP+ie+ECDZBhMsGh1MaPkZngwlWtfj+2PfPI7BLN0ib/3ZXb36DUUpCAj8rHRuyx1F6H8bAxqyPtyqFhsuDWwpRkg+xEfKCrj19M5JRNicA6HQgbQudxUawmAx6WdsTtr0co/rv4h9qkw/4p99zVTElcIbWDHs9ExecNyNe4cbHyONqNFxJSNAp7Qn238vV5P7RyzDUVkKsSxK7gYc4y6elEUR88zHbjqNloyH2ozzctWHMaCFExeso/2jSga4Y+FRVc+alu/N4JWVXSPvX/AUW940lDboseoVfHGMEobKrzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TYUPR06MB6077.apcprd06.prod.outlook.com (2603:1096:400:353::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Fri, 28 Nov
 2025 13:23:30 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 13:23:30 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
 support
Thread-Topic: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
 support
Thread-Index:
 AQHcX4I/rWYXEfmiWkK1OjlzuYyFLbUH03+AgAACkFCAAA6QgIAAGa+QgAAGTACAAAs44A==
Date: Fri, 28 Nov 2025 13:23:30 +0000
Message-ID:
 <SEYPR06MB6226B5A5CDEE8F917B86A3A082DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
 <20251127094301.4107982-2-joakim.zhang@cixtech.com>
 <20251128-fearless-kittiwake-from-arcadia-662dbc@kuoka>
 <SEYPR06MB6226157DB7A5D5486500063A82DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <f9ce51ce-6fe9-4612-9be3-552736ea19a7@kernel.org>
 <SEYPR06MB62266F00FF610A9506807A3282DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <679b49b8-c965-4bee-943c-2e2af7e4d8fe@kernel.org>
In-Reply-To: <679b49b8-c965-4bee-943c-2e2af7e4d8fe@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TYUPR06MB6077:EE_
x-ms-office365-filtering-correlation-id: 6c431466-6593-4145-d675-08de2e81527a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4TiYTRvxoy6aDG2/Aywhn25/BQOOuo9LAGoUdbT9JGa7wgKvyv+TDuM4+scd?=
 =?us-ascii?Q?rzeL5+1L9fOJ5Oi0k6O5zkX3Wsey101meZ7ylhiok0bGZ2PBb18K7lEtM7+l?=
 =?us-ascii?Q?oDv8YBirqBP/wJh5m4Fxlk7YyIBcuRF4f6vGvGPq8YMa0emx3rETE/nRpU7l?=
 =?us-ascii?Q?HLfkauqpQx//RAxIZS8yg18htXHVE0y752ub4fxBrSD0Ys9xvHZAj7KStakp?=
 =?us-ascii?Q?XNh06TVlWeZEg6jv75I31xAHjaYUseQU/mK9lAwzz7byUmNAiTxNniYS+VEm?=
 =?us-ascii?Q?b9tTsUNeP4RLAn0f63bNd23hwZpq78Q9oxQe/0ajTEgi8TNdykx5zEwXvJKU?=
 =?us-ascii?Q?PQCI5xXjEE+HdF07nRalJ0791xjZa7b9Gwr81Q0XaxUVXG4X7tgdXbFNxFk0?=
 =?us-ascii?Q?v6pBf16kADgltfUbwitlFDH/m3LWjFKYrMLQrq2GQZrtmBVHxhS0xLn6X4Lt?=
 =?us-ascii?Q?8+O8fbs7pgoh03WDK1+u6aXkkz8+HZb5FxbkLpswsuE/yjJgiWm34PCKgTue?=
 =?us-ascii?Q?SwIMVfFtcDYb0TD0ATEZ6WHM9fKlrUFuDItQF2RaDzbO5gfZnS+5t5tgJXI5?=
 =?us-ascii?Q?DKYXSSKCM586FKIwVTXVveeU0zX31iiwkb8ntToGhJ4zXVka1iww0LVso6ld?=
 =?us-ascii?Q?muHfC4ya0b/mR0erbYGMnVLrnuednCsPzJBi6U3kBnA25QKq12Z6p2nSyRbP?=
 =?us-ascii?Q?ANODO0+VG8FyFWouK+i79dvoqYKNfQOOFzW6DdLMLP7etDJzE9hWnB39SJMC?=
 =?us-ascii?Q?ZXaNHZaNuFUt7TMFO1axupHtpPItjgsAFleC9e05CRgc3gyb3P1J0L6FbcKG?=
 =?us-ascii?Q?HQOb5kgpDly2Bvc9R6Byu6TjXcm8trGam6KdjH+/PukePEliV0Xyd76SnD4h?=
 =?us-ascii?Q?oaCmXkAH4VXQkeuPco3l8zPz2CZGCHmqJ1GeIucqs8tOrmSeSvKzCJ5r2Ws8?=
 =?us-ascii?Q?KsBWwKrF0drPqUDzhB1MGgWCcuLwdT6oMJDJjOoUIgmROqTFWgRwy3aIKKnc?=
 =?us-ascii?Q?RKoXO00TYMIYck3C6awFeEhxA8oXITsco8osUn+ypUESzBO+t0gS8n11J3XD?=
 =?us-ascii?Q?Zd7HOLNx4Dpey30CPCXavNuWEko+6NIjiIa6peeDl+MHkmN7qq1tV72dCemO?=
 =?us-ascii?Q?8SbZs3cySeOMRQCp3vxWM2vRaNFoZRvL+WTagXikCllzsrUtCXRZNcSeN7hG?=
 =?us-ascii?Q?Q+oF28WWZa5TqNKJBsyvfNk/bKJ6s5KIQjR1xiXNHFVUAEU1HybC6foMr7+W?=
 =?us-ascii?Q?nWXBvyWz2XlJn8qpwHUlxRyK3g5qZnNidXwxXnEr5JkUk5n/BFnDv4Ui/Gsd?=
 =?us-ascii?Q?kl3/jfcWFzzpsKKq/38sbCow7slaDyzgHgesMQEOirTjDFnPUJAgBry9Ezx4?=
 =?us-ascii?Q?foZ8zb8rrl/VYHi6o86PXuhLtw4ky9uzArjtOBsfD3x9vqOi/IXhZVRXRfaG?=
 =?us-ascii?Q?uqsFvTLlv9GXF8H/1js2/AYA78iWmsPRlZsNISuFv9c0KY7HYM9QEA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uXGul3iMsbjF3WZnTcWBj4Bh8e0NdYlb5JeUN14VdHy1o95NQ9tn/5LD0AHM?=
 =?us-ascii?Q?5sBPhiIANgDuu4iIMJTyCRb/Pi3ygnw//5VmcWVfDbKGIY3sKrhLpVJAsl8F?=
 =?us-ascii?Q?m1Ls9IdZR38CEBHlEUaMKAd5RgeBysUtOzdgGS5DIqlYqeLErJj7BF7bSYYD?=
 =?us-ascii?Q?pR4a4Ry+4c6jCE49W6KgpP+FHJFgP3+JS84fTLRLk0Laa+2ibVbaO23gfuV+?=
 =?us-ascii?Q?Qe8p+fArdVwGp97L3U4/X7tV6d+Bh8n+jcuC3ECSgNsz7jH3D3CdKYBFghQN?=
 =?us-ascii?Q?8F3VHwZlbpC7d2MfLKgFEEJzLkcEvH2bTgeXZtpxh+g0E6pZc0Tphq8Zb7b2?=
 =?us-ascii?Q?8+o4bkW9WnKMkEt+QGF6k/GwBUIH3Z9CrAfcHocmKeKFSUQrFAAhP2nt1SHT?=
 =?us-ascii?Q?aDXP6QR0bLG9ADJABSKV7W3alqnnE4EnY/pRguxGBR/M1WPaXT7/kK7YTlAL?=
 =?us-ascii?Q?h3KLOZFq1wnqO9O0+mbz9/N9IKXQbBWYdK6tSu0dYp+UzsMZ8Mj+Rr5LzrmQ?=
 =?us-ascii?Q?gI/nkHDP4nVUm4qH3f0H4oLqES9PUQbD2wfKqAq3ryaPEwkBRJbmTPIHgmg6?=
 =?us-ascii?Q?gclIdwPG8J8jvV4vY0ZjLvk5osAVL/Z1vkpkxft6PXhoTLmeECJwsYH50ddt?=
 =?us-ascii?Q?guvBESVpzqz52u1oFg1pbek8rgk8eHoISsZMmQo6sqXc7AcOjgYOaFcpRUwT?=
 =?us-ascii?Q?pp6H7gAaZkJSoDkDEzkvGXCTvN3YmzIJ9AAw4tdVXQPadXa3HInzVx3ZY8ib?=
 =?us-ascii?Q?pkenW2D/jODOZtL7Z76P5mHkWzmWQDl7Q559FedRd10NE/Ul/5IjsoD2y/a8?=
 =?us-ascii?Q?Tf+wEPC3x7JlcXEoTFRL1NnjsAqOssC4KJfeIcEhjNuIzlrwzA/R9YEaXsBr?=
 =?us-ascii?Q?y4Kvu3WhsifMxtU0ByiXSbsyFcAqFHxmDPfHxJG2DQ8KG+buSkPwuDQInWvt?=
 =?us-ascii?Q?NbEsYa2/bNXhnRDyGwkyZUPT/QULSpJ+TBRIji8WUrpVlVoAhQGd8bfI0CPo?=
 =?us-ascii?Q?nU4BxzZpGmo5zBvIOaCkaP+O/mU78ylNcRGtqqT4Gn5Hk+ijaFyNGHzOzuqs?=
 =?us-ascii?Q?hhMfH9PgS9zFjo0DlbntWvpmGIsblKCm3YLvai6fMkHW5kMDfRD/ilwfkqeT?=
 =?us-ascii?Q?52F8BITUaN7U0EIy+WBt7Juf6Q9kSkreptOEwZwmP2XuiGz6ARA74YjhvxAo?=
 =?us-ascii?Q?ByDhPOA7Xd+HOEidQP8H7MzQDN9Jv+ac4FtCfDnG8X0MsZYRgxI8NYocsttV?=
 =?us-ascii?Q?CZedNwbWpwIdhpa1+83iGcYCS9qf4hzCpn7GMjQKjbGlDJJcYOH6mx6z3lg3?=
 =?us-ascii?Q?fRQhvDIcuLnWlCghN7QJucjRxw03ZZRY5+gSXqs+Aw3D1+z+AFK75RpIEtKs?=
 =?us-ascii?Q?R08C6p1vsrx1jtDkTgpwSn0hSTTjFOZU14l3yCZVWQYMlSbsQQG3glYqYfbU?=
 =?us-ascii?Q?O2zJ4byXaQE+CRZFa8HvjrTH328Cyqi1xSDVK9M5Llb+NErE4aMrmj/HflI0?=
 =?us-ascii?Q?JGuGs40udSQ0HpHXCAcg9VrT9O8R9VFI/YBURN2BY3iBZ+UkBtkNQHM6Swys?=
 =?us-ascii?Q?kzBmyaVMNts8abuJ55tXIbely+VbWKK25gW53tZVfi3N9LSsYtR4qRwvXYON?=
 =?us-ascii?Q?64KD139szpU9SjAaRc76KQGJRnR7hBkISqObvWUsKC/0?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c431466-6593-4145-d675-08de2e81527a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 13:23:30.2525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3lVoK/e2gqMt4dGe91jc4QcQ6drtmRLw1UVCEl8Y+aFrNWbgoxKkhMohu+P/FEt9Vmfjmx4yayGWTfQIaCstP4CjK8hBuxISeFHBH++S20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6077



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Friday, November 28, 2025 8:24 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: lgirdwood@gmail.com; broonie@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> tiwai@suse.com; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
> cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA control=
ler
> support
>=20
> EXTERNAL EMAIL
>=20
> On 28/11/2025 13:15, Joakim Zhang wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Friday, November 28, 2025 6:29 PM
> >> To: Joakim Zhang <joakim.zhang@cixtech.com>
> >> Cc: lgirdwood@gmail.com; broonie@kernel.org; robh@kernel.org;
> >> krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> >> tiwai@suse.com; linux-sound@vger.kernel.org;
> >> devicetree@vger.kernel.org; cix-kernel-upstream
> >> <cix-kernel-upstream@cixtech.com>
> >> Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA
> >> controller support
> >>
> >> EXTERNAL EMAIL
> >>
> >> On 28/11/2025 10:54, Joakim Zhang wrote:
> >>>
> >>> Hello Krzysztof,
> >>>
> >>> Thanks for your review.
> >>>
> >>>> -----Original Message-----
> >>>> From: Krzysztof Kozlowski <krzk@kernel.org>
> >>>> Sent: Friday, November 28, 2025 5:28 PM
> >>>> To: Joakim Zhang <joakim.zhang@cixtech.com>
> >>>> Cc: lgirdwood@gmail.com; broonie@kernel.org; robh@kernel.org;
> >>>> krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> >>>> tiwai@suse.com; linux-sound@vger.kernel.org;
> >>>> devicetree@vger.kernel.org; cix-kernel-upstream
> >>>> <cix-kernel-upstream@cixtech.com>
> >>>> Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA
> >>>> controller support
> >>>>
> >>>> EXTERNAL EMAIL
> >>>>
> >>>> On Thu, Nov 27, 2025 at 05:42:58PM +0800, joakim.zhang@cixtech.com
> >>>> wrote:
> >>>>> From: Joakim Zhang <joakim.zhang@cixtech.com>
> >>>>>
> >>>>>  - add CIX IPBLOQ HDA controller support
> >>>>
> >>>> Please write full sentences. Loook how other commits were created,
> >>>> it is not the first cix commit, right?
> >>>
> >>> Yes, not the first cix commit, I will have a look.
> >>>
> >>>>
> >>>>>
> >>>>> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> >>>>> ---
> >>>>>  .../bindings/sound/cix,ipbloq-hda.yaml        | 71
> +++++++++++++++++++
> >>>>>  1 file changed, 71 insertions(+)
> >>>>>  create mode 100644
> >>>>> Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> >>>>>
> >>>>> diff --git
> >>>>> a/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> >>>>> b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..c9e4015a8174
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/sound/cix,ipbloq-hda.yaml
> >>>>> @@ -0,0 +1,71 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> >>>>> +1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/sound/cix,ipbloq-hda.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: CIX IPBLOQ HDA controller
> >>>>> +
> >>>>> +description:
> >>>>> +  CIX IPBLOQ High Definition Audio (HDA) Controller
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Joakim Zhang <joakim.zhang@cixtech.com>
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: cix,ipbloq-hda
> >>>>
> >>>> What happened here? You miss SoC compatible. I did not ask to
> >>>> change compatible.
> >>>
> >>> I used the cix,sky1-ipbloq-hda before, but you ask to use the
> >>> compatible as
> >> the file name, I think it's may not quite suitable, since we may have
> >> sky1p, sky2... later, so I add a unified compatible here as a fallback=
.
> >>
> >> "Filename must match the compatible.". Your explanation "use
> >> compatible as the filename" is also correct - use what? the
> >> compatible? as what? as the filename so in place of filename. So how c=
ould
> you make it reversed?
> >> filename as the compatible?
> >
> > Yes, "Filename must match the compatible." is meaningful, I updated
> "cix,sky1-ipbloq-hda" to "cix,ipbloq-hda", since here use IP name is more
> suitable and may for all CIX SoCs later, if there is any difference, we c=
an all
> other compatibles.
>=20
> So why did you reverse the logic? Anyway cix,ipbloq-hda is not correct,
> because it is generic. See also writing bindings doc for more explanation=
.

Hello Krzysztof,

For the v1, I know you ask me to update the cix,ipbloq-hda.yaml to cix,sky1=
-ipbloq-hda.yaml, not to change the compatible. The reason why I went to re=
verse the logic in v2, since I think it may reasonable.=20

Documentation/devicetree/bindings/writing-bindings.rst
- Bindings files should be named like compatible: vendor,device.yaml. In ca=
se
  of multiple compatibles in the binding, use one of the fallbacks or a mor=
e
  generic name, yet still matching compatible style.

You mean that must list the SoC as the device here , cannot use the IP name=
?

However, it still mentioned "use one of the fallbacks or a more generic nam=
e", since ipbloq is a hda ip which would be integrated into other SoCs, so =
here I want to use a generic dt-binding name, is there any suggestions? As =
I found a lot binding use the IP name as the file name, such as fsl,flexcan=
.yaml, fsl,fec.yaml, fsl,intmux.yaml.
