Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71983F4DF8
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 10:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964178; cv=fail; b=MCs/M3ROhzcsEI/4dnNtaIth9m/EreP7wXx4YYCvW4I0xMhx0MVIlJZ87glnUmMJn59ErOrWgCl2JXRsgWw64RuxKmtpVoBJqKO3Ybgi7dV5zH9M4NYznwX8IXSVB8WOS0MYc3U4FYgBKtI2ZSB4B1fVwboP70wXKI8Dn8XLY/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964178; c=relaxed/simple;
	bh=hkF32oHInefAwAMM4cCszm562axxIw9f+cqX5QVuXOo=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=smy3GYYQmMhFJ6KsEVSz00rJusxU2/IpLdOQXIeyBdYNIziYwc3EabhKMh8HdnzeHWad48x1iLG1mees6lAqOkz91VeGMhHEDmznNukwuRMu8RKvwkDcJJVFvaG20JgekMd3WK7NoYQP2t/Yju7qcmIk7LPUboPBmCGg3hf9BvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NDihhkUF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=i7Hca+yh; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NDihhkUF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="i7Hca+yh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H6GJox3592048;
	Mon, 17 Aug 2026 05:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=YX4rgTk3cXFQEn2ayUawKUwT4BXgzmW4o3Rjwlqycqk=; b=
	NDihhkUFa4LqLDChLbk0DcisIfgH3B0jrKVGu7RbCxaa86P9GqdxqvnyMdOp47oC
	w8ZHIm0XIhgbHtozzpK9BmGTJyZNGwlk3NWoTOiD2b48O5sgHoNnfDjeJ+9AET0b
	ZwLsOxS/Bm6TJpGAga8koU09esUuXpxk1p37qzNNx7LiUf1EsOU1XpopyKouGt1g
	4D1E2J63BcAzAgBRFCNjxbua+nlcAoRYKWI7SIqVOV8k+ziRFh6kRJCu2j48z0Zs
	kaKYUb5wjcx4DT6Hw/bv0IhCrWAoRercK2PVwOn361O/YiCJRnzjG0UMHrw1fmDF
	1teo2eYodUn1n8mvkW3N7Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023078.outbound.protection.outlook.com [40.93.201.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g2mhet1cb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2026 05:55:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCCrNQcjkSrhm2G88Jq++hK4mb+Fysg9+lzw7lnUABUH6nTrL7vqpZxV8DOBNEYIdOFtN+kLGzwwHVGFv8Yod1G2lfUfPXkZbCNKzqMv6M6pTPJhq/cq+32vWSQnOCeDkM53W7dneROvgWOcmGWyxEZKSihdU6HJiTOOZpR1A9klfPSkeR6U4nmqSx+eO2A6dIpFRy/PLOsm09Jqqg5lSdkzIElSRmxKXWZXOvXecE5NmgeSrDptbqeK9O57XflCcXeFF1v6/Kl/QRAIrrylCIrtG5HDtvj3RyZnZul0ZoSr2r82r2gMp1YH1c/QrLTZ/acIWqun3QzooOsw6R9+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YX4rgTk3cXFQEn2ayUawKUwT4BXgzmW4o3Rjwlqycqk=;
 b=rTgNaLvtF+oVWXc8ncgzn26HK+/J1hbRtJWdYXLT24pGcT1ebs+95PBBnHmmd9H/QlkhqtH3Klm3r4umweLe4jbh0nK6bIXzTN6jXgetiLrf8h/bbzZRqjOfXdx5zPsvs25t0SXjBMg8t8ovKBYt1jfEItMCCNW/B1vHOJYs5u6XCDCX6550J3qHytF14kLyZcNuaTab6QJv5BYauIPglWBDFR7KJ69IACZ13NpXQtUZXluqEbdoCj6nHnn7GqvmrZWb/+0RNwq8h8lsBJQ8Cfb2xXsDIEStQwdUSMqO+Fj57ZUbx/1T9Q+g7FgSyaGpyp/7SJVKRq87PP/Osb63+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YX4rgTk3cXFQEn2ayUawKUwT4BXgzmW4o3Rjwlqycqk=;
 b=i7Hca+yhPIYRLEjnIl/rOqophpvdgUshCj5l/BmfbLhnaQSrka/P727sQVNQAopKdadhauzTWSb3PwIwmP1WbRSkigB6elv+NUb7MNcPh/1ciLdEz5qS4oeanza+FTqbct+iHKzUKfjUecytK19H5KdBiXkL3g3mkD6RAKOQCB8=
Received: from BL1P223CA0034.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::16)
 by PH3PPF4790EE4AF.namprd19.prod.outlook.com (2603:10b6:518:1::c1a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:55:42 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::2f) by BL1P223CA0034.outlook.office365.com
 (2603:10b6:208:5b6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 10:55:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 10:55:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7818D406540;
	Mon, 17 Aug 2026 10:55:39 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 48AC2820247;
	Mon, 17 Aug 2026 10:55:39 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Gemayel Lira'" <gemayellira@gmail.com>, <linux-sound@vger.kernel.org>,
        "'Takashi Iwai'" <tiwai@suse.de>, "'Jaroslav Kysela'" <perex@perex.cz>
Cc: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
References: <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com> <CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com>
In-Reply-To: <CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com>
Subject: RE: [PATCH v2] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when ACPI leaves GPIO1 unused
Date: Mon, 17 Aug 2026 11:55:38 +0100
Message-ID: <000301dd2e36$f0cc5ea0$d2651be0$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQI0JzVTOiqtde3ISIDmPSzuMFxPwwD4xCt7texX7NA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH3PPF4790EE4AF:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4daf4b-51db-42e8-dab6-08defc4e1441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|376014|36860700016|13003099007|6133799003|18002099003|22082099003|16102099003|3023799007|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Ts93vzytoFnt8nBtLzAicx0vNuKAGczmrEZmJtez/NGvrNP6J3l06A0N2BWpqHGtJgXAuSUbnnwMTtZMGJSPO88ym2DA4/8rxR2U7L71EPbFjvZ5RJsZiQIYRJ0U+bxM2qQ/qIySyaj0akBVMvcXwPAnauxSntze+Nc+85HynxLFe5FSCclIv6Nbsb7SWrnJ4RMj8x1lVN1kJ7M9flJE1RbI5lNhKESUTqDtMSeCi0KwTJDp/WVWvEF+v8776qkzIwoV629V3HUPfJjCEqLzZLaQlPo1SGx1hiaao+lSY8YM4gTMLoKTgq33bbjWdQaeI0SEqk5IK+BD47GMmtWt+KgffyU9kkA+zXGH2zk39Fo1ISabjHqltFQiSHSLnl7rNn+LwbY0wxmNmFw3SXtkQ/xGCZdLJDzYqLJ4YotzvYk2Xw0dXYuD5g85BaoJshoGdW8k4l06PSSw5AZX/ehsxpKJMYmgSu7o3xB6YYaGp4t1BQWYIyS19iw/3YCBjdgkXLgmiPB0slhmOJFbRkxpNJMiA/MqhgE3eyjSDGkcXm5RNe2jfmLOxW7uYBw9f/8X4ZTYQz9idqEJcKtnjA66ax+XFw31jAsjgQUxl+z14ODLzhQlC8lDFc/JXaLJA39lxiR2x4rvaDZlPsQpSDOwXw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(376014)(36860700016)(13003099007)(6133799003)(18002099003)(22082099003)(16102099003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lexAMM2iPVpRkOrXMBuvv8kHjJ7teBv8qdSVvRKDZrMAov+n2NPaRnGPVWcjcP/53A4Ya0DnF30yntAuKB2nBEK73Iq6KAQTtRP1DJEkVA/s5bc60+qsJ8p+yuZj1bb2h3n3/lxSqkShnmCriUiOJP5BcWqGtzhEjHaAMi6y7WXjeCMXicDH5ExEJGPfeZ7IMbm5rgL7qiCLooAp343qTnujpXHCX2+KHfivcmgpojUX2EuSVlKBcCSwUR0hFg614rbMaHurHDiGKdwsi+WndJCbrKS4DNL+xTOcH4qxJ7K2SVGcZNOOwkBSI4h/Wxuf398N4Pu4HLT+LtJU24k3FPbEylfoUqQkXXv+LkaAy36jjnU07TAHN0OZjtmDYldazNM7KD0qOHo+v1GcNFBiDfrJCllF6kJtFsk+2vpsNvd7akPa5nleN1i1w/QkDoeS
X-Exchange-RoutingPolicyChecked:
	luL6kcnP4LdkSaFQgklxeuAZ4LAvbe8YoUoOHdHfRl2PDq2qCERoSXON/2IslefDI5Dc9q/ghH4esN2FjExLp/MCFwDK9QVqXYQ6O8FdsK+JBQxspqso3U7t67SrL5WIQg/T8YWnqYROp5XKmNCFgt7ruj3PFu6EKFlgca5E3NJ91ooAVFE/c4a8gmfhzxiu8sv9XqXZ9CmtInEyGLtdEqBtNyF9Crb5m8bGio4j0V7q58CY0Nxcc+AFKDDfdn7IQq97VC6oA4BN/EpZMxWQlbVFAizvlt9Yqm2KXvIrZfIwdXZ3++WxlA/6EYg/Vn+AfAVfNVDHYFMJtbCLmgseuA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:55:40.8641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4daf4b-51db-42e8-dab6-08defc4e1441
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4790EE4AF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4MSBTYWx0ZWRfX5JkOTAL+nRDy
 iD23WFqamxuPhuNzFv3zxXL4amCf7skhEo6cm52z4fUMoVBlF80pG+MAlR3FEPcUlCdIy0gAszx
 OQeB1SMYrbUz3ItH+Z5UHC4KMojNIThT1Yl4hzooOe2SAHtez05RvGX03z+WsQKKLck+OqvpG/V
 FsjvTe29xzkQvHH1T3df5lqNp9OW9QyYfg0BaPfLVXGrEkb50YYo+V1wsfW/bful+Ocg/UuVYUR
 ikoBP3VWltzo7cwhe1fI1vXOOLtFD6AD0LbRIjNxDYGicaAfQZ06Qax0cecj+sivDANrDKY47vD
 X1P0acPLEWEZnhBfiqcQs0Al8erX7fryphm1ohdPl/WF0xtfJqx9cfYBLICRLn8ZTYiLFJSrxFC
 0VEX+iTF+ZpnFH9X987gak5lAlQK/JUYoasjZvVYjaey5/1OfqkCXTM2/qfz0UfQWH5dFAL9euG
 cey2I/UOcMKFEck92kw==
X-Proofpoint-GUID: EKV3Q7Nap6M-tbxqzTKuwx1_85tU794z
X-Proofpoint-ORIG-GUID: EKV3Q7Nap6M-tbxqzTKuwx1_85tU794z
X-Authority-Analysis: v=2.4 cv=FLMrAeos c=1 sm=1 tr=0 ts=6a82e8b3 cx=c_pps
 a=9iZSLGE8K+bgI2IRaGFjSQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=0Kn4FdKhAAAA:8
 a=evrktbloLVL7Sk-6D3gA:9 a=QEXdDO2ut3YA:10 a=iYA3lCpbqa-fO8tTHbho:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4MSBTYWx0ZWRfXxKQzbv0f9JdS
 vJfdhYOxOu5tsC5qp4BancpM4s63LGLfJjQItBcXK2aPaVoPjq9dTGiLW7OavWt//pGbFZR1qOc
 Q565MnG32YGiBVEKui8GPN74m66eYZ4=
X-Proofpoint-Spam-Reason: safe

Hi,

Looking at your patch, it's enabling the second amps GPIO for VSPK =
Enable.
From what I know of this laptop this shouldn=E2=80=99t have any effect, =
so we'd like to investigate this further.
Please create a bugzilla ticket at the below address and CC Cirrus =
Patches (patches@opensource.cirrus.com) to it, we will investigate the =
issue as soon as we can.

https://bugzilla.kernel.org/

Please attach an acpi dump and dmesg of the issue to the ticket.

Creating a public Bugzilla allows others with the same laptop to find =
relevant information pertaining to this issue.

Thanks,

Stefan Binding

> -----Original Message-----
> From: Gemayel Lira <gemayellira@gmail.com>
> Sent: Saturday, August 15, 2026 10:50 PM
> To: linux-sound@vger.kernel.org; Takashi Iwai <tiwai@suse.de>; =
Jaroslav
> Kysela <perex@perex.cz>
> Cc: Stefan Binding <sbinding@opensource.cirrus.com>; alsa-devel@alsa-
> project.org; patches@opensource.cirrus.com
> Subject: [PATCH v2] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when
> ACPI leaves GPIO1 unused
>=20
> v1 mapped 10431A63 to generic_dsd_config and INTERNAL boost. Stefan
> Binding rejected that: this laptop is external boost, and overriding =
the ACPI
> _DSD as internal can damage the amplifiers. Takashi agreed not to take =
v1.
>=20
> v1 also loaded fallback firmware (SPKID: -19). After some S3 resumes =
the right
> amp failed with PM resume -110, then SPI -16 (EBUSY) until reboot.
>=20
> This v2 keeps Binding's missing_speaker_id_gpio2 parse of the existing =
_DSD
> (external boost, shared reset, gpio2 =3D IRQ, speaker-id at CRS index =
2). ACPI
> sets cirrus,gpio1-func to VSPK (1) on the left amp and unused (0) on =
the right,
> so the right channel binds with VSPK: 0 and volume drops about one =
second
> after playback. After parse_acpi, enable VSPK on GPIO1 only when ACPI =
left it
> unused. Boost type is unchanged.
>=20
> Tested: ASUS Zenbook 14 UX3405CA, Ubuntu kernel 7.0.0-27-generic.
> Both amps: VSPK: 1, SPKID: 1, firmware
> spk-prot-10431a63-spkid1-{l,r}0.bin. One S3 (deep): both amps reloaded
> firmware, no -110/-16.
>=20
> ACPI _DSD (SSDT SPKRAMPS), excerpt:
>=20
>   cirrus,gpio1-func:  1, 0
>   cirrus,gpio2-func:  2, 2
>   cirrus,boost-type:  1, 1
>   reset-gpios:        shared CRS index 1
>   spk-id-gpios:       missing (CRS index 2)
>=20
> dmesg after this quirk:
>=20
>   CS35L41 Bound - SSID: 10431A63, BST: 1, VSPK: 1, CH: L, FW EN: 1, =
SPKID: 1
>   CS35L41 Bound - SSID: 10431A63, BST: 1, VSPK: 1, CH: R, FW EN: 1, =
SPKID: 1
>=20
> v1: https://lore.kernel.org/linux-
> sound/CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=3DpRgz05mqxAzbU2w@mail
> .gmail.com/
>=20
> >From c325bb06bb37fd658f0250dc8571b5bb6b2c7dbf Mon Sep 17
> 00:00:00 2001
> From: Gemayel Lira <gemayellira@gmail.com>
> Date: Sat, 15 Aug 2026 17:16:18 -0300
> Subject: [PATCH v2] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when
> ACPI leaves
>  GPIO1 unused
>=20
> The ASUS Zenbook 14 UX3405CA (SSID 1043:1A63) already has a valid _DSD
> and uses missing_speaker_id_gpio2. ACPI sets cirrus,gpio1-func to VSPK =
on
> the left amplifier and unused on the right, so the right channel binds =
with
> VSPK: 0 and volume drops shortly after playback starts.
>=20
> After parsing ACPI, enable VSPK on GPIO1 when it was left unused.
>=20
> Signed-off-by: Gemayel Lira <gemayellira@gmail.com>
> ---
> Changes in v2:
> - Do not map 10431A63 to generic_dsd_config / INTERNAL boost. Stefan
>   Binding rejected v1: this laptop is external boost, and that =
override
>   can damage the amplifiers.
> - Keep missing_speaker_id_gpio2 and enable VSPK only when ACPI left
>   GPIO1 unused. Boost type is unchanged.
> - v1 loaded fallback firmware (SPKID: -19) and, after some S3 resumes,
>   hit PM -110 then SPI -16 (EBUSY) on the right amp. This v2 binds
>   SPKID: 1 and official spk-prot-10431a63 firmware.
>=20
> v1: Message-ID:
> <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=3DpRgz05mqxAzbU2w@mail.gmail
> .com>
>=20
>  .../hda/codecs/side-codecs/cs35l41_hda_property.c | 15 =
++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> index 416d7bf..0c09094 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
> @@ -450,7 +450,20 @@ static int missing_speaker_id_gpio2(struct
> cs35l41_hda *cs35l41, struct device *
>  		return ret;
>  	}
>=20
> -	return cs35l41_hda_parse_acpi(cs35l41, physdev, id);
> +	ret =3D cs35l41_hda_parse_acpi(cs35l41, physdev, id);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * ACPI on 10431A63 sets gpio1 to VSPK on the left amp and unused
> +	 * on the right, so the right channel binds with VSPK: 0.
> +	 */
> +	if (cs35l41->hw_cfg.gpio1.func =3D=3D CS35L41_NOT_USED) {
> +		cs35l41->hw_cfg.gpio1.func =3D CS35l41_VSPK_SWITCH;
> +		cs35l41->hw_cfg.gpio1.valid =3D true;
> +	}
> +
> +	return 0;
>  }
>=20
>  struct cs35l41_prop_model {
> --
> 2.53.0

