Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AA630AD10
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416050; cv=fail; b=usIzbWw/Ps/J85EZzzELMphZ7mL5zcficz71dyefXE5kce9uNwzfl667C+Z7H/cTr3oQV9JiqSifp08dn3v3MDnIRl7kzmg1fSvv77lNPvB4meUStnuor4cyimbScHQ9Xzo/wg+JREzhg66rCm4RhhQqb3Ab4exkUQuLXVVN0XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416050; c=relaxed/simple;
	bh=yo6S9ZZHRDjLvqEI+M1sEpc3d/bJLmg6j3pmQaBf9n8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tzAiCPOqfb4iDLI9smsrOtM737hN8YajxWI5ETp9S4hQ4egusFbrO8aSART9xpspP7J7AGWKOUTeIWm/jk+bCkPP/kopKGG44DiCKYlfVjQKGJZ4rjTrXs/t0ty6w4n7vrWinfs/dxqN+i6qVqYCZmc01cKE2nA1r9dllqkDV5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KVNNEKNi; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KVNNEKNi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qsk0/PcCrPkX3h5ZvAiPKUNmVgDn0VfkYPAa4CFbVQS/qARX3vqshg8LrvZeFkx2qxRaObl+Xel80yuAFZY1zh1m7RQ62fD5D8oYUp+LTE+oE6a+mB4x8+Xnfob0kjKuRlN7lrQvnTqXevwP/XNRgewosyxAz6GxZiKaHM+OnNvvCJiUhciWjv+tf9Cz/pbFiGsmv9KrPoCksLEEjwLT29KuXlJl7gAqsMZS4nvW3e9Tl8BgSMnETuYb6b+yxV86g2lnk+uxDexCFPe4hH/jT28Wg8iil0WnYs6/6QGlm3Pho96w/MIs5bhbeVjPzeoGmJVzxRL7qmxmwQnFulWTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPFTkjQ+Ei0nYxJ3CE2Poz1i+cnVcBFZz5rySejWd0E=;
 b=Cf8sXITYC6+7Tka1OMlDk3GHpRyT/KPgQDLhMCFhQZi8Jp1hIIXMdWJkGL176Pk4vsHB8Kz5gNafG/W291qEOoFyh4YWd9aJzIZ8ondf10TPsghaa3BknR2s8LCwuFdNoWkt+MPPkr7fwo3CK3A4nZZ/atVx8FVhP2zGmZlnTgjDPJlYnbnHwVFtjfwYkjjNte2F31kDqnkz2rf1fhOIb4TX1xrQZSH2MRKfjmt8zr3KBLGRoHqp6yuf53SOX3ghi3anvo+TOPdCYLbM1by4dO34bsM8X9spfGBMKDiyg07diBXply5zGYd50xNY80XAKn3vc9LBTcb4zZXe+Eb4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPFTkjQ+Ei0nYxJ3CE2Poz1i+cnVcBFZz5rySejWd0E=;
 b=KVNNEKNijDRKqRNr++a9/NvtQF7tg2u5VR/so8sxc4yXZIoc5GzAHK7d8B8cSdlce+cq08Zp+yf7lOC5sV4JW8UO/I/Mv7FUE4CdPmv+z3Z9O9xPrJ4RcKLIquS8pamN47uFgup1vzKd7UhepSvg0EqE8i3Iv7knuC/6btr/ekM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:26 +0000
Message-ID: <87qzv6m7kh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 128/139] ASoC: intel: catpt: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:26 +0000
X-ClientProxiedBy: TYCP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 6420b394-2771-4ccb-d61b-08de0ad9fac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YRoNz03Lvcq0hFzDSdkRbTNB536rrNZRRqQrGF6yKuPLxxUfjMXYex4S1LlR?=
 =?us-ascii?Q?ENVY50nLkW8NtsmC9/4K7EcXWR385GZrli46fu5EwxP3oJhCqywkoamXLHpc?=
 =?us-ascii?Q?N683XBlnuAZup7TS0DR/WmcfLwM3O6f9qJHV/CwEPNA8GRC1nSk3ACSBdOxK?=
 =?us-ascii?Q?eGXSROz2cPPELbxNX0sG9zndycXXEBh0wH0v6AoVBvNa1BclCKIfO9yFYPP5?=
 =?us-ascii?Q?Prd/8oN8HUQVxdQSJLlLzz0wT1xdk4SxxEntQYV3fvQduQCyEokxfHEc72Ms?=
 =?us-ascii?Q?HnJnHz5f1qAQevq65t/xTKJE3eSOTpNk8kyHPS4wwP9UdM89Nvb4d7kfx7nC?=
 =?us-ascii?Q?XXDu/sF8/d2rfovWCuEij0UY0H37oizG/pVkjw5Qcw0izCiwPp1whjwgxscY?=
 =?us-ascii?Q?CKj56ezLcRaLsXhkkNOINuvq8oZr5sKThDtBlB02uChTTbliQF9BDWibp14d?=
 =?us-ascii?Q?i7+0xSsacZZHZo6U4Wsmi0dqEaAy/JeqnTvkfcuUUrQl41NBgx8FLljIO5PS?=
 =?us-ascii?Q?MOExRomqO1Ahxs4A4/MwUJndCZq0QzxGCrwdfMiKH4m1yxoyXeTOxtRw7+fF?=
 =?us-ascii?Q?VedzMuIS8LEJoE6Jl+ORkXrfceJkIoLyiTjt/GGhuaYPfKnPsgdaNf4ihsE0?=
 =?us-ascii?Q?qujxym1HP0AykDJ45Uziomwi0DA/VTRZSheS83ZKb26a2WlrnFfRLr7OhIcN?=
 =?us-ascii?Q?kE/xYRJ1vVpeunxqFn3M3pGCJp+2Ww1EUGuJiSqkL9xhRunEwWTjAttz9ule?=
 =?us-ascii?Q?rdqAiGhn4y8TlbIPrKCDX7pEtx+lxBG0ZenB8jy5zl9YmcQMr1ucHNs9tzut?=
 =?us-ascii?Q?+7L0jV9UbkaOfAjk2kKoIqPu4ZzVVHG4Sn8COhCtUi+Vn7+30+STu4Hym2s4?=
 =?us-ascii?Q?L+npqBQYsrGDAGA6ncjgkEI8UiM2FhjFWDMirHn+SU77V+7te62yYEoQmc+U?=
 =?us-ascii?Q?o9aCSxnxNV2lYfIa0jcDMkkPl9+zwZP1Xwdf8zmvd4T8BDC2Q009NtA+mgvr?=
 =?us-ascii?Q?3W03ElzEMkC3+iYYMmu9Fae+U6eMxGOZ5Ze+lsWe7Bz0CpiBSOTQMJsdxYYd?=
 =?us-ascii?Q?9MkYgDv6TJTflJtIj0rFQH7OJ1W2VtGia7q3+sYFaE5tBriwKNYy8NjMGFrj?=
 =?us-ascii?Q?nLOOHbeWQEk6GbLuj8BQOzOF6fLuP3BOkiNVHmd6oBOZRi5qg+JVG+CcjNBx?=
 =?us-ascii?Q?VvBLTmS1MfuNszkut3ueDkbMAUUa+5np7am5U0Ad5+d1SjvHL0Vko9P8ccMu?=
 =?us-ascii?Q?R96CP0vYfoEs2reDuSf0w8ib2/3Vxpzc70rZMHJc50WoD5rTO/XCiF3T+Xt6?=
 =?us-ascii?Q?7uJPTCTpyQRG3aenHiazxv+cTBo5y8nOXa1xYMtpcmbU8NIVqq0LMDqsdMv+?=
 =?us-ascii?Q?+StZx5d945/uCb5Q1qYNMIAi02dHdgyJ9yMjfnNOIwQKwsquKcQoZshOuEPZ?=
 =?us-ascii?Q?9/FWEXk4gANRGqVM6MKmmJtV5c06mwXvkidnDTsDqB7BR+HBl2DsMxi54WtL?=
 =?us-ascii?Q?rTKN1sG7LrXn+AlUs6FnJbmIM8gcopcPPfe6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SYz4f025YCyDRgwnBju34MrlSAj0eLYMheeGiw6swaps7KKNX7iINxuBlgl3?=
 =?us-ascii?Q?yBoVkyDFHbikf91NQqEFj5nlrIipqYtNuoX9E9p58ZXEvF2pQ1iEZGTGDsDO?=
 =?us-ascii?Q?LczB6F70pXVuCAcwbfqP0+717Czwf8Dlozgw3sMalXS97rkZdU+UKyWsjLSA?=
 =?us-ascii?Q?Rf55rNh+g9+AZOhK1pRpAFeIr0xYExmO3+apE+nIzeKE1hXVTfUjSx1SkVUB?=
 =?us-ascii?Q?OnZzUUeJfq9GuL1d1St2QvjQgC2vJbLnWp9Lg/riTh2ncVGNGe1OxX0QBk2x?=
 =?us-ascii?Q?NUszqB0lVPeTy7wFzTCLyPtiSIW8V98O7htlHOpljO4Y8ByWDvErOxsxl+rn?=
 =?us-ascii?Q?F3LOAEwEz8vpmznoa7TEYdWNv4+E5Maf+3mvAGRbFPZ9gVHABRbn1UvmyLSk?=
 =?us-ascii?Q?YPIO5g2TmyFu7PLM4GXmY+h9ARbhpwBgfYndsJ6lfttrp9Vj5jEX+NpcOz5i?=
 =?us-ascii?Q?WTsegkRFlZiBhtSbXvvEW8/XozqlQvTT5oviTqNBDjlCXE9yg4rWHXw0/iXN?=
 =?us-ascii?Q?ldjjiTSTv8TuzX9geUyCoovjLISipxgO/cCqIwR0uUECRs7kx26wYJILyGNo?=
 =?us-ascii?Q?IR6zulR1Smqh0u3JVeWIQSzvUK0U6GmSthox0POU/47L0gXx6jFqha9i7ihm?=
 =?us-ascii?Q?JkvIuTApRvCnQ1OaS4TllOJwzfdXOg5Bl7uA+3V8SyraEdbKvhdWeUFWe6Yh?=
 =?us-ascii?Q?5thfPPTNRKRFzeQggv54Kb9dRSUp4WhnVWTcS9/rD+xLcLPqjCo66LyjiuJd?=
 =?us-ascii?Q?C/0e17MsgV6q2+l0T25AnxIjg7nc7aIf6d2d/RD5vDvNvquR4KcOMkqiQtsf?=
 =?us-ascii?Q?IC+aWgx6RI54bD1YKw1WKLIJAlCZHKbL4YjhIsiv7kIYgAvj9RoV0g/lkvVy?=
 =?us-ascii?Q?UvcrKp1OCVd7r4CkToD2/KvzDUaiAF/wj0Uc09VVuinET/rM1pxuv6GaNIbl?=
 =?us-ascii?Q?DmCFpkGKea5b03eFDWjazx3SfKzb/C+txERM+b13LJ80C1p67uQEiai7bVes?=
 =?us-ascii?Q?xcZh6PDZSg2m6PP+GqdzWKDI+Sn8ntUfQlZgjd1G+ocsZDoUtAfh+Gl9tMA+?=
 =?us-ascii?Q?M2oAfA9+oDxnziHFMGdoLxcAGWVRmQE+5Lt1PVGv5ncgzOtHGvfMnXD4gNJX?=
 =?us-ascii?Q?j0hqhalllf2Sct2iVKi/yNhncNP7MhjcalzdrKFzZn8heue/c4+cG4BwMoHV?=
 =?us-ascii?Q?9jSJgCdKOgg6Eclkf9fFJ627qBy4lmUmRnU5w1qAyCrRLsbKLVxJnc3OtHl5?=
 =?us-ascii?Q?P5zWaSBulbLcVycA2ew6uAyjSQRM0S+8sApXlOyGdBtmvs2GMk5p3N4TqIPI?=
 =?us-ascii?Q?fe49WjkxqhSaNkCU9eyYupKULMfOoT9q0v2XlrZh+Pv92gbMZnXqJotyHvJ2?=
 =?us-ascii?Q?RRCTG8ExzSKo5ldH3rpnXn+rLdnRSGwFjGIrst358p5uk9de+ACdNWbAAGUa?=
 =?us-ascii?Q?Xm8u4KAXoXrvzE/LLIt4S9HwdywLonT9eIDZq7f37+AmBJsGRXlBGpyIxgs7?=
 =?us-ascii?Q?nPsYCyTy87QPm5ixfnVsFmed8CU2cTNKIWMjMo/ElMoURCzR0TrLbGjBa7Wu?=
 =?us-ascii?Q?2WZ8/jemaiOVEoiaXtLUy0VzIyzE0yGDN6O+jgWTgKozjfjGDy4LEl4XoKeJ?=
 =?us-ascii?Q?8nMv5pPP3ihy0p+zhyYYrOA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6420b394-2771-4ccb-d61b-08de0ad9fac6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:26.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyOqvHfIFS872nnWTlAUHe7rK4F8XB6c75Ra2gr29OgwwwwYQlDEtGgKfC7DZrG4FJfqZ84oV4j71WBCbSTR7wnqaaQEvhy+SLGtBs2PKTnYUqDeCXeqW1YRzQlcL/uI
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
 sound/soc/intel/catpt/pcm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index bf734c69c4e09..f15385683d9ce 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -865,8 +865,7 @@ static int catpt_volume_info(struct snd_kcontrol *kcontrol,
 static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	u32 dspvol;
 	int ret;
@@ -889,8 +888,7 @@ static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
 static int catpt_mixer_volume_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	int ret;
 
@@ -910,8 +908,7 @@ static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol,
 				   enum catpt_pin_id pin_id)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct catpt_stream_runtime *stream;
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	long *ctlvol = (long *)kcontrol->private_value;
@@ -944,8 +941,7 @@ static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol,
 				   enum catpt_pin_id pin_id)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct catpt_stream_runtime *stream;
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	long *ctlvol = (long *)kcontrol->private_value;
@@ -1021,8 +1017,7 @@ static int catpt_loopback_switch_get(struct snd_kcontrol *kcontrol,
 static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct catpt_stream_runtime *stream;
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	bool mute;
-- 
2.43.0

