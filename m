Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD463803C5
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804140; cv=fail; b=epTk/eVWAEaof0RcZk9Ryy6fY+TKUvWQ0m0vEHugSdDVzYS+6ZPAJB1t3R91/Lumaic0JzyZzSezI7zewlC8LDtIt/lqyekjs7cS4ZJksJtnyV996SkdbZ74D2/PA4ZPlSSjed7I+MM5jOZgOoS4OI0kIvbtur9f8JdoUEUFE10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804140; c=relaxed/simple;
	bh=IUhitNq3abs4DqaxkzWcTKQsofm5uKbNPacugFHIY1o=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=O+f5RQelZZnUpqz92gV0od6B0eT/O8ROt8heC6VocxyQyrISxCsn3Zsko8P7mdsrq4gCCoMR8UnhKZ0mWc2I4jhVBmeckUbU91ZPR4n/Hs0x8BZSfo83WPB85av75yZ4SUmFg2NP/Sk7/JRp3bjd4FVhvblnQL3qdTiTy3qCsaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VXinmyA6; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VXinmyA6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgg9M8coOoJWDkJNCfbwFfyMlPJeJGRubJ3PHW/h7rhN65lhH1Fb9XIbycImiuPLgkRCGxZRVAW0ZdqYuO0utqf+hqzjQI86C58nPtCiEnFSdMsxylT7cbRwkTWcE2io2lHWj8oMYcdDjyYxzuQeYzylKqHvWFOw18LC2//auEtXu1B8F+5/9AqbHN4BDrOYfbPxRTiGbiuXge4CE/KJqlRU3oMBXHGThBB1E+gfLUSuWVfWW8HyOCaDUgx+tsNdAc7OSx7Hq55Qjo+h7wYaumTDgXnRAlaI5DiUnAdxw+OwvRtAEKX4i3PAL9NahNdAdM37BslIDnY4bNE2yoaGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnqfxIz+foBlH649AApyLa0odrnRbeo2BkM9EgMMUeY=;
 b=CXINUAkdvANIooBv487JhmNsB8yh1PC04HzOclvUmbqBYgY7/raBLyRmaXJV7WR4Q4nMs7bR5Z1RX/hfnjw8dI9sDhkvzqXUn3TtHEtVLnzME1HMb492ZxRHgkBC99ObFYDX5Vj3gha7zW0thDfXiLG3IY9s422x7Q+oIC15xlG1gLuBx+lFKfVlqySPy3DzZoYXwL5ydHyu9z3FRxtK6lHN7zdG1HVj0YDCsG6bB/83o3NKJd8EmTDx15Nufv8KMk6J/ClI81VOc9fo0rhoeXgZHcGLFJtdFs09QBQtTx/q36TcBH5qN/kcI3iLVYsnvRZbcSWBpV7ZLRgrjDXeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnqfxIz+foBlH649AApyLa0odrnRbeo2BkM9EgMMUeY=;
 b=VXinmyA6nZ/PP+pZG5kYJH6lzfOSD8KJiq2ViCkchNUOmPJ6PK6iCVOWzFFQ9mWHajBmmkenG0l+4leu2sWqpKZG0P65Bby5vbRimQrKPn98E5SQFumPo8Naq4XqIiItu6sKsqlHM0ood24jRkKJ6lK8VzH59ExOPDDZYGbgs/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB15651.jpnprd01.prod.outlook.com (2603:1096:405:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:16 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:16 +0000
Message-ID: <87ik5qwwbc.wl-kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 21/44] ASoC: codecs: lochnagar-sc: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:16 +0000
X-ClientProxiedBy: TY4P301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB15651:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa21751-a5b9-47bf-dc5f-08def1c13b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	qdBmIvvLoTQ6LqBOeb/41L+zl9LTPnCs6PK4s1ppYrUWvkwYraaILkhOc6/gaXogFnoA7UTm5j3HVgKCSF0kZyRWKmmndRzVMVA8f6Yt1OrRDIvRijXlqFgntN//0wulDI16WbDTKfpn7ENnKRA2gaDLQzzYGi8zbSr7zgxlnC8iKYhAz8aKv4uku+EsXeTDYBp9vUj1Ld4WrxqUzPovpb0+sgopc6Cfurbw2qE56U9l/GyIZNycPSJLYrUCZAgPFGutZSQSjOppSJy9Lp5II9aUKWCww4IBOgg8BTUQwe+4vlCEV/qztHnyyq+9owPUCfb9P34XfuHv/tZc2zX23Df3a9FgMSCipN9ZqhN0Qho58kNya8BZYwh4JhyuZMbimWRaS2/ZPwazwj5OGjBR0c3WLvAafs9Zzu1uZdmyomm0KYxKzAoHnNAfiVEz164EBjrsudhMC9BkuOfv03A/yMPQUrSkqaDqxR2zLYq2OKEpxVwkC7vU7JvGDa8eBJak63wcgC+Rz5mPk6UtSwf4wMv7wzHjlw57MyXPxiVWbCvL15y5STtoyGOrAhlNlAO9NnFifjVlhb3LekTDSNNLlPYHfVWw7IuvEXllBC8zqYXI42naxjSL8PPl2Kw/XERmgLr/EdYxgdP+rf9En8J0w1OmM6o4qtXvwYEbSnRpV7ZDYMXJgbFwbRnCT/5U+9uRSh8RdSa0C/T12CkFOUGtcSaqvDXNRp/EWrCjTt9Y6Kk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vuXCNsb3EUFyHOfU4SkaGFSBHfiCCu/KM2qEz3EuampLFxWhaRCNoESabO9O?=
 =?us-ascii?Q?DX3Xw4trDpv9bXCXv0pUo8byy8s4A3CpMIdlVdCgSk004rCfTvw848V+9BR6?=
 =?us-ascii?Q?8WlRo6QM4HH22U+vZAU78Ry2bf0OooGddi5C0bGa4Fh9/x0zboBFIUOMBtc7?=
 =?us-ascii?Q?igOddBB8tRKCS7eXQCM/FV4c6KXsD53BovX5DoG15stn+Ye5VTMYVDZnkwgj?=
 =?us-ascii?Q?F2zTZWXgVtx9zVbPKtkVrWrCZNWSVuJZcgP/tWl9IQYp6AJodP5cmYORf7J2?=
 =?us-ascii?Q?fIzx1qE0EJxGT3TtpDsR9uM7PDHM1g/BhLCSxJjyLwbdFPI9/SW9wxD09YT2?=
 =?us-ascii?Q?bEeaXQIjhQKc7knx5poySIOwZwHYeoYD+wUoTeFy1mMszGD8XYI/eotodsj2?=
 =?us-ascii?Q?Fk3/Wty+h09DNVoVwz2g0KIcvDb2KryWOIhlP0eNuVrvGAREeuiAliONkIpE?=
 =?us-ascii?Q?TGutVnpKbp8QQMdxnwBY4a+naLL6LS+umSLsnbRXkymmFwMDw8K3R7FECjNN?=
 =?us-ascii?Q?TGw90/pUmtBGcYailPNmm38P0+SyrWmKFKe5c5s5eo3fdulsfKzMucsFxijV?=
 =?us-ascii?Q?irMBGeALAJB+3lLY+kFt/xzvEcaPwZLemQPcyutMU9DQvNMdaSMGNruG8oDR?=
 =?us-ascii?Q?a3p3a2bdcbZHyYFThbA0F+YFIVcZ4kEJ+nsZcwIKL1je5Gz9e/EuUQmaVxtY?=
 =?us-ascii?Q?gArJByxh5zuRjRK1x4pxpRwXSbA0PokWxOD48Ap8sVVzy+ryHb7op1dP82nD?=
 =?us-ascii?Q?ZRabptDqBv+TzQDKXLxSDduS9BQe9RZHi/w3FzIO0EEQeyh7Qp0ti1jq+LUR?=
 =?us-ascii?Q?c5tLsDHNpXsHDn1BdOdE1XQ+SGnLDbX1S4cEhduQ4VYP2DIBKTdA/IcXKtHE?=
 =?us-ascii?Q?9Ztt501rRdfcadZ+DjyvIMAQpWByBIWKCn3EmcVYIQ4WINvII/25tR8H/7ZI?=
 =?us-ascii?Q?c7N/xwxHRlIMiaFJp1T8MN0Ut9wzsGkcNbQy9GiFovAyVwTp9Fy4bH3J74qX?=
 =?us-ascii?Q?D6UATjyrns8sZ5jCrwOG9vd4Q8Y6HUwZkxagaqYL3xhLeb55dgjrJ3ikw/z9?=
 =?us-ascii?Q?S9g9BB3dvlQfMIafnT7yobSXHFR39s9bFiMYSPcWKFuk/++OVxbPeKdpUNxT?=
 =?us-ascii?Q?jvn9+MhlqJwryCTv3LlbQboQ4HBaP4cmwTvwFptKLuwRn2a2FZmxz5lGlcVX?=
 =?us-ascii?Q?U1OJqtD5LhTOCvSOErW07jj1Nscrq20ygl2aBh7muvb1BNXDmLqkazr+aqN3?=
 =?us-ascii?Q?F2gpo4i8W/BumcTtPkwXypbvLzRzOTzScj7USgKqplbZj+sLt86wqHBvSO8b?=
 =?us-ascii?Q?+Ij0/m8JLLzV+Vr12XuV2RbjKeHojhi0PcMXmrstKKcxCCmKawdRIph1p50N?=
 =?us-ascii?Q?G1LP2olhJWhBzOBIWgxKHiPnBZ6E48LnxDwj08GYmm6vFluxq5gFx6fYExda?=
 =?us-ascii?Q?/ue4VYr49+ewsMlGNWtcuSnBlzZRq/trrw/OyCWz77NMrEqaQPFqAsuZhirM?=
 =?us-ascii?Q?8uD1dd37QnQ2N5bY/vexzczplhxcoiyrZPTIPUB3qIXW9nP9JWnRiCDRNXwu?=
 =?us-ascii?Q?cDBZC+ijyluknKFsk9EJC4DQ553X72A6GW91EC18/S8WLv3oAv9TNHZ/i48l?=
 =?us-ascii?Q?kBieI56+k4uRMN+eQb4TbK8Z1R24K/HVVHYVkXDZoGS5wHhhD7FRkXW6O6S8?=
 =?us-ascii?Q?2PW/oEoTrrPcRgkJtYnBAiCimwiMce5A8oWNa/AJZA+BKPYLQH9DZDAFDVd9?=
 =?us-ascii?Q?yp8dQc0i5pfJp+4d4L6mL2SzMRi3RfRQW4ic+orRDcQpTPVc0xDv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa21751-a5b9-47bf-dc5f-08def1c13b90
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:16.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cT3x158dog2L/sqQe834ljI90SGdhGDuhch6au7nFPG3QGsZaDjxdZNT1OvJXheqUpH0w7FrsHSNh9yYbAfT3G7ngJwcfye3hfXgs3n2pFM9qTFLNyr7vQJlSCY+HiwX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15651

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lochnagar-sc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/lochnagar-sc.c b/sound/soc/codecs/lochnagar-sc.c
index a3d6318c90500..dadb4a6c287fb 100644
--- a/sound/soc/codecs/lochnagar-sc.c
+++ b/sound/soc/codecs/lochnagar-sc.c
@@ -137,15 +137,23 @@ static int lochnagar_sc_set_usb_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return lochnagar_sc_check_fmt(dai, fmt, SND_SOC_DAIFMT_CBP_CFP);
 }
 
+static const u64 lochnagar_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops lochnagar_sc_line_ops = {
 	.startup = lochnagar_sc_line_startup,
 	.shutdown = lochnagar_sc_line_shutdown,
 	.set_fmt = lochnagar_sc_set_line_fmt,
+	.auto_selectable_formats = &lochnagar_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_dai_ops lochnagar_sc_usb_ops = {
 	.startup = lochnagar_sc_startup,
 	.set_fmt = lochnagar_sc_set_usb_fmt,
+	.auto_selectable_formats = &lochnagar_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver lochnagar_sc_dai[] = {
-- 
2.53.0

