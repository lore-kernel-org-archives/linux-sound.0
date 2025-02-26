Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9EC14B06C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533472; cv=fail; b=MbNXpZ+vSVKX5+4L8s2kaH5bEp5PmzYnNVfvoNKE64ZkCTrwIopH/72XLkMUB/5UuPp7xFDT+ksmxcinmUWg8IHqs8Xu+1jaQTpVdETkhQRGX/FNDMvR6NvTknEJbbDfmeIIfLr81GA4dtIpyRklleIzUw9Bm/I8yDFds2jain0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533472; c=relaxed/simple;
	bh=MbIfW/Mv+R8PVfP2TIoiQ98XupSRGqkElaoX1tbU094=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=brBIShqMxHfVpdt+8SPJuVSpFjnarFyBxrdG0f7zpFgO1GcSsMJ16yUKumqq70/IeQeCy+x0cVXGSZ7phCXNGtQT9oY0TScB37Q3gH17y4N5hJHP8RamwJNQaZx+2M31MgJhZb2SzIdDPtgpymHFP/Cy6ej6QaVcDnsOiHSuKpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GzsvRsQT; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GzsvRsQT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvLDPc+F4mYsz8dOB3f/KLS2NShRrApHSj62H1UKaX2uajx4eakqXcBv+F9RvLuGXaY0OIE7ITn2TWwN2648zW/tRTf0Ck+45tdZBu7H/k623oBicRcRJ4qY0uT+TSdDjL3lVjzOhQaQkAD4Tk/bb+TwLjlbdxcy9cZH7f83+FxYFHh2N5kgVGbdi14eNti+0eUPnmawYuY3UtTxqWc72E/tS+HZ8SoCpLWdwKxVPV11/4GA1mFtrQH0pEXZm28BE52JdPaRLSF/HgIz1PbO3LyCRqwUtZ3SSE13XMw4OVZbiYGMmOkrFGdkAOoLGHGIq+t6u8l5ImtqYnxBFABalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydgfWFkRLYstLiGFzfDqD41vtbiJqiBA8To+/AChmbM=;
 b=l/JcJvTR1NWb/rIMnBEDv6qImOVELCo0mlGf69EzEAxieiTBpW/HuBApJMFbneW+48zGPgNfpPXsrlAOd8irKKbdxdeScWP6tH+8qlb5EuI4Fvj98YUvDHqSo0L+dq1xt+cKJcJYlnlEpmgXkjIbF3m9XM6hi35Q57vb7ohbudn5ZKaN/WIpyaM7+f9AyJXjjr7qgHXQJBMgzeogTOkRHQ7YHLXQJYBM2BaUmPf4NMTicxC6QEZHVAIiQFnO2Mfe4QkO8OZqvqkGk8D9UTZ93ZN3t9LzZgKZQJDQiRrY+4s9LzUb6Uf8A3NLuok7hvZYPxByuFVWQQlIPBLkorFCvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydgfWFkRLYstLiGFzfDqD41vtbiJqiBA8To+/AChmbM=;
 b=GzsvRsQT+WADbT0WDGL4QQrJgR4R0/LoK/vSGfueYUWiMY4E1USDJMPKB45v88nunMAguzMBJ88ZLpnEolQjEWubHkZCR7BSompiAP+vhGPFrFcpBzH60YcYe5Lx4+F1CgIP+gVeaACeYzTC0/JZsUuCt+fTfgJ4zB6N7Th9vug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:09 +0000
Message-ID: <87plj5fq5e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 018/157] ASoC: codec: cs4271: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:09 +0000
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 5471f947-c100-419e-c612-08dd56053f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tSsM3ZdqYXaGsXsto8r0KpN/FORxwJ0Dc8JSFDJBu+snS9p4o2p+kiKJNGZm?=
 =?us-ascii?Q?kT1DzUz0Zeg38+S1Fv4AMSCMGLKO1QPj+kjw/TaNC/B21EXQ8vfwi9AU8YXv?=
 =?us-ascii?Q?WVDIlU0HRsQC7SBZPRCmhQvn7RVeBPk2b5eD50Ji3cBwN6nDSrICHpTSkpU1?=
 =?us-ascii?Q?1Y58SUNnyKITkgT8Ebiyg8K03ZocK70KuL1thjyLrOQ3KKk1AI6kGsNGOzsK?=
 =?us-ascii?Q?8RUVhX95hAlAQLxPzGo/X2e0er0EdIfAoYDFIele/YI+ZMxSsiJ8w4ugxbAt?=
 =?us-ascii?Q?ZJY1eBJxKlaXTMgCr9kOOXec+LbEGxZKSNgG+NgqHZT44PfSK0falZUo/TTT?=
 =?us-ascii?Q?JHNDt5k+d1TTYagitLFcNf7SmXFUmfKGNhKhr5mVbYcNcv6sXeLUJTqP/p8q?=
 =?us-ascii?Q?SqwT7poNyLrpnXbo3+BBwm67dBY/cbckafLl33ouKqaQHcwxfVUt4hlSnFnX?=
 =?us-ascii?Q?QbjU8uHD+6NlukHpSOTj+j9dH86D0d/o5/pdKTvF/FoFkr9IOLwbnthsoTks?=
 =?us-ascii?Q?67Z1nIXvHGBU8eoI5Y5QpySAL+HFWjShXtksurMA+YCUz/fY2N8zUZzicAmR?=
 =?us-ascii?Q?Q42dfun2LbiFi7WLRtlFt8NFIb50er6KE300PsXP/OcsQox2SbJr/7ZREJcj?=
 =?us-ascii?Q?/G1Z4MMo1yyTUbd8DetmDtZDt51Fl9StJxJFLY66308Ktv572jL3VziB/LKj?=
 =?us-ascii?Q?ohWIxaaffox588jp1DIhRVJuP6EHlG2rxsDk93PKgc5hs1BffdNdvwcitq+3?=
 =?us-ascii?Q?2jqx0S8Jd3soRAT9jJbD68mCqFOMacMqDUz6GWjAL5BR7jgrveJxZJBlwT7g?=
 =?us-ascii?Q?A0uzMTHR3TE2PSUV2bWRTU+z5+g3Wktxf1pcpzT7Wl9GS2Bvajek+Y5uaNxO?=
 =?us-ascii?Q?bTGeuUEMTLsq6/3LA6eTbRH7wA8ORqUBHaoGmcBVww0OY2lE0Be1PljWLFvu?=
 =?us-ascii?Q?xSAGIaNmr9o3zVV7dabK8hGQXnnbqkE6hXNwuAKRUKnnxxSTMCRdmRg6rjV/?=
 =?us-ascii?Q?wXcISu7lso5mkL/1LhAcwEfv1WISYiOOvH/lE6IBXu4hD6635zRqDANGEBVp?=
 =?us-ascii?Q?jy0yuMyfqSza3nxyhUKofc3/sY1A7Ywpw/q/AaGBaPNIuTrw7cWodHpDbEGn?=
 =?us-ascii?Q?0cqzG1jfAC0XrIJt560h+lUJe96VSHy+B7YpubYTATDcvHl1P3xhU5xkkolq?=
 =?us-ascii?Q?cH+gKJOLbtsBLtNEJ7GAv5GGHyXr5V/OadAOGAxN1nGC8QNoCJLlIm5FG+/o?=
 =?us-ascii?Q?UMrQNeS3/ijGBOxMHXfPWzUb77YrkB5aPFvodifkgpY+GulyNYhDRWo+d8fG?=
 =?us-ascii?Q?7sEOaeouIXFJ5mAzFtEZIspnJGdcPU5rkpqy1YslJxnIFyH4EuikbmSjxL6q?=
 =?us-ascii?Q?oqxx1PVNOI8r1o14xXa+N35AZqKxmmzy3kmt1zrVa3pmUtOmDxtIOmiirDxM?=
 =?us-ascii?Q?2J01JHQ89k11RwBBxzs4DaihNbsrvjKS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ptDQ4CiU3eHTvd8Ag3QsHyZQXAkiWgfZB4iWRXpfqe1L7MWqIbaSoEgFcBZ?=
 =?us-ascii?Q?YPdh8UZVkUJxmUWceanmz+xGpZ9OJBNg2t0jkx7gdf6aExwBjInC5T16Xrp3?=
 =?us-ascii?Q?l85KCFlJAIOF3NxVKoM7pMKq+0QpP32iOOLn9m3hP0Y1I5zXIpfk0OsZIbgt?=
 =?us-ascii?Q?ljI8PZ9ugOq9sqrfgbK2rwcNJLEdPXgnB3BKe0WI4oi5egVTOKH50PNaftOi?=
 =?us-ascii?Q?HUBiPRBA+d3QxRx/R1FAyug65U/JkinBZpUEfVTA3eynyivx8xuUJIm0yniz?=
 =?us-ascii?Q?g4i5B4SSbpByMhIshmScl8NZpXplxsNC4rK1zQMBOHQUEuZ/27nl1BR0h5XE?=
 =?us-ascii?Q?maNPt3MFOEWjQpEPm48kxKJB9BC5NSgGUitfnj9ZXF4GrstEo6PvHUAyXojK?=
 =?us-ascii?Q?QXF0vL5xLjF1cR/XxMRljmgPgoAnSxsHGX6lUdDg8w8uHpESgjKZ1jyMiEgE?=
 =?us-ascii?Q?7vgOyIhP1SuA/aUSE1EEbLVKsBD9YMeIV59ZiyZFnx3jdENBOeF5QCGAflEh?=
 =?us-ascii?Q?8k4hbk3ZI6WtWqIdDS+wLykvxlTlEGCGkIbkYS0egTV4u6OaasckzvTE5hhF?=
 =?us-ascii?Q?BeKZZe1saCuHbyTKpr3OjaPK0qdjk3Y/VIR5pYDsuFuwdqHmag3YGNvD5Zty?=
 =?us-ascii?Q?kd5G00Cett5C4sbk0cKdzsonQ2KcDLzhDE2G9qwLCfXqyhy9SXGbs2mKoEwB?=
 =?us-ascii?Q?SMjRdB+rt9Ap7ZwMn+Bt8/5vx/85OzAGoZv2BDcX38DkXsXN5xKcqMHLBUvW?=
 =?us-ascii?Q?i38nQDURgK17gZycEOq6ub+XXgBGyYfJIwbLAyPJ6+/cN087IWDgsdiPMkBP?=
 =?us-ascii?Q?6xTa6+ZMiUR2MpCpbF6HV6xbDJVPvCJniTlRmKCXMJzakq7p8YJ1fFmHfDGb?=
 =?us-ascii?Q?9SVxOwUCmHARuNSQ182KH2WnNP7egOBR8tk4lE2TS8Qs+78iGqV4/XCaq6se?=
 =?us-ascii?Q?ZB46PzHeeDJ+Rzs0WMr22Cfrk0sTRzM5Z+L2JuXXD2chIsbi5jF+3o/6a1Lj?=
 =?us-ascii?Q?48R5co9d0r5p3A1/ymuTUI267IPVtNfCJ+ktza88kR5Pxgd1dCQrZvZucHPJ?=
 =?us-ascii?Q?Y56O5ZRzf0l6S1KXDHT2SdKKebAVZ2owwsOliKQtmJisHFMW8O40qDcySJnd?=
 =?us-ascii?Q?jxFsYbs7Qci6cXDOexSe6kJzk0n/ERmR8ntOuWBUzcgN56g1OOajVtjSAfb9?=
 =?us-ascii?Q?dTxaPYXjzdGscTnJh0bfspybl5KO2D6SCDi8HzB3vhc2+AGLqK6ANEgX6hM1?=
 =?us-ascii?Q?Qav6o/WvcOuhnloZhhIgChb5vMpzuulMKllp8+Kv2BPn3ho5T99/gR9H/NEU?=
 =?us-ascii?Q?gK0FHAlISFPAufLXfxzTPnEDFyiOm2K657iXDvwyWj70BH0Z8A1iYGP3kW3E?=
 =?us-ascii?Q?8oTrGfKvEm7765fU9iCoA60EPV1tjgPJ1NOa3Bz7NX5+4KV3RtBmWka24Igz?=
 =?us-ascii?Q?MNlXduA9hkj9KLs59oQ6jNUv3G/l4sHd/65cF91fNjS++TTJZSxizysq4imi?=
 =?us-ascii?Q?JKP81UrSzcwcMWntIbEDh8jbtG1mD1wVhI9joZdNsVF/MsjmKeDXIpZTErcA?=
 =?us-ascii?Q?78hQ95fYRqL7jfGSR3n1RMYZN6lJ1iS/N833+G7ybKNjUa/LKOQyN9V3x2pL?=
 =?us-ascii?Q?LNBKanSFxZxz/b+zKIPicaU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5471f947-c100-419e-c612-08dd56053f5d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:09.6092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZTqOy43g79YNSAX1o7OPD8NhVqmv6tiJx0BJPm8cVwV7hsMyDHN5mb/ouvmsOpTzEE1/T4OKPFcyQ3BcoG+eltmWX9oYHJsh/rvsh0L4K1GkuGX3gTSSaJ49Qjl50W6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs4271.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index e864188ae5eb..6a3cca3d26c7 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -209,10 +209,10 @@ static int cs4271_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	int ret;
 
 	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		cs4271->master = false;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		cs4271->master = true;
 		val |= CS4271_MODE1_MASTER;
 		break;
-- 
2.43.0

