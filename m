Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAB3FB06C;
	Tue, 28 Apr 2026 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377976; cv=fail; b=dh+qScAqPWRDp8ESHEEyjD0ow3fwFi4V19eQb14MlUDjK+w91DhIQ1ynxVl34yDXO7RCYOV8SXla3RrbGUX4LF3fyK88naJyaR7u4hBbt/6oC5dKfzY9bHKDigymsLDIw82MJTpbYeGCBlu+QF3qkG9T184x4urXHnIGuWKvbL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377976; c=relaxed/simple;
	bh=dHs82ntFqw2qjVuSX/ovQ3OZLXSR4dIDR5/4f7GzPNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyTge+HMRd8J6IgVKPPmB5ntSkPdVOamrZYgGtk1fFvZ9tWLifxfZsdSzUXM0yXyR/RZGSI1mEaeO7uqA0VEfAV4Opw0Zsz8QvAUxW6u+7xfahYRw5epA3zoYFi87px//mS3tz772cy52Bf0bkEGnXZjG3qHfkrsc4X4+3MwYzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IHbkP7Rg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wEFsyMWC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IHbkP7Rg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wEFsyMWC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S81DUo2329907;
	Tue, 28 Apr 2026 07:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=m+egGGrHwL7jHU28Gy
	+Av8xo2543ahBO8sdr0Cvndsk=; b=IHbkP7Rg5oHC/mp7qgkIpsMo1KNsPDzymN
	zPAzUMcDT/7dz7boW9ClB/EgNWgg6uh/YzP6YhdmKCSsXHb0kx4r88N7it28Eaet
	7iGdOR8FpkidPSZHZ7YR8A3RQgxhV+6TDkWe8lF/heGBqMebXgb5QPpxDkMdj/hZ
	wYcsx/KA+/LDXSnDiOMryIwZ9S6eZDW2aepmDtCk9klYlsb8oJI4w0owYob3m7so
	Dnz+RVCiJX8VicnyMPLGs9KMsJtH2UWc4MdueUBN8NrFgCXHCXzPj/5gndafKPtG
	shjx2HesmnDOq/kW7Va9ENAoKNpr+7rStNj72/EIDNOIlrFUme3w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023143.outbound.protection.outlook.com [40.93.196.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10bk8q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 07:05:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoP3V8NdFZjzZFJN7ZJtbCM1p2qRsHH1aiNWnWpeU6X0K6PoFhlVUhCRCTxoiGy/tZi6cMQt1G9Ag5c014UW4vbTm1qcbwggR/tpCCCEJtrFnng5HUqet3YtBLDtY9UnEazit71q8JWhCpvjD510XMuF0FDvU4bpw66VxpANGExILzDq40RKWs/VRXtZQ/TymxEiN3qhB8oQk/b94kIx4E6rS+d0crbPhbZOLSDzZBjCjg0BcZp78hhaExqjNMsazpseIcGsZMdm9TR6KeK50ZwOq5+531DP1/WZS8L5PSqOQYm04CK+wm8ncC4U9mT+slp+u/SF7gE1kHn7FhZJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+egGGrHwL7jHU28Gy+Av8xo2543ahBO8sdr0Cvndsk=;
 b=qctS84v9a8YtcW8r/XokQxdeGn9cKdll0BV1HN296KQ9Qe8wDb+sHUK0HILqac/o+oyhDTPzJ8DGOYaDOG20wkxGysKvtQto9JwH2d+zUalqRMmsqCzkdf8VEplK9BUjbPRMguXFqwVBRHcFFaMepjoKwFfZl+DWwOEJatZ9xLEultnVkXQr/uXUVAYXZp573fRNin418pDzlMs1WgqMpaIR5W7JM/L9S+LvOLBB3q67Fb+VZXZTLXlImqMZBMN0cEd0K832bxQrtwy73EAvr7ayISD17n40jE5newGpn4CCqRM0N6WRex/RGdls8nlsTDYPAldEAZeYiNk9ntEU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+egGGrHwL7jHU28Gy+Av8xo2543ahBO8sdr0Cvndsk=;
 b=wEFsyMWC7nAp9ZO0jIAmFTazX50en7fepJiXX3ZT14gU6WHsuRqK9g0LSSvrofwcXS1X2Vv5MQPwqEXVLFj/tZW+XPcwizVHELW4XPe1vpmPczH/Wmj6zCEQQcWVioFS6bR5WCUnAN/LWAiGrj/guLNuIIKicFlRvc7BFRpmvo4=
Received: from LV3P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::9)
 by CY8PR19MB7644.namprd19.prod.outlook.com (2603:10b6:930:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.27; Tue, 28 Apr
 2026 12:05:15 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::2f) by LV3P220CA0006.outlook.office365.com
 (2603:10b6:408:234::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 12:05:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 28 Apr 2026 12:05:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 520BD406540;
	Tue, 28 Apr 2026 12:05:12 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3D03B820247;
	Tue, 28 Apr 2026 12:05:12 +0000 (UTC)
Date: Tue, 28 Apr 2026 13:05:11 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v11 1/4] ASoC: SDCA: Add PDE verification reusable helper
Message-ID: <afCidxvz5oVrmzHM@opensource.cirrus.com>
References: <20260427082401.2118-1-niranjan.hy@ti.com>
 <afADP5lPtcG13RTr@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afADP5lPtcG13RTr@sirena.co.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|CY8PR19MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: a27220ba-2e3f-4138-428d-08dea51e679c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|7416014|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	y8FIG6bJ6xOh7Av5fZmrwYVP+su5F8OIdyG7KQNSDvu/6kWs71qF/LyNB+AgTRacv2K8MHbK5i94sEPU/xrRYUfW4tFvYq1xMyajlg3qxAEX9bZNJPtczEv1/M1MmfySf+PIi8P8rQLpxG2wi4cTQnGDTikD536PkfpCzi3cElLDZDoQGb+/C3rUgRraRzm6/i+pegWD3VeCiauaSnp91OM9HhfX6RzpmyGe6az4vi0ZJs7luJCbn13O16qYk1zVfFQG9b8YMlV3Xo36XUZ2i3Ldb2run62BCLvdSKUIOvZoCIZUxx9WBGoNfBprwAU48yFN/3nGTejhQKimDx+7NZqjAHeUFO+2Do6kCHClpO9oIgsHO5MSWM1zvtEoe3yJRshemrERMj0jR9kk+G2vp9JiEEuVP8onDPkwrfUq2yOduyUxBojn8VIYdM3B5XQcq32KVkDlYs6uTS4hyFWpyIujbmJh7+1VvfB+X6cwawm1GSF15KYcig3XoCNhbnZ8N8Xlg/956AifTWXCp7nWxrwVr3Q3IZuUOF0aAaJ2QAV1SHs9S+tWxHeNtpdBNGiR4M9F35P8UFboXwFFP/dKOTU8u+DqKcHpj5hk/8kB/SYsHbd9GGBxI3+62Pa+/hl+YkHGJwoUtO7eQWjGbZyhlpWf3gbmgQyPw/R5jH1iW5MqhfddzzTQPOTCKU5q7vgR6yVvklf6jhzuY7zMlXUjN5CACIZTe3rgyKSsdxB3SNIPGdAxzyuh14xm8kfzBuazw+HSfYyJwQqLg1WNgA5xmA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(7416014)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vH0RZzNISeGoEUFqPA2nawsQH4el90jaqsgBJ/WYBTJw+IngFViNPHLhY4bQUuEOw8N40UkHQe7jckMWmYdKq7vDPA4gGM8JwkF+oxOyxrGT0zwuBP2Wo7o4u5L8Hdr8028CWtUhgrpQorKZ/BaRQIK5QT8AiV8dGhqJzQlDcGJnA5WA8jLNuT2hu3rDIKzBTDV5Onnmol8HGFgAbmi2/bjuX+zvNXC7L+KvyRwWKlsV8it5dIku2YfvC1GaEowbSiFOlHPNRwW++pAatabUrv5HfrJeVlO+aZDoV2jocCWjgDe7WjCRZg9/MBNv4opd8nKjcRQnGaeycQK9qMm08RcN53yQXW+2aSDSoHe+Jqqhzpc67fjHqVz1kX1TsP8rTHe7SYSzSZUsTFnkMEipdnn6uKWPADeDwj16oZcGNJrvojaEIHmQkz7I0+oBKz4g
X-Exchange-RoutingPolicyChecked:
	RkZtykMkqjuLpIAv89VFlxzBbk1RfH+rv3q8O6cmaOsy16G43X/9HtyQlRLKF9Y7IbbuqxQTlW24kZ5C492+MY68BCKnx38QJhmxGZvQWlhDUiIZZfvFPu+MpzlF5Aofmo/D/E8skLMYftbwCl554lmZJRplx+nZmZ5Fn0fgNbKbSx8hjJj1Of7Aljt7X3S0sBH4/moBFQeexdpdJs6YfAzeHVAGgUCY4AP5S7PNh1zk67/wYW8zVFWoSjsoYaci8rXtIz3XRu+aoP4VKGdIfn7mb7YOzv17rLRBFxeW5dHHngosy6bh3vpXT2URSgMwYvqfFlck8rf9MO3EU60cWw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 12:05:13.6953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a27220ba-2e3f-4138-428d-08dea51e679c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7644
X-Proofpoint-ORIG-GUID: tcqYuUIjIrutUx-u8LwxkxVLQTAX1JWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMSBTYWx0ZWRfX24ILL5SZMc+w
 C7LSc5g+7y68PDX0dHacXbEqDcHlxRhzcSWEWPGAInyQ6PfdWW9iQKcqZqVBgqSIr8xxmVYkxjh
 rys8sRMmeq+AV+16bTrzJPncp9Rs0tqI2f9ussv1plRelofWiQ9pFUfT7hQVBGcl60QBFyEh2vE
 IEHXnvprZHGY5OOwJcWB2VoHFi6Vzno7tLxGxxB2hqVu/FrUlBYIGRCaiE950nfs70jdh0k3xVT
 wJ4affn325h0/n2wx5/SJh6we+RoR1Av8hppon5V8WVVWsD5PrOYE1ZS0kVdY+AgcntwuVNr71u
 DSPquD5ssIvae9MjrUvJHRQLieII7r4bkYRNoORSGTpF+GNVOkkDwey9etuAMvAm79qSN88WLsM
 D3rHPc5DpcooV+n6o2MA8m1FPlTcpgPoDKXN1Y0tPJFMyfU/3Sh6uz79aDRGuC3/RxzVrFX5Pqc
 p6R0kqTBQjXjb+izMGw==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f0a280 cx=c_pps
 a=qOSDSPx+mU+qTyBbANH+pg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=WlV5iyAtYXD5Xf9FdvkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: tcqYuUIjIrutUx-u8LwxkxVLQTAX1JWT
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 28, 2026 at 09:45:51AM +0900, Mark Brown wrote:
> On Mon, Apr 27, 2026 at 01:53:58PM +0530, Niranjan H Y wrote:
> 
> > +	dev_err(dev, "PDE power transition failed: expected 0x%x, got 0x%x\n", to_ps, val);
> 
> The old code included entity->label, I guess for disambiguation?

Hmm... yeah I think perhaps we should push the error message up
to the caller here as it will have better context to print the
message.

> 
> > +	return -ETIMEDOUT;
> > +}
> > +EXPORT_SYMBOL(sdca_asoc_pde_poll_actual_ps);
> 
> All the other SDCA stuff seems to use EXPORT_SYMBOL_NS() or
> EXPORT_SYMBOL_NS_GPL()?

Oh thanks yeah that is a good spot, we should fix that up.

Thanks,
Charles
