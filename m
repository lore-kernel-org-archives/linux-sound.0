Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B922AD18
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533413; cv=fail; b=cSiGhH6rcyPqj3/tOOLx1T8j/aWUj09ELRgNrsk0lapsUhRgNgSxM96JC6YkyTWGVdmbSvE7MTUnsXTjoju9M4qE2/teetlxQSN4SIE3qw4PSrZzB2fozm64PGtyHpnMBLXBAPLJl/rEBrxiw12JwL3XjmhJNbHB15m5QNwJe/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533413; c=relaxed/simple;
	bh=q4CR7uFDFxskB99YZTkKltFov9sL+MbF7136KTllE7s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=u5myqaSqVV6qXSqpZ/ss7RTm0s7bTQIEaQEErT/MWtz2ys7tkm2l4MMD1f5cIglBb3f1VRPErw/22Im6tRHxhFCDN36mPPdqoN2r0vnVlOeAda3tQaNLzrIEZrD5dn4FbEjMUFsTaNsr3HPqcOrf5AWFYAvI7KfmZZZ3Y/UUw1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=p1Uq/OQz; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="p1Uq/OQz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NV6qz8tLus8ZPnISLmqLH7kKTESr/4MD3Z+oUonMei79VK2fARcKq/XCmgmsEyxp+fy9cN9kYbA8GaPIdW0P2X+/yWcjkBApuJIsr6x/9QFk+HLJkZtg33KdAUThx6C1DoIL+Fxn/oC7N3/NVQKHIhpgGPH45+uRCQFpDhH7Ii1OYKUuPVY/JNXX+YT0wRPqVLXyY9eg6xaIsHJ2tvc7V9l6L5i0efv9x+lpeAZ0E3U+5EmrZVDIg+q9ROGg1oD0CrMtyoKpUMq+pHWN6JEgf3aVaUcskJ22jbU5eqAwXLPaBZzNMjuOl7+jrx1ZK+UsWB50EOVW3IjnoUT2F5UrgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+uDWz9DosPVAVjT0f4Vse1qjrgXX72IAC+mF5r0mU0=;
 b=FKsXhRciA3x1wyTYaoVzDcyABd4GtgXubK6lN1gY+HAwhJVl4cpIwpvLHAoY5wAw+k4rH38Modh8Kn8vW/GF8nCEAgxMSFt4OuVhLiGc4Z01jqb2vAzlHktNFvd1zP5lM59MqrTZUqHffLF0+1SFZjtSfftaWZD/P0RDW80YvxtSz4t6Ik0KFrDNs89OJLstxlRWy4NsQY1QI882Vxk6xwBIGNvLIrKqqh9hBv5bfwC1AUgWpYmsjk6Kf4bMuRJlRJx1PwpvTbZFPIym8h/7q2MylnQ/LJwKqmjxzT6QtcqGaInIUaykLAUm02CQc7n76cLqHNG1+2icasqI86R4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+uDWz9DosPVAVjT0f4Vse1qjrgXX72IAC+mF5r0mU0=;
 b=p1Uq/OQzB/7IoHpAUZq6wDj3BTd4sSxA4q1pxkGVcD1CBr9yNUGGf+YAMPXxNea6hXEpNex33Y+mhWR/7cBcNRzEIvKZudOvAGIssdP2V/K0FoP+3ANdmtBsjsGA+b9ZCvEDuKfd5eXhh000jpeeE2yOK05a2PGF2zbTZL/8OF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10735.jpnprd01.prod.outlook.com
 (2603:1096:400:298::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:30:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:09 +0000
Message-ID: <878qpth4ri.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 005/157] ASoC: ti: j721e-evm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:09 +0000
X-ClientProxiedBy: TYCP286CA0339.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: 10937cf8-05bd-482c-b125-08dd56051b89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hCRHMtku2i6XXQ8MFaZvtZPhydNWiLzGCkcmo9TP+fXfZiwIvM61m0K0nOA7?=
 =?us-ascii?Q?D/b4WKtEtiSMUb1f+NbJpxwug9U0pGxSa/r+fDJzkq3HxflJ98+0AdiOyVFR?=
 =?us-ascii?Q?hlwGjmJswAdMiTjNk5kJ7t0fGqbhs2sIO3ZFP368KkvyryAbFqYIIBjnJATg?=
 =?us-ascii?Q?Pc5C7Jlzu7qHxcdXpBrkvn1shzAKGMAG31n379czAEcNv3UC0ejx5bc0L59r?=
 =?us-ascii?Q?i95FR04tbI6575YGR5CnXgpVV34lgNQ36GcdbmJ6dQPTyejZeWrqrdcd1DuT?=
 =?us-ascii?Q?8nDWAqi/e76Nfh8uIUKtzCx5juTL5lfYquRcyrAnK1RBHilia/dpAym7wAKU?=
 =?us-ascii?Q?5feEo/mblbnT7A2OTBV7j8Ag8D3u+zKtbfu6d+SsVY3+rnczinV6RI8wp/cW?=
 =?us-ascii?Q?ew0YR+Invu7z5GjuAwCXrtAtfRbTnIbmracZN84j95prmDky2+b0j/SfRTjh?=
 =?us-ascii?Q?2vlbXppzZoqyYLFUAT3BXgAyyqNXGYd5Q6XHNAR9tDt00LfBTgmoHgN1gqXC?=
 =?us-ascii?Q?C3nk4PdpT5wN34ycosFpQbchAJzghym5XiBHwoR5oI7/tjm82sOGe2ucZBDo?=
 =?us-ascii?Q?j0rjMmsGhPniAHktQJ1Unbe6oc4xGTAks9uUqVbUDYhNDHJwwGWmwEiOpIDX?=
 =?us-ascii?Q?Ot86mY8OvpnPGBoYOg4b+mErsjoh6fMy8nrX9bxWM7+Zttrw0PnWQ6ck+R8U?=
 =?us-ascii?Q?CzrRsk2+mKlOtys3yjoLGplL9ZXQ5yHIQ3ZNKZ2q+1WsoVSmbKzGAuSB0vea?=
 =?us-ascii?Q?yI+0GJ/3eikLiV98bEqzotfxFXsYe5p6mESvVv9MSV9FocFHdUzstDXQZhqw?=
 =?us-ascii?Q?gKlr/gXG9ZoGu7T94bZM/X5kquE9lGMJKrOvUHOpYNbDYk4L3clQ4KGjfMHh?=
 =?us-ascii?Q?m4UYRH08TCa+qAmjiFyIO75JeJeN5lvg86mBIOSUZN1MMoj3sHwtIRsdlj/h?=
 =?us-ascii?Q?omOrGn6jrU2obGIrTTzDufQybjjShtBkLrHjatonhiwJyTqK7Tx816Omk/BV?=
 =?us-ascii?Q?MTVmHg0ZVMFCd/UAYM5AfO9Bj6RzlNkUHSodM5Irjp+YwzCIXVCbncT3FTKf?=
 =?us-ascii?Q?5vIBWsshRrGgcBqPgx7Bg85bPp9bdurA6T+Njwhenp1RgFuk0bHv8wBkPrfY?=
 =?us-ascii?Q?29XxDwqQ9WZgA+ILM+FLgG3966W9lcSyIZwLwRgCqnhZcjzD5sZE0ZEmJtME?=
 =?us-ascii?Q?Ur5u65VqAGx4+IOyvIKcHGMJcj1EtgyHHfVP0Apz7CqHJldNdI2oB+gp7qZp?=
 =?us-ascii?Q?WL56130BhESQ2pvEgsxQJLI45uotR0MfC90rY4QnNpAjoCz+Alo2zTHUKA76?=
 =?us-ascii?Q?HzMTknt2X9eMBbPCGRwz0a5QLD3qigCJFFBtgE1jkebFLq7r5Lf/SyvSAMCW?=
 =?us-ascii?Q?is9zr/EFXgE1e2B9EM2snmN5uHIZZCxInRheOu80Cro70pDiiMzxgS7doTBA?=
 =?us-ascii?Q?kt5poOnRgRvZFsUzD2XroHUoGKWkQjdF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?us+3eYh5cK/BV0VpxtaS/wWWOaSik33sjGWucyAV0zKLnvl4FLQ/pqycf3ro?=
 =?us-ascii?Q?3QiLpSUNx7ibT/U5PL1Ie1mrAQnv2dj6jdn49n7cf6sM84nrHCQwjCNCwN+y?=
 =?us-ascii?Q?6I3Lzx6Eda+N+wXk/xv3VloXMDBeaVOcGlO24qI3xtY+2BnmOwDbki4XSX3Z?=
 =?us-ascii?Q?728jDJKcC2+GVPrJesdZKyUVpE0FpuAeI1GNDS7MMwKhtYJZXwY42pryDt87?=
 =?us-ascii?Q?fkRSpp1DcCBatfIwVmbohuOECtlc0dJch1+UUSDZW3chhodBJzzuC99Q6BCv?=
 =?us-ascii?Q?TcOrrseZzzuAgpDmiF5g+Wsl0t5xJlelhFORLy4ClgwPc3I7gIhdXQJNRlCq?=
 =?us-ascii?Q?ZcUSg2iqccfBBtP+AjMS4sVwyzgXHUjbL0X9MJ+97zNCxay2njGDArOP6med?=
 =?us-ascii?Q?DNbtPBPVMHgjAwjRH/08TpZmYao1r1QkmERdDHYb68mtZqLvs2lwlXKnuPat?=
 =?us-ascii?Q?G0tk8F/L+ToH8WXhb0BbGoVkqT3iNOFqWA0tL6j57Ifiuc4zb3Ewm9tO6qTN?=
 =?us-ascii?Q?Dh4CbxInHrGnkYQqJ4j10zGM2iSYoFe4QtZ9t6fl+j9E8oDQgA69LWqRHn2Z?=
 =?us-ascii?Q?d25iFdPDDinVsKNqA2cJJzvo2CLq5Ar35VVS33pcgxJyn/I03QZia6IA6AU0?=
 =?us-ascii?Q?ayp9pjkyRrBDUxytuLDT0mxUikeaCGKx4lTelE51zCqErAJgofwjASMz0DVM?=
 =?us-ascii?Q?c5KZU0lD20vaSRnTgkptxW+QCbIrEV9kMFJAenxT+CHMZMQTSWa+WmRQyDbq?=
 =?us-ascii?Q?BnKVTTcaBGqyygW3XUHqTI8C9TONRYXLzltlidtuqvR1czZZ4Q06Q055H2Ja?=
 =?us-ascii?Q?TxoEJyREp9o5etCneY8kPOUVNi+hX4Nx+gNiqaGJDj0EeqTiE5VNTak6IOcl?=
 =?us-ascii?Q?f6z6I+czSIWFCYgaPbM/+oZqrXfOsXh3yihDSryuX2GvOhbW/4e2d59DHygx?=
 =?us-ascii?Q?TpK/WvRIK96OZTcl1MbKRcSOePg7GTdqEol4Tr5bqhuIAm1UI3RpKh2LH6/d?=
 =?us-ascii?Q?vKkqSYY6E55wG67HAfsYIZmzy29GnJPJ+1n9l2ez5BZPjw8tPNvZZdTFT3AM?=
 =?us-ascii?Q?b4Q3ios6C181oNtlwsoxADKCc6JTDz6DZpi/aUIpU07jYJjdlJ6fiJzWIvrS?=
 =?us-ascii?Q?9BN58TE2gthos6aPWgh4LN8Shdbo6vcjMc1a2nVcU4BRGg4gMagCF9vWAR/a?=
 =?us-ascii?Q?qeDqovUV/1zxJt6h3rDR6qpgeewZQl0plD+k3EmKMUGShsZXgBLDNZnaLqV2?=
 =?us-ascii?Q?ZyE2UTuBlZM97jGA5R15ZMTYm4nAbyefp4SSuPkQNigSrSV3KU99JTUjUUy/?=
 =?us-ascii?Q?yGB5o7DWfDZokeFPeaQO2Chaju0S+tvLWm2+3NMFyxjCKzflonsDPTpa7+gS?=
 =?us-ascii?Q?3TdjmTGxhQ/5IZ8ZEOT3gj8kc62qrw/ta6TgtmViQcuN2io6cdrGYI4e8ZJu?=
 =?us-ascii?Q?OCZdVdTpkrH3PW3e7OVFArByEjFDlevFv5QkPnMCF0TCZ3t8SFFRU5hrMLsI?=
 =?us-ascii?Q?kv2xztCKwZ7qYQADfcWQxep2a9TKMMlVTzrCqnrtd6DLr8BLsZsTOAS7sNy4?=
 =?us-ascii?Q?cfEdOPUzBw8H+1hX8y7t5tR2uAvyqjtrFWeCGwkVfhZq5lnmfyBy8Lu5KP63?=
 =?us-ascii?Q?/pjlOfj2xAy3TKb/uPHNnvM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10937cf8-05bd-482c-b125-08dd56051b89
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:09.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2OxLq0uVGJtDcyz0FlTql0N/i7SBVA8eFqVpk03hQMGcaQT/C9c95BKEhIcED1ceHYpV3R1fzHIOY+soxUnabymmquRWSKg3DbMdJuqH9VtYRuKb+h6+8X+9E5SSQe1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/j721e-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index d9d1e021f5b2..c0fa72e626ff 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -37,7 +37,7 @@ enum j721e_audio_domain_id {
 
 #define J721E_DAI_FMT		(SND_SOC_DAIFMT_RIGHT_J | \
 				 SND_SOC_DAIFMT_NB_NF |   \
-				 SND_SOC_DAIFMT_CBS_CFS)
+				 SND_SOC_DAIFMT_CBC_CFC)
 
 enum j721e_board_type {
 	J721E_BOARD_CPB = 1,
-- 
2.43.0

