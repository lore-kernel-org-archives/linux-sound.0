Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF57309EF3
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415799; cv=fail; b=R2DWLp2Zlen6neUCZcvasshnq7WRyzx/QRuX7E9mN2DThxNW0VblJhV5595hhJ8hRapU4z1mtW3+sDi5f67T2Tb146yekMeMiLQNuC4wkIf8aGdASZu/eKrGU4gyQqzV3/wnpnh0LlmjgGoVZlLvddlKazZyuPNgQrRZ8oPW0tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415799; c=relaxed/simple;
	bh=DcMPwFO9mzq3x2RxOCSJSn10OfFQ4EbZgJtccb2V0ms=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fLhA3mA4lmpXlx8mikGW2iZeec+wXweiI9QmLGO9G1SzcVFDRGrmbz7bKY/fQ5SjrsRh9G/Yw+/LL2n0o7VHSdslANiQTQ+wOvgvLRAc+WoDr/ue/UXrjrvxqrP7mBOGce2c066tS2oRcuEA9fDxUl2dpCwkHffh6rNWT5SwkYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dr/gN/Lm; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dr/gN/Lm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMA1/X/2qmAmwfKWR1xgcXdTr8/D9kz6sHdB9QBIs3shLy1T42expJZrqfPpDpBt4oP6/pTVwigS9+LAwq8eUZAkCRsvlkCE5rPdQhJBPCowrKQTDxxOTomLb8LE3wXQxYJZ6Q7yVzgZeIwjctmraIpZ42xDxD4aH96VKY3BdY2sOqCB07VckzsBYMu7gjU+mZ+B+QoofH9OE4XpemUYEEzFizGbL46ir6ZWW9kWH+PGfX/QLVWycJwkb4QXmSTJ8k50fMBoSTmNc3qwXsZMECBXZx//MecbvFdHC4lBjQC0ZLBZT6hFW43WaA1vcoy1H/kAEyhA3zCC8jc9AuYtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUSQa3/RzkWJ6Oi7YggY3Rk2LzxcSFeGyhqR5Xc2WS0=;
 b=vXz064xtDGTBQ/rO+tSVQ4OmOrLnK6rhcyRTFZSWtObBk8gonu3a2cX2D/rzt5vUEMq1FQDR9Xk2tZKTjLvyJ/hleWbEugmTUBlqU98hz4q70rUZF5b3iCuU5x54kgMRxnaCcb1YWvsY2q1hQh4vCsOnbTAKTeByLYXsKz//NFAhWl8Y4DhkumysouwEfdWJgCDVgP7Z4qVsjt9ZEgSE1Nt1MYM+Vc+muppvOtWMhpwb18JeCXQ28nj5BR0/xtomDk6p1vrgj5p3Xxe14t93091pqVj8y1HBsHaAL3GFEfoSzkYHM0tWri1P5bPTSNU1cKH9DO1n4WsfIyz5Yumqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUSQa3/RzkWJ6Oi7YggY3Rk2LzxcSFeGyhqR5Xc2WS0=;
 b=dr/gN/Lmu1JHtj1zR66xr0HO4HJkQi6ZRrJ2M8RSBCpKTP/9pb0kaCz6NgoHKM3xFnU2ju+RPP89PBhcaEbhztpR0z091MZVpcQgdxSO3dqDvtgcX8mXRFZ3+aSjvLnURX5BviHXH/DJQyaZEaxHpW5r0IGbHcopjSnocrAioss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:16 +0000
Message-ID: <87h5w2qfgs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 060/139] ASoC: codecs: pcm1681: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:16 +0000
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec3ad42-d26d-456d-3ba5-08de0ad96589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SLBRkYA/O0m1fXq8ZMOGpz6IJtK85ifRRrYOMJjoA+lUjDb0ke1wZE2O2Xt0?=
 =?us-ascii?Q?3oPe2wW2x/Id33wldYGkWpDNKCo7y+X/gH/7lMQv4r/hy0fUAxTt364aPg+v?=
 =?us-ascii?Q?jo2ZraXwpB0FNcioHBp7L8Fyye28EEkcm6zNVeXtAvLrag79cJU5YaHBYRPK?=
 =?us-ascii?Q?ViXqHUr5rvkF12NOkxZOkrAGtsz5ECGdqgE30gRUI62t44f/cqmdNWDshyFg?=
 =?us-ascii?Q?KCsKv0LDvwVCg5nu7ghGEUErhE7+qqjoW/gf9dMu95QaLioWm4mtweFBPFFM?=
 =?us-ascii?Q?G6RE9Mo02vR5al+hccAanL2OVuvTdoUQMlmQyL4zhU5A99RPaWDYEYBHHKTU?=
 =?us-ascii?Q?HRS5xKwyGrHGGgv8Ov+6cH1zehMCvGPVgeitlnPfUqUA0U6y4YK9imYTzPvZ?=
 =?us-ascii?Q?CXxVE3yqrhJtSkKsDh+lUpeto7jrN9Kx7+zIxUHZBtWJCY2zfR9nWj31FajM?=
 =?us-ascii?Q?Fa59SHKQn7GdZID2xyY3dVHQ1FaGy6vRe8fv1d4+oJMnWOrhCVFa792MZsJi?=
 =?us-ascii?Q?OgTVmub3jVYB6NgnkxGGSnB4SJu0H9j1J5H3kkfxgI4eiisuq4eNGpsEleZd?=
 =?us-ascii?Q?PtW1TiCt9k+q1B7DEnmW8aOiUBEjooo3vqEISoaf6djVh+tkbwjv625KlWsS?=
 =?us-ascii?Q?9+MVW1UqafxZWWMNsBCD0cS5BKPN5nr4G3OlBcqWpymWmjjeQcLaRkJcvsjI?=
 =?us-ascii?Q?IHoB8d7AeD5Z3+Rd3h88TWAUAU0JuGp/ktBVpq1x/nhYgvIzieZNzbUPnZp4?=
 =?us-ascii?Q?SutrOm7CDNX4SSMNxFx74c9QYpRRDn8m77WFkADndCURppTno/h19CArHgmu?=
 =?us-ascii?Q?sP9q/t5jdxfv/5PISHj7hEZeXDKvZlq9GvqJdWZwrA7cTawKohP1CokpKUbL?=
 =?us-ascii?Q?2TEge65TKUG7b+ZBYyuz7+8lKcEad8C3BSMD00gpGLTl2qPB7a+2FWM1dVZM?=
 =?us-ascii?Q?myDLJfHuUtk66u/LiVmKfakVma1DWxnpudeVLejlDH0tbgTzatgmn2FRStGw?=
 =?us-ascii?Q?fzXxqLmYAoepAPP0jVF2L1LnCIYYV+7qoSiWcYC5xgQ+UExT9z48qh/ktz3x?=
 =?us-ascii?Q?2wBDki1VrTkAGWOZEUrEnt85LntCdrKRmJEciWAvjtLDWPhgvxzUaQYuRCbI?=
 =?us-ascii?Q?6U+T9t9EyrSpMjv5QVYKcwoIAozBNvC70l1sClNPj4k0Au6pqP7UHFj2lmTZ?=
 =?us-ascii?Q?cQldgwAbmFd6oYGMLDxiqTm2CQblIl0we4ApAtO6x4VDzHZK3Igik0OogJr3?=
 =?us-ascii?Q?PO7sRCE0QW+i6u4ILksnELAwtB0eS+2z/tadklDI+rCigyYbfhvu6PfhMNnL?=
 =?us-ascii?Q?OtofObh7oExGWkgm4V24T+H1aDC5uoQuxMXV5zW30ttT6oH78K6mjUJTqiGH?=
 =?us-ascii?Q?aZNtwk8UnrNPe2qWSR/8x48ODBDf46YHLyqnE9KSGKJcHWY04pKU6kbHbFW8?=
 =?us-ascii?Q?nHhJCvqnoY9k0JhuwUl+XqRs8eYXBZFZ2D60SJxiVnmMNed4CIStVu4wKxRF?=
 =?us-ascii?Q?YkucxY7ddRxd3znDmv6MXSYVoa3DR/wo5idE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Byi2MYy9NvKiJ96ui6+Q7/T8dngmWy4oeXmpdNr7OKefy2FwiyM0EoxVNISS?=
 =?us-ascii?Q?bKyaNSxO6MGvdXjCaiNDsGhXldujnFfkiCsEyM9v9cY+J+0cYYfdrd9DtYp3?=
 =?us-ascii?Q?lTmO1LESzdO3MHzk9QBL3FFa73NDT9tgqbU5UZ56625LMS6x5aLhL19nPbbo?=
 =?us-ascii?Q?M8sjFB6LzjG2H5qR3oV7vpBsxJwrElUL+l+NV13iIQDXtPkHHzOAFVUTu3yg?=
 =?us-ascii?Q?AxccqfvaNvqb5flgr1wbuveorFdkXIM7jT0JQOsDW544NHMveL9BTfa0jGDI?=
 =?us-ascii?Q?J+wZKsk5r/kMIUUtZ1SXqn1XnuXDCtRuhaxqBxxRXWD5m7jqEHi2kEG7Ylv0?=
 =?us-ascii?Q?izASEz0gQQScGa7+VYzo1La//70KAMDKyke4sfDb4WYFc7fjSH9FNHkBD1eK?=
 =?us-ascii?Q?ebdN0OpG8P9LPUhNSVurwP/k9w7n1rqD3LmNq4RtkwAI3TqscSEh4DWYbwUH?=
 =?us-ascii?Q?55AngS7dKzCk9MeuwK3UMm+yjTb+aqBSj2aeMNxKqOW/kBY1FmggmQbEXtF/?=
 =?us-ascii?Q?7VZ/t0MWKSHTcNBhk50iBcJ9dA0fDEHyRSm7raMMo1/jgbkT1dZ3cZd/pG2T?=
 =?us-ascii?Q?bj1yUV5+VyE17cSAyUYnEWjDchvyMBmOwiwIIunNZmhSGHdLptuanvAWgUGY?=
 =?us-ascii?Q?nntXeSj5T6Lpog5g/TVE6HVljP/iUA/Yi4Jzm8TWAz0rC0l0GbvHeIU3Z5Pi?=
 =?us-ascii?Q?PRlgX+IzX8sR1e+oF2PmdfnUS05ncsE0okzmTZvsTJpbSfcUkCs2XZ5yHE6y?=
 =?us-ascii?Q?ugKoEapEHTkcEmLKq3B1SAvnEhPS8uN0y2BpYWoKGELZYTfuk69vCkqaZEDL?=
 =?us-ascii?Q?TDpMLnah8DrOOJ3sSokC1iSfEvjKHQhDTJc120+pxW4YQw9go92smErWTJKa?=
 =?us-ascii?Q?Kej2diluFMS9INfNdHVfeEOiOoGwiIld86qQ5c5QQ6Gp2bLKq0PWLLn30nAz?=
 =?us-ascii?Q?zmHVAqcvPo7bteOBlJ9fbJPoLG3nQmUG/HvZq7U7zqpxR8iMWizLSAsfiODW?=
 =?us-ascii?Q?9ZxYuIoRvNzanmHO3xjYSNFRgk6RRbTHdLt3m8gfbJRgEYX8kF34S5XHwkQK?=
 =?us-ascii?Q?reGh/f/5Z+PK2WHZV/80FDvyhSYJbZs2CY6jcwIH2lAzXCyPWJjfDvZLpA+F?=
 =?us-ascii?Q?E6bEvt82ChUTXDhHSG+bzMO2jJ0A5JjH3xJKYh053LLJ8z7+9Ltudqafuao5?=
 =?us-ascii?Q?yG2G/IjpMeo4w0yWdTepJKZlX1+AtEak6UgEFT6qj+dSwbpzzulAQE61ImXU?=
 =?us-ascii?Q?HVWyfgVcIrk9S3dq4CH50xyRuH/6Hft9iAUWxRlCEScCTs8dItv7qbOnZGkC?=
 =?us-ascii?Q?jGraqflYglsm+fPhGezsp6O2UDOUUkqHWQkV4hwLBFqxvt/e9qowhSPFF54r?=
 =?us-ascii?Q?I/HTA58hgGamfRhM7KEYoxMgptMvU3nQpjtHIQ5FiBkB1mZDbzAVN8aczTJT?=
 =?us-ascii?Q?DKgRE6jzd69wm7Oyi0uxeoOJaDgdsKY9XEXe7vHsrgRaxecgmVEBhB7HfH6H?=
 =?us-ascii?Q?xLOWaARjztwCxsWC4hFlZpubSvGKTCEYvQ1Y3OhbrvOoUKG9nc6Fj2a3/HsG?=
 =?us-ascii?Q?jovlh9kKPrCHKTN48gvKxysKxN75ttZotPOsz1U43LqSvApaja4S1IdTiUAA?=
 =?us-ascii?Q?YiX/BAGX7hOvnHQNGdIsSJk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec3ad42-d26d-456d-3ba5-08de0ad96589
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:16.1886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKdaA6QPwJLWcryfjqnenUJEBXFDbPTf7gVltkIfCTbIBDcW80hhuSIWVwLdT6PHPkeBmjEzOoyo2kWbdqMCM6LxRTSUdByPPPOtNk4rpL+7mLT2RzDzKFPXd5txKx8A
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
 sound/soc/codecs/pcm1681.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index a1ec881d70841..f4e5f3133f2b0 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -108,7 +108,7 @@ static int pcm1681_set_deemph(struct snd_soc_component *component)
 static int pcm1681_get_deemph(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = priv->deemph;
@@ -119,7 +119,7 @@ static int pcm1681_get_deemph(struct snd_kcontrol *kcontrol,
 static int pcm1681_put_deemph(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
 
 	priv->deemph = ucontrol->value.integer.value[0];
-- 
2.43.0

