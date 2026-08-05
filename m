Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AFF3E6399;
	Wed,  5 Aug 2026 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944746; cv=fail; b=FH9ioM8Q1XW8vgmpi7x0fP4wJDiBCpDhmxEV7pagIif3rINglpu5Li3MchFkFYm7CswSLMk1qk6SHM6f7HmO8Jq2nJPcb657S4DrrLsxi+ft2FQoUtDU0gZO+w60xSqkRyAcHToU+cxEuUz5y7A/Ch9QSm9o0en9pZQQN64Xpzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944746; c=relaxed/simple;
	bh=jyRrydchslfLWNLHZcxqP/WcfWa3ZueZXAPRYXOszkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNUKOkuhftoJuvpMYwy4+KnGTtFlvHTo+g48evykwkZQPd35+TEP4LuqyEUvBdfz0HdjkUGzT79gOehWJZL+jLqpq2Zusns9Tpun4k5+xTG8d9W740HY2P3t6NIJSIKjEtMjnIgX6ZThllcD4tKIjdeoVYFg+Y9IL0yjwvt4V00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YEBKe9DY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=l6Js50QQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YEBKe9DY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="l6Js50QQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675EOLTe160173;
	Wed, 5 Aug 2026 10:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rQDDurDcjSYje2dU06
	5n2RYMW28rRY4jp7X2UNEp6Wc=; b=YEBKe9DYWZZVRumSqpxnKy6zwJwEvjq8p0
	wfxz8RRjuDVh4XPX/nl4nOAItse+Lz3yGe1/9hauifQzYdUfcxZuyTEqKdAjrUIP
	XUiyQNuxl/VzB16NVx8mA+Zf9iMNc0CQq4MgjmsSUgSUWKKE9Ie+0WjMAlA5jzij
	4wbTpch1TKDsX6B/6yvSxt8ex9KRvW0fEs8QlBmy7eQfelCOvCerxZSy6+nXY/LB
	bp1Lp8FabfSPc/fZs6wDEvotwnto1svl+8l35ktqct0BgfbAPqiSr+Nf8pm8jan6
	xzR/wkazJDEE/mn4Em8EBXdmHZpspVPPCiYOYA/czfMfQTxPuf2Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020083.outbound.protection.outlook.com [52.101.85.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vp21q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 10:45:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DG2x4KtOFuZQESv99kLO2e5EIPLWmYtcW/vH+I6KFOdbgAGDRkctJPvN67j+o+yfRtD+f+Tz0DQ+z8vgp2AGOx0GGieEqP/4bHNjgh/Of1GlnFbbSkaUNv+H7Ut/06yHUEt7SWZzWBd5l44U4AuzndjlvwqRnE9Z3xyw1wxvOug3dKO9yAbGY2/NrPv//NgLlGaZzQNGeJ0OnMUYVHD2aIJhvXCZQTq4PUTDfa66+T1VSfOI8aT5rzaMEhjgJ5B77nDE9UxfdMRA4k/8FfBzmpYMDS31rbJsS6YrM87B3PY2YtGgBIQr3H2Qzs36hZBOlzyHbiDWRiw0q7R9wRyniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQDDurDcjSYje2dU065n2RYMW28rRY4jp7X2UNEp6Wc=;
 b=uhNmqrxncwjRbQKYIhI/Bre+2k1VUyJ/Mc/T/ph0idKfsk2QeIZmTX8H/izAbA6IeoZRKKONZBhCRx0+1aY334u8NIXsUwytwWqrbeucysLGxx0civYF0DzbWgesjinGXhtmo4mwqZysUl8sJjsXTBhJzxn5+LIyKtgoq6ACAKr8Ab5v0vVZHnUYyGzy6FAVjv4taq+rJGYPoUgV202td2zYifsyDOlRNWsYbS36Mnu+b/65Oep/PQp5K/qiCeqQ8W+X6+EwRP1WXq8zavfNvcadXm566XRf4xzHAtdbBsKhM/SP5VkRfYyYcet5jwuck/W7nbLT7lne7mIAZ1H9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQDDurDcjSYje2dU065n2RYMW28rRY4jp7X2UNEp6Wc=;
 b=l6Js50QQoURL2Ldo6XSr2Mp1DDkNZsKbK+CBkTCPp2mUJrQ2Q/3p/YJp/m9fjKTjN9evUGyHh16Ts8xA6yVbC5aG1cFi7OMZecx+a13AWjLRjAoch4wZw/4saKnxBJuy9tS6SCWkEiZ8TIGagzBPfoo8FB27WKPtciQSqXzPZtw=
Received: from DS7P220CA0081.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::6) by
 CO1PR19MB4903.namprd19.prod.outlook.com (2603:10b6:303:d7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.19; Wed, 5 Aug 2026 15:45:15 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:259:cafe::41) by DS7P220CA0081.outlook.office365.com
 (2603:10b6:8:259::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 15:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 15:45:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1321E406544;
	Wed,  5 Aug 2026 15:45:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EC49782024C;
	Wed,  5 Aug 2026 15:45:12 +0000 (UTC)
Date: Wed, 5 Aug 2026 16:45:11 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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
Subject: Re: [RFC PATCH 3/8] ASoC: SDCA: expose class helpers with hw_ops for
 non-DisCo platforms
Message-ID: <anNah2Suf+Qb1rPL@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722234221.884765-4-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CO1PR19MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d082f4d-a726-4385-3cd7-08def3088a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|61400799027|376014|7416014|18002099003|16102099003|22082099003|11063799006|4143699003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CDb0hyg5e0Gkevgb/8ArxOm4gpNKtCeA+sB6A2JpkZTArQpiBNelMCpPm1JcXkgk5/KRrTzh1Pis8cbBXAT0jnoga/kr7Zbe7ELvPZrALk6Qlrh0K5ZQpIasA0n//TfGRKsKrCd9LlGV6LRI1bQojGjHWhUymIJZA5izPPltIEBMh+t/1mJTmYkFPqWdR2pWipHgICfwvwTkZaH4QurQ4ds3BgjvMDx3wFWI3mD7WfxSZYP2zLcYFaKDhVgOGT6bRKY8sfjfnrk8Gaou6Fr8uS+qDGyedZmIIafI+0hB/24vxxSdaaPNupj4+Ed5vPQNDQxQuaOr4z8nePKmSDOp9CaqMliQXDK2kcG1iw/tV6D6w79WaxkOT8o02l4AJKCVaVQhF2qLOCJT3fFKe8lvKDv6t+uyzJostwqVW8EyDYmqwBtqXwVWTy+zy2blA4zu47MzaXQ1km3syGjIM2ourSWE7Ph/EbzzlmaT4Dx4blSB6hEcMJnK3Vd7ROPVGf5TMT2vMAQHwIfKov0RtSekUOqW+vHc3nC9cOZFkPmssJwyBvRnzXsyBF4OZ/ke/KcIwuCl+cVdQpo5qsiPPQvpy41qH9UaFF4FI/WFnqxzxzMX0mdQhe0zIDjxohxQDGa6ytB1EK5+3K/LrOSpu8z9iTYwLLT60x079ChY8o4NvIz8iZxE/QE9PZgwCRuVFmzvrVkV5yoGL58O5wYUTQCxPg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(61400799027)(376014)(7416014)(18002099003)(16102099003)(22082099003)(11063799006)(4143699003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MMToeJoWWHOXjNsAh2PNGfPCWcjUQvKZQNZ8CCjkPXACbQoqD1BiZDoWID1kHt+d5st23TuU2quqelvXKr9v2PpF+TtuCiLqEC3NiIr78sTi3eXNrIyYnqpd63AdgZKh5i6fDBcYieZ2OsOadOinjjBwGe/KQ+eouvuEkXGBBYq6z5UWH6s+w86GhNs0PLCopcj6FoZ5shcmKh0VVcbV0P+9dd/NesT+4O8xw5ojMZwoWTPxcBhiZoBJaE0sMHbndpJPeIw6VtV7q7bdqo+GW2nLsEHd9IX5Z8VEFLfbMFyx/kx6YGeIMspWP46c4YRVvS9TTb+m3j/JHjF9aJkT6Pcq97M4/i9LkBF/2E1iWtZqMrArX+zgtiyS/DgyGOfgNBDT77+0OnKg/9cKyG1PHDxSb4nTgHZuy+HiJs0hLJS+Med97XtVsfHN/VmkSPZi
X-Exchange-RoutingPolicyChecked:
	ANE8VPX/sx04W9V+18vQFMJFx4T113OC+Xyfpw+oZ1mYHioqY2H+cwg4Xlg1K0AasKSMhJ5y9wg06vahb3jQcqje9rwAZ5/crLe9ycVQAyN5x75/y5QQpd7p5mF6tqwuhGtKTqNceADS0GWy2xkvZ7gV3Fw+DBSXP5k69pE+yuEdaxKD4VZ+mpUHEsr7qUooGRgMycSDCLP5r2STNrUJK2H0pBo+O6g2dwSOfRt+dhHieNDY8aAxOukA8Eqyt3/b4+EZNNLRbNKkjvJWX/YmxTvw9m6oRlzoWO8GVsQMYCN7q3vmChIpTCTzOGkf9VL++VogBpG8xfwnDUz5rTM/UA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:45:14.1237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d082f4d-a726-4385-3cd7-08def3088a98
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4903
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEyOCBTYWx0ZWRfX4t0Z6NnRHJMr
 U7p2AD27swz/DUG9m9M0o07qAVrw/Cu+UxytzMl48JvSf+ZLK0hIzlVI403lYmGrIhz6MsufLPh
 ilKcV/stt5B+xrKls9fZ4mlXChaV13g=
X-Proofpoint-GUID: K_so4pKevRg_JpMLSUY8nnAU_nIX3hQz
X-Proofpoint-ORIG-GUID: K_so4pKevRg_JpMLSUY8nnAU_nIX3hQz
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a735a8e cx=c_pps
 a=anORMkbxiaoIRYctk5qcAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=x6KTGziLudCiZeGc2SwA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEyOCBTYWx0ZWRfX4CZA5QwIqj6O
 Ld8/W4F06r1rUga9Z4jcNSpQzQXCzkOEy9vh2gIQx0zYpsYhaH64xQBXaGhYoS8r4wksGs8LATi
 4hjxCAO2Cw2K5ymANeHP+ksT9uhHqd22xvbAlOn+4JcXEIxvIkRR/2HW3PyR+iiIGBde4YhU9E8
 oKBhe2p44GTjSj9pQ+OOcbt6dQnLLeuE4T1ByXcj59VAbTarrRP2K85vIU5pzBNJXJaxpL7p/Yh
 RaM3TKI6LtQRPpTCgSw20LlB0REuBzvDwqzsp9quQXcVFSI9+j7CS/xbK5umgLIA/JNtUYLU+8z
 T9WUVTTHIMnBvfwepllpledp75uPECmEutf2zJ12xemnLIsAdxHkgITDAczlvvWLYS7kv8d85pg
 TeYVnEGQ/DYhZNcsA4PQCHOc8Yzf71ynsJ2USSwSX6kJR6F24UJv6nfb4gSFM+dSOQzMy4jAj5j
 f78CEedybghvWODC8TQ==
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 23, 2026 at 12:42:13AM +0100, Srinivas Kandagatla wrote:
> On ARM/DT platforms without ACPI/DisCo, sdca_lookup_functions() is a
> no-op and num_functions stays 0.  Introduce struct sdca_class_hw_ops
> with hw_init and get_function_data callbacks so codec drivers can
> supply pre-populated sdca_function_data and toggle supplies/reset at
> probe time.
> 
> Convert the class SoundWire probe into an exported library helper
> sdca_class_probe(sdw, hw_ops) and export sdca_class_read_prop() and
> sdca_class_pm_ops.  Codec-specific SoundWire drivers can register their
> own sdw_driver and call these helpers from their probe.  The built-in
> class_sdw_driver stays for generic SDCA parts that need no per-device
> quirks (hw_ops = NULL).
> 
> For non-DisCo boots, the class helper injects the driver-supplied
> function descriptors into sdca_device_data so sdca_dev_register_functions()
> can create the auxiliary devices, and the auxiliary function driver uses
> get_function_data() as a fallback source of per-entity data when the
> firmware node is absent.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
> -static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
> +/**
> + * sdca_class_probe - SDCA class SoundWire slave probe helper
> + * @sdw: SoundWire slave
> + * @hw_ops: optional device-specific hw_ops (may be NULL for pure-generic
> + *          SDCA parts that need no quirks)
> + *
> + * Exported so codec-specific SoundWire drivers can call this from their
> + * own sdw_driver.probe.  For codecs with quirks, pass the codec's
> + * sdca_class_hw_ops so hw_init, DT function injection, and PDE hooks
> + * are wired up.  For pure-generic SDCA parts (used by the built-in
> + * class_sdw_driver in this file), pass NULL.
> + */
> +int sdca_class_probe(struct sdw_slave *sdw,
> +		     const struct sdca_class_hw_ops *hw_ops)

If we end up going down this route quite tempted to pass the
hw_ops through the driver_data in the sdw_device_id. But not
totally certain on that.

>  {
>  	struct device *dev = &sdw->dev;
> +	struct sdca_device_data *data = &sdw->sdca_data;
>  	struct regmap_config *dev_config;
>  	struct sdca_class_drv *drv;
>  	int ret;
> @@ -156,11 +179,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
>  
>  	drv->dev = dev;
>  	drv->sdw = sdw;
> +	drv->hw_ops = hw_ops;
>  	mutex_init(&drv->regmap_lock);
>  	mutex_init(&drv->init_lock);
>  
>  	dev_set_drvdata(drv->dev, drv);
>  
> +	/*
> +	 * On ARM platforms without ACPI/DisCo tables, sdca_lookup_functions()
> +	 * is a no-op and num_functions stays 0. Inject the function descriptors
> +	 * from the device-specific static data so sdca_dev_register_functions()
> +	 * can create the auxiliary devices.
> +	 */
> +	if (data->num_functions == 0 && hw_ops && hw_ops->get_function_data) {
> +		struct sdca_function_data *fdata;
> +		unsigned int num = 0;
> +		unsigned int i;
> +
> +		fdata = hw_ops->get_function_data(&num);
> +		if (!fdata || num == 0 || num > SDCA_MAX_FUNCTION_COUNT)
> +			return -EINVAL;
> +
> +		for (i = 0; i < num; i++) {
> +			if (!fdata[i].desc)
> +				return -EINVAL;
> +			data->function[i].type = fdata[i].desc->type;
> +			data->function[i].adr  = fdata[i].desc->adr;
> +			data->function[i].name = fdata[i].desc->name;
> +			data->function[i].node = NULL;

Probably simpler to just populate this directly from your drivers
probe function, seems odd to call this in both the class and the
function drivers, limits how it has to work.

> -	ret = sdca_parse_function(dev, core->sdw, drv->function);
> -	if (ret)
> -		return ret;
> +	if (drv->function->desc->node) {
> +		ret = sdca_parse_function(dev, core->sdw, drv->function);
> +		if (ret)
> +			return ret;
> +	} else if (core->hw_ops && core->hw_ops->get_function_data) {
> +		/*
> +		 * No DisCo/ACPI firmware node available (e.g. DT/ARM platform).
> +		 * Use pre-populated static function data supplied by the
> +		 * device-specific hw_ops instead of sdca_parse_function().
> +		 * The callback returns an array of function_data entries;
> +		 * pick the one matching this auxdev's function type.
> +		 */
> +		struct sdca_function_data *fdata;
> +		unsigned int num = 0;
> +		unsigned int i;
> +
> +		fdata = core->hw_ops->get_function_data(&num);
> +		if (!fdata || num == 0)
> +			return -EINVAL;
> +
> +		for (i = 0; i < num; i++) {
> +			if (fdata[i].desc &&
> +			    fdata[i].desc->type == sdev->function.desc->type) {
> +				*drv->function = fdata[i];
> +				drv->function->desc = sdev->function.desc;
> +				break;
> +			}
> +		}

Would be much nicer to have the callback directly populate the
function data, similar to how sdca_parse_function works.

Thanks,
Charles
