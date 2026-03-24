Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8F02E040D;
	Tue, 24 Mar 2026 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360221; cv=none; b=e6++Iyuu4UNKJsEjahXluUitIlbBBAHFlLGUMoQDb0qFXBeeIkYdBq+I1SCInnCYWkdvzn6CrYr7m92/sAYm29Oj5S5iho9946xGm45VRVPAINsvnUAtrv28L6XDZSMpbNEPpuqCbTdIoZGdXCLyYCFCiTQgDiiiAMLs9C3aTkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360221; c=relaxed/simple;
	bh=Dr7YiLyvtwebuZWmjVgVBMpJHWuYlJv22V2u52FjtBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhL8lDVNsNAzUHDa4G28XWPbLbKV4kvdfUMVQY4P8JRziRAJG/q4Yx/BdxRrYt9/3dBT/YVGKpMU4F6hgUA9jkS/m29FHAD0lLoborptWdtZdVcF7wkCsoCBclBGyLw05Ew8PQDaxuA1PKl9GeytHhX7MhLjYDVA5M6LTD9xV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=vHvSP2Zk; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="vHvSP2Zk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=XUgNollCyJaG17YByTrY3F6ssXWir+vY5rxkil2fV1U=; b=vHvSP2Zk8i2iprZ5
	TdZp+Nu391BRqTV7Ts1BG+ZduAwfHTg9yk4nq+nN6/LFn/PgQfdIptTpsSnzrlr+3V2tggiQlVAem
	0tMii4TeZ3rzkSgkoNqaJ7OLDjfxLj2gLr17qp3Wu1u+qqt/lCl8rLtb4JVrNYk5e4s+dqmffAigU
	iWGe/RPvxlkei2exQt3KULKX3Nq8c5ygEAXdUGAVJbUY2rB6ukELQONmdd9vvXxmgJL93Vnil3Ugx
	8o6K4VWN11vz7iR9B8hPGoXOfzIfIrohzoo0p1GWZ2iZ1VEp9ZVISfPgJdki0BHzZjnOX1fIgQHBQ
	cKd27N8gygpmOMI9ew==;
Received: from [63.135.74.212] (helo=[192.168.1.241])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w528w-007Juj-Lc; Tue, 24 Mar 2026 13:50:02 +0000
Message-ID: <ba5274d3-896a-4467-bef8-a1987983a5c4@codethink.co.uk>
Date: Tue, 24 Mar 2026 13:49:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v4] ASoC: SOF: sof-audio: pcm_id is __le32
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260324105027.99586-1-ben.dooks@codethink.co.uk>
 <9ac16808-4036-487e-9152-8dd40ab6e5a1@sirena.org.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <9ac16808-4036-487e-9152-8dd40ab6e5a1@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 24/03/2026 13:33, Mark Brown wrote:
> On Tue, Mar 24, 2026 at 10:50:27AM +0000, Ben Dooks wrote:
>> The pcm_id value is __le32 so convert it before passing to the dev_dbg
>> function to be printed. Also fixup some other uses of __le32 data and
>> a couple of places where %u should have been used instead of %d
> 
> Please rebase rather than resending this (if this is actually a rebase
> please send it as a v5 so the tooling doesn't get confused).

Sorry, fixed that with v5.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
