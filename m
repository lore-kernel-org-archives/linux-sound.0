Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1A03081A1
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415607; cv=fail; b=rpSN8fcB79BecQzyX/Pkgqi2h/SQXt9qjfqGIGJKSzu+QDo9xppi0usMbsFn3UTfw0oSj0nuKtAJx4302yXDGTP39yCXNa1tUgWRu8pnH5W+GkLPDLy++VVQo9g+kCvzlyhk8dMfJ89k+01gvPVxkZLqeLZYLHeplJ1huv+OB3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415607; c=relaxed/simple;
	bh=bT/0tNd4srCX17ar+tpdEb4KhuSJ7vc9NDpVUkxY+oA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DK9TRQnbHtDKah/vTueEt/SsCEyiAovNjHdZvZXQHK6szRb7v0YJM1T0ZKcpJC49CUf+wWe5JIuMWqOEWt9p7sxoLon7J0dfgiNmUXvH0YD82LQvVnBNprrzUtWlRM6PKoy2N+6w/vk1EjhF+YeA38K38G9abDwsGdvsULK1C64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T//jEGWx; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T//jEGWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfM/H18d+OnmATUA1rZtEz2lTBR6k9Gt6oxRtfCc4GRppOeIAj2AAa+HlUAhpDPT9hNq0lyHRk/aHz12685b/H3fAgAOL6MpRvrqvtua0p/zDZjq4G3+yWs6ImIRUaMWGp/7zM6RP+IYNGjm49xML5h+6NioAoIUm2PaYou2tDaS/0P8XUPC25oVV2sORdV1Ztt3YM7U4sePwnd0Rrk7GOT0+FJBYE89BKC+REJ2xEVyNgxVOhSD8d4NECZ5Z4rgJNkMiOF7w3qLWvQGbxhrdr/NsFFnl/SeMcgH7bmoF7ZKRvTs+Rsq21gU2oPxCh/khSVyurNmvVxvXQ7C8C5cHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5Y8kUWb/g3cobVc/g/RJH00M4z7J3VbtLbS/uzSO1M=;
 b=i2Bx4dmKohEwGzkuO0RliI8jL+vlz3Uj2H4yuAGyLmGiTywAVpXeZDDbCSLasOpSHjCzNICc5sw6Y6Tvm1puXYvMG2LOJNB72WyHSA/u4XmQz5FeZumvTcW7DnR1PaKaXHLmwCbakEkoC8VfwyFTXDjPjW+yj9p7mehkrNpoA0vJ13mQvkO948IXQCRHfwMH4JNdej/uWSNRwMWugYNVGf+nFzwH2RL65Zg1Ly+Y2M4Mi+jBf7uBnR5Zftyv84GXgnHqBFJhREOEDF0x0D26D0Jv20UfNFCV9i1AfUR0Wnw1VVr6Pdr2f5GztkrWgZ6FXXrxOCKSzZUc6OMXeLmqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5Y8kUWb/g3cobVc/g/RJH00M4z7J3VbtLbS/uzSO1M=;
 b=T//jEGWxdkDnH4rvjS9c6e3D5Kaet7ejv0+e1S8kSUU9zhR03o2v/e9fm+/4yZ08EcysQGBR1c6yAMeSA5v/6TOdvVEOXMBRsuTExLYvrbivtmyEoQTd06BpgIsoZQocTb+OwT5t/seEWDrost1mu4ilkXxCRCbHjt/pknqUl9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:03 +0000
Message-ID: <87h5w2t8r0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 010/139] ASoC: codecs: aw87390: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:03 +0000
X-ClientProxiedBy: TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 961036d1-4759-43a9-a359-08de0ad8f2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RUUZQd9CY5dd4BW27H6uY3/xv9UwUXc6preOisTgxBq+Q4cyLFS8jXY1qe+F?=
 =?us-ascii?Q?2fu+YY/RfH+ls96296NSHu6Dh4XXm//nHc1pTHRtR1s7QgMXlViKLdSGFY5y?=
 =?us-ascii?Q?2Z6cb99Y8NxBTQenDWSmYLn6HMIc+c2+JGbwZYlO+GYLtpU68tXRU5hhWAyq?=
 =?us-ascii?Q?fnspYTUpWR+J2l0M5S6TEfHmzzk6XOcvPXLjmPkaHbIej0gfANnTkO8U4Tbs?=
 =?us-ascii?Q?0/of5fkTeNQ0BPa8S/izYN3dsAoRAkNC8xIupLEW7oCA7Exqa9CCF2/VEc7a?=
 =?us-ascii?Q?LJXmgX1ZpXlvfWjPavjxwDlJVMo861CNodgCz4ZofXJ0DJkeP9cnf38bbaC3?=
 =?us-ascii?Q?vk6JLqqcYRMe0rgulJhYq5KUwry+PoinaCbRjQpIXsvzaAHJ2xH1UDAe/Zl4?=
 =?us-ascii?Q?00Zrn5FkT9fr/vuaE+FoVLSOP/Sps1dwPg36nysaOorsT/0qrMKyZ/W1f+So?=
 =?us-ascii?Q?JsvhT+X/GPwBH8thuYNfg4nHp15XPBQVYOcbOwhUX3xpbM8r0vchJ8noHWcS?=
 =?us-ascii?Q?oFn7yhtV/t75ylOqOWhR0/eqMkluQQjGUaRZvps7r8pfHrx3/C4R5hHF3CvV?=
 =?us-ascii?Q?AmrGpYfk00reRI9gUeGv76bNE++UNQgqUK23HGNp4+QtJoOvdaDg9FLkHcaa?=
 =?us-ascii?Q?TUXu9IIH25F2FndYlRIe4fE8Yf+jvUjrGCsSPUIZ5Zjk7T0QZCH1N4QjicA6?=
 =?us-ascii?Q?Kx0xCIGlDJi0wFeahZDgr8o5H5kBlLLg60sn1EUTRfSD5ONbhvQ1pD5H5Jn6?=
 =?us-ascii?Q?R2pMHhK2eCPFq8LUdAjGF5oejW7GwjahTsXwZTAj2RqUbr4WUwGtVMOOsoT1?=
 =?us-ascii?Q?UzLJWLHEgPgwwCMKRVuqajfshV4ywzKqa11iBUMkT9QjhUv+AlKVrjzAU/R+?=
 =?us-ascii?Q?GjYPjd908bSc9hqmGS6C6bjreu+FM5R12fMM6scntJeKOy90NMa7udMPDlWK?=
 =?us-ascii?Q?gks8S5hRZ+/LVlLG1pdzk07tmteGZRTR6rj07Jow+O3M3XQmBQijyESCmZy+?=
 =?us-ascii?Q?1TCeRgASSGi+FKgZjpndQr/oWcTBpcAN8L1QzN5eUva37895HVEhwBmtDtRP?=
 =?us-ascii?Q?w8PDcgizUcszmMtBzHBraSXnJ86KQtU6yD8dBDyK94N+tvaJMdkGY2RvgIB8?=
 =?us-ascii?Q?2lJH1pfa+NiBzW7VdHYKKCLJKMrq2kb6rMb4wgPNWvGkZFANM/oMBizh6PNc?=
 =?us-ascii?Q?bUVh6BDnAhZiX44DuPKV+yMEcK9ylPYXUkpQiBBjg1vqcJ7foTnpdWf++wtf?=
 =?us-ascii?Q?4L4o59xhlD8ykPfuOgtTo+ltNHAZE+4C+Y7ZIc9b/9jjbxYB1Pxh3Oi0DBUk?=
 =?us-ascii?Q?L3KHfVeO+Ok9smvD9ttT9dtGptyhyJJ7jILWM82R2HiUmW+EV2qwuElzdq6H?=
 =?us-ascii?Q?jPGDolxC/lnI3KekgRjsQP0/mJb0yO8oSdi1TPKNkuCxTVGwLSJC8OnCWRRT?=
 =?us-ascii?Q?a815F7l6AuPvO+0DJhY1woMWBiGdAvNJVB3ryLRrHZtEumQhMaO1Svh9XBPQ?=
 =?us-ascii?Q?8VPPHGQa8FtbglNGi0yRyJ2tsfNV+/fW6Ak3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FJPI0gOOLXwe93J44tRorclNnSsrcjswDmdMhpkGlJ6GNcsd4DDa0fbgCqNs?=
 =?us-ascii?Q?i2PNktbqKxG0PDotX0tt3s2F6tA50arwDEP/CUd/MRqszcZdo7YB9qdgU2v5?=
 =?us-ascii?Q?MsGy/HypYoUt6sRjH47yeqy2XLU0AD09hocMnrNbD57l2Jj7do9e1nYw1Odi?=
 =?us-ascii?Q?SsMlxQ/r2T6vWb8k00hJBUBcZivJfw1rz2Oxb1o8RgR7xdpM/hkqa2oQ8VO0?=
 =?us-ascii?Q?EhmTHzWHA2b6ScpmzU1LUUI6xAET+ws+AOBU/XMoHxgXAntrYZUeUOpzK5Qe?=
 =?us-ascii?Q?VKdLruNUdffR13u55AchG4DG9n35whMyAoCdjMR2LOHMJ+bNwWFegqxfmuXY?=
 =?us-ascii?Q?m6YGKHaowWs77sHZRPNKidyxHk90qorfD5eWRKh+YyXVE0h7ve8qDv4jHqFZ?=
 =?us-ascii?Q?jB8uAxAdx7Q5fnynZlLmeK7h5oych+D3SjJ2w7KxY3vH+qntlOO/Ziusz4L9?=
 =?us-ascii?Q?fiv7Hm2bW4XVlZ5hEVA/KJDlCSNy+EUoOsIqMkpxcFKpttrjGFb/nlyJS95n?=
 =?us-ascii?Q?gh97BufYGwaGqYudSEN/o0kqr4aXPAfDTBn2/BhmLzbkaOV/Xi+KUbNw0anW?=
 =?us-ascii?Q?Q0e4Pd5yK39SWjvZImFdLNI2ZLPJ4+FKhjnZ0GlBS25gesZ5U/eljBNBEoxx?=
 =?us-ascii?Q?Ig6mRYxvh+7JAXzquN/N3M/WoEBSf79h8X/Zqr33uxu6CgGIvAEuYxXyHj2M?=
 =?us-ascii?Q?lFzIO6Kb7f5XQPj2/QUjib7/lts7/xzP9vksOtOvvzZqf/8JjHcRM5QQ6p2X?=
 =?us-ascii?Q?s0IAHYIx/YzLw6/rj8OpqxtUeEOsKO0azhaV3SDESP5Seq+PXpsXYM12uZpn?=
 =?us-ascii?Q?IQ1jQHdrfI0MLJQEdC/VRhWAIcy+T327aacMr+BlLdtlUwEcgKavfR+qBkQx?=
 =?us-ascii?Q?8qIriPHrpT9g2+a63N7UoIQK2voqRBSFTiwAuAwJ+RkfF8Z+Zw70YOBTV2kC?=
 =?us-ascii?Q?hPwGFB0Ly4K+hxVLvF74uj5DulAGHHKX9ykgr3wrSu8v45N29EraX3j8PqxW?=
 =?us-ascii?Q?wr897JrmhNqSkaVXz7oZe6LWeI+89t48d7qYAJ8PdPHtFqosZQ/xJngHht9a?=
 =?us-ascii?Q?InEplLo2XxYJnZI0yfz9Ol+CujthYXuce2IRGyz9BtCVeAGbEwJxnRxM3ASx?=
 =?us-ascii?Q?fJuAmTrNn/Cyj2ZSkf1CekhCX2AMkTXeuIRSb56waWzoGEEtNFugvOqrmW+T?=
 =?us-ascii?Q?ozbHh5PIrKxiin8jLgG9ezYKzJqEv7vBRfmjdSSd1v9EDK4OHgQLJfLuQKlg?=
 =?us-ascii?Q?YRvGOADVo14CU5i/K2LO0Z+2vJorEA3x+TgINx9do4qZRNQ6YhnAP6SKrcFf?=
 =?us-ascii?Q?zpDA0AGYXPJeiywEX+p1VlYTbgupVg3iIzvI8l/szOhnypeSdRqJkUeyP7B4?=
 =?us-ascii?Q?/f2ICaTF0yhuirIWqtQm4/aqVd4+g9bpXnJ/gG7uHoXlhvUsKp+Yvo4+EnRU?=
 =?us-ascii?Q?NyC3q+wnMXv0749O4ruqh8s78Umo1OA4OrR9Esqhswwkw7/WkCv6bSvNxtl6?=
 =?us-ascii?Q?GFDGuwHAFIFkQEliPrBjo7Wh3cqXiFh6XqAk56JUx643+GN3U3EuxKeK9JvY?=
 =?us-ascii?Q?+5jmKTlFIqttxSaEcMgWqjBOGEcWrRO2apzt442X9zX/XTiHy30G1lpOAbs4?=
 =?us-ascii?Q?/rvzTwwMgrp8+tQtXPcYSh8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961036d1-4759-43a9-a359-08de0ad8f2f4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:03.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnfoHmzg9BDDJuEyxSHRm2vWiCLTX1aVyCBQ9B9JNm7nE0IkI5DlfT46rPLdmodaFinsqdj4WmlI2S/Y60vLE7FA1kByhT/31WJ2Wit+UTmLRySIorrV7HhycqbtLJmT
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
 sound/soc/codecs/aw87390.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index ef6f648569888..460b782e96a10 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -175,7 +175,7 @@ static int aw87390_dev_set_profile_index(struct aw_device *aw_dev, int index)
 static int aw87390_profile_info(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_info *uinfo)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	char *prof_name;
 	int count, ret;
@@ -210,7 +210,7 @@ static int aw87390_profile_info(struct snd_kcontrol *kcontrol,
 static int aw87390_profile_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 
 	ucontrol->value.integer.value[0] = aw87390->aw_pa->prof_index;
@@ -221,7 +221,7 @@ static int aw87390_profile_get(struct snd_kcontrol *kcontrol,
 static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-- 
2.43.0

