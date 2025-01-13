Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62F23ED45;
	Mon, 13 Jan 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777699; cv=none; b=NFe2nv8gZWpKQLD4gqMYxtWf59pt8gi2zzpPjZ5HvDaJ4czhEp0zC2AFyROCr+L4yAzgDpT9EVX6XJEUZTiZdMfUB6TnGCJ/WfMkLtEVh77sckwuqq6ph94HWvKkjlQ22QLp4s3wwpSXgVMX6z1NXJLCNu/evQ9rec+ePLF5auM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777699; c=relaxed/simple;
	bh=zV0FMPnZV6gsNHuOb9lF3xeGutI/v+MJOlkxNXkneSA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQGJv7HfcsqO2lQOlAMeoRclp8HCZVrZFNorOYesFnEGiWGw3JM+7x8epP2HMXoQoYgJYeI5D13wTce+wysVWDxB5nd3TjEhLMUjYK12ckk62YdgYcAi6X2xhilO+G9RIQZBd1cwwmrQ4wI+x1RuObrjcBQw8Agghy4dkeekuik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=loUXUuyv; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="loUXUuyv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D7nWuB009306;
	Mon, 13 Jan 2025 08:14:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=s5+S3Igr3bD9UKouNB
	zaZMvaeNzzgiFttOLq1s6xKK4=; b=loUXUuyvELIQ8Vg0FNyToxxP5Fyx5OzIiE
	Tjg4dEBJPCgGsOw6TzbTCMBayQAa4yMS/HregzF5JFNtX3iiC0VYmLPQU5iO3fBO
	FPq9MBiSWTzEpuVTRwpRH+fEOnho130mnJ6bsRoSp4PDpGp5aIyx4DlmOxBc37TN
	xv8PeC61xAfDCkZlXpYL32tTmBlVaVor2Jk4OwL8/MpEUc5Kt4ZkC8f7bzGK10L1
	AIVYktoeViSiwddib7sXgQnL3dNgzrqHatdrNG5auB6Ukb5Du2lWks1RMCPcbwP/
	K9tU9vVug8atPVh39vzwS+9nVTX7mDtutDehboTQXX3BF/emY7Gg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 443nxma3gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:14:48 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 13 Jan
 2025 14:14:46 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 13 Jan 2025 14:14:46 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D75D582026C;
	Mon, 13 Jan 2025 14:14:46 +0000 (UTC)
Date: Mon, 13 Jan 2025 14:14:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-sound@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <s.nawrocki@samsung.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-kernel@vger.kernel.org>, <jbrunet@baylibre.com>
Subject: Re: [RFC v2 2/2] ASoC: dapm: add support for preparing streams
Message-ID: <Z4Uf1XmwYH3TIcAO@opensource.cirrus.com>
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
 <20250110210730.705613-3-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250110210730.705613-3-martin.blumenstingl@googlemail.com>
X-Proofpoint-GUID: DtdltIgpv8wATfusjxXe9REr1nX2Q2_3
X-Authority-Analysis: v=2.4 cv=Q6Eo452a c=1 sm=1 tr=0 ts=67851fd8 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=w1d2syhTAAAA:8 a=hQzeRV6ZXms_Ih6WJlsA:9
 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22 a=3gWm3jAn84ENXaBijsEo:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: DtdltIgpv8wATfusjxXe9REr1nX2Q2_3
X-Proofpoint-Spam-Reason: safe

On Fri, Jan 10, 2025 at 10:07:30PM +0100, Martin Blumenstingl wrote:
> Codec driver can implement .hw_params and/or .prepare from struct
> snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
> callback has been called.
> 
> On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
> (sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
> codec output because further digital routing is required after the
> backend. The new DRM HDMI (audio) codec framework (which internally
> uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
> of the hdmi-codec to be called. Implement calls to
> snd_soc_dai_prepare() so the .prepare callback is called. In this
> case the mandatory part is the call to prepare the sink (which is
> the hdmi-codec on those platforms). Also call snd_soc_dai_prepare()
> for the source to stay consistent with the rest of the code (even
> though it's not strictly necessary to make the DRM HDMI codec
> framework work on Amlogic Meson8/8b/8m2).
> 
> For platforms or sound cards without a codec-to-codec link with
> additional parameters (which applies to most hardware) this changes
> nothing as the .prepare callback is already called via
> snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
> dpcm_be_dai_prepare()) on those.
> 
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
