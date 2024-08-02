Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58CD1C0DF8
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722588349; cv=none; b=QA6/gjFIka3tay/HISxcicxgAZO2RuEscnfd+QJBq/i+frsutqjaoBm4zvMsECSuBMolhrH6fFSFtNg5ZUySDcN8o1WBCHNLWsYyysjx7usLbQJXiKRNN1+aJm3G04qiYcJJ+DcZVzqRacg1sWAhViLGqc2bYkV19gof6SY80ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722588349; c=relaxed/simple;
	bh=ZCa7UEtBK6q2D5D+zjAzvhXM2aH5Ue7dLP544F9/DXM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlqDAN9NXyu6NE0JcggCjCxMOxarLn2gb+UHt5cD1j3lN2CpI++3mDrDmewvN5l1nf8w4rosaUoLo9nV8enTAF7piR20CKWeaKwcm676dGgWtAkcFK9GIAFCR47AfeIFN+dm1+NpU0k5duhBAjPnCUjquhQIfcShzbk9ynCrfLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DU2Su3iN; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DU2Su3iN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4724kR57012701;
	Fri, 2 Aug 2024 03:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=TQPIrg+OGLmUJPQC5I
	p6BlYOB+L4nlTFPhZ8Re6ZjXM=; b=DU2Su3iN2rn2+rPnyXE1RmiKqUMiQufiFt
	nZCWuGeFtXKbYpF2mzOnmU6yWQ3VI5dNw1xn+fckXUGkfZHZ1MWu2RDyXfYDWyF+
	AEFEeV6ffcCJwcaOP8p6okMKh3oMtCZWvSGBIJ57On2KzzaAACwUAv0I9r9u7QpQ
	KMMNZANIUrnj8eBvrZW8y6eraxl2dhOmhz1WVzRgX3r6z9FN0+2BwWmoJBaCTvwl
	1BLngPHLn6m0iSudxrBSFklHX72+IyNoWQqw9SokT8v3YvG1oMHgxWueDxOmRp0j
	RX//L0y2M3iPigpz8cPDcUIf9Iuz3NAGzYanXrW7x0SUwk7fkeAg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdnrfpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 03:45:02 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 09:45:00 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 09:45:00 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 09CF0820241;
	Fri,  2 Aug 2024 08:45:00 +0000 (UTC)
Date: Fri, 2 Aug 2024 09:44:59 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 3/4] ASoC: cs35l45: Use new
 snd_soc_component_get_kcontrol() helper
Message-ID: <Zqyci3/+iGreUZPP@opensource.cirrus.com>
References: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
 <20240801100413.1620481-3-ckeepax@opensource.cirrus.com>
 <c4712e65-2914-4fa5-900c-e85edb7246d8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c4712e65-2914-4fa5-900c-e85edb7246d8@sirena.org.uk>
X-Proofpoint-ORIG-GUID: 8kOrT7Fltb4uJKTt7f4f8jYrE3M2vASG
X-Proofpoint-GUID: 8kOrT7Fltb4uJKTt7f4f8jYrE3M2vASG
X-Proofpoint-Spam-Reason: safe

On Thu, Aug 01, 2024 at 05:38:32PM +0100, Mark Brown wrote:
> On Thu, Aug 01, 2024 at 11:04:12AM +0100, Charles Keepax wrote:
> > No longer any need to hard code the addition of the name prefix, use the
> > new helper.
> 
> > -	kcontrol = snd_soc_card_get_kcontrol_locked(component->card, name);
> > +	kcontrol = snd_soc_component_get_kcontrol_locked(component->card, ctl_name);
> 
> That's not the helper that the subject line references, nor the one
> added by the prior patch - did you test this?
> 
> Please use cover letters for patch serieses too.

Well I thought I did but clearly not, apologies will check it and
send a new spin.

Thanks,
Charles
