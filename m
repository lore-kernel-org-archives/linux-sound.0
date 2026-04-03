Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D512ECEB9;
	Fri,  3 Apr 2026 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204666; cv=fail; b=DTw1339bsNy2HPy8Rgwa09pKFeVdT3WvCso22n7AaCoOpVvGgq54Jx1WCltpD4jqOMrRPpgrLkV0Rsg3Ou2MQ1V3sH6AbpHXVwYDyko4x77f4ON7JuIDNs9ctRjTVlAnuvgd5Ysttak3dN8PNMsTLkyAv2DLEqQVljll4fMP0PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204666; c=relaxed/simple;
	bh=5maF5EVaQLo5InVoK3dvGY5WZNPa2SPvDCST4pp/ZU8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HTPDVy4LO+X7oBIk5LQo53Qo7GF91/N5lyaAuJ3Tfgnn0AkXClNMZ6kEtSqzVka3LHVnz3FCI/8Npmv/A3rJpnb2Bs3EPqStopnYMLnLLqI1Brg7+3MsENv3sl4reUrJcTavvF3qwXOV8JXDCVt+n6Y/OeXpfO3fGNcQgRAhEzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XswF1gRT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oC4Y5DVN; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XswF1gRT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oC4Y5DVN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6337bt9N1600361;
	Fri, 3 Apr 2026 03:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5maF5EVaQLo5InVoK3dvGY5WZNPa2SPvDCST4pp/ZU8=; b=
	XswF1gRTyVRonxBa2jzqN5Fy/71TZ9GvXzqRhuqxtwQHf6EhSIqf4vrK64VKqt7Q
	+KcIOxPQ3rP6af0PXZtLnCZH4fuiyxA8K146ZTeNPGevMK3uhibbz5AvuXQVOdeq
	CzudpbSMNqaOpkswNINLPNhcfMZRF5jU7/QbhdKScVVLj1YquYFaneKjjffirndN
	toiaYPZKOTPwwWQX5uMvDJzntk++xWfbgWuzFCWYTvu7+FMittcECFuECKsPxrvN
	ZHE46UHJZ6F0tEfKu16vtyz7NECnDPW1KIfqN2ykrB1b/5DT1L65cG38aZIzV2g1
	BzLbJCTrNOeq3XxtJUrBVw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020143.outbound.protection.outlook.com [52.101.46.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxyfda-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Apr 2026 03:24:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6WM8A565prt5brKxiVApv+ElFGpAftb/hAgrkUhEh72ZSqpdSTwMKZf8UPYfPG3kIlVw3orc+Gc987RpQ9ixoi2i/FUvitO5+t6MPffQdx86+oP0QTldtl7EaEVBBhP3uEcrldC9jVz70b5a1aNf5BU6BTcp7yfy+t4+Rezxyk8t7uHmk3smJVwHbxYkrSWx2Tpf8dyQfzjYb1MUEH4BwgiEjCPNCRAk1m1r9n/ANjfCLXiNNUFCRHKW3l96et/mR32vn+5T5fYSdaqgHxNNOU3GrsumbGA7osRiIbmejQG/svvnsZHA+NwCJZeOz12pCu3umt1UC/HOn36wRmWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5maF5EVaQLo5InVoK3dvGY5WZNPa2SPvDCST4pp/ZU8=;
 b=XHKBE9xXfEDhZMYD59RCw3sAq6Cc92YgYG4xKF+iyJzS/0X0K9XuIvQyNmXjPCqNuHc+yCcOrgt6linbC/ivlqnEAjAqVl1rTyYvm0qPMEwI0NGYok/flM130SIwBz5G0j+OPOZI1LrNJjqgPWyrhEHtsSfCBu2JPp5WDsz2IPkdmL8Gtu4FlwEz/qK33synwXTMIok3mRF3rk0JKNrD4gx4fd9WoGWqyG4nvElAxnvwO72Z2o+KZXEh7wOE1rEF+DFWi4ibkFos5J1atTWnK2GQ2mFRWPydINxKycr/OMW5QKNUnVA8wKTFAqAu9sdElghImm9bNk+iQgFGiRQ7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5maF5EVaQLo5InVoK3dvGY5WZNPa2SPvDCST4pp/ZU8=;
 b=oC4Y5DVNCvreSYpKWYjMSNwtCDKsl6SKF6JxurY6ux0+5OaNzr+eBQIVVaDOU6HZJUWkjhQgO4D4azRU0y7aiyIhvyhtBrtPX4SQMp+0K9LNtncF86DSaCtKEEOCMYwBwccPfiinH5hwbHApkjK5YLf9yVVgEjOLwquwNGAfZO4=
Received: from CH0PR03CA0373.namprd03.prod.outlook.com (2603:10b6:610:119::7)
 by DM3PPF12B913643.namprd19.prod.outlook.com (2603:10b6:f:fc00::70b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Fri, 3 Apr
 2026 08:24:12 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::63) by CH0PR03CA0373.outlook.office365.com
 (2603:10b6:610:119::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.21 via Frontend Transport; Fri,
 3 Apr 2026 08:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 3 Apr 2026 08:24:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 05A11406540;
	Fri,  3 Apr 2026 08:24:11 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F148882024A;
	Fri,  3 Apr 2026 08:24:10 +0000 (UTC)
Message-ID: <3b3191b9cdcaf65d91a093bdbdc9a649146d352d.camel@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: intel: sof_sdw: Prepare for configuration without
 a jack
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        yung-chuan.liao@linux.intel.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 03 Apr 2026 08:24:10 +0000
In-Reply-To: <d90c2911-1cb9-45c5-9c11-51d9259d8d1c@sirena.org.uk>
References: <20260402105943.29605-1-mstrozek@opensource.cirrus.com>
	 <d90c2911-1cb9-45c5-9c11-51d9259d8d1c@sirena.org.uk>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DM3PPF12B913643:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db8ca5a-ed63-468c-6bff-08de915a62ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|18002099003|56012099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	0WY0FqMRqPgbcz3p7hHhVOlkIbEdKU1ZP7R4sFsPLaK0nIswLHrqPMmhH38SIbpstzIB8WvcM9VU+iE4r9SBzSpgjfWJP/EQOKnIXQNIgS7LOF54s9+ODESltQHiXh6HW+MDNXBzwbfOFFkcAzMnH0tOwJi0mQ+ldrZgYPnYWogr9JY/nlxAVrfF4XVgfn53qytVmoRZ4vEIS+HlYgYMPkOe0WH7N1BjQk+3scMsoMYQ6TrsFs/qkvoO48Qrz2KImd4/Cy2ZWWjjLeAlDk2Vt7rfb4YWzuJxcHKAfN4FD+4wtk9PVvgk/LvI0ll9tzAT2lUb80YVMQP94asK4VvDjXGN8dtOWZfOYMJgu8RXVkcwPiEWUjfknRhpzs0uWU2BsKFD+QmdPVK4+dTcf1gksYzJ9CCKhAxikAYhUn18GOBpyY2lrNdDi6cW1WKmvwaCNfgF6iN0Cq0tIC+j8tMtL9YhFSVgIya0VOdzji/jptOznE3X2gm1QgiZ4Z0fFo+ztwlcqvEMN0ZhFje7PsgmKxfcxegPnJiCb5VKwrykXrsTSmdn8Q6K5gTDIj4WDoYO89OPzI/PvBXlCM1GLRfYc0UWWsIxA58FN0o6f6YoTxM5SO12vDcrrV8i7mnsxBlBaljGv088M1++4t1pfdtNR8+VysnAypFv/qoQT5JyiO84sKqO7QeX2JOFeZnaV/l9V3Qm8Csk7cyfDIUNIpknkuQOotoWNsYW1lwlAMG4u7V1rpv57b7q/k4TT6j7lN57NsQbP5ahYXytoofYHIuJUw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9VcT7syho4I+NUctbZb6FbIOlY/luj4vr2tHIZt7crumEBw1v6yeqXzKMSKt8G22CzWyPjHOXfJEbQX4PglWFPKqaxvCoAmD/ZNWd4/SaHPxO5mJR98fiyNyWCea0Eqp16RztmNOInUEUNbhFkvz6Sf0DbHwdLib3X74gislOPJMuLC+eGC7VMpw0PKqr1T2ZRQhv2i1Oh5tfbri04hp07Hez5adv4QHrxmxcBpHib8Kd4osnNMauNCKkU3tNdGBPUPADu/KAqYm2gonkX+ASC8AShgh98G4xpS5kJfsTPXj+lh/t62rQecSrEN8HyR8sG8pHDN/dSWj30KxUHDz6TghjkvaLoyPmEvNjKnEmC08HmZXMZRprQpQsfxV0A7MuBnj3G8JAlbnYfzzk6Jydn5ar5UNYXMDPM7e2e0mM9+TgQULmGhFFnAqqu0s5b47
X-Exchange-RoutingPolicyChecked:
	NZpW5ut+hRJo5Bo3gV4nvpAX9EMgcFWhBS6PBOQNPO4rWMg+G6CcXArMkuh2Um4f1ARfgIVz1mplJUsNdb6ehAdl9CE9rYSg5RKCYX4G97E6+aNFkjzqztMWKPm2NeUBXsBwsYNsBifTCMr63zcOUWWebDJvqmZsV+R1ITYyuobcHAWxBUhi72mnaRGBcRgN4uistXi7APee1XIX39Xn0ljysq6CqU8kmtnR78nU3J6i5ycZU2qTci0x1ctszLheTyRsWlqsVhU5RVDnptpxqQ4vMx9gTif0s2Ab8TscvRnO4rzvAp3p/a+QkqzuXgt9YbqrnW/1LnooNiIlVqnt4Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 08:24:12.1466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db8ca5a-ed63-468c-6bff-08de915a62ce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF12B913643
X-Proofpoint-ORIG-GUID: I9bn6k-0J79TcOS7_cEQLWHLnlPNEvYP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MyBTYWx0ZWRfX37LA4EOorH0J
 HzwXgzbK2d9sPBOgDprCLJ7Q6XVBwED+h+LSdG5qTcmPkLEjevJwSosM8ZWqtf7Rp7au/28vXvx
 wmizUm9slYR9fXrV6yoCxS6PMGYoMHciPIiHmYcOTeoYPzyGaaSJiVZPbTXgtsRgTfo0IkPCcyg
 ayVu+Yri+zTcZdDYWz01TiUY8hxjvZVYDuWqHxf7EEtY9gLdb86UidG/V8S4RGPwhBBuHlAHYYS
 hF2K/hUWiMokA05MIIdkVhv8Nwh1RUMCuS3rA87o+foblT7EyFlrGJSej8uNnzO1bV21Q+jCtAA
 q9NTKVytsLWdwsfxMtZU84Mgg/RxP0z1WlyG4XPqfgAPuGtaYZ0nEiYEc2KlOOs9vLhBHHMwUPL
 G+w+MjANVzoikJN6VhlFIMXPdfrJGLIQXID2++guJdJdEJOOtaX9d15v0PhBOWRBJwsC1Pbnt/0
 GlyWU3ZV2YST3Ip5zIA==
X-Proofpoint-GUID: I9bn6k-0J79TcOS7_cEQLWHLnlPNEvYP
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69cf7930 cx=c_pps
 a=XSy6xVanZX0hR9uvxkBJyg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=2xkYTqm2WS2RbEUVoLkA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Reason: safe

W=C2=A0dniu czw, 02.04.2026 o=C2=A0godzinie 16=E2=88=B625=E2=80=89+0100, u=
=C5=BCytkownik Mark Brown
napisa=C5=82:
> On Thu, Apr 02, 2026 at 11:59:43AM +0100, Maciej Strozek wrote:
>=20
> > @@ -134,6 +135,11 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct
> > snd_soc_pcm_runtime *rtd, struct snd_so
> > =C2=A0 if (ret)
> > =C2=A0 dev_err(card->dev, "cs42l43 speaker map addition failed: %d\n",
> > ret);
> > =C2=A0
> > + ret =3D snd_soc_component_set_sysclk(component, CS42L43_SYSCLK,
> > CS42L43_SYSCLK_SDW,
> > + =C2=A0=C2=A0 0, SND_SOC_CLOCK_IN);
> > + if (ret)
> > + dev_err(card->dev, "Failed to set sysclk: %d\n", ret);
> > +
> > =C2=A0 return ret;
>=20
> This means that instead of returning the error from the speaker map
> addition to the caller we now overwite it with whatever the attempt
> to
> set the sysclk does.

Thank you, fixed in v2.

--=20
Regards,
Maciej
