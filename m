Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F312C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820400; cv=fail; b=np4sam1fRrABdPfxk1D962vo/vFT6hV2CfdB1xlXXFMWpzACMJJ9hQZ4Ukx18EWCcHqCdDxwDygTWBQKxonyRF6owk69Gn7WNACHV5IlEMDK2PFtzud0xAIKf/byBPhS/ObqbjCyTUS1PNun7DpUdjz/dmK5JeoGKLOmxiVKLzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820400; c=relaxed/simple;
	bh=eZoVdEp7Hsq+FVxR7bVVjRo/tqCPHrowiXpe4VVv1Yc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wfb9VMYJ48wsQ7wRc796onhlBa8pBMDkKuJ+ewTMEoQGLSAZuIOtzpAUH+k2T52KNpe+zXOxVB/6xtMOYr95CinnnWN+BeWLxqRcRUQz5k3BmTE/S2yZNiHXC/irnDYEqYFe4u9mKPExpKB1ypQBepKqEFK1sDvaGzFLRkf4JQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A2r3E5xL; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A2r3E5xL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tl/VDmnByjhAiAHvsGhQyJANOmHSw98oPsa8ZSp32vbJ3PYSVxvycWUzpz/mHFYtLCDOyIKMB+a+Ju6qv7QczuqXq42capkmm02hOEOdH4PStGCQbpNVAWv2ug1ChxW4mQ457P2IQXrXel2U+/X3HKqvorci8gO/zX6dT+maieQKsp6OShhv6YcGnawNJJ80WMOX5eZx6Pbqq7QhxKN+mwRAbdSN3yb0LHF4TN2B4W6VVJ1VEeR74rA6/672TgDJsDcYI613MssCbb9Ap5GBRYkUUV+Uh0PsQmCzaH8wHVDBtI89EhcrPTFa9cpjbXPC93G5+BU+yEY/n0/Vn+//sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYOYSTEzP/0Km0ly07dxH38mQ/5LYfuyZLdGk7fRSM0=;
 b=TFojaXN4a8zhZr7JmLhe+lfgss699mF4HJiWxnkWmg6eGhiqnvmcdKxR+WHVF28qz9PK5MaHNYIS1Sc0++mmrUXAcWRrbKArzGB2Qy7A85CDm1nJjOv0U7oTAbQWFxrITP6PbgcouV+yzaINAeMZZPSJBofWwq/Gdmkecn002zTQyKLx7uuKd1Up1yAcQQNCX8QWZ/mGL8P1kaMVvlhJRCFGQ+JR68Ayu6KaH7b4EL3PqECyg8cLoQ5XV4kitCuNIGbAKXZh1C9AbVeJkAurLyy4/MbVd1qq26UH99rtK+BvEGFJCJl5zE1XotkiyptReLvVC8sjDF2Foen1lNWtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYOYSTEzP/0Km0ly07dxH38mQ/5LYfuyZLdGk7fRSM0=;
 b=A2r3E5xLSxyTOfrV/5iyFH/g3Fyu4WaSDPgVHmUXCinKO5lgkRlVA8RQLrYj58l3V919OoOBZ1lqIkikxmC+6EmvgE+kE6Fl5IZCXOL0rIewf+e29O6Cx7zmYmz+1gQ5Owfob8WzFnCJiD5VKBNh1kWU3rflWM8o2A0BivTsbB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:19:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:19:57 +0000
Message-ID: <874ir18loz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 030/292] ASoC: codecs: cpcap: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:19:56 +0000
X-ClientProxiedBy: TY4P301CA0092.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb2de34-bd1c-4915-e3a9-08de20b80b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zSq85KvqGFswACQvRVP0HgtvWVz33vE8/pjwx53t8Vp34Y8nsiVbueRhqHbe?=
 =?us-ascii?Q?bFo8J5ix3P2+FtGY7L37I1epO6D+K6Q2wSqZOS358PQDKQNZIRTUTLmRXMLa?=
 =?us-ascii?Q?GE1U8/LdVi7SGkZzzmkkJhAKU7LAF1Jx4oJaMKS5oEOryr3QImBOHnAG6DR5?=
 =?us-ascii?Q?WD+2ASi/f3nuN0Cftj+vXADnN1KUR/Uc6zm+6BsM9TOIbxp1oCM3hd1yiVF8?=
 =?us-ascii?Q?8L9JfslkbTBqYYWOOFHf6tKqxhe3VSQe8+1dIsoxIbVVqvaEbDDprxYtgczD?=
 =?us-ascii?Q?jfykZmqxA59QPMjpb62p7rkg3Rvxw8xhP9fkB5qzaiB6RCwbYqtnw44/Tgyx?=
 =?us-ascii?Q?8V5EUvaAmed4TjTtUrk2i/0qV5AMISl85apnRd4CioskicAnCcKfbpzoc2Zs?=
 =?us-ascii?Q?keroPi35JJYKwqFYaeToakEparaMfJ489e1myRyZquWpfm8NQrNhxbDgkMOz?=
 =?us-ascii?Q?905gGl4GO5Bj2AOHTY6mX7cVERMy2aJHCErN4Kd6IaMih2disLuiz14tnM/7?=
 =?us-ascii?Q?cJXLwQuWWFe0t4lmW2tuD/n4m+AqD0hWkFKHa3cNhezU/aOYShyBJ/hSDdn7?=
 =?us-ascii?Q?cwwl/9izZYStEAuULPX9G/bZoCvhMb81q1SAeqpsj2Trl1Ky3BQlr9U+zYbH?=
 =?us-ascii?Q?2rot7LkspkAvFIcqgFZLCxV0w7U5q2kvErjhSLkwUaGvq3nn3AXh9VIPm5M+?=
 =?us-ascii?Q?zj5UeECtdBrmuO/QgTYloB2Ucb2yIIIJCMas7Z3sWn7dpgwJN8gRNmvu3ike?=
 =?us-ascii?Q?2RUcEwfdEPOZSu8ZLbVoXVTKPA600Qfgap/UUr/xuJcGNTHFcu20ly7b89i0?=
 =?us-ascii?Q?J/i9sLnzQn8fSN5CywxoQmhyDZT4z08AoiyL80rbWTGQw6z8KGAxrukhkw4l?=
 =?us-ascii?Q?XN/gfbrNIQRPG7WgOraKA6zxF8AJDu4JBwtjZTZA83mAQg78gNRkD3fEDdxc?=
 =?us-ascii?Q?Lrspxm+AvlvNHDE5hAGip9wYQpndwrprqx4ZDBJcs9XVcvgmDsK5Q38yvZK8?=
 =?us-ascii?Q?NtANV8G+cjqS1z9iE5LuTUouoo02ziqXtvnNjLBFZR33q6oRtw1hiREI3suJ?=
 =?us-ascii?Q?yvX8Zw7yV1BS282vklsjGtuqxdLdDlM5MSIH/LP+YNk0/xIzuVXt2LyiIGa+?=
 =?us-ascii?Q?IRNhzVjswLjt3r3Sm391vfnN2OjBa3d6fvnqyptVoEEmNpvWINkvQ7lv9NSb?=
 =?us-ascii?Q?OCFJda/Zb/IBHDQ6N6bk7dEP4NtYHF4ww57m5sj2Oe67ODheFFU3Acl/T9gT?=
 =?us-ascii?Q?bHtsvBaA6sLsp7eL8bHhNmDcG0wQ6eeEXdJWCU97CaaKaYt4cIKR4KjLquuT?=
 =?us-ascii?Q?nXbKJdLmJ4XkglCUEoVzwE4KqMxZ1Aj7mAjAqqrX68tRjmCEamE6gBbSR7q8?=
 =?us-ascii?Q?aqM6iP4fEV6U0n+/vB9onFw+l5+xoI2+cqC/eKYCPo1EO8MCxPuavQBI4ML9?=
 =?us-ascii?Q?Fqv8rlyecqhFQH2rQOHNzK2HlNpEUpQ0n0tzZyXTSs8kldg2lj9gBMlQ4kOr?=
 =?us-ascii?Q?XPdDplbUq436dphtXqyC3T3hRzub6JL7QC4t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7PPV3iBWUBUvoqWR0KTFMQ+Q3hXjaeAt5ATzgDeQDiHmFnVX9dQeJ7zUdOC?=
 =?us-ascii?Q?2ZkaE4jnl7f6Ry9/ztsf5eN6axbzR6PMOBicebwWYq9iD6r2dPdWJIQqU3ok?=
 =?us-ascii?Q?pprZwhuwQC4R83qDF1Mw3aPNegGT7nVR13lExKcgfO6D3DG1jGhV/CT2fJlq?=
 =?us-ascii?Q?zHWmjbmCZaoFX2QAXRjGXlYsvCM9npsZrO/V2ZEu0E7tkZNb0vitzGOdrrgc?=
 =?us-ascii?Q?xe91lAZ27A2VOrAb8wX34IXrVPgyrKhr3MtuuiD3e5TVS3GpzDHIeeyzkcOe?=
 =?us-ascii?Q?4oTaGwO3rmYe0Im9Sxa92pX88KF1cR462FbJ5iUMhA63qU2QWDClEbouTaCH?=
 =?us-ascii?Q?Q3+9KuxyoHGRACM0VIBjv8UifI3BmZqITRS/vAruoVbqqlpPnDYuOgzLmBRR?=
 =?us-ascii?Q?DvYKAMumQCezLS6gXjnQnrlEdhwVMU3ZM2yXhcHGril/Q5PVgayAFbJ5cGsW?=
 =?us-ascii?Q?utrPkalbkpZKTciOw1JHtslnjAT9ULCgqMWoBmrgU03Q5O8xerJ8DQ59zQ4Z?=
 =?us-ascii?Q?6/tC9YjJgZx1+6N05pMWvXNwIi/QW2Q4ukIdyU9LrBo3tJx+xUe1mpdSlWtY?=
 =?us-ascii?Q?tPZMrKLutuFaiuKe/KIWEy/slSsTy68fSFMDYGFkKpKzIgFZ3YD+FEY9U4OV?=
 =?us-ascii?Q?ezsdzFLSqv6hZf+FKH6e5JVi/Jw2iv2PRU/387PYrh29wMefUi43c7jU8XqX?=
 =?us-ascii?Q?3YrZXHXMzBsmYvhs4L4Xp4XsoFiFam/ynPVmym/KGopQvk1NNpDoPSJfEiev?=
 =?us-ascii?Q?GLUyYNcAXguiV6gvhEyYqMPLRzsAqMa5bUVQnwtzlsL71E03IMv/tVGu+BVr?=
 =?us-ascii?Q?OGMbgO1DxuEHedW9xHCsWD1HQ1gGC6d3gOmNB54MLfHIgiKjvxHT7IuRqTvG?=
 =?us-ascii?Q?Crduojy7FCZJL15koG8YEhI6ai13I//UHlsci5ezU962zUSj9WzwDGMnfFf8?=
 =?us-ascii?Q?He98KtMAamAiO5rZERv429LdWpVXXZR9au9MQeJsPgFA/nfvY0EEWJB8MP05?=
 =?us-ascii?Q?tTBKrfN/Ur5favfhrJenvuRi5l0/Ii6kmJTWqiPbQn+io0Mq8hf/g6Fk4mBn?=
 =?us-ascii?Q?2KyMk7aM3NpWYYkZdJFP37wUtTEPAR0mDUXtjqe+Kqvb9w1oTqnETyc9LBaz?=
 =?us-ascii?Q?tWFF8X8vp6wLFDaTUtRVjHPA5cLSPJZ5Sl+PE18eJf6iy41A3Glrp1KNAqsP?=
 =?us-ascii?Q?qa0Aq9xCle3o54qF03KXBrxW/a2qw3WTAvIemDNaSrmPrLyjbmHXnLhraf9T?=
 =?us-ascii?Q?rjwQNj68p1Vus8TEmy/XfMaiScxIoL9I/jrdAByZjVDmdcd2ntQcjktzNbcp?=
 =?us-ascii?Q?irmspxk/z36WibKNV0HxyG7NreXKrU6ZmcQ6SlC0m0RpBJVfhAOo4G6ykc77?=
 =?us-ascii?Q?GOpUtx3TCtJO+gR8qwyjShnPSS6O1jwCaulDH+g5xLHpxIc1BrssMp/zZiSr?=
 =?us-ascii?Q?Ns1ScDydgefZ+64gPnb++oVKjPNaBYX0wsuP2k87/sSDV5tq+Pwn/a55NFRN?=
 =?us-ascii?Q?GkfDsSUWl/ldjb56+3uR4r9yg3V8IEBqcc9hZQtiV43+5jFfLuMTbTcpMbPe?=
 =?us-ascii?Q?PcPwE3UmIkcMrJft++49NpLiNnKbcJZTiMoMtE39RdewV5Q5NCrvxS9p2cYi?=
 =?us-ascii?Q?hAZOx6F2sCKhqh6tkx/9OiY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb2de34-bd1c-4915-e3a9-08de20b80b5c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:19:57.1931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzr236mIyC7MEMkj6IFlmMwpQNnxda/MpkD3YM3T9sgyz32KaipkzkGLup+pPz2KQ6UHB599H17OWn9qWlEoznWSuDjysFw3h6uJlbEcP2PP8UEmbPZ4fQErna2vX7FB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cpcap.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 3eb862643b532..6b80c455b0747 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -380,7 +380,7 @@ static SOC_ENUM_SINGLE_DECL(cpcap_emu_r_mux_enum, 0, 8, cpcap_out_mux_texts);
 static int cpcap_output_mux_get_enum(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int shift = e->shift_l;
@@ -423,10 +423,9 @@ static int cpcap_output_mux_get_enum(struct snd_kcontrol *kcontrol,
 static int cpcap_output_mux_put_enum(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int muxval = ucontrol->value.enumerated.item[0];
 	unsigned int mask = BIT(e->shift_l);
@@ -468,7 +467,7 @@ static int cpcap_output_mux_put_enum(struct snd_kcontrol *kcontrol,
 static int cpcap_input_right_mux_get_enum(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
 	int regval, mask;
 	int err;
@@ -507,10 +506,9 @@ static int cpcap_input_right_mux_get_enum(struct snd_kcontrol *kcontrol,
 static int cpcap_input_right_mux_put_enum(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int muxval = ucontrol->value.enumerated.item[0];
 	int regval = 0, mask;
@@ -552,7 +550,7 @@ static int cpcap_input_right_mux_put_enum(struct snd_kcontrol *kcontrol,
 static int cpcap_input_left_mux_get_enum(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
 	int regval, mask;
 	int err;
@@ -583,10 +581,9 @@ static int cpcap_input_left_mux_get_enum(struct snd_kcontrol *kcontrol,
 static int cpcap_input_left_mux_put_enum(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int muxval = ucontrol->value.enumerated.item[0];
 	int regval = 0, mask;
-- 
2.43.0

