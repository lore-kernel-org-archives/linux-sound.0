Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B32E3B47F5;
	Mon, 20 Jul 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559786; cv=fail; b=bLhhMQRoNqPpeptyepsIdrISp1oMb3CDrmRiQYQkGf7ic5gu1cPh3CZFQ7SaO518PGNc+DEUeaSDAV53M5f8NYRjxmoSdoi5xoQ4JIuYweTk/9NKGGUIM5ZE5VBMYRyrxwXHC2AMDvXL8KoqAN5zBfEe2I68DLktphm3TFMEKpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559786; c=relaxed/simple;
	bh=0Jepxomg98bgJam+ke+CbRekx0VdSZu/iDp9Bmbr3no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrNpkaONmGYMXTAGvyVzSySYBRAPMtIeVYIP9xukBBOT01wi3FEk7271fsN34E0wOIc7AE6VvtzOuds0yA+JcVfo0928g3FmC4V2j7E2uy0/2ziwP/QJMoUk5bJmkhM7U1Rj4lI2ac8F2gXt3GdGkV0DPMAF97GI3qwmXhQ7Lq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OIzi34l+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TkCLPWyf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OIzi34l+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TkCLPWyf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBgeCu2122615;
	Mon, 20 Jul 2026 10:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=kOTlvApZGRm2ky4aWn
	Jouxth60Dbn7N9EDXW30NOplc=; b=OIzi34l+yfBAbhuX9Lj/lhCZAwvmtIP6u7
	tNHEZWAhtjl2gQOAcHCAdxeE6tFvrMZpOu/AULByf3TrYNqEQCMfSfm9+WWxQVJ2
	UvxidqeGivU6mIyrSMF+Mb/w5GBB4qDQaobOG2iDEse89U6G7FRKEOFfTGnmlh38
	Cas0ElJfnT/C3DGxjJM5kkjwyr9HC+jgMjSVZMFuSFELvMGsFOArtVHsX5/mWwvm
	VIwqAsamUp+/TFretxt9UHtwe110t5flwrXkMORTZAf1XXMrbT3iaFyGUI4njNst
	hCwbdRDpeKyhzWmtZ/LZ3QXoEyRl4pePH7nhLWeo0brveT7zJovg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023119.outbound.protection.outlook.com [40.93.196.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfajm5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 10:02:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJyFimyJVZ4bXssokKHGSNaQsFgu7EdaL9S9BYCePhgX6+OyIdZ2h+HQYNrbB9pkrHAnkT9BQBqh7LAZuhVXhWo4D6q9CRmA1mgImQDcbloIGSVCLBpOn85LGuwKFaTRR6wcYdxKBdtVtptPSO6pdaA5S1A4ilBcO+Rcth+cLHo+ruqRnrh0C6x7U2GhfyE1Vi57W/wpMSj9b/h4unspR7/naSEL97JuWYA7gq4xQS3IknuRBBd4XPpBwRS6XtezBXQ08XTTyVmt9lBhBA++j3K6eBIOimx6awh2q+6Zo5Wa/ijXIUZ+iDs2yi86YSeY09vhmu0Xop7DDZlRhKMFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOTlvApZGRm2ky4aWnJouxth60Dbn7N9EDXW30NOplc=;
 b=uHg3wBpn7F45mwvy47uoHC3ZXEMBPwbytnzDk10sF0cTOD5vqOs4GD/BUP4lW/ylxXQKg7jXsm6187KYmcCgD5cpgrKMSGebv3VY8pN8s0VG8Qkvb+2LpMG+TJoBBvuSFpkchNYSCasYJmA5p98CUmbdZNAr81tdcfIyeUj2ERY5TQYke1/ZDJez37okzgylk2TxV7t4+lU62RxUXwcmyhFruwvYmlbeyRLcIehp7OgNBOUlnAoerdxdKLezpMSIcWLUWssQjlcivJjHxIEOt/3Rol3dI08bn9X3Nu6egV3F0Dny0PU+dvr4d2Qv2SM05RyEtvZ92WrUUVi0SPwp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOTlvApZGRm2ky4aWnJouxth60Dbn7N9EDXW30NOplc=;
 b=TkCLPWyflLQQjaIhbwK0XZTK/HvsU4vWCkNp5ydJlkHqCd1U7QMTLwcacVmmxM4ImEfIZ6Z9OA8yjPhmoEENQnJ1Vp6QIOnLhlHGWzHlo2gW7U1hrw0inPvxG2zSHGbpEpuleXLZvWF6Po4XPdNjQUW8tgpZFQPcVydDN4oK4HE=
Received: from DS1PR03CA0002.namprd03.prod.outlook.com (2603:10b6:8:450::9) by
 CH9PR19MB9297.namprd19.prod.outlook.com (2603:10b6:610:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:02:48 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:8:450:cafe::9f) by DS1PR03CA0002.outlook.office365.com
 (2603:10b6:8:450::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 15:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Mon, 20 Jul 2026 15:02:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C1400406541;
	Mon, 20 Jul 2026 15:02:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A9BD7820244;
	Mon, 20 Jul 2026 15:02:46 +0000 (UTC)
Date: Mon, 20 Jul 2026 16:02:45 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        "shumingf@realtek.com" <shumingf@realtek.com>
Subject: Re: [PATCH v3 2/4] ASoC: SDCA: Populate IRQ data earlier
Message-ID: <al44lZ+uzmPJW3Ul@opensource.cirrus.com>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
 <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
 <bcd410d4-9736-427e-a921-831fffd37c5e@linux.dev>
 <al4yqpvM6iwG0kjo@opensource.cirrus.com>
 <305305e9-6f41-46bf-96fa-0495ef27062a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <305305e9-6f41-46bf-96fa-0495ef27062a@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|CH9PR19MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: 30434a9c-5fc2-4c83-ec37-08dee66ff646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|6133799003|16102099003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	yMGsdWYCYXbWXMgE83NXPY7e+D0aX2IEYO8BriLBScCKfh4sBAw+KU6r1qeQo+eCS1QVg5TgDpWYtckpwc6v5HNc0k51IomMqm6FtqIv0bnmhmzeaAcAiKOKEuSdkNwTK0XNZk/0Aj3DCVsv/ZaCuaTlcC1HeH5EUL/ol2buGIEZWjr4ZXmebSZhWHQM1WtMQV/ubj8C+7j5KD01MX9rwp4/beNZhGDHI6AuLQLlbKh3eqbf7U63Gcn9bJ+UjYTLm8gxSKOlulsqUPKoCqcuJWoTrdTphJhWfKe48E3oqf8O3a66UITEMA+fdTaEXiE3RnFKYCbaxeX9exz0LkUlbD+KUzDTOw5qiUgQb+nZ06QqXDbgx47tiozVT3Pvgkp2RbaLkyr/dsuu+VG1X30shn90klUXzfSMDTSqQk9pwPQzyuTW4XMJtll/2Rzo3J3zJ2GaozEbDQqDTfDj32p+by3qMbJt/GpLT/P/3Ra0sduc/aplJ/gFjWL7VbqPuYeDIHJUV8iKMQZfP8UJRLnLnTweXeZ/kj5uQPsyNYzbp3OwD7oozA5vzVQK5B3/8Mb0/Bznr2x5AbMAuSnxAGBnVIXze/zz5J0Sr8AEvH0uca5nj3Ug+HqnOU4nhZ36Kmb+eCF/4SU0U3CJODbdGVZV8fAblv7+FeWCOZ6Qy4EO94GijFBvkuGiCSPmyyXbu4qXUzXn4y8TgHMDPovymLRxHw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(6133799003)(16102099003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HU4R47Gn+ASZDbmZWuPNIuq3Wqdfld1yvz8tDkhUoRY3fXDS1UOUBWbcdxYVQLF/yj1gPDTH0eUVg4sjb9t/EKZgiVIZkX3yL4HJiCPwGQFq5Y1tKObutwSrQQ5uiIulEp2GfE0O82pSBF+Pu8kjSHrAAmkaFZnUtKXf9LvPb08L0rLZ9ow+39L4uKV+OYkEdTzpxO7wMyWz1KzXVGOPMf1GHlbJO5sT5wLYhIfpqoQi4xgeCZxTmUGtsahY513wMmM+sbub6j6oba61tGOxOFHmtjA3LTaoHgLibZ4KasBTWAECjQZPuhXeNqQRhs/R1lTj7/NgIotg+wr5ckVMqoTP+w7Gzm26ZiuRIdmUK+/+Db//ojvEid/YnMgRGTtkl8BMFYjYMSfmN+nilsQUCXzxlzF0/OlLE2tZSug6hROt0rYydHxItf1dqh+4O3p7
X-Exchange-RoutingPolicyChecked:
	G4JDODe7ZiL+FGhHZ2hY8XSP8ixjmxNDW6c61/AKKwjeNNReQxPA8uutQ77fDbOBB5wca6otW3N2arw3WGcBgR20Due9rVCjE3hVVkSq0jroiGBkr8vO4gYu0IScYjA3GVXfTdAGA03lPx9yZtQOO6q82hb41e2sOzifnZ83acUJTObdFjcb+71hYjbXyQY6LVl1hCZun2NEQ/4aGzwf2NuqIURX268jansOMfNPBvSBKnWYupSKJDCKpJWUIgexoYHLvMJA5gTUysCsxUpVH3i7DcoFrREkthFUbQlWiT+vonYUq5881pw+SapePQS/udvDl9ac4OTqIpCR2TsrKQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:02:47.8244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30434a9c-5fc2-4c83-ec37-08dee66ff646
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9297
X-Proofpoint-ORIG-GUID: TLkKB_al8yAuaeziF8EoB8yARMYEpDXC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfXzH5u3lZKdpuI
 +GbVcf9u45mR1gOSFYlmR3gxeqZScRZO5YoZIRvLo2M1BghRXzhQyST9oo3ke9HeZxqrTja8syY
 YvSI1BTtXcL/7uxwh6kyrgEu4Xj+Rrw=
X-Proofpoint-GUID: TLkKB_al8yAuaeziF8EoB8yARMYEpDXC
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5e389b cx=c_pps
 a=SNRzDqNuYCMO/bT9QdJRMw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=baWtme05cUGmjH2wizsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NyBTYWx0ZWRfX+aQ7kgKHiyJD
 eK+tqBLOA9BX3SQ3scBRgXCxULfemzWiuLBHEaWP7upgsF9PHG/7I3Ga6yilo9Wjtaq9eDyWRNa
 PQANHyXE2Qz/2DCDLlxSpFZUMyZkpA+91QIsKawMceVGNZRy9VmRw4rj8BZUvWoWulxq3Z8lrbv
 hGPs5mj2HgNqKsAos3cUt3XqAvRITvzQsQ/m8ybgpNMUAEF0qfKiL9GUmK8SEuXkRC/a64vjRRt
 LUZbK3PE8tG8Ryr4rONs/o+EvSAQM0PglEvyIvZ4m25oS73JqimXFaghOlEdDN9wiUBOQtM+DRo
 pFFvl8gHSb3mFSzqimCMeNXAH8Nz9mj/GneWYFKhK4sCqnIY2b0MsBgFdb/L8kp35fHRj+umQ+2
 fUfkwSBqyhtSdHEWK3dgMtXz1MfdnHMsx42+YlwXrFddxg0jaHxiy2V0vdJ3qfycjvAEfEpTL5z
 RTU9DVa/yfa+KEtERFQ==
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 20, 2026 at 04:44:08PM +0200, Pierre-Louis Bossart wrote:
> On 7/20/26 16:37, Charles Keepax wrote:
> > On Fri, Jul 17, 2026 at 10:42:46PM +0200, Pierre-Louis Bossart wrote:
> >> On 7/16/26 16:26, Charles Keepax wrote:
> >>> Currently, the IRQ data (attached Entity/Control/etc) is populated
> >>> as the IRQ is requested. However, this can cause issues as
> >>> occasionally the setup process wants to access specifics of
> >>> an IRQ before the IRQ is actually enabled. To facilitate this
> >>> cache all the IRQ data during sdca_irq_populate_early() and make
> >>> sdca_irq_populate() simply request the outstanding IRQs. This
> >>> also has the advantage that sdca_irq_populate() can now just
> >>> iterate through the IRQ array which is much smaller/faster than
> >>> going through every Entity in the Function for Controls.
> >>>
> >>> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> >>> ---
> >>
> >> I may be splitting hair but shouldn't this patch be moved
> >> earlier?patch1/3-4 seem to be completely tied with the introduction and
> >> use of the fixup_controls() callback, I am not sure I see the link with
> >> the IRQ stuff. Or conversely move this last if this makes more sense.
> > 
> > It can be moved to the start of the series, probably not worth a
> > spin on its own but if we end up with changes from Mark's
> > comments I will do so.
> > 
> > This is slightly related though as sdca_jack_set_jack is called
> > before all the controls are registered and we populate the jack
> > masks in there, so moving the IRQs to later means we need that
> > information ready at that time which this accomplishes. Although
> > it does also just generally make things a bit neater.
> > 
> >> Also while I am at it, I wouldn't hurt to have an explanation of the
> >> races conditions earlier, it's only in patch3 that the race condition is
> >> described in details.
> > 
> > Yeah I should have probably included that in the cover letter
> > more. Likewise, I will update that if we end up with another
> > spin. If either you or Mark feel strongly enough on these points
> > to warrant another spin just for them just let me know.
> 
> I do have a new question triggered by the last patch from Shuming: what
> happens to the existing users of sdca_irq_populate(), do they also need
> to use the new sdca_irq_populate_early()? See my comment in the other
> patch "ASoC: rt766: add RT766/RT767 SDCA driver"
> 
> If there is no impact no need for a new spin IMHO.

Well I updated the existing user :-)

But seriously, thanks for pointing that out I missed that
patch on the list. I will go do some review.

Thanks,
Charles
