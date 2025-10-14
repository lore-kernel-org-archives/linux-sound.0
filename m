Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3671309F09
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415834; cv=fail; b=rKx1fHxBE7vKMappiOUGyH/JrGNfw7bdw5tenXsKtdBoPRb/PxWxIeG/IQ+6IIHpaE9QeKVTcxR0LJqk6/2HFvtmffOihkLTs2KpcCpXmuMztIcMKR5TtNdMrni7OJL/6el6KVVrvDkmQ/X/7TvZ8sCBGDVJnQIsHCozfT7Egho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415834; c=relaxed/simple;
	bh=75hx+tCFr/e7nB4LoZMjAvxNwiuaIUE8ONPsqSs3/os=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=K6qcBWLh4Be07ZhC5WuBlnnSlShyufrFbrUvRhQ/cF7gXPvLoCedX4R7H9BnR8XBI+M+NGRTF7B4lnETWzUAI6xyZZzMJOqw93AGQZLMKjeptG4WgJt9Ol3Je+UtO9uY6qmlXYNnTGsvRg5rSBmBDWJk+DBJSZeAgEWCYKLmqks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MHGIIlKy; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MHGIIlKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKgHA9ido6waMiVaF7vjo2y2wBf5PxULVsbS+XNPKvDlN18H5qw4xN6csTFLqedToBc7kmh99YWwiQxehLKSMZ7uRkjKdAL3YI4lL3RHsC/DMRdF4iI7KjJNpZKZGA+xa65uBhcT6ueUP7cucQ4/siKgBIfcLKVM4prd5DaqCLY3IgaG8/W6cv/IJ9epa7228zOsRw37wsdKuuC3SlddSwIui9SZqhiCFJ/cBhRGaEKzuaXnud0ewSISCq30XZqZFvoTjOG5m65OQsRKKkO4IA3DWxbyA6Aq5VCsA+49DualeRr+K9iOhW5rsi2zNQxVgLBRXe2R8SAbaL2bojOwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/RlxJTGVZTZfx6y1Lou1wW70S42B3HDn24l0rsZu/4=;
 b=EWoUxMQn/qg1zSlwinvvkWPWiGWqBmYJD2FSXSzM+cmL0I4LeRDmf8gdH9Np+r35hE3C/CDsxOA7Rti5HZ/tHIJGNxCR5DA+M2uEFkLli15eb0/q3x3WhSL5Pb4sYGD76dYMpHBpQtm4pQwFLi0RnaVhlG5I73JZLEeNZtMuCYLZuZWwZKQmswQUlW2s7bQBzg5d6OzvsmOA5R/tmOq7sKp41HLhqKcFEh//wy4UvwmybGPECM7HHTJQfx52dIiwmK/rGvPBKYZb1YAk9FwAPpylJ02e/uB58Um9wJXqaF2wlYuNKaWFWWw46Z4paf6ylit48pddnXX2JTZgMhF0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/RlxJTGVZTZfx6y1Lou1wW70S42B3HDn24l0rsZu/4=;
 b=MHGIIlKyiEPzv7w+nRXdH0Y/TtxEky3esjvyUnfoPclyHxX40s9jo1rPkg+UCJTZjJ5CKgMvLKxMNbljj66qFg3ipu8B8PGNlNTc4sFntW1A92uoNXSLltHoxAFYFHKsGpiL5m9sDx0HmEtxrVUXU8e72zBEi9D0tQDtxlWorVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:50 +0000
Message-ID: <874is2qfft.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 069/139] ASoC: codecs: rt5659: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:50 +0000
X-ClientProxiedBy: TYXPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:403:a::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: de605804-9a43-4fe8-b40e-08de0ad97a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ATt/HnmaKPgCU4uBm+7n41Q0ujJ20Db0kakGPMWhTvgbPFiULQg1gb/pU+Wj?=
 =?us-ascii?Q?v9UZe6mGn+bOGjckGwqV3Mtieb8jyc4h41fzyeBAYncsq8+lXgOApzp4LZkM?=
 =?us-ascii?Q?E1/lBnRkuQJ/RbS7yIdk93sKODAiEpUqfGLYcCkvT7F+PcMvfXXOWS9mtn8r?=
 =?us-ascii?Q?l4ywnIZ0HRLcY0vFPw8pdAnWVuUBU5iZsrOq8L756AbRB4CVq1uYDHkBL4AR?=
 =?us-ascii?Q?HYrt2EM0FYgLE1DEB60LTSrRhnsbVhTvbuwcUWGUUWCrJtFDZY+QEAhpRndO?=
 =?us-ascii?Q?O8sUNxNHdhxF6sefNZFeiDUcv7sXladrUw2zMo6o6oZi7xeWNwifRK/CWGYd?=
 =?us-ascii?Q?iq6dPjrc+IGLz6gMP/YiWWUJBAzfbrRBXemGAGxAUi1IvbHm9DAOOK8QGBEH?=
 =?us-ascii?Q?Ce/6pEiKPKw7vLeJ30MFSqF7zKUwjSh8sflJJTW/iW2aLMSdTikk92sWi/3C?=
 =?us-ascii?Q?VLJ6AQqulxRve9QpPU954BQKAEOQNlL136KKTz6DyYXtUdeKjs/5fpZ6I0cY?=
 =?us-ascii?Q?bpPothlXOknzJ8WMRtlCdh/3vkXNhZyZcdl20CtJnUOJT+/5LXB5zV+rcKjS?=
 =?us-ascii?Q?EcySwql/Zx8LRXqFScU1Y2fJjBy7/9eXpHlvz2+3c9uyft4KBYnVtnbN03zA?=
 =?us-ascii?Q?OgwrCC0KAsIJDg0Ww0E1tu1Ul7diwSxE9tG+ZJ4ZoBhmBHyyltCtUo/y4q57?=
 =?us-ascii?Q?Kk9yfnJUoQm35dMbLdhzLC6S09iSU8ZBmFF9sUDs0Jk6SXF4Wvb4ZTGbI/I7?=
 =?us-ascii?Q?qmPykfgGd20MWfh4AkasD3kc4RjwZK/egLP38IBTTGR34CdEwO36MovuYKHw?=
 =?us-ascii?Q?zB2Cd3S66eOzP4oNNUBsBb0jIuH/7HNKMGfE2ziXL1jq9DlE2tBYBXIztszt?=
 =?us-ascii?Q?pgpnD8eBDLOG5FMoI/sThFR5Ivo0P8sCAJw1LYvEnIcUbGSofK4/55UXcDfo?=
 =?us-ascii?Q?kjb4bo+RARi0ZI0+kipL7Pa9feySv0SATA3S4zPbItRNsQiJRB7Ioo0RVSPS?=
 =?us-ascii?Q?J8oSCRAqYUlQFckRNTb4IJIOBJSBccO5mu+SmDEAC7b452Gl0OvNmcoOYwoa?=
 =?us-ascii?Q?PdFdPETcoJtoAbr/E3rm1sxvUDveZdqlOI25c4Ay5lonoDJ2DldsoFjPtCiY?=
 =?us-ascii?Q?BtrWpHkYCsQ3wVRPDHfU9kPuewgF+r/b6pMfRuWoRDNx4KG9aWQ/X1PTzj22?=
 =?us-ascii?Q?ri2SxDgIqSRcGoOB2M29Ul5Z1eQ6dRmMzWpgw28S3NNUYji51XUPcRR33OSD?=
 =?us-ascii?Q?klyRKZlRMcMafIyoXhQiijU8vnjX+xlQCdqPS0LFOgi2VjU+StmhqqX9Ko76?=
 =?us-ascii?Q?SBNXDBVcm6PbJeG/ykCyCTw87N8qcNlrHhA1ks3S9bpq49islCF01QOJhSQt?=
 =?us-ascii?Q?APY2ygLgD0xPGbmk8N7sE19Fegr3byqizdkqwtzP8gQ1+/upNg17hb1UNp6o?=
 =?us-ascii?Q?jo6krjKAI3j98hzc9+SyxcTbG4eIqjf0Y+rhixNDYuWA1YW2OW27iAXBUucG?=
 =?us-ascii?Q?s8Mq8klsfa21Bx2AHdvwKXamjdCNaMyC8o1P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O99a3OGVzXMn9ewng9cCIfRG6yMPC3dO22r1mGTh8eBXYsmS31ZNi0GS8jC3?=
 =?us-ascii?Q?dN/oooRLKCvBFY9sPMssTcm/7QQa5JodKH+v5sgu8qAfcp3c8obLh1Ei3cAA?=
 =?us-ascii?Q?xkZ8f4rCqxiohsX/T8skqhAHMKM1OS6eU6+I/n/jdDFfYd5w8Tq0Rtonp7gU?=
 =?us-ascii?Q?dtJ1eA6in6X72dZsrFyju9sTRcO731GuOJLpUDN2Mb0r+JolaLucOdyRmH1B?=
 =?us-ascii?Q?rMKSxSejUS9A0VNojS8pz11BO0P3NAat74fIYI52xoPuXv3TosvR2JhNG4qs?=
 =?us-ascii?Q?mMDW5R5FpRdWMi53377ud//U/q4/q0y7re29IZGWq4o8ckJdxre4SibH4R9C?=
 =?us-ascii?Q?Us3tNImv7BFVFUr5nQOs9BQNuewsUMCoJ15R6n8BHFMZ9KXUi9cNTaId1D9/?=
 =?us-ascii?Q?LMrkdfewNCOAJ6HgAD9A5krA3UxBmYO/ONSEoOWKpaZ5Am2zj1pEYahVVuOD?=
 =?us-ascii?Q?wgWA0GpVM5C7o3qZWvHEAMFZvzpwUiXVkrsNHdLWsiES4S0Y/Ujt5UHz9dsx?=
 =?us-ascii?Q?ofF5wI7EiXvy3vZ9J98/vnhikfBmH6qfGeB1N/5D+vNVJh/gyBpKY4ObEkcl?=
 =?us-ascii?Q?ZbazEjwxdI1wOujAeblg1A4QEOavpZOH/RQvV9nO37vu6V1AYToP8/wPacy+?=
 =?us-ascii?Q?s7eXlPtDYqptrPv1xdCvbjudV8B2SWSXbEM8Wa/EnkOVv9ts5xCT0bfwSK+S?=
 =?us-ascii?Q?2g7bUc1x1+9/t7/Q/Y5uwtIMNOr6mxGwZSgc+TNhW0ALTKyw7yTjwt0XdpV8?=
 =?us-ascii?Q?PlkhgPAzK4rv/vVc+Y54dnpUnd4+/4RoSFfFwYalAZqiEibRybm+nW7hKJcb?=
 =?us-ascii?Q?T2h1DV5UdHNzu9n2WIFxa5qySkrxnGP42/EOaUbag+zw/0X1JIA52OHYDYh0?=
 =?us-ascii?Q?CezZOe6fB3T+PtWA6MKc7LXuWBrIMBEWuJcNXSYISUnUSftKaUx7gdcKKIof?=
 =?us-ascii?Q?MoMHIjBLlPo8P1PnOAONpL49ClEH956gu4q1jCSjUCouVpIOa7ZXHYT8kG1C?=
 =?us-ascii?Q?GE/FcbFK+4T16LzrH3moH7jE6n+9EzB47DkFxpnN5SME+ux70okwpin+1ABs?=
 =?us-ascii?Q?7L5CNQoYo2WjNVSRuCI3mdggrG8leaoBG3D3JYR47ijoEAjgkc4CuyC2VPD0?=
 =?us-ascii?Q?EPLOXR+GWVzlT9JN10FLvuQCaP4Apv97xhlhNR/49SZXyChP/IcUdWejekYt?=
 =?us-ascii?Q?p8rKIiyXmJ9mfe3XIbkeMq8HOwLf94hdtK8WnV4IvlGb7dEIJ9XKXEBlQrww?=
 =?us-ascii?Q?5gswRCH/BPW7iTJWchLGm6dHb2IECZbJ5HAnEfk41gcTrlWmoxkAdrpEop7W?=
 =?us-ascii?Q?lpEnKzI3/96mcOz+LwdHz8cIdJL9TdXJmCnFpzFOdOah9459bFpOLc/k/7Kb?=
 =?us-ascii?Q?K26UaDQ23/UxeQdfV5XXCQRFCfBNUQtOBUWFFJG3ez8yCpUokymy/dKsEoIh?=
 =?us-ascii?Q?25tWmFh7/LXbq1zA1FGGh9mbTSE9amj7wTPJlx0kxAjlhqiDpLvFg3e866a0?=
 =?us-ascii?Q?OVnnl2xdNLRvGkLW5b3h/SR2YB9wgxFXJNNsepdeTKCODd5M3PUjIdK09+C+?=
 =?us-ascii?Q?qXJjhQ+Ld4hG8V3IC4ZGI+eugmv/nDkgdqsIsL/0MyXoFZNUP6GpxzwHiCY5?=
 =?us-ascii?Q?jUbd5F3YA9oe7l0tE0Qxf2s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de605804-9a43-4fe8-b40e-08de0ad97a21
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:50.7582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlkjHceXw3l9nrYp7lJu8Mafi54KSCCJRC62EskvagTShCWY6xVq7naNULHcCG/y8FlMpOG6WdaEAePe7dm0LnxLVHRqW/MMYCy5wTw+Gy3fDm+Q+r0FznC+MLKPBKEJ
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
 sound/soc/codecs/rt5659.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 31b47db7b4f77..da89bdd2310d2 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -1197,7 +1197,7 @@ static const struct snd_kcontrol_new rt5659_if3_adc_swap_mux =
 static int rt5659_hp_vol_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int ret = snd_soc_put_volsw(kcontrol, ucontrol);
 
 	if (snd_soc_component_read(component, RT5659_STO_NG2_CTRL_1) & RT5659_NG2_EN) {
-- 
2.43.0

