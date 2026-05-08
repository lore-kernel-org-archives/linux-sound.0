Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175AA33B95A
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229690; cv=fail; b=kwwpvR76cakv02cOC8ZE5WXEd1wxxdSpPBSis8PZe8pfxZOrzMaH8cy0bWOI+4+LW7kAKjqLR2JMqjMiBK2SLgwvInoUDyod+j1HNsR4uKYkATCC5nBxxDkeWcn7MNDX7vXgtTAxJMCHDzvIO3tMFRXRjy5eXMjjsmB8NkdS1qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229690; c=relaxed/simple;
	bh=P/hMw3VEmrHITVJadGgcW8xbd60dgUXKhsP1aLfafc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxGxHzL2mHfI53AHyZRUVoDku5i7gRNZwWQOWj9A0PKh4IlU9bK89zgarjORw8v47NmFVUxfTUR2/f6/3+nT2tupH3zf5gRUyPKFBWAKZVK+tPDE2+JCj3M3OF4l0VDcKEfCS2UGFB7+Fn231Azw0CPddV+ZePHGIqh/2gbZE6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p1QnAbvF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=n/nIs9te; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p1QnAbvF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="n/nIs9te"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485a1FO4010987;
	Fri, 8 May 2026 03:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=s5aXau0+LLteJmfIwT
	Z9t0N1eHfxh1qNgRnQp5zFG/A=; b=p1QnAbvFl9TMMwHpTTPu5adb94wlpO7OnZ
	TlcXeOFVNM83xE+G2pWcMotFyJhfVAXC46O4yMFjKJHgZe3EQO9pUebib0foQBaz
	J82vEtLVdVFQuDzB0LYU4MDI6pUtXeANBf8+rkzlgIspgskrTNbvu2nZdD/gKDba
	gac655HaXnx6uQsjunzYv8LIWcoUueB5DSjmnTCDkkdG/v0iIle1VZxa/xkX55cR
	RUibfUxdUUuIVXvWajhFsaGUmQZNH/RyIgWz6mm5j3w7YDivzTjQRvpK4dQVa3Mb
	v88HqFmiGqqhRvxkNzj8n3kVKuTFsFIprpFoU+51++2OfKo6HRUg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021127.outbound.protection.outlook.com [40.107.208.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk8jxw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 03:41:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVinNUh9JL4nFnbueBXpzNUGddI2rc0C2CmNKVdKZiloU7B6BQNeQQAe1V2CoPxS2iL3YLdHrHBZEZDJsVarSiFBfysJuVD77cdMo9kWdtsvsuu5UEf3HRsU4WnNDw08fstnaPwfIwTb00dropxGf3fw5gNmpH5D6oGuwwszAxLGe2qmEWtsh8avQl7xqf2cNS6acJFaOF0OsD0VRQEolUyTxAqx/9TMzPPolsgvkGUIMoes+wNjpTPJsDIQ1ZVcgvaig6gcuTg7hjuPzCmd7EZldJoG8baZ5aKp2DcLYlRUzhv7acBLpE9hMAUWNB6IKToTAlvnMsZ90IKf+X6bGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5aXau0+LLteJmfIwTZ9t0N1eHfxh1qNgRnQp5zFG/A=;
 b=B0TVl7pRIo7OuC25xmAlsh6+AwOXr8+CBzZPOSo70po6CpV19VGX+cJiFlQ/nfdeOBIAofMjnBumYPb49v5KaEogzySVwHoK38c7SfAQE1xCdDbhSJJE57hxUxkL2EyAaBXg8iTXP6ubYxaAmNG2lJMqE/iLAYiPJimtMufLBKaDmtXQOiR0kK0nUAfMDjY/CrzjCZAFyQ8h3J+Ln1eRvyplT1/B1ERBBC2toPdKd2xtfxPlHJvTZJbnDRaF4vKSc/5B0ABPVc8Yfd5Kb0AgInHukiZ2SSom9jHbEYmbIc8wIhzT9m2us6QJS+ueph3ZMJjmNnfYBso+jUZ5Vr5V4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5aXau0+LLteJmfIwTZ9t0N1eHfxh1qNgRnQp5zFG/A=;
 b=n/nIs9te0nUNnanzcXzJDsmG+3fnz37k/eQeWbroiRZZ3YFaA2nuLCCRRdBIx2YCNcAROsjw6IRj9gJHNI7PbNQesd0htEt80LvpPJBXJaiqDQV3bB3AuRfE8We12rgmUW60hqHhmJ6b4wsvhYAskY7VIx+amvzWABpHGpeInQw=
Received: from SN7P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::6)
 by DM6PR19MB3932.namprd19.prod.outlook.com (2603:10b6:5:22b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Fri, 8 May
 2026 08:41:14 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::b) by SN7P222CA0021.outlook.office365.com
 (2603:10b6:806:124::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 08:41:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 08:41:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0D87840654F;
	Fri,  8 May 2026 08:41:12 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E7435820244;
	Fri,  8 May 2026 08:41:11 +0000 (UTC)
Date: Fri, 8 May 2026 09:41:10 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Tobias Bachmann <tobac@mailbox.org>
Cc: linux-sound@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
        Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther
 Lake; chip stuck across distros and kernels; worked initially; still working
 at hardware level
Message-ID: <af2hpsMI1N6NDQG5@opensource.cirrus.com>
References: <cLVwl4lrR76pLtv8VxMSaA@mailbox.org>
 <y6AZlQCPSdCp46upW40QCA@mailbox.org>
 <afyxWuMCcawIE2+v@opensource.cirrus.com>
 <5QsknC2RSUiRut94Zp-HMw@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5QsknC2RSUiRut94Zp-HMw@mailbox.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DM6PR19MB3932:EE_
X-MS-Office365-Filtering-Correlation-Id: 8719ab3d-ebc5-43cc-9479-08deacdd8fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|18002099003|16102099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	I2Vhav5FKY2t18UxZtaqNKfAeAsS2x6Uw9HI5S9AkxX0nr4yl9S9sJYWO6alMj9vbtjj3MzpG+1mo6RazkOyorSs6DxlONnMzTi9nYLjB/ffEFSPfglNeYZ4T7WgtKvCn2OnHwJSb43Lnp+xJ9QhJRrGB4DZgiPs98T86wv/geVecsFdppqSF0o2otnqLz8+WePvxu2Q00LG7gx72o5Ar7xPq5oAuacVB+mzJTqUVv3jOHEHsUTM43i2+y968kNMNnORtQyNIZGAnQDkYQk/4hIOR0qwEDfgkhF/RpeaQpL9rEKZn0UV2w26UBYz3SmgO7Za9UrPIg1461/xGeUH9uWBLu1pr5wlsGSrXzzEXCfJYYB3U3MsCsT/reePR7QQUPw59v/WHD7KYHvX9xRSL/QJz8r5pwgSXLbQaDs5C7iHyuU+h69+Zgdme33WD+lV5PHjwh+h/XLj1xlABt8uPzW9uHtnlJdx3ArScKMUlgWhd/oB0I6loLTCkl79dqWWbem9BAJeX89+I+yX0ctIKZKZJMNjdi5yyO1VxEcmmkAoj3czKN+ZskENvEUE068Y4VJhzUrRxPw2RhtUE41VTVgoDo3fpH+TfNJaHcOzCyOV6YiRFs35T1m302KwjDVbFqYEn2+90pIyiAb1wawwuBzUZg/qYoiNvpPozuMXxKI7tKMrR0qbvt9Muo07L7siBmjo6J1dbapiOFLm76B0L1t6SlqlJYlh/Q3qIjt/2ok=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(18002099003)(16102099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c2/Pq9Zep8G+f5pPihcnW5oQgh94OtKf9ZNIoKzkqGbwt1M3uT80NYS1zIUN9+Yx+R2eDNEEkkgTTbEA6VsIH8GQUCR86ZrAhGwlnQXp4Q3xwkz0sIH4mULKgUIIjwUU9lsG9ZultMCu+WTuXBbd9nuIIenhExxXveloREKhD286hP1MxnUZy4XKrD8IZQALjfbksPm3AebS+gySTMv2BU/R4/mRuCN4eDDVjvV0/jdeLFtKdqjC+wZmz9NjDyCNur9aTFf2SJg+fXyWW9Yy9yvehjrEispIsK6wOB4XcumYV2SD8hH1WFRWSOw3C6gJFhoiYaahhCKSJxc02BUkCeImsrkXNzfnfkkuvAZoSG0KKufnwKyCu2kih6tDSZlAYaw5JNIYD3+LWvDUSOqK/+r8vId7ExpuhBd9iAIHRWZRAGFaG6C6YWPQxNCbIHsb
X-Exchange-RoutingPolicyChecked:
	RCA1KR4Q0a8innvf8PraC8AdmGm8R98Iug6XV86EnsRyB8xfZxdKKvVc62dmXsExuUQPVeHF3MAT0gaPx7dSib0m8oIa+QVv1S3dZ+UEbTL+X0pETXBVkfXJzbrQxeMHjWxN/+/UCQE80suO1/hSNZGQq2hvioADsEE7YbiUqOGpQT2CQ+JfpiSyvSHG/g6EIufCVOczFe04htVKkxtbpHvwe/plrp8/Qk6HdInmrEJRlT07bdyrLcRvyC0whOkMuPCV+DwwSfqAClkFIBQ7ml81OIQJ+nlYmCIBJFKxo5QXtzmIyqAkz727rBm+XHOzSnuBF80Hb4I0NzRE32N1sQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 08:41:13.2407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8719ab3d-ebc5-43cc-9479-08deacdd8fe7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3932
X-Proofpoint-GUID: EBKNthxSkl7a5vXgEFCHPigFB5MqW6d5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NyBTYWx0ZWRfX+/fFT2GA8wLg
 eDgh5OP/pFhWDYXbB15bxuDTYXGtVI9YInGVOw7sVYAdFxYmcrpN7JPuGLXDj5foL2LhGwvQQLZ
 7HBjd0J1Hp3J/h6r/NN2gX0IoCZSAmE+/6B8dkDeXjy4BVUsQ+1UjcK9QIksmLSYkgku+EmHpkY
 hGelFPCfPN5Q7NgbC2lTJM3VhvC0Bf024dTlLhuZ5/4GiAbszis6fFP3f3bZOU1TpgIMC6xD+xv
 8e+Ky5K9uSKY1sFJ9tBf6SoJoO75n5nIZ3JYS4UwK+wOG5TzlmDpeR6VhOorqvU0bflf3l3Sb5z
 dC+LgVTEyk6NRrsn87JP3MVuyV7fub09LiXsbXHJF8QaK/mJZokLICsXTRoHXReskj2nrN4N3vq
 5o4bcych0AUi7mjXoO3MCNaMzLbRL+92uCgmO52MksNUx/hOiJPLDAlI3io1Ah52DIW0uyBIfXT
 ZOizHW6H0fYSe2HVnFA==
X-Proofpoint-ORIG-GUID: EBKNthxSkl7a5vXgEFCHPigFB5MqW6d5
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fda1ad cx=c_pps
 a=TSVcXIYLINIUQqCwOqgFvg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=4l1NQi8tO7JeO05eLigA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Thu, May 07, 2026 at 08:53:27PM +0200, Tobias Bachmann wrote:
> On Thur, May 07, 2026, 05:35:37PM CEST, Charles Keepax wrote:
> > Yeah I am afraid this looks like a hardware problem, enumerating on
> > the SoundWire bus is pretty much only dependant on power rails.
> >
> > As you say there is a tiny hope the device has got into a weird state
> > but isn't reset on a reboot. However, given it looks from the log like
> > the amps were reset:
> > 
> > [   14.603448] cs35l56 sdw:0:2:01fa:3557:01:2: Cirrus Logic CS35L57
> > Rev B2 OTP1 fw:4.2.1 (patched=0)
> > 
> > That patched=0 means the firmware has been wiped and that only happens
> > on a reset and as far as I know the resets are tied together on this
> > model. The very very long shot would be to let the battery run down
> > and leave the device for a bit to try and super make sure the power
> > rails went down which would also fully reset the device. But it is
> > definitely a long shot.
> 
> I figured as much. I can take this up with Dell as a hardware issue, but
> before I do, I wanted to ask about something architecturally:
> 
> Windows (or the Cirrus driver?) apparently treats the speakers and the
> headphone jack as independent functional paths and can drive the
> speakers fine despite the jack being non-responsive. The Linux driver
> currently appears to bring up the sound hardware  as a whole, which 
> means the headphone subfunction failing to reattach kills the entire 
> card initialization, including the still-healthy amps.
> 
> Would it be reasonable to consider a degraded-mode behavior where the
> driver proceeds with partial initialization when one subfunction fails,
> as long as others remain reachable? My particular case is likely
> hardware degradation, but I imagine similar failures could occur from
> manufacturing defects, physical damage to the jack contact, or other
> single-subfunction faults that don't render the whole chip unusable. The
> current behavior makes such a laptop entirely silent in Linux while
> still usable in Windows, which seems like a worse outcome than
> necessary.
> 
> I realize this might be a significant change and there may be good
> reasons it's not feasible with the current architecture. Happy to test
> any patches.

Yeah mostly this is an artifact of how the two operating systems
have structure the audio subsystem. Windows has more of a
collective of drivers, Linux is slightly more monolithic.
Changing things at that level is a pretty serious endeavour. I
would agree in this case the windows behaviour is slightly nicer
but its non-trivial for such a niche case.

However, that said we (and others) have been trying to get the
audio system to load more dynamically, the intention here has
been to not require as much work to support new models. But I
guess one could perhaps "abuse" this for your situation. The
current code creates the soundcard based mostly on what is
present in the ACPI. So if one removed the codec from the ACPI I
believe the machine driver would create a soundcard with just
speakers in theory. The simplest way to do this would probably be
to add an SSDT that adds a _STA method to the codec returning
zero, this would tell the kernel that the device is disabled and
it would ignore it.

Thanks,
Charles
