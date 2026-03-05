Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491E320B22
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717733; cv=fail; b=Q7VmwX2BHZ96YFi3slBfK0g4zaEkwPpsZIl38LPiZ6iahB2DngN3G1MNfl/2WuEMOu0oWX+9Q41nuVLkDKkq/4ubW9Atr54/tF/wfj3KwDjwLwRmsqgHCGRgxrbGE8JNoyoOoBGKb9QO8dP/NIrQRqgALVH9k5GfllgpPLRXEVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717733; c=relaxed/simple;
	bh=tcfJRoKXw5PJNrGYuo1HHFMJ+APKdQhjJ8du5M20/ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xb238kQ/gg8Bq0KpKRzPQZU6pgqTL1FUcWI+Pr446FgQxSneM7HYiQBfD79ZvAC9NrNMaMV+iROjyeiwXrmxlB83q/gCe8+J+QhsWsKBxZom2kRFahRtl/SDXgRF5CYEEKP4gQy8TewHlFk1edPGOltFzejqfAL7D63neEbJoSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BkO3B9/o; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OaAKoy68; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BkO3B9/o";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OaAKoy68"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6257jBH7186420;
	Thu, 5 Mar 2026 07:35:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=K/HHmOqHRS0GktzTF1
	JPIGx1Mr6Vb4wm9XyWMG54Hls=; b=BkO3B9/oqOQWNE1hWg47o2jXX0GqtQvSYf
	Sp1085SOO84Zb5d8J/jfkY7V62EHBPBEaG11ZNrZjxEp/dhHZwtZOvXXJ8NBvF6Y
	m1pL4w44me+4re/mgtveHz+F7BPPfg97f5ehlJj6kNoF8hgXRl3k0Zk0GP4uByV9
	AEP4Izo1O1p2hbUqZ5bKOk+7oKanKuksy4l0oEAfb2hsYn/hETfn8kouan0p51Y8
	RyUG2NH2UmLNEW9oNCtCiomi0ZQltDTYW7ybiDHHZRxiJljql4TBcHA5VulcKUr1
	8FYQQoULl07t6OsQ6w22pfamoOe+eZLvGoDeUur+ZynBf/RzJW/Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020121.outbound.protection.outlook.com [52.101.85.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ckxn0654r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 07:35:05 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4bSoHnS6s7o0k9zjB74c0AGc8gMe7/eLP7UN+f/wPl8un3qS6CLPGejR7GsT6gGheLYWNQAhz0l91vyjlxcbVKeMq2XFT3W3QyfJYnKR5qBKpTVVN8Bkzu2F9NgbEv1rFd7xMH3ZEkBMPb4+6hczYQ7fNdJpMmg49N/RcuMSlWCRGidT8mduHMIdmFGgZmw83mUEw1jBjLUVDiiB8DxlCSZqXfguaK5uffP18SiW3E3e0evlpijcpm7fvVUIZ75j6FQhYCZueqc5YHsf8DX0GnRLkOtMSYrXKp9jVY3oCfpnNAbAKA4F1iwtghjdElz1ekSabPD3bT/UqE0D3UYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/HHmOqHRS0GktzTF1JPIGx1Mr6Vb4wm9XyWMG54Hls=;
 b=ktTY4hny+rLvv1XZpNs79q7SgQErzCgcDA6PuOP26oDjkfTjmem4xK+olZQuD5m+DcomUWb9Y+MEZyVQypxqL5Jt/bTjQ7Gxe1UM+EL1KKvelubG59YKnxuYr2UAailxU+pTg1SnwkIEpoA76q+suvZrknAuvS27zx/XkFJLR2c+Tr/Ol6fHJTZJ9hrLc1UCrSa91pPTDH2cc/V19zzeImeD11tO65Uti/f3TCYoCmdYqIprTQ5tiM6k5zPappM5gmjcRf+aT2nECz0vitoImlcQQ/vVjBm6h4GLtK708ZhcZ351zQJWolDqeIOYhsYUpHg2QWOqi7oGjgRKjzaofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/HHmOqHRS0GktzTF1JPIGx1Mr6Vb4wm9XyWMG54Hls=;
 b=OaAKoy686+nElcDDhWFty9xFm9W+R8oTRKRrT78g5HpwCjCZKa8Ua8kjVwFYbJZdO+sh/aXkOjX5rXT1DHZhqZmeSC/AD3XACq5Riaifle/lJrrn86fK8hvTDTicGu0MZynR2dHzd94Nrc32mbPJ1Xf0a3DTEWbxnMqBflsXZ+g=
Received: from PH0PR07CA0060.namprd07.prod.outlook.com (2603:10b6:510:e::35)
 by DS7PR19MB6302.namprd19.prod.outlook.com (2603:10b6:8:96::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Thu, 5 Mar 2026 13:35:01 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::f3) by PH0PR07CA0060.outlook.office365.com
 (2603:10b6:510:e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.17 via Frontend Transport; Thu,
 5 Mar 2026 13:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Thu, 5 Mar 2026 13:35:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9FD8D406540;
	Thu,  5 Mar 2026 13:34:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 810CD82024B;
	Thu,  5 Mar 2026 13:34:59 +0000 (UTC)
Date: Thu, 5 Mar 2026 13:34:58 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-dai: don't use dev_{set/get}_drvdata() on DAI
Message-ID: <aamGgjYd4ySf/4fW@opensource.cirrus.com>
References: <87bjh33uoz.wl-kuninori.morimoto.gx@renesas.com>
 <aamBtfjzkM7onEfp@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamBtfjzkM7onEfp@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DS7PR19MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b37a31-881b-4752-4309-08de7abc004c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|54012099003;
X-Microsoft-Antispam-Message-Info:
	DOacVz/tJZ3TZMshtiidki7eOFYtxwMRCsO920pj2WL/s1YnajUFAwtxlVU1dHQ9zfp1SE73usosbz4d9p5ScKLvqAM2v0zr5FM/A0SawHLGyNaJBYKChPW0angDBqFgz9JLicNXi1FKCgPAlpf9bkuyyF276VJDndlwWGB35GldUdUNUYVeGYG9AgW4roZymJrBDMWKq+BookAEmgpKDwBEiSAlJzYqxsrEIOEoo1buWAcAV9VfgnqiBg31HB/oeEkp36me3pWsd954F1W5TIxaRwuZgELPQEgMQLep8UD3N2bFPydkna2L5f8WqRRPy7j5OSjzZYrduFy0fPv0MfVOht4MgRq5NGMAM8aWEm2vFVYGfKGYLO/nyEzUcBle0Zx4c9NaCOpdlYNKYrspaoWTh1yEp0NbR4/5CWLMEtG9aXKGYqgI0TD3z4JbiDRPH+9fzNqhdgPI+lKWNCTMePO/O1BjcCJA8sarrh5HJm5yw4TfGr4JAebX73fBQ1ZlgYGGAlMGyMStFxeGta4imi5qKFhJhl5qSOMq7qrcOdoP6bLkuBIBdZvcevlsR7mJ6ugvS9k1wvwJwB/rsfAIbqCprMEIBf2IjyMKxYdAlsZSbG6Ueo0yPaL19YkXeyNdzR13cafFvrA2ej/AfxeMRipJu8/8cqNfWPIBNJC2sf6WfVebTizcFV9VkQaW1uGLFr2kAofOX/ZzgDEQpMvkz7GEc/dMd9/BzOqQbBmekgZpZ+bLfj5Y2LyWkNY/yaP+VXvc6rYl0UvR/LDHDjMm7Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+K9FX9xGI93+u918qyqPUYTE/Y2oYtiF5/HMngkzXQKK0Qj5XiRs5Mvg4m4MPTD571CKTmjEuwjANKj7qmemZa6ZFzs19CP2FT/H1fetVwhN9ewZebaRq+VQwsI6zZy2GpNvIdRnyjtXxeb+kpfT238lMn7ud2khH0ctznqpYZpk8WarEOZ378+8RdGKEpBCn8VzcEdCWJyJrt+Rps7N38ajnf5uK7QQIMjN16GZmFnrFmNvCaoXa0/S2vUFrLpCYBwTZYa2MpAmCp8BlVZtAkZjWChuInuKO3YgR0PZnJpPVeJKpVvrs373/oHbq6tpKrvY6bbcM/xTCeE0ysYxPEWfjOLTDEqQpLZ5gqGUIq6Ndf+e5n+hJorbGpLiysIk1E44JwZC85Mn0JO9G0c4CL0dcbOzJGwmHaFAL05ecym6kL4RG3NV4z189UZfuhUV
X-Exchange-RoutingPolicyChecked:
	kh4z9ydLwkhJMYuh5wKkRS3OTNUasONx0Onar7NEFgAH4ix3rEzzJspt1NLhaRkyHoJ8yPICmXLGbo1kXR7r2KGJQLXr3eq447qPXTjq5p1PekrvW8Y7oeNXrEmXZFN0dFyFElNfFbFNYtLcVMql4Y1uafsfJ3LeRDSZmSTHOA3yBisUFMibj1lgUl2090B6AziM59+S3i2+i/rY5pR7Z/fr4xJuZh5iAR9r9uR0/FpK5/hU/gg/0vFJFiuQ7mWDNkgzj9HYtHu2GvaqrTnao9KSvBzl9UKvPL8kaiemRhuvPQgcfHbMEeBh0dwHUwLPn8DRTce4EiKGgw1b1CCyiA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:35:00.7891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b37a31-881b-4752-4309-08de7abc004c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6302
X-Proofpoint-GUID: -lJ7RugjfYlh9pee4uT3oDFuvl8yofha
X-Authority-Analysis: v=2.4 cv=VtQuwu2n c=1 sm=1 tr=0 ts=69a98689 cx=c_pps
 a=Yi5XoY1Pvk1/bV4Hj+lk7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=HPjBYfAaUg12fq_Y9WUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwNyBTYWx0ZWRfXx13niZriZEwa
 eqjJlbfHAEJTtkT4w5/GX14LzfJBWcdi5VYHtcsiCh02Zk99Wc5XorG6jvKws9wzF94fxSlV0bI
 VgeP9o+vHBkBhKWqQ0ciFOFLaGYgHn6ds02nV+HPrpi5tunYq2C2LdhPIrNMJl/LQG5GQy0wOjG
 DJgfmzufWZFxKdhVMjIHBtEpahXPyzct2h2SKS/B2FOpKqjGJ3Vahiq6J74F85RJ2OUlaSlvI82
 WuQWsIj8pCG5f3XTm8sZWuO3h/f9+lhRaHU/CV7wLaOjr+k0yyumrUxs6aj4Zu6kCyCLMWeu1B0
 uApCTEAEWLoVpxDoI3kpUS1GJA7zmBbMDh1x67PFXgLPFWCsLErdYnIX94cF61NwP1e9pLM21pY
 RPEydBf5+NkqbvC08Am5qypVU8Jq1qmdqf+DIdScFhQ0hCBcxCXkkJCCkuKJlsSklo6+WBu3ALx
 tz/M2ssLUo8OgMF5yvg==
X-Proofpoint-ORIG-GUID: -lJ7RugjfYlh9pee4uT3oDFuvl8yofha
X-Proofpoint-Spam-Reason: safe

On Thu, Mar 05, 2026 at 01:14:30PM +0000, Charles Keepax wrote:
> On Thu, Mar 05, 2026 at 01:56:44AM +0000, Kuninori Morimoto wrote:
> > We can re-use this dai->priv for snd_soc_dai_set_drvdata() (B) instead,
> > and avoid the issue.
> 
> Hm... the patch looks pretty reasonable to me but does seem to
> cause issues on my system. I will try to find some time to
> investigate further:
> 
> Mar 05 13:06:17.645064 ck-upx-mtl kernel: i915 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x0 -> 0x2)
> Mar 05 13:06:17.647247 ck-upx-mtl kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
> Mar 05 13:06:17.647257 ck-upx-mtl kernel: #PF: supervisor read access in kernel mode
> Mar 05 13:06:17.647265 ck-upx-mtl kernel: #PF: error_code(0x0000) - not-present page
> Mar 05 13:06:17.647270 ck-upx-mtl kernel: PGD 0 P4D 0 
> Mar 05 13:06:17.647276 ck-upx-mtl kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Mar 05 13:06:17.647281 ck-upx-mtl kernel: CPU: 0 UID: 0 PID: 98 Comm: (udev-worker) Tainted: G            E 7.0.0-rc2-mykernel #1 PREEMPT(lazy) Mar 05 13:06:17.647286 ck-upx-mtl kernel: Tainted: [E]=UNSIGNED_MODULE
> Mar 05 13:06:17.647291 ck-upx-mtl kernel: Hardware name: AAEON UPX-MTL01/UPX-MTL01, BIOS UXMTAM13 02/13/2025
> Mar 05 13:06:17.647295 ck-upx-mtl kernel: RIP: 0010:intel_dmc_update_dc6_allowed_count+0x17/0xb0 [i915]
> 
> I wonder if maybe something is mixing these functions and
> expecting them to set the same thing?

Ah ok yeah looking a little further it seems an awful lot of
machine drivers use snd_soc_dai_get_drvdata but very few use
snd_soc_dai_set_drvdata, so I think a large amount of the world
is relying on these two functions accessing the same stuff.

Thanks,
Charles
