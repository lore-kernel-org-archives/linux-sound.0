Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C9E23E35F
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 00:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458122; cv=fail; b=txW9DFRVNYcK5iTiup9rF+tsjSRLIdqwdh6wTNxdDCV2aYLsyc/heQ0gr+uvnxA7hf4ITeoVqeyvi7TnXfwVr43BD17Xvr49KehLfKPPxnSwBKjRSY2SHzVA8D7SvrKNHSZvdyS8/0WFjCxisFzNhbTXzmJHqc9ve0HiytFcvHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458122; c=relaxed/simple;
	bh=tHAg/oJSx91+2kDVK6ouyQk0ChHILRkhNvIPd8VhO8E=;
	h=From:To:CC:Date:Message-ID:References:In-Reply-To:Content-Type:
	 MIME-Version:Subject; b=bRMGdKb39puBghZR4DlRdtWg9XgxEPz5+sbScwzWRK1O6fA70Ul4n97DdMksBvQZdIIl3fE2OkpPoe6Xmz78P3IsY71tcxRNLqAV45JKCxQhFfTFvjrNy1qdstha4rh6TTjC2pHgQGuvN9yKtRYiaT/eTXRWngVPNNaQ0JVUF34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XLwIMax1; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OkDOGn9q reason="signature verification failed"; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XLwIMax1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OkDOGn9q"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66UNSR793954830;
	Thu, 30 Jul 2026 19:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kUBFw/V84F6EdfwpD5bfw6ETLla/rlocs1dM+mPxa
	B8=; b=XLwIMax1MwMxOPJuPML4NKgycmvgu0SeNm0p8n1ZcrufujP/aSoQ9IllG
	rnkkBux2JpM7Z5dLKQnY3QT4ku2ZQ1uLOk3ByMXxyC5A7OL8O6WG3q6G7ev19bF3
	AgM/YuQJBV6FEibgVOD9h73blqxOzScw6O4sfwEZmGyK2hlbl6IkpUL5poC1EYgi
	IzqScdClpZVvPVfmr02DQXa5aIloHCXjsIEbvzgy0cNphAbJPhrKkbrVw2ia23wa
	iY+1OVV6iNVZ3LQ69kF2f0qLYo4FK0TfMME3JHNRk+6xyU4SqNDtjoNuGEB5tK7n
	Sqhr0Nkx+nBc3gh5b6lRguT+8WQhQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4frgadgbff-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 19:34:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7Um+7WjWc8p8fubP+ld85qymUXHLMQ5FEc3fBKAwcaklDwUB6RNRZBShrIYk4RyS2EYD7QBUVz198HGHX61o+UptS1/lduKEa8SMN/w5VkYPkGK82DF5oibB0t0G9VQToazAf0JgFsiUNIyuzLAZENnjTT2Ync+7YcnzcbufIe/lSwgWSbT+HzfaBnAvSGORoyn0kFSEo3eLkkeKhv9c5LZT56B+D7FsriEwDIFLJmpQnAYDqcq4SWxDt8+QGo6KAkmuNUpr8I9SppOS5cRGfgS9bld6YfBNUxnTmvy3xTZdo+PCdaFwqXY8zG7wuNHRmAX8p9hZqMMaoeXONV8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUBFw/V84F6EdfwpD5bfw6ETLla/rlocs1dM+mPxaB8=;
 b=dp+fP/1MnNeTBCAiCeM1ZZvTkgOqGd6sxKfSzcbSSDk89zHXVSg0XXt4blO/Z+tGO2M6XC7elIT9gglqguSVZ+21e4EsThQy175QGeTRk8960BlhB9L8pT4G26AKv23oOO+zcshScItkSSSrzTXzjM5KPjuDmgYJFcqP/f2gGFqxpph06aS4VxQDIIz4VmCsNUzRHTrY3x2qioKaSK2aSwuq90jirbilyDLEQo/ajbcP949MGxJpaUpkihdMwrWlOYQunXNOSSQEdZgrDbYCmskfsrieUhmrvZNTaSRrR9LpBG+NGB3HEMYPfK9sro12PwfatGGJbvtJlHmxQPYN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUBFw/V84F6EdfwpD5bfw6ETLla/rlocs1dM+mPxaB8=;
 b=OkDOGn9qJ+uKZzkEVZgBG8wX7Ro4MPVRe109wwgICRqRJgwd41pQHDt+2ZpYQpZTt2b1kQF9HvzyyvIlXPTxu2SRHHTzp27kqwtUOpJRtFjkhdFyCqhELA6h35kqAaDPjzglu38bvQxK/vDrnOVNu3cR/A6qBCDluDGgyregWn0=
Received: from PH8PR20CA0011.namprd20.prod.outlook.com (2603:10b6:510:23c::14)
 by CYYPR10MB7571.namprd10.prod.outlook.com (2603:10b6:930:cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 00:34:36 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::21) by PH8PR20CA0011.outlook.office365.com
 (2603:10b6:510:23c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 00:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 00:34:35 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Jul
 2026 19:34:34 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Jul
 2026 19:34:33 -0500
Received: from DLEE208.ent.ti.com ([fe80::1fe3:c5a4:bb4c:c052]) by
 DLEE208.ent.ti.com ([fe80::1fe3:c5a4:bb4c:c052%20]) with mapi id
 15.02.2562.037; Thu, 30 Jul 2026 19:34:33 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "tiwai@suse.de" <tiwai@suse.de>,
        "13916275206@139.com" <13916275206@139.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "Xu, Baojun" <baojun.xu@ti.com>, "Lu,
 Kevin(AE)" <k-lu@ti.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: Optimize calibration to
 avoid full device reboot after calibration
Thread-Index: AQHdG1bNcuQDbmppwE+nyedV3CjFtbaGoYWAgAAwDkA=
Date: Fri, 31 Jul 2026 00:34:33 +0000
Message-ID: <8efdadb0ff64495eaae66482e4871790@ti.com>
References: <20260724102543.2067-1-shenghao-ding@ti.com>
 <43286199-dde8-474f-929b-a9ccdb9dc598@sirena.org.uk>
In-Reply-To: <43286199-dde8-474f-929b-a9ccdb9dc598@sirena.org.uk>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|CYYPR10MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c29c850-cd27-4a02-69e9-08deee9b7f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Hv5O7GAu0f5WYw+FUgV0ViIEohVbzX02io0Sw0nvGj892miqa3fLn5DYwqF2hvm9Np65Us3L0w0Egc60WaxgSLtIDppBanzhprxDbp8hfmt+EyrryjnVBcTmZae8haJpVSN+95suMgYOU1ukZ6MiXbWP3bUKT6VWfihgHvcrKu+FcynefbrTlB34d+XhyXGX4K9zI5XKXyBB9F5DfRIoDPdqaCBoRrTVq9gWW54zzlZC2E/4Upqi0z9ROZRDNZMEIaz+DmMqcOr+xb2PIqDiIITk14njfosvqhAVLX840aQgYWgwEIxPOEc6zzHUKTHSKwJQItnRQUwYXfpjmN4dHEF8ee1UFCE7Bpk4ULWYsTVk6PeWIHwCM8L3GjhBw15rZ2bGf1PYkaHaFzGeeUl5YMBUtSuOppQqGE1Mc0mq6nWAlNMwlnlVjpgw8UJisq3gyTWayob/rMLhJ6ULXqLzds0FBOSH6NvgHhVR5+M8mXlCt3y5M6BmoUAAwRtsW9eRf1M19TjGQwhpiPrkEouNruHdsk6Mn9JYDgaRlpIaiAH0sXPSwgPqwzNWSDUQ95duIK6YHWW4SrP6FQ2uqHXiBHkDgCUpIg4mATjJEUYx78vZpnrjYIaYdAsrbAW9yL6+0Zqh6nvHIjq09W3lGjANljtaKL0nL02j7BKy7z7CzXJn6BaMyG84EtNC29w2ZtMN7tbJ4VWJWY5zGZF6n0NLYw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/sJFHcf4b90cWzPwlndy/j+Dg9mfF0JFXA33j7Tx74Y4pQwN7m5EA4rSGL9ZsF2kiSa5gWOO7cG4gATH/2msu4AUeQfz28rJ0qCy4lSupy31pcKapTmgiYtk1dZ5z782ICw8MMDqia8OYGTHerKVjBwYkW3LswqiiOdiwUhFAgC7om9AnvFryk10lKXTarflYz5Yc1imTi7xlrLfZ2+h0LMmIQGBbUETtN6EyHbnH2tDvlhIg4UNepctFT2yaAZ5yVF1vraKmuzAXHzniGCoVTw+qvdrKIQOq8/eoOckDQtn0VqPdVAmkAEi5McvyTKNTUraU9yEIqnkGNcp9A6cFKEtRKsdRinas1orZH+fG7Dd5hK4n7kI6lQG3eM0PiVWa8o0SBpyO3FxW0eZTGn5TrrBUl1D72zU4TnTUci43uQWmqyVpKgRJZZ4q8xZXzk2
X-Exchange-RoutingPolicyChecked:
	Ld+5p/hzf/Ly/uUhM/H8rkF00TahbURNKRgVxOIyCbmi0FD5WtQPZ7k9ezE9/4r9yw8beB2407Vs9YsJl8fQr2FREgnCGu3o+qzTVeHVyPqWyMqoTBBIAazl5QuB4mN3RaxSKvRPkiUZX1kq/sqQ4SktK7pwPbHI3arwi0dEPT0Tw0OsfiQciA9OudIx5eKCeqGodHEzpL0iS16N26TtB6Z2KU5win76/YjF99FoTYQxCo75JA9Wl+FJk7Y/hSrMr7oS5tOtGs0nLzcXstDNBrT/LBjcro3g/h2PoXNcJetqaHykGGgmlTGWoquodOb3wEZMup3TDnzx1wKQsPN76g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 00:34:35.3217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c29c850-cd27-4a02-69e9-08deee9b7f2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7571
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX5D0+8gg3GoSh
 thZDImwuIBimFgEZz8GAIetxecZIihzlGEVCt8U6P8Tk1MX0i96VRirzMGuFKsWcgnup+j7b2YC
 gkRmIGH5BhenWdoalU3DyZq5G2BvfGk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX0kKeVJ+618wm
 TzZNuF0C+TibcXtGW4Pqr3zYpz6ptqi+lxeyB16T7NWxilvp54FnQ6kH364z122+HE6u9VrRipE
 J7XC5cALQtdGiSmdolrp3DlUrE2sl5VMJinsd/42DydURfnCNrLYsKHBeNzmoHo3VHE9p7HKmRX
 0WKnSE20mheGOx+HkeufZpLuwiAGn4id9yKENbPshp+zSQrimCBmz30u32P+pwyA81ILwtFqtSA
 887V1H2fc8AjpgbyCFi+Y6QSoO7JKnP8lwGSsw9ELOWoTbs91ix1ziwadulQuwsmCZ7i/IBy5aQ
 b5Vgv6kWnrg/7PknkiZqOzVsd5iLsd5Mwr5Jtnm7a7NnoLogVUJMIQAFbdgGZBjbK1DayU4Y3qt
 cimDE6FnnyPw9TyNuJkDMdCDOn8J8YWaDmeMQ9s2wXe4UKNJrZdP5fTfi+d1E2EID5Sx+N+lJrw
 WK4deK47fPcm2resMuw==
X-Authority-Analysis: v=2.4 cv=OP4XGyaB c=1 sm=1 tr=0 ts=6a6beda0 cx=c_pps
 a=xqAAW0zfUN0YSepx5EhcMA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=AiXEp2iUk68A:10
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=z2fpb8jrHNJBMQUMneMA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: et4zWdsNYrUFTUBTG6f02BIVkpY2979L
X-Proofpoint-ORIG-GUID: et4zWdsNYrUFTUBTG6f02BIVkpY2979L
Subject: RE:  Re: [PATCH v1] ASoC: tas2781: Optimize calibration to avoid full
 device reboot after calibration
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310002

Hi Brown

> On Fri, Jul 24, 2026 at 06:25:43PM +0800, Shenghao Ding wrote:
> > Some clients have specified a new requirement: complete device
> > restarts should be avoided after calibration. Only a hot boot of the
> > Smart Audio Amplifier is required.
>=20
> > +	/*
> > +	 * Set reloading-firmware flag after calibration, the flag will work
> > +	 * during next playback, then set to the program id after reloading
> > +	 * firmware.
> > +	 */
> > +	for (i =3D 0; i < priv->ndev; i++)
> > +		priv->tasdevice[i].cur_prog =3D -1;
> > +
>=20
> I'll apply this since this is preexisting, but it might be worth checking=
 the
> interaction with DAPM delayed powerdown (or indeed active streams).
> There's an element of user error here of course.

Thank you very much for your valuable feedback. I will forward all your com=
ments=20
directly to our customer side for full visibility.

