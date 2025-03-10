Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21CA935
	for <linux-sound@vger.kernel.org>; Mon, 10 Mar 2025 01:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741571602; cv=fail; b=Y9079c+vnYkJwDAvvgvsf7JHL7Trol3JVO/ZdwD94BbhWsW1Ol6LIBv2B5SA4bdnPpE9/s9gz2+fEHJjh8WGNpLkGHXbmkiw4HiFtAyrxRBrvRly9l11cQvAi8QvKqOkTfLxgF5HN3Q9pVVwt4Qm1XbCZeHb8ZxIasBhE8Fn5V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741571602; c=relaxed/simple;
	bh=in4pfauWnFAZHvl0dScjrRCsRyntcFpURg/TeLwgDwc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RDTGnQ8LAPqUlZ/Wa3nnsiNCOviJf3/dtjFoo/TbRzDZZRMbFVAFxkfrEB2/HmDd+aye8Wj7dbNw0XVgHxhGDY5sJ5ZYowKRkCZZAOrD+E+d6s4ZzxAbw2BKQ3ojWEGrjFKt14ydwdf03eAoerkBi8v81rJ1623wU3KuVYRCv2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QphvQLoH; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QphvQLoH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV9Tzzt0wCnE4BhiXy6GhqtzwDoESmLLsnKzlAP2UaSex6RPqId6B37pGPE0i+T+m/JQmRUk6/1JD7n0u3yELVBehx2jE67scp5bbbTcduxMgaiB2DlGBM9IAWizYEWDVdwW8xkewWslZt1bDWOK1ZfNj5FVKiadgujaahtZT3Iz3W0uUUM0hYGiK3gHQwoasrX3E1z2R/xDFS0uWb/TuCxRLNtH0SVlpXo4Q7ff9nFc2SOehoeWxYtxMFOQJqPWZLrxS9T2z5PGBCue+NbaXpHkpzfLu3JIVKub7m2Ot7jnAT4pgvCZsmpkheFYZiRGlKCKBcNrAFqpE/M/m4ecxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLErZes1Et+5sDleASM5fxaagwLROoSi/sXXBBIu1No=;
 b=TFDHsnKXdU5hUnZrkTwiPlICXQztfnWMBEP9eipVVBNMza/1cwb8x93R+fMoG/cVUWbQKmRO0NMBzOmN/H5QEtcWOOUxZ7aHLc5x5mG5cpV74SCiH9kutaV0qdIW9cicuZT95f+QSGv5r1zit7Yet54MU6G69iEhfHe4elF3tFNkr0btCdT5C7W7qZdTNHEeVyF7W6E6seOeWLRicTEjMS6RU76jN52L656odwHGBlco8LYWBpl34Bz4C5IP1TkU89uKIC5Blf1j4KDj0Aue9OdKPdw5sp9Xkc7zg1VQxnuUEASm21sGs2PQIt+l2oNy4AN4F12SA5ftAEL3Pu64IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLErZes1Et+5sDleASM5fxaagwLROoSi/sXXBBIu1No=;
 b=QphvQLoH9CsEyDFdelyhBsp/1XlGpXMpQQmH1z2fDrUGhvjo4hV72a3ZLvnTQqWeCtSK3bZu0dR+1fzMa2G5MNDxUimYJXrOcfVlWtpV2llcoI7TopUIihi0ps5BKtP0f3HTE0JhuPSIU+FmRHI5v3RrvcBGcxxxmpOzDLZJAH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13313.jpnprd01.prod.outlook.com
 (2603:1096:604:352::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 01:53:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 01:53:16 +0000
Message-ID: <87r0357isz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-pcm: tidyup function name to snd_soc_dpcm_be_can_xxx()
In-Reply-To: <7b9735d9-8bab-47e4-bee9-77a6c195e562@linux.intel.com>
References: <87zfhy537a.wl-kuninori.morimoto.gx@renesas.com>
	<7b9735d9-8bab-47e4-bee9-77a6c195e562@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 10 Mar 2025 01:53:16 +0000
X-ClientProxiedBy: TYWP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13313:EE_
X-MS-Office365-Filtering-Correlation-Id: b87695ee-d5fa-456d-07f1-08dd5f765372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zhgH92mKmXYhN6AvwfRxrKO8UlUcJ2/rj6HxchogPZAD4OadcOlVYVOd6Soa?=
 =?us-ascii?Q?MjCRzeYEkOOM4RIp4J3W9IvwKVkE/aLpqCwQvRtysbKDvlGH39zg9qKc9cYn?=
 =?us-ascii?Q?+sI1LC7HV54pXT0Lv3ECxWXiOAceOntiepjphaD8CAk808cNjmg9XNSe3zDd?=
 =?us-ascii?Q?xbhDi5ZLFYKycDItqr1YEM24lg8pIyBw5mfLd9IzHdOsLS3bmM/yarvEOzAB?=
 =?us-ascii?Q?q63itkz7j2qRIjU0E/wJyAm08yVPkEZSVfxWVSN+WjvJINYypQDDW6NDFQd0?=
 =?us-ascii?Q?TStcrGhTDa6Gilia8dV68/9bprNIPHRZdVB0EZUpHTxhiqQRjx288BWlkE1n?=
 =?us-ascii?Q?RIYsVUTa8TcTlsQM3tscytzXbEno5v8HDZQO6/oA2JokVjrsGwKW7UcxEfIW?=
 =?us-ascii?Q?zxJn2yDiADlE1W0+9w4mXJ/MZuJYbzmIgjBjO4HVB9yt9ivXpaJP69FyK1n/?=
 =?us-ascii?Q?OU4L8c4yHf9os8plsLbgkdMVBW/7yQZO+44koUPNgnfjARY3NrjZH1bJn575?=
 =?us-ascii?Q?vHT0i4/zv7NDwlTJ4lZoW1bG6+s0RJzXPLkdzmPGPOw/YNx1VdXkfXS9JOMP?=
 =?us-ascii?Q?yH1Be9b6QE9AaFY8n0BFzwvvi5xqhCYMIPzPfbMiQKAtS4fhqcXW0esMw+cm?=
 =?us-ascii?Q?BAHhym+KQFqhFwd6gUKSZqmNHodNIl7vEgmDjLIptxD4zmNu/8f2pq1PI/jZ?=
 =?us-ascii?Q?gIr1mly+hMZiXoljZg7T93AQIiB9U1bUbsh2ClBUqVcVXbuxXmmDcSMBuEil?=
 =?us-ascii?Q?eyq1nzRIdVaB14eOZpulhT+projZbew+4Kpui5ouqldacjm8FooBBAKUWGbc?=
 =?us-ascii?Q?zEk0KqppsPXxhuOR0bhgMQSUvwK/wGVOwJGI/XBB/fHdJgRGkY63Z8iyVEH6?=
 =?us-ascii?Q?oaSr3cLZ3T+H7SvV6YsE17aGexeAs2HjGGCwL+bUgjgYIFOJ5dZjwNpJL0R+?=
 =?us-ascii?Q?7q11KVCNfD0tcHtSco/K4JwXmeNWOpv1lpTVTfJ3jEcjPRyBMGhC8i/pF1vY?=
 =?us-ascii?Q?uF+VZ7XMwxS1XXGLD34HfxgjCvwSxuckv/vQTqs2CEjlukoKRxdMOYQpHU2e?=
 =?us-ascii?Q?MiKVbm/99YD4X9FRXnincew7ZycnZ1bv/U1W2Z826Vis6XhmyvXHBFCCH5lO?=
 =?us-ascii?Q?acEiwRvl8G396s0u01r1S7GO6TAAhiFrKhBF0LxdrdiD2jAZj7ZdOM2IkMEg?=
 =?us-ascii?Q?l/wBh/ttc8Tmnh7gSNeMDFYOvWP5BEluXn3t8l4ZY2VZ+KupBEn6T72WHjIQ?=
 =?us-ascii?Q?aELpKhGITsP371DHVQC3WJ+ZqL1Y/BgjOCl0xeHl6Qr0juugE67aXrTNkScw?=
 =?us-ascii?Q?vjSYOiUvuVAS8m+i0jclIaIlHhrk/OdjQCihQLNk7gYxB5ezRY7ubRNSI4Gb?=
 =?us-ascii?Q?96+DOMmnr7Mte2eYpdxKdHJS4GtgS2WHoXgTPz4F/KE8PgEOc/JNqp5HonPV?=
 =?us-ascii?Q?adUhfSmDX9B/RX2FMGeVriFgkcsCWJrP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wkxVlAZn4M9iqdgNgnGlxXPDqVtuVy/mUkuZfYXweA8cpF1L4M7q74HBwqsC?=
 =?us-ascii?Q?BbPcf04X8qBA3HfiyO1I9BpofUI2uXsV/AyRcO/cUT15iy5As+Lbe4G8QzTI?=
 =?us-ascii?Q?X/AlYHOlDNvJ6oYyunFSpRXf02JQqgqP1JeMKWLYYxavlCrVSCN/48zDRac+?=
 =?us-ascii?Q?ScqVyihUDLMyaL/UEfwnr5y8iH+zKKJgF5VNZHggxNsw9LjHtpiVWPIbWQg0?=
 =?us-ascii?Q?lxUFFvkdRn8Ug/E7hx34LJRldle/1RS0NO2SjYecNKpxBnMtoiF8+hkiL6SQ?=
 =?us-ascii?Q?zeTFKMuNW3UYId+F1OhfaMXMYYoqDJB3wgXY/hYp7BdGiOAMlqme5xnykxrN?=
 =?us-ascii?Q?1q52dIV1JCq9CNuR5Zpbjrqqgnr4XSedCyJHYYskWdEIf318hl0JlDxf1Lh1?=
 =?us-ascii?Q?Etyao5jUWVQfyr3BrokCF4Dc4bdQGDesypSuML1fh/9ydT4L8D1P8ME4wtiZ?=
 =?us-ascii?Q?59wf7kDlOmGHTqaS+OvJDpTuUjsehiDdwyF+YHic3/CcMOQ4AlWIR1V0dI2+?=
 =?us-ascii?Q?VQD+4Xvj0gouTMFqlftzO7Lu0b4iVGNObnrFX0RrJ3pJ9iTgo7cINFRkhXfU?=
 =?us-ascii?Q?LOtbPUz2d2v47EYM3pL4LLUn+W8uY9Kr4FOpqhLk9QH8cZ3kH58SLJbmL+ZZ?=
 =?us-ascii?Q?2jBszaBs41FeqvlfzbemiLNE9oIfbt90Qe2G/3Ncin6IjZvq7tdiNfTNkLH7?=
 =?us-ascii?Q?XUvpOD1xHykaNlgI8rKR5f9U3GzuqMLRXulTqymeEBUormSfq57+IlGXLYvA?=
 =?us-ascii?Q?+9l84oBh9v4sJcVwvmlYaTm3mt/VqzwQ4Chm40Eo8gZ0IOaTHBAHFOjIvNia?=
 =?us-ascii?Q?DBz5cEZRu/2+nVdrbaKGZNPAgP6fHPSERU9Gm/fV+1OzxT2eVCaoGfOR8e7p?=
 =?us-ascii?Q?EZzCsVuTGbaOPNmWN+Vk7Pf316EqRZj8Mso3Aoo7UNmcAwDFDkfNsMRLmA55?=
 =?us-ascii?Q?fr5IjVTMcZZYxUMmo3ukmv/SpsQ+AiqmTPPnpNixHprkbl+DvhQtJaBZxNOE?=
 =?us-ascii?Q?6iOgq1NVenHB+wUd2o28FqenGiww3FosQMuUMhz8qFYwYgQiKKgc9zmiozw9?=
 =?us-ascii?Q?pKHr9plS4i4XAPw03Zs69FEZx1owIRi/e7vXG1j4t0w9rXsbqIWn6BC21qs1?=
 =?us-ascii?Q?smzIf0/uTFMMa68W0Na2cPA0DdI7TXbXNLP8cFF7Kh7PjE8VyHiXgHHFQ0IE?=
 =?us-ascii?Q?z+MGAV8qzWb/lJc1Asvjk7V5k4AYz4hfIV/iAOd20/l8Uuh9zXZmxs8ZioKY?=
 =?us-ascii?Q?51FSVI8f+Tl/crttdyGgFjUnRex8SuAIrGY+Jzk2zdNP1t0Rnrx+io5vpVBk?=
 =?us-ascii?Q?a+UjRGSytV0Sv5+e7Nf4yHhQG/N2T4hR3gMfBdSwC9nIyr6SMJC/dC1GZk5v?=
 =?us-ascii?Q?O2+GrYQKXD6io8RdAq9SkI/LeraciTZ4x/HJounyMpkps7eY/xPPILxnUczh?=
 =?us-ascii?Q?D9JjugOHN8mLM6KRrGX/hfqwV2cYTB6f0vetyswDTIcrxFojPr479o4ERFgi?=
 =?us-ascii?Q?6ttW4qU32dZA6qa9O+GeWdwQkZAExuYYJSjdwbq/6DTS3bJUzSSFlHygxbj3?=
 =?us-ascii?Q?xeFubBreTCUTqoAqwEnglQtPQNFlAY5z/aVpqtTMjuD3Cci42B7B90t48HkK?=
 =?us-ascii?Q?WgkPxUu0GgTV0Etrkp0pWpU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87695ee-d5fa-456d-07f1-08dd5f765372
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 01:53:16.8654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD0cQ8PVVuf99mXZwgP2PepJdi6qqI0QkqCED3vyk/rBOgYE6jGMq6Hb+hjhuUf8RpbBJ9GkwG7LB07HH6p3fm+iq64mEIEkBlGFDxyY15p3LPMLt//6TdwvJnmud8Gz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13313


Hi Amadeusz

Thank you for your reply

> >     		/* is this op for this BE ? */
> > -		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
> > +		if (!snd_soc_dpcm_can_be_update(fe, be, stream))
> 
> Not sure if some part of patch is missing, but shouldn't definition of
> snd_soc_dpcm_be_can_update() be converted somewhere? I see only calls
> and _fe variant.

I have updated the patch just before posting, but there was a mistake then.
Thank you for pointing it. Will post v2

Best regards
---
Kuninori Morimoto
