Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0430ACF8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415966; cv=fail; b=J7jne9/5NCq5c+/JmOkjNSde+a+pN7dwdE+BsR+dYLwLkvkCgwlScdD1pIO1rnrFDkvl8n7299w4VTPFohT2pJVbzEFZOomFfYJdpBTcK7lGmfKarTdDaL3Ca2VGYuNxFaQGmPXBfpGdeLTGphYfWdAbvYzzkzdPw3CmDXGOuk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415966; c=relaxed/simple;
	bh=iMndKhoB8W0O+mukv3ekE/8/zsOfPz9qc5Ybo9AuIzs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hrR82+JbxYik2RNpwtZBWb4y47oQURcLEkp2pQjYnoHcopD0UA2TObeREuSWbrTno5Pfapb09GtQ6OIYuxxk6KrSgbV/DxZEsXnNl/OLZSu8HfRR3BEzgm1bhRpxbZAZyOonrxZM2cIwBTzIscCT5oRbYqT43kZ5juioE5QJ00c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZWqDAFTe; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZWqDAFTe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvV/RK6v/KHWnANdfHT/BkpftxAnZV0vdAodqAf77Sw4Uu15zAPPRi6kvOVVC2l8yEysG7ZlBoFVxxoseAi2p2Li7iZVS0eCY0fbLaGWF2XFAbBBjg1OMRjFpNcTRIKma9VcNwOmxYm3ZvjZMN/kIR+t1pVQIpwGFiQ7qBgpw18OeSK4K9Rp215+p8AvckjYq0qX0C1Bv44i94AjSsJcSSvaRwYXqPAySgZ0okzKK/U3jjGOjwcBv2t06M5EWpt/uvOdF0AhPj3oCu8lWFxCL1VCRVaKQzrVDxDj1gwJuh6FZj9iXWoUe8ZwCpKkoTCq44NzmyxMANGzRBedsChYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMi11wiYfhY+utqLmao0ne1Wxgr/GDCTJfo9JsM4YTo=;
 b=NFjXTp9eYlKQzKT3LOMN0odok9LFuKa16+v/d//OQEwdjol7q8udSRyogdZ5sMCSkUUaL5IDuBwhbrLKjd/apFBEmAO0eER7MuCOWLQGr9sXM3O8f/i2AYIwGXYfZb347nNEPV70p3cTt6d1KYBom1R0dGWyARWDAQu9RpX8h+871YYfC2sd9O5J1fBoAO7vcwd8xdgXAScD+5t/A13eqJJhPG/Hv2XOex0tQeU27vWqq9vKClVplcMJ1MZAz/oWWoPbIcOSZzqboeSZrJpHa5zInVkN/07FdFxVgbJguIVt564RgT+oaGZF3+enDRW6HuJ3XF5mYHdL1mzEZuNIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMi11wiYfhY+utqLmao0ne1Wxgr/GDCTJfo9JsM4YTo=;
 b=ZWqDAFTeQ+YVbhT85og30AC6C6bK//+0pcLf4xQC+Pyl2iPY+/0KzNqRZAlWzP3u+t1x4w1WHyBH2pX2RIK24mrf0yX9SXg6bGdscqesO+pCkiP5pc95kfs1PNZ2NLAyjYmB5dxqPWIiJFx1zEsGoPTZH+GIgZC3B1tZV/Ax7e4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:03 +0000
Message-ID: <87o6qanm79.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 105/139] ASoC: codecs: wm8580: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:02 +0000
X-ClientProxiedBy: TYCPR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:3::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 1921716c-6256-4924-8e3a-08de0ad9c8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N4UO3cTWU7hgofrJiYZHGZz+Q7Oi7VzPZF7ssBHSDzCsRmvkk78oAS9Tya4L?=
 =?us-ascii?Q?KB6jfCHOLC/kOdJ3IsTUOtQK+EJktrt7bXxbK57xaPgn67JxMhS0yaIj8lMx?=
 =?us-ascii?Q?ZkG9gn6hWZm0XEU9Dy9QInnDoau7FenbFTgwz1C98tj8x+AbeV2qZNbENyTu?=
 =?us-ascii?Q?Y4Fq4UphQ6okEaAWIZRijPqRWBPVLzJJWzewZk5CvTZ6LMSfx76bpuHpnLup?=
 =?us-ascii?Q?3TMgMvfCgiVVSKmJ1ZOt+5sFzO8FPCAPvkYTaxwn1g+cTUIauQIyAOa0n1NN?=
 =?us-ascii?Q?4lv54x0qGebYn9A0QwsAMTZS7GBPItHBHPy8Q2ZAjhnTpsDgj1ozSBaWe0wA?=
 =?us-ascii?Q?Y6ZbPWhrvNhhqQX4nYBV7nPqjAeDE7si//Pb900qIWFbAMeM7+VHVpXDvlqn?=
 =?us-ascii?Q?Ze5Oy94plnvwDnutHWsaaiNLvHr27Jfq5HYy7qrQ0xL1WSF3GzrEJSuAOiOd?=
 =?us-ascii?Q?m77VH4c1oT6iIU5z8L1ni1fAUIlwLZKqHFNkiDeKam88y4+qt41c0FwObB/F?=
 =?us-ascii?Q?V6RShAZxW4oefpZNn/AvZrhM7hME1Qwjw/x9xQN16ck7mPZ9gsoPrWO0FPY8?=
 =?us-ascii?Q?y7nzlXRqs8/R4q8R/7jmJp2VA4YPno2A2+f78f2DEuj/qeKCwiLGAcP2l6FD?=
 =?us-ascii?Q?C4f3DMh4OqaTGSWBWSTDPt8tFZ8T+Z+inSHh/gcQoBNEdYieLXuLca3EdIId?=
 =?us-ascii?Q?dZ1lvLudkRTS7R5uBsJa0Hqwc7losBQ4hGnUS0xX+Pt3eITvgLquicH9FZbv?=
 =?us-ascii?Q?Dd2YPXTBozxxC1af408Mvzx6GMHhOXJQVss+IybJ1ilkntV2JrlusNQB9VbW?=
 =?us-ascii?Q?kbRmWCS+nCZsWL69t0op8NHfgmNfruW7iTFpSdK4cJ5ikF/O3pX1D4I9MC7m?=
 =?us-ascii?Q?mn0nmUV8B6dkqwikbNwJelFL9c55s4cEJL5OaEmC6A8XYUyYMeh9XE+tz6pb?=
 =?us-ascii?Q?QXPTh0VvleUrxLvidH6ewg3DBbHoRDuy6aC4eGtOs7/sK/+yLs3jn74lnCHy?=
 =?us-ascii?Q?6+CTU/VnbfREuz8keqQEsHl1G1lrvZna/MR9bTc1C4JiaUtO/Ty2ssBLGQaK?=
 =?us-ascii?Q?uyFV0nqlvFKrRqtgWipIpEpFuSDsu2Kk3olZrnMJgL62EJYiKvyLibJ0BqgE?=
 =?us-ascii?Q?XmrhRvyMO6Pc7Nbvs4JC9V+bd1c1/yAQPNFPqt/dBOiCIj7D+4FESwvGwoDB?=
 =?us-ascii?Q?lw2t5sJNAYO2caO8NOAmqoBpVvOmnPPfh5Ez+LOna4jIffmNoFuB57AyB/EO?=
 =?us-ascii?Q?4Hl8nxFORro+PFPQETcfv5aY7segDEBdb+ArrDkMHxiXJPA2/soEcJE2terJ?=
 =?us-ascii?Q?F4V2xQ0vziFHWZCTP4ELUZemltw6Dn/VkotEoxKDe1wWBJNklMWHRRiU6azF?=
 =?us-ascii?Q?EpU6vlU4G0AZpZba0PBUEjX3HfYfWQ/ZxWn5jr5SbcR8fVSLoy95f5Mu3CdC?=
 =?us-ascii?Q?wuUdFldzMkMTxDE/lnG7kgYAPJsgahXS03J5nEb77TfwubNoZeiEgeTCbP9O?=
 =?us-ascii?Q?4aS7Q81rovAvKbBdoB2p1YVVIS1aGYOBFfZS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XlSHEUKX9bGEvxQJcKPhtmhvo5saRLZHO6qCdFnH2NfoVepNb7ch8LftvbXW?=
 =?us-ascii?Q?Y4dEtqAefikUrk/UNh8VeQtQ4w13MxpBxLxUOdG8aFdW9vizlIhMY6eNgc0B?=
 =?us-ascii?Q?LgZQ96KtaV+TGZQAw8Qe7qPY7onLqUxnJCcHxOrxveCnCMW9bhNoNxj337/2?=
 =?us-ascii?Q?+ieHh95ipDj0tqWVoW1qbgT245InAxWNvR909tON8k3JyGvr51gAKdY93Xbn?=
 =?us-ascii?Q?1nOO9q4Rr+CXGCTLLTYx0Ot3QGySo93WSOBNabDoSzLQShHPh8K75sLsxv85?=
 =?us-ascii?Q?Ubf0F30ikgHeDnTQcAMOljCEGkCspDdTWDYaRbPWnI6M7Zb7QZNB0CCsMeNg?=
 =?us-ascii?Q?2EDdKdFRY5nNQBbRraPNO3MSdl4AM52OYFWUtsd5FQRa22yVrQAU/d1vfOHE?=
 =?us-ascii?Q?vM+Bnmc0eFksBDfo7ykGojPYJ+K82FPpF2A2aGAp3qlIC6VzcbbyBb/IJjxa?=
 =?us-ascii?Q?n1FlUoIcXNGMRdf5pHvUAiOrTRNe84UMSCi2Ikau6zorReGY/SyKqiEEEBAG?=
 =?us-ascii?Q?GfXaMbLjYywvpwPR/EMPZx/yYP9+4qxLJGwGPLjSQaa8uG5Qlp1cBm040y4n?=
 =?us-ascii?Q?qpYmx7z2YMBffRm49jR6mqXDyyx/7PORDzndwb1k7ANTpc5wNn3rt+B90VBB?=
 =?us-ascii?Q?AC8WTEjpLtn2++9A9KooEaPYnva/zv+AuUP0bpxiKBNGgo3DOB26unRRHYT1?=
 =?us-ascii?Q?MbBlQsVPFzxOsQvcmrzzSRSjIsaZT3y5zSEJOCV7vYJDywyiPXaReS+/P7G/?=
 =?us-ascii?Q?ZDeKU8oUsIwXx8AarMsSVVWUeb2I3R3GgMR/cBexbk/dY4nmQEPJj90j/W3V?=
 =?us-ascii?Q?igzDHz6wJ72mfzCjfdpq0FTmdtjm8X2NkO/juug5V4LH1tg9YBvpvrfzhO4r?=
 =?us-ascii?Q?YcIatQyxc3RhPTC7fxLKWQ1I7sivnTR/YDQkob/IyAgMBUUJR+T6xze07PeL?=
 =?us-ascii?Q?XigRgHJ98g/IqoI96kfb6CY39Es/7Skp5z1u1fKOVVvfj6E+D9ZV+aIus39R?=
 =?us-ascii?Q?dOFVg4f1KzOZNpXMagdg7OqkWfoyMVgW3mhkbaZJgYrvZlh+nRDQiVECQGUP?=
 =?us-ascii?Q?Lp/wilBo5Af/5e2DAFqRCfvfu6J/qBync5KcTSsplq79tixkXLstxWDK2WlO?=
 =?us-ascii?Q?RXQ8r02Jnnt7STw3mm8ywJ0lPzdHSV8mfKI4+ZNX81etDZun7iiQNscYQQ5Y?=
 =?us-ascii?Q?ShZyw4NE/OxRpex49U9cA14cvt8Vdfwo99AeXFoh7dIsJ0nw/8zt20Y0Sl3W?=
 =?us-ascii?Q?r4JYi60eC/ONPorsyKlf0CSIkhZ8AhOe5VapOwoFlN+uRt8ym0eviA6qvl32?=
 =?us-ascii?Q?d7AsCrJge9XY9tkkHMlTrcUIWS1h03QzokI72dwKJL3PwoeZbLpZ3mY9YfUX?=
 =?us-ascii?Q?exLOKz3GETWCmTXIpwMWJl7Wcrw/R430Xbzox32GLIxi80GPvBDhxbae9q/l?=
 =?us-ascii?Q?XFF/KhtUS9cKvbcpkwujVfXQk3ZjqZVCPUtW0yhFKLkm8KerUjXio0ZVC37Z?=
 =?us-ascii?Q?GgraDpkbJ/gKPilNINKmRPACR7h7rpo0M1wSJlivha4DvvXs2tUJAVKaM/eT?=
 =?us-ascii?Q?AYRy6YtBlsD7v5FibrTQD5ZHA4R1xNGSgysPhIc2iTsQGanUamJXjIsqMVzT?=
 =?us-ascii?Q?WF0tyJ4tH6vM2rvzxZGM8FI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1921716c-6256-4924-8e3a-08de0ad9c8fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:03.0170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BhU0N5mdQKxvzOlzYic7Ui6+3L1oXjTUa7338ZIQwh7HEudKrD7X+vgglrAL5E1jQlms4YvQncEijZkHMwVSYvKc2mILr2untRtwNVpQgN7ZkjumHb9ViUip8pE5bKU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

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
 sound/soc/codecs/wm8580.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index ba4a08456e789..f0cf121b09de1 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -258,7 +258,7 @@ static int wm8580_out_vu(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8580_priv *wm8580 = snd_soc_component_get_drvdata(component);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
-- 
2.43.0

