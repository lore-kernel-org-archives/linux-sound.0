Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B9B2BE026;
	Fri, 24 Apr 2026 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046050; cv=fail; b=BeNItxG0gGbgLUFuy3H4AqeuLfEAoEjPPGzD0jiPWBKE3VB0Vqk0kB2XRrzAqBvsBMfHgAXfITdFkYMoWYO79jKkiXUg0Z0RbJdBFEbmztV1fGP9w9s2uCggWFGelvPr3fjc/LsEqbSYT+4fX2tjdW5DSj8h88zI30w/88E2sL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046050; c=relaxed/simple;
	bh=PvmOTiF1RGhJGJPEG/Fk/ncKUe82tVDIVmj3hnW2Idk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxhHdnZ5+zdDCeJJNshvxUpkocBK4MKtd065HnlxEJzE4uvI3qIbh0bR1jAaq5ibOzFpAzKinTdY5MVVIgFRAFa88iZa4IMhWCs5j/UtCI0mBr+hulZ34nNVx4gp+fVG3CcGIrl2LW1/CS83yE+s62ocn+AHfYEUU9/kbfQnsTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OoTMnquh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jmzelLLp; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OoTMnquh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jmzelLLp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O50ehI3107788;
	Fri, 24 Apr 2026 10:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PvmOTiF1RGhJGJPEG/Fk/ncKUe82tVDIVmj3hnW2Idk=; b=
	OoTMnquhVVSlKqSWXygr9HN2qxkMVBUk5emlH4zNhOotOqfy2q8prDwmqsg2K33v
	mW2VyT33kg+c2bkqXGyLy/nzbf51DUm+XueGEBIvxnvq/5wrXIv1WD2UQ+3DiT9Y
	5y7MG9zZ1FONgAYS1T/KYzDQoeGpYocRkKEY7ghvEB0b5KhJMVzI6xeMwhefVRyQ
	p8I4sRDHpGSIMBD/RvpDNf0mke/v4bhOvsrzkr6IxFZ6qDrqOun+MF5Wbu/T6eGx
	74u4s7E9LNRBYx8CXGRP7J5SsfQWjiA39yiE/WwaWpyR7S/lzszxkzmoPS4Qagdg
	rXNI7v1ntytLif9AQKq5hA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020129.outbound.protection.outlook.com [40.93.198.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dpenhv37a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 10:53:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCWKDkCUH03st8UPN5L60NFY6/2cfmr2YY1cca0t/PDa/HcUC7xAf+v1Cmp8pjx3eTMwItliZVyanUfgh8i071ub7qB5Y2pUSBhbl79zOPTrq087L0aSJYQB8KJGqA3V7UlWEtWj+n8NRPnmYdguv2wb5LnrjvV07B3LzKVMpdykUQcSWOzpJ1oGA3hhTRz8TFyxC9N/6fph57XKPfpoaqZWogs06i8p/Viu4C1+oOHLmdaC9oq/GhY4+Z3LwICpMyEPz4b8retZO4E4WU/b3J52gXTbAqC+jmi/UKbLKdalbZ3GnJaiP/VhNqxtf4IPE07xUS2ViUeiLGK8dG/+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvmOTiF1RGhJGJPEG/Fk/ncKUe82tVDIVmj3hnW2Idk=;
 b=YUelo6lIsA+WOmB2dakyN13OuNulZrhr8Zdo2a9gAB/JA39TWob2C8ZtLuyA87u69i3OAc1dvzvqZbCyu4+IEX5hMpcsF9/A5TGi1mtx0Fm6AffLK0NpCl22qyaiSHq4DaCDmdon8T2n1+WJ1w05K5DQcPN7v01AqE1JhFeYruk7wOZrCpOrCG4wBJyC4c6NoR5ocuz+CMO2Wbhf6wgaXeqNLXiHMVm5zEm7HNdAHwyeUoexfdkbnDkRlmdMfwHl2UGuCZV9tQ6CYteIC8vhuz9tatDGCWCb+wTQ5ueTm6N0MthnEj80LiH0g0ex9ar6oGPfYf626ZmM0jMhKR7EZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvmOTiF1RGhJGJPEG/Fk/ncKUe82tVDIVmj3hnW2Idk=;
 b=jmzelLLpsWlF81Jv6EKkm/f9xQx/9zeyfK9F1GHlvAqDM0rn4NrFmtXTch1ZSoLVdDAiTpMvOpCXVZ8OQ+azVv3b3jvfWb3ZI5ll1jpgiKTQT09idLsLDktHvbF4jVbnzww0lYoQfRGwCpIspijYwhxALLaTkoFtrEKafL9UY/I=
Received: from CH2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:610:50::22)
 by PH7PR19MB6110.namprd19.prod.outlook.com (2603:10b6:510:1dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 15:53:11 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::d6) by CH2PR16CA0012.outlook.office365.com
 (2603:10b6:610:50::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 15:53:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Fri, 24 Apr 2026 15:53:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 15BAC406540;
	Fri, 24 Apr 2026 15:53:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EC07882024A;
	Fri, 24 Apr 2026 15:53:05 +0000 (UTC)
Date: Fri, 24 Apr 2026 16:53:04 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Aaron Ma <aaron.ma@canonical.com>, oder_chiou@realtek.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "shumingf@realtek.com" <shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: add FU06 Playback Switch for speaker
 mute control
Message-ID: <aeuR4AddzJ2sKU1e@opensource.cirrus.com>
References: <20260423101338.1040131-1-aaron.ma@canonical.com>
 <76827f27-1a27-422f-8e83-5f5e5ae0f7ef@linux.dev>
 <CAJ6xRxVy5+PnoNDK0z=15PrsUXewAgZb6y=a4pdUQ5JTqphk8A@mail.gmail.com>
 <5ef5113c-b66f-468f-a906-72a8dcb67920@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ef5113c-b66f-468f-a906-72a8dcb67920@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|PH7PR19MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cc065b-520e-441d-4862-08dea219942f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|7416014|36860700016|56012099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7GYYdXWErsZhVWsiZMqvUMFPPpfzGLHFpcSXNR0qpsG4yvpkWOIHUfXwWAZPCC33rOGE9faB029C16Jb/NVM2kf+Cl/piycXByhsEp7qxo1NBcAq3wck+R8O4X/V8Sjp0JEKimeL6FCPN4fEtxjlxN3U36cRlXLEMDvVioQUAmbMwcL8IPH9xSfFRiFshhTMXe6E1Ma2afS7L8r1fettWepsX/60fXqcsnPhRpvZCOaO8ZuHJOxpWUImK3qClTElRM37XuBr0zE4UwcuF9za+Lw9mo7OgGG+dpWPj/5hN1OI3yfHM7PG6gaAHqCkELjihQ6xADQLh9/WAeIFCMNo6eh9pKuBTUIpXYOpvprc96IUTNVdDfRQUV8GVEJ0FGAn8atgcAsUQBsD48henrovwpMqtFMd3neYrhIqClmdZneOfLdPherV4awoDEXeQCheZB5WvGxZ33bmYAffJz7t4vMfO0zp8JdY7X8tOw3FdT4lR8YwuhPv2Kvd3RFyF2cR49Kk9B0KcNC/AXxMLbcr2dAqA6R6g+8N5BN6dwMUw4wsKSoXdV4oF/ZoqUhRWi9Tbnshh8WXUd6F60XRAIHIwKcP+rLHzPDDKoatJOJd14IvBKEj6gW0ii5aq7J5uEYNuXyppF95/Wl/KUvTka+uOc/EZ2mYtX8y+Aw4BaJs3Rsb7TQt3OksE34ZIKI/fCaS/6aePfHn48ck6+CJuRvj6efUndxNzaBwMPFwH5RmFK8QAKDFlheU1vSeUShv4am6++//bVa+tfOsVUJWDPd63g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(7416014)(36860700016)(56012099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HAO5xjK7HkHKbvq665e7ATpMk7ZGF+1LVxGjWwUZHuOpXy4UD4132tV9GGIyaGFr3oEcyNFGendxCsaZl+ASyP7HZPo2de44PTHopA1tVKyXH3G4WDk36v5EDTLUn2W+XLq9VKJv5Xt3CvNHTT1WdFcFU3HdO5WqNYNi2+eDBtND0xF48aLi4vatq97NKoIaCNGlIRlFWWR5+VI4uy6riFjKyZG49nxoHSVN+AfGqkSjlkkOZpvIeHxrx8sGMt2qdsl0cbNPdueVdc4XDCYNliZGsTW3zF4g1buRZTX5pwkkoX9SefB6JMqcj3SQQKJjwCrtNzfDIKaksYafJTxSs+jT4bKg3PzezmlkAcF/hGgQmgAXLKLyU8FOT60A8xCHH8+T28cH41otjM1KFtM+Dz+X91+n+SClT+K8gS0p78vHIarUyskLhA34I4UFrcgu
X-Exchange-RoutingPolicyChecked:
	IPCYFpO30OBmoiiPLgHYYkYsGCeCmvch+9KykWNK7wQ7/bNp1Q54x6QJlNqiKa/AtmIWdcKdZ9YYqz0jIkPwqNNOp5lL3tP88ts7goJfloHH2QrkVBzxRJeZbnqm7WhTB8lzLkEYTTZ8ERQNHh5ZzMBs4vrtE//UdRz9k8BBHcSg2+CJBxJ+IfW9rTEPUBDCv4iqaj1svJn/A1eqZopcg+KGlTUHo6ruU3FFIoUxbv3qjh4umWazhrK1EFiFR/nf3z8nmKkSiZNuRoNubZfS76A0VazIXDsm4xTAavYeWwnvoqQyjbsJymTMQV/zudvpZjXkRypjMh8qTxcUIYfHVA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 15:53:07.4833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cc065b-520e-441d-4862-08dea219942f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE1NCBTYWx0ZWRfX3iS1VWhiK9Ni
 sZDPaoN24EELMXIAars3PjsEI+Cah2TxHguNo4LnCpaDtmPC9qdqDvYj+ZWOTaX2ndNKfdE6QNf
 Haub9lO1VreXc0GtDq89elzNsO37H7m5p5mcuoymO3xzC2TcGrnhF5O8PY45tnjkGOPgxkXqI07
 mMHuD4XT6q8qGJh4bTB3+DTtsEeH1U0b8qAtCTD44N0Ez4Abd2zneWJ+VoB65Bmin/RIVeL+Mr4
 RZSiuLViiIVF/B/IlbFqvuY6D8hnfbmBvTdAQQtHR7KcbeSNsWA8R8bAQbrrbMPKVZYfQR8pAc/
 fE/0hyi81Y5RccAIzX9vUeh1mgQPeoe1B9246mZiIo3nLXcFVnc4Mwi9h/aZCcUojQMuiWG7IKc
 N8I6rxtpusymiYKWPGVrGtT8LJj09GhcVpRdmRBZdhA3N8L8XpsGY1Ew7Rg7UI1xOX4FSCoiIT4
 jIJ5oLSzZObYmSwecGA==
X-Proofpoint-GUID: SK6i6CXSKN8d9xD47NdMF-nC9TCDATWO
X-Proofpoint-ORIG-GUID: SK6i6CXSKN8d9xD47NdMF-nC9TCDATWO
X-Authority-Analysis: v=2.4 cv=DZInbPtW c=1 sm=1 tr=0 ts=69eb91eb cx=c_pps
 a=jtbwDcC0Yi12le+aIJgOYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=3Wegkf6UuMNW9PjWy8EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Apr 24, 2026 at 03:09:10PM +0200, Pierre-Louis Bossart wrote:
> On 4/24/26 05:52, Aaron Ma wrote:
> > On Thu, Apr 23, 2026 at 9:01 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.dev> wrote:
> >> On 4/23/26 12:13, Aaron Ma wrote:
> While I am at it, in theory those registers are Dual-Ranked,
> with a 'commit' mechanism to deal with all volume changes
> at the same time. We'll need to add support for Dual-Ranked
> registers at some point, not sure how this can be bolted in
> regmap support... Cc: Charles for future SDCA improvements...

Eek... *hides in dark corner*. Yeah at some point we do need
to do some thinking about dual ranked controls, at the moment
there is no support. As far as my thinking got was really it
is in a lot of situations hard to tell which writes you want
to group. There is some low hanging fruit, for example stereo
volumes would make sense to group if dual ranked. Although in
those cases I tend to see user-space changing the volumes one
channel at a time anyway. And that is even before you get to the
regmap implementation details which is foggy at best in my mind.

Sorry I don't have more, it is loosely on my virtual todo list,
but definitely not something I have got around to thinking
through yet.

Thanks,
Charles
