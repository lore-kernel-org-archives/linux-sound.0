Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4B31607A4
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820276; cv=fail; b=qn7RQNLa+Be/9ZxR9BSKEP96RKpNTAL/czeQk8jeyuWSjxBHo/STG+aI7E8eJj9455VvQgNfLXnuqgKPnWPyc7+qu+4VXD8kc/YB/z0iDp9AXE3yYPdQ1X2fpMzq3Y+3xaMqT8jIM7OYGxlPh4ZuK/+D5geu/qa6b4BL9g+UNJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820276; c=relaxed/simple;
	bh=NIlj3xWJGeBiOJDaLjDQHeSFXGphasvCPBNMJARLwZc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qOfVwTQr3i0LF+prlAZ5doBCqRs4liCljc2Qte4Rz9bAS0Pf9oWQR2pYLiQDlJQB08H/FtFj6AxwR2L6a/G5LVjGDN1aEPzMxY68CLiQumRONuBTQhbs1tmWr+Ic+AltgpDrYv0YHSA5GVb95OisDH6fQ6EQVasHXiMrBHzib/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=D/FDk2T3; arc=fail smtp.client-ip=52.101.125.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="D/FDk2T3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qf9RDrD5muGE4qnYsfbAtGlnmGHokX91CESFfPyc2jOS44MBzEV+Fyzp9+pC8aCqESL/xftL26hEQi2MPJqqoveSPphhxGfLmFex9t/kSXP7RrwtRqkNEnKDNJLBBMEdxBiP5zK/0ZIK76slMgCzOx98/tD7BGwy3Vt025SvIqLsJAPxW0xM+sDDWOPeEWhuZGnB/MaRmgCfIWiGS4pQ8AuJn5CogPqCIGuKTW5O22v2fLti8EV2GoVi2QIibUXyeTlqri3Lj4qQuapmP+jliXt3AICHCtZOIzMHT4pfHcP4ULF9hYpInfWGjJwEZ57ekpmq0IfuswtMFE9zqrUvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sxWYmhEVP9Y+mWyFd2fIt2X5d+xgQO4MXOi7xrtpn0=;
 b=k/Yh1iSQuxts1EVXzBFWK6IpWKRl9WqKPYuSLV6XHUOJBrFpn5j7orUwn8gng43WpB5g5qQLfyop0wa2T8LfsJsORytNIQkBNzCfYdF+b+3tdVLGFOgBQFMk5MTkLFihk6dwAthDiKF1vayNGPMJV7kLSXtAhzwFiQlIogviB3QwU3W2fUNw4v08otX0d8SQCj/hsnFNutn6XId/CU1sd6vKFRF81w25XQjgsaknTpuUBXF1WBiqLULTpQTtEXz4bZp4kk7WwS+yGOgxQ20OevvArGF7KLqrIINATifThWSgWpgohBiBTTfulflo/BYj4BVhQEJBSVZHEeTDgKUKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sxWYmhEVP9Y+mWyFd2fIt2X5d+xgQO4MXOi7xrtpn0=;
 b=D/FDk2T3ENxLkXZPiGVLlYZIRwD9RzkEj98C0Cqsrqo2CaoHXCyuwNtWHrPV5qHtH97GGQOswqUmQ9Melo6QLpUdcxk4RTB3iUh1ZkvbPenv9QdcPgrkAXwzEWBBacTiXOpio8SGEEuCzmNhsO08WPN0+xv1KvgY4UjO8UuBGqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:53 +0000
Message-ID: <87346la0cv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 007/292] ASoC: asoc.h: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:52 +0000
X-ClientProxiedBy: TYCP286CA0237.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3dc06e-27d2-47ef-a52f-08de20b7c16f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SSQ8hjEWbP2fOA7GcF+ORkudu0pYvgunLsyU+OsnfhSdtw2m9JxEd1oafP46?=
 =?us-ascii?Q?ctbWI6JjhAkYktXOku1kgpgwiM6jtRTUtMW5YqZ5t/oeooTpkkaj/v5v5ejo?=
 =?us-ascii?Q?8cJh5sBP3PyI/ry9R/N4v6lQq2SAEED1TZb0dMMTZseop1e21lqdPq9O6y3Q?=
 =?us-ascii?Q?JWy27uprzOqZltuO6h4l4rChq5JZ54keYjlOj32sQKmvO+6YJPhSzDR9NW5F?=
 =?us-ascii?Q?xGoprS72HzzcRoYun5AEg1i/AH+rKSfeumdcNc8EBPmT8AxFPRkHAoE4Ko8y?=
 =?us-ascii?Q?EC8bXAppGWbIqc8WSmzmXySoAeygpurRKbLfRe/TZLTy+VWqPrr/0mJjFCOW?=
 =?us-ascii?Q?5jY6q1FF8J50JzMceXp0A+rvoPSnlyb9Y2cENgYPzgKIfQeM6HlKwEGLKvi3?=
 =?us-ascii?Q?wLY7I4FKaSPUy/ioETsloMaQWNa+tDB29pcgrdEl7ybBgB/Ats1itD7JnfHo?=
 =?us-ascii?Q?OEISrwQVy+AhkR9O2O4umBKXAw3uucnluY7+173uy+d3nAXsBfxgS7Rs7WrA?=
 =?us-ascii?Q?2rG2xIVvF4XLIna5UhrH0zFa0X1DPH5efHGf6/ixNxUtrinkcZ4u6wvd93kC?=
 =?us-ascii?Q?+4Z7ia5Xnesb/vIzsi878M9pqXQgy9uPjrvxXOBcYwYiPeRRNmbtxMcDtrN1?=
 =?us-ascii?Q?u2PDZNyd6xA6JSBkmvKUf4FkwBc67ox7pRutkWsjy/r0UFpv9hwSZE04aSba?=
 =?us-ascii?Q?e5U+0sBMYpVzA+XV2J9DXaCBJiV5rQT+T0hm27dJikb3D6k39Y7XriH7AFD+?=
 =?us-ascii?Q?K2Up68BHxDkiiVulvOfXmL1oDRO530m7aPkiEJLmuqK8Xvd3O1cNk0RhfWhm?=
 =?us-ascii?Q?uhkMMDGV9/WC98NC7d2SO0CWBw9bN+pMDFgaGD2Ac7D0j/NJtU6SAaS2PWWj?=
 =?us-ascii?Q?EjoVOGQ+KS5xeGtpUpSrfF+SII1tN73q0COQkaP7AAaws6gXmKjraj6VWVNC?=
 =?us-ascii?Q?T7+bwVz15y+k9HLeYmMsCzQBYqL2tPQhLSLdTFxmec0yrGyzAtJt/+iDUMHU?=
 =?us-ascii?Q?UvwN2FZemIBiqHHPzaWxKZWM5nqH4oL44rAq+FJoM+eW8SbuDRvfIvZ2vJ2m?=
 =?us-ascii?Q?YnU+FXn2oFnCG+yke8Qc1V1SKGV9EoV8Sw2VxC3WukQLb9ciDGenrBz2nWFo?=
 =?us-ascii?Q?BUELbDuxmG3cn1qbpzktaIbWuQRZQ1d7pnRZf60krsZ7De3mvK8xMmzLBVej?=
 =?us-ascii?Q?Wtod8Gy6r866q2JhXQO8h3p8DLYeUjEmGwqmKBUKnAklfhQaDv0foVGalIOI?=
 =?us-ascii?Q?STAy8ioyWlomZ1w4ub6YrW7Y4mMRFFfwUfORQLMEZpj1qgWRCelciX6FB5HH?=
 =?us-ascii?Q?YdvEaPoiXiYfBv8zZH0GLSLcBGFDHiOpvGs8pvlUdyUSevGFjCa8gTju2P71?=
 =?us-ascii?Q?Ic8uJ8jj/guNi0yeG0+0QIwweEBa0OOJBi+eoZZo4mRhK4qZ3gLImIX4lhB7?=
 =?us-ascii?Q?YyfnrPsA57bdsnZQS3ZJBN+mIKoA755gqvF0M6zqtymRafSHoWvyT4oLVrUh?=
 =?us-ascii?Q?YHpQ93vAWH8zefArgPS7pqPCILVLI2OxAzkX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XHOjg7QAnE8Q8/Grb6LGpfT3mx0IhK5FYco/ZNiv8hAL89eaimC+9yobbKMB?=
 =?us-ascii?Q?Zy7ShhKgbmlqbUJx5QocXq+3ETtB2aYIBV4yScu71iXJA3pliWOw6ImlTUsB?=
 =?us-ascii?Q?qcgFeMp5v4nzi5WGHGWzwUjM1weuryCZVLSAz0fWVumwoy6spwfkJx5XDSLT?=
 =?us-ascii?Q?0rvY8bXA4PVYoWr3bU629vMEiNUgBU26fpfnYEzbaYklZ0UGrsQvkFvYg/g+?=
 =?us-ascii?Q?/I09GZfc0znbaIuo8Yq9ZAOzs3/td20pRe+10F7RfvGydnTVGt/70om6DhEl?=
 =?us-ascii?Q?W8EMyame3vb8GbxrlSgfb6DJNoyvbO9UwLiv8I9pWybEoHuOydWtNLmotf3R?=
 =?us-ascii?Q?MhPIFNWLxviVMjnIr7u62GZZboYtGrDTEQr6OBlGEk+ZuHTx61ahVCjNDxlv?=
 =?us-ascii?Q?PfGi4EQW9DTmU8q23dlQkYsMx7iEdWpJXMqL72MaLPNDUV1AH7BRdtI/H53C?=
 =?us-ascii?Q?F/Psoh4Pre1wGgF/M6mtgdb70C4HTm3102DcoEvaJ8GciDxxsp4fXYyTyDgt?=
 =?us-ascii?Q?zdRkFLkRewARoBNdu1w5xPlZnT8m+gOlbXmNZctG2pCWZZvkXW8wwCOKoPZK?=
 =?us-ascii?Q?uMqnv3+1Wr71v9dCmWZ0FGKH6GUbIHiYfwFKE0ZCR0w41lKvuONKvIOnMb6l?=
 =?us-ascii?Q?BTfjCx1kCvKahJztGBwjiGLxf6vtne25NyU1wZj2xFSF6JPsLjIqAbZ3cdvp?=
 =?us-ascii?Q?5/ubTNkK8/wp4pojJQRyZzjCvLhwvPAnSdrqE/M+ohhuj2cL2T/zzY5VATqd?=
 =?us-ascii?Q?YdMSMUP1NQjG9TwZ4izXF08fQpdExItXok1v4v4cbBu0nI0WrtLdXF3rziyL?=
 =?us-ascii?Q?IDkhP9Dy0aUkxL5R7x8VNF135MvTuvYdmr1jTYCEcvznSdxHK9pDet8hPt3i?=
 =?us-ascii?Q?wjgsfVN8uWwyVjJ3m9gC82/7bB/cMt87500q7DmU6OPn3A4G7gm4DAmiqrGb?=
 =?us-ascii?Q?adxgv2bRGvytvZiOaoC/HP3PaGfYR4wdvNe/U3P0JXGx+RwIaau4RVjCjhnN?=
 =?us-ascii?Q?SRAKRZh4dPkYETvXgu4Up+NALeRfLswiRH2CrsiZMAO7QA2fijgSFPhPSdP6?=
 =?us-ascii?Q?L3T5zXNC0XaFeNJ2sJBRXDCQR9t2BYIAPicyW6XjAayi2gI1iUCF004qaXyQ?=
 =?us-ascii?Q?gKgBkKHJE4qRME2uToUg/3hI2nPa5SQGipSOBqlnMIeSNdmoOjSapscyUubl?=
 =?us-ascii?Q?xGILkTDpycr/riMO2zevFKg4iZ0lgwZS+5L3BbeibzQUbFUsllq5QVdxj15V?=
 =?us-ascii?Q?OfLvu82VVmqOrgmEjwRaDFqh9+IWyVS95jbGWF1dAC6ZRU2tyRemK1uCr7If?=
 =?us-ascii?Q?VS9p02fwAZvywixz8g/0+mFStZ5/jxwTU4nTshop0cEycnjZNytmVGS8Djez?=
 =?us-ascii?Q?G0bU5+82TGNXW1aRW6gLVYB0tH7duzrzPJ7Skv7xKgj8zTkbPd5iT4fPYmcN?=
 =?us-ascii?Q?NFmxZVBdsSEabhuvqOiOveWa0o4UNKQAQrpR+TpZIViHOb9eXE1tKtbHnzhd?=
 =?us-ascii?Q?kDw+k2pltoY2FS+zQKb9I7LuQToJ1PrukNMuuH85JhYOndNqQy2CWJJJ2zHI?=
 =?us-ascii?Q?GGDtPiJ4aA+qd2EWQYSxBxudJo9vjA5lPQVDFAELISw6u5GmZgGcyKLaci1c?=
 =?us-ascii?Q?mZWobtxkSvloGWT/rxC6ybI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3dc06e-27d2-47ef-a52f-08de20b7c16f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:53.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2Qt3T+KywNNYuxh4nRj2ZgtZCEonZxClJx4dmmhubPzN1xyj0lAFqjFKwUhY8Q2F1ebOucM0LbaZ6cul7pfC6WanZA3dp80eJQBqSRgJSMD5bVA97pASvSDTkFCHJjL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7893

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
 include/trace/events/asoc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/asoc.h b/include/trace/events/asoc.h
index 6696dbcc2b96d..4a645549164e9 100644
--- a/include/trace/events/asoc.h
+++ b/include/trace/events/asoc.h
@@ -27,8 +27,8 @@ DECLARE_EVENT_CLASS(snd_soc_dapm,
 	TP_ARGS(dapm, val),
 
 	TP_STRUCT__entry(
-		__string(	card_name,	dapm->card->name)
-		__string(	comp_name,	dapm->component ? dapm->component->name : "(none)")
+		__string(	card_name,	snd_soc_dapm_to_card(dapm)->name)
+		__string(	comp_name,	snd_soc_dapm_to_component(dapm) ? snd_soc_dapm_to_component(dapm)->name : "(none)")
 		__field(	int,		val)
 	),
 
-- 
2.43.0

