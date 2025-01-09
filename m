Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746B81FCFF4;
	Thu,  9 Jan 2025 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417416; cv=none; b=RyqOg+hUtcCJpUjMINeIe1tMmgdwhflcCpjx1IwIMHVCeG3km2REiOf1bDWGRHWWeui9vN/CPfnGE8bSD+akqNpIXM/dCUHc4E9DmiXSZlpIi1Rq2OQfVV7pxW1wnQ4iWPyUkuVwFZ1sLq2Oof9DVH2NIfpc2r+W6G3fY0Er8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417416; c=relaxed/simple;
	bh=ZY16s6dGMMIIBkTj2GkG2P43kbVKv4miCeUFWYkGh50=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRwHiXoQgXufTRl31ex0LSrxDbI9oNV+3CfRRK6pmnM2BLQp3wr8n+AX4gF8zEBjRBMfIw4QXdZlBpkCglnN+aJefU9WLhkM3jh7py5l2/x+MgO5liH3xYYnSqG2SMYeFf7PWMmxs+9eCzNSRGphECOpv7p/7JC+jRyiBGnZzDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l9ZVAI35; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l9ZVAI35"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5095M0AR020035;
	Thu, 9 Jan 2025 04:09:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rpGdXR7ZMao/c9eXXz
	B9D2B+xqIwZSRFP+HcWhUjEdg=; b=l9ZVAI35wyCt/G6B1wte/Ls0V7ME8Bqieg
	sl+kEW7DzXqdoAdSM64EhdiBIZYgm5ZGXwBLLFLszu0DjwKUP07YmFxv+eZzaraA
	IUhGvyFBkAiFEH4jilQ4fljcDKBrZ1+qTS8OJC8peYqXJ9ryHX33H9I8zGMLI+PZ
	sqUcXsZ7VDQZ4s0y167aydf8ZPY/QiiVXdCT4BhyX9dABk1T1hA0DG+gw9zxozlX
	fCMO0KNDManL4mcYWa3HgChpBtdFmRWjCmW2mbf0ab70vBxlRy1mpeFNKsOT9UR8
	2hYiBD4Ofkx5Rb5LBqFreta2E+GDdLreWsqHczlMfgZmi5OXdzkg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kdv4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:09:58 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 9 Jan
 2025 10:09:56 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 9 Jan 2025 10:09:56 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 667C3820248;
	Thu,  9 Jan 2025 10:09:56 +0000 (UTC)
Date: Thu, 9 Jan 2025 10:09:55 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: cs42l43: Add codec force suspend/resume ops
Message-ID: <Z3+gc11a9kC/qnq+@opensource.cirrus.com>
References: <20250109093822.5745-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250109093822.5745-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: UrN-OnxMdaVNnj1rIAYIkbaU78MpQK41
X-Proofpoint-GUID: UrN-OnxMdaVNnj1rIAYIkbaU78MpQK41
X-Proofpoint-Spam-Reason: safe

On Thu, Jan 09, 2025 at 09:38:22AM +0000, Maciej Strozek wrote:
> This ensures codec will resume after suspending during playback.
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
