Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33EC1D5CE0;
	Thu, 21 May 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351498; cv=fail; b=iXPpC0+jtDlFM01EUnJhzdFPgXVdwW6+wSwFismyc/uUvefhmD3Jt41lFarI49KMGsXCG8meS1dKHsk5VVxk7bTTlalsOYkoG0oDARxwM7tdLLyfzdxGWH0SkuPWJlcAOraa9BllNxZbssMgywELh2WiNP0PtVXSJyypcdQOlfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351498; c=relaxed/simple;
	bh=QIvU7Zff5UMdVdA0RwhmyXji0m632TfOBylwiHPBfds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQmjAAGM6c35xEGuuXnYLocF2+eb6N5HR/Vzemv8hgizcj+99yBZeIyKnHLn8kqAKdzOY4OcRLETfKwg5fs9Y8baiqY5GbABLIt3Jiy1sHtOgaPqIPBmECn6cfzfpcYmJs87nvVCLRtvMy7qTwP0LCFMRNdC+bkpW3FFDoq/8U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jq/i3/Mc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GfdndMst; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Jq/i3/Mc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GfdndMst"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5HIdx2712530;
	Thu, 21 May 2026 03:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=QIvU7Zff5UMdVdA0Rw
	hmyXji0m632TfOBylwiHPBfds=; b=Jq/i3/Mcqmhfps1zpEzU8M1B1TVOOvacHI
	m2yQq09MDC9KGXp9A3isdtwfFjNr8OxgsBw1QjWuU83PESVWvv4JIH21FCoZmByD
	qTZlycYkk7AmM1fPfW3XH0K7gtbdc5Rcc2fYVhLaxGopZZq1hF+Zc5u576ImsW9/
	LJKkegHKRwr9hHAHTA7IME/ILYxmK0CnSqWtN8SW86+Nrcb+z5Ek7/A+TMatkOSj
	ykeJJMCg0C8IOw06MxQSPa7Gi/OMxuwHFiyx2wFUrCAD90/ndLEYRY1ZuPuGz6RB
	qG3Sr24KElJaxmIkJcCNK0/d4n2bfxzKSAccIJBIZHfVnM6nBD3w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022093.outbound.protection.outlook.com [40.107.209.93])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xcj5ey-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 03:17:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y710FbYD42vx5JrdFGWfW2nZzJQciVDtSZwQGikgHVcKUhBDNbK0u+74RtW88wzreJ0T6EztJNIaAD/V/wH8F5FWCNzX+JMr5ve84Y5mlAOXoYGmhugxG9r+CwQJ4tILpBIaZj/mg0YNNgEtGbMC5/+grjLlw1ACdhQxDLhlGVmaDToT3IZSUik3CfROrNokEv8m76AjgX+apI7t3OFdIvvH32KZGRvkZtOKS4A6+95ioycS38tOGZVpjCSPBCN0h1QN8ZUfWQ1CZOMOCdeP5ndpzqYY5Vy+6aw9q3mJIrNGzrBvhlwO0CPJIHz7obX0j2PEfGRWWLvAT674ux3zqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIvU7Zff5UMdVdA0RwhmyXji0m632TfOBylwiHPBfds=;
 b=YR5ELr6JMduFPS9fLyRI8qVM17ICyd6iXfkTC/kLv16M/WKz8RIWfWouJ22SyydVodM4WFdWujjMDYHLfiQfGBEbF2vsafHFG9NSRGEJxfYnGRqgkPqG3kOzhJY2i7MK4myHTGQbRU4M4BsTpL13tO1tCt3FX3AedAREuaH6/9PJOGJK3UP2qDGJUCwX3HBcZ1VafCU+eVfPPjUr685umhRtakqXAOmv2kdHF6y7EoGxKFiKBQyMedY0NJNji+3IvhHmPhygnlFWz+dt/HWSoel/WPFYxNi342a4guYvehjHqYiOn0j9ZeIUavIcAAcyrHz+zdUsVxhJR+u2nJ7YNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIvU7Zff5UMdVdA0RwhmyXji0m632TfOBylwiHPBfds=;
 b=GfdndMstXsZpUFwHXVzrHEXbPOO/31xg/k+jOYBNEnBfeWw40PByQDdXmkmf4QNJQZ6+PDg2maX6OIk8rDZ/wiYGP8A/9+pNqzupOvIJX+Ub2PdMQ5oLGaWcicpRF9PGezgqShsL2Mc4Bv1rMfin6ye4Ap/DCGq0m8AXMyNhKVg=
Received: from SJ0PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:33b::8)
 by BY5PR19MB4114.namprd19.prod.outlook.com (2603:10b6:a03:227::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 08:17:50 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::af) by SJ0PR05CA0003.outlook.office365.com
 (2603:10b6:a03:33b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 08:17:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 08:17:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 840BC406540;
	Thu, 21 May 2026 08:17:48 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6CAB7820244;
	Thu, 21 May 2026 08:17:48 +0000 (UTC)
Date: Thu, 21 May 2026 09:17:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, vkoul@kernel.org, lgirdwood@gmail.com,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] soundwire: dmi-quirks: Disable ghost Realtek devices
Message-ID: <ag6/q8O737wtHB/z@opensource.cirrus.com>
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
 <20260520163631.3300102-4-ckeepax@opensource.cirrus.com>
 <be5dd478-d520-4e7e-a0e2-946b128ec4f2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be5dd478-d520-4e7e-a0e2-946b128ec4f2@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|BY5PR19MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 17af9461-fe25-4a4b-3d93-08deb71172ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|61400799027|4143699003|11063799006|6133799003|18002099003|16102099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	In/ST62Ju/fK1vjPE2uSjVp6AlEmd5gnj86VVqG5dSnsjWRpXHfkoRKT+h9SzMlbltX28WlmwICsWmNw2NoCUWHFeGcjsyGY7H3uLM3ajbNaAc2KlEpjK09VwaVS32p9YGwz+32paHkFsQ+c+jsf1ruUhe3ABH1cX6X2/E4mfi1GssDAixBNh7l1aC1JSx48XlVB/MuWAzYi6kE62etxvrxE97TUwfIlAHgwtqZdQ8DRh/INUL0Ngcz8JI9iZzw3H47V30AV67ZMplbKuNWo+w5t4Ydxcq1BC+HJF6ETheJiNHE/Ciaf9rZwWkG5LVs631EE9JpuZrjSnzSI/ANicUPnaIjJFVspoh2BoQxIRn8ERcy1T0cvGfbwnb06nFBssyhVv9dZTvPOIPI9AzHEnHBruVebSqJRXtxE7ffi9k2ryKzJlP7m1xpiJ6h76cw79YORdEDcH+0RxvadnwZmn9CAKFy/KH1Ogn/QAw5sjPR9FLE7VHDmWqXeLe7QI/x7Dx4cBr74QcT9DlFfoL3FnzKEa70xHta2yBbdbfbDULsDlmwIqgNjTVxDDf2TmifVHCgDIO2Ik0kCC4kA/9uP4zeW9LRX9EYEhVzxXAJJ5qv0i0+z72odbA33ROkIIqh4HRuQrof8wFhN4ndMXxJLVKQhAc8oeYvtiLFM2TQy2XNY6+J3HHYLAMYz5z9NBEWDwq8Q5qVHesUmxXYFb+rF/56C5VLFQU+IVSO1MHfsp2g=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(61400799027)(4143699003)(11063799006)(6133799003)(18002099003)(16102099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+8ZFV0gtR6gHmHruDIYo36itvW26sUM+SBc5+ka/2DB6xFJHaHk1Fa6EsyD2PxTrW4zrUBru2kzngG0toaWlB+MD6843LmOr5k4tX7j50DGBMe+HYu+6KogkQIMihff5G9QRAOHXc12lE6vpwIyaR6Uo/t/vBEXgRt3zw9X5La+eLRodfcvcRCjZGzwfAyTXG2u2YkfLRD93DQmep2J7pSgq5yCQAMOYaggNMvVitvOWA0d2YwmHrtdjQmfThXSPD29zlSRvzdn3o9QvSbpVVgz6VIu/pbCRMN5F0lvbb5FrbO63651sZNpnrIiquxQeUUS/KPoaEjvqppRW8pLD5JtnHcgXgTL2nl2tNvUOZe+a50vUKeZrjyX/W6vA4tsehrMC+xgxaTm3pJviG9kUIxGsIRPCJOQQSop/ezBGYK5lYI4o/goon+iFoDXkl6S5
X-Exchange-RoutingPolicyChecked:
	KRq5RraCsisKTX1L2lpQ75U6sJK6AqxkRy/nDP9fygSAnWyY6S44Xq/pKxUerPVA0SLl7RHitdNPYf4ZbQrXEEYIi1mfPq+Eb1CSdR1+6dlQbvIpTg0jeedPSwG10xpzhAqjrh1VUG7YhdeRXrslph6IJw0e380vLukB4dL0QE0qfF2HswuLvB1SL42AZtxlFbeU+KnJ0D6vX5mq9qMpOLVhH8sE9Nmz089YLtY9BgUR4NDBiXgpfuDcL9X5Dsmvlw3cal72dLHS4wZ4RzhbQLdqHlCqrZ0Qlw4PJ5T2RC6nULVIuO14B1Nocv+x0vzpsk0NKVpTBET40kkJMzlEcg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 08:17:50.0357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17af9461-fe25-4a4b-3d93-08deb71172ec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4114
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MCBTYWx0ZWRfXzuKlF+7h3GDv
 NGF2d/Z27mqgkH2sXY0cw4eG+mQmAirS0OMSRgKwK7oHXirXW34vrmXYRsMekn4bNdhAnFvewlR
 wQeGuENDW65Uw5Zkt319zbFKXN5Aia4QdgBFcmoGyBwRPkIqz6FKTciyrNh/8qiUpZb2TRrJqyN
 wY5EhQsFakWYYuh1vDnjN5uNqxRgX3j8tbnZvo2H0GKTw5l8fPFBA5QzYOSO758nDZOmZuyzJj+
 pAp/D/hUrfyEz2ZjuDjNAcUgHfdK8VKd8b8t+2nsM+fDViUnA2GiqUGN8ec4OMR29EB76WILfqy
 bhIYsrqfO1vrBE4sADwGxePDU6kSJHb83T9UYoEL+KyyCs0KnUWPc8A1lQtc6YYCUKwkfjCi4AE
 4z3HjyXyV3OP+NAm+Bm+piLJ+ljy8sSSf9ZT6uwYv33gYJ7xXDXQ6cFpFlVkDkkenaeGbK6/3hs
 lSQxmvH6Wg+HrvMWkcw==
X-Proofpoint-GUID: HS72qM8aUCwUlez8t2l4LwLHuFvlYjm_
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a0ebfb1 cx=c_pps
 a=+aoWgcdf8QL7nCWWbKbTBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=TvrOQm3Ym7Fsjx4u4W4A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: HS72qM8aUCwUlez8t2l4LwLHuFvlYjm_
X-Proofpoint-Spam-Reason: safe

On Wed, May 20, 2026 at 07:16:55PM +0200, Pierre-Louis Bossart wrote:
> On 5/20/26 18:36, Charles Keepax wrote:
> Could we filter instead those 'ghost' devices if they fail to
> appear in the new ACPI table that describes all the endpoints
> and card topology?

Eventually perhaps once that makes it out of the standardisation
process (I believe the committee is looking at it), but for now
that is all Microsoft magic that I would rather avoid.

Thanks,
Charles
