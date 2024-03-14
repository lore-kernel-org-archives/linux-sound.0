Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E973510
	for <linux-sound@vger.kernel.org>; Thu, 14 Mar 2024 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710438118; cv=none; b=j3KMoRibh2A+besWp9klkLRox/1PY9Ev2l64Laz5FZcqtuJQidlnG9gWn5ZTttiHAv4yrkkRbrKPnJvQ64v1MHsXl2QE8V/+m/iSaDPloUr4yHBND2Pe1oQ3XONezi+MmX01LfyboHhVvZv7yDiWlQZ480YbyvJfgyVLuW2f/SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710438118; c=relaxed/simple;
	bh=ofTAhNGanx2lb58qhO/7H5QyTHESYPQ+pOu2ktQfgsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsvPDJ4Y+jug169ajFCGJS1DcjeZRWk5WiBpx1Lg6YI0lJ4jlk7XdHxKkYC4Voy+0tEaWXCRUBlVQBM7w/L4DCCNLXjMSAdb0eQFsxnZwKVAKjNsN+ZSImyhbFzz48aBQ1nJENDR8YJHmRlaHfMtOaIccQEu80cZjBVxki/xL5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=pSb82/D9; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="pSb82/D9"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 266F1604B910; Fri, 15 Mar 2024 04:11:46 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 266F1604B910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710438106; bh=d1PIks3LJnYAvURtdAFSbmuuRNGHOEdk3/bYB7nF3Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSb82/D9I3gLCKwnTx0OkEAnk+o1P0KPH7R1FAqtExWnV12hbP1oOQkHBEwTcKhcB
	 +W2UOnWwfImSCxYL1DJimWJYcIACzR6kUSVftX30MkBKZbss/+DxxH6ThVLhp9U28H
	 sJCtQ6RIKVNhY4kSWXXzDdIzEj8HWqtNvuoCVObsNeFfVAXo+reecB2v+nYauTBbOY
	 ovRqWE8IhFSskFWX7ThR2VUgA+kzEgqgnqWX7SNNexRj4pjz/CSUN6ePbValKYRBup
	 x+ZX3MTT6Ce3yxS7co+AsQEcgtcnNh7CYDzGovu6o87y/AyHzIcMXRYR5EJO8bzMKY
	 px1whH0TD6v9g==
Date: Fri, 15 Mar 2024 04:11:46 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/14] ALSA: scarlett2: Add support for Vocaster
Message-ID: <ZfM22n3G/7y7zkUL@m.b4.vu>
References: <cover.1710264833.git.g@b4.vu>
 <87jzm7p95x.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzm7p95x.wl-tiwai@suse.de>

Hi Takashi,

On Tue, Mar 12, 2024 at 08:00:42PM +0100, Takashi Iwai wrote:
> On Tue, 12 Mar 2024 19:28:52 +0100,
> Geoffrey D. Bennett wrote:
> > 
> > Hi Takashi,
> > 
> > This patch series contains:
> > 
> > 1-2: Fix to wait for an ACK from the device after sending a command,
> > before attempting to read the response. This didn't seem to be
> > necessary previously, but with 4th Gen devices it seems to help with a
> > rare issue where the device stops responding.
> > 
> > 3: Support for reading flash segments from the device.
> > 
> > 4-11: Preparation for Vocaster support.
> > 
> > 12: Vocaster One and Two support.
> > 
> > 13: Add autogain target controls for 4th Gen and Vocaster.
> > 
> > 14: Add Bluetooth volume control for Vocaster Two.
> 
> As the merge window was already opened, I postpone this series to
> 6.10.  If there is any fix that should be taken to 6.9, please submit
> separately.

Okay, thanks, I'll resubmit separately fixes for 6.9, and please don't
apply any of these for 6.10 yet; I'll submit a v2 later.

Thanks,
Geoffrey.
