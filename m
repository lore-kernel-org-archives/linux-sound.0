Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A5825E475
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740077207; cv=none; b=QTgIL1QKn/jtfcIy6n/KoLuWR9bfbk1F22Nd6HilaQa16kwHg40O9XIQZvnzn6R5haT9+oy643P1J/WAicF45jRNxupLJQBcNNpKFEEtLh7RAHWYT4OeZZogR9Vz3AMVIMld07rzvmI4fnpxnD7tXxqDQtjJ6E5vuJ5dtSaXH5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740077207; c=relaxed/simple;
	bh=6hvWLbt500F/ZfTb9gRi919LYwu2xVpuFfyEb1lDALU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyR+hK2mkrBnjmpFyECam6+LzRnSOQlHZPYlESu0+MmxcW625AHcx6hV78xBTWzkYMGEhZlechWWrr21fy/2AQkymdv9SkhYcRIopOH7YJmahpcm5xSAN+kstzx/LPB6N643bqSeljQzJokuXHzpCx+vscc1ifR43z0D96UVHgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1OFcNN/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1OFcNN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B32C4CED1;
	Thu, 20 Feb 2025 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740077206;
	bh=6hvWLbt500F/ZfTb9gRi919LYwu2xVpuFfyEb1lDALU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P1OFcNN/A07/FVLpqTjWQloHBt3kwKiBVgnaD+yh9pStCE+2WGPoGHDJ0+TslYB03
	 SIpdx8V5Rc6Uazcu3YAHZXYieI0xMYX8guug+4QndvIwM9pvSG5h+FAeRVbpZwSavz
	 nfHBX89yiNVqB3/jlmuCUOImCTi3ipLfTE5dtXPCJtmhigcqPjrVGZEnjIGP4C6CTT
	 Quado5owYADuUqRQOWhvwbl9Gjd2/GgcjCM2bP2FVtGVZTv3929d1hrAJR3s7MAs8m
	 Wvp9pjSaCQtUkAGXpoTXiLhN6rAa/9y1rS6pillK7W82VKr/v9VV15D0Cd55vDnUK8
	 y09ruMJBqfW7Q==
Message-ID: <0ce85813-3c23-4363-94df-889e40785aa2@kernel.org>
Date: Thu, 20 Feb 2025 12:46:44 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: amd: Add depends on CPU_SUP_AMD
To: Mark Brown <broonie@kernel.org>
Cc: mario.limonciello@amd.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com, perex@perex.cz,
 tiwai@suse.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
References: <20250220165127.492927-1-superm1@kernel.org>
 <Z7d356eKF2gCNjfO@finisterre.sirena.org.uk>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <Z7d356eKF2gCNjfO@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/2025 12:43, Mark Brown wrote:
> On Thu, Feb 20, 2025 at 10:51:26AM -0600, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> When SMN support was switched to the kernel wide AMD_NODE instead of
>> local implementation this broke compilation on the allyesconfig for
>> some architectures.  AMD_NODE is only supported on AMD platforms, so
>> modify all the AMD drivers that use it to also require CPU_SUP_AMD.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes: https://lore.kernel.org/linux-next/20250220160950.2cd64bdb@canb.auug.org.au/
>> Fixes: f120cf33d232 ("ASoC: SOF: amd: Use AMD_NODE")
>> ---
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.

Whoops, sorry about that, will resend.
