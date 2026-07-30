Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8223045349C
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427541; cv=fail; b=gKdq2HpHCr+NYASdZi0obFO750Ax7sNY/bDbkVvmir7Y+zBKWyWmxxqK7rKABBTgf9bnltUMNNqCoaQEkUe8ire+GW8qZRTuAewHiABwm1h+bJh+u4f3ngZUuqkM1ALbn+sI0fZAXpT8PZXHUIi+cdwF1TehJ/PTHub0+e+rzow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427541; c=relaxed/simple;
	bh=yovkeUCP5B+Z4/WRZ33QHoUVpo62JwkQakbAzE+BpbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9EKu8QkydtsykjTLPWJ6fnK3KB0tXCrZ2nacQlr+Wib40MMWmr1oQS10mgUk0dDVgCQ/+Ths1p428ijw6YoSAL7Yp/KMXvXmW61MLMTh55axFacgUnOU2YqLJPE4LESzfYZ7gknN/foQky2ujG6P24+lfkM97FXWUw8VjP3OYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OsDq03cn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K6zmhfLi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OsDq03cn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K6zmhfLi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UF49hi2959414;
	Thu, 30 Jul 2026 11:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=1SLtqT3k+zyKtGDa/i
	pqD4tRlQ2aVPHewyGjg6r+H2E=; b=OsDq03cnA6hnIBIVLlWBRhf7Qr2S5mQnrF
	tqtoKFeVusjquvDmtavSLMwxzilpuSXEeGTyDsSYwXxfJbC+9IcmmYGitldEuGk5
	u/rgkI3vlWWGEkrPkVadLlc0jEM1mMmvaf7A+4O82fyCadmJQYD7rBXApOU9+xWY
	Qt8lumQe7Mlla/vs0qdjsi+mLLdnJaJEhqV/E29GoNtTHjX4xqysXHkHKXG8pCIu
	Dh7fq0wpb+qyp9zp7UbHRsV+sy4i7yguN7K1LSrYaY/TjFTo8yJ3KxttQ/8gewb/
	vaqpNM0Cs1La1MqQAOMEtpUA39YScam7CQevl+kVihzQ+ZSPdjmA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021099.outbound.protection.outlook.com [52.101.57.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fr8x9045s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 11:05:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHOU1d7ak+tfUYGHRRL1LZzueKhwbsHftpgI3HlWz+Ak6waN3Qson72APLv8fL+1qY5rlEAriD0TOJCHSe/h+HypzaD1DliTVJfSLZipDwPdAB1UudnUpUNOAF9eM7uxDmwGU7GZhogVrqJ6zBq6qF9xLenOSK1e7JlMVVFiIcUYUT38n8C6G3CApxfTDE++k+bdz0upmg8WtizfaQHAIaAgEhMqgUUuZyqcBUhD2yE0+BPc3JiDQmAqeq+wzvdp8hNS4wuxFGxTNh0bEquRhpSxG4exa1/gv2tlx6uQp/VaPwWJTXSnPJCpoVVR8XEMwNO5ecjbrH8jh5dg9N5yUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SLtqT3k+zyKtGDa/ipqD4tRlQ2aVPHewyGjg6r+H2E=;
 b=LU4K4JOROvFOnoCxccb8y7YKrp8kSCMkCmQTCDxCortMfm8c3r0BxpPL6YMnoBtqg5S02k0eDVen4pYkHFJNK4b/jm1RfB6+PGQhiq+TOiTenH/eOhzMpdc/7bMHFI2jYtaSBXthaxbO7Wmz7jjQKS546HNy4ndGqZAFjAO8fz+e9D9gK6RCZ0yZqO1yX4WssbUTqKvRDDrq4nCBGODlmm2bSBaCgvYNR4F0ClKNk+4KP+LX6JVntbYDw2L9Esj73uXqYSG6Ef2Clq4hu6KN2CnxMQSyIIU1ZijWoMD0vnGy84Pk+DSKu3Ke/NFNL3J7mWbe7tRhnSke2jWlFyzlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SLtqT3k+zyKtGDa/ipqD4tRlQ2aVPHewyGjg6r+H2E=;
 b=K6zmhfLivNTu1Fdfh1SPQPA0BD+XIre3Hdwi6RfR+177MUqsxjF5YuAy0CExjJqqr7VGJqmT2bW28imrMAgNvGgkm11LvCVKERJN08+4z9ozfKXjE5Eq/kYS7ydGXD1mxcAFvqg0nD+SGvYOGfkhvhnXj0IsXfbSUWJC6BGsE0c=
Received: from SJ0PR05CA0060.namprd05.prod.outlook.com (2603:10b6:a03:33f::35)
 by CO1PR19MB4871.namprd19.prod.outlook.com (2603:10b6:303:d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 16:05:12 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::49) by SJ0PR05CA0060.outlook.office365.com
 (2603:10b6:a03:33f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Thu,
 30 Jul 2026 16:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 16:05:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5B202406541;
	Thu, 30 Jul 2026 16:05:10 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4AC3F82024C;
	Thu, 30 Jul 2026 16:05:10 +0000 (UTC)
Date: Thu, 30 Jul 2026 17:05:09 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v2 2/3] ASoC: SDCA: export
 sdca_asoc_populate_rate_format() helper
Message-ID: <amt2NbniN1hsB120@opensource.cirrus.com>
References: <20260729032237.3750805-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729032237.3750805-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|CO1PR19MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b8f543-1256-4ed2-0589-08deee5455f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|61400799027|56012099006|11063799006|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JqgJB3uO7XXMIuMQgQBkd+jJww9KSDBxW7B67vfzkj+GXk0O2A0fL+VMw6TRD5XInv/i5cHCSS+1RGZY05jb3xpiFhOwXVIs4DZcpSzu4BOreQoTw165EEhWJwNF6aGT2veqIVkzxBP8atBzCrxIWGPauo+yPk4zV2qJYTLrQFOoEiMcRxPs53erz9WCjr3Okm25EJYoGwD+21+f4Zn9lQ0pB1xCDwiBfLLFmcyJ7viA2R3qO1SdUkx/KrqWybS8ba0Ig3V+1/okNW0YUdB6zzAcALtoKkIbz8QEOe4NtEhc0hF2Wbpmh56693g5j0y3Y4uxfi2A0rwjmmVfrEgHspv/nkLe9n+xhVMAin5l8Dl2aKXN/r+2k2sR8EmrBU+q84p+zs3G+sn+VdwQTtVoYijpXUXGqnL1Ul/ZrJgTnnvPV1DTeaFqswCYnlgmpKLFGZIcjcPuUtxoJh9jkhGbWL03SYl2SzguzIGBSQf+G1g2h1lEFnhZ1A0xf3KN7HJhSH314KmO55vy9mzuXoudbW+tM3bJfXLXt+gy2e3gPscaH/IemvC9mk10+knCKkG9AmtmWSSOyWwk5T8esyR+bh1+q7yEKZrMth/gGfpfs/9HAdh7GyFd4Qjj98TFHSheBdcvlffrEV18ES9kbzaVGEw1hZwy66L67+HWUAWX6iq5e9seYl3zKtOfeGkDaV5wdAnOLP7R9MNHTTTKkeVoYQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(61400799027)(56012099006)(11063799006)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/4hUuOx4W6xF5o7r6cmlvQwtBBsjXdNunvEdi++LQHhNh+tpk9QD0bs0R5bTgQ1O3JiH1t87W08Le3kGphBsOCRSYYfHXjQOqlNCJOw3NedD5a/KU5l3omhm9i1K4ZlSYUE37Do7j+6t/KQzurAcCkThDFb/2LUc8+0CWqlZD4ynFc/hA4AEIufWpCoOFC/tz+QrylvYP4i/GiJLroiWDSjnCjZTEXzz/jODdVj+erjlmx8HD0RrB2BKADHJGuIw2r/QUu10l2gf/Q+AQTKli1KIQbwBn0ZKXkdIEbi+hidDQJAKxfmBYJX+wSfvJYBD1t3FmKZ5vjHtAw8fqzAZhxKyvmustzOZO8ABQxHBE5UobRwGdjSHDVDQ8i00u3kHipdifmpZbPvh37M3/23Rp+MYMWKCD3jdW8hFCgkZI6KohVJtZV7tjAVOEp6eowC7
X-Exchange-RoutingPolicyChecked:
	TSjwTLcHtkvaQUdeOaErWmuM8OyoBZWXbex4TVmQmLiH/OlobX1RqEmMPRCu36ZwJeThg1WV5MMSTSPH3MOVOGgpYq1Wd4xb3tpFeTrEhtL2P+P104niHzpOTrVu5ArGHFVsz+Hsl2spxn2d6kqz7W+UZx9Wye7TxNqI7QOJKvLxNoncJLvqYqnD249dLNvNMww6Qi5igHgmjjKpkDIdqVue473R3NrCu84U1X53Og4QqmegRCtmJnAoTzAqhU7DUw4FUuQcmRB3raQHXKlkLLYEsU7auPfv2PytLDcCdyptRvGBWvtwX11GQLqkjwXE9UYOCwOgl6gp2/2yVA8zgw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:05:11.6403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b8f543-1256-4ed2-0589-08deee5455f0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4871
X-Authority-Analysis: v=2.4 cv=YcCNIQRf c=1 sm=1 tr=0 ts=6a6b763c cx=c_pps
 a=R6UrSnLJfpfGpNf2BUW/2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=E0C_x8z4EkYMHntO9HwA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: 9cnK-011pGanLpFUMskpHpLhOa9GjJ9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfX/IeARkP0avmw
 uLpbmgx6OJ5HaiIU4Cl9S4RYGqMEsXQFmTxxmi48Hq2h5j14PZ7SgGMZnxjFahgFdzFj5HY/ytC
 7tnsTlY7CtWssaY2hrB4JvGjuzSpVYT2lSmeU8jREBd7Mvx8qzwfYlR8ufx2gPURyvuI2ZFv+az
 Ev8+JDYXM390L7RQc/HEDMSwEbUJZfhdl5aaWmIjOOYpoXQ6qRvD/IwqWZuV5iXOzydROyvK/j2
 u0JyEKlSHBhmRirdb7DYIAkoPRfNTree0K6Ucfu8ioZ6dmvRN0Os3YNyT8ik1YFPV8Kiv9/seyF
 kGJKugJBWV/3CsIf1yDl/2oLmz0CMPyLnIMxfBH7ToawNoAM7PDQwzU36WCpG4Rqk802Xsnzc8O
 z6YyCL2rWRGUQrlFRcTblkz4cy8aHZwLrI0bmYVUgl/1Cv9d/U/wPXHOXeLNrtC0VT8XzrZoLwU
 6Yt0+CvlP/h0GrZg2Xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfX7O0xIOvrXKTN
 cWzaJaYpaPQCsuaKOpZ/8SlV3WNZD7jFANjeoyP4rBKHeHiEsIBaJ7epgHukC0UosUsrwoAXsqy
 nmqLdgy1TxbfLfewnutAkczsPh6ofn4=
X-Proofpoint-ORIG-GUID: 9cnK-011pGanLpFUMskpHpLhOa9GjJ9C
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 29, 2026 at 11:22:37AM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> Export populate_rate_format() as sdca_asoc_populate_rate_format() so that
> it can be used by codec drivers.
> The codec driver could get rate and format information for the IT/OT entity.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
