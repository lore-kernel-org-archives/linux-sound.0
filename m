Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2130F3EC2E6;
	Mon,  6 Jul 2026 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326634; cv=fail; b=HwgV6ksuejGtAE/Nmrunat9lCNJ131+WMZJwhr/Df79pGFXepWPPA2lJNYt4FCp/STiZsrEfirxfZrZf7qLicWRgC3YZTHRAYfLLOWQTdxRfhEDdTUVQ9C8rUk9Hx6J5HgUntPgi+fnXUJC10z4R9A23wkoM+ctDvStFvu+HdCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326634; c=relaxed/simple;
	bh=EIaQnel+Vi4adkbQKrUybH4crqSzKaPr2KEuumxBWOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPB09GDgqerthceY5icFfLtEcOGv8egWgTWOTXRiJhPQfbkCfs6/bBLE4nfYQEP0FkytS2uHkMkCuVM441PUBClWnG5BYZKdtGR53+7GetuKZ4q+m+a1YpPyQnXcb7BeAdfieniokpi02aBTe2b9ST4zee0cmJX5ShHp2tsrTCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ug92nUoD; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vV2Rc0ZV reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ug92nUoD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vV2Rc0ZV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6666TAMi1108462;
	Mon, 6 Jul 2026 03:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pEGA8sqEQmpr7ce475w53LZXTYzccOgS3tca+HjTAm8=; b=
	Ug92nUoDn8wqyDQR/4GWkj10R5cwkIwAGYMQrVpoKNaQMYCB6rR+fu/As1uc/oXn
	W1jCTEGyRhE98kGbif6YR5XaS7WSypkwgvpOyA22yv51nG7cSfQ3kZIa7MWapOr/
	b3YOVK5mWKLi6d9H0RIJ5TdXVCQHeNzrnsPVuEkOsoxAbqBY6692xBb1/7xvmP9m
	Tex37tWCLWgPDUML7ErIYKLkAGYH4zJVPdUwHszbkRO7a94tQH6mlIjGGxvk8uRl
	qRuBaKrEHAQ7PMBr5ecFt8e0Nouucgt5OMOKCAV+6kAb3QSy12qrcoW9aCbsEAb1
	bv+T+V68JCNXgW4eOuzr2g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021122.outbound.protection.outlook.com [52.101.52.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjj1yj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 03:29:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T54CHcZ+piSfcJQjpgXvMcjG7Eq1SLXa6yd44yu+dBQ2kSdWz77Ojs09vXxOT4hYX3oFizRLXzMzOu05vflFPyKliMU6lJGbqrYWJkfXDR3sFTP5QzquePImQytAipXBSwX8N2HF9p2BiFP8+Eb1LH03BB565qhNn8yAAoWxpt++rxt60Yl/tmeW5nz9RZDvzkB74NNe2Jl8DiM6Nd9whXLaOl6X4DJKZllLI8Nx2RFZyOBPW6SlXXy1TNwy8KxGqXeT918uPooG6v8buGMFivzzZySTmQbWJw+Llob8mR4CiFPiDRq8bUaKzblBbQDaDq+xIzSWnhXgajT2KpSkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd8pbdGYHeOsaltoQpMgwfrZAkKLezxglNYqROm5IhI=;
 b=sHoaCxYNcvbSlSRVZL28VDhRb2vQqVRNixErHUKYY3Is9KQ7MIQXLPJ6bE0qWkdxD46UmAuSuy/nVP5FhmSyllhq5VeYWU/3bm7IQcZGtfDjRVHgAUYPP4imbetRuj1h0+BTm5BzfozuTdfaM6mFzDzADXpZKwolOGkzWJAsfs99SZ+HmM7qivUmmbAG0AmpGwjpi8BFa3kIyd4C9i+1aRLohRhivBXdQV05FyT65cJUNz5A6vio1vZiepLecSplQl1oO9XoEDjEviT35kY74qRPKMLkr2TY7VIlDI1Fze8ZpIbDo013LbLf6Qsao9CpV0zmrm9Eg5IJPWrof96IBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd8pbdGYHeOsaltoQpMgwfrZAkKLezxglNYqROm5IhI=;
 b=vV2Rc0ZVakNDvgI+GlQHBBL8g05/mmoSVCNg0WV94hl4MG83Wg4AyEMQ/FOp9eBE3YL63AD8iovdsbzhZrCkphj13EZ4UlOSuDROzFa3AqPOHTIwgeJINzo61lYhFv3m0sa1kyh+49aMwkoygJAigUTrQE0SdD0/g990+yty530=
Received: from SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::27)
 by BLAPR19MB4420.namprd19.prod.outlook.com (2603:10b6:208:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 08:29:43 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::6a) by SJ0P220CA0017.outlook.office365.com
 (2603:10b6:a03:41b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 08:29:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 08:29:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CF759406541;
	Mon,  6 Jul 2026 08:29:40 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A56B2820244;
	Mon,  6 Jul 2026 08:29:40 +0000 (UTC)
Date: Mon, 6 Jul 2026 09:29:39 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/3] mfd: Initialize spi_device_id arrays using member
 names
Message-ID: <aktnc2e9rIzG4lo4@opensource.cirrus.com>
References: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
 <f83c8292e7e3ba9425792591fb136d4ae1468215.1783003256.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f83c8292e7e3ba9425792591fb136d4ae1468215.1783003256.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|BLAPR19MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: 051c5700-d149-41a5-5c17-08dedb38bab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|61400799027|22082099003|18002099003|16102099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZulTDJmnJThYSVKVCcU6JfT2S3InoniS1qp837lxUGhDdhZyrHB0/GOU9M1YH3qCCGLZ4LANJ36dpkLRvLxkBgefxKUXtBOgy1mDowUEg0BK+DQTAkp4nzExzNn7nKFSIiPs8akBLtGLf2bj+HV90DAVpFNXephbRSueqIFgJBE5XXpynDxFHnBImmH3+xSxiQ0xR+cUzuW5iSx9K44cEhHsJXWNOpKGQyZWG+/Ru7LAELbWioWoeNt0biBf4oFBAKFGzcfInx0BSFSfReAHp72SXdLjTWSUiyVEock+ubRalhTngum1cZcB1rJrkyYuFEZsA3+upGse/3I2LXk8FqJnVu3GpElZWv1rr0LLGTcXwrkMMpr0Hbl1NMvldz07gOBVSCYhsphERbIjJ+YKctl04t+CC+GgqVf/zOksKdHlmSiZLWyBQr39FE6ume3MK4GJfmjnK0Ct1WwEw3OTYMnKuoZ79HahfgsqRcnwNsWCkdYTQlKtNnUpW0IxALT2ZRdh4KQhmSuf/oxIfbWJBB/e1EKj5ZuhHEYjjS32VtoRyL59hV/q8VNR9qtQImO+9ySOwKVkPLlrF1gSzO4D5h7HvcsPXt2P6co5qNmtEvvCjKy0/lDd1cNjgxaWUcGoLsu2b3rUbTnb3nUKJrla9WsoSVN5qOyLqmAPwGgZIQUr0AUjnaB8+rrktnc+R1TZ+D2A1ECpylqcBH63mvNZ7Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(61400799027)(22082099003)(18002099003)(16102099003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+Orm3ZAQfaMUsPgMQGgjoBfXmdUFWgK1ebl1FIWqXAcEgIeOU3KqVyq8YUjxOMSzHD8PWDM9cOgOgetVOTCr9ehdDew+J5/o90qlM644IsjnmQNM1jkd0ttB4kK4/hCt3+2NMXPQxh7qqvOqpU7cwloxwkGxYEgI94/droJoTSWWbBc1BHQHcLeGzk6XujvzdBqqbFlrk6cSNxfUnpVMqT8iZTl7hpi7XSkrACy95MRCyEstZeAa5bAZMmcj9cE3xziq5j1RQNxHJ7tYvkfNxPXPygbkOzgXSYfTKVrqhWRkwOXv2wl4+E4/4+1KxKg1ak5lfRERXzD+aVVbPX8uORQBfxKIkCTl7C7L4lAJirCXeXs+15x8BATbtkeVGezdgt2fE7CUHr/Y+IO651GcORgxzGw4C2OgrwKs6DzNla3za6NwRzheq++L6UL5ofFX
X-Exchange-RoutingPolicyChecked:
	XMgNMAD5uAJUdXrsz83vqyPTttgOgAakwXGdWVzE0KmL8XLPGyBFA24QjorChYn/niAMLaH0GicDUI961Q8jaElRw0hPtthuSl15xPoBz9pw5bO8FgrG8vdzQzb1MJKeHwpOEqn85Ct9Btqc7PEWxMViZAUCycR3eq5+s4MIKdmul2NuL1G64qbnYs1RUf1VPYQMdoAzE83RJPjvCT6L1t46MmyNwhjRhCc6geDEG+L5s4jrSErCyGIXelNS6B6V6njD3VlVzIo0/cHmyqcSGkyVnNK+Li+iBQ7JcGoim9hAKFsTt6AdieEYCcYWhKfB6UxpSCt1q8VNVt7djKaNhw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 08:29:42.7261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 051c5700-d149-41a5-5c17-08dedb38bab8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4420
X-Proofpoint-ORIG-GUID: 1Fs3NGouqAPotpPZf9nF3-4xqed3Bb0e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NCBTYWx0ZWRfX7/UyWIxn2zbA
 +lBJte4QdJIJgL9LeF0ajCPfx2YIpYRYjDqFk0ZyI0UADY42ob4qu2rEKLRNyqxTM0hbGWW5cNe
 7J6kXX02ZAio36c0nZXYWdS5zhbVrzw=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4b677b cx=c_pps
 a=83jsKCSeZiZisq1MDa3xoA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=3eKTm6C_KWxbsUWaNMQA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NCBTYWx0ZWRfXxTdXH7Z/Oz8L
 vq37QcCrA5nfROYVB4rmDcQSA2HkFHfQToNnQDSjxlgDQtk2dq+LRbqgC19jfs1U7MT8E6Jl/pH
 AVxfFVno5FJA4GwFYJX08LkMcUYMCw5hI3F1KkXa31tz/hlhCxdI9YzGVE1/gvIoveZLqqYukZK
 Q8otPmzT52aSJ+Sr9RyHgD3K7t4yUKgdWFcNSm5yWgmTXR6LJLSBI0/QUvTt9mO8+9nFRlwWAz+
 XVCFewlqsLTH9O0uTurZT9oRGaM5FqtourE5L+Ca16C3RgBlPi95jEsMmBQWpzvhI2kw5FN+8Ou
 lH6ojreJTBYlEDy1nDP+D23dhjpp8oZogoRB0lLsV6wE28bR+vQiYEBdlZT+s/7ROE0xEm8oU6G
 WmfO+ADiUtqhqNtx/78qLca8Y+GEWI075BYWtKL6YkDmAQqdb9M/p3iQ79m9U+JUY/NLsygY4dM
 7Cm+s672/0Ssyn40NNg==
X-Proofpoint-GUID: 1Fs3NGouqAPotpPZf9nF3-4xqed3Bb0e
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 02, 2026 at 04:53:40PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> spi_device_id that replaces .driver_data by an anonymous union.
> 
> Also adapt spacing and usage of commas to the most common style.
> 
> This patch doesn't modify the compiled array, only its representation
> in source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

Cirrus/Wolfson bits all look good to me:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
