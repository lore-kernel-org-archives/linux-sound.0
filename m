Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141AE4582F3;
	Fri, 14 Aug 2026 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786698513; cv=fail; b=I56VE1E5n0OMxTnHFQthQwidt3vOldNd8F4ZVLXLHKF+qchIBJulFXTd+TAW1av6jcIr2B14Od/8oVkHdcF1xEyihYMJk7oJzQLE1Vem4caXg0Krz/nEQIg0D+8kiJ0TBjYNm5ukxEVj8qpibcW4MNAAnQwfhRjXzCf/6JtjmEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786698513; c=relaxed/simple;
	bh=z5eSMQAN/GrST08/s4HQkkIyDXfKlJHCogaAsT957/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSsK//NpiGusGOJBVskAp0YZo7z4MXzOYjLpvhaRT8sGmQV0EQrHh4QCGZWgeXNAennFODZosC2K5UFV74XSNn/lMeAyGjsvR8mJWn/uyW/GnNrrn5QX+qEcumwsQtlMvecBJjd/Pc0Hzufh9ERuvIP8JZF+GehSJuyRUrYf8ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hW3irj8Q; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bV0bmtJ3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hW3irj8Q";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bV0bmtJ3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4fovY3571378;
	Fri, 14 Aug 2026 04:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Qq69nGRFtUT3kbMVNMbhjDVoWciPCulgY1tjWYyi7vM=; b=
	hW3irj8QMA9THSNRMPTAnEXE6nlNEaSOexxdvodu9ScUdlr3eAS+C0ZFZu2OQmcp
	YfQIk0aCTzytZCcXec34P4ATznieEVxTinPhCxfCQxJFdGTfeI9XavM6prDYXuKt
	kDMv2sdmj1C/8GL1I/eFz1MAM2m64e5HGL6LhCJkijwyzjTiCn8jDbWA6Dr3O4O7
	3V+j+GE91KfntHOEbGj/QZzodSLiQY/rDTqtA3zv67eOQreAzeoY4ftQGdKtozD/
	+OC5C8gYEYvv4aw8TzELmJainPV18TNtnKx1ImvGkPcCM23M8JZS4dGikeTFq2fl
	WJwNPUZcWBiI1/3DT5JJMA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021108.outbound.protection.outlook.com [52.101.57.108])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v13cf0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 04:08:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoUzFNZ6oS3xRz/o1fYvk+BYDrWTNA7itE89mN6YrYefedIlfVUhlfujthNHTqbCjyztBs/32naJJyw0fjkRZYq7H7DdaClPGan2TvpNfmjfUA0mZ32hrF9wFmL+sBKRnzrZD4ebrX8McqCD+wGwNWZD/DhBlrj4wX8OUvMR0Ssg4MztxrSjJkw81ER8SOZmOAHHNDi0fRULyWQ0AF5Do2XSiPQ07mTP/422aORy3dUOuxLkzKGF0630QLGcWoNajpgIyCIAZZ0rvn3AHlV8vVmlKYN0hJMbitAYK+1AzdSffmKRj2RtlB3SLcaFNxbdli9Vn28iR5cFMsNNEAk9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq69nGRFtUT3kbMVNMbhjDVoWciPCulgY1tjWYyi7vM=;
 b=dM6WVRzEeRxO6E72EvmE7GcaP+8kAGfxgaXL+VjncxnoDUr6RuYjIXmv9d562J/DD13OX+I6QSVwnGux1U4nSEHgm/6AG6etgM+bDDOsY45cBzA5ei51AVCkqJW8odaZsvNDd+cCYoR/VGoEHRd29KgwKPTXZcYJYHgNb+Tdt1DBJiEPTAoSmU8lxNiRCIS7Lp8ajJa0uMuSZHqeqp+GiO+zQWi1+LR0JnYXas6lxjXkpFv3+d7PBw4kRqybSweH/riuONUES/yfrlmINlz83/Y66F4Ymu/31I8AyuGcKe6Qp44z7hSWFkvcyuo3ZCHfEzLAnNZN7eTT8GDOmSabKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq69nGRFtUT3kbMVNMbhjDVoWciPCulgY1tjWYyi7vM=;
 b=bV0bmtJ3BKYAXvG/E7zG7g2NdFEKbMZjLxHalOafdhZmsbw/CmcAV0R0S3jyi2OWEk7HOa6jizFtqgNZXgnfMmAyKNEhAbkl2WCJq1/1u4pA+bDh2mQRPYyh+YKtvKrVRACi0ipZG58HYIl/rD3bkM5fbLrFFhu85yDhw3g4DjA=
Received: from SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27)
 by SAWPR19MB997300.namprd19.prod.outlook.com (2603:10b6:806:4e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 09:08:14 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::64) by SJ0PR13CA0172.outlook.office365.com
 (2603:10b6:a03:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Fri, 14
 Aug 2026 09:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 09:08:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3E7BD406540;
	Fri, 14 Aug 2026 09:08:12 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2DF43820247;
	Fri, 14 Aug 2026 09:08:12 +0000 (UTC)
Message-ID: <bf2e87e8-46b5-4733-9af4-c764fb8dc64f@opensource.cirrus.com>
Date: Fri, 14 Aug 2026 10:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: cs35l56: Fix probe deadlock waiting for
 SoundWire enumeration
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, tiwai@suse.de
References: <20260813173702.1534029-1-rf@opensource.cirrus.com>
 <de6bc0e9-bf97-4bd8-9e6d-7b2fd608dcc3@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <de6bc0e9-bf97-4bd8-9e6d-7b2fd608dcc3@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SAWPR19MB997300:EE_
X-MS-Office365-Filtering-Correlation-Id: b09f5c87-cd4c-43a7-37a1-08def9e3922e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|61400799027|18002099003|22082099003|16102099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ijo6hhmOaUNVimEp6mYOL3zOF0PQFvdYJ9JMbIFlWNEppe+hTo3sFPTfDDwu4bo1Fq0pivs3yQHMUeVFHAHYs5PeEXFS7Ch7sWOkQN7embLlNHSJPCxesGECkV5AL5nIA0LwQqadTvHzWV2V2b9ZLpsuDFh2ZtE6oZB2shTjC+T6IFZNuCtVa9BkKAsNn87B2je51z+Cop8j8iMczhpJrUEMd2zRnPzMuxbc9+kAcW31ZNJwAfyMitmzgD4JLnWkbTMSKq6mvnxhCwfaQzP389j6BrWycoNjwpK8mPPhD9pKzX/CVP/chvp8NS93YQ6cINRRrGDEHSwdAQumi1MI3VM3fj4T+lXxCdqPbCA9JJci9YTqtZ7GbjoSKfuNueS5/NaGd4E53qhO3FffdHcm9RVPOwlMoG3H8Rz7Dsf8ksktt3aSDJmBEgBaC8KDP7UUFNBI3w5ZHr9TchV9DqeqFNVFl28gcP9GFaDz3J7KPxhWY1U6/oRciOSF8iuezYFq3MAfsG2BVytzbumV0IW0ouQrFt8B3lJw7AuE4qnilv6e3feubRVFa887fCNwflhcFO0E16oUOtwiQyqYyhc5xF6vQYOGnIC58Dyx3KzoNJ/lhWvMHCACNErJo9GZSBWgoHchbJ3VVZF4/xiE2CEK3Nr5PL65sW4bVS7IzlrG+eGhG1mTDz9bDdRw71Th153KhvHIGw2vFd7goOw9phpBtA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(61400799027)(18002099003)(22082099003)(16102099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U3OQxw6OkAYovCvj5W06Ga0qhZLsQxiEgUoVTwb9b9kGrfeDQhuAiXDTVDzjla/CxQknqcGiYWljzG22U0DjrF3O9km9U/5/iziRd/D71voHmllgVmNU07jWNP1dLGThulIdYC/DLUacyG21nMiF8Wz7uPl7/bvJyYaYgtwXObWWm+D5PiXSQ9/Fl/OZglPuMrIQvUXVx7IhCeBKq6lO+zW9YPicPGXeTXw0ZYE02zlxIZlURMmYPxjxW9H7jsHXwMehzkO+B4EWuPu+PGqCt9iiBMgEnTtgoF0lPXX+LhgotjboqvwzgGKxoaeiVWLSJw4bKqHH7bgw5WxaxkDcrM8ObgI47RgpeMNiQNCMOYRg+RsTCBG200iS5usvFK/VlkqNiT3txUYi754G/efIwT2MHDaxOq/zqNmZKMfkEJTvhMa4xNMqRlb3Qk6BT60j
X-Exchange-RoutingPolicyChecked:
	jTVg7fQHFB/8Wz8H6I/uah5EjQg8jKjh6dSOzrCrocO+hm5MfuG9oebgGt/D882V+hQrlgognHTu7Md+XxQbQL5tqVEX3uP8F8rUeWT3UWHLu/vp1Kbl6aTXFIKjvc3smVCaFeLsSLZ/ZxX3VoeaCPYezPFDZnFQcigV/BzMINxxY/06eL1Sas75tc628CitwfIwZ/E7gm58owmzB7HBMxy3ZeKh3FolxXv5itr0OpBVtvVFpn4py2fgCdkgJpnsod6RNK5SW3BnsXepuMogtnrY5hCbPheaX7f1r0LNUnOZDSNE64E398jHhIwdGnegg/JDMrupQVATcDB/O/rSvg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:08:13.5378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09f5c87-cd4c-43a7-37a1-08def9e3922e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR19MB997300
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2OSBTYWx0ZWRfXzXTWVtawiP+u
 7uZX3e30K0Cuj7YHrYcGg0ViBNTr4Q4s7RiAm18bostzJpmGLLiJqM2TbEbcZ7SWrlNR6sstyJ4
 8eliZUvG0TV7uWxiW3zLtvrkWxO7joI=
X-Proofpoint-ORIG-GUID: YJjhED3TJsHqA4JgWATByNmyeNp_rnlK
X-Proofpoint-GUID: YJjhED3TJsHqA4JgWATByNmyeNp_rnlK
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a7edb03 cx=c_pps
 a=/gzcr7A8fs5QGI99pdRdNw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EroaLzfTwmCdisNnDsAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2OSBTYWx0ZWRfX/kpchTcYCnxq
 6grsM+WI++DK/EF8PGS5/UMsLWoWGCM/AAWfGOWHS4a6nd3PUDS8VXP3i4U02j+csZ4FDljC+1h
 cR0DOVHfK0R3RJt02q9jdj91jHKdCNxVsrCqPNmM46qCZzG+jRDTfGpsWZNlcyxuXPZiRvfA8MM
 swSV9ObuKLm8sHGPssyAVBxR0iJBUQnmstumQafnhE4VIf+F2x1Pb3Qm0JegXWlT+/jovKWfHU2
 REHBKcrllMpygw/BlZn/jv/GehdSIQgAkjxbKK7QTQEeocVGshDTHpmn5wyUdZ+ZurYXosSEROR
 klOSjhT/m7XigbdCf/UC/TV947A4b/yjb0Mnuk82AKAH0s1slIe3QfhYlOCwzSFH2w9duF/gpfw
 uVIBBeeJPvUrPMO+6RhoNsUat6ytA3Z2lc4RzrBHU4sfr3KwKfkyc8Y4Gz8q45XP0nK+JVIvZSf
 3sugJTXVm7rLRclqhiA==
X-Proofpoint-Spam-Reason: safe

On 13/08/2026 8:06 pm, Mark Brown wrote:
> On Thu, Aug 13, 2026 at 06:37:01PM +0100, Richard Fitzgerald wrote:
>> Defer all the parts of cs35l56_component_probe() that require register
>> access to a work item. This is to prevent a deadlock where
>> cs35l56_component_probe() is waiting for init_completion to be signaled
>> but is blocking the code that would signal it.
> 
>>   static void cs35l56_wait_dsp_ready(struct cs35l56_private *cs35l56)
>>   {
>>   	/* Wait for patching to complete */
>> +	flush_work(&cs35l56->deferred_component_init_work);
>>   	flush_work(&cs35l56->dsp_work);
>>   }
>>   
> 
> This can be called from asoc_sdw_cs_spk_rtd_init() when limiting the
> volume, that's still synchronous while setting up the card - the main

Mark beats Codex and Sashiko for finding a path that still deadlocks.

> Speaker Volume control uses cs35l56_dspwait_{get,put}_volsw() and when
> we set up the volume limit we at least read the current volume.  The
> deferred work will block on init_completion and error out if that times
> out but init_completion is still signalled in the callback that's
> blocked waiting for probe().

I think those waits in the control get/put are now obsolete and could
be removed. Originally it was in case the fw tuning patched the memory
to different values. But for other reasons the regmap patch now zeros
those memory locations, overwriting anything the tuning patched.

> AFAICT we always try to limit the volume for these speakers?
> 
> I think the component registration needs to be moved out of probe into a
> work item...

That's the smallest code change, but can snd_soc_register_component()
return -EPROBE_DEFER?
