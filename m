Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7525C809;
	Thu, 27 Nov 2025 02:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764210447; cv=fail; b=gNE6okbo65Mnnv2Nu/nFo919qfFnBz0gahyvMCd0aOpapoQWjRhvUhhFsa12DFvQqLmeqleqHoPlS2C+sDZa5rAioVmasbYO04HN5/gemC5hGfWlgm/ONggcWb1fJt+25oLD2U5Dufr1GfmzBCcC2ITIWoxYrcKrtY4TzISuyfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764210447; c=relaxed/simple;
	bh=lhFkbafS0kHXnAR+l7me+lc7FFE3YfK/M07ubea5/DY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q58H3faXbgbJrxEf1JmEQmn4sbOpsyFTZVFSc3DzfzTV8HzWU9CURrJtTmJYR81UrJFRbItIWUqfdCtjOtwP4438aglu0Haf2DPbDDZRoUjkJJo3GyQ0epnL6jRaQfxcYSIf+4pCg5OLIwdgKmSf1AWK9clzMb0ie81MTjQfAGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mowtvGFT; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mowtvGFT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxQqNrAri3Rj3CFkNHWL2YGZx7cEaaEPJLGTzMejjoHwbPV7ndFDe4qTBEN/p+4AVDCyZgjQJumhMONGxfnCE+8PycmZFmfxEVK5oNlEsFgg/ciec4vCppbw/699A6rzmp6biwpaw7+EQB7QefntsdZ3boqylW/7FTKBc9qv94dJWB6qCvOLorNLxhmf4kijXsPvWcncdKoeg7FiD4ZcC5b4Sl79bNxNbLqTnJgX/mZsk+KXSwG7+0AnD5yqTVkgoZO0tD423xHIACSBtarHETvYUM1YYS26os/8AmLBoKoApWi2tKyvZPeUXlqOvvq4vkvn9ow2gXsRA6z2RktHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6ScgHK4qhU9+IaSRWVl53XUoJrU8JiADdnOWzwJkTc=;
 b=HO09RyIhVqrO9A7FXp5jqv3gVko4EXbJJ452MDlb5cGHul4tPw7J4vNFG3GYhsVEPyS0RvN2ujhxSpc5OvDxiYFmEIlXQac7xDNl5laGqwDedobNRuoitQyweb6eb2gDBcHov/DsZ7sfatKimEcqUsvOgp7gEJR1v5Jw7MnljRDuKf4nkfS9ftrmYfT/9rZdUCjtXH5vM/Enp5c3JfCceu/GGZUG3XoV0/W3xwwWUNIxOn/nrYUriSgCEbMviCYxrJuHEVTcVQ9kPdMXWRW1THVruFl3JMIoNeBOxt6ZvQuA34mfO/Su+3RRarBAJXOYnmwWbHtu1pWrmdbL9KrxpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6ScgHK4qhU9+IaSRWVl53XUoJrU8JiADdnOWzwJkTc=;
 b=mowtvGFTIAgwb3spvX5LRmK+3Ho2eyMt07vRusLBniuebUfpJlW7wtEopOZuVR6shrEUQp+rX8fgmhBKa9H4Ot9hsqA2DXpprrGdDM8I1glzuIuzNfKDfOIvd45uobatflascLK8e5CXnD4ldzXvq81Lehy0ym9d41bBfUvy7yut5JFRsMCP3XNYlCXd10Z1Baz0RZLL7RT/g2BzGpwJs53kW/rRZDRN/PoV5JaYo3UZedQZiypYN0DGhg0FZ6Kw4Yi7pDUofkQIiBQreUAHust+TB6Xj+0VOBfRHSLJQOoTQZKDhDnjy/wn7/CtSt6IdJtb1fZ64sAXNIEjIl3BxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DU2PR04MB8757.eurprd04.prod.outlook.com (2603:10a6:10:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 02:27:20 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 02:27:20 +0000
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
Subject: [PATCH v2 1/2] ASoC: fsl_micfil: Add default quality for different platforms
Date: Thu, 27 Nov 2025 11:26:51 +0900
Message-ID: <20251127022652.674574-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127022652.674574-1-chancel.liu@nxp.com>
References: <20251127022652.674574-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0050.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::13) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|DU2PR04MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: a572e8ee-bbe0-409f-a796-08de2d5c7dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PhccH2MGEHcp/kyrmCLMdqf0nItScdt10Bbq3TrorQuGRxYwlh8HT3vrQbSs?=
 =?us-ascii?Q?O23QE4ry03tWH0g5U/XlBByrx3FUbusIaTWwwl6Yp9XurqGUZvwo2jSXev87?=
 =?us-ascii?Q?ph1q9OycoLiNXB+upr0ssrcsQGfz+09ytw9WEK8KMIAaaf1QxAO+XAB4aFUD?=
 =?us-ascii?Q?fQwn0s4S6jMbupDqjembJ+yuyQZF1yH1uBEuUxaBe9UEnNJZwgKG7VK56JzX?=
 =?us-ascii?Q?jcfGB8v6yy0LtGHGrr1RWEpmvv4cnUqztziFciyRDqgBsQE9ui+WOzlvzwXd?=
 =?us-ascii?Q?iCoi9sFPAuLDVsS9lNjfsOyEOVnOzluYDftMunXvGL+vJ+UnsXA0s4krd8N4?=
 =?us-ascii?Q?SrsFrOHAYXN+X6V0bjf+8OMVnLNVVuWa6L9PXdt5h/rXF8muCwRVjlCYe4Ww?=
 =?us-ascii?Q?GQNzi8xOkM3OW19Fpz++sn082gtXK7XANozWmCZLepyFK9eNC7JAsnEGSyPP?=
 =?us-ascii?Q?rKyGq7dD6Sg2fXX7PDT+ELBK5P4Vrme/uLfu3/VsCoHH1GjNmVMigPOresp7?=
 =?us-ascii?Q?y2FvXIxHnQBH4gnPLQH5wTPzISsrXFSsORnXEdoKdVhx2lNXxt/9hsS2e6UR?=
 =?us-ascii?Q?SjyG5xvKIEmnczngKGRppRjzcYzWXDZcu6nJCU7menETUe5IZXg26EGQR4QA?=
 =?us-ascii?Q?daAEEQ5ttWRFI0vSBrsaXr+LjYzKZM/EVowym1WPJh3JV9KoYuA88pejt46m?=
 =?us-ascii?Q?024kujBFOgvsO9aXibJ9B0VJ92sFTwGUdxEsnEtUHkNTjDRxcolfc2BNW+me?=
 =?us-ascii?Q?8eeJ+SyOYJm9Vqj1uQbLKHbYwkSnZBwutfUEsCtio//J9uzF+klUmkGxgleR?=
 =?us-ascii?Q?u6yAVhhr/A2L3f7lJ8UOBU3YZa5VAO3dC3jrwhxUOU0Xh068YnsXo1o9CnMo?=
 =?us-ascii?Q?rRTWc2sRB5Fe8Qiqkf1uY+deCnEvxADasT8i/yYIE6Er49pdRF0QkJUKOW3h?=
 =?us-ascii?Q?NJCym7mBNcBgq62HEg9g0yP5miC5Rm5sMOke18Bxlvs22OjRE+rRMXfQX4Kr?=
 =?us-ascii?Q?Tss8RLiNJ55v6xjMD7aeZzrPXZQitEfylLBunWPW+HYFGgPc6DkSCD5w8ucn?=
 =?us-ascii?Q?18LL3rveGW9yBX0EDvfjOPu/1UxoyHLfKOqgbHrCyhM1IlCnx3qJFvbg5Ha4?=
 =?us-ascii?Q?KifTwghZgoiG2YdeSovqyAK/41ZvRflZjUl/GTFw4jsCqoI9BvaRxNhW9FU2?=
 =?us-ascii?Q?gp6a1AvPVTk5SvFs5ra+zPQY51+ofRI7FRvQTvhovRHU849hpT3yq85ShF6m?=
 =?us-ascii?Q?YsiL5+5x9cbWwZi6jNz728oNJf/QDkxXTyeC5A0SoqYPwy1tlc8eHT9xeSMY?=
 =?us-ascii?Q?DLBP5Pet+r9VwN16Ru9vopiOFbzAuenyZsOWIwcocGGYp+QrJ7KF9d/HQtqq?=
 =?us-ascii?Q?OvXg0TILatViVhHoTrMCNSVngV75fqqoEwPR9owfJaFkm458kHB4TagaXcCI?=
 =?us-ascii?Q?z0kbmM+I3GvfvUag+yN0BCm914nhVOfwdWJmxgIyuB7suca/xC2rJUVALY6A?=
 =?us-ascii?Q?H5ML0eY3nu3e5XM266AzPQa4gmQquyGpcyIXEQYF6wKaKpCWn11LU19PZA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3NzfcMCpeyYPDANWbluCUGb7wfuBHbzo1h+4aEhP3FnF1mtxgcW4jWZBxCLx?=
 =?us-ascii?Q?KzYb3tSj8PMa+Q+kAGdj1Gae2s+pn4vC2fiGKdaqWxivRL4RhvwfjmAq33O9?=
 =?us-ascii?Q?Yqst6Sddc5ZiVOCc5h/I4/tqcUL1j9FmsHKiG5F19o859uxgPC+OULEyBtdV?=
 =?us-ascii?Q?rP1psBYVcWOcQsDBOm9F5Q3VKY9w8YHs0K7Eu0CBUEDUG5K6Ags4whk79k9q?=
 =?us-ascii?Q?Sw1NnTMOhRyFZ+FTNr1opw45sbxe6gD6CXMJZb+D03LpX39lIA6ooR4lnY5U?=
 =?us-ascii?Q?qbu8dTJkV+XT+sds9JPU/verv9mJTBJi+P47YjXRhSz62plfGzin8yjdLxp3?=
 =?us-ascii?Q?Syixx4WVDKoYA//k/lzVlCPTrCoNibyyhHjWeHlC4PqVbBdyeY+Dpcz8hCFy?=
 =?us-ascii?Q?lcdNpTNbSF3keg2PvTzHoqW+HiN92GXqcJjDMu5nCHJqcQ0V6oAnPvAg4DT4?=
 =?us-ascii?Q?aKCS1p+WCamnZOlPSad20I/jnH0LSASMMg9NJXZU63dKzb5aZW19TJ24WBW/?=
 =?us-ascii?Q?ufNYUNEu3mdoIa+lcy1ERrEeHpIBoFf//1k1aYfEQXFmmaGRRjeuxi+RVVrt?=
 =?us-ascii?Q?Uv+otesqUK6YZVn5ME21iZ7ijW5JXu+ptQhUPkyNP8qct8nvtD4/Dci3wlNj?=
 =?us-ascii?Q?M0CFs3aW7hrB/dMLGpitL7gm84xDYViTs9P3/BycC4SgsZdfYuX1Mxy98sKi?=
 =?us-ascii?Q?SPBQMyrSy6fHBQIXGNekMcvEMNgU/duoMWbcho2EyZjNFBrT7yw4qPfk7f3D?=
 =?us-ascii?Q?7kWP2TvFWeEiqs2pHL3qw5MT9mA3FtgvppS5ltTU278fycOxikR1PPEu55yo?=
 =?us-ascii?Q?d8gRxuE4UztkjhmK6tYzu8DS2dG8butd+504rWGgWUJ565RCJfK1ZVVtfUd6?=
 =?us-ascii?Q?4KPyJNJ5vZZqMNW0uxZAaraRedtgxg1LVXKBg7gDLlTzCMTG81ueZ4/4BbF0?=
 =?us-ascii?Q?+RmCdAa/rD0D/GSYlFw2SHhgYXttkeCDI2lD0QELlH8rx+ku7ofqII6eQyNC?=
 =?us-ascii?Q?JEUUC+6wtTgz0yNaAUddfd7KmGNhoQOPc3fiT949DjGjkBq5cOckEKvffbA+?=
 =?us-ascii?Q?d28jlKoDGYwFZVqCDAFs9jTAC0LrsUQR42oH8wd14XHY1wEZwK30IrAqTOVp?=
 =?us-ascii?Q?u7tzX6Pr4wuYxMb6jGmdXYxQntnoBdUuvHAJX87nMwVYEwoSylIXBSxDiNrD?=
 =?us-ascii?Q?yiClsgQHqr28ehadRq3o9acJE8B/VjoucRwqvjGWj/ueq1EnaJjoGyLJFGoN?=
 =?us-ascii?Q?jqO+MOfRQoL1DGNPwtsQwIpj9yr30i8mbQ2z9sDEtdFKIo/UzjbVnQxvz7HS?=
 =?us-ascii?Q?F8joTGUayvccRP715vWwkISL7NnviMgefjEvyXICHjxwZwYIsJHLUQ472674?=
 =?us-ascii?Q?Gz+F3LAFSwfx+6VA7nzBXUb4v2Oe2eB06KIRLGK02grsI6UtMQr7bQPFfwaz?=
 =?us-ascii?Q?ESCFcYis91BmFBOdYcwLpkZylB75WYCTDjbTc0GrWRDNKn7jLtcv0MHJjRUr?=
 =?us-ascii?Q?DdA9nVA8RT0vJa/GtECqD/PwZiAhQa4sdl0ACyzE9fU+6osVtxP3T3ZSb9w1?=
 =?us-ascii?Q?9pCFTQP+QDGnXmx5YjSiGnRmxwgbcEzcyPtfo5QC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a572e8ee-bbe0-409f-a796-08de2d5c7dea
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 02:27:20.8082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qamsLPx5crX6kDlrdS2vsyQ+TiwAlxawJbC5sH0YsMFVu8wmzDHQHvH5wCRTE5SULe4b7/pHUzF+bTBuxKG+zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8757

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

