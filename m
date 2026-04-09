Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E55F9D9
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 04:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775709413; cv=fail; b=Y5Fle8fnQe48Vr/YiBrsHXXP/65c50mkildrG1m90ptzd2xaB+LottPlGdXlBuhZMWNNxznSBo3PBU6D3B9fO84FwkMKyVHlXLfS44M6c8NSsx3AicWnHxErqfzYFhRLaI6pryxpH9/xuAaXVMvHLHgBlWLl1AajTlZMPNXCzf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775709413; c=relaxed/simple;
	bh=AMziKrlnnCz5b0meJWkKRSd6WAddorzu9MxSg4hP0Wk=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=RyuZ0hCYlghdcN+JqguFQS50pqzZ7PgnR+aXb57iozO2U5UxqtXgirXlBBn9zimHUgD/H1ePigRoOGtxs63FLzWSo34mUrPGPho4RI0WiL28CS8h5pWkZ9267ZEP/aSHZRs9cbZ48yl+v1whI3m3TzdamKdCNnCN7Q13qicOmVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IugC3rCn; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IugC3rCn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vM8V9db0wkFxwGuxKqYIeVTsZVPWUd0oY3cF60UaX2dU2RTuSKE9uquM8QQjA2yncrVGWeX031aL1B7cvGXr8lXJWCkZSu/j/n+WSVF9UIbjlpEhcx5e9OFXAsc9DSMiHytt7gbTAVkUYEdW7UpAjfinqEWT7jloXe69EbHyGT4kKxHolFUqwU93Z6+eyFXOX/fGLGckrdmpvhLF1IXooqQSNFAhPIGiwCzMpvngTDGFe5o64Tccr1avFHUC/qtJMwV980z5GOsqHW7jDJ+x7arhvGnp8Y5NuRGQwIK29ZLnfBUkW5OSjbz/YdqeGGJG8O5W7KHca6jkShTqIAnwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc23KuJe5KrazgU2DhRRqpFjGahAwxL3tDbwl6G882I=;
 b=KKZCWkR6lOogwPzIsbr+ndZfUyAAPuEMZqFU0Oek9fTAlO7oJAaxpTlAmWopL1KyzifuoUPj3EH9kSvINPgCl0EduAqVwt9IoSR3ItwwRbnYb9jcZ8+BbmGNaqDiPz1TiHRRXV+7PytzG3oKdoBfU6PUMjSoTt0rY0TuL3Md2mx7VHWoMQOdYxx7KCjz70QKGgSB7x8TjoCn0w1/8mlE250iXm3EAKcc6o28FlNFa9RjEH2FeEV9J7cDmzAN9Ht3qb42GyIAhFMSsXclxCKQv8LvSud99D1bVshuDikvpRVwTiQMRBRNzBT2WJ8MEh5oOZn4bsaN68Xt3S8WXqtkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc23KuJe5KrazgU2DhRRqpFjGahAwxL3tDbwl6G882I=;
 b=IugC3rCn62b06nJBkpNaeuSriq3Rg25IqmJim3bKFix5zNH2Vmp/365HDp/TZ4xZSCg58HrN98qxvvFeWFXKbsg9Jd3p0ZwUdLLnfJ0GfFqNVe0TjZeUU5YqUWSoGWwPjT+4fJeybTfmZfGr1OEKwL0QTMb/UOWFP6KKWzQKWw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB16304.jpnprd01.prod.outlook.com (2603:1096:405:2dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 04:36:49 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 04:36:49 +0000
Message-ID: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH 0/3] ASoC: remove card->pop_time
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Apr 2026 04:36:48 +0000
X-ClientProxiedBy: TY4P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB16304:EE_
X-MS-Office365-Filtering-Correlation-Id: 128ef27c-ba52-4683-9c08-08de95f19d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	7e+JtDHZ64k/P8MXPUgQLdlpHP4NiRo5IGN0j0ROOFHoDbCtZ0fjqSFOBDVloqdo0AXpN2qepkfN1fPHROWS0cGAZlHpd+aXIHlqWQG23oT2SRsMe1D4qNmK6gdizH3xXa5TYTKVGTnDdHtTtMyxgaVBNBCw9QVcZps9BVR1LfZk6rNgHjOeOIejc/bldTmcQ27Hh0N/gp+MliXzwHfcDFlwcCqvXsQDsYbAWTkV6VZdUKzxA4oa2xyj5urvTLLY5l1rNyJeR0IejdLy6AhZQJz2FVuDXIY1H9CgRdtm74sGEcexVTzIkphlk+WC99SwfetQQD2eDm0Y7B+qa2fPXe0M4aacn1ZZTZ1DJxZ9Ih204pFgosb5v3btR2kMJzt4AKgi8g+cX3M9jQ2F4I+nPz97TxNH82T8t65ZhyoSWFbsvIpNkxlkg+R7zpIGvVoygb95UruGJNeOeear2uE1QQ9ybMuDuE9W9SesRSZu62CP93TaEowLgbd/XTi+qtSjmN82wf+EIBeDwPvs+SfjkTy+nWfG531sJphDmu31WPyUw3mGelyqyzKDY4NBH6ZOjW2q5iNJDpqfFfHMP69dtz9lxjGf2uWzAnZ2OivMe9bGtbSzbOFRVkThxfP/RBI69UqbutYsSorHK5RVmY+94K3d8K6ZYsnP47oiGslaY/kAKiEH3zKTBiX1+tBXoaYj82eNen/YiagqjOxVgnb7uOpeL43rjwGTbwt4CHEhbp11Rj4BL4ct0XMB1SOXRJ51dAOxeChzvVkXUfGTbPBH8XVXLfV3SjtrGc8VmyDbPy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7FsNGGXdSVJK8UJ+bvD/u39coenrUUTCqLHf5puEVYlEtyIJgeh+E3KeVVEW?=
 =?us-ascii?Q?ea18vic8F55CU7zsmGCNJM4yV1P/56i2f//bcU+pb4fteEw7Q/djPnIe7I4W?=
 =?us-ascii?Q?KknuOPY3EC1yRZz1QPU3A0orsBWp36IVl7Hy8HK5qtqXsmm0/92gr0B+DJuo?=
 =?us-ascii?Q?D1DQo1xcOH2QarCt16ZfCWlEwm1JyRM6n8E8VRrJ31Xrs0PQaqYYXPxX0pHN?=
 =?us-ascii?Q?+j2g06a6aGDaZzP8zHNEUxpWjkgI8eauuI6uaL8MVV8yLFnggepPzuz2xq4h?=
 =?us-ascii?Q?mHiV5DBF7tooEnfsg0ZlEAr4dlEWQCZzKAZpMO+mEfxpHb51owJvV+O99RLC?=
 =?us-ascii?Q?xeS829yy46FZycYrUdJ52FaF3WDpB/Hg/IdzeUBi0qKAdYRncdpsSOxvluta?=
 =?us-ascii?Q?YEBGGOAi1h9qLNuUZnJn0cFhcrAoU6V/wHmyLl6iksMfB3KngsRlffRoJ7ij?=
 =?us-ascii?Q?zKdL5Y986NqTxg0c0OJ+uKgPwnEp/0UAKvnOCNI/JBtz7G83pzi5V3cWx9Dz?=
 =?us-ascii?Q?kVBt3Oa6cuoX6HaepyzuGa8MGyR+8Br7PJ3rHwcx6JOprRudoTP/VI4vPIFu?=
 =?us-ascii?Q?ZDeN7DHruQvT84+eS/beQZcpGVVAlXSyteOQKusH+LKUfJJrJ/h/3yLsAyMQ?=
 =?us-ascii?Q?aygq8N67y/lJthbgINIdyoXhLOEKkDWIRz7VM7Ubw+V0JZNtkevLQV2CoSVv?=
 =?us-ascii?Q?pzoQMIXtokX6sFM4MqinBMGGia5ve97tkNwojhOycEDxxt2lqHoXwdRieYNw?=
 =?us-ascii?Q?Rs6RBTrR9fioIO4+1EimBiPXQ/4ptVSygmqXdcdh6TFghs0Bj6albZO5zEoa?=
 =?us-ascii?Q?lbnY6nZgEfgaqXu4nCL7H+2W58Jwl79WpL33jc7HxUh0ZHceqCjfdyl24BSS?=
 =?us-ascii?Q?cRxPLwwd9Khp06AiNe7f3I/+g623EGcTTLlYUSrjHtSC9osRJWSC2lYUcifo?=
 =?us-ascii?Q?YqZJz+qtpFfkXfWArPy8R9I6gdcJTpchfLhPstQ0cKl6Wy+g+Ep7ai823GPp?=
 =?us-ascii?Q?p+JKsOwAoqJNsR4EiK8bMheItr+iZqb2J2OnVcB3cRGZyOVdUDAgwJK6Q/6C?=
 =?us-ascii?Q?tVgsQz933lNoLgNXBVpbtw6PVTbTh16c+bDiQQpoprTD3KKkpjmJ6tU4lI1E?=
 =?us-ascii?Q?pnf1sz/Q4k/ohO0kh53lpRs4fPC5ABStRFNu0ZhnZZ4eOcMLPF1CjLpV2KZy?=
 =?us-ascii?Q?zunjDtmdMqPJak6rdC4GG9vQwPpCehCGnr8F0d7e+ZDLaErONPkcShHIcIUl?=
 =?us-ascii?Q?84V1eyV1nt9urtL9ca9fJ1Me0Qv6QzjL1JFqrGBmZFJ/m7+y4UmsOk056NEi?=
 =?us-ascii?Q?KsW92b5SUpGkJmzFiDMMaLU/ICFMWCM8NFpKYiCP+5SZ7X9LghQsIPddko2W?=
 =?us-ascii?Q?CyufdTLs8rkDua3CMW4WmsNC6yqAyo05iN1IBfU+IP23VP57+nVS9ui6EMQU?=
 =?us-ascii?Q?jn37f3djYqrdBrEn4YVgVKVEswJ0JGfSWCbPPj0Fq393kxdtuobpcyRsGbnA?=
 =?us-ascii?Q?zjqgg2A8kYvBRmzJf6HfyZHaLdLgnCX8YZDG1VHnqso9DBgPrRk6tvmYV+4A?=
 =?us-ascii?Q?OH2W4ZspvyBa9VK1m4bvNaPU1u7oE+bHK7zQEK1EeKv9h89lpriPVGqY1lP2?=
 =?us-ascii?Q?yZAAfRK3g0JbD39h4A5XBiKnO9h4msY38e2RXM9TQnEfgx9aTp+PLdt8IcTl?=
 =?us-ascii?Q?FuYaMTv0t4a5TpcR9DQWC2SiTvi2TvDEu+VPdZj+hvbab2Eqfc0l/m2ZEAZ1?=
 =?us-ascii?Q?Lzcz6W7asOiHz2NDenoREawUdGuBae5FZPGvMTzECDq7es72gPyd?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128ef27c-ba52-4683-9c08-08de95f19d0e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 04:36:48.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcPXW3uhBHwtmv73m3FYQvul6E5kr1yx+ijxtfwtyl9c+shjDJLURGhdwkRqagxpvtFnYrffLhMPcWl8yJei2OXyKVgeAlqeb/fXXW4y/86Xhq7u70P032++3iHkP8p8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16304

Hi Mark, OMAP member

I'm now trying to cleanup snd_soc_card, and noticed that card->pop_time is used
only from OMAP1 board-ams-delta.

card->pop_time user drivers are...

	> git grep -w -l pop_time sound/soc include/sound
	include/sound/soc.h
(A)	sound/soc/codecs/cx20442.c
	sound/soc/soc-card.c
	sound/soc/soc-dapm.c
(B)	sound/soc/ti/ams-delta.c

Except ASoC framework, pop_time user is only cx20442 (A) / ams-delta (B).
And board-ams-delta (Z) is using it.

(Z)	linux/arch/arm/mach-omap1/board-ams-delta.c

	static struct platform_device ams_delta_audio_device = {
(A)		.name   = "ams-delta-audio",
	};

	static struct platform_device cx20442_codec_device = {
(B)		.name   = "cx20442-codec",
	};

	static struct platform_device *ams_delta_devices[] __initdata = {
		...
(A)		&ams_delta_audio_device,
		...
(B)		&cx20442_codec_device,
		...
	};

With off-list talk with Mark, this card->pop_time is is much less of a
problem. So let's remove it. But it needs Acked-by from OMAP1 member.
I added [RFC] on Subject.

Kuninori Morimoto (3):
  ASoC: ti: amx-delta: don't use card->pop_time
  ASoC: cx20442: don't use card->pop_time
  ASoC: soc-card: remvoe card->pop_time

 include/sound/soc.h        |  2 --
 sound/soc/codecs/cx20442.c |  3 --
 sound/soc/soc-core.c       |  3 --
 sound/soc/soc-dapm.c       | 43 ------------------------
 sound/soc/ti/ams-delta.c   | 67 +-------------------------------------
 5 files changed, 1 insertion(+), 117 deletions(-)

-- 
2.43.0

