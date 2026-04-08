Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C3D39DBFC
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641451; cv=fail; b=SuvH4ej7ru/a3UxNdh/aWEX3Wqc6vGw2kSbCWpEmYOAZ7nlSbhK0WvvZ74cLLCpCiRlhSk7Umc1jzeOpLCtwTYanj0AZytVkijMCXRTmbHkx9UqnhQ74y1aHJzmJS5CP9sOezKL1sTc/Rt4rym0Hih38zdUyjTnRamq39zhIwVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641451; c=relaxed/simple;
	bh=snOeOagPfOt7zURXpmpRxyl2RMLCLinTjaftdp8FLK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cszhVqTZPZCHgFj75hWGQa9rB13yCplGcNIWRhftld2godbxrwUv6uawvBJzJFUSG/dWM0etL0cstzNbEns0Of7sHgLaFMQl609DS5JJqd/S2P5qm9HC9u1Z0N7LWZ4Zwm3wSW0wm1IohR41biuzbcvxEydJAO9U1zT9XKFGtQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NXCMMtEh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vnVzSl2/; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NXCMMtEh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vnVzSl2/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637MRMZJ2093556;
	Wed, 8 Apr 2026 04:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=peVx/5VwjNHIDYzgQwtFcag4wCJ9RPtBR0pqT//B0ng=; b=
	NXCMMtEhFm3oQxvplEBcBjJp8PCbh3DbSOka/3SDRmPThWz/1FeiKadZR48/C3FG
	furAb2isbUBbMGi4C8x/IaNSGzMgmdF7CIzC+O1IpvseNy4HbXX0iUPFX/vpdaZO
	JuaPqfav5dI76fthqIQSuevB4C0NvXswscLdIF5F9G+6KiQuf7upCdxEejD3ZUTD
	TXdhpajw2NKAiAYki06CFbi8/V0buDQykm+MSKXiMHJXCuMA3i2Ei3uxhUpDI6sf
	A9Y68L9tW7wv1e1TNYQc3bkUGk8QrwhfRthXsePxF3YO6msXaam29H3ub38xB99F
	HJqHmVRVGj55ui8kdM64hQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020077.outbound.protection.outlook.com [52.101.85.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr4t35x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:43:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUIZSn9JNQZCCV7QTqFFavVk0Cn9SBwuM/KpOMV7CQkADPmr2cyXPI1pQzVBNRcIOFdd6SL2PGgbVuj/0gQCsb3lJmxSxTRb8N2cbn6qJn8GrYyeHHbMSQIuQ/el6ksoM4h/yCsZRqWPiHYFFCQ/kQRP8qL9P/Nf/4gyoFUkF2r7FEa1RgDmL5Bru/LjHbvr/pbV240cjSDhI9bGw6j4shFehJiYhHwzq/3UZHJDR8J3qmrvcXjn0xbzNbxgfFfieI/nRxR3IR6sBokXkbSXCel6b0g51yr31kQBZ+LP+3lctoGouAToWKpFFGA+XTZ3J0n2oaRvT5lYXY9glMAYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peVx/5VwjNHIDYzgQwtFcag4wCJ9RPtBR0pqT//B0ng=;
 b=Dqu6E2j79NLTZ4lI2vt49m1YiJPZAdp/9dkStNJ0jl+B3EAxpqVeM5PI0CxEjB0fw8W0bK85AHN5N8sZZ9d9PiYWA4KXhx98Y2tOK9UXH1XGSMoGiD63bUmOwmO6/tv0SmYq4IeD9aPvwwFioMoqsUn13DjxgARKNgYCiAg5ankWZOpLVYSZbUQ0XVEyLpsbBGkgNcQ9tht6ypArvjtxy9ELHmzkC87ZCvrWeGSxffD+UWI752TUXUYoPpgJRWQzxeExsAaxK8AkX1NgsNmXUYF0RJkrrRPtJ0P1NCOg6L3/QC8Fur9hncwFwC6+H69Hi+nPIRqYKVZWOwb/3XkI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peVx/5VwjNHIDYzgQwtFcag4wCJ9RPtBR0pqT//B0ng=;
 b=vnVzSl2/awk3Wbumy4mGhD95VFm0oJTYmERrin7XseKmB34C5krcwAJ28eXtmi92ukoitb/Cc2vUk03zWlYRF91tBWaqO6Mj080D+GupiLEyEIOdYgfhqDxp3DPB3AZIGGcT0KgQf8VfyC31NBHuXc+KYI6Bh7tCbD+6lgUi7DE=
Received: from IA4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::8)
 by EA2PR19MB997226.namprd19.prod.outlook.com (2603:10b6:303:2bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 09:43:46 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:559:cafe::4b) by IA4P221CA0002.outlook.office365.com
 (2603:10b6:208:559::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 09:44:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:43:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 23407406542;
	Wed,  8 Apr 2026 09:43:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 05C9782024A;
	Wed,  8 Apr 2026 09:43:44 +0000 (UTC)
Date: Wed, 8 Apr 2026 10:43:42 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: SDCA: restore the settings if power is lost during
 suspend
Message-ID: <adYjTi4tQDAlYu+7@opensource.cirrus.com>
References: <20260408085607.3813488-1-shumingf@realtek.com>
 <adYeL2xsalE5dcY6@opensource.cirrus.com>
 <0f4584c21f1943a18c2e25295daab931@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f4584c21f1943a18c2e25295daab931@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|EA2PR19MB997226:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5199ae-3471-4892-da13-08de95535413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	PwsmBn4hCpIDBrAh75LkYFo4dnZ9UIJjna2oZUaO4Ak50xWiJpgcFmIaEHWYT3toNPBPxyl8bZfEAyuACDjWkcu1T4PYZhycqD3JmuYx4QPSHqC8bdNz/1lPS/rXizcw+/qcc3maJgyaIcpUy3xYsm9HHWBxgbeQHC6GX6Sp6MFbie0Fyc4c4/gbCRTlVBlgx0LmZrCm9Fis46buGJDK1scQj1Iaa6hpMjLUm36MLs23JMEAsMVCrX74wxjn/x2QFb1RBzB7jrlrlpkU6EK8XcdHs5WJEU8GkEuDvzAO39LTbaLpTSVHSEK1EzRSJWti8FyURrISLED3J5OJ15RabQql/icL1ce42sJFF8edIZiTPG4X8fSJlDja+J4FxZ5t/EY8FBFN7HzG1pIfsv77nuBDWvD3JaHgqr4HI0C26S9GsJPGzpT1E0SoK0Xj1a7jXFmPjA82Z+N6CP1HyhaoEdf8KAGjr8DJQvDZmTLx935/M29ZCa7TQgnjWkKlSbu2KhQ04j0OMdNho8psuar+K8GlVgcp7GyvElGolLGSIdjNsL+AXsJtHj6sk0nIjcghU9+pKk7pi1afR1JE5O+nOfe6WmDkpcp/l13lHjC6b8+MSX3Hzc+E3eHwP0gbcYOVtK6WeaA6l3TUDSp4dUplJOswaEuqSKaI6SypsPN12NSZwBkGY0AVFoBkjSRkrkokt5B+HJWq+nslBiyAITNXarCARyt7qnlDBSovL8POpKMZjNzPvdGmNUQHq6A74bNDpIAomXAGUmTXh9xTM7GSOw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jsGHkwtpMeBoM1l2udR/+sKLqEHHlqVWlaeQ8jSEyOzShxDdQstRsOKJ92EpwES/q417hMxXGxj32W297I0DjBqCLMiphqHPFDoYbnL0Ef+YlPOq7ynQew2hBkmjCjqOdRmzwzU5LDkRu1b/dwuDsSF7nZW2RBBTPru/4auHnjkybl+nhv5UR71n+WEVbeMVVy8xBEmxaeShM0LfFI/vlme9l246WlBTQ+Dml0Q9KGfSA8W2qffTe4S9OgrUgxoeNelS5Oirz7g5dCTVxdF8s/RVWVlyS8ymKb8gxs/AZOTIQwImt0wAMNdZN9MqIdvkcJtuAqie7RGg/AGSjqhGOJg8F0jOJ1yhH4IC/9ojAIj1+ghdCI+yXLCmVed1u8Lsj5drCS+b7A5zHQ0Z4vDpJzDpe0YyyrLBYPauF1zfnvkjEiT9P01s2vxTDwloFa0g
X-Exchange-RoutingPolicyChecked:
	tiTRVUvewtKwmC4bhP9SjYoLXVbM8vByS6A7i2f4W4sWLi8LyY0nQJSEkRDBCACQz9kLOoAryukmGsUHo933Nbz7z3nv+j7CTdOV096dfoJlwYjjWTw35y3OwfIvDpdBTwv1bmtVH4RMyb+XaiMhMT0zC5qLRY3JT6syUoPHJs/syztTGjFfTiQxq/55I+ApUEL8LOqp4zo4FpnMb2O8Di8ff6eb0jnJgMvW8F0B266WlYZEn/WRxzQPpNI2M1TjBReM+FPdOR87YkZbrZasgkW9jKnKq/bIPmN4MEj7Q9Iwut570rE7Na/cowpsa4VBx1YVEQax3amRkTzFDI09Ng==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:43:45.6119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5199ae-3471-4892-da13-08de95535413
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR19MB997226
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=69d62355 cx=c_pps
 a=bbl9BA5qyFAQDT3iAuOISA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=n9Sqmae0AAAA:8 a=tCLxp0uJzuDTVbPnowMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NyBTYWx0ZWRfX8u04mqe1Kmum
 buhPb80rl155wvyhAyRRRc224NMigSxc+9BYam2YwPsKcxYYsg9WxYIjtlt+56YkHMoi4TnlMat
 7u9qdExjkwYAXx6OtH0YWpn/kNZo53cEMlgzeyx4GWxuk1IMMxafp9f1Oi7nfMLTvpklN1XxkuU
 9VioFa0+puuGZ4Ka2wGcPhUbGhgCQvbCCm0MRbibSEVQTB9UIl9yiZ3iOSiYaRc9rTnjZg6JMHQ
 DzWC55XWkR62BgsQIc/qRRUnU9Cz32PlnaFYI9G4KEijQQW35HTt/MOptCYTv+sWROHJtrnVboO
 qXPhY4t469EU+RU0XVEEcsOHGyk89njbRCWxbkzNeZAHoMq2SwmovdESmczgr8/q4sUYASq3sQT
 9EwiXK+IxN5TebQvon60s/dgmrAFGnQ1Mbnzt3IlFIEA7ZSEg8Iw2WuO5trjjDGSa5rYqXNms/L
 kb/q0vs5LNtLkVKdFZw==
X-Proofpoint-GUID: mTEIGtFK-KsbnlW9rotMGHmXqYHOoTud
X-Proofpoint-ORIG-GUID: mTEIGtFK-KsbnlW9rotMGHmXqYHOoTud
X-Proofpoint-Spam-Reason: safe

On Wed, Apr 08, 2026 at 09:40:15AM +0000, Shuming [范書銘] wrote:
> > On Wed, Apr 08, 2026 at 04:56:07PM +0800, shumingf@realtek.com wrote:
> > > From: Shuming Fan <shumingf@realtek.com>
> > >
> > > We should restore the MIPI-defined registers when the device is attached.
> > > If a function status interrupt occurs, the device will trigger an interrupt to
> > reload the settings.
> > >
> > 
> > Are you actually hitting this in practice? What is the situation where the device
> > loses power but it isn't covered by the normal suspend/resume flow?
> 
> This is a scenario where the machine enters hibernation and cuts power to the codec.
> I simulated this case and verified that it works as expected.
> 

But in that case the suspend/resume callback should be called and
the cache should be synchronised on that path. Are you not seeing
those run?

Thanks,
Charles
