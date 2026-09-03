Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33C4CCDD6
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398090; cv=fail; b=ANswOcoj4H880witMkHMEJgDlDrUguYo28IDeOSas6H03lwwuHKuzEPWssaXWMZefE0/Cgyjst/EQsr4o8IxDbgB12n8tZQsKWEsuezG6a6n6oZvDvNJmyYfY8g2/4Wr+G2DYPwuIWst4aS8JnvyDjxfzEp/HFPeqEyn3i3hM9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398090; c=relaxed/simple;
	bh=m7k8YxvfVRqRY2gie401f6k1WLrNqCSMJY1pkPGWNQQ=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BZPXM3VKZEdyA9+yDKOBW8ISs4mWsQO8Geg7YhQjhKP8onAsGUalG5v1AfhCNNNn6u/nFPA4OURwy5PqtWuAlPcVb57t+KBSEkhItgT8Tz3q+bYx3A05Zfrh98S50XTqtVnq0aBOV6zu1zyexUdNQuyciXweiCp36RdPzer/Iow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gXrAT/uQ; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gXrAT/uQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dODBMhaRnwljKlnn+0NCtUmpLa9i+qUAHvSbuKBEciwq4N4XC6AcAltxcPHyKs1CkBR6ACOOtRSt5Ipk/V1BYP9oEx+uQqfWTG7r7HGwm9YKGNcgz05ZEH5M8+VjuB1pPsdvxLFbipo982B5wMMOTBlSpAcC7NjdJWl4ZvqKfzbknvZ9Lykm0NTYfGyrEjFfZl1UkN5y2nM56EA/qWYKZyOqT6kg685OgmtGcvMsvV7zHbp9bptkT7g4RnTNo2V7q7x7Bf/E354Eb91bWxhhiNBaGfdYKL72OC7HB24TX9A1b6e4XrXvTSV34JjG6r42KBp+KGgE2W7zB+9E8H7+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDu1TgpP9Ya3klzfLJCEQmQQP1e2osuYQKYMw/PrKDE=;
 b=UoY0wE4LFB+NYQjx0A3ED4GhnH6UJbjsrMWxVsHeD6gZPNcM4oAxtAIuiKSvEEtGBbUJChakbqLolMQnDf9Q3eFTT8Gr9S9NTftFWtlJjRF/yJKXttN9e35ukm5bYdyJkkv+XSoJX6dTTe6eyx+/XB9b7NSsaU9tu+p42p/0rFrqv7qajVrMuDNrS9JSbCAQ5lzBY99FNXRro2es2LA9hlaaVlJWuGzIfnISXRubu+bGIHboTXau7/eNfWWZ+cnCarvXpPg8QEPLc4Th6OVA34rEPr7TEbNbdKLYG9L3o1vF2T9NFSpmbhFIDus7Q+U2OoTO/GMIevfoxOG+t7xIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDu1TgpP9Ya3klzfLJCEQmQQP1e2osuYQKYMw/PrKDE=;
 b=gXrAT/uQrtsKfhK+ABtKwc/eXZ2slSJxx5FCC4mv/wudvAAv1k8t2MViGFp9bq6stl3T3xyWat6er9t/tVfenGeP+Wl/X8oXX1sdsMIBLjdpKNuN6XEFffpm3QFykGUyqdXWN1yQFDLZ8MxmD2YBAcGFem1jqgNEg7o5f11Ggjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TYWPR01MB7169.jpnprd01.prod.outlook.com
 (2603:1096:400:c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:46 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:46 +0000
Message-ID: <875x0nyw3d.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 21/21] ASoC: xtensa: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:46 +0000
X-ClientProxiedBy: TY4P286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::6) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TYWPR01MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf30373-ac5c-4f8a-4965-08df0958be65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	J9BW6WFbkSj0WUuDIOFHzK6GA66gfAoh/M0K4VPdwrp4sUs/p8sJl9oJFzT873i3xThxuess4fARRVRBBGQlc+u/mfzcc4P8Is/ywbluhFaiRcJRKISKytgaua8/T8N7hpuh6Vwtkqe+Xkv44oWYZc/oqeFZfFov5QOSFegFsR9PKRjJJfyTrJAbZ5Sgitt1lpTjUa99Cg2x6k67DhzVKio/qzfZZP7fuWKTk+EVPcBi5MkkAR1Ei29g05HPMlCJpxOnhlVt6eOSkHWkA/LF5+V7kOXYLtqSlN3s0LbpxvDtuxNP6/1gXcFMirE5O8obFfRS5VzNw5PkZ1fGE3QbIOVfkwEOa/MJLj8xD0rc0mP3zVkYDvAXoYlVHGYrzd1SqvdXkhWG/8pTzoz662DgmtjypIkVA8K3+QCb2yNXZ1D1+aPu2xKdGn3vP4OEQP8zc7zNFjSk8QVliEi62lTxi2jygWDUXVUz9OcqmKqEeZmo2LglHMDjc0VlEQ7Ztqu8whNevlMtzKLl9mARZizUM5SnlOzNRrPcc8Pd6Bw9lL0l0jiVy+YLov6dYbFUQXspnBvMKrcXQAfig1asdFG4krmu69NXzxr7PYuSy2bBWoOT2rKcLIXJNyDnaZsuo2DEdxDRPfUrPxjzRk9lXjtRZVlGdaYJu4tcYA1mrAGpIvfi4471CSTejy2WQzyKPRpML+zHub4YWGvoDEXHqUPPTgy+rP8KCBcJz9OARsNF+x8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O7RpWacWYHumYTe/4YpUcikY6cG8HnYATxKAYFtPkhMn7k+RMh0DJm/XWq7d?=
 =?us-ascii?Q?Eadfeh0yXIPStV/OAGW5sX0Nxni2PtoYPk9jc06ak7L2Y8y7qWK5Hdx5K5of?=
 =?us-ascii?Q?ZOHO+rhJdoMHxmjj2tUcxPXJKZRBfptUGccfCRuJ2rVFNkaB93VTM/vPmP+h?=
 =?us-ascii?Q?GXaeK9l9IfI1NcaCY+OIKpbHBIUfnV20k9nacaapBUg2JrnaXXjtxrIHyQ3p?=
 =?us-ascii?Q?3jPqLRkbGx3EL5BENKjUQsg+3sVrzLcm1L12sb6T2xMRdHlLoEzYzR5tWwQe?=
 =?us-ascii?Q?lFMZZXR4748zXI/BCWuHb6cVbeKqktD8TmtcrcI1WVLHReMGWBY07ZKgvj93?=
 =?us-ascii?Q?IWGzhvK9dU9kN1KQKNgXMH3lFuDKP2ihAH0ICEPKPMR9YXQqfMOT8s5h00QO?=
 =?us-ascii?Q?x2Jj9pQ2tyz6cwtRt0fBG175v2Gr50tOP3b4x9tRnjAwArr6k+6+L/nzNyxC?=
 =?us-ascii?Q?/VPVaUkM74IWXGeUvZp//h/PesS4va1mjUzST0x76Tljl+tNyKUm2GpdqFM9?=
 =?us-ascii?Q?ZUInKl/wqn6swVx/tZ4GriE43DTH7p4h06Okd+iEdSqtNaOi5utiWbpp+nuo?=
 =?us-ascii?Q?Xwnq8wMuyEPWkT0P0j9d78s36Avvh9k2SKlNUP3q5fa57wo41vv3Y+7dtS4F?=
 =?us-ascii?Q?Kz55ukiCZkihJdoyjiz2w7MzBAyc072ZS+8z2Is09Gmvj/GnbpCYa7FMblfN?=
 =?us-ascii?Q?VOrvMYWJkE82K0ihdUaREJvGBtld0fhop0AunjAWCJifH5JextPeTg98Ao7s?=
 =?us-ascii?Q?BIoUP4HhdWcl4BgPWTVutx38IfiHAR/pXxGAJFwzLeedqMQb7Fl8y9h9MF/V?=
 =?us-ascii?Q?a8VdOA1jwovRzVTOxJQWRIy9qXb+5+0sDj5gGrsoPwHvbau/rqVGf7skd658?=
 =?us-ascii?Q?1jhMhzc/viN+/275ax6APXCqdnPp0x6fzCPhAyVzFqHDmYs/G6CuELMur/Pq?=
 =?us-ascii?Q?D4QnGAUKyKO4+kggrFOlQoh1gxG2TnuyZKOP9xfPKkkA8Jc/W5NdK13vB4XV?=
 =?us-ascii?Q?qUO1nfkQJvF9eDGTP9TcCMS3+7iRVdfNnikw6w5ows2LhDmP4jSFk5tifjGY?=
 =?us-ascii?Q?8/gRt7sHGmL+E+Dlf2jK5HdpOBksCgOjl6ApGMj6JnmMAVP+0BSUH6VN8OOW?=
 =?us-ascii?Q?lc5feaLClKUB43er2UWYidEGE50yEjRidmPPeRb3UzkaE8GedKYnX7dOrKI+?=
 =?us-ascii?Q?Ufb0hr0Bg1UrH+jEvQTHVDYdfACWUpyCp9joXENsWuPqmYMDvalGSUA02hY6?=
 =?us-ascii?Q?MZagPWzA4WIH4UmRE+oDM99QVLYk3FM4HcVyBBlnc+WzkqCa9vxwvq2hp5SS?=
 =?us-ascii?Q?KFY/DpsubRNWwxQs/XteQFALCjwp60QZtLNtrvtfUP2vg7nIxbclrB/1aaOS?=
 =?us-ascii?Q?DX4qRZWKWYvQZgN89dtqD9LjnqHG7yKzi/V50Q0pXYh6hOkOikFobmitssoX?=
 =?us-ascii?Q?nRrpmNkEWEbi3PsGHLxhkzfdz2SfyW8fy9g3HVDm+PmX4T744t9dZO2gGdnb?=
 =?us-ascii?Q?oNKPG5KDSL8BKli803nWpRFX4aCzSYu4lF60RMvN6BiKphYpEl5U08kaqyjC?=
 =?us-ascii?Q?htHhsiV+LJ6nYlIRz39w8ZmekDSiSpEoIpel9L7SmG5sT+UgbLz4HW6O34ZM?=
 =?us-ascii?Q?ixI4t2TNx2BzcLQGNlydj11Lrdvext03wVI0LXffpM1CfCm66/YclM7bFBdL?=
 =?us-ascii?Q?q0cL1KqDRIzMLbjHGY2ECB4Easkuo3jvMIGUwSPVtV3AnMyRrynjXtoHXRdb?=
 =?us-ascii?Q?8uCuVoqS9cJISPgoue/W6FaX9tOJDoRchYPWZxR11PZkLW0Z6Lf9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf30373-ac5c-4f8a-4965-08df0958be65
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:46.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYPdS9emZXr56yz6bfrZ5JAaH2iI83o/hphmMA2AgQw0XcJuG8/kh3P0sApLmRWs3xBaKTne7Bh7mWHuzILp9xQqbzYpPDpzb4oPJvlmjSasl4MJnzQBQRYfTYezLZtu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7169

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/xtensa/xtfpga-i2s.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index fd0990201b40c..e5e8b72fd817a 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -485,10 +485,16 @@ static const struct snd_soc_component_driver xtfpga_i2s_component = {
 	.legacy_dai_naming	= 1,
 };
 
+static const u64 xtfpga_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops xtfpga_i2s_dai_ops = {
-	.startup	= xtfpga_i2s_startup,
-	.hw_params      = xtfpga_i2s_hw_params,
-	.set_fmt	= xtfpga_i2s_set_fmt,
+	.startup			= xtfpga_i2s_startup,
+	.hw_params			= xtfpga_i2s_hw_params,
+	.set_fmt			= xtfpga_i2s_set_fmt,
+	.auto_selectable_formats	= &xtfpga_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver xtfpga_i2s_dai[] = {
-- 
2.53.0

