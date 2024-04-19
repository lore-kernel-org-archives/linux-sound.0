Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBA389
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713531607; cv=none; b=tK3t6vuKBI3oXl6waWFNuWBmIKqHjY+v2eo1gMNavJ+FYXdKTs2RvfNs+w7ujR4I/F/dA1PyYcTOoQOAxKQkzRO1WPFFP0nVIkU1ZdilPioKNyEBB8qG8Z0WBLZLAVVoeFuRUbCyvegmEo1psmRRCFvm4ehDrwvK2BwxrIs0DwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713531607; c=relaxed/simple;
	bh=Z69vjfsInQuMcoByr13ikyx2iTvAg2kC8I5T3Obx25M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8xu5t1qQSU1DqplQVLa9IkxYSD06Qn+ReHF6FrlQB2g8UyVxzmuSEE6fTclkkD/adSIZl4oxxlH0f9/1IMUMScXXTDPM5E1EDbahSz41sH9w4+zJ+qPniEvfLGwfCnPGunk6mJwbCw24HBnIb6zWV0rO0MkiMbdTj1zzvhGqs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QS2fbgFf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QS2fbgFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CCFC072AA;
	Fri, 19 Apr 2024 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713531606;
	bh=Z69vjfsInQuMcoByr13ikyx2iTvAg2kC8I5T3Obx25M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QS2fbgFfdCVOfSPnaNx+gaePwtAe7jF4lsL5jvV+VdQJBg5E6OMN8t9qy+MSRJOsB
	 WpTBg/TMs/w588FGU3t4ffPpNjXjgahGrhCKoomcUcgP9IiPIicwVPSYNAxcng98L+
	 O11GncyknOOAUzAw04+kNDAcvJsiQ1Esq4NcBJn8MBlwnZoY21gY32h9cOcWkLbnqp
	 vbcEubukfXFYSyGfa9CeekDTQqI/NdITAMLvTiA/el68w+VJYJ6JgfrbaWJwbXgxJl
	 gmtMA+giOrkqhKg0sa+S9f3puWYXfLfjRCktcE3vMc/5CkaqIdMDSl/U64JHqN2ExD
	 gAsQQV0CnZkmw==
Date: Fri, 19 Apr 2024 14:00:01 +0100
From: Lee Jones <lee@kernel.org>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Message-ID: <20240419130001.GA109991@google.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
 <20240416123541.GW2399047@google.com>
 <F90648F7-BE0B-47DB-89C4-A8C91CD65D59@cirrus.com>
 <20240417131402.GZ2399047@google.com>
 <9F7C82D1-1622-4FD8-9987-30236122E852@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9F7C82D1-1622-4FD8-9987-30236122E852@cirrus.com>

On Thu, 18 Apr 2024, James Ogletree wrote:

> Hi Lee,
> 
> > On Apr 17, 2024, at 8:14 AM, Lee Jones <lee@kernel.org> wrote:
> > 
> > On Tue, 16 Apr 2024, James Ogletree wrote:
> > 
> >>> On Apr 16, 2024, at 7:35 AM, Lee Jones <lee@kernel.org> wrote:
> >>> 
> >>> On Fri, 12 Apr 2024, James Ogletree wrote:
> >>>> All feedback to date has been addressed
> >>> 
> >>> There are still MFD review comments left outstanding.
> >> 
> >> Hi Lee,
> >> 
> >> As best as I can tell, the only review comment in v10 is from you,
> >> saying that the MFD part looks okay. Then in this resent series, you
> >> commented that the MFD part had not been updated. Indeed, this is
> >> because there were no comments to address. Please correct me if I
> >> interpreted your comment incorrectly.
> >> 
> >> I have also gone back over v8 and v9 looking for outstanding
> >> comments, and all of the review comments appear to be applied.
> >> Would you kindly link me to the email with the missing review
> >> comments if I am mistaken?
> > 
> > At the very least, you still have this in here:
> > 
> >    /* If write never occurred, don't bother polling for ACK */
> > 
> > After realising that I'd commented on this before, I stopped the
> > re-review.
> 
> It looks like I took some liberties here without communicating them,
> so my sincere apologies.
> 
> In V8 the line was:
> 
> "If we never wrote, don't bother checking for ACK”
> 
> In that review, you provided an improved phrasing:
> 
> "If the write never took place, no need to check for the ACK”
> 
> My takeaway from your phrasing was that the use of the first-person
> pronoun “we" was improper. So I rewrote it in the third-person, but
> still in my own words, resulting in its current form:
> 
> "If write never occurred, don't bother polling for ACK”
> 
> Is it that the phrase “don’t bother” is too idiomatic? If so I will apply
> your phrasing verbatim in V11.

Yes, it's a pretty bothersome phrase. :)

-- 
Lee Jones [李琼斯]
