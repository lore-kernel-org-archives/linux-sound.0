Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA365309DCF
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415814; cv=fail; b=YEFhhMOIeBmDAGLFG3JX+Vgq4vseM6uHL7oFDmV/QezhpwCAlLWA9XI+oR5KFAxhZOTeNU5nO/0T1lPjbqffn5+SqTjWvV0gh45qHXOwS54q7NhSq2HpvQTWlEfijAebHn2WoC2Iqn36bcPNhImTCN4K2R1lkEsP/aztkNLzM+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415814; c=relaxed/simple;
	bh=RgHSBusEBuj+XznM7x401MyYDny7qmeeuutoh+047gY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KmMX0IZjESFGQeOkrLhnq3r9+JjzJW4YiTtzRmINda81PsaJrCY4DcGxHcYueXk8Mzob09m0St21o/TXm0QbXB3vbkT6jng61/EL+NhkBeh8Nc2bU2dUcjFzcFeEmTi5lNZbfXuf2v9hiEMDWwLuTQQLoAwVrE05qPLoq3CTUwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OiyvCixd; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OiyvCixd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/lJTSUSGA1UjP2Zb+DpDLmTCYXZE0D92+mny8nIsiAg+a0ZMxihHzXSo9f7VcrHSNUnrhyBjhpWXd+D8UIyIlhT5idy7pmkRn7a6nc7VdmAfmVq3tk/UHZrw+g94RaIolmKi1M+ymG5O33W6GWvhqZ0eHAH8mn9M9RFrKI5PkbkI0vLm1KGwcInS0kh5MDSYRI9smAcWym5/9CRrTuOG/3ZQU46JlJmZWeTNz9p+R/dA6yWwjWRA9rxzcPqWUucA8KzW8sWbWjEXdgdw15hkwsyMpHKyFBj4yCBqkIR/KDKBB74ERCjADsd56JQ9fy4jzPaEvyrFiEfmQXotuqx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lon0IKB60VicTlim62zblTdwIAdZ+HDNz/zqpF1guO0=;
 b=vU+bXxKlc0+oq4V4ZgRQ48tp1+05TC8eGn6jf+zuLji6wMqNTau0eLiA+pDww+JL06ybwqvOj9cyrKkOFWJdzxejd2HHr88azrqQRq5caEyLb96O8IbqhongLuLn0QlviKzEXRCB0/7ChpVKAx9BXZp/NRItMJgzOdIs9Ct1RbcS7Nx3lsiiQ/tRTstuihkHcON6Ffrm3mLUlnEDAC7cxI4HgP1Bg8z29/LOVAA6G7nO7W3tDikpUazb34J3WiW43fW8qSjq06JbapvluDR32bV4X7KSkww7RbLzA3CjrF1PhAioV1Vzfasqyh7l3rbsmgoANV2TMy74nz8XrSUKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lon0IKB60VicTlim62zblTdwIAdZ+HDNz/zqpF1guO0=;
 b=OiyvCixdqBi5t3X59Z5Kn45U5BpPzJK45BrPOXoUq12kyJcLvlX/ii0dFhr/fN1hUlBvw/bX0vEabv12gAX8DfWwxXkq7MxlqphdPZY8RCgKQ/wEgnB1yL/P9jeNFNYNbWXOS9W693bQkx9AI7mio7J5TvEpeE90AfEIq+8jJgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:30 +0000
Message-ID: <87bjmaqfgd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 064/139] ASoC: codecs: pm4125: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:30 +0000
X-ClientProxiedBy: TYCP286CA0336.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e848822-ea10-4577-cdc4-08de0ad96e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N4pbGsuMMNM9Ak31qJAHaDvNjOBvjsOrauFjgtwVvP/+nky+3q3gEhHOIHNs?=
 =?us-ascii?Q?x76JU0ksgQgDWiPXv99wQOdlM0vb3ru8d9JezEgy9uEaqqld+J/eMnHjqDRu?=
 =?us-ascii?Q?NoPVSHWAGhEookG9ScmG3kdANc/lqQMV+mrmuTq787L7+ZT9ZxaDyFsLsj1T?=
 =?us-ascii?Q?/mKt2QqyGs1VJFgaXP7BUNc/IOj1/Ib2hmyGGadhtnzVxm8o002DYrbaPBoS?=
 =?us-ascii?Q?YN+UHZeLK0ZdL58HXTczwN/f0UZNR0js3mNABCg8tYks6NgWX43YjVEL5me9?=
 =?us-ascii?Q?7+Gy1d8oqgap698OK/ypYV4W6iLrbKjYqHYHvsUhlCk6Fyw+Dxy8Ieyta46v?=
 =?us-ascii?Q?4v/OpQD1rFBE2T4P5WDau9JLNk5JFkJRJUu9jlZuR9yMPydIj+Z8/76i1FAb?=
 =?us-ascii?Q?MBYynELoDTHpG71Qwc1IsPJMI21qup6eYXDVZIzEqWIo05r1/ViYMJHWp+RU?=
 =?us-ascii?Q?/4d2BYa5ekS5tvQEhSf0V/j++R+zJG6Lw7BY7Tf0qWEoQOreP/tsF8n9zBgG?=
 =?us-ascii?Q?0iJtv1CwFKxgR2VOS76j0YVQb+uq5RFiwJR7SggghclhN7Q8vT/Ikj1d/ubH?=
 =?us-ascii?Q?U24/gcchHh49unQAUMuPPqZtZDCOeEgQWZT4kYLE5E0uq3v9ja+ioC/gUn4e?=
 =?us-ascii?Q?fLrwnekZDJzJzHkyG0nmr9OVc2bGtLw3QLk6PLSAS8QwyUKgtBk8TvD9gzb6?=
 =?us-ascii?Q?S2D4Zh3ttrqLhsi8H8/EFukfZMuAYEhebKuTlGfTOtg8fLrUazvAZCMTWN8a?=
 =?us-ascii?Q?tpV3Y/Ex69EMvc89DqoMoQcnIOMjr27x9YtP2kmVMOc/43Pg8cGTU4roVPWP?=
 =?us-ascii?Q?aLXjUy54NVHfNLNUS6qNbnp7ogGFTaGWGu5cvdwEpr/D3sY3fjEWYDLr4g6O?=
 =?us-ascii?Q?y6v3dVLRLfJ9dGYJA/e4wivBRvRsjHvQ4pTJmYMh/qW6DrB+1FGlz+9bFP1u?=
 =?us-ascii?Q?jZcn7GKOhDhs1Vfmd4WN/XttI1rTMyvYgrQoyiO9qGR8dt6wsR+vuBLFd1DZ?=
 =?us-ascii?Q?Vb5im0p7cdIXSk3JtvVDglCA+0qskjD/qiVR1yZmL4F/+WLJVD25iJqftU3B?=
 =?us-ascii?Q?GNZ3fGDTlJTwr/JlU20W0xmVkXtY6nCOnkVjIcrR+xytffMs4C8bpk9PqE92?=
 =?us-ascii?Q?6H55qctYOfSZaUfaRHXDo6KvuLKtX97I6YeBNtw7rO8MgW+veamUXqGbuMPa?=
 =?us-ascii?Q?wkcwyciffJ8ciFYyTmMmND/rj44C+H2G2TuuXPR44jx1MMRKvdozGJ9KKeg1?=
 =?us-ascii?Q?seBX0swf5xmTsP91LfqF2wyjCgJJ8IkKtCZrHGwpfTpAKw/fwlXZHj3Gr2X6?=
 =?us-ascii?Q?FvxbAOE8ztsXzlS8QWtc+AcS0uwFDNiieCHIktrW3cvVymixHpfpl4sCXFBB?=
 =?us-ascii?Q?+dOC34bXv5TYoiKJjoGp9ozchvZ12GmV/5rnkP9QDGUdqVqarzPLbl7l5mjp?=
 =?us-ascii?Q?psJ54nY1+BuG6JlnymUkkAu77DwD9BbpxaRTqRGah2lC+9jnmzKQtmrCNbcr?=
 =?us-ascii?Q?AmvsgGlVrzoJopLKf8NmLeegU/kYAF/Hof0l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iSvC2luuNzgz837Bb7D3gVPE8UC5tKZSqFiiIdI8ZF2++jT7ogd+cWCr5vNK?=
 =?us-ascii?Q?JpqQHJVUSeMcAa2ElKUO9sHiT+jz3Wg6+n3qWk5mEVlMrK2bg7AVMqln/qMd?=
 =?us-ascii?Q?WQwbcDNiRSykpRX7CivxOT+ec+KD8PYFLoIDXXUBUbH3kuh5c/lTk0PVcYXz?=
 =?us-ascii?Q?26FYhisPcFtuwsLap0R6hcMs674fxycdRllzAkB5spxpSWNgned4uhZsCldZ?=
 =?us-ascii?Q?tqDjXcCzFBFMnbfLJouDew8Xuv7UtQTGeiJJtgUebq8Uete8HoRpXAMJcX8q?=
 =?us-ascii?Q?qbqdj9vUemgj+CuzYk2F5tPGF9toLvsTsEzzUJsW2FdDje1NMAHiPTDd7+2b?=
 =?us-ascii?Q?Gx1rnl4EsKQ1/67zD6iFXGrRv53lCJdotq5MQNSZc1C5m+uwI+WNqyX8aBTK?=
 =?us-ascii?Q?g67ldk8+77cZWZe+L6kzqGAu2w/1L5Q7ne81PNCS+TFj78jRBJLiR4pJEUBW?=
 =?us-ascii?Q?7mtRsQiF+fsPT5flqIu3cnc5LbaXppze1yRryjJ7Jegoalcp6LWB9Q0+PtuO?=
 =?us-ascii?Q?LDhvmefCxG6KLGCFQP6193ZmDp4ZmZIDFadQbFYtlUmLw5EQ+eTuTOZ9luxY?=
 =?us-ascii?Q?xJZO5rzXj3CuwxCQYQ8J2VyRHDYITeBKQIao+ugNlU/Yyd99XtWRhgf0lLcF?=
 =?us-ascii?Q?AiDHnOmnB7rUzo+bR2LxsrbrzkxHPOxnLrABDZlOWb1ZdNXNbhMy9/eU+euY?=
 =?us-ascii?Q?chbyc29bbhloYflxEwTVW8gJWERRGYtkPdU+eKRz0JNPTKLHlBdZ4s9Tpr1V?=
 =?us-ascii?Q?4t0YxgxALwwYomgpUM0Q+IVjVm4juHg+mT2nYUEM0rwoT+gKZx3Gr2ngh559?=
 =?us-ascii?Q?waRzsXX0QyJjpDyUSrcyHsNAQL9oCghR/7H2TOuth+Zb3laItTx6NCKHr0xX?=
 =?us-ascii?Q?jPyK0CzGQuhhumkyp40oaCTqzVF3W55OC2OQfSZtZx6WEM0v4/d/il2mExDg?=
 =?us-ascii?Q?c23+m6UuhReBk0yrQ4arCE2/xwRaf58bl+YuU1/cC+WRWfvnnZQuG9X97AE4?=
 =?us-ascii?Q?oUAOHWezDCuMdFtFPtQoxvQb7dgPuvif+dxlymdeL5MblrtCNcpz5VD/vSyD?=
 =?us-ascii?Q?z1z9ypyCtxN3ZqxkOWClFRdbKQ+4lDFyjHMx/NMBsGW662hhlcaIIZw4h/NY?=
 =?us-ascii?Q?xa82b6jEKLimBI1fH7NHk3KQJ/1WFZwH/j4hP6bE1VovFPWJ3MSsHF2NLE+6?=
 =?us-ascii?Q?+VXiYQRGAzy+sSx8Z4amGoO9ul7ww2R3ySisBH/AjwxNkyfOIpF6d0j8+oMs?=
 =?us-ascii?Q?UuwfSSss6Zb+J4BPv/VfyQc4XtNmT/7SDkNAhQOX0ImjzdT6VwxYzy/VAMDF?=
 =?us-ascii?Q?LL3ZpdjnIm9gXqxxCv6ePiBgdU4di1zy3FJWgPpF16PlZJCA5ZMMHOf3xyoS?=
 =?us-ascii?Q?5qHUmAmIp5Z+sokfnfxjZXL+0hTVB86u5YPCEMZNCv05kPMhUYvBmRBnXchL?=
 =?us-ascii?Q?723UHCKXqMwoQDw5kB4Ni6HHrKp/fS/RS3P0XwjiCx8uzbINdfBUYIFbVOuK?=
 =?us-ascii?Q?SvarWdNtRI6angEY11KkSIMPtWndGdYUgTHZDS1wzbnPxDRtjeSYxDdEsrCT?=
 =?us-ascii?Q?jd8bspTSnUsUBDdMlFf5mp5u4UMzEaK2qOeTCLMDWH5qm2qaRgZu0ZSp6YdV?=
 =?us-ascii?Q?k/Cx8Y9jJ55Ry2PI76x1fus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e848822-ea10-4577-cdc4-08de0ad96e48
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:30.8595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t0ZhZAWGJ5FL3R9E/IuzCC/DHpEdK2T4tAh2GsKnsKMEKuzzG5RzipIhQB5Jz2fSaCcehninBvRpzRyz3+O1T2pPynPa+3uZjeD1m48FuvjvjDCzZkbd8tUb9HGCt+r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

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
 sound/soc/codecs/pm4125.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 706fc668ffe2a..f070f14036630 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -879,7 +879,7 @@ static int pm4125_connect_port(struct pm4125_sdw_priv *sdw_priv, u8 port_idx, u8
 
 static int pm4125_get_compander(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc;
 	bool hphr;
@@ -893,7 +893,7 @@ static int pm4125_get_compander(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 
 static int pm4125_set_compander(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(component);
 	struct pm4125_sdw_priv *sdw_priv = pm4125->sdw_priv[AIF1_PB];
 	int value = ucontrol->value.integer.value[0];
@@ -926,7 +926,7 @@ static int pm4125_set_compander(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 static int pm4125_get_swr_port(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(comp);
 	struct pm4125_sdw_priv *sdw_priv;
 	int dai_id = mixer->shift;
@@ -944,7 +944,7 @@ static int pm4125_get_swr_port(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 static int pm4125_set_swr_port(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct pm4125_priv *pm4125 = snd_soc_component_get_drvdata(comp);
 	struct pm4125_sdw_priv *sdw_priv;
 	int dai_id = mixer->shift;
-- 
2.43.0

