Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CFE2FFDEA
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946737; cv=fail; b=SQw7Bwz4R/7jdlMaVlQdzwi5FMlOeevVxgQH6YYdCrXmKeveGBQCuAq40UfA2wGdTeOfC0HxWBHhTYJUCo8hZWQVwDRKWDWsUSAmzP0bqKokdyZI09QZl+8ui2vs9lLskxAalJCwK5+xwBM6trnoVBrc0wSoP9iuMEIKf3+pRUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946737; c=relaxed/simple;
	bh=fvoQ7bENlWRXlMb/CrR287X5wsI274eqbflgMQiuCEM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=m3nY9s5TCo29TJL8+I2lg91yXuZu7nIQsSGlrIqba3wAX0ebjlIVHaQMWBvldutdGgsnwIkwSpknvpIyQOD0Z/yg+cuvkTH6AjiLQy5/pKdIu08PfH6v4rt45AP2futDj3S4k/8i9rcZCiE6AbG8pT/RQcbgWM80C0gFmIq/6RA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Qs1slvKu; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Qs1slvKu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eseXzosnamiaeGhi76w7LN0m+J3FvVewUCGMwFfMRbXPzEYQTL/gXxGGn6EdNJQI9/3pllfi6Sb/oIBrTCcdDiFKgj/jIfO7e7OCnxbsFGKxUvd30kJ26/fTV22ZKvc7q50eUiPEVWA0Endfuh5DQTaRocvdZL2XXJ+HGnyg0cjF/LgSvETKbNkoAFch2axxS9FwJ+/aPMu7VR9ZcaFAZXYa1sx218+QrPUPwcP+h9w1/2ad9F1pAhHiMD8nt0jbZucIc9GWdRDGONRsGmIdaLKazO6ZaeyVIyM23eQ9i039/YlE9MlsREJY2zLANEUjYvvORgFV4Kqd6pnjWWmd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEMN5517zEk1XCSrlVBZus7Lg6lSi/bQBteyjw3QcuA=;
 b=DiU3f22klbmyVrhDAN1ux1swbFhCqspGqDhhpGktGVrOdIT0BTd8Cydbs0YjCVT88A3AL4ZE/qu18fSUaDaoPdZ0yxwIbAzjoWwB0nODydMAy44ujq8gkirOqmEVB+abN5NIRea0T8zxs1aipyaxcjd6uGSo+Lvf39qtAkBIvQ3lN5pEEADti5QoN57n2dhkkKNra+ewJcJ79CjRqul2VQ2xXrWWukk9gSmPdsFv1RrzOcnufG58fjqkz+sKzVuxw6a5eE7J2l6FVhdvGfzYyxs4tbDfxFLn2ebupYC92A1aO/QiNr7vLUC+/Ilyrmubd2zvmtUY2X3LwypGfXdMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEMN5517zEk1XCSrlVBZus7Lg6lSi/bQBteyjw3QcuA=;
 b=Qs1slvKubExBO6RVNIJOY2b3bA8IM+JrHlL8Dac+kmJSqQHOwLl8Rh6BY9ElWbrCApFqTGM+g5rK5MEhheAZkB2oxb3Jbuv8fmjCNyU46ra/g278CtcJtWuqMV6CFDCgcr/5aClKvhXVopbZbQ99q1x/JV92u+cZiyTqYYdKHbs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OSCPR01MB14695.jpnprd01.prod.outlook.com
 (2603:1096:604:3b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 02:58:55 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:58:55 +0000
Message-ID: <87jynlyolt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/13] ASoC: soc-component: move snd_soc_component_fixup_controls()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:58:55 +0000
X-ClientProxiedBy: TY4P286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::19) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OSCPR01MB14695:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2916fe-29cc-4579-4fe9-08df299f15d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JdZQohN04z1McVFpE/LO8nHCXtMBS6DUK0FZ5bQVpnUt6FRUTQZMeur+FmKrwM4iVY0iOSJVqW0YUXvAQITMumAC7p4HR68bgVC7cG7ssAZ1HA5onUenG+Q1Fr5YFcFiEWVWVqmOrExq68Gr1vswY7e/PNZpEJDGhhEHHfdc318jYm/eefGFIpiUACkxKVIQKT9NnDPU1IJ25I/52dTH5zw1L7y/oC7oLgJ5G+so+9nJouPuk5LKtqzGncBcu8QG/SHdUJ+j5k3QulQcIVjgA4U0wErYu2qypb3BUV8DijJepLz0W/FuvBRUW3+UgNqbjcFEK0Opc+lGHVlriENyydXRenypb1svZkyJIqnP8qeIZhA6Z9JFteWAfH0Zn8aa0TYRDok2I6JDToYnsE8AEMjBvaZrmBzZaXffLMs2ZTW0KTm4AZfuc53kL8Mni3elMVwCNCxGFsmp2bfd6Lk49zItWe1vAQoYWXBwlS84/k/DOlUg2p91TERocPBFpSrk/rdeFCmJ56H7apqOTUpyFFpWObk2qoglRSFa3sKI3H4JDHdew/gYlzr0uX4t4yHvWHO/BFGpPnNjMmGRvqaHwPSbvo6zjapU+kiSvmYvKNksbaYYR1WH0OQk13GXyCCuM1Vq76EckqfX5PIN41MJwTVBf9O3cW5xRd2IGZ3FaWa2FmEYDNUpptYm5hBLTuveG8XDvNqKygfELt+QZRwiA5gbL8MZrEOBmCrF8aonypU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?nOpBE59nlyDe7Umo50SIt5XPKSPhwmaPzic/911B0F00otoMBMbveIIOup?=
 =?iso-8859-2?Q?TD2Xjq1Lz47s/TGcjKGuxCXaQ/f4cXV3WfFUSog6rxb1PzESFP5ZI8fVLQ?=
 =?iso-8859-2?Q?XSi77x2MGhn41PuBGslIjWjAEeLRalW97qPWukc7EaISFCjjHjv6Qn1GyX?=
 =?iso-8859-2?Q?x1wNOZDVXsziMuAlx8SwyHrXAG++dxdkWOy6+1h3imMlvUMlO1qDJq3iXt?=
 =?iso-8859-2?Q?qn7meebjDS/SYnlF33QPHDAkw+BxicC10qXrkUSa1sUzFPomSwOe6uc+A2?=
 =?iso-8859-2?Q?bKBjawBFkx4w7BojWFTC9Af4RXu1FbTOJ2dKbwSNTPDHMIoRFO3kfFr7GF?=
 =?iso-8859-2?Q?0Csiaq0B1yQ5LYK55NZXuwiY9w7mhxlnU97TqqSE/pDLV7lI4CiNh2P+Wh?=
 =?iso-8859-2?Q?dIqt1GjCFikvuA/nDAF0MVDpdv/mqZScvr0zashPKzDg6eH6mfUwP39K3o?=
 =?iso-8859-2?Q?jcU/uVIeKGtFv9+r0i6OUMjCJ5hNuxp5X0VJDpjMUUjNdRUYQP8qvp2+9E?=
 =?iso-8859-2?Q?iUAbbUYfjkcf3j2UMkhYZitHxpOopMEP+jjLCZ/oAHQyZTSgctaxUfMBA5?=
 =?iso-8859-2?Q?QyeJIZ2GHVuSPuQq55UriKe75eR/wJO16yoliccDob1QxaQ02ggAWyqQbj?=
 =?iso-8859-2?Q?qdWVLrnZIoJfZs7skNhWJ3dfHDVgv+brmStiFYVd1MGAckGUuxz7QhefJp?=
 =?iso-8859-2?Q?IailfTP0OALc/rUAJunfHZ2jXICQ7Lm4kPYBc7a9EKEGUeSBp7+FXhrzKu?=
 =?iso-8859-2?Q?8YuJxUL/0Aujf6+8PwwKgZ6BCCHoOlan+gyY7XKg1diaSDLmBFwCxlS3Hf?=
 =?iso-8859-2?Q?kzdcdvFWgvB16IZNsB7rD2g/XqNb340s0h/Lg2BG9cv9zUc/qgEnxRe4e3?=
 =?iso-8859-2?Q?vJaH2uIMKn0XeOT4ziqVrKqP4THLHfR52E9wYWy6TJ5SNt076q1e8zNL1t?=
 =?iso-8859-2?Q?b4J9YoT8dAbSrt39SX9xs6ZuP9Uf/Pj+QhAL8GKw7fAipXlbERIKUkiFR2?=
 =?iso-8859-2?Q?ofdz5A8tY48sWYdWRc2I0IKMrcO9GT3HcNeF0SR1RG8eBZZ+bQzEN9lAPv?=
 =?iso-8859-2?Q?TxfA+hs4NQI31RDdO2MzWhWJqIPkz+9NSpnhwfuyGsHmsELJ8mCKX385wA?=
 =?iso-8859-2?Q?tpwv2lxlRNi9RHO3xeMh7xnDGShzcxgRZahxM06TvHZQ6id/1LgFM9dDek?=
 =?iso-8859-2?Q?9tjHj7nyQEJcKzRBBM2+Qn8JQ0q4gYxQykUttjszxrh5ZTJ+0EyvnczuZH?=
 =?iso-8859-2?Q?wCGjpCCI8l1EBC1Q668bcyVeSjAMuU8cuDc/+cZVSXZ/dQJGvYLW93M/Ee?=
 =?iso-8859-2?Q?VxzDpow7oNfWxMDc6RC2D9EOSCOAJvbrlyn4X5ariHJ/qCRxl/JuF9n96C?=
 =?iso-8859-2?Q?F9ULIdz578+sMDFpz/Bdlg+mOJc7LpLKLzOvu/V5cBpjv5+EMniRiHr5n8?=
 =?iso-8859-2?Q?/uHSMwRH1ps8ldw9vJNSy4QJd+ZVaZkkBiG7zAIpnAkFtPG3j3Vim3D8Vu?=
 =?iso-8859-2?Q?mtsEVVlMSKExX+fkWWT0Ps5IpEDlRGBoCBAUJt3eBDt4aOWwnhdioE/Zpm?=
 =?iso-8859-2?Q?l1TJ5T9WLybTNYwIjtDsQscxdlzVWhuUzf6WLEdpbP3Am2F1f5bEpmFsTA?=
 =?iso-8859-2?Q?98RnA6Yq5BS7L3Etpb/xVxYv9euxAShrJVYmyeWumCLCm9jaKqBXAhTEsc?=
 =?iso-8859-2?Q?fkehOUSXjglpA91chlwyTVD1amfxhcREu+7fptkFbNTiTR3hMFSCToYEq3?=
 =?iso-8859-2?Q?l72hr+xJ4K4V3Zhn6/0/VwsKr92vdcP/1P3UhS8O7zIBohX9RzLXIR+4j5?=
 =?iso-8859-2?Q?OuXjlU3IdMnc+zqHmJvvAB3N+5SeyDlZfePS0Q9mYnvaJhQVMrCZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2916fe-29cc-4579-4fe9-08df299f15d6
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:58:55.3450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8LQx4CHEy8laSYoWhYWfzVU5RdOxcmME46kbkCWbqt4w79LPXKp+eLJC5kQ/Ocq+6NZVKlG3vpNwN1PHBXo6DdIWelSh51YYpdU/fE3dMJt/YELGoGQl7WInMggg+dB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14695

snd_soc_component_xxx_controls() are located between _probe()
and _remove() in soc-component.c, and are located in scattered
positions in soc-component.h. Fixup them.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  2 +-
 sound/soc/soc-component.c     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index b19abc5c26338..0d316c48cb420 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -358,6 +358,7 @@ void snd_soc_component_init_regmap(struct snd_soc_compo=
nent *component,
 void snd_soc_component_exit_regmap(struct snd_soc_component *component);
 #endif
=20
+int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
 				const struct snd_kcontrol_new *controls, unsigned int num_controls);
=20
@@ -407,7 +408,6 @@ void snd_soc_component_suspend(struct snd_soc_component=
 *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
 int snd_soc_component_probe(struct snd_soc_component *component);
-int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 5a9b526676f49..4984cdf1f7b89 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -321,6 +321,12 @@ int snd_soc_component_probe(struct snd_soc_component *=
component)
 	return soc_component_ret(component, ret);
 }
=20
+void snd_soc_component_remove(struct snd_soc_component *component)
+{
+	if (component->driver->remove)
+		component->driver->remove(component);
+}
+
 /**
  * snd_soc_component_add_controls - Add an array of controls to a componen=
t.
  *
@@ -351,12 +357,6 @@ int snd_soc_component_fixup_controls(struct snd_soc_co=
mponent *component)
 	return soc_component_ret(component, ret);
 }
=20
-void snd_soc_component_remove(struct snd_soc_component *component)
-{
-	if (component->driver->remove)
-		component->driver->remove(component);
-}
-
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep)
 {
--=20
2.53.0

