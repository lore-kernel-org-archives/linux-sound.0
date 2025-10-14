Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFF030ACE9
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415934; cv=fail; b=WNq6CTPUZhZIwPP2AH1pjc4kdVl3/a7yg3m03mblO2BUFi/YTfiqpNC1gcB3uJrKyT/xsA70ZI5R4vHPXhnCESxXFKX/WkyAUhXsX9AjL/nRLCJuNfj+oS3uG53FgbTEcVe8+KZrJKzcN/g1Oa+L15sUTDZBJ4Prrl4Uj4pJz+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415934; c=relaxed/simple;
	bh=B4SSdcl3z16ZRytfQjujxzGto+UmmIK3zCcaQ/SLbgA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EyYrZ7u3VMONXAVPP4eh7SvoeV3LSKrdnds4QH3lOAhnrwDxcDTxv3Ve6kekm3J0pU6797kN53hQN1uVMcTulVdkap1KM7ODoH31rJNN7yC+Ev9R7QTCOj3EjStQ2m0B8M4CY8yok7YT1TZ4bEVD3hXDW8N362ouaaJ+6EPPAao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l1y1j8GO; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l1y1j8GO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmD20/fVhe2KIFThtmqGFc+Rbjwi89VmX1GEuvcE96gkPH9M6NYAVx2FA/iwH2yulcVvzynGPRqTtsqRf8RE0Nfs0l2YFDopi4c4TG8Pwjp4fwYrrFdHKHuH59QWFpwqmtoPwInsmzKp5xG9ofCqy8KX8A15XmKjb6hZhogB9wtpMm1KhMaKXwyIjAWklilYb790a2D03N9iJTr9u5jQoO8SWqHm+CVIYpMse2WaUVCvgEhKXiWlIymuxmFuSNvJvpG54MmA72RXYeRq19KOQPcR4Rkmsc1lErMQhU0uJDAck9mox6cNk4jqw8i12Y8+BFq2+B/6U/FH0s/zaSYr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY1c8E1OAZOXtigCAGOlSf/psJPitXbya8IPGqrNgXw=;
 b=Y9HtKicMizHp8hfcUIjfTyooIcWo6NQ+j8+ZLA/3QUCHy5EwyMVoQjDU/5d7ac8hMGULI7l33ZuimPZ5JIIGElxVrKRQ6B/W1LFMG1Yyl4/5lmBFCOodK6ohgzSopXN/pxduuMPD4+xNAghlbFeEGyBFrquNSUEpljHU3U2OhbwWlPkAk7alvcT2/0CrU0RWdiJdbOmJ63gurAZ78NnvX5D1TZAueMPwo1YPTfAEdPjJmQdNSFF0DGp4W+camXM2RqbBsRRJSdsLuMx1tsGpYdpe9QB64GnCssHduZN5eFN0MHBsTS/vnhTP8vfSbfWKixSGihBT5qaenk+Xr9kKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY1c8E1OAZOXtigCAGOlSf/psJPitXbya8IPGqrNgXw=;
 b=l1y1j8GO3vCfDAP+YkJ2K5bXlcE2JPu1fwBdQUjKCxdVVAS6pUsB3OA3EoC+shDUkIFLQh8ZSyqrheNZAZc45pEMyhNPF/mWmje/A38fqftLwiccDAuwiHj04zfb1N02zLIbn4dYnf6H2MJgy5gAN4s/F/0UetDus/CoQgwbMi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:30 +0000
Message-ID: <871pn6p0sm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 096/139] ASoC: codecs: wcd934x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:30 +0000
X-ClientProxiedBy: TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 8951cbbe-26c0-4f0c-09cd-08de0ad9b586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4NGadOQfmR+ZabALby1FsGRASVRdkoD6VhZRYEeY3w2aMxg0BElscDXOhUD/?=
 =?us-ascii?Q?0eWLP1Owm88B3d+Hz+bUspKKWXsJBNZ5m9oPPBMmsfCZKTKiW81rPZuHYEaf?=
 =?us-ascii?Q?FMhQJlOZEGwyDZSXtLmg7+ln+tOpAnAkvNtlZbYGT7Sn7ZsXvc9kVzmYXlZE?=
 =?us-ascii?Q?VVCZD4PIvrQ1/EqJl2dwFsmXmHQVm8fh64WrcijIHTUke22RBhpSc8ufbjNq?=
 =?us-ascii?Q?V+jYthXFAsG0jnKU38hmHix23XNbHzX88bmfbcyZ32URcl8nB4lVWp9m+qiQ?=
 =?us-ascii?Q?Tmo/oMuY8r2kOEinNOJTGlOurc0/crUwRS3vSHNK2NzrS5+BS8K+AfAw/8RX?=
 =?us-ascii?Q?oXp2hMJe+3ZhH7zYYSLr0a8Nq8Wqc9FYXKU+pu4VNvNXgqgr95Br+VK5CX++?=
 =?us-ascii?Q?Ml05ynCAypIT7YLvyOTw3L9FpaA79HkdbznQv1B86TjyaSQ4nXBoWsNI39xn?=
 =?us-ascii?Q?WqJ3yWmOByUfkwX4AZE+STOw7UtwyTHup/s+/wNy1wicWBlfKi/F0Xd5vEE3?=
 =?us-ascii?Q?VkaIQpo8bhi/5O3Ek9pIgDP4UyMbsSlKq4TcinKEm4t9ta5dpkSGnLhPh/RS?=
 =?us-ascii?Q?NxqWB9tECDCgSf7o0IAC3gyhGEVjMcqGwY+h+E42D0l7LvqAZsdBry3BeABp?=
 =?us-ascii?Q?/y6x7Mh6r+JpCPG7lA/bb+zdKxE/mvlYv0pvP165bFfxEyp1xiej87W9nxxG?=
 =?us-ascii?Q?SJTdUoRRTRHpr/pFwPrOtc9GZOF9HHR541fruVn0Z93HcML8cSxQKVBvpSGe?=
 =?us-ascii?Q?cKTSQb8osjJxZHg1e6oGYP5ds1iBcnur/TxlIjGNFeCOtjUm4aFneDwjHBk8?=
 =?us-ascii?Q?exhIZMOJzEREO9C4Jyq2EeEyCEvcLrtv8WxnHdAZMs2H6HkZ4/8pbRfL87n2?=
 =?us-ascii?Q?2oASxdYw5Ft12yqcuKQdnmXkqdmKSoktzRW8vh4DsRwo3vzYvGM5ZAEPxDZX?=
 =?us-ascii?Q?hOmwLeZESu9wTBy0Ui1+H9w2LhAivg8JVo5RpoTcIQJ6r0WSGQMIMIfeg1u4?=
 =?us-ascii?Q?DeYAUYzdnpOle5oAtRWu8OMj0Lzb6gHXzQ/N6OxjaAi1kSBFZGIEdSyppfO7?=
 =?us-ascii?Q?b5vRmD2eU77LfNiJENlE/Q4J5vynbpOoxEM4tF43YMRv6QnfJTFY+R0cYfWV?=
 =?us-ascii?Q?Wdfd22Pr65NuB7wX03WW2GiEFrvYPwVvTaBNWu9U+Xu+jygDJ9Y6ut2AN6G/?=
 =?us-ascii?Q?CUlclTqUX9+OZBEYogby8klfmcXnzReh50NpurO5WIpTQ9JEFBMAMm7b1/01?=
 =?us-ascii?Q?+/Vwu/wFLdoSk7gag68b5Uguc8P/rn7qJvWK+19k4Pn33mONohTq8StMPE5v?=
 =?us-ascii?Q?zRer3ABr6yn77yVyOBdbYbmCLcs6vX7YNtOaGllrMZvOz8ML4wBLzTVpJXOk?=
 =?us-ascii?Q?PqUteBndwczG8ki9ilwJVcC2GxeKqR88HpB/xTHf0bbzSDxB04cH1bVBVfCl?=
 =?us-ascii?Q?2CE9z2VmZ5P7DpJJAqga8S1p/xL2SGAew/a7StK7dyRZVJ4CUdgtwE9Ex9P9?=
 =?us-ascii?Q?QDeS6/4gw1TlxbibSP8eKvhlYciun+aEI/jS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Th3m8CfQZkc6kN2Xp/ZqKozXGW1r/kgYOPlyYI0+dmA/Ggy051pmuLTY+2gf?=
 =?us-ascii?Q?6mrOjPylCrJFw8SOzZdWI7GQbVOzbjfPDv4Wd4cQWdA4TPG7VSdVQzYnRF96?=
 =?us-ascii?Q?Kj/vcA9noeo1s1wFjIc5x1CXaaSBuxva8wJYL3PTetjhd/70TBFNSn7bVMAx?=
 =?us-ascii?Q?ddjGB4n7V0YL9TzV4N3ZdqzAoV7PYjHXIbfGldEhm8ugZDHbU/p7g2Zygg/l?=
 =?us-ascii?Q?X2sOsI8lRJUht0l6PkN8M19a5+OFOCiVuIOk5/CdtHPsJr/odH9XTAEcD1ta?=
 =?us-ascii?Q?/0MIlSC8p+ls8YTF2QJy9XTgVAyK9Q5ZN+IiSjDjsArkQMwsT2s4SBw17FkB?=
 =?us-ascii?Q?aaCmFmbZViIFQ8F6bDd1DGXDNKV9BsIDy3siaCAhYqE13XEj7CWFXEAXFvd7?=
 =?us-ascii?Q?ziJHc2x4BZKEQMaNWYcZeTW6yQeFjgvRBsPTXzLxq5gq6jgWPV9wxwrIB44f?=
 =?us-ascii?Q?tmC+6JC4EwIux2C3y9H/MEUtSQCYCOe2u6Pr0hqmUfC885ELKo3544ZZLUsk?=
 =?us-ascii?Q?AVvz+sPmjiUmSY4BoxIsY1sRaR1jRsR+b7pXEeiL/Mt1pbNH0G4Vp7fVE9j8?=
 =?us-ascii?Q?k+9OZv/g9CRab7uhVcmi+2aR3fOtvbQhyxk/bYZ6VLDD9c7t9mJAXpTA5C3M?=
 =?us-ascii?Q?ZnSphNKSJN+7gbnpYBrmosL8G5LhuiqJ0TOl9UyQEANcO8NhwN6ixMQiv/SP?=
 =?us-ascii?Q?GZBwh4N5lwj1uIbD8Vu+rPtuM2ovMIxpskPy4yLWbCPUTA1yTvaEPRxhA8xj?=
 =?us-ascii?Q?ueKONIkWbbrlLNMtOOSuca/afq8rmCO8aKDBbHFFw1S2GR80rEy4Gluasow9?=
 =?us-ascii?Q?4r7d/z0K2VHr646TDAnMymLupgxSw8KaG/kT/CuAA1mNe5H7/54WievI5QN6?=
 =?us-ascii?Q?+pqKeokszgZIt7l25Zj2aSpGwuiCy+NCy8klz/wBN3Qm3nVAt+wTFYS0zpad?=
 =?us-ascii?Q?wO6yR+eficG9wEl6RBN+21vCfbU5bncEXqgrI9ZDwOs+tEmbBdgcBpj+7ImM?=
 =?us-ascii?Q?K7JA6fusLMSpoFRlkjKd92mhF6xfGaglzVAavm3xa7oXVxRy1/mu4YoPHDn9?=
 =?us-ascii?Q?mRjdvItl42m6dkQSOjc7uugRqjhXchE8Traa234WFTfW/bDFR9Wz8un5Z4V2?=
 =?us-ascii?Q?Ss/ZKOvwZbWCaWk5fB5JUntz24oV8e5nbWzIDk9nBv+YbJAKenN13OM4h/pU?=
 =?us-ascii?Q?gp6wEmDQ+oelIU/fHFTTHwVbvVfChOhKD3QtLWzsmO6T3QZUVn8xfmdXHrYT?=
 =?us-ascii?Q?9Xjvry3ErZE6Fyh5bQLAwCH5SZ8V/4H6vreV67is5FDhaH7ii9r6s6UWNxuP?=
 =?us-ascii?Q?fDaQMWvi6B9GvFnYoSL4binP/pM/xcnK/VJ299mnVDa5INnvQ6rZV/ZtkUmH?=
 =?us-ascii?Q?9jtvema2Mpmf+wBJCmZz5izq2WfabOBrgLVI/XFVrmTWu0gSQkkUTz8SMFXf?=
 =?us-ascii?Q?qDHmhuvfZAAkOXHJLMgBKOyLy2yeJxISG9F7/Vy+vFSKpZ9m0niW5UbCxbXI?=
 =?us-ascii?Q?sjKJAFm9cbkSHySKXSwy6p8K2mGGrQ3Ja+UtuQ3UQeeUEZ8Odp9t0x97WfKn?=
 =?us-ascii?Q?zDZ4DJ6K5RbnQASeF/PYsaFWnDrb2nMbOIwD8esE2WiXlVemqgq0mCtYWMoV?=
 =?us-ascii?Q?NwVY3F4gqCyR4UEXXgnhb+8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8951cbbe-26c0-4f0c-09cd-08de0ad9b586
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:30.3895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxDWHOyYxOk4qzmSs4dJY0zv8DMAdD/2WKwb4dgrSb8TfYhS9J/nbcPmgt1fijJN36RNDm5tC8/glG+fB56MZTivCfV9ur4lAUB0zvpfn6NybHNCgXFywofCbcPJrnGz
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
 sound/soc/codecs/wcd934x.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 3c22f7149af81..e8df380bdff38 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2909,7 +2909,7 @@ static const struct wcd_mbhc_cb mbhc_cb = {
 static int wcd934x_get_hph_type(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wcd_mbhc_get_hph_type(wcd->mbhc);
@@ -2923,7 +2923,7 @@ static int wcd934x_hph_impedance_get(struct snd_kcontrol *kcontrol,
 	uint32_t zl, zr;
 	bool hphr;
 	struct soc_mixer_control *mc;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(component);
 
 	mc = (struct soc_mixer_control *)(kcontrol->private_value);
@@ -3102,8 +3102,7 @@ static int wcd934x_put_iir_band_audio_mixer(
 					struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd_iir_filter_ctl *ctl =
 			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
@@ -3131,8 +3130,7 @@ static int wcd934x_put_iir_band_audio_mixer(
 static int wcd934x_get_iir_band_audio_mixer(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd_iir_filter_ctl *ctl =
 			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
@@ -3167,7 +3165,7 @@ static int wcd934x_iir_filter_info(struct snd_kcontrol *kcontrol,
 static int wcd934x_compander_get(struct snd_kcontrol *kc,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *component = snd_kcontrol_chip(kc);
 	int comp = ((struct soc_mixer_control *)kc->private_value)->shift;
 	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
 
@@ -3179,7 +3177,7 @@ static int wcd934x_compander_get(struct snd_kcontrol *kc,
 static int wcd934x_compander_set(struct snd_kcontrol *kc,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *component = snd_kcontrol_chip(kc);
 	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
 	int comp = ((struct soc_mixer_control *)kc->private_value)->shift;
 	int value = ucontrol->value.integer.value[0];
@@ -3220,7 +3218,7 @@ static int wcd934x_compander_set(struct snd_kcontrol *kc,
 static int wcd934x_rx_hph_mode_get(struct snd_kcontrol *kc,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *component = snd_kcontrol_chip(kc);
 	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
 
 	ucontrol->value.enumerated.item[0] = wcd->hph_mode;
@@ -3231,7 +3229,7 @@ static int wcd934x_rx_hph_mode_get(struct snd_kcontrol *kc,
 static int wcd934x_rx_hph_mode_put(struct snd_kcontrol *kc,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *component = snd_kcontrol_chip(kc);
 	struct wcd934x_codec *wcd = dev_get_drvdata(component->dev);
 	u32 mode_val;
 
-- 
2.43.0

