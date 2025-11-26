Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D228643C;
	Wed, 26 Nov 2025 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764143168; cv=fail; b=qCmbOXo8zdsRru4AZ8VYwKpWActZTfCwnXvKNw9IY/ZPWyGxWKN2Z21j//G6w+dBc84yYnIr989klZoljGzLJWj25GqAGebwf0F7fOuS46vzhFXjtaxpoWUnQbskz3FGIWivR70c9oA7a75dJ1KoMtYUVvscZ4cCmdS8ixwDn/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764143168; c=relaxed/simple;
	bh=lhFkbafS0kHXnAR+l7me+lc7FFE3YfK/M07ubea5/DY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GhYa3Mv/zwXaSqp1njQnUF7PmCdKKL38XwUUSzqwaKcROKAhkV2qHio1h28zaGxR7MadB6mCTyKXE2/UHT8ue1blFj61bsgpDoekg0LFV8BJujmCfomHlNlVXNSQeJ2ic5+ZTViIsSV0fw8Sztq7IuekdVCslP8bjafSoh3Pyiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fa9BCSzu; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fa9BCSzu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+6Hc6qbV/vn8WkT+kwqu4wKdPT+Q/bxVZoThK6KfLYIiH21tYIRL9qkqMyPQuBiB0VPLpVdabYVNY39OS3M0v/flQz0hRJUVxapOSUyc+4CKC4hiRBwgK4u+JPlVs7laMfaGp33AUi0eCkgLqU5L6jc9Ka7rTsArOrnFcYEBLIXDonbg6Boa5IWLMzlor0WbCQI90L/fQZT7S0DCISQulqiv5uO7ESi8DQHcD5NarhbA8XlzmU5AIRdN3fO/qXu/FJkv4/bwUxTGnFYLyOHiTit/9YctA8RKcw6RLkziUOFzTBd+NmMirAO+BH4htJvPZMRb0D7j0xaTt/HW+f8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6ScgHK4qhU9+IaSRWVl53XUoJrU8JiADdnOWzwJkTc=;
 b=BRd2LxNfOZtsy1hKFvtGDW0kdPoautgoYRJwjGp673viyI482WavC+F/w3v3l7GOBZ8yHffTv0Gxhf3qqaz9mI4DaBQBlTO/wvZkZYt498V8nm0XaidaMprvW9IAqYWWAddT36DMzP4hU1I9Vm3E+taTBkwxkr06cZwqxjFLqiFPrer5C6hhSbqDJyy2WG6/9Wr8tzBb9+NNZlTCEGd6YACgkgCHS6mQJ2240qh6pOM7CQO0remH8FnhAuyxs4oJC3e12TFelJrkbbtwXuZjDcx9e4k7H6XNQnIyr6+HZUzSKetjCAJKCOr4vF0FW9t+UdMzUsypEPwjRaZwAD+Oag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6ScgHK4qhU9+IaSRWVl53XUoJrU8JiADdnOWzwJkTc=;
 b=Fa9BCSzuIKhqTiwkzA/ZLAXuWFw0zmaSK3iopqj00RszX10g1BqdeTzWUUSOtOmsyAPBTqA1PT+G/LDinHkZVYMbFbzTUy3Pq1QsBbt/J5MSnQEvRrOQ3ZKxo6LXbb2rJ8l0drXrYAk/UQyLIp/E6QAiC6PMB3crqzCGapuAN4QZarqYJrTv5IxtwIfaJ2v+dH1/g8ZiJnpkNyLF6da0edR6Y2tUTThj7Nl2hnGOo+SAkSAIoAr3vsHkw2Wo8wl47hEUchM7HZNVTUYRPaJ/QVIChmCzglxgDATR/7SZX80dmSKb82MiYSiV04kTXs9w6QIUXYVu42IKqLG7tWi0Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB8963.eurprd04.prod.outlook.com (2603:10a6:20b:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 07:46:00 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 07:45:59 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_micfil: Add default quality for different platforms
Date: Wed, 26 Nov 2025 16:45:19 +0900
Message-ID: <20251126074520.2959154-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251126074520.2959154-1-chancel.liu@nxp.com>
References: <20251126074520.2959154-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0187.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::21) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: a66dbb87-7117-4c34-9e8c-08de2cbfd758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JfMXj77ArZrjsGd944jDgRDSXbCPyJND1vxJLyCsrhSXcUCvb0Sg3boJxh+4?=
 =?us-ascii?Q?cJyAEWVlwJaFxXK9TzlSCEsg+mMYLsfnF6+ccQ9duKd32TtloGE79RQUck/m?=
 =?us-ascii?Q?8NdH8hbLAYnIoChZQZ/5fklzwasp68yoyS+fM3RHH0DDJiOZqa7rH3J1qTZM?=
 =?us-ascii?Q?HveklY/zf37y6QNzYNcJgS9f27xHfo0Pnef1cZmU0Ih8UEoqMcWu/+oU1PAo?=
 =?us-ascii?Q?gRRy2baCB+5GDYNV0zh1ePnZyady8tP04F0i7lXSnfannJ4XOtgP9amA6zUP?=
 =?us-ascii?Q?uVz70RQgDphHTn2JrIGz3tjlPT+qJrmZcCcdqC5g/fTt0AoVeo+SudjvtwPp?=
 =?us-ascii?Q?JmiZ0OhYxQfI3XNmAQ4cMCVPwRAhX6uVRbYmtoFoBVu9VbqDwmUbHqihrgc9?=
 =?us-ascii?Q?FtP8i++LLrjeAQlVqyHmyqO8fDKoGlszvtFQv8YjBp2KLByaT92/SAwLnP1H?=
 =?us-ascii?Q?u6aQqIeWwWRFtqyzHNBXwfGnOz7eG3X0+5TT1U6mpdNEfL7Q78HQ3IIIKU3w?=
 =?us-ascii?Q?/SNCA35lXV4wv9+pgeOKuX+z23oWIEFGa1UykvQJwc5zQYKbxGZVu2iE5ROY?=
 =?us-ascii?Q?pqhKI3uq21bPqnfHMJSoQ4yRRh5V2hB2vrAMZhEb//fVzy64k557okgwSeFj?=
 =?us-ascii?Q?vtDlermQ66CMR8mg0X6RsYeD2AxRYKEz6vwqbLsH7/YPPvEZnrqGBuaXcBOo?=
 =?us-ascii?Q?hbi5ZuPU0/n/mdyEOwWqV54ev10TjSUNAsWbRFY7CCGRgfBnhJcjvtGPeHPu?=
 =?us-ascii?Q?9bf049EGSjpjIQKbAM3abZyqzHZS4AOu0hoVBXHiqNt2r1aZWg2FmZ7sHnlL?=
 =?us-ascii?Q?7hvDcJu5Z620fKdu169wqpokvFJAyVx4vTv1Rk14PVn6gFlSbVfzGU5j8PXx?=
 =?us-ascii?Q?KHv533teRcOA9zHgDYu/7khvHzoxBaYUY4gfDfMHNr95V3XLKYpiU0jEX38/?=
 =?us-ascii?Q?kejBOn8I+JFenPeWVpFGMV7ZjDtXgxHFRJwWQbe4hy6s4HzAsEz8l5tlN0XG?=
 =?us-ascii?Q?FDrTM1hEITbfKdlF17BkGxM+TH1TchZP5Gw/4g8KSxH5jpjSFW8PIrNVS6R4?=
 =?us-ascii?Q?o+cvfpQjQm/bueZWqKFlqlRuXNqEwyKdnXwT9Vb1sJPpXd5soILEhV7rqz3l?=
 =?us-ascii?Q?cRND7S4PG8NjBMIGGx+kyBt0A/AVtlS5uBg+2Yys4he2UldS4IR80yC/I+Mq?=
 =?us-ascii?Q?J5Tf6QHW5kLQyTZRrcN8xYHPXXvm4JT4Qf5NgyrCV0XPbWsejooiW1Y8vOO1?=
 =?us-ascii?Q?XaVVjsOGv5Wm/NXY3VYjz4+Uk10wXjSHoF5UlhRkTAHQxAzOOYiOfFVDLIUL?=
 =?us-ascii?Q?E4zQ4WYkkYbffTKCpYB9ujyOfjtjiBMexPscc4eztD/KaNxk+PkpwMzabgFm?=
 =?us-ascii?Q?Pe+R7eEIgraULkYY0nuMF3tPKgudYoENXxsGM29FI9kEebYua783vBRcOKyh?=
 =?us-ascii?Q?5p6ll3GavRRoYhq/8HAPEvWJiZlrUphBNHYx8o+DzRJH8w7EVhK1v0z9MSpc?=
 =?us-ascii?Q?vi3HFgYTffgqeup2A7NRPcWMeRnxGfnlKk32CuVvM8ixWHhuonJKuuXPuQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0WtDXuUP0CmIWOhBxHjIYP8RQE/0PsbCDjlkiwTKbbOi3l6R4f3zaHztVuGI?=
 =?us-ascii?Q?cJXrM/nKlsRvGJpulmVT5ng7B9gqIRPvQsJnrij9Pn2Vs24nsaJUDjv38G1q?=
 =?us-ascii?Q?bvH07ZYIX3ekU7OoGkYU89E3i9+ZyH27mK8hKO4VvSl/FwpVqiEQ9Y8qeFHY?=
 =?us-ascii?Q?njP0p4ujWIZXuH6Sy3LKICeRbiUBh6UYULc1MV44fiXqJCzmq7MABDRExY/i?=
 =?us-ascii?Q?uofOvAmzJHGCjVm7s8R3+IlvNzChTPJTqyUJpTcjgNFdXsybnAWa+15OPI+P?=
 =?us-ascii?Q?o0P4+VJGeQtXWiQvMGXoh47c0pjgEqqfSYJp6B5iUV31Pnf9wOBAkp3Sjo+L?=
 =?us-ascii?Q?Y0FW66OyNrVlcgKCtsw8QLbPC/mzOjF6wsubZH6aJ45X4pIUbHB8V3zYa/5q?=
 =?us-ascii?Q?b2X2wWEJXuybcvvFtKhD+xVFXBVghsna6vLd09Qj4dosfnpXD/TKyOEJ31os?=
 =?us-ascii?Q?wNIdYUO9HgP9+oznWWRlg49CkrqTFwGL8GhsiRimHunVrAFPn/ZdNxBNXBcw?=
 =?us-ascii?Q?u0tRJzM1SKZdYEO02nk6pKZjjc2BTYw5U9eCQ1RVebMVE5D5DTLq/nOTozcx?=
 =?us-ascii?Q?cmaGNBFA+plKVwXmjoqpKBAe4VPZSrSyOlCIvVV544Wn3V9/PkSjy/CWjTeU?=
 =?us-ascii?Q?Jt4FjdOVD3ojR89gtkH/B0gttZAY4FRm7lh0kwCVFtIcQ+SBV0lmzF1BqGih?=
 =?us-ascii?Q?1ijltvBlcdkjd5gg8a+JbrzEbJGPagr/RIifegdUOAUfgGT88OzN/aEQPjlW?=
 =?us-ascii?Q?q/useVaLNObwY/pMKXSTToxDTUXFMBNy1L9mgeIwClUF4eYRWLNzq9dW4nbI?=
 =?us-ascii?Q?E/xTd/wH7krmEriHgdUnMvuLUhHQxXMONgqkwTAvJbrMOo12is7FXbU2rS0j?=
 =?us-ascii?Q?ijWlbli7HIuccZo37oi04AAol+fKs92rgzdNAJVmNLj+PYaYxEDCuvjFpPk6?=
 =?us-ascii?Q?YTS1OvOgVUmi4GZwE4bhaH303x9LCMVbLQk3KRXV2jlqJDtdjwpx01GPlzp3?=
 =?us-ascii?Q?IRnZHcrJtD8dYe4lYK7yCWqaiQHp1F6XYaulyt+xZFrUXIGg8AWOejO+QYyj?=
 =?us-ascii?Q?31cDd4Fln5/AVdwBmninaSBYYHVEP16NDQ6wRUd9QB3is0hNzg2iTVFD5o/1?=
 =?us-ascii?Q?8aH/vYCH+tRQU7WiQov/p9B8r9M3muYxY19ePLcpy9YSPbwO9iegdujeQT9e?=
 =?us-ascii?Q?r8DFRJz9ZaB8UXb2DjbePD74dGurwkBrNW4PifJeRg8KXFA2Dc4vqHgDP4Tk?=
 =?us-ascii?Q?vP2xZrIZVCV574+wmKqplrs9HOqAqMAXtmHAIQZFxixoXGgD/sgCwxuqzo2E?=
 =?us-ascii?Q?z1KCrhYCZjJskwkUedSNf8m/iEeLR4f10AomXD5WYgT5szufXHK+5BXfyy8v?=
 =?us-ascii?Q?v8TWns+WG8lT8uDY1MvrqBe0ZDyxA/erCzFt3c3y9oyIi1+TRCzVagcAluNp?=
 =?us-ascii?Q?kEb6DXHUv+XydO+vGT9olfdyb/obQLkSROk6gBMm79XIuoDWj7h6bjTHzF2M?=
 =?us-ascii?Q?XtWOCocdtauBPmIhYYneasdfc5gXevWmRBgriF505SVWyiPCWNKtWXGitkQS?=
 =?us-ascii?Q?d5rpEmBjkH/Om4aOmYueK2Ap7kbmxHvazHveta+k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66dbb87-7117-4c34-9e8c-08de2cbfd758
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 07:45:59.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKFKXhriUS6TQC1dQhvbW1yEJe46g3fqr6HtdAa2FaHcMZuNrHPWUfLjPiGp4J3s/K6H+5TM6Hmd2uIBvsAC4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8963

Add a default quality flag in soc data. For i.MX8MP/93/943 platforms on
which range control is constrained, set medium quality by default to
achieve better audio performance and wider adjustable range control.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 1ea543863101..86678fee7a57 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -92,6 +92,7 @@ struct fsl_micfil_soc_data {
 	bool volume_sx;
 	u64  formats;
 	int  fifo_offset;
+	enum quality default_quality;
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
@@ -102,6 +103,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
 	.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	.volume_sx = true,
 	.fifo_offset = 0,
+	.default_quality = QUALITY_VLOW0,
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
@@ -112,6 +114,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
 	.formats = SNDRV_PCM_FMTBIT_S32_LE,
 	.volume_sx = false,
 	.fifo_offset = 0,
+	.default_quality = QUALITY_MEDIUM,
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
@@ -124,6 +127,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
 	.use_verid = true,
 	.volume_sx = false,
 	.fifo_offset = 0,
+	.default_quality = QUALITY_MEDIUM,
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx943 = {
@@ -136,6 +140,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 = {
 	.use_verid = true,
 	.volume_sx = false,
 	.fifo_offset = -4,
+	.default_quality = QUALITY_MEDIUM,
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
@@ -892,7 +897,7 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 	unsigned int val = 0;
 	int ret, i;
 
-	micfil->quality = QUALITY_VLOW0;
+	micfil->quality = micfil->soc->default_quality;
 	micfil->card = cpu_dai->component->card;
 
 	/* set default gain to 2 */
-- 
2.50.1

