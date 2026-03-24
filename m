Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7F22D63F8;
	Tue, 24 Mar 2026 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356864; cv=fail; b=pRk5gHmzrVeIvPj416M8X9UPP2uIt7OlSK38lAIQ9P93/Oxo1d4Jpglo+tGL/2STLF8gAveOr38pSK7XzuXC2+KP7ScQwsz0eTX1kHJ8/ZXSeq8Nr4h3TtyvEOF5puma9pywll9rzlgFDsPJtCKMOmlfSfvZgO7evnEfnOxOYyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356864; c=relaxed/simple;
	bh=6Xv2XHoDjJWs8EHcxMy7GjiQHosKI3hoBAzmM9XgdjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snVRL3laIN0AyTT3DG+Ow+cOv2NLwrXQHDqgH9hF5DB/1f2Ua03udw1I3EFG/aTOtcqZ56oaqJRFzxkEF8bSVUN8IcKK9+dtYsCpdq4LKh22/cc0upjR+VPfHc9qJamGx8lw0RJtyjomBXtBC4gsbsqHLcfjGetAgqVDJjpzwno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DHnHNbSE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oQcUsWuv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DHnHNbSE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oQcUsWuv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4k6PZ2587411;
	Tue, 24 Mar 2026 07:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=O060Qku1YOncq3r0ze
	+g/ACDwtywQX5pVGfvzG43gsc=; b=DHnHNbSEKnIPGnv0com4CLvJGsrZcNSl+m
	Brvq/VaHAGM/eb6vZN2+QZLqFPYhGiMvFNVaGHd+0YZmNMlKnQIAdk1R+Znql4hc
	L9UNdMX9PoWW6Dqq29TabUj89PrRHbwX/0sfuy/x0ouBRVa8nsT2nJCWeg0qnrlB
	uPBCtM5NR7iodA49TsGZ0pe2Axpd5Ou7JSMIuxSV83YkBPQZpWUidRUHVXRjuGu2
	kiuXbtNk5j8FhMTIDpd2RrTZQnRzSobpm6Ry9WmQXZxQmcsZK85p4FM4mRhGDkt4
	DK7CUwM0C3kbq/PtvwtaYfXQA7d8/wF8uLZJt8Vcr/wbBjy/AeGQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020112.outbound.protection.outlook.com [52.101.193.112])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d1rqxu2an-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 07:53:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPzpgxKWat/DIljoqJa6LKes8XgBhlyNZK6TetyX6d46zaf5PJIhtNsKLjxdECg6AGHHlUc3RSYcunKFhqPM8mL2RMJR+eei0G+8q/LPBYVtG/3yBR+btgRcRVaiFswdRpwMJDL90baTWmSiRO6z83ZULOcPnhHKTK84lA05sIv0YRXxQ3Ko/v4+rLBxiyczvNnyz7doPwXROmbgTIV8Y0Nfum1nr9RkvE4tKX8R2O0SyTp4SsHT3FMJZU4zp00ySufFdfY11z60fPoqZOYn1Oa/N0gTuQvN8lx3jDC6h8u+RWzWLxR5iGQFPpbYu+ge+pPOwuoZKV4IHahxLIDKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O060Qku1YOncq3r0ze+g/ACDwtywQX5pVGfvzG43gsc=;
 b=X3KoDC7gspLCDqVp7Ftl1k1iOhrCjf+1JD4pVCZWZyDPuZBUt6mur0I5N7Gh5VfTscZzhpHzDe66OIJjYbl7OjweGJ+zJw52vQXxxrdax5IG0ePBXHZmUj0v/U68uhefKpLlF2zNFPMyCDMINon6W3t562DOhAEDXYLD9BUhOxGhwBiiYwnm4f35UCzgMQMnL1eRsjP+CL8oM3G/pozwE0mEupQsn+UnrGQqdKJK0f4Ua/RbK1UCWc/tXcHfNQfir5n0kkSn5LiwlcMVYZEygLzgYKViQIW/WtjyeritA8gxfpV20qTpheASxUsEwZqVeOAxuymWx0gMnWqKbkG35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O060Qku1YOncq3r0ze+g/ACDwtywQX5pVGfvzG43gsc=;
 b=oQcUsWuvXsvyuvrRyznkGD7HO/B/jJyTJ2XLcCd06/XGi4wyDOxSz1wdbLM8zZjt3/8su6hVN8fhnJgPd6DwxGkUxbid2lqcvfaR+d6TIYhLSNN8gezPXVtMvw/hUpCukr5TMt/rPRXgPew1rE1R/MqEz5Gr+YACl0RlT8ns+7I=
Received: from DS7PR03CA0242.namprd03.prod.outlook.com (2603:10b6:5:3b3::7) by
 LV2PR19MB6005.namprd19.prod.outlook.com (2603:10b6:408:17f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:53:49 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::e4) by DS7PR03CA0242.outlook.office365.com
 (2603:10b6:5:3b3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 12:53:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 519DA40654A;
	Tue, 24 Mar 2026 12:53:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3ADB3820247;
	Tue, 24 Mar 2026 12:53:47 +0000 (UTC)
Date: Tue, 24 Mar 2026 12:53:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v2] ASoC: sdw_utils: add vendor_id to asoc_sdw_codec_info
Message-ID: <acKJWmM1exmjtocZ@opensource.cirrus.com>
References: <20260324041300.784-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324041300.784-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|LV2PR19MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 3970f351-4bff-4f44-ece1-08de89a46494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|7416014|36860700016|13003099007|22082099003|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	osddqbcI0liKcQdvGGeGSWgY2jf+PaZq0r5/jL0bziE6U9qzMschHHk8135IT8ireg3b++yl+low31LJ9xDfi6wezgdUjn/XauJwGnH3JLQ3DaCG/1Yk4FdQJr+RwLhqZRicUpdN5GjGUXqKZqGqiwn8By2fzCL/Xtu6zywFpil2TTqB4CnJHJtxkVApKBHPh1BvT8W+KwfWLdI9gJ4X+x1vK1L4fuhyUPaoHNk6J1j5OPQtq1SghBsbdFUGc1P/23wjVB9n2CoNT3Vi6+EMH8Q3NPwZ6hIaeIMVJLn0TFGKtbodcP1s7FmNJieZfHKtfZQPQ8fSA7WjYzWIVVzemp0S/aptbjxzTHuVPZW/JlPr3q7KGhxqwJLaCn2vlJXr8MGH91ycWHDVL8iKPpoDkA/17iiVn3t5vqo/HvShhZEKHrUQcUAautABu7DRvkNe1U1ea3K3r5mrvgHUC9RZdXSPQTrRayypab3Y0/RC2DztO9kz+eOXq8sN+6Utxke6HYPnMB8kVYulFYl1Ac0Oz8pdU1I+lPtR3J37W4H1KNA3Pct83neWeJ0aLGdygvC+655C5CjS/zEj4adNCpikFxG+XG2k5WUnTW6byETZvsU8kfJ1QN3206tw7lfjmur2/MjQTjTHpUJuB5x56qJ1NsxO3zWAV6NMvlFnhAOMBJFdmBzCq3xObtcmQOPQc9TGmUcM4xlbITetIj20dsiTww==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(7416014)(36860700016)(13003099007)(22082099003)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UIL7/Rmqp85WPMORzotpQezs3pQIjbZP7TGn4vIyWo4aPU01NMqUyYPP74sHbkrInUFTP9qP2lg/OqKgaD/e1bh/u9Ca9BFWgb3WH3CZb02paJKSDEAhcFLJWFh+ufCZ4GcWotJDRZOG6RaPUmI0WoWACSuPe99YksNN4GuVyGWI+Arrh0kJnBakRc0XfxkGd46BcdZcuwkr+eqXVeIZTLlnyQu8aOCJ724mZe9TerVmkBGP6wtvj1GC2nDWOPtN5R/ICH67HGhWs0kXQluxQ2ANWE40liVAe2NOnpDeSX+v1OZ5Knc5vVOUfJhYPHjdXH8C+vaGBXCIX1cvIz3p0W2RxqETsF7NWcoxsj673SNgoR2Jj050qXGEXa19/Ku568Xqrkf2/grLR7+XHy6cwgLM3iBJIfTH2CJ3AATpnENAOMRhOQUh6hhGYb9iWBqZ
X-Exchange-RoutingPolicyChecked:
	Dpo9shPiEkbdhAAlbbbtYnFssQ4X032DK2amjLih7pWW5wsREXHNLFKpMu4WPIX5EmJmgTj5B+YAGLyBDYXSMN53riWaxAncCNAcOlNkezI04IcbHaoMVtIxCRrfesbUzOg7H5Tgc1ECD6NDHoSNbjR1vsxxo2gbrBqiu0rB9fK+7hBarxCUhEh16uT10cNFrdBB0ULDLR3MVI1jq7ZsU2HtcjezCwiO6xBCWMDps4LR9DkWGpLQx1Aje7KJsefrpOB6pG4dmKwiA6eRRC1il87Ho8Th/RR86wXT7kIqCmbSPcOjwxAalBah7VgOA50xJa47o928/G75Dg3rmF2VWw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:53:48.5748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3970f351-4bff-4f44-ece1-08de89a46494
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6005
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMiBTYWx0ZWRfX0cY1bLaX/h8C
 DVfOriHUhmIpfzFHto2LeLeEDRWAlORXGbrGcDgp02fCwpZPMUSduoJMblk93F3oMGOAVM0rwor
 z4Tj/ZVhzWDVTXRkRJpFxgotZHWarK2f+vAWZ7PTrJsSZWDHXH2t0hsjdy0uZcBgPnwkTHEofeQ
 8bsk1PgvFhKNIzqdSrwsT2PPbRwWFaFkSFJjV3yllM5PkypFLefm0/q5yhwOaL6Ih/kb1zejBSz
 tuUogkd2eiOua3zTy4UHUqnSJ6OVXwUs0pAPKQbb8UJ/eK/ulAxhgtConUoC37dwd1V7Oabd2pS
 a4SwTu9P9KeCJ9ES1/X4zQVd+m9tOWVmPqobMyz40n1PEWOC5kzjYOIdzcGHBqTUZB0ihU/3zkf
 cYATyyxDCFi6vAqpP0yrQYYIjX5i88hbINXbkpYz0QhzfwK+BFjtk2HvTL2kB9g3hSKe5ekBy0x
 VmsNl9q+AcVGWFbWBRA==
X-Authority-Analysis: v=2.4 cv=DKiCIiNb c=1 sm=1 tr=0 ts=69c28962 cx=c_pps
 a=BaoCR4Tz6UZyH+gaSl67Ag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=KJT-RnjOAAAA:8 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=Ufunx2ZkT_8-Zqm_U1EA:9 a=CjuIK1q_8ugA:10 a=HE_01F9_QflCRFonrIQr:22
X-Proofpoint-ORIG-GUID: vYzKs4r5yu_qz7VoIxaJD-AOi8DsMbwh
X-Proofpoint-GUID: vYzKs4r5yu_qz7VoIxaJD-AOi8DsMbwh
X-Proofpoint-Spam-Reason: safe

On Tue, Mar 24, 2026 at 09:42:59AM +0530, Niranjan H Y wrote:
>  struct asoc_sdw_codec_info has part_id which is not
> sufficient to uniquely identify devices. This change
> adds the vendor_id field and updates the codec_info
> list with the corresponding vendor id as per the
> Manufacturer's id in https://mid.mipi.org/
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
