Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C458F61FFE
	for <linux-sound@vger.kernel.org>; Thu, 11 Sep 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596078; cv=fail; b=OWk0cOzms5BaRzIcQq16NuxBR+LDwtHClZrrwU+FLMZzFeK9PFsE9ahCgVlgv/p9xAJMoCWhaFsJpkcczFDvcPF0uq1f4SjGEs+oqpURZ/tAvP3ndrndMRp4bB63igYHZKCmP/ZyVo/Q6Vqn26zWQNWbrEbamaAZRUNR2FDbdDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596078; c=relaxed/simple;
	bh=m9BDuSqWFPfOIehMs57zOlME0FoGicElzXIRQZgbKCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZZjZECN0DJHvfTvNXHamsq0FMgGbuTQy37llWdRYQ9xPsVniNYtnZpjwNdSU5ixpORSUoi4BXA9mrSy357KFSZZnH2yF6tRQp5FNVPH/tZp9wzBEDT3ry+73aersugnOb8wuPFd+jY1Oyoeb4P6u90QnlwJhTHU7vC7rZMZRuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EQpWwKNc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=e2e/KUL+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EQpWwKNc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="e2e/KUL+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58AJF5J5173755;
	Thu, 11 Sep 2025 08:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=l/fmSwUCAA2e3WGXE6
	MdwZAZpqpNK6Mg4B6Tno47yeE=; b=EQpWwKNc9ZegBSq1esUeg+0WRXILQOxCFG
	wSJbwOpdD23D7vXhznmOB9w5460JsN3kNfZKO498iobJLDkWKRQ7Z+cVrEEsHVl/
	XC21V350MLi+l9N+ytujewG0yvBubkthVdCp/HAi8fICrJS8UUmXt7B7JZqbWJn5
	J1ZErJCR5blqf6TThP7KolYw68jawwJLik8U+ri++xHauOjyILrEZUTwnm2+qGAz
	dCdIDZHSGy+4rtxyE6yg2K3kOePHAJlM+R69qK8SU2YPdGK6iuHYHXnvxq9l/wyE
	tkBbDKGVUp4EEfx9f1bNvjEGpOPTAflQfHgZkQqYikTTSHWA4fjA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2115.outbound.protection.outlook.com [40.107.223.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 493fas11vk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 08:07:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6Go6lizuTtU5WqVaoTYKB/dBPY421t8JGPQ92lN6pkLizKwwwJYs8+XBwCWeepqIWx953m5GDbYXvbtldGJENpuhnpIrUSJYGChXEsaVPQ2thA1HyLcsF/ij4mwAGugJCJL3euVVuZa41qdmySQ9AR49r471SL4QMigwVxSpeTMAKSbbrohx0C4fbc/FIg9QZrZ7CsI1WuVW8Nvq6VW//jzrGZnxiD6rwdPzRMZfnmC75U2MF54zaNMDAWl4OYPwIzYX+ZPDJwBqEKONcEkIQRBrYt5ZbRw0kH3h52naEQB6uQNb3PSgBEBsofGMpGapmZVaL7JAJD7HRgsZuYPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/fmSwUCAA2e3WGXE6MdwZAZpqpNK6Mg4B6Tno47yeE=;
 b=bXnTvBkbRQwP+4/f9Mbs1V2EE1fF2xN5sdImyNfpUA/JKUC7QvnFzRJjhyy6NdfhVPS3MpuTOLK7EmYGXw4vusV1/meEdPCTEyitrgDuBehTYvgPqffuhXIqfCPx05Hjj1Iz4pyqpTBrduXyfR91MiTKwXOJren1X0IfXjJTsykn/SZbm1BZ2LUgLlQ0ISHB4WP0w26WRC+cU1L6lh9nbaJkp5394dY1ek+n0u139PF/76H9QUVkfPY12fqUbipRGhietnAByetimmNa0EuQgSGTJp0XlmHFRWVEVFliKo9Bb2J2U+3KZgUjER3uzbqZxci8E0hGwCuKYYNeXEgAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/fmSwUCAA2e3WGXE6MdwZAZpqpNK6Mg4B6Tno47yeE=;
 b=e2e/KUL+uzGIjPBpQ0EUzDpPi1+8YXbJ2ZyvVG50brCfISZcSwoN8QKHkUTulkcLZLgmLsNGRfIm9+OIxBwqxNPu1+vf+8HyhRE7wa3vu/MHn5H9yOTOLyir3ljVMoOMBq1QjhWkcwdTWBgDR07buNvcMODabp+s9bghwGOmiNQ=
Received: from BL1P221CA0038.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::9)
 by CH9PR19MB9561.namprd19.prod.outlook.com (2603:10b6:610:2dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 13:07:25 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:208:5b5:cafe::ce) by BL1P221CA0038.outlook.office365.com
 (2603:10b6:208:5b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Thu,
 11 Sep 2025 13:07:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Thu, 11 Sep 2025 13:07:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 89F6B406542;
	Thu, 11 Sep 2025 13:07:23 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7043E820247;
	Thu, 11 Sep 2025 13:07:23 +0000 (UTC)
Date: Thu, 11 Sep 2025 14:07:22 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
Message-ID: <aMLJip1e61LlEjwx@opensource.cirrus.com>
References: <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
 <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
 <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
 <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
 <aMBbavEX2RyzBy1o@opensource.cirrus.com>
 <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
 <aMF/H8yejQ51B65X@opensource.cirrus.com>
 <0c440de8-764a-40a4-b040-a343ac3687f2@linux.dev>
 <aMGbz3l2n0q9Fhkh@opensource.cirrus.com>
 <4ddd1987-427d-409a-af89-7b505df5fa34@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ddd1987-427d-409a-af89-7b505df5fa34@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|CH9PR19MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b681f08-b787-4138-a75e-08ddf13426f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6TfEUOq5r7NkQEwvGK7CNTZguzUgIdKXUNtCNDPMig4oYn6VMIfTpnWwsNd9?=
 =?us-ascii?Q?v0ecnbE0qem+vxXq1AT0AY5/C+AmK6hobERPlZOcnx1kxTYgsD/p0LVsMfCE?=
 =?us-ascii?Q?sMOmPCuhQ7mgo520w1EpxjsmOGcCB5/4bP6741YmCFQtgcKOeMFnxFj5xrRV?=
 =?us-ascii?Q?uQcbUcWHn8eFo2BdpZS2qPREKRkpONGhZiOUhQp+EcXdLgv2MZSzLyuf5LlH?=
 =?us-ascii?Q?2ZtIzr/41BnI+CQ80fBHQIMDw8Cn/Y5X4T0KfS/a6+N11Il8d0UtJmmLO599?=
 =?us-ascii?Q?M61kJHoI6nDdazGJbXTVlkPMGBcNb05jm65q+sDMYp7ZJ0bBWApJ1iY2f4LY?=
 =?us-ascii?Q?F+hLuNMkNRCb9dU++jWuAFNUEIYNQRzbxe4o/b1KQspgkdz6tzhR0U+Vp2ca?=
 =?us-ascii?Q?bbI5c/ZIMaL4Fp2hFLI/X8GAt48DA8uVIzeZoQp6Zw7T8OKXrAddFHTjg5QW?=
 =?us-ascii?Q?LofaeGZjOszxM0QLFAC38e9u+6UEsCLhdb6Tf5++tO2eBJTCje4qiLmiMz8D?=
 =?us-ascii?Q?+YMb1XtOc1XqhKTQJ8YZG1eVBIoeFDRUD6pV6C0B/kHWPTIipJXl5ZAH7Sff?=
 =?us-ascii?Q?VB0yLbu38/vJIHiMo7qWRaqiznzpjJaZK6O220SDLQ8NVDmwDTGJRGtDYdk2?=
 =?us-ascii?Q?OlWBFxwlj7Xycduil5Z+JR6kXOGsRp0+z1eDKHz+iJa10Z9R6i7BUS0iZ4JN?=
 =?us-ascii?Q?YIg8D6iVnF2Bv6rcM755DFsAWPlw06CQtsHF3d6PpUjMDmFcJi4QVIAzuvVs?=
 =?us-ascii?Q?ctQcHm4J0RwitnD7zBelXyTN+iYzxkj8uRkRteyDpyxwOZIOKcAmF68wGRxa?=
 =?us-ascii?Q?Nm7zEi7Mr5SL4wTkXkKAIvXDKihrtYKy4Z2LWbnxQBIlm+oLLvayRnofZVOW?=
 =?us-ascii?Q?D3sqqiMfLF1WwWnDH9qo1pMFwEE1yeEm1ts+VfsEgX8hUMOKCgngaLFmZuwl?=
 =?us-ascii?Q?7KDN6rAYiIGOWVqF9m96cBiDMWAnlaxXPFsmwlVfv2s5a5GA0I7CHI3HQnH4?=
 =?us-ascii?Q?HKDujpLgUbMenYApOV1Um/3yAe8KOnkC11hpDZeN1oZm7NeXRt0IY4tMdOXu?=
 =?us-ascii?Q?SlIVjjZzgf53bZOQ+ZdF4GbWaNdSfTDtZr+1hrT3XgoZHQrxTcIcAnOtUxOz?=
 =?us-ascii?Q?fUyOIc0Nukm8FV52nI7+RiB8KfFzgMwWATAbgC73y3ZjIi7uW4O+60K9COzf?=
 =?us-ascii?Q?YaJDPeL7wAnyxTfhekgPK2awHmgYxppdD6htX83ITTUx1Az6lzZVpg5gffoO?=
 =?us-ascii?Q?8ndg+p8sOpiKrovWD+qXwwTx9o/EEfirGfCFPxzJbBRyfTdiTh//TgMYopTa?=
 =?us-ascii?Q?LlW9qh5UZNCMFqJt4l/0+MoN+qsxfrcxacGAW1cY8lSeeJG5/mctdgKuANGS?=
 =?us-ascii?Q?+f9rQPrvFyb5Y3UF+y1aojr4k4fN1o2FhqG0Skl4qWa/gRhYg3b/pZuDYKlr?=
 =?us-ascii?Q?0VtkPviM/88jSpDISx1+GUUW1LnRSc4yokO/uleTa75F7te9eHvkZFsV42+t?=
 =?us-ascii?Q?LQFU6o13G2h7EyGBOlXSrV9cF0VFm40OqB/2?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 13:07:24.8680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b681f08-b787-4138-a75e-08ddf13426f7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9561
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDExOSBTYWx0ZWRfXwl+Ah9aifkZU
 MFxGnwAu05uUtGMX7tRtZ9sJL1N/tbHLI7oarj7iTljy9roj3v4DvU6WEGfgfyQQM+tkMTC9QpX
 XimZQtoDwkHT/yPpm7/BKFmAV2/ApPNo/Askx1cdBFYS3V1DW3qD61DpbbFgipq+9//fWzEkF9t
 3i+OT5/d8aLihsuTOMfsAuPdrTLGKm63gIcbY/wqbLHArglwa7jA6u3SBnnoi/kiSb5AP8RMCQv
 aZaogyGzMNF2LX1csVUA4q89PFEP3zdRiE6xntFjzQnjEanZ0ovExcde+MqEcFwzGbVpKtNTHnm
 9RpxXVh1VzJWGmEzwTOBrh2BjkHEFTPaIMbvkIIbH9HrnDRD1+zTxuzgjyhsQM=
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68c2c990 cx=c_pps
 a=YbcMhz4I3gND9vdO9+Tgiw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=Q9SRF10RvA0lW5K11hsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: iqogm10IeGtwlf7ipkSZBQ7lkg0b2wUL
X-Proofpoint-GUID: iqogm10IeGtwlf7ipkSZBQ7lkg0b2wUL
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 11, 2025 at 02:33:46PM +0200, Pierre-Louis Bossart wrote:
> > Once these timeouts exist we have to pick values for them,
> > because SDCA is a huge huge fan of asking you to wait for
> > something but not saying for how long. If you have any thoughts
> > on this that would be appreciated too, but mostly I will just
> > pluck some vaguely reasonable sounding values as I did for the
> > existing FDL timeouts.
> 
> The SDCA 1.0 spec defines DisCo properties for UMP timeouts,
> just do a search for "ownership-transition-max-delay". Table 139
> page 236 defines this property specifically for XUs and hence
> the low-level protocol FDL is based on.
> 
> The description reads:
> 
> "
> The maximum time allowed for Device to change the
> ownership from Device to Host in an Rx UMP when Host
> Software is waiting for the owner to change back to Host.
> "
> 
> As usual it's quite possible that platform firmware is broken
> with bad values, but the design intent was to provide a timeout
> value for software to use. Ignoring these properties doesn't
> seem quite right to me...

No, I had missed this property! That is excellent. Don't suppose
you have a similar magic touch with the "Wait until there are
no new requests for File Download" in the Class Software Load
Sequence?

Thanks,
Charles
