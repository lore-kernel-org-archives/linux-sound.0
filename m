Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ABE1F0E32
	for <linux-sound@vger.kernel.org>; Fri, 11 Apr 2025 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380299; cv=none; b=jl7gV+f9Lhz4U8+FhwjClo9wNhY+r9bYIRV8X0s97HiLTI4sbFPs83HIdfT5yC7hKFhD/jGEK67hjm0XwZqeFeWHC+h7fdX/0HJiQTPVUu1fyItS/d1BOcyEni4PsmKUoL7tl1LKmmwkVdhD6cyHMDAF3bdLW3HmmqQgoYxPcJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380299; c=relaxed/simple;
	bh=waDzNEIJUkLtJBK1kGhCOrjsCVICauWzDG/idIIAL5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJ04j3sDhwpIcjrHQOYdHccgGN5n9XG5VpxfbeENpIJQV8gfWn4L5bMgKepH/TgjkGKhH+Po6GJaQHNPqolzhApqdvTOxrf5nfSMkRAVF0t/+zsfwx8BDcaRFazOmqf6zJCPTNfbVd2I/HGFWFN6GbIw22j67KSjHoL7M3UsuP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1ziAfE2V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1ziAfE2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B82C4CEE2;
	Fri, 11 Apr 2025 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744380299;
	bh=waDzNEIJUkLtJBK1kGhCOrjsCVICauWzDG/idIIAL5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1ziAfE2VG3xKDfYPO1UfueQ+9v4c88qY97+wzlKb3sZAlYChGlkfvUBKBodtmre84
	 4Zwq79+cQ0dCdKFvxGTwdGlwWxgiSqotgAEiedX13N+0mZKVBM04lXQRTfk3gI562D
	 dSN9NvnuBmefTM1o2NgjlVQ3bbdbHduFj7x/uC00=
Date: Fri, 11 Apr 2025 16:04:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
	quic_wcheng@quicinc.com, mathias.nyman@linux.intel.com
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
Message-ID: <2025041135-vest-tableful-728e@gregkh>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409110731.3752332-1-cezary.rojewski@intel.com>

On Wed, Apr 09, 2025 at 01:07:15PM +0200, Cezary Rojewski wrote:
> Note: this series is based on Mark's broonie/for-next. The xHCI
> dependency is missing so it won't compile.  Goal of this RFC is
> discussing the direction of sound/usb changes.

Any specific reason you aren't cc: linux-usb@vger.kernel.org on USB
stuff like this?

thanks,

greg k-h
