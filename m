Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3629E0E7
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 02:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761533477; cv=none; b=Kqw80WXA1PyTzlYdl/s4fhdNBoklvQz+fMcXO0x3Bu71MjNxsq1TgIk38mwNi3pkkzcOziv7aKu5wskQU4EaEtltINjXmG0ggmpbSoGBk1yfQ/dI5e+EVuIgjDE2dSX9G9M300f95kuK9Cni8gZfo+N6tO6eGPSnAIPZhykJE30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761533477; c=relaxed/simple;
	bh=Oew37RkaG/8wJgFnXEkXtYo2sZTKwQHokzlp2xcY0P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpCpgAebk71sc9Oad0x2LRqKuQ77hyxdumvMCqNwziPa3ipv98sD2c818Gr71gICengkvVDiZ4t3wE6krjsowK6XguYDiIgNskZvRbLR2E54CqUoJoRG3yrGZR/95LzGCXav8Y+9YwkKZms2NGIgvpRHuvZPXBqSieTM271mRb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Kb5CEHr/; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Kb5CEHr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761533427;
	bh=HmT/TP3f4Bj2xNH9Km83ZlO47Z9XjZQYSXegjluuhgc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Kb5CEHr/uWdaktq2DCRPTxOCqOI36wYjEemVbWyIbA+cnvY/CCYYjPl+Iiw0oQ6M8
	 ULCbRZk/ixnfEg0YxmxxW8wMxTUeWy/VBYa0UX3g6t7YCKaWFUsW/r4DSSBaeeuvLF
	 CYKO5sWs1FK6nbBxEASehPYtoeQ/TrfNUKTFpCgM=
X-QQ-mid: zesmtpsz6t1761533421t4cff6fd3
X-QQ-Originating-IP: 50wGhaxJ5u7t90/gV9tqInxDy8Z+DPU1fiWtwtZoqUw=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 10:50:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5817616806356999324
EX-QQ-RecipientCnt: 5
Date: Mon, 27 Oct 2025 10:50:19 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@ieee.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-sound@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [bug report] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <7804C2A506CC6DCB+aP7d6y8yrqlbKwbN@kernel.org>
References: <aPtiNCZ_KBezL2Dr@stanley.mountain>
 <E26A36F90026E89B+aPtkgbhoPoTzVnRN@troy-wujie14pro-arch>
 <aPtmbe9uoHIPfZz7@stanley.mountain>
 <eee35fa0-0a5f-4730-b6e4-a1b92dc5000f@ieee.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eee35fa0-0a5f-4730-b6e4-a1b92dc5000f@ieee.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M3ziZXKDk+iOM4VUtC0VCr0J8CVDH9Gl162uooq9pYPX23/9U+xMSpcX
	50hIE3cLuR8iRFbk3fxE9Bl2qpHUVPRuNBuYa5wJV+SJ8jT0cNpbMjlpKtR/Aing+soMypu
	cLMcPGM/DYPQ5oVeTcIkWU4LJNeEf+FjmQY5UEOSm8Vjjf7JFe+cw2EA3fyaC0elWKbKX8y
	py5FQikLaE/eMAjdiUuoUmT9+zJEzSkRk03uFUMJI4yWjVzkJekvlqBRii/Jpub/RUECwGZ
	drHI7wiG4j8VmS5os4SmcZm4SCwzNWvpa2yGk6y6fpbSbfhOFl0iZHZA5el6VSWWZiQm3Vf
	W6xumeNDw27ucs6rOjRe8o0O+ZfnP0QMigpe0o8Ob5Zs26dJeAQDBqAmO78f9zO/XDWOXCR
	/+XC3/ChbjyraTwTK0vXcKOLdYDhAOoYe10kCWrVRbU1me6mUGwZMEKImHPXH0vc3oI3zA7
	7Sz3cLy2NE+o0GWSLzp3qSwFnOlB+zdcNUNBpHyzni+5Cz7faY2nBfAqKDHi0wOpWXxzI2x
	usNoiHmqPA71BuDAOOtUZ6Mgl4P1Z/udnv7ohlpPavsZGd0fvlTMV3ArrBhvbhWB/tssW/C
	HAwavuHV03ewsIUsxnblxy4nT03SQSb50O4Db6QG1F+h1qqdQWR4Phh6bN05YW3uwWXO2Jy
	t6kGBshjiKGrv11Kd7MJWhnqB2icRvrtoOcRMc+m30VM4x/yyX4aLd6WgM4nbzV+P2pqn4x
	WffB3xqfhNcHpLGJmS2oUswrUDNs3NO2mFwjMhnfbLNIUqwpU49QD8+/9MZuO25lgJofm9o
	j4nrMXyDpkho6uW2MxA1sdrIW4DFuGqq7wk5wsVBk2hEGm5xSWDXO0+fzD3i9dTqI2pHq4S
	ZOGu1dPLsm+lX9qPNOkvK/PePeWkz+iIf4IPv4J/6LaG4KhC0K0n/ZwCRPNyeP2wxycflTW
	58Nkk/i61Bx9uLaMbxw3EgN9M99kI34ZoCcuYIcq3G6UNO7eoDE2bg+iImnHKSQssCcylsT
	L6ZtAR/lfulc+AYY/cPumeh77t9ZGiiwirZ3UGnnSHWlVIAGabD8kTwCSFDrC6Tj9HzhGFy
	w==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Fri, Oct 24, 2025 at 11:06:04AM -0500, Alex Elder wrote:
> On 10/24/25 6:43 AM, Dan Carpenter wrote:
> > On Fri, Oct 24, 2025 at 07:37:51PM +0800, Troy Mitchell wrote:
> > > On Fri, Oct 24, 2025 at 02:25:40PM +0300, Dan Carpenter wrote:
> > > >      424         i2s->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > > >      425         if (IS_ERR(i2s->reset))
> > > >      426                 return dev_err_probe(i2s->dev, PTR_ERR(i2s->reset),
> > > >      427                                      "failed to get reset control");
> > > >      428
> > > >      429         dev_set_drvdata(i2s->dev, i2s);
> > > >      430
> > > >      431         spacemit_i2s_init_dai(i2s, &dai, res->start + SSDATR);
> > > >                                             ^^^^
> > > > dai is not initialized on failure.  Generally in the kernel we always
> > > > check for allocation failures.  Even when they can't happen in real life.
> > > > I was hoping they were going to make a rule that allocations under 4k
> > > > wouldn't have to be checked but it hasn't happened yet.
> > > Should I send a fix patch now, or should I wait for the maintainer to
> > > revert it first, and then fix this error and send?
> > > 
> > > Thanks for your report!
> > > 
> > 
> > You should send a follow on patch which just fixes the one issue.  If the
> > maintainer wants to squash them together that's very easy to do in git.
> 
> Yes I agree, send a new patch, no point in reverting.  But I think
> a fix commit is better than squashing (for what that's worth).
> 
> 
> A very simple fix is assigning *dp to NULL in spacemit_i2s_init_dai().
> 
>         if (dp)
>                 *dp = dai ? : NULL;
> 
> Also:  Why aren't you checking for spacemit_i2s_init_dai() returning
> an error?  (Another--separate--suggested fix.)
The cause of this error was that we did not check the return value.
Indeed, this was an oversight on my part, and I have sent a fix for it.

                                - Troy
> 
> 					-Alex
> 
> > 
> > regards,
> > dan carpenter
> > 
> > 
> 
> 
