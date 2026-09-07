Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F76B51E43B
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800040; cv=none; b=f5gnWgoD8WENAKYWUAqLHm+3c45F4gA7Q8CTkiCq5diTHWTBxPwwv8wMNT1hKMLwfL7CHiLLEy6vDWxd3TAFjawh8WDvVKdWDljftGZ/R0Hxmg4WiYiKvSK0+XipkPFf4LVKps8Y55K7WRO5F/vC1ElufPYsjbl0hnm8dSrrEhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800040; c=relaxed/simple;
	bh=xdDLf5Eb/0Pt5KNW4drtZkUyJAjxIzs2QB09d3Z9cpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBybZ2OEkveqzjOOTeRWaDEfuW/wu5nzmMjFdUSSkuog6DXyCtqibVbFEgdLqvXIoF9ZJ4U9YEe2TiEmuX+cU3B/0CB6aR21cxNW08FH9QXRFVn7jh9tkFW5t06gatFldHqS/jZPGnq4S4xfXIIbclTcAv0iyXO9OeJlp+dL9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3BfL2Gk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3BfL2Gk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B081F0155F;
	Mon,  7 Sep 2026 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788800038;
	bh=dGusu3fG9lyc91GUz7ZH+10PfrqDsyomeerL2/tL3XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L3BfL2GkA4Kp9WbA9dMDQEt4FpIqSUphkKzcuu/pjrRvnpqhZLCwWzfi42u5IgBSU
	 9c3frWy/gE83fyhJvDB3kXDjNH2+9eDRYTeL0jvh15HnxP3Czx9Xfv2HMu8zmhwQVM
	 k1D801qybHsAZXfBPre9tywst19VqGx80da9zbhY1a5rKvqW2tHscpW0jsywd4zwjZ
	 r67EkcMP3XgGNGpuk/x723b/nYA9VAT4T2TgI6+Iydxk5bfYqOh5hgaLMGL0gy0zdD
	 8NSGNyg1fxhzv6/HmRBAGuwkKQ/on3EnAMyphcDkjAbTuvgHho4tlRXaqzC1nmPrhn
	 +FUxoerZNYYlA==
Date: Mon, 7 Sep 2026 22:23:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, srinivas.kandagatla@oss.qualcomm.com,
	linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
Message-ID: <ap7sF6dOY0Pl0c46@parshuram>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>

On 07-09-26, 17:03, Péter Ujfalusi wrote:
> 
> 
> On 07/09/2026 14:26, Pierre-Louis Bossart wrote:
> >>> ...otherwise it'll end up with -EINVAL instead of getting passed
> >>> through.  Also a switch statement would be a bit more idiomatic.
> >>
> >> OK, I will add the NEXT_TRACK and convert the if to switch.
> > 
> > ICYMI for testing, NEXT_TRACK and PARTIAL_DRAIN are only enabled in the
> > 'fcplay' application with the '-p 1' argument for gapless playback, not
> > in the initial cplay application.
> 
> With SOF/Intel/IPC4 we can only support DRAIN, NEXT_TRACK and
> PARTIAL_DRAIN are not supported, but there were mismatch between fcplay

Those should be optional always. Gapless support should not be mandatory

> and the kernel.
> IPC3 does not support DRAIN afaik.

That one should be mandatory

-- 
~Vinod
