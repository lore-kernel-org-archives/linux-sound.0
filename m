Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C85908D6
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887572; cv=none; b=KL1B1tIXOXnk+N/JAZmRJtnjQY/l11psMOCou+dDC+KWp6oJYuEmcB9f6fKbMCu0vnveGJtWv+lQaChI1LyJEg6KZp0f+J7mzot+ZLcSe3Yaz6FASNdGzkB7C/MA/wpsm9G+8Ud2qcBVSYO/dvd+0EiRIyIZLZ9j8EVswNi2fpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887572; c=relaxed/simple;
	bh=NIj7EwkCansnqfYDixizRFWPpo9g9AaAMlRIIFDhUPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYzuTIRcqh9cFKIZ1rqSVQqWJYb/Gvo2SMNqUHRmUOAOjipbl61vcvJ9TG94Si2469AfeMq99vKND72W5Oo3eWtJcFU6ensSrNmykE3mOzuCoJvctQgIS6KmHKZGD1vJNJWXcomJN9mgvpUGJO3KuALc7bHIOssMsKKVePbR4PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEZHwzdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEZHwzdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC881F00A3A;
	Tue,  8 Sep 2026 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788887571;
	bh=ErLT9+s/DilIDkqnWWTH2BeMjnL2u6gffmKcS8b+/fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mEZHwzdxYQpBhWpIYJ1/1suY90B/tBr8IEy//NuABX4LEmHPdkZDNIqrKZyhiQm8C
	 P+rbj8KowqtwH8/N1BXcf6Fkj8Lj7PW1/JqgfSay2RbM9h8ZyqSaX97QmmbUNx1GP5
	 pxxK3OG0vbYrCBfy72dSqazEs3Zw7whI3o/aRNk9Pb7WY8GJjqhVM6HIJaOGhCqODp
	 otvV+4/tWgsGPSUY4auaBY5Nwuty39wcDHF88K/eBwN3q/0Ou5MY6K5EJ+sKi0VYey
	 xjfNLRq8UKKUR30xtE6Rc2pGP68tE0UmqwYQ6K04Dn6a2QJS2r+WLWmpnODlES2QPJ
	 5yW62mykkYdzw==
Date: Tue, 8 Sep 2026 22:42:46 +0530
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
Message-ID: <aqBCDphiKQVzt-Hl@parshuram>
References: <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
 <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
 <ap7sF6dOY0Pl0c46@parshuram>
 <69650a4d-3021-49b0-b853-f7b9ba81aae1@linux.dev>
 <7af0b170-dd4a-4aef-b4d8-7e87d72d11f0@linux.intel.com>
 <ap-yDQotxJpw_jHr@parshuram>
 <003c3998-5b46-4532-9d48-dd47b98d544e@linux.intel.com>
 <aqABhbYne6RIree6@parshuram>
 <7f5625fa-d391-406c-ba75-4df526af903c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f5625fa-d391-406c-ba75-4df526af903c@linux.intel.com>

On 08-09-26, 17:13, Péter Ujfalusi wrote:
> 
> >>>> With IPC4 the NOP strategy works (just streaming the files without
> >>>> stopping, but they mus be of same format and property), but then you
> >>>> loose the position, so not so great.
> > 
> > I wanted to ask earlier, whats IPC4?
> 
> SOF supports 2 major IPC mode, IPC3 which was used up to TGL family (and
> by NXP, AMD and MediaTek) and IPC4 which is from MTL onward (with
> unofficial support for TGL).
> 
> They have different operating principles and we just got the compress
> support for IPC4 (so TGL and up) only on Intel platforms.
> 
> NXP is using the compressed with IPC3.

aha, joy of changing IPC with SoC! I dont envy you Peter :-)

> 
> > The kernel should view this as a continuous bit stream and wont know
> > EOF. Only firmware will know about it and with metadata, able to skip
> > those.
> 
> I see, the issue is that I cannot find any way to give the metadata to
> the decoder module, it is a black box to us.
> 
> Also I'm not sure how the fw could get any idea where one
> flac/vorbis/aac/mp3 ends and where it starts, the black box does not
> seam to be able to detect this or if it does, it will not emit this
> information to outside.

It is supposed to be filled by media frameworks that parse the file and
send it down to kernel. That is why in fcplay chose to use libav for
getting information for few formats I had... I might have some fork in
my old pc, I will check if I had something more that could help you.

Feel free to extend it, if this is not working and use something else to
get the metadata.

> >> Also: I have assorted ogg/mp3/flac in my music library and I tend
> >> to play them in random, which defeats the gapless.
> > 
> > You are a non typical users :-) To test this, we would same track in
> > album. A typical user would be running spotify with same format :-)
> 
> Yes, Spotify will shuffle, but use the same format mostly for the
> random 'files', true.
> 
> >> The gapless support is not covered in this initial version, but can
> >> be added later.
> I will likely need to do this at some point, but again, w/o the
> ability to test it, it is hard to declare victory ;)

I was testing on few formats on Qualcomm platforms and this seemed
to work for them... It is not elegant but got the work done for me back
then.

-- 
~Vinod
