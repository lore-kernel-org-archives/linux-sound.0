Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1948326958
	for <linux-sound@vger.kernel.org>; Tue,  6 Jan 2026 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767704378; cv=fail; b=YV89Q8P5cxhOih/9/jLir3QkIzHK4tQgpH0qP9ucNxdX03SPERkXJCHR6R7NBlCCqMVxVPWPeF0KAkznGZmHT8iAOiFoo1WXX0DFDNIKdJ3OnnaJhj5UPyvIsZyTR8ALQRg5wh6cW0ltxOyOKOFnRWgUVLdeTGdnbrsHl7y9KFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767704378; c=relaxed/simple;
	bh=8vGFZAQ7GxEjt3E71tZKl1ZUph47zLUKbIz2+cpO1EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwxnK1hCJ5HP6BgsydCYj3ebfzt0Vo3um3zG+IBu3c2FKzGwjbPjOHfLz6bCYjVH4gsdCEeouLzeVMfLeVoAWWPsou3zUq+lK97RBGpxPHTTTrhRyRzhOLFNS+J0P7uIWn2l0s2KhHNGu2Lc6lyDYSBxmVdw89ngh1ehqkhC3Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K9qq+hUX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cm0wyjho; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K9qq+hUX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cm0wyjho"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066H6LJ761065;
	Tue, 6 Jan 2026 06:59:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=HzZJPtxKlZAtVsl0ml
	u8EtLuOmotbLmTi6yl3I226M8=; b=K9qq+hUXJHzpsvY9IMlRiZO6K0sACwLZsf
	4AbO50mpduhJWBbSKFA+WH6mZb7O/ARfsxPrRhFu+L856ryZJyQcRwzcu8PRHDDU
	VQo0D/oGAh+ZR7xvmKoOx+VvVLwMTpgRoAzi5W/FrcRJACZKSxvqJyVBNWk4F4j3
	rxuUogENcwX33EyeRikKHGVcJ92A3Oq2W2c6bee/DtYyF7w6Zu9AwDJaiJRatko5
	lOLxnDVLtRUYfe5DlbeV1seof60Tp1n6q83sWfWt/WH5Rvixh3mZaqtO+oMYV7yH
	Oth23diTxCbbX4wAP2+3AyP5llsVGLoM4jic9T5HJtKOLxVz2rQA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021072.outbound.protection.outlook.com [52.101.52.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d32xd3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 06:59:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGWY1LfYLBa3qp8kIFXGd9NTgosuzlQVmCZhfiMmZczNlOBl0K1k2g3tcFC/khHwIe7bwJVn4Pr3DMmsfWH1D/ynCMGE75fczDwm/dT9Ksa1VI9z43N2AVzRC/OkN3xpxNi/KoIx5GSnsA4ydUQ20VQsL3FmEasxAZwp5/KS9+m6fbBqM3XPiBClUs0/grlaeZR+0hBCgMzpwX9+4sPnrSRqA2T2ndcOeMJe0y2Cc5XxouAl8jcXdtxAVqgRMyPAUICkVP9PcYY8wjJHe+UyteBWCMP8dZ5Gieu3R+YHhyNbDpnFdGmGXEwtW/qM71DokhABbLDb1zZgfehKgqDmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzZJPtxKlZAtVsl0mlu8EtLuOmotbLmTi6yl3I226M8=;
 b=gAzesfsCY2/TpTk3PtVAN9FkJjaMahaDiOZU6R1i7IcKPytzNBuhLDyZr2ZJDfZWYo3tjwikA4pm0hn7lAoCvs3kOwM5bgBR80LRwnOcl5OG9A0Ipe3kDyNvJk+f+2XKsoc0WI/F0j77xDxIOSNt73xG/uqVNc7wuLUxXsjU32DVVx6dl+HkUmrvKWi1obhLnvm7vIH2DKud2ukhRkroZDzP1WBqT/yD55KigL4+xIjaefSKtBJf0qlS70ayE8W2Cs6F6XHNdvf2paOtFSKYWAUebtO9WRFQDdv8AXakqmJ0dis9b82K7vLk6+gr71CSEtPzqa4UUnvx5qsPdl24JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzZJPtxKlZAtVsl0mlu8EtLuOmotbLmTi6yl3I226M8=;
 b=cm0wyjho13quCVkbMfqjuHDvYiyND/fcnjbD+jGtinkqXDX4c07/gmmCpk7M9K0p2+SjM7ebyRTDca17E26P0ltsNGp8fI4Th4ZLF9hPmIhCQ1YZA/h9snmLRRw5NUywgn9OgQYmTehTK4l5eKupGZEKL3QATZlaRDQKLJlv+ww=
Received: from PH7P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::13)
 by LV3PR19MB8181.namprd19.prod.outlook.com (2603:10b6:408:1a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 12:59:02 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::28) by PH7P223CA0013.outlook.office365.com
 (2603:10b6:510:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 12:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 12:59:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 25BF3406541;
	Tue,  6 Jan 2026 12:59:00 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 09795820249;
	Tue,  6 Jan 2026 12:59:00 +0000 (UTC)
Date: Tue, 6 Jan 2026 12:58:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
        vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
Message-ID: <aV0HDh57C2gdtYc5@opensource.cirrus.com>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
 <aQo0d3UWKinyzTYT@opensource.cirrus.com>
 <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
 <aTlDoVxI0gJMQOuw@opensource.cirrus.com>
 <0c9837fd-5ca8-464a-b365-a2e2bed3d9e4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c9837fd-5ca8-464a-b365-a2e2bed3d9e4@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|LV3PR19MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 962202b4-54b1-4727-bddd-08de4d235d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XPV+N/H3ar5OsGVIQ7oVNlrdp8q2Trko7JvUX9OIIQH7HFyHz+R2mwNlSIa8?=
 =?us-ascii?Q?8np6XgTcEmUY/UURKT7RFBqvpfWdkROCyTCH3ownv6UY0J/0cd66QmXkkRh3?=
 =?us-ascii?Q?+dlgTDdqrU6XmElpJAazIKLUE0bra303oKDPnzH5Hbz+JGfo1cFfDToZa1J2?=
 =?us-ascii?Q?sANNnE32CWoZKRjykDubWYvMvtYaxkeYD4JgB2rEnW4cPirxCAsgPZyn0q+n?=
 =?us-ascii?Q?6LEvQzrORd/NqiCZZfYODXrf3YbxtWyKuGTmnteB0sh+WcxjY/70HlJQCG2Z?=
 =?us-ascii?Q?ayRxHgImJ18OY068MKWLEizGWjqQSzoXomxiIWCkg2y2gJPpxFsm/YpKxDo+?=
 =?us-ascii?Q?ul3CqPehnH3lBt8rb+PsdnziHmObWEonCbLd4NCvZLWJyDLip3A/HTQ2jgBr?=
 =?us-ascii?Q?ZceHWoWfIqObYAeVtAqsboZwhCRUkofH87IPWdGpB9Mprn7QrWtaRhbjZyvP?=
 =?us-ascii?Q?xDyaaFs0JMPqX8ivJeKxwSVENQjOkzrGpUFUry4/J09+JsLC4qwsFsdraj1k?=
 =?us-ascii?Q?Fks7IkRcWlsLf3y75NIvWWRm+5cVlLcPtv/8e0iVTsbStGpSc+A+mOqbxfPQ?=
 =?us-ascii?Q?KtlnB1QBjSCvNL7PewkofcDnocXL8aWGmsQ+7gK1bUYVSjIyVuh6hTDMMTVr?=
 =?us-ascii?Q?V5fsg6P8aEX1Mk8I8KgvQzUsD9VV7qsoyjDAZ0z+K/EgP3Kpp1l3GmlYS1A0?=
 =?us-ascii?Q?dBR4CTwhdGrVYdSWeWvLxskyFONyXtd544JDUnzkqO97ep3XiUb6bx+HWEvk?=
 =?us-ascii?Q?Rdece77cG4xUmpKGMzn2fyrCVFeAPAuJPr9KA/MSitd774atOH0RvhPAn/zX?=
 =?us-ascii?Q?XPDOf3cCLAxeiZ6tR0ag9UnZgHGAVCOeR6Zh7r+KkSQ1l4fm5Lix8DBItbav?=
 =?us-ascii?Q?e0IrDD3simoU0vquy7r+snPVgGS6O0ebvtWJ55ZplwuNofKEoXcbZSLORvjW?=
 =?us-ascii?Q?lIMd0vD/98fh5yOEZw9i3NI4yofDCgZ4vWoMFBbry+UMmK5A/BJ0hwZimFQn?=
 =?us-ascii?Q?KVi/VZAOfneYnJl4iIhdR/ptD/hJBFKT9uC0DSY/m7OlGOCzWAt/QnxpNr6a?=
 =?us-ascii?Q?AAdFktFkDQPjCeXbTzfEoq3OscbwJUASmr7FryVPThu25STY9ziRcV+kKFxI?=
 =?us-ascii?Q?s1ZTHh6fQsKZvV48gTsIToyIQjxDnfM4CCBJYWs5GdzKUZTEW2lpvt6yKedE?=
 =?us-ascii?Q?zXtMB3H7iGKc4pejA4KqhrkEIBuU86fl/MtQ3p2H1DY0b8KcAU57kRg0KcFd?=
 =?us-ascii?Q?2ks0LsBWayHvxaXCdIDcpoOnkBShGcIZqYan05cr5K3z55pdWbd2FbVKhkV1?=
 =?us-ascii?Q?2brI2LnzjDNo7l50jSzEF247Q1l+qekFkF4Ondjbw6FwXR1RE/NhVBYkm4fY?=
 =?us-ascii?Q?xmtL7uBhTmUWWfQ59oJeGZ2QXnA3Avj50Pk2rZTXPlvuXlNz6yICfBpTRMQd?=
 =?us-ascii?Q?OGoFhLw8QMbfgV6jzf4SCWE3sFY2Npr82l9ffgh+lFVGl7c7TcGk2MyAOrMl?=
 =?us-ascii?Q?7k9q5Ae56vlT3QMQPMWtiPjJvhGaKRoSs04NH5Dro7NgPGIGh2W2ThNaLbTU?=
 =?us-ascii?Q?zY/kF5GtWtLS/ZOklm8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 12:59:01.4745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 962202b4-54b1-4727-bddd-08de4d235d4c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8181
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=695d071c cx=c_pps
 a=m2/28Svseh3Q/SQ6sWV1ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FqiJB2s9YfpdGYwuV00A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 9b3gI2hXGtdjIlSN5nM83t1y4vVzi495
X-Proofpoint-ORIG-GUID: 9b3gI2hXGtdjIlSN5nM83t1y4vVzi495
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExMyBTYWx0ZWRfX7lc/94MPBrc6
 qcS+J7IetSHjVseVvcIkG1GyVu0cC7hmrz2gTq38xDCkrWM2h+MOrrrdzxl1LB3FXbE59VqMEsO
 1IUoRTjNP0cdGZC4rAfJKcW4GMWGXXq4iuXK7IfvOc1GNT9b5oGFp6L2JN87dRjko8NPfJpNMWS
 YFoHda3n2LQcrfR/E39TEX6I8gs4WHnSqukfw9pw1i+0W6CCxiHKhWgngtAyubTkjuSl7at/Vix
 Hwv45yvMDFbWO3oNYL/BABxFej+jQNTpf2XlFc+5ruGjmx3KkHwjDRNEnKyGzm/SJN1trA89QB1
 O3F/UJ6dxSuVX+88c5CviiwGRzEBVUddhhH2ONNYBcAqX7l+nS/Oze7qc4gJmOj/bD8evlTAy8T
 gHerQQjDlx7Q1XmP7w144FGWianJOWcrwKzpJ57R681EmqqIJ6/v3KGWyapsxJZQKA2+BrrPUg3
 MXQz3oxKqD9FuBUuMzQ==
X-Proofpoint-Spam-Reason: safe

On Sat, Dec 20, 2025 at 12:04:47PM +0100, Pierre-Louis Bossart wrote:
> On 12/10/25 10:55, Charles Keepax wrote:
> > On Tue, Dec 09, 2025 at 12:47:06PM +0000, Pierre-Louis Bossart wrote:
> > Additionally, there arn't that many SDCA vendor drivers at the
> > moment, a handful of Realtek ones and a TI one. If we wanted
> > to standardise I would suggest standardising on the better
> > solution, which to my mind is clearly this approach.
> 
> I am not against having a single mechanism, and that change
> would be relatively minimal.
> 
> The only issue I have with it is whether one would deregister
> the child device on a soft reset or whenever the device
> loses sync? It'd be somewhat ugly to do so, but then again
> we have the issue that for the second enumeration we already
> have a probed child driver, which would bring us back to an
> async model really. The 'beauty' of the current model is
> that the probe does nothing really, everything happens at
> enumeration/sync loss. If we dynamically add/remove child
> devices it'll be 'fun' really quickly.

Yeah that is one of the questions I have pondered a few times.
Were I usually get to is separating out expected cases of
something dropping off the bus and unexpected cases. For say
suspend/resume it is quite likely the device will drop off the
bus and that is expected and probably shouldn't result in the
child drivers being removed, as it will as you say become 'fun'
very quickly. However, an unexpected drop off the bus during
normal operation is really a pretty fatal error. In many ways the
best thing to do is probably to remove the child drivers in this
case, since that will tear down the sound card, and allow
everything to be rebuilt. But these are far from fully formed
ideas, for the most part at the moment we just report things went
bad.

> >> Note that things will be interesting when we use the new
> >> ACPI aggregation information to create the card, we're missing
> >> a means to re-trigger deferred probe checks as devices become
> >> functional. I had a patch on this a couple of years ago, look
> >> for "driver core: export driver_deferred_probe_trigger()",
> >> we probably need to revisit the entire scheme...
> > 
> > Apologies if I am misunderstanding but is this not another example
> > of the advantages of probing when the device enumerates? If I
> > understand correctly the problem those patches are solving is
> > resources that become available outside of a probe break deferred
> > probe. By tying the probe of the auxiliaries to the enumeration
> > of the device, we ensure that link between probe and resource
> > availability. I think the point Greg is making in that thread
> > is that the kernel expects resources are available once probed,
> > so if one is going to break that assumption it should really
> > be handled exclusively in the driver that does that. But the
> > simplest solution to my mind is just to not break that assumption
> > then everything works as expected.
> 
> That's precisely the problem, the model assumes something
> that is broken left and right in practice.
> Exhibit A is the PCI/HDaudio parts where we rely on an async
> probe due to the module handling.

I think I am perhaps not totally familiar with the issues on the
PCI/HDaudio side. What is the primary issue here?

> You also have devices that require firmware download to be
> functional, or some sort of internal ramp-up needed.

Yeah these can be fairly annoying. But both of these can be
tackled with either handling the situation in probe, or if that
makes boot too slow, moving to a similar child driver approach.

> Assuming a perfect behavior where all resources are available
> at probe time is naive IMHO. In the specific case of the
> machine driver probed with ACPI information that isn't tied
> to the bus status, it's a guaranteed fail.

Well I do love a good bit of being naive until it bites me :-)
Ultimately the machine driver has to call snd_soc_register_card
which can probe defer if the card components aren't ready. What
parts cause the issue here?

Thanks,
Charles
