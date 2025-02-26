Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3421531F9
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533625; cv=fail; b=FMYdSLjQZZBf8NoO19afdQlKjK2k8ZEbYIwe7gadUoH/KVen4/jZ0TNoYkLNqsxgCRbYcarRtOUA4GCgWlmjlnW6ECtB031SROmQlsitSDp0u4hQ0hPCrzl/NNgyTuazuQYHFX935sKq2pjYLH/2pErbjGBirnkanC7iky6aBdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533625; c=relaxed/simple;
	bh=eC/JL+lW7OutQbkYmEPMgt3Qa7JH5MIjSPTOPGdFZGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Cqtneb+bK7FRLSM6vPyb0yHMpdoV9wK46wT9XidYbwbe2gDK/7w6xVgKcf99aN5klVlOP4mrybTyodOfjAsTkQcVNOdwk6kAvEew3VB8lvXU37JZvvP+xKF8jNiB8232V8LFw+mVGBRjyWnhBEWYN6ljODcRbjC+97l1NI5/lfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dXVL7Wg8; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dXVL7Wg8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDRXfygniGVneUE+xOkiGPXh3GsAL6+IF6O99CKT7XEIjfJfY/+p4up6Nwt0jI5PcQB5C1VjP7h6IIJpK/pnputhd1KHtoML+UInp0CIwGoZPGqvWg6rZmupSr8l5KlC10M1G4eS+qVMDWTqTU3PzBtqWNaYgjvo/Yj+Fj+eYwweH5HUkUYNCQ5jBi80Hypb+NIZmH2kA2R1kjnJ6zeCOn7u9Y88U9YzRbM6IZyhYMX/3Vw6vOYsoX9RVvnr/kBVCvWKvQ11rXs0Qkw4YBvjowfV7zgPHvrpM+oUCrjN3wsWwFiE6UgSFw++IjSQaj2j/N4/WVD+NycgVtUBoER/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIJ9tLcHsLKmPugxiQ//DiqwcjBk8WxhaZ2avJzfZYc=;
 b=khV3hsPk5XCG0Oas4PxlHlOjzLC/MC6d3Sw8GzZudaG8MTP1aTyW5LN+t2vVOpxBQmH6FmipiHBxCmYT1TT+aywStl070CIJjDS8TSmQ9WSCp+hNegb/7ACNI6aLdv5MvM3cF/zbMla+Tk/UH5vk8yRs8sAGDoM0sA9Zr7nFumtfPaWhV+J8TYV1PQMohNr7dxGh5CuBxrbSgeXwCBBsNZ31AmLTyqjCaLzFExB1/zDkyAJgWJ6MChvZ7JcTsNbNxDi0/kEqZmcLXCBXpKEpyOyP2jThaNg2aNDqxvQ6bRxP5GThNAJBr2ujW7GAJRD5Mdpc9Afv63ptog02+DCScw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIJ9tLcHsLKmPugxiQ//DiqwcjBk8WxhaZ2avJzfZYc=;
 b=dXVL7Wg8c5xJrQY1YuULXkMcS5S0Jl4ydBkCQIVin4wSlKo1TwVU4E3Ztkm9VSx6grI+lTtHl3CNXcDg9T/gssfvPuQ0nKhSX3IsQlPoYmCfAdpT52sqIGTY2rMLSbJhEmVl+2m2ntcPHv8CVjMR0EfkrebMd/pD0KcI1PNUOg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:33:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:42 +0000
Message-ID: <877c5debgq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 056/157] ASoC: codec: rt5659: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:41 +0000
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 240436d9-8935-469d-a551-08dd56059a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KoMejDELRJ/SFKeDVRQOaiOwILzpaDtvZXzg5Y9s6OGNthTHnnuZRRf9n6qP?=
 =?us-ascii?Q?6pXObHxGLVHjLKeUmvwl6zE/HpkQ0qCrVrb6ZtiDB0YCaDtp6oAgHP2PrUUL?=
 =?us-ascii?Q?rwivZ5vwf+c3opbapzQ6n8zPee9WFp/ZW4DKGzSlnt0auhhoUFCDHFHwmzo7?=
 =?us-ascii?Q?2nLY6VS7RMiT2YldqYw19tdjTkwYr9vVG26OY0fJIdfW/9F9nSBg6FMyZduL?=
 =?us-ascii?Q?1gYIQVul8gYHSFfLU7obun5p4BDIJGJlhsaXjGtwLOqNkRUPUuOjkDeaeF8r?=
 =?us-ascii?Q?9wqd1Z6jCMNLuXIJbNld5/LyL0+e4+XXdIk7PzHboY3J/Zp15v5KuDHjSCgT?=
 =?us-ascii?Q?q8A1W3Z7GhnyKqxhwf428MfNG1svbfWTaa+6w+GZAfc1YpafUES1DqzzYejY?=
 =?us-ascii?Q?az7JsRJFTP4TnlTQ2NRITjlKPEpVHiDraKF2d8lXBxw6YkwC+/s7NyZNDsa8?=
 =?us-ascii?Q?xilwJ9T8TiQXQvN5SLdx9qL3z+DI1n2b6ucRuBMCPY4XfBL3yi/5qGHFYWgJ?=
 =?us-ascii?Q?oiCwI+o2Ap+ehHbxuZz0ya0zlR4YxN4Cf6C59EC7Zh62FR818kqQEQmdNafs?=
 =?us-ascii?Q?tuYo5E7dHAvv+QUC0j7h3SNGDTrmcMHXU7sEwosRUKhuTQ+NO1L8OjogZEWH?=
 =?us-ascii?Q?zEZBpObR79oYDgzledfYoY1OxkPOIZPLQz0TbmCcRhUY5M6miS5q79KFVG1M?=
 =?us-ascii?Q?hXGMkSvyHiVReKlt+LcGINYyIld+P25oEbr78sBOCJO1rHgD0HO8jQmvv3VN?=
 =?us-ascii?Q?42hFJE9F/A9cwS63LbRoxTY1/hQVx6isH2hgzbLfUeafyT6zs0hokAmvR68W?=
 =?us-ascii?Q?y4nV31SCPsYctA6DP97/psGUC+4Ad5r1r7OXlvV+PyCvDL15CJIGUtcK+ob2?=
 =?us-ascii?Q?3a4SEoJx9YTHZSp534m7zDA6R2+DYLWaTHCN0w6gc4Wk4l8XVwiixu+QKtOb?=
 =?us-ascii?Q?Y+zGMSYsfKGMMVvTScCAPBQ399VWkUQRz3S79GTt5qAQbCwm6kp7YKwlEzXf?=
 =?us-ascii?Q?+gVqrnNoua6baKeDXhAIBEujEbDgX2gtGbjScbjiNmS2Y5pykPUIo00TznLa?=
 =?us-ascii?Q?ob3AJor5U+5A2B/QcZkFxbNUuIEGx43VH3qSwTRWyM97UY/O1OJUkki4Bc3/?=
 =?us-ascii?Q?u90KO0Anm2/h2wkF7HvMHqCayGvaFRIqp7qlWpnrsIdvLO+DnYCtGJOiRKG8?=
 =?us-ascii?Q?BMzmSwan7C8CwIbNDuYm9/7HhxItGeOnMdEQT+xphywq9hgxvED5G5bZP6/R?=
 =?us-ascii?Q?0fCniWwqE/W02eFJe/1ZWZnkHleJ76G1AkeO9ox+lRvjBJeORbrMfDD7aWTu?=
 =?us-ascii?Q?3B+LJMaz4Y5x+CCWWb/osIvGFrnAxm+7jy/fGisVsfE50CwDYUKGvFTaN0DU?=
 =?us-ascii?Q?s8ehuWLYrSTmvzt5iYtX93+Ve9q9S7fgZGFa1Y4kjGsYuiLKnHzOzV7iObMi?=
 =?us-ascii?Q?RgsdP/Jg7LowtveboJU47PnXWffcGr5S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AUDxtdMaqftaTwUzO/Jeme/nSRYeLxSHmHw/sW2bEoPMyKKGOHfjdeuQTdc9?=
 =?us-ascii?Q?l567eNhE8tFjcukbsInnFHeR+W57vD3dW5gwOZWTohzfHg0dKRaPY1gVrHby?=
 =?us-ascii?Q?E7/bZUdvGjpDiyblUymGkojOALAr29+0BKZzxXvJya+59zAv8lre7L2NNJ4d?=
 =?us-ascii?Q?D3nAR/FhTuLRFuV8kwJVgqLyoQRaoR6LdxEfsbTOUyHOyekaKBfAuSg7eeWF?=
 =?us-ascii?Q?CKFE1SwiNyJ2zMsM4NZdcznFpfDlmC4gEAa1am/Utk+zpbsdiXbIWZ/qnnKc?=
 =?us-ascii?Q?fD5db48v4ktG+vfWhf05QKpcSsrMOgHSJdCkU+QHxNCpLJDDoMrlH09/TYFV?=
 =?us-ascii?Q?ZbnIRUIireaV2EWvemMzXc1DeXnWrbLsYGYVElEx+o34O95dHUtXHgo/HYg2?=
 =?us-ascii?Q?jI+jAcnYFnfordm4rPTuMqyvuVet3dw0qrS/Mikry3LlTfadigWgnNbVfeCw?=
 =?us-ascii?Q?Eck9Dgn63KYy3/kAGiQh2eRiVnzC3X0kaVBfcDhunL0J1g7T+VWcvpHEGXuL?=
 =?us-ascii?Q?uAMNUv7B0U5BSjTNFLFS7WhNao2GBOTH/vMunZxioQKgppxQzo3Tx2dQqpME?=
 =?us-ascii?Q?ZAl/InCz80V6HSEEVFxn2wZKZS1GgFbQUYuGpyZbpY2J0Ok3kMHHS6oEKXyy?=
 =?us-ascii?Q?kqM2PByBK1irYcgXlFNNWEjyXOz4nVMZEITSSL/yYbJ2mJg+6SSclT3+9dcL?=
 =?us-ascii?Q?NVaq3X9Lgo3XjKdVWwRcAKqvr97H0Xcb+Wg9fmKai0jL18sX4XwCupOMUtKh?=
 =?us-ascii?Q?bxy9+ShGN9vVyfd5V5Z+D91StsdIwYkZCLEfFyLV++Ww4ovnQjfsB/o6x6uY?=
 =?us-ascii?Q?SD/9NHw7rnlJRiBiaOKFr9hglGl/7N6lLW3nQJ1EoOOTVPUFeNFU2PGeLtUn?=
 =?us-ascii?Q?9T6PoFzmUQKhzRgw3BJbHkEGgmMB3nfeBo+15+J5v+yntSycksxqiO1G457f?=
 =?us-ascii?Q?nz9o4myUI3NihPbvWr8E4CHdUEc4FV+7bDqFbAMUsIX8wjqZ/uJEhW1fAdaO?=
 =?us-ascii?Q?yVUzotUNSAEPEGM9vRIJQYA0+eI64k00N7oHIe3pYtA52khBQPKsDBMJ1G2u?=
 =?us-ascii?Q?sAl5PZb/3JQlU496maaCreXQfi+G/VNqh7sGymR+dTJIqsxZNcFRrrfkkm+v?=
 =?us-ascii?Q?/v3U/32jW6KNYAdWQWAz0fQ8Pk6fQgcZ6KVJEZ9oMC9W+AYdlfGUR88pPDh2?=
 =?us-ascii?Q?K9/bJMtmyQZ8DNogjwccusFTNJT0jKFXwfjLOJtW79CZAfT2XiSOYS6XpQQ/?=
 =?us-ascii?Q?JDaresqFDQwCyNVOkvisL/Nb9PWLGZ+p03AVZ5F3yoXFcv3gdQGcpzpyEGVJ?=
 =?us-ascii?Q?NIkNN01/bxWcilACDBOXMIRLugIn8nVgbgmey0/cxW4dKycxO5RDOrSDotei?=
 =?us-ascii?Q?f/zhKkC8dBqmkbvlJqr+s1xs1J2Ez34OkqMmfpGvRi0RGpXvIRu6e8IsR+ii?=
 =?us-ascii?Q?LGHMIfJ+Kg94JfUWuklB57OYcFMoLDOFHZEyLhOv5bUI8AIZck5vjZTaLhET?=
 =?us-ascii?Q?XKSEQKZy2xyOQfJFp4Eu2jMAYf7JupMTx31AEsRyW3fwfpouJKvQN/VpqUwp?=
 =?us-ascii?Q?wjKEU6my2grdE44pnkdDut5jb0r2O5qgYhAKIohHuvmlepsOxKpnaKJq95fE?=
 =?us-ascii?Q?jNi8zoG15j/n4qF+bSZ++qQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240436d9-8935-469d-a551-08dd56059a48
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:42.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCdY3tKqAWuRjrhS0YvqOCh47y3f9ujaBxty9yopkdOCFy6z7ORd/cvlvsR4ULLI8f3OaujmBFzYBk3dEmtGXrSGX6GbS1CAXOg+cBctRpo1xI+QCnI9ztAwIRZYUCYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5659.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index a2652fa6e1d7..1083e7bffcfa 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3363,10 +3363,10 @@ static int rt5659_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5659->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT5659_I2S_MS_S;
 		rt5659->master[dai->id] = 0;
 		break;
-- 
2.43.0

