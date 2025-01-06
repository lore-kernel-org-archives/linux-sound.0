Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F61DBB38;
	Mon,  6 Jan 2025 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736165622; cv=none; b=sMPPEZk+m/kiKZN3apKjuZisbm9kgarA8sZqUrUTsIdczDrC6e7Bvjwrq4yOOsTK5wtjvbRWvArf5NiwT1gKCSLJMMkkUBd4uh7/+ghwxFEfzz0KRqktUcMo7fTndBO0cifGmndurSL3fIpL+sPgttjeHnYVbcMtjn21+Oj+bRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736165622; c=relaxed/simple;
	bh=ZBVXigcAOJzB0HxsYiRksPwYN9wDZRNEZ81YfqRHcgg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrRW1HcNVPU2br210vO+iVV83SGNyuU+QQsjA1wO3ym8zmi7TAHa1hA3rDaq7PoXWU4CW3vBvu6IH2BWQJDY+Wyh483qxm8PjkRX3cSzDmyLR6t9j7z835Sx4g1IzPnGhwJEQXyC89zRYU+vx2SEWNG9N5Ic8i5ex+Zz5kf7sig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h65IP3o6; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h65IP3o6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5067Ucqo010028;
	Mon, 6 Jan 2025 06:13:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZBVXigcAOJzB0HxsYiRksPwYN9wDZRNEZ81YfqRHcgg=; b=
	h65IP3o6sD5UIPqR5XzyT0nLUCatFv7lSctssO6iNTivx1bnsjfZWkdDEo1F0k6X
	ccBECGtWGDuMG1SoyyDqt1BrkW22QpVncHFcyKHOO0y8Em2mZzQPd+JJ3XVM/Wgg
	dV9T35d7z/Z7hP8tYo887sDx8r/AeWOjKCK1Os+LTB1jIl70EAWqbhGt0eQTEqQe
	tWnwnJ7FqunkoS+z2VmVLi4/XyfOXsdIuQPwfHkmszMe5CNeu2UiRouaE/KrO+VX
	fbmhtEy0ikLkkwmG/qJfnE/MLGGawjcqlqKBVM6wQdbjK0YFpfySr2eoETfcItvG
	iigFm91gUg0ywlClkWDKKA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y3929nyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 06:13:28 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 6 Jan
 2025 12:13:26 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 6 Jan 2025 12:13:26 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id A1176820248;
	Mon,  6 Jan 2025 12:13:26 +0000 (UTC)
Date: Mon, 6 Jan 2025 12:13:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: anish kumar <yesanishhere@gmail.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH V5] Docs/sound: Update codec-to-codec documentation
Message-ID: <Z3vI5eJKCLfLeFwX@opensource.cirrus.com>
References: <20241207193441.15767-1-yesanishhere@gmail.com>
 <Z1ggwXLAu+/Y817c@opensource.cirrus.com>
 <CABCoZhA1g4McaLtsQqZv=Y1UrEg4kmyMVjdJJTfDow0ho-WdCA@mail.gmail.com>
 <CABCoZhAqhUxJSrELx1if1QYQK0wt_wrHMVcPwVbkRoqmHA2==A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCoZhAqhUxJSrELx1if1QYQK0wt_wrHMVcPwVbkRoqmHA2==A@mail.gmail.com>
X-Proofpoint-GUID: Dru6WVyfcAYv0oTzP6gA1GZlsu3azGaM
X-Proofpoint-ORIG-GUID: Dru6WVyfcAYv0oTzP6gA1GZlsu3azGaM
X-Proofpoint-Spam-Reason: safe

On Fri, Jan 03, 2025 at 10:10:25AM -0800, anish kumar wrote:
> On Thu, Dec 12, 2024 at 1:35 PM anish kumar <yesanishhere@gmail.com> wrote:
> >
> > On Tue, Dec 10, 2024 at 3:06 AM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > >
> > > On Sat, Dec 07, 2024 at 11:34:41AM -0800, anish kumar wrote:
> > > Also what do we mean by a "A mixer must be created", I am not
> > > aware of any requirement for a mixer? The DAI link needs to be on
> > > a valid DAPM path, but I don't see any requirements other than
> > > that.
> >
> > In my case, I was implementing a mixer widget that users could
> > trigger to enable the entire DAPM path. However, I believe it's
> > sufficient to simply state that there should be a mechanism to
> > trigger the codec-to-codec widget, enabling the full DAPM path.
> > >
> Could you please confirm if this explanation is clear? If so,
> I will proceed with submitting another revision of the patch.

I am happy as long as the wording states that being on valid path
is what is required. What I am keen to remove is the explicit
reference to mixers as that is not an actual requirement.

Thanks,
Charles
