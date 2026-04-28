Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917E3D75D6;
	Tue, 28 Apr 2026 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367167; cv=fail; b=tpaZ9VIjsd3kjaZXmeunZcCcbxYNru9+1pxgdm0VwXDL3YcWdeAnEVASr11IIXoObA9u9yGCDmKdpQFIda98r/HD4d9b1fFexvKHpgmiwD+lLT+LVwIvEfKkmzzTUGiqfpS5vjCxlmh7eY7TfuXj+r3KKA98POipua+qb/lZnZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367167; c=relaxed/simple;
	bh=EyD9gsQ6T476KrHmXUL96ste0PAXKDDkSou3Rhk0+pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxpPpxIH2g27YFM2FRa2PUQtB8bWEsCK436ILepCe0hA8LqOO3hDcl5TELnVo87809PyOoKuNubHTOW9z1FV8SxnLo+h5epS0zn03mFtjAy3YBiZpl+5OdHLQx6RFiCMqleUBdpdzAkeNKGx6GANGey5AKM/zOnRUQxxHgRJU4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qNfkSLtW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XZyKpE3i; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qNfkSLtW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XZyKpE3i"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S81aAo428506;
	Tue, 28 Apr 2026 04:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hP5iWulQLplmM/0se3hcLPtpa1PtAyYZofd5i+I6X7A=; b=
	qNfkSLtWQdgQ6mlM6HzcyIwbygmhJZvGoCdikGoc8RyHMrBVdUYH3CHWsWfY/xBD
	gWce+WxoYecnRDlu6NGTpEpyM0rw/J9wZsnSh2RVAeJ/gdcNbxu2VmdtYojUYpWV
	GXP9f4Iy0Yh+8PL97XlLE8jfLrmfxBfKAocx1MCDiiUi28NrS1o1nQLrcK6sTbPh
	r3bv2recbvNEy2CU+YyQXC1T8zxWdcUoTPNPUSYh96ML9PrGE200fVyIrnAzFczh
	dDwcvVdsQb9wt+UHskapgj382SIsT1FnpGLhILO4ErxHQE+dVauLNXpd6Yjap6Xx
	icQWsMcbbfxUJGuzfdFViA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021138.outbound.protection.outlook.com [40.107.208.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jkrtf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 04:05:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFeKq3yy2h1CjS1IP9Q7vZmNVpeTRWPXfRbSmAh6YTMGOPylKPSKVK/BIlr6j+bqttkxn0GyZ0c/w4q+DXqRFvnaVJ0laD/EZWSYxw6cZged971SecNKH3QpzjyBkuAVhrQokV9vBuh2is3qY92fPG0aIObvOOy7jvPlw+aWpi4UWMa2z5fZNmz8m+syWPf3SxbV1onG/sYrVlWmLcBXeZqryBxsL+c2SsvCXGZnMWsxqMddvOHF49kyZlDZwY7MZaKQ9THnQnN660aYqySRXPvHae51Ptf8MNhD0FLb0tIbioHAilz5sWxRvdfI9bnSj6kZzQCRPAlW0BIWUnCRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hP5iWulQLplmM/0se3hcLPtpa1PtAyYZofd5i+I6X7A=;
 b=PTtye5WmfXjQN1rr37Ol6bVXY/dokHS9Bjqz/ymVX4BK+eoDcE3sDfx93D5UgIzVgvyZF92OrNhMcPO9V9iqqf/ojxT7WHsFY89PLzc0iZvpgKHSxOzwiliV2UFRcjEqjrSbSDxjPuGIRJlmimQIah3fQO0UmjhrKdrJ1/3Jt8AenNVbgwFfOaerBKMzEqzLIH55T2MibLicVyxHp60m2J6f/sud+e7kpRL/ZU44epfGawkB+3QRgploMJzxQFllU5RbIAO09B6ch1wInXag/Yf5m7so4PrbCmSZbNTi63wP24GTabBhdd83TwWU5/uofMwkFhkkTFhCzP6sromW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hP5iWulQLplmM/0se3hcLPtpa1PtAyYZofd5i+I6X7A=;
 b=XZyKpE3iNtLTuymOvcEaPIt3fjPKDdMZ3IuQ4KiUU5XhONrAEgS3hAQW06gdyl3uhPRo3fHSlIe7v19qzSuBGmx+s5twQN+Pgv4e9DmPakyGAa5rRctNlZCjlaGPoRQZHRSC1bXncKNoheeBPmaj6TbCjVQudRiHX0smnrnU+3U=
Received: from SJ0PR13CA0214.namprd13.prod.outlook.com (2603:10b6:a03:2c1::9)
 by CYXPR19MB8404.namprd19.prod.outlook.com (2603:10b6:930:e8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 09:05:29 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::ad) by SJ0PR13CA0214.outlook.office365.com
 (2603:10b6:a03:2c1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 09:05:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 28 Apr 2026 09:05:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 45D98406540;
	Tue, 28 Apr 2026 09:05:27 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2D2BC820247;
	Tue, 28 Apr 2026 09:05:27 +0000 (UTC)
Message-ID: <ade87b5f-ee9a-4007-9b06-30bfc9561822@opensource.cirrus.com>
Date: Tue, 28 Apr 2026 10:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda: cs35l56: Put ACPI device after setting
 companion
To: Shuhao Fu <sfual@cse.ust.hk>, David Rhodes <david.rhodes@cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260428074415.GA1632446@chcpu16>
 <20260428080139.GA1649104@chcpu16>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260428080139.GA1649104@chcpu16>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|CYXPR19MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 6285a829-9b33-4db9-201b-08dea5054b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|16102099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ieFuZyV7q3wbQz7kJTRvinju+caOd/bsL2wkJDlE/ijW8bJYNPX9yv8iztbJbMXzZx2S9bmEsCuazbsY5gddwymo1+NyEeOBa3TQ9SMKvzU1gLi6VTnFf6jZ4rSZXN5M+apoRP6MpICuz2u4M+ZJ6vu+g1xQtih4E04aXbzkbyupXTnf2vNFmeOzK+Gnejm6kJnjxCIXtFeOvt412gebDW/02DSz37EbtyXmVPtWHvpziF0GpilVzEuhC8avzWw5aySaOQNGYw09TqPhbQPjP7RY8Hr5E5az+lF/0JZQYDYaLZdauGwMlzIuhDPFyPpQtzOR5YE5e7IHAxA6lsyP+AxBXpKMa3RSL0y54qYZKBiW15pS1R2M9Y2dWDpwPmF/d8v8Ty/cnJ1GW0o1WCv3OhSf4RhjaUUrM/obels7HZ0s5dtTR5EATVFv/r8gLL4B5YzFhLrqQDzDgY1HuBjj5DNJc7vZEb9V1mqBhecBfHrAXhnPFrvKYrwRQlTrEVOqfvdoI1Au+87d+KnRNDhRTQRZtI4z40Zp7qOmTTi0ctSLpmdAbq99riEBSjAuD5QARVtmEwDxSTO8dDPJ+NLv88/7HBtiVQgLOKN1rPoFL0egSeQe5+Cz6OYK1h6t61ml0/rBrwjpS6bhO8uduHSgZQsavogiup7zl0y3tVfDd5CevYJS/SJBAOE0tneq5+TCoSPaikq1bybln2h/IeUsURht8bq7raAD0OjRssRixdAQHAGBh7d9/bWePKbOSlom1rj5QizHGRHYEg2+sBGqYQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(16102099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rMuAs6UVacasNbO3flFMBfhHyQnhjjjMD4o6ttWSjiqM7+P7/DzqRM+Wkc+ol1N3BJfuskLOcccL9LJczQ97pXbkdSi9IS0c2ph6TDIOufY697ONULosyNQ5CCe02ONcZ4Vv9c5qlOvCKoTqxdtp8UWxzS0byy+BNmJHwOCf4gb0lzBYXac2VWjtUbalPI3sBviBXq2VzQxtqa4OETZvCmW3l7bGttevtO08E3vqPXzxgODmfNQWEsfmoPQMZB5vLpoMjiSYDXHA5Mdwl0ghQf3geRsVsaBz0QfS44RsFyQqNobs9NlCR057ykRRgyrQSBNMF88iKlvgoClWbRg25dd5967SEzfkyluJw0zFezGXzj0114a41rjkDdakv9FbXVneYzhWASNXQ0qJfUuHEZ+dBmRC+fLGXX5tEP9WT2yY1gKV/mjdLGon5KW/BN+N
X-Exchange-RoutingPolicyChecked:
	HZ1mgfBYX9Wrm5m1l3ml+EX35ielEQNIh01OLuxg2qK7xmDhQPtL+8EA9L0zlwUNg6XAMuDxrQTYX1Gk9piyPgs2Du9RCJNRVoy19Ksddc3/n8DCsnCoUP1xmMd6nhjXF5i/0BSJ6eZjRikRoc1PtdRgpkdvorTxl1kBOcMr6m8q04HQwRT1v8aJ3MbCtB746i9nH4DxsjmT14BBpNi86ovJG5CGsMPuI3h5eSl5cSVCSLnNAvOjPmnoFH3CYLHwqLWJlDvavf9nE2500iCNk6GCK3OE8SfDMSddYfc7hRle4bYhrVXTvgOWNBp3mTyb2vf+DV5rdVU6bY3iT2B4ew==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 09:05:28.6919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6285a829-9b33-4db9-201b-08dea5054b51
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR19MB8404
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f0785d cx=c_pps
 a=YXKrmmIzvBagYTejudpvjg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Ev2aADqucsEEanPrnGkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WgNzszBloo4AY4EhiDWt2-nWegA4EZHg
X-Proofpoint-ORIG-GUID: WgNzszBloo4AY4EhiDWt2-nWegA4EZHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MSBTYWx0ZWRfXzPrvrRVAunzk
 xtrM855FgBfBljFJ80jZhJacMqtVCZty3FYzTMSVJFtUl0gBBgX8vEC60mjL6ck+rsFlLzoKVrt
 PW8/ldBgkpEYLxKTTgMG8sxh9Bo9X+UeG4wR6c+jGuY3yde0ypwxM6SESZpLEFhB7eGl0XO3jzJ
 6MCMJekLRcWuFSuaRRElknoWC16WParfA/986jbGrdD9q4RTB3Rp/XqJHmXHMTjWfY+ZqdVKhD/
 IUnPZ4xI5EkxLrnYpsKE6MWxW1o90XflP+4u5GmhP85dxc+M8w+rc90KRpwtK5MdN/dRSm441sS
 0tOEdZEoiMvrNvkhRfhBYGPcdBOZE9FAXNTVr7KMeGBrdZiWgPQ8Z1vIVzd9vksh5hsiS7mjmLo
 8rbs4drLn1fEvD+7pZ01JolYvkth9qGsbFFM2sfBHEo65TdzxHW//BU2BOzelVPx5mQbXMmBhIo
 lHSomoT5V8S+rjggMFw==
X-Proofpoint-Spam-Reason: safe

On 28/04/2026 9:01 am, Shuhao Fu wrote:
> acpi_dev_get_first_match_dev() returns a refcounted ACPI device and
> callers are expected to balance it with acpi_dev_put().
> 
> When no companion is already attached, cs35l56_hda_read_acpi() looks
> up an ACPI device and sets it with ACPI_COMPANION_SET(), but leaves
> the lookup reference held.
> 
> ACPI_COMPANION_SET() does not take ownership of that reference, so
> drop it with acpi_dev_put() after attaching the companion.

Are you sure about this?
I remember when I wrote this code I checked the driver core and saw that
if there is a companion it puts it when the driver is removed.
That is why I didn't put the reference here, it would have caused a
double put.

> 
> Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> ---
>   sound/hda/codecs/side-codecs/cs35l56_hda.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> index 1ace4beef50857b..16a5a40899b2873 100644
> --- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> @@ -1032,6 +1032,7 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
>   			return -ENODEV;
>   		}
>   		ACPI_COMPANION_SET(cs35l56->base.dev, adev);
> +		acpi_dev_put(adev);
>   	}
>   
>   	/* Initialize things that could be overwritten by a fixup */

