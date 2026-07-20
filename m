Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E63CEBAA;
	Mon, 20 Jul 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535882; cv=fail; b=gPYFTqJgR5bEw8ONYtUVdZjvfX87HXnUdn2ShCnamDchDFGLDbYCEKuH4p9tO+xRcKTXZsVI4SnuBV43FoYylUIgMmhU/N5YTKB+V+ibJCgx2nKBwKAc8+fbwuEvzzEFmoXjbzxpqXoNvZe/JvunEZLPdPA7s3ASFvwj0pw9Sl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535882; c=relaxed/simple;
	bh=bjQ78mUNyKvh5jPOJE3BXpV3PcFAhgjeuV6W6D2YWGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoHU/kRuvk2AgEuPwOzsXTSfZkXT9JX6KE7OynKp2tErAn1oZakQp8KeJVCUDsV0wPAFsYwC49DKiI01tzUdlNRaW4Tq03ThvPyuLmBNAWlv1lvsPZuJpCWqEF/cCd2Tk/tlYSTo9eACRa4y/bSzfhEs/+WUOjwwb4sjkq2AaUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jg+WOwlt; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d/1m4n0v reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Jg+WOwlt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d/1m4n0v"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K515351440255;
	Mon, 20 Jul 2026 03:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MbaXE+E/moXKsSRqCey7AW1tMPD9kGohnAdiONYC2RM=; b=
	Jg+WOwltYJmyk9C+fq8K5JEASybJr8GRyTNoYvl1yRz9lK1LatRR7UwVLFhsOFMS
	N48YyAYS7qAuIl6vyyW3wdB3cCZVO29sRbCrDKgdAXnRyP2DkulNHTyoRtBa0hcV
	O5yvsgJfKstV1SbLoyE3YfVNNcVD/BDH8ffhD/q5jE/0hoca1X56TL9OlJk1TF6I
	NLKsk7NVfOaWcBgjhf7lGcBiTS7XqfJ0BYSSoacofia4PkdvzMKIrYSpvPYN1ABI
	R4N9cdeqC7WtxN31jSZkGI6/9GdZmkDV1jX4CmTMQ2IWBSiJ7qRhtmN1NtRhNJTa
	sz0gT0axirWUJKrLtLXWOg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021077.outbound.protection.outlook.com [52.101.62.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfa3gv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 03:24:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCAHUZcuSj1ua2ifbqqIqSdUnxEk5lmMwjWNrhe7L6NhGmP6hSKk+5MqKbQH1ghEkfDaVbJs8mjW3q32BmABP7i2k1jpAv5laviu9k0Yo3J38plYeJyGO3QA6BHFpISHQ+CZHRYd5k7bse6Ne7G7mvUXNV/K/RDsKsZKQKXgsJY0/AJoi8BmPgsjUqAJorLLepdWN6c7QNXXV2MkHG0fJx4o2QvCzvYJdcYSRtQnyYWYHgSGMhDM0o6maw3smXjHFxcxhhw4+AptrRFqW9eBh0IeHZ8iMYECINcIxkEW57FmoqT8j9GNYNf3sqgfZJbwX/JNcYGziHgPuI0r50sRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwWV0z8A3XxXOnIf5XrVRw6dkxjiI+sulqbSchCGh/g=;
 b=OW8l2ZG3TNx6Z2U47Xs6KI477kKoJpkF8b7EK/d9WWB+SR3V+wiS1vOt3A6Qc0jKBa8b9qTtCFKY28fc8/Ze+MTqRvtVCXSHT+/TwGTRolUyzqfVlgKcZLqjToqX6OfFv19cNj3XQ4zAWhyqe/jkb4xcVvGOTgoEH7MD3HgXCmZ/tJ9S/egONpXS/Fb9srcA8hWVQfEvmX765Pau9nnptxJoebeEG7wlSo8fZC/At26+lmxvreUtbaPE2ww69Uit2dCElW9aAVmntXOEfaxSb0jHusfZWwCSukrmnqEEyEQSddBo7L/tt3oy+/DftIDGr81e6bGPvYN0xSoXbKsJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwWV0z8A3XxXOnIf5XrVRw6dkxjiI+sulqbSchCGh/g=;
 b=d/1m4n0vBy+91f/HyGKGvFVDEY44J6FStP1Nr7TggwpX4TORVH+9OoCbREGP2gi9o9DBNr/lb43O5cNu4CduWcXpcmtXnbQZLXEdwt2a1fcO9Q61Q9cO1TpayP3Q+AyYKYVvT0FDsAvVRnwzKr8/d2QUQFg0C8CbDGJklRCoGwo=
Received: from BLAPR03CA0153.namprd03.prod.outlook.com (2603:10b6:208:32f::19)
 by SJ0PR19MB5431.namprd19.prod.outlook.com (2603:10b6:a03:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 08:24:03 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::49) by BLAPR03CA0153.outlook.office365.com
 (2603:10b6:208:32f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 08:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Mon, 20 Jul 2026 08:24:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4E538406541;
	Mon, 20 Jul 2026 08:24:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 281F182025A;
	Mon, 20 Jul 2026 08:24:01 +0000 (UTC)
Date: Mon, 20 Jul 2026 09:23:59 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Mac Chiang <mac.chiang@intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kees Cook <kees@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] ASoC: Use named initializers for
 platform_device_id arrays
Message-ID: <al3bH0vpePggracI@opensource.cirrus.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <a76e26aa4edb901b4bea684919463b2243dd8d9d.1784528081.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a76e26aa4edb901b4bea684919463b2243dd8d9d.1784528081.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SJ0PR19MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff13822-7819-4c81-e0a1-08dee63841ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|36860700016|82310400026|61400799027|11063799006|4143699003|10067099003|5023799004|56012099006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QuOC8orRePODG4befVdvvjiLB4KsxjKzqHRBEutFCYNUvospXc6wWNVv+VvrTpdQN1cprUlV5JKkLif34DppridYYuxKb8WvR+uEx+d/bxXMWaqgC03D15FD/itEDW6dJqX2QocBkdYRBSfBl7Zn+JmB/J//5r+78dtEt1sqQPze4MLMhin0fyatRCHiajMyT/DW/VxNvjftVKW7yQAA1MR9HXh1mxyFVm4rAp8eR1wXWKiOKohrxj1MrXarIDryoOfM+xYVKCYI/W/IQ6eHwwxeXQiy3JbpFFJi0E7FoLkq6i3oXmKlv3J4GZjyyfpyAUDksXZbD8sEQ3kwzxEH1GPn25KGpCVaKdxZQ+/rg0bSq5HIDFxVH6qfWdmEixk9H6/M2imYp1cXmO4QuK/KbJgD31BFaIUawkTE2ACWfXy6CnQsReBtUruKJbER1y3a9SqPAV9K1QinIMRbUFF0qcj+zUXwwx273KIw1kkqEUKB3FTn2q/HXQ96Qz/XMR2yU0tm6r1NZsQghb5y3UWePK5OQd882pMoeDlg1TX2R5S5TYKci9TNciqZUfD3s/l82jTXx6BHPhPn59r3u26UHNGqxEUQJ8TGNeOdNLs4JWg0MtLf1iRUf8CQ8SYfgLjLI+anWXuIPWTJ5k8IrMpbt5KbBCp2R5IrLUPZvZft+/t/cmmrGPJt3nWF4oc4ffqUxdB4UFIJTf0zHvF7uFS3xA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(36860700016)(82310400026)(61400799027)(11063799006)(4143699003)(10067099003)(5023799004)(56012099006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cSau3Tfal/M4PC9+bG5bXULT6dg5niASYZipBNpvv/1rVa5YKdcBCzAAXP6dNn5OwsDKBAmXSKFi8xohcT8dJo/DuyIIEFRIGyQHaghs9UkblSGwLJNGbnWFdEqZxknxO0HfzI3ZYr9BzGTrhASH7n48TMY2U5u97F/b7LQaJTfU63dC40GV5llBtFmq+BMNLEJIAUM0QD6L3GWo7Skv7vl6JFFxeKhI8v82tOz1imzNYDFmqImELgS67MkvzVxS/r+KLxnaapfYBm8+T41e8A4XYTf0OXOP4tBeuMS3ReSyQ2kfmLTcQTBFZGkiATSEy/aOskyzN2znIMRQLQ3QWNS/40dLuwTatmmcbnesyqwCZi2lg7X6VymPvZqNqVuADAh5lonPm7MS+YMJ//7PpBlL2SPLYIe8p6DpChdeMxAjQ8SnBn755fajlw6ibP/v
X-Exchange-RoutingPolicyChecked:
	GehTsD8ew909SFzxA/mCxCj5lL2+ixIU98ETo7cLwFVEb/liiw6/tfQYXUhWacD1cQNW827MM9QG6td1lkb+NwsMzcOwsQFfIJ6/qmuq0MOtZjLn1pFHY8IoXTxhAjVTiPCf9roSaq8Jg83aHNiMP1KI/h2QmUsHmFYorKMbOC3+DfRZ79YrsgoxW2drIaQNv0TlLmsU+grAMAY0D+CRQNfsgL1TThdeGNk1I7ok53pJ9uh/9HuVf/MYHZTz4Z2p3Zn5ULjkxayCIeqXOXpYK5BKtYgOiC08NgLDuoJ7RNuOPOV5jWDmqGaLOebAouC+fKDxpyxWBp9Ylmp8J2d+Yg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 08:24:02.5678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff13822-7819-4c81-e0a1-08dee63841ae
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5431
X-Proofpoint-ORIG-GUID: Lhsb1I8hv-1TfHmTds0V2il0ehuAFF0A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX8fZGR1xFkLkX
 gCX3K345h/e0wRJvFt+aUGLdPY2/k0QW9lhut6R5Lrp5t+pakRh4B0tQP37xLN439EexDWL4yrX
 rru5E7hLlh0QUoz7ig9mDapW6OJj4Ug=
X-Proofpoint-GUID: Lhsb1I8hv-1TfHmTds0V2il0ehuAFF0A
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5ddb27 cx=c_pps
 a=Qy130IFfx9qnCPISBCfGtw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=6OKiDxQQV3JOeiROQ6gA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MiBTYWx0ZWRfX26sEqW4wm0eN
 gCEUfEp+ZgZ0UtPSVi6lMh8Ca4ivoX0/BVpOvYejavCjDRz3zqiYU5pyXlZkUdXRYTkd4A3Wt3i
 j2LnBipNmJmdN28jGCol4HdOe58mj4b6bX4TxTqHjSGKnCVAyd9LQQbeR2tfiUDJW70afhSvFfY
 nIdKR2MZGOtbUrecM5/1FNckJ1jdQJrzpvuyQcvZ/vFPOeWnFuaiTy7HySXg13QZw9CM12pkVxv
 zVcDwj61sma2ZD5t4fB/SyP+Gcnv5Jd6ZgjLjY2w7g/QMrrHTElf//PUp5FY2V+TrCIYyj+5+OE
 +BEJkFrCe3jTx+ss4BQpG8EqD48ZIBL2zReASnXAZ8Gudjl7vnZ8r0KYEAJZI8q5H4cK0nI3/94
 22wJFgut1CwPUnAndkgopUk31RpYwAZbjqx42ssO889j/6Z6DR9FRH1XkD2QN2a8xazDwCVJelb
 1oC8IoE+Gv5Txb/Wmzw==
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 20, 2026 at 08:23:49AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
