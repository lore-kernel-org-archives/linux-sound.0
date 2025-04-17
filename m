Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613C8214235
	for <linux-sound@vger.kernel.org>; Thu, 17 Apr 2025 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744930868; cv=fail; b=rT55LqLZhJ5UhZZ/XNp+I8Ihu2Rh40g3ovTEqyc5ixPgE2+IMIv938f+8BIJlu2Bz7KQSOY5fr7UbcJAhNbp0Qc4oslixaogqrI4SnjyAKY3LXl0RV8Kh3eiSNMY7olDlB+L3/l3u5DyEcA85iMukg0fl96ZeIXUszVQmyfWJgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744930868; c=relaxed/simple;
	bh=Yy68eKhWaDRl8zGVjaDOyAUAwUnrjY8KAYpxUBOQ0V4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jSfPvXaN47WWVXADh434QdqMTvxq9I4iAKtP1P4l7xZH6n7cwL9gOl+DoprjOyXHPoo0GKyy4ETBLjKU1TuFkY9+qj9a8+VH+ReFIEO+rTIxVvrZyBJ4Fbp6eEILeCAJysIVo/oAK9rsoqcfhmLh9+eOA70UONDOrxDv8BfY9os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DVMA1Y0j; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DVMA1Y0j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGvmm0bDlGeTl5RBrnUAaMBmgq/Hs6ImQtk7KIp4OjjJKelkCizqp7H5M0KPeIO2w9JnpNXYmzu0KC9NG+XDHnLE4GsH6SYwq1dMJf+e2nnXTaDBtutVqorSGUHvcQdN69rS50mE0h+S4Og81l8rTsuQGlLxN/xM7vw/M8hm36eiqZHYSThh6g2lVlYD/5A0Buh4K3wNPs3Bs3hZL9wZKksSGaFsIIDw2dDDMlWsLwLbDgPtJ0pOMafS7eq/j0iy6DwzsSuwsltQjm9598+a3d6HIdJnts67lTF8ARyyq9+PSCarGT/Kd1pvTHzrKWppPDqNLXCyODcbjq+s+mIaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xp7ES1/+ZyuOKoVjN+KT3j3axKAnMLDFXpIww2V97Yk=;
 b=drcmiELHaEZ4Y01A4W+FWdsQXZU9coAWwuzzKD6LYLLesLxpQ2qRlR8V9/OvG7We7BagZPhaN7svOGFMMrxtninAUc9A7YOhXxuqrYu0qtc9kz0Os17wrLcX+wmA4RXBglSqL1XL0xiQ83a4jdMF1dx+JCLtMgjHNYPfTH1bbptO/OtY0g2tOjrXzn3hjbldudbGzqNdUcEjt4CVA7IrxwyHE8TpU2e06cYWfrxPQ/Tc7hHPnRFyM473X4JGbrIYBu+PzTDRIU11LAHsWtLrEM5yQRbh5DGhqBojYDpFKf3RcaTBmbJvPTB3fGq+7EZxQ0fxUNEb3kQOVDxJAA0PdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xp7ES1/+ZyuOKoVjN+KT3j3axKAnMLDFXpIww2V97Yk=;
 b=DVMA1Y0jT+I4UnA1jQwxSv5HzIWyKPuRiH2/KxZYBLV8xlRAs5Vx8Ew3N9P0VktWov3eQ2DpbxrGkA2k1ugv3O6wRcP0aBvvEZRzE5O4FAwmS4k5Pcqrs69HBxwHXohoczwgJdxXSnwK2MEdT5K/t57l9yHADxhqZd3IDvkq0xs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10779.jpnprd01.prod.outlook.com
 (2603:1096:400:297::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 23:00:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 23:00:57 +0000
Message-ID: <874iym4clz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Bard Liao" <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
	Kiseok Jo
	<kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown
	<broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Peter\
 Ujfalusi" <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	"Vijendar\
 Mukunda" <Vijendar.Mukunda@amd.com>,
	Benjamin Bara
	<benjamin.bara@skidata.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH 1/7] ASoC: soc-component: use dapm->component instead of container_of()
In-Reply-To: <a7ab2e02-a864-4243-add2-c16b54aa7435@intel.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
	<87o6x69h4y.wl-kuninori.morimoto.gx@renesas.com>
	<921a38aa-8a75-4561-b505-14961d9e20b5@intel.com>
	<871pu0na09.wl-kuninori.morimoto.gx@renesas.com>
	<8734efh2s8.wl-kuninori.morimoto.gx@renesas.com>
	<fefd793a-3625-41a1-9fa1-ddd6cbbf3612@intel.com>
	<87ikn7r5qm.wl-kuninori.morimoto.gx@renesas.com>
	<87jz7nlcvf.wl-kuninori.morimoto.gx@renesas.com>
	<a7ab2e02-a864-4243-add2-c16b54aa7435@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 17 Apr 2025 23:00:57 +0000
X-ClientProxiedBy: TYAPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10779:EE_
X-MS-Office365-Filtering-Correlation-Id: 20944e87-bae2-4d73-ab96-08dd7e03b6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AgwpWvTLaS7uNNHShAEKJvkCTN9xO4+2b56ZWrAEEVgDGWNpgpdHEDelc+mW?=
 =?us-ascii?Q?Z4obRWhChuLgQciEaHJsELKivjY5ASaDDY9uuEsBNB26ffOTvm9xtKkWr8qF?=
 =?us-ascii?Q?4CXFSqd+AmyCICiuWCf0rIuphhJc/jGTCagZ8gmroyyqkzErSRrsB6Us2K1y?=
 =?us-ascii?Q?JomZ1AfHY6ufyPMpDiWnJfEFBsY0Lqk4NXNmUNMDNjmcOG3Q+lHJbs02pW/Z?=
 =?us-ascii?Q?t0bcL9sYXIqya8WqRJzx1kXDVBENxdd2XG8U4eTkAEhJ6vIVmdmcmtNzY+1I?=
 =?us-ascii?Q?kIXRFcGXUxMk5zCmqYwpMyNXaWOb0jZ1I/GJhE1vih80a6oI8gdjN+cTIXht?=
 =?us-ascii?Q?wTnqkBWNsDr1FwLho2QtjbLqV1JjUPh8N4lD6k2K+XFQKI5bfDeWKIMK11wN?=
 =?us-ascii?Q?w4Swo2onv+mFCh6m6/krFK1Vhxwd3nNluyvQhP1JtNyfacTuWu4Nu0UEYla/?=
 =?us-ascii?Q?tnZpy9ZajwFaxoqI0aupX7gOFoMx4NIvR03HSJiPj6W4AZzoJ5fovh6tsHX3?=
 =?us-ascii?Q?iUP2z2GEd9TVKPTHRcVPtqLqlCo7aUrUgvGFIry6smIh43zSCOKwjjFzj7vZ?=
 =?us-ascii?Q?P108453yBTDX1P2QTHsG/mnkAo3yKvINxMzZnTgTAihgOWa8eCQFxpVDwURu?=
 =?us-ascii?Q?tYZ9zh7Wp+bndmFvZi3B4PLf9NHw19OrxP1MLlBl6VnsvyPixluf90z9kUDo?=
 =?us-ascii?Q?T/1N+mAlkaeZJJbnU4t4XGtwzO5IriqqCXvLobtfRDRj//VBlk3bIC1GYLgC?=
 =?us-ascii?Q?MB9k46Dsbkw+QI3zB2038g2bIm1xCK2hWWqOrE3/MEpIaXhNxU6riQjK4jXi?=
 =?us-ascii?Q?sZ1ITL97KF7TR3b3nyh7CQWq6OZfFsqakY7fWuh5433R6gLRUt3rD1ddhDip?=
 =?us-ascii?Q?p+hG7inw8+wfdLDcMbc+NilSGwDBJ41Q590TJj+HaXEQd9uZ7Fa+G3HW1n1x?=
 =?us-ascii?Q?RjZnP7mnzd6XrlasXjPAxYmVt6Kxmq2fTc8rRmRkTKcM9PDrqSnux9u3u556?=
 =?us-ascii?Q?gGQuX16nDx6AXTjE7gvtuHVD+ycT0+npGk4x6XP3BlnisUOWugau9eLe3j8Y?=
 =?us-ascii?Q?XcvHlYtQnzkNa+DofxnUt0WRRHEZR22BkbqeiaIYMJV9+JBxyc+W47ztx7jI?=
 =?us-ascii?Q?fGikXeYOvrk95bEUcIzxdqAWv0/LBxnQtIIjbzaWXY/sM4RKnZbp0RGuIeGE?=
 =?us-ascii?Q?VQ1Z4wREffxFeRC7I0jFpC/xQf9kA0uk1hfGkUHPJuGffhan+PnHju8je5Al?=
 =?us-ascii?Q?InLpyPyNgWjec8o+cXMUsRiNAHTXvmfQtqBryvN8szZeJRoNCI4uIZ5EgV2n?=
 =?us-ascii?Q?4VE73ep2VgZyT4J4iEFdCozSizEPRo/FQ74Nk8ra8Ri8XwVnvhf5OR8tnJJD?=
 =?us-ascii?Q?NPs0grsbrjBc6JHzIgJYfd9gLsOzMSQuwU/UPs1/K4NUh2nvkJIYy/cntxbo?=
 =?us-ascii?Q?GYaGcBdxttTBlhUaWrWO5d3/DyyyaqJ8lhkrDufN2Xuhy8yARzjuHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sEeyvigrGIAiK0LbdeB2T2etanxD7V4pJrkEkSC68KRNSArI8gZGYzTHlUPl?=
 =?us-ascii?Q?nQrlr38R3Bx1A+9//KFTeddrkvzlnFa6U+BE7+fC4AlQc+mPXSwlKBVi4cqj?=
 =?us-ascii?Q?TJ6ESY1kg9+Sx4PuEHW2W0ipJud8it6oAUYLBHwiRK2QMcaAoR3zjSvG7l1A?=
 =?us-ascii?Q?BldzsEmPrjBHzDw5GS+p1VTjp+5547OikkotgW67Xpot3qxLyxxoywM8Plil?=
 =?us-ascii?Q?6h3ZPjO0ubEUJIYLyT5PlchtbvyfLF7/lJGofg5/ztvP4wbd/o/01Z48RFi1?=
 =?us-ascii?Q?KecvzIX7DW7Rqa9y2VsDBY8HYLbSKgl/l+JmhoEE9mDmvw6/sn3PLN4t3MWa?=
 =?us-ascii?Q?l6DLzyvE2ESoU7Vv+5EFxrYSeGS+91384Elnk/0nkQUPEPxzL6l9ukklWHtb?=
 =?us-ascii?Q?fZa31RwC9zOuobvq2ub/L2UdtR446ArSQzSS1wBt6Pl67qfp8ZjSijN5xr4a?=
 =?us-ascii?Q?XTm6ejFyTGaHIGkPtGvGYq81UYYZxHQZY/9dvhOhyE0biD3Q19JRxJBOD/ME?=
 =?us-ascii?Q?lBpgIBnxQXDRpnziTb/g5TknnhsXUgWlA5TSgQ1vWq/auj/HsXDppRYJn+Wj?=
 =?us-ascii?Q?L/xMVkx4cF9ddjW8Z/EgaE6ptsED+NSmSqBrSiR1LVkGqSbmnIPSq6xeDaVg?=
 =?us-ascii?Q?2BxI669CI98pKBn238HOceowDzCPxF5VDKEpG2mmHJpIhZ4FAgSG8vr/2l8Z?=
 =?us-ascii?Q?9lWUuyqMsrRqRbp3KW0ortaiexSY4Aku9a57SV2ApwGbaWI2NvzVVCEaLhLM?=
 =?us-ascii?Q?Gikd+rkWMx0wUkcq2C8ZCoBmx/ynIgZ/gjK8d4PTPQ/znHqbRMEBrXsHwB9o?=
 =?us-ascii?Q?SJP0xOMpAo16QAY/5nlXLnK6iUksIm2h+v3qYKwjNw4nqWByM77Bp42OpJS5?=
 =?us-ascii?Q?ZTeF5tuOxrAQasKOumxNpleiEoOqpuEsM+w0jo4mWNqF8VsF8wlJ4uu6MipL?=
 =?us-ascii?Q?jMFlS7VmMlpAbwECEy2Y+dm0RNRlc1xi5Gr3dR/oyyhfiwpGKoXjVIV7Tk6/?=
 =?us-ascii?Q?8XhikL7V9YtQyN6imWmHTF5NeqMZfUTMxIsQlwcVjPrPiJ8cutVRERAuWxyc?=
 =?us-ascii?Q?8WpbAyjSiWLJnnOvaFjSnXo7SmMyPsHK7PnWoG39HI5h2MFcgKQx89sNG+uK?=
 =?us-ascii?Q?26Tye4kFY2inu196zuLrbL8d+XQMF3xYXXIInwRoB+TUSNIJ3S18sFWJu6vc?=
 =?us-ascii?Q?WqkGoUSIcADueNdb08UNP8gjfUO4+QJylN9vr+K8sgx8ojnQV32bMOSLYrpc?=
 =?us-ascii?Q?exiYmkqeH7Lv4H1Qi0YqcdNIImK/OMcOjqvhoSq0xShIvG+A4oWioEIvQvQ+?=
 =?us-ascii?Q?dlX6Kd28z7SIxwK1FaHkevb7i3wVWyUPdm69ZPh1xgs7H4dy4YtEeoy6Ap3m?=
 =?us-ascii?Q?VuxaCNvY/NPgTMifa0GuitZqJ5DiWO0JtIau5g31QRixQ25zeKT41AzZgAob?=
 =?us-ascii?Q?PhFlhAmh5vTvGBekspb+7dM1NT0arRfauYdG8uBS8HdwxVvYKRQUB9TpW7Er?=
 =?us-ascii?Q?9uxHy+Qan4E7CyIg2/snhOeruu2kGjPNoCl9JN1bLqOMrA4GkVV7aDZFW0Pe?=
 =?us-ascii?Q?9TtyekiHHvb6QvQSrKZZzMDDU7TzLR9FGzMVWRREn7fSTH8pL3bbOmYN2bsq?=
 =?us-ascii?Q?1CeE90z7nUvyxessADfQdbU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20944e87-bae2-4d73-ab96-08dd7e03b6d6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 23:00:57.5356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncv8nGQ2M2Q9NNHPUUne1oV9pWVETx/RD67DciWligGgDDYwTdKfBlGpLoEDCaBgU/XOOREPKL0th4VewGwAhKLB6aG2qRQ3i4ViujzaxWOK2yV9apvVvHPj7VVKaHCc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10779


Hi Cezary

Thank you for your feedback

> >> 	dapm->card
> >> 	dapm->component
> >> 	dapm->dev
> >> 	dapm->bias_level
> >> 	dapm->idle_bias_off
> > (snip)
> >> 	snd_soc_dapm_new_controls()
> >> 	snd_soc_dapm_add_routes()
> >> 	snd_soc_dapm_disable_pin_unlocked()
> >> 	snd_soc_dapm_sync_unlocked()
> >> 	snd_soc_dapm_mutex_lock()
> >> 	...
> > (snip)
> >> To hide dapm_context details from user driver
> >> 	- define struct dapm_context name only in include/sound.
> >> 	- define struct dapm_context details in soc_dapm.c
> >>
> >> To use dapm_context related feature in user driver
> >> 	- use snd_soc_dapm_xxx() function in all user driver
> > 
> > We have 2 way to get dapm_context (card vs component).
> > So if soc-dapm has function for these, we can remove dapm_context from
> > header (Not 100% sure for now, but maybe).
> > It will be big patch-set. I'm OK to create it. But what do you think ?
> > 
> > --- soc-dapm.c -------
> > 
> > static __snd_soc_dapm_xxx(dapm_context, ...)
> > {
> > 	...
> > }
> > 
> > int snd_soc_dapm_xxx_for_card(card, xxx) {
> > 	__snd_soc_dapm_xxx(card->dapm, ...);
> > }
> > 
> > int snd_soc_dapm_xxx_for_component(component, xxx) {
> > 	__snd_soc_dapm_xxx(component->dapm, ...);
> > }
> > 
> > --- soc-dapm.h -------
> > 
> > #define snd_soc_dapm_xxx(x) _Generic((x, ...),			\
> > 	struct snd_soc_card * :		snd_soc_dapm_xxx_for_card, \
> > 	struct snd_soc_component * :	snd_soc_dapm_xxx_for_component)(x, ...)
> > 
> 
> Sorry for the delay in response, Kuninori.
> 
> Now, personally I'm up even for big patchsets i.e.: it's 'just' a 
> _proposal_, nothing is merged by default and every good engineering 
> discussion I see as absolute win.
> 
> Reducing the need for users (sound drivers) to manipulate dapm_context 
> is a good thing. I'll tell more once I see the actual proposal. The 
> pseudo-code shown above, provided is used by soc-core.c alone, looks good.

Thanks.
I'm now trying to cleanup dpcm code. Because it can be big patch-set,
I will post...

	- 1st step
	  Add new functions. It hide dapm-context from user driver.
	  It uses card or component. soc-dapm.c update only,
	  no user drivers are updated so far.

	- 2nd step
	  If all necessary new functions are added, switch to use
	  it, and remove old functions and dapm-context.
	  A lot of user drivers will be updated.

Before posting above, I would like to post my local remaining patches
as step zero ;)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
