Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C8B13D265
	for <linux-sound@vger.kernel.org>; Wed, 17 Apr 2024 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713359648; cv=none; b=ahMUl1FTY3PiB/2fsLUVqbAWPejA4VoeUN9rblSjcmzdrDjy7BWaOyobm6Qg8R0rPD3AxacoHPpQjgn3aMzCZd2YpDUlQfUdEz8bCONmKpunyvRAkn6xAJ0StrvMChcCnBP5MZChZSK6sy4nT1MX8siEdmRJijpgdg4YgTEvID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713359648; c=relaxed/simple;
	bh=DuPzm0HaQWC4MWioUuyivtPe0XTN1fFpoD92hYPPy7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MojmWC5JlhuQCCvN1WmqtksmBarIxb7dOwutZ3Igy1Z2U3hNDisZT4pmS4m9dnSy7Z4L8v5hvkkhxndqhv+udG5CR5+wV+QkMaknS+Vo5oUPIDa1bAsy3O+e8a7khC/gMTCQ75LAgVbcOMtj2ReFMI3ftuwls+DTjGlc8yOyxIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ho0xLJML; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ho0xLJML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07383C072AA;
	Wed, 17 Apr 2024 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713359647;
	bh=DuPzm0HaQWC4MWioUuyivtPe0XTN1fFpoD92hYPPy7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ho0xLJMLJjQAGOMlQqdkUCQkSUdb4+/DD7aEaGmszRA8/uHHA/jc1aQR0clUPgNJ1
	 S5TPu5y2bjXpEsnB5M7jXcI1N9Ex5sILwT2ifMYBjDFbHacoyLMOjfkEURsRcdoOAi
	 NFek5P0yjIgLraUjenvIJNxDyiZda7xieCsGulxeNyWFzuTaQ/WGW5W9yq7KH7+SW5
	 VC22VBQ9KEDBhd8qKgz2pTDoxllDuR6yYJp4zgMfnv8T77SkCtm6QkU7OQs1aSVAPq
	 tj7sSkKP0CyhE9DaxZoZxjfBZVqUNRmlUV+zDoyZ+beVOcgM27ok+8IgTta80vP+yk
	 Cxl5FaLYe3MVw==
Date: Wed, 17 Apr 2024 14:14:02 +0100
From: Lee Jones <lee@kernel.org>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Message-ID: <20240417131402.GZ2399047@google.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
 <20240416123541.GW2399047@google.com>
 <F90648F7-BE0B-47DB-89C4-A8C91CD65D59@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F90648F7-BE0B-47DB-89C4-A8C91CD65D59@cirrus.com>

On Tue, 16 Apr 2024, James Ogletree wrote:

> 
> 
> > On Apr 16, 2024, at 7:35 AM, Lee Jones <lee@kernel.org> wrote:
> > 
> > On Fri, 12 Apr 2024, James Ogletree wrote:
> >> All feedback to date has been addressed
> > 
> > There are still MFD review comments left outstanding.
> 
> Hi Lee,
> 
> As best as I can tell, the only review comment in v10 is from you,
> saying that the MFD part looks okay. Then in this resent series, you
> commented that the MFD part had not been updated. Indeed, this is
> because there were no comments to address. Please correct me if I
> interpreted your comment incorrectly.
> 
> I have also gone back over v8 and v9 looking for outstanding
> comments, and all of the review comments appear to be applied.
> Would you kindly link me to the email with the missing review
> comments if I am mistaken?

At the very least, you still have this in here:

    /* If write never occurred, don't bother polling for ACK */

After realising that I'd commented on this before, I stopped the
re-review.

-- 
Lee Jones [李琼斯]
