Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930CE3F9FB;
	Mon, 20 Apr 2026 08:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776672097; cv=fail; b=S1AMv2fsfwpTxS/7gBo/Gn9Vk+Pb7Tl8WHk12XxlsvXQd+JRc79Vv9VYeuCMIv8YMlabooKRUbM7rJYAyxi2PA3R0UIaeHpRJuEMfN2jZZZTSHAxLcrc27I5rFlwQi1zc9fF+5gn4W+AOFJigCM9/AICornhcTfior+UhaHuoSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776672097; c=relaxed/simple;
	bh=TPrtCrcDMPNYGj72k/9wnZ/fNSH1tvPwX1BxgktO4Os=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PeG89vN4bUsvDZ/SNg8XjYS9WMjExfo8ebRFR2FnS3NREfzhGt7nrfN6JGAMZkwwaHg1Y56D/UuJINfgsE2CRsF0cb3P5gFcx6SiZKK805oos+/peEmpX78IzI36Yr+U4TyEnQMbo/mpY3uH71Kv93g2WfI7NgFDI8lSs8doMrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=G0bbuOsT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pdxW+hPy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="G0bbuOsT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pdxW+hPy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K63w9H061821;
	Mon, 20 Apr 2026 03:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TPrtCrcDMPNYGj72k/9wnZ/fNSH1tvPwX1BxgktO4Os=; b=
	G0bbuOsT5C6FCyqmXkaKyEmro/O9TZ2clt2DuKf1spsr7OO2aea1pBV8OuLdD9Br
	IZGujeHlKms2sj/uxc8dAu1A7MWsF0ohbhsTUio9aVJfGu9sO2NSgw2CZCJnQkJZ
	4zaQSTp7I1OJ/sZdKbJqSyhfDauJ2K965QzMSKoWbEbIHYbH7rdnj6YKGE5hznh2
	DP2/vgPHLxYln9oeUMzZ9+gmHAjwrNlXieNreNXUIARGRhziRMB233XPgu3C6vey
	4OkzmLKze2OXV2keDRkdsfBqZDcNZMMjIax38MAEmoQ6CGMRXnsv0UE/F+irEbJk
	85L9ChUfkfHnKFDWtDzWmQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022088.outbound.protection.outlook.com [52.101.53.88])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dm7byhvck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 03:01:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hudqpb/MszQxyR26sFY+ymaPRGyAHuuNhiZeYxrsegxirze7QDz886QQo3aJNSmBkr46ActaE4+MuzHP2LlZq0nZw+UmLdXLufsT8H55xF8JahFxG12TqGkopj7aXhEn1uKoG9sSs/UJa7PbWp8J7VFeuTYLqxeMaseqft0dnxnXNhhiDnpnacHxu+WRJ/6K+3NGaECeacM9yYG/EiJ7te/r1mfZOL2X0C9u9xqtaYSf8qtkq4+Xd/6DbzAJi27FITTqT64TP5P/nTolqmr6lIo/X8Wr/sXaPvZPeGeEryxp0ninlw4eHyTmNcNVkNtj1RoRG66j9KzTBmUe4jyipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPrtCrcDMPNYGj72k/9wnZ/fNSH1tvPwX1BxgktO4Os=;
 b=IT7c9wnRxG3ikB77PCKu54h64Ko0ZU7qae9r2oIZrNapuzn2hRlx4TdG+5H6nDm3xEz4tR7xAXsVJwgtWrFi3DM7x5QG7bpdbOZwPGGwkURc060RbyqhbME4g/2BtfkBsnhFA61pVc+dCuKXsL85mLCHazO+1k8vXOfScbeYsJmKWjY6oxX+0KiTYYR18bjy6ooEz39dVkrLk6dyoUqVxyvWZWNPKpvgrAwxj7HGoFFjobub3mUG3yl5lw5pL3OxVMOkVpu8XkpUq9wiNx9vFdpLc23Enoif7UCM3nNoVRYIW+Xq1zCCFafHOXmLKJuiraB5Rrue40kHnSf5cizZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPrtCrcDMPNYGj72k/9wnZ/fNSH1tvPwX1BxgktO4Os=;
 b=pdxW+hPyKiwy/DqyRD9SGhQKAjhq13bBln1O95HW1JLs+SPxZonxS1b3VBn28o+wub3romcyWEagjn5mbFS9ObdZocI93r/4lvUq6JgrOGkfIfRkPTnFrqZ80ILIO7fFuR3dZmrX86WZnqy9i6UT4VO8UvjyujZVyEY8FnmjUv4=
Received: from DM6PR10CA0030.namprd10.prod.outlook.com (2603:10b6:5:60::43) by
 SJ4PPF6C1389973.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 08:01:04 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::90) by DM6PR10CA0030.outlook.office365.com
 (2603:10b6:5:60::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 08:01:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 08:01:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9DBE4406543;
	Mon, 20 Apr 2026 08:01:01 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8E30E820247;
	Mon, 20 Apr 2026 08:01:01 +0000 (UTC)
Message-ID: <6d66c5e2ee570115664976d84bbf6034e2ceee85.camel@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to
 be combined
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        perex@perex.cz, tiwai@suse.com, yung-chuan.liao@linux.intel.com
Date: Mon, 20 Apr 2026 08:01:01 +0000
In-Reply-To: <20260420074739.705268-1-aaron.ma@canonical.com>
References: <20260417144529.2385360-1-mstrozek@opensource.cirrus.com>
	 <20260420074739.705268-1-aaron.ma@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|SJ4PPF6C1389973:EE_
X-MS-Office365-Filtering-Correlation-Id: 149c18d9-cf28-494e-c636-08de9eb2f7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4lhemEB3nmyZBLsHh1ueY9XyEer0HNkTPI5X3S4LCcuTgQkEu1h7iHEoZ/2A5Wv9/pNGQ+ZMbDWNbD1sB3roMSL7b51pw0mPj21ahESvQEbJk5ff3q16YCwMybWaBnhzUUPHNqw37Xgt/V5Xg/E50GkZ45jmgqo1K2NI6BGh2I6c8Js3qDieXJvMXmCLSekaTGZA941JBgSGUcsLVDs5MHHV1IqgMWgOb1uY62NhumX4U4xO03Qj8eRa4FuclnS7yWkNvf/86ZKmXoyJ00NLPH5ecc9L8bKXzSZvqW39NexY9cY3MjRQlWKOzHk90X2f7viryq2xGGYmgv2Xf2nVZdK3Wy6AmQtMFC6BAmNxSVBGCOT3/RPVrmzWf5NYrhfWDUvNxlO5xLESbNJgDR47hu5qLgg3zFnoVfkvtALbA+r7GaKP9QM+u/7EG5FzqqLRFFr8mLpeqmHFQVdkauPFYjKlCcFQcScOCQc7C2PmlJ/ZLiGVoD6yH1FnvttoAYV7C51v7Dz42e5nEIAoLkHn49+c6hqkEJxhD7FWOv+ur79znATPFaKI8/w38+RjI4ud6BK6/4l1X1dx9EZMeq7u6uH3cmCqKZmYIwhClDHjRq+7RLeQmvazKg+OotQb2ewMf576K0VRvJ+SR1v8LWCDnTJB5+NgmpQiAuE673PU3ldk+ffYEQi6UeQFPO80Zj6pnnl03B5d6QuONeNhVOL9eQRPtPH9xNWkSMM0bAyykiWgu8Qi4zhT9yzgQbx2IozdPRep6YplA1U1d/Y5kES+/w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T2VaZmoKEZkeTkeAOKbibtMjdqxqpn2Y/TWp4bbXNZcIHxCos/f4gfAvlRUx4Snm+LT4SbnBVcF9dhPaoX/Y/3vLIZ4a7mArl5kgvFTQNBIJSHxQea/nMLQCnYRh0XKV7lw0qW7h6kJHAgmJ82RTkKVY6VnMnoY+NYbWPyUf91TuZ04TEh2lsGDWEQqZXi4z1BH0oSc7MIxYjR1GmVmH/hZwhl+rGK5e7VmNvlknINeNBFWigFuO2vggP5ZFfhiPj9bAa22uPmNFZShSbFKCrgDlYbNB5JIM4meNZEv4Nk91jO3O/sJkjKvzOK6XOWI+h8BwT/EGHLu6LFVK12IJDYi8QsUiCE43SePzSKuatLaK3cLlM6MISs5MUUNCLaYfYIrWpj0KivyNyWxjz+wDctYGJWhie7qhTfe9eNF7N2OpaPtHJsnqFuqSKpP29MX6
X-Exchange-RoutingPolicyChecked:
	aC23fsr5J1V6lIM1yB0A6oEj6RiqFpfgKXtXDJTfluV8+ewX6gudssN4TmW/Sy0rhjsOxLTeYrLd6gj7RDfsTXoegHNMxUY5NV1nsY+cWYzhPfZn73Xc+z09yCaip89aBp2kcf4UwI3eTXHEJBZWgG/tLVmgs/qEyOSTkBsOxugQFLmV945XVoLM3w7PLGGwHJs47HsntREyRJSJAYurLMi07g5Pl3ae8SReBaVM932qDT/PH8bf4/cgBCdUmoZ4MtHvh4+bK+b11JiZhEp7M/72jc/jZKZ6rqMHr1vqENb+e2m9r9kN9u+EVtzVjZoIzAifGLsfb6p6fAFlakq4ig==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 08:01:03.1277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 149c18d9-cf28-494e-c636-08de9eb2f7ec
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF6C1389973
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NyBTYWx0ZWRfX3k3IqqJdU7zn
 GWkuehKm1u8cqnRDeXYmioHwsgDZI5ZIyHsG8LNBZ6Yh7rmitLOjGFFsjRNCO4B2/IybCuLri8P
 H6orNRrfhFnSHXWlMkxW+L0BOoYV8GLWfH2x83mu5Mi3XeC87+tcghmkNCcAnq3nju0RAQU8oiu
 2h9/IBgy6zz8rK0A+qy0/cCW9m5OYB1QNteDiPv+KqIJWXoGXoQO6/aPkIh6kHNwMXgCZ8wdhBK
 kRDdwbJwxqv63KajQ8DA/+SWIrWPm+pzZ9XNd6KLh4fDiUVROX8SJ2zpXPZwnsixgKMV+MTjfy0
 iXtFgRa3neyOnGTmxJ0I/oPeYK8Ou74Xlw7K2pAAzHEsWsjHFERAize4S4TjfswpJFnlFU/Wx9l
 7SGXb6yaKcRH75Y9UxTpEMCAHLFti0wimnPjfVW3QqR4SIcbK6MkqDU7skk6snT/a48p2VGB0RQ
 V5tskxNlMfv/B3vLl5w==
X-Proofpoint-GUID: 1tOI5P3yLD-wwskMs_S8SENy9fDkpaG-
X-Authority-Analysis: v=2.4 cv=SffHsPRu c=1 sm=1 tr=0 ts=69e5dd44 cx=c_pps
 a=Iwbv4f4Sj7MVFDRstb1XxQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=fkHkSwpOZ64GbXVdZXwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: 1tOI5P3yLD-wwskMs_S8SENy9fDkpaG-
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu pon, 20.04.2026 o=C2=A0godzinie 15=E2=88=B647=E2=80=89+0800, u=
=C5=BCytkownik Aaron Ma
napisa=C5=82:
> Hi Maciej,
>=20
> Tested on hardware, 4x CS35L57 on Links 1&2, cs42l43 on Link 3.
> Card fails to probe with -524.
>=20
> In spk_rtd_init(), snd_soc_rtd_to_codec(rtd, 0)->component gets
> cs35l56 (enumerates first), not cs42l43. cs35l56 has no component-
> level
> set_sysclk, so it returns -ENOTSUPP.
>=20
> Fix: use dai->component instead of snd_soc_rtd_to_codec(rtd, 0)-
> >component.
>=20
> Thanks,
> Aaron

Thank you! Going to fix it in v2
--=20
Regards,
Maciej
