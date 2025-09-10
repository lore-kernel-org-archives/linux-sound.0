Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520091494CC
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511481; cv=fail; b=PRO1SMXvvJOrfbqYD83dnXPrUiBS2kZofJypZvw6ViJEzvQN3gRz7EaSMHeAoMgLXCakwzEiRSn543QyX0rYyVGhyiA3yLqXAmjSEkYo0SnToYKdM+n0YYzE5mttIZWXRD2RcGKPDf64Lxau0t1m48HwPyBDDCo9RythbXjebT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511481; c=relaxed/simple;
	bh=ECziNig62jvX0yEZpiXun2U+PipBgSQm4mbjkID+9hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNP9e2yCgvNz8zDaCCTolmdqA4grqCVdyUfxpe/gS5kVm5viU4hQFgA3U0rk46YvgNfUJwEgz/ICNetcTGmrEm4seyo9tk4Tj3KaE2v1Is6xX6hXl3m92wQi9dEJdCTA1eEjde1vDg9Mh0psYgR2rqh2yzUGhvm1fr0ANp0sQbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WiCQisqa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oj1He29y; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WiCQisqa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oj1He29y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58A9N7PM3627668;
	Wed, 10 Sep 2025 08:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=/LQMwVHRK+dGgYIInz
	sDeIvN9+HBwMUuA7keSncfpgs=; b=WiCQisqa7IxbFYNAsxxjAyYPsHgBH+T9dN
	mkpcGtQatrTdxDjHkT9U25+canJGzgB9QHs2LIQs3mB7hIxCCV5vFFcNOCFb/HCO
	1ptyiqcPH1vRCjHOIsAZLGH7eo/ctlykkMQspaqY5QCmQWmhQJyT6RcfEATxT7E8
	RJMFdHluf/lxfyJoIm9rTFLzwd3VrLfjswq3rjDrUe7sQEuJO2c/NHg9Y8MxPoxB
	tpyo+EuJpV8ugrz1k6DLKwkG/O9cYIvjPSMSW2BGS2vW1U0DL5UXI50cTbISXBYE
	BBPGO46j3y+eclenZ611DqFEoodS2q1e02lRry8PGssINVI0vnKQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2091.outbound.protection.outlook.com [40.107.244.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6t9jbg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 08:37:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKWFwdNy2ZfRy/AvRJxZaWzOQ1l64z2JhpzzfIG1dKGHguZuC3xHT+bDvNLc7hG7uR8IUQAO1HAHY8nF60nCyEw6yNc5hYM66CvjmxJL8SvIVrToWpH6S7lGXwskTb58sRFiyzpzmNZs94WzAH/nznMYtj86kPhn9NhmsJEwYNwhAHt2fZmkK5arSMXkYivA2BQNEjZgGLUf4uPspA2I89R2Bw91VkcqZsDuiUGrPWAy+uj1csnzhkzUV9SgP9LS32B8tCoQpA+aMdZFs9S7zRIeOsOYGBXDI5RamsFqW9+7rcAxrY51QZJRuFLque4HGqQ2maXAMvkCruppNHumyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LQMwVHRK+dGgYIInzsDeIvN9+HBwMUuA7keSncfpgs=;
 b=pDvyuf7E9hIh/h+7lMvjbl2Y7MlFBuT5kwODLNCxuYxmVmdOWtYSdwnzubEyC3U+J3zETFl+KQDYsK4FL/xP/5ATX5W0vWQBK9C9G3+sknf7UDL2AKJZHC7FyhsmbbzftblEFyA44KBn1L86C5XMAzbeivCBQeVSzMnwDCMhhmThsGvLENy/9/K0wepS0gKCOOnF85W/Z2UFggBTBMmt7/uUnJwTuYBdl8vBfUglERWxUnAa86Ap/Y9u78YXl3qn6sljruUqICaPqJGIlpLB3hkQpadSqCVdOeBgpY7b7OxKfe6URW59dOECo77GHqd7K5Pl5zQhTrYljEKjaLAklQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LQMwVHRK+dGgYIInzsDeIvN9+HBwMUuA7keSncfpgs=;
 b=oj1He29yHtGLrwDBxSyE6CxisHLzYOpBVZz5cDAH4hTdsxyLb5iaekijtDOCvSqVQQowh1/GS3GvZ0135gxQCQ+PRUMO6LsDIsv0LS7fF4IZtxwBgOKH9EliRUg2bUSC1g9jZMlEnw2SYnxWQEDM1vqoPdMYLLzvMXo18txAAEI=
Received: from SA9P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::18)
 by CO1PR19MB5045.namprd19.prod.outlook.com (2603:10b6:303:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 13:37:39 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:25:cafe::ce) by SA9P221CA0013.outlook.office365.com
 (2603:10b6:806:25::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Wed,
 10 Sep 2025 13:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Wed, 10 Sep 2025 13:37:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CE401406540;
	Wed, 10 Sep 2025 13:37:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BBCB9820247;
	Wed, 10 Sep 2025 13:37:36 +0000 (UTC)
Date: Wed, 10 Sep 2025 14:37:35 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
Message-ID: <aMF/H8yejQ51B65X@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-10-ckeepax@opensource.cirrus.com>
 <e85fa12d-727c-402b-a7c1-493d2224f228@linux.dev>
 <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
 <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
 <aMBbavEX2RyzBy1o@opensource.cirrus.com>
 <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|CO1PR19MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5e2079-afcd-4ea6-9f7b-08ddf06f3552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FfSlaZhhJC8QLyOe+MUvepfzjRDDbB5wD9D8o5maJWtdGzbtAA9V9WIhKihb?=
 =?us-ascii?Q?VWsRmQ0JjKB90ch2VAWXA6ezwVw1hwtWti/0ZKtpBcPWFV5N8X4lUM2Sdg9Y?=
 =?us-ascii?Q?AIV2JvQox1L6J66gDI85771HqSgS8KHdta4JnRIPdfqAVL/TmNZGGomanAso?=
 =?us-ascii?Q?Bkne32EAkRWWiTvDPxSKvieIo6lTly6Z9jb0Q+DjryJMGj+A0MBUlgic8k2D?=
 =?us-ascii?Q?tfw0XbkL/IQJ3wPOQi/TkNxa0E12maVwyCZZfOiFkRdKps1vX7L6sKRbSlAI?=
 =?us-ascii?Q?MOlXc/qPTl+gcbjJVtwzMuFZzEYFJvMngJq6COb7VQljCEfpSzb8I/n/Cqaa?=
 =?us-ascii?Q?+zFFhrtn/VeKDdWS2L5/vPTS8jgffItUv/moD6WqWDHClN7EsDtxnhx7I6f0?=
 =?us-ascii?Q?M2cQ5ICM67pSK19w3pK4JMndeVERPyb/O9s2k8jDrBpgV07+7sEHfIa0Hw1Q?=
 =?us-ascii?Q?L7GaLksEpMkhPs+FNGJCgJMO7Jn7ksIYFt2RyBct6Qw+bFm1V1bPBmUNK4iv?=
 =?us-ascii?Q?i+emcsbZsvgFLHEcBSXKqwTDr3uDyynRKcuEhy0MUvDc7SFxyI2sDURXxPC/?=
 =?us-ascii?Q?YvvRBOl7b3swZTeW9ty+PFhMD4ZxXH/ZmeQjKPnmzNdvw1X5zXbP0Br8nFdd?=
 =?us-ascii?Q?fW+OGgKHJ5PjkXWfgvSVipRGS+DoqtkfsrvOgzoK4MqkTKEzp9Sp+D3BC6zQ?=
 =?us-ascii?Q?3I145H3MaOKaVVRyUFhWFl9Y7BSCNrDlqjBT+yRBwKWVHMcALWkUuA10k3CS?=
 =?us-ascii?Q?ee7wbEr7qZBaFPunFaYXI0FZw+BDV4Q5wzJMT/6SB97dsyBRxc2aSJlqgK+W?=
 =?us-ascii?Q?yHggQsx/NEyftVi0IOH6UkyB7cmL3Hd8eAHRrm0hF9ilIyXkm9JZuLIFSjb3?=
 =?us-ascii?Q?7FcS5KFXmiqHFjAsDnQ+1NQ5sRSV8S3USIoNjT+2JsL4MOqaMbwhBGgtjUbu?=
 =?us-ascii?Q?bWlR8k0Uj/O89VCXFIDNExKp674q17IKjsSCJGoolA4q4XmVPmmor4x5bixc?=
 =?us-ascii?Q?L+ZEx7k4PYkb8hIPyxDq3CRb3ihpkdM+SFkLaslUunz+P1lV0E3RAlQ/X8qf?=
 =?us-ascii?Q?9qeoLqU3w7yJlJ+tpkyPccfBq1jyucxH6AQWnIkgeIuZxHLJYxRvPMpaRfud?=
 =?us-ascii?Q?eXGKyIC56yeU1o/I5PAwo621fxlP94GxotObzFmSV3s8nRmbBBZIx9GdJn3E?=
 =?us-ascii?Q?gQqt7sHXT6hLAEMWrLCvIk/SEHTU2s3H8YUTwpHwZZnfok5tW5CGQfUpqaYg?=
 =?us-ascii?Q?0fpw2vAHfNnahYdzvWe/IuI0X2ntkyFzRw68w7xNLdiQg+IR8Q4hik2h4ylZ?=
 =?us-ascii?Q?o9+F5P4okZoPWTeRpNUXXo8uQY0DFsJt66rirkB4yF7IxHt9vCGfGwgGOQ9e?=
 =?us-ascii?Q?fyel6/AkQTXzvSkS+SwGyPxKn6I/Ri6VCoxHTyw8g1w0zUjWkzRDg6N4dCSo?=
 =?us-ascii?Q?GxrBjycBznHWPT4VKx1b59GBhM8lt4Jo6X3ff/I42pjaZN37uKsAYluBX9Qm?=
 =?us-ascii?Q?Se2pmGuNFxIKkEocgDPbKlK044VYrM3//7Gf?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:37:38.0380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5e2079-afcd-4ea6-9f7b-08ddf06f3552
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5045
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDEyNCBTYWx0ZWRfXwjgVubzTmroR
 0y1J8MCE+vAzyoyCM3RV9xzXdeFzKtZii5oSLObA897LaO+H1ZN7DKC5zYu8u2gMlUIRCIQAm+b
 Yz8K5FJceiAVhacizZMHdEmtV8Zdhj6kuPaXCbGvKe9OdhfFNyOU1nwdFTLujQ7dEeqkSm3Cnpc
 zFSXQSf25Bqsezu4eniZa7JMUU5sA3M/mOCMdsEJRX6XMOpuTZnuYx2EzL7/WwcrW+XdNHLcE26
 tIYdwOtREkAL1amKf+43wPWAOBMpDdbXmYyCnIUhnzBOb9d2UDTmPGFO4xAB3GyPPg9jC57VazW
 FtuOl+OaYoZVKyhSY+v+wWK2Qcw5AypHGB2rcSebIjUDWmoRWnw+Sw1uWOcvzs=
X-Proofpoint-GUID: 4DVUKZrt-RQcQRIJHGzX7USZgv8iEzuW
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c17f26 cx=c_pps
 a=1grIbyKvDpWKlhKqFVAn8Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=BNZhyOJkRFJmwvErLxIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 4DVUKZrt-RQcQRIJHGzX7USZgv8iEzuW
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 10, 2025 at 02:09:14PM +0200, Pierre-Louis Bossart wrote:
> On 9/9/25 18:52, Charles Keepax wrote:
> > On Tue, Sep 09, 2025 at 03:14:00PM +0200, Pierre-Louis Bossart wrote:
> >> On 9/8/25 15:15, Charles Keepax wrote:
> >>> On Mon, Sep 08, 2025 at 02:02:09PM +0200, Pierre-Louis Bossart wrote:
> >>>> On 9/5/25 16:31, Charles Keepax wrote:
> > The only notification that comes from the device is the the
> > UMP buffer is being returned to the host, which indicates a HID
> > event has happened. But there is no time out on HID events, it
> > could be months between HID events. Like one could set a timeout
> > and at each timeout just verify the buffer is still set to the
> > device but that seems very cautious. Or one could check the buffer
> > is set as expected on boot, but I would really expect the SDCA
> > reset/boot logic to ensure that is good.
> > 
> > If it is a UMP transfer where the host expects the device to do
> > something and return that may need a timeout but as that is a
> > subset of UMP transfers it feels like it makes more sense to
> > implement the timeouts in the places that need them.
> 
> You have a point that in the case where the host waits for an
> event, then the notion of timeout is irrelevant.
>
> What I was referring to was the case where the host writes
> a message and waits for a notification that the message has
> been handled.
> This could be a write to a buffer or a read from a buffer.
> That's standard IPC stuff, and all existing cases of such
> message-passing IPC do have a timeout built-in. The communication
> is serial by nature since there is a single signaling mechanism,
> so the host has to wait before sending another message.
>
> I am not sure it's a great idea to leave the timeout handling
> at a higher level, because you will have to deal with other
> sources of information. Once a message has been sent with UMP,
> there will be additional signaling that the action requested by
> the host was completed on the peripheral side. In the case of
> FDL, once the firmware buffers have been transferred, possibly
> in different chunks, then the peripheral might have to perform
> an internal reboot/reset. That takes time and it's a different
> level of timeout.
>
> My take is that the UMP should implement basic timeout
> capabilities for just 'buffer passed/ownership changed'
> transition. Things will go wrong and you want information on
> where they went wrong. Implementing timeouts at a higher level
> makes it harder to debug/root cause.

I guess my slight concern here is that SDCA is a huge fan
of corner cases and everything being slightly inconsistent
with itself. So for example we add two things in this patch
chain HID and FDL. HID very clearly wants no timeouts, there
is no waiting for responses, its just get event, do stuff.
And for FDL the vast majority of the signalling is outside of
the actual UMP buffer through the FDL state control. I am sure
once we get around to Algorithm Extension, History Buffers and
Device-to-Device messaging they will have their own set of odd
requirements. So I liked the APIs being fairly low level and
implementing the basic operations, as it leaves space for
implementing the weirdness.

I guess perhaps the first question here, is this something we can
add incrementally or are you seeing this as a bit more fundamental
and needs done before we progress this chain?  (we are getting
a little nervous that devices are going to be shipping in the
not too distant future that are going to require this stuff).

Second question would probably be could we get a little more of a
concrete example of what you are looking for. Options I can see
would be to add the options of using a blocking type API, maybe
something like:

sdca_ump_notify_owner() - this could probably be part of
                          sdca_ump_get_owner_host()
sdca_ump_wait_for_owner()
sdca_ump_send_message_and_wait() - this would like be a wrapper
                                   for a write and the first two.

But I am a little hesitant to switch the FDL process over this,
has to start firing off work queues etc. and everything gets a
little more complex.

Or one could add something like:

sdca_ump_cancel_timeout()
sdca_ump_schedule_timeout(callback, timeout)

This probably integrates nicer with the IRQ driven way the FDL
is implemented at the moment.

Would something like one of those be what you are looking for? Or
are you really looking for a much higher level API with some sort
of message queue? Although if going in that way I get very very
nervous about all the SDCA weirdness.

Thanks,
Charles
