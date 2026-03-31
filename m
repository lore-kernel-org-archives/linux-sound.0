Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EAC332612;
	Tue, 31 Mar 2026 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971575; cv=fail; b=PJm+kcXkuO9NhfdwI3N18VRhFK77ZIoep+UT7ijSbwJwUls+8qNK08+ZxMsw1dvoc23i0phIywT4KL0niksMuc3cyQmFaAvVFT6Waqt+KeqKqDRi0CWPV0KmBJ5noAMqgtPLFGQmKv8WiLBLAMu/rxg3cQ3EIXIKlhA8ZuuE4do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971575; c=relaxed/simple;
	bh=4lchz8CT0DQF1NnDAYY2IiwEt7WrNZT3ZH0DfZv1LLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqkZmuFhpNq6GS5BPXrqw2L/8Kez2qAaWJ1aVnKEsyv537TnUkiI9lZidhsG+9GeIlPjyzJ5G2V8360QB/pZ/zKHgBmj019CqEBwykNnff/5gOLppU/T/msc7gu1c5+HTNyjJxijbSluFME4mZ8kZ/5uUImmcxqwojzDBfbeHPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nv5vc/h+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BKHdq4Tf; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nv5vc/h+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BKHdq4Tf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4eMq92326948;
	Tue, 31 Mar 2026 10:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=X8eEH6fqPolQeygYSv
	WJIt6PX4oCShw78XI6p3LsjlQ=; b=nv5vc/h+jjD1iTZinR9qtXcKaR5A12NJDQ
	qlywNAgz6Xl0nNHKFaHcdcuZzAciGX2BxYJo06HalJS61UmkqmFkjDd3uqGE+fzJ
	IkLC7QDDMJkudHPc36r/s+ZiNfGkVZ6hPmR06u+FNx0VYCGCBeSAlRC+K3gN1P4P
	YvTyqgVURPN380dvHx9QJepLBvLqgP8ahLe9cGGqd9ZqPk4rgWhcaAbnRr90uiRg
	bImd8EYZEvCbTL0X/vZd79dxjj5lfC0O0q1kZA8w+0gg3xvIt7COeNd8LMi+K9i2
	IT/hJoovO86EojmKr6TeCRnhiKA1mDXJ15RwbeiAzF0v59ExJv3g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022092.outbound.protection.outlook.com [52.101.53.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxugm0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 Mar 2026 10:39:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i10ahMxFUyseLVlbY4LIHJMaqxYvz/5NpzNYA2Yqx6fWkY6EQ5ZXYEnEE5Mh3kBXBxThfIl508MZYRd0snFh43tbOtEF22wInWIDFh2mOrVdMtrJEsJrZdyzlPUQMKqOXGsCnMx11+Xvrf1qyBuf71Dw5KXmhgcLVfQcZpbxzu4RpYcyxkCBtbe8cMETXnKQOsM4lKyYchahJpbFn1Xgf3H9vAx21Yw2Cpc0QZTPPhc4aDjO7luLVJAgvx9Oqb9VVU7F2/gX56cngWkGsCTb2MhLhRpqadLNFltt6rD3mXA7TflSYdwnIJD960TUBEcSSiKOdK7YN4JYL+ggZTJtoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8eEH6fqPolQeygYSvWJIt6PX4oCShw78XI6p3LsjlQ=;
 b=gszMclZJyE+Z/etZVE4x4wK+jp641rgPDbHDl3dltH1eU0TigjcG4DkINUF0QacnrMvQBKS3TLClDsLggj7JuwCZJ0iPzQoYDkc6wMpW8aTPRPtyIyimbxMD892g/H+6PEJ7GF/yPmIPIDrlqInvJcBDNlXgCIvpHvddHJMlASPDu7Q3OnJYoDx585+XxVE7bpa45r0GVU5QW8EuXaRj4B6HrP2BrhNFFrPxVIUcCP639juFTmrWF19T3fPFJAZuqXdEky3GuvTODF0+88ZdDFeB4s//0jN+MtsQJizgEIGOZX0inQRIu/G8nFVrhggDYAw2sMGuwJkSK4+HDk7weg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8eEH6fqPolQeygYSvWJIt6PX4oCShw78XI6p3LsjlQ=;
 b=BKHdq4TfP7eKvl91tZB90Mnzf+dMpVIUKEj6InLIDSRZBu/2TXFfJAv1rGRdlyUU4R7OnITqo0IBAXVVflVCi7FR1ygUbmpPEpXa4VQdkcMa0bk70Zr/L+uKQqlPKioGeMAmR3ClMeJJ9tpwOVaH6mkrIH0gmWZb98c/XtedkY0=
Received: from CH5P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::11)
 by DS7PR19MB4613.namprd19.prod.outlook.com (2603:10b6:5:2c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 15:38:56 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::f9) by CH5P220CA0009.outlook.office365.com
 (2603:10b6:610:1ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Tue,
 31 Mar 2026 15:38:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Tue, 31 Mar 2026 15:38:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2B811406540;
	Tue, 31 Mar 2026 15:38:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0A329820247;
	Tue, 31 Mar 2026 15:38:55 +0000 (UTC)
Date: Tue, 31 Mar 2026 16:38:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v3 1/4] ASoC: SDCA: Export Q7.8 volume control helpers
Message-ID: <acvqjatVM+z8dSLi@opensource.cirrus.com>
References: <20260331151638.1281-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331151638.1281-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DS7PR19MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: 88219346-10a0-4cfd-eefa-08de8f3b9ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|7416014|36860700016|22082099003|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fyan/1VlJpQE4szr9B6bDL/uETGdWxYmvkZRjTHH143Va7QBDQwVVwCAvL+JiuuT9vuxHobYIUUJWFMG+en3kf15Aj2d0oSPgeyUYNzuomXkgGEv294Bohe8HX0vTQvsKmI4UrmrvZchF8GhqvZxag2YneOUmiplSFxrzpHv6yukh+u3ZE1Cs9awTm7731j+j57TrJNeXMO/AJXquysIMfkOtvZBBoMjHDfWwqC9a5khQDHAgmkk9GXb2QTjha4ZPZJBuxKOTZfHVxE3134aRSBmY3QMHuRO9r4O7YTiyFBRruRiUmaY7RXo5IhMjsx2xpfniSJWzT15Z9+9TDEHS+e3NS0erOxH/Te1u11lmuP8YHqszN7xnBKX784nCopRnBugWadx3wW05j133VAa6CVZMVi2Xypu3Gxe2pLcl5/IFVW1B7UbiPSGr/CQEvE16NLOeSjiAVfc6gounegMQo1opgFeMC/LsKoaox43ZtciTlHTqdQnJGC6DgDEMgWaX/x1DVsAIFImcgZ1neoBuUWTpx7C9VHrAjqA38+Kt1qLRSQHlZIllBwN+7vvx7kCKl1pvzuhhbbDgbXRRuMAj6vA6GW8YP0/RawdxG3xVAJi9aVbdRkzJg6PV1P1/aYZhGq07iLbU0d6YGQwSgX6ciLSRL8C65d1jrsgvehW/gW7rb8Y/Xt3du3Qvx5iQT00zPViZXBbWbdB9NLQ278XmgM5WzC+UihNblfAKygx51y2zNqNvOolmfu4a2orc8yTXklQMtq8y23h3BSkHifLLA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(7416014)(36860700016)(22082099003)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0VCNxKzyC6Ha/biqCqOyDq4/HgUK4SMq0pdyun5cql08EEMWjk7K9NNn7Zfescp2gORtjLt0AY7cF3+TCDzcPeuwllVdpJW6rYLyW1HwbEV8rOvKSaQj+zX25mRKt5SLZavOEBI2N9/QtyqVDE0l6UUH/6axCSwtm+3pFbcIvThzfThHMllAQW0kA4BHeHu42s8rWROLxT3zcF06pcGPcaecVqDSPp6Cqo4eZhOEd0jT5G+OkyrxmhehZJMmvtVVcRBYoCs3EVQKNsW6GbVehuBax4QCQZEAKd5RGO9f1wPEJa70jfnEKYEnKHY0zpnW34foKfH7i6NaRmIdsTjdCdhcjei2k8L1aQg1HavFGdQebCJPu+YePEtXpdIAoG3c5MH1dE/mN3UbeDwcEGBgI+EKA+kYGFqCAlJN1SDoxk8XmZymKlWYyjKlF1Dtd0Dh
X-Exchange-RoutingPolicyChecked:
	MC97bjkRwZmQe9cE/ZtdS8PcQoYAL4DVJgbh0qYGAbTm1vFRSasu32ou6O5K6VeA1HgmVD+NdVl4DrdtLGkBsmBw83kDnK6O+q3PZG6u2/hnkUeJ73ME4hxUHP4gffQ3dLIEAIZ8MWxO+ZHaACYFwVbOobwt0VY0m1r9oE5XNkoil73TSYXm/P+lzKQHLbaPr9H2P6di+yH6k+oYHJ6vIlSEeaC8D0LCJnumVRSHaWxUsxDNJrrlt4w/OlNnOkTJPxDGJtU+fDzYzaRuw/ytYs/Lgbz83q5nBeE7OKwTtwHFIuOJmd0laKPeEBpcHWNoumrHXB2B9QygUqblZr7G/Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:38:56.2175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88219346-10a0-4cfd-eefa-08de8f3b9ee6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4613
X-Proofpoint-ORIG-GUID: HqsxBwO3JJyWm9lh8jsz6f8feDXhZjQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MCBTYWx0ZWRfX4xnj13lk/chW
 6BkNUKfdEBv+8euDtjzOEXRDvZNui0Nc/QyCOTIIA7ekWmuecYAvYcICzT4sTMGSEAqUy7ed+4j
 5OT6PmvHTeKvx2xDXc+eosAw09de+q6/kRSX6I1DWglJL0FnWBH6pxLMCVO4cDHNYJAGsyvIwMf
 xF0xNBqnINkv02zaZB6/2MGBS5kNFiXx/ZUqdjXFM+GW7Cb6jrFaJuGl/qJ+RhmSAcHouMvN/d6
 XkxPcRemnC0LZVyO8ej0JDtbAR0C44ETQJv7mV8NtE+Llj3MM+l6M/HTP+smdUT7gPGraWAplkm
 bHXu1I9rJdjMr+3xYnaXQyNpHNdQMkfdTCZ+cmq2NOj89sRkv6YSxwu33XwMK0BWZEVjpShrhPF
 DKWtG8b6z3/T1nXsJb0AJ9OWrmNZuOXxrA+t1n9le+nb6TeooZWEhsLwO+u1RlnEsocLugfp2jN
 g2TbPTFEPM23qMHZaig==
X-Proofpoint-GUID: HqsxBwO3JJyWm9lh8jsz6f8feDXhZjQQ
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69cbea95 cx=c_pps
 a=KO6HEfrki8vYvSjcdf85Eg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=sozttTNsAAAA:8 a=w1d2syhTAAAA:8 a=88yiRTP3f5kikkP8IK4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Mar 31, 2026 at 08:46:35PM +0530, Niranjan H Y wrote:
> Export the Q7.8 volume control helpers to allow reuse
> by other ASoC drivers. These functions handle 16-bit
> signed Q7.8 fixed-point format values for volume controls.
> 
> Changes include:
> - Rename q78_get_volsw to sdca_asoc_q78_get_volsw
> - Rename q78_put_volsw to sdca_asoc_q78_put_volsw
> - Add a convenience macro SDCA_SINGLE_Q78_TLV() for creating
>   mixer controls
> 
> This allows other ASoC drivers to easily implement controls
> using the Q7.8 fixed-point format without duplicating code.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
