Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271146D2B5;
	Tue, 18 Aug 2026 12:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056017; cv=fail; b=TT2Znufh33EAaGnvETbbse0v2uFb4bPjEcwJ20w+FgYUXQy458ZgEvJUjEHUv8iXeCCgRx80Chq8FDfAEH7py1TqASTSQScqJ0SVD5jhcOde9alJutQ/YA72ljO1d38NMQM1j5HwAdU77Z7LvHU0piwE1P53Jvutyawue5mWXmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056017; c=relaxed/simple;
	bh=/ovhZL9o2cYAfEcq85PXomKXk20r9o/Jx2b1Y5+eCLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6lm9GtjL5U7S9ytvl7pFJPt77tYaLHk3PXfyLw1XhzJ7RvGXHY1YuG9GUpZlyu/gZnbIGUIg8zuAqmAPb+KJ8fs3YkqEkWwvsBfxrIeKsSQvGoTEKcYyxbYeEMewBexHMYQFJPPuudfp4Q37bBKWggkOdr9ZX13vRgMNg0qQCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=V6kJ6NsP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YzZfokyf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="V6kJ6NsP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YzZfokyf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I4gVcZ1676310;
	Tue, 18 Aug 2026 07:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=N6ZmZiZPeW2UMQdJTl
	Wh7nvyVlIu5BbzLy3zpv3BT3g=; b=V6kJ6NsPc+dXA80E9UZMoXcOdZxB4Crxed
	Wkf0WrrAnQG/gPAztDnGsSUmrNqmsEGM7kgVCPPTGUFNJ6mzFkeO2yo19tdqU9O2
	35T+6wagm/A0LNjwzO18+ua8sy/YC1mOu7KHXF+L2HoS4FECPuVmWD7SYJbyoavp
	bjvtvfPSYvn607PTpiW8G5fxYjFnT0LMbzJJSbRr7SrzQjJZJqgRjIpjHe0knhq/
	4stBHrJKYAPA1lNR64O43dFfcBrWg5VnNOXH6qzqzwN9MwhpmI7fVuVzN47e9z17
	3kaLYaulUtNXnYVekQDaemf/Lq9FggYD2HWKje47wQ1ESQguwklA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023124.outbound.protection.outlook.com [40.93.201.124])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g2mheuyt8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 07:26:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTX0ak/O0FntC1tdvpe2BRVFacnNwXZCW2k83RuGsNxGnKOFp5t//Zjvod7F9VmMeHCngdbr/nCIM3ZO0gCFTGK/vUPUkEB4K6eEJm3Nbqei4vzWm4U4oMvad5ud8QX0faZb1rhNqqPWlWym3grDCXKQTN+oPA5aWIiGlt0IzWJCjwkNf91NKD/k118iIzy3swYuNOz2t5qRcrYZowbLUwRb4hu6Cr21rhq52dP9ssU+t/Oy79MPWieoknek+BkEx1+Nza8diRBYcFH+8vDfCl/E+2D0zBPaT6aTdJP0Z5bE0/zsy5XpCP2A8JBG7hRdtQDrlDsn3sJ1o/dIVLSVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ZmZiZPeW2UMQdJTlWh7nvyVlIu5BbzLy3zpv3BT3g=;
 b=Unn+h4GdSk+gAWBFk2ViwEERVcfd1/UrJvNIXEB9eNAnEiPfcn9UyiFGf9EfdMZnSyqLDEGGnOhSO37WTs/DZspeuCgEkQa3JHeZeg5AiInvyS67uA0JV9JryvK1++3MDk64+behntaFkQmXNm5vTQ7UlHj+whV7lSNpixQVbDNkwD3nUTCYAPVRPKjDJRf5StNTerblbsm2AiSA93gKvq6fLJbH9heMm45FVm4JCk/TcWCnezaUP425k9bSmuOYBudyvt0B33hok0KF4MTgKHne5RGT8gPdftEwm6V2PlXYrZoqxNPig75sDLmuwiEZr0ou2Ta6bZ51tR/jOWMWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6ZmZiZPeW2UMQdJTlWh7nvyVlIu5BbzLy3zpv3BT3g=;
 b=YzZfokyf5WfUmPuqR5a0MUbZYxMl75lON6LX1mPcZ0UcjaMHWXLqoeOhKu7wOmRFUleYwlebBrsRmS1C1kfaUw0ZyiHFWwomcYcoikrtLrquQDzhBfp1SFJN7wRg5R6bKmrhhmO9IqfmwPmR9lFmOz3NUTE4z51jeVo2nIKvgEA=
Received: from SA1PR02CA0016.namprd02.prod.outlook.com (2603:10b6:806:2cf::22)
 by PH7PR19MB6828.namprd19.prod.outlook.com (2603:10b6:510:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 12:26:21 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::46) by SA1PR02CA0016.outlook.office365.com
 (2603:10b6:806:2cf::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 12:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 12:26:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4F866406540;
	Tue, 18 Aug 2026 12:26:19 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3521082024B;
	Tue, 18 Aug 2026 12:26:19 +0000 (UTC)
Date: Tue, 18 Aug 2026 13:26:18 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
Message-ID: <aoRPamj24qt9xzhq@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <cedd89d4-28ec-4a86-99ab-249637d81736@kernel.org>
 <amsUlWAueA51eSDC@opensource.cirrus.com>
 <ec991e49-c23a-4c11-b0bb-32c12c427eee@kernel.org>
 <amsldHHER2lRaoqf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amsldHHER2lRaoqf@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|PH7PR19MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 626f3828-295e-4f56-8cf6-08defd23e938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|376014|82310400026|7416014|10067099003|56012099006|22082099003|16102099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	8RSWsfvQNHpF+5VSmSQeDLNlH1HrsLd7NaNhQl4jJLRES4WglZP5sNYKPTJCDyahbGxmMGQeMaagaRTEqlKWKUvPoiILV2niHUs2JkFizlGUi1Ks769ipSCLq46YeJ4dCsLwNfycDOrVyJraMPWd7Fnahb9SgZBlIKb8ZZovlYlulOQYmWtJSABhIpRUh3A5/4YItQ8K+MOS3qXzXg5neG2LVDNy1OqMIAjvnoJd4Zq/3fjH2ZWXwFkZCJfq6Jk8qG1FJImfv01R44RlLVHCV5Orner8s8yzxiV6r0wwXB7ytwefx1RNz1BOYpv91ueiIDSLvh0bHW3/96yngIUivZnZzULPX1r8yWxmV2INAbiDKHimCISDOYcMWN47oewGW6cO4bCyISwAHJ6YwRHcxtF+eHfYy5j5Fekc0E5NVtlrdvjlg1dnW9QbliJRfJTo49bhtVs7v3L2zCVDTIrvAtlMJD+4hNNsa9DG0A+ThJAo1aV5/oWtjNkIRG5TFRDnp2LV5TDT2bNQ7Cmn36CqmOBO6LCQVfWxqfrwql0nYm5GWC4ypdZ71IWZXgEuRbDGh0W/g7HqRTBbWx62MX+gJ9ZXajhZKAD/TnrDWfV1wEByQtffRyOr1s7Bl46veh2dNGzdfWVG+kX1OD+y1TgCd4UKrN7YxWCwJrwH38a310W6HNWcwQ5b9T/lsxAbV6lHh2wFBAEzsMp2ybGOf7d//Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(376014)(82310400026)(7416014)(10067099003)(56012099006)(22082099003)(16102099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HCyG68UdBwLUk/8Mvodu5GKu11UcFUFQOWqabjQiX7FMYoLCBCIUq1f7T1vceO4xnZzFAygBD1xAhVSScwVNBO+SC0VnHfubDdm44MIKavxsYK3W9jD4Cns/EktqGhHjFPp5Gb8dvzYJen7NnjyBVAYWKE+hOYv66jSmW/8sZ2pB6mW58Jsg/gDAW0fK/s3A84xTtiPpKTEH3Aa5KvEaSMUlnSzNacZeLDO7m9C13hSpvYmy03em/6R2VUmEKpeZcqoNlYxfOrOpIod9v/mhH0bW+tcgq1gM7+iFeKn8Hoorb0UXIy1KpHaH0G++0gWQo4ksW5koBXYZ4CV0lskOPME3hZUqxOaMiXRC0SZ7oTBEEq8xtbqhUiNfvK+dB1nPU0d7iKuyJHMClR2JMqA7AbuqWstbEd4KR3V6XbyQVYCDTCjC2EcVgSuxmwiEBkCL
X-Exchange-RoutingPolicyChecked:
	iyfYjwtJ2ahFDYzyphbmkxBXMyEloDjgtay6gE6cKW+1O96vD5hiwjIPDAbzbzkxHLCgNIbY1bYAHiwyjUb0DahM5CM5AHlh+vVgMga+0DcUS0J57wxrR1rPWnQlvdusWRP+f8XS1Knb/WukfsmbOJ4iOl+WTRp5cVKYdohEezvR63PGkLeOZfKSvUkGqYW4PdAanC0TL5UPAQLt5jyND1Y8Zv4VoAyLE7dLJJB9ARhU2r4GCXk54TRwa9evIHC2mgOgrf9usVt6jZJKmu6hkGouVSj+M7tEsSfpomX8iNQNV7d/AZmWS9ATaKPeB5/B3fl54UVXl1ccJ7hccnbZ7w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:26:20.8848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 626f3828-295e-4f56-8cf6-08defd23e938
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6828
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MSBTYWx0ZWRfXwcAIK/1ulyhx
 r1uI/a9UnP95D1sp2DgUR4L4xis4sPbux0WFil4Vj3BmfJwo9Zmlq0gRt0Iy/ubVMhKGrl5mAlF
 2Un13u5Xpkk4Qg60uCl8o5O/BwiACvyIlLV8gncHWiY2uMYCm6R2uc4Pz52sd7Cz4ok6uadRsFl
 rB+zLdNtXfgLfAARfyA1VgQuHwpkeX74cRNacwNisCL/T8c4cFzyQxLNNdvYp+KU8psNxfniUuC
 goEiiOAX+TxKLeFYzf6djxoR8E+6PwAk8K+2t2bMnXPigFPkycxCyRacTxNJucPzZww70+0u6/z
 1rPYsHSO+5+W1Q5VuP9Ff2lTxNeoB97aGfb7Dma84EoY3Tjty98OgG1GE1aPXyUu/IOwpYYJAyx
 G/naiSci3DsdP4FNOdKhMYSoiYlyzBm+MshiDH1yUJRKP5Q5bCjP8ZxYBWgwPDAZ/9P31TTYiop
 8qvw+Xx11elpRup4kHg==
X-Proofpoint-GUID: V_M-EcfcL7KdUyzttvkB17BL14XkSouZ
X-Proofpoint-ORIG-GUID: V_M-EcfcL7KdUyzttvkB17BL14XkSouZ
X-Authority-Analysis: v=2.4 cv=FLMrAeos c=1 sm=1 tr=0 ts=6a844f71 cx=c_pps
 a=3zFA2TB6y+4Z7TVRdmCe4w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=wXTcUcM20exgiWV_q7IA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MSBTYWx0ZWRfX5BziSWRptHel
 vmoR0aabO078vFQXeZqRVWUCWILHS5rXH3VkMBfn9rgaSSkN5cscSWQRQ3f9kcwlZzdbh5v1ILv
 THQdH0jz2ABNGstYgxv7GerB7ED1Xec=
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 30, 2026 at 11:20:36AM +0100, Charles Keepax wrote:
> On Thu, Jul 30, 2026 at 11:11:41AM +0200, Krzysztof Kozlowski wrote:
> > On 30/07/2026 11:08, Charles Keepax wrote:
> > > On Wed, Jul 29, 2026 at 01:41:57PM +0200, Krzysztof Kozlowski wrote:
> > >> On 23/07/2026 12:17, Charles Keepax wrote:
> > >>> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
> > > Do we really want to take this line? It basically forces us to
> > > do "board files" again, which is the problem DT was solving in
> > 
> > Again? We since long, long, long do board files and they are approved.
> > Although now they are called software nodes, but same stuff.
> 
> I have mostly seen those used for work arounds where the device
> firmware is wrong or missing information. I am not sure I have
> seen the sort of extensive use you are suggesting here?
> 
> > > the first place. I can't speak for Qualcomm, but at least for
> > > our devices the SDCA properties can change a fair amount
> > > between different laptops.
> > 
> > Sure, all properties which are not implied by compatible make sense for DT.
> 
> This is likely to be a very fluid set of things, at absolute
> best maybe a super set is implied by the compatible but most of
> properties can and will be tweaked per SKU.
> 
> There are also still plenty of advantages to the things that
> are implied by the compatible being in the firmware. One of the
> useful features of SDCA is that new hardware could be supported
> without needing kernel updates (admittedly we are not quite
> there yet on the Linux side but that is still the direction/goal).
> 
> > > Also there is the fact SDCA is already a thing and is gaining a
> > > fair amount of traction pushing against it does really feel like
> > > it is just making life much harder for ourselves.
> > 
> > I do not understand this comment. I am not pushing against SDCA. I am
> > giving you guideline what can go to DT. Are you saying that SDCA somehow
> > received review/approval of DT maintainers, so that we are bound by it now?
> 
> Obviously not, you guys are the maintainers and thus free to
> merge/reject whatever you want. I am just highlighting the
> reality that SDCA is now a widely adopted specification and
> trying to steer the DT implementation in a direction that bears
> no resemblence to that specification is going to be much harder
> for everyone involved, likely including DT maintainers.

Any opinions from the other DT maintainers here? The steer we
have here is we can't put SDCA properties in DT, which feels
like a pretty costly technical mistake to me.

Thanks,
Charles
