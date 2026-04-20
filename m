Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F63859FD;
	Mon, 20 Apr 2026 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776684602; cv=fail; b=t3+ryTxF/2IncrpyKR/BZcm6rqvLwQMIKKJn26KWLdkkJ+x4j6LVOnkxxrO8wo0UADltgJljqKxVxYNShC/AtupImPXCRyKg5LLsI2hck53gbswuGEGtFMmBoaZFHKoMxq2Q+DFKtn4Q6vnZ6hegnYygWPSbCT6ymkBm0VmjGJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776684602; c=relaxed/simple;
	bh=s9N1ZTMsRXhKGtcvJEjaKm3/eU+ETmXx9aBD3/pwJpo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aWqW2amJ0N+oosjyA4k1ZNY5zX/befNkhr1bAxX6cVa27DCx3KdQO5x2PPM+qavOgiAxA0PoOoyASKGe2P3cw4XtZLctzB9Xt7waxHl9JsCFoj9GfS7fvzpHQ3K3ywZAyiF4kpYDeviYjO5+Z6JveC0U5DT5KOWclI82h93QuNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=drDibtKq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uCq6UV9J; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="drDibtKq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uCq6UV9J"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K5fHqq1613041;
	Mon, 20 Apr 2026 06:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=s9N1ZTMsRXhKGtcvJEjaKm3/eU+ETmXx9aBD3/pwJpo=; b=
	drDibtKqRrBAhopDbpB/LLwJLTx4EFZQrV4vOCuPc/6AdK6NmraHs+iB0pG2HeMF
	LNPYnj4yQHD+4KTEcoZBwxGTkW0xTeUrdzoB1h8d24ldx/E9aqH3BB4HdycCSlm5
	jLVGSSPntskq5//44IK1P/CM9WNuLDK7p7vh/4tTwY0MelKxI3VZb22DsLAcRjLj
	6szJsRiPEDHCuLfcsmVNanPAuu0q6yNUs4eF4IWRO+VXqHnmWFs+IX4dBp1+aYa5
	ND1Ua296ECQl2SQgqeYJJoJrX6Iw3VYsoRh/KgN31zO0X0NCtvH2Mt82HquNuRtg
	u0IkL/iad+yZBMvsO1ujCQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022135.outbound.protection.outlook.com [52.101.43.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dm6cfjcna-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 06:29:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZ8tPmk4wP2BGW+RRYI5q4jr2Wj80IVR0DIV+ctmz/qlzEcsP9jGM/hPn0gNay4+0/HLbkN9vLUNHiUShoThhqboyI0C82bF/y+/XjYGylVE3CvQhr66TT4dtePr3iR/Pzd4rYHmioIp6k1YtG/WDxuYMTBTtktaK54ddY1p20ykpgtoLkypQXDHY8PvdKZTsLxxLq0O1OmkwN9dBBUFBYrKfcbvWjoEmsBYmduumF/sNWipYGgQaWv9UW56vnk1RmJ6vS5m4FGx1dx+NPvs5TD+v/J+bOjwGkxqDZVc//HwAVaYn7JZ3eRqyYkfs0YIw1jlyZwz9H2ZhD2mU75cEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9N1ZTMsRXhKGtcvJEjaKm3/eU+ETmXx9aBD3/pwJpo=;
 b=lrem+mLaCOPb6mDllWcLuJQVqi0uEfPsU6ew+cMxtvteSv1ZhS62erbgq3YBnPdFEEeO45obtr3wPZ5f8RH1E0J7YAccey3jmBB0hOp5frq8PIn8eVXBl1LjsL2w6QrltJogWPPhnp6ElhSjYN3WCHQfEH5vLZN/lAJoLDbKmJSPuCSJ8VjGcm7D8YoG8UxjgzedURTIN1T8iemS2gCUCXk/uwp6mmtgZWMMO+xFCyCmFvFuljulfn4GLWCT2NB6K8wlKGznhmmFxwMPJjl3TWVN/tDKpp/z/DxOxbHXXWGcbc0fHAiXX/ZO052Uj0uyd71i/oAiGlPS1v/e01/pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9N1ZTMsRXhKGtcvJEjaKm3/eU+ETmXx9aBD3/pwJpo=;
 b=uCq6UV9JNjE2hpM9572EE3cPvMDYOS0OresP2LBgAZnA1ge7lSUKM57DBh4MMVIxZGGXbuVBIbQNieEpbIP2GwEQiU85R//cVJgUj2Oq15uBiuINT+uF2DbqcoCFUBfBnaqUvFU9K7OFNzWdB+4kGXnQcYucqT40XZU0nzAAvFc=
Received: from SJ0PR05CA0073.namprd05.prod.outlook.com (2603:10b6:a03:332::18)
 by SJ0PR19MB4793.namprd19.prod.outlook.com (2603:10b6:a03:2ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 11:29:45 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::65) by SJ0PR05CA0073.outlook.office365.com
 (2603:10b6:a03:332::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 11:29:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 11:29:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 225ED406543;
	Mon, 20 Apr 2026 11:29:43 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0A52982024A;
	Mon, 20 Apr 2026 11:29:43 +0000 (UTC)
Message-ID: <84cf54f10856d3fa61b9389a2af6345587a81596.camel@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to
 be combined
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Aaron Ma <aaron.ma@canonical.com>,
        Takashi Iwai <tiwai@suse.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Date: Mon, 20 Apr 2026 11:29:42 +0000
In-Reply-To: <faf2f908-cff3-4efd-a80b-531a2060be68@sirena.org.uk>
References: <20260420103722.4175356-1-mstrozek@opensource.cirrus.com>
	 <faf2f908-cff3-4efd-a80b-531a2060be68@sirena.org.uk>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SJ0PR19MB4793:EE_
X-MS-Office365-Filtering-Correlation-Id: 77543287-edcd-4f84-a832-08de9ed01f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	m2jr4Ve7RpN8omi9Li4k8F8+HjslEG52kioq1nMWD4e4t2Qd5PnaoUsafuAxLWMx9S4MeMrWmclpcVkxb2LAFJ0BNU+gCgDJa+gHT2SzzSF8JAdZc91fwx2bkcUDhLcOdRKd56Ncn2BTzv4Qyxwts/lvIbYAVgKRd+JNFWenkQgHsiKacm9yI4DarEp28WjEFUH0iUkMRvU+9i+H0RS2Qdf7d5QbhhxwtDXKQFUtKprlVyRP2zZBW0dJo/LS9FGsMnn2ZzsG0XdW8GRhrZf8luIilULXQIJVWjcbnXYkNBEQHLi+45GKtejldEKWo97zo+6vR7ReG6TppHIkCN59FDpYSiNN1tpLTT/l+JBZJNrLiqFDXoMBQFkfXNaZ+qf+ZioXtVhIIcSNkk+V4bvpKzhoeNjY3V3832wBf9t2AgzRgDy8A1b12G41K9fzY/6d1rH93zyEVQqxkhi8F6Hpl78qbnzLuuUxqznq9wCyjccoruaNGvRHVkjlpiDjS3FGzVGunVrIEI3HM7h9VFz7MBi/g2C6NyoJZhraKWpx31LigZxmtAotvLJ1k8oc/MzmNLYpqL0CjpjAguCnRXNjBthL3ff6jbbdjRGLWMDQh36QY6QgpeYVHwAq9p9eKb1Ir7oH19LrGBpZiW7+ZSRa4rJoJgJ1e6BAcBTEhQVR3LACXB6G1M8G1mW1PVSsfztiT9JhNxP9IMpOJasyXP9/KJEFVDsVLG+pLtZA4unQ/T2lFywHtYEb3YagEkixBcggCkdRe8RLq9sYoQMQJwtB3g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nx2lQ/XslWi5+JbmGwv84JXvb8Zz45rptkdQfbbDcNSOy+kc3jEFsndQnqmZW1nUnhp+RIZ1qegSnYnEE55J/7rF3qBusHu6Z9X3H2EJpMEvoJs87zW2EPhGO6OfCTTb0GEunsFU5/3A1ZKRnPbOwftUg+7l0c2ZtGEOy6MFasj98k/1/B9PgJ/foMGdQkHyNREKGQJShvV6MNgwuKvBvqA9WunFR+S2yzWQi/K54nfeseOnhYNFuRLmBduRBgfPWXbO7IIEgi2svfBffdzKzaauS7MoxDEMU8PV04Ywoq19zyexrq9Yiz4llqF2/6kEyEBTjRlVs3P5iY56aOZMTvaWDRnsUwvHMaewdlqM1a+M8673AkR0S/JVcy71/JzkTaRn2OWGoGuAZbX858RG5/WZogeHDJF/hZ6Y81OrYIEIvBBB3PauXJ/kQyTEr9Ym
X-Exchange-RoutingPolicyChecked:
	ADQmu5pzhUdcS4FhEjqltTEVShjSiSMV2LpzJh2xMFi97FHBqt9/ksGK2LtoIzsI3caYsP5sEFk9T2tGRVGO3R6+43UK4lKbnH744gqvyO3stgFtIp0wRft0Unytf022RBcVrOcKS2qTXVO+qTsxUW8KMnIcEQzPUYzyYwlZjqRzY2UOiC8yxxQbvrfZXdkjaKBz2PG9O1MEE9klUOhk+c18LvkSUoBEuyQTeUAhajC+ZzeYTmI7yjW7LCP00YcgV5nZZDpkN2r+IPILBqLaMoiAvrs7VM4SpqtNp+WxQHBxqIDXQynKTAAufp5pZU2Sg5aaOU376zbZ8TJvTIHnRQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 11:29:44.8004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77543287-edcd-4f84-a832-08de9ed01f72
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4793
X-Authority-Analysis: v=2.4 cv=EdT4hvmC c=1 sm=1 tr=0 ts=69e60e2d cx=c_pps
 a=L1NvDXWcvSIeBCESApydMg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=ghaPVZ6tyN6umUq1uOkA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
X-Proofpoint-GUID: 1HlKLzDVGFmRTA2QMQ4wsmuEwxZf1xm6
X-Proofpoint-ORIG-GUID: 1HlKLzDVGFmRTA2QMQ4wsmuEwxZf1xm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExMSBTYWx0ZWRfXyfm46yexZHTy
 ZiR2HYvXntufKZe1l2+6PySLjDlGBf6IL9Ro6vEBhlcXpCqqsJC+ECbXqVS0kTcysqOPo8oEeq1
 1buo/7yk+Rcb3URDGXloXCMZjUsYpL6ocxR2h0OCVPF9QHsHz3fz02riiaSvdXsTFXRtrTw52ap
 3i5jOqbyy8UBrBUIwZY17Z3zesNCx5B9bFMudcnPy21GM/kQtuURif36bZWOfLj8boCR7y7atVg
 TWbH3Fgb9mqVD/YdOS8aFguA0/WMTtanKzcvjEUkoOFXzX1rS1rRNfxQ3jEJstVPq/fcH1VDqq0
 h7FG5LqSnDy3e4mjs5wYgKT0NRPJgoWBQA/0IfuS61kmKlvcIbYhcshR1d2gyC9wzh1Z1fgcUlh
 2xxNb5uT4HS1/Su9G5p7CuGmjPwejR4z4owRoXZ2fZi3+FXGTcAIP8WlCvsSXEUGfJ3wybf4kHm
 kOrWv9EFUshr7Gf5zDA==
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu pon, 20.04.2026 o=C2=A0godzinie 12=E2=88=B620=E2=80=89+0100, u=
=C5=BCytkownik Mark Brown
napisa=C5=82:
> On Mon, Apr 20, 2026 at 11:37:14AM +0100, Maciej Strozek wrote:
> > ---
> > Changes in v2: use dai->component instead of
> > snd_soc_rtd_to_codec(rtd, 0)->component
> > ---
>=20
> You say this is v2 but didn't actually send it as a v2 :(

Ahh sorry, missed the subject line, let me resend

--=20
Regards,
Maciej
