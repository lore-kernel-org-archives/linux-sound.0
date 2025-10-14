Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6852D30B509
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416060; cv=fail; b=kBBrocFlM6SaaIht2Ydxe9x+BeTph+JPsoJFrAVej7H+js8BnIdFagXC6LnoDo1ljIGasSW6y+kBlhoPqOQqDiEbhY7bfseW5Ktd2vNMnBVIrRSWBbLB2/gGkIXJbuqX5V/rNEKE4qpRQ9Cu1WLj48sBQVbzmRVPRjIpoAX+J4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416060; c=relaxed/simple;
	bh=2vLGvP/IiQugSxaVBsOE3Dt39gp2AI6B2LWPsrQlI5I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SJDYvQi1DH2MR8yhMNTAvCgRComsQHvRDde6XK+Hb/rr7Y4PE7Y/HaA6YvzGiLCT97kQ+dVJ9Oft/GFOkNv4net1TEVDGBIEoxNOgVMxoNxeH65c2OkM4MHb280g6vf3OjHpmg1BiR8kiclpy+i6z0+5BggX2UqMWipDvBRyLpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pv992H20; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pv992H20"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cafK5w6J7NeBqAxduJzXnZDnGAuGoNZoa5oYsYWBdChXFL28x4p18zJfzISu7MqIu467yLx9JfgAl7M11XldZq3EHY/cFMaA8lPWJFoyZDvKRMvt31LnAWB8Re11+H4UJetBevxMCic8zjEyzMC23nZbUDppMOdWumCGH7CbruNj09BcRA/1+4Vy9yh8fr9t60hnlCxaooGI2T+9hFZMM30/960oveJXZmKvonAinOMbOwkC31wQJBV/SzywXItqPXP4+4leKHR6AOvYCqjvEnOKDe4V+dOPOvbmYt8X/+twv4pxocybR/JiUXUekCVEr99kPauRo4ziufCTwPWjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEePzm+4MJM0ia6VgktFYtIGh/9LlvXMHsZqSGkjt7c=;
 b=YZiUaLs0Z4ixeF4tEECYx8KYBiJ+rpYXCWAUGnp7iqsocHZJUeKORBCbk+vA8M1FlZS4mblX3wgMcRpwWZEb9mnV/oQuAQj1xvzKK3RW51kWlv2/zg2mRDXYNqINQJ3fJ3eike6whNkMV6z/V4rhJbnY2jqoQ4fVUxBgXnWxvJlU1RYxWdKs+XQ2FUpLedi1wMfsy6R65o3rA1PscQNJOxoGt15BzAyRpXCdAe3qKMG4KmVw3SPZwzdp77RwVRpS05C105fDvezXiXpxHu4aOqUyIM8WmRZy6nnvOOPljAXL5ZswCBHRUz8g9zjxFyJ3h9QvCezGaFVvT83yMwEPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEePzm+4MJM0ia6VgktFYtIGh/9LlvXMHsZqSGkjt7c=;
 b=pv992H20TYXIUtzJf/eHZ4WioPtKG44b8rmZJavMQv6mAdZLp00ezq+WxHErFM+NN0zUYBnJno4eu+lEwEAEJiMeo+m06hreCPAwQ13XGXLXzvaMqgbvrpgZvERjNLkDUi9MbXLUTXZMJ1AmfMWcdhHCrVue/7wGdaNZvU/4Vwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:36 +0000
Message-ID: <87ms5um7k7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 131/139] ASoC: mediatek: mt8186: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:36 +0000
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e3687d-2cc2-47b9-600a-08de0ada00bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0vqt5OHTB6N/IAPLeT/tb9ZjzNrZYI+LNQfRP62yGub+QLrr1CbqhWbeh4bd?=
 =?us-ascii?Q?snW16cpch4vXchesRcTd6jRK9p4hPf3QPKbQHRZ/w7/JQwn+TFW/keEbfJRj?=
 =?us-ascii?Q?diSpbzeqZ+BKOqUlYxQ2nplXmP7LnJLqTyg7ZoA9IECjRUUSBdB1LVqCCFzo?=
 =?us-ascii?Q?MHKx+ufEBTkZmU3UnJzHpSrzKu2uNXViAQhlgp9YgwpESEIrwgIAZa9uDblk?=
 =?us-ascii?Q?lWHEyjG8y/xDl5BvQ96Oek6yT2U/I021RyfC0KXKuN5xQNt/tTSmIIabb72e?=
 =?us-ascii?Q?+nHzqRXZhfczxm+5dAxpEmBMC8amJGm74DezSy/upv0U2wz7Xp92WrCZwLVu?=
 =?us-ascii?Q?SHHvgHTHIIAHpe4VpM9sCUr1M8CVN9hGYcgEJfzgaIsNafJvae+rF5lb0Hrv?=
 =?us-ascii?Q?apcD7Q2Ton+8LugRF1hoUaKBbO7RHAYempIP78r+vMVBLVnLHam8y5hbjU2n?=
 =?us-ascii?Q?ZLgZg0MHYyJzUZXFpgQi0su+J677xUQHkamQJ7xdATUDwU579foiBqS7zTAd?=
 =?us-ascii?Q?xS04z1DFxJzuHJRgYOkq20RBS6RRbCl8xQ7SN/o8o1YgSZy/51YShri3A69L?=
 =?us-ascii?Q?XFcu497lsNuPrOn6u4FMGxcar63MupM3/SD4CFmOa2NxStlB1AjtPbnvI9sW?=
 =?us-ascii?Q?6bfyNxjfwcxCH6E/+QgQUDKzPG2Ud3pq1Cmo0yQ5YLBqjCXQsRXVSHZ88tON?=
 =?us-ascii?Q?UtloDGJdmdUp53crr5Cp784Bma2nEXeOYr3OjnKGNgsahKCct5HW1VZGxV+L?=
 =?us-ascii?Q?Q41iaNOa54vEHioSJDdUNYyWEQ/zwJRT8XzrpDHyVnlGeGUEzMm6J5MNr7TQ?=
 =?us-ascii?Q?+H+nZfBg6jEVQcs3hTMAU03sujzqNxQbwhv/5+CrEfbCQBEJjD/yPd0W56kj?=
 =?us-ascii?Q?FFAAXix+Ms0D7rvCBTYByQh7X60ZPEf4V5BwdqLDhI162U4zontrw5Kh6pW1?=
 =?us-ascii?Q?km/T2e9GO/XRYbvpHjOkvNk47WnnUvPYjrWTrp2MExT/l/JHqiEQrLE5uuLa?=
 =?us-ascii?Q?703QKGn/kdg4IGHBfHfxPSqzjaZ1PxFTkbVwVTvSxiWkTmCbITFrrvyOiTT8?=
 =?us-ascii?Q?mr3TlG+zUOf4OjAEdBRHommBeSIBuTRqp0SYJ9xEzL9/UbJFBxBXDWkOaQf3?=
 =?us-ascii?Q?ENXpQxav8Zy/v6fI9XiZNGWFOIF6iuqVm05PfdGTEivoZ2USdIOvOo+8Ptkl?=
 =?us-ascii?Q?UZpejSTtJVbij/dJhy1ZjYHhVv65i97XX107Fa38IeKyouSMqufdne3YGoDE?=
 =?us-ascii?Q?uLE24txiws9Nv+WdOeV9y0SlQsuAt33VNjDhfyYBQL7yINuREwR1YC/Na6Ym?=
 =?us-ascii?Q?fe2dxsm2x8bsvPnxig5UcWofyV8U918DB6CDneA3QhtkIOa3gv8egj4jvoc/?=
 =?us-ascii?Q?8F94QG8vIx0ROZRB8YOokoRlV0QN7oQpzAuazdIfG2WFsIftIvmYVYuBqfBX?=
 =?us-ascii?Q?rhscUZeeTvfBgW9dZCaQCT5JIHnWPpCWoq3tP+B+jmpoauHJD43DglrbPtWv?=
 =?us-ascii?Q?5oUlzKizo1glzwkLlOUFeZbATWOyuDT/9NoL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9shii2pLZT6HMtjT4vxo8KMFnX1aaWNddAOkXMo6E+iFC0kZ13YRfH02w4Iv?=
 =?us-ascii?Q?SGpuwt6JWX1O+8z6spPQ+fjaqroUK2OIAS8qeYYksAZg2IaN/8h4f6b97JS1?=
 =?us-ascii?Q?CRuC5zr0a4rqrMqqGMB7DV8Z4xC0y+8+lWpa61D9p6UHrIznPnVuUW2Fk09u?=
 =?us-ascii?Q?pI/aUiLgzR9AGqs+76brT95+6ewIrUszbXXH2jOwnNA+iTpqusrvl4pWp29p?=
 =?us-ascii?Q?mz6wpCr8UzJHQfkLKR1wYMw1p0P5IP1wf8HzPndCUxCLGAzqUHObRiSqlFFt?=
 =?us-ascii?Q?zDEEyM057gynXl/JH62r7MDN/8dBqHLfpM3avwXb8Oq3Y5sTTLvIghvP2KvA?=
 =?us-ascii?Q?qMV9j6yxFdoPLoJFuMkkCXeMVqsGJKgS5IxTwHQ+Duk7eWeRY8H8eyK8PBNP?=
 =?us-ascii?Q?0itmPMrg5B53nncGGjHAwPQ1dEkD9M1tvASIbivZwecLSG0fEGqQs41FKsAg?=
 =?us-ascii?Q?u7r8RONi0p4YSHS+6oYfrtoEWxd2IWWUHUdVp2HLHRyzB/9XqXySFC6hKRn5?=
 =?us-ascii?Q?VBofRjn3b1kJpIeucFUMHVcruUBkUaWncdGoFa6ajZHiohK+tGyTjnBBs2I9?=
 =?us-ascii?Q?n2VdmRsLi3DFeO6Zt20ASkZVNwy1/HstJiyY8GXugmfRM56BGQiNSDRYZryg?=
 =?us-ascii?Q?SKJFrddcZOu+4oed9PMakwMTZRJ/CvTT3QYp0k9h0fHDalOC0N5vfdtBvRyp?=
 =?us-ascii?Q?ND75v4zr8g7kzKVB2NVTmUnLP2wIiCnTu+KZXY8TqcGeOeaxuGz8bi/bDb+s?=
 =?us-ascii?Q?5QYIHveaLQZorQjOgzD3ySnvukP4Ydfe2iBtULfibhRXYeMTYIDsnexjiV8h?=
 =?us-ascii?Q?4rIKw/LGMBj3tD9IdxhGqR5bmHdY8ug6SXZFTj4gofeVHE8Xwcjxo5dKZnhI?=
 =?us-ascii?Q?2BOx4Khm+ER0CzeLsx7gUM5+lM0B+SjvedlDvQAqHmTBs+NKc2ayIRULoLIv?=
 =?us-ascii?Q?JAK4mCc1rdGckYlfeNGQ18nvMJ+WWp7874UtqIWBS8BEeejoql8cghuiJsCb?=
 =?us-ascii?Q?Voy/oGM8AMg0NpX9oWqHlANy6/r4/zcJ8L2vgykzsRQMDwg6jq/mgdliihvM?=
 =?us-ascii?Q?UnUHxTHmJWjdll1i4vC3GDV+5ZwZ10sN2IaV3+xc0nfF+WGMYt/y2X/h00op?=
 =?us-ascii?Q?XDCghc+SjTJDQuTTnePuMMs7hfdVhhxcu/xhmgVy0gwnHwMBBn4RPb//mQlo?=
 =?us-ascii?Q?IsDqsp+5g9R2Bw32F7Jx3X0N7s3fUlz/VFRrpnDHTuANSEUrdvoQgNs5ldcp?=
 =?us-ascii?Q?gRxEWT+Qs4L7ynA42/QrF1+NR4q4qYsc7p63KWvrr5UosmZY6OwmvEiZf8/a?=
 =?us-ascii?Q?b5TpPJYKqFJy9mp2yQpXSvVueJLxpYUkKlh91o+7yWYZlPrb0NyguY38xA2s?=
 =?us-ascii?Q?BVJ+4BvFzbot/GUaxrwZwwET6rtRL9msZtNDa0LSIFxAW5b5VfqdKPPs3NQj?=
 =?us-ascii?Q?nTL0XV5gb86/EFsBUNylv8S/mTfScKQmaVUzaUowzuqrPazQsArsMydesg9R?=
 =?us-ascii?Q?vMyVFWBk3fvoneuqQhhpJ4m9TkcmqTwCdXgYpvKHcG1SSiZf2ssTbOkk2zsc?=
 =?us-ascii?Q?qTyHdeyRSl+vOj1RkgDY138BMal6nbnrXXEoG/x3etbKM0/HVwIMhZVFjmB5?=
 =?us-ascii?Q?oNELYVWtqjpVSnA5iNIviPU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e3687d-2cc2-47b9-600a-08de0ada00bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:36.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asu4qqm2uqr118aimxsiHPliPFQE2UpAXy5o0MemtYQ4Dn5fUyaklxFNOjdESqXIjAETxj8fseeC37FFar4VKx1jCEiai3T+h1WPwOMtHH73k4dLB8nT/BFfRHwb1fLm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

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
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c      | 12 ++++++------
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c     |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c      |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c      |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-misc-control.c | 12 ++++++------
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index c73b4664e53e1..085e993c650d8 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -564,7 +564,7 @@ static struct snd_soc_dai_driver mt8186_memif_dai_driver[] = {
 static int mt8186_irq_cnt1_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 
@@ -577,7 +577,7 @@ static int mt8186_irq_cnt1_get(struct snd_kcontrol *kcontrol,
 static int mt8186_irq_cnt1_set(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int memif_num = MT8186_PRIMARY_MEMIF;
@@ -613,7 +613,7 @@ static int mt8186_irq_cnt1_set(struct snd_kcontrol *kcontrol,
 static int mt8186_irq_cnt2_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 
@@ -626,7 +626,7 @@ static int mt8186_irq_cnt2_get(struct snd_kcontrol *kcontrol,
 static int mt8186_irq_cnt2_set(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int memif_num = MT8186_RECORD_MEMIF;
@@ -662,7 +662,7 @@ static int mt8186_irq_cnt2_set(struct snd_kcontrol *kcontrol,
 static int mt8186_record_xrun_assert_get(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int xrun_assert = afe_priv->xrun_assert[MT8186_RECORD_MEMIF];
@@ -675,7 +675,7 @@ static int mt8186_record_xrun_assert_get(struct snd_kcontrol *kcontrol,
 static int mt8186_record_xrun_assert_set(struct snd_kcontrol *kcontrol,
 					 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int xrun_assert = ucontrol->value.integer.value[0];
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index dbd157d1a1ea2..e74174ae8873c 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -324,7 +324,7 @@ static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
 static int mt8186_adda_dmic_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 
@@ -336,7 +336,7 @@ static int mt8186_adda_dmic_get(struct snd_kcontrol *kcontrol,
 static int mt8186_adda_dmic_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int dmic_on;
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index 7c40212219500..f890e9173a076 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -113,7 +113,7 @@ static const struct soc_enum mt8186_i2s_enum[] = {
 static int mt8186_i2s_hd_get(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 
@@ -126,7 +126,7 @@ static int mt8186_i2s_hd_get(struct snd_kcontrol *kcontrol,
 static int mt8186_i2s_hd_set(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
index ef2801f84d275..7a8890d7122f2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
@@ -272,7 +272,7 @@ static const struct soc_enum mt8186_tdm_enum[] = {
 static int mt8186_tdm_hd_get(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(kcontrol->id.name);
@@ -286,7 +286,7 @@ static int mt8186_tdm_hd_get(struct snd_kcontrol *kcontrol,
 static int mt8186_tdm_hd_set(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(kcontrol->id.name);
diff --git a/sound/soc/mediatek/mt8186/mt8186-misc-control.c b/sound/soc/mediatek/mt8186/mt8186-misc-control.c
index 2317de8c44c09..3b569786306a0 100644
--- a/sound/soc/mediatek/mt8186/mt8186-misc-control.c
+++ b/sound/soc/mediatek/mt8186/mt8186-misc-control.c
@@ -74,7 +74,7 @@ static const char * const mt8186_sgen_amp_str[] = {
 static int mt8186_sgen_get(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 
@@ -86,7 +86,7 @@ static int mt8186_sgen_get(struct snd_kcontrol *kcontrol,
 static int mt8186_sgen_set(struct snd_kcontrol *kcontrol,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
@@ -128,7 +128,7 @@ static int mt8186_sgen_set(struct snd_kcontrol *kcontrol,
 static int mt8186_sgen_rate_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 
@@ -140,7 +140,7 @@ static int mt8186_sgen_rate_get(struct snd_kcontrol *kcontrol,
 static int mt8186_sgen_rate_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
@@ -172,7 +172,7 @@ static int mt8186_sgen_rate_set(struct snd_kcontrol *kcontrol,
 static int mt8186_sgen_amplitude_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 
@@ -183,7 +183,7 @@ static int mt8186_sgen_amplitude_get(struct snd_kcontrol *kcontrol,
 static int mt8186_sgen_amplitude_set(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-- 
2.43.0

