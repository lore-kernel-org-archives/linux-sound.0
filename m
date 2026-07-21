Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E5B2FDC53;
	Tue, 21 Jul 2026 01:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597990; cv=fail; b=eM78ukJNEfXGEVI9rKswJosgoNAB+Ja+OtgkAb7EH2G/jjLLogLa68rsRNjx1gRouSZ39XpuegTkwAsZ972vdFfLYqUSWfMzkTPEWo23LbsBLrcz9Fj+jYkUH0icUX6JmQfRBHVNm9cjdDOHtaqwZN+bjdX/iYRpRcUlvoFxrdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597990; c=relaxed/simple;
	bh=2wW24Eozl2DUBgqG9bUxmpKMvjjxX/SmP4t8f3RJxJU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TM9rhZRgwcc/JPo38UXPSltOZFjulyU5TqcWYzTPIDlm/utBPP9jtLgzecZo4XkWU/1b+IzlizSlYZGX8fpYLeBAzW8lhHL7sQFZoUAH9SPen99VhxjMY9BxdpH3jz68tx4pZKLuqSZxRSJxS1i7YK8WyxKfVW7cLSuRmRpk3oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jZvlTcbw; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jZvlTcbw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkaMhdA60s+rFbhkG0Medag1AVbWrFuO+vyudzCZPbxnbVfGDVTAvR0hNMkRkHFsNKFWN127kH/R0t+6rvv3XlM62s9GPTnbgCfe484D4e3l4Fhdq0j9GyQK1+4NeVEmtgLttf6/NAMXVAIv4DYg86jZXsCZRZP9ybWaNfhCWUMcDM1QWYGo3gYlu1a7ewHXMEHcFgr7sgF8g4kDk4XOlcHO0r8TOX9Xe3Dnq5RVSCTSFbupqRHwU8V5EcOS2aYHjSxk6xAU6LDcsrntzkU7ZjmgHJ9Rsz2fb31SMdN86U2ivQRev4m8iJX5P786ANUIXC++3fRPDSwxp2/bUYcHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbb+hr/+Pk+BIBcAA856++6/JSb5dpJdcMP+LghESPo=;
 b=JaP8ihdm+AyWqFyNrSKExmozNM+ci4mvMtiEwSEiOyHIT01Pw2nDxkZe5cTHREeRG+g4ue5V6GGD+QIg6R4k+2VKc+1EGpkFWE+5jSYXPPWQ2exWXphbK1kNOMhxt3S3KEF5YzcByJcZpG4WmeAwAdP+K8o20/SCCHcWqnWUkHaZWJBEuyg2jfkcnhP6oE50yHDEaVSp8G9RW1CfDyBUvWU09CYCrI8WjP4W1uoEv9UmByNqnK5BYZMQOtgrISRZB9TXooqvZp0rd+XIU+RiaRiyUGD6BHdWSEdhO7rqLpe1mm1QrNs6MAIo/HprFDbTlQZGdT1H0YU9glVoiqQ+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbb+hr/+Pk+BIBcAA856++6/JSb5dpJdcMP+LghESPo=;
 b=jZvlTcbwkeRT02Zxvd/nc6uRCiXfk9oT68lVAMY1p8VgP39tXojkgF/K0AhYT8gLMPdcKd4zjcIRpievCGMl4jMNmi98eRtujtFdANCMztu4unMoaov0h3tYCmQhafFVzAsiLBsEMZAZNnISfTREJ7uDjJyMiy/LTbQolaUrurU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB17157.jpnprd01.prod.outlook.com (2603:1096:604:458::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:39:47 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:39:47 +0000
Message-ID: <87pl0hi0il.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: qcom: common: use dev
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:39:46 +0000
X-ClientProxiedBy: TY4PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB17157:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b11a389-3342-487c-6992-08dee6c8f272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bfsgGfl1SoT5vxHTWbpK5ujaRfFuoYuqz5oX8q+WHRnT31r1ZWmg9hRWeebZdSA4i09Q2OebLQDGzOz/YEdUjAGALrG9Nlv2kUnRi964YGD0nrWo/JlxIyiuN/10o9Vfiaq+Gx04u/YpB/N+aVh00sEeYbZTPd22LB5wcGBoh55EDCDw/s0I+f25jEkEzJHhhp3qY/x1jRH800JRBdIZ5p36f6ud03UYZFBx0CRdGHbt/r+hPM96vTuV+SmaiOaDHQU2aj2AeoVzZhq/8GEwBj+96KGJ8LQvxCw0sViS+uVfR7j8evsHDBwmtsc2/1sD31ORuzA8RSGRX2IeoXfyZTgvCeaHmxRCTF32JS/0jb51JBhq/jrVJoBaL3DwuFwBysSyVUVPfW6b2NYRflCkiMWOT//M1hyc9NyzaCs7oMx2jKSibxyEvacm7jIu/vKhXT63ynSvOQHigQFIduAPMFMld50L9dwcBEQsxIeRybe2NwKyvqRWV+DjQTVeaxNWayQQEUPctjbSYttHIUmXyPRaCOIzEMvpZwIqB09xS76Mv6vOoA41+R1APSvNxgKiV2OzIthz6KuILJRVGyO0dF9LUQBzN8qOmCpppn0Aw/pQxGorYQb+PQQvTWCMZ7c9SrwJXGai0jce5G1QQQkFw8L6fIROcCLFB6+svzWW2hlQZzX6B3ZMy9BaMzAzrc0Vdxooif2LdzyHg114gx9NBE2xqEa20v/WBqKaxr7wVyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e4DsDTkZ54r5UwljfEhlwa9/zNZPSwZWlCUon5I4PJIOweYq3IgRyKbWrRZ+?=
 =?us-ascii?Q?sUSVA4BeiCC+wluNaA6Wj7t2OvFnSecrp2EsSr750A5FnmqdBWMHsQM147dZ?=
 =?us-ascii?Q?M3ApN/gOXvcD4fINXPaeFQurCnoSdM5dIIKRNP0SZgQ4a3JrYIqnS8CtJJwA?=
 =?us-ascii?Q?/BeeCtrUNZ1mCGEgzHEJMJKGKEYKFjUFTe442gRNfzvu3ap/Tjcx4k8yb/2d?=
 =?us-ascii?Q?NiGMUKM1pO3lOIHcmZAl/EDuIb8+64bi85nIkxg3AeYZybuVn6/k1B0c1Spp?=
 =?us-ascii?Q?FHoSD80HWM7rJBYbwZw5mTr3tehJTVAww3xFDrx7Xl1saPeOFi3JoCkVxaXk?=
 =?us-ascii?Q?sk7naTRTcY32nYYrraDplH5zPOCd+oR+kklmdsX+55dkDE1kPhOQpi9UCh7D?=
 =?us-ascii?Q?U4y40feb4UWtLIkguHYSSLMp1WZyn1lb7izPhUUbi0gfcIZJ4WpC6x45rGDO?=
 =?us-ascii?Q?5VJegS8vEmLHNC4O7/iMmTgC3bKDWOC1q5ol52vj748mtnBze1QVx+RaX++y?=
 =?us-ascii?Q?FLn3Q7Kj8uBjGMhLNDN9Ff9qpWXrTZZ9x/zikjPIteEjz2f3mO7WXVzIReTG?=
 =?us-ascii?Q?rmyqYDa4M8ppkRjxjNw5VCUw2G4KywMpRcyfDX5741Z7dI+amS2h5u7vZOkJ?=
 =?us-ascii?Q?rvhSaXJUEXIuNvbGTtY7VYsAmSeOPjQrVn3MdMP9D1aNA9aPFJ4hxCScgq4F?=
 =?us-ascii?Q?hEh5gxO9lXod6qL+vxxTsm3TwtmI7z2Bs4VC9Kmn/J87UWKxDUO7ehpTbTrU?=
 =?us-ascii?Q?tmfyKWmQhnyomV38B0NUpc+C5gpt4njnr1bF5kMf8O+zWQFVULuuzNVxewke?=
 =?us-ascii?Q?zhI4v4xYPqmUpI3Fq0Tl6X1Oy/jWNDBRfTjKl++e5n38KxLcyKsKwFMHvjnd?=
 =?us-ascii?Q?M+nbTxNvKJgVDevU5oc4VEVFwegsIU6cIU0T1N9bNE/QBz95RIK/l6//3VZA?=
 =?us-ascii?Q?qPQAZDHNk/tqV/CX2+ZQHugTYOuqPaT7a+UQK+zUhCcdImHiOVG452OBMK+6?=
 =?us-ascii?Q?fQKSpSF7BAu9Zq8eIlcmQs+bXp4rFIK4Z6ogeenuO6mQzgIC8WSoWqM0qRIx?=
 =?us-ascii?Q?RB1OrWFikHXrY4VPTi3E31SH2qTvSueRfjXZTTGnMZp13fWnVHmrlDC0ajBU?=
 =?us-ascii?Q?Tf3ZYGPCKuKGIgowd97gedBtguyAlJDfMLiKVXY2Ir/xXr2MEZWN3lPrlA/O?=
 =?us-ascii?Q?64ow8I7kW2PBj9oAUfgBrSxoxQXbNrWEq3vtZ8+HK/jgFCTGQ+wYtUu/ZIGw?=
 =?us-ascii?Q?MY78zM2ufOWFgZlpHHaI6IgTdBzknFPAnHFm+/7gvpeCBS9Cyf/Hl94wUIly?=
 =?us-ascii?Q?8F9YC5orGHwWpuQ/whPNfGB7b1i5asNf1/DDJyusBDMLuU87fOGKxIUabpL1?=
 =?us-ascii?Q?dIFqHMt5cRGXU6kV9Vk61/qzNkgGVLrRWQJ8Fd68/qUt+aJjoktOlbucrCXO?=
 =?us-ascii?Q?yVvRJaDlglRLtVzPFSX8Lg7pMDCW/N/aQudr3oRTqcAxXWYD956NRUEZm3Sq?=
 =?us-ascii?Q?0UpajvnfhanlWyDrGftE4jg9tszFQAQSt4zF5vytlKFQJTpgr3t6JGRaebvo?=
 =?us-ascii?Q?Nv1/UOSDYIdVyEyc50wCgFjqlOLdE4cMu4eZz1th94djyDGnICUKDJnQOovH?=
 =?us-ascii?Q?jU3AKyjdMuelSVdK1oX55BhVH0axY9ozlqyVFBAq+UJ2mHdjNi+Yr/pSOhVW?=
 =?us-ascii?Q?I8m4GVIQBTgQAnDO9xfeNWHoMopXAnNJoySncuRWJU0RLyr7JC2pQrWiiIC0?=
 =?us-ascii?Q?JBcK3bHiBG8Y5WKJgPgGuHWpEKJTL8uAWkHJNXTST0mrR48wiPYY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b11a389-3342-487c-6992-08dee6c8f272
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:39:47.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPR83dyt1PGYNb/Dp96dJTSU1LeBPRIiUXFi2CK70y8vlOTAIab8VR7otq86bE5ktmwRJ1jEljg2kqn0pSpyL9sHCLxqJMOtpLq3xMUrMUqOmgNfER8MKh+r55OO2z9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17157

qcom_snd_parse_of() already have dev. Let's use it.
No functional change, but is preparation for Card capsuling.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index edc4611691f73..e4ff247ea47fd 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -91,7 +91,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		ret = of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
-			dev_err(card->dev, "error getting codec dai_link name\n");
+			dev_err(dev, "error getting codec dai_link name\n");
 			return ret;
 		}
 
@@ -109,7 +109,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
-			dev_err_probe(card->dev, ret,
+			dev_err_probe(dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
 			return ret;
 		}
@@ -126,7 +126,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 					"sound-dai",
 					0);
 			if (!link->platforms->of_node) {
-				dev_err(card->dev, "%s: platform dai not found\n", link->name);
+				dev_err(dev, "%s: platform dai not found\n", link->name);
 				return -EINVAL;
 			}
 		} else {
@@ -136,7 +136,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		if (codec) {
 			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
 			if (ret < 0) {
-				dev_err_probe(card->dev, ret,
+				dev_err_probe(dev, ret,
 					      "%s: codec dai not found\n", link->name);
 				return ret;
 			}
-- 
2.53.0

