Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04857309F10
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415858; cv=fail; b=ICTwqODVUD/+j84SIVCgUyDC6J/xXDtM3kxIK6jCibitZa6n3eyvZJK1ofBnkMj2+84kGVzk/RjHfZHBhmnNf2STyiQAdeDVXtndFENyozAN4aTYnM7yAg/NJF3n0Hj7IK++StSQ2xJdj1AYn1G6sFdON1mmNbj1+m+3AvzoUro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415858; c=relaxed/simple;
	bh=xFoQDecdNBlPlqjXmknZizGwB5vEI156EdqcSVjZ/uA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tccdvzqlBqQP9qdy/jCK+PYTdZ4/aieRbgps2yjaILKqlg9KqJVoP0z3oRJfPT2y8+G6iVvm3RYyP0FeZy+jtVFDAQZiwqz4iOM5pFNXzZc5js2zV4Vx3UChk8IDfu6vbmXG0TfwKFwURXDsW9BwVRmm5fr7gBbhJe4WKjyq2Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kq+0qV5g; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kq+0qV5g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6mZsO/LgjKfmwMnVR3/4fDaOWf1bg64K8IA9kYC5+U+y/FujJLGqAV2xOil0x0wJMtu7+T2uxHbIZUoI+2ostANBefoLlZBSCL4Qa5Cxgxg8riZ2uLXR6VVYLrP+Z1iXDcjhfmbDUMldM5Nn/Kz8OOheGXf99/jIo/lcCGQsHVI0uGOT34oFDIC3kYsAw6WSCzd3KdQgtffY8889nNaZ2ZRF3jER7Likto8ZqGNsvp7NAD5/ZbnHP9NLISYqMVsVj4tj1PFfIIsRNcTExKwHHNfWU5eYQ7nUozB3mdc6Ejl9/6v988DmEEx4gyEe6xuef76fJpS6Z1zt2NkxcAwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpJXPWH8+TfkpvH2IP6vzNRtcCLVd8e/Lg0z+kq2ON8=;
 b=yYLxxfXGZtPTq7nd2YJ7r0/Wt2prDaNehGkO1y1OlxWcqik9rf6WRAJBQkgXyMCmn44pR/FEDPJzRHktnpKU+234MJhlx6Sk5vgfs2qRWFHlPjwkpsrt0jbdNkdg/jTm1qo+FrVBknVUdMfha1Z9t2An/0GSLBUX98CDLwoWGjkTq3zqELUULyNPmbFBv2SFWqNxqJmSkoh3wk6eDlUK9sQjLrimUjR6k7xuHp+tg+ZoKoYgYE7mPfwfv0kEqmKR91YIDrEpBj3bpPD3CxVdawDG1lIFPu6V/Xds9hFvCqC/ciUM8y1er3+KAT3avDq3M2IuqTtRUQMH/IfK+xO6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpJXPWH8+TfkpvH2IP6vzNRtcCLVd8e/Lg0z+kq2ON8=;
 b=kq+0qV5go6cUNJYrwjzUygKXgoGXr+oqhCrzhBVKm/wTrCJbHs9PgH+czz4FzWRyFILYm+q43TEK3ivGxxUHRhDG/RDVtePmpjwMXV8JqNfv5bww6+1SA7zaC7j1J32XxsgwUt1QVUduddM8Aw9JLs3+ZeCwCEmKqSJm0sFdGVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:15 +0000
Message-ID: <87tt02p0up.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 076/139] ASoC: codecs: sma1307: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:15 +0000
X-ClientProxiedBy: TYCP286CA0220.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c5c68d-8ede-41fa-c604-08de0ad988cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aVSgs1E3ZAtq8GGXLcq+gbhXJkk8afpXpmTVCM0TCXj4uJwjB7uCAQv+Mch8?=
 =?us-ascii?Q?+tRAFVS6aQONHZbiju8oeT5Xe4Zd+dw+ECicZI7TnLRCpOe3lzIp4cSouJTe?=
 =?us-ascii?Q?m8JjWxDv3wri+/jcM/eXh9KTxtBuofMdG1CKTG9qRIdNzMH3v8zDkZOuVbL2?=
 =?us-ascii?Q?JK/Vjglq9ps2yN27/D+kJsvnOorV0P/BzfLEeYA645ESNCJsGVOeV5utSMSW?=
 =?us-ascii?Q?pHGv57HWKkuWjJRYDBqXKcBhLBbtGpfj0Ef1uyMDqSeJEwbVPfPivb9HifLs?=
 =?us-ascii?Q?HlOq7xonNGLKHUrqrQWgOVph4HAkvdHxzkUat8NqQe7nzcCgPYEn9MhmhlAd?=
 =?us-ascii?Q?6x1NAmltxnXeLOSoALb24uxNWPvZJ5ZHj+ryzGb3behl5iVAZ8zqviW3sNhM?=
 =?us-ascii?Q?REFZ3EcVf3gHq4Aim6XQEMhlOhuEs1/wNEUgz5kXB8ZhQYQ3EAk5+roMSg/2?=
 =?us-ascii?Q?302r3vOIvuEURPcXOw6lfcchAblg0goy8Da4QLyOgrx1weSN+TAwORKsDIUD?=
 =?us-ascii?Q?4SJkg8yVfjuFouFdk1koyac7o1TdFtNckMd9nK/Qvc5FHBEZwT9tQpNu/1ct?=
 =?us-ascii?Q?qP4ot+cOWJRAbzbQkTkiW247HPL9Y1kqyZmNa8K2Zf+P8RaxqSWtdOUF++ea?=
 =?us-ascii?Q?yzh0nXg/kir1ONhQeqn8L6peYbkqBNAvuamcG5YoNAVyyBNIMs5McGYVt4RX?=
 =?us-ascii?Q?L41j6U+7UH2VXEGmP6yz9LjV/2mtITOn6AL6X9pPkmuY1A9LR7umcYgLARZV?=
 =?us-ascii?Q?A3mgeS9GUwUo1uaXidj3EkmmedHVhWlj5+ysv+HfnVOUCmww/Re2Iec/+j+7?=
 =?us-ascii?Q?Q/UMri4rULwD87eJKVlQCUnRPtRSjVWhsR0wXbzjQP3XMQ7blgjoTsS9fuNM?=
 =?us-ascii?Q?a10Ar3v1sWjswYsBhb2EKDyCQySjvMwV16VuwWuu4/3fwAmzAHKcQ/UKa5Dt?=
 =?us-ascii?Q?fHP+I1lU6W3C08vbTxhksbIquDKrCx3OYTejPMcatCrovtzyOIoyWhGyHNTP?=
 =?us-ascii?Q?AlZHCM0Hr26QtXq4+oUVmk+jFwt1RdGchPv2pYMwgfxRAjGRrs0hWjssUIrU?=
 =?us-ascii?Q?9kqcDqC+n8a3fRWnU3TQ8We4RCbjgoMTFbmZeP37FWHylC48toe31kkUGvA7?=
 =?us-ascii?Q?9mOJ7QTGqH4Zwq8X5NShrQineYeqWlmFVnr6juqDcNd6L1prOjUSA9uW/Q8g?=
 =?us-ascii?Q?CQ9UfYIsXpau/A+YNBoYUO59bgiS7snKUwlnGtTe34tOOCSKEZHEGCdNcwoo?=
 =?us-ascii?Q?kyI1C+cjpEDc/VjBqw/8IdYUyrovxVtT6qFhM/Xqe+6hgAtg9gdNBoylkvCn?=
 =?us-ascii?Q?0fnHnXtysecqWhYr9BxpqL2GraC0pRg4ndLlOixsmRSpPmwWgm9a83znzk2z?=
 =?us-ascii?Q?pRNut0bNmAEAO+QruWUnclRVDJsQLfHFYDm48kJ5+f+bRGVcZvby2v+h09Fg?=
 =?us-ascii?Q?wxD9V1C1EB+ml8VjrIx+RtXnhNmSA/9yGRvm8QhSYwnajaWTmKa6f8tGvVtO?=
 =?us-ascii?Q?2HEYAWRTkkZ6aQCMicUIHrFeTClGfxSMOZZW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bib0vu3DGFGZ6mumspwW0MKHXVjzL8bCcwnIcR21ypBAuNrsnyTP9CBjjRa/?=
 =?us-ascii?Q?EaK4E+l4JoEGnIG01v+pG6/a5E1VVdtufOmdOluEHBjL6581/4m6chXfS7WW?=
 =?us-ascii?Q?1ASbXOk9nPOmMY/ywr10u5yLNVe06bWuUQGrSW7Wvh3tnV1zDwxILnxQQK63?=
 =?us-ascii?Q?XtTh0RLaFqh2EfEPk1uR2xuSC4rvVcQ0SOyC8mXGB670s2dyTSONzCNS0tXl?=
 =?us-ascii?Q?CqKCxXDZWiVYpdzmOLL1Re7N2ri6ACL+wW6b4I3wyXFZy4D4n2CvTXVNyAwE?=
 =?us-ascii?Q?vVkbEVaoSfi24hrqNiN8iffcssI4+LaZcqlyhe+nNNCoEl5Nhl8BY9cZNSEL?=
 =?us-ascii?Q?9+xzZGdxUTpaQNWR2oerS5pcY+Mv3YpoCCfp2xDxwCcrGfzfv1aW23E4xdjY?=
 =?us-ascii?Q?+Yks/br2clvCHpjKLhg7bLaQwaau/2Nz+zSUmnVb8Y+hwMLAUax7yBmTuvJj?=
 =?us-ascii?Q?Kf3pn201/kkgZiC2GMOyeInm/6kKKD2euXJ8TOm2EnFtK7XFyI++HoxCMmfs?=
 =?us-ascii?Q?zUFhT8SJtbqPi13KhOpZ4r5oMCD+cNaAi97f2LDRks40ihKlYOqXJdTfx2np?=
 =?us-ascii?Q?UoE9C/QJ8TfEqtVeR2aco/qQ99YuV5nmgJOJIjmpIYJkJEAG1VICd3EL8v97?=
 =?us-ascii?Q?pGv75KyjcGHDGprv4XkrlPM48pkoNMp4fPfM55fW50jlxX2Hvl+avpcL+13b?=
 =?us-ascii?Q?0A84OhdSVg2Ze+A6RSbnEMPL5feN+fJBjJ0g2/s1bwtzD8emg4C27LvDTCrQ?=
 =?us-ascii?Q?dG2PI4V4Z3+jZpRb71Sl14gB1yHXLDu4spqGnhykZFMjIIRPLo3xOmeL44Cq?=
 =?us-ascii?Q?PGv8gxQoKMAd8T6bpkmJGQ1+elhUfzVzIHepczt/wKOb9MJRhUtOuC788CkY?=
 =?us-ascii?Q?uiVaNs88XfeRlLIlIGb2mF852Bm59UKHBwPGEi2pQ+SxdoY1FLunI9i3UsWW?=
 =?us-ascii?Q?RABWi1Y3oMgwdrT1PRnYjfQ5351eidzhA48KvbwfzEsPwDR5wpLPEQlStAuM?=
 =?us-ascii?Q?GSGq9zNrpcagRhUls/m84cX5BvHDMrGR0byDkZrO9qkyI5JfedZ6cUz4TwSR?=
 =?us-ascii?Q?7zOitiFl6iuKfsKZ7nVov3Tg+FNeHA2ueUpiGuUKXyKfm72MukXBR5gf0mq8?=
 =?us-ascii?Q?Y7UH7T4NBwCGX16469yIPBTD9sI9TRlYJDgUwOZ3wvHvPj/u4eihbe6IMD3y?=
 =?us-ascii?Q?lQsvgyxgWwjHHadTUDJm83+GpW95wLzd0mYvb5g2uvDAPRzdQGmtCGTJHojv?=
 =?us-ascii?Q?MiJHGoMbXEX/vhLvyrhJ7Eiy9xFM17iPJVoMyUafAVYdr4YJ+asNvYVmWs+7?=
 =?us-ascii?Q?deAz0FtqxHVPXlaQOLx0+O+Ngbf70BsgKksRZy10+io+wa7CiA2+jVU+/uKo?=
 =?us-ascii?Q?CrbY4aSNpJa7g0kdrh6bHQhZc+s/fIqVvEC5thPkr9hALs+EdzwXs/x2pBTj?=
 =?us-ascii?Q?S2OhJ0AebR3QUUpob6kvHE1NS4eKuche50I28ITvBl5ZyrYoSpb/wxzqDOzy?=
 =?us-ascii?Q?Dr6tr6zyMmTmrw2Vipz1CAKnyNMvf97ZEgFS5Td2Sgmpf1RSIV+epYpE84fa?=
 =?us-ascii?Q?HF4EYmoq4WMdlQ+WYidhqz8JGLixtm0Y0lTAfXnksTEBi/E6EWaTErVMSV28?=
 =?us-ascii?Q?RShDZpL0TQwGB2A4PvzER3I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c5c68d-8ede-41fa-c604-08de0ad988cd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:15.4112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6opQnR3nbI9J2JksoU8P7dJKM7N2x/9H2dhuBTnw4UxQnedAi0S6jBYezlROfJh5n++GoUEesWzQzZZMyo7ig0KvYqlvqypZCd+4PuAWu66K/1UiHoH6oCPtKAda4iq1
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
 sound/soc/codecs/sma1307.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index b683e676640d8..5ac033e0ba808 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -303,8 +303,7 @@ SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1307_reset_text),
 static int sma1307_force_mute_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = (int)sma1307->force_mute_status;
@@ -315,8 +314,7 @@ static int sma1307_force_mute_get(struct snd_kcontrol *kcontrol,
 static int sma1307_force_mute_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	bool change = false, val = (bool)ucontrol->value.integer.value[0];
 
@@ -333,8 +331,7 @@ static int sma1307_force_mute_put(struct snd_kcontrol *kcontrol,
 static int sma1307_tdm_slot_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val1, val2;
 
@@ -367,8 +364,7 @@ static int sma1307_tdm_slot_get(struct snd_kcontrol *kcontrol,
 static int sma1307_tdm_slot_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	int val = (int)ucontrol->value.integer.value[0];
 	bool change;
@@ -421,8 +417,7 @@ static int sma1307_tdm_slot_put(struct snd_kcontrol *kcontrol,
 static int sma1307_sw_ot1_prot_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = (int)sma1307->sw_ot1_prot;
@@ -433,8 +428,7 @@ static int sma1307_sw_ot1_prot_get(struct snd_kcontrol *kcontrol,
 static int sma1307_sw_ot1_prot_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	bool change = false, val = (bool)ucontrol->value.integer.value[0];
 
@@ -451,8 +445,7 @@ static int sma1307_sw_ot1_prot_put(struct snd_kcontrol *kcontrol,
 static int sma1307_check_fault_status_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = (int)sma1307->check_fault_status;
@@ -463,8 +456,7 @@ static int sma1307_check_fault_status_get(struct snd_kcontrol *kcontrol,
 static int sma1307_check_fault_status_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	bool change = false, val = (bool)ucontrol->value.integer.value[0];
 
@@ -481,8 +473,7 @@ static int sma1307_check_fault_status_put(struct snd_kcontrol *kcontrol,
 static int sma1307_check_fault_period_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = sma1307->check_fault_period;
@@ -493,8 +484,7 @@ static int sma1307_check_fault_period_get(struct snd_kcontrol *kcontrol,
 static int sma1307_check_fault_period_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -516,8 +506,7 @@ static int sma1307_check_fault_period_put(struct snd_kcontrol *kcontrol,
 static int sma1307_reset_put(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
 
 	regmap_update_bits(sma1307->regmap, SMA1307_00_SYSTEM_CTRL,
@@ -533,8 +522,7 @@ static int sma1307_reset_put(struct snd_kcontrol *kcontrol,
 static int sma1307_binary_mode_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-	    snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sma1307_priv *sma1307 = snd_kcontrol_chip(kcontrol);
 
 	sma1307->binary_mode = (int)ucontrol->value.enumerated.item[0];
-- 
2.43.0

