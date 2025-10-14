Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71CC307AC7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415611; cv=fail; b=C2TNYhf/W/0yhvXslcIV15X1C7CdRS6Oh8ez+NgkQg7oVOMjbUoB1NkY0NUAYM5WN3Gc7/+2lUxBnBz+CuFbgygP9LYvULTSQ+e5H4EY6AC5qib1oAOHslo5QIRS6Atu5KRD5YYa9o00j4dzKcfqpNZZyF69lGdM4LwZCO5uM/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415611; c=relaxed/simple;
	bh=WV4SrK0P8J6qTHXDbo6UCMPSUVZ0Iho6/XywT+PHqtE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hPFdn/pfXLD0zaZg8US+qZ/4L8Tv2454+Oi62JONdpLyfMgs0y7Ygg0HroIOS8BvDGjy2ClTKWt0Ix9mmRD8u60cx1vbEWfxNefHNhoYSx5Jg8ezUTWPMl7sIdJyEbMKoc4V7DaKbLBwofoOrVnAzwvRVWuWRK1ly8ap8xtvgFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oj7nPKW/; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oj7nPKW/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuAwBcEjdGLHBzj8sxxX85MXs/dPU4bEJetF+s3X0mpFnAsSfDbU0oNAwQ/9NQYzXwhhREqLbWGmrSQtA2op5T+v5u/6U44rkm7X8NZzqir+djxSELV8IWoy6eSqbAqMNGoRLhuAUXnLxykhnWwbWXNdnUl0xRlVhPpX+BEeBj79FHxz4WRCucrYb5fzPvD9ZWqekMgW5ZbzRb9UzWWn7PNhlEh8wt7iWGB2eIvvAaLygX2h6GvTaLchg7SllSvwUsxCbfKF8RxrmNwzHmqNzZ0I1jzbSTyK89Cu9JyLX3nU6iVJe4teITFmXe5b2u1xeyDBfe0TEFj9UDInLMARog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52wR1ZAergLF54K9S5wii0z7jw3TGEvPTk0Fq73/VAY=;
 b=VTNQRdVMHk1Am0ofO6TmSItKMy/ErifcnUA9ICm5X+OJuFI0IAZb8orFd+eKk5xJdbh72Eqd+tkXSHTaYunt3NEA1fFxoin7GGOqoX3qLOlN20pGhxzRDN/S9iWjzDugxJZD9lkrtyh/8wEEZeUnPcsWCoXa1eYQrdUwGMYQJ5yrIbXcDt3ZMIXkL4461ZOY2zJrJDPbmwVwvLlPrZOgZujUYAVobhiBSgkEuCrMFnYkvAF7LdsJZVCwSeJU9lzlHfcsy48MWpB/Bk1fmxjM/UuRQwjyKvRdRDpBOpS2W+RaZJmzApXhXhnFUyGCXaJ3IlYqFW8/41KmvO+1K1mDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52wR1ZAergLF54K9S5wii0z7jw3TGEvPTk0Fq73/VAY=;
 b=oj7nPKW/EcD1HsmC83ufd8JWgekRf8A5eBOGSX7GrIekE7rutTgn+AuBPFqIsAKXGDMCvnpSlZ2wPw8Ue5GnRN9hRzw44mLNbEkK5mlldv8QXiAcQBC9n4U7cV16DEKFRpk9KmTjIU1YRvUmu0Cn+6X+mK6b/htTO7DpqPWAmgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:07 +0000
Message-ID: <87frbmt8qw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 011/139] ASoC: codecs: aw88081: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:07 +0000
X-ClientProxiedBy: TY4P286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: bde2da8e-dbc5-437e-8d7b-08de0ad8f511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d0LAopprjhuDbns3cfXNFSBltn++oPcfiz95l1zuEIyBQ6q3X5zu4Y9YOxUp?=
 =?us-ascii?Q?Fj7ga1vkJRA0quvrvuGGCvNDac9NggQJMqr5zZ8lnS8MV2k9O4MTOkwOptNG?=
 =?us-ascii?Q?QjZHk5wmoz8hegLb1UbTGKcXDVsL20rXACbxdhECBXSGWibdG3OksK19Zz7Q?=
 =?us-ascii?Q?FCAlzQICHlzRh+SHLLTZN6iCNkODpFDqvJ8vKHGylIY8QlCW/HpTs22Z7dcV?=
 =?us-ascii?Q?OxTUZ5+4aLCbOCRFqr50H0AgJk2Z+3bADG9HJzkwTwioU0yp+wcWN5LUoRbB?=
 =?us-ascii?Q?zefzV/tTb0VbqXf38LIzCgtHYIwqHwC+1Srov0nSmyb0YJmmsIKBthHuDPa7?=
 =?us-ascii?Q?y8/G7p5pgUHOdOe/AeOsIzjMFmiRkrfZqoeIX+4sP6bmTZ8/uGWLGhJy3WZ0?=
 =?us-ascii?Q?8682zqPTpaCPuMau2yXTJ9RbO0C4SQY9qXXJtDmzCZ05yYftFv4qBYdLPRsY?=
 =?us-ascii?Q?gk59hOG3yO1sT27It3aaIqo1WGKhOaGcZKYCHsKqJOlqHjVqe9jF7Z2A4xV3?=
 =?us-ascii?Q?qZRsT8skg4rqSw86kWi7nn+Nyfry5+2ztmeu+jP+xm8WB88hu8km/LPSM59G?=
 =?us-ascii?Q?1ZdMGKvI4WQJZ67Vg4zHSO1T+9RE1RUM3wiBCZ7tYHyhlnlBVk3gkD1r9BYy?=
 =?us-ascii?Q?b++YSUqQ4qHOgU6dBUiwaZ3AzG/C6RQjDagbiOTVF4zmvvx9hybXm9ws8rYm?=
 =?us-ascii?Q?pPnmQ9uQcIawJR54ouZ7wu0ASL/XWVyqF0W3JcMusIImjcRTWsx62sYrk+Mf?=
 =?us-ascii?Q?DZg+i6mPA7A0u90Mcjg4jVM1P2+6ykX8XMOyrddBHDfw9eQnqXNfyDYuQLNv?=
 =?us-ascii?Q?su+49UrDupVamyuE1rEmgLRsQRIT88i+d9Vd+VeUPVHN4908B8WM/TP17jYW?=
 =?us-ascii?Q?/yvfVj4fbkm+t4sEy6ErlEpWwtbocOZDNSI86IxsT0c9cNUNRiEb6ahrjyGF?=
 =?us-ascii?Q?l7ZDAKZHeXoZ9KqxLUosb+HTvRaRJbuwVUP8FinSBXAz45dwBSVCkEx/OmPi?=
 =?us-ascii?Q?iIsZgOR1dieueMb9FaM4v8dEh4qgefkK6VWbvPmJBigXLIrFMshF8g+8Gowh?=
 =?us-ascii?Q?J1xMHC+ieoMhqk/UYxGkWbHAV5X1G/a1tGURbOSijxJRTvZQAhlMDTILGfv+?=
 =?us-ascii?Q?JGCKfqr83daeKgAsgH0mIJPmNmGLqcJF8a9NGQRN00lsA5ns03UIcMvcPKyc?=
 =?us-ascii?Q?rJmPTiaW79K9UEwiQ80HNvU/OKHRlcv8Wix2ukkRQHdnsqkWebIEQlvAiidt?=
 =?us-ascii?Q?/1U+HLVV1G7HyyOTNmjEfufnvf0Dk6rYOowUI68Qrv++wTZvg9LE62EhZ+P/?=
 =?us-ascii?Q?QKOoT11PWs+L6emBbHM+962MiP82Vssb2evCohU8u40TDsdZbCW+XEL20T6x?=
 =?us-ascii?Q?V1um1vdeAYtWVhgcpGKvw3A3qkZ7dUNuR7384Z6lMZdKSzNXUJNgU+ouQU1W?=
 =?us-ascii?Q?zSYCFGXrkxTx/Sb+CYs/UoOn8fYraVh8u8evTcy9V2wYEICaizq7rDP44Eag?=
 =?us-ascii?Q?cAQBsETHHc9Vh58BBnSAAv1AVPzUJHWi+sUq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mctBIRP55K08zK5glxcKZAwIZPOGKIVOfowhCSwaYFvUEKU4acEwU0ucDyqU?=
 =?us-ascii?Q?mYzw5UpOfnIzzmzIMn1TI1kWS0kVe6yysjEVTtQ25fh0jzVsMdSXwPCs2PYn?=
 =?us-ascii?Q?uDenSbJydOn67aUgnWmZncq7y4h0Ym7H7o2QidT9ZfGkMDK3u6m2K1ztKl77?=
 =?us-ascii?Q?4O49wrIOpMszWghs6pMzWs1Rz8Ku28Q5JCZT+H+RGn6IfRfg+/jWkCYORpcK?=
 =?us-ascii?Q?t8m9eYq7Q6cUfFBjx+isQlQxc/+KOm9lddeha+wvg6oqJnsX14ErH9Ve6ot2?=
 =?us-ascii?Q?gVUmNEvY9OHHSP0sF+GgM5jLlRE7I8EbDd3xbUBK9lZf4WWoZ3Qhod28kai4?=
 =?us-ascii?Q?RrveScKo2cDSMsY6uaNKHWmz1VB/uTf8Gps5Y5NS6e97ilLdchbrh8ovd/bx?=
 =?us-ascii?Q?ltckM15Av0vqJl5RaS+fFiW2tLfcXz4egnvGHIDpFuYnFtE+v2SDAWwpQvap?=
 =?us-ascii?Q?rEIUayGxT0eW5R+tGyubeaJjWMGMeohL5KnLtGh0GUBOWCBEu/tk4iEqPzkD?=
 =?us-ascii?Q?YVNptuziM5EFKVFB+TBti2VVte5IC6FbJnK0LC2qHgh2q94h8fp5bNOyyLZo?=
 =?us-ascii?Q?iHxek5ADMMRje7eSdDeSibFXWdf3T+wwGgmum0aN5LbLyc8jiG8WVK1cRME0?=
 =?us-ascii?Q?Cgrk7N1wz6Tx/xrDnV30S6G7KtYZeVzMWe+lqf6d9qlFtYjV/YIsHTQQ1LO2?=
 =?us-ascii?Q?CeXJPjTEuokNtfhdYhxePBDMxmfCNESMohG+aGEYKNN/VlVwYs5u607nfCrJ?=
 =?us-ascii?Q?1rIWY4szJjY0iUqB/KEIDQSM8rE36egatQ+lsD5oTciIvotWQgvyn5Y9dDe0?=
 =?us-ascii?Q?48EzmOvZ0CXUEJjRDWoTXOtQ8TZlvChTp0QCinzpEFfbR0GegQJGooEGMhwO?=
 =?us-ascii?Q?Rnl84rjH1UxXvyHORDjtGbT9Dn42QcFRjp98iNMF1ezGDfQPtQ2eV90GKYkV?=
 =?us-ascii?Q?JroZUi537I98Qvfxfbsi9iOifi1ie0+m7XBJchwyrrgprH+G1vsRiLZFS086?=
 =?us-ascii?Q?7jd4DDUJ9N6Q4mRX9lagWtDv7CMypQ39FxRPscfNQpWf6i2kKxxc1wxL3Lw0?=
 =?us-ascii?Q?qnkHzhVbnqnn/WVHMjGBaq36RSTmBvNwNa8EvcNr2TLKFKi3N3Y9cqa5DkC3?=
 =?us-ascii?Q?/gczSYI9D+inQ9dkcgJF/IWpY7gnspIlqoTKDdUh3vqJssVOzTyi2BU//tfh?=
 =?us-ascii?Q?nDhooXnxiBQtj6S35ZOf72f8IQoRhk50+to6KHlShLoypuDYrwS5lUGlrm5Q?=
 =?us-ascii?Q?7C8mzn3nXr8EfV2NuCRKmY4D1InsBSutpCr2k/jGmaROn/dVRqv0fOfvUGWL?=
 =?us-ascii?Q?axUQEzBSy6EY2jL+5xPh0zw0osmhpGenvreeCtC0/vurtsVidrxlDNRTu0bb?=
 =?us-ascii?Q?plaX/EcUdwXVe8PnDM4Lr7R9Xj+hwnjPt4hkbVLam4jXF46LqnkbqTqIf13W?=
 =?us-ascii?Q?W/y8NTTh2F5hgnri8BKmjU0sR17v6dHY78chwdZ4ufHClPUExH74ZoWJKfVF?=
 =?us-ascii?Q?kWZUe60gva4M25jxCnA3B1qswXt5YE8Jo63HHuL1wu82W6kDziYNBmoy8UDZ?=
 =?us-ascii?Q?NhlJmnW28YruuJ8mg5pbloWoMibt2A1Imis/nIGftvT1fqamvdGgQjE2aKLX?=
 =?us-ascii?Q?OoGRwp1Q6AeGJMfeZcrNLPk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde2da8e-dbc5-437e-8d7b-08de0ad8f511
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:07.4897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vLMppuK80iG3uEd2y2UqrQjHJEJetNg1nOLqe/K4XMs5ibWoLO554SopDMKuw6Qfx5hRhnXzgr1KgvI1zD/3NClLDuYqC9WU51wQ0OFYzb8K1VvIoTYNyHsGVHvamK9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/aw88081.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d61a7b8c5470f..79bb42e8bb54d 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -808,7 +808,7 @@ static struct snd_soc_dai_driver aw88081_dai[] = {
 static int aw88081_get_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88081->aw_pa;
 
@@ -820,7 +820,7 @@ static int aw88081_get_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88081_set_fade_in_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -843,7 +843,7 @@ static int aw88081_set_fade_in_time(struct snd_kcontrol *kcontrol,
 static int aw88081_get_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 	struct aw_device *aw_dev = aw88081->aw_pa;
 
@@ -855,7 +855,7 @@ static int aw88081_get_fade_out_time(struct snd_kcontrol *kcontrol,
 static int aw88081_set_fade_out_time(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -891,7 +891,7 @@ static int aw88081_dev_set_profile_index(struct aw_device *aw_dev, int index)
 static int aw88081_profile_info(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(codec);
 	char *prof_name;
 	int count, ret;
@@ -926,7 +926,7 @@ static int aw88081_profile_info(struct snd_kcontrol *kcontrol,
 static int aw88081_profile_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88081->aw_pa->prof_index;
@@ -937,7 +937,7 @@ static int aw88081_profile_get(struct snd_kcontrol *kcontrol,
 static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
@@ -963,7 +963,7 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 static int aw88081_volume_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88081->aw_pa->volume_desc;
 
@@ -975,7 +975,7 @@ static int aw88081_volume_get(struct snd_kcontrol *kcontrol,
 static int aw88081_volume_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(codec);
 	struct aw_volume_desc *vol_desc = &aw88081->aw_pa->volume_desc;
 	struct soc_mixer_control *mc =
@@ -1003,7 +1003,7 @@ static int aw88081_volume_set(struct snd_kcontrol *kcontrol,
 static int aw88081_get_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw88081->aw_pa->fade_step;
@@ -1014,7 +1014,7 @@ static int aw88081_get_fade_step(struct snd_kcontrol *kcontrol,
 static int aw88081_set_fade_step(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(codec);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-- 
2.43.0

