Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D3430ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416012; cv=fail; b=jR56glwQRcndsoj2nKTgCUDSaYOWzXFW6X5tDS5WROqG8bkHAAqR17c/3DhVJv09M27jq3PH+tJtaABkEI4759Fh8rL/olTa/eAbCMXsWMKoQ0Sn3WR5ET/FLmQ8+Z3/zYf6cKr/3oryfSTx1U/ISqV1fOBh6UKCGseWPt0mRFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416012; c=relaxed/simple;
	bh=tgEVXGZk22dvsijy3k0wgZ1gZtH97k6O6z8O72i3Fpw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ON6hHSN/7onmuEk5iUEFdqHeg4A8tPvUgUvHMSRi7XiqTzo3oqhklvlp9aLzbxWuQYwTqbZuMUDZYpX3K540Wt5cdS7xIOEW1fr92yhGKJN7DzTPlQPU9+RjOKXxoAhlNkluxViNDV3FMzZjxmqSyRrs0r7Ug/R0jAtD8mm6ros=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EicADrGo; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EicADrGo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2eSzWEFHGBsOOldNOubwUCmHmKrxolzZHDgfaH+jGyjqmiJUTmJkHaSALmFHIwrktNJwCDAP6YMv5zIMyJIctbCWJdxo5b+Pf3h68095nPOyBK/+6akx4V9KWQNa45NZAejGeMb4EmUyzc9DzwaMgnFXgpChqmiAd8eIbwDc3gfSysBW1x1La+NCaBT7AD/S4HIU+8UG3uedf5eqMLA5U6yHdjMnM0J9pKROCxQjTKSgsT+oawbFED5UoNNGdnXB95GEby7mVOco4GYhcux7mk+VjMDCcURAi7Tshlc0RAHRl27hMSxLlVt6osu92vYNr+CNZhP0g5uvxzAGsHljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdIBn8HT3swMjfxf1xFol6Oz7gyBVebLPq+T0TEGeWg=;
 b=lSOVprOpR/gOEu78HQ+lloaBt50BbUac/6Ok1FCliS12sWJYL8Gzou0cPp1D3cMIeIlvlD+R0z2oduBlUftTLdt5zzgSAqxJQkFNWYZDPnHF9MFQ7tngAaGwpVwemlvSPHK9qHr35g9cF7dvr5JdwSem14sLRpGYHlHu8Ryodewuz2btbW9ecS8CX0mq2hZf57/2iMruV/5m4VINqCuPc+HM3U6xuNjU194RzvAMsPrYw/rzpYRaZkUmByt8lwT0IWGsU4AsWHqpE4iIzYp5FERNya05Ns9ZATIojfaplQKu0DSzmQ/vAz3igYMQKc1QC+IFXhPMe5cCRxCJAFSqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdIBn8HT3swMjfxf1xFol6Oz7gyBVebLPq+T0TEGeWg=;
 b=EicADrGoPlVtG9hdp6tDf90tpB6o6cRKTDD692EeFRWCJO2J+xtU1WyUV1gmpUAQilj9ZQoahNJb8LEs4t5LkPE8NREpUE4r6iuGgx0dJAv7zqfijfBYT+aUgo81suFsuY+csvcQ4Qho8+UP4T8dlmh+uvaihOE8DytDvzUjIro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:48 +0000
Message-ID: <875xcinm5z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 118/139] ASoC: codecs: wm8994: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:48 +0000
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0ebcf3-c462-4024-ecda-08de0ad9e413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tRvh/PpTv3P6euDYS+ZFjqFn30W7LlLaKKiMliTGJABG9ta4qyEoHUCn4AbL?=
 =?us-ascii?Q?q6ooxkxavF6+59Hw2JSmG+yoqWnVUWDLF2UylHPadrB4ipCCDYCxUu7lCKXi?=
 =?us-ascii?Q?SpSfolK5izgyl+KvoVgy04KksQO0iwe27UwTZCn3m87JB58FBm5QH/fXvM0n?=
 =?us-ascii?Q?TcUxjlrCcgTXxV19Vr0nyfbaa8+jaFk/umSt+3TbBLojr3o6JiPkNiqDX41w?=
 =?us-ascii?Q?ph6+ia4UnO/613qMdaXgB2dqaUqAajfVPBa/OdzeUURKOERPPDgaynu6zXzO?=
 =?us-ascii?Q?SQqhUp90F+So3JPX7toScYF0D74u98TnZDga1WG7JVNclRtiE9ziAAwYs1mn?=
 =?us-ascii?Q?xkOUyySNNm6rQZeXpW4up8zMIKs6PbtzdUW9bD6pE3+ZBsdDOaJ64YyUPZgu?=
 =?us-ascii?Q?FLQFiTlBEHB8KK6wUoBp9zUdmgQ/NgIJIb5Ipihvd/Tv+5FuTFkAF4f1pzWt?=
 =?us-ascii?Q?+8mOaez/0k84yE83Auce0VSJ1wpbD8tp+fDAGgki8Xkct+RZCm5wzsUc/Eso?=
 =?us-ascii?Q?IXMT/8d5Y41kcSYRMRisfX1alBFjuziZiqy5wiwXkcQnUSZi5X5jpoDxebFB?=
 =?us-ascii?Q?9SkF0HXAfxMhnInMF0OW302OVeGnjOCMvubfFB5/5td4nG5QQ6UZ9CrPPpsW?=
 =?us-ascii?Q?9SCEq4VNznpQQm2wn/QBoA/0Kyz2v9c5rah1+2Y0X0yqiMNR3BayU+pdoRGI?=
 =?us-ascii?Q?pAATsUtnSDXB8HM5yrpR4n4nVKXPxKYyskxdaUOGxYfx4ZNvASdrzlgSAMdU?=
 =?us-ascii?Q?Y7QGS5po8d49KfSij+LmtlamGamBuoc12rGCaCxO1dN2TOPg7FrXp+Bw5vYN?=
 =?us-ascii?Q?cn8Oy3PcRUHqNFy2Bm4k4E5J2ZkTU9SS3Wf2KNvFHoSEHvQZVr/Xi+2LpkwZ?=
 =?us-ascii?Q?yXDaFzY0Gnkxp0N5+NVSeO8H7jz+bXn6F4A9p0QlyVJSdIcYLUtFLNzB47cP?=
 =?us-ascii?Q?XPXwxQhDkFPmcYCeSYr7pFAAZxvvl8tqIkw8cYecg33j7UryOk1qyzcRIEsa?=
 =?us-ascii?Q?eBIktWehFNx7/sycuUIrREPKyIf4urOcdT179voVe4YNPtt1w7nxhyskmH7p?=
 =?us-ascii?Q?fZzCi2DOtBgaz+XVKQZbeYZiOub/J3uFCsdZZeOJDvy05xI/ePQ3knv8t5vO?=
 =?us-ascii?Q?Ur05RHAz0n+K5Oa+rgmKgSgt6j26s4X4C/NmBCC0H+vQY3JZ5CR4IzMEIWSQ?=
 =?us-ascii?Q?cRE7+6nXhRUC5N3y/tdShech6xylhpWAQHIY0DX1xKJlW5LTUc834z8EY8/z?=
 =?us-ascii?Q?W0P3Q4+MtJ5F3n1FHlISPz+YnLALi21ozqyxvW6fGXDWsSnx2xjJPHIcqxyz?=
 =?us-ascii?Q?7/gb8WC5DwEbEZvOPhFdt9qul4iA+ysnSTIi4HsVsUPlOC+d3uUwsVuHwV8R?=
 =?us-ascii?Q?c4mwDSr3hUo6acY+4MiIUVy8S+wQ3Ih3sf4tjcnoJRTOc/I4r0DGL81zf6la?=
 =?us-ascii?Q?DVnfua90BZ3VAdZI8hSVAhPRCFo1ruUhyVy16BGLDOGRC7Jn9Qmv+bdkxxZr?=
 =?us-ascii?Q?ZFkp2VlXT2kc+aHZSETk3y1GscyZo0XudEgu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0r+deWFCfjAweycXM3M3wEEtk7LKvlcPNqGhfIZBVyFK46g9t6ZN0MVk2NVb?=
 =?us-ascii?Q?ftiwPuNDrnxrnMC30k9HZgSn6ARmaBJddsc0x65zbhFITOF6wlbefeokMdJs?=
 =?us-ascii?Q?PIEyGyUx5BhsdnAyXAzPenTcCRJCHeMyAupKOQ3O2GUhXZfWrYjif/Wl3mCE?=
 =?us-ascii?Q?C5SJXlyXdR+/EHXuxeATsiIgH4EhYroEdcOFRz4oN0HZbYmrShklb4acbdAp?=
 =?us-ascii?Q?FTvxlWWajXqTI+FGFWjAg4/EImzcZf8+eASlEEPbwcxeAUjifQDWdvHEaMzj?=
 =?us-ascii?Q?OfWma/xFmD68fWtYViEgkFhU5t30IzLpIS1mwbBY93yWoZGe37HmvTYcbiWa?=
 =?us-ascii?Q?fCitbVmfvHhGDvKuLfZDYdu+fu4JgtxFDFTtdjUjgL+Xqr6vYhfzfVu/niOQ?=
 =?us-ascii?Q?P9wD1onBV5a1+fqEDJV9FUY6i7vTvoeWio0KSGjFc5wrO4WckxDrU5ioBlq/?=
 =?us-ascii?Q?SVIArywdl6ogn4MnQ6Lx+AiT79naBZEEoXv8sPRXKa8Co3qha4UteebtUxG5?=
 =?us-ascii?Q?anfXopyVK5O7iGKcTfTAH/ygF3I6HQM0F1+nJ9oH0Qk2eWQtN8iUDgSLz8kz?=
 =?us-ascii?Q?8PDUXh8M2l8saCAx615MKD8+SFCcNmE9nmN6NaKcgoLk1MUqMJmprttT6DIX?=
 =?us-ascii?Q?kyauXQ29pq78DcWUIv8ovpCabphnefyCz7OniV9ADdMVyplaTZt4en8En2ig?=
 =?us-ascii?Q?tD3SUKiraDOPlQ5peAByLJ0xw2op4sKuGGucuXUu3hGSfI3PyDuhIUzEml6O?=
 =?us-ascii?Q?PexlfaFylKnJWE94kfOenoupFVdd1AJsBiLJT1tnCET6k1QOtRA9+FUwZTSs?=
 =?us-ascii?Q?P/6M+CG3RbYgtJCEHJPEcuSjUNFExcYuHQBSs08pYuFpVVOQWWl6eabZk4Mh?=
 =?us-ascii?Q?7M/RCnQWlXFrDpkkAWdyNQr7vzik5X4Su9HKB0A86vtdGxmqllj+Hw9zuK75?=
 =?us-ascii?Q?7LwTk3+4InZZ0dLEH8LWqLj2mSFWXybwZL+IA6b/feHjbZr6Yu+aA6PCHAOh?=
 =?us-ascii?Q?kDzz7O2WodCNBEe/XYTd1VZJbDeL46dhxps4B/e38sU2O9AEMgJpl7jKooqs?=
 =?us-ascii?Q?ZY0tt0ZRs6XtD0rnXRzkgZ1RYke1ie2Q3K1HmBQtZYk1CEgRxFddmr+EhO+c?=
 =?us-ascii?Q?dbpQxLLi10KW780hA2PzOkcD1070IfcJen9eLMD+6fKPCxfd71jHEMI9zTbq?=
 =?us-ascii?Q?1egZCnhXoSSi2n3cvya4zTBLPy3o1N+PohqLf38RNmgSaXsWfrOESVIwb3hd?=
 =?us-ascii?Q?tTybNbcW9MYQrcyooPEF7ONB37bkpaYhOa1Ky9yE2NtPacw0q3f/4Q+HtYk1?=
 =?us-ascii?Q?uyGH+BDrWAs2DyoCDC/4lrFoc/S5KqbLUC74PUnN7pJoZXtn292Ix+2cB1LE?=
 =?us-ascii?Q?nuqbP5d2l3sAKdsc8QOtHzvLwGN7f3+Y5OtFZjoI9dq+ovNW8NiNrrKy5TII?=
 =?us-ascii?Q?dnAGKxLfYCvuHhfmjy3+ZTEq9xGIOGkIi5927LFfh9VdZGH+o5ctvjuEzll8?=
 =?us-ascii?Q?g+aT1uLXqlAN5GATD8t4rUwn3AfYmB0RPsKRQUcV9i7LwQJiOw8LBBLOgju3?=
 =?us-ascii?Q?/xuIbRDVHGYbhV+SUxYD0jJys+RHXKp1KOSllNO5uBC62Zsmc1DRjYc2XUYQ?=
 =?us-ascii?Q?FmTe3Qju0c/IrjtqWF3ouvQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0ebcf3-c462-4024-ecda-08de0ad9e413
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:48.5156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9e6kuhW7A2DbPpdDQ/Ypz7/0XlMeVvai62LevDFw9Lp5S6K5dLP3PEt2bLll1t+V7E7bXtn91BscV2s8VRB9+7wsore9H4UXbiy5xv2G+k+D0LOYombiI2iImdTVRYJ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

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
 sound/soc/codecs/wm8994.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 128c3a59beac3..616d7d7e50aa7 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -301,7 +301,7 @@ static int wm8994_put_drc_sw(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int mask, ret;
 
 	/* Can't enable both ADC and DAC paths simultaneously */
@@ -358,7 +358,7 @@ static int wm8994_get_drc(const char *name)
 static int wm8994_put_drc_enum(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	struct wm8994_pdata *pdata = &control->pdata;
@@ -381,7 +381,7 @@ static int wm8994_put_drc_enum(struct snd_kcontrol *kcontrol,
 static int wm8994_get_drc_enum(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	int drc = wm8994_get_drc(kcontrol->id.name);
 
@@ -465,7 +465,7 @@ static int wm8994_get_retune_mobile_block(const char *name)
 static int wm8994_put_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	struct wm8994 *control = wm8994->wm8994;
 	struct wm8994_pdata *pdata = &control->pdata;
@@ -488,7 +488,7 @@ static int wm8994_put_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 static int wm8994_get_retune_mobile_enum(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	int block = wm8994_get_retune_mobile_block(kcontrol->id.name);
 
-- 
2.43.0

