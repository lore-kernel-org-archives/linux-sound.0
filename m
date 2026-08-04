Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B437F318
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804136; cv=fail; b=T53VqVa4NbUShNjUdoNVvVFM8HM8G2AXDEZ6EStExvwZFQN4VEFrhGr3KlQ+VJRUO+50Cll4Ru5KWIoGvhPnyzHf1u8FXR9Av0OquejEbOZEhypAdg+XcI0EH4DR2d13PW8cB8NUSucrbHuueQrlxxGFmdm48ety7BvbpAC+i0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804136; c=relaxed/simple;
	bh=V4uC659U8yTCo5pcB+9fANMwLRt/nm8G8jLjcFfmatQ=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MNmIqiB22j1ZI1/eot54VJ5crwLUJKrUcOzN/FsOy9ULNRzWFwqTMOhOoUxq+EGcTqjbvm0znoF1oxqUkHtH/rLAMTN4oGPn8wxOlH020H7+ODWdRkFMId1Cr5jon0r6d1CroSNZJvV48NCd0whO4oNGcJhbIKNCrDZdG/45jkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EmOMTHe0; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EmOMTHe0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWQoTnlWOBZsYBIokoIPtzStx9+jf6ASE2uK9U0gdOMJy4t6zTP45+0NS/qnwG6eKD0csdDElW17p+4hn2z8lJgIg0FAmG/FyIRH2zxUyX+mK8j5QLbd5XLOWaBTBMXkCdQCVtPWRwE8nzrWuPiYkDqDgGrNunjP2XNs10QKnrFiUOgqssVzMFB7yGjBqsIlpIMQok7MedbFHLZJetiOh+j53Is2LHnzqtA58e7eG1tG8uI5u3x/FU+oluAUwcSQA6qSN5I9ayehM2vk5cDXnB6Zfz8RwMwWoXyj4NF35kq9td3fo5jRGaHUMNofIciRCyEzcUkpoT7ls/fawBGWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E085A2ZJ76weGQI4Xx/6SHUYMzko+qZ/tWuIehppRfw=;
 b=FvD3IzLIFUQcR1zgMVL85BwvTF8JypxxdYlJV97DXqj2gVtUzKZ2qDxhQBx1Oo0umqgrEY6JTYZOxJObyaoitHduCDUQROGb4x78wjL9lhH11QZCvC5dbHV5NkNPm867asOki/n7aGTy+K2fzWeS/QPFyLNKt6DO0ALzuy3mYqLYiN9IKQX1xhzCbJSgO0TAbP9ky0x29fgTcHVlEDT4F8ibeuBp5t0EcZB4QEMhUDc/K5KO9fBSJK66JoxEG7ArjfJh1ELdjLekIoKPI+iCAiU5Yd68RTKYTjBmtwxcx0AOIHgWeuPuMlLzFqJPg6+rhHH9rLsnIIqE+MKaZr0eoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E085A2ZJ76weGQI4Xx/6SHUYMzko+qZ/tWuIehppRfw=;
 b=EmOMTHe0e0ZpjxjiErkndj7kB4PfiVslyJ/2wVeCasLgMXadVJu8kTWW4z0NDbeY6fbRwer3XityNmeTGMF5Y1asA9FlESESn76rxtPE3yWcFsVoF9Z7u4PABZCcWhMIqYfekehoMo4TC3OXDGDfu5KFrNla42UEN5+cXx1Q9sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:11 +0000
Message-ID: <87jyq6wwbg.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, M R Swami Reddy <mr.swami.reddy@ti.com>, Takashi Iwai <tiwai@suse.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 20/44] ASoC: codecs: lm49453: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:11 +0000
X-ClientProxiedBy: TY4P286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc0e629-4d15-4be7-afe3-08def1c13897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	OFhAtps+UhBOfPQUD/Y1a3Si5fBwnn+1EqSfr6FhFJFkTtrMeDp19e3FLz9PRdfYZ4D7x/tgo6tSLLDwyX+9VTwdApVkWH9mVLbHjtgple57COvMdUJ1ixSD77bzeUOC+EiQpWSP3THuuhyN/s9L8XVonQat+AehvM2njLY/aa6Halc/8sY8NjUM8c1LH0pdhdDV6inN8EJO8cvUHJQIbAluZXTYK/GLvxb93Sh4seSdcQfBELs0sdKSUinj/DzTO7JRAfXQEK6jDTi0DmcYqu5cQ9fr8l3EpFF8ypb4ZQVz46IfIjfFzp9xhRn5ivT+vwwEpJEgl9txItglcMwhJoz8dzXQ2d4rrBWgwDDivUzXTuV4ov/Nn4NlksjAGUldr0NtzdEFLDMSjyUiErAEz/VFWY3iieSc+vaoKfHPy6tQ/pRe/8YqrZHaA+KLER4l+cokr9Gw+zeC3nWnL4K+MxM5J+CDAviVv6j81+OjG0O1vTe7J9gXAgP1ToPWwXpKDygRTdqfivDlG16+FvRjPjE5LVAdsSDIVq0vL2mGiwkODolQ0BeqnUFZ5SGuO57MdGEBs82ghH6vUtQe446dbuYOMGNXM8KLf3LA3gTRyBPTMPon3UYI5IXQFp+N8mv+71sCvWio8wlPovWdLhm37gx264rLfcXdLDkuhp4+DVVX7wht/dRnyDK2rXb72DSy+CMhHvoKFQcHl4mYYPwE5LRekauKcLrPiwPnTNkuxwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GjXXRNch6NogssH7CtcilioHUglqwKHoRrKGsF2TWnptA9o8wErLs1dQk82/?=
 =?us-ascii?Q?xuj/OwhZXEywzBY36VLd/Udt3H9maCnpups3Xj8XP/ea+T6Zm3hkR7XG0uzy?=
 =?us-ascii?Q?eFbsYKY3EevOwSrF0ZwWsdpFNRio6zvtg8W77Gv4ULTx0fqwqK2x1NPGjcQp?=
 =?us-ascii?Q?UUGWhb5dC1UjfbsYF+Xo85Ps37xYEJbi1UO3TNzA0auVuEi/3EWivs/c8+Dq?=
 =?us-ascii?Q?eF/ji5NG0NUsutaoE9akpOv0LY6Qp8mryCFFo23oatTdFwnOC9zdLIab7IXw?=
 =?us-ascii?Q?KiFmFuIxAkCFhA5tccTU2hS8IKmK4cpg+BdfiMbsLtaJf65XLaxCE3H452KU?=
 =?us-ascii?Q?vRtiwM2kRyob2KV+X607j97b2JsQN3ipMqVe8waSfP3szQr5MD+wTvIVclBf?=
 =?us-ascii?Q?yWvvbGWPZit45DFprCwplA4OFlO726ziN03esmHqoqZVCdLfRP3cBMMMo5kP?=
 =?us-ascii?Q?qDJtl/Xte3N4QlRHzjKR+5CFtL3dNBSauCNBHPMVaBvCbl65GIJXzcdOUWeg?=
 =?us-ascii?Q?+Q4hGpvX0UC92cYz7qI5zctsXnHZT8kwQdIIl0Q4vcETNAxaMZvJnxoGpe9k?=
 =?us-ascii?Q?IvuWWAoddLE5UBDTQqhCTPjREAkUw4xPIqFDvGfKMGzRaMQQFpgrLrG9p7/N?=
 =?us-ascii?Q?d6ZX+wMxfHIC9X3V9nzzVWyausv2kumM5pMDW72XIPv8Jn4+8W1kx+SfumKt?=
 =?us-ascii?Q?F3vN4TeXuHK0Zq48R52s9DDQ4rbaT7YBLPNROnafE/xDKS21FBivMCISy+CK?=
 =?us-ascii?Q?qv3rJkPx+WXaXFtNt2mgVs+/N2MLMCh0ylniMuBgu2Ll6yrPaJqzqF3a+cpC?=
 =?us-ascii?Q?wBtfBzX07fKtSNDhR8qm9go18s76KbyY0uUqMBp7ViFNInMZt+dWVVXZkIDj?=
 =?us-ascii?Q?9McgMeCvObtLVqLIKFNh+eILnP7thcPB6y56IKnwOrQ2ftwBX7y//60kLKx9?=
 =?us-ascii?Q?rbyExBLmrkIT4ddDenN97wC+pQnNG1adDZdFewufK5qwr3JfgQdt68zqj9qH?=
 =?us-ascii?Q?pIsxmjtJWJz9eYfPJX04PSuj2GHyM6nGHH/uh8hL2QgMNoiNiiDsJu4lptUu?=
 =?us-ascii?Q?TC6nbJUiLbyOwFFr0kuEYzFbP+Yd7NeZKAl+T5uFMXpPK+LISsOF3elx4DLF?=
 =?us-ascii?Q?ikns89mHdTeKPJtRM1YIgMUF8fSYeCEYxfHVRjgEXwc5NDwHvMuzbQgWpwAl?=
 =?us-ascii?Q?fGKljNNzVLcyHHVwojhl4TfwdHpKDOV9ZNaXG4MM9IC9KN3obq+6LUwecID/?=
 =?us-ascii?Q?IOvuii/mRaeDQKGXdk3AAIdCdpnJmBeaF3r7Oss7tVcPsQh5BOOcInfsG05i?=
 =?us-ascii?Q?dxPWNj+bMy6Dcc2kWiAAnnhdVYGrA/F/C+qdGDmCu+vrNStg9GQuVrh1fSuw?=
 =?us-ascii?Q?foM8pLOUaLQzuuERBs3V8Ad487HZ7PAsM47olrQ5X6U6mpExHN3+VSfOWUWl?=
 =?us-ascii?Q?kWd0vQ5C5i6tHmC2RTNv9Zj9PecP8J3Hak0PvRY7Ww8ubQW4fvGYDtS0TX+b?=
 =?us-ascii?Q?rmHhCJFTVmbxl4LXMAD1Q3qBU0MSr+ZCoQqi0SsCEpQ+hxJytFQro+cn58hz?=
 =?us-ascii?Q?ydw8T3PyE/5pzZck9JFgd9aXUNpa3Vu1Dazp4sqBJ+5Y6hDz82pQS882pfg/?=
 =?us-ascii?Q?We4ywYzv+ym57rmnJdBce+rzOGsV5QMFrV6ivO1vCCad/ODtK2+f9fUCXARn?=
 =?us-ascii?Q?QLwJVDzXZfXT1YR2PzZK4bPk+soSP5JThXp5Vpu9zdorVdYEtSZ87m7X5IuQ?=
 =?us-ascii?Q?+NY+M8WZoDdGbUXiDdLCIo4rCqXon+bzQ9sZW0/sK4cX4NL6YaDd?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc0e629-4d15-4be7-afe3-08def1c13897
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:11.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAr9AsuUYxZ6xHRN1EwAGOWDBKw4hEjlsWR6MTDaJZcdcw+WiOKO8aK+/ZHoHrOlBjgUVU03JAYGYxl3efeynkfQoAHIgwt4QQKiLrTsA+NFde/yGkKy/+X82rkHxP9G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lm49453.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index 6e2e292d143bb..991555bec712a 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1283,11 +1283,18 @@ static int lm49453_set_bias_level(struct snd_soc_component *component,
 #define LM49453_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 lm49453_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops lm49453_headset_dai_ops = {
 	.hw_params	= lm49453_hw_params,
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_hp_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1296,6 +1303,8 @@ static const struct snd_soc_dai_ops lm49453_speaker_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ls_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1304,6 +1313,8 @@ static const struct snd_soc_dai_ops lm49453_haptic_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ha_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1312,6 +1323,8 @@ static const struct snd_soc_dai_ops lm49453_ep_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_ep_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1320,6 +1333,8 @@ static const struct snd_soc_dai_ops lm49453_lineout_dai_ops = {
 	.set_sysclk	= lm49453_set_dai_sysclk,
 	.set_fmt	= lm49453_set_dai_fmt,
 	.mute_stream	= lm49453_lo_mute,
+	.auto_selectable_formats	= &lm49453_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.53.0

