Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDA09475;
	Mon, 23 Mar 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269010; cv=none; b=HbsGD69Mg+OHVWNwXH2bgQitIkzxehmUdP1MGSEvJmxKV+TizGRHKVyKZo8zp2jvaiQKHfKhHr+00LXf9ZneXk6Yy6kiNWwvdS/AkWL3m7lQ68ynpxZHQhoUAdS+e6YNFD4e25SH1wYMwAj1363Uf9t+6nlsmWpz7qu9uRM4o7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269010; c=relaxed/simple;
	bh=NH4F0wrqOj2FDknO+jTiFltIHjSYhxsiJieDz2tS7Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYy34XIjEnToU8r35nXIrqSCE8d8KVqjvGApjthU+7BfK2PD3Bqa6G6NdnSsWBjEjyRVJVRYsgoKgMkbFwA5HYQ4026X681KHXj0FZiXjgFYtCPoZ9QUkxaOOGkedXfcwpFpuN5fmuTe0PY4pHGBV9FG2o4NzaZBYKZ+hGxGJ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=xtrQRPCB; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="xtrQRPCB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=Mv7s1UJC4Xg33VnYpgLJSH279r9s+O98lOjLJbzcP+w=; b=xtrQRPCBTYq1Ij60
	Yq8isU/Ea+8SsCXer2Ssm+lYT0zVOtZK2yKHMbfc5qG6T+VkPUpMqz1nJusbAVBV9fubTZFd6n+xr
	FgYcqgmSAdkHOI1mYJLgSw4soCp9cvgLdVePEG1JoRmZhXQ1vcqlY4xxEJwRSTvOznT9ZQDXPz3Qv
	R9betJVjbS46Vphg9LrXS1kCGNcO8Y725zzNjNocGOSJYpPIJZW6qLYbtXsLDkVnmU6n1ybNRLkYX
	xUiJXOQowpRYMltGFEYfL9o0dP+f5LAPqPhf11zDV6vHqnYHcnZAx4iiIT4kKrQUOcn2YnvREjPov
	6dideUsWQadWG1Xp2A==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w4ePl-003qK7-8Z; Mon, 23 Mar 2026 12:29:49 +0000
Message-ID: <16290af2-4431-4cc6-9325-94492638d334@codethink.co.uk>
Date: Mon, 23 Mar 2026 12:29:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoC: SOF: sof-audio: pcm_id is __le32
To: Mark Brown <broonie@kernel.org>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
References: <20260318164800.1086567-1-ben.dooks@codethink.co.uk>
 <3a2272ae-97d2-4f62-bb06-900a8831e544@sirena.org.uk>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <3a2272ae-97d2-4f62-bb06-900a8831e544@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 18/03/2026 17:38, Mark Brown wrote:
> On Wed, Mar 18, 2026 at 04:48:00PM +0000, Ben Dooks wrote:
>> The pcm_id value is __le32 so convert it before passing to the dev_dbg
>> function to be printed. Also fixup some other uses of __le32 data and
>> a couple of places where %u should have been used instead of %d
>>
>> Picked up by sparse prototype for variadic and printf
>> function checking. Fixes a large number of sparse warnings, such as:
> 
> It looks like this needs a rebase against -next.

At this point is it worth waiting until after the next major release?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
