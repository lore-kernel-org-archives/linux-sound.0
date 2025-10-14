Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7698D30AD1B
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416037; cv=fail; b=iBtp6LVM6mE8lDcaO3shvZ3n1Ot0xwqsoTMGYF4bUIp7qtNjxriQLnitV67K1R8MH82/UF3xv80EDprSm7F6knkedhluQaqYJEhBM5j8ZpDDc94FyCVG8iSnPbsgz+Ax2Pcf+0iWuuENAeZbR7lKpPl0JNs2RSRAWiKgfT5p3Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416037; c=relaxed/simple;
	bh=NfJjPy6Pk1OCVWoUGOUVdTPOE6SBX0ESYgNqfEo0SDY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZGhmhbhj4zSi9dkKZE2T8YpgeOJGgwgCn3f0sFv0oTgyZ9yv6KlXAaRzQ5dhYcUobFu8XUKYoaf/LMW7pe8hYKY8tMVP8LkyQ8mhEu6MiQGedphzwabIAkNorDaFi9V+CJuDfESzo4cnz2nO63iA9MjuFmGoJdwnLEWP+kjz0zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VzwUr0GZ; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VzwUr0GZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkRGluZcfSeReVe0SUJG00t/b/rKbLCMe/o24G4T2iwLd9Cn9io6u2cgNG/r/lRharcXve1RwikeexPFzypQVTW5KenWOdcxDYhu0815OBa3ayCcT+wdPzhX4K9J7WpGadEvJE6s4/t5K6NZkb26adBPhGEOBVp8DOW1xfVUl9O81HBuIudaRLlfPZJZT0PWUwmcMUqd46M/jIbt4TQptZtBnn08260IljnovAcEyySCdHO9+17Dydij/+hMsQ9ZF/2lCjd02trFfaHDv2I0eC2fi9+CwytIg2SCr8WvbL+J1nvczheMHG06VOQg72lQxss60bG5/mswU29iqV0Sfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QehzDo5jiqP+fgvZfW0nBZbR7zoy/VpUZwGrP/WJdPk=;
 b=x7PZGpgUb9uKd4Zgbgk0MiIOew4wL6ldTt5UpoiCxZssvmLRPwn/chPYLCGFbFZhhKp779FFbu+6w3Qvq1nvo5SbpZikrYgnFwAXDlMPbf1vid+EB/OLq6nYnr6q+GU9NEEzzUbNkTdBFBuTDSpW8Unx1uuveqqh/5ZRvBKoIhpVyQx6hrDNuej0qce+3LRTu8raUz9c+pAKSuutDo988L4qpMO+IIAYQp+p0A2lmEgmXtJDK0XfGn5QdWuzF/cvx5LrG+rolf5cWAy/PKNJVcBeMOzqVPlSMA3A1RXj3knglTn7TNt88lsXTKNebfbYRZmclLGrQxJJcL0YiVRdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QehzDo5jiqP+fgvZfW0nBZbR7zoy/VpUZwGrP/WJdPk=;
 b=VzwUr0GZcxavgepKNjleWOOLt1PcHTXhfpokpGEWxrDFfezsuu/FQhPHl6mZlb0dkBdjibKwwRuonCKBLMRuNKLtdf2IxWzez2b762T2MFcWVBDuImYytAL6j89EmU1AljGbCih55T6flSx1ogJyr43eaz7OA5xOG7iStzZd90c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:11 +0000
Message-ID: <87wm4ym7kx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 124/139] ASoC: codecs: wsa883x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:11 +0000
X-ClientProxiedBy: TYCPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a734e7-ecbf-443b-92fb-08de0ad9f1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rhuDVqMIb5Ur70ZpWQBP3jw0W1a9b2xvCMzkiY9uNRABYuX4GUZybUaKOpmE?=
 =?us-ascii?Q?BvnS7g7Yrd48MMdby5sMv5ctws5gEEGzmt6g0OlBlYipFOcPIJv+voLQkPId?=
 =?us-ascii?Q?nLPOdZY2684uMkxGCw4DBBx8RgPHCrvMtr5Q/i6oIkoyRP1XOMR2cVQPaOKO?=
 =?us-ascii?Q?e7N99uE2qpT29IQWJCinbnDAutpoh2gvi+0QC7A2Vzjii5Att34UmiMvtKEf?=
 =?us-ascii?Q?ta8ewD7o/809jnMPES6M3uXJHo6r0lGVnkhr1TE04hSCnxEZ4IoNBvJLEniK?=
 =?us-ascii?Q?CFb0ozedYbsgicqZ0UvgbdxePvzcTBfGMdK+uReSsTrrLyJ4S1Djd8Ca3TFN?=
 =?us-ascii?Q?pfhQm7suTBU9cpb3Jy8sxRzZOgpUytfJN9lGvuPSCpZtEoRtzq4aiCyelmAQ?=
 =?us-ascii?Q?noCrZvxTgIPGA3iTA35URT8KyXLM7fF+5EkqvrhDrpVJGV+6c8xYJ2sf7rXb?=
 =?us-ascii?Q?hZeGQkky86jg5N7CfKTgvCF6rpTrQJBOhdupOOX1ozUTY2ZIncmsexDIruBM?=
 =?us-ascii?Q?2u3rFDe7azolukvVK/YDU3pHbsbdIFZ2RxvHQERpN5XMKTLL6+4G9IySB0WD?=
 =?us-ascii?Q?gj69TXJQUYjZlFr890D2ZW+3oj1xS7BqQCBjtT2KrB0APKx0wZ7OjNntxc1U?=
 =?us-ascii?Q?KJxS/cuxffxW+SZM9LrHGYcadaTLvuSNf5s3KLrOyodw5t6ler0amHDOJpLV?=
 =?us-ascii?Q?7TisxmVeFE8zQ3kmagLVTXcTCvOG1NBx2+vcqaEdA8fvjVr5WcOGiGBKV11P?=
 =?us-ascii?Q?2NWirReGkOE8aXfkXpqBY7/KU5grevTShVT2KOis2/Vv63lynRIxrj5CxSey?=
 =?us-ascii?Q?fmDP+0Rerrgoiz1Sreyzy18dwXWOHft5jfq4EPmEamfKi5WRavoZqEhOUUHS?=
 =?us-ascii?Q?E4tlHLWM/LGxAHgekqr2+kBXjTBi16S9miZ3lsHt4FQDFO8spkhZY+XtZB5Z?=
 =?us-ascii?Q?NyQX/C3fS6l3zwZ3txtYqDQUQz5qIhqhrDA5VdTe8VJZtpubj5oq9k0qzR9k?=
 =?us-ascii?Q?pHL90A/0ZXYjCgbtjwY+D0VToabwHBP15FCYeVUDoS8kL2b0g8v151drLH5R?=
 =?us-ascii?Q?wx9ovI+8Yf/t/aXYcRdoetbhJahfd0uKTIAY4dpjAeFoaE4t4/1K3spl6zCU?=
 =?us-ascii?Q?KoXRqe9XTIDFuUK3quyMyrSoFn1Ir3akybV+v8JeicboLgMnn9nf5mwIG1nX?=
 =?us-ascii?Q?vznmeB//YbE1X/m1rx76qY9NoxvRqqnwTx4rVDZb5G3YJoxY3A0n9ZgnjiRD?=
 =?us-ascii?Q?Zc5l1G29urDiyl7DXX+gNO6Cn4yh70aoEdAa4c3E4VN7ib8psJX73qFTKh5A?=
 =?us-ascii?Q?JjWSTqDeuzKX5dd+NWOddVO9CrSiiZ1iqXvmXzyXutONF0o1jjuMAegPTop2?=
 =?us-ascii?Q?JwMoWSpDxCz0CVU+fihYu1jr+NvdQpzT06BDZGK5TirJhiKGmSot7wJMDy9v?=
 =?us-ascii?Q?xSqM7lVdcdqNu7dAosLduGB0ERevFUPipR3DOKhiTc8kwk/9NSPKmCQs6WgH?=
 =?us-ascii?Q?E03ac6jm/h7d83DDIB8TSATrOtKvV7/YR6EY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bLzs6MyIMghxDyhp8JxWPmJ/UyVptR0LOAewipxycnONTftU/dSG7AJqwr52?=
 =?us-ascii?Q?dbSFDLTc0d8EKiZV4G2mjm1VAhGkkJSSQDxYqNjHA4nYb/8FSMa50fehJnW/?=
 =?us-ascii?Q?Vbk8FyGQRkG8a7tRwarl0qk7rfExa6oL8nkyh5v7KZzAk4f9Oxir9iBOn6kd?=
 =?us-ascii?Q?5+Mcv1hVCEtOJFpghGIve1YQNox4asmx3gx0GRm/NXzEgBalekmpAaNvDwyq?=
 =?us-ascii?Q?U/U251jLi6CeDKYtqwG2fD6ORYUrL0D3cNSYKoZbKzRLuqtLatw341BwQf9z?=
 =?us-ascii?Q?a1pxzDaiEAs0HQAQ0GukZDL4cfbc2HlqnczrXhoqETo8DCsDxm49FUPyVfdd?=
 =?us-ascii?Q?KNRPKbRDhndY20mG5Y3H3UQkMsb+TUTDNxX28Lou1Ix8vUszFJFR3Z9jVTqN?=
 =?us-ascii?Q?aj9joBFAJ+KfBQAN/Cnymy8+FDq9gtIgM7zV5yW9ctTqtxw6zw243sktICmm?=
 =?us-ascii?Q?+CaRtA5Un/srtRFxBVwxLHw856vrdDVD7GI4UHoc82ri9Wsli3S8elmoytmf?=
 =?us-ascii?Q?psWE8KFhUa/pvptHWsVLdguUUqmdITZG/DtIEpdmp7tFdBKyj0mQ4ws4ULhs?=
 =?us-ascii?Q?C6elCCTWWd/1lxA/QnzFa+R+4smMYRxbKiRoTmgbDGlBzsSYnFRC1Kd0dSjN?=
 =?us-ascii?Q?1VFfwcS6SfvXRRt//yukQCb6B42J+ZTgMA5GUnq5t18/WPcmmQPVy131+Cse?=
 =?us-ascii?Q?dldXeF32EY0tD2+6tD5GjVFLrx9YNphctSfFuTl1QV7KE4YI6lWeCPKdGJKt?=
 =?us-ascii?Q?uyO39UDf+3ytcrHLwy23kqgi2Y9sYj1vDmHzXjX/erEd8uZJSnVhjqbEgWBt?=
 =?us-ascii?Q?n+TJ0UptSqdcihHISAhwcW6UklZD1nYyTST2kZwniguKxElojJoEcFAs1+kh?=
 =?us-ascii?Q?MpIDN1poVEJZ59LzF1Zgt7+LJ3nuXedPhQGIMWSGVJM1vbS3NNtObc1l8R+2?=
 =?us-ascii?Q?QzuvXZ1wEGiSwJRy910+x4NJULlIiBmgXYJvhvdAYolS10NOIw3PhgjjE88Z?=
 =?us-ascii?Q?eejWqxmk4NzMULxJ2ZtryhgcTVOfGsIQvZg14WKeIVYdFdBrrIkqhlfvSOk3?=
 =?us-ascii?Q?lM7tR+QE+b5FXsg6DovhuHuJrwPKHY0iCWM2eNS2z389UDqYeUo2XsQRnvOS?=
 =?us-ascii?Q?KnE0VgOkGvulT4djA8AoR6ob4hjjhJUzoUiXQuzEKcXX/H4caFX1/yvDTJC4?=
 =?us-ascii?Q?PLFK+TTcdnHhhyX3y8ViMoGmzkXxGckuSDBSXISE21GAzg0ZLubYt1znkBk3?=
 =?us-ascii?Q?ONtP744e1ODkqrmQh05qIOYbiPVHMeQBsSiThh8zKKZpM2v2toFBIRUxU5AF?=
 =?us-ascii?Q?mR70Cqg/G8xF5NvOC9u95m8a5bmKDUnikD0yY6VO395htcX2zn/O9XJFy2yD?=
 =?us-ascii?Q?+yreG6BuOgJJDcCJenYPZ6sgXx+Kgxq/85RK7xgZikNeuZpqW9+SZpJqohRo?=
 =?us-ascii?Q?AvakyJn7IjW8Qs9wOf+ptu033G4O45OIBZyvieXGGxWigGvYEbcr+3JgG0sG?=
 =?us-ascii?Q?gmUwLXbuqKHsuFXLFpI8PK3QgV0B6ptnSgkOtj70681KTWnaG6juS5PLiRTh?=
 =?us-ascii?Q?c5vDDN4l3CgCqS9nWDBC1WQfweGQYHNP6+eJd0mR00B/qy39Tt0blPWF0Fx4?=
 =?us-ascii?Q?D43w5LsJCXHIrcAvSrrn9ZU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a734e7-ecbf-443b-92fb-08de0ad9f1ad
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:11.4047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXB2wHC8CfXXdtkjX9zAf3wIsgU7aul0b827nWSyabPjmTwJXgEJPT4ltETWT31Vg+J7LtHaPqyVYetWL9S2fxdrklkEunZQbiuECPr0aWsrxmRSzK1LFkpFXd6gMAvC
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
 sound/soc/codecs/wsa883x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa..96dd66c4b88de 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1121,7 +1121,7 @@ static const struct sdw_slave_ops wsa883x_slave_ops = {
 static int wsa_dev_mode_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.enumerated.item[0] = wsa883x->dev_mode;
@@ -1132,7 +1132,7 @@ static int wsa_dev_mode_get(struct snd_kcontrol *kcontrol,
 static int wsa_dev_mode_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
 
 	if (wsa883x->dev_mode == ucontrol->value.enumerated.item[0])
@@ -1152,7 +1152,7 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(pa_gain,
 static int wsa883x_get_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wsa883x_priv *data = snd_soc_component_get_drvdata(comp);
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
 	int portidx = mixer->reg;
@@ -1165,7 +1165,7 @@ static int wsa883x_get_swr_port(struct snd_kcontrol *kcontrol,
 static int wsa883x_set_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wsa883x_priv *data = snd_soc_component_get_drvdata(comp);
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
 	int portidx = mixer->reg;
@@ -1188,7 +1188,7 @@ static int wsa883x_set_swr_port(struct snd_kcontrol *kcontrol,
 static int wsa883x_get_comp_offset(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wsa883x->comp_offset;
@@ -1199,7 +1199,7 @@ static int wsa883x_get_comp_offset(struct snd_kcontrol *kcontrol,
 static int wsa883x_set_comp_offset(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
 
 	if (wsa883x->comp_offset == ucontrol->value.integer.value[0])
-- 
2.43.0

