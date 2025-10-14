Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1696C309F18
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415890; cv=fail; b=AF2ApIKCr6UDlc4M7ShiHvSL71rnr4NDWHfQCFb5IOUhm11uLw/PUPwEn3irZNr/mJLDRzIwiPe9Aa1Zvt1U9D2LmmXgkFr7Bnzuo6+RBHUKPX5rTcUMJ0jSCbzYPwBHTaNepfyrBmMVQOn41pdRvcKcD08y341MF15+FO25+XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415890; c=relaxed/simple;
	bh=Vnl535/hW8yy2DZi2EW3U1Ul5QFrHRNmCv+cJdmC7IM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KhnGjM+q2liXb7PjJl8kUPWufm3VLCYGl7ZK1fHcSUmedBYq8s1mmoVrCac2cTbpaZwf98z7BTpY8Ja/6FXAddQfli/Prs6z6BNxE/Or6QhQ2tciXDqGTKv8X7F5IKc27aOV+TO2oQHxJ2IbqdN7sxMExxfztRUscrn3TfDqo8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iF/JimUP; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iF/JimUP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okeJuTY10RJJ7SE97y4s8SjTTnU9sveaEWit9avKJxrZQT3GMYJIPqw18GdXaaXIuw1d3rqEi1YNZXC1smBhFeA1t/CtuiECxFQpzO9XOHMrxauUAS1OBVvW/hwswpU4HNA0+j4Okd4YdXuoh5lRqppP0cAu1NW7J58xq76Px1RAkTmlTQdi1xwGr77k/m+bysh1Ug5/ntkWVr042XyDhdMxfMnmHse6fhXaizO01nc/hMWXX/ACorpPa0IzaXtVjE1vM/l/mW4X+dAxftVO7kliQnMxVOrZxlPak8Nl7rJGt1ngMiumJPkUndYhCyWoa7W88pvKJb+vX7AEXjoArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtBYQeH680LlF6CCQM1FhIenwv44pegimP8LKgLgDe0=;
 b=GhhTv2rM0RvR0zuC4qhKMez4gWg2HjbYYqDZVMYWxOF+JHAn4Ff9a9LNzWSNqvPpa9hm9dulf8aQjIDgSOqglLCRMhFi9RpoRpEQgboVn4eV9Ebg17OPRVpjRbb70THDY/yIjSKxjfpT7H2lma7tU6PXgmX1/ZiD22DAnIvT8EoNrGGbWT0PSjSopFm+ws6utsZuB6RUgMfawtWFh6eMXgulE07w/Ohr+ogGYdNZOmQhLs/nhKi5DRqNtM8tKREB2+7IF2YR8QpIo5YvXFLvkvJRyb4dxgtQugpTA5VDigSESLPr1LRUz0Nmb0KTA1B49fzvd3WTNQ7D+XOT6oadlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtBYQeH680LlF6CCQM1FhIenwv44pegimP8LKgLgDe0=;
 b=iF/JimUPFm3imHf6so7MkgB4RPVfpnqzW4QHuzxScdXzHP0vzbO1CxFLdEY0fHiUq4KDWFvEQHXCS1W3kdbXP0JA5E1v8AEaHhdxoPvS8NXq6UoG4Kytd8LuUuOcyTDOE/EYjInH1YjS0fbiqd8KuJqcG0TPxbzsWkpFRO6kBLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:47 +0000
Message-ID: <87h5w2p0tt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 085/139] ASoC: codecs: tfa989x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:47 +0000
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: b4acc280-5934-4496-68b1-08de0ad99bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qTXHaTmYW/koRvBKAG3Tn47y5M1lUXcj9LT0ou07tRrme1fY9xUY2YJIK3tr?=
 =?us-ascii?Q?KvKS62i3TjtU7Rn4eMKSbgqQWKcG4njENfBCsX9+u36o4B0Y0fc2ElVtqsdg?=
 =?us-ascii?Q?HkV5Ltzbb+xMCGmZ+Y9ii1pfbQ4HnMCgxeRIRPYrJiyWpiOGxc8FI9Uj3Im6?=
 =?us-ascii?Q?9lqenaDanMvdEVj/m/Rb20EaAHIr1UlV7jt8of+BssmCSjAi4M6b3mLzwApM?=
 =?us-ascii?Q?K7bHPYNOFlDlMyjoNX892/k857nSXgisAKdGnabAtRSKYiKD4qD08jx+SNTZ?=
 =?us-ascii?Q?DpjoIBsqWTox8Hi+KEhSFEf3K3/+8x3BhyS9QWjGSZYw+pNBMxsnR6CEvKxE?=
 =?us-ascii?Q?jgdGcU5w48AOC/OR4M5+26e55ZVCY0mxE6BFeM06IW1AjPH4Ge2Je+xasnBR?=
 =?us-ascii?Q?mryjWSjyM3bpvvGGhRwXEgq/zksaw3M764z9gbkOqdqRCFAMyXMB5xs49mg9?=
 =?us-ascii?Q?DzOOjTsslqLLJ1EYP3rVX77KJi0ND09RkKmCRXy/00EUI2xUEN/kV271VeqO?=
 =?us-ascii?Q?wcm2HJDRIymy9rw1VjN4ZwT/xT3el+13/x+gM4owJuOnXYyArD++COj/P98u?=
 =?us-ascii?Q?8KecIVMW4NdVhpnCJdjG/j9dG53UwKNYehImqxw26kUppg9StfPQjY27WzFm?=
 =?us-ascii?Q?kx+Gt7OBSfqixqgHgkTu9NqyJlVE1i9d6xoU4Vh2QWVPAvdthV+rVKYYghn1?=
 =?us-ascii?Q?4XcWhWNZGBYIjHzl8jHatajVaqDwhiTf5tZt5T/I7zUuvbTHwhibHqGABLry?=
 =?us-ascii?Q?YFsweY5RsiMzdxhq91uHM2giFAWY+DTzuGA2yJ//LA0c+Hd6nP1Xx2yrtHt9?=
 =?us-ascii?Q?m0gfm2hmgoXiPSaQvKEg5h6+Aarojz/9fEvHPd88ETc48ZwjpA/5NSN16BQ6?=
 =?us-ascii?Q?nHUA42fc/51Nob5TAaMTPaD8kdIg16btsYsctMK2QTfTRdxF+y5K4QQQmLGf?=
 =?us-ascii?Q?9WZCGbJL2uVjCsreXJi8oVexeUKJvT+B2wsghNb5z+AzzJeklVJaFtUXZt5i?=
 =?us-ascii?Q?ZbbmNPnSd/XhCqk9nwHF5gNqHZIocmo1ps5G6Wv2TkNrFPV7tNrUyy3mDvf0?=
 =?us-ascii?Q?B92O6gc0Nh6Rs99wZ5RKfg3I8qRo0P6GNGOjZnXGgzF6mkoGVbBAF/1kk3Dg?=
 =?us-ascii?Q?ON0W85lTKFKn/KrPDeX6gfzVTkl/JehkLxwkZ9htu7ZisA17GCzPh+5bniiJ?=
 =?us-ascii?Q?qDJRH1PBQbyRFm1KALBE0Zk88aqrTx+uleURY0FLAJWfYQWtRP08BjPT2fg8?=
 =?us-ascii?Q?IP4V5fMZ7+/zezSbdshmhDwQCP10wqQ3K4Ze6uWmAsBVCwSBYQ87l0qmq+xT?=
 =?us-ascii?Q?wGw6AOw4YOGGBDmRFL6C4LKgmYutj7n6XNHinXPfKCugY7cLXPr5mp6OArqQ?=
 =?us-ascii?Q?FeOxBJTOKY29tdMK9c8JBoN/RtGR62tehun4J5qLFxr9SEqS//A9H5eRVFQc?=
 =?us-ascii?Q?WsGH1nZqNzBqldjZf88Fkff0yLVcqb42muTUD6E6HDKLGv1pZbVLCKuIEdgn?=
 =?us-ascii?Q?iICzBgu81zf41wrQawqDTardvQODX+dj7+6U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dK8riYhaf12CU5c/JSa8D6BQLDRJ69wCvOsTWtJRJXvVsbpNyH6kIODXulRV?=
 =?us-ascii?Q?dv8650IzoEOFwH30X8/H1LU+CSZ2xWvLF69qj1zI2r25SaLTVUC7PepXwizH?=
 =?us-ascii?Q?eXst1sTSL8qJx41vV/I1i0vW+ab2wRwVotKr6NJvEdBKdr3YvXwqvOOZE/Hr?=
 =?us-ascii?Q?4hLZlMrUASDY0sMNe4fsenYNaabsfyUSSi1LBIu6RlNwDhY9Inl0jVd4mkXd?=
 =?us-ascii?Q?l8Z+WyKSU6iKOYvrOwm7DeXBjqgxespMIVzHQJ2BZO+BlkAEidBfcU0RBUgK?=
 =?us-ascii?Q?G67gcYfzWUwMPOD1l1huR3mlYq/hwfm78962Ftr0wD1eoJ//sBHqnTSnn1zd?=
 =?us-ascii?Q?W55NoTf/4XoyuNmglau14ELZ0KB46/inEqFDCCvKUvUXLinua9DX8ak9ZDGa?=
 =?us-ascii?Q?CSFm33ZDXkpWmBB2kgvUjfWI2hglruLqtRiXCLll92xRJ3LppdrWXz9P+15G?=
 =?us-ascii?Q?KDkv/LtUH/GbPJDEsCkYr2yTgwS9+v8CWn1x3c1SFRf8UL1cF7R+IUpGCXOJ?=
 =?us-ascii?Q?+6wNcxIa0aFzeLyGFK6ur89SO5QHbunJK4b3Xk+TB9U4MHygoY9RiWJAprLv?=
 =?us-ascii?Q?v9lI/frCmXsiyHLw5joNwyacS30LhS3S5XLgE/JmWaKJvApIxRYibSBYPLOP?=
 =?us-ascii?Q?uZHcM4wQRa7qQTuGgrgXmXcBNDujbNhQasF2bZ5ote2isKmqlS6mWa34UUBU?=
 =?us-ascii?Q?ZukbEbgSSbv8XYVgBZr2wojd7O5YPuBgvBav6QMPEgqqKEbB9lA4toYA7qaD?=
 =?us-ascii?Q?wYBaJzuZHKXvA0ZmzIVkA+amxop2UWaeRYZ9cYltePGHH3E6TI4zMJEZ/yxi?=
 =?us-ascii?Q?vNXPukC6+7Q3QZxajSVxM9/79JpghdAXrk5H+ez2AptirEbNzDLoE9RcXez9?=
 =?us-ascii?Q?Abpk1N007iZk3iDBLkDDQP2u8d4yJwA1WJ2y4GRqTEnE4DZKBnpFSULT+VEb?=
 =?us-ascii?Q?p6ym5h5TKrvO1UwtPlEGPKg6XW2pXRl2VpUBvCflwuhDlJbWciRldkPOszJw?=
 =?us-ascii?Q?qw1mL9GGrPjVtiyUnn3UNec62RdvpENAurecSSWJR2zXzuycosaSjklIa42j?=
 =?us-ascii?Q?hHqKRwwSj1E61VWSfRnTj6eq03KDmpfWMAVvYe2i57mO5hE4rbWAwltFm9qu?=
 =?us-ascii?Q?ubgmwOxbsjU1j+JZxy95EV3YmSF83xtfiIg3oKqfTqf45WFS2sl6XiXZ3jtY?=
 =?us-ascii?Q?wsKUB7VRuz2stk/AFoe+T9iJRY8UrnBI9fRWbCw2F+W6THo0/ve0SBsQ2+pb?=
 =?us-ascii?Q?4i8jdFFRBcwo0djyFuAk+8lYH6mWTCc3MARB5xOjcC7lkYBHXe3etmf4kwjq?=
 =?us-ascii?Q?ILPQ33O2esc8hBflg7IRnBsdyyGzSJTvZrQMNT7AIVnjHzDoKFivFy+bNv1w?=
 =?us-ascii?Q?TLlbQ0HCpQ3rVZaH9Kfc1j46q9fvdDwJ6thQLY4Ixh7lxH5Un3iVKpTeyYs0?=
 =?us-ascii?Q?mGdXxw9Ms5ed6iEjVT8akRnzDPHuZc90BM1L6N98ZzZL89+hcwvnSLWKbWhy?=
 =?us-ascii?Q?Llv87LCkAe1/wA9Ttuab3xEOx/soNed7QJbvCAPnmKZoXT4bBmGAmfEZbyJy?=
 =?us-ascii?Q?1IsENHypsbYSzAEOikt/uHLuskVGR2mvKKZag2uKwy/3dbJHubeCNDom3LSI?=
 =?us-ascii?Q?wd3D5lGis+vE0tQft0VdUj4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4acc280-5934-4496-68b1-08de0ad99bcb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:47.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hnwzc7m4du1HCH+ABrjWV9b0YeHePWALf8USB0dWxS1Skb3jcEd8kGnwFuDbUiORqi1+BKs644IYuhmfCVPaOMOGjfuZuIAhYIfRmW9AzEIOp0YPq7nW5fDG+CN3CBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tfa989x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
index 79847a90ac46c..7204be155eb96 100644
--- a/sound/soc/codecs/tfa989x.c
+++ b/sound/soc/codecs/tfa989x.c
@@ -105,7 +105,7 @@ static const struct snd_soc_dapm_route tfa989x_dapm_routes[] = {
 
 static int tfa989x_put_mode(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tfa989x *tfa989x = snd_soc_component_get_drvdata(component);
 
 	gpiod_set_value_cansleep(tfa989x->rcv_gpiod, ucontrol->value.enumerated.item[0]);
-- 
2.43.0

