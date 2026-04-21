Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E711C2472AA;
	Tue, 21 Apr 2026 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764945; cv=fail; b=Z1paPS8PZhtykB+dPxyzNnlVjfTBXlkzFTGk4Kn664YQT5/y+7QotEpCzDD7ZmB6keo7mQV6uEdNQqnY9FMjnIJiLXBuhhHYCJXIlGFBjxEQ88jJ59sp18Xh08jBFbBijB2f2KcYFbcX0dDCfk0YthwjhgC9bnIgVf6XwxLiCyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764945; c=relaxed/simple;
	bh=jeDqFYptVNyZ/fMgrkLwHQwhP12hgupFG3xq87J489A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDo6xRMYGp+Ioi+I02SsBagwpg1LKHAsGVT5pZ1hQWUmBOf1bNmvHZWJsoOKIwGhS/GkOSS6tBiaV7zSiBgu4U8ExUogHH3xXHwguANAuSv7PyMoDn28cijBHZSo/iv85m3lVXzInVayd3xMO6Z9J/LjBZx2ybNPN8rB2i/lGPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iWuirEGu; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SqUVp/pU reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iWuirEGu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SqUVp/pU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4aGG53910356;
	Tue, 21 Apr 2026 04:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NUkX5s/BlDy4V3nUK6cMrniVW9/GiWZRcLO3KDUZwOs=; b=
	iWuirEGulZhDvngMJUpQnNFGsgyyZKu9+Jprc64eB1mpC1bg8PBmvirbq10P5im2
	l1PPmeBcVvJImbwZep6b65Ou6/Wo1KJRKGLBDWr0nyz0kIFHMAjvECiwCEaLuJgN
	HjPcDHOk9yqcR/keIOX46yQQXtrzfM1/lMdtrD/CSnhm18rTPXHq9Y7HnV8uUoWS
	7M6HlYQx/hbobKzByXyRlVD2LnVdLzl4TiYk/3UUdiK2pntLKKgJfteM20vVKJOs
	uIfJHC50nVFn9xEzpzcOU7ak0QbbDd+mteXcAdiYUwECX5jUJZqdEhloI6Q8K4qH
	KbKu6OWOg/gmvNoSgZflBg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021125.outbound.protection.outlook.com [52.101.52.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dm6cfkr84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 04:48:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDDn49OEAVluCXSZ5ekAaEN8qppFuFpKrz18oKXjmohB0CwjwJ9ZafFE9hFejumx6EDjcxBRI7+9AAycGVvEJHUmsj6oOT1uZXUph1BTOHoQ5MOHrY7g6/rNpC3CPS70J/JfGN/HD3RSmdu9rY11Iv1OnfGQfGBthaIA6JnW5OqSJ+8iaQz/2gXvVWvs5eITWD2sX74VopRsX2cjID1SIHJKKq0ZTKSbNqsaHTE9aqCOmbcwUdwNCdMHbdgmsVLYmfoT4db7vXQ7u5mEGzJW2qA16OcldiDXHMwYumc1Rkyvfrpp/dMVfjFUHz6w7XvpHXcGo1HW8iaVJsQBLQapKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0INdEiCIemcddW2pFLcVfYap8+L/DAXmU8pvqH21DyQ=;
 b=Ep0my02Iu5NLteJy9ISPSz5a7EQ5RkCmgol+4rGiC3zPdsu/KxIVGFzKSF+yNPztHOvqp5SNirFjEoAqKCPwyn7YcWex9w3D30fBXT+5QUI+VvTcTikJNab83FpEf7dYxe/Ocsd1b/0kWBKgPwME8TQn49CJevz1cqG8iVfKJN9aJ0cAbGfFkl2hnyw1J5+RJOkuqtQG2MJBl0EXz6lwk0IfO/ELPAJ4bquC0B68KPcPNsY4ERkM0nbQTpUrcUu3DxcQiBwnP1Bq1DKFE1rxdNZ2P4KOmQutQf41DJpRYkTNrvjrEQuquXS8LcC1xe0D4sCMkt49FJfKY9pfF5Ur3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0INdEiCIemcddW2pFLcVfYap8+L/DAXmU8pvqH21DyQ=;
 b=SqUVp/pUEAlcfsmjCQGP+rM1B4L9IY7mPwDOkWnqeJUmZ/7p3l5gpGUxg+Rr80nC0/pRkQdU+M4M1/829Xg4Npo6fYN+Sm4DuuQ651fFcRiKO4BSLkzoNFErCG7mDbM2PnmLJv+v5KpABJqDqIOVosyolWGjHTwWqNqw7CLH3BQ=
Received: from DS7PR03CA0250.namprd03.prod.outlook.com (2603:10b6:5:3b3::15)
 by IA1PR19MB7255.namprd19.prod.outlook.com (2603:10b6:208:429::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 09:48:55 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::cd) by DS7PR03CA0250.outlook.office365.com
 (2603:10b6:5:3b3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 09:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via
 Frontend Transport; Tue, 21 Apr 2026 09:48:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7C459406542;
	Tue, 21 Apr 2026 09:48:53 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5876A820247;
	Tue, 21 Apr 2026 09:48:53 +0000 (UTC)
Date: Tue, 21 Apr 2026 10:48:52 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: IRRatium <majnkraftiigry7@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, david.rhodes@cirrus.com,
        rf@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] ASoC: cs35l35: fix typo 'overide' -> 'override'
Message-ID: <aedIBFLFwNVuHC1w@opensource.cirrus.com>
References: <5ba3d073-c5fd-431e-afb9-0a0911300aa7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ba3d073-c5fd-431e-afb9-0a0911300aa7@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|IA1PR19MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2b1a0c-956c-4372-d307-08de9f8b33ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|56012099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	9dyXKm/W1XA42C2jD1js3tRds8v/u0P5BmmwKT68zYGRUTBseYyvgBKIDzCqid/Kc/F1Wnw4FIf7r0QXEMgJHUtm3ib7UEQ+8cgX4gGf3iLfmk9Ftrt768fV6P+1mEymTKeeFUwWQ/gU0VoJtr74pfyxzo1EcASSc0iFJiQcO14ZaDZ6Wu5o/1qAtMBVdA0h+lIFunVDqDLqsFo6bbH/G3sz7NhkNLABX/KYXODtYvhy0yHJdJ5uwO2dr5l+BoQ29tsdmFYXiKfODxVn/ZU/NQ7Zvm0ygSKDh2YRacSk9jawQ4xt+DgxT1MpFnNbKnNAMP/33mKbOLRofPMzbi+hayDaFVrTQg2JBmzRaaxZnEcVvZcc78/MOZx6q6qbP9QfESRDD+5eYqhQ235oVzEGBDwpXjcpoQXAbGs15aQG0dhBVTkbvOgstqu8QLt+ryjtxD11cBo5AYcIfrY83iMIbZUidXkgzPCcfv2MqXjQaodSqTirNck7l8QhOF348hRQd/l0p/NhLextr4/Xi8HMUrGHS6yga2gbTAKMZwccHDPQGAlcVsSFJTi8e2nJMCouDciUEmTfRpY7/Go7C/6MRcP2HXatjDVpasqFi8FtA+K6kF67rmtFlq6U8lHXTqLGy7fN5SBh75hmgnvSjraLMtdFE3ai4wkC6aP3+D6ek6nO/SKgovFG2iM+FjrT8CueT4vum/QgFQeZOEcSxZPqhxAODUwO/qvz88Eqnhh8qysLU04jb/eV/FmP/nYOCKfRrAcZ5U1U6PoLMFJ5s+tEGg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(56012099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	raqby/PKWhiybnzrbqDi7S5TWMxr1kb94li/dlDfMT6WAE3csv0Y3xNcSzff4nZBeNPF2MkEcElDoYn/5goQlWE5FbzNdzYT9RWXh3JQNwCBR7w4PCnV5y93ZA05wY3rv8kqEElXMvZ8NHO5AFUEWX+f8GBU9BOlamourxGDM1/qjzzHFWJ42saYgxLcwyhyxF3VnmjoVBIuFxWZz40kjSi7QLFXxwmiAUB4F90rn7Koh8GzT/kWA4plGFNmk3EOUmsYAvTkk/M8mTXcZH+hLLYXCOrcJIy4iiSAYe3n9CNFZw0dA3nLEcdXFpNUmAo7IZ/TaEpoHLEQ+YjhTGT+Sj0ULXIYW+EtNqYmuo96qyfxyhRjfK3bxx25xOwV83YRXM8hs2Mr0gwoOXuS158a/Q04IC380PsIVObAxWdDEuv6ST1XWwGU+dJCF1lw6egN
X-Exchange-RoutingPolicyChecked:
	VGDnrqu+oJNgkg7nJyfADtUyziL2gQxpLZw6NyT3/usnIMOF73PU6PJPBteTiuGf5xoorK2iKLQI6l3TdZjbYbU1MN0IJiKLcGyJ6DY7pDSTi+f6+Rkrs9SAFuDUc8QnvQ/xtakFRTwXz9nLfxETvCKiTQmovzvTa2I3TR1mqY4uHnTPFAQb5yOGZwa8+JBAf32nYzXxoOJm1SHoKV/UbC+fdGuHA6kyDOjrtrvZoYkC9whKg4qvTzMwdT421jhQLxe0Ts0rhsjS2O+cn9gV83r5Yf8QRDuSEAV1cr34fnBM8RJB3jlfTATcyfZ3lXVwXqaKWdGYA9kxpKs7rhRO0w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 09:48:54.9041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2b1a0c-956c-4372-d307-08de9f8b33ce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7255
X-Authority-Analysis: v=2.4 cv=EdT4hvmC c=1 sm=1 tr=0 ts=69e7480b cx=c_pps
 a=/Qmun3bZW4YbXd3UFKUczw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=TGldG2Si5N5j5AlfF8sA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: q5ZZsr-EPHbfLEHozEJdC_gT3XlCqYfi
X-Proofpoint-ORIG-GUID: q5ZZsr-EPHbfLEHozEJdC_gT3XlCqYfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NSBTYWx0ZWRfX4X9Fcd3Gyy73
 kcVWxwURjXOiZjcxWl1qI1JtineaJJfXiHJFtJK83JVci02t2RFTienlSWJEj4Rc2rAMnzJgpxf
 uDhlDFYL2L8Av6+oxDjgbtE1VHEFYEOOGALd6sDnZrwZ13ejm5/TFdIl2bS/3Rt/h1DxiRk4Dg/
 jieVpuc4NUTekGlhWFswVCsbhmx/EU32t8/uG1bLwhH7W/aO+/DvmB163Z9loTTNdOpldQSsXNI
 BTwe5eyMXi4DXF+FIs8jlsa7R5mJVK9Svwp4aN628IfsD14VGzE5YDWoR1xJxBnrEqx6a3S1vb9
 UuB6ePPQtzhGunn7gAZyXDkJfuB512p+YXgHR1bFGcYVjvsanCver8LXS/lK5OobccpNOUs5XKl
 8M1Go39fMhd9sxviif8oM6wg/cgK2ntwWq9IHwaqD0/Ex8UeCzegJOxaVto/2gl5l+EGN6sjVpv
 i05yRJN5RB7zdJIPZmQ==
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 21, 2026 at 05:30:27AM +0300, IRRatium wrote:
> Fix typo in property name 'cirrus,classh-bst-overide',
> should be 'cirrus,classh-bst-override'.
> 
> Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
> ---
>  sound/soc/codecs/cs35l35.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
> index 7a01b1d9f..7d9b42c5a 100644
> --- a/sound/soc/codecs/cs35l35.c
> +++ b/sound/soc/codecs/cs35l35.c
> @@ -1311,7 +1311,7 @@ static int cs35l35_handle_of_data(struct i2c_client
> *i2c_client,
> 
>      if (classh_config->classh_algo_enable) {
>          classh_config->classh_bst_override =
> -            of_property_read_bool(np, "cirrus,classh-bst-overide");
> +            of_property_read_bool(np, "cirrus,classh-bst-override");

This would need to check both properties. The problem is as this
is a device tree thing and has been in the wild for some time,
we can't be sure there aren't device trees out there depending
on the misspelling.

Thanks,
Charles
