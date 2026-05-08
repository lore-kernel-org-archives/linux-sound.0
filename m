Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4740836165E
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253723; cv=fail; b=Xj6NHdb9hrR/inVX8Y1Gn/nzHXdoV3T5REfNEKmvJ8gNm/r/koWw6EH+gHmpAU3bm5TDzOgPq3wEdiSoe8wTspnaqDCJn5Tat1JJV3Jz8ql+mBUwT4tffrGKKLuq99jh4UxzLxXqLct/GFFgeRHHRPaZz/pAOqPIPGV25GRLx9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253723; c=relaxed/simple;
	bh=rwUTXef5cETuQmyNiaAUhaA3DgBOACSR4Nahg1FvXEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvEyOLtqnYbny/CkmwSHBHIWk8f0Sh+nlDPjiahI9ulqB+FlgwD7bKaVGQs4TY3au/1PIYzsf8Vz6eJLbybaHXjt5iMCqZoAJK+bE/9rsP9uUlQz9Dgl4Zyf5VtmdDYykKyojyH1MM2QdZpoBin0ciec1ugbpsu4d32RWhFhxyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Qv1/H8a7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=simcXYR2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Qv1/H8a7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="simcXYR2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64859vgD712816;
	Fri, 8 May 2026 10:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=g/fNOpzesjwkN8UbM0
	cdq9nUGyBD4KvlmXniHrSu/6E=; b=Qv1/H8a7POIy/bXCRRsvfdNkhVJGxH5UZL
	KI/hRVvPE6sdjZhQbO+PcFLYsLY0oIXbCd3eqgasnAaNvRWovHltgT5GbX9PVUHV
	YG+/rugwbqBw+D5OWBoMJJyxVhbQ47msKzrGuoSFPw1T7yuXqUHWHZ/R8KGjVIkh
	JnU3AbJnWdLkG1S1iF5dVe0kW0TjqbLwUHjDPPKzlX43Fbqz5M5lul+NKAYjfMv5
	jJ+9N0cgcgSFt7qD3qGBT1Ki9vUznqfcls5Et89Rht6ZEunqt1lbV0/ZsTIWPFEy
	mZDHShjV2JPVs6kByn+FFxjGV7OqChuUH39FsXTkMzPa9z9doWyQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020073.outbound.protection.outlook.com [52.101.193.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e0upb9w1x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 10:21:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEw1GckOLode0U6GEitKtcyqf+bHIFoNy4TOgO9EqUGZNmq1NiPHAy+yl+VCJB7QSRlyEA7GonSRFACGCiKdGLYLHr0H3YmjBecZTJSbSAQryBCHeSdgfYHiVp3U5zpBEIVyom6gzmwMEyttnQPEbe8uXCLjFYPdc6kJECVc+UMYgVLJ3vSYZhDAlvpFmcoGIC7LWvuTOgY9g42KZqznWJkT5GYdCHNOKNuQDouoYP8kSi2qvCQHP7qlXAcz26YprwAk4mHISXfT6P6nM5xAlMpJBd9sd7YXlpKEf57oG8HMVmmpiUbtI7/5vcKdGrPzd4cFEbrfmpRM9NfJIxQ3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/fNOpzesjwkN8UbM0cdq9nUGyBD4KvlmXniHrSu/6E=;
 b=eIY7uI1au1+rYQKJipq7kZE2sIEy3JwfpHA320NE7wdCkt+LQ1uUEhhoKYfNEDCgjJ4ULac0HYS2yXvhZsgpZ3uNyjW+8PqNc+Fi7FFQpf+ZT966tFc9/0MrRBHHckf6SfyLdTCiiD18wic0C+8p5v0lJHbcl8Bq4cYC1C7pJHmomvrXZoqagLv0PipX/54RgygBNPxfVGlIS9tM5A2EFTwVDeU4F6gJ6CKJilI/0PgPFK3CDIjyRXIEQHMWS6QRpImwOL7Tj4BEhJoXNXSzal9GCCGGSLm5bxQ10jC3tLI6uUrKm8i9h39Txr86T8T9B4mqhFW07FWPIe0cnwCMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/fNOpzesjwkN8UbM0cdq9nUGyBD4KvlmXniHrSu/6E=;
 b=simcXYR2ZZhybGJrNkxxXq8N/ugmp1wVx2Yuptj2vvMndD7e+ccmIZAxQQw+s5esSJOFg+QQUwfrMdqmSGyks/RAGzcedptaZ68Rp2/JKEWLenC3D51jNxGEZg5RtkHooJkG9HRs0FetwkwIHQj5UmvF8ECFu8e+bwEkpa7QDmA=
Received: from CY5P221CA0074.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::11) by
 PH7PR19MB5944.namprd19.prod.outlook.com (2603:10b6:510:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:21:47 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:930:9:cafe::40) by CY5P221CA0074.outlook.office365.com
 (2603:10b6:930:9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 15:21:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 41F1640654F;
	Fri,  8 May 2026 15:21:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2A2FA82024A;
	Fri,  8 May 2026 15:21:45 +0000 (UTC)
Date: Fri, 8 May 2026 16:21:44 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Tobias Bachmann <tobac@mailbox.org>
Cc: linux-sound@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
        Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther
 Lake; chip stuck across distros and kernels; worked initially; still working
 at hardware level
Message-ID: <af3/iDwepJuCaJNm@opensource.cirrus.com>
References: <cLVwl4lrR76pLtv8VxMSaA@mailbox.org>
 <5QsknC2RSUiRut94Zp-HMw@mailbox.org>
 <af2hpsMI1N6NDQG5@opensource.cirrus.com>
 <K3WbtGOFTfOCSdq0caVYzA@mailbox.org>
 <af3+Q1jx7z5tL+Yn@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3+Q1jx7z5tL+Yn@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|PH7PR19MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: ddab9ac9-f3b5-4001-4c71-08dead15849e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|22082099003|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	miF3y8IrPepfsytvX+Y3Jsq1lxz4EnQOZKf7tH/jnFX/Xv+muLECFodYQZ2NO7U/iWCxmhAc62yIy1gonnQmAvA5NSOPJh69F8wsAkThEVEgtQbYpzo9Y78mp9tOOWG/Iq6ulgjryPQ5+9K3BX/0zSjvdFOWBN/Rw6d3ek3scvFmkiHlfU0gtwdbbbxTMQj4Xeb62iS+Z4rzJixCjwgBiVYcs1KcciB48PngmDEO9kLU+sX03VUu/ljUgLbXUQrA/xkIuiAkX8fJh8T3MCizuAivCMu0wxLyHvUMpiypMnORiMvFwAMz2sraiDpD066k9W/oafLQMqwVK9RkajKq50XvGEKAdXwN641FSmd8i78OWiV/ddsSgYeIm1VSaxinuz5YC5se8tprAwHHX/xHmxzXWJVj5hsVo0sZxvCTEm5VdefUmJLAf5UQDZf/547wHIi8pVSGYoVwXLNpQ1DMgrXisS9Qq7eiOQ+ii6HuEt/s5E3HXSyGZfDyRSGcRrqbMzDS4u7wTngKPPm4VBoS1lLhBEh+YYJda8CwMWwmfp5YsIBs3J+fY9WivY2u4V3nTggqLRJqmcABFGI7HUzFKGgmC/LE1C9bg42kvsHTpUw92enP4s2kc9HpEYCx/wVGJ/GLXoNoup0L2OZMJcgbP1M3eKVlj/GtiNFsu3aYw1OmbvRKmTCTd/foKGmhnw5aMU/674gMKZ+YHmE5NVJRbPbso937OGI+9Aa3QdriX5M=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(22082099003)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3OQIP5pdx036fbtN40a4djioR/7X3/yQTdZyhuUtnCwslHHXOoAJrNgAH4BXD/4zHogqbJanFLOP27N/xMsn/AFT+hW0x0fBhsdZLZ+ZWB+Qi58EOuQLSL+Mu2ZCgzQFkJz+ytyg7kkdLbWIFDl59fkSioa6zVMI5O8KErxRMZUL6Pvtsmw9wc6pP4fHOTgXBwpq0MiHpPXT2zzJVHbTFG0btvdbzxJCdKBk6RRhDIR1a5OkATmGr9vLfcKc789JlZkhpibGqCJdA/lOKj2RTxBRThs7H1mDwS1Dgh1RDynQrx/d7KbhqzXzh8kBh3MZbjUhrznvyf2js1TeMHGSo4s0ngHbDsqDbsCGZSeZe2/eubKAtVDZBBmV8dWCl+D/Jotrnr1Ae4o7EGda4k8mh6OSJs7r2mkQmjrxjq1XmL4WP6punjPLkDvNSCXCpjpK
X-Exchange-RoutingPolicyChecked:
	G2rGpdgzTR9DFnSfgQj0v+Co+2hpipReKAk/SW45Jmbx5gytYDi9yAWkxiIZQ9b0QHIreFZAjCloFKd0M+zonRuRx31MzmRoqtFwpMqmVB7O2DYD7RqlmF0d41liCwoqhY1yrsRLPeqho587vp8hOoxNe9jHvgKEtgFyQjMwcaqebNin1VhMRX2IjO6O/kaxXRfD6toADGcKPFrpgJAWRmDWYgs7hqnal+nxPOpXr5yd0tvWMnY7PhRz67iQ2Ruzk1jmqbNj9UjC0O9dLPJ14xk8Jip8NEVbJRU1wxdPLdWE6iZGj11FfPc0gkGN/7a+WqqzQA37urPFKt1xeElFvw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:21:46.1713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddab9ac9-f3b5-4001-4c71-08dead15849e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5944
X-Authority-Analysis: v=2.4 cv=L9otheT8 c=1 sm=1 tr=0 ts=69fdff8f cx=c_pps
 a=hYl96Wf80w8BVcyCAtmm4A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=6Z0O-HJc-qDCf0Tr0CUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MyBTYWx0ZWRfX+Tjy7TQyxsu5
 9tvdGrbZhwwjH/7SohFRnLn3wt1yNmc69FeCOsEq9OyLlJ4MMWM54kUSrzBRpBNNlTWCI2y/cvg
 0JEluNafX9IvF7RXc0iP/mK1r2K2Rgm6v4a0cwapvcnG/xi75aanqvge8RYHwMT/RHM2PjJ2KvT
 LYJ3g8FmVET7RcR8KHcuVNdkSAuuDyDbtZ4AlBvy5oyMMuuwLi2PcrQXcaJ0V4TRRtxrl7rUFO5
 FzQeZnRldY0cjwW7YpaGJzlGnZt1NBzVLxXSLFAVdrgwr2/UswealV6w9gj+DB04nuOkJ5fYdXe
 ljg2eEjBKb7kQ2lWX/dPYaHIF0gvhtg+nGJQBbOOOhMqYlXx8dYaSsLThsg6WIabgkwj9z+Bwmu
 bkgUorTzLnSV7vqMIKhi5gS32C5st1VfawTcagX47XmTATLjbk6D8en7DNfGi6bFX//zfCtQTGC
 dSaPHbHOcXOrTyHICEA==
X-Proofpoint-GUID: 7VONrjQCDQG6wu46VL-pp-y4_vi6_JCO
X-Proofpoint-ORIG-GUID: 7VONrjQCDQG6wu46VL-pp-y4_vi6_JCO
X-Proofpoint-Spam-Reason: safe

On Fri, May 08, 2026 at 04:16:19PM +0100, Charles Keepax wrote:
> On Fri, May 08, 2026 at 04:56:03PM +0200, Tobias Bachmann wrote:
> > On Fri, May 08, 2026 at 10:41:10AM CEST, Charles Keepax wrote:
> > > On Thu, May 07, 2026 at 08:53:27PM +0200, Tobias Bachmann wrote:
> > > > On Thur, May 07, 2026, 05:35:37PM CEST, Charles Keepax wrote:
> > Tested the SSDT approach, but got the same SDCA reattach timeout 
> > as before.
> > 
> > Verified the SSDT is present and correctly loaded:
> > - dmesg shows: ACPI: Table Upgrade: install [SSDT- TOBAC- DISCS42]
> > - acpidump captured it as ssdt16.dat (107 bytes)
> > - iasl -d shows the live table contents are exactly the
> >   intended _STA = Zero method on \_SB.PC00.HDAS.IDA.SNDW.SWD6
> > 
> > From what I can gather, the audio path doesn't appear to gate on _STA 
> > for this device:
> > - soundwire sdw-master-0-0 still reports SDW Slave Addr
> >   3001fa424501
> > - ACPI still announces the SDCA functions: device:29 SmartMic,
> >   device:2a UAJ, device:2b HID
> > - sdca_class still binds and reaches "probe complete"
> > - sdca_class sdw:0:0:01fa:4245:01: timed out waiting for
> >   device re-attach (5s after probe complete)
> > - No soundcard created
> 
> Hmm... yeah I think maybe your kernel is missing:
> 
> de67b4ea168f ("soundwire: slave: Don't register devices that are disabled in ACPI")
> 
> I think that was only moved into Linus's tree after v7.0. If
> possible you could pull that in and retest.

Although I am little worried more might be required looking
more closely. But let me know if you can test how it gets on
otherwise I will add it to my list to poke. I think last time I
tested that it was for a device that didn't also have a bunch of
SDCA stuff and some of that runs through a different path so
little nervous that might need a gate too.

Thanks,
Charles
