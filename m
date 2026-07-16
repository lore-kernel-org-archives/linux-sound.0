Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B162475F7;
	Thu, 16 Jul 2026 16:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219184; cv=fail; b=ZhjFKQewtOa9Bd1ojQMsbkSzeyG55TW4ev7D4WEtrwiL/0GY7ypWkssPPw29c4lrLPvfnutVLYpoWTJpspV+NgwPjEPpgO+YbmxwYf9VUZYSoUv1Jfw1TMXo6bBWReAeib+o20aoR3Q4yIJc8noro5/In/A5s5wvmDfFAY26jzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219184; c=relaxed/simple;
	bh=bcFVZ8eOHc4GQmgt4jtVZ51NiXvi6AuuJWeiQ/f04R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwvStW6yQWspHOZ1m/GuDNwHJUNhY7G/IoXqpELCaclVtE79Vt7tFXg/PVpYffk9rJ82myX7vK8PumAkMme/4BQ2DqVOAKBIBcPKaswdpS64JQeZXjfz5C2P6t4+qL2zVFsaso1wqXnabe7Kz2tcxA7HMigrXyhe0tDHlJ9SiIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C2XicDhO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rnBsaZgB; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="C2XicDhO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rnBsaZgB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GFL4Zk1205265;
	Thu, 16 Jul 2026 11:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=KUE3nTUGWrngPHVhIA
	grXpES/Rnl0MWHINxPevZ+zTQ=; b=C2XicDhOx6/4y+Sw/bP541fpUEA28Utram
	evlwNyGSIjVUE7IHwPa5N9U5qvZ0Swv4VT+8+ScX7lYs6Q/anqapjMoJnd7zs4vy
	RzwxHY0Oqa+fqKXkGzha5HfFFN9sadoQV2+hkLvL7mE1/i4lGaFeB6k4eD6m5IXd
	VF9HQ1YPD9KgBTuE+gavBD4BM7IU9BMXyxTTA3YFDy8wJ2KzvDN40wZXZObuK61/
	uSysV2HUrIUzeTKI3ZcYwUDUe8uTCuH0U+M6daEdUt2al1CB4he/1OL7bjNRr/ju
	G16agWeZaff14l59EUJr98Fb+spC2UdV0/7thhdiAy9NoAWfyJoA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023118.outbound.protection.outlook.com [40.93.201.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fqfnj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 11:26:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m21z89+yu3k9VonMMSwh7y97z6aV43gvx+ZpumVRzmiqMhMBG8hTphzxXC89XSJ1lIVE8s/rUxmRmuDxvSxtGf9xT/DyHY2Z1qmnRZ12hWD29mm+gszk1wNJyW6JSBU8YiaMgoILi6QJ5byKRlFnvxWyfYmuJ7X5uKyxewZ/z2nLaSKHglRP4uAIrXq0rG581eSIW7a8PA9+iPTf3EtFTHayQ5vVZ3s4codEtHvrCiLej0+uy0VnGtErmYSJcuoaLEXTDgdxoLUUtv0zbqnaSMFDm1AuqNlgFPc/r+A6B6N+64DLTKEnuKfD4XX2Nsg0PDS5Phaa5yFiGc1EWFS4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUE3nTUGWrngPHVhIAgrXpES/Rnl0MWHINxPevZ+zTQ=;
 b=AaH4UQJ1iESQ7DOurNs2bBk4IJbdkrXPT9xX4uqW0Mzmc5nU3/xYCirueHrsI3lRk7XhGo00MRlZ9Gt9ZjgBXqnWTS7Sjq1QVdA1inl8m2EmBibx3auFA+3JTQieOc8jlQfkr/KtevYxQukkrusywm8K70f5W1eDDVvswJ+cdzeKpZKLPxsoBfl7oH9CSRTDVM5opjUOswmsxMfHEe2ntgz7iyO7zOIbYVk5bmQcF4GahJZ/BtWzSrHKAErykU+GSOfviNZJXifhrysOyfArXKxSolGcUXrLlGnu+tNiWMvdzVdPEQCCLMzGW8DxK1x62Thr2kerZxnkQ24AcrmH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUE3nTUGWrngPHVhIAgrXpES/Rnl0MWHINxPevZ+zTQ=;
 b=rnBsaZgBKwYuQszHPs6rPY7tkKnxAWq0aZh/1jN53b64YEjAHPiuNweJwOsxOTnyJcUR+kToA5LOuDV60kgsijhzBX2MOHTeLuXSgH9c4TSJhJYDX0sH+cmyDkNslyVVUoElPYG+UALfDQs5xhUgHBDZau2OAP4xVJwfn/XRPQ0=
Received: from SA9PR11CA0001.namprd11.prod.outlook.com (2603:10b6:806:6e::6)
 by PH7PR19MB6807.namprd19.prod.outlook.com (2603:10b6:510:1b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 16:26:11 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::a3) by SA9PR11CA0001.outlook.office365.com
 (2603:10b6:806:6e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 16:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 16:26:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9F7FC406542;
	Thu, 16 Jul 2026 16:26:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 88CD7820244;
	Thu, 16 Jul 2026 16:26:06 +0000 (UTC)
Date: Thu, 16 Jul 2026 17:26:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] mfd: cs42l43: Add support for new cs42l44 variant
Message-ID: <alkGHcNtQEhwyhLE@opensource.cirrus.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
 <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>
 <20260716151437.GA1409595@google.com>
 <alj9FS+pm5gm8Fp3@opensource.cirrus.com>
 <20260716160814.GE1424265@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716160814.GE1424265@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|PH7PR19MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 6963ea49-eb7d-418b-b373-08dee356f0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|61400799027|36860700016|82310400026|4143699003|56012099006|11063799006|10067099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SRE+D9JvfnhuwXpgtYnK8LrrF3dDkMdJovYt9WC6AtuMVxUf09nyX/9VqzDn+AZFdFzKt3G6e3t9UO5PniabEaQqLnWwJU1fsfSs5OvnGZNVtzIoS6FW67vkz3+cbFl3rY/EQVLIcxKBwdMUcEiHlTzpnktT626LbqbdtP/TLrNxO1QdEqmW0LcXTEWBdD0uO06qJMzUtxKdPWJWM4+uFvT3GGraLswv2Ml5xqgDgGVKSmYeG6kjJkE6HlVVDTdElc+Hmy8iDCqD1JtrAzrVzVRO9SGxiJ+fJsi9qm5fMqxQH7bZTGQl86UvinWSMC410G50fcKXN2o8jjHf7pp2DGrjrnovxa+fp7SldMJ1oV8QNxTIhpguEmPCenR862vAvUXebU8b4dHX8B2OriKe3EEMHIUuEdOO+LkWltP7XZq2aG7fApVKA0phpDFJOJGSg/9dmr1+0E94KbKScXHXIyo6M2xBErQrqiNzeArdeWxEsMxscm4NzLVBk6SZZe0SBJrF2r6TrtarORFru8h1x5AWkKGqcvPlUvUV1LthV2Oe0pr0KnL/c1TnwkI7vNh8cbpNjWGEMRt2r8cFQG/YUxKM9Hs6dRvzKl/rZvnDh+qkK2bXo4qO1o/cFQvZUt6q+vssVlYHL3BIRVCaIzMRRNb9fkkU/YIMCY8sTX+HT3hHjnEr0nq1XkQEfng5FmQkmuJUhbDIhqGZL6rgs6GqRQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(61400799027)(36860700016)(82310400026)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zoP3MddXney8qzwjUzk+2QwCkLkLYyUGEww44HGRhI0OcEgXF8QEyxGApOoEd7lHHOjvsCF7SstOZPoIAspGe4QgwsBrHScoFxOXB7tiz6xi+0YQgWcphTt+lXWL9eye+WZZsAnijHruGIm+aEz+QoRuXFwSYaSHsa8mDQ05y57qv927wGEltbVj9ekhGJwxkqj6cNqrOK3IqPmezdtjcD+NPOvM677Rdh9Xo7sJAyPQLQQNXpbJocObpmBi40tV14QlmxSkuFYdQxg9fSQ5QR2W5qzHKLe1M3PMxrg8iUq2Dxk2Z6zAEj05wA/aeqKZ6CT7E/jIAz8BJi3xXdS47jUjmdTS2zJwDm4Z0docV4PkBATW2SMyLv9ta1JvTrigvDeL0gqFuPAqTSVPdMUxlzh11EcjTkoSVVtlB5sUKHaVOzBjcVTGU2V9+X0Ck2gF
X-Exchange-RoutingPolicyChecked:
	fmJx4Q8j2ilPgW+J+C268dcjgDLb14+09ChaNEV007Hqiwku+l+i9AKNqr1vMDEOQCvaEPopi3S2B4t0w3mZm+p6RM4bBeoqkgmD5whUivZNhbOx29r9JC+AVsf1HJOkOf1w7QQgTnOkQZSl18QOcZykanysvgaDFwDlFhqsqtr7ySNhpZP2UXk8YWwXgBTzd4UEndEXCOdiMw4YStylZw2jaBWnglbWSH6fyIEjpzC2++hGWA8/wMbmrX59t7XushoFcwr0jTTx9XMyAhXxok6tnuMdlSwiAr4tw6Tn/AdBK8eXivNmMQzb9P8jy4gF+atLqxuH2r0yBiMDm3Rk8Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 16:26:07.9005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6963ea49-eb7d-418b-b373-08dee356f0eb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6807
X-Proofpoint-GUID: vCAvyrekN6-7-PiYCQSFSYRs-Mob2YWy
X-Proofpoint-ORIG-GUID: vCAvyrekN6-7-PiYCQSFSYRs-Mob2YWy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OCBTYWx0ZWRfX28z9RxBdkVKB
 chd9o2flz39KGnIJkP2onac0gK0+xM2yv9cM2On11j2X1MrWABr46I9w100sL9I2MfF84jCmhT1
 CWsTsj1/Rj7CxIh4sjhxJ1OQvDi87/8=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a59062b cx=c_pps
 a=enaMJMrmEdl6qgF6GvhhHQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=X6FTBQYU9TqjAR6BWYgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OCBTYWx0ZWRfX2M528CiCYSBU
 8UYfoKhibFcCpFzi+YbIyZHMG2ZbGTk/5djGcNsgfXXAsIU+ynO0wMkUCYbz98BwvybWWchCi3h
 zJ4m1zp182LlMku4XpnkLt1StK6I25KgX083WIFq2VYtPBB+2VAk4yY/ZpAOd/MnhpAD+dKjZ8E
 aFXe/1bVaYFvBKo1f8M6WlryewwbK4gX6pbcCeYdP5ZUHcTyvBiSInP7vSl8i/yomjhY+QMQzsK
 IQzM0Ss4X30NvnPJ3iyDIiZmjsaDB8vLNSQka8NSCVrSymrumE3Wso8uvOph81+Su7Hm2SkjDxT
 sgV3nrrnDrmzMs3Sk/zTns1Ot/RNNQOnA+e1fuMtXuinN5OrSmxhvqQTflVWeIe4DC4+w5t3FTb
 sGFz0sWyzCLDFGJ8jpNVJzp2upkEMd+CjVgM3AOVG/M/ICZCZJGzo6rm3IbPwUYlus93o6hH5+Z
 dwU4LPH+bwCywvW28Hw==
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 16, 2026 at 05:08:14PM +0100, Lee Jones wrote:
> On Thu, 16 Jul 2026, Charles Keepax wrote:
> 
> > On Thu, Jul 16, 2026 at 04:14:37PM +0100, Lee Jones wrote:
> > > On Wed, 08 Jul 2026, Charles Keepax wrote:
> > > > The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
> > > > for this new device.
> > > > 
> > > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > > ---
> > > > +	case CS42L44_DEVID_VAL:
> > > > +		valid_id = (cs42l43->variant_id == CS42L43B_DEVID_VAL);
> > > >  		break;
> > > >  	default:
> > > >  		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
> > > >  		goto err;
> > > >  	}
> > > >  
> > > > +	if (!valid_id) {
> > > 
> > > How is this nor handled in the default branch?
> > 
> > The default case ends in goto err; so this doesn't run in that
> > case.
> 
> So are there 'case's that do not populate valid_id?

No, all the cases populate valid_id.

The switch is basically checking if the chip ID matches the ID
that was given in ACPI/DT, so I would also expect this to
always be the case.

Thanks,
Charles
