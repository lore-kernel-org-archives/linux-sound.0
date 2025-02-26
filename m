Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0437B192B81
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533758; cv=fail; b=lLWY1EuPp5cLMpwHipQj6m7hjI+IhwKblpusRaKcg0FD+x84uky3FqMxHdUoBdyCO2RvlHjUdzffBg6QcAgd4Re1xp4agFkFjrT08wV+oGzosDKn6f2Xx9ZII4WlV0/xaRLXIy81mWPQA+qD2UF2LU5qApb/ulzRG3dR3h/OTgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533758; c=relaxed/simple;
	bh=cGoibNEgxNwj4KtQBiKOndFPG7tml60ulTwlXl3XEIs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Cle7/+JWmSuJ5BvIEeGNdWaU1WE+i1RSdcpCE4ElT5rXmlX7IcWb6T2k5lUIoyoruJ08nnCrVrPNWG1uQCykHWQAoibtncsMGj15XcKCKaG2juZgb4kdOKGg7VoNkj6P2XQ9d/GDFPYFXg48wLftlHUuT0hD6SV6C7Y7v4QmFMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ptsWsy/g; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ptsWsy/g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBTd+qDLcIgb+i9jLY1DbJ7h6pRFSAoKfomebMGocfHBLeHLhkmPpcVdX4B6/BsIlEXiFW7XDTwgAHrzHH4rjJAFQNI4l0osslF+17Je55/1xEN+yZOKLoSduORerz3k/NFQK1fAwCPzNMZIFeVO97OtgmaPmf98PtJP+udUFxcW4NOWXnEd2hjLyhA+aLZTWvavhUaNT+KQ87ylmjphhGwt8ji+bBLN0eNaTxMgp6mUmrQteAekKY7yjdw5dqY/SGvlmPMQozUeN/M9DqwSObv6eADwVyLiJeoU5+r34gH3K/CHtwA/CMr/LZEEYODj5AONCkgttOD4os8cWapt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADbGvUrBzvYOhqPIiqcdpCmi1Ii2VhAyIF5NqFm+Krk=;
 b=vhORRRoPTAoC1ETfxGcJmFWGlGxdAzmKvWflm/Eo4play88qRzkWeoUwESQt4Ed0kQt8D9JhBwfHZLdhdSEQobXvIrUyyLsk15vd1ynEtJBxUQMMaMH5DK7VMksbEFiE6BWYxP56hYIA+slSpP70NijFE47FSnr02JZH20M91tftaspn4E8fCVEg24DXqqBRu/ZWtuI1Zh0DbGUjNYbJOERO5kB5QSGrShYqezUqtyywdiMgEuj7ITAh4zv5q916k5ByqXrj8LE95CNmFrfwf/8rBkdF30cj9UxPht2IGUkqeynYedyEAPTiovJ+Nn7nmwrUE7EqsLjKiHEw30GEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADbGvUrBzvYOhqPIiqcdpCmi1Ii2VhAyIF5NqFm+Krk=;
 b=ptsWsy/gvLMUfcLLfRiyfTK8VBm5MNejOsgeBooy0r0BcYeTiLDfP9OPqHqzW0TBJIYZIM7Wy6gk/J/CgWt3JJ9jdxk9SmkRhj2gTErLEn+3mQ+EufKC8DzuH4kwaGtfakHQGAs1SHEikeQcsx63aHNkIphuWMUYZ3Z9TMe0Llc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:54 +0000
Message-ID: <87plj5bi85.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 093/157] ASoC: codec: wm8983: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:54 +0000
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 35771a01-2896-4e62-178d-08dd5605e972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WAqux5VYLADx6vlHvXKyAAcohzbAER8ZasTjfEaOnJ9rgllqJJhcsdGhxaM1?=
 =?us-ascii?Q?EHTCGoJcZI+IbKfJ3i0jkBjIcWuus3M0/J1PgezGNSbwmV85d2GuG5AIwY5e?=
 =?us-ascii?Q?i/9ZcDA/1aDqccuwiaPw0b9P5XgIf2P6MZZ40YUnsO2vLkuTnS4cZsoPqr5o?=
 =?us-ascii?Q?LdOivoKum88auXDiUxcPa7NnGiItreJlCUxu/7o3anp/mBG6FlBjx+bK+o7h?=
 =?us-ascii?Q?+N52x65PmxbGNrEqLJpEHATWIVWLnk4QsToSluTShXyUKQ1RKMz5jfNiI1f1?=
 =?us-ascii?Q?mQR3o8ZeHoqmXqaA68G1OCz7yeIQKxX0QfyYxEQGLcacfvOGRhGy57yC7FMs?=
 =?us-ascii?Q?SsYZ9HFfAGiit3/sM1/xfoS4Uv+bFhH2igi/aIuDAFOG8IzZ5w95HO8pj790?=
 =?us-ascii?Q?1+nE2BV+j/5xn2IljcjYk8mtnXfeDxUHW8Z2qVF1lSF9b3xNw8IVfIsQgzG9?=
 =?us-ascii?Q?BLDX+d6lNrqFuVtwWJCly3ucgoBWNaAfOu2itVcoRV/AhXJxPaVEa4DQhy/m?=
 =?us-ascii?Q?GLVO52QLFz7E0SsxPyabuqGXURpvLDMyA98ePsh2rNepksLrvb3BKpW2rcNP?=
 =?us-ascii?Q?aPQrHndhjSWLBNopo1FgTXXrlIRW3Ck8V+3lVJiMZ//0LFdhPoMkG921435f?=
 =?us-ascii?Q?DlRty8V+LOMUwl1VnHG4mwpgeVqIyYX1ls+6jxFl7+zXRhDECTsEJ70+ibfI?=
 =?us-ascii?Q?lVg9lZGt9TqLuJAt2BsyLQGNLEAy3FgYcaJNNdgVoHGEbm6s6s1cFbcykBZY?=
 =?us-ascii?Q?f3EbkKHTSAn9W/XVSLFxdcCs6J1No6J6UncDOapY+kg5lfcWoIskjAunjfPV?=
 =?us-ascii?Q?qvhEE14vwdWFj4N+uW/B4wrAT7f3sey57IwKcTlR4A/NqYB5c4R5OZZpOmsj?=
 =?us-ascii?Q?vvezNFeSnmHiYqShyW1ZB+5p+v+f4wPjkhkLw9jEBZhn1TyCnEZw5534qFJ1?=
 =?us-ascii?Q?DEbgJk7dcpCLmXYDbqQJaZYndwN7j2kqCy2W7ylRBkKpg47wgz3UDuPRISYv?=
 =?us-ascii?Q?BEXTspah3/HGVWU387f0FMzz7kNBpOxee2jQzxAz2v7i3pFNINyQq+l4tQcS?=
 =?us-ascii?Q?t6hPi1eQ7oF3wLP2dGxsV2S4E7/4FcEqAhhpKubmiactHb4BLSO444mTu4xT?=
 =?us-ascii?Q?LJMytgpvd//keo7uPrmGUSXkiRprlCrwoqAZKdeSAriN2yPwQmh9q0X2ODO3?=
 =?us-ascii?Q?kIGqE6w986hrToWroiSbN5jrd8lTDwOKts8Bple8EOSj4oMAiq8UQ/KVJfIK?=
 =?us-ascii?Q?je21rmtXD/Wpitzg2dg9hGU0IHpGTNQ9zonQH+o5yf8Nw7QZW2uduQPg5/OC?=
 =?us-ascii?Q?vBivPwkQRRRrkmTswE6eZKRtrlndJ1/wcqOEYTFqVubfzXZI5qtBFuHiVoFm?=
 =?us-ascii?Q?nkMn0binlfxCsjDphhjtUi7QitODDxK6n/ph88hg/XecG51n+F9bfaF/VMD0?=
 =?us-ascii?Q?ZR+dOuIK1o8mUXr7+ycwlcsDJOJi2Fty?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eujyx6REadgltNz/9k7U1X8vp4t3ao/o80N8yk9YZrlwm3VQI2tNG4FyC80l?=
 =?us-ascii?Q?FeYmz+IMNisB7bTLVd56Wcq7ZdPq+WaZE/IRTgx8ui9hwEnPChkx2uScytv7?=
 =?us-ascii?Q?wKDDlRE2iZm+wV8Q7xfY7IecGMSX5YkreN9TmHGEJr0/tAPB50o8ggyGznpJ?=
 =?us-ascii?Q?EKdq61Uro8qOx5Sgu+yKTbt2/SgV6rqsEancBnbGmRL8c5RzJKTIqMz1qWVv?=
 =?us-ascii?Q?uGF23+MsiEsDC9o9dA/G8gCB5yV3+mCoYzJ1Vxq0ePH82HhXKBextGzvKeVo?=
 =?us-ascii?Q?9OQ7JedbXcc6LOun+rGERe1DGAClukYnJroq+BHUeg6mDSA/GqQzWupCw8Rp?=
 =?us-ascii?Q?ITdhsMXpYdZQpNqw9ZBvmBM+J8PocJ3oEaDQzIePzT1XyMrG2P0HV0jKZQMc?=
 =?us-ascii?Q?YbxyRuVYOQc/WnuTnd1F2GmOw6QuBJ9D188FSXQWBlR7cObVBdI6N/mcWC4e?=
 =?us-ascii?Q?Q7ewvxxeqANcbE6CPEi+xLzp4dkGi4q3UMGSuEWEK0783qc7gVhgLMfTE+oo?=
 =?us-ascii?Q?XkCbxC07W8ojkzHuAtdssUwOCFjy5XouNVLWiQCJ/RqKGt8YjCJcs6+CgQRV?=
 =?us-ascii?Q?23/viAA1WHUi0bJJrk9u9jVp+eUu8LSy4lFTfudSsJ51rmjO7JnDvuYiHElA?=
 =?us-ascii?Q?XNFPO5GD3UvdoXqVLclUPA0+5bXizOJd9LgysJOscCZGcguGOyF0y9ODPaRS?=
 =?us-ascii?Q?PW5b5XQ23QsU6V7ygfyvxrnOw3xk2fM3jcyIb9uYWAxWn8o8aH+O8vqQ/y7r?=
 =?us-ascii?Q?Esb+rKsh9ivY8OX/9lu/1bD9oNGXe8j6DQe7wWnfsLb4pvh5tu9TXelJyVZv?=
 =?us-ascii?Q?0P509uMWDIsgKo+kbCmx3Do94N7tsNmNTrY05uhHTsIGgGO+2PALcwW9B2u9?=
 =?us-ascii?Q?5i5FqeTS5p/2ifDX/K615lszWA0MjN2PHKkkoZUi9OSoIpfIA6XecFNxraUW?=
 =?us-ascii?Q?38QwGK9Y1gvqlc5JjABRvk89vj5694yL51Dju50sOa3JcPTywJSg21tUSnTV?=
 =?us-ascii?Q?XUMh2jYpj68cxlxUSCTvEJFIpZklw/g6erWlR+dbjI3tqWjSEcawN83qGTYy?=
 =?us-ascii?Q?qnzgpslqYfo6rXhx52FNtuMCAIxqgdGuRyPRLfxDilDZrNZvPJTor8Ak2yuD?=
 =?us-ascii?Q?geVq+lLhAW9DYyUeb30idLjXxN/QVbD8pHV47AOu8Bv9l6GWwSdlkut8UziR?=
 =?us-ascii?Q?yWhyw5/q+6Go9pStoScb3laR68g2r6p/XnxdXALm4QLyyHvunklivIceWRGZ?=
 =?us-ascii?Q?UzTpawz2JxfL5YRI+peEFQvbVN65lkLRUqIubnEnEX4GOsPoQBPnygzNINLL?=
 =?us-ascii?Q?W63YrdpI/WBrgRpoi4kRUlIAN6PEf/HaNFWjrAEkmJ354YaUuHdcclUkJu75?=
 =?us-ascii?Q?vCkgsxY6CipX9W3NklgHmF3Bq+o1xGp1FOgYnag680+DpLmVMzZMRaFnWnZK?=
 =?us-ascii?Q?svlNZZ8JSJWPPhZNxElC5BvDlVW6756pItFKsjzyokNmRC6jKBoyTbz7J7hh?=
 =?us-ascii?Q?TPsLNa2tyJ+IXGfEvX9u5APN4Awtkw3xl2XWKpROvOk1ftebwjOFIc74armA?=
 =?us-ascii?Q?mlbTfzjAM09rAIcBjtY8dc9AXnxZTaz+XFPCZHvGIgEWmBmI9vrE6GY6ENnT?=
 =?us-ascii?Q?FlOADbdSshZf0v00J/8ZUDw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35771a01-2896-4e62-178d-08dd5605e972
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:54.9308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY4CEh8z7zEX05wfrp91uTc6Wj7+ItbmlXKm1+2ROl5R1W3j1DNBvLPq6lbr4lMgD0//rGMRGFlaczwDedd7fQyLpOFsuIrb38p6RwtYkDsbmw2S2P+Lzf58jPCC5WUE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8983.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index 252b4a6cac04..6a83afe6400b 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -594,10 +594,10 @@ static int wm8983_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 			    WM8983_FMT_MASK, format << WM8983_FMT_SHIFT);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		master = 0;
 		break;
 	default:
-- 
2.43.0

