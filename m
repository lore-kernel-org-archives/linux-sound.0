Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023073.outbound.protection.outlook.com [40.107.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60D8F77
	for <linux-sound@vger.kernel.org>; Wed,  2 Jul 2025 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751421602; cv=fail; b=sTWIm6WU3ew0wBR7q7WoxQ+AOmd0ClzrDp/vjF2weVY1uP5ll0jX7ft7/VRuHCQ8ad65MJ6iupx6+MSW6M2vBDFrtMVirOhVa1/lghI85VKpjD/0HmSmINgrc+GKeBl3iUZAtouFp8Rwfpz/5VWvjnk9HwuZupsbwxgvz+8BFC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751421602; c=relaxed/simple;
	bh=uGu2ZVmG3HFTPgKwpg7wUMzYlVT1fJDzXB8HqyOQFiQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L7ITlJL8ORFPTHr+1W6QCFpnWA2YazxvXL8KjAg/aMIM8qJTMjZv1fD9zI50KmQKIR7bIUiAGnM1WzfP/nPGfJBmFk+wNDAUwvL8yG8roOv+SWgqrroRUMKUU3aZBuUjfoWDMjo66P/RJCu6X/D82ivmKEYPA4j0Z1E4yPlS6b0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS3wH9avWFoowkK34A2J/j7NYiWmWSRGutaaNza8J44a3FzQ9L2NOCyvpdYZTpaPfYd4xsplPfzGAQDK2U8YlYA1YHu/wiYj3qZnn2R+KBhnJTfqsplAfTmuF1rhgWBICeowPJOZ5n21ZOMi8B5EBSU7mAA+yX86ZsWtpqHLWMAEYs9VjkNIpGc9UNCzOOcG8OFpN3G/f7wmRdMiJq8mYRf6CuRwcqgmPYEkkpqSfUo98Rra/pwi1toiUDHvRarlgxbJwESGoxTSOszSr0Yj1p0ViZzOUye5JG2ixFrQgrTKk3iZbj13YeiWWjfInd2s+QEVNAIj6A443G1+VSEqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+3eIHiBrECYD5Li+A4V2SNXmMvh5KUfo944dNGv3Gk=;
 b=C16BoQ0gwyJ34CrZIWH9rhUcatPZAN1Y1Byi+98xS51gagPWJCAfUNyQEzjucSJJ3ci0YVrfDOiFdkiPOvcjCPcEVHXX+LYVQPTLYfEPgUFWT8pSCxZ6oap1CI1Krf4gy0zJZjENQfVyvgXboKBtXSVwnEL9jZ/nAJJtqT5CjknGvsFPs6prd0m5TVvMN1bXSp1nVtKAJDKsC/TVrPWH3k+FgsEe6g8pMfCLdN8IWvjaGNqfIVgTF0A1RBd5eu+HUQaEajcNMfTl1x4PQHYveoBdb50Mc+opBedSG+al/4P8lWMTtoKNdcpyabcOVJtUdCQ/wGlNzr9CB1zEI19oFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by SEYPR06MB6107.apcprd06.prod.outlook.com (2603:1096:101:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 01:59:54 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 01:59:54 +0000
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
 AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaCAABzZAIABmbuQgAAnGgCAB7AeMIAAK3iAgAAHvGCAAAaLgIAAAOtAgAABUgCAAB1NwIAACu6AgAATzaCAABVWgIAA6+cg
Date: Wed, 2 Jul 2025 01:59:54 +0000
Message-ID:
 <SEYPR06MB627805243BFA48D81FD58B158240A@SEYPR06MB6278.apcprd06.prod.outlook.com>
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
In-Reply-To: <87tt3w6stw.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|SEYPR06MB6107:EE_
x-ms-office365-filtering-correlation-id: 5df36093-7b35-4ab2-1b67-08ddb90c2382
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5PLjvu/QuYrMKY6bZK6OLfo1gpLe8Kr+a0Aei83tzTXS/EwsTiDxPQIFIlAh?=
 =?us-ascii?Q?5Pe+hv5p4Zk4z6MwuQ7Qos5HdxrgoTUHSWRV/lyGQ4wdk+4519/b0jFr4zKG?=
 =?us-ascii?Q?YdLr4nvAabhnNCv6FE5nBJE5ZiHM/YetMRV3y4PeDDUnEyL5BqbfTXkji1XV?=
 =?us-ascii?Q?ZH3q3AeX+//dOzxR69Ve49yJk4l8/3AOgeF4x1IyYKDfhwTBi2uM+DLNE2t3?=
 =?us-ascii?Q?VLaj3b5QLGSGdPeJDtUTs2jI7qst5WY0wZMWFDqr/jTmR5wL05OzLqB1aX31?=
 =?us-ascii?Q?Hs7ng/Z+RIUbRv5iaIskD8qV8hRYQTdWp1jAesWXpzLQdg7LOte8kWbb7cGW?=
 =?us-ascii?Q?dB5DsqiyIi/ZM1dd0IED15Z8bwBG2YbDUpSpoSuuOXRRuTa9A6ZbFqZ1EKM7?=
 =?us-ascii?Q?sFrqnhcc+k5pt8tj9U2GglXxYjil9/aKooJS6v6Kk7aaqKaNHW0fzMRxtYCy?=
 =?us-ascii?Q?2DghuReRzUi8lDtUtPubof5hhnYpNjQRYOWqPdWI99b8cOBBj0biND0uWCwt?=
 =?us-ascii?Q?6VYsaodKWcL473BhXmTmPbpgOEVQOT5OoYtRdTTLdrcpOWXg2iOMn1PzKy5m?=
 =?us-ascii?Q?perTFS6rhs1qthKVwjm7wr0YCewecHJPRdzgyvOCiQdF1lJB1cSxk/L99lSO?=
 =?us-ascii?Q?JZYXz1LhI881tAYra1Dop2l4Sd44Al6/eS5Bg1A2kWreqXkaQEm0nVf3ZZ3e?=
 =?us-ascii?Q?EBOu3GtJXVRDf/hb2w5TrmYVeBSiYGKEKNnH6OBsddLPM2OBRWtihMdLU7Zn?=
 =?us-ascii?Q?t/6ljC569MNGQNehMvtiHuF4px144EwJEYSNXdlWH9UVtqPl9X5BJRj13OG7?=
 =?us-ascii?Q?j68lajGfPqKspzB3oFd3e3Hk8zG/aYSPvE22dLdOFOO8GP4CIGYbPUYiFRYm?=
 =?us-ascii?Q?bcOjAp+uP92D+avXsmdjuWEb9F1GMWn2iv6sjNcQ25/ahKxZ4mib1lx0WqDo?=
 =?us-ascii?Q?6kn4mIfYKoGcyh3/w5SXktBptO7INT4nTaYtTzpbNFLqE6THWurCbGOs0DAV?=
 =?us-ascii?Q?WKdU56UK8Snyz2tIU3kU4j7Yb4OqNtiygXtdK7CU7DeaeoH7GcgWq12gqDWP?=
 =?us-ascii?Q?t1TWzhTD2ClaxiWpSBDryihzaPh2HpW/aumMjsd7gcLSFNF2BRIv96JJm3cK?=
 =?us-ascii?Q?7Xt/2EVXR8HZ5Q8nBkyggPknL3jWgr9EZBMIUC7M0UgvuwiNtDbT+TC8+NLH?=
 =?us-ascii?Q?tCiZSi5JxdHo4X/JszQ60rK+mpKKviRvsK0x3wNmk1iwLkez1GJYLDHvl+Zm?=
 =?us-ascii?Q?aTdR55f10zlGzjoSHyrHzgYuUvfnhhi0qJEDLuPPDi0NC0VynQWR+V6p5p7G?=
 =?us-ascii?Q?MVj7d9JARdr3oZps4fNSR+Rqw7Z8sM0XFpdU2PGBVkVzJv4ilkppQuJDvU4F?=
 =?us-ascii?Q?q7RHK5qXKjJFgU0gJTUtL8DFq4K84pSuZTvSPBL7JN99tYJ3HcqBwq6pf5hV?=
 =?us-ascii?Q?EeKw2dOL4nDtfSAxn0I+wQeBzhx8R5t997LopGiXL7Bj1RW2kgsYaQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pn5a9VWM6OAufuMhquuzidN12vh+B+rjUodR4rMmsG/h79eBSxYmW2ws+9y9?=
 =?us-ascii?Q?D8wev3oRLhFI2jMSIa/W4L7s82UwrovpPoYQzbLQo7VMJmr60MnOYlYUDDVZ?=
 =?us-ascii?Q?9m8P1AvAt8Iwq3f4BzSuuehPipX5pAZt5sDfmOL8TTcFAwFf1bT9s3EOqDJZ?=
 =?us-ascii?Q?s2gMolDTbjlEDV8RQukvrobqq8Xw5WUXPcqPQy7xIxj7W6yC5bcedbenuulT?=
 =?us-ascii?Q?CkuBkrrr4BevjzjQLcto0p/fHoOBh6L8eqzAlIhHK/QwS+ny8S+kE/Wm6UaU?=
 =?us-ascii?Q?OsAV1y/AwV3vq999sFCsw9ARpBhLqQdPl+5XL2mYw6Ht8T6pGEg8nRASQsVJ?=
 =?us-ascii?Q?Hv53nUduj07ey4T3sSDGZEzYRbWPq2b2jRYnGTkPUHNdTFVS94hhrEoYuKG0?=
 =?us-ascii?Q?IU1cqcfuvoenOS/iMSyAf4jfoS2uRg3BG+6Z/fzfktG88X6+LXKLp4flCNBQ?=
 =?us-ascii?Q?SODxg6Jkf83tjvC2YVAmOJqJUFa5qyWkE+gWzw/znw3O7I+l328IY2w+SJSG?=
 =?us-ascii?Q?wW9VbzMEkWZKRctgGkmzNcAH8i0p8KowcP58EY9Ft8RXgaFpH4oOT9FLqgKD?=
 =?us-ascii?Q?LFBI11QpeWHmsZyPiuaUDAzvEJebywHrZZPdiH8bAb8DGfbXxXSQXyFzsYGk?=
 =?us-ascii?Q?5v/+IYvkC2RrRdlRAib5hBHYqNBhvc+vfnu7g2gB0dIVO3q78tkgJ2VwgpCA?=
 =?us-ascii?Q?pdfYXB5U/roLfGFJwAs+wSPN634eV4aYmaViuAcJtomQCSIntAglHe3brWVH?=
 =?us-ascii?Q?DYeKkSPuF0KJH1fpfrUaeh5gB1c0VghKudEFuVzB8mukFov2MarpgyYfPgEG?=
 =?us-ascii?Q?jPoZFEE9uxCkaX4wtjXPerajEI5VJ9eWi3f6WpCvkKpSJBu/z+t2FvRixp+C?=
 =?us-ascii?Q?hDNKB6oyvivwXKAVzMNfsbrBdc9uTGp5R/+tcFhQ8+ex/r1cglGEJnF2v4YV?=
 =?us-ascii?Q?V6L7AmaNdZZJX1SbksZUKAucIbC8paX5vCKT02uXV/V7sD6jCGLWUPtoxb29?=
 =?us-ascii?Q?UrpBpbesvL7N5gQavpp+LdpXQuU7UJ9CDVIn8yHfW/5rbKXw2ohAYGn3DbQs?=
 =?us-ascii?Q?e3gMTSWnB9OVP5hK6jiGuo/j6+x6zvgms7J24qZw8xqzVaOC6fH1N2LPMKzF?=
 =?us-ascii?Q?AwO7TVN6pcqZ3zZqVzDsT6YtEvoSW2+zpmNBL9ntrFaJUcMRN/eB4RJauI7q?=
 =?us-ascii?Q?jkT4vw5X0nZY/E/XonLKMmpBlrfFsNpE8OS8UuHFRzfEc1oUrkURHgjMRQ9h?=
 =?us-ascii?Q?qwoGhPXb72xCHe6xepxcowUXBQi3DVmizL5In9+/0kSm7BrGIKawM+3wMoW2?=
 =?us-ascii?Q?vLeWVXDoJ/+L/6RQxYNOfhhNAoHLrVqxErOk/yBI/CYhuYLIwfH2ROhKIreg?=
 =?us-ascii?Q?W+KQmD37YNhU07WWJ0yxMt4J2OiD+iU83vWlvPsNiASqgwzQfB1GxlhBgC8C?=
 =?us-ascii?Q?/iNmwUPHKa8IgaMB2Gp7K/RgA0r++WWzfzLnis6i3DX2Gc94m3y+/HthP4t+?=
 =?us-ascii?Q?5QyMeMu3h+mwlUx1FMjH4tWTct4Elx18LgG4lsWowd0kZy6/L7mSuPKb8LMP?=
 =?us-ascii?Q?XwFvswgrKqAL486/Mu90+eXalf+7e0MLIiNEafFf?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df36093-7b35-4ab2-1b67-08ddb90c2382
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 01:59:54.2854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kT2JcOlu+rnVOVewmStkxK47lxcqnSt9suKEE9gmt2pdwM0JhC+M8dsI/lHi4TN0vWrzSOCJymOi3XJgVUDwTYy4DhEfnAGWzy14fqPDXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6107


Hello,

> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Tuesday, July 1, 2025 5:15 PM
> > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang <kailang@realtek.com>;
> > > perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> > > chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>
> > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect
> > > failed on
> > > alc256
> > >
> > > EXTERNAL EMAIL
> > >
> > > CAUTION: Suspicious Email from unusual domain.
> > >
> > > On Tue, 01 Jul 2025 10:40:51 +0200,
> > > Joakim  Zhang wrote:
> > > >
> > > >
> > > > Hello,
> > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > > > Sent: Tuesday, July 1, 2025 2:43 PM
> > > > > > > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > > > > > > Cc: Takashi Iwai <tiwai@suse.de>; Kailang
> > > > > > > <kailang@realtek.com>; perex@perex.cz; tiwai@suse.com;
> > > > > > > linux-sound@vger.kernel.org; chris.chiu@canonical.com;
> > > > > > > Geans_chen <geans_chen@realsil.com.cn>
> > > > > > > Subject: Re: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack
> > > > > > > detect failed on
> > > > > > > alc256
> > > > > > >
> > > > > > > EXTERNAL EMAIL
> > > > > > >
> > > > > > > CAUTION: Suspicious Email from unusual domain.
> > > > > > >
> > > > > > > On Tue, 01 Jul 2025 08:35:05 +0200, Joakim  Zhang wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > Hello Takashi,
> > > > > > > >
> > > > > > > > Thanks a lot for your help.
> > > > > > > >
> > > > > > > > > > Hello Kailang,
> > > > > > > > > >
> > > > > > > > > > I'd like to insert another question through this. That
> > > > > > > > > > would be appreciated if
> > > > > > > > > you could have a look.
> > > > > > > > > >
> > > > > > > > > > After system boot, we can see the default mixer status =
as
> below:
> > > > > > > > > >
> > > > > > > > > > root@cix-localhost:~# amixer -c 0 contents
> > > > > > > > > > numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
> > > > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > > > >   : values=3Don
> > > > > > > > > > numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Ja=
ck'
> > > > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > > > >   : values=3Don
> > > > > > > > > > numid=3D13,iface=3DCARD,name=3D'Mic Jack'
> > > > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > > > >   : values=3Don
> > > > > > > > > > numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
> > > > > > > > > >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> > > > > > > > > >   : values=3Don
> > > > > > > > > > numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch=
'
> > > > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D1
> > > > > > > > > >   : values=3Don
> > > > > > > > > > numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume=
'
> > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> ,values=3D1,min=3D0,max=3D87,step=3D0
> > > > > > > > > >   : values=3D60
> > > > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > > > numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Swit=
ch'
> > > > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > > > >   : values=3Don,on
> > > > > > > > > > numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volu=
me'
> > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> ,values=3D2,min=3D0,max=3D87,step=3D0
> > > > > > > > > >   : values=3D87,87
> > > > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > > > numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
> > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> ,values=3D2,min=3D0,max=3D3,step=3D0
> > > > > > > > > >   : values=3D0,0
> > > > > > > > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > > > > > > > numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
> > > > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > > > >   : values=3Don,on
> > > > > > > > > > numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
> > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> ,values=3D2,min=3D0,max=3D63,step=3D0
> > > > > > > > > >   : values=3D39,39
> > > > > > > > > >   | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > > > numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
> > > > > > > > > >   ; type=3DENUMERATED,access=3Drw------,values=3D1,item=
s=3D2
> > > > > > > > > >   ; Item #0 'Disabled'
> > > > > > > > > >   ; Item #1 'Enabled'
> > > > > > > > > >   : values=3D1
> > > > > > > > > > numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volu=
me'
> > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> ,values=3D2,min=3D0,max=3D3,step=3D0
> > > > > > > > > >   : values=3D0,0
> > > > > > > > > >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > > > > > > > > > numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch=
'
> > > > > > > > > >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> > > > > > > > > >   : values=3Doff,off
> > > > > > > > > > numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume=
'
> > > > > > > > > >   ; type=3DINTEGER,access=3Drw---R--
> ,values=3D2,min=3D0,max=3D87,step=3D0
> > > > > > > > > >   : values=3D0,0
> > > > > > > > > >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > > > > > > > > > numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
> > > > > > > > > >   ; type=3DINTEGER,access=3Dr----R--
> ,values=3D2,min=3D0,max=3D36,step=3D0
> > > > > > > > > >   : values=3D0,0
> > > > > > > > > >   | container
> > > > > > > > > >     | chmap-fixed=3DFL,FR
> > > > > > > > > > numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
> > > > > > > > > >   ; type=3DINTEGER,access=3Dr----R--
> ,values=3D2,min=3D0,max=3D36,step=3D0
> > > > > > > > > >   : values=3D0,0
> > > > > > > > > >   | container
> > > > > > > > > >     | chmap-fixed=3DFL,FR
> > > > > > > > > >
> > > > > > > > > > It can auto switch 'Headphone Playback
> > > > > > > > > > Switch'/'Headphone Playback Volume' and 'Speaker
> > > > > > > > > > Playback Switch'/'Speaker Playback Volume', when I
> > > > > > > > > > plugin the headset or not, but I have not found the
> > > > > > > > > > related logic, could you
> > > > > > > > > please help clarify a bit?
> > > > > > > > >
> > > > > > > > > Isn't it "Auto-Mute Mode"?  If it's set, the speaker is
> > > > > > > > > muted automatically when the headphone/headset jack is
> > > > > > > > > plugged by the kernel
> > > > > > > driver itself.
> > > > > > > >
> > > > > > > > What strange is 'Auto-Mute Mode' would be disabled after
> > > > > > > > headset
> > > > > > > plugin/out several times, don' t know the reason....
> > > > > > >
> > > > > > > "Auto-Mute Mode" is a software switch, and it means some
> > > > > > > program must have turned it off explicitly.  e.g. the sound
> > > > > > > server like pulseaudio or pipewire disables it.
> > > > > > >
> > > > > > > > However, it seems that speaker and headphone/headset still
> > > > > > > > can auto
> > > > > > > switch. Please see below mixer status.
> > > > > > >
> > > > > > > Usually pulseaudio/pipewire takes over and does the switching=
.
> > > > > >
> > > > > > OK, I see, I will dig into it, could you please tell me is
> > > > > > there any other software
> > > > > switches in the mixers?
> > > > >
> > > > > Any mixer program can change...  But basically the auto-mute is
> > > > > a task of the sound daemon.
> > > >
> > > > I disable both pulseaudio and pipewire from the Debian, and enable
> > > > the
> > > auto-mute, when the headset plugin but the switch not set correctly.
> > > > 'Headphone Playback Switch'/'Headphone Playback Volume' not set,
> > > > but
> > > 'Speaker Playback Switch'/'Speaker Playback Volume' enabled.
> > > > Are there any other possible reasons?
> > >
> > > The auto-mute doesn't change the mixer state.  It switches
> > > internally, either by adjusting the pin control or the amp.
> >
> > OK, is that means all mixers setting should done by users based on Jack
> status?
>=20
> The mixer settings are exposed to user-space and user-space programs can
> read or change them, sure.  But it's not clear what is your exact purpose=
 or
> goal, so I can't answer much better than that.
>=20
> The auto-mute feature is implemented in the kernel driver level, so that =
the
> automatic muting via jack plug can work without the sound daemon.  The
> auto-muted state isn't exposed to user-space via ALSA control API (mixer
> elements), and it looks as  if it were muted by the hardware.  Actually t=
here are
> hardware that do the auto-muting in the hardware level, too.

Takashi, thanks for your details, I think what I want to know is what did i=
n the kernel driver level for hp automute and mic autoswitch.

I am looking the code, it seems only update the pins and not update the mix=
er, right? So when the headset plugin, it will auto mute hp and auto switch=
 to mic at the hardware level, users still need to update the mixer manuall=
y.

Further, is there any place in the hda codec driver level to update the mix=
ers? AFAIK, for the ASoC driver, codec driver level would update some mixer=
s dynamically based on the routing.

Thanks,
Joakim
