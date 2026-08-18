Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCDD417BFE;
	Tue, 18 Aug 2026 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041015; cv=fail; b=QtrbHd75dDjZj+njJ3Yb5ciaqedT6sPTMR1IzaoM7OA7jmOgIYi0lHf9XGTsjylLGwlaOrQhe0SRIPvOAyvX0WRut9D1BYFgSchUa9DdfIXbqgUziuWJnAhpsuzIjy0X99DwCLaO9VZzYeWyIuCUKkefTyuPK8m9vyiLPniumbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041015; c=relaxed/simple;
	bh=wwNJoz5nmZD0ZFUdHKTn5LQCrx5jevohAvGmTR5oSMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+lXPIoaexHRIb9GUNgLPTjSrj8Ai02pHIco1gXBUIcqbW3ltkmhV5cwlAaF3lWL48iYVx0iKEJkqhtmM0m11m1V2vz+I3DEdKYecdz5zuoXQ0eDZ/k6Sf5kalY1EPUIivj0Wv4S1TnoqvCyBAwUf61/HnQs5qS4ZStWmBHDAjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CRy5o8ii; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oztQbaa5; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CRy5o8ii";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oztQbaa5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I4gSTV1676305;
	Tue, 18 Aug 2026 03:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7gtolzR5LcdUF3cJ6l
	+MlechWxAqcbbmFQ0xE9z6fHc=; b=CRy5o8iiDlB7XuGz6enHN2Mj9n5Z5K1l8I
	SQTa2rd23LPuJPLcH+1JYTIddIwTt9cQKIrvh1yEZJAHk/R8jE+ekym+s5Rv5JH/
	X14ZuIZa3XqL7Qy4ostj5Q+5YhH0oWH5sdJJRYrP+AFmOX0hMnWENHbjix4KSa4P
	FjK7/gL6GyQdgyEYrSnQ7MLMv3iuXDKRFETjMAeC+D4OnD483WNCJPYlbOfYr7rH
	CDy9dEQqwIHD07syXt+TlmGGwjqBDLk3ZkhyXC1D0kijVEYSadem+l9bgh6SoKRg
	aHpXLdbE+JPUiKfRrBD/K6vJeP+tfMzmquwlcTjR0l8LbTea4hOw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022143.outbound.protection.outlook.com [52.101.48.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g2mheuq6g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 03:16:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5E25lQ8DwZaGDlZFPc5sHfRYeYuhs7iOc9lCq6QPO8NJ+/SZCEQudtLu9pHVYaXGFhEMcXLraKUtz85+ku53JYOx+LSUkjY85+xV9SeGgnPgOA6kWNFbFIlRWQjAXKZ9EZGJ25S31Ji+nrKd93G1nLFCxTwH9AxLp5Tu7UEsyUZs4WRdekNRnIIyVO4pVCC7eZQbtsWUWsGJVQwYXSChASoMu+CCXN18Fu2Z2vlR2u56YkjjcAkY1gUp0pTmmyP2UdOF8w93VqKFdPzbD3jxhXWnyHKRa7DDC92Zw/WDhkCnu6NBi1pE40UIZvSQifuVVQFXUeGyPViF517I1lw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gtolzR5LcdUF3cJ6l+MlechWxAqcbbmFQ0xE9z6fHc=;
 b=XTAMp/bJOJrQ5nRZjuJQ2gtK1bASMsQKOR8+YLq4A26vJNpTRzbuDmEMQ8VUrlfYzItR7PS5STFYa+PTg4AChXJeXSsiGDO86cbQaYA5NBIsDAMoDxjT6c0fPS3pbhujWINfVvWVY1gFuq+uN2TocBTQrZoTYiE65pIaxhRa4n74eEH5G3D9jy1lbez7+I9VdRghO3KuPt3rZXoNdoD5224auupZLfGlgSqkS6A04v9W96nf1ZdbcANYK95E2bMlFFqGMK/kCy2SbLP3in0MiBGu2Nw43SOtstcB1KBXrlhaV7JphrkGEDJF1aFwcAf4VO22MvUWdtXjB5uaoupDwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=amd.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gtolzR5LcdUF3cJ6l+MlechWxAqcbbmFQ0xE9z6fHc=;
 b=oztQbaa5BUoYTaPEiXdHv4U9mXcH2bp2tpnyLioDCiTu8MGFtMvJTvCtjyl7G1maB2G6Ba5EhMUF33dKIhI1NL3ieEubFZ7ad0vpQfkue1FHESG9k3nVlA1P5plOTWaXieT0vgCGcDvCeQxDtxWFjYq4heO1fqXIRBBd5YboZ70=
Received: from BL1P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::30)
 by LV3PR19MB8779.namprd19.prod.outlook.com (2603:10b6:408:27e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 08:16:21 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::59) by BL1P221CA0018.outlook.office365.com
 (2603:10b6:208:2c5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 08:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 08:16:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 46E48406540;
	Tue, 18 Aug 2026 08:16:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 36971820247;
	Tue, 18 Aug 2026 08:16:20 +0000 (UTC)
Date: Tue, 18 Aug 2026 09:16:19 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andrey Golovko <andrey.golovko@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Antoine Monnet <antoine@montane.tech>,
        Robin Everaars <robineveraars@pm.me>,
        Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: tas2783-sdw: do not cache read-only Controls
Message-ID: <aoQU0+ECDXwU/k3S@opensource.cirrus.com>
References: <20260814094000.22118-1-andrey.golovko@gmail.com>
 <20260814094000.22118-3-andrey.golovko@gmail.com>
 <e3103067-f8ea-44a8-b430-4abb61e45d6e@sirena.org.uk>
 <20260815112500.4362-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815112500.4362-1-andrey.golovko@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|LV3PR19MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfb7a20-7faa-47f4-d0d3-08defd00fc9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|7416014|376014|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nwX3v++oeaOtm/CIOwbUFCeouBlhFMpnvtijWEb3oW5YND2ybcHDeDpQowybwXGsWLq1jMmi7ca+qFVGcq9wltrUB8jmzdEHKUAbmPCSRt9fCQAH2wggBLf0cusZ5G7n9Q6AUMemdfQQAHqNIWJJQ8OOE+p1SZkkxbWh7ArtihikAbjD5GycchhTu4q5VC+lEcFlntYMov8yAZ7PuAGJ+SPXIXQwcxpq/JcciORqSMrnF406ge3YxbNFjVscg7BnP2r2kFiGibwySXm7/HeKCzGwUT7gpFcZQfL0+fZUmOtVIl7/SDmkeO0wc+p/JMvmxN3c0T/DuqdQwIV/Nue0OFZ4AA/3FLK1B2dCShlfpkJ7GeKRiqPlrmw24yBIkk1nD3/QWUdl5uLmp8LlKyaJtNz/HsX3vz1LFXXjwex16fK9ni2rs5/9gLgl+Sx7sSkKrBT9H2JOjJz7bUncqLPL0Mh3pQGhfYtlBbGzCj0D5XNmpoeEeHU5M6sz7cj4L06rTbxF3jhB9sta8ylepI2X0XRg559VUzKwKtJf2lT9PQjUt0jZSZVr3XHzxBRZGBTCQeXg/9Q5XKEQ51qvzI/NZoasxsi7vqMjDU/+BO1iITY6Eor6g5t1AM2bbG7hu4vyYJ+HaWT1ercBXPES49zK4vPBDx9bjgKRpumVMoB2R5h4inZp7qdlMte7ap1JeRQvfA/SzIkhr1jiVP9ENfk/DQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(7416014)(376014)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mhi2A031hkMaEvqxyO2JZdsSxEt03fG6c36jTFoov9OQDK7vloeNi6YShNm6eJmIpu0X//SnieU/yAF9AXFXT3q6XHQtJBAWepvrIzReBbiVR4oGzQI0GWDgLjRgZwLbKuRV1un53vR06nlI1dut39UitsRKrGqQDcQLiN4cZyy1BFGZV9+9BNjm44c3Z22z596+FacUEG0t7NBvCxC7aWCFM5Sjqf+IeqM2wZISvTYXS/nQpMBupd0mhncePSo5qoHnqDCqtmT/6HJy5jXEuNBspC/oHLcDCQVQLYOJGW5hixalb/n8kFhV6HrnsMQMD6+wjjAAaKdPsT5/GKT4AV+El45RxVCZySkK7F1laEQDc0GMlzeh7CUjZVnWLFSBQwzGZaTlnQGJnqoZDsPDbWlj8eMynvsk5/C6NkaekcCsBpWpUXPDBkOBHDQV0iCy
X-Exchange-RoutingPolicyChecked:
	hds8UM6+RRD2DIXVONsoIJQoWNmcy0180kz6DIn5Y00XDvTN7kg+EqvarpRUkRdbpx7EL04C8d87JsIorkrUmBlyIG+oMD/BskhA5cip5DeRcfad9wWVbA0oQjK4YYcRayMqZgHL9sg7cvk4QNNwAiCTpUahHU6Xm612Do7gb7EK5d8fJMjOFPOwxGEJH+ABMY2k4t4DBJLcDl+SlIa0Ut6R4/JHMlpA/gq73RoLaUKubz0IT71qQe8gnqAJ//OsP9FVwYkm3f4P3na2v39u2ogHm/2eor7+0ybZB/tjDk5G4daRsFcLGrnt2E4WvhTeYa7blGPzYY49/oubZJyELw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:16:21.1228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfb7a20-7faa-47f4-d0d3-08defd00fc9e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8779
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2MCBTYWx0ZWRfX6bs0SuQrB57x
 ckHrXeH32QKMZgKbkXJBM+clQeZ+uwYk0u/7N/6mTTpTyMKQ5Prr0CtEdD0HjSTzerMJej0tH1j
 3lY2BoIyp34JkfCBM6Gf4fsENDC/qZYb7pPfM6Wh0xFuyvrhZcpwTWdoaaN6Hqtmlc86ONRLxkp
 +DiyBthlMUN6l//ADw+2aUpefDFsew/kCZPPM/QJRwqTVPfkDBa+wPMl+JreA0W5lxvF++M6YrD
 JRy9iEYgGpdgEckeLWXM0ZQO+Uzv209kka+Yh2pCXbjw0VLCOf/9m3NMQr+fAklRlysKF2iyfTo
 QF07JrxoIlA/G8wOgUzAZ3UwKv7KPK+2ewvhQ7zOfQSNN0g7Yyu1dk9s1UavbCnEYSF6DUrCY15
 jMZxfwjp9pg/9swWlgdTSSwk2pKpLzOTHGjBA830KvjhprPSiGcb/I4zrqz1sqVoTvZCVr1dJIz
 Hz1meB+BxuOlIysLItw==
X-Proofpoint-GUID: nh9PBy539VXKpLtq8h7YcUkThfEZOULG
X-Proofpoint-ORIG-GUID: nh9PBy539VXKpLtq8h7YcUkThfEZOULG
X-Authority-Analysis: v=2.4 cv=FLMrAeos c=1 sm=1 tr=0 ts=6a8414db cx=c_pps
 a=5hlTapE2LkzBXMJ5nTapMw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=vBWSkdjjrtU5iRa61gkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2MCBTYWx0ZWRfXwQoX3IQt6fui
 TMflQj+FJSI3FtVrFi6gpykgwLwnCjCuaAY39X6TsUitaI1LKgXoCHcGG6JnfU2Fwu4yi8ziRaC
 CIrYszMtluzX92uZnzmyzJDbDc5T/pw=
X-Proofpoint-Spam-Reason: safe

On Sat, Aug 15, 2026 at 02:45:00PM +0300, Andrey Golovko wrote:
> On Fri, Aug 14, 2026 at 04:13:42PM +0100, Mark Brown wrote:
> 
> > Does this work for multibyte reads?  The regmap has val_size set to 8
> > but some of the read only registers are multibyte.  For SoundWire
> > val_bits doesn't really matter so you should just be able to set that to
> > 32.
> 
> It does not, thank you.  Twenty of the Controls in the list are wider
> than one byte, and with val_bits = 8 the MBQ layer refuses each of them
> before anything reaches the bus, so the patch on its own would replace
> an answer from the cache with -EINVAL.
> 
> The widening is a patch of its own because the calibration write relied
> on the old width, so I have sent both as v3 with it in front, against
> for-7.3:
> 
>   https://lore.kernel.org/linux-sound/20260815112000.4180-1-andrey.golovko@gmail.com/
> 
> The cover letter has the list of the multi-byte Controls and what the
> two patches were measured to do on the machine here.
> 
> One thing I noticed while checking the sizes, unrelated to this series:
> FU21 0x10 and UDMPU23 0x06 are in the read-only list but appear nowhere
> in tas2783_sdca_mbq_size(), which returns 0 for them, so
> tas2783_readable_register() refuses them and they are unreachable
> through the regmap in either direction.  Harmless as it stands, nothing
> touches them, but the size callback looks incomplete rather than
> deliberate.  I can add them, or leave that to TI along with the rest of
> the reg_defaults questions I owe them a mail about.

One thing that is worth noting, is that sometimes in SDCA values
are DisCo constants, these are registers where the value is just
hard coded in the ACPI and typically not implemented in the
hardware. Generally, these are implemented as non-read/non-write
registers with an entry in the default array. This allows the
constant value to be read through the regmap, and driver code
generally doesn't need to care that the register is fictional.

Both of the controls you list are latency which is commonly done
as a DisCo constant, although that said it is also not a control
that is AFAIK used by any implementation so could also just have
been forgotten.

Thanks,
Charles
