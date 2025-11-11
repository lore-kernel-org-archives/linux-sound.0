Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC412C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820395; cv=fail; b=oBEvyqo/iMf1UawanYGkpeP3xocm1nTr4NzVuRgI4/NbYxZZddVMkfaHVHYIQF/uUjXH2o+/gYMqwErysJfL3uwtqKlCiWxPL4LHGiDHmsdO3G5O25N8VRTr9orAzXR0QRiW0NJuem13UGkWvHpr2nrOiI23kXNR/jEWPS8TaPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820395; c=relaxed/simple;
	bh=waC1+zM4l0cq2sqMibaoRTD6FyldIK1Cqf8Fs03qy4M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tqhDDlsyYgKq9IetihQhy2uke1/gP1KfqtWsTe3+p0HD15nfSmYZuPM9CQ5hj2sWG2D830IHs7QxIsq/8iRMxR51ujba76H5yjRWwSsrurBEGX2gYHGCxkD2xv4mfv1wHo/Ywj5f+oUO/8rBqnrMClfiDCeLrafj35+JYGeUosY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=R38PZi9i; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="R38PZi9i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGfWNQJp5Awr0YHXigeZYEkba9X3Po3KOONYzCOCKau9MoQg7+WCmhCHFLuS4smgyn/7OpAbUjXde55fEhhAXUDHZT2BIAOdc1SHxtpvM9/8HKz8L+rZAOvOLANNEXjCA+mIzQfNJtQ4szykHbG6JUfIi6TJvO2hAvIuRWXjTxk/u0lNEyvmtU26DIrIcrusmlYN4Wor2YHgwrs/y/glq+beY6qfMqzshSHmwSK67snht8lhXTDVQAqRvWVwRzlBBkkABJDo67hRVgncO8SKWUXGlQFqRp+1qdXV5uwSldrGFwPvBUqdmY7qk4cnEDh89s5a2DOabGAerghl4QkxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0y+A8Jd0K9xonUknfAganenzfnwjJNkHXIyK9UNuGck=;
 b=NZoYqmHZGVV7tC53xKWkdH/x2njWPahEKVCKhJ3IQJ7YQObCxMYGbQKrU9EWuJJRdbK9t/1GFJbADJhOWX1h35lzDA8EVD3tqIJ1YKrhghKGr5fW0XjWRK67jKzw5+sZgT9XSLQUYA+2moM+ISDmYiIe1GeceMXrfbcR3VLHZrxlDPTn1D7kpL1euFrIUs0asivhtF2CDiNpCA4nxq5czhUg8S5CT0Hj+IyS+F3Lr3s0e/PPOt4WCl4Xxu5FpVkHPBks+4FjupoNhyDr+jZ/bYuITLjsUyfSwK0KudtE1vBTgsd50M1g3cJO3DIP4hyKRQzja0mW+b6iCtOIlvt0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y+A8Jd0K9xonUknfAganenzfnwjJNkHXIyK9UNuGck=;
 b=R38PZi9ili6xWO+f8ysa+7UUeWnfbz7TlA6HnJEOJYwNW/aCBNN2eGSYZVmf5UE3GBjnIJMmNHZSMscXNQJd95sQbEEV0FvJ1ZcJWpFFeDUo6bFVDZWpqqjZ52VAFwQKfrMNcurDK1pjHTyVpC8jf9gC91VVWpk/zXpAW7a9wCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:19:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:19:52 +0000
Message-ID: <875xbh8lp4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 029/292] ASoC: codecs: aw88395: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:19:51 +0000
X-ClientProxiedBy: TYCP286CA0287.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 76514e97-e961-4dfe-d07e-08de20b80853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7hsoK6zYJ0WM7PWt+lO7M0jMJptl4fstp0SiJPWG77hClohFgYa/D1/52hCz?=
 =?us-ascii?Q?ZeNE/zK+TUqfZBewxe9Ny3q9L1qlYp5qslj2r8sJ8jatqUBvPXIMcmWa9mg2?=
 =?us-ascii?Q?pDAWquzHg7KFe5fIGGOZ0HIMEBevPiCHqX16t2uybNqBFMqKTrUjw6xqgA6s?=
 =?us-ascii?Q?3YJdN5M+AgUCDtKprFKJkecFmBNoZvP+eYUc2Erv+5C+/SDvhKK3sK+jjxuL?=
 =?us-ascii?Q?JP5/fN8+8OewV1DaR30yCm6OMPNXZWtvDPs3AMHSnwtcgpTMqZqZ5djxzJ6A?=
 =?us-ascii?Q?D4BlXnXb9p/fsWwksOvtJDIO7Us6m9geczNd+eCgNmM0hLJxEpPUV2V7HIlM?=
 =?us-ascii?Q?/vuBZbtwWZz13hiwCJIMdZcWApeGlZP9yHaotxyiHAFKvTQp0IPrI7ch+UYz?=
 =?us-ascii?Q?RY+JAbIET0YmlG0PkrvR+X/4C1nJpwnquWilG0t3u96obmWifSZlvaSfRFW5?=
 =?us-ascii?Q?oyu0CwUBdGrg0RW4DbyWNUT3OFtrAB2+/wCdaXGMPcTbuTjnOk7q/cbqBxkW?=
 =?us-ascii?Q?aRsV3XJvWCtroLiWpktbYNhGYLyfUosY6vZOmmHT1NivQ8jP9BO7JPy4D5al?=
 =?us-ascii?Q?ah17GuDESjbnueSIwYiOQAE1skwt0qRXIp4Eu6dk/7yFVQ+cGb0ti7nekDp1?=
 =?us-ascii?Q?aDIRAVsV7eduQMLpZbJYL4QYPVPpadzW6Dwsq6lr4SvCU/IXW0XxRMaqGqlp?=
 =?us-ascii?Q?vPf65ubFi2bJKZNqTetWyQG+IU0EUWEOCwykwBbMyZyUEsrXJ1GvRL5wPNnS?=
 =?us-ascii?Q?AjC77qCsJn37PVdxR+zRRwvKZHxZCYKUcuEfM21jm+RGsQU+ylteLd+jkAhO?=
 =?us-ascii?Q?jD5XlTT8XM9uHvtDjyu6gcB+JAa3dTq3fr4HGvH0jL9HfsE0boJ6uk2y6jSr?=
 =?us-ascii?Q?QdTjIR5c8kRXr+8Zd0bfl8YoD9QubvImu7WwRdWXrOtf1lMs4hOLPlTPIHLl?=
 =?us-ascii?Q?S7+ANpXiOuqanBA7xa438PDE2bwelkoEMCVOorH581btvFuw/4XPJ8VqELyI?=
 =?us-ascii?Q?qcOYEtoIOv4ARdf6rEXqdLmgQQGnlGKi3DK2D9rtRxWRgg8pXWBh8mTDdofZ?=
 =?us-ascii?Q?S790jneEs8yxP+3gqDMm4ksEc1YLrTo071/qHYHgOwTFdZ53Wfde+5Nb+tPC?=
 =?us-ascii?Q?6KZm2fIMvIMcWjFLAuAEh3QolfVS+f/nwsx9roV10ceRQtrtGug73VcIg4z4?=
 =?us-ascii?Q?lefJF7b2HR29xjlOGWh112i30kUOnW+rYXrYmNbbJVaoIEj+JguS03IOx4Zh?=
 =?us-ascii?Q?IrQCHbg0B0anoNHWF2Q6o3qT8EU96K3TpnOvPIcgEVeKjUHG9M5EO4QrkeuI?=
 =?us-ascii?Q?X4y9yq25IIpoYFbPc0z3gInIE36Z3hlVtYx/FdAj0RjA1b1F21zozzDF7AAv?=
 =?us-ascii?Q?u0hKgoLpkfilmoJoiTHjXEGvXzURXXJ4/vj/G0vt1QiNGfWoHk9ELEeRWaYm?=
 =?us-ascii?Q?Ibti94pdpNCJeKe6QgVXuZ+hriCyVzdocxoHEfo1K2TQ+J3vaNB09kPxvnVd?=
 =?us-ascii?Q?pOje1qWI82GBjgMqBMGmhMGARlkCrdm6SqVT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3x73ezBYCIxAMmxiAeqNKimkh93xccirJ5Ez4JWt0AOPX09qyq02vHZvpL8V?=
 =?us-ascii?Q?AgXGVkyAdD6RMFxJ54T4avHwzGiY9nMFU8GrBJ0TJNhE8yOpX0bVvuUJP1s8?=
 =?us-ascii?Q?Eo2kPZNLrEsX8Gl2NwZAtCWKTGmUtECMnmJWGmt1WILURU4aoH+2aUjXGONv?=
 =?us-ascii?Q?E9NepfaW9GU1z/U98obov5n43DABYZCcE5uXeaCIWhfecU0kbTa+HtgsgP+C?=
 =?us-ascii?Q?T8YVRB2zDprP0isXbKBx8B760XLRf9pXBL8dWn8g2sNTVosEiCrNcOoo0RtR?=
 =?us-ascii?Q?47AL7CEzq5UnC1hLxxgDDps/i0pMdLC4ZV7i2i8h/qhNnfCGdfnQbmNVZhww?=
 =?us-ascii?Q?tspJV1tA4hctTwAnAIa9J1M9SjVUOIIX1GxZwV7h78zaifESmWq4n0qyC/6P?=
 =?us-ascii?Q?OQFb/bEi+27ORhYI1a66mvsg7WBWPHseksLnicmfhw8ymygBrh2vvIbpLbzD?=
 =?us-ascii?Q?jMr7xtkValLGHflundCORby9wMibSm4NM+aN+T/PqoX4bI9ZwqIgw53Xy9Ea?=
 =?us-ascii?Q?iC0QzuhqrvtQQu94/jibifS2GfBfkuyk/jLEoHa2ho9JCo08iIp//AzEbugd?=
 =?us-ascii?Q?ALC6Z1O8EjvSOC/ozJU2TtZaNGNnOFe8TkgxKkxErPWrnOojUxg+geoEkHtl?=
 =?us-ascii?Q?7g7zCSZ3rsQMs/mAj51sZDnAB9LO19v5JK+iTrzxmeHSfcdrUFrKh6/IUKqk?=
 =?us-ascii?Q?3lTq60vtYrLmiHNxXcoF6aVFl6eOIGSfEOS8QNMzaAn4chCniYFKozNJ/o32?=
 =?us-ascii?Q?KanS1w7LNtJlXYIeZAqp4rUu64Kgjs54Zl0O2yMuQjE3Y1Kp511Bm87ahMao?=
 =?us-ascii?Q?2bdAEebpJEBy7EUbjirwLZhZy5a24j0lePYEYtJzAZXuhvStmHUKf5ZnVUKq?=
 =?us-ascii?Q?mDsTwbPxbMpi5bHdCf+o5bxa/Pkjk5qy5l3YlXdUMHorsDKcxz5aHw5TIlpp?=
 =?us-ascii?Q?oWijmeGm4JSvfedvXBWIF0gZ6gymnA3UvSCEI250fFqt+KvkBhVwpFbPJu58?=
 =?us-ascii?Q?TDhQ0iIsRAPT2vRSJzXNl1XGOkskLNvg7YNZsly8qmLrs5fKzFXWQy3wEHCV?=
 =?us-ascii?Q?Ic+LVWJAloylAZQRem4sbO2EKEIizaMPb3Dscon0+5YlscQ1DZ8/TJTfaHUx?=
 =?us-ascii?Q?+6AX12axRgbTIdeIn18Lmv8ZwQ41PWEgsQ5BsN0b3MgytAO1ZfBz8V0kKj9e?=
 =?us-ascii?Q?Nvi1Ar4eEpi3aVA4q7Li6Ws70Ti1ETMySCZjidMhECDEaDC32XSk+9I3Nr15?=
 =?us-ascii?Q?xNJLHf0VWeRcZPXZ6G+9kAbyvxf1aLKAbEF1BRjDsJ6OXgKyXw9CWgbjM/lG?=
 =?us-ascii?Q?9F6ZaWHtHB3Cb7AmJxnDq6mcOnfpgx+4I5mXcWQqmFap1Hp1clSMYTFRTfnP?=
 =?us-ascii?Q?ZhARX2+XXTZhOEjCrOucIBk1gUmj/Csz0UBZdN5sDFRulAEsTMjaijCV0FEB?=
 =?us-ascii?Q?YwDpmZG9OzHNkg6cGk/L27Bd0m7IsgzgmlzDbHrAqgwp62+ecpc7SZmvf4oM?=
 =?us-ascii?Q?0M7iZC7uDy8ABmRr7YOygEfMxk0cMDYq3HtX6y8bu+D1ihK4W0n5rZs6SB4h?=
 =?us-ascii?Q?Xc1csbc634bOKmlPeNY/GVPWfSGUwkCz7hJgXZAeXsiHEAZu7rXIY1X7A+Tx?=
 =?us-ascii?Q?lkryCxaM7X/nEkFJ68guhOs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76514e97-e961-4dfe-d07e-08de20b80853
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:19:52.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2OSglR8HqtGgR0sDfhKuW8qw6dPIML4jadiVsqC1ul0fCdwsWYuux/Vxf9QbHT/47SxE/hJzjX4DtV0jk+Wo/yL9FUd6GBrVG9fV8NrphauqkfxpLTtMlQyvWw1X5Pl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

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
 sound/soc/codecs/aw88395/aw88395.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 9173629ec1269..3602b5b9f7d77 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -401,7 +401,7 @@ static const struct snd_soc_dapm_route aw88395_audio_map[] = {
 
 static int aw88395_codec_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-- 
2.43.0

