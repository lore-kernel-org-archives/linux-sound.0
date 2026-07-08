Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA337B036
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 06:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493317; cv=fail; b=GJs9DISCIWdX2veYIxcedhNbwMIJLS3P00RtudWezVD3k8mM5/gYPEWzArhY1YXvJYJnTuwF8e+wscPdDK3+2vWgOVNBtifhqQ3wxmfHTuW/RNyeOEtngHE9L31eAZiei1K0w7X/PqCi4OQARtS84UK/ZZZfKLezKBstWlM0KXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493317; c=relaxed/simple;
	bh=VIn3MHfhjGUcVm04yMv4Lhv+MypU2ERdO2Q/3iD/ORU=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=VSndXN/qrQiFsug33pRKuGyTPKyRr59avCV3VlZg6dSlKgGwUAMilEDDtrhT4ypAIM5k3KiWkullEEyKwBbIgxgv33eDLUhZGw263zR9zJ7SXbFTS612E4vAoQmREWpn3DHkhiSssj+8+PzUe2ewtGL5fLvOAQpwvZPb7or/8qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ASnHGPCA; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ASnHGPCA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKDmcxgDUxXX6H2E2xaGbecSqM+CGrFi/5qeyycst1ToS3fvKcUWHIpu0MvATu93XXvvQOC0RUASO5p16HaVmYfojkklCTPbGOlP1oPdy+BIRrH9kK6NwK5bCzlTrK16KwsQZos2J3vuzq+NTRrufMws2nfSoJ1LESdkfOyxiRwCMnSXp2Hucn4r9sy117Y0LDmsHHMOi1/RuGwXc1K12GlP+hHiHSYgKEoR8TcuThf7v6ogiDR7lYDHGT2iQhwNkBQdK4uKQ18nDNA1T9/V5cUvTYmYc+QG9Kio2da1GJZKlCBL0cNb9ME+6OfwnvzTrDMQvz/PyHWnGlu/fJJ4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtElm+x09VYeFlsXIOCrGwbhdK2Jfz4iNoR/MQtHJvA=;
 b=zU76GKAV6adIi3Agm0yYohi23qaist7njBRuXKtebDRXnnbIPe68e0wbaBZxNoStDg9pa7cBh0pi+hWWQAjXxRUaLC6DLaQmT2pW0UvhJivVYHdCt+GbSx/HwqJE0TcBgQly0T75Rgxdlg//tEuWMcaJs1dr9oMvZ5nTgi4TRNeRYSi1rRdvvdDGK3tk+ed7GI/imcBScvNX5w/HPTAU/ZOssDsLrWp8wHzLRDTR7u3QINAErWEUNmUFh0Z9wuWIHMmZsbiLXPIe0Or7Fkgo5hI72LMlYMAApExoSMKxEkDY8/kChLXReSs8iqWbKe7tzuF5utEeeRmwrKD/4qeiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtElm+x09VYeFlsXIOCrGwbhdK2Jfz4iNoR/MQtHJvA=;
 b=ASnHGPCATDsvlAWH33wggXjLqX4ONfj+7Q08pSVEGLLysdQPjCz/COJJ9Fz0GcTfcpSRZ8e24AqaAqEcNv32v3s4yVFMImU9QGgdWCzWa0CDqyKDYTpJRoeVVye0tuwKnTEn9+1Ci/7NjA7ZLVGrc5NAqRe9XI0JjBCSPHVxa+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSRPR01MB11676.jpnprd01.prod.outlook.com (2603:1096:604:233::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 06:48:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 06:48:27 +0000
Message-ID: <874iiageo4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp6x-mach: tidyup strange alignment
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Jul 2026 06:48:27 +0000
X-ClientProxiedBy: TY4P301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSRPR01MB11676:EE_
X-MS-Office365-Filtering-Correlation-Id: daf9e9bc-e911-4495-1613-08dedcbcea45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|38350700014|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bVcvMsoN5nfFy3pVEHLTLXJs63Sdo3zjnx0+l4x1VfpjR/uhHd/BXMJjTVJGOWFw42n9QIqDo7UzdYzdYak1wL91bj3tevCKIJ4TXo4/kRE2WmM+AkGqkbKdidrbz0d4AAXy/c+bVLSaS0BhVwDg+CA+BuBfzItMZRD2CFjN7MJNoPEs1TLOuDtOld2S0Lwy0HMMU4UxerGNKd9t/9d2jfeo/Tx0G+J7w1v70KZJv5jPYZ6LGgDitXuPpOg6RUpqRAL1L22XZdEkPkJD02PWrLNL9LO64NaRrZZTWpTXqUXuJ2M06SWl83wv9ngk9a6seHzCNiHVqU+Apb0MjF/FrlWlwsPqv/Wr3CD/1rD4Ee9ol50O10mNqWivFpfgb98hqzRZZNFla7RPF2KJ1n2rRAqI3B+nrnAbsrV1qvfhzKTaqy5T1ODEmkn74zBh/AubMSFQxw8EjefHAq2L/GIKQBhyWtQAq/vv1xrtW++0DlL2uWq2Z2szOwMmh/aoHcHLUnK6+f4KoB7SII14RO0G4jqsljL0aC4IyfGUpfv2ET5OvbT9WeMe50cuUVcU+Rh4yqGpSt8p+SvPBpspL5hgGbv7APkS/tOBEuLgKj5S8/9FIZhbi2kofgSdoUR5NhpxacSOQZeN9gWj+Hj/7FTuDw8oE0NzDkheYBQ715VqRchtPvyBSvOh3OGpiACB1MsCO5ghtyNTzqp0y0Tn6LJAB/vJDzGzb9d+F974b5rVMk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(38350700014)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Nldc4Em9b0M8Ki+SUFqciWaBgoocFNneNz053z+01bJUluxpcKMmgHTHmpj?=
 =?us-ascii?Q?d+vBxYsx6kct/eNaaKXl2Knd3eZ3rwer9dXCWvocTIBomOzvNg+U142f1LHQ?=
 =?us-ascii?Q?Cw5iY4g4ElM9kkHE0XoDJ/LYPq36cvOS4mgfjph+o5/sMXEwTqvn6VPA58lP?=
 =?us-ascii?Q?xHPnCxGKaiIJFIY0YK63Jt4F+kdaZKfLBBgKYlF/LQo147ddt8QrxNhEEnzN?=
 =?us-ascii?Q?wp7AELi9l4gI/BS6B+Lk7CzL6ILutVsN8zykrnSMA3mJwSUycXpisRdb4GBl?=
 =?us-ascii?Q?4mVNQYe9IAkUG2cJmu02bhGzJEYX7pDoveuqajYA1fY5BKk3ba160eR74ZX9?=
 =?us-ascii?Q?cZ3AwiIjPYev61y8nstwOgap+pHEvouYt6F++W5DsmgB0i44bE8L9Y7iDx42?=
 =?us-ascii?Q?0//axYzVm4K/NgDgYHwIKf4Hb7j1t83wQalkBaFXkDH+H93QqHnUDj3//MW4?=
 =?us-ascii?Q?RAtL5Nqkvd2lc+sMUh2jCE1GDgSTv1QFf+bTwVVTUyFO+FYPucsPaKs6Xnag?=
 =?us-ascii?Q?sCgY0dJ2Sm6s2sk85yUxDlqlqtQFoMhmxiq6q479zC/6RxwGfrn+SSiKM9P/?=
 =?us-ascii?Q?/q1MOhYFnI9lP8puSNxXYeDNgXzXOXsZhB1ienuDX9nb5HCTeGhLnX7hpS53?=
 =?us-ascii?Q?uGx7ELZyCjKKy9TvEYEpVIGrnvm5IXJ2bw/WEXKbn3i16LS1pG3oqIHShjtr?=
 =?us-ascii?Q?5Z5Ei3eETnvMSEsjWaCXYnfdr4c+IcriC/Jv+muqmbTXG7l4ra2PMCIbVGRo?=
 =?us-ascii?Q?PFsm5WX7N1+WffgXw1OKmoLHgSH3CNY54D4b2sH+9/ikwd2+8LiLNMPMWcVs?=
 =?us-ascii?Q?92Jsd0pUrEu/5l9+sDeVNXTNwLvkcBH87sJurRX83eCPzW4JL2EbYMo5g+Gb?=
 =?us-ascii?Q?kYLiXqrXn6DFSoi0kxrXM0mhG/E7G7DiSjVyw3Hd3CgPkWvzK6CL4rbQo65r?=
 =?us-ascii?Q?Yz+9wQvRdEA7UtdgpxruKKhNOqddxg9VlZdpC4GlRgCGzynJ4RU6XXeGE3SF?=
 =?us-ascii?Q?UpoxscjjOqfVwITJMiyKb81BylcFSdYFV6mwK3IWva3wqVbZ8JipRO73gIMe?=
 =?us-ascii?Q?TzdPZqEZfhqoFVusA5Z8ZcqWjKR/h8AbNvqqQtlklHkF42s57Ga3PjnyikbT?=
 =?us-ascii?Q?EEtIOUhQXnnadmk6a2ly7P4RWQy9Nn9JkdlP9KCWzzX4TzRkVJk5MvlEO7XN?=
 =?us-ascii?Q?gYeVpQL4vIFuYpMQE38hfsZrKPQZRV+Vr7Sg92MhaIk6BXtN5e2gCRz5hEEK?=
 =?us-ascii?Q?9gCJHBUVI1Iu7+l08rOQDPXP7Jm0atGfcWoiFnf2sz1O3avcWVroBYnqpvpn?=
 =?us-ascii?Q?p1Qkrc8cVi/mfKKpXiP0HHzPxb2SHH6jRnyfaGESO2u9jOsGN/1inmxIlTme?=
 =?us-ascii?Q?m9UabD/jXuyiyO4aU0U85Q61SnIRQwBWiWmU2e0kEy+mkjc1qEfWQijf0xlR?=
 =?us-ascii?Q?3A+R0Puc8R0k21QoGmB2MHCxS5uZBYmiV1vb/fmjVWz+tp7mgt+GMuGsUjlw?=
 =?us-ascii?Q?lyrfhq8OycRNA/1P1vsxuHdnjSbKRIqkUdiUolzwPrKA+fnHbRboT1wb3dRD?=
 =?us-ascii?Q?FvrwksIcFQ/WbhZN+IQRwXG0Nr0hfnQk013yt9t5JnF/2IpLdLEmP6RGTIp8?=
 =?us-ascii?Q?TIWySLwVwkUz1dDQIyoL0OJEzXsLMEx+OBGpmDtvstAbgl9sLleJtIOqkBKh?=
 =?us-ascii?Q?wlYxBrYt8MBPET7zJBW0i8F0LKfTSjMRoDbBIvftUm/eot9liCwYckBpUp/J?=
 =?us-ascii?Q?4lCiNRAlIrTHlFGJei22IQnT3N9VnpY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf9e9bc-e911-4495-1613-08dedcbcea45
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 06:48:27.7096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN92gYDstv1CeoHH/jKM4C//OBjz4TOwVjjmpcogzN1z5tyCzcvvSk+YQjfxcMBCf4mkVXmlTCZOPjciYY98L2MNFpHMd3on5nLcHumKQ8DRTgaIzj/owSfGCS8wj12z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11676

yc_acp_quirk_table[] has strange alignment item.
Tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e8238788cab60..285ff3dce25e3 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -753,12 +753,12 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 		}
 	},
 	{
-			.driver_data = &acp6x_card,
-			.matches = {
-				DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
-				DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6501RR_M6501RR"),
-			}
-		},
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vivobook_ASUSLaptop M6501RR_M6501RR"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.53.0

