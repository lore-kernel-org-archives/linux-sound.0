Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E622F28FF;
	Thu, 16 Jul 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218101; cv=none; b=X4E87ZnI8KtTDyCEo+MupKxGhumfNFyp7NL2dI67LkkXzJZdk4gv0WSTvclxMviCxoq8kyshI2V8IxujZ8oK6IG+DpTUd3I+aMj+/NYqtyGI2Q6K+JYRfCvg62GXmT5xnFd4Mm2YX28VqlLVnT9Rc4ioRfs/iO18sNVm7Yzq4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218101; c=relaxed/simple;
	bh=Gqe7lUdsYGJMiHpnJ8qhfMOzEBoazsss6t6f7wn7Q58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1DjbzoMspifm3r/37sh7KJaTJcgKy9ZLXlJvKv0EBKw+QvvezzSGaKt5mxQCh1zCR8SJeHINmy7VzmvVoWEwm2AAbb2TTxpfCess2Q9Phqch19LxfNq6GDiJ60JMnwyH6HNTLLDfisZ/2rbt0A4ZdfBVhz9dEmpBW8gyt8sDOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfTNv+fD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfTNv+fD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5688E1F000E9;
	Thu, 16 Jul 2026 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784218099;
	bh=HU6NSMw52EuRCnUwSJFEtm/y/U+8jVscyJ7ZIAzK2X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TfTNv+fDcmZ/aCeaH1HS+h0ZTxrchO3i8Tm6xWqmADkZaRFh0+o/ROLUaHzyp/A+Y
	 +V6gkTWXv8mz9SCxBOfTn4ISLumdo7f/o2katbPxhxxJThJ4wHFHYtcEiJAVrZnf2x
	 6eOGNXZAZial06CibzFlNi57nODZ0MSwifo5JhtueA15PzG/LEl0ABePeTYL8JpeiV
	 0fEvFdjB8cCyFwOR3MkIKNOscoDIIy1oiMLPvi905Bih4JO8JjkfjOZWQ4aykUTRrZ
	 nq+czVSdUPPikCWBSed8ZlV/3MSwrMPkexXNPFXOgPLCTv5uK0NslCHC4e/IQCJErd
	 sNNjKY4dFJicg==
Date: Thu, 16 Jul 2026 17:08:14 +0100
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] mfd: cs42l43: Add support for new cs42l44 variant
Message-ID: <20260716160814.GE1424265@google.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
 <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>
 <20260716151437.GA1409595@google.com>
 <alj9FS+pm5gm8Fp3@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alj9FS+pm5gm8Fp3@opensource.cirrus.com>

On Thu, 16 Jul 2026, Charles Keepax wrote:

> On Thu, Jul 16, 2026 at 04:14:37PM +0100, Lee Jones wrote:
> > On Wed, 08 Jul 2026, Charles Keepax wrote:
> > > The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
> > > for this new device.
> > > 
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > >  	switch (devid) {
> > >  	case CS42L43_DEVID_VAL:
> > > +		valid_id = (cs42l43->variant_id == CS42L43_DEVID_VAL);
> > > +		break;
> > >  	case CS42L43B_DEVID_VAL:
> > > -		if (devid != cs42l43->variant_id) {
> > > -			dev_err(cs42l43->dev,
> > > -				"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
> > > -				devid, cs42l43->variant_id);
> > > -			goto err;
> > > -		}
> > 
> > Needs a fall-through statement.
> 
> I thought they weren't typically used if the case had no content,
> the resultant code looks like:
> 
> case CS42L43B_DEVID_VAL:
> case CS42L44_DEVID_VAL:
> 	valid_id = (cs42l43->variant_id == CS42L43B_DEVID_VAL);
> 	break;
> 
> But happy to add one if we really want it?

Not particularly.  I'm happy to take your word for it.

> > > +	case CS42L44_DEVID_VAL:
> > > +		valid_id = (cs42l43->variant_id == CS42L43B_DEVID_VAL);
> > >  		break;
> > >  	default:
> > >  		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
> > >  		goto err;
> > >  	}
> > >  
> > > +	if (!valid_id) {
> > 
> > How is this nor handled in the default branch?
> 
> The default case ends in goto err; so this doesn't run in that
> case.

So are there 'case's that do not populate valid_id?

-- 
Lee Jones
