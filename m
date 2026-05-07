Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78761371D04
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145688; cv=fail; b=bHUwZCpQoJ4buReWb/H07dmP8P3GHVBHVsg5pM2RY4f1rvk609z0goE0DSQEnG+TXEEja9kN7YvJ1vgbyd7/KVemFywaXhzd7j/3myvBqbKkA2pyWK5cAoFy1WkiF6+mOdzNSPJGsuySr4gk6Ty1SlFPbvKlWEat4iTxmMAFy08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145688; c=relaxed/simple;
	bh=ceq6PxyOK6y7FiiAnwISqZA/+8RAtclalgl/LqdlqmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5u19o1+v5xNBmvU9zYn/H0g/MKdbTPXIvP3xPL86Hps9fglJQmbMzE7RUaRAoU/BiSP++Tv3ByPS6jb9VvJPD1UZGjRG/sBLggx3oEeAZkC9Bj+hHMWKodhE4PJgw9FlmFHv+JrggNBPJv6GyD6kuHsxzpT+U5XPW9xDxjo5eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KTdX4osp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vZTzMn9n; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KTdX4osp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vZTzMn9n"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474ox5I2551879;
	Thu, 7 May 2026 04:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=DyjMS6TLH5cYJ/aAsN
	n5Uozpcv1lkB6AamKM9kuGV3Q=; b=KTdX4ospmSJzDx1cvLMOFp3NHhKkQhaClU
	1MMVPMadQpOBldi03Yqvb4yEw0GGUXomVw+XcbgnG23xyhA0LoMNnzwe1hujcNbT
	qL7YTGaii4+zrCvMDM2iGsMFqQ7cYgmqp9ekJn71FDsYGeJkzyBOtxgG8+Zt1tSq
	EEHdTpQVWZiuMKV0BB9WNvZgO8K2wTJRVJU+h424A3MZyS29s/0aFBmDEKAVhRif
	QYNuEtARvSQZc5MJuov9lRrdG1Nb5jhhaDWzteghS2rRfe8nVygBq1HIt6cNkDJN
	G75o5MbO2e2UkAa94tG1Pdi6+lB6ZlIjS/6Y+kVZTlDy4xOhkTZg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020135.outbound.protection.outlook.com [52.101.56.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0xgau-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 04:21:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deLtcYiQ+kpCnDCKwnEilQpw1KqLwnQ8RHMeNe0ieARTMevWrwOp0XN+HRntTHK4SkqvrDwaXM3zt+0K8HRMchBNh3zQIH6Im9jf+T+RoOHtsnI/tFs0PBm9pJWZfawG86owfRNlwn2mBaloxZMT4fddSWR136FVUENXS7p78Fv+hLdSaZNRqAEBrH3lkiszyzbimxO8sWSvTPBgedRdWG6PkppeC5EyX/a0KpS2EdPGhmcI58uuKhhI+4I/hIAjQmNaHx5tWUr7Pld84/TEqyYwT2uwBxrUa33wCi8c2GseRRSNGa6PiBN9r4wrt6EimUuBlZJaroByYZWb9jJV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyjMS6TLH5cYJ/aAsNn5Uozpcv1lkB6AamKM9kuGV3Q=;
 b=vaW+3oXE64+pP0ogfg9hy3ACeJcNzW1pbkHmNGZy2o3E45ZKwK5x7fYbSJ55XNzes2DvMZl4fwUbLYbUC1/IMqs0R1Zc0WDBzG2nAxACtmP11/cZ1LenEM1XU+bMGOP+JqLSW77mXjxPKlETiLU2Z0AkjCFbPunHlWo1LnUL5QzSkrEjb24YedQrbjfgktVlRsEpyG1CBvBt+uL/B87Tkq2ToVOCheV66vfSaPNr6ZbMa8a4JMzrn0Wind8wIZtksVfOowKRWuPHojuvMKslDLP1hXtOoIHOoLH+b4LT7IE/VB3Es95VbhR12T3fPxwSGZ9ag9QZhJen7KQbXZO1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyjMS6TLH5cYJ/aAsNn5Uozpcv1lkB6AamKM9kuGV3Q=;
 b=vZTzMn9nbCP0Gmdzl23sLj0d+fK+dHPMCKEOzcj3SGFoRocwTBToSPI8+h2PerJPQBR1zuxXJipH5aQ0nDECaJBDkcBBc+ed9G6cVVhov6SiD8TIH+2lghHzS7+89KYcftpN8RtrwxUSCaJe0fNUGPdYri5REkZlh08TRLA+cek=
Received: from BN9P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::19)
 by SA7PR19MB997345.namprd19.prod.outlook.com (2603:10b6:806:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 09:20:55 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::ba) by BN9P223CA0014.outlook.office365.com
 (2603:10b6:408:10b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Thu,
 7 May 2026 09:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Thu, 7 May 2026 09:20:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21CCA40654F;
	Thu,  7 May 2026 09:20:54 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 09E7982024A;
	Thu,  7 May 2026 09:20:54 +0000 (UTC)
Date: Thu, 7 May 2026 10:20:52 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Tobias Bachmann <tobac@mailbox.org>
Cc: linux-sound@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
        Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther
 Lake; chip stuck across distros and kernels; worked initially; still working
 at hardware level
Message-ID: <afxZdCOyzzwocQON@opensource.cirrus.com>
References: <cLVwl4lrR76pLtv8VxMSaA@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cLVwl4lrR76pLtv8VxMSaA@mailbox.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|SA7PR19MB997345:EE_
X-MS-Office365-Filtering-Correlation-Id: 09edbd0c-8a3e-4591-774f-08deac19f115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|56012099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	cXjfqSabygYqM3SS2m27V1ZNVR0+nBbbxiZ8bctV5GziKSHho1KQ3pzPOe+6QbclYqI387c+QOA+u2ZlXQc3UvGFAlYbcvniagZgtSJiDcHW5wMI3e80A23Z0UpXkKxUcekoZexgbdaAyN2uZAA1EKJhFlSk+yqrtEyyf/iR+rU6Aa/oh++ABUblBNemFkkl0ovY7aZZeZDCZK93HiVY3EIY/YKLe50IVkOvwdgOdBWTW9p2GSUmImda3Ry7XGPS3BMHKh+/2AFeMrvzhRpU0S6YB6WXy1kuo3jbwPqzl8E/K527IJwsCmPU9V8tGHyn+dVxkz6FjC44h5E514oLVbJQEHxD4qeF0J06ZBc9YtBGXitQmRHS+zsDP0gRLLiif1dcGvwLQVsuM0Cn613/1jRiZR+0HASqLmHovWvhW42XKaEFQBoEMrEuTnD7RwbTVqbVTK6cFxNbs7G1BJ/TPB8LUX4eUl3V0ofho/W2PZmwXCl15nyy9jxQHYlm7MpVLNSLpcWtHL+8vVHSi7Hvif05QpgPtiVw9Kth+2EML7P05x7c9dBW7yQyj2wmtmSnQ1crIT2vMjixFOD0QU4cS2O8DZciBHAGQiQvXtFM8lET1/O83wGlmPpuNVayLZ5NE8amE2YoetkkA6XDv9/fGCh2eo2cmgV8595AtUqGn42f9pPx8rht10o80zMT5V8K4OmB7RYGDGQYlukt7JsvlfCRwRiyWHaM/yiWfNcEBJA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(56012099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oroKQG7xbQGfQy0fJc80zilQWmpFc8ugKQh+F7TBkf2W4YpPRU8PerWJvRUxCn/TeasFt4S1TTfdcwDZ9Y8piKHu7KbO+d3naNWdTcWPRK5atNTWyqBgyi+Jz87pDB/k9kGNtWqZ25jGX81hkyWceqHW+vCUV6EVeTg67cmcswgxRf/t7LQ9bzqzZ8Z9tjhuaM3xWzKlkucLjdulmEErbLXpRdlbcmpuZeG26xkmk5VWniw6Xpjbx95yNwqJ0hbtw2aHgp9GuMos4APSnwisNur89HEl30KRpX0TG3kIuNLTlyqmb5r09+4qlcaB+mXXDkHwRmBIt2WmmGyt7q0wss8hPjHUPMFT37/Q3w9hDUyLem0bRXfk7KrTrt2LjtSaKWZpUV6r3zLDtOvBH0mQivGPS361IG09QJfwi4R7PvvnWpgSr3ROGvn3vDW5dv0R
X-Exchange-RoutingPolicyChecked:
	V7xYHb6p7+XBMYuiQxJr3QnhV+yBqwhD4OSqDco8Z8ZSraubO5u0z/vSGcHe5V/4+QDiRK9TcnxMIJd5yz9U9XY2cO548+CgW0AxKhjCn01lw5FH3oUkD5KT8OgXIBTVapU8/jWDCTjaoSmNK6VFbxEt26FEoboqqQ9SOpALdjvmHTyIBuchJncxHCBIjLNL1lfd4q4JYYEsv8kpekv4upskr9ij1oArFH402uPKP7llcZcgimV0IxyNLG7mwdeg5nI/kwjTRYwTpLQri3Dqv8flwbJ1WdgW7GGEVarsW1b09NNDHX/CmM41/e5Ssc1o2O+OJ8q6/H1zuAPtSSeYpg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:20:54.9945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09edbd0c-8a3e-4591-774f-08deac19f115
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR19MB997345
X-Proofpoint-ORIG-GUID: XuNry1_hbezIH--blHAoLKsVKH4I8VPT
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fc597c cx=c_pps
 a=7RdxWpphQ0FXUQ9+5PcytA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=5pKoJrCQWRXhwZfos7gA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA5MiBTYWx0ZWRfX9WadWOxnO7Z+
 t4hzb2byIcwccRUQpp4VJ/f7CamEQ5F3RJ6d8lSsT+EBZK//1zfgy4+rSmALpZG9dpxPXoH7fC5
 AeAzSEllzewqpCovjxiU+DBsxADIhilvtwjsGbY4tIQYhRAZ5qIjhRxLPeC5jsp581k6P5B8t8U
 nmND858OrFG8I/7w2zalVz5iH0dlXyWUvNMUfRhWfBEvTtL2OBBLOwu5sNKpBMflbFKlHhdptBB
 IcWcBK+qhSBgZSydCLIVQpPLZvoWEd5C3WUT/Eaijv4Nt9shzGIiYOD10svIH9AevfmwsXGuCjn
 Nty4lqe+PUogcZverzwy3udkur3gN/ise1nOgNrbjRt2KRAORMAeodu87n2RZqViIOTMciU8OYt
 Sobgo1idrS+MLjxRFN/CurcwyWB2nOerz8+Yu9q0WZO0sFKi8WQlSiKpb83LJjoswf75J7DAUzp
 gxz2TDdA7w9/wUqWnnw==
X-Proofpoint-GUID: XuNry1_hbezIH--blHAoLKsVKH4I8VPT
X-Proofpoint-Spam-Reason: safe

On Wed, May 06, 2026 at 09:38:27PM +0200, Tobias Bachmann wrote:
> Hi all,
> 
> I'm hitting a persistent CS42L43 SDCA reattach timeout on a Dell XPS 14
> (Panther Lake) that I haven't been able to clear via any software means. Audio 
> worked correctly for several days after Arch Linux (with CachyOS kernel) 
> install, then stopped without any change in hardware, kernel version or audio-
> related software stack and has not recovered since across multiple kernels and 
> distributions.

Could I just double check when you say the sound is working
under Windows/Dell SupportAssist does that definitely include
the headphones?

The cs42l45 (note it is l45 here) only drives the headphones
and the cs35l57 drives the speakers. On Linux as these are all
bundled together into a soundcard, the cs42l45 failing to probe
will be affecting all audio, however on Windows I suspect each
is treated separately. So the speakers may continue to function
even if the headphones are broken.

Thanks for reporting this, apologies for the trouble. We will
have a look through the logs and see what we can come up with.

Thanks,
Charles
