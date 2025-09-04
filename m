Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011063.outbound.protection.outlook.com [40.107.74.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E4022C355
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963252; cv=fail; b=AF6/A2E7/Oq3u8SQ4vjSscOihCY9CyJ95RjAbKWEgtr50rTG+6nKPLoZ8OLT5GVQnjQUo9tVCRJacLYx4dNIEcv8qTIzgDv5nKVA463peMqVmWt7Km+aULnG+B0TSOl3TCM5jD6o0T2wtCLXD3SZ21R1gGE37hhywixfLmUgc5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963252; c=relaxed/simple;
	bh=TeRR0mKuBCARkSDkLrPfPrw7rSRLERLSSrsBeb/AaM8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=sztlfUxl/dv7pV4OuT1s+Wvu5ICXCzkt8vjCLVVATpRUceqFBGVf5ToVIK0Rn8cn8dDdqjw87hIPWeBCbzdx65Nao91rDUtyJxdcoj+CNjhaX+zRLlYu2img6nH2nOoUbPUBs2PfCc0CZtkengdTYrOkFc4VVqv92gPuz9IJZZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mhAQ1kIW; arc=fail smtp.client-ip=40.107.74.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mhAQ1kIW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6XmHUWRBAgHlRUmYnilrqitIMV3GfAdToDtyO81GKCfWzCdKusy1e91ib4Gg5jp9YUgc7p5MBXFuuswcDbLIXe6UN1p+TD1H7RzA2+eIQsNq84MPrWy+U4lPFDnPHBDHBYWdYO+0k7WVtJJPqlMtqs+JtWW8TC2Rx4ZmnulNDv+Nb6cYnv60oYkHjXu72L03WecTWRE4v2Nh4o/nmFE/g6V7al/f+aSS1fSPkylj0O7StxRJzMhiRDzb5kQj7+A8uQgZ93qk4tVaGTF6NLrA6VjKH5Fvwjyq9vrlb3MeZVt84ayqmJatmo9xhaXtW2hT/Wvx5qI1xRdjjD7Xl+w4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6S1HdmJ36meLw0/fLN0vbcvIt/muQKJorX/pBTa3HI=;
 b=m/3/WZDNLFXDEnN1CtYUyUrm4K30Mt2QZdGb0Rr7AwZPFNrid/kNpoBHyRA/UJgnhrxrjTQ/NXz1+z1hksBXRU1PMIQa20hOeW1lqw4Il0ZE4GjpIcsCnnSgBOTtkAYT8aPRkGcKzVq8MJsssqWoEL36pDOaT0ASwLUs30uGG6Y/JssoBrwcGOPuItQtGuh83eSn1p/hfFQ0U0vja47gbBwOjWiDBWzVzsPthNgY8nHFY6SHxk4mODP0dkCaHK0v8v3Foybpc6ZPLOcNOUR7Y0/djVufgH95c5pDovG5ds7zzR3rMenpiwAwXr64NBeNxY9j8nMoJNX1hf67XpewtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6S1HdmJ36meLw0/fLN0vbcvIt/muQKJorX/pBTa3HI=;
 b=mhAQ1kIW7fF5i8PTrTiV1EGyjagKzRLh++rf0TImFs4KajPQ6Cpy5tdwgaS4ZrVy96BSJBJUMIwPiAeAqMvAxAs+oFIY/ToPXkC70Om9vXfT3h84xNQBl/gUDHMC/zrCHk3iXj74ry2SrcYIQme2rcRUzF9Vx8+ebt96PwTLbDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10672.jpnprd01.prod.outlook.com
 (2603:1096:400:320::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 05:20:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:20:45 +0000
Message-ID: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/10] ASoC: soc-dapm: prepare for hiding struct snd_soc_dapm_context
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:20:45 +0000
X-ClientProxiedBy: TYCP286CA0204.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10672:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7485ea-edfc-4505-6579-08ddeb72cd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IZ/eqNj5LPsoRFz7u7JB0C2uGfQlWDD0hq4rOtMBSMVOxQZbWTROiJrV1h07?=
 =?us-ascii?Q?cOSpPBNg2SJy1mQsjeXeqVjgANemh10eB4Fbo//ORedrZBX8gFduUw3ALHL7?=
 =?us-ascii?Q?029EMYtYew+q79NGTGeez4ZpkuPPqMPIiHp5NdqBpQojkS7HSPXPn0ukr5B/?=
 =?us-ascii?Q?7DKkaOlGeRYts+tpZH6iKWBTqyEbaKDGn8t1UTP19hTgj2HAkVKv4aLMw0pc?=
 =?us-ascii?Q?HnjwJlljyg+PX67RqJjVHaVESQRHLU0qr+V7zONqnQFQ3XAULbWrbWunXGFw?=
 =?us-ascii?Q?9dmtFGLZlM10iFnl1f2D9ptPyymqA5jw7Sg+8TRhiIL1BpPARv/S4ZAWXcwN?=
 =?us-ascii?Q?445HEKBBR3gQsMNGhnY7WKc4BEA+yhxcbEw19bzAByvEO4yCNJ+3q79+87JK?=
 =?us-ascii?Q?tzg7beIE9VETu3LZv/BGBPx+AYgVjzAzmhFbt21oouX/iL83hZPfDa12SbdC?=
 =?us-ascii?Q?FUJWttSjMbxsNZjdn3uQzcKBnZ3pH37clQB6nN3J5MNwSikC2fGt4tHkabSv?=
 =?us-ascii?Q?AOH3CmjfhiK2X2pLYKIV2LXKRzy088G88XgbtS/XeNColAa7ssJM4sLBM0e0?=
 =?us-ascii?Q?KsvomzgoJthjazNz0/iVcH5om6FXuOgz9KZriZQ1JiVs+XtbZZp5kRdsxbgT?=
 =?us-ascii?Q?omT9lDGaCwiwfXQQrBhASDyFZY1PC1H9OPgQEGc72k5v0Ha0M3m6jglBC1nh?=
 =?us-ascii?Q?TC8ZLUlk09FNSzI1awR2ISVHTnO7rp0Vl7TmbQiiD5RI4wzlUmQJF8PxWnXY?=
 =?us-ascii?Q?jl7Ntg6Weat/0LNNwBDkrRIaOkbKhuygjQUtQhXQl480Yal9aZRxG7JyJBi4?=
 =?us-ascii?Q?yb7/MWyIxo/mP1rG0GbBVFgwn+AEItJld39h6htRE5qOhK0Rpuau70fD3Q2V?=
 =?us-ascii?Q?DH1GaEWh1DXEsE7Oeg9acZHGh3ARwofXMSZQ8OhSZ7+pOd1yQd5o+oFJK56B?=
 =?us-ascii?Q?3KVvB4CIQ5r1MR0TfL9hEGrbG6RPiEsAzepzku97zsw4g9JUoNpf6CJRMiM3?=
 =?us-ascii?Q?iPxoV3HNCCWiu1SwZ9H7v+BpD+RULXeqNQx9XBII3EkRY3XTsHkbZ/Y905Px?=
 =?us-ascii?Q?+W28AD/oAmyinK9yYHhfIPFjUfIxPJa9KgYjCvNY3SRfpBdmvrAUVtAVeZPq?=
 =?us-ascii?Q?m6lnnoVkotjuA3y5CPbXWpH9PHXPXpXjZSIdmRd2etGhRRpXFkBx0i6a7TJY?=
 =?us-ascii?Q?n5c/yJc44/6tI2km27ZLjsz361tS8przd8oJJWntzyN0bQ7jIrsubmLxuid0?=
 =?us-ascii?Q?FcJOv+5r1pRjNU/dh+Z55HNwzQ5+WMhu/NR29ykHlYY/PNK7GiKfrMaDs5N4?=
 =?us-ascii?Q?XsKeDxu6K6sBCvVZpL5mHgjavhRqzsTIiMosIJeU6twKmfsl/y6N6fKwMZ+d?=
 =?us-ascii?Q?deg7u7rxYdfON41sUbUKlk7p/K9qULiRSJX1tSOBL0UBsDy0BoerOy33YMkL?=
 =?us-ascii?Q?jTfIe2sfQmjUkS47pkCJT3i1exU8yxf6QIT87YvAYhrhyyLyoDD4lQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DVItV/F11Dleh6MRateZcPnDg94RkwL1qHIg1RYjuiP3+NDjw8b6DPSlanSG?=
 =?us-ascii?Q?oc0lPzNLgmU3QiNv9y/lZPPdUINT0Hp883yXfsqd/ILUn0iYWEQvfq1omJ8Q?=
 =?us-ascii?Q?DPdu23A2QZjTAkiV/UIQzpunLhm0jtjaVmPOKZx1QLsEnWedzN6SQoROiegE?=
 =?us-ascii?Q?6iKqh/ra1v8taAJmud78JVBJSY0wMJa8P3exgafLooggt5XEfqgW5ysoBNcU?=
 =?us-ascii?Q?Unbbt3DmuihrvWxBR7Dhl/5GuetC1YHArtnzdU5Jrv/EbEk0SYl4qN+3KLYz?=
 =?us-ascii?Q?Uw4kO9mQoxhjWL00UX7LL2BwiCPDCTqYZUG5AXJf8w2xdNF301KFGm1Kxl7i?=
 =?us-ascii?Q?eyMpRGPOK1YQ16G4/y0wjCdIhNlcS7ADkLnRZ/b4ETTlu0V8T+IPksB+QBa0?=
 =?us-ascii?Q?kP2slsyjKU7ON9RZKlQs3lV9K6g7NkV3yAGOjwLxhKtX5ePfeaECwCdwObBS?=
 =?us-ascii?Q?1rBm2HJtpfcns7i+e3TnULbIeWvXOO1ju1qY8T27wICw0GaCvxRQFbxt6Jg+?=
 =?us-ascii?Q?j5dGycrDUEufSlVC4PfP6S0+GzPzFsnDyOsLd0NWUMbl8940M1yH0NWs8sbu?=
 =?us-ascii?Q?jP1UoWj1s6g8KZ02VWS6be/V0VjYaRmDAvjaVVijKqu4KVE09w3BZJJL2mVd?=
 =?us-ascii?Q?i3KZyv7ikLKQIlpfesPqUUJ8NTijTOhlMFtU/C6WEVSeiwK5fhJv3L0p1iYy?=
 =?us-ascii?Q?7vP7HscVUM67p1cZDqtjvygpuPVQthwC8Ggaa8kyCjaKniRhkQo02ROEH7jc?=
 =?us-ascii?Q?5zk0vwu6aIeZc+Y+uuQXsq7iDH9r5+sEwTKdW0Upfk46Syz2+AVg2JxBdgII?=
 =?us-ascii?Q?X/TXvQYtSHiAqXm+A9jY0rk215hiAxYe4uMQ8F44QYlfNfc18ikASOxc/edD?=
 =?us-ascii?Q?N/Z6zrSysDI1biBnJPACw8baRK5Vh54QouohQtSgrt25GDPShfLUmXG7c8l+?=
 =?us-ascii?Q?ILy2o1Ilg5PRuw9RcKuux6R3xmJnZ6xgaDEkO8wFS3WlsRdypECJccVhsT9r?=
 =?us-ascii?Q?d8JPctO9lPltr9nnBgcCAzcD/jP28jS3N7TK7aCSfarWzi7bvrRzAFkOrpNT?=
 =?us-ascii?Q?S1akiFI6V+2+qrffXA2/fYNzOZHtvaJfwsgXoZ7aQ6c//rOQAWrH8RSVdJwy?=
 =?us-ascii?Q?EO2jwIXrruegWk1p+bZ9CdXyBJiL+eFGHz9JkTuJAHhQ1POo6Sj4Rs7IEJok?=
 =?us-ascii?Q?LIvQY1iSqmcV3TlO8B8YbYxY6yKnVWA+vxDpZAkbUZ3rdHMakOJUMUhMVhaa?=
 =?us-ascii?Q?+U6zNsUkzIjulP/cvbrdnKO3mUp5Gk1LvhCFaZ7QCE6FHFjbyJWjs52tq2an?=
 =?us-ascii?Q?FPgrWFk5pKaJ3FmaRC5MjNxP+SGTDCR2FoNCveHmC3WvGw8as5mY4i1/RXqt?=
 =?us-ascii?Q?9EnXwxoOrPm2XC5ym3ebPHh5ECtOuRE7HyRhatQurUNw0TvYXD2NtdcGd2aN?=
 =?us-ascii?Q?HIouZZW+Ydz1ZtjUje/FeRtUt55EpTu8QJM1XHOx41iOnZfLBggc8yn532ro?=
 =?us-ascii?Q?lP0Z48rXBAkB9ztwWypURBpE+KRH2OZHuZpeLb6gxFOxZpJMQyd9P7veDdjk?=
 =?us-ascii?Q?bDB4fz+5BB1DRoAir7UVgND0dFHgqBllyDtDApvEJ416v+YmjptyAm/aGGfu?=
 =?us-ascii?Q?Wy5c7eoLejlxk7cOfeXegR4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7485ea-edfc-4505-6579-08ddeb72cd09
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:20:45.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXEmAm9Y1E/MieyqYKqqZ2Lxav6etbcMs88jipj7H55gjMjHDylyCrxrDLz9//akPjow3BXxApbYwp3yIUAN8FLcSx7xvCKBmFzNbd+BsTwl5aF/mXXOUjhsCjDheCNK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10672

Hi Mark

We would like to hide struct snd_soc_dapm_context from driver. So we need
cleanup code  first. These are preparation for it.

Kuninori Morimoto (10):
  ASoC: soc-dapm: add snd_soc_dapm_to_dev()
  ASoC: soc-dapm: add snd_soc_dapm_to_card()
  ASoC: soc-dapm: use dapm->component instead of container_of()
  ASoC: soc-component: add snd_soc_component_to_dapm()
  ASoC: soc-card: add snd_soc_card_to_dapm()
  ASoC: soc-dapm: remove suspend_bias_off from snd_soc_dapm_context
  ASoC: soc-dapm: tidyup idle_bias handling - step1
  ASoC: soc-dapm: tidyup idle_bias handling - step2
  ASoC: soc-dapm: add snd_soc_dapm_get_bias_level()
  ASoC: soc-dapm: add snd_soc_dapm_set_idle_bias()

 include/sound/soc-component.h           | 22 +++-------
 include/sound/soc-dapm.h                | 12 ++++--
 include/sound/soc.h                     |  5 +++
 sound/soc/codecs/wm8993.c               |  2 +-
 sound/soc/codecs/wm8994.c               |  6 +--
 sound/soc/intel/avs/boards/es8336.c     |  2 +-
 sound/soc/intel/avs/boards/rt274.c      |  2 +-
 sound/soc/intel/avs/boards/rt5640.c     |  2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c |  2 +-
 sound/soc/intel/boards/bytcht_es8316.c  |  2 +-
 sound/soc/intel/boards/bytcr_rt5640.c   |  2 +-
 sound/soc/intel/boards/bytcr_rt5651.c   |  2 +-
 sound/soc/intel/boards/bytcr_wm5102.c   |  2 +-
 sound/soc/intel/boards/sof_es8336.c     |  2 +-
 sound/soc/soc-core.c                    |  4 +-
 sound/soc/soc-dapm.c                    | 57 ++++++++++++++++++-------
 sound/soc/sof/sof-client-probes.c       |  2 +-
 17 files changed, 75 insertions(+), 53 deletions(-)

-- 
2.43.0

