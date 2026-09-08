Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766CA381E97
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850710; cv=none; b=pxBCwirPZcJI9FtQhikvUnYhfbxh9Town+H0hF+1eKI3wS4/phidXMV51vqhfLeq7ER8rl6AbiYfYEDS/94onjMZWDvaL62e8aFrawM09hVCh5SNtx19Vus2e/xJ85knA97wV/FdpcjI4fqHqHmGRE9xda7TtqrhOpW8t2U+tjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850710; c=relaxed/simple;
	bh=MHr7a4BJtVnmpJs8a9u7jPZZ6kgXGgvNsLqeGf+QcVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nts9JodE+yR9YfT+f52mKVhK2LdTpv/VOvclBNBGE/phDYJ8iIMt1ekkKYadmMIqGtF4+pSUGfJEOtWT8rh765E6jMZy+1pLBFtlXS8iUuqjIerlHXYWDq4yB2/QB6+rz2QsgsGVc8gcEhY5Lo1ZAWwxGd/bkomGa87dprLUF14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVNYR+vF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVNYR+vF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3894D1F00A3A;
	Tue,  8 Sep 2026 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788850709;
	bh=AQJI+dRLdYyTh39dj6yTbQgOJpXrk/Td6hnu//dX/os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MVNYR+vFrDg4v8ANLNJ6DdDJpp3CXwe1FPUMYC2lB3ZO0Wie2j4aVIKegSLN9pY4T
	 SDn1sjsBSauaHwVDo/pBAaQFVgWyeI/nK5D/l0tO67hm7dAY6mWSx1X+izZUY1ySXd
	 qP4cQHkuAPG3s7BKp8eVR2s9rnUuMfdGpv70x2YKAguw/KKYEagLIacNtZhtLLxAmU
	 ItFRH5ppuzEdm2dG8SRwt/yt1WLv7Mxr+EY4tqOeyuGCRZJREtWk/x+1+6YzV0Y0vi
	 cj/q8gyoe+5AmWOsTtSjhGSSw4AYOfZaq6IPSZiXg8lslIIjIDkRQHu159dxDr7Tmm
	 USuYfn9MulnAg==
Date: Tue, 8 Sep 2026 12:28:21 +0530
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
Message-ID: <ap-yDQotxJpw_jHr@parshuram>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram>
 <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>

On 08-09-26, 09:37, Péter Ujfalusi wrote:
> 
> 
> On 07/09/2026 22:55, Pierre-Louis Bossart wrote:
> > On 9/7/26 18:53, Vinod Koul wrote:
> >> On 07-09-26, 17:03, Péter Ujfalusi wrote:
> >>>
> >>>
> >>> On 07/09/2026 14:26, Pierre-Louis Bossart wrote:
> >>>>>> ...otherwise it'll end up with -EINVAL instead of getting passed
> >>>>>> through.  Also a switch statement would be a bit more idiomatic.
> >>>>>
> >>>>> OK, I will add the NEXT_TRACK and convert the if to switch.
> >>>>
> >>>> ICYMI for testing, NEXT_TRACK and PARTIAL_DRAIN are only enabled in the
> >>>> 'fcplay' application with the '-p 1' argument for gapless playback, not
> >>>> in the initial cplay application.
> >>>
> >>> With SOF/Intel/IPC4 we can only support DRAIN, NEXT_TRACK and
> >>> PARTIAL_DRAIN are not supported, but there were mismatch between fcplay
> >>
> >> Those should be optional always. Gapless support should not be mandatory
> > well in practice it's a non-negotiable requirement from users... We had
> > to add this as the request of the Android team, and it's a standard
> > feature on most players, not a nice-to-have.
> 
> The only 'documentation' for the gapless (next_track + partial_drain)
> that I could find was the fcplay (and that could not have been worked
> (metadata and next_track was in wrong order).

Please see Documentation/sound/designs/compress-offload.rst, it has a
section on gapless with SM as well.

> But, reading the code it implies that gapless must support anything
> thrown at it in any order as for consecutive files:
> metadata
> next_track
> set_codec_params
> partial_drain

It was supposed to be in a specific sequence. See the sequence in the
documentation.

> With IPC4 the NOP strategy works (just streaming the files without
> stopping, but they mus be of same format and property), but then you
> loose the position, so not so great.
> 
> > Note that the NEXT_TRACK only works if the two consecutive tracks have
> > the same format, if the platform wants 'perceived' gapless playback with
> > a x-fade then two devices are required.

Yes, same format always. Codec can skip the trailing and leading zeros
in that case. two different formats would need code switch/code setting
params, so it wont work and we would need two devices to x-fade as you
rightly pointed out

> If I can ever test this I might add support for it, it is not clear how
> the pointer should behave after partial_drain, we won't stop the DMAs in
> this case.
> With the cadence module (compress support in fw) the metadata is not
> supported, so true gapless is really something which needs more work.
> 
> This has not been planned for the initial IPC4 compress support, it is
> unclear how it can be done to me atm.
> 
> -- 
> Péter

-- 
~Vinod
