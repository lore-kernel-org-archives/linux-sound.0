Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5978C307AC0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415605; cv=fail; b=b+R7Sw3LNm3jrduBptFqzU8iChwfrtHzJ5Tbv2BQjEGlCSOT569QyKSin+DUgG20MWKFNXIyrFOXThT1KLszOvp/DYwKw3bT0HNFIjGvtf4EGH5E+yfotsNWmK0r8i3XKJzTd+AAtUIE1iGpIU2ehUg70agqLA2P7rHJauiyNB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415605; c=relaxed/simple;
	bh=5PtvQs8ihOW0eE54/4AJTNUp24rME8qsWAfGQxlhsks=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eV5SvVASpA5oYJIFZtPXyM7Q/pu3zTO9BPWlkfpCoeokklNQQhibGQVn1ZdNqqWFistniv3YeIHq8/jdam0pV7tG4QgguZuiR1Yuvrc7kUZZ1uiY/AaPBdRQvnSGhRjWFdHCijg82dQnBGAjFBZsvdGmO2/J8kTVtj6JqR7XL4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Jt9gkbp/; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Jt9gkbp/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETF/RdtbMO2LGobR7ZhZtVe9p0n3tNrvEjI2jciyyHkoFhurKnBVCDvFNfF2OV0/Hd79ucDsAQ/zY8z5y/oPNJqOYotP/hrtW5yPfKB0Nt/EIqWFdSPCXTXqI0Ku6AUWZXiP/5vCfPWceoxr5Uxk7vGeh19i50Yj6UKKq15MfnNungphM3RhJ4etL51vi6XLTm+cZ8WA8XyDW/19RhOqKJ1BEkNAtTGuaCBQ8wipkABVEfSzxD0BI7j2l1es/hwfzIyaEmr8QijBRFp7wW+gjfOwx6p4jg6HsKrGofvx4F4mrf7ZXgLQMtjuAknnp+qyivdDuGw+h6JEsya0LYqTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMu8PSROcvj4BkPuFfztHGA7CamUJU7qYx2oVFxxJnY=;
 b=RdOM7MXcKvwxiZpFn7VsWp0Q3XBWjOILNK4GERdBA+lXba7WbCWNwaK9TCKSj7HaQunEVQEaPfVbdYGJCSweuaWeJJhgu0DkJXHdwdgACiky7T4U8ZSL9Rc/VUxyQ7mlsBvGD4HrPxejQxW7X61Zmhwo7v++ZE8iVeNFMGStYfRxysec8eirwDNbeMbulGoTCFWXhL6KLSXyURGygqnjry5oVEXuCPK3wlzf0AxBdcxtXH9AEnpzR1CQ9WQcuq2ETq9BfjEmP/Iox0gmoazRVf7yfCcRo2XuNBAHCdBX4KiFsXa9JcqExHh6GztqKFfbpDS8A1DxLTEnz7RqhaBHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMu8PSROcvj4BkPuFfztHGA7CamUJU7qYx2oVFxxJnY=;
 b=Jt9gkbp/aq5wn5YpYAGF/0UXrZEisMbzPwRH1ipDNFSutsBjCjSRFVT7Ei7BQ5mmoMQPh2UKvEB64QdB39KK7Fvgr5IG3yOyxw8dDRZ53Rz+ecdLiCe05M0iAACM/+Qd7g0xnxsQaVQj7WLFxDi7spZ6NzF0igqy88Lnh+AjacQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:00 +0000
Message-ID: <87ikgit8r4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 009/139] ASoC: codecs: arizona: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:59 +0000
X-ClientProxiedBy: TY4P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a555416-34b8-44f1-312d-08de0ad8f0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vp71kgMlkLMUY34O5RLrayFK/OkzqB1lo+p/N1cN8bnvnoSlbGDMXktTIPPs?=
 =?us-ascii?Q?aq9YFQuk4ixol2TEz1BAaAtLjqX//s8/AlEnnkDJBWIslStfmgbog4v2VVab?=
 =?us-ascii?Q?HPl+e839Jk2glaiOeMdnVVdh20M91vTrAcz6m/cuZgCDiLlVBbh7UwHyOdpY?=
 =?us-ascii?Q?B0D1pwW9kEehE5otWYaOppijAdmywq5r6oDTOTiptyelI3UZBAYizYAePZnN?=
 =?us-ascii?Q?WLdviZqywbjhaTnaxz9TfjRR27NBOcpu3fwJ0Av7Eee/MrWc/tF0TF5SLRaF?=
 =?us-ascii?Q?ShWK0GrB1B8P2CdU3g0w5/5oeDSm+57nLrQXW3qb4E0LoQXQdUnn10HkNXlt?=
 =?us-ascii?Q?+IT5ZRrewfADDHIRxkIAt3PubbStrsgX08TzXL/lSzL2YIDuSApxOOBoA3EI?=
 =?us-ascii?Q?BWCGLI43uDqF21twI3H6uiWDXwX2zMswPWLHBw2cI5mIv8lREvdQkdV1SyuV?=
 =?us-ascii?Q?j44W19Eza3nHjrtAR9m6CrHEolvXNZPVdgOAhtadxxHlp/btV5KvJQ8OHRzW?=
 =?us-ascii?Q?+FEv2KBUNkP0YsWt8+Y8KnWoNZ1kT902RobOXRFCuGgf+QGiGhB1MmbMXD49?=
 =?us-ascii?Q?+lil+akMEZ0gcDy9H5znkUQadlo81Ih5w+RdQVzzoxrMyT41RytMtYTfdkRh?=
 =?us-ascii?Q?ig0zTYj5LfkVN5kZC6JjPDM+cjajmSfjjxCYesmvLeWlD50fCcPOkjYr+uyo?=
 =?us-ascii?Q?ij/NoXrMmikR/yRKRpCfnz0FE5/E0OeNqF8mdC+oot8pAHQch7/AuvfCASRj?=
 =?us-ascii?Q?9tTzfw20TmnS8R9keRyIVkfuBQug0CUBLH2T7DfH+3l67nEWjYr2Dz5164nD?=
 =?us-ascii?Q?dCTS8tR9T5S6VbLs//Wx1O6+idtHHZVH8z6IgC3ajMRzJrsi6uoj+XzbG3+R?=
 =?us-ascii?Q?2eA78gvmr+2Zg8gW7RcHH7sa2LbY08C0f3w8GkzKw9sxk922K43Zrh/D2Wi2?=
 =?us-ascii?Q?Ob11pxYUJRmhGUBYnJ8xRxI68QyXT5Mqu7QCajZ5qnMtOqhh/xDn9gLyRhTU?=
 =?us-ascii?Q?ynZ2xH2pWJkw05VjQvajLUjBFtT4zM01QFzTIiPe3GsJvUZevwGAYBoxHuEj?=
 =?us-ascii?Q?CvrOPnAyRXwuXpqevKgYi3LbXLeWxwlJjwRZ6OkiHO92WWfygxFPq1yKSq/j?=
 =?us-ascii?Q?48ZTxar4yEynAyYw+jYOttBi5OkuKowb/Nrv3HuGiR5m7cU1oT0s27+PqPMu?=
 =?us-ascii?Q?PlGsQe0/AiVBSaAxpdMuBVxMnpiuOTFRTGduaeID1NQa8kfz5lGIUKA5Orai?=
 =?us-ascii?Q?9Jwg5jXHqWaurH8gJqDJu5X23Qgdo4xCH7A1NIjXwiQNlWOZPDodhPHqxA4p?=
 =?us-ascii?Q?QkS2CdtKWFw0QxvcF9qmWqqC0tQCRSR47jRUoPe+NuQjnJlLc0UBaGQLn4iM?=
 =?us-ascii?Q?708LiOXYmDuGvWdS8+2y4x/vQ0h1lCvEXWfLbnCHEXcLih5Stl2t9p2tSuw6?=
 =?us-ascii?Q?cgB45ET2ayvqh+sQlAknmGJZzWjV/rtZljDbtndY7GS5ia40orkmDpi5L7RA?=
 =?us-ascii?Q?QlC1NFl3DAwh+yu0UNNKILm5M74rzhnPESYi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dvWvvEkSEGPW+wtHZvaugXDtq4A2K9nYWbNYIiFTOyWlt/5Qj+0/R6Z7sk6Q?=
 =?us-ascii?Q?c/qnwRRW1bU5sG9HCg06IF9IbCSbishALuxDYjHJy58y54BMue5/yw2DMkAy?=
 =?us-ascii?Q?VPqeqnV55xackAHBxKqnQ9fCH+kUfP5Xwso6pa2Ry9Zri/+qf7G0ElYNq+F1?=
 =?us-ascii?Q?Bu/K9tTy9twDD5YFDWpOW3Js3OE2F/IlJt4EuspR8y5f4Bo/FmqCCn7hCrbe?=
 =?us-ascii?Q?xXfXfg6S0J9zuuUTTymGojskoHLkTqU4QbjCeE+K6Kt1ag1rNo6mmmXjDKdX?=
 =?us-ascii?Q?0a5EXvUWdd8+mgPrQU69OMaVa35zlzRuDN1NMHwdoT9PboJBHiAm1tRi0t+P?=
 =?us-ascii?Q?OB11h5Rpmrxj8jjLJIgTUQxwV9Uq3OPEVi0339/z00KTACb4LsUR6PHkR3j+?=
 =?us-ascii?Q?I/N3zRXe1jUKxCbkToakFte+XJxbDm3UwwcHRPd6/3fCCfg+taXR6Rvjxo9d?=
 =?us-ascii?Q?WQw9PgP+uxpMEExxenkQR+LAxSozLtb3ySu4eAW6f44mXcCzImwhM5RT+oRt?=
 =?us-ascii?Q?0A3YhgGhI1t9WHImKlASeGkXRi4cuzoC62iwpj+V75+MqMRN4pn9CadzUvkY?=
 =?us-ascii?Q?a38txW+JQTtDe2k7zudtfhzuep5QqCHpEl1mHuWoqSAuSoIKddCReU38o0L7?=
 =?us-ascii?Q?MBBfwBE58o9AtnFWIbIg31LesxIMLL0R+oAlN9F9vdBl8fsFcSkUOZbgLYhl?=
 =?us-ascii?Q?cqLMLhZJcZIxRJGYUDFflqaZYcCDUlP60UM6H/PXsdhqNTHgL7qCjnPL0gEr?=
 =?us-ascii?Q?cT6IcRBUfk9pZltHzkwwJ0FkTkaBXQvuCVZa9R7GEGAOFKVcy8x3ue7mphnc?=
 =?us-ascii?Q?7C6W+379aT925Z5gqqte6JNO5VH6SxZe0WlQxPQ8XHVnht5cTIrQbPU9bw/f?=
 =?us-ascii?Q?y/Mj1nkgTWTgdw8Yzyibt24e+M0Quo9IYKdPhtKptS8EQ/yFd//vLj54/14G?=
 =?us-ascii?Q?YjRQeOrqJXeaBzi5zjkuIn1sGs7t55tQlHkuUZZfVlrxC2wYsIavuHY7MtUC?=
 =?us-ascii?Q?KSGCJu5uLt5BjdLJRfPGLU14EOttZ3pdTM67ONABlohHqnLkaBUYLEkQYEeQ?=
 =?us-ascii?Q?7J7uHnV6IJbV5MRkQbFKM54QUrpAecysywIQh+1gX3jj9rgrYgC8sVdlGRU5?=
 =?us-ascii?Q?yQWrpe07R4uQ64trtdoiUiagLJkf1m8hC8YCGhkt9oaeobgEioSDzS2+akhb?=
 =?us-ascii?Q?ZmLCsY0CN+0cb1PD9OiXV+E+UmR4ZUtXaZRlqtdI4FIDZ5Amwzea8Pcskcg2?=
 =?us-ascii?Q?B8fbHi7H5yUyiYjA+eZP6Bs7qRCEZ33zvbbbSLZkGQO6VKi870Hx0KkQSqM+?=
 =?us-ascii?Q?flhXvzEQu3Hm07oXeom5cCgc2marWBAazyMK/Z5Ge1vMbznO1nfNpD+rNWFu?=
 =?us-ascii?Q?5tulAo5kvyjpXZknuJ46gNDnrmjgxUxyCQ6icvKtRKOVESH3oUJEsQwaJHta?=
 =?us-ascii?Q?EPCRTrDNVQZRnsTXoG0lT7PhD5oKdWYnt7f69pwgZ0XYJQ4PlPyZieRmi54t?=
 =?us-ascii?Q?4cuHdhia3befQE15iD3leNaaPZLLJNZfQ3vwkHpMWQTz406ywqCpPW6HdWHk?=
 =?us-ascii?Q?3BC63Z+pxy0B2NI5xOWAUpvjiEeZ39OWCMTNsEzsNPJdFcmq/4pP2W6pJ+gq?=
 =?us-ascii?Q?bBup2uBIny2Q7TxPWllIeT4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a555416-34b8-44f1-312d-08de0ad8f0a1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:00.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a//HWkODWaVnWhal2fIwvzTKxeqwJ6JbsV1MhWXrcpgZsIswllEOGzEz2/jAzTYNUWmQ39xzZ/Sw8xSao+8BHVTv6be8zKTLOLtUiCUHndylbFaHNGJmetzfv6fWXPPX
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
 sound/soc/codecs/arizona.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index f2f47f1c1ac82..99884dc6ff86e 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2724,7 +2724,7 @@ static bool arizona_eq_filter_unstable(bool mode, __be16 _a, __be16 _b)
 int arizona_eq_coeff_put(struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	struct soc_bytes *params = (void *)kcontrol->private_value;
 	unsigned int val;
@@ -2768,7 +2768,7 @@ EXPORT_SYMBOL_GPL(arizona_eq_coeff_put);
 int arizona_lhpf_coeff_put(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	__be16 *data = (__be16 *)ucontrol->value.bytes.data;
 	s16 val = be16_to_cpu(*data);
-- 
2.43.0

