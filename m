Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAC7308F11;
	Wed, 10 Dec 2025 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765360819; cv=fail; b=MLCIJ5NifnPC3VmogyZmlAPu4YBeCgdQBRCIASiG30hFhYLN2ABER5f3Rgsknm7vIcQvqNjy7hkihLMDMBueGK3PxbU4uvaiBuQEP6Fp6cu0qdYn+ykaAJnCWxGhYFzAW7qsI//zuqI2paMcZOQe1AHmaTS9fjZFk5Os+XT77NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765360819; c=relaxed/simple;
	bh=+9HtElzm+37TAQ8/20hzK5Yj47lP1JZGEpLcYfyU1R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n98EoSDkz1szH2gw8EuLxRrSRERF3KE/DyyrmNQ1H5/cXgvquRihhr2IK0NWu6cUfHf90Umgd08wyRcyH2oL2aBT+Ngdi6ykmePixl4c8clZIpL11wsIL1Nwec5qTzcmawGWGMrxU3d/HnHqUF7EDp6fTt5J0wr6WoTMLNCPDfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Kbffqio6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OkTs5weW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Kbffqio6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OkTs5weW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA5iqtf2664994;
	Wed, 10 Dec 2025 03:59:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=hNF27B3mQ/KLOXMv/c
	Gu3iyuxjNoziijI1+Dhn5sMDU=; b=Kbffqio6g8U+dFAGsQ5OoqhStY+hR87XGr
	sRNTmNVyWqKoktY3aVd33rgmwQjHH5orV60SzIWUQeXQfGE0b/Pb35R+laeHRDcv
	Eaa21pTTzceluGseJWT0Fa4Pz5o0nSHS/TAM49hWbiHMBtADJL5q6wXW5fij18UY
	Z6K4rARyGU3eNQnBOVHJZ2vBuy/+dV1M25F+u1G49T7MJW1wtnk1t+dP87zhAzwV
	46KVGrc5bQGW9WMywHa8F6Y6SLVU3uTVl/voro641DrImI/krQU1PY0Iu0nRuncD
	2ObA+TcjJnfuiNBZeWsJWvyvO9DCR8rOYs13I3o/nHsanbezVzgQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022091.outbound.protection.outlook.com [52.101.48.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhsksj4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 03:59:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5RTCIZvnafoNTo14pzmixlyt8r7syH+ZiiV9cpT9bpYyLVBUg+aC9SwKag5cyMGAbT1z4Pquu5WRpgt4j2TnD2FUXtTZ9hXmnuSe+TJ8BA95W54LHIy6ph0wdMU9jRn0xfvH35W6FpYsuzQwz58xMbMowQ4dSf+6Ej9GyIosYZPNWgoJt+McucVBKzy5B3IswIL0pSRZwpD3T6TTCg+IFzFT2MnSmkUnBQaLmPh/ZqGuub/qC1DlHS+X07AS/+S6NumwxcWm04bqlnjSLUGiAaJGieM2BH8z/kSU1/gniur3DLN0bvvU1vh1LRk7mB/pm2SKBa6o/VDuCfFcyvP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNF27B3mQ/KLOXMv/cGu3iyuxjNoziijI1+Dhn5sMDU=;
 b=ELdqh34ulITpwkygsfS51+8Dd78zAgKJuneoWAjTUWFmSqg0W6RNbUHS7cSZrCp4P631n50WAaVuqNXps5UGXnIgi4U8wwKb/JR1xmjnkkI+jra5MjAJNeqkfR7pApn+y80YVAHJhJtqiP7Omz+mkrmw3gua/3cG0nPwg7HuK9nMGdOnGqQFEGWDDOgGMPGR9wcIC490jEB+vh0fe0mSEsxRuwTrggQqYi/QyQZ3LSG5tnKg+xMcxe9drvmk3ePTyzUoixFCjS7aYS3wEWinKOA0NLj6OvNjKqii2JM/3ZDfRAWlxa/4DWc8GZWQmr+tUFefy6YLpM622lloQ95Xyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNF27B3mQ/KLOXMv/cGu3iyuxjNoziijI1+Dhn5sMDU=;
 b=OkTs5weWymKh8VxIiYKnRtUG3d+FoKbAxn34kuCBBnLRGJu2+uVTkyFp4QGQrDwIxOGFBuEYF9dflFjC0ny+30yW+rUihnqhPCQ2PyXhVPdcNQ7n0Wz4uZxd3ZucTWPvJ6I1HDsDihfzNREoZtZwwkMBoAvMt3jOLyObuCoctlU=
Received: from SJ0PR05CA0088.namprd05.prod.outlook.com (2603:10b6:a03:332::33)
 by PH8PR19MB7120.namprd19.prod.outlook.com (2603:10b6:510:217::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 09:59:22 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:332:cafe::ad) by SJ0PR05CA0088.outlook.office365.com
 (2603:10b6:a03:332::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Wed,
 10 Dec 2025 09:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.0
 via Frontend Transport; Wed, 10 Dec 2025 09:59:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8D049406540;
	Wed, 10 Dec 2025 09:59:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7C0DF820247;
	Wed, 10 Dec 2025 09:59:20 +0000 (UTC)
Date: Wed, 10 Dec 2025 09:59:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wm0010: Replace cpu_to_be64 + le64_to_cpu
 with swab64
Message-ID: <aTlEdw86Zgjtudr+@opensource.cirrus.com>
References: <20251209151853.432518-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209151853.432518-1-thorsten.blum@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|PH8PR19MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: c370100d-c221-45f9-7a82-08de37d2cb11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GBuBr7kuGn/bm+nHPrlvzq75v8DY0YMrrggYUwbMNdBEzNP6ETaLn4dMef+S?=
 =?us-ascii?Q?S+iNe2czWb7p+vV9OQc4FQJGDVuWTEuFmg8nNtUsrhI0CG5UTQlKfi117juQ?=
 =?us-ascii?Q?wnfdulOQjKPavHD7XOybav2wHV0hAvvH/0vAsLrjNNoKrXIF61rI1DrGKizF?=
 =?us-ascii?Q?OfjPO2gTWcd5UIfQsgMZuUQdDkyKVuVMXXPX5QHt2e1n/ZtZMUE8AMSRIlvN?=
 =?us-ascii?Q?PKJua4YT/hu1XpfcN7Y7WtikCUAvRrfvBiFSIS65VdDwkQt4U20/TVnKyZvs?=
 =?us-ascii?Q?bOENSpcjUHKTBvjLzC0B6taI73ZOHjbaFYzpRlkZ6MCMXlEARrgT3Jrjtq7H?=
 =?us-ascii?Q?siFzTcim8d2z94AbRJjcGNFJ2VnYSa9DlPFRXc6EJxtMsngp4eNQHjKXv6Es?=
 =?us-ascii?Q?YjZqJnyJ0aYPeu/5vyOKNw2W0fMVTK0UziPcUMC9eyiIje4UK3KqF6mVEhHD?=
 =?us-ascii?Q?qFk0k5F6qAMKlgSdu4xpXcuac588bHe7701ZZNFmYjWbSzmHvTl+PSx5mJ+k?=
 =?us-ascii?Q?M/rE6CmAB1DjaelSvJNRXWyi3hkyHMi3TQ4ehL8+/DBdYRGzl0wBLVvuf6Gt?=
 =?us-ascii?Q?eTFoquRPt34yohCCS3B1OKBzY/JSiChSkdwDI/g74L30TfbF+vkWlBXSdK7e?=
 =?us-ascii?Q?ESuwuG+ImhkMhyw3I7QRdO4kFHYyeGzkgJOIVjs8/Gc2Eof1siiZKm3HCsv6?=
 =?us-ascii?Q?k+ct4KCaIOkfZgWARhWbqDwHfvLWYVo6hC0oa2cJjd3rQAyy90EZ/GTHIr6H?=
 =?us-ascii?Q?iwYKOIV9iX36fNpH+UcZaEExyD5LoPolrqLDaUwzcn0TtQXfZwcCxMC7D58f?=
 =?us-ascii?Q?J/eFv1RTVAq/flJRQnjd1GwBYHdhYuTAVbNOYhdUywnvtIqfFdEVIgWeqM3+?=
 =?us-ascii?Q?Bkyurnz7bRT5TuAr3YQjpWszcIBrpGiuPs5OtJrAy1Vei+LNseqXrr6AJlun?=
 =?us-ascii?Q?WfMaxcrmauwVDElW2T/Y+gsScAwkQnCyEECmdVpr5dQzbe892YOpSHvpXW+f?=
 =?us-ascii?Q?YSY2TIxmuEG0SE2qYXvIzXvbAwfHytz7Spoy+NEDcRlT7PBXHT92YZ4fcrKd?=
 =?us-ascii?Q?zRd0/2ed2Br49QsOpdoGP8bBbVeSD7qTGDSIiB59TdxGZNzzQitK6rqV20Eb?=
 =?us-ascii?Q?zL1JGvMJNEY0PTN/FvEO6SXqJzyCD5+hxGeIrI1tI7cGt35Ii3md/m0IzuH9?=
 =?us-ascii?Q?SCqiWZ+iY9Acwef5VacvvrWJfHV9DbZXjA5cvtazRlwhMcGKqtg3RLzoVPI7?=
 =?us-ascii?Q?dvKLViFGcEMGB431Qlu/h4hgAB8oadtDWpPj5R1iGYBzGTO7bqZk8ZYIy/82?=
 =?us-ascii?Q?qNZdjnYOre6OZVW5po9kbH4PSmuPxqMCNc9GxG4HkKe5t9s7ogc7eSKobekT?=
 =?us-ascii?Q?R0TWP7YVg/L9ZMznDF5VvcT19bIvhkg8hBNElbWTOaNoiqz/M/szztSA02Uf?=
 =?us-ascii?Q?xpmwAXI7VTcPUYaKnVTbeIyqvh0qXLjdqrXWRd2v1jic7unCeMhj6ffTeVZW?=
 =?us-ascii?Q?Eq5uoyDU5UaMYR+0lIgBFFA+9wPzO+zU/h9VO0nWTnV04pAMv0FBIGu1Dsds?=
 =?us-ascii?Q?e/E9kJ/Qzr0LZWYbgbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:59:21.9352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c370100d-c221-45f9-7a82-08de37d2cb11
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7120
X-Proofpoint-ORIG-GUID: tMfTfEBbvzbRhKHuf5r0e-MgGeYUZmAm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NCBTYWx0ZWRfX7v9D4EmURqWo
 OrKivbB2kEvWE3aI/qzSZXat8N8gI0erDvYXHonSHkawQ+SxoUBNm6VaRuaIWLNjkli+Pmcmbu6
 FRGyWt5exTY8R1qjITT+QX4wyvfFP3qPDsFKN/BuEB2bpJqvMKr6YdvM/NYOGXOEZHzpIofmlIY
 qJOSxrErBDiNnim36mxnorsTCrjOLZ8BnIliUrt1jJIyOzuw53CdzLnSEL8Tl1M12jnJ4aheylJ
 isL03/z0viqo58sqtpSqhzxelU+tfTfYoRK/b/iUBHWBRlxfL0aiojjNlZYm+cKmTEsFlVgpu5k
 tHpLopg8129hbMbzfLqVRybXKlD2SSrABiQ/vLa3Tf21naNUwJbRpUh2/AyUQFO/JR745q0raPL
 HLJV7xFU2Rg9FQIjRBK3f/j/0hqokg==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=6939447e cx=c_pps
 a=gqqRaR/JtIFMplGXl4YyTg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=fBYuEBMC_0T161HFywwA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: tMfTfEBbvzbRhKHuf5r0e-MgGeYUZmAm
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 09, 2025 at 04:18:50PM +0100, Thorsten Blum wrote:
> Replace cpu_to_be64(le64_to_cpu()) with swab64() to simplify
> byte_swap_64().  No functional changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
