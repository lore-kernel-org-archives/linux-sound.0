Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBE820297C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821078; cv=fail; b=qN+z6AOPQgYe3gSk9tjk8aSDzw9rdK8pAMZpAmfLQINvTtm3MTQwphj4R5Wyfde01ljyTOma+PYj6EFN6ISKqkk/9MXert5q0a1XagUWc5gHxJYmLaxjRmOQEZuNW3QyJk/p+Fdjk4Cz6DDh9G+qkVL0uWVQgBOgODVkpe54Dtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821078; c=relaxed/simple;
	bh=TmUNgn6m5vZh/6MZLtLKrz1LUpi8U9C5ymANbdPEOqY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WRxGs3S3PXJKCNGokiQEjYm/5vfGyk7iyRzFwN9zcjPbmo1nO8Yiz0DUPDKGryF3HtvWxu268G8OTnfEJTi+ytORzVT03PQF08Jwd9LrZPhQRjaruCzZt0wFzOyURsZfF0vvbxlJng+HEBGwrJ1OCoGGUlgMiP1dVdORgU2Rric=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AlNxhpUY; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AlNxhpUY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exznSxxnfpxqsqTFqSlSRyUPJHZFUZP2rfplLf2cUVoeQIlu6PtIpxImuaMW12huXWidAQ4iQsLe37TNMVKGeENnlgPDz0BBEggweVWY7dDGWFISXaJeAz7UnN9umCl3GcGAK2Op4iFi93okvjnTbkHXZYSLc2r1G8MQ33pp8fn2ivDXtpMIZyaJAHrkNcUadZEsZcbaAqUlaNaaLizDUTsz3x5YF6Mb3WnxY9XYEDYrtqpsZrf+xD3Y/tVWE8+XUcVwe6VTNjhAwqNIgJx/E/TAYOnbKcNc97m64AAF+rK12/VpUUxe5RRg3FBcC3L7krestlQbfP0gZ9uocBe9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWXAcETn/CxMd2VmUIZmtHUsP6cwc0UI8mK5FhIijLw=;
 b=GySTrCjZFGxaRckRDp03FA0QlR83IZhvnswBiA/0cJxS/KTpicN4xifVlAdi19m+Hwdv7OPDcOH6AgArt3wcSfEmAUdhqpZfFmCx23BS7SLbMqDl58ktlJrP/q/cMF3Ud2PGKo/YR8RZszZnCnw2nDk1DBwCNjSJkwJRMlTo+OXJ9iu58Y912zhSgspB+PHJtOMLLTsVVAlWaWJrPE2oQhP8ewTkypkrPDGua3Tlhhjt49opJ4J4zs4n2NxGCDDY3xkgt3krP0dcl+fAJIMg5cnbWHoVuRzU0l60wMxBCa3W1kGDwamj00IYKGwCpMCKj7M4Y6T+vImJ5/VgMmx3Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWXAcETn/CxMd2VmUIZmtHUsP6cwc0UI8mK5FhIijLw=;
 b=AlNxhpUYBWHC3yAHIdey+plZh9DJytGv3pD6ddd+JP8D0V4AWF8lsM+mkXaM/6NcXEXa1JnmdCB779Obwd3vqJHztieDusdM2O4urtt8RLcbc+y4dH35+OWdbUN5Iwrza/DjMrm1+pypM3r30HiBh9UKQ9dpej0LxGGGTcHvqY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:31:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:15 +0000
Message-ID: <87a50txve5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 201/292] ASoC: intel: avs: nau8825: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:14 +0000
X-ClientProxiedBy: TYCP301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: f91644c3-1274-4bfe-0c1f-08de20b99f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WZg2RsTrcK2Jzj7fVqeqEK9FtDuvyX7VTbPLFry+gU582XxHXN2svLP91IuA?=
 =?us-ascii?Q?NfyDF98+Ly26ocuu+gQWFlgL4AQZOfGhXpwNtLzxCBgHcJp0xREcNzW1Momm?=
 =?us-ascii?Q?3SAe2WFRjXmEWLFUT+vKPP1ND9qXJuDVLSlPFCBl96VO3tOZbGe4x8Gpo72d?=
 =?us-ascii?Q?mktyngorWFNCX4APIU5z00chiyobrsqJ8IJU01A5uiM8cGfEoQiJl8HzxW90?=
 =?us-ascii?Q?0kXweRc/r547RMKIUe46z0qbkEU8h2MysWjBG+noY5Z/qktyuf4vBTifbFC3?=
 =?us-ascii?Q?KSNFiu8LLVKYEsn1xEJzYQn72WbwZdEzfTjjxB7t056aYafYGzbdBYgLfTE+?=
 =?us-ascii?Q?D3DH7YTDtc4Lta7kUdnInCoLfQixKtwBzWxTts8xdEScCbY+6hoZxUKHRAh1?=
 =?us-ascii?Q?XDmYoTNsDb4jzA2etvqljDT4Y+5guENyYUK/il+FiM1gZXnQqh0FKevJSl1K?=
 =?us-ascii?Q?NhlrMRR6imA6QZvGU0EWLnCiI3WsAL5Wrc0z53Fz3dWkGUV3Ej7SdtkS/WSH?=
 =?us-ascii?Q?w89DLN8T7xXoxzBlCXxrRbS3lvLdq344Lf7eYHyuPZvU6l4or+mmYnumX8x5?=
 =?us-ascii?Q?HNuzuWb2XxkYT0MYtIu5oTQkCJsqz/BkrgZeUsF3Jz6efst28bnUNf3vEdze?=
 =?us-ascii?Q?r7dKQsy+W+e1Wc6JwAJdhd9hW8OI7RpdO12wK9Tk2TDqxiYBJvUP9KMv97dL?=
 =?us-ascii?Q?WDhWXfHqHnbXjN+luQIeezMIghUOev9KGE/rRlAChpCNzJAgqsnpFXIlHoZb?=
 =?us-ascii?Q?HcD5Pw2v/EkEmTfTXGrXVMGv6JUuNNQWmXPSp3mBcAuF2c6BztL1U9A0LSe7?=
 =?us-ascii?Q?/cRIsTR+7V3l7IC/zfyT9sb0AtXCfI079nP6d9Q8/AAzl0320jPWS9L5Nwz7?=
 =?us-ascii?Q?alYM5dYKR8r7dOANclf5okF1KRzR7BHVg7Wjq0fHUqVBu9dSE79OEExQbCAX?=
 =?us-ascii?Q?ZH2LUH3Ht56dItUj0I6zrzyP5F6bviXZYBXcJrXPwhTgxOqKKP/1PQf9DjVI?=
 =?us-ascii?Q?ZrZiBGUFBLDBgX9ejrh6C6kQoojFvik8qw1DfLnY0HlMqojGMb5vPLO5gmUq?=
 =?us-ascii?Q?RZ90BloALoGsHOnWDT7gtuLvro5tFMNcrJ1RbOjrFFglLaNUixAdUt9Me6tD?=
 =?us-ascii?Q?DQntY7RJi3HZ5Y3qvIlXpruy0e0a61DPrqxFsO+Nv99PamXckSnceWb77b/g?=
 =?us-ascii?Q?P+C3jAu48nz+emojknVTzpdCm0XDL4etAggP3ASJ74m//fEs1ONWrmF+vEO2?=
 =?us-ascii?Q?y1YnLPBfl6WfVm96/9ozreAYjVPOyOg1AoSYq3f/a9/kcBC4dDwUcfOcHqOX?=
 =?us-ascii?Q?IEUiWb/MddbwSge0E3rADQyZ/Y92mQAL1/vn5NAEmI1bAkG+hU4gXOV1jeec?=
 =?us-ascii?Q?QFyrL9UL+Ct16YypzyuAL9sMVLIj9KW4mumqjvpY0wOOOtgTAA4hIojsYZJu?=
 =?us-ascii?Q?zYmd7ST1iUyRryW9xTYKT/3oq7VUJ6hJmuAS8E9miXSKb6hQ8qti/hxxhKh5?=
 =?us-ascii?Q?hIdfJ7bhiWH8ZiLt5mVe9XfU+OtPxnkBq9qB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8DM+sNH9KAEbWaB+1FdTUA3WaGBBjTWgXLRe8xgL1RfcXxq6to+XDBvlb6XI?=
 =?us-ascii?Q?UJlEjFVO5JxjbxAbchB1jgeufUdVeT8N5MWHtsgF291AcaqUthZUddwKB6Kz?=
 =?us-ascii?Q?GDLVFajgahrtVgHV5axvdCPhZi5cp3Tf7ZLDTFqcyEzwym36mCYgeiT/uHTs?=
 =?us-ascii?Q?eLXW5MlwHVKYvmTfywKqYhYXmxhbBDojljjLhhRuf/CQGFvwSqdNPlEaxyZg?=
 =?us-ascii?Q?ZLBm5pR6hkzegBBi+5nNXl3LnyE2IY+bpcvIxt3o13yKlQL3Q1qGx+rlLWfw?=
 =?us-ascii?Q?Gm5H3+WjI7pd5JZkcr7WHW8iso0rB8fYZsuTFfeFN+zeWbiOXRWOmUiGrdZJ?=
 =?us-ascii?Q?CLB7Osyb3malBKYcSGIdMHW1oUaJYcw2BM1V6Xob81eSqRTHwYqxbo9JSFtP?=
 =?us-ascii?Q?q+ZkKBVF6/eY9OM3qdmNsG93mdvh8W1kAoVJNXYo+bmu1gVIn98jCUbFGRzU?=
 =?us-ascii?Q?Uj+KOxutUi9x8xicwOY071ZcBu3z2qEGYVzgCt7qONdu2ImzAxTvlDUlj4ux?=
 =?us-ascii?Q?SxIVimY7a60s9TN9m+Y8aJroXC30JUcyMUb8jWa/3vcc+zqW2jzvqV5FOlN/?=
 =?us-ascii?Q?UYQYVLLspOwbSVH7i4v+9hwbK8dukzvTPFFE8rtvxqVbBtxbHes/hk2S5hTu?=
 =?us-ascii?Q?S9xht7YG58Jk6j6TkhHIJydMm5S92F8xYZU58dHR55AhRf0Ro/+U3voB5joS?=
 =?us-ascii?Q?JRvqRPPXOKzXFcbMZ+YzkdD+ZvjlYcV/NahjQYuAXlkagBaW/Rz/HnzM4jjc?=
 =?us-ascii?Q?+pey1NGLCfXVoSslX4Vl6kEy6yl3xDjawinzcjVbkoI9ICvOPt+mJlHxmcKS?=
 =?us-ascii?Q?l7sP5hYCVll12nLRBmK2CawBNgCuOg4PJimS4FhHx7qBQ07PxYR5/pYhUqd8?=
 =?us-ascii?Q?9sIpMNqkh+cMMBC2FiKjr4pyvQDbfFvP1t2myIqse/qjsl5cFLvRZ3dF8/lA?=
 =?us-ascii?Q?erY1b+G/f2eYy+9a8hHdkpc23BNbGM0P/xqdtDa4h++2XDxFJkYta3YuNg2Q?=
 =?us-ascii?Q?7TF9te7y1hMMPTQpx9BHyLQl+p2Rpw8pr+9I9F5JXSJP1jzZXS6czIt/H6ZB?=
 =?us-ascii?Q?2mi7WUSJ2o8QkG2e93bSmllmhFvimLKU0HdDspntcdRIKsCQgiCZKmRqlJJE?=
 =?us-ascii?Q?Or8JewVvQomUGU974CecAnjsRGlxMMKYmrKZxWoPcWwXYi2otKmZJCbEHk57?=
 =?us-ascii?Q?5nnOU83raujhFQ3zcw7uKJmf5YVUuMwg+dbOvj+k23pmGNWpaHCzTHzxebLU?=
 =?us-ascii?Q?qEexPDkyvivPBq7vE7VSaMUlFW9BegEN/6SWqt0rCcGXIU+0dsWuxCnNJeY4?=
 =?us-ascii?Q?suNR73tfaEPXawVPPV2V23hqvBlQJOUcuYkNYbydmKN4QRmtaodaueg2Qer1?=
 =?us-ascii?Q?/1tw/j010FTQCdN0/XtH3rY/oCspXxhQugLfHy2Erw4SPqQUPswCCZXP0emo?=
 =?us-ascii?Q?/nvLiSjJZoKbKt2jfubHDi2A+Oibj3ZUlSClA3xcG328RBLHJpuMBpEIIq+4?=
 =?us-ascii?Q?R2XWKGYMKkPcizVAUcjZ6jA7IL/GBJSu/TlRzxeIwrMGv0FNiwZYabpO8E3S?=
 =?us-ascii?Q?VmcgjTWHdDz82hr9BBoCCPMLezJJrHvXev82z8e0+BH11BYJ3+u1Q8vo/cKX?=
 =?us-ascii?Q?UpDJ+5RllSFpOqIOsRqqVQw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91644c3-1274-4bfe-0c1f-08de20b99f7e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:15.0932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzh5CydxNRjXr4coHFKl0T5LSzNHfFg6czK2m+P0LQLQOa+LFQe6MYFTLfTH70Vj3sJDxm43oVf4BrXCvteUL5iZFPDp+WQNk2/rS32sRL732zgKyAaKbdAvku81gAle
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/avs/boards/nau8825.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 9ca400a6412eb..d44edacbfc9aa 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -23,8 +23,7 @@
 static int
 avs_nau8825_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *control, int event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *codec_dai;
 	int ret;
 
-- 
2.43.0

