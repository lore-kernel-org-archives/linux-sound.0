Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D438B158
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850363; cv=none; b=V6g6QPcDgV/R3dfy6TKIugSwL6dcTAGMV1lAhcKtodAQdarUioh/WVnTK10HuTbfH3G/SMfKJcz3vYk5+GCAikS3fJIQkFTy9AiYDi2sQ1Rgwgb44c5JcC9pM8WCIdTH3ifyiHITW05pdI0UYa5qGoi/LmXGU8a1vbrLVAcu/Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850363; c=relaxed/simple;
	bh=60NrI8iXgeXo1fXwc3z9y1JjY8uBrTjgmcuiJo1Fjvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wwl6TqJRH4Q0H5DmPG3r3pdjfjEDMkPordeflb0Qo1PgJ49M9HyaeXijcTky4B4LHwXi9Z+5eZR/tLJeW6SHxrt86sb5z7E+aLu+KpFsEy8ktda+GxML5pCiqC5LrYsVzcQ/ieyNZtYsnNOuDVBurKqpaJ341RqkUiQ1vFrj250=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7w7vvOj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7w7vvOj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6682D1F00A3E;
	Tue,  8 Sep 2026 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788850362;
	bh=D1Wgs4uMtkWAqHkCLsfl1nHsHoqVdEMaEEVZQcjSbjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d7w7vvOjK7s+1/eoEZZkGejheMDrHdrWwlRD5MH/NGLCzEyc+OYD1t1FtRxHNfMLx
	 uJab5kfrcoyTuJw0el6lgoUk0l7BXKiaok6GgJ+GV7U3jRvofM4L9VW27OXd5GSxSB
	 DD0iNA6i6YVOOxz/pD01QF0iYHpPE5bqrRnDA2fvpizM0eYDZVf7iLQXkwv8YL5nGi
	 6D7OY4EKoY38bw9zm5KWW7n+OfD+0KIHtokEIOw1FK+gC0N/b9ppGHR6T25C4sKgHy
	 tPYvoFKtPsM2xhckLMiycWIQqQ3ybplaIXyQmps4auRd/iw9UkTfRO/V8KmSylmJCj
	 tr/S2uCcGj6hQ==
Date: Tue, 8 Sep 2026 12:22:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, srinivas.kandagatla@oss.qualcomm.com,
	linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
Message-ID: <ap-wrMsh2HYEf_PT@parshuram>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram>
 <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>

On 07-09-26, 21:55, Pierre-Louis Bossart wrote:
> On 9/7/26 18:53, Vinod Koul wrote:
> > On 07-09-26, 17:03, Péter Ujfalusi wrote:
> >>
> >>
> >> On 07/09/2026 14:26, Pierre-Louis Bossart wrote:
> >>>>> ...otherwise it'll end up with -EINVAL instead of getting passed
> >>>>> through.  Also a switch statement would be a bit more idiomatic.
> >>>>
> >>>> OK, I will add the NEXT_TRACK and convert the if to switch.
> >>>
> >>> ICYMI for testing, NEXT_TRACK and PARTIAL_DRAIN are only enabled in the
> >>> 'fcplay' application with the '-p 1' argument for gapless playback, not
> >>> in the initial cplay application.
> >>
> >> With SOF/Intel/IPC4 we can only support DRAIN, NEXT_TRACK and
> >> PARTIAL_DRAIN are not supported, but there were mismatch between fcplay
> > 
> > Those should be optional always. Gapless support should not be mandatory
> well in practice it's a non-negotiable requirement from users... We had
> to add this as the request of the Android team, and it's a standard
> feature on most players, not a nice-to-have.

It may be non-negotiable requirement from user/OS but should not be
mandatory from API :-)

> Note that the NEXT_TRACK only works if the two consecutive tracks have
> the same format, if the platform wants 'perceived' gapless playback with
> a x-fade then two devices are required.

Correct and given the fact the people use apps on this ecosystem, I
would expect the formats will be same for an app

-- 
~Vinod
