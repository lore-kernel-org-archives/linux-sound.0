Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C9837FF47
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605417; cv=fail; b=niaUr+MXIqetO1mgLN+fzfWnobZE351dyprkSrJRG56JB4kKesb1DCzrllM+RxZkOZOoLJ9YJig7vcrjMthyEPb2FuPBKbUPWg25bzILd2wf3JPrXozynRQmaZE/DnYqnRarW8A/svjeXk0DWySy7eYtS55rdnXI/8dLWFjI0vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605417; c=relaxed/simple;
	bh=Butrcqfum4l1Yb6bbi3BMApt4/F8Uu44q9E1WTiQeak=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iLzlUnf1eKk2ninC3eK6sqzMFuygqswwp32IzkcrsGdNVU9GZ3KBpVcdFG7SKXZ5DSvFAwfTzVFDdkXCXPRmtPcB1TPRX4SU0d2gsmDYD7Dx/1INc5FZYNdC4wtyw4vxYA61/Z4U9Nu1nZ/IVvaTGVIhIsshu0g2wn6FaMtJSbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h7cagrQ2; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h7cagrQ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8XcXbCB4PYIUA7U/NGcbcjrXEKZgKd3KmpUXeGahpCRxatFBP0E/yST+EdsNniF0zwAPGGP7fQhuQNJUd7oqRfZ6kUE9nwXHmjXGDq597icvdiwQfGYNZe9SYkPlej3boCNT3PisKrSMvMS/RFX38itD0jsbwHf+vajVzg4wVKXmBQb2IbPxWtmLlsNuuxz/CC3jUaViu+eFA+Xp0g46KU5NpjJEUFGuYP1lZsnd9EBo2zyczA3vwZuOCvz60fJKfjWr6jyTtVkkZsj1kRB0mP89HX/NEN4+kio0W+QonNn5wl+upZ1h1igcDRQQPot/MDFhDtwGsnu4pgInnmSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F/0QnT/NEykdho3cKDuED4yoVvO7cYBjysONFvAEtc=;
 b=AqnxuNL01I52p8arodlDJ8HldBjUTY3IRp8gnZbGKQKl/OgDnrGB3WNA9NSomZlRQte2rd84d8a+aLsfQQD6dEBObajaHw5LUNemd6KsB7kQ0ntaGe+6bctt6LeEfXJ7Ue4TO6DJIrj1wrDDujWWh59Z+GoNA9q1ueMPAIovEXJiomLC0dQmPWdvyoSlaE0i235MZgx/uD0ML0s+U+TVZxa+AJ3aZ1C0tI0q3XMzld9VWfBAahfqRXc7T+22DCd0YU0Inv749N8AhsrBTygkEMUkgoNjtpqr7fbkRDvhsQM4YA9vCa4znh6s+8NxAS1yW6JsSmMG0l6AmKG8savJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7F/0QnT/NEykdho3cKDuED4yoVvO7cYBjysONFvAEtc=;
 b=h7cagrQ2yxpsf6ufnD9Ms3v/OaTi7eGlFkbkNSro+5doUTkJ6+RYJWib96Ba8YJ3OCwqlr3KFenhQg5g0ZZoqQroB8g9dqFatKf8BeOJFMW50PDaFej5hESZnvXDlUuaR6YBG8qhYHuVqqfTcJ3qvcNo5Ct3zh7g0U0Sws6crak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:34 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:34 +0000
Message-ID: <878qc8p0yh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 16/29] ASoC: mediatek: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:34 +0000
X-ClientProxiedBy: OS7PR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:604:251::17) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 09560664-41f5-4cdf-6e11-08de79b6905f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	co5Jq3glrBh4mLbbMPprxvncaSUhkqgIMirbQ0XfnLIsSoX70UklJv49vD/RAhgEwbT99h7A2BRZpOeQYXTexR8oL5JuG+XjIVNFq4YfzZ9GRZGLQgirn6wRz4+h88PV6zTVo/n68m0mwDewQ5+hrye3535WeG4r4fC6n0Mfd3Z1ct1dGfZSy9JpCXmz/iIM5mANxgzzGKE1P02rMWoQPBmpbLz5jMbBCzbQ6skeE0aogdnJ+7Hnm4c4CZId4TbJ15CAw9J4X4pY2AxM6D6TYc/uy00Iz7RXzDZuGxSpAt/a1v+wyukvVYX9EQdJTDzgYjaH8E3E4d6nC9qnDivc6Gvlqy2PS5CQqxOoleIr1qI2UkSH+VLi8S82dcEeDJDVdUhe1UxRH+i5DESkJLJerMfyZeQDVxOEsuEygED/+pNMpR4Srgk0YRBiL5AwKe1u5btPyI4/OmnMUmdS1b2H5MDhjjIWZzn1bSZcBPU4o/I9swwiFKWCmBbxQK49LpauOT/dfibCQVuDhdpdCgvy9E4bhmHJ9ng4uxEcHOZL8pzg5+9klgvyU8D+5lpBBBOvihjM514ql6P3ZveK1FGxe88bnlIpSFgpbzJEBl4FJIkwbUpfuBEKPHNEq5elKhg+V7Vjv8Yfx/7aj5dCkMa+EnDGLXs0QtnwCiDBWbQmb8c/5zXJVWWMgy+vyQp7m29c1xqUXRyJNF/JK3ZNynUTsrOJ1Gq0DEAuyDe0cYkJGFupnRSRNEfsS/9JNXMynziNCuV23D5IjGU2y7bdtghrVDZNL5vkNGHVbDgWetSdpYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MF0WcOQ2iRUg4G1Hx5CmmZKhUaK1hznuk8mgVqF/RsRPMOmWAjtkSbiR4NbN?=
 =?us-ascii?Q?jOuRuu4BmYC7XqSBCD4NpaX4zW8RqFOaD/ATa67Edz0bjfgyDh/O9LQku9Qm?=
 =?us-ascii?Q?I5dH66KBPrQdh5RgBbz+upTKb1I151DRvukr4QeYvGeKXjRXmf7BAz7dojas?=
 =?us-ascii?Q?MGHCeKH+H0ecLi6bNJxjZdQ5eDyxcAVuH81mE60LEpLpyfPYady5fKNfH0Bt?=
 =?us-ascii?Q?owWSCHcSpnBVPD0JxfGQmBNmzKL8QqovOyDrankmOlsBL0sS/g5vUNOjxmrb?=
 =?us-ascii?Q?TLqouI67MHYw7+GHDg1r7GOUQJW52hr5Gy1FwZ0avcZ2ELNgxiceueDpAt1H?=
 =?us-ascii?Q?zLPLFH3+gdlI4PgypJrNnSAVsmi+0LWjy9/Z25kPb+y00RzcQeQpH35XJGYt?=
 =?us-ascii?Q?S5ca7r5VJJXcHX7MyJza3P0tvDl2YyZvQXZDtPHof8xw2vf9C6R4409hpv0m?=
 =?us-ascii?Q?llcbQIKAX5HgMkbM39pwI78PXbKE3pSd2+0dMZXDGcApFmoKvAAtrsVCrKk6?=
 =?us-ascii?Q?xja38NubvQrbyYZuBlyZG4jUf2e4bn7Fb4ubTGmn2/ZNFaETJRaYQL0XE5Rn?=
 =?us-ascii?Q?J0Yq1kkTE2UKpU9/nlSl8E9Nhp3TX9SHb5ae6LTVoZarguakL5srW8B4wFgE?=
 =?us-ascii?Q?GMww0mGEGAsFoYjVqSvF/qwnRl73fzwyq8rWjE4WtWBezoKcc/GZ7fd4liED?=
 =?us-ascii?Q?ZZzfV9vJOToUvkUz8ipRhUaNUUFLoisdwXf3el0QCWmQSmYNJEip+seMQ6Om?=
 =?us-ascii?Q?pI9/Q2EiCUe2SSBQj/Hs9EtIhLV8ECUOba3MASUO3EFpGeOAvVTIJjpTsprF?=
 =?us-ascii?Q?ff4yBMTQyGqZXs37+ZP3B99V5Q1A7vxCmhCiY4J+scQUAo1TGJIlKIVSQrjU?=
 =?us-ascii?Q?khAoTdbw1F2mak9nQ65AuF7OIZbUOhRP5XgObqm4hTScajNXimMtatgO6Ins?=
 =?us-ascii?Q?iH3mtAo0rEoNlKq/jmPQG0Radw6GDDgidvlK0k3dMxOPm0qigNcSP/gQZSwO?=
 =?us-ascii?Q?gIX6JJS86yZuef0LgalYvYz5lZzZGiwLuJAdKzBLtImCZM0ZCEbia21ZvxIY?=
 =?us-ascii?Q?BEW6rWhn9ZigAgqAft8BSRH/WZsMLmYRcOq5OufyqBbkNRzywu5iDJa4Q0A6?=
 =?us-ascii?Q?a48QHi91c8jPcqd/QmDi2GBWfQE85pZ2V9fgoj08WWWp7aRDXAyAexptyxNk?=
 =?us-ascii?Q?Bae7Cy0id7AJvyINcsUjRNugQ+ZcWx/KrarYwExayhb0SmsI6O+0N2HG1tZ0?=
 =?us-ascii?Q?6jlykApkiBxuhuPYZiIxwLra4m8TGY9OJL98c729jgXy7AnJTDdxzQiRaFG6?=
 =?us-ascii?Q?EkbDVL/MrUTLIfoelDTutMrU+x/nWGG5L5FhpVBawdAf6lJbaAWux5+RSjID?=
 =?us-ascii?Q?TRi7m5q0gfRdo8/yIsWzKH6VTBMpvXwGItPuD2utnhV2CyxtHQinEGycgKPw?=
 =?us-ascii?Q?gSwE+xBEJBZCFpQMJGVor6FxhOVl3q5c1Q+6BJdPp6IeTStDzdc0nGeZHk/3?=
 =?us-ascii?Q?qIZGBg2GcTa9X6xmjm7zl4YIoaFWAk37Zr5a9viGdC8QiFlxpJvifH08fn+V?=
 =?us-ascii?Q?+cOtY0z1si8kGqyyj+a8eGydqJQmsq76frzF+lubABqvTBZJcHf1k4yk+ex4?=
 =?us-ascii?Q?sp5/G+KPeTvxeM1zTIQdRei8IrKYFQNNj5DEHgDM9Wb3bIEuLf21wfSpfWEU?=
 =?us-ascii?Q?GobZQfJiT9GjFX4ei9OpOmvpSlckW3im3HhVOP2lNaokJwjfb/+G0wJMDKJz?=
 =?us-ascii?Q?GImQmX7Tqzitm42VbUMMboucJ3Wpb9DFhZSKpBP7gfpN8ZtwND1F?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09560664-41f5-4cdf-6e11-08de79b6905f
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:34.7263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b15W3SO5GpkQ59zRsLR7EdniY/D/hjwO0ozgSX+W5GVZQhJxaUkKyEGAq3FMNBJvSPYH7sA0gvNIFPER10xFm1cDiF3IjnwsOPRkU+XeXVv+LyFi7UoRhd1/Piqhrejf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 938dd3d46b003..f2b39fc9ec81e 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -149,7 +149,7 @@ static int mtk_afe_component_probe(struct snd_soc_component *component)
 const struct snd_soc_component_driver mtk_afe_pcm_platform = {
 	.name		= AFE_PCM_NAME,
 	.pointer	= mtk_afe_pcm_pointer,
-	.pcm_construct	= mtk_afe_pcm_new,
+	.pcm_new	= mtk_afe_pcm_new,
 	.probe		= mtk_afe_component_probe,
 };
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_platform);
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 085e993c650d8..44a521c3a6104 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2773,7 +2773,7 @@ static int mt8186_afe_component_probe(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver mt8186_afe_component = {
 	.name = AFE_PCM_NAME,
-	.pcm_construct = mtk_afe_pcm_new,
+	.pcm_new = mtk_afe_pcm_new,
 	.pointer = mtk_afe_pcm_pointer,
 	.probe = mt8186_afe_component_probe,
 };
diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 166ece74270ec..24b0c78815f61 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2378,8 +2378,8 @@ static void mt8189_afe_pcm_free(struct snd_soc_component *component,
 static const struct snd_soc_component_driver mt8189_afe_component = {
 	.name = AFE_PCM_NAME,
 	.probe = mt8189_afe_component_probe,
-	.pcm_construct = mtk_afe_pcm_new,
-	.pcm_destruct = mt8189_afe_pcm_free,
+	.pcm_new = mtk_afe_pcm_new,
+	.pcm_free = mt8189_afe_pcm_free,
 	.open = mt8189_afe_pcm_open,
 	.pointer = mtk_afe_pcm_pointer,
 };
-- 
2.43.0

