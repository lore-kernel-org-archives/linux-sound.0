Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20CE38D3F3;
	Mon,  1 Jun 2026 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304470; cv=fail; b=Iwjnbc3Du4duMDQc6FDDnHI6C72LjQZ/KoOoCHeqt5YgJT9LxEhICVkiwC8AlCRhiMzNH11o7CtxQriNOGBlUo/v82qsCih4O+nLY7OYpTxwHqyE/3EnRB42foWXUc9OvKEhb0XB47RhDx+wfy9cXjmUSDuVw4A/r0890NPvUC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304470; c=relaxed/simple;
	bh=alT7G0Dx2Rn2i8w4wTxueH50qvyfCGAKjQrYk+f2dQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCiDqfuqKruZLkHZE4WwIEHG+JG/A74bqFhxtEyu69GQdyPgzAXsZM5ATd08DiuXH6/ZfmMfQ57M6nzYP7uMKDVMgbdpT/m+nmWuHMmShrrvqJYqRG7yNaDoa7ZRa116rw02iWOf6ayTa6RVCOBl3ANdm83MtR1iWCKHmbXvETg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NgbHQ2gr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Qh+p568n; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NgbHQ2gr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Qh+p568n"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6514xcLU3655640;
	Mon, 1 Jun 2026 03:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=q2V1PwTveFRSvm8je8
	Ul0UeTMRMSVeJ7ZTGYn1akFhk=; b=NgbHQ2grnTRnfeKTsHB7XgotlIl8hldaDR
	4ekxMGc/tG4S8Ep9wmOPyHkBIrrHldOfDqVnylDCI8PFLBKBvo3zLshQDJPqA4uU
	MuPr3qHD5LBTb4PDp5hKrP7myH96z8UssI8q6CfZd5Wks0+Odlq/ubx5zsqNl7NY
	IGZMMUgkjA3qFVMh+8Pd582qZTLJ2DMq4hIJZk4qf0G79k3Dk/n1cvRkT7vPGe3P
	vJ03z3smh0iFmBT3yaRbwU6NHAwhiho7O92kMfuwTI8jtw74CxH9q6pB5mYygsI/
	AK/NkiGfERvniixLDie7HhdWhs8h1X/AycIOfPP1cU0OIUYp3pAA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021074.outbound.protection.outlook.com [52.101.62.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa125b6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Jun 2026 03:39:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9ZtGZ4P9DL3euhaoYRWNSi+DEjgwjkHy/R7HBVZxOoxOx+4Km+X+8oCtD0ST3a3+HHAg5huDbivofEc1jpIgAcYUWawaZb3M2ZidJD0yoQpU65lVaRQnX2t/fpebxT7fJdCX4BXU7XWUF4qlDIQgo12orJst1Z6oSIJ7VsX+cUDOs1+Q/7Z0tXjnpBkSTK1tFKyK6xZZqfwj3OXeGNX6SA7duhWX7DqWcSXZ2BhT8isac1++8aKI7XNdZEKVrG5zuSq/d+W1tm2n1fVQt6CvJ8x56nhtUMlhtmDMKlaDr2+4d6Ku9I08QvmsjyLIwTnWnne3Uomqs/JPt4zeHCo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2V1PwTveFRSvm8je8Ul0UeTMRMSVeJ7ZTGYn1akFhk=;
 b=sYAMcLcvOBrL1tFDwVdo11f8KGprq0XoTtqhOlUF4aDKTqmG4IGkCtHR2ewd+PQ0HngPrGqLT0/YMAHF+mQqymW7QSkhttvq8tBJ1fZQUljLXo4v5isFOj6FGaMtI2fbSyJQvMPjVeTufPYHi6z8lspOJvBRVlMLPc/gnFP9JKwJTvKVGvehBlpNHmDI/9P1JGwY3L4aHK0W3INrONGdaq/keabRGSuVrrQNToKHq5Z+CfM0D/DABehVWPRNVvuEtx4WoJEqWpOZ7jcWYFvp+/7izJHFaNkmz736LS9tIdSFarJ9Dy4vvDjiJ9r7RCeVZMh//v9iX1ih7u7iYNRBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2V1PwTveFRSvm8je8Ul0UeTMRMSVeJ7ZTGYn1akFhk=;
 b=Qh+p568nmWG3FZQqI1kHLNo298aZxGCuxhMuvXz55Rbj1IFbElgOYxclE3ai2Cp9f+ELTUrAGD6NvkLuuwXbk9EZcST+FeV3x6RBxgU2RRtLJ4yLx7J/rA3pKbRrd8DN9ydRIIbQ29IwDPU6IutIDrhWSyn5yHSzZJsW5Htqj2o=
Received: from SJ0PR13CA0226.namprd13.prod.outlook.com (2603:10b6:a03:2c1::21)
 by DM8PR19MB5255.namprd19.prod.outlook.com (2603:10b6:8:3::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.16; Mon, 1 Jun 2026 08:39:16 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::89) by SJ0PR13CA0226.outlook.office365.com
 (2603:10b6:a03:2c1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Mon, 1
 Jun 2026 08:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Mon, 1 Jun 2026 08:39:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 60D70406540;
	Mon,  1 Jun 2026 08:39:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 462FB822546;
	Mon,  1 Jun 2026 08:39:13 +0000 (UTC)
Date: Mon, 1 Jun 2026 09:39:12 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: chancel.liu@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        david.rhodes@cirrus.com, rf@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Message-ID: <ah1FMEQroBCjOCD0@opensource.cirrus.com>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|DM8PR19MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: b6998ff0-ee9a-415f-070c-08debfb94382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|30052699003|376014|16102099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	cMBFrV33xDoe4o9s/JJgt2/wfkXj5yinQPXY1oVjqh8bxgRj9bmX5+yb2ahvZUVwBdhXigQMkg+TiFqS+cRjnCUZoRnAMgpKfLJClFvjiFQP2W62v3ZnlAgb1X3Sge3dtJ6MYIN1oEEQdFFYBVlBdQmG2iT9ZtMEhxmAGAhrSII5rudtOD9kLcvQBemNEeL36FLjE7RQmIa7Xfhjt6kZCw04hqN62DtI60RtkSXG7oomBZBxqWK/SHwGc7/zK2o+4w/wUTqT3B44jVj5LdDcjMSKenB5DngVUx/U5fm03SuWf+37KqxgZMJVG7nPbOXYYYdSS2DafFPRrSoXU8RREtCgRMRabfZ7bgpij/JbdduCA5hUY+uWQOK+PBvIobMdFgvLGblpPK5jxLYQNf+K6kVEO200ZI0t8raqR8nRFoVL/JSGn/qnW5le4/FogyINUyCvmQfcEmZ9nZKYoqURDK7/IesJO1gi6M/DyESJc6DPBOHe5/V6ERoyZAyvxpdRhdk4etQu1Ii1SZzNPi84Yk2LYHxrBEGoxngcflTOhYEIrqsBkuIA1FX4IWF7QDdJFO57ZMnFPU6byhVoyL1G0FWXDr6f/3xxKSCAUuP9f5NGEi3kTk5DljepVZb0xmY7X/OmIqYQWjanPAGEkt6oAUuowvpDejRZIsoQQ3VQk51VmCHRL2tKH4EMpFERpcEuigsUDZkcRXM3rBF9le7MGN2ut6HHqq2dJH8XOuulQQ8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(30052699003)(376014)(16102099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KOsb2ybroe/x+8hEdsNF0xvmJwuZCYBpgLLRUEdZYY1RGXEC5MBj1pqnNaVnQIV33qprzOpvgWT81m9bw2AI+4GrcF9Ee4Dw93xUxCRKgCNgoGSXOvJFaglkXdf2o5z9H3b4caZutwpMNSMRc2lOqLWySCZpwbV0SgjACYwkMa+iY6nFCAImf4ZJXlQ5vI1TehDAmkmk2nOxoPQCt+4HhgZAEwU8McJPt6GqpXymGJIEYFwKTXSiI2J5Wa/teYndt3+HBqB5cl7VL7NiUgxIochtvveKfyervxEjDi6f+VY4zVvy6A4PTOpFGPEWyUyUu3fafLFt4kW6eY2cS2z63x7Po81mcLDYwc6ILzs1IHUqfCrdu06haKZVF9XBsS/g0037W2T3AEXY8NDFSdgD66ECuzfdR5rtUKxh7SEQSdgtkphbjeBbQfX+mu+ywZpn
X-Exchange-RoutingPolicyChecked:
	mpLQZq/HNnKEqaRAuTQHXBHKAPnISnahKsHmEOI1mBThu7dOfMub7uIy8yGyRUAhYv9v63j+gOQQyFjov488fb0v8+Zq7TrxcYQH5PRGWDy5FiYiKLzEk+X1nb+SSm/AqDkjRFJn6AwgRKQFuqHgvezYuWiAd8lHUyRIaEJuMtAeB3N1WQLqiB0eZfLPqKyEok3CIHim2CvcauxO3xbNe8e05uaGaHCr20Ej4oxbERHQyDBG8AU+UqJx80daEXioTBKsv+N7ZxojJztMH/ZrJbYmhzFY9SPv63BEzbIjy4dqJ8jPrQPf4z/2aUJh610uzD1PNB+ZU76s2OafzXgtxg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:39:15.2445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6998ff0-ee9a-415f-070c-08debfb94382
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR19MB5255
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a1d4538 cx=c_pps
 a=GnodoI7vw6685P6KDJTVEw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=EabIRZSp_1HHw_GfTpYA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: vCQOJZRoOYiZ7TVGr-NBInThpt0sZ_ed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NiBTYWx0ZWRfX04xUXOKb1+1O
 IMndaXTtLvqI2eHFDKtggzZeazliUIRsrM29KcLjwOqz6xnPg4QM9ZKDPYIfn7MzllQC+7N/5Eq
 DeUxNxHA+X/IHP1I1CPBxuvaDV9o6qPIsf1vkawSUtUofT3webPMrJk/SKskthD184FNPw0SX7+
 9ywNFJzoa9mULcAzeeKN1U6q9ttkURe7zzjkNddYtd1fBzD3AwYIMf8Dacp2CRj6ZmB2Y5e5cVa
 sw/uo3ucdYTfeR/gdMpC5vC5qQDsRxJtFfJLiOd0dGeCpDA5xiuQliudahEj/3vv8WqeB01dcez
 cz8i5K4GKv9vlV51HBqlw0QqqUjDqPjYWBFMdX4mtODMu0yJcbABOL11wAZzuXFyMdP1i6FtCvX
 x9dcCzT3dx15c3Xsf7LghlKeuFVh5uo8JGSjaVmaBpoJ29aYpaa+SC2Y7F4n8dfoKfJzo39A9nS
 WBv9QRWTiGNej8Iy51Q==
X-Proofpoint-ORIG-GUID: vCQOJZRoOYiZ7TVGr-NBInThpt0sZ_ed
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 01, 2026 at 05:02:24PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The existing cs42xx8 driver only supported I2C control interface.
> Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> +static int cs42xx8_spi_probe(struct spi_device *spi)
> +{
> +	struct cs42xx8_driver_data *drvdata;
> +	struct regmap_config config;
> +	int ret;
> +
> +	drvdata = (struct cs42xx8_driver_data *)spi_get_device_match_data(spi);
> +	if (!drvdata)
> +		return dev_err_probe(&spi->dev, -EINVAL,
> +				     "failed to find driver data\n");
> +
> +	config = cs42xx8_regmap_config;
> +	/*
> +	 * reg_bits=16 makes regmap send a 2-byte address field (big-endian).
> +	 * write_flag_mask/read_flag_mask are OR'd into that address field:
> +	 */
> +	config.reg_bits           = 16;
> +	config.write_flag_mask    = 0x9E;
> +	config.read_flag_mask     = 0x9F;
> +	config.reg_format_endian  = REGMAP_ENDIAN_BIG;

Probably nicer to just update cs42xx8_regmap_config for the
endian, I believe this part is the same on both buses?

Otherwise looks fine to me.

Thanks,
Charles
