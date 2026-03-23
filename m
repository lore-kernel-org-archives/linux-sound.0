Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5F31F996;
	Mon, 23 Mar 2026 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259883; cv=fail; b=iRd1fure6dSB1y9Uc14pTXIt+p4oZ20dxp9UIRybChLpjhCQ3vX4p7ZaAlLQj8BhA5QAV6PbWhsblJr8yW6ZzIEzIWDKv9YK3lSNxjlLch+/59rxOlrxorNNe42E/e91r1c/oET7eusAVDOz2ZNWBxzbcElpPaw5RQ7uya50LJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259883; c=relaxed/simple;
	bh=f15Ep9vgSAlgVS3mWdxC2VDGpBskQb9PBKSzrl99bVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfbEwa0lxP6OoNXKCQqtUdTnMB94Y4C3Rc94eLnH1Lx0Wkt9P7hM0APEADjh72LUw4ZL5xfI0p8LT6GhEbMVBSvKN6AYGkfnOldK/Ua7ljTirJWL7cOdmU3zQzF2J9YrmUb9+rrOzv6XSqmEBzA64f61fUNK7logiK1Ry8gV0EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Wkf/MOv4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FxdM4Bm+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Wkf/MOv4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FxdM4Bm+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5nV79376500;
	Mon, 23 Mar 2026 04:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ptHKMa9Q9Ap12ADd6Q3hk/srfb/+6IdC83OnfImA5/I=; b=
	Wkf/MOv4OHoTbWoU0VeYdw2AmDHFDJoiwVg4OMjyHeaqvdHG8L47nuyEEYWmx/Ea
	P1EcbxA15338GwOQH8uQS7d3i6SWqK6WFa0MNH+3tHIfBS0tLMCEU0iWDwJgMelG
	UDE6nMROdc3Pd6oAscBOpSimeSjuJZpebIgr6z6MdZykwg3mOcP6thxcgeE0EHP1
	4hfxEJ1pGolIQz004tEFrX3UndjcWsAkpGw9hB8lm5T0e9aXpHRwp+uIzwIVmwj4
	KD1xkzzBGaPEBkFJXQZYY6kC47MYHh5BFi3Ynr9uwweshOcuLMZfpwBNLZafeVwd
	ua5CBGpgPNaoX1NN1GlfpA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023127.outbound.protection.outlook.com [40.93.201.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d1rqxshv6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 04:57:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsDKbl+Hc6sdjqf08LTAn2UZUkK4d6JedcFSveEFcoLpGFE5qH5lcUlIK2Yp35yqZwHyWJt91CimMBzNaV5wV41ghqis3gummospbdp+r8N069QVVMxoXdLFjLEd1gbyPDnf5/dCZ8MC2JHDMpVWRZw14+bOLjreiHgXo6WrUwcQR4HvX7E/WMxgRqUG0L0zML6TdSy/bYMiR31RwlT1YgmQU4/MXtIY8W2ywRgKo/Fufr+cKlSpMNquKSqdxaeAgNshlFewZ+YHZvaR3f2PcRynvkAblYMhkZGRL7QX5b6fcx+V2HSdM9wiJlswTJxKRwXcGr1YVxH4H5ejjnelKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptHKMa9Q9Ap12ADd6Q3hk/srfb/+6IdC83OnfImA5/I=;
 b=IYVlkpa7cCAPNG4KbqQyuf2XnZw7ARPEQ/GWQVYdeLVN2P7HryQ5HbFH5Sb5Vb4Hv5xyiNUPmlqMldzjj3tuuR1Hvfpg3Tp6PgT6hHItuAo97eD/ETfcsTJthX6nhhku4z9rLjfZbfHS+xrq9V1QGzOi5Gi8mtZ9D+RqN9Zgr3RhvzmSK7QzgatvIciyflyNfdyh0I6PgOMXtkfGY6eHZV81l3T+sWoIU9gt7poPT/2Fa7kp6u06uHnlzr/sj47VzRAG/YraVTm0Qgy644+Hxqkj+jYqD75QkTbiNmKLfqYaujxCGV74lFZTTdMVLz27YBg8KRZy1tiS3PANj40u5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptHKMa9Q9Ap12ADd6Q3hk/srfb/+6IdC83OnfImA5/I=;
 b=FxdM4Bm+SvGBR6bHm27vDW1IO3JbxTX8fn0FG05RRkwtejgk0+1WaAbZw480+KDAhs6HL4lK852zt2CAft/qstrTXn8RUNgTkWdqdNG3Ct0jKVwgIYfxZ3l+7IMGGLm/t6cfoS12kiv4H4zfqAbNMwC0FuY1dZoyZUBQIxS5Tm4=
Received: from CH3P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::8)
 by BY3PR19MB5122.namprd19.prod.outlook.com (2603:10b6:a03:365::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 09:57:17 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::2f) by CH3P221CA0016.outlook.office365.com
 (2603:10b6:610:1e7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 09:57:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Mon, 23 Mar 2026 09:57:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9D2A540654A;
	Mon, 23 Mar 2026 09:57:15 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 83EE3820247;
	Mon, 23 Mar 2026 09:57:15 +0000 (UTC)
Message-ID: <bfc625a0-02c6-4fff-9e23-02657aa24238@opensource.cirrus.com>
Date: Mon, 23 Mar 2026 09:57:15 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: wm_adsp: select CONFIG_SND_SOC_WM_ADSP from all
 users
To: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Zhang Yi <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260320151752.3439218-1-arnd@kernel.org>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260320151752.3439218-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|BY3PR19MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fd6137-09b7-4ce5-ffed-08de88c29107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|7416014|7053199007|18002099003|56012099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WFYxJgJEQjATwq1tt89HKwFcBmVmCiAMruvWoLfD4LMdVd1CFxfUzfBEv+TbJY3/W5X2ZGqQCwnJoF+xl7uJzoUv1hQoX5OBccdAAX6Mdx7d9DJKgRP6C1njdXXTB7/NcwO10KSlyRAhcKmzfBArcQtghQ8FTW8vaw9OaPR29TlTmwG7iZcq94SQF8pnN8EjpQRDLt9KC/zhoB7ePiKuMT47BZXn6JZ6N46S+8A3o5e/t6UuhYlTybX46IDshRfeHOGtBs1jLf31FaVqmxViEh6iPdBX96PFdiulguYB1u0VV5UzJEGtobKiTc8/CylmZAWxz+OUGiwe0glEKNmRpXlX+wUeo/zfto8cO+SQz2e6xZDwcDwsr+74663rmyAr/t+3bVd9jdYcltmZRq4lj5yioFWXH+f3diDXEqIW7TjfpscbgKL0I0iKbAU0SsM84YDlSp+kcIEYDEEKdnQS68kxfGNeQVazhVVNdqVjvXWtgxmCkCBXVAqYvb3+WVGCVqdpCOg8KaVm9g7c/MszT9fTjPXplFcVDLVGIurXHyUBSaSw99nb95HYM7coeB+jP9BVzYCSjLAJqVR6RhNLiU0tuKHji9IPG8Vg/p6PYMEt+vA637oeqy+6q19aXSqE4Z6lYByPUQHxpLSBjAAvPqKMhz4fN1SqfkPWpx4HAoGmrcr4+WBgJ69K2yKtO/rUcvj/t5fvkok2igWmcIX2UYKDyyxRIozDkZhSKdz5Ft6fmBdUwJ/r0RyjMNaoEehH1g+0AfBsEmeRn5aMb0+knQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(7416014)(7053199007)(18002099003)(56012099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8m/r3uT9vWhAg0FMS+n/U2edE/jeGka/XF/eOj35etkdXcUTURBUYG0kmA1cqOEbRIRO3cAD4SZSaSZROHdvIpYJQFF2bXoRExW74s9bs2rXZ0w29Bb0/WKA3ot+clirNlWThuw17VnYuTZRD8OaYb0DIh9p5tbiaZTifrDb/X7RCl7KOBLbbpNX+PHTmbg6X/abpcnzb3BAkPeLDahf9dqQQvjMOPH2dHUAelMrm8wfu7dJrJjo9L3Iv88YghJQDkqhm/Lf3SmYOnijIJfjntD/07UFUITNX1VAL5BV2Q55JBdYo8eEF63iaamcx6tSASYdhLxtOiY5BAOxU1OyJN8VDO9KlM/jkD0KcsCQzdsycJejYV2JhopcdY6b+H+7vua8i70wkayRRalgOY2AAHdwTo7cGHTk3/g1x72uevKOBxZ9efVRuOehyruQSrDV
X-Exchange-RoutingPolicyChecked:
	gnHYWjql70qVlmEyDjXRKDiG8dc93UiJL2Gf1fQj//3l+Ylp7i7T+IMzFqjp/RXg164T1JRSDnRE4BMGiekHOdPlfOpS8b7LnKLOAMNwax8cojcgZ/HVEmxGlGMQ+Q9wdF6yUn5B7IqaNd8eQm0pTHDbEwiHO/c6uachrTF4E7vuuviOlzFOELEtAM8RWNAlwiI10hQYjnLycbDn7ShUCSfsxt9eXNC3JF/uIeErbZTeHMQVtxj7KeRpKHXKzJ/5S9h8QQq+p9i5aMwTTcNwboluS9pEWOrImdomZ3zxzKDiREj9acCGVsjw8EEwlLBxxnLD+ndbRGqcm6J1sFAY+w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:57:16.9082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fd6137-09b7-4ce5-ffed-08de88c29107
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5122
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX7EvyF0kOynah
 hdoXyvgnDAK3capLbp5iB8x1/XufDqQ4opLaZZsaj+EQK48O+A3cOXPZsFYeVE3tAtGoIT97B8P
 +5RKrmNYhR/gUe0p8nHqf9SLcYTzUVYw3ubB/9Eleqe5CMbgUJvfbNV08I/KxyWXK59qWbdQGKy
 aSDPIVCli32bytvX6iU833SFGai4yJkOzJMrX3abfj4NhgtxkZHjGZgmLTYX5lvPtTOxS05k8e6
 T0FGlOCLbLhxnXJzKdQFkojNYFYxzmDbyF5ghtX9IZU5UIBW+ogTLFd3VU6wdwpCoT82RXAwGfl
 xFTqxfeR4ocT8qwur5Qk4sPugFgnsU32FwpwwGlzieOwFxgs9Aic29nmQS3z2PDPLWv8867MUrb
 g/AQHSNWSyRxnnsCyHQNFBvcXXQ8FFQTpYUtksSIBfPMA5JSMue3UTQi1XW0vFyWMw0zNxVfINW
 T4LKDwwJf+x7YJLEfzA==
X-Authority-Analysis: v=2.4 cv=DKiCIiNb c=1 sm=1 tr=0 ts=69c10e81 cx=c_pps
 a=5ID28ryD/xQJfY93dtjS9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=MrsBIhBmvNk5D7XB_TEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1otdVPzQ4UmplGJh-01YFhyXECq-LQSZ
X-Proofpoint-GUID: 1otdVPzQ4UmplGJh-01YFhyXECq-LQSZ
X-Proofpoint-Spam-Reason: safe

On 20/03/2026 3:17 pm, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The addition of the kunit test made it possible to enable the WM_ADSP
> driver even when there are no users. However, an unintended side-effect
> was that it is also possible to turn it off when it is actually required,
> leading to build failures:

Sorry, I never thought of people intentionally disabling it just
because they can in a KUnit build.

> Reverse the logic to replace the ununual list of 'default y if ....' with
> the regular 'select' that do the same thing but prevent it from being
> disabled if that would break the build.

The unusual defaulting is because old kernels didn't support nested
selects. So when the machine driver selected the codec driver, any
selects in the codec driver would be ignored. The defaults were a
workaround.

> 
> Fixes: bf2d44d07de7 ("ASoC: wm_adsp: Add kunit test for firmware file search")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

