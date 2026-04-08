Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0670E3D300F
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 14:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657517; cv=fail; b=Iew2ny1iPtFVW8L+wRf+ODj6zf6V4t58q+4/tNANlYJ4btykvUWgMgJZfgT4RjI5o7bxB4SULEWywNiEdU/Kf3J+6xYVF9uaroWbdyPlxORuqm1u0x8Y3qGwkH62ORNDnBM91+KkdpUMZbiYjCZyaHGpzObs+rUGeof4rKd66PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657517; c=relaxed/simple;
	bh=+hQzf/WCqVDpbAvR3yZJkHMl2p5cQrKfTYryp2GaFMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=da/DTAboOT5bH3stl1lIEYJpMahNxAQXkPz0eHrcu7D5KKKA143J+kTUieMdF80j+Du1BJUBvlncGMCFBoqGLzHi0sBfFYNCBxZRtQCZzftS+7pBRmyKYX/lv9fV8pQ0zRdhxo71EiYx8KkTpyUzpPkhbcT1T6WOgaPF6I4c4mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pWKPqYRc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=o0JgYdQt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pWKPqYRc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="o0JgYdQt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6384eUas683500;
	Wed, 8 Apr 2026 09:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=cXtzpnKUzbdYTgORtf
	QiP3QKTEv9Jl1vlFDT3Z+2FnQ=; b=pWKPqYRcHzCYvqmpdQzTQkp8pb6u2d10FH
	gs8mgJ8vzslLXc/FvTJiCsG8glAKv0xt0jVPeZykEAPHUxwMdB9/emKCtaYbupoY
	hcPzCwJZBK5hgAdJEpwDfSqbjcXSUReqULReM1n+J/OBysNL736JTLI+yZXo3rHb
	BcD4n4D7dYCquStrJso9sCALcb+55Xk5OpI+PhkfJyIeiFoPO8s8YOxtg4mMlQQI
	HyXKdzM9fZ7hQVsg7s/6r/bFnau6rKWU5REFGXqWCcpyQpEZQhJHd77pewiG6jJq
	q0c9KA5sDGJrtjbyPSivHsWPriH/Z0PZS2eIgqgiD9QdPtzWV0tg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021102.outbound.protection.outlook.com [52.101.57.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr7jcnu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 09:11:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If5saHSRtbsn4YtI2iGBJaJ2wpcYZvUjr5ZsUres4H2kgyKuz85xUT+g3pzvTEhYrcwEP9Gz0Yvjb7/Sl3iK661tZuDRV7hkoZdezboYo7WAHvKB3sTaTUsC+glp9dOnauG3oNECtzM2/n/dRhYHbpAl0UUOCFHCqRx+t0A+sWtodWqornGR8dnnGEdSxn/g5AcwLB+/Ce8jkgaUOG5e/sagH2gj6xvYiRyZfKu4T34oD5wZGG7rOKoWpOW76EH/Eh2zlaI/TKX+5vwXohOsCrVFmOKEOTPkzM+zcWrNlLgXQIk7zfgGQiukfT1TZTtuJSLmNCvuAsucvCgiW7oDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXtzpnKUzbdYTgORtfQiP3QKTEv9Jl1vlFDT3Z+2FnQ=;
 b=jDXNLSfZPVSWIR7EVV7jp4DK55aRUigvQ8XcELA/LBwCa6iCk65XJsssjiSH/5QeTFiZcYBkryXqy7ByxY9qH0WofJlmRo2hYC65rlgcsUe44HawYXn+cjoElAVkrROAjP49yNB86Bk+Bp6uTEaoSio+3JZMN7xqSnfW1srRrTCDUsRKWAyNHNf7dQdphgxwP/1c7HpGKd7TJgATVwNfZ1U9X2o/kZhNcL1OzCN5Pkd+8ztTPqCdoHqClwVLomZSnoEVc2zeSXR009l+Trw4cEp3eaMZasjvdOVkPpp1oa/qGGVnBXtgEsNNgXcxlZdYedCzOPjrDwqC3XSC2sq5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXtzpnKUzbdYTgORtfQiP3QKTEv9Jl1vlFDT3Z+2FnQ=;
 b=o0JgYdQt9anqaXjBrTsywsw9kW7U6hTaK70v41dxVvZxG2LIpk8d/TGHhi+9mjbyInjE7uqldB8j+kWkhPfHiOFRzEBIEiKiDT4jvLSPxT2qR56M5PV2LvlFDaf87EfvxvSHTGzBdZ3jOOL7AcNyO9qCjF8BFNJ6h5Tg66ZkpfM=
Received: from CH0PR03CA0315.namprd03.prod.outlook.com (2603:10b6:610:118::15)
 by SA3PR19MB9598.namprd19.prod.outlook.com (2603:10b6:806:494::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 8 Apr
 2026 14:11:15 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::37) by CH0PR03CA0315.outlook.office365.com
 (2603:10b6:610:118::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 14:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 14:11:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6C9E2406540;
	Wed,  8 Apr 2026 14:11:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5462082024A;
	Wed,  8 Apr 2026 14:11:13 +0000 (UTC)
Date: Wed, 8 Apr 2026 15:11:12 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/5] ASoC: SDCA: Fix cleanup inversion in class driver
Message-ID: <adZiAB8MuYFO2ODE@opensource.cirrus.com>
References: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
 <20260408093835.2881486-4-ckeepax@opensource.cirrus.com>
 <a4ddbfa3-127b-497b-9227-2a72c32ddd22@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4ddbfa3-127b-497b-9227-2a72c32ddd22@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|SA3PR19MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 84711a2a-8682-4c55-6c6c-08de9578b21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i30VYaL1wQKMmcfUxbKA5QpyFQcMyrzVvn2QyKbmyQpBnTMy2tO+3GAPuXdmOKE5dnl/gBNKxGmJSDV+5ou7dZ9I31SfK/1qIw+DtK8arjmcBSR0/XbA+z7Q5Cztb2O4IJwuFheZUUuZmFnlpOf/FM+CvJInoaouQJZHUf2Qep8OqiXrxuwvRhqXtt25NOKQmdo/JIbj6FoFjMiydt/Se0LC4HMOE7VRlv4P4HnOi+eR1a8VqMLpcue3Op04yEKaejMEQZE41Vb6nDhUCIa+rr7sbESfTq5f9kScOuKwzfZzUzHqUu6lLkZUAFGBUF/j47QwF2+9n6QONdN4Hx05XrSiRxoErqtazbh/WQC6BHmXjnCK73LeRcGQJ+XZqRFjYezFriWIumVZZNmsEYEhNlr7odsGf8YBJi+ce/a3XYxpdzcME0OAJcQNR+beZYoaGHaPsdlXtr/kTVbW54qfKfHxoFBbvxG0N2ne2OIAcM0JmWh7wnOfmfqe8E8KRnnjlxS0yfx8+Yo109tHj6oRkWd9aNL/hYvxqaawk5Wrw9AswZBvabWqbLASHJIF5qKA11NEdfVBcGlpFZ0UaYwPVmIofQMO8NhHtJXmylK5KgC9Uq2dH7Cv4MsmUsnZnQd7XeDMGEd/wZ0DVr3XIKwtGofEuu0bCZG4qsoztCW8tAUOGcrj4Ni/AiD3ketY2XVQ0qiaRPuxcmMzovunNelBPtJcHv55vxP7ujWzBwi8x986OaqhCjlWQorzDxzeQ9gWZ9zTKq5X6t5T3m5NeGjOPg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nHRFdexzajP53Py1GmXlBB2+dUhtJtm4p7xYT1AcKBn3HVs4rKLP195Cu5buYH43td2t1QU4xLvBwiXU1M3Ori0zzAiG4v2ayj5N4lqaB0nn7SldNk2Q72KNcqP7LRtmxjvuVOUgMRsWpIZrAnwzzep4UXU7juD2iirANIgnYsvYPR/FLO2TrS9H1diNvQO7WXNWSriXTph3xbeOdMSwirwAdI5byrrI8i6ZqivEBflTxMxfhl7p47YuBRBUrNOQ3xbWeEgWKCffjYAJVM3CVpmCoB/Ytw/eVhO2K9oTCU0vaSa/Db2qnXGoEoXP73EXoytLBComa5hsTA+bQe3Eik3Mlc5CunBNQ5XnIgUeQyzKUJhHo0jS9oXz5siC0miQBrdb8JwFnHxnlz8pFaOdggnDrzHioBru4lJELAFxGKbnS1ORsh4V+KgngE2aXsaE
X-Exchange-RoutingPolicyChecked:
	nXNQhFPHMqR5Ghb7HbY+BIotcvdm1vaIKUbxvFRZDzCUXVWFi9Q2P2vsj7TqKdAL4DxHZNtkabYY0vkCLuoZTVk2aKL1tJibPDtU/ZQaxGbnb7kRzBB9+C/8UdCNMGKsPenaYZv0y6cxVAUHSbbpf7QOhnezajDaZyzaqWMYQwhGghWu2Q4eOYQ/oCgi8PHhjZp2ZHgg6SAfBgO9dQ2ViDHQUL0NbGJ4ZWlyOL00hKbt3knOH3TspFvGdbqXISmUt1QzvFUt5V3CJEx4rsbMZbw+F+k0i8H/DnfYfnB0FKj00a298zGRlSantYRCn0ruFEbptTQYD7ey6RkQxTSv/g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:11:14.7576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84711a2a-8682-4c55-6c6c-08de9578b21b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9598
X-Authority-Analysis: v=2.4 cv=LMhWhpW9 c=1 sm=1 tr=0 ts=69d66206 cx=c_pps
 a=FCTj0ZxOUpDcrOysB+wcjA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=yUnle7PmyUFrXLI6A1MA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: xYsYn92Ec9QCvcuQAoa4YmyaP6yQ0ywi
X-Proofpoint-ORIG-GUID: xYsYn92Ec9QCvcuQAoa4YmyaP6yQ0ywi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEzMSBTYWx0ZWRfXyKolOA2MTxWS
 AZyMr2wDBzTzVR1v14KP1MX0lQjSptirHGYTFmNDimCs3M2ARsNA+KN+TW+f4OqjPWF5wTl5oR3
 b1P46rr202aTYn/d5jV1OrTKEzWLXiBqFzjXZzZvGBs6diZjYxkVMOFzDee2CQZMDgnuYANdar9
 HM35tUlIie0wbi5IB34hNaQlhTxpgbzqowkMUf/ciYdn1aDJ1AdSJ3QuMzbD1ha1F7fVWO2MMPp
 zCVkG5GCCPDr8Ubkq7sHdHX5zdFLh+XaERFH+rigd5rWNFXvvq2dqXNn6CP+++N7vezTgUWlo19
 uisB95cAUN3NFAYSNrzmHW7LOWDkFovuTzMOvQFnUEiWPGqOuUnGGLJK2VA30lklrwGre3ek+3u
 8qu6lJ1Af8g+74ooJ6FxDhgAtFGxFg43tdZBo0ntTV58r49h5Q/KCy6vsGR+JPmmxlbaE+gP6x3
 UMLoYaL4z/sX66fCJDQ==
X-Proofpoint-Spam-Reason: safe

On Wed, Apr 08, 2026 at 02:43:59PM +0100, Mark Brown wrote:
> On Wed, Apr 08, 2026 at 10:38:33AM +0100, Charles Keepax wrote:
> 
> > This led to a cleanup inversion where the devm cleanup for the parent
> > Soundwire IRQ runs before the handler that removes the function drivers.
> > So the parent IRQ is destroyed before the function drivers had a chance
> > to do any cleanup and remove their IRQ handlers.
> 
> > Move the registrations of the function driver cleanup into
> > class_boot_work() after the function drivers are registered, so that it
> > runs before the cleanup of the parent SoundWire IRQ handler.
> 
> > +static void class_remove_functions(void *data)
> > +{
> > +	struct sdca_class_drv *drv = data;
> > +
> > +	cancel_work_sync(&drv->boot_work);
> > +
> > +	sdca_dev_unregister_functions(drv->sdw);
> > +}
> 
> > @@ -157,6 +166,11 @@ static void class_boot_work(struct work_struct *work)
> >  	if (ret)
> >  		goto err;
> >  
> > +	/* Ensure function drivers are removed before the IRQ is destroyed */
> > +	ret = devm_add_action_or_reset(drv->dev, class_remove_functions, drv);
> > +	if (ret)
> > +		goto err;
> > +
> 
> This means we register the cleanup of boot_work from boot_work which
> seems a bit fun and...
> 
> > -static void class_dev_remove(void *data)
> > -{
> > -	struct sdca_class_drv *drv = data;
> > -
> > -	cancel_work_sync(&drv->boot_work);
> 
> ...what now cancels boot_work if we somehow manage to remove before
> boot_work has completed (possibly even before it's scheduled)?

Hm... yeah I think you are right there is still an issue here.

I think the boot work sync should stay in the original remove
callback. The sequence of concern was:

1) driver probes
2) boot work runs
3) boot work is scheduled
4) driver removed
5) boot work completes

I think this current patch addresses calling
sdca_dev_unregister_functions() but we don't really want any of
boot work running once the driver starts being removed.

I will respin a v2.

Thanks,
Charles
