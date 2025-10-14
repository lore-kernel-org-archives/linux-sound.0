Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633CA30ACFC
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416002; cv=fail; b=Qkk4yqTfOM4AJYNv0KcDXwRq90q937Q0VDipPbK5N56ulsqn7CVJLopf4As02ULnsnEGvh9nZ/KzV78+j9qGFcnmVbt5shhq2MZfgu8nxN1Rq5M8Rzwu2Is+PDD1cSAJm3KvMrigN4afNVgvSAfXF6m792W0WOJ0GS7BWkOhLQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416002; c=relaxed/simple;
	bh=DCcZs3GsI3JRGU4/vmGWAJKGnZLfpeKXWqe4l3whlPw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kC/4H0k05aApLWooKhgIRFqsIci7YQ4yIDx9lb4Du4N5gpDhgiA5S+MjwOgFu7N+3S0E403KSxIFgQI0NsVZygIncoBHmzcBzHDYSHSocIH96udaeIuk6vGBYblhcKk7a/OefQ8eDAFS6kzNNWxDBzbvHoXyjgmeM8hFbapQsRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aS2bCI3b; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aS2bCI3b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvqhaPjV2ejRKevm3rqbDweAnb3oKtNS+AOXuG7OTvuDknYPoK6JqAfCP4wx+cWRXfVPuhKstosDW9vcsIHpSsioSvq78bvXIojpo0Y8ASgUnozIbaQmx6YK2IxSpgtENGwwYoyUrTUPQtivgvHwHu5TeykwUSpcNCidQdJNjnWnbTAMXGTDboSWNi373k+LvdwXXOx+w4iKioiPE9/ZxrGrEcRggU+RRkneKg0DWS/DJgxDaFH8RBcwfPx6lLepSKK36e3AA1SytjF2bVuMktQV2ZuOpTu+XDvpHcljHKDZa17yOLmJRjkHspajv05k6ZDPMkJHK3HhF4sinBFAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8B2UO2kTmfc/KB6HkQKrnUXzsSVvAM+JN3PXbUPWtY=;
 b=Srcc/KW7x4FBXOGUUCFnEzojE1hONPhZVvSzbHHtkNgg2ZdXXs6UtEEFSR735da9tumTnc690NgER7ZPFpN0FnxBfS4DaOGt8ctO0bLzDjwbj7bPedDq+eC2olbPCjXfRC3iKbiq7tsp+f8DZvMxuNFmX45tLL5Z9LigXheluR026lcNG83bjOiEYY2yaV6YF+EzhQgFJCVI7HOIWFeZU4uU4LdoNr60g7YZlTJBAnjl57rGPd6nsxDkUeu5HVpInMEMhnPltQYjnSt4MHLVrhTd5oW9+78Lw/KaTn/igbwNGlEssc1nuNp3b9g67DX2GjiXWGWjaL8klH3kyPmDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8B2UO2kTmfc/KB6HkQKrnUXzsSVvAM+JN3PXbUPWtY=;
 b=aS2bCI3bsgVKC29zYEPSY+Ao23v4V1jEaunYE9DaheTHA2+PVtc5CMi3s83akowAs10tDZV1tjMRDPOO2AUR1/2lb4SkJ/lA/Co32my6b/04iRaptucKpLQCwKT58kiVZs65uDGjXrm/f0cawfpRUowd59cqMAmcHWEQHdbgjE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9955.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:26:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:26:38 +0000
Message-ID: <87a51unm69.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 115/139] ASoC: codecs: wm8985: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:26:38 +0000
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2810ff-686c-4367-704e-08de0ad9de1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nPP6qi47HKVFdFFjaBs5bom23bfea7QHFSV8IBc1OkP9+zaTJyx54/U45Rm5?=
 =?us-ascii?Q?NL9335J0vxMNLw2RqjKgWHwH3H8yYeeaN/waqYld2TA8jQe0viTmcktt2zrE?=
 =?us-ascii?Q?V+lA9qNRSp55vLWaV5SGRZbz97jlMHSpFOFoFNDiw5NYolO3BD05PzCvaTrC?=
 =?us-ascii?Q?1KczQlSMYpkQ3wQclbSs/lsCdFILf7sR1CZ1rSDoziZObAuDblKDzFgay8AA?=
 =?us-ascii?Q?bvhPXIbXXl0mginsFgadnJDBfiQs8zvkkWcYAH5y92lyOA/fNvhbBg3UvJm4?=
 =?us-ascii?Q?Gck8sO1A6MJv7Hdr7LzCqfTzZdT4UKcQ8SCKXH8A+pVbWJXnuB40BFoMiPmf?=
 =?us-ascii?Q?+VKbVmmMWwLRbMkegZ9L2/BrycEddxCBLWP7KGtLF2RYtv2Kt+gWynVjYXIx?=
 =?us-ascii?Q?eyZnzQrxgMl+UNm/kWBQZT9kDEuOrz37789QOor0CinolrE+pDsA74tiS7NP?=
 =?us-ascii?Q?Flvln2vNOZn4PID5gk1y9gTyuJRp6Lq5jBt9It3ww17t+Bw/+Qm5m4sWyLgi?=
 =?us-ascii?Q?Q5o9fHDztstWkabM86ES/TBQNf9D18tpIqHK9rMuAXjQId6khZI+Jh1h3l10?=
 =?us-ascii?Q?dBRySl14eWE+xdWx32EnHRPgH6f35Wpdwwp3q6EhbzCGcEa9eMDLqjj8+Uqz?=
 =?us-ascii?Q?VxaqCnl2zlCoWachuZvriopm/pmtb4UI6G9Jhfhz8glkzeoKExh3RfxsZJw5?=
 =?us-ascii?Q?44OyKSc5gn9sqTXmUBsev1kQoB5ulA9mR1DYhjoKGaUk9GeReEG5rx0Ud9+u?=
 =?us-ascii?Q?mOfNam6jubi/mdxJrxUHT292DP1NeJHsakOrTf2i6ByMo+Le9tN5HykYpex2?=
 =?us-ascii?Q?v1o5UEfupkdMDHSxEqcqwbMGeqw7JXnf4eUVrTg+Rvd+AB7mxt3Jta+O5m7O?=
 =?us-ascii?Q?ayCNpcOx43b3vqiS81lmqP9c/+s/gM56+XyZjJF/pzMHNrE7iVce5SB6JIVS?=
 =?us-ascii?Q?E40hliJvtvS9ZGQj6xyhE/PxnngfFWZ53mKXsmd0rsSf2698KFZWej8wNz4r?=
 =?us-ascii?Q?Fthmclm5CPDwazDWF8XOQDU/aHw3s4ETFhszpba2ZAVUjZU3VJReDdz3fF8C?=
 =?us-ascii?Q?jQTornxDi/YwX7IWhDuFDzSPj3bMR4beyJKWEivaDIflYzQVMcVrDhmFUOIC?=
 =?us-ascii?Q?A2smVEe5zERKfvrCOR90PT9Ln4iuFVOlSAjszwvGERIvLdNTbgqTPMXAaji6?=
 =?us-ascii?Q?nUd9E/KrGzL5zosE052ro1tAHgTeya7zf/X4c45V/FPwuiYin1sPiC0q5pf1?=
 =?us-ascii?Q?8W4Q9WdOAKPkjFYwHny1D3bcxe87RNYeyXqQK8zf7eEPMoaWNs57in90VeJp?=
 =?us-ascii?Q?a2JXQ3ijpXfF2FPpfac+jotB21OB/8EQJJz3tTClcZ7Ilbz50fFwHk94dFel?=
 =?us-ascii?Q?wPbIHCTI7VqEHS0py+k8tMJmA1nlKwgrutmlqXGg+9s4QpSDK3MA3O29YlmL?=
 =?us-ascii?Q?4tR/ydQ4U2jETEdOPdN170dM8nn5l+8Km0NHewEsCzs4j5crvaEiHA8V6L4O?=
 =?us-ascii?Q?B5jVP2EuabHkMkBWs2TZ7/oBWfT2YxMOy3Dw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m5QMuwE9W+7Ym3wRM+jA90i26HSnleKYpm+fB1Q3einz1mhZC9OidRKntDe0?=
 =?us-ascii?Q?2CKsHFkDcYIa/sU2Uj9Q4rz/jh5L3asLJ0r9gO6FYnRApzN7Tn2Wyd5BqvhW?=
 =?us-ascii?Q?zwP1vjpKrJMcL1snCwpAtog7WOtLOJ18B+LXwJH2J1vw+1S7SbXIpPUejrhg?=
 =?us-ascii?Q?NQAmYTTMjF97O1baG9px/dEqxviec3BWbFNsWs+qfBvLp/qb8hDKyycJwLqo?=
 =?us-ascii?Q?496Ojcnoxeg0wMvAoxHrnDaWOr/YzH1qnqvhWZ230fV6i2A9PrNiQ64GLPoW?=
 =?us-ascii?Q?Q2LIq15Kj6T676ZizCLBAuWXMsTS+vQ21WWeN4jSGOKud0hTstoqzUDPXrJI?=
 =?us-ascii?Q?CNIq8eh5RjAQT2ofoEXHZzbom7qxQ4NcD/Jl+Q5h1iQbQkvGzbOixyQmPvT3?=
 =?us-ascii?Q?VSDjsQe1TQsKdAr5flFHjLhKkbNRDvR7DL0/M3ZADvivds3/lwGEfa5FcDKR?=
 =?us-ascii?Q?65I3qHkk0cjLl95KywpUYMDBjVpOWEOmOeDJ0CzF0Ur4GhaQ6F2jYEgaQvyZ?=
 =?us-ascii?Q?QiNQ9HoYkQSlNIcajae4WHU/moSAOh632iWskZs2/1iCelpyqWw89eYjlEZO?=
 =?us-ascii?Q?MGMopblDFuwUyWB08m1LY1ywNV+nTRGlSpw854IgptwUd24oMXI2IPZMNmPG?=
 =?us-ascii?Q?e4sytn1bfac/dBEufRZyDdhca9ZRMkCu5WSELohsTPuQ+h9azQZ1xvbe/DYG?=
 =?us-ascii?Q?mWBmOrRZXtwjmD6xeJR6cC+cXkXCsvo+tGI/PuFKrqcbYNXgic+nb0sP0KPq?=
 =?us-ascii?Q?TWWsT4Jrbumm9MGNXjw12hHw4C8SzISUdMptCRWeJ24sn6XSqHYJH8w9qYMd?=
 =?us-ascii?Q?asEDU9IGuAqiqRhzOlHmnVHY7KAeYM3AoGUjYiEDCfpHqrkYEIDqoytQLZpb?=
 =?us-ascii?Q?VCYcUsVTnZ+CpGCoSTbm9BLXwuAFZAGzvqFMGI/izI81kXkCtBHq7VaWfkfl?=
 =?us-ascii?Q?hpEQrAqsHn62dVgKZS0CX/RWaIjatv4Ov0kR5WANpsKJ9CYIn8arMC+A7vAI?=
 =?us-ascii?Q?uu0uo5auWo5vBGl5UAP2XMDlgNaXJLlrVPSd6mJMD0afG3XqOZ/2SkBaevFw?=
 =?us-ascii?Q?FGudoP9Jd4sMy0+iUiVVZBvZMJ12j+H3n8s3jcB0JO5DXSnIehiVf/Fsn1ep?=
 =?us-ascii?Q?CUXkuPlYZVInHLYTRMXy5ii59HQ9IeQOXyaGm+QmdBy5TPQMVGtDQhN4ujQC?=
 =?us-ascii?Q?oSVzOZykWMxYIKrZa2cKv353K4cuIEkcYejU3yLwVYhol/3jvylX9ZLs0Naa?=
 =?us-ascii?Q?Y9zQq6rFwQYPrPTMCcQ1mSMN27avkFLIHkNTz0PCRIuvo4Uf7/OvZk7VEhlF?=
 =?us-ascii?Q?NoeZMCRxXafyWQd6WlLqV/VpyXXmLvljYaPVTUrPpnfTQy4QtsV9PsquqzAR?=
 =?us-ascii?Q?SAn1HK8GJx/rufW+Q9+v90ztN04eGFAVEjglFk+c1TCg/IXpsapDqpWkXQm+?=
 =?us-ascii?Q?ef6pu7JiVr8QI/gSx178Z0JPx+BGP5De0exIAqWQfWsfFaGhpoHT/re7Wqjo?=
 =?us-ascii?Q?ulJ3uAREb/Ok/wNI7WAX4kabBhhx8gvgdeMdmhCgl8jdtKrWa+Tenxv3DAvn?=
 =?us-ascii?Q?tjtnfi8sDaSXAGbgIYbUzLR+iUbo0ohQD1Uv6eKUY+0eF+vIBSFwDRp+dESN?=
 =?us-ascii?Q?bNZZ1LLE5e/nTZj7QEwbTa8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2810ff-686c-4367-704e-08de0ad9de1e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:26:38.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz+GfFaytsVwBw8IjrftnTs4zmx6ue1Fn53E9nbkA+8WkdqLyqCQeQkcy3iowgNfWebAJZnqxHyqa/AbSeKv3t3tMuajYv7lei3+GSr8w0g1ahO8UDXwm+YfBPR1KqHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9955

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8985.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index 2e2d07193c41f..b8b161c777ec4 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -589,7 +589,7 @@ static int wm8985_add_widgets(struct snd_soc_component *component)
 static int eqmode_get(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg;
 
 	reg = snd_soc_component_read(component, WM8985_EQ1_LOW_SHELF);
@@ -604,7 +604,7 @@ static int eqmode_get(struct snd_kcontrol *kcontrol,
 static int eqmode_put(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int regpwr2, regpwr3;
 	unsigned int reg_eq;
 
-- 
2.43.0

