Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BC3E6396
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406915; cv=fail; b=ikOqdnPlsC0HPIH4v+7xkGDqRrwNi37jsIrUastwSUV5N025o/p1YQhDuLkQnnKrkkwCb+bDKGz8e8O15sJB4+fEYfR0DL9WK2avProHn+Bb6X3wnlr15iAgyoA3p4V3oPUBoRAhdJ2r40gKgroWphWagYsvjc+sKVddx55gQ7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406915; c=relaxed/simple;
	bh=gOG2Kn9cANhMGi1qaItp+EKFFWauRj2czJ17yji0Kc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsQV46iF0ui6ywB2HyJegVQ1FfEXZ7acUIzvGAmZ5uy7LUlG9CYsXVn0tRLSeXjaRRiFHvSOIbZaTaeCmv9ouTAWEmj61Om+/jwGgehCxH5nvB0IuaIb6ZaAeUwNV8e5fmUe86uTY0IJjGYKseMVtHjfwNtX8Fa/7MXD/xbOaW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JhFCJUlm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UCdJnu3B; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JhFCJUlm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UCdJnu3B"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8p1Ll985167;
	Thu, 30 Jul 2026 05:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Oudc/DBvdg7luVQRi8
	NWqQIR8VmfL90HxoQG+Tu+AzE=; b=JhFCJUlmWsi/cBvN06pjOpN1kKzjywEmdY
	e/aPFcy9UnZ54ZAuIUmKKyrobFT59A4nI5hvYIYTyjJOatr6fz+BR4kJNrmCjhTd
	DEzkm8bXeo9eDImHNk3DEWe9EuIGZeZ3yDfIfVaS9RM8KumOvlkMpCNSns3Cb+9e
	DkWSPCAgIofsr/n0L6ygckUArz7vYFmFLWsaZZb0GgzRnXyr0KshF4rgqYyLCHCl
	ytEQRNXrPP2hO9UbCTrloe5irhzdK5QWapzgOiPgMieW/0jYXycN4m9RxTdvu9wJ
	VtGqV4hbUhCVi1jfQPohLS6RcbPqiaEZB2xzGbLU092UGNXKlskQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023099.outbound.protection.outlook.com [40.93.201.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fr3f9r392-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 05:21:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8TDoLOXoGiY0p8iGjY1qpd7pDGMVmJx5QcH6URRxghHWMBWxOA/vG8Oh/XPqkTm2DIT2LTygr0x0Wuf6XYb0qx9LA5YAp6gPwDm2CaO+S55/KAeLYGRWqG+ZUyU2cLsjL8WVaW5jjH7t3Ts+lHb5IlelwTLEhNaMNtB0Uv0XenGEN3KiG7TwI9MMDUIrhYiaKNjC4WzQB88cxJsnNpwQTZskwIYVWSim6jPGqeT08HkmKiYPV1v8R3B5NP4uRAr389XEfr2JqfyLuIomfA0naqSvDMbN/YEW8iMbNidc6cLKh7YTStBE44ceLEIsmpbk9oq6zngTfZAfr6Ky+Lcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oudc/DBvdg7luVQRi8NWqQIR8VmfL90HxoQG+Tu+AzE=;
 b=T0LTQ2/8+oUz7fN7JFfQ2TiEdQzGMlMvzE9iQydubiNp5+qWA9iMYh9qLN577E+TUR8JFTowszdumHupDrOsX7riwdtLv4CbZt1pR+sSTlQbBawbiMP9UnYEpeSOzo9X9GegW8yIE/JBlnz/iw36HBSbnBERsSg7rG0j1TdcJpnaeBnIWaAXnEUDA9JrnAkQjTR9PSenkQQybZkSkoTLcV/3wn7uxFB/JfKx75K+v3yuESCJsLYPsX9nQxYO9wXLEM5huLfXHfzE71fDbi/WV6YsG+2CZgUHJGZab+/7IkTwJxsOE1nMN9k22NbHo4RJabKUx/83USBKt42yojVfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oudc/DBvdg7luVQRi8NWqQIR8VmfL90HxoQG+Tu+AzE=;
 b=UCdJnu3B1zkSfVOSkQqK4USPUFJYynbqmN/VCl/SmFEoA6tFontjXqjY2NOR42lyPuVXKtAYgiNI3M2oTgEMEZxpHXUStcFhHulf7EL9U4BE5S3fYHAGo1Zq8NRQRDLafGxEmQ22XzqkwatA8Y+SiskMsggTWb5SvicovegwC88=
Received: from DS1PR03CA0023.namprd03.prod.outlook.com (2603:10b6:8:233::11)
 by SA1PR19MB7109.namprd19.prod.outlook.com (2603:10b6:806:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 10:21:46 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:8:233:cafe::a5) by DS1PR03CA0023.outlook.office365.com
 (2603:10b6:8:233::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 10:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 10:21:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5E9F1406541;
	Thu, 30 Jul 2026 10:21:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4543582025A;
	Thu, 30 Jul 2026 10:21:43 +0000 (UTC)
Date: Thu, 30 Jul 2026 11:21:42 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 06/14] ALSA: hda: cs35l56: Use auto-cleanup for firmware
 loading
Message-ID: <amsltp0WJZuBYeVz@opensource.cirrus.com>
References: <20260729083735.120219-1-tiwai@suse.de>
 <20260729083735.120219-7-tiwai@suse.de>
 <amsa/K5eyyCBwNLa@opensource.cirrus.com>
 <87jyqc3j5e.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jyqc3j5e.wl-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|SA1PR19MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a223f66-b00d-4a6f-e7a1-08deee245b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|82310400026|56012099006|10067099003|11063799006|4143699003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2i79Ct3b33NVSBfLDJr7hnGNbNzqnfzAM6GO/+rtJBr4UmCt8ZEid2gQODFInp6oqAVk6FRqWeN12ZQ2AhHnJMSvyPW4lokqzXN334LSCUIZcqFE6unBPzr2tgyfKNBhtw1cgD/lf5pSmXHwAi956bxcmtU0EerN/xP4rx4DZV8f1o/CimEkK5Kyax1jBrOLWnvXSfwDDuH6G3ollJSV+dp9n+IbyZpjbko1Ki/ItnDe+XRbMRgeQQOpq5Y4T5L/W3grF74FTcsLHLCcdEcHI+VB5hfquEa+Q7hzDP/P66k243fWmAOvBasaNFKX0lck+PHp7Fz6qJWBCc3P74hUEMuyvOS/a+kb0vFhdA/FFFgGlpyyVfO8MmaYrLLM7jVLfzsIP2YSI+w6PYxFWqHHgszsznJ1vkPq8rtk+6cAAZozcnwYGVEA//wiXB3aS+2aP34vgfmCKYEUhjX+G8SD/FzJeDvPX8nSxtBfqGqL6A6HlG/SpWjoxIpduH1VJVgRvzq3H4WBf4mQ0APUdo8w1+be29kFfB6kkHT9/q5crsK3z61r84wYePdzvXaYBp+UY2Qaw/LwOq+ZVBVvaGqgfOFnD2mmSCL6tii7QkhIqFryFNh2d+RkQ2c2um9p8ZtSN1xx5MppdVxhOzQV1f2oBx0I8uTde0y6F+RpYHZqLcO0o90c5teqSlTLc9FQMWhg9ocBELK+R3J2bOkY0VVI8g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(82310400026)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Eyy283++THU7ojCkLxMPYULcw+RcJX3O3asCHt3N+yv7GGL+xEabsasZ5RS3QswdphqgU6abK0YmThEU/EuwA7mK8g6tXgwg3Tytfoujwt8ZdalqlBJbcpT4JcE1k9iZs4I4U4AjlKICVpDi/in+ZzzDuk6/2CxSo+iaCWEuRPyXcvKXtDHix9tyWo4Cox2qWNq4lAwTTLAxY6n9Fdz7CLEh4lZBgG67MVsEIMIypDC/ULwrDe+Xq9ZcEXU9/1rZJ1IDcjNklVK0qprc3wKQbr+oJDyLIKuB6YpQwJR4ZQinwwXNo6v4eEAlku9Obk17Nb8G+NoxBVE7aFl6oBzOTMSv4Ux6JioTrE/zDscOp82I+/iSUXoKa3SNRd6AkP+iFwOcjTPCIcD0w+DD7uQ5L0vkB8Sp9SeU1havVfVU8FtsGnbn2B+N1UpIMr4OdXfa
X-Exchange-RoutingPolicyChecked:
	pVVGQ2eQYCpkv1dhAY1qk4q4nwoKS57Rg6u+q8xoJV2gY0tm8fJwR8obnjCNosMgt88qz0OAls0TJ60RZxupIfEEv8hOvNDNvqavSKkRXV18oP+kEh24zmJXblWhwrtYhbI3xGVb8mh2h15JX5Ei9B/hwPOUDug+I+Ko+jQ5f5hb2SzmBWu2fc2U/wHwXGZxD7Er3+HC5MWUhc2KQZxrqlQ1k8neYynCyua0F7CK2pGE6d9C/BQeF0GnTVfxdsoqs+hDpIyLhtNnFZ7jzkGQhI33MwwFz5yODOybhVBMZAjrmDPmM9pur69pkaEOjr8il4rl8oOcybQLa9VaDgPKxA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:21:44.5594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a223f66-b00d-4a6f-e7a1-08deee245b23
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB7109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3NyBTYWx0ZWRfXwr4iwiT1x0f5
 8tOY95LxF1AJF+pnFCwPJ0UKJP0dBrCfB6OBCmGy1iJrQt14HGGeootQHl71WqAv5OYmbbPqiPz
 geKpnuN0XYa1LwOCJoka4b2KG0qhZTPloY5wh6U9l89qWGca4y+kUuiaKNuKxEnq+Uc8FILA2bT
 tYETaa9KLNzi04MieY6tJY9FPoLX0YrJ01LuFNxHfHsisy1Prug07MgJ9bSR0/O2mbidCPiER8Y
 hYI9MaMsZYUUp4/4+0sSdWc/2k/ws+/V1yaqHjkv9UDYtORTXoQl1AZqTQpNHVfPTijWno94+Nv
 JQBq0DKMnNZzN9gdTKJ1Qizh4+JNiJV7VdAgHhLSkO10X64TDe3+Qb1zQl0PyzgILsjt9VSkOBy
 kIOQIlp4Yt+SdiQNheQYY4Zs6Ts3jwNLAPMIok3ugl2erYpMhiPe5s+hvbP/Js/vBnG6ZSCgn6y
 dBPaFbeztTXMesuC1oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3NyBTYWx0ZWRfX9ONHtZhf7SBz
 qwY+x7oRx1atfbGwl5MkmhYTGff6EoqVEnUXSI7lqIzx3vg0dZs8R3pmNj2vaPTwj3gG95rIdQz
 CEjFNs4vH615T/B9DaJuotquQ7uKJDc=
X-Proofpoint-ORIG-GUID: N6a_dfPu7rc9MnJXwWpG6nDYVniYAliK
X-Authority-Analysis: v=2.4 cv=OOIXGyaB c=1 sm=1 tr=0 ts=6a6b25be cx=c_pps
 a=ajv5h6Eily4lkhfMD1AUMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=XGqp-MHkOjXuXcV3__MA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: N6a_dfPu7rc9MnJXwWpG6nDYVniYAliK
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 30, 2026 at 11:45:49AM +0200, Takashi Iwai wrote:
> On Thu, 30 Jul 2026 11:35:56 +0200,
> Charles Keepax wrote:
> > 
> > On Wed, Jul 29, 2026 at 10:37:24AM +0200, Takashi Iwai wrote:
> > > Simplify the code to manage the firmware loading with auto-cleanup.
> > > By the use of __free(firmware), we can replace the manual mutex locks
> > > with guard() gracefully, too.
> > > 
> > > Only the code refactoring, no functional changes.
> > > 
> > > Cc: patches@opensource.cirrus.com
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >  sound/hda/codecs/side-codecs/cs35l56_hda.c | 35 ++++++----------------
> > >  1 file changed, 9 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > > index 78c2cf387a00..bc207ab5b020 100644
> > > --- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > > +++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> > > @@ -527,18 +527,6 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
> > >  						  base_name, NULL, NULL, "bin");
> > >  }
> > >  
> > > -static void cs35l56_hda_release_firmware_files(const struct firmware *wmfw_firmware,
> > > -					       char *wmfw_filename,
> > > -					       const struct firmware *coeff_firmware,
> > > -					       char *coeff_filename)
> > > -{
> > > -	release_firmware(wmfw_firmware);
> > > -	kfree(wmfw_filename);
> > > -
> > > -	release_firmware(coeff_firmware);
> > > -	kfree(coeff_filename);
> > > -}
> > > -
> > >  static int cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
> > >  {
> > >  	int ret;
> > > @@ -561,10 +549,10 @@ static int cs35l56_hda_apply_calibration(struct cs35l56_hda *cs35l56)
> > >  
> > >  static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
> > >  {
> > > -	const struct firmware *coeff_firmware = NULL;
> > > -	const struct firmware *wmfw_firmware = NULL;
> > > -	char *coeff_filename = NULL;
> > > -	char *wmfw_filename = NULL;
> > > +	const struct firmware *coeff_firmware __free(firmware) = NULL;
> > > +	const struct firmware *wmfw_firmware __free(firmware) = NULL;
> > 
> > Is it definitely safe to replace release_firmware with kfree? In
> > most cases that is all release_firmware does, but it looks like
> > it does different stuff if someone built the firmware into the
> > kernel?
> 
> It's __free(firmware), not __free(kfree) :)

Oops... sorry my bad, must be too early in the morning for me :-)

Thanks,
Charles
