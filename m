Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBDA25760
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753106730; cv=fail; b=eqxOMv1DpPBQxpC6Bo80XuIIahDsnePchwIRrQKuH/EbCKf9H8TQ9YCqF9ad0xv1YcW6KKg2zoHPHB0xbInsKHqaGKY8qhUWn6flmXCZw0s4BqbvBNzG3H72jctlBVDJf9CBokc9BI2FSqaZ+A7wRbBJuD2b1AB0IguS1r27lvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753106730; c=relaxed/simple;
	bh=9I0gx67ecJ62qpvxBYeMN0iygp46h4MaI9p3WIpo01E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsGXJqkPEqNinjbC5JsUC19xrPJ8xAKfRLDVgWM0wfTFVRkwhqV1M5SItGd2q00/h8dWQnOb02j6Z/PB/lW6k+QfOCgWyo993HRPqyCaOVRxFkL3A2jf4BKHkZvB8EFlQOmv1Klp8I+jPPBLCKYNm+AMh8Q2EtrCXc6862fnSr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OxE8O1gn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gdwP1ySO; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OxE8O1gn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gdwP1ySO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAvJJS013865;
	Mon, 21 Jul 2025 09:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=HqbxrdtX1opnMlWZXV
	R77ymZ4hyLbRh9uUXBE10bIkA=; b=OxE8O1gnR+nHF/mab8WmvbZisIlmouZr7R
	PgJ8P6Ei2UrzysAiBFahh6KuRMIxo6CZ6geOqjQLEyrNRN2Vvr1KO9lYH73vrMa7
	pAOF5apPHuJDt3OLsg46fJ45paISVzbcpIfqLxw4yuZkSLGvMH4q20CosowpdULD
	c09i2gqcc94kFPZjtQ0n7HOauWMkFzrjjLKtUXfLEiXSXX+YVLGPU2bEFkBZrWqF
	R+sUCkxMBlWMATDp372ahcgPb2HinOyHMniCZ1wJaJF5T1jPTbMNJOIgXI9RoCbu
	QPb5FJEipSzr5yapRS28ibVCK3mmE0eaXhMP/SVK7+4iGFhLoXzw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2118.outbound.protection.outlook.com [40.107.244.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4807sg21uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 09:05:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIIR3cL9JpUQaXeF85JywKE9DSY7o0floS/uAitN93nUaKYz2kl5KPEJIoaLYhbdEXgD3TI+9Xc7Ddtgwe/VRvJ9zYOlvazAm2xpf5N+MrYiYwCpkWIyE+0LApJGmdtHpurP5lhiHMGuwlfs593MNgEhJyij4DpYsXftGBQnQfT3hX6BEouW8p6KWCOI++19OEGpGIhQYf0m5aPR0JBtuqenO6vi6TZnuyaK4KxQj+eKxu6PUcWVpCTNvt+/8E3mS3juR1trKKAtp0NRPvuX65OvaB0nmgueqsmbUZI1YiecMpkHr92nuZFQkKfxndXbKVsi13j1ELoGWkPv0RXjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqbxrdtX1opnMlWZXVR77ymZ4hyLbRh9uUXBE10bIkA=;
 b=oHItka3kSX/ja93U3PRzEG2DsJiPoqloaVv+Z5Ftct24VpATkD4XHVcFaVSYwWmeGsICouvrjwv9/XZJr5anBZBWptH2SmH2VQ9xj8r+uxNasahWjsYt4lM6eolsAeG6TAlvTSjznufJoKpreorM/tkfYBLk3diW3O+cXGwyu7Lx7MUEE46kgdwoKfzQF/k1sII/Hq7C21VbfT3QZXcZLVrKcipey5lnv52Ubk9OrCjf3VH1zuOZNV0vqP53Dh8uoiCqtpu4B3g5CLzx8v6LNr5T20OG39TjPSQQRKogbHB8eqgLTDUFe1afw/dfZwKf6XRvfN9ZAM2h3Ve6rBiS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqbxrdtX1opnMlWZXVR77ymZ4hyLbRh9uUXBE10bIkA=;
 b=gdwP1ySOdRykuYB80nEYRTyw6VOtZMdVBBMAdTjzmgJpKL8U8EXPfasJ7ZtBd4OavhbXgAIefESRhmJ9T6bVp7xXS63b2XTZd0FP8NbLv/ItKXEyPjexiBtZfhsaeRwr+nsBx2JvRF22Ek8o6LKuc7VpV+YSojOIsQB+PyBJiVE=
Received: from BYAPR01CA0020.prod.exchangelabs.com (2603:10b6:a02:80::33) by
 BY3PR19MB4945.namprd19.prod.outlook.com (2603:10b6:a03:36b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.20; Mon, 21 Jul
 2025 14:04:58 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::f5) by BYAPR01CA0020.outlook.office365.com
 (2603:10b6:a02:80::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 14:05:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 14:04:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 92632406541;
	Mon, 21 Jul 2025 14:04:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 74050820249;
	Mon, 21 Jul 2025 14:04:55 +0000 (UTC)
Date: Mon, 21 Jul 2025 15:04:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH 1/2] ASoC: SDCA: correct the calculation of the maximum
 init table size
Message-ID: <aH5JBnzcdT9opCYD@opensource.cirrus.com>
References: <20250721112334.388506-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721112334.388506-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|BY3PR19MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c129b1d-9fad-4f20-2b9d-08ddc85f9354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cOBKfbLfxtliFXcrz+OPhZS179EakHn14JOOf6VuC63xWDOhdVHuaLuOryB+?=
 =?us-ascii?Q?mRMfejTAveiIRBB2NQLDqhK+2vETGN0/KwSu0SUo6ZGIJYDYI+ThICbH/HMO?=
 =?us-ascii?Q?HSFk8Ql8CAT99K4GJTGOaG64pK0oWTuEmEbD84E+cudz0PP310iW6lZqc0LQ?=
 =?us-ascii?Q?ZfuDhCQLFR+/TpuF0K7YOvjindWKFGtkRDt2fjwKgEfLdbY+Zhlq7tldbmwh?=
 =?us-ascii?Q?pDDyb8ytFFDTBY5FH8WVM5jRqdzSgRCmjcGa/4Dv22BW0qY8yF/Mu3HeiaYw?=
 =?us-ascii?Q?MnWqViIEiMFyFYeCVKXMqqwE/8JEbMuJlQSxJDgnAHw7fvWUS/+2UFcagXSh?=
 =?us-ascii?Q?WDVRtcHMQwpA073d/mTFVRcVzTKjmm9ST/LtT2NUvblg7Pbnt9oKDx0YMe1X?=
 =?us-ascii?Q?vldTBZeW4IDXaG+4bwc2fogSaBQSQzcPy2ZeL8LBKG1rPXSk7nNuT34rtgXi?=
 =?us-ascii?Q?eOJGpvgyFiBnlWKrlHPSF5GhdBnK0JpH4U0yhq6WGAbN4OroK+qvXVhomwTM?=
 =?us-ascii?Q?kbcDVViKuqmEo3R8kEEYuRXRCNZSig8kUI7FDMbZwpsl0EYJ8CDShEvg8oiO?=
 =?us-ascii?Q?UY7JTHfVyrl2xstl9Fv5prGIzNaURD0pkA/dC0coKr0oVMtkg9r04JCJNwXY?=
 =?us-ascii?Q?AwZZ+LTf+IHpDnGB3uwrIiuKhwEu1uN2jSQ6wjoezcydIEWjbzWEb4AEKY4i?=
 =?us-ascii?Q?uA7udceYWjP5YO5GCliIKrx6TGO9sggatQaaCYzK/Iv/Sm0fKou+hZmtdTN+?=
 =?us-ascii?Q?Jabw/GMMhYbqhAW0ULgW7xL89GDgin9KMFloka5ScqyyjG7ZOLSkel1Y7o82?=
 =?us-ascii?Q?EWASgb4dFgxm1R6aJKb61XldITjFEEFYKMbMskCiECmIhwem9v7Y0tMOzdE+?=
 =?us-ascii?Q?uonCvhz1oRXgR5VSIxlMPZiOl6Vfgdf9OXkjP6BYsLSEDBsL0udrR/fbVK5M?=
 =?us-ascii?Q?wNrOxXkCJw+SZxIK+elWMX5qAJxgH+TL4hQsD14Pl3FOhSbOIiUpRNRsdkyW?=
 =?us-ascii?Q?zOiXinQWYQ0E0/NRHdWnkOJTl51ZhqyDo81KIMqwmGWZbiZ3QRfKhVOYJeM8?=
 =?us-ascii?Q?memwtiuaMCd1nhXzPRB9bVegXtnUpARvOpOqcmV6UC2t9DtV4Ac2jacpjuwx?=
 =?us-ascii?Q?XNKSe0eXP+VCIN9LVsf2Q9nhO0lUYnf/zvBxGID+sXs9UkwrPEhXGyURCIHA?=
 =?us-ascii?Q?E+wBm1mAy73EgzLdf3pC0wEgk8gXT7a+8ZeE32DJEuQwiGpj98R9qeWXOM21?=
 =?us-ascii?Q?BBiwH046re5iV7WTVDJYNz8YoJT+C4VnbkkfqFRERzb+feQAB9BUS9YEmiii?=
 =?us-ascii?Q?2bS5TsBXtrKLBr/IH08E4IoyRDUUa0GkHczCMnqdD/YM1pLamRCh7Bg2zmYv?=
 =?us-ascii?Q?tynyK1xzo1M0ua47r1UTJrI+wnx4yhfoiA9u7pjoDKW/bwJJp/pLJ/jOak53?=
 =?us-ascii?Q?GSIQxYGFX/siRgVgfJSyzRt1XJdCWbiyzbEZA7/OYKcOFhq0663BxOwrx3fc?=
 =?us-ascii?Q?bBLnoQCacAH+HaBn2CYuaDrENagDSLiFCHq+?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:04:57.2316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c129b1d-9fad-4f20-2b9d-08ddc85f9354
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4945
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4MSBTYWx0ZWRfX33VbnTiGLoO1 82wzcyVcYZqAZcKhwxxPcQ5wzMAaJJYqEd0XQoyH3ITXRIOfftGBjH3RpPj6kC2Vztp3ApXtbwi DVD0eYtEkZBtSJJB0yMtj9a39FeDbcTOzh5ZPSCcOjiJPeUoJQVlw68Wk/MdTkidEs05DpC10De
 kJwsrLYJuKGt29sPhTMTcNr4QbvAmO+3L77zdytECEzvVQO+QEfb6HVTsEVb/R3X/ZI7qjEC0C2 X3KeEKdlrkkN2pQAMuZiIoghzzKNgFS2xvTfSrycmjw4ghjfGkqeECYbUnE22RGfKRgBxBwnInn i88ynPzP6Q2m5No/J6E1xtj86aLJObcomJCvRZy2ac2JkqcMYjT4fJnx9Byl/ajflrFIJpZ92+8 OwTSjrs/
X-Proofpoint-GUID: FDgfc4gnI6LyHV5KEIqiTNCnO0zVqws3
X-Authority-Analysis: v=2.4 cv=O/85vA9W c=1 sm=1 tr=0 ts=687e490e cx=c_pps a=kYxjtQCH8jYJXwz0hAM5nw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=t0RSfYk0mluJo-qyEYsA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: FDgfc4gnI6LyHV5KEIqiTNCnO0zVqws3
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 21, 2025 at 07:23:34PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> One initial setting is 5 bytes, so num_init_writes should divide by 5.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
