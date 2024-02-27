Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2052.outbound.protection.outlook.com [40.107.114.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E7F56B71
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709076179; cv=fail; b=WG27+cmgy/TuuREhNPW8Ng0lf1aRdL1/h2DWEvY5uIJywWrwdVL3F3GBMJuxS54sa1YPkp4Tg2+F0zTt+e2snKGYzk4D4NzGDEj/8CSausfQxEAPLbEDd5gfVO0X2IxXdBULDLm0dKdvcRB/OFwPsj9ir/yprd+DmfIgnFH/EiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709076179; c=relaxed/simple;
	bh=oUBD+EwCRfvhJRqEMTvFhU3/kvpb1A4/+e4h+h/h8es=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hO5KN2tGz0kkJhtNoKM1gYiYPjna2hU4ZwVcZO06FYcjM7MOrTxH/3avL5K1LdPp9PA9lgufVnwTBOBpUKilBKQNPhCaE+0FsX5GKMq+F+Fp7i4Sv+Fi1k2OYBqdbC8OYr8CrAU2nIFldtDRlIVNJMlE44fEFoLKjPInQSq4gSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H4DN3lZq; arc=fail smtp.client-ip=40.107.114.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H4DN3lZq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cN308fcNyz9Og/EXTezOqoCx1wg4l/F04CinkMww8wVwaWd/9Zx46ihl/tAA0QCRavdmyTaJLidbNeQOIk4sIIbrEonGRR9ExvpPknM61RIOnBAdMXNx6Tx4RMSkfw4wqAhjqLY4FPlMRN7CYjwq2Wgun035G7F8TDazP7dpKGnnBkMYPjNs29CeaHPCs9r+gvh4jx3qGyJuXS/YTIDf9K7W77pUeoufxpkyJL6sa/cIYweI5uhVb5jIcP8i62IPqyJinrOUGWX/+IGaDRNlaA/6tBcTn+FkbHKGlMLS+dBu89SJlFXAHUjs+YCPxnUD71aZA6GQVDUAPdHCm6fU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsFvT4EYiiEzSj/G7o0EiVPaYG4GBX9JJI1PqBisg74=;
 b=Und08Mmhm6xtMM4d6hnab02Bv/6WawOfIfovuijjhCe6VkW/zwQG02IxNi/CGMuKWDUoS6IuhVDMJU5OT7GB+JpRaP8k/vWsL3xVXFGtdOW+ZdNAgwcE3++6ZjRMpnn0M9AdL2UKPm2FW/doiLVi+m54cbeAnJi3AT2prrMClxYdW8OtmG3rE+PSmGL7uvnm5zDugwYrMeZ3vdkgGT28VVYjlzzEzhKrUIxHnlt7Oa+cpYe1h5bY4PEgGaSh+lMl3oVVqRRgxlNTlWkAWYVHTrbpojtXzckbXMDw0zSHtcqVAzf8A3G8GjCCeZBPYGlu9fYdNGpKIPpb7nMTpQqZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsFvT4EYiiEzSj/G7o0EiVPaYG4GBX9JJI1PqBisg74=;
 b=H4DN3lZqYHMkfEANpi34qpxAOFZvo4noCKgZycR2yKv2Rb0YsZMme/9WnrWjU81eJwvbHWHSso9fOJyWpqHnClytnwsHo+WXfFZTLsQsqBnIAOX+de80PtqHaDGXADuiUk8e27jW5HqujPTGoDlBJgHJ0zn/O6mgutD8rJcQbFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6010.jpnprd01.prod.outlook.com
 (2603:1096:402:31::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 23:22:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 23:22:53 +0000
Message-ID: <878r35qypm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Wolfram Sang
	<wsa+renesas@sang-engineering.com>,
	Takashi Iwai <tiwai@suse.com>,
	Liam
 Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav
 Kysela <perex@perex.cz>,
	<linux-sound@vger.kernel.org>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
	Charles Keepax
	<ckeepax@opensource.cirrus.com>,
	Vincenzo De Michele
	<vincenzo.michele@davinci.de>,
	Andreas Pape <Andreas.Pape4@bosch.com>,
	Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>,
	Eugeniu Rosca
	<eugeniu.rosca@bosch.com>,
	Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] ASoC: rcar: adg: correct TIMSEL setting for SSI9
In-Reply-To: <20240227120725.GA1141156@lxhi-087>
References: <20240223163502.11619-1-erosca@de.adit-jv.com>
	<874jdww2oj.wl-kuninori.morimoto.gx@renesas.com>
	<20240227120725.GA1141156@lxhi-087>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 27 Feb 2024 23:22:53 +0000
X-ClientProxiedBy: TYCP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb7d2bd-f369-440b-6077-08dc37eb05eb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0hdPCAgIfMwEdI/7TX5P7pufTgfdZF7UhmGqGB4uvjEZ/q6su9Rdf1k/+oAOsoTadxop9DJG/PFPfD3Wefi+sCkHIlsVgvpsbdLiRjJTujQaNCl1LNUTW7FY0277NrkUfVGPMWFPioerXiTp8zKLrR1GoRNJCiEqnmbo0o1V1tz4NDYwa9VTVrCyO6Rve3tgGNBRZOn7Ks5RATLdi2S+zFyOGe0LZY/xxc6UP60FVtuil9+gWrjWCodeDGslAOnuljk69tuBRHzwpGx0qSAaCEAHAYJdAyVkyMHvnV1GPudvHBLG2aUT4zhORK6xSOKRAAWS1Vme8aSook2R321th93UF+IsGXObQeaVUy73iXYyRXqUDpA0eSgfSj5saxNoTQodWOE32oxJl9Z3q3UMzcIy2jLeRU12ZN9u3kMjbHZgdLYuP3hB7W6E8uXj2U8dJfkhGpQ8rXv+Sy3tHpY3JAWVV9umr8jYKQ8llg8SL/2mcizFHvQa/gd1UFCL9Ysx8SVzezZCUyEfjwS2GgFd7nlouZb9wiHyk/JOcGV5Q9NebAVQ76mF9dZD5o6sOPHnbxFWsB3qtFun8G/CV1svLOWVCtBTCy4GL4BWPhPMxSQh6ttg3D67d2kffiGxdbm5qXG6os2hkmygaPs5bzETMYMX+HyYEpBaFQVd13yoZKjunag0zh6zv4OHvFsAV0aILRUH02+diXpr2ts8fahtLowP6NjyIxu3kzNpFU1aKmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3eh+beiZPxSsWxzdEF27JPxGVRdBGDJ6Xr5GUn+gJkhj09amD6DCoxewWjil?=
 =?us-ascii?Q?8KGM+BXDmYVw+DO+64XgcL1ALyJiQ641leGhrAdK+esA4SMB8bkoJjP6A7lS?=
 =?us-ascii?Q?Y41nkD+8gvB8tl1fZcGEUMCg2NQy1zFJp81X1+Bg1X7cYBfxD4tLPP5GqnwR?=
 =?us-ascii?Q?/K6i9JSQNuyvIXAtF5VKHLO/MOdghBAWpudmRe4Pnf2vr4n4LABcACXVV52U?=
 =?us-ascii?Q?SaXOb7QEoSuE1qP3JWJ+Tuwk5yKe7/8hYshwiFYr4D6Ge5td6iLE/cZrULP2?=
 =?us-ascii?Q?JspqpOwHdwP6s0L/8cZ4D4FZFrJXi7V66izIkFyXgUSSESEeY62pbQEKEa9L?=
 =?us-ascii?Q?SSMThymQtvRf+h8jAi5bvXxdi2YvcQB1ps7YZqCvS/xRaBZcx1pGlyRzOL9r?=
 =?us-ascii?Q?tp1vqI2j3qs13qHG3XtBbO1zuN/vLgN6kWXMg7VrwF7uCbgIYsYd7N4S2kfY?=
 =?us-ascii?Q?t+gvrKinuQcd4O9HuzIVdHP9f4ibik4g9ofUXFe+1tZWWJN4Y1bl3qizP305?=
 =?us-ascii?Q?ySw8Cj2aFi2eUcsJtXYDn0V4f+JEKB/0bcytLRIJK8NhDBU1V7CfnQA4U9M5?=
 =?us-ascii?Q?AtcTNSvct0K+KqA2bSyewT7W+U13ZJIQgItZ9/KAmZTRLrDn0KNLgFwKNaMS?=
 =?us-ascii?Q?CMstLtyNheYg7k/UYS0EDd148cJLX2xR4IjG+hP0b6auFBNBkAc2jfqQ+4ja?=
 =?us-ascii?Q?Z9BTcrphZGlrldLEvheG5fiOpGIOmucgw+7OMNpsCoqNBZgGRWHVNfm85Wpz?=
 =?us-ascii?Q?WrQX/phhCEp2d3SFl2ZLO6gc5nQ2cIHXIZuADTlhJBXhoPlS6093MaOvoYKU?=
 =?us-ascii?Q?E44qzyojUfzaA3Uaq2rnEizNLKW29qfWJPRw7jIK4yALSlzAvPAcR8AnOzna?=
 =?us-ascii?Q?DZbInJu7XYEWwADlrnlsFXXh3mJAxbKP9XKI5az3kvuSRHSjVTqRZMiWy9Pd?=
 =?us-ascii?Q?QoABwpkJCujDTacCh04gigCQMd5PHvlNFGsheWc++89mO+ExWDsPELiAyK4u?=
 =?us-ascii?Q?fhOix7D8s9KM1Z8+c8Rc+EgLXKEFDjGZDe5S23a/PibkFsFGbDWp0TjoZ/94?=
 =?us-ascii?Q?UPy++iGM5XCcl0Pj3X59/TqoMYsN7Uac+prqedYfaNLVCTauffQcfqdZSXaE?=
 =?us-ascii?Q?sIyUIgm0T5G2y2CvIjDvuYP3VXh2SMSe9QAS4PMygVdeO1iNGezkRpW/HRt4?=
 =?us-ascii?Q?TJq+XvLoZZYFPWo1k10YFv0p/XNLu5xbmhm4P+tnzF39UCa5yYzqFMuTtIg1?=
 =?us-ascii?Q?5r8d8jqMrLBlphBYPJVm5RN7shQPm+tXC+S/4SihfH8ZmYeixu2+0EKu/N6F?=
 =?us-ascii?Q?uZUJohkZ72c6SkLOjqY2phOOrt+y1IT0MoI183mh6bJI+hmhFBtSEbaRixRW?=
 =?us-ascii?Q?JW1fGhh/PyGyj6rI0is+TZGDn1fKKwM1vihbKTYK8JKG3Xv+U4RRts77Txyh?=
 =?us-ascii?Q?kwB5hOx/beYAGpWuub/yDhGTUbXUI2rj9XiEiN3PZbBDZBNXBFRZpk2LWAwC?=
 =?us-ascii?Q?qhCiHURm0AGi3BdEWPl3JJG4yIYYJuCRUSdR3/2/O0AYWNF0OIRybsrTNW+q?=
 =?us-ascii?Q?DX24YhOYjWqSv5Mna8FU61goLD0ZNadgAcMJofnybKTiNxZCcSzbztwSaIgP?=
 =?us-ascii?Q?JaQKFkDwShnoOqlbeYNS7dg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb7d2bd-f369-440b-6077-08dc37eb05eb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 23:22:53.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hboKMz0ewebbaUakH5lPxlctdna9tjNCGdb4WGFSWrJwoYYgG03Vm872Tlmw0y+W3w8O3RD51h8ROV1hArTBQ8hMkWy6vZmqRNzz6WlHZaxqBoLDJH9N5l9NNc/BUpqU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6010


Hi Eugeniu

> > +	/*
> > +	 * SSI8 is not connected to ADG.
> > +	 * Thus SSI9 is using 8
> > +	 */
> > +	if (id == 9)
> > +		ws = 8;
(snip)
> Quick/preliminary verification attempts showed that it might not be
> fully equivalent to the original patch

If it is indicating that above simple code doesn't care about
SSI8 error case, I don't think it needs to care about it.
Because SSI8 with shared pin setting is *mandatory*.


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
