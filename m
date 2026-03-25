Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211F39C658
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433816; cv=fail; b=c12Rf1IKo8LcjTiWpYlWJN6+j4wiMAznZjYINSR6NwQ6qKJcqh4FV2H7gE19KSVi/rg/C8p/B+15E/LIUjRYgmRJRnfgAtAnjbuLDgKGBYK100y362EmQcu+7RLXGR1nyJ86KoQq8eXsvMdVQhZZ8ElM6MZeEZjGEuLIEWfmJyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433816; c=relaxed/simple;
	bh=Vpr+xl707WHJeE0YQr6KEuBkkZee8ORIRXnVEIJ/MIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLxUCNru5O3QQx/SvXiIgiX9AyWrprtbfvS9mh8eajhAPTTNj4QKtCvpkUq27p1GK0/22XZCFVXN6uiScSBqPSOfp0gVFzSO6sxkXLJf/rIU/dPLU0zSEG1hZ6Tpe/lzZt/fBQu1vF9VHKYYWUvIJ1W/Jn2V7x/XoHFJig/ioL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=B1BGN1tj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vkBB1SwE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="B1BGN1tj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vkBB1SwE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P6YFWV103312;
	Wed, 25 Mar 2026 05:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=+BiGBOI+4ysgqPgWHd
	2/TfGQD7xH1SDc+tap0btW5ek=; b=B1BGN1tjsXQqKaH+lG18xbIKwyhAwvYE82
	FmW3p2+qmK1Q22b0hh8xkFXEIyYYVfkLjLRS0s6x1pHBeolvG13yLWur4iWqbRZR
	paPZmVV85haU8BVD5jn3ntFm2Vub3M2xy6AUru8YCKgzpH5cDYSLL4dvfggkO+l4
	2As+tSBkyaU5fSsIpvuafNSinewxULKQ2uB10ATZRwA/I4norUwycSijic1JbVN1
	x3jaNYsLB7u71Eutv4DsyY+AIi3ReZfxEGxB4Lu1Y3sEPbCxgG9Rx2NYlGn0/6rq
	OymU8bGam7156zuDFc6l4lUv7j5pI9ChLYQoP+67Pv1A0rW9rnEA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020141.outbound.protection.outlook.com [52.101.201.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfchxm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 05:16:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyEd0u42aAKL5ZXr8zFMSQ36kAs9tSy/mdt/Ryz/shG57LdW5ZRJAWBWMU/1TuxNQaJShxs1bd7RgCHs9CNfNw/pkLDZKeBqXcj5xyfPgv/h7VhEuWGgDaC5wCU/UgSvt7VFeKHCQ/9PX2PBqF4CFc/EQtuqLiqs4dTo0UcpWeC7LJRmTFw3IArsF8xRbxQosBngKLIhoiPm2MAEtv8Zz+K0OhSdGSgFfJIKAEg5cRBH/K8ow5ln3uCTuk4KSZnxCqLNV4r9teUH+uMIVXIWxSHYBCcVbcnhvVlKfPuuxEjVq+09cxPgAMGHx6hilUq/QHZv282biA7eaZ4RFRsWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BiGBOI+4ysgqPgWHd2/TfGQD7xH1SDc+tap0btW5ek=;
 b=evo11Y3Yi7IxiYdZ1YRcLOIf8ME1F9Etnpdu/pv2aA6g9DkimBjo9zW83+q7bhvj68fAkC50FXWGo6YllHQxqEhxGHIAH/LYfWMTEvUsH6GDmKGT9M+mtDkXXflISxvQIh2Ea4lypObnjAIhgN7e8XLN2QYjbc07ZwG8btRT21oY0dBnrPwYO2jlbFeZXeE32bXWBp0lbm/UUslQY/AHgUy0AaZEdPeWZ9U1p6TvhuUCRf1bTazdMwMkZPvhd6R6oZnwZ3pRF2Kla4iIJuR72VgsTOLnDKwcaXNLHs+duORJa8cJF6DnxFKWF058MO44LXW9XqikCnW78HXRXvuD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BiGBOI+4ysgqPgWHd2/TfGQD7xH1SDc+tap0btW5ek=;
 b=vkBB1SwEdDVPNr/OMyotA77pSmg+i0y0P9Pc0X6xvJLhXnp6Z4qKwKX7S3TrVG3tyNsffIkMlAe0Tyy31tLMFRZ6JRqnNm80bmkBOxh8HCQXMNmi2RTnCnS2/RSAz0mwcVFXfiNewKIZ0PoYxzB5Pzva7ov+6+p8LR++a5Euejw=
Received: from SN7PR04CA0099.namprd04.prod.outlook.com (2603:10b6:806:122::14)
 by PH7PR19MB7802.namprd19.prod.outlook.com (2603:10b6:510:249::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:16:30 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:122:cafe::73) by SN7PR04CA0099.outlook.office365.com
 (2603:10b6:806:122::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 10:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Wed, 25 Mar 2026 10:16:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 33DAA40654A;
	Wed, 25 Mar 2026 10:16:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1D243820247;
	Wed, 25 Mar 2026 10:16:28 +0000 (UTC)
Date: Wed, 25 Mar 2026 10:16:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH 2/2] ASoC: SDCA: fix finding wrong entity
Message-ID: <acO1+yld0mhWjxvW@opensource.cirrus.com>
References: <20260325092028.3221671-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325092028.3221671-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR19MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ec3bb3-49d8-433d-189a-08de8a5794ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|16102099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ehg44kWwxrwoqt8NSlulPZANZo8O4SPZuOJjpLVvit9RIgW+Z9vYnb/7Fl+CEE2PhCAzz0W1fnGP4wwfLiSWkyQGtL2lqGAGz0S8Uq08fbfwlmsM8YfRcIw45/SAT+mJwk4WBGIjXT1UYuOzh11CdIui5pezogBx+uNMb/8VsA2lRca3D+84QS1R5UDeFHN6N3PNMOiZJHqCSOIPt/e/ACK3wJhVac4Ce5zFTOZWl8z+odaG8i1/63ELMX6g8D1TO9EReMaYKo5R+/T5hPxCX2EDNINnRFzhtocM7xoXINzI2CeMQZea3+df43CwI3yUpQ2xrVjz20hSiStE0bzk7ARaZPbRTxmkjCB2itisWNaoPEidWdELkebEnbx+apLWUhy303ojApM0J2f7mTtqF00jTTNH5k1Cmwj3ajzTSo/ym46ODpCUlXKq17k8cIrKCE2DeXpILs3/KxrF7pSW2VHBwlWMb2SoisAybWO0hBd8/psHiOAN4l7dxL85fn7YyoIvpVq8ZJ4GtEyiEAf66KImiyEYnIQH8fVt8sU9rFl+wzBcqMLpnCWzTyBlhUryezLG+bF9LLRZ4lx0SE8uyZA180XWgB6XqGxhobAGo0TpaRGRqZgDAAlFV/c1qemoE/n9K18g7BA4rNIHJlNu6MuRlAZtn6ySKxmn1dMQ2A3dneE/reJi1bpPk//yjIyE76N5YkkiBuLo6d3NsOBWMaSaNXi4WlZc0hVI4v6lGNzdAY7v0vw8AY5cm7i4By8t/fy68bIE27QcuXRrOl+mRA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(16102099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yZmmRycJ9S7HBayzIymDetocUJ153JVv5OVRuTECj0t9zMa73RvwswlC3rgXUw/9HhPSw+CAMM2+nkT5jITzv6isg2TsXG4KDIQ1ZgYIVivpgpliogtNSTS2zOsmj2gzeAZ7Bjcff42+x/x05SkJIu/Q80DonB0gAvkRr0kqgnIiuxnlgBU99abzOVVPWYfPZ/T+6t6uamoZ81YRFTqS2X4RlkwePxD+RPI5PTONLcD9+VJh30JuVOv2sYYnr11gBJV4xk7uvEoJYpcIWV3Ga+74NGpLMTE5xVTLMcH2CgpKQCtq9S+Sk4P4fNHp40Y3UKrhKlHOn9fWoNyNX1bR6pyk7Fj9GvZD0FpkRsFVM16+8dRSy9ffyxqTiMYgPvrnUum9bD25pC86vpyjINi8iADZHAudZZN5Pyirr7VzlIl5h8kk8ElSIZqrzKC55lPy
X-Exchange-RoutingPolicyChecked:
	GstB10/unGOtCHXIbSfbvuW3Tf1j/u1nw3TpMzC6bdXfKYcqii9oWy96F2f76Np0/QXU2ZR93BeFNmyA9BO/mXugsI0+/jpzuA1npjc1+q6HI97sq0GYNPwOHbt7+ZuMh5eMLH+hHgU7lbgGouQRIspd+N7i8OrPaVEY+fC/HDWjGH4jDw/Xjt1KQOzNN8jCxNZlXNmRLhT0rySQcM5vowBcfCIU/rW0lTngdy2iwzJrsA1qR+IX55VutVXAdK1+OmLDv9g6NYdC7ljHsU5kjk6mdZOONOS4YcQMxE9lzuMDMEKPp1s72V/LA08cF5dN0sceM8FAnZZRONe79Po1XQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:16:29.3645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ec3bb3-49d8-433d-189a-08de8a5794ce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7802
X-Proofpoint-GUID: o8xToG-J7ExaBoQMP6c9Tjf_EMBy8-oO
X-Proofpoint-ORIG-GUID: o8xToG-J7ExaBoQMP6c9Tjf_EMBy8-oO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MiBTYWx0ZWRfX+l98ZK+Ce46Y
 sBASqPLVaWzOvO+TP97asFSTU8JuaLq7Bzz8W+f3AX6Uf3yXrTOFbOUe1IP52nh26GB7Fe/gHaF
 vqFDiRRZdQ4ov8vogHuCcAhjOjzpfHIb8j0M6YAwFhMOeccKK3HUFnoi8r7ylwh2pQFGj3ssF4Q
 nQteDcGcD34mFHDSwSfjjW/vYJMp9TcBFUD0DF1vcc+7e3qZpQmkdwcobnIqh9iL84vXfuz4hF5
 lg8QKCdDQb6UB4InGvqIs7PRuCYs2pNhvrhPW4xw1zbrkVpxhVMx5RBsIjMnioBh0CTSsxXCBKs
 MRyzEpju4nVddPzAyH0Jx1F+/EL7mZKxhTH4dClNeXBX/YitfbVVjSWAJOwVUiFWFSmymYspyGC
 lykH2n/BpZkDxpPqC/ziJOL42fqNVLBGtiFNbts8DPun3a8+Lsg1K7a3FFdxCKfNjNDXpZXyaCV
 8+P4NPTB5PEcVkIcoWg==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c3b602 cx=c_pps
 a=QyNrOpZ8ttbodQqJgga0rw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=n9Sqmae0AAAA:8 a=YXmLX5NuCm3bSSpPZIAA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Reason: safe

On Wed, Mar 25, 2026 at 05:20:28PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch fixes an issue like:
> where searching for the entity 'FU 11' could incorrectly match 'FU 113' first.
> The driver should first perform an exact match on the full string name.
> If no exact match is found, it can then fall back to a partial match.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Could use a fixes tag:

Fixes: 48fa77af2f4a ("ASoC: SDCA: Add terminal type into input/output widget name")

> ---
>  sound/soc/sdca/sdca_functions.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
> index 0b7d97dcb236..0787bf024d21 100644
> --- a/sound/soc/sdca/sdca_functions.c
> +++ b/sound/soc/sdca/sdca_functions.c
> @@ -1602,9 +1602,18 @@ static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *
>  						     const char *entity_label)
>  {
>  	int i;
> +	struct sdca_entity *entity = NULL;

Minor nit put this above the int i;

But looks like a good fix, thanks for spotting that.

Thanks,
Charles
