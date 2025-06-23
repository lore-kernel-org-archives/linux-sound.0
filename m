Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2377261A
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 05:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750655484; cv=none; b=uzGek9SzSu+NIbHcLE87NyN925jx7z32eGSBllzeqpTZaEKtQygjYO9sxg9qBBR+zs/GbgMEYDpa7RZqBIQYOVWA/15vKrsDP7g3z9Us7i5imB0eL5dGofAZKaLY1ZFujCyysGzziMfm01eK0QbTnMTSXOdUncpHUAEwbUAScyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750655484; c=relaxed/simple;
	bh=osOb2Dv1Vv/DbbryMfpbkPWA+Lby1V0KQ2C0VuWAACg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrDQG8HZwz95xL06ZiNEjmB+zVtE8qf5nUjhyOfZGRMINR1kWc+YTWIG5uGg9YTxu3hwtMNe04JB1K8TnYPjdbMXDxz2bPN3YVHcQe5n9hcLzWPVlIu9dqJOOSzWN7iTWtsnbu/gMLKgvI1Hu9Tle7ckTZsiD+ZC9q9FMpwDQrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X9zCy2Iq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X9zCy2Iq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95310C4CEED;
	Mon, 23 Jun 2025 05:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750655483;
	bh=osOb2Dv1Vv/DbbryMfpbkPWA+Lby1V0KQ2C0VuWAACg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9zCy2IqxV0TYP6qoO2crXX54XS/b+CpuwUlXmDcE7yHlxxv7FsEv7VfsvfJyJhzR
	 K4RmufsUQlkE/84GovX2AYdfB+/79S9Gsi03wOXxw6CV3rKkBtK39kCi3vcxdyS96x
	 w5g36XK9i/DRj72Wu3injqcbV9r414ItJ4ePswio=
Date: Mon, 23 Jun 2025 07:11:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?77+9zL3Cuu+/vQ==?= <seungbin.lee@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, perex@perex.cz, tiwai@suse.de,
	pilsun.jang@samsung.com, s47.kang@samsung.com,
	donghee.moon@samsung.com
Subject: Re: FW: [PATCH] ASoC: soc-compress: Fix race condition in
 soc_compr_open_fe
Message-ID: <2025062349-decimal-line-30f2@gregkh>
References: <CGME20250623013055epcas2p15c17e1f34632e868cd504380d147490d@epcas2p1.samsung.com>
 <000601dbe3de$76d88db0$6489a910$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000601dbe3de$76d88db0$6489a910$@samsung.com>

On Mon, Jun 23, 2025 at 10:30:55AM +0900, �̽º� wrote:
> Add recipient addition and modification patch to the body of the
> transmission.
> 
>  
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
