Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BF022097
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 01:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739927976; cv=fail; b=JJbHC0HSCp0RVd2Y4BZb0qerH8VUqgXwFuAjgSi7Ze/OrMbjyGm+ExxMX/HUQQB1cLCIRxWZUPR9BxJELhhRs0b1Xfa1QGWUgE/83f68vjStzTJxZQpW8tQZlYRPuM28q829k6NhIfKir63JLfM8oavjeWrYaHY5YyJDcb8ogAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739927976; c=relaxed/simple;
	bh=JJc4YIoFTzFN1Zwi0MrTwIktFgk9djm/T/7UuHAJojQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LeOs54vu5AbaB75tPL9bVRhZKrlMV91PV1fV2XEA8sRKUCsmjF4vA1EhYswstajwoH7dveDICtITp4U/ZyPhUidYavVus0Xao5Jj3XF4eNddwZgwbbprLhgXHsO3V5Wp4hhXNir7/m9fYn5pO+CAW4arFLBOhEWwLfIhk8kbc+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ss2DKp4P; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ss2DKp4P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WacM4asfLby57P9t02Nb+sgDqqG2DjfLJ/nN7kHZaJKTr8cMEu0W15zfsPttk2bAGELWoEa58KdltehMQ/lBwZ9jNobkXF9NclqcLaVejhsBKEe0bSWkUk3PB63Bnnd3IGHDL07c67wiW9GFhEMAR/qa5XtzE60tW8k+YejvrBYBLRRx8tPSZjMKe2o4oKCnW9AuI6ie//QyjLUfX2gSt3fMs4gBbnC4LY9PaSJaMEzbziy+EkCD7G34mpHm+CwN+uxsUyRtPP22ZaFJEUaAwh5yBdnpyTWbNgGhdsGj+bcn1P76m3UAdojZdSxJzFMcqUnAwX3hs5giFX9ynqKUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crIYx9JX45nhWknUR5DOWBZF8WjbBmotowPtKf01Keo=;
 b=jzttUxZMkFlu+kjQZgToJBZHMXthCgeNXEqnHfZUYo0sgZ1jCyFjuYvBpVowSb9YyKKCPiIxMwDIk1ltMsgJtQD6tHexfGUNgurElB35/vIQ+egSNQb3JN4E9uBLnwT3Hr27c23+nP5c6W+6kW0OKRbt8N6CcNdF4422OwUTasW/etBNSoWGJRc0bsy9B7QAFg92yp6GWzt7ZWwMdtPEKRp4AEKSFkJ8leGXP5ozVut2hzVD5Bf7tGuFUf9ksoseaKomVTeHXj4kako7LmLwd8X26dBK1CaCBjlYHGPGQ4zU0zazgp4ZsVZqooqClzVc9fsZpSoc93taGOUfDtIIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crIYx9JX45nhWknUR5DOWBZF8WjbBmotowPtKf01Keo=;
 b=Ss2DKp4P9AOKGCXG8QoruKzIXqxdmzx7fe58LuwfnYflVaF1lFzsVUnMaUPOjypyhYN1TVF2w4yhPMHLIwd/gzf9v3o1/CPhA9DSrCWcmMXDVQZtKxaBK7S64I58De0WfKvYHmF9+hoOlTdEMJZhmnPzEGz6OSARwGVuaB3NWPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6754.jpnprd01.prod.outlook.com
 (2603:1096:400:b1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 01:19:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 01:19:32 +0000
Message-ID: <87frkaviho.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] ASoC: ti: rx51: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Feb 2025 01:19:31 +0000
X-ClientProxiedBy: TYCP286CA0216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b0b782-9320-4acb-0320-08dd508376af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C9sd1uZcgRmWTrOHM1G4h38WsZ15ebhki4P/QEMTqzVALbCXZkWqippWvjOl?=
 =?us-ascii?Q?G9JWxJu+3n7tI0RtrkoxLOXuwjHY9fmihOH2iWFP6K6gOOzE2gMnfKnjp9DM?=
 =?us-ascii?Q?XgWLBQ3qJqvINJxN7SdssBHOgUEEjIweB+qu0euVdMZ8V2vIz9B7v+Hsgm3c?=
 =?us-ascii?Q?KH7g6onaBAFarPscP7SeFV1bjX3OR+r/9bq3x9SLUukIePwp81ScTiT1DYOG?=
 =?us-ascii?Q?RtGd4dxtSOowQsXIdKZZYrWVLRgEyWWfskpPT/HHUHybkQ76xh9l+4KgzeGF?=
 =?us-ascii?Q?Jhzm2B6n8+XAoZeUyfHy0KpgcfBFkG57Qm+wAMpRHAP+QeaWh3wxs1SvOBEZ?=
 =?us-ascii?Q?DGmC7jDCljqZtfxrKPjuE/QqNDnkoLMORIcb6wjtUSzvBjlfQzq9DW+JuNOL?=
 =?us-ascii?Q?bkwaajeusqSkJ1lQjiOsNboa2WJSvnIM+vfJS2XFY0GTrlou3xcFCcZHd8O2?=
 =?us-ascii?Q?A1QI9RVNUWchCcfspSfbdOwu2sE9TrfmfJrNc+xh8dFifZHnIRH70AKf9D6B?=
 =?us-ascii?Q?j8021R+iH6mdXDcHVecovnrjF5RepFE6XbVHTMt6Cdle/LQ9Q5yA1pTXO0i9?=
 =?us-ascii?Q?UCqctJBFr1ZmEwcxRo0rSuSDyZ/1gRl8/lU8jNhkepDIYGhrfbyLtDdv8nWV?=
 =?us-ascii?Q?3FpQB+JPE8qsk5yN+/ywBRR3c6uqCXc5rwzzAvy4e2qqy0j1WSLVDlAV4fSJ?=
 =?us-ascii?Q?BRC5bMFqE2zVMy9ct/XJRoX9QN35ClSDrc3brhp3+8H3zCeYG5YczpmvJZS0?=
 =?us-ascii?Q?lB/tDk8b/vM8Vg1Cppnry/sWZffdjObds01Q0DN3RNhLqX9fMeX023uE0K0W?=
 =?us-ascii?Q?Usha8yERrA3lDZEXTC0dTB1keiSlJNpsQH2XWNwjFfX2Xlo2QMDcoE03TXHE?=
 =?us-ascii?Q?CeMfdQjHdvljBFSaShoHv0buIyJHw+OwJxjN5f2ee/b25naHLmSsPUONQ6Eq?=
 =?us-ascii?Q?Kt/cHv4MJGxeZCx45wJT4tuJxBtN8RKkDIy1ka46Pb+LPfhdW8apnhvR0cqI?=
 =?us-ascii?Q?B7+UO2rsTxncYBsp4TlGoAG4FzdjB6quF6TL+IXOPNUxK4DlP/2iEgYsPSBq?=
 =?us-ascii?Q?vc2FDKwebPuw6KtYfFS+lUFINlacFqxUGGDwed98ZB72A41+12Vrp9Et1pS4?=
 =?us-ascii?Q?dQq7TKlVZ59U+Hce4rd0ReDrrjujnPWYe8mMo+WGek05ETMjSPEh5MJHtkDh?=
 =?us-ascii?Q?eGxPev6I5HJ1W/2s4FqM+DZ6NRUmjZdM1SUD/jHh4XC65E0eSFkthcRMtUcf?=
 =?us-ascii?Q?qaiXe+AE2qT9LWp0u48CeH2/E1ZCqBQsIWKLifd3kMhZG0GyR/XwWdjSc9EG?=
 =?us-ascii?Q?j2u46+2GYILbUvEXdY5br+dVRnTrPnuyWcnomt3ZOkdJEHadE32vhFNKP56r?=
 =?us-ascii?Q?BLIOCL1JbrSCT9kL3LicmDTGghnzbNSjyKgGQ60hBNdOUJjm0EtQOu5SrXdp?=
 =?us-ascii?Q?YZd94xulyufyFXDconwbbqL71bWDuGV1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rCD6wNKDI1TXfQ1v77MPmL1LoS6moifZeVuXfSLnI2PAEmCj0EH/OviLUROE?=
 =?us-ascii?Q?0rgq5Lhr5yGUc9wSVUeV3JfudeQYphDYmxGH1kdIrkXviePfapDF9B0BgyT6?=
 =?us-ascii?Q?K66J0ICAXnAhY44kAQM+M+Nk5poc0s+XqmjD7cT4YwVEUNzGwfChFB8u9PnF?=
 =?us-ascii?Q?68y8FMoZUoSk+WaR3y/BQ8XNEI6aBkHIF1KPVVvoVl1rVxfU7IXSHAzikOmC?=
 =?us-ascii?Q?LJpTg7vjCg/kYyNE7coyf5MreL5OeomK5RsYrxJzBXsbuvojhSlNxBIFVq5M?=
 =?us-ascii?Q?86Xg53nktzfo5bB9Wv5AUXw+lWMr4UEaOFGZ/ZkcHsqhNylNFRUFrxcdy5rI?=
 =?us-ascii?Q?V7WeVZeqg6OR+6WzUGLOc4/oEKWsh3aQFrsZmayvtAtBMGCX/PhJSxqXOIA/?=
 =?us-ascii?Q?HghODiFRHuX5Qc/EBgnKJpGw6K0rIdF30Iq1jhGlXQRvMQgdlb6bz8HwyeGQ?=
 =?us-ascii?Q?gPAendeQM5WR+DrbOfVX5KzNI6aiPlupkyhrOlu1RfxEYNMXggo2xtn9KKwh?=
 =?us-ascii?Q?BDg4Lcn2jewo67M8ghtOTrm17DgUrhaiJxpDDB5MmzhoS9E9LdxwAQH8hAlK?=
 =?us-ascii?Q?pIrgF2Xce15OhPl5pHjMQR3x+8E5ARiIhrbVqzn5WqALFSuaJrvKD0rfRN2L?=
 =?us-ascii?Q?ZhgnxFq4VZ9ikjsUPGaf41SBrUXFS5w+x5n25QqGL8QCRS9Wv3DJ+tZ50Cic?=
 =?us-ascii?Q?ZUBbTUAICr7ResOTdVcTtdHbw2m0UR0B0FOQf5rHChWTlAYic1yqBn0c4Dvh?=
 =?us-ascii?Q?tJzowh4sBO81cABDqfNf2/hj1PAJwbygoXUpIaMVXz2PP3GrRyxLqoaEW3SK?=
 =?us-ascii?Q?KpAPyywVZzH8fOAqe9n2o+NGIXp5dBChMqvjNdAlCce24bDpLAdFKZhd3BPE?=
 =?us-ascii?Q?EN4PukE/53Vaau3kvur0CZfh+AlFk6PDxXxDU54AHshn7fLujKEZ4oiGMeYt?=
 =?us-ascii?Q?Q8KdBGaRj6ymaW/smvdQjjfcRjZOajRP5984dBorZ72pj5FMcrcJ8VWI4Zyb?=
 =?us-ascii?Q?nWHH7UALHV+4BqNkEbU+jRPa8Xt1il7437MhIR3uk0d9pohRjg2vuFTr00eg?=
 =?us-ascii?Q?KCGhsg7UeV+R7RmTTk6UCFnYE5EXt68cDwpplV5m4ERN82tHYdA2/SrgyAtT?=
 =?us-ascii?Q?/CHHg0Cw+bZiPp1c0bmn/WJTdNeD0Ni1ggvvSZN2nR14Yew8FyMdLnlS1ohq?=
 =?us-ascii?Q?NUzqEYPGwLi6/MNL/kK743Yf0PYHEKp3ewafbpgVB08imenlWq7myNMCc532?=
 =?us-ascii?Q?f3/Ox5OOi+bZEAFz35ahplWS9Yhc6KPlCsma995c6DLt7/XW+otclBr2SNAn?=
 =?us-ascii?Q?MwZj3939z+CPZ0jaEXD93wpSkFczcfnb/w5iEQhOBUOW2C6suVa3BiPCxhGz?=
 =?us-ascii?Q?HnF7We5xlsdivT3A3ClXe+cPgMOn7zwduJICjGCCaVxouEv+nlMuP0eJ13T1?=
 =?us-ascii?Q?zsDYGqf+vFTJQVObhoUPFq+ecoGv20T29KDiwZrd9+qZG4NKGAhUC/9hYYLs?=
 =?us-ascii?Q?Xdrn/BTHGXE4a0XqaUudw2jinZqVOSZSMO0qcuIK2x05S3gP2oGppBBdaXrL?=
 =?us-ascii?Q?ydhDnFw53njWkQPgFt7hx+bbPgBNFweoQbnJT3AacpNmjoegThYA90u/hGhq?=
 =?us-ascii?Q?oG+Jpqw/SE43tsEKSdrK8uY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b0b782-9320-4acb-0320-08dd508376af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 01:19:31.9417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/JPnQk15NlHLce3FedK1t6QioeinNszvHJBAPm3wv6DZMI08aETsxnbFEXQY4ERrZYsb8nBFwGd9uYURTxaOeOUeOa8TRkdh26D5SN2xdorB6aBn+JZ+FGJKH0Am84R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6754

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/rx51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index d9900c69e536f..e969031657e9a 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -307,7 +307,7 @@ static struct snd_soc_dai_link rx51_dai[] = {
 		.name = "TLV320AIC34",
 		.stream_name = "AIC34",
 		.dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_IB_NF |
-			   SND_SOC_DAIFMT_CBM_CFM,
+			   SND_SOC_DAIFMT_CBP_CFP,
 		.init = rx51_aic34_init,
 		.ops = &rx51_ops,
 		SND_SOC_DAILINK_REG(aic34),
-- 
2.43.0

